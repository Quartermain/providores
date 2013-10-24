<?php
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

// No Permission
defined('_JEXEC') or die ('Restricted access');

$main_full_url = MijoShop::getClass()->getFullUrl();
$j_config = MijoShop::getClass()->getJConfig();

define("HTTP_SERVER_TEMP", $main_full_url);

define("DIR_APPLICATION", JPATH_MIJOSHOP_OC.'/catalog/');
define("DIR_SYSTEM", JPATH_MIJOSHOP_OC.'/system/');
define("DIR_DATABASE", JPATH_MIJOSHOP_OC.'/system/database/');
define("DIR_LANGUAGE", JPATH_MIJOSHOP_OC.'/catalog/language/');
define("DIR_TEMPLATE", JPATH_MIJOSHOP_OC.'/catalog/view/theme/');
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