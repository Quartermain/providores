<?php
/*
* @package		MijoSearch
* @subpackage	Banners
* @copyright	2009-2011 Mijosoft LLC, www.mijosoft.com
* @license		http://www.mijosoft.com/company/license
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

class MijoSearch_com_banners extends MijosearchExtension {
	
	public function getResults() {
		$cats = $items = array();
		$items = self::_getItems();
	
		$cat = parent::getInt('category');
		if ($this->admin && empty($cat) && $this->params->get('search_categories', '1') == '1') {
			$cats = parent::_getCategories($this->extension->extension);
		}
		
		$results = array_merge($items, $cats);
		
		return $results;
	}
	
	protected function _getItems() {
		$where = parent::getSearchFieldsWhere('b.name:name, b.description:description');
		if (empty($where)){
			return array();
		}

        if (parent::is16()) {
            if ($this->site) {
                $where[] = 'b.state = 1';
            }
            $id = "b.id";
            $date = "b.created As date";
            $from = "#__banners";
        }
        else{
            if ($this->site) {
                $where[] = 'b.showBanner = 1';
            }
            $id = "b.bid";
            $date = "b.date";
            $from = "#__banner";
        }

        $exc_itemid = $this->params->get('exclude_itemid', '');
        if(!empty($exc_itemid)){
            $where[] = "{$id} NOT IN (".$exc_itemid.")";
        }
		
		parent::getFilterWhere($where, array('category' => 'b.catid'), false);
		
		$where = (count($where) ? ' WHERE ' . implode(' AND ', $where) : '');
		
		$order_by = parent::getOrder();

		$identifier = parent::getIdentifier();

		$relevance = parent::getRelevance(array('title' => 'b.name', 'desc' => 'b.description'));

		$query = "SELECT {$identifier}, {$relevance}, {$id} AS id, b.name, b.description, {$date}, b.clicks AS hits, c.title AS category".
		" FROM {$from} AS b LEFT JOIN #__categories AS c ON b.catid = c.id".
		" {$where}{$order_by}";

		return MijoDatabase::loadObjectList($query, '', 0, parent::getSqlLimit());
	}

	public function _getItemURL(&$item) {
        if (parent::is16()) {
            if ($this->site) {
                $item->link = 'index.php?option=com_banners&task=click&id='.$item->id . parent::getItemid(array('task'=>'click'));
            }
            else {
                $item->link = 'index.php?option=com_banners&task=banner.edit&id='.$item->id;
            }
        }
        else {
            if ($this->site){
                $item->link = 'index.php?option=com_banners&task=click&bid='.$item->id . parent::getItemid(array('task'=>'click'));
            }
            else {
                $item->link = 'index.php?option=com_banners&task=edit&cid[]='.$item->id;
            }
        }
    }

	public function _getCategoryURL(&$cat) {
        if ($this->admin) {
            if (parent::is16()) {
                $cat->link = 'index.php?option=com_categories&task=category.edit&id='.$cat->id.'&extension=com_banners';
            }
            else {
                $cat->link = 'index.php?option=com_categories&section=com_banner&task=edit&cid[]='.$cat->id.'&type=other';
            }
        }
	}

	public function getCategoryList($apply_filter = '0') {
        if (parent::is16()) {
		    return parent::_getCategoryList('com_banners', $apply_filter);
        }
        else{
            return parent::_getCategoryList('com_banner', $apply_filter);
        }
	}
}