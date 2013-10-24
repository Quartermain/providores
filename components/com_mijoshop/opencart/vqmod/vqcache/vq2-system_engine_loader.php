<?php
/*
* @package		MijoShop
* @copyright	2009-2013 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

final class Loader {
	protected $registry;
    protected $language;
	
	public function __construct($registry) {
		$this->registry = $registry;
	}
	

    public function __get($key) {
		return $this->registry->get($key);
	}

	public function __set($key, $value) {
		$this->registry->set($key, $value);
	}
            
	public function library($library) {
		$file = DIR_SYSTEM . 'library/' . $library . '.php';
		
global $vqmod; $file = $vqmod->modCheck($file);
		if (file_exists($file)) {
			include_once($file);
		} else {
			trigger_error('Error: Could not load library ' . $library . '!');
			exit();					
		}
	}
	
	public function helper($helper) {
		$file = DIR_SYSTEM . 'helper/' . $helper . '.php';
		
global $vqmod; $file = $vqmod->modCheck($file);
		if (file_exists($file)) {
			include_once($file);
		} else {
			trigger_error('Error: Could not load helper ' . $helper . '!');
			exit();					
		}
	}
		
	public function model($model) {
		$file  = DIR_APPLICATION . 'model/' . $model . '.php';
		$class = 'Model' . preg_replace('/[^a-zA-Z0-9]/', '', $model);
		
global $vqmod; $file = $vqmod->modCheck($file);
		if (file_exists($file)) {
			include_once($file);
			
			$this->registry->set('model_' . str_replace('/', '_', $model), new $class($this->registry));
		} else {
			trigger_error('Error: Could not load model ' . $model . '!');
			exit();					
		}
	}
	 
	public function database($driver, $hostname, $username, $password, $database) {
		$file  = DIR_SYSTEM . 'database/' . $driver . '.php';
		$class = 'Database' . preg_replace('/[^a-zA-Z0-9]/', '', $driver);
		
global $vqmod; $file = $vqmod->modCheck($file);
		if (file_exists($file)) {
			include_once($file);
			
			$this->registry->set(str_replace('/', '_', $driver), new $class($hostname, $username, $password, $database));
		} else {
			trigger_error('Error: Could not load database ' . $driver . '!');
			exit();				
		}
	}
    public function config($config) {
        MijoShop::get('opencart')->get('config')->load($config);
    }

    public function language($language) {
        return MijoShop::get('opencart')->get('language')->load($language);
    }
            
} 
?>