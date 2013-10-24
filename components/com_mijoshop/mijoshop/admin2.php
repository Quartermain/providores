<?php
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

// no direct access
defined('_JEXEC') or die('Restricted access');

require_once(JPATH_ROOT.'/components/com_mijoshop/mijoshop/mijoshop.php');

$base = MijoShop::get('base');
$document = JFactory::getDocument();
$mainframe = JFactory::getApplication();

if (!$base->checkRequirements('admin2')) {
    return;
}

$document->addStyleSheet('administrator/components/com_mijoshop/assets/css/mijoshop.css');

JRequest::setVar('view', 'admin');

$_lang = JFactory::getLanguage();
$_lang->load('com_mijoshop', JPATH_ADMINISTRATOR, 'en-GB', true);
$_lang->load('com_mijoshop', JPATH_ADMINISTRATOR, $_lang->getDefault(), true);
$_lang->load('com_mijoshop', JPATH_ADMINISTRATOR, null, true);

if (isset($_GET['token'])) {
	$_SESSION['token'] = $_GET['token'];
}

if (isset($_SESSION['token']) && !isset($_GET['token'])) {
	$_GET['token'] = $_SESSION['token'];
}

ob_start();
require_once(JPATH_MIJOSHOP_OC.'/admin/index.php');
$output = ob_get_contents();
ob_end_clean();

$output = MijoShop::get('base')->replaceOutput($output, 'admin2');

echo $output;

if (MijoShop::get('base')->isAjax($output) == true) {
	jexit();
}