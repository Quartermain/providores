<?php
/*
* @package		MijoSearch
* @subpackage	Plugins
* @copyright	2009-2011 Mijosoft LLC, www.mijosoft.com
* @license		http://www.mijosoft.com/company/license
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

class MijoSearch_com_plugins extends MijosearchExtension{

	public function getResults() {
		$results = self::_getItems();
		
		return $results;
	}

	protected function _getItems() {
        if (parent::is16()) {
			$query 		= parent::getSearchQuery('query');   
			$exact 		= parent::getSearchQuery('exact');
			$all 		= parent::getSearchQuery('all');
			$any 		= parent::getSearchQuery('any');
			
			if (!empty($all)) {
				$q = $all;
			}
			elseif (!empty($exact)) {
				$q = $exact;
			}
			elseif (!empty($query)) {
				$q = $query;
			}
			elseif (!empty($any)) {
				$q = $any;
			}
		
			$items = array();
            $lang = JFactory::getLanguage();
			
            $rows = MijoDatabase::loadObjectList("SELECT name, extension_id AS id FROM #__extensions WHERE type = 'plugin' ORDER BY name");
			
			$c = count($rows);
            for($i = 0; $i < $c; $i++) {
				$row = $rows[$i];
				
                $lang->load($row->name, JPATH_ADMINISTRATOR);
                $lang->load($row->name.'.sys', JPATH_ADMINISTRATOR);
				
                $title = JText::_($row->name);
				
				if (stristr($title, $q)) {
					$items[$i] = new stdClass();
					$items[$i]->mijosearch_ext = 'com_plugins';
					$items[$i]->mijosearch_type = 'Item';
					$items[$i]->name = $title;
					$items[$i]->id = $row->id;
				}
            }

            return $items;
        }
        else {
            $where = parent::getSearchFieldsWhere('element:name');
            if (empty($where)){
                return array();
            }

            $where = (count($where) ? ' WHERE ' . implode(' AND ', $where) : '');

			$order_by = parent::getOrder();

            $identifier = parent::getIdentifier();
		
			$relevance = parent::getRelevance(array('title' => 'element'));

            $query = "SELECT {$identifier}, {$relevance}, id, element As name, 0 AS date, 0 AS hits".
            " FROM #__plugins {$where}{$order_by}";

            return MijoDatabase::loadObjectList($query, '', 0, parent::getSqlLimit());
        }
	}
	
	public function _getItemURL(&$item) {
        if (parent::is16()) {
		    $item->link = 'index.php?option=com_plugins&task=plugin.edit&extension_id='.$item->id;
        }
        else{
		    $item->link = 'index.php?option=com_plugins&view=plugin&client=site&task=edit&cid[]='.$item->id;
        }
    }
}