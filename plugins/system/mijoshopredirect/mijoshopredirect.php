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

class plgSystemMijoshopRedirect extends JPlugin {

	public function __construct(&$subject, $config) {
		parent::__construct($subject, $config);
	}
	
	public function onAfterInitialise() {
        $route = JRequest::getString('route');
        if (empty($route)) {
            return true;
        }

        JRequest::setVar('option', 'com_mijoshop');

		$app = JFactory::getApplication();
		if ($app->isAdmin()) {
			return true;
		}
		
		$Itemid = JRequest::getInt('Itemid');		
		if (!empty($Itemid)) {
			return true;
		}

		$token = JRequest::getCmd('token');
		if (!empty($token)) {
			return true;
		}
		
		$file = JPATH_ROOT.'/components/com_mijoshop/mijoshop/mijoshop.php';
		if (!file_exists($file)) {
			return;
		}
		
		require_once($file);

        $record_id = 0;

        $view = JRequest::getCmd('view');
        if (empty($view)) {
            $view = MijoShop::get('router')->getView($route);
        }

        if ($view != 'home') {
            $p_id = JRequest::getInt('product_id');
            $c_id = JRequest::getInt('path');
            $m_id = JRequest::getInt('manufacturer_id');
            $i_id = JRequest::getInt('information_id');

            if (!empty($p_id)) {
                $record_id = $p_id;
            }
            else if (!empty($c_id)) {
                $record_id = $c_id;
            }
            else if (!empty($m_id)) {
                $record_id = $m_id;
            }
            else if (!empty($i_id)) {
                $record_id = $i_id;
            }
        }

		$_itemid = MijoShop::get('router')->getItemid($view, $record_id);
		if (empty($_itemid)) {
			return true;
		}
		
		JRequest::setVar('Itemid', $_itemid);
		
		return true;
	}
	
	public function onAfterRoute() {
		$app = JFactory::getApplication();
		
		if ($app->isAdmin()) {
			return true;
		}
		
		$file = JPATH_ROOT.'/components/com_mijoshop/mijoshop/mijoshop.php';
		if (!file_exists($file)) {
			return;
		}
		
		require_once($file);
		
		$plugin = JPluginHelper::getPlugin('system', 'mijoshopredirect');
	    $params = new JRegistry($plugin->params);

		$option = JRequest::getCmd('option');
		
		$link = '';
		
		if (!empty($option)) {
			switch ($option) {
				case 'com_virtuemart':
					if ($params->get('virtuemart', '0') == '1') {
						$link = self::_getVirtuemartLink();
					}
					break;
				case 'com_hikashop':
					if ($params->get('hikashop', '0') == '1') {
						$link = self::_getHikashopLink();
					}
					break;
				case 'com_redshop':
					if ($params->get('redshop', '0') == '1') {
						$link = self::_getRedshopLink();
					}
					break;
				case 'com_tienda':
					if ($params->get('tienda', '0') == '1') {
						$link = self::_getTiendaLink();
					}
					break;
				case 'com_jshopping':
					if ($params->get('joomshopping', '0') == '1') {
						$link = self::_getJoomshoppingLink();
					}
					break;
				default:
					return true;
			}
		}
		
		if (empty($link)) {
			return true;
		}
		
		$Itemid = JRequest::getInt('Itemid', '');
		$lang = JRequest::getWord('lang', '');
		
		if (!empty($Itemid)) {
			$Itemid = '&Itemid='.$Itemid;
		}
		
		if (!empty($lang)) {
			$lang = '&lang='.$lang;
		}
		
		$url = JRoute::_('index.php?option=com_mijoshop&'.$link.$Itemid.$lang);

		$app->redirect($url, '', 'message', true);
	}
	
	public function _getJoomshoppingLink(){
		$link = '';
		$controller = JRequest::getString('controller');
		$task = JRequest::getString('task');
		$pro_id = JRequest::getInt('product_id');
		$cat_id = JRequest::getInt('category_id');
		$manufac_id = JRequest::getInt('manufacturer_id');
		
		if (!empty($controller)) {
			switch ($controller) {
				case 'category':
					if (!empty($cat_id) && !empty($task) && $task == 'view') {
						$link = 'route=product/category&path='.$cat_id;
					}
					break;
				case 'product':
					if (!empty($cat_id) && !empty($pro_id) && !empty($task) && $task == 'view') {
						$link = 'route=product/product&path='.$cat_id.'&product_id='.$pro_id;
					}
					break;
				case 'manufacturer':
					if (!empty($manufac_id) && !empty($task) && $task == 'view') {
						$link = 'route=product/manufacturer/info&manufacturer_id='.$manufac_id;
					}
					break;
			}
		}
		
		return $link;
	}
	
