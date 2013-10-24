<?php
/*
* @package		MijoSearch
* @subpackage	Menus
* @copyright	2009-2011 Mijosoft LLC, www.mijosoft.com
* @license		http://www.mijosoft.com/company/license
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

class MijoSearch_com_menus extends MijosearchExtension {

	public function getResults() {
		$results = self::_getItems();
		
		return $results;
	}

	protected function _getItems() {
        $statuss = parent::is16();

        if ($statuss) {
            $where = parent::getSearchFieldsWhere('alias:name');
            $name = "title AS name";
            $names = "title";
        }
        else {
            $where = parent::getSearchFieldsWhere('name');
            $name = "name";
            $names = "name";
        }

		if (empty($where)){
			return array();
		}
		
		if ($this->site) {
			$where[] = "published = 1";
            $where[] = "type NOT LIKE 'url'";

            if ($this->MijosearchConfig->access_checker == '1') {
                $where[] = parent::getAccessLevelsWhere('access');
            }
		}
		
		$where = (count($where) ? ' WHERE ' . implode(' AND ', $where) : '');
		
		$order_by = parent::getOrder(0, 0);
		
		$identifier = parent::getIdentifier();
		
		$relevance = parent::getRelevance(array('title' => $names));

		$query = "SELECT {$identifier}, {$relevance}, id, {$name}, link AS href".
		" FROM #__menu".
		" {$where}{$order_by}";
		
		return MijoDatabase::loadObjectList($query, '', 0, parent::getSqlLimit());
	}
	
	public function _getItemURL(&$item) {
        if ($this->site){
            $item->link = $item->href.'&Itemid='.$item->id;
        }
        else {
			if(parent::is16()){
				$item->link = 'index.php?option=com_menus&task=item.edit&id='.$item->id;
			}
			else {
				$item->link = 'index.php?option=com_menus&menutype=mainmenu&task=edit&cid[]='.$item->id;
			}
		}
	}
}