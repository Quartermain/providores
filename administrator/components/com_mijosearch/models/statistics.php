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

class MijosearchModelStatistics extends MijosearchModel {
	
	// Main constructer
	function __construct() {
		parent::__construct('statistics', 'search_results');
		
		$this->_getUserStates();
		$this->_buildViewQuery();
	}
	
	function _getUserStates(){
		$this->filter_order			= parent::_getSecureUserState($this->_option . '.' . $this->_context . '.filter_order',		'filter_order',		'keyword');
		$this->filter_order_Dir		= parent::_getSecureUserState($this->_option . '.' . $this->_context . '.filter_order_Dir',	'filter_order_Dir',	'ASC');
		$this->search_name			= parent::_getSecureUserState($this->_option . '.' . $this->_context . '.search_name', 		'search_name', 		'');
		$this->search_com			= parent::_getSecureUserState($this->_option . '.' . $this->_context . '.search_com', 		'search_com', 		'');
		$this->search_name 	 		= JString::strtolower($this->search_name);
		$this->search_com 	 		= JString::strtolower($this->search_com);
	}
	
	function getLists() {
		$lists = array();

		// Table ordering
		$lists['order_dir'] = $this->filter_order_Dir;
		$lists['order'] 	= $this->filter_order;
		
		// Reset filters
        $lists['reset_filters'] = '<input class="btn btn-primary" onclick="resetFilters();" value="'. JText::_('Reset') .'" style="margin-bottom: 10px !important; width: 35px;"  />';
	
		// Search name
        $lists['search_name'] = "<input type=\"text\" name=\"search_name\" value=\"{$this->search_name}\" size=\"40\" maxlength=\"255\" onchange=\"document.adminForm.submit();\" />";

		// Search component
        $lists['search_com'] = "<input type=\"text\" name=\"search_com\" value=\"{$this->search_com}\" size=\"20\" maxlength=\"255\" onchange=\"document.adminForm.submit();\" />";

		return $lists;
	}
	
	// Query filters
	function _buildViewWhere() {
		$where = array();
		
		// Search name
		if (!empty($this->search_name)) {
			$src = parent::secureQuery($this->search_name, true);
			$where[] = "LOWER(keyword) LIKE {$src}";
		}
		
		// Search component
		if (!empty($this->search_com)) {
			$src = parent::secureQuery($this->search_com, true);
			$where[] = "LOWER(extension) LIKE {$src}";
		}
		
		// Execute
		$where = (count($where) ? ' WHERE '. implode(' AND ', $where) : '');
	
		return $where;
	}
}