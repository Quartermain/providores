<?php
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

// No Permission
defined('_JEXEC') or die ('Restricted access');

$main_full_url = MijoShop::getClass('base')->getFullUrl();
$j_config = MijoShop::getClass('base')->getJConfig();

$_suffix = 'administrator/';
if (MijoShop::getClass()->isAdmin()) {
    $_suffix = '';
}

// HTTP
define("HTTP_SERVER", $main_full_url.$_suffix);
define('HTTP_CATALOG', $main_full_url);
define("HTTP_IMAGE", $main_full_url.'components/com_mijoshop/opencart/image/');

// HTTPS
define("HTTPS_SERVER", $main_full_url.$_suffix);
define('HTTPS_CATALOG', $main_full_url);
define("HTTPS_IMAGE", $main_full_url.'components/com_mijoshop/opencart/image/');

define("HTTP_SERVER_TEMP", $main_full_url);

// DIR
define("DIR_APPLICATION", JPATH_MIJOSHOP_OC.'/admin/');
define("DIR_SYSTEM", JPATH_MIJOSHOP_OC.'/system/');
define("DIR_DATABASE", JPATH_MIJOSHOP_OC.'/system/database/');
define("DIR_LANGUAGE", JPATH_MIJOSHOP_OC.'/admin/language/');
define("DIR_TEMPLATE", JPATH_MIJOSHOP_OC.'/admin/view/template/');
define("DIR_CONFIG", JPATH_MIJOSHOP_OC.'/system/config/');
define("DIR_IMAGE", JPATH_MIJOSHOP_OC.'/image/');
define("DIR_CACHE", JPATH_ROOT.'/cache/com_mijoshop/');
define("DIR_DOWNLOAD", JPATH_MIJOSHOP_OC.'/download/');
define("DIR_LOGS", JPATH_MIJOSHOP_OC.'/system/logs/');
define("DIR_CATALOG", JPATH_MIJOSHOP_OC.'/catalog/');

// DB
define("DB_DRIVER", 'mysql');
define("DB_HOSTNAME", MijoShop::getClass('db')->getDbAttribs('host'));
define("DB_USERNAME", MijoShop::getClass('db')->getDbAttribs('user'));
define("DB_PASSWORD", MijoShop::getClass('db')->getDbAttribs('password'));
define("DB_DATABASE", MijoShop::getClass('db')->getDbAttribs('database'));
define("DB_PREFIX", MijoShop::getClass('db')->getDbAttribs('prefix').'mijoshop_');