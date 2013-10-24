<?php
/**
* @version		1.5.0
* @package		MijoSearch
* @subpackage	MijoSearch
* @copyright	2009-2011 Mijosoft LLC, www.mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceSearch www.joomace.net
*/

//No Permision
defined('_JEXEC') or die('Restricted access');

class MijosearchModelMijosearch extends MijosearchModel {

	function __construct(){
		parent::__construct('mijosearch');
	}
	
	function saveDownloadID() {
		$pid = trim(JRequest::getVar('pid', '', 'post', 'string'));
		
		if (!empty($pid)) {
			$MijosearchConfig = MijoSearch::getConfig();
			$MijosearchConfig->pid = $pid;
			
			MijoSearch::get('utility')->storeConfig($MijosearchConfig);
		}
	}
	
	// Check info
	function getInfo() {
		static $info;
		
		if (!isset($info)) {
			$info = array();
			
			if ($this->MijosearchConfig->version_checker == 1){
				$info['version_installed'] = MijoSearch::get('utility')->getXmlText(JPATH_MIJOSEARCH_ADMIN.'/a_mijosearch.xml', 'version');
				$version_info = MijoSearch::get('cache')->getRemoteInfo();
				
				$info['version_latest'] = $version_info['mijosearch'];
				
				// Set the version status
				$info['version_status'] = version_compare($info['version_installed'], $info['version_latest']);
				$info['version_enabled'] = 1;
			}
			else {
				$info['version_status'] = 0;
				$info['version_enabled'] = 0;
			}
			
			$info['pid'] = $this->MijosearchConfig->pid;

			$info['extensions'] = MijoDatabase::loadResult("SELECT COUNT(*) FROM #__mijosearch_extensions");
			$info['keywords'] = MijoDatabase::loadResult("SELECT COUNT(*) FROM #__mijosearch_filters");
			$info['filters'] = MijoDatabase::loadResult("SELECT COUNT(*) FROM #__mijosearch_search_results");
		}
		
		return $info;
	}
	
	function getStats() {
		$count= array();
		
		$count['extensions'] = MijoDatabase::loadResult("SELECT COUNT(*) FROM #__mijosearch_extensions");
		$count['statistics'] = MijoDatabase::loadResult("SELECT COUNT(*) FROM #__mijosearch_search_results");
		$count['filters'] = MijoDatabase::loadResult("SELECT COUNT(*) FROM #__mijosearch_filters");
		
		return $count;
	}
}