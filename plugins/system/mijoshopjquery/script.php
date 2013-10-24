<?php
/*
* @package		MijoShop
* @copyright	2009-2013 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

// no direct access
defined('_JEXEC') or die('Restricted access');

class plgSystemMijoshopJqueryInstallerScript {

	public function install($parent) {
		$db	= JFactory::getDBO();
		$db->setQuery('UPDATE #__extensions SET enabled = 1 WHERE type = "plugin" AND folder = "system" AND element = "mijoshopjquery"');
		$db->query();
	}
	
	public function postFlight($route, $parent) {
		if (version_compare(JVERSION, '3.0.0', 'ge') == false) {
			return;
		}
		
		if (JFile::exists(JPATH_ROOT.'/plugins/system/mijoshopjquery/mijoshopjquery.xml')) {
			JFile::delete(JPATH_ROOT.'/plugins/system/mijoshopjquery/mijoshopjquery.xml');
		}
		
		$src = $parent->getParent()->getPath('source');

		JFile::move($src.'/mijoshopjquery_j3.xml', JPATH_ROOT.'/plugins/system/mijoshopjquery/mijoshopjquery.xml');
	}
}