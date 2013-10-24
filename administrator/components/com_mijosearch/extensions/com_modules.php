<?php
/*
* @package		MijoSearch
* @subpackage	Modules
* @copyright	2009-2011 Mijosoft LLC, www.mijosoft.com
* @license		http://www.mijosoft.com/company/license
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

class MijoSearch_com_modules extends MijosearchExtension {

	public function getResults() {
		$results = self::_getItems();
		
		return $results;
	}

	protected function _getItems() {
		$where = parent::getSearchFieldsWhere('title:name');
		if (empty($where)){
			return array();
		}
		
		$where = (count($where) ? ' WHERE ' . implode(' AND ', $where): '');
		
		$order_by = parent::getOrder(0, 0);
		
		$identifier = parent::getIdentifier();
		
		$relevance = parent::getRelevance(array('title' => 'title'));
		
		$query = "SELECT {$identifier}, {$relevance}, id, title as name, client_id".
		" FROM #__modules".
		" {$where}{$order_by}";
		
		return MijoDatabase::loadObjectList($query, '', 0, parent::getSqlLimit());
	}
	
	public function _getItemURL(&$item) {
        if ($this->admin) {
            if (parent::is16()) {
                $item->link = 'index.php?option=com_modules&task=module.edit&id='.$item->id;
            }
            else{
                $item->link = 'index.php?option=com_modules&client='.$item->client_id.'&task=edit&cid[]='.$item->id;
            }
        }
    }
}