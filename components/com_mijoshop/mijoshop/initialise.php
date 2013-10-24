<?php
/**
 * @package		MijoShop
 * @copyright	2009-2013 Mijosoft LLC, mijosoft.com
 * @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
 */
# No Permission
defined('_JEXEC') or die('Restricted Access');

define('JPATH_MIJOSHOP_OC', JPATH_SITE.'/components/com_mijoshop/opencart');
define('JPATH_MIJOSHOP_LIB', JPATH_SITE.'/components/com_mijoshop/mijoshop');
define('JPATH_MIJOSHOP_SITE', JPATH_SITE.'/components/com_mijoshop');
define('JPATH_MIJOSHOP_ADMIN', JPATH_SITE.'/administrator/components/com_mijoshop');

if (JFactory::$application->isAdmin()) {
    $_side = JPATH_ADMINISTRATOR;
}
else {
    $_side = JPATH_SITE;
}

$_lang = JFactory::getLanguage();
$_lang->load('com_mijoshop', $_side, 'en-GB', true);
$_lang->load('com_mijoshop', $_side, $_lang->getDefault(), true);
$_lang->load('com_mijoshop', $_side, null, true);

$_lang = JFactory::getLanguage();
$_lang->load('com_mijoshop.old', JPATH_ADMINISTRATOR, 'en-GB', true);
$_lang->load('com_mijoshop.old', JPATH_ADMINISTRATOR, $_lang->getDefault(), true);
$_lang->load('com_mijoshop.old', JPATH_ADMINISTRATOR, null, true);