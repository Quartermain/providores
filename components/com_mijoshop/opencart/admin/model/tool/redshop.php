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

class ModelToolRedshop extends Model {
  	
  	public function importCategories($post){
		$db = JFactory::getDBO();
		$jstatus = MijoShop::get('base')->is30();

		$oc_lang_id = (int)$this->config->get('config_language_id');
	 
		$cat = "SELECT c.category_id, c.category_name, c.category_pdate, cx.category_parent_id, c.category_description, c.metakey, c.metadesc, c.category_thumb_image, c.ordering, c.published FROM #__redshop_category AS c, #__redshop_category_xref AS cx WHERE c.category_id = cx.category_child_id ORDER BY c.category_id";
		$db->setQuery($cat);
		$cats = $db->loadAssocList();
		
		if (empty($cats)) {
			echo '<strong>No category to import.</strong>';
			exit;
		}
		
		$i = 0;
		foreach($cats as $cat) {
			$date = ($jstatus) ? JFactory::getDate($cat['category_pdate'])->toSql() : JFactory::getDate($cat['category_pdate'])->toMySQL();
			
			$cat_image = empty($cat['category_thumb_image']) ? '' : (($jstatus) ? 'data/'.$db->escape($cat['category_thumb_image']) : 'data/'.$db->getEscaped($cat['category_thumb_image']));
			$cat_metadesc = ($jstatus) ? $db->escape($cat['metadesc']) : $db->getEscaped($cat['metadesc']);
			$cat_metakey = ($jstatus) ? $db->escape($cat['metakey']) : $db->getEscaped($cat['metakey']);
			$cat_name = ($jstatus) ? $db->escape(htmlspecialchars($cat['category_name'])) : $db->getEscaped(htmlspecialchars($cat['category_name']));
			$cat_desc = ($jstatus) ? $db->escape(htmlspecialchars($cat['category_description'])) : $db->getEscaped(htmlspecialchars($cat['category_description']));
			
			$q = "INSERT INTO `#__mijoshop_category` ( `category_id` , `image` , `parent_id` , `sort_order` , `date_added` , `date_modified` , `status`) VALUES ('". $cat['category_id']."', '".$cat_image."', '".$cat['category_parent_id']."', '".$cat['ordering']."', '".$date."', '".$date."', '".$cat['published']."')";
			$db->setQuery($q);
			$db->query();
			
			$q = "INSERT INTO `#__mijoshop_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`) VALUES ('". $cat['category_id']."', '".$oc_lang_id."', '".$cat_name."', '".$cat_desc."', '". $cat_metadesc."', '". $cat_metakey."')";
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
		$db->setQuery("SELECT category_child_id FROM `#__redshop_category_xref`");
		$categories = $db->loadObjectList();

		if (!empty($categories)){
			foreach($categories as $category){
				$path = self::_getPath($category->category_child_id, array($category->category_child_id));
				$path = array_reverse($path);
				
				foreach($path as $key => $_path){
					$db->setQuery("INSERT INTO `#__mijoshop_category_path` (`category_id`, `path_id`, `level`) VALUES('{$category->category_child_id}','{$_path}','{$key}')");
					$db->query();
				}
			}
		}
	}

    private function _getPath($cat_id, $path = array()){
        $db = JFactory::getDBO();
		
        $db->setQuery("SELECT category_parent_id FROM `#__redshop_category_xref` WHERE category_child_id = ".$cat_id);
        $parent_id = $db->loadResult();

        if ((int)$parent_id != 0) {
            $path[] = $parent_id;
            $path = self::_getPath($parent_id, $path);
        }

        return $path;
    }
  	
  	public function importProducts($post) {
		$db = JFactory::getDBO();
		$jstatus = MijoShop::get('base')->is30();

		$oc_lang_id = (int)$this->config->get('config_language_id');
	 
		$q = "SELECT * FROM #__redshop_product";
		$db->setQuery($q);
		$pros = $db->loadAssocList();
		
		if (empty($pros)) {
			echo '<strong>No product to import.</strong>';
			exit;
		}
		
		foreach($pros as $pro){
			$pdate = ($jstatus) ? JFactory::getDate($pro['publish_date'])->toSql() : JFactory::getDate($pro['publish_date'])->toMySQL();
			$udate = ($jstatus) ? JFactory::getDate($pro['update_date'])->toSql() : JFactory::getDate($pro['update_date'])->toMySQL();
			
			$pro_image = empty($pro['product_full_image']) ? '' : (($jstatus) ? 'data/'.$db->escape($pro['product_full_image']) : 'data/'.$db->getEscaped($pro['product_full_image']));
			
			$pro_name = ($jstatus) ? $db->escape(htmlspecialchars($pro['product_name'])) : $db->getEscaped(htmlspecialchars($pro['product_name']));
			$pro_desc = ($jstatus) ? $db->escape(htmlspecialchars($pro['product_desc'])) : $db->getEscaped(htmlspecialchars($pro['product_desc']));
			$pro_metadesc = ($jstatus) ? $db->escape($pro['metadesc']) : $db->getEscaped($pro['metadesc']);
			$pro_metakey = ($jstatus) ? $db->escape($pro['metakey']) : $db->getEscaped($pro['metakey']);
			
			$q = "INSERT INTO `#__mijoshop_product` (`product_id`, `model`, `sku`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `tax_class_id`, `weight`, `weight_class_id`, `length`, `width`, `height`, `status`, `date_added`, `date_modified`, `date_available`, `viewed`) VALUES ('".$pro['product_id']."', '', '', '', '9999', '7', '".$pro_image."', '".$pro['manufacturer_id']."', '1', '".$pro['product_price']."', '', '".$pro['product_weight']."', '0', '".$pro['product_length']."', '".$pro['product_width']."', '".$pro['product_height']."',  '".$pro['published']."', '".$pdate."', '".$pdate."',  '".$udate."', '".$pro['visited']."')";
			$db->setQuery($q);
			$db->query();
			
			$q = "INSERT INTO `#__mijoshop_product_description` (`product_id` , `language_id` , `name` , `description` , `meta_description` , `meta_keyword`) VALUES ('".$pro['product_id']."' , '".$oc_lang_id."' , '".$pro_name."' , '".$pro_desc."' , '". $pro_metadesc."', '". $pro_metakey."')";
			$db->setQuery($q);
			$db->query();
			
			$q = "INSERT INTO `#__mijoshop_product_to_store` (`product_id`, `store_id`) VALUES ('".$pro['product_id']."' , '0')";
			$db->setQuery($q);
			$db->query();
	    
			echo 'Importing <i>' . $pro['product_name'] .'</i> : Completed.<br />';
		}
	  
		$q = "SELECT * FROM `#__redshop_product_category_xref`";
		$db->setQuery($q);
		$results = $db->loadAssocList();
		
		if (!empty($results)) {
			foreach($results as $ptcs) {
				$ptjc = "INSERT INTO `#__mijoshop_product_to_category` (`product_id`, `category_id`) VALUES ('".$ptcs['product_id']."', '".$ptcs['category_id']."')";
				$db->setQuery($ptjc);
				$db->query();
			}
		}
	  
		$q = "SELECT * FROM `#__redshop_product_related`";
		$db->setQuery($q);
		$relresults = $db->loadAssocList();
		
		if (!empty($relresults)) {
			foreach($relresults as $relres) {
				$ptjc = "INSERT INTO `#__mijoshop_product_related` (`related_id`, `product_id`) VALUES ('".$relres['related_id']."', '".$relres['product_id']."')";
				$db->setQuery($ptjc);
				$db->query();
			}
		}

		echo '<strong>Products has been imported successfully.</strong><br />';
		exit;
	}
	
	public function importManufacturers($post) {
		$db = JFactory::getDBO();
		$jstatus = MijoShop::get('base')->is30();
		
		$oc_lang_id = (int)$this->config->get('config_language_id');
	  
		$q = "SELECT manufacturer_id, manufacturer_name, ordering FROM `#__redshop_manufacturer`";
		$db->setQuery($q);
		$mans = $db->loadAssocList();
		
		if (empty($mans)) {
			echo '<strong>No manufacturer to import.</strong>';
			exit;
		}
		
		foreach($mans as $man) {
			$q = "SELECT media_name FROM `#__redshop_media` WHERE media_section = 'manufacturer' AND section_id = ".$man['manufacturer_id'];
			$db->setQuery($q);
			$file = $db->loadAssoc();
			
			$man_image = empty($file['media_name']) ? '' : (($jstatus) ? 'data/'.$db->escape($file['media_name']) : 'data/'.$db->getEscaped($file['media_name']));
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
	
	public function importUserInformation($post) {
		$db = JFactory::getDBO();
	  
		$q = "SELECT user_id, firstname, lastname, country_code, address, city, state_code, zipcode, phone FROM #__redshop_users_info";
		$db->setQuery($q);
		$users = $db->loadAssocList();
		
		if (empty($users)) {
			echo '<strong>No User Info to import.</strong>';
			exit;
		}
		
		foreach($users as $user) {
			$q = "SELECT ocustomer_id FROM #__mijoshop_juser_ocustomer_map WHERE juser_id = {$user['user_id']}";
			$db->setQuery($q);
			$oc_customer_id = $db->loadResult();

            $q = "SELECT country_id FROM #__mijoshop_country WHERE iso_code_3 = '{$user['country_code']}'";
            $db->setQuery($q);
            $country_id = $db->loadResult();

            $q = "SELECT zone_id FROM #__mijoshop_zone WHERE code = '{$user['state_code']}' AND country_id = {$country_id}";
            $db->setQuery($q);
            $zone_id = $db->loadResult();

            $q = "SELECT address_id FROM #__mijoshop_address WHERE customer_id = {$oc_customer_id}";
            $db->setQuery($q);
            $address_id = $db->loadResult();

            if (!empty($address_id)) {
			    $q = "UPDATE #__mijoshop_address SET firstname = '{$user['firstname']}', lastname = '{$user['lastname']}', address_1 = '{$user['address']}', city = '{$user['city']}', postcode = '{$user['zipcode']}', country_id = '{$country_id}', zone_id = '{$zone_id}' WHERE address_id = {$address_id}";
            }
            else {
                $q = "INSERT INTO #__mijoshop_address SET customer_id = '{$oc_customer_id}', firstname = '{$user['firstname']}', lastname = '{$user['lastname']}', address_1 = '{$user['address']}', city = '{$user['city']}', postcode = '{$user['zipcode']}', country_id = '{$country_id}', zone_id = '{$zone_id}'";
            }
			$db->setQuery($q);
			$db->query();
			
			$q = "UPDATE #__mijoshop_customer SET telephone = '{$user['phone']}' WHERE customer_id = {$oc_customer_id}";
			$db->setQuery($q);
			$db->query();
			
			echo 'Importing <i>' . $user['user_id'] .'</i> : Completed.<br />';
		}
		
		echo '<strong>User Info has been imported successfully.</strong><br />';
		exit;
	}
	
	public function copyImages($post) {
		$cat_images = JPATH_SITE.'/components/com_redshop/assets/images/category/';
		$pro_images = JPATH_SITE.'/components/com_redshop/assets/images/product/';
		$man_images = JPATH_SITE.'/components/com_redshop/assets/images/manufacturer/';
		
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
}