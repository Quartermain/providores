<?php
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

// No Permission
defined('_JEXEC') or die ('Restricted access');

require_once(JPATH_ROOT.'/components/com_mijoshop/mijoshop/mijoshop.php');

class MijoShopBase {

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
	
	public function getMijoshopVersion() {
        static $version;

        if (!isset($version)) {
            $version = $this->getXmlText(JPATH_MIJOSHOP_ADMIN.'/mijoshop.xml', 'version');
        }

		return $version;
	}

	public function getLatestMijoshopVersion() {
        static $version;

        if (!isset($version)) {
            $cache = JFactory::getCache('com_mijoshop', 'output');
            $cache->setCaching(1);

            $version = $cache->get('ms_version', 'com_mijoshop');

            if (empty($version)) {
                $version = MijoShop::get('utility')->getRemoteVersion();
                $cache->store($version, 'ms_version', 'com_mijoshop');
            }
        }

		return $version;
	}

	public function getOcVersion() {
        $version = '1.5.5.1';

		return $version;
	}
	
	public function is15() {
		static $status;
		
		if (!isset($status)) {
			if (version_compare(JVERSION, '1.6.0', 'ge')) {
				$status = false;
			}
			else {
				$status = true;
			}
		}
		
		return $status;
	}

	public function is30() {
		static $status;

		if (!isset($status)) {
			if (version_compare(JVERSION, '3.0.0', 'ge')) {
				$status = true;
			}
			else {
				$status = false;
			}
		}

		return $status;
	}

	public function getConfig() {
		static $config;

		if (!isset($config)) {
			$settings = '';
			
            $db = JFactory::getDbo();
			$tables	= $db->getTableList();
			$mijoshop_setting = $db->getPrefix().'mijoshop_setting';
			if (in_array($mijoshop_setting, $tables)) {
				$db->setQuery("SELECT `value` FROM `#__mijoshop_setting` WHERE `key` = 'config_mijoshop'");
				$settings = unserialize($db->loadResult());
            }
			
			$config = new JRegistry($settings);
		}
		
		return $config;
	}

	public function setConfig($var, $value) {
		$config = $this->getConfig();
		
		$config->set($var, $value);
		
		$settings = serialize($config->toArray());
		
		MijoShop::get('db')->run("UPDATE `#__mijoshop_setting` SET `value` = '{$settings}' WHERE `key` = 'config_mijoshop'", 'query');
	}

	public function getJConfig() {
		static $config;

		if (!isset($config)) {
			require_once(JPATH_CONFIGURATION.'/configuration.php');

			$config = new JConfig();
		}

		return $config;
	}
	
	public function editor() {
		static $editor;
		
		if (!isset($editor)) {
            if ($this->is30()) {
                jimport('cms.editor.editor');

                $j_editor = JFactory::getConfig()->get('editor');
                $editor = JEditor::getInstance($j_editor);
            }
            else {
                $editor = JFactory::getEditor();
            }
		}
		
		return $editor;
	}

	public function getFullUrl($path_only = false, $host_only = false) {
        if (JFactory::getApplication()->isSite()) {
			$url = '';
			
			$live_site = $this->getJConfig()->live_site;
			
			if (trim($live_site) != '') {
				$uri = JURI::getInstance($live_site);
				
				if ($host_only == false) {
					$url = rtrim($uri->toString(array('path')), '/\\');
				}
				
				if ($path_only == false) {
					$url = $uri->toString(array('scheme', 'host', 'port')) . $url;
				}
			}
			else {
				if ($host_only == false) {
					if (strpos(php_sapi_name(), 'cgi') !== false && !ini_get('cgi.fix_pathinfo') && !empty($_SERVER['REQUEST_URI'])) {
						$script_name = $_SERVER['PHP_SELF'];
					}
					else {
						$script_name = $_SERVER['SCRIPT_NAME'];
					}
					
					$url = rtrim(dirname($script_name), '/.\\');
				}
				
				if ($path_only == false) {
					$port = 'http://';
					if (isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) {
						$port = 'https://';
					}
				
					$url = $port . $_SERVER['HTTP_HOST'] . $url;
				}
			}
		}
		else {
			$url = JURI::root($path_only);
		}

        if (substr($url, -1) != '/') {
            $url .= '/';
        }
		
		return $url;
	}

	public function getDomain() {
		static $domain;
		
		if (!isset($domain)) {
            $domain = $this->getFullUrl(false, true);
		}
		
		return $domain;
	}

	public function getSubdomain() {
		static $sub_domain;
		
		if (!isset($sub_domain)) {
            $sub_domain = $this->getFullUrl(true);
		}
		
		return $sub_domain;
	}
	
