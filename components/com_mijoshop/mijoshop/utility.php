<?php
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

// No Permission
defined('_JEXEC') or die ('Restricted access');

// Imports
jimport('joomla.filesystem.file');
jimport('joomla.filesystem.folder');
jimport('joomla.filesystem.archive');
jimport('joomla.filesystem.path');

require_once(JPATH_ROOT.'/components/com_mijoshop/mijoshop/mijoshop.php');

class MijoShopUtility {

	private static $data = array();
	
	public function get($name, $default = null) {
        if (!is_array(self::$data) || !isset(self::$data[$name])) {
            return $default;
        }
        
        return self::$data[$name];
    }
    
    public function set($name, $value) {
        if (!is_array(self::$data)) {
            self::$data = array();
        }
        
        $previous = self::get($name);
		
        self::$data[$name] = $value;
        
        return $previous;
    }

    public function getRemoteVersion() {
        $version = '?.?.?';

        $components = $this->getRemoteData('http://mijosoft.com/index.php?option=com_mijoextensions&view=xml&format=xml&catid=1');

        if (!strstr($components, '<?xml version="1.0" encoding="UTF-8" ?>')) {
            return $version;
        }

        $manifest = simplexml_load_string($components, 'SimpleXMLElement');

        if (is_null($manifest)) {
            return $version;
        }

        $category = $manifest->category;
        if (!($category instanceof SimpleXMLElement) || (count($category->children()) == 0)) {
            return $version;
        }

        foreach ($category->children() as $component) {
            $option = (string)$component->attributes()->option;
            $compability = (string)$component->attributes()->compability;

            if (($option == 'com_mijoshop') and ($compability == 'all' or $compability == '3.0' or $compability == '1.6_3.0')) {
                $version = trim((string)$component->attributes()->version);
                break;
            }
        }

        return $version;
    }

    function getMijoshopIcon($link, $image, $text) {
    	$lang = JFactory::getLanguage();

    	$div_class = 'class="icon-wrapper"';
    	?>
    	<div <?php echo $div_class; ?> style="float:<?php echo ($lang->isRTL()) ? 'right' : 'left'; ?>;">
    		<div class="icon">
    			<a href="<?php echo $link; ?>">
    				<img src="<?php echo JURI::root(true); ?>/administrator/components/com_mijoshop/assets/images/<?php echo $image; ?>" alt="<?php echo $text; ?>" />
    				<span><?php echo $text; ?></span>
    			</a>
    		</div>
    	</div>
    	<?php
    }

    public function getPackageFromUpload($userfile) {
        // Make sure that file uploads are enabled in php
        if (!(bool) ini_get('file_uploads')) {
            JError::raiseWarning(100, JText::_('WARNINSTALLFILE'));
            return false;
        }

        // Make sure that zlib is loaded so that the package can be unpacked
        if (!extension_loaded('zlib')) {
            JError::raiseWarning(100, JText::_('WARNINSTALLZLIB'));
            return false;
        }

        // If there is no uploaded file, we have a problem...
        if (!is_array($userfile) ) {
            JError::raiseWarning(100, JText::_('No file selected'));
            return false;
        }

        // Check if there was a problem uploading the file.
        if ( $userfile['error'] || $userfile['size'] < 1 ) {
            JError::raiseWarning(100, JText::_('WARNINSTALLUPLOADERROR'));
            return false;
        }

        // Build the appropriate paths
        $JoomlaConfig   =& JFactory::getConfig();
        $tmp_dest       = $JoomlaConfig->get('tmp_path').'/'.$userfile['name'];
        $tmp_src        = $userfile['tmp_name'];

        // Move uploaded file
        jimport('joomla.filesystem.file');
        $uploaded = JFile::upload($tmp_src, $tmp_dest);

        if (!$uploaded) {
            JError::raiseWarning('SOME_ERROR_CODE', '<br /><br />' . JText::_('File not uploaded, please, make sure that your "MijoShop => Options => Personal ID" and/or the "Global Configuration => Server => Path to Temp-folder" field has a valid value.') . '<br /><br /><br />');
            return false;
        }

        // Unpack the downloaded package file
        $package = self::unpack($tmp_dest);

        // Delete the package file
        JFile::delete($tmp_dest);

        return $package;
    }

