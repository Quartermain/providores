<?php
/**
 * @package		MijoSearch
 * @copyright	2009-2013 Mijosoft LLC, www.mijosoft.com
 * @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
 * @license		2009-2012 GNU/GPL based on AceSearch www.joomace.net
 */

// No Permission
defined('_JEXEC') or die('Restricted Access');

// Imports
jimport('joomla.filesystem.file');

// Utility class
class MijosearchUtility {
	
	static $props = array();

    public function __construct() {
		// Get config object
		$this->MijosearchConfig = MijoSearch::getConfig();
	}

    public static function import($path) {
		require_once(JPATH_ADMINISTRATOR . '/components/com_mijosearch/' . str_replace('.', '/', $path).'.php');
	}

    public static function is16() {
		static $status;
		
		if (!isset($status)) {
			if (version_compare(JVERSION, '1.6.0', 'ge')) {
				$status = true;
			} else {
				$status = false;
			}
		}
		
		return $status;
	}

    public static function is30() {
		static $status;

		if (!isset($status)) {
			if (version_compare(JVERSION, '3.0.0', 'ge')) {
				$status = true;
			} else {
				$status = false;
			}
		}

		return $status;
	}
	
	function render($path) {
		ob_start();
		require_once($path);
		$contents = ob_get_contents();
		ob_end_clean();
		
		return $contents;
	}
    
    function get($name, $default = null) {
        if (!is_array(self::$props) || !isset(self::$props[$name])) {
            return $default;
        }
        
        return self::$props[$name];
    }
    
    function set($name, $value) {
        if (!is_array(self::$props)) {
            self::$props = array();
        }
        
        $previous = self::get($name);
		
        self::$props[$name] = $value;
        
        return $previous;
    }
	
	function getConfigState($params, $cfg_name, $prm = "") {
		if (JFactory::getApplication()->isAdmin()) {
			$prm_name = 'admin_'.$cfg_name;
			return isset($this->MijosearchConfig->$prm_name) ? $this->MijosearchConfig->$prm_name : '1';
		}
		
		if (!is_object($params)) {
			return false;
		}
		
		$prm_name = $cfg_name;
		if ($prm != "") {
			$prm_name = $prm;
		}
		
		$param = $params->get($prm_name, 'g');
		
		if (($param == '0') || ($param == 'g' && isset($this->MijosearchConfig->$cfg_name) && $this->MijosearchConfig->$cfg_name == '0')) {
			return false;
		}
		
		return true;
    }
	
	static function &getMenu() {
		jimport('joomla.application.menu');
		$options = array();
		
		$menu = JMenu::getInstance('site', $options);
		
		if (JError::isError($menu)) {
			$null = null;
			return $null;
		}
		
		return $menu;
	}
	
	static function getItemid($filter = 'gelmedi', $is_advanced = false) {
		require_once(JPATH_ADMINISTRATOR . '/components/com_mijosearch/library/extension.php');

        if ($filter == 'gelmedi') {
            $filter = JRequest::getInt('filter', '');
        }
		
		if (empty($filter)) {
            $filter = '';
        }

		$Itemid = '';
		$vars = $params = array();
		
		$vars['option'] = 'com_mijosearch';
		
		if ($is_advanced) {
			$vars['view'] = 'advancedsearch';
			$vars['filter'] = $filter;
			$item = MijosearchExtension::findItemid($vars, $params);
			
			if (!$item) {
				$vars['view'] = 'search';
				$item = MijosearchExtension::findItemid($vars, $params);
			}
		}
		else {
			$vars['view'] = 'search';
			$vars['filter'] = $filter;
			
			$item = MijosearchExtension::findItemid($vars, $params);
			
			if (!$item) {
				$vars['view'] = 'advancedsearch';
				$item = MijosearchExtension::findItemid($vars, $params);
			}
		}
		
		if (!empty($item)) {
			$Itemid = '&amp;Itemid='.$item->id;
		}
		
		return $Itemid;
	}