	public function getXmlText($file, $variable) {
        jimport('joomla.filesystem.file');
        
		$value = '';
		
		if (JFile::exists($file)) {
            $xml = simplexml_load_file($file, 'SimpleXMLElement');

            if (is_null($xml) || !($xml instanceof SimpleXMLElement)) {
                return $value;
            }

            $value = $xml->$variable;
		}
		
		return $value;
    }

    public function trigger($function, $args = array(), $folder = 'mijoshop') {
        jimport('joomla.plugin.helper');

        JPluginHelper::importPlugin($folder);
        $dispatcher = JDispatcher::getInstance();
        $result = $dispatcher->trigger($function, $args);

        return $result;
    }

    public function triggerContentPlg($text) {
        $config = $this->getConfig();

        if ($config->get('trigger_content_plg', 0) == 0) {
            return $text;
        }

        $item = new stdClass();
        $item->id = null;
        $item->rating = null;
        $item->rating_count = null;
        $item->text = $text;

        $params = $config;
        $limitstart = JRequest::getInt('limitstart');

        $this->trigger('onContentPrepare', array('com_mijoshop.product', &$item, &$params, $limitstart), 'content');

        return $item->text;
    }


    public function loadPathway($route) {
        $view = JRequest::getWord('view');
        if (!empty($view) and !MijoShop::get('base')->is30()) {
            return;
        }

        if (empty($route)) {
             $route = JRequest::getString('route');
        }

        if (empty($route)) {
            return;
        }

        $mainframe = JFactory::getApplication(0);

        $a_menu = $mainframe->getMenu()->getActive();
        $pathway = $mainframe->getPathway();
        $pathway_names = $pathway->getPathwayNames();

        switch($route) {
            case 'product/product':
                $c_id = JRequest::getCmd('path');
                $p_id = JRequest::getInt('product_id');

                if (strpos($c_id, '_')) {
                    $c_id = end(explode('_', $c_id));
                }

                if (is_object($a_menu) and ($a_menu->query['view'] == 'product') and ($a_menu->query['product_id'] == $p_id)){
                    break;
                }

                if (empty($c_id)) {
                    $c_id = MijoShop::get('db')->getProductCategoryId($p_id);
                }

                $cats = MijoShop::get('db')->getCategoryNames($c_id);
                if (!empty($cats)) {
                    foreach ($cats as $cat) {
                        if (is_object($a_menu) and ($a_menu->query['view'] == 'category') and ($a_menu->query['path'] == $cat->id)){
                            continue;
                        }

                        if (in_array($cat->name, $pathway_names)){
                            continue;
                        }

                        $pathway->addItem($cat->name, MijoShop::get('router')->route('index.php?route=product/category&path='.$cat->id));
                    }
                }

                $pathway->addItem(MijoShop::get('db')->getRecordName($p_id));

                break;
            case 'product/category':
                $c_id = JRequest::getCmd('path');
                if (empty($c_id)) {
                    break;
                }

                if (strpos($c_id, '_')) {
                    $c_id = end(explode('_', $c_id));
                }

                if (is_object($a_menu) and ($a_menu->query['view'] == 'category') and ($a_menu->query['path'] == $c_id)){
                    break;
                }

                $cats = MijoShop::get('db')->getCategoryNames($c_id);

                if (!empty($cats)) {
                    foreach ($cats as $cat) {
                        if (is_object($a_menu) and ($a_menu->query['view'] == 'category') and ($a_menu->query['path'] == $cat->id)){
                            continue;
                        }

                        if (in_array($cat->name, $pathway_names)){
                            continue;
                        }

                        if ($cat->id == $c_id) {
                            $pathway->addItem($cat->name);
                        }
                        else {
                            $pathway->addItem($cat->name, MijoShop::get('router')->route('index.php?route=product/category&path='.$cat->id));
                        }
                    }
                }

                break;
            case 'product/manufacturer':
                $pathway->addItem('Brand');

                break;
            case 'product/manufacturer/info':
                $m_id = JRequest::getInt('manufacturer_id');
                if (empty($m_id)) {
                    break;
                }

                if (is_object($a_menu) and ($a_menu->query['view'] == 'manufacturer') and ($a_menu->query['manufacturer_id'] == $m_id)){
                    break;
                }

                $pathway->addItem('Brand', MijoShop::get('router')->route('index.php?route=product/manufacturer'));
                $pathway->addItem(MijoShop::get('db')->getRecordName($m_id, 'manufacturer'));

                break;
            case 'information/information':
                $i_id = JRequest::getInt('information_id');
                if (empty($i_id)) {
                    break;
                }

                if (is_object($a_menu) and $a_menu->query['view'] == 'information' and $a_menu->query['information_id'] == $i_id){
                    break;
                }

                $pathway->addItem(MijoShop::get('db')->getRecordName($i_id, 'information'));

                break;
            default:
                if ($route == 'common/home') {
                    break;
                }

                if (is_object($a_menu) and $a_menu->query['view'] == 'cart') {
                    break;
                }

                MijoShop::get('opencart')->get('language')->load($route);

                $pathway->addItem(MijoShop::get('opencart')->get('language')->get('heading_title'));

                break;
        }
    }
	
