<?php
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

// No Permission
defined('_JEXEC') or die ('Restricted access');

jimport('joomla.plugin.plugin');
require_once(JPATH_SITE.'/administrator/components/com_search/helpers/search.php');

class plgSearchMijoshop extends JPlugin {

	public function onContentSearchAreas(){
		return $this->onSearchAreas();
	}

	public function onContentSearch($text, $phrase = '', $ordering = '', $areas = null) {
		return $this->onSearch($text, $phrase, $ordering, $areas);
	}
	
	public function onSearchAreas() {
		JFactory::getLanguage()->load('com_mijoshop', JPATH_ADMINISTRATOR);
		
		static $areas = array('mijoshop' => 'COM_MIJOSHOP_PRODUCTS');
		
		return $areas;
	}
	
	public function onSearch($text, $phrase = '', $ordering = '', $areas = null) {
		$file = JPATH_SITE.'/components/com_mijoshop/mijoshop/mijoshop.php';
		
		if (!file_exists($file)) {
			return array();
		}
		
		require_once($file);
	
		$plugin = JPluginHelper::getPlugin('search', 'mijoshop');

		$params = new JRegistry($plugin->params);

		$text = JString::trim($text);
		if ($text == '') {
			return array();
		}

        //if ($phrase != 'exact') {
            $text = JString::strtolower($text);
        //}

		$db = MijoShop::get('db')->getDbo();
		
		$limit = $params->get('search_limit', 50);

        switch ($ordering) {
            case 'oldest':
                $order_by = 'p.date_added ASC';
                break;
            case 'popular':
                $order_by = 'p.viewed DESC';
                break;
            case 'alpha':
                $order_by = 'pd.name ASC';
                break;
            case 'category':
                $order_by = 'cd.name ASC, pd.name ASC';
                break;
            case 'newest':
            default :
                $order_by = 'p.date_added DESC';
                break;
        }
		
		$store_id = JRequest::getInt('mijoshop_store_id', null);
		if (is_null($store_id)) {
			//$store_id = MijoShop::get()->getStoreId();
			$store_id = (int) MijoShop::get('opencart')->get('config')->get('config_store_id');
		}

        $language_id = (int) MijoShop::get('opencart')->get('config')->get('config_language_id');

	    $query = "SELECT DISTINCT p.product_id, pd.name AS title, pd.description AS text, cd.name AS section, p.image, pt.tag, p.date_added AS created "
				."FROM #__mijoshop_product AS p "
				."INNER JOIN #__mijoshop_product_description AS pd ON p.product_id = pd.product_id "
				."LEFT JOIN #__mijoshop_product_to_store AS ps ON p.product_id = ps.product_id "
				."LEFT JOIN #__mijoshop_product_to_category AS pc ON p.product_id = pc.product_id "
				."LEFT JOIN #__mijoshop_category_description AS cd ON (pc.category_id = cd.category_id AND cd.language_id = {$language_id}) "
				."LEFT JOIN #__mijoshop_category_to_store AS cs ON (pc.category_id = cs.category_id AND cs.store_id = {$store_id}) "
				."LEFT JOIN #__mijoshop_product_tag AS pt ON p.product_id = pt.product_id "
				."WHERE (LOWER(pd.name) LIKE '%" . $db->getEscaped($text) . "%' OR
				        LOWER(pd.description) LIKE '%" . $db->getEscaped($text). "%' OR
				        LOWER(pt.tag) LIKE '%" . $db->getEscaped($text). "%') "
				."AND p.status = '1' "
				."AND p.date_available <= NOW() "
				."AND ps.store_id = {$store_id} "
                ."AND pd.language_id = '" . $language_id . "' "
				."GROUP BY p.product_id "
				."ORDER BY {$order_by} "
				."LIMIT ".$limit;
	   
	    $db->setQuery($query);
	    $results = $db->loadObjectList();

        $ret = array();

        if (empty($results)) {
            return $ret;
        }

        foreach($results as $result) {
            $result->href = MijoShop::get('router')->route('index.php?route=product/product&product_id=' . $result->product_id);
            $result->browsernav = 2;

            $result->title = html_entity_decode($result->title);
            $result->text = html_entity_decode($result->text);

            if (searchHelper::checkNoHTML($result, $text, array('title', 'text', 'tag'))) {
                $ret[] = $result;
            }
        }
		
		return $ret;
	}
}