	function getComponents() {
		static $components;

		if (!isset($components)) {
            $components = array();

			$filter = self::getSkippedComponents();
			$rows = MijoDatabase::loadResultArray("SELECT `element` FROM `#__extensions` WHERE `type` = 'component' AND `element` NOT IN ({$filter}) ORDER BY `element`");

            $lang = JFactory::getLanguage();

			foreach($rows as $row) {
                $lang->load($row.'.sys', JPATH_ADMINISTRATOR);
				$components[] = JHTML::_('select.option', $row, JText::_($row));
			}
		}

		return $components;
	}

    static function getSkippedComponents() {
        return "'com_mijosearch', 'com_search', 'com_admin', 'com_categories', 'com_checkin', 'com_login', 'com_redirect', 'com_user', 'com_contact', 'com_dump', 'com_wrapper', 'com_mailto', 'com_joomfish', 'com_config', 'com_media', 'com_installer', 'com_templates', 'com_cpanel', 'com_cache', 'com_messages', 'com_massmail', 'com_languages', 'com_joomlaupdate', 'com_finder'";
    }

	static function getAccessLevels() {
		return MijoDatabase::loadObjectList('SELECT id, title FROM #__viewlevels');
	}

	static function getExtensionFieldsFromXml($option) {
        $html = '';

        $file = JPATH_MIJOSEARCH_ADMIN.'/extensions/'.$option.'.xml';

        if (!file_exists($file)) {
            return $html;
        }

		$manifest = simplexml_load_file($file);

		if (is_null($manifest)) {
			return $html;
		}

        $fields_xml = $manifest->fields;
		if (!($fields_xml instanceof SimpleXMLElement) or (count($fields_xml->children()) == 0)) {
			return $html;
		}

		return $fields_xml->children();
	}
	
	static function getExtensionFromRequest() {
		static $extension;
		
		if (!isset($extension)) {
			$cid = JRequest::getVar('cid', array(0), 'method', 'array');
			$extension = MijoDatabase::loadResult("SELECT extension FROM #__mijosearch_extensions WHERE id = ".$cid[0]);
		}
		
		return $extension;
	}

    static function smartSubstr($text, $length = 200, $searchword) {
		$textlen = JString::strlen($text);
		$lsearchword = JString::strtolower($searchword);
		$wordfound = false;
		$pos = 0;

        /*if (!JString::strpos($text, $lsearchword)) {
            return JString::substr($text, 0, $length) . '&nbsp;...';
        }*/

		while ($wordfound === false && $pos < $textlen) {
			if (($wordpos = @JString::strpos($text, ' ', $pos + $length)) !== false) {
				$chunk_size = $wordpos - $pos;
			}
            else {
				$chunk_size = $length;
			}

			$chunk = JString::substr($text, $pos, $chunk_size);
			$wordfound = JString::strpos(JString::strtolower($chunk), $lsearchword);
			if ($wordfound === false) {
				$pos += $chunk_size + 1;
			}
		}

		if ($wordfound !== false) {
			return (($pos > 0) ? '...&nbsp;' : '') . $chunk . '&nbsp;...';
		}
        else {
			if (($wordpos = @JString::strpos($text, ' ', $length)) !== false) {
				return JString::substr($text, 0, $wordpos) . '&nbsp;...';
			}
            else {
				return JString::substr($text, 0, $length);
			}
		}
	}

    static function cleanText($text) {
		$text = html_entity_decode($text, ENT_QUOTES, 'UTF-8');
		$text = preg_replace('#<script[^>]*>.*?</script>#si', ' ', $text);
		$text = preg_replace('#<style[^>]*>.*?</style>#si', ' ', $text);
		$text = preg_replace('#<!.*?(--|]])>#si', ' ', $text);
		$text = preg_replace('#<[^>]*>#i', ' ', $text);
		$text = preg_replace('/{.+?}/', '', $text);
		$text = preg_replace("'<(br[^/>]*?/|hr[^/>]*?/|/(div|h[1-6]|li|p|td))>'si", ' ', $text);

		$text = preg_replace('/(^[\r\n]*|[\r\n]+)[\s\t]*[\r\n]+/', ' ', $text);

		$text = preg_replace('/\s\s+/', ' ', $text);
		$text = preg_replace('/\n\n+/s', ' ', $text);
		$text = preg_replace('/\s/u', ' ', $text);

		$text = strip_tags($text);
        
        return $text;
    }
	
