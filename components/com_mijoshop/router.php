<?php
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

//No Permision
defined('_JEXEC') or die('Restricted access');

require_once(JPATH_ROOT.'/components/com_mijoshop/mijoshop/mijoshop.php');

function MijoshopBuildRoute(&$query) {
	return MijoShop::get('router')->buildRoute($query);
}

function MijoshopParseRoute($segments) {
	return MijoShop::get('router')->parseRoute($segments);
}