<?php
/*
* @package		MijoShop
* @copyright	2009-2013 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

// no direct access
defined('_JEXEC') or die('Restricted access');

require_once(JPATH_ROOT.'/components/com_mijoshop/mijoshop/mijoshop.php');

$ctrl = JRequest::getWord('ctrl');
$view = JRequest::getString('view');
$route = JRequest::getString('route');

$base = MijoShop::get('base');
$document = JFactory::getDocument();
$mainframe = JFactory::getApplication();
$toolbar = JToolBar::getInstance('toolbar');

if (!$base->checkRequirements('admin')) {
    return;
}

$document->addStyleSheet('components/com_mijoshop/assets/css/mijoshop.css');
JToolBarHelper::title(JText::_('MijoShop'), 'mijoshop');

$installed_ms_version = $base->getMijoshopVersion();
$latest_ms_version = $base->getLatestMijoshopVersion();
$ms_version_status = version_compare($installed_ms_version, $latest_ms_version);

if ($base->is30()) {
	$admin_path = $mainframe->isAdmin() ? '' : 'administrator/';
	$document->addStyleSheet($admin_path.'components/com_mijoshop/assets/css/joomla3.css');
	
    if (JFactory::getUser()->authorise('core.admin', 'com_mijoshop')) {
        JToolBarHelper::preferences('com_mijoshop', '550');
        JToolBarHelper::divider();
    }

    $toolbar->appendButton('Popup', 'changelog', JText::_('COM_MIJOSHOP_CHANGELOG'), 'http://mijosoft.com/joomla-extensions/mijoshop/changelog?format=raw&tmpl=component', 650, 390);

    $oc_version_info = '<span style="vertical-align:middle; margin-left: 100px; font-size: 12px;"><strong>OpenCart</strong>: '.$base->getOcVersion().'</span>';
    $toolbar->appendButton('Custom', $oc_version_info);
	
    $ms_version_info = '<span style="vertical-align:middle; margin-left: 50px; font-size: 12px;"><strong>MijoShop (Installed)</strong>: '.$installed_ms_version.'</span>';
    $toolbar->appendButton('Custom', $ms_version_info);

    $latest_version_text = ($ms_version_status == -1) ? '<a href="index.php?option=com_mijoshop&route=common/upgrade&token=' .$_SESSION['token']. '" style="padding: 0px !important;"><strong style="color: #ff0000;">MijoShop (Latest): '.$latest_ms_version.'</strong></a>' : '<strong>MijoShop (Latest)</strong>: '.$latest_ms_version;
    $ms_version_info = '<span style="vertical-align:middle; margin-left: 50px; font-size: 12px;">'.$latest_version_text.'</span>';
    $toolbar->appendButton('Custom', $ms_version_info);
}
else {
    $margin_info = "12";
    $oc_margin_info = $margin_info + 7;

    $oc_version_info = '<span style="width:110px;text-align:left;float:left;vertical-align:middle;margin-top:'.$oc_margin_info.'px;"><strong>OpenCart</strong>: '.$base->getOcVersion().'</span>';
    $toolbar->appendButton('Custom', $oc_version_info);

    $latest_version_text = ($ms_version_status == -1) ? '<a href="index.php?option=com_mijoshop&route=common/upgrade&token=' .$_SESSION['token']. '" style="padding: 0px !important;"><strong style="color: #ff0000;">MijoShop (Latest): '.$latest_ms_version.'</strong></a>' : '<strong>MijoShop (Latest)</strong>: '.$latest_ms_version;
    $ms_version_info = '<span style="width:200px;text-align:left;float:left;vertical-align:middle;margin-top:'.$margin_info.'px;"><strong>MijoShop (Install)</strong>: '.$installed_ms_version.'<br />'.$latest_version_text.'</span>';
    $toolbar->appendButton('Custom', $ms_version_info);

    if (JFactory::getUser()->authorise('core.admin', 'com_mijoshop')) {
        JToolBarHelper::preferences('com_mijoshop', '550');
        JToolBarHelper::divider();
    }

    JToolBar::getInstance('toolbar')->appendButton('Popup', 'changelog', JText::_('COM_MIJOSHOP_CHANGELOG'), 'http://mijosoft.com/joomla-extensions/mijoshop/changelog?format=raw&tmpl=component', 650, 500);
}

if ($view == 'upgrade') {
	$mainframe->redirect('index.php?option=com_mijoshop&route=common/upgrade', '', '');
}
else if ($view == 'support') {
	$mainframe->redirect('index.php?option=com_mijoshop&route=common/support', '', '');
}

$redirected = JFactory::getSession()->get('mijoshop.login.redirected');
if (empty($ctrl) && !$redirected && ($base->getConfig()->get('account_sync_done', 0) == 0)) {
    JError::raiseWarning('100', JText::sprintf('COM_MIJOSHOP_ACCOUNT_SYNC_WARN', '<a href="index.php?option=com_mijoshop&ctrl=sync">', '</a>'));
}

$pid = $base->getConfig()->get('pid');
if(empty($pid)){
    JError::raiseWarning('100', JText::sprintf('COM_MIJOSHOP_CPANEL_PID_NOTE', '<a href="http://mijosoft.com/my-profile">', '</a>', '<a href="index.php?option=com_mijoshop&route=setting/setting">', '</a>'));
}

$redirected = JFactory::getSession()->get('mijoshop.login.redirected');
if (empty($ctrl) && !$redirected && (MijoShop::get('db')->isDbSync() == false)) {
    JError::raiseWarning('100', JText::sprintf('COM_MIJOSHOP_DB_SYNC_WARN', '<a href="index.php?option=com_mijoshop&ctrl=dbchar">', '</a>'));
}

if ($ctrl == 'sync') {
    MijoShop::get('user')->synchronizeAccountsManually();
}

if ($ctrl == 'dbchar') {
    MijoShop::get('db')->convertToGenaral_ci();
}

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

$output = $base->replaceOutput($output, 'admin');

echo $output;

if ($base->isAjax($output) == true) {
	jexit();
}