	static function getHandlerList($component) {
		static $handlers = array();
		
		if (!isset($handlers[$component])) {
			$extension_file = JPATH_MIJOSEARCH_ADMIN.'/extensions/'.$component.'.php';
			if (file_exists($extension_file)) {
				$handlers[$component][] = JHTML::_('select.option', 1, JText::_('COM_MIJOSEARCH_EXTENSIONS_VIEW_SELECT_EXTENSION'));
			}
			
			$plugin = self::findSearchPlugin($component);
			if ($plugin) {
				$handlers[$component][] = JHTML::_('select.option', 2, JText::_('COM_MIJOSEARCH_EXTENSIONS_VIEW_SELECT_PLUGIN'));
			}
			
			$handlers[$component][] = JHTML::_('select.option', 0, JText::_('COM_MIJOSEARCH_EXTENSIONS_VIEW_SELECT_DISABLE'));
		}
		
		return $handlers[$component];
	}
	
	static function findSearchPlugin($component) {
		jimport('joomla.plugin.helper');
		
		$plugin = substr($component, 4);
		
		$found = JPluginHelper::isEnabled('search', $plugin);
		
		if (!$found) {
			$plugin = $plugin.'search';
			$found = JPluginHelper::isEnabled('search', $plugin);
		}
		
		if (!$found) {
			$plugin = self::_fixSearchPlugin($component);
			$found = JPluginHelper::isEnabled('search', $plugin);
		}
		
		if (!$found) {
			return false;
		}
		
		return $plugin;
	}
	
	static function _fixSearchPlugin($component) {
		$com = '';
		
		switch($component) {
			case 'com_hikashop':
				$com = 'hikashop_products';
				break;
			case 'com_docindexer':
				$com = 'doc_indexer';
				break;
			default:
				$com = substr($component, 4);
				break;
		}
		
		return $com;
	}

	function getOptionFromRealURL($url) {
		$url = str_replace('&amp;', '&', $url);
		$url = str_replace('index.php?', '', $url);		
		parse_str($url, $vars);
		
		if (isset($vars['option'])) {
			return $vars['option'];
		}
		else {
			return '';
		}
	}
	
    function replaceLoop($search, $replace, $text) {
        $count = 0;
		
		if (!is_string($text)) {
			return $text;
		}
		
		while ((strpos($text, $search) !== false) && ($count < 10)) {
            $text = str_replace($search, $replace, $text);
			$count++;
        }

        return $text;
    }
	
	function storeConfig($MijosearchConfig) {
		$reg = new JRegistry($MijosearchConfig);
		$config = $reg->toString();
		
		$db = JFactory::getDBO();
		$db->setQuery('UPDATE #__extensions SET `params` = '.$db->Quote($config).' WHERE `element` = "com_mijosearch" AND `type` = "component"');
		$db->query();
	}
	
	function getParam($text, $param) {
		$params = new JRegistry($text);
		return $params->get($param);
	}
	
	function storeParams($table, $id, $db_field, $new_params) {
		$row = MijoSearch::getTable($table);
		if (!$row->load($id)) {
			return false;
		}
		
		$params = new JRegistry($row->$db_field);
		
		foreach ($new_params as $name => $value) {
			$params->set($name, $value);
		}
		
		$row->$db_field = $params->toString();
		
		if (!$row->check()) {
			return false;
		}
		
		if (!$row->store()) {
			return false;
		}
	}
	
	function setData($table, $id, $db_field, $new_field) {
		$row = MijoSearch::getTable($table);
		if (!$row->load($id)) {
			return false;
		}
		$row->$db_field = $new_field;	

		if (!$row->check()) {
			return false;
		}
		
		if (!$row->store()) {
			return false;
		}
	}

    public function getRadioList($name, $selected, $attrs = '') {
        if (empty($attrs)) {
            $attrs = 'class="inputbox" size="2"';
        }

        $arr = array(JHtml::_('select.option', 1, JText::_('JYES')), JHtml::_('select.option', 0, JText::_('JNO')));

        $output = JHtml::_('select.radiolist', $arr, $name, $attrs, 'value', 'text', (int) $selected, false);

        $html  = '<fieldset class="radio btn-group">';
        $html .= str_replace(array('<div class="controls">', '</div>'), '', $output);
        $html .= '</fieldset>';

        return $html;
    }
	
