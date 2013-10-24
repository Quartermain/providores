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

if (MijoShop::get('base')->isAdmin()) {
    require_once(JPATH_MIJOSHOP_LIB.'/admin2.php');
}
else {
    require_once(JPATH_MIJOSHOP_LIB.'/site.php');
}