	public function _getTiendaLink(){
		$link = '';
		$view = JRequest::getString('view');
		$task = JRequest::getString('task');
		$pro_id = JRequest::getInt('id');
		$cat_id = JRequest::getString('filter_category');
		$manufac_id = JRequest::getInt('filter_manufacturer');
		
		if ($view == 'manufacturers' && $task == 'products'){
			$link = 'route=product/manufacturer/info&manufacturer_id='.$manufac_id;
		}
		
		if ($view == 'products') {
			if (!empty($task) && $task == 'view') {
				$link = 'route=product/product&path='.$cat_id.'&product_id='.$pro_id;
			}
			else {
				if (!empty($cat_id)){
					$link = 'route=product/category&path='.$cat_id;
				}
			}
		}
		
		return $link;
	}
	
	public function _getRedshopLink(){
		$link = '';
		$view = JRequest::getString('view');
		$layout = JRequest::getString('layout');
		$pro_id = JRequest::getInt('pid');
		$cat_id = JRequest::getInt('cid');
		$manufac_id = JRequest::getInt('mid');
		
		if (!empty($view)) {
			switch ($view) {
				case 'category':
					if (!empty($cat_id) && !empty($layout) && $layout == 'detail') {
						$link = 'route=product/category&path='.$cat_id;
					}
					break;
				case 'product':
					if (!empty($cat_id) && !empty($pro_id)) {
						$link = 'route=product/product&path='.$cat_id.'&product_id='.$pro_id;
					}
					break;
				case 'manufacturers':
					if (!empty($manufac_id) && !empty($layout) && $layout == 'detail') {
						$link = 'route=product/manufacturer/info&manufacturer_id='.$manufac_id;
					}
					break;
			}
		}
		
		return $link;
	}
	
	public function _getHikashopLink(){
		$link = '';
		$ctrl = JRequest::getString('ctrl');
		$task = JRequest::getString('task');
		$cid = JRequest::getInt('cid');
		$cat_id = JRequest::getInt('category_pathway');
		
		if (!empty($ctrl)) {
			switch ($ctrl) {
				case 'category':
					if (!empty($cid) && !empty($task) && $task == 'listing') {
						$type = self::_getHikashopType($cid);
					}
					
					if (!empty($type)){
						if ($type == 'product') {
							$link = 'route=product/category&path='.$cid;
						}
						elseif ($type == 'manufacturer') {
							$link = 'route=product/manufacturer/info&manufacturer_id='.$cid;
						}
					}
					break;
				case 'product':
					if (!empty($task) && $task == 'show' && !empty($cat_id) && !empty($cid)) {
						$link = 'route=product/product&path='.$cat_id.'&product_id='.$cid;
					}
					break;
			}
		}
		
		return $link;
	}
	
	public function _getHikashopType($id) {
		static $types = array();
		
		if (!isset($types[$id])) {
			$db = JFactory::getDBO();
			$db->setQuery('SELECT category_type FROM #__hikashop_category WHERE category_id ='.$id);
			$types[$id] = $db->loadResult();
		}
		
		return $types[$id];
	}
	
	public function _getVirtuemartLink(){
		$link = '';
		$version = self::_getVmVersion();
		
		if ($version == '1') {
			$flypage = JRequest::getCmd('flypage');
			$page = JRequest::getCmd('page');
			$pro_id = JRequest::getCmd('product_id');
			$cat_id = JRequest::getCmd('category_id');
			$manufac_id = JRequest::getCmd('manufacturer_id');
		
			if (!empty($page)) {
				switch ($page) {
					case 'shop.browse':
						if(!empty($cat_id)){
							$link = 'route=product/category&path='.$cat_id;
						}
						
						if (!empty($manufac_id)){
							$link = 'route=product/manufacturer/info&manufacturer_id='.$manufac_id;
						}
						break;
					case 'shop.product_details':
						if (!empty($flypage) && $flypage == 'flypage.tpl' && !empty($cat_id) && !empty($cid)) {
							$link = 'route=product/product&path='.$cat_id.'&product_id='.$cid;
						}
						break;
				}
			}
		}
		else {
			$view = JRequest::getCmd('view');
			$pro_id = JRequest::getCmd('virtuemart_product_id');
			$cat_id = JRequest::getCmd('virtuemart_category_id');
			$manufac_id = JRequest::getCmd('virtuemart_manufacturer_id');
			
			if (!empty($view)) {
				switch ($view) {
					case 'category':
						if (!empty($cat_id)){
							$link = 'route=product/category&path='.$cat_id;
						}
						break;
					case 'productdetails':
						if (!empty($cat_id) && !empty($pro_id)){
							$link = 'route=product/product&path='.$cat_id.'&product_id='.$pro_id;
						}
						break;
					case 'manufacturer':
						if (!empty($manufac_id)){
							$link = 'route=product/manufacturer/info&manufacturer_id='.$manufac_id;
						}
						break;
				}
			}
		}
		
		return $link;
	}
	
	public function _getVmVersion() {
		static $version;
		
		if (!isset($version)) {
			$v = MijoShop::get('base')->getXmlText(JPATH_ADMINISTRATOR.'/components/com_virtuemart/virtuemart.xml', 'version');
			
			$compare_1 = version_compare($v, '2.0.0');
			$version = ($compare_1 == -1 ? '1' : '2');
		}
		
		return $version;
	}
}