	static function checkPlugin() {
		if ((MIJOSEARCH_PACK == 'plus' || MIJOSEARCH_PACK == 'pro') && empty(MijoSearch::getConfig()->pid)) {
            $task = JRequest::getString('task');
            if($task == 'ajaxsearch'){
                exit();
            }
            return false;
		}
		
		return true;
	}
	
	static function getPlugin() {
		if (empty(MijoSearch::getConfig()->pid)) {
			$v = '<div style="text-align:center; font-size:9px; visibility:visible;" ';
			$v .= 'title="Jo'.'om'.'la Se'.'arch by Mi'.'jo'.'Se'.'arch"><a href="http://www.mi'.'jo'.'so'.'ft.com/jo'.'omla-exte'.'nsions/mi'.'jo'.'se'.'arch" ';
			$v .= 'target="_blank">Jo'.'om'.'la Sea'.'rch by Mi'.'jo'.'Sea'.'rch</a></div>';
			echo $v;
		}
	}
		
	function getRemoteData($url) {
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
			$fsock = @fsockopen($url_info['scheme'].'://'.$url_info['host'], 80, $errno, $errstr, 5);
		
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

    static function postXmlRequest($url, $path, $xml) {
        $response = '';
        
        if (function_exists('curl_init')) {
            // setup headers to be sent
            $header  = "POST {$path} HTTP/1.0 \r\n";
            $header .= "MIME-Version: 1.0 \r\n";
            $header .= "Content-type: text/xml; charset=utf-8 \r\n";
            $header .= "Content-length: ".strlen($xml)." \r\n";
            $header .= "Request-number: 1 \r\n";
            $header .= "Document-type: Request \r\n";
            $header .= "Connection: close \r\n\r\n";
            $header .= $xml;

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $header);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_TIMEOUT, 5);

            $response = curl_exec($ch);

            curl_close($ch);

            return $response;
        }
        elseif (function_exists('stream_context_create') && function_exists('file_get_contents')) {
            $options = array('http' =>
                array(
                    'method'  => 'POST',
                    'header'  => 'Content-type: application/x-www-form-urlencoded',
                    'content' => $data
                )
            );

            $context  = stream_context_create($options);

            $response = file_get_contents($url.$path, false, $context);
        }
        elseif (function_exists('fsockopen')) {
            $url = str_replace('https', 'http', $url);
            
            // parse the given URL
            $_url = parse_url($url.$path);

            if ($_url['scheme'] != 'http') {
                return $response;
            }

            // extract host and path:
            $host = $_url['host'];
            $path = $_url['path'];

            // open a socket connection on port 80 - timeout: 30 sec
            $fp = fsockopen($host, 80, $errno, $errstr, 30);

            if ($fp){

                // send the request headers:
                fputs($fp, "POST $path HTTP/1.1\r\n");
                fputs($fp, "Host: $host\r\n");

                if ($referer != '')
                    fputs($fp, "Referer: $referer\r\n");

                fputs($fp, "Content-type: application/x-www-form-urlencoded\r\n");
                fputs($fp, "Content-length: ". strlen($data) ."\r\n");
                fputs($fp, "Connection: close\r\n\r\n");
                fputs($fp, $data);

                $result = '';
                while(!feof($fp)) {
                    // receive the results of the request
                    $result .= fgets($fp, 128);
                }
            }
            else {
                return '';
            }

            // close the socket connection:
            fclose($fp);

            // split the result header from the content
            $result = explode("\r\n\r\n", $result, 2);

            $content = isset($result[1]) ? $result[1] : '';

            // return as structured array:
            return $content;
        }

        return $response;
    }
	
	// Get text from XML
	static function getXmlText($file, $variable) {
		static $xml = array();
		
		if (!isset($xml[$file])) {
			if (JFile::exists($file)) {
				$xml[$file] = simplexml_load_file($file);
			}
			else {
				$xml[$file] = new stdClass();
				$xml[$file]->$variable = null;
			}
		}
		
		return $xml[$file]->$variable;
    }
}