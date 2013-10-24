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

if (!$base->checkRequirements('site')) {
    return;
}

$view = JRequest::getCmd('view');
$route = JRequest::getString('route');

if (empty($route)) {
    $_route = MijoShop::get('router')->getRoute($view);
	
    $route = $_route;
	JRequest::setVar('route', $_route);
	JRequest::setVar('route', $_route, 'get');
}

ob_start();
require_once(JPATH_MIJOSHOP_OC.'/index.php');
$output = ob_get_contents();
ob_end_clean();

$output = $base->replaceOutput($output, 'site');

echo $output;

if ($base->isAjax($output) == true) {
	jexit();
}

$base->loadPathway($route);