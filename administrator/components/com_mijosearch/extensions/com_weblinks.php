<?php
/*
* @package		MijoSearch
* @subpackage	Weblinks
* @copyright	2009-2011 Mijosoft LLC, www.mijosoft.com
* @license		http://www.mijosoft.com/company/license
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

class Mijosearch_com_weblinks extends MijosearchExtension {
	
	public function getResults() {
		$cats = array();
		
		$items = self::_getItems();
		
		$cat = parent::getInt('category');
		if (empty($cat) && $this->params->get('search_categories', '1') == '1') {
			$cats = parent::_getCategories($this->extension->extension);
		}
		
		$results = array_merge($items, $cats);
		
		return $results;
	}
	
	protected function _getItems() {
		$where = parent::getSearchFieldsWhere('w.title:name, w.description:description');
		if (empty($where)){
			return array();
		}
		
		if ($this->site){
            if (parent::is16()) {
                $where[] = 'w.state = 1';
            }
            else {
                $where[] = 'w.published = 1';
            }
		}

        $exc_itemid = $this->params->get('exclude_itemid', '');
        if(!empty($exc_itemid)){
            $where[] = "w.id NOT IN (".$exc_itemid.")";
        }
		
		parent::getFilterWhere($where, array('category' => 'w.catid'), true, 'categories', 'id', 'parent_id');

        if(parent::is16()){
		    parent::getDateWhere($where, 'w.created');
            parent::getUserWhere($where, 'w.created_by');
        }
        else {
		    parent::getDateWhere($where, 'w.date');
        }

		$where = (count($where) ? ' WHERE ' . implode(' AND ', $where) : '');
		
		$order_by = parent::getOrder();
		
		$identifier = parent::getIdentifier();
		
		$relevance = parent::getRelevance(array('title' => 'w.title', 'desc' => 'w.description'));
		
		$itemslug = parent::getSlug('w.id', 'w.alias', 'itemslug');
		$catslug = parent::getSlug('c.id', 'c.alias', 'catslug');
		
		$query = "SELECT {$identifier}, {$relevance}, {$itemslug}, {$catslug}, w.id, w.title AS name, w.description, c.title AS category, w.created AS date, w.hits".
		" FROM #__weblinks AS w".
		" LEFT JOIN #__categories AS c ON w.catid = c.id".
		" {$where}{$order_by}";
		
		return MijoDatabase::loadObjectList($query, '', 0,parent::getSqlLimit());
	}
	
	public function _getItemURL(&$item) {
        if (parent::is16()) {
            if ($this->site) {
                $item->link = 'index.php?option=com_weblinks&task=weblink.go&id='.$item->id . parent::getItemid(array('task' => 'weblink.go'));
            }
            else {
                $item->link = 'index.php?option=com_weblinks&task=weblink.edit&id='.$item->id;
            }
        }
        else {
            if ($this->site) {
                $item->link = 'index.php?option=com_weblinks&view=weblink&layout=edit&id='.$item->itemslug . parent::getItemid(array('view' => 'weblink'));
            }
            else {
                $item->link = 'index.php?option=com_weblinks&view=weblink&task=edit&cid[]='.$item->id;
            }
        }
    }
	
	public function _getCategoryURL(&$cat) {
		if ($this->site) {
			$cat->link = 'index.php?option=com_weblinks&view=category&id='.$cat->id.$cat->alias. parent::getItemid(array('view' => 'category'));
		}
		else {
            if (parent::is16()) {
			    $cat->link = 'index.php?option=com_categories&task=category.edit&id='.$cat->id.'&extension=com_weblinks';
            }
            else{
			    $cat->link = 'index.php?option=com_categories&section=com_newsfeeds&task=edit&cid[]='.$cat->id.'&type=other';
            }
		}
	}
	
	public function getCategoryList($apply_filter = '0') {
		return parent::_getCategoryList($this->extension->extension, $apply_filter);
	}
}