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
defined( '_JEXEC' ) or die( 'Restricted access' );

class MijosearchModelSearch extends MijosearchSearch {
	
	function __construct() {
		parent::__construct();
	}
	
	function getPagination(){
        if (empty($this->_pagination)) {
            jimport('joomla.html.pagination');
            $this->_pagination = new JPagination($this->getTotal(), $this->getState('limitstart'), $this->getState('limit'));
        
			$query = JRequest::getVar('query');
			$filter = JRequest::getVar('filter');
			$orderdir = JRequest::getVar('orderdir');
			$order = JRequest::getVar('order');
			$ext = JRequest::getVar('ext');
			
			$this->_pagination->setAdditionalUrlParam('option', 'com_mijosearch');
			$this->_pagination->setAdditionalUrlParam('view', 'search');
			
			if(!empty($query)){
				$this->_pagination->setAdditionalUrlParam('query', $query);
			}
			
			if(!empty($ext)){
				$this->_pagination->setAdditionalUrlParam('ext', $ext);
			}
			
			if(!empty($filter)){
				$this->_pagination->setAdditionalUrlParam('filter', $filter);
			}
			
			$this->_pagination->setAdditionalUrlParam('limitstart', $this->getState('limitstart'));
			$this->_pagination->setAdditionalUrlParam('limit', $this->getState('limit'));
			
			if(!empty($order)){
				$this->_pagination->setAdditionalUrlParam('order', $order);
			}
			if(!empty($orderdir)){
				$this->_pagination->setAdditionalUrlParam('orderdir', $orderdir);
			}
			
		}
		
        return $this->_pagination;
	}
}