	public function addHeader($path, $css = true, $only_ie = false) {
		static $headers = array();
		
		if (isset($headers[$path])) {
			return;
		}
		
		jimport('joomla.environment.browser');
		$browser = JBrowser::getInstance();

		if (($only_ie == true) or strpos($path, 'ie6.css') or strpos($path, 'ie7.css') or strpos($path, 'ie8.css')) {
            if ($browser->getBrowser() != 'msie') {
                return;
            }

            if (strpos($path, 'ie6.css') and ($browser->getMajor() != '6')) {
                return;
            }

            if (strpos($path, 'ie7.css') and ($browser->getMajor() != '7')) {
                return;
            }

            if (strpos($path, 'ie8.css') and ($browser->getMajor() != '8')) {
                return;
            }
		}
		
		global $vqmod;
		
		if (!is_object($vqmod)) {
			require_once(JPATH_MIJOSHOP_OC.'/vqmod/vqmod.php');
			$vqmod = new VQMod();
		}
		
		$doc = JFactory::getDocument();
		
		$f = 'addStylesheet';
		if ($css == false) {
			$f = 'addScript';
		}
		
		$doc->$f(self::clearPath($vqmod->modCheck($path)));
		
		$headers[$path] = 'added';
	}
	
	public function clearPath($path) {
		$clear_path = str_replace(JPATH_ROOT, $this->getSubdomain(), $path);
		$clear_path = str_replace('/\\', '/', $clear_path);
		$clear_path = str_replace('\\', '/', $clear_path);
		$clear_path = str_replace('//', '/', $clear_path);
		$clear_path = str_replace('com_mijoshop/opencartadmin', 'com_mijoshop/opencart/admin', $clear_path);
		$clear_path = str_replace('com_mijoshop/opencartcatalog', 'com_mijoshop/opencart/catalog', $clear_path);

		return $clear_path;
	}

    public function buildIndentTree($id, $indent, $list, &$children) {
        if (@$children[$id]) {
            foreach ($children[$id] as $ch) {
                $id = $ch->id;

                $pre 	= '|_&nbsp;';
                $spacer = '.&nbsp;&nbsp;&nbsp;';

                if ($ch->parent == 0) {
                    $txt = $ch->name;
                } else {
                    $txt = $pre . $ch->name;
                }

                $list[$id] = $ch;
                $list[$id]->name = "$indent$txt";
                $list[$id]->children = count(@$children[$id]);
                $list = self::buildIndentTree($id, $indent . $spacer, $list, $children);
            }
        }

        return $list;
    }

    public function getStoreId() {
        static $store_id;

   		if (!isset($store_id)) {
   			$db = MijoShop::get('db')->getDbo();

   			if (isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) {
   				$field = 'ssl';
   			}
   			else {
   				$field = 'url';
   			}

   			$db->setQuery("SELECT store_id FROM #__mijoshop_store WHERE REPLACE(`{$field}`, 'www.', '') = ".$db->Quote(str_replace('www.', '', $this->getFullUrl())));
            $store_id = $db->loadResult();

   			if (empty($store_id)) {
                $store_id = 0;
   			}
   		}

   		return $store_id;
   	}

    public function plgEnabled($folder, $name) {
        static $status = array();

        if (!isset($status[$folder][$name])) {
            jimport('joomla.plugin.helper');
            $status[$folder][$name] = JPluginHelper::isEnabled($folder, $name);
        }

        return $status[$folder][$name];
    }

    public function isAdmin($type = 'mijoshop') {
        static $is_admin = array();

        if (!isset($is_admin[$type])) {
            $mainframe = JFactory::getApplication();

            if ($type == 'mijoshop') {
                $state = false;

                if ($mainframe->isSite()) {
                    $state = (JRequest::getCmd('view') == 'admin');

                    if (!$state) {
                        $home_menu_id = MijoShop::get('router')->getItemid('home', 0);
                        $admin_menu_id = MijoShop::get('router')->getItemid('admin', 0);

                        if (($admin_menu_id != $home_menu_id) and (JRequest::getInt('Itemid') == $admin_menu_id)) {
                            $state = true;
                        }
                    }
                }
            }
            else {
                $state = $mainframe->isAdmin();
            }

            if ($state) {
                $is_admin[$type] = true;
            }
            else {
                $is_admin[$type] = false;
            }
        }

        return $is_admin[$type];
   	}

