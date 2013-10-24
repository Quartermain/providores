<?php
/**
 * @package		MijoSearch
 * @copyright	2009-2013 Mijosoft LLC, www.mijosoft.com
 * @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
 * @license		2009-2012 GNU/GPL based on AceSearch www.joomace.net
 */

//No Permision
defined( '_JEXEC' ) or die( 'Restricted access' );

require_once(JPATH_ADMINISTRATOR.'/components/com_mijosearch/library/mijosearch.php');

function MijosearchBuildRoute(&$query){

	$segments = array();

	if (isset($query['view'])) {
		require_once(JPATH_ADMINISTRATOR . '/components/com_mijosearch/library/utility.php');
		require_once(JPATH_ADMINISTRATOR . '/components/com_mijosearch/library/mijosearch.php');
		$Itemid = MijoSearch::get('utility')->getItemid();
		
		if (empty($Itemid) || $query['view'] == 'advancedsearch') {
			$sef = new MijosearchSefPrefix();
			
			if ($sef->addPrefix()) {
				$segments[] = 'mijosearch';
			}
			
			$segments[] = $query['view'];
		}
		
		unset($query['view']);
	}

	return $segments;
}

function MijosearchParseRoute($segments) {
	$vars = array();

	if (!empty($segments[0])) {
		$sef = new MijosearchSefPrefix();
		
		if ($sef->addPrefix()) {
			$vars['view'] = $segments[1];
		}
		else {
			$vars['view'] = $segments[0];
		}
	}
	else {
		$vars['view'] = 'search';
	}

	return $vars;
}

class MijosearchSefPrefix {

	function addPrefix() {
		$mijosef = JPATH_ADMINISTRATOR . '/components/com_mijosef/a_mijosef.xml';
		if (!file_exists($mijosef)) {
			return false;
		}
		
		return self::mijosef();
	}

	function mijosef() {
		require_once(JPATH_ADMINISTRATOR . '/components/com_mijosef/library/loader.php');
		
		$this->MijosefConfig = MijosefFactory::getConfig();
		$cache = MijosefFactory::getCache();
		
		$params = $cache->getExtensionParams('com_mijosearch');
		
		if (($params->get('prefix', '') != '')) {
			return false;
		}
		
		return true;
	}
}