    public function getPackageFromServer($url) {
        // Make sure that file uploads are enabled in php
        if (!(bool) ini_get('file_uploads')) {
            JError::raiseWarning('1001', JText::_('Your PHP settings does not allow uploads'));
            return false;
        }

        // Make sure that zlib is loaded so that the package can be unpacked
        if (!extension_loaded('zlib')) {
            JError::raiseWarning('1001', JText::_('The PHP extension ZLIB is not loaded, file cannot be unziped'));
            return false;
        }

        // Get temp path
        $JoomlaConfig = JFactory::getConfig();
        $tmp_dest = $JoomlaConfig->get('tmp_path');

        $url = str_replace('http://mijosoft.com/', '', $url);
        $url = str_replace('https://mijosoft.com/', '', $url);
        $url = 'http://mijosoft.com/'.$url;

        // Grab the package
        $data = $this->getRemoteData($url);

        $target = $tmp_dest.'/mijoshop_upgrade.zip';

        // Write buffer to file
        $written = JFile::write($target, $data);

        if (!$written) {
            JError::raiseWarning('SOME_ERROR_CODE', '<br /><br />' . JText::_('File not uploaded, please, make sure that your "MijoShop => Options => Personal ID" and/or the "Global Configuration=>Server=>Path to Temp-folder" field has a valid value.') . '<br /><br /><br />');
            return false;
        }

        $p_file = basename($target);

        // Was the package downloaded?
        if (!$p_file) {
            JError::raiseWarning('SOME_ERROR_CODE', JText::_('Invalid Personal ID'));
            return false;
        }

        // Unpack the downloaded package file
        $package = self::unpack($tmp_dest.'/'.$p_file);

        if (!$package) {
            JError::raiseWarning('SOME_ERROR_CODE', JText::_('An error occured, please, make sure that your "MijoShop => Options => Personal ID" and/or the "Global Configuration=>Server=>Path to Temp-folder" field has a valid value.'));
            return false;
        }

        // Delete the package file
        JFile::delete($tmp_dest.'/'.$p_file);

        return $package;
    }

