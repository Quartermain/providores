<?php
/**
* @package		MijoSearch
* @copyright	2009-2012 Mijosoft LLC, www.mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

//No Permision
defined( '_JEXEC' ) or die( 'Restricted access' );

// Access check
if (!JFactory::getUser()->authorise('core.manage', 'com_mijosearch')) {
	return JError::raiseWarning(404, JText::_('JERROR_ALERTNOAUTHOR'));
}

JHTML::_('behavior.framework');

$lang = JFactory::getLanguage();
$lang->load('com_mijosearch', JPATH_ADMINISTRATOR, 'en-GB', true);
$lang->load('com_mijosearch', JPATH_ADMINISTRATOR, $lang->getDefault(), true);
$lang->load('com_mijosearch', JPATH_ADMINISTRATOR, null, true);
$lang->load('com_mijosearch', JPATH_SITE, 'en-GB', true);
$lang->load('com_mijosearch', JPATH_SITE, $lang->getDefault(), true);
$lang->load('com_mijosearch', JPATH_SITE, null, true);

require_once(JPATH_ADMINISTRATOR.'/components/com_mijosearch/library/mijosearch.php');

JLoader::register('MijosearchController', JPATH_MIJOSEARCH_ADMIN.'/library/controller.php');
JLoader::register('MijosearchModel', JPATH_MIJOSEARCH_ADMIN.'/library/model.php');
JLoader::register('MijosearchView', JPATH_MIJOSEARCH_ADMIN.'/library/view.php');

require_once(JPATH_MIJOSEARCH_ADMIN.'/toolbar.php');

JTable::addIncludePath(JPATH_COMPONENT.'/tables');

if ($controller = JRequest::getCmd('controller')){
	$path = JPATH_COMPONENT.'/controllers/'.$controller.'.php';
	
	if (file_exists($path)) {
	    require_once($path);
	} else {
	    $controller = '';
	}
}

$classname = 'MijosearchController'.$controller;

$controller = new $classname();
$controller->execute(JRequest::getCmd('task'));
$controller->redirect();
