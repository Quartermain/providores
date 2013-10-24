<?php
/**
* @version		1.5.0
* @package		MijoSearch
* @subpackage	MijoSearch
* @copyright	2009-2011 Mijosoft LLC, www.mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceSearch www.joomace.net
*/

// No Permission
defined('_JEXEC') or die('Restricted Access');

// Model Class
class MijosearchModelPurge extends MijosearchModel {
	
	// Main constructer
	function __construct() {
        parent::__construct('purge');
    }
	
	// Clean Cache
    function cleanCache() {
		$cache = MijoSearch::getCache();
		$rt = false;
		
		// Get selections
		$cache_versions		= JRequest::getInt('cache_versions', 0, 'post');
		$cache_extensions	= JRequest::getInt('cache_extensions', 0, 'post');
		
		if ($cache_versions) {
			$cache->remove('versions');
			$rt = true;
		}
		
		if ($cache_extensions) {
			$cache->remove('extensions');
			$rt = true;
		}
		
		return $rt;
    }
    
	// Count cache
    function getCountCache() {
		$cache = MijoSearch::getCache();
		
		$count = array();
		$items = array('versions', 'extensions');
		
		foreach ($items as $item) {
			$contents = $cache->load($item);
			if (!empty($contents)) {
				$count[$item] = count($contents);
			} else {
				$count[$item] = 0;
			}
		}
		
		return $count;
    }
}