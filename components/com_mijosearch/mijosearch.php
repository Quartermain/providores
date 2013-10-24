<?php
/**
 * @package		MijoSearch
 * @copyright	2009-2013 Mijosoft LLC, www.mijosoft.com
 * @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
 * @license		2009-2012 GNU/GPL based on AceSearch www.joomace.net
 */

//No Permision
defined('_JEXEC') or die('Restricted access');

// Includes
require_once(JPATH_COMPONENT.'/controller.php');
require_once(JPATH_ADMINISTRATOR.'/components/com_mijosearch/library/mijosearch.php');

$lang = JFactory::getLanguage();
$lang->load('com_mijosearch', JPATH_SITE, 'en-GB', true);
$lang->load('com_mijosearch', JPATH_SITE, $lang->getDefault(), true);
$lang->load('com_mijosearch', JPATH_SITE, null, true);

if (!MijoSearch::get('utility')->checkPlugin()) {
	return;
}

$controller = new MijoSearchController();

// Perform the Request task
$controller->execute(JRequest::getWord('task'));

$format = JRequest::getWord('format');
if ($format != 'raw') {
	MijoSearch::get('utility')->getPlugin();
}

// Redirect if set by the controller
$controller->redirect();