    public function isExternal() {
        static $is_external;

        if (!isset($is_external)) {
            $is_external = false;

            $view = JRequest::getString('view');

            if (substr($view, 0, 7) == 'install' or substr($view, 0, 8) == 'external') {
                $is_external = true;
            }
        }

        return $is_external;
   	}

    public function isAjax($output = '') {
        $is_ajax = false;
        $app = JFactory::getApplication();

        $tmpl = JRequest::getWord('tmpl');
        $format = JRequest::getWord('format');

        if ($app->isSite() and MijoShop::get('base')->is30()) {
            $ret = false;
            $j_config = MijoShop::get('base')->getJConfig();

            if ($j_config->sef == '0') {
                $route = JFactory::getURI()->getVar('route');

                if (($route == 'account/register') or ($route == 'affiliate/register')) {
                    $ret = true;
                }
            }
            else {
                $path = JFactory::getURI()->toString(array('path'));

                if ($j_config->sef_suffix == '0') {
                    if ((substr($path, -16) == 'account/register') or (substr($path, -18) == 'affiliate/register')) {
                        $ret = true;
                    }
                }
                else {
                    if ((substr($path, -21) == 'account/register.html') or (substr($path, -23) == 'affiliate/register.html')) {
                        $ret = true;
                    }
                }

                if ($ret === false) {
                    $active = $app->getMenu()->getActive();

                    if (is_object($active) and ($active->id == MijoShop::get('router')->getItemid('registration'))) {
                        $ret = true;
                    }
                }
            }

            if ($ret === true) {
                unset($_GET['format']);
                unset($_GET['tmpl']);
                unset($_REQUEST['format']);
                unset($_REQUEST['tmpl']);

                return false;
            }
        }

        if (($tmpl == 'component') or ($format == 'raw')) {
            $is_ajax = true;
        }
        else if (!empty($output)) {
			if ($this->isJson($output)) {
				$is_ajax = true;

				JRequest::setVar('format', 'raw');
				JRequest::setVar('tmpl', 'component');
			}
        }

        return $is_ajax;
    }

    public function isJson($string) {
		$status = false;
		
		if (version_compare(PHP_VERSION, '5.3.0', '>=')) {
			$a = json_decode($string, false, 1);
			if(json_last_error() == JSON_ERROR_NONE && !is_null($a)) {
				$status = true;
			}
		}
		else {
			if (substr($string, 0, 11) == '{"success":' or
					substr($string, 0, 12) == '{"redirect":' or
					substr($string, 0, 9) == '{"error":' or
					substr($string, 0, 11) == '{"warning":' or
					substr($string, 0, 15) == '{"information":' or
					substr($string, 0, 13) == '{"attention":') {

					$status = true;
				}
		}
		
		return $status;
    }

    public function isMijosefInstalled() {
        static $status;

        if (!isset($status)) {
            $status = true;

            if (MijoShop::get('base')->getConfig()->get('mijosef_integration', 1) == 0) {
                $status = false;

                return $status;
            }

            $file = JPATH_ADMINISTRATOR.'/components/com_mijosef/library/mijosef.php';
            if (!file_exists($file)) {
                $status = false;

                return $status;
            }

            require_once($file);

            if (Mijosef::getConfig()->mode == 0) {
                $status = false;
            }
        }

        return $status;
    }
	
	public function isMijoEventInstalled() {
        static $status;

        if (!isset($status)) {
            $file = JPATH_ADMINISTRATOR.'/components/com_mijoevents/library/mijoevents.php';
            if (!file_exists($file)) {
                $status = false;

                return $status;
            }

            require_once($file);

            if(JComponentHelper::isEnabled('com_mijoevents')){
                $status = true;
            }
        }

        return $status;
    }

    public function checkIsEvent($product_id){
        $isIns = MijoShop::get('base')->isMijoEventInstalled();
        $result = false;

        if($isIns) {
            $query = "SELECT id FROM #__mijoevents_events WHERE product_id = ". $product_id." LIMIT 1" ;
            $db = JFactory::getDbo();
            $db->setQuery($query);
            $event_id = $db->loadResult();

            if($event_id){
                $result = $event_id;
            }
        }

        return $result;
    }