    public function getRemoteData($url) {
        $user_agent = "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0)";
        $data = false;

        // cURL
        if (extension_loaded('curl')) {
            $process = @curl_init($url);

            @curl_setopt($process, CURLOPT_HEADER, false);
            @curl_setopt($process, CURLOPT_USERAGENT, $user_agent);
            @curl_setopt($process, CURLOPT_RETURNTRANSFER, true);
            @curl_setopt($process, CURLOPT_SSL_VERIFYPEER, false);
            @curl_setopt($process, CURLOPT_AUTOREFERER, true);
            @curl_setopt($process, CURLOPT_FAILONERROR, true);
            @curl_setopt($process, CURLOPT_FOLLOWLOCATION, 1);
            @curl_setopt($process, CURLOPT_TIMEOUT, 10);
            @curl_setopt($process, CURLOPT_CONNECTTIMEOUT, 10);
            @curl_setopt($process, CURLOPT_MAXREDIRS, 20);

            $data = @curl_exec($process);

            @curl_close($process);

            return $data;
        }

        // fsockopen
        if (function_exists('fsockopen')) {
            $errno = 0;
            $errstr = '';

            $url_info = parse_url($url);
            if($url_info['host'] == 'localhost')  {
                $url_info['host'] = '127.0.0.1';
            }

            // Open socket connection
            if ($url_info['scheme'] == 'http') {
                $fsock = @fsockopen($url_info['scheme'].'://'.$url_info['host'], 80, $errno, $errstr, 5);
            } else {
                $fsock = @fsockopen('ssl://'.$url_info['host'], 443, $errno, $errstr, 5);
            }

            if ($fsock) {
                @fputs($fsock, 'GET '.$url_info['path'].(!empty($url_info['query']) ? '?'.$url_info['query'] : '').' HTTP/1.1'."\r\n");
                @fputs($fsock, 'HOST: '.$url_info['host']."\r\n");
                @fputs($fsock, "User-Agent: ".$user_agent."\n");
                @fputs($fsock, 'Connection: close'."\r\n\r\n");

                // Set timeout
                @stream_set_blocking($fsock, 1);
                @stream_set_timeout($fsock, 5);

                $data = '';
                $passed_header = false;
                while (!@feof($fsock)) {
                    if ($passed_header) {
                        $data .= @fread($fsock, 1024);
                    } else {
                        if (@fgets($fsock, 1024) == "\r\n") {
                            $passed_header = true;
                        }
                    }
                }

                // Clean up
                @fclose($fsock);

                // Return data
                return $data;
            }
        }

        // fopen
        if (function_exists('fopen') && ini_get('allow_url_fopen')) {
            // Set timeout
            if (ini_get('default_socket_timeout') < 5) {
                ini_set('default_socket_timeout', 5);
            }

            @stream_set_blocking($handle, 1);
            @stream_set_timeout($handle, 5);
            @ini_set('user_agent',$user_agent);

            $url = str_replace('://localhost', '://127.0.0.1', $url);

            $handle = @fopen($url, 'r');

            if ($handle) {
                $data = '';
                while (!feof($handle)) {
                    $data .= @fread($handle, 8192);
                }

                // Clean up
                @fclose($handle);

                // Return data
                return $data;
            }
        }

        // file_get_contents
        if (function_exists('file_get_contents') && ini_get('allow_url_fopen')) {
            $url = str_replace('://localhost', '://127.0.0.1', $url);
            @ini_set('user_agent',$user_agent);
            $data = @file_get_contents($url);

            // Return data
            return $data;
        }

        return $data;
    }

    public function unpack($p_filename) {
        // Path to the archive
        $archivename = $p_filename;

        // Temporary folder to extract the archive into
        $tmpdir = uniqid('install_');

        // Clean the paths to use for archive extraction
        $extractdir = JPath::clean(dirname($p_filename).'/'.$tmpdir);
        $archivename = JPath::clean($archivename);

        $package = array();
        $package['dir'] = $extractdir;

        // do the unpacking of the archive
        $package['res'] = JArchive::extract($archivename, $extractdir);

        return $package;
    }

    public function checkLanguage(){
        $db = MijoShop::get('db');

        $oc_langs   = $db->getOcLanguages();
        $j_langs    = $db->getInstalledJoomlaLanguages();
        $j_contents = $db->getLanguageList('all');

        foreach ($oc_langs as $key => $oc_lang) {
            if(isset($j_langs[$key]) and !isset($j_contents[$key])) {
                $db->run("INSERT INTO #__languages SET lang_code = '".$j_langs[$key]['tag']."', title = '".$j_langs[$key]['name']."', title_native = '".$j_langs[$key]['name']."', sef ='".$j_langs[$key]['code']."', image ='".$j_langs[$key]['code']."', published = 1, access = 1, ordering = 0", 'query');
            }
        }
    }
	
