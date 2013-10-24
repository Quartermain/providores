<?php 
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

jimport('joomla.filesystem.file');
jimport('joomla.filesystem.folder');

class ModelToolJoomshopping extends Model {
  	
  	public function importCategories($post){
		$db = JFactory::getDBO();
		$language = self::_getLanguage();
		$jstatus = MijoShop::get('base')->is30();
		
		$oc_lang_id = (int)$this->config->get('config_language_id');
	 
		$cat = "SELECT `name_".$language."` AS category_name, category_parent_id, `description_".$language."` AS category_description, category_id, category_add_date, category_image, ordering, category_publish, `meta_description_".$language."` AS meta_desc, `meta_keyword_".$language."` AS meta_key FROM #__jshopping_categories ORDER BY category_id";
		$db->setQuery($cat);
		$cats = $db->loadAssocList();
		
		if (empty($cats)) {
			echo '<strong>No category to import.</strong>';
			exit;
		}
		
		$i = 0;
		foreach($cats as $cat) {
			$datec = ($jstatus) ? JFactory::getDate($cat['category_add_date'])->toSql() : JFactory::getDate($cat['category_add_date'])->toMySQL();
			$cat_name = ($jstatus) ? $db->escape(htmlspecialchars($cat['category_name'])) : $db->getEscaped(htmlspecialchars($cat['category_name']));
			
			$cat_image = empty($cat['category_image']) ? '' : (($jstatus) ? 'data/'.$db->escape($cat['category_image']) : 'data/'.$db->getEscaped($cat['category_image']));
			
			$q = "INSERT INTO `#__mijoshop_category` ( `category_id` , `image` , `parent_id` , `sort_order` , `date_added` , `date_modified` , `status`) VALUES ('". $cat['category_id']."', '".$cat_image."', '".$cat['category_parent_id']."', '".$cat['ordering']."', '".$datec."', '".$datec."', '".$cat['category_publish']."')";
			$db->setQuery($q);
			$db->query();
			
			$q = "INSERT INTO `#__mijoshop_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`) VALUES ('". $cat['category_id']."', '".$oc_lang_id."', '".$cat_name."', '".$cat['category_description']."', '".$cat['meta_desc']."', '".$cat['meta_key']."')";
			$db->setQuery($q);
			$db->query();
			
			$q = "INSERT INTO `#__mijoshop_category_to_store` (`category_id` , `store_id`) VALUES ('".$cat['category_id']."' , '0')";
			$db->setQuery($q);
			$db->query();

			echo 'Importing <i>' . $cat['category_name'] .'</i> : Completed.<br />';
			$i++;
		}
		
		self::_addCategoryPath();
		
		echo '<strong>Categories has been imported successfully.</strong><br />';
		exit;
	}
  	
  	public function _addCategoryPath() {
        $db = JFactory::getDBO();
		$db->setQuery("SELECT category_id FROM `#__jshopping_categories`");
		$categories = $db->loadObjectList();

		if (!empty($categories)){
			foreach($categories as $category){
				$path = self::_getPath($category->category_id, array($category->category_id));
				$path = array_reverse($path);
				
				foreach($path as $key => $_path){
					$db->setQuery("INSERT INTO `#__mijoshop_category_path` (`category_id`, `path_id`, `level`) VALUES('{$category->category_id}','{$_path}','{$key}')");
					$db->query();
				}
			}
		}
	}

    private function _getPath($cat_id, $path = array()){
        $db = JFactory::getDBO();
		
        $db->setQuery("SELECT category_parent_id FROM `#__jshopping_categories` WHERE category_id = ".$cat_id);
        $parent_id = $db->loadResult();

        if ((int)$parent_id != 0) {
            $path[] = $parent_id;
            $path = self::_getPath($parent_id, $path);
        }

        return $path;
    }
  	