    public function isSh404sefInstalled() {
        static $status;

        if (!isset($status)) {
            $status = true;

            $file = JPATH_ADMINISTRATOR.'/components/com_sh404sef/sh404sef.class.php';
            if (!file_exists($file)) {
                $status = false;

                return $status;
            }

            require_once($file);

            if (Sh404sefFactory::getConfig()->Enabled == 0) {
                $status = false;
            }
        }

        return $status;
    }

    public function isJoomsefInstalled() {
        static $status;

        if (!isset($status)) {
            $status = true;

            $file = JPATH_ADMINISTRATOR.'/components/com_sef/classes/config.php';
            if (!file_exists($file)) {
                $status = false;

                return $status;
            }

            require_once($file);

            if (!SEFConfig::getConfig()->enabled) {
                $status = false;
            }
        }

        return $status;
    }
	
    public function isAcymaillingInstalled() {
        static $status;

        if (!isset($status)) {
            $status = true;

            $file = JPATH_ADMINISTRATOR.'/components/com_acymailing/acymailing.php';
            if (!file_exists($file)) {
                $status = false;

                return $status;
            }

            if ( JComponentHelper::isEnabled('com_acymailing') == 0 ) {
                $status = false;
            }
        }

        return $status;
    }

    public function getMailList($id = null) {
        $where = '';
        if(!empty($id)){
            $where = 'WHERE listid = {$id}';
        }

        return MijoShop::get('db')->run('SELECT listid, name FROM #__acymailing_list '.$where, 'loadAssocList');
    }

    public function getMailListHtml($name, $value) {
        $list = $this->getMailList();

        if(!empty($list)){
            $html = '<select name="'.$name.'" >';

            foreach($list as $item){
                $selected = '';
                if($item['listid'] == $value){
                    $selected = 'selected="selected"';
                }

                $html .= '<option '.$selected.' value="'.$item['listid'].'">'.$item['name'].'</option>';
            }
            $html .= '</select>';
        }

        return $html;
    }

    public function isActiveSubMenu($src, $is_route = true) {
        $state = false;
        $view = JRequest::getString('view');
        $route = JRequest::getString('route');

        if ($is_route == true) {
            switch ($src) {
                case 'dashboard':
                    if ((empty($route) && empty($view)) or ($route == 'common/home')) {
                        $state = true;
                    }
                    break;
                case 'settings':
                    if (substr($route, 0, 8) == 'setting/') {
                        $state = true;
                    }
                    break;
                case 'categories':
                    if (substr($route, 0, 16) == 'catalog/category') {
                        $state = true;
                    }
                    break;
                case 'products':
                    if (substr($route, 0, 15) == 'catalog/product') {
                        $state = true;
                    }
                    break;
                case 'coupons':
                    if (substr($route, 0, 11) == 'sale/coupon') {
                        $state = true;
                    }
                    break;
                case 'customers':
                    if (substr($route, 0, 13) == 'sale/customer') {
                        $state = true;
                    }
                    break;
                case 'orders':
                    if (substr($route, 0, 10) == 'sale/order') {
                        $state = true;
                    }
                    break;
                case 'affiliates':
                    if (substr($route, 0, 14) == 'sale/affiliate') {
                        $state = true;
                    }
                    break;
                case 'mailing':
                    if (substr($route, 0, 12) == 'sale/contact') {
                        $state = true;
                    }
                    break;
            }
        }
        else {
            $state = ($view == $src);
        }

        return $state;
    }

    public function checkRequirements($src) {
        $base = MijoShop::get('base');

        if (($src == 'admin' || $src == 'admin2') && !JFactory::getUser()->authorise('core.manage', 'com_mijoshop')) {
        	JError::raiseWarning(404, JText::_('JERROR_ALERTNOAUTHOR'));
            return false;
        }

        $pid = $base->getConfig()->get('pid');
        if (($src == 'site') && empty($pid)) {
            JError::raiseWarning('404', JText::sprintf('COM_MIJOSHOP_CPANEL_PID_NOTE', '<a href="http://mijosoft.com/my-profile">', '</a>', '<a href="administrator/index.php?option=com_mijoshop&route=setting/setting">', '</a>'));
            return false;
        }

        if (!file_exists(JPATH_ROOT.'/components/com_mijoshop/opencart/index.php')) {
            JError::raiseWarning(404, JText::_('COM_MIJOSHOP_MISSING_LIBRARY'));
            return false;
        }

        if ($base->plgEnabled('system', 'legacy')) {
            JError::raiseWarning(404, JText::_('COM_MIJOSHOP_LEGACY_PLUGIN'));
            return false;
        }

        if (!function_exists('mcrypt_create_iv')) {
            JError::raiseWarning(404, JText::_('COM_MIJOSHOP_NO_MCRYPT'));
            return false;
        }

        if (!is_writable(JPATH_MIJOSHOP_OC.'/vqmod/vqcache')) {
            JError::raiseWarning(404, JText::_('COM_MIJOSHOP_VQCACHE_NOT_WRITABLE'));
            return false;
        }

        return true;
    }