    public function copyLang($language_id){
        $db = MijoShop::get('db');

        $def_lang_id = MijoShop::get('opencart')->get('config')->get('config_language_id');

        // Attribute
        $query = $db->run("SELECT * FROM #__mijoshop_attribute_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $attribute) {
            $db->run("INSERT IGNORE INTO #__mijoshop_attribute_description SET attribute_id = '" . (int)$attribute['attribute_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $db->run($attribute['name'], 'escape') . "'", 'query');
        }

        // Attribute Group
        $query = $db->run("SELECT * FROM #__mijoshop_attribute_group_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $attribute_group) {
            $db->run("INSERT IGNORE INTO #__mijoshop_attribute_group_description SET attribute_group_id = '" . (int)$attribute_group['attribute_group_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $db->run($attribute_group['name'], 'escape') . "'", 'query');
        }

        // Banner
        $query = $db->run("SELECT * FROM #__mijoshop_banner_image_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $banner_image) {
            $db->run("INSERT IGNORE INTO #__mijoshop_banner_image_description SET banner_image_id = '" . (int)$banner_image['banner_image_id'] . "', banner_id = '" . (int)$banner_image['banner_id'] . "', language_id = '" . (int)$language_id . "', title = '" . $db->run($banner_image['title'], 'escape') . "'", 'query');
        }

        // Category
        $query = $db->run("SELECT * FROM #__mijoshop_category_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $category) {
            $db->run("INSERT IGNORE INTO #__mijoshop_category_description SET category_id = '" . (int)$category['category_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $db->run($category['name'], 'escape') . "', meta_description = '" . $db->run($category['meta_description'], 'escape') . "', meta_keyword = '" . $db->run($category['meta_keyword'], 'escape') . "', description = '" . $db->run($category['description'], 'escape') . "'", 'query');
        }

        // Customer Group
        $query = $db->run("SELECT * FROM #__mijoshop_customer_group_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $customer_group) {
            $db->run("INSERT IGNORE INTO #__mijoshop_customer_group_description SET customer_group_id = '" . (int)$customer_group['customer_group_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $db->run($customer_group['name'], 'escape') . "', description = '" . $db->run($customer_group['description'], 'escape') . "'", 'query');
        }

        // Download
        $query = $db->run("SELECT * FROM #__mijoshop_download_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $download) {
            $db->run("INSERT IGNORE INTO #__mijoshop_download_description SET download_id = '" . (int)$download['download_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $db->run($download['name'], 'escape') . "'", 'query');
        }

        // Filter
        $query = $db->run("SELECT * FROM #__mijoshop_filter_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $filter) {
            $db->run("INSERT IGNORE INTO #__mijoshop_filter_description SET filter_id = '" . (int)$filter['filter_id'] . "', language_id = '" . (int)$language_id . "', filter_group_id = '" . (int)$filter['filter_group_id'] . "', name = '" . $db->run($filter['name'], 'escape') . "'", 'query');
        }

        // Filter Group
        $query = $db->run("SELECT * FROM #__mijoshop_filter_group_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $filter_group) {
            $db->run("INSERT IGNORE INTO #__mijoshop_filter_group_description SET filter_group_id = '" . (int)$filter_group['filter_group_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $db->run($filter_group['name'], 'escape') . "'", 'query');
        }

        // Information
        $query = $db->run("SELECT * FROM #__mijoshop_information_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $information) {
            $db->run("INSERT IGNORE INTO #__mijoshop_information_description SET information_id = '" . (int)$information['information_id'] . "', language_id = '" . (int)$language_id . "', title = '" . $db->run($information['title'], 'escape') . "', description = '" . $db->run($information['description'], 'escape') . "'", 'query');
        }

        // Length
        $query = $db->run("SELECT * FROM #__mijoshop_length_class_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $length) {
            $db->run("INSERT IGNORE INTO #__mijoshop_length_class_description SET length_class_id = '" . (int)$length['length_class_id'] . "', language_id = '" . (int)$language_id . "', title = '" . $db->run($length['title'], 'escape') . "', unit = '" . $db->run($length['unit'], 'escape') . "'", 'query');
        }

        // Option
        $query = $db->run("SELECT * FROM #__mijoshop_option_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $option) {
            $db->run("INSERT IGNORE INTO #__mijoshop_option_description SET option_id = '" . (int)$option['option_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $db->run($option['name'], 'escape') . "'", 'query');
        }

        // Option Value
        $query = $db->run("SELECT * FROM #__mijoshop_option_value_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $option_value) {
            $db->run("INSERT IGNORE INTO #__mijoshop_option_value_description SET option_value_id = '" . (int)$option_value['option_value_id'] . "', language_id = '" . (int)$language_id . "', option_id = '" . (int)$option_value['option_id'] . "', name = '" . $db->run($option_value['name'], 'escape') . "'", 'query');
        }

        // Order Status
        $query = $db->run("SELECT * FROM #__mijoshop_order_status WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $order_status) {
            $db->run("INSERT IGNORE INTO #__mijoshop_order_status SET order_status_id = '" . (int)$order_status['order_status_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $db->run($order_status['name'], 'escape') . "'", 'query');
        }

        // Product
        $query = $db->run("SELECT * FROM #__mijoshop_product_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $product) {
            $db->run("INSERT IGNORE INTO #__mijoshop_product_description SET product_id = '" . (int)$product['product_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $db->run($product['name'], 'escape') . "', meta_description = '" . $db->run($product['meta_description'], 'escape') . "', meta_keyword = '" . $db->run($product['meta_keyword'], 'escape') . "', description = '" . $db->run($product['description'], 'escape') . "', tag = '" . $db->run($product['tag'], 'escape') . "'", 'query');
        }

        // Product Attribute
        $query = $db->run("SELECT * FROM #__mijoshop_product_attribute WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $product_attribute) {
            $db->run("INSERT IGNORE INTO #__mijoshop_product_attribute SET product_id = '" . (int)$product_attribute['product_id'] . "', attribute_id = '" . (int)$product_attribute['attribute_id'] . "', language_id = '" . (int)$language_id . "', text = '" . $db->run($product_attribute['text'], 'escape') . "'", 'query');
        }

        // Return Action
        $query = $db->run("SELECT * FROM #__mijoshop_return_action WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $return_action) {
            $db->run("INSERT IGNORE INTO #__mijoshop_return_action SET return_action_id = '" . (int)$return_action['return_action_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $db->run($return_action['name'], 'escape') . "'", 'query');
        }

        // Return Reason
        $query = $db->run("SELECT * FROM #__mijoshop_return_reason WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $return_reason) {
            $db->run("INSERT IGNORE INTO #__mijoshop_return_reason SET return_reason_id = '" . (int)$return_reason['return_reason_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $db->run($return_reason['name'], 'escape') . "'", 'query');
        }

        // Return Status
        $query = $db->run("SELECT * FROM #__mijoshop_return_status WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $return_status) {
            $db->run("INSERT IGNORE INTO #__mijoshop_return_status SET return_status_id = '" . (int)$return_status['return_status_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $db->run($return_status['name'], 'escape') . "'", 'query');
        }

        // Stock Status
        $query = $db->run("SELECT * FROM #__mijoshop_stock_status WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $stock_status) {
            $db->run("INSERT IGNORE INTO #__mijoshop_stock_status SET stock_status_id = '" . (int)$stock_status['stock_status_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $db->run($stock_status['name'], 'escape') . "'", 'query');
        }

        // Voucher Theme
        $query = $db->run("SELECT * FROM #__mijoshop_voucher_theme_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $voucher_theme) {
            $db->run("INSERT IGNORE INTO #__mijoshop_voucher_theme_description SET voucher_theme_id = '" . (int)$voucher_theme['voucher_theme_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $db->run($voucher_theme['name'], 'escape') . "'", 'query');
        }

        // Weight Class
        $query = $db->run("SELECT * FROM #__mijoshop_weight_class_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $weight_class) {
            $db->run("INSERT IGNORE INTO #__mijoshop_weight_class_description SET weight_class_id = '" . (int)$weight_class['weight_class_id'] . "', language_id = '" . (int)$language_id . "', title = '" . $db->run($weight_class['title'], 'escape') . "', unit = '" . $db->run($weight_class['unit'], 'escape') . "'", 'query');
        }
    }
}