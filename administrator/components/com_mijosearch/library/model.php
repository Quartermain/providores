<?php
/**
 * @package		MijoSearch
 * @copyright	2009-2013 Mijosoft LLC, www.mijosoft.com
 * @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
 * @license		2009-2012 GNU/GPL based on AceSearch www.joomace.net
 */

// No Permission
defined('_JEXEC') or die('Restricted access');

jimport('joomla.application.component.model');

if (!class_exists('MijosoftModel')) {
	if (interface_exists('JModel')) {
		abstract class MijosoftModel extends JModelLegacy {}
	}
	else {
		class MijosoftModel extends JModel {}
	}
}

class MijosearchModel extends MijosoftModel {
	
	public $_query;
	public $_data = null;
	public $_total = null;
	public $_pagination = null;
	public $_context;
	public $_mainframe;
	public $_option;
	public $_table;
	
	public function __construct($context = '', $table = '') 	{
		parent::__construct();
		
		// Get config object
		$this->MijosearchConfig = MijoSearch::getConfig();
		
		// Get global vars
		$this->_mainframe = JFactory::getApplication();
		if ($this->_mainframe->isAdmin()) {
			$this->_option = JAdministratorHelper::findOption();
		} else {
			$this->_option = JRequest::getCmd('option');
		}
		$this->_context = $context;
		
		$this->_table = $table;
		if ($table == '' && $this->_context != '') {
			$this->_table = $this->_context;
		}
		
		// Pagination
		if ($this->_context != '') {
			// Get the pagination request variables
			$limit		= $this->_mainframe->getUserStateFromRequest($this->_option . '.' . $this->_context . '.limit', 'limit', $this->_mainframe->getCfg('list_limit'), 'int');
			$limitstart	= $this->_mainframe->getUserStateFromRequest($this->_option . '.' . $this->_context . '.limitstart', 'limitstart', 0, 'int');
			
			// Limit has been changed, adjust it
			$limitstart = ($limit != 0 ? (floor($limitstart / $limit) * $limit) : 0);
			
			$this->setState($this->_option . '.' . $this->_context . '.limit', $limit);
			$this->setState($this->_option . '.' . $this->_context . '.limitstart', $limitstart);
		}
	}
	
	public function _buildViewQuery() {
		$where = $this->_buildViewWhere();
		$orderby = "";
		if (!empty($this->filter_order) && !empty($this->filter_order_Dir)) {
			$orderby	= " ORDER BY {$this->filter_order} {$this->filter_order_Dir}";
		}
		
		$this->_query = "SELECT * FROM #__mijosearch_{$this->_table} {$where}{$orderby}";
	}
	
	public function getItems() {
		if (empty($this->_data)) {
		
			$this->_data = $this->_getList($this->_query, $this->getState($this->_option.'.' . $this->_context . '.limitstart'), $this->getState($this->_option.'.' . $this->_context . '.limit'));
		}
		
		return $this->_data;
	}
	
	public function getPagination() {
		if (empty($this->_pagination)) {
			jimport('joomla.html.pagination');
			$this->_pagination = new JPagination($this->getTotal(), $this->getState($this->_option.'.' . $this->_context . '.limitstart'), $this->getState($this->_option.'.' . $this->_context . '.limit'));
		}
		
		return $this->_pagination;
	}
	
	public function getTotal() {
		if (empty($this->_total)) {			
			$this->_total = MijoDatabase::loadResult("SELECT COUNT(*) FROM #__mijosearch_{$this->_table}".$this->_buildViewWhere());	
		}
		
		return $this->_total;
	}
	
	public function getEditData($table) {
		// Get vars
		$cid = JRequest::getVar('cid', array(0), 'method', 'array');
		$id = $cid[0];
		
		// Load the record
		if (is_numeric($id)) {
			$row = MijoSearch::getTable($table); 
			$row->load($id);
		}
	
		return $row;
	}
	
	public function secureQuery($text, $all = false) {
		static $db;
		
		if (!isset($db)) {
			$db = JFactory::getDBO();
		}
		
		$text = $db->escape($text, true);
		
		if ($all) {
			$text = $db->Quote("%".$text."%", false);
		} else {
			$text = $db->Quote($text, false);
		}
		
		return $text;
	}
	
	public function _getSecureUserState($long_name, $short_name, $default = null, $type = 'none') {
		$request = $this->_mainframe->getUserStateFromRequest($long_name, $short_name, $default, $type);
		
		if (is_string($request)) {
			$request = strip_tags(str_replace('"', '', $request));
		}
		return $request;
	}
}