  	public function importProducts($post) {
		$db = JFactory::getDBO();
		$language = self::_getLanguage();
		$jstatus = MijoShop::get('base')->is30();
		
		$oc_lang_id = (int)$this->config->get('config_language_id');
		
		$image = ($jstatus) ? 'image' : 'product_full_image AS image';
		$q = "SELECT product_id, `name_".$language."` AS product_name, `alias_".$language."` AS product_alias, `description_".$language."` AS product_description, `meta_description_".$language."` AS meta_desc, `meta_keyword_".$language."` AS meta_key, product_ean, product_publish, min_price, ".$image.", hits, product_weight, product_quantity, product_manufacturer_id, date_modify, product_date_added FROM #__jshopping_products";
		$db->setQuery($q);
		$pros = $db->loadAssocList();
		
		if (empty($pros)) {
			echo '<strong>No product to import.</strong>';
			exit;
		}
		
		foreach($pros AS $pro){
			$datec = ($jstatus) ? JFactory::getDate($pro['product_date_added'])->toSql() : JFactory::getDate($pro['product_date_added'])->toMySQL();
			$datem = ($jstatus) ? JFactory::getDate($pro['date_modify'])->toSql() : JFactory::getDate($pro['date_modify'])->toMySQL();
			
			$pro_image = empty($pro['image']) ? '' : (($jstatus) ? 'data/'.$db->escape($pro['image']) : 'data/'.$db->getEscaped($pro['image']));
			$pro_name = ($jstatus) ? $db->escape(htmlspecialchars($pro['product_name'])) : $db->getEscaped(htmlspecialchars($pro['product_name']));
			$pro_desc = ($jstatus) ? $db->escape(htmlspecialchars($pro['product_description'])) : $db->getEscaped(htmlspecialchars($pro['product_description']));

			$q = "INSERT INTO `#__mijoshop_product` (`product_id`, `model`, `sku`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `tax_class_id`, `weight`, `weight_class_id`, `length`, `width`, `height`, `status`, `date_added`, `date_modified`, `date_available`, `viewed`) VALUES ('".$pro['product_id']."', '".$pro['product_ean']."', '', '', '".$pro['product_quantity']."', '7', '".$pro_image."', '".$pro['product_manufacturer_id']."', '1', '".$pro['min_price']."', '', '".$pro['product_weight']."', '0', '0.00', '0.00', '0.00', '".$pro['product_publish']."', '".$datec."', '".$datem."',  '".$datec."',  '".$pro['hits']."')";
			$db->setQuery($q);
			$db->query();

            $q = "INSERT INTO `#__mijoshop_product_description` (`product_id` , `language_id` , `name` , `description`, `meta_description`, `meta_keyword`) VALUES ('".$pro['product_id']."','".$oc_lang_id."','".$pro_name."','".$pro_desc."','".$pro['meta_desc']."','".$pro['meta_key']."')";
		    $db->setQuery($q);
			$db->query();

			$q = "INSERT INTO `#__mijoshop_product_to_store` (`product_id`, `store_id`) VALUES ('".$pro['product_id']."' , '0')";
			$db->setQuery($q);
			$db->query();
	    
			echo 'Importing <i>' . $pro['product_name'] .'</i> : Completed.<br />';
		}
	  
		$q = "SELECT * FROM `#__jshopping_products_to_categories`";
		$db->setQuery($q);
		$results = $db->loadAssocList();
		
		if (!empty($results)) {
			foreach($results as $ptcs) {
				$ptjc = "INSERT INTO `#__mijoshop_product_to_category` (`product_id`, `category_id`) VALUES ('".$ptcs['product_id']."', '".$ptcs['category_id']."')";
				$db->setQuery($ptjc);
				$db->query();
			}
		}
	  
		$q = "SELECT * FROM `#__jshopping_products_relations`";
		$db->setQuery($q);
		$relresults = $db->loadAssocList();
		
		if (!empty($relresults)) {
			foreach($relresults as $relres) {
				$ptjc = "INSERT INTO `#__mijoshop_product_related` (`related_id`, `product_id`) VALUES ('".$relres['product_related_id']."', '".$relres['product_id']."')";
				$db->setQuery($ptjc);
				$db->query();
			}
		}

		echo '<strong>Products has been imported successfully.</strong><br />';
		exit;
	}
	
	public function importManufacturers($post) {
		$db = JFactory::getDBO();
		$language = self::_getLanguage();
		$jstatus = MijoShop::get('base')->is30();
		
		$oc_lang_id = (int)$this->config->get('config_language_id');
	  
		$q = "SELECT manufacturer_id, manufacturer_logo, `name_".$language."` AS manufacturer_name, ordering FROM #__jshopping_manufacturers";
		$db->setQuery($q);
		$mans = $db->loadAssocList();
		
		if (empty($mans)) {
			echo '<strong>No manufacturer to import.</strong>';
			exit;
		}
		
		foreach($mans as $man) {
			$man_image = empty($man['manufacturer_logo']) ? '' : (($jstatus) ? 'data/'.$db->escape($man['manufacturer_logo']) : 'data/'.$db->getEscaped($man['manufacturer_logo']));
			$man_name = ($jstatus) ? $db->escape(htmlspecialchars($man['manufacturer_name'])) : $db->getEscaped(htmlspecialchars($man['manufacturer_name']));
			
			$q = "INSERT INTO `#__mijoshop_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES ('".$man['manufacturer_id']."', '".$man_name."', '".$man_image."', '".$man['ordering']."')";
			$db->setQuery($q);
			$db->query();
			
			$q = "INSERT INTO `#__mijoshop_manufacturer_to_store` (`manufacturer_id` , `store_id`) VALUES ('".$man['manufacturer_id']."' , '0')";
			$db->setQuery($q);
			$db->query();
			
			echo 'Importing <i>' . $man['manufacturer_name'] .'</i> : Completed.<br />';
		}
		
		echo '<strong>Manufacturers has been imported successfully.</strong><br />';
		exit;
	}
	
	public function copyImages($post) {
		$cat_images = JPATH_SITE.'/components/com_jshopping/files/img_categories/';
		$pro_images = JPATH_SITE.'/components/com_jshopping/files/img_products/';
		$man_images = JPATH_SITE.'/components/com_jshopping/files/img_manufs/';
		
		self::_copyImages($cat_images);
		self::_copyImages($pro_images);
		self::_copyImages($man_images);
	  
		echo '<strong>Images has been copied successfully.</strong>';
		exit;
	}
	
	public function _copyImages($dir) {
		foreach (glob($dir . "*") as $filename) {
			if (JFolder::exists($filename)) {
				continue;
			}
			
			if (!JFile::copy($filename, DIR_IMAGE . 'data/' . basename($filename))){
				echo 'Failed to copy <i>' . $filename . '</i> to image directory.<br />';
			}
			else {
				echo 'Copying <i>' . $filename . '</i> : Completed.<br />';
			}
		}
	}
	
	function _getLanguage(){
		$db = JFactory::getDBO();
		$db->setQuery("SELECT defaultLanguage FROM #__jshopping_config WHERE id='1'");
		$lang = $db->loadResult();
		return $lang;
	}
}