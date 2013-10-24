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

class ModelToolTienda extends Model {
  	
  	public function importCategories($post){
		$db = JFactory::getDBO();
		$jstatus = MijoShop::get('base')->is30();
		
		$oc_lang_id = (int)$this->config->get('config_language_id');
	 
		$cat = "SELECT category_id, category_name, created_date, modified_date, parent_id, category_description, category_full_image, ordering, category_enabled FROM #__tienda_categories WHERE isroot = '0' ORDER BY category_id";
		$db->setQuery($cat);
		$cats = $db->loadAssocList();
		
		if (empty($cats)) {
			echo '<strong>No category to import.</strong>';
			exit;
		}
		
		$i = 0;
		foreach($cats as $cat) {
			if ($cat['parent_id'] == '1') {
				$cat['parent_id'] = '0';
			}
			
			$datec = ($jstatus) ? JFactory::getDate($cat['created_date'])->toSql() : JFactory::getDate($cat['created_date'])->toMySQL();
			$datem = ($jstatus) ? JFactory::getDate($cat['modified_date'])->toSql() : JFactory::getDate($cat['modified_date'])->toMySQL();
			
			$cat_image = empty($cat['category_full_image']) ? '' : (($jstatus) ? 'data/'.$db->escape($cat['category_full_image']) : 'data/'.$db->getEscaped($cat['category_full_image']));
			
			$cat_name = ($jstatus) ? $db->escape(htmlspecialchars($cat['category_name'])) : $db->getEscaped(htmlspecialchars($cat['category_name']));
			$cat_desc = ($jstatus) ? $db->escape(htmlspecialchars($cat['category_description'])) : $db->getEscaped(htmlspecialchars($cat['category_description']));
			
			$q = "INSERT INTO `#__mijoshop_category` ( `category_id` , `image` , `parent_id` , `sort_order` , `date_added` , `date_modified` , `status`) VALUES ('". $cat['category_id']."', '".$cat_image."', '".$cat['parent_id']."', '".$cat['ordering']."', '".$datec."', '".$datem."', '".$cat['category_enabled']."')";
			$db->setQuery($q);
			$db->query();
			
			$q = "INSERT INTO `#__mijoshop_category_description` (`category_id`, `language_id`, `name`, `description`) VALUES ('". $cat['category_id']."', '".$oc_lang_id."', '".$cat_name."', '".$cat_desc."')";
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
		$db->setQuery("SELECT category_id FROM `#__tienda_categories`");
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
		
        $db->setQuery("SELECT parent_id FROM `#__tienda_categories` WHERE category_id = ".$cat_id);
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
	 
		$q = "SELECT * FROM #__tienda_products";
		$db->setQuery($q);
		$pros = $db->loadAssocList();
		
		if (empty($pros)) {
			echo '<strong>No product to import.</strong>';
			exit;
		}
		
		foreach($pros as $pro){
			$datec = ($jstatus) ? JFactory::getDate($pro['created_date'])->toSql() : JFactory::getDate($pro['created_date'])->toMySQL();
			$datem = ($jstatus) ? JFactory::getDate($pro['modified_date'])->toSql() : JFactory::getDate($pro['modified_date'])->toMySQL();
			$datep = ($jstatus) ? JFactory::getDate($pro['publish_date'])->toSql() : JFactory::getDate($pro['publish_date'])->toMySQL();
			
			$pro_image = empty($pro['product_full_image']) ? '' : (($jstatus) ? 'data/'.$db->escape($pro['product_full_image']) : 'data/'.$db->getEscaped($pro['product_full_image']));
			
			$pro_name = ($jstatus) ? $db->escape(htmlspecialchars($pro['product_name'])) : $db->getEscaped(htmlspecialchars($pro['product_name']));
			$pro_desc = ($jstatus) ? $db->escape(htmlspecialchars($pro['product_description'])) : $db->getEscaped(htmlspecialchars($pro['product_description']));
			
			$q = "SELECT product_price FROM `#__tienda_productprices` WHERE product_id = ".$pro['product_id'];
			$db->setQuery($q);
			$price = $db->loadAssoc();
		
			$q = "SELECT quantity FROM `#__tienda_productquantities` WHERE product_id = ".$pro['product_id'];
			$db->setQuery($q);
			$quan = $db->loadAssoc();
			
			$q = "INSERT INTO `#__mijoshop_product` (`product_id`, `model`, `sku`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `tax_class_id`, `weight`, `weight_class_id`, `length`, `width`, `height`, `status`, `date_added`, `date_modified`, `date_available`) VALUES ('".$pro['product_id']."', '".$pro['product_model']."', '".$pro['product_sku']."', '', '".$quan['quantity']."', '7', '".$pro_image."', '".$pro['manufacturer_id']."', '1', '".$price['product_price']."', '', '".$pro['product_weight']."', '0', '".$pro['product_length']."', '".$pro['product_width']."', '".$pro['product_height']."',  '".$pro['product_enabled']."', '".$datec."', '".$datem."',  '".$datep."')";
			$db->setQuery($q);
			$db->query();
			
			$q = "INSERT INTO `#__mijoshop_product_description` (`product_id` , `language_id` , `name` , `description`) VALUES ('".$pro['product_id']."' , '".$oc_lang_id."' , '".$pro_name."' , '".$pro_desc."')";
			$db->setQuery($q);
			$db->query();
			
			$q = "INSERT INTO `#__mijoshop_product_to_store` (`product_id`, `store_id`) VALUES ('".$pro['product_id']."' , '0')";
			$db->setQuery($q);
			$db->query();
	    
			echo 'Importing <i>' . $pro['product_name'] .'</i> : Completed.<br />';
		}
	  
		$q = "SELECT * FROM `#__tienda_productcategoryxref`";
		$db->setQuery($q);
		$results = $db->loadAssocList();
		
		if (!empty($results)) {
			foreach($results as $ptcs) {
				$ptjc = "INSERT INTO `#__mijoshop_product_to_category` (`product_id`, `category_id`) VALUES ('".$ptcs['product_id']."', '".$ptcs['category_id']."')";
				$db->setQuery($ptjc);
				$db->query();
			}
		}
	  
		$q = "SELECT * FROM `#__tienda_productrelations` WHERE relation_type = 'relates'";
		$db->setQuery($q);
		$relresults = $db->loadAssocList();
		
		if (!empty($relresults)) {
			foreach($relresults as $relres) {
				$ptjc = "INSERT INTO `#__mijoshop_product_related` (`related_id`, `product_id`) VALUES ('".$relres['product_id_to']."', '".$relres['product_id_from']."')";
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
	  
		$q = "SELECT manufacturer_id, manufacturer_name, manufacturer_image FROM `#__tienda_manufacturers`";
		$db->setQuery($q);
		$mans = $db->loadAssocList();
		
		if (empty($mans)) {
			echo '<strong>No manufacturer to import.</strong>';
			exit;
		}
		
		foreach($mans as $man) {		
			$man_image = empty($man['manufacturer_image']) ? '' : (($jstatus) ? 'data/'.$db->escape($man['manufacturer_image']) : 'data/'.$db->getEscaped($man['manufacturer_image']));
			$man_name = ($jstatus) ? $db->escape(htmlspecialchars($man['manufacturer_name'])) : $db->getEscaped(htmlspecialchars($man['manufacturer_name']));
			
			$q = "INSERT INTO `#__mijoshop_manufacturer` (`manufacturer_id`, `name`, `image`) VALUES ('".$man['manufacturer_id']."', '".$man_name."', '".$man_image."')";
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

    public function importUsers($post) {
        $db = JFactory::getDBO();
        $jstatus = MijoShop::get('base')->is30();
        $oc_lang_id = (int)$this->config->get('config_language_id');

        $query = "SELECT * FROM `#__tienda_addresses` ORDER BY address_id";
        $db->setQuery($query);
        $users = $db->loadAssocList();

        if (empty($users)) {
            echo '<strong>No user to import.</strong>';
            exit;
        }

        foreach($users as $user) {
            $query = "SELECT ocustomer_id FROM `#__mijoshop_juser_ocustomer_map` WHERE juser_id = '".$user['user_id']."'";
            $db->setQuery($query);
            $customer_id = $db->loadResult();

            if(!empty($customer_id)){
                $query = "SELECT country_isocode_2 AS code2, country_isocode_3 AS code3 FROM `#__tienda_countries` WHERE country_id = '".$user['country_id']."'";
                $db->setQuery($query);
                $country = $db->loadAssoc();

                $query = "SELECT code AS code3 FROM `#__tienda_zones` WHERE zone_id = '".$user['zone_id']."'";
                $db->setQuery($query);
                $zone = $db->loadAssoc();

                $query = "SELECT country_id FROM `#__mijoshop_country` WHERE iso_code_2 = '".$country['code2']."' AND iso_code_3 = '".$country['code3']."'";
                $db->setQuery($query);
                $oc_country = $db->loadResult();

                $query = "SELECT zone_id FROM `#__mijoshop_zone` WHERE code = '".$zone['code3']."'";
                $db->setQuery($query);
                $oc_zone = $db->loadResult();

                $user_fname = ($jstatus) ? 'data/'.$db->escape(htmlspecialchars($user['first_name'])) : $db->getEscaped(htmlspecialchars($user['first_name']));
                $user_lname = ($jstatus) ? 'data/'.$db->escape(htmlspecialchars($user['last_name'])) : $db->getEscaped(htmlspecialchars($user['last_name']));
                $user_company = ($jstatus) ? 'data/'.$db->escape(htmlspecialchars($user['company'])) : $db->getEscaped(htmlspecialchars($user['company']));

                $q = "UPDATE `#__mijoshop_customer` SET `firstname`='".$user_fname."', `lastname`='".$user_lname."', `telephone`='".$user['phone_1']."', `fax`='".$user['fax']."' WHERE `customer_id`='".$customer_id."'";
                $db->setQuery($q);
                $db->query();

                $q = "UPDATE `#__mijoshop_address` SET `firstname`='".$user_fname."', `lastname`='".$user_lname."', `company`='".$user_company."', `address_1`='".$user['address_1']."', `address_2`='".$user['address_2']."', `city`='".$user['city']."', `postcode`='".$user['postal_code']."', `country_id`='".$oc_country."', `zone_id`='".$oc_zone."' WHERE `customer_id`='".$customer_id."'";
                $db->setQuery($q);
                $db->query();

                echo 'Importing <i>' . $user_fname .' '. $user_lname .'</i> : Completed.<br />';
            }
        }

        echo '<strong>Users has been imported successfully.</strong><br />';
        exit;
    }
	
	public function copyImages($post) {
		$cat_images = JPATH_SITE.'/images/com_tienda/categories/';
		self::_copyImages($cat_images);
		
		$db = JFactory::getDBO();
		$q = "SELECT product_sku FROM #__tienda_products";
		$db->setQuery($q);
		$pros = $db->loadAssocList();
		
		foreach($pros as $pro){
			$pro_images = JPATH_SITE.'/images/com_tienda/products/'.$pro['product_sku'].'/';
			self::_copyImages($pro_images);
		}
		
		$man_images = JPATH_SITE.'/images/com_tienda/manufacturers/';
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