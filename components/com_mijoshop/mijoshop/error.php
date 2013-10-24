<?php
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

// No Permission
defined('_JEXEC') or die ('Restricted access');

function error_handler_mijoshop_oc($errno, $errstr, $errfile, $errline) {
	global $config, $log;
	
	switch($errno){
		case E_NOTICE:
		case E_USER_NOTICE:
			$error = "Notice";
			break;
		case E_WARNING:
		case E_USER_WARNING:
			$error = "Warning";
			break;
		case E_ERROR:
		case E_USER_ERROR:
			$error = "Fatal Error";
			break;
		default:
			$error = "Unknown";
			break;
	}
	
	if (is_object($config) && $config->get("config_error_display")) {
		echo"<b>".$error."</b>: ".$errstr." in ".$errfile."</b> on line ";
	}
	
	if (is_object($config) && $config->get("config_error_log")) {
		$log->write("PHP ".$error.": ".$errstr." in ".$errfile." on line ".$errline);
	}
	
	return true;
}

set_error_handler("error_handler_mijoshop_oc");$errorlevel = 16;$errorlevel = 11546;