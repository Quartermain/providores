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

class ModelToolHikashop extends Model {
  	
  	public function importCategories($post){
		$db = JFactory::getDBO();
		$jstatus = MijoShop::get('base')->is30();

		$oc_lang_id = (int)$this->config->get('config_language_id');
	 
		$cat = "SELECT category_id, category_name, category_created, category_modified, category_parent_id, category_description, category_keywords, category_meta_description, category_published, category_ordering FROM #__hikashop_category WHERE category_type = 'product' AND category_id != '2' ORDER BY category_id";
		$db->setQuery($cat);
		$cats = $db->loadAssocList();
		
		if (empty($cats)) {
			echo '<strong>No category to import.</strong>';
			exit;
		}
		
		$i = 0;
		foreach($cats as $cat) {
			if ($cat['category_parent_id'] == 2) {
				$cat['category_parent_id'] = '0';
			}
			
			$q = "SELECT file_path FROM `#__hikashop_file` WHERE file_type = 'category' AND file_ref_id = ".$cat['category_id'];
			$db->setQuery($q);
			$file = $db->loadAssoc();
			
			$datec = ($jstatus) ? JFactory::getDate($cat['category_created'])->toSql() : JFactory::getDate($cat['category_created'])->toMySQL();
			$datem = ($jstatus) ? JFactory::getDate($cat['category_modified'])->toSql() : JFactory::getDate($cat['category_modified'])->toMySQL();
			
			$cat_image = empty($file['file_path']) ? '' : (($jstatus) ? 'data/'.$db->escape($file['file_path']) : 'data/'.$db->getEscaped($file['file_path']));
			
			$cat_name = ($jstatus) ? $db->escape(htmlspecialchars($cat['category_name'])) : $db->getEscaped(htmlspecialchars($cat['category_name']));
			$cat_desc = ($jstatus) ? $db->escape(htmlspecialchars($cat['category_description'])) : $db->getEscaped(htmlspecialchars($cat['category_description']));
			$meta_desc = ($jstatus) ? $db->escape(htmlspecialchars($cat['category_meta_description'])) : $db->getEscaped(htmlspecialchars($cat['category_meta_description']));
			$meta_keys = ($jstatus) ? $db->escape(htmlspecialchars($cat['category_keywords'])) : $db->getEscaped(htmlspecialchars($cat['category_keywords']));
			
			$q = "INSERT INTO `#__mijoshop_category` ( `category_id` , `image` , `parent_id` , `date_added` , `date_modified` , `status` , `sort_order`) VALUES ('". $cat['category_id']."', '".$cat_image."', '".$cat['category_parent_id']."', '".$datec."', '".$datem."', '".$cat['category_published']."', '".$cat['category_ordering']."' )";
			$db->setQuery($q);
			$db->query();
			
			$q = "INSERT INTO `#__mijoshop_category_description` (`category_id` , `language_id` , `name` , `description` , `meta_description` , `meta_keyword`) VALUES ('". $cat['category_id']."', '".$oc_lang_id."', '".$cat_name."', '".$cat_desc."' , '".$meta_desc."' , '".$meta_keys."' )";
			$db->setQuery($q);
			$db->query();
			
			$q = "INSERT INTO `#__mijoshop_category_to_store` (`category_id` , `store_id`) VALUES ('".$cat['category_id']."' , '0' )";
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
		$db->setQuery("SELECT category_id FROM `#__hikashop_category` WHERE category_type = 'product' AND category_id != '2' ");
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
		
        $db->setQuery("SELECT category_parent_id FROM `#__hikashop_category` WHERE category_id = ".$cat_id);
        $parent_id = $db->loadResult();

        if ((int)$parent_id != 2) {
            $path[] = $parent_id;
            $path = self::_getPath($parent_id, $path);
        }

        return $path;
    }
  	
  	public function importProducts($post) {
		$db = JFactory::getDBO();
		$jstatus = MijoShop::get('base')->is30();

		$oc_lang_id = (int)$this->config->get('config_language_id');
	 
		$q = "SELECT * FROM #__hikashop_product";
		$db->setQuery($q);
		$pros = $db->loadAssocList();
		
		if (empty($pros)) {
			echo '<strong>No product to import.</strong>';
			exit;
		}
		
		foreach($pros as $pro){
			if ($pro['product_published'] == '1'){
				$status = '1';
			}
			else{
				$status = '0';
			}
		
			$q = "SELECT file_path FROM `#__hikashop_file` WHERE file_type = 'product' AND file_ref_id = ".$pro['product_id'];
			$db->setQuery($q);
			$file = $db->loadAssoc();
		
			$q = "SELECT price_value FROM `#__hikashop_price` WHERE price_product_id = ".$pro['product_id'];
			$db->setQuery($q);
			$price = $db->loadAssoc();
			
			$datec = ($jstatus) ? JFactory::getDate($pro['product_created'])->toSql() : JFactory::getDate($pro['product_created'])->toMySQL();
			$datem = ($jstatus) ? JFactory::getDate($pro['product_modified'])->toSql() : JFactory::getDate($pro['product_modified'])->toMySQL();
			$datea = ($jstatus) ? JFactory::getDate($pro['product_sale_start'])->toSql() : JFactory::getDate($pro['product_sale_start'])->toMySQL();
			
			$pro_image = empty($file['file_path']) ? '' : (($jstatus) ? 'data/'.$db->escape($file['file_path']) : 'data/'.$db->getEscaped($file['file_path']));
			
			$pro_price = ($jstatus) ? $db->escape($price['price_value']) : $db->getEscaped($price['price_value']);
			$pro_name = ($jstatus) ? $db->escape(htmlspecialchars($pro['product_name'])) : $db->getEscaped(htmlspecialchars($pro['product_name']));
			$pro_desc = ($jstatus) ? $db->escape(htmlspecialchars($pro['product_description'])) : $db->getEscaped(htmlspecialchars($pro['product_description']));
			$meta_desc = ($jstatus) ? $db->escape(htmlspecialchars($pro['product_meta_description'])) : $db->getEscaped(htmlspecialchars($pro['product_meta_description']));
			$meta_keys = ($jstatus) ? $db->escape(htmlspecialchars($pro['product_keywords'])) : $db->getEscaped(htmlspecialchars($pro['product_keywords']));
			
			$q = "INSERT INTO `#__mijoshop_product` (`product_id`, `model`, `sku`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `tax_class_id`, `weight`, `weight_class_id`, `length`, `width`, `height`, `status`, `date_added` , `date_modified`, `date_available`, `viewed`) VALUES ('".$pro['product_id']."', '".$pro['product_code']."', '".$pro['product_code']."', '', ".$pro['product_quantity'].", '7', '".$pro_image."', '".$pro['product_manufacturer_id']."', '1', '".$pro_price."', '', '".$pro['product_weight']."', '0', '".$pro['product_length']."', '".$pro['product_width']."', '".$pro['product_height']."',  '".$status."', '".$datec."', '".$datem."',  '".$datea."', '".$pro['product_hit']."')";
			$db->setQuery($q);
			$db->query();
			
			$q = "INSERT INTO `#__mijoshop_product_description` (`product_id` , `language_id` , `name` , `description` , `meta_description` , `meta_keyword`) VALUES ('".$pro['product_id']."' , '".$oc_lang_id."' , '".$pro_name."' , '".$pro_desc."' , '".$meta_desc."' , '".$meta_keys."')";
			$db->setQuery($q);
			$db->query();
			
			$q = "INSERT INTO `#__mijoshop_product_to_store` (`product_id` , `store_id`) VALUES ('".$pro['product_id']."' , '0')";
			$db->setQuery($q);
			$db->query();
	    
			echo 'Importing <i>' . $pro['product_name'] .'</i> : Completed.<br />';
		}
	  
		$q = "SELECT * FROM `#__hikashop_product_related` WHERE product_related_type = 'related' ";
		$db->setQuery($q);
		$results = $db->loadAssocList();
		
		if (!empty($results)) {
			foreach($results as $ptrlt) {
				$ptjr = "INSERT INTO `#__mijoshop_product_related` (`product_id`, `related_id`) VALUES ('".$ptrlt['product_id']."', '".$ptrlt['product_related_id']."');";
				$db->setQuery($ptjr);
				$db->query();
			}
		}
	  
		$q = "SELECT * FROM `#__hikashop_product_category` ";
		$db->setQuery($q);
		$results = $db->loadAssocList();
		
		if (!empty($results)) {
			foreach($results as $ptcs) {
				$ptjc = "INSERT INTO `#__mijoshop_product_to_category` (`product_id`, `category_id`) VALUES ('".$ptcs['product_id']."', '".$ptcs['category_id']."');";
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
	  
		$q = "SELECT category_id, category_name FROM `#__hikashop_category` WHERE category_type = 'manufacturer'";
		$db->setQuery($q);
		$mans = $db->loadAssocList();
		
		if (empty($mans)) {
			echo '<strong>No manufacturer to import.</strong>';
			exit;
		}
		
		foreach($mans as $man) {
			$q = "SELECT file_path FROM `#__hikashop_file` WHERE file_type = 'category' AND file_ref_id = ".$man['category_id'];
			$db->setQuery($q);
			$file = $db->loadAssoc();
			
			$man_image = empty($file['file_path']) ? '' : (($jstatus) ? 'data/'.$db->escape($file['file_path']) : 'data/'.$db->getEscaped($file['file_path']));
			$man_name = ($jstatus) ? $db->escape(htmlspecialchars($man['category_name'])) : $db->getEscaped(htmlspecialchars($man['category_name']));
			
			$q = "INSERT INTO `#__mijoshop_manufacturer` (`manufacturer_id`, `name`, `image`) VALUES ('".$man['category_id']."', '".$man_name."', '".$man_image."');";
			$db->setQuery($q);
			$db->query();
			
			$q = "INSERT INTO `#__mijoshop_manufacturer_to_store` (`manufacturer_id` , `store_id`) VALUES ('".$man['category_id']."' , '0')";
			$db->setQuery($q);
			$db->query();
			
			echo 'Importing <i>' . $man['category_name'] .'</i> : Completed.<br />';
		}
		
		echo '<strong>Manufacturers has been imported successfully.</strong><br />';
		exit;
	}

    public function importUsers($post) {
        $db = JFactory::getDBO();
        $jstatus = MijoShop::get('base')->is30();
        $oc_lang_id = (int)$this->config->get('config_language_id');

        $query = "SELECT user_id FROM `#__hikashop_user`";
        $db->setQuery($query);
        $users = $db->loadAssocList();

        if (empty($users)) {
            echo '<strong>No user to import.</strong>';
            exit;
        }

        foreach($users as $user) {
            $query = "SELECT * FROM `#__hikashop_address` WHERE address_user_id = '".$user['user_id']."'";
            $db->setQuery($query);
            $addresses = $db->loadAssocList();

            if(!empty($addresses)){
                foreach($addresses AS $address){
                    $country_id = explode("_", $address['address_country']);
                    $country_id = end($country_id);
                    $state_id = explode("_", $address['address_state']);
                    $state_id = end($state_id);

                    $query = "SELECT zone_code_2 AS code2, zone_code_3 AS code3 FROM `#__hikashop_zone` WHERE zone_id = '".$country_id."'";
                    $db->setQuery($query);
                    $country = $db->loadAssoc();

                    $query = "SELECT zone_code_2 AS code2, zone_code_3 AS code3 FROM `#__hikashop_zone` WHERE zone_id = '".$state_id."'";
                    $db->setQuery($query);
                    $zone = $db->loadAssoc();

                    $query = "SELECT country_id FROM `#__mijoshop_country` WHERE iso_code_2 = '".$country['code2']."' AND iso_code_3 = '".$country['code3']."'";
                    $db->setQuery($query);
                    $oc_country = $db->loadResult();

                    $query = "SELECT zone_id FROM `#__mijoshop_zone` WHERE code = '".$zone['code3']."'";
                    $db->setQuery($query);
                    $oc_zone = $db->loadResult();

                    $user_fname = ($jstatus) ? 'data/'.$db->escape(htmlspecialchars($address['address_firstname'])) : $db->getEscaped(htmlspecialchars($address['address_firstname']));
                    $user_lname = ($jstatus) ? 'data/'.$db->escape(htmlspecialchars($address['address_lastname'])) : $db->getEscaped(htmlspecialchars($address['address_lastname']));
                    $user_company = ($jstatus) ? 'data/'.$db->escape(htmlspecialchars($address['address_company'])) : $db->getEscaped(htmlspecialchars($address['address_company']));

                    $query = "SELECT ocustomer_id FROM `#__mijoshop_juser_ocustomer_map` WHERE juser_id = '".$user['user_id']."'";
                    $db->setQuery($query);
                    $customer_id = $db->loadResult();

                    $q = "UPDATE `#__mijoshop_customer` SET `firstname`='".$user_fname."', `lastname`='".$user_lname."', `telephone`='".$address['address_telephone']."', `fax`='".$address['address_fax']."' WHERE `customer_id`='".$customer_id."'";
                    $db->setQuery($q);
                    $db->query();

                    $q = "UPDATE `#__mijoshop_address` SET `firstname`='".$user_fname."', `lastname`='".$user_lname."', `company`='".$user_company."', `address_1`='".$address['address_street']."', `address_2`='".$address['address_street2']."', `city`='".$address['address_city']."', `postcode`='".$address['address_post_code']."', `country_id`='".$oc_country."', `zone_id`='".$oc_zone."' WHERE `customer_id`='".$customer_id."'";
                    $db->setQuery($q);
                    $db->query();

                    echo 'Importing <i>' . $user_fname .' '. $user_lname .'</i> : Completed.<br />';
                }
            }
            else {
                echo 'There is no address for user ID <i> '. $user['user_id'] .'</i>.<br />';
            }
        }

        echo '<strong>Users has been imported successfully.</strong><br />';
        exit;
    }
	
	public function copyImages($post) {
		$all_images = JPATH_SITE.'/media/com_hikashop/upload/';
		
		self::_copyImages($all_images);
	  
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