<?php
/*
* @package		MijoShop
* @copyright	2009-2013 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

class Language {
	private $default = 'english';
	private $directory;
	private $data = array();
 
	public function __construct($directory) {
		$this->directory = $directory;
	}
	
  	public function get($key) {
        $file_name  = $this->filename;
        $trace      = debug_backtrace();

        if (!empty($trace)) {
            $file_path  = $trace[0]['file'];
            $file_path  = str_replace('\\', '/', $file_path);
            $file_path  = str_replace('.php', '', $file_path);

            $as_file    = strpos($file_path, str_replace('/','\\',$file_name));
            $as_vqmod   = strpos($file_path, str_replace('/','_',$file_name));
            $is_system  = strpos($file_path, 'system');

            if ($as_file === false && $as_vqmod === false && $is_system === false) {
                if (strpos($file_path, 'vq2-') !== false){
                    $_file_name = strstr($file_path, 'vq2-');
                    $path_array = explode('_', $_file_name);
                    unset($path_array[0]);
                    unset($path_array[1]);
                    $file_name = implode('/', $path_array);
                }
                else {
                    $_file_name = strstr($file_path, 'opencart');
                    $path_array = explode('/', $_file_name);
                    unset($path_array[0]);
                    unset($path_array[1]);
                    $file_name = implode('/', $path_array);
                }
            }
        }

        $string = 'COM_MIJOSHOP_'.strtoupper(str_replace('/', '_', $this->filename)).'_'.strtoupper($key);
		$text = JText::_($string);

		if ( ($text == $string or $text == '??'. $string .'??') and !JFactory::getApplication()->isAdmin() and !(isset($_GET['view']) and $_GET['view'] == 'admin') ) {
            $string = 'COM_MIJOSHOP_'.strtoupper(str_replace('/', '_', $file_name)).'_'.strtoupper($key);
            $text = JText::_($string);
        }
		
        if (isset($path_array[2]) and $path_array[2] == 'checkout' and ($text == $string or $text == '??'. $string .'??')) {
            $string = 'COM_MIJOSHOP_'.strtoupper(str_replace('/', '_', 'checkout/checkout')).'_'.strtoupper($key);
            $text = JText::_($string);
        }

        if ($text == $string or $text == '??'. $string .'??') {
            $string = 'COM_MIJOSHOP_'.strtoupper($key);
			$text = JText::_($string);
        }
		
		if (($text != $string) and ($text != '??'. $string .'??')) {
			return $text;
		}
        
   		return (isset($this->data[$key]) ? $this->data[$key] : $key);
  	}
	
	public function load($filename) {
        $this->filename = $filename;

        $file = DIR_LANGUAGE . $this->default . '/' . $filename . '.php';
        if (file_exists($file)) {
            $_ = array();

            global $vqmod;
			require($vqmod->modCheck($file));

            $this->data = array_merge($this->data, $_);
        }

		$file = DIR_LANGUAGE . $this->directory . '/' . $filename . '.php';
		if (file_exists($file)) {
			$_ = array();

			global $vqmod;
			require($vqmod->modCheck($file));

			$this->data = array_merge($this->data, $_);
		}

        return $this->data;
  	}
}
?>