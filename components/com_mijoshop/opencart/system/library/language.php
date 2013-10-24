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
   		return (isset($this->data[$key]) ? $this->data[$key] : $key);
  	}
	
	public function load($filename) {
		$file = DIR_LANGUAGE . $this->directory . '/' . $filename . '.php';
    	
		if (file_exists($file)) {
			$_ = array();
	  		
			require($file);
		
			$this->data = array_merge($this->data, $_);
		}
		
		$file = DIR_LANGUAGE . $this->default . '/' . $filename . '.php';
		
		if (file_exists($file)) {
			$_ = array();
	  		
			require($file);
		
			$this->data = array_merge($this->data, $_);
		} else {
			trigger_error('Error: Could not load language ' . $filename . '!');
			exit();
		}
  	}
}
?>