    public function replaceOutput($output, $source) {
		if(JRequest::getString('route') == 'tool/themeeditor/edit'){
            return $output;
        }
		
		$http_catalog="/";
        $constants = get_defined_constants();
		if(isset($constants['HTTP_CATALOG'])){
			$http_catalog = $constants['HTTP_CATALOG'];
		}

        $replace_output = array(
            '$.' => 'jQuery.',
            '$(' => 'jQuery(',
            '<div id="container">' => '<div id="container_oc">',
            '"header"' => '"header_oc"',
            '"content"' => '"content_oc"',
            'class="button"' => 'class="button_oc"',
            'id="button"' => 'id="button_oc"',
            '"search"' => '"search_oc"',
            'class="button-search"' => 'class="button_oc-search"',
            '"menu"' => '"menu_oc"',
            '"banner"' => '"banner_oc"',
            '"footer"' => '"footer_oc"',
            '#header' => '#header_oc',
            '#content' => '#content_oc',
            '.button ' => '.button_oc ',
            '.button:' => '.button_oc:',
            '#content' => '#content_oc',
            '#container' => '#container_oc',
            '#menu' => '#menu_oc',
			'src="view/image/flags/' => 'src="'. $http_catalog .'media/mod_languages/images/'
        );

        if ($this->is30()) {
            $replace_output['<input type="text" '] = '<input type="text" style="width: 120px !important;" ';
            $replace_output['<input type="password" '] = '<input type="password" style="width: 120px !important;" ';
        }

        if ($source == 'admin' || $source == 'admin2' || $source == 'site' || $source == 'module') {
            //$replace_output["location = 'index.php?route="] = "location = 'index.php?option=com_mijoshop&format=raw&tmpl=component&route=";
            //$replace_output["location = 'index.php?option=com_mijoshop&route="] = "location = 'index.php?option=com_mijoshop&format=raw&tmpl=component&route=";
            $replace_output["index.php?option=com_mijoshop&route=catalog/product/autocomplete"] = "index.php?option=com_mijoshop&format=raw&tmpl=component&route=catalog/product/autocomplete";
            $replace_output["index.php?route=catalog/product/autocomplete"] = "index.php?option=com_mijoshop&format=raw&tmpl=component&route=catalog/product/autocomplete";
            $replace_output["jQuery.post('index.php?route="] = "jQuery.post('index.php?option=com_mijoshop&format=raw&tmpl=component&route=";
            $replace_output["jQuery.post('index.php?option=com_mijoshop&route="] = "jQuery.post('index.php?option=com_mijoshop&format=raw&tmpl=component&route=";
        }

        if ($source == 'admin') {
            $replace_output['index.php?route='] = 'index.php?option=com_mijoshop&route=';
            $replace_output['index.php?token='] = 'index.php?option=com_mijoshop&token=';
            $replace_output['admin/view'] = '../components/com_mijoshop/opencart/admin/view';
            $replace_output['view/image'] = '../components/com_mijoshop/opencart/admin/view/image';
            $replace_output['view/javascript/jquery/'] = '../plugins/system/mijoshopjquery/mijoshopjquery/';
            $replace_output['view/javascript'] = '../components/com_mijoshop/opencart/admin/view/javascript';
            $replace_output['index.php?option=com_mijoshop&route=sale/order/invoice&'] = 'index.php?option=com_mijoshop&route=sale/order/invoice&format=raw&tmpl=component&';
            $replace_output['index.php?option=com_mijoshop&route=tool/backup/backup&'] = 'index.php?option=com_mijoshop&format=raw&tmpl=component&route=tool/backup/backup&';
            $replace_output['<link rel="stylesheet" type="text/css" href="index.php?option=com_mijoshop&'] = '<link rel="stylesheet" type="text/css" href="index.php?option=com_mijoshop&format=raw&tmpl=component&';
        }

        if ($source == 'admin2') {
            $replace_output['index.php?route=common/filemanager'] = 'index.php?option=com_mijoshop&view=admin&tmpl=component&format=raw&route=common/filemanager';
            $replace_output['index.php?option=com_mijoshop&format=raw&tmpl=component&route=common/filemanager'] = 'index.php?option=com_mijoshop&view=admin&tmpl=component&format=raw&route=common/filemanager';
            $replace_output['index.php?option=com_mijoshop&tmpl=component&format=raw&route=common/filemanager'] = 'index.php?option=com_mijoshop&view=admin&tmpl=component&format=raw&route=common/filemanager';
            $replace_output["load('index.php?option=com_mijoshop&"] = "load('index.php?option=com_mijoshop&view=admin&format=raw&tmpl=component&";
            $replace_output["load('index.php?route="] = "load('index.php?option=com_mijoshop&view=admin&format=raw&tmpl=component&route=";
            $replace_output[": 'index.php?option=com_mijoshop"] = ": 'index.php?option=com_mijoshop&view=admin&format=raw&tmpl=component";
            $replace_output[": 'index.php?route="] = ": 'index.php?option=com_mijoshop&view=admin&format=raw&tmpl=component&route=";
            $replace_output['index.php?option=com_mijoshop&route=sale/order/invoice&'] = 'index.php?option=com_mijoshop&view=admin&route=sale/order/invoice&format=raw&tmpl=component&';
            $replace_output['index.php?option=com_mijoshop&route=tool/backup/backup&'] = 'index.php?option=com_mijoshop&view=admin&format=raw&tmpl=component&route=tool/backup/backup&';
            $replace_output['index.php?route='] = 'index.php?option=com_mijoshop'.MijoShop::get('router')->getItemid('admin', 0, true).'&route=';
            $replace_output['index.php?token='] = 'index.php?option=com_mijoshop'.MijoShop::get('router')->getItemid('admin', 0, true).'&token=';
            $replace_output['admin/view'] = 'components/com_mijoshop/opencart/admin/view';
            $replace_output['view/image'] = 'components/com_mijoshop/opencart/admin/view/image';
            $replace_output['view/javascript/jquery/'] = 'plugins/system/mijoshopjquery/mijoshopjquery/';
            $replace_output['view/javascript'] = 'components/com_mijoshop/opencart/admin/view/javascript';
            $replace_output['<select name="filter_category" style="width: 18em;" >'] = '<select name="filter_category" style="width: 120px;" >';
            $replace_output['<link rel="stylesheet" type="text/css" href="index.php?option=com_mijoshop&'] = '<link rel="stylesheet" type="text/css" href="index.php?option=com_mijoshop&view=admin&format=raw&tmpl=component&';
            $replace_output['<input type="text" name="filter_model" value="" />'] = '<input type="text" name="filter_model" value="" style="width: 60px;" />';
            $replace_output['<input type="text" name="filter_price" value="" size="8"/>'] = '<input type="text" name="filter_price" value="" size="8" style="width: 50px;" />';
            $replace_output['<input type="text" name="filter_quantity" value="" style="text-align: right;" />'] = '<input type="text" name="filter_quantity" value="" style="text-align: right; width: 40px;" />';
        }

        if ($source == 'admin' || $source == 'admin2') {
            $replace_output["HTTP_SERVER . 'admin/"] = "HTTP_SERVER . 'components/com_mijoshop/opencart/admin/";
            //$replace_output['index.php?option=com_mijoshop&route=checkout/manual'] = 'index.php?option=com_mijoshop&route=checkout/manual&format=raw&tmpl=component';
            $replace_output['index.php?option=com_mijoshop&route=checkout/manual'] = 'index.php?option=com_mijoshop&format=raw&tmpl=component&route=checkout/manual';
            //$replace_output["window.open('index.php?route="] = "window.open('index.php?optiopn=com_mijoshop&route=";

            if ($this->is30()) {
                $replace_output['<select name="'] = '<select class="chzn-done" style="max-width: 140px !important; max-height: 22px !important;" name="';
                $replace_output['<select id="'] = '<select class="chzn-done" style="max-width: 140px !important; max-height: 22px !important;" id="';
                $replace_output['<input type="text" '] = '<input type="text" style="inherit !important;" ';
            }
        }

        if ($source == 'admin' || $source == 'site' || $source == 'module') {
            $replace_output['index.php?option=com_mijoshop&route=common/filemanager'] = 'index.php?option=com_mijoshop&format=raw&tmpl=component&route=common/filemanager';
            $replace_output['index.php?route=common/filemanager'] = 'index.php?option=com_mijoshop&format=raw&tmpl=component&route=common/filemanager';
            $replace_output[".load('index.php?option=com_mijoshop&route="] = ".load('index.php?option=com_mijoshop&format=raw&tmpl=component&route=";
            $replace_output[".load('index.php?route="] = ".load('index.php?option=com_mijoshop&format=raw&tmpl=component&route=";
            $replace_output[": 'index.php?option=com_mijoshop&route="] = ": 'index.php?option=com_mijoshop&format=raw&tmpl=component&route=";
            $replace_output[": 'index.php?route="] = ": 'index.php?option=com_mijoshop&format=raw&tmpl=component&route=";
        }

        if ($source == 'admin2' || $source == 'site' || $source == 'module') {
            $replace_output["HTTP_SERVER . 'catalog/"] = "HTTP_SERVER . 'components/com_mijoshop/opencart/catalog/";
        }

        if ($source == 'site' || $source == 'module') {
            //$replace_output['<div class="breadcrumb">'] = '<div class="breadcrumb" style="display: none;">';
            $replace_output['class="box"'] = 'class="box_oc"';
            $replace_output['class="button_oc"'] = 'class="'.MijoShop::getButton().'"';
            $replace_output['class="button"'] = 'class="'.MijoShop::getButton().'"';
            $replace_output['id="button"'] = 'class="'.MijoShop::getButton().'"';
            $replace_output[' src="catalog/'] = ' src="components/com_mijoshop/opencart/catalog/';
            $replace_output[' src="image/'] = ' src="components/com_mijoshop/opencart/image/';
            $replace_output['index.php?route=product/product/captcha'] = 'index.php?option=com_mijoshop&format=raw&tmpl=component&route=product/product/captcha';
            $replace_output['index.php?route=information/contact/captcha'] = 'index.php?option=com_mijoshop&format=raw&tmpl=component&route=information/contact/captcha';
            $replace_output['index.php?route=account/return/captcha'] = 'index.php?option=com_mijoshop&format=raw&tmpl=component&route=account/return/captcha';
            $replace_output['index.php?route='] = 'index.php?option=com_mijoshop'.MijoShop::get('router')->getItemid('home', 0, true).'&route=';
            $replace_output['index.php?token='] = 'index.php?option=com_mijoshop'.MijoShop::get('router')->getItemid('home', 0, true).'&token=';
			$replace_output['index.php?option=com_mijoshop&route=facebook_store'] = 'index.php?option=com_mijoshop&format=raw&tmpl=component&route=facebook_store';
			
            if ($this->is30()) {
                $replace_output['<input type="text" style="width: 120px !important;" name="quantity'] = '<input type="text" style="width:30px !important;" name="quantity';
                $replace_output[' class="large-field"'] = ' class="large-field" style="width: 200px !important;"';
				$replace_output['alt="Update" title="Update"'] = 'alt="Update" title="Update" style="width:16px !important;"';
            }
        }

        if ($source == 'site') {
            if (MijoShop::getClass('base')->getConfig()->get('comments', '0') == 'komento') {
                $replace_output["jQuery('.commentTools')"] = "$('.commentTools')";
                $replace_output["jQuery('.commentForm')"] = "$('.commentForm')";
                $replace_output["jQuery('.commentList')"] = "$('.commentList')";
                $replace_output["jQuery('.fameList')"] = "$('.fameList')";
            }
        }

        if ($source == 'module') {
            $replace_output['class="box-content"'] = '';
            $replace_output['<div class="bottom">&nbsp;</div>'] = '';
            $replace_output['class="box_oc"'] = 'class="box_oc" style="margin-bottom: 0px !important;"';
        }

        $replace_output['"breadcrumb"'] = '"breadcrumb_oc"';

        foreach($replace_output as $key => $value){
        	$output = str_replace($key, $value, $output);
        }

        /*if (($source == 'admin' || $source == 'admin2') && !$this->isAjax($output)) {
            $output = ltrim($output, '[');
            $output = rtrim($output, ']');
        }*/

        return $output;
    }

    public function getIntegrations($product_id) {
        $integrations = '';
        $db = MijoShop::get('db')->getDbo();
        $db->setQuery("SELECT content FROM #__mijoshop_j_integrations p  WHERE p.product_id = '" . (int)$product_id . "'");
        $result = $db->loadResult();
        if(!empty($result)){
            $integrations = json_decode(html_entity_decode($result));
        }
        return $integrations;
    }
	
	public function getIntegrationViews($integrations){
        $html = '';

        jimport('joomla.plugin.helper');
        JPluginHelper::importPlugin('mijoshop');
        $dispatcher = JDispatcher::getInstance();
        $result = $dispatcher->trigger('getViewHtml',  array($integrations));

        if(!empty($result)) {
            $html = implode('',$result);
        }

        return $html;
    }
	
}