<?php 
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, www.mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

jimport('joomla.filesystem.file');
jimport('joomla.filesystem.folder');

class ModelToolVirtuemart extends Model {
  	
  	public function importCategories($post){
		$db = JFactory::getDBO();
		$version = self::_getVmVersion();
		$oc_lang_id = (int)$this->config->get('config_language_id');
		$oc_lang = MijoShop::get('db')->getLanguage($oc_lang_id);
		
		if ($version == '1') {
			$q = "SELECT code, language_id FROM #__mijoshop_language WHERE code != '{$oc_lang['code']}'";
		}
		else {
			$q = "SELECT code, language_id, locale AS langcode FROM #__mijoshop_language ORDER BY language_id";
		}
		$db->setQuery($q);
		$shoplangs = $db->loadAssocList();
		
		$l = $m = 0;
		if ($version == '1') {
			$query = "SELECT c.category_id, c.category_name, c.category_description, c.category_full_image, c.cdate, c.mdate, cd.category_parent_id, cd.category_child_id, c.category_publish AS published FROM #__vm_category AS c, #__vm_category_xref AS cd WHERE c.category_id = cd.category_child_id ORDER BY c.category_id";
		
			$db->setQuery($query);
			$cats = $db->loadAssocList();
			
			self::importCategoriesToDB($cats, $oc_lang_id, $shoplangs);
		
			if (empty($cats)) {
				echo '<strong>No category to import.</strong>';
				exit;
			}
		}
		else {
			if (!empty($shoplangs)) {
				
				foreach ($shoplangs AS $shoplang) {
					$l++;
					
					$lang_code = explode(',' , $shoplang['langcode']);
					$last = array_pop($lang_code);
					$lang_code = end($lang_code);
					$lang_code = strtolower(trim($lang_code));
					$lang_code = str_replace("-", "_", $lang_code);
					
					$oc_lang_id = $shoplang['language_id'];
					
					$query = "SELECT c.virtuemart_category_id AS category_id, ceg.category_name, ceg.category_description, ceg.metadesc, ceg.metakey, c.created_on AS cdate, c.modified_on AS mdate, cc.category_parent_id, cc.category_child_id, c.published "
							."FROM #__virtuemart_categories AS c, #__virtuemart_categories_{$lang_code} AS ceg, #__virtuemart_category_categories AS cc "
							."WHERE c.virtuemart_category_id = ceg.virtuemart_category_id AND c.virtuemart_category_id = cc.category_child_id ORDER BY c.virtuemart_category_id";
		
					$db->setQuery($query);
					$cats = $db->loadAssocList();
					
					self::importCategoriesToDB($cats, $oc_lang_id, $shoplangs);
			
					if (empty($cats)) {
						echo '<strong>No category to import for '.ucfirst($last).'.</strong><br/>';
						$m++;
						continue;
					}
				}
			}
		}
		
		self::_addCategoryPath();
		
		if ($l == $m && $version != '1') {
			exit;
		}
		
		echo '<strong>Categories has been imported successfully.</strong><br />';
		exit;
	}
  	
  	public function _addCategoryPath() {
        $db = JFactory::getDBO();
		$version = self::_getVmVersion();
		
		if ($version == '1') {
			$db->setQuery("SELECT category_child_id FROM `#__vm_category_xref`");
		} else {
			$db->setQuery("SELECT category_child_id FROM `#__virtuemart_category_categories`");
		}
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
		$version = self::_getVmVersion();
		
		if ($version == '1') {
			$db->setQuery("SELECT category_parent_id FROM `#__vm_category_xref` WHERE category_child_id = ".$cat_id);
		} else {
			$db->setQuery("SELECT category_parent_id FROM `#__virtuemart_category_categories` WHERE category_child_id = ".$cat_id);
		}
        $parent_id = $db->loadResult();

        if ((int)$parent_id != 0) {
            $path[] = $parent_id;
            $path = self::_getPath($parent_id, $path);
        }

        return $path;
    }
  	
  	public function importCategoriesToDB($cats, $oc_lang_id, $shoplangs) {
		$db = JFactory::getDBO();
        $version = self::_getVmVersion();
		$jstatus = MijoShop::get('base')->is30();
		
		$i = 0;
		foreach($cats as $cat) {
			if ($version == '1') {
				if ($cat['published'] == 'Y'){
					$cat['published'] = '1';
				}
				else {
					$cat['published'] = '0';
				}
			}
			
			if ($version == '2') {
				$q = "SELECT file_url FROM #__virtuemart_category_medias AS cm, #__virtuemart_medias AS m WHERE cm.virtuemart_media_id = m.virtuemart_media_id AND cm.virtuemart_category_id = ".$cat['category_id'];
				$db->setQuery($q);
				$cat['category_full_image'] = $db->loadResult();
				$cat['category_full_image'] = str_replace('images/stories/virtuemart/category/', '', $cat['category_full_image']);
				
			}
			
			$datec = ($jstatus) ? JFactory::getDate($cat['cdate'])->toSql() : JFactory::getDate($cat['cdate'])->toMySQL();
			$datem = ($jstatus) ? JFactory::getDate($cat['mdate'])->toSql() : JFactory::getDate($cat['mdate'])->toMySQL();
			
			$cat_image = empty($cat['category_full_image']) ? '' : (($jstatus) ? 'data/'.$db->escape($cat['category_full_image']) : 'data/'.$db->getEscaped($cat['category_full_image']));
			$cat_metadesc = empty($cat['metadesc']) ? '' : (($jstatus) ? 'data/'.$db->escape($cat['metadesc']) : 'data/'.$db->getEscaped($cat['metadesc']));
			$cat_metakey = empty($cat['metakey']) ? '' : (($jstatus) ? 'data/'.$db->escape($cat['metakey']) : 'data/'.$db->getEscaped($cat['metakey']));
			$cat_name = ($jstatus) ? $db->escape($cat['category_name']) : $db->getEscaped($cat['category_name']);
			$cat_desc = ($jstatus) ? $db->escape($cat['category_description']) : $db->getEscaped($cat['category_description']);
			
			$q = "INSERT INTO `#__mijoshop_category` (`category_id`, `image`, `parent_id`, `sort_order`, `date_added`, `date_modified`, `status`) VALUES ('". $cat['category_id']."', '".$cat_image."', '".$cat['category_parent_id']."', '".$i."', '".$datec."', '".$datem."', '".$cat['published']."')";
			$db->setQuery($q);
			$db->query();
			
			$jpcat = "INSERT INTO `#__mijoshop_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`) VALUES ('". $cat['category_id']."', '".$oc_lang_id."', '".$cat_name."', '". $cat_desc."', '". $cat_metadesc."', '". $cat_metakey."')";
			$db->setQuery($jpcat);
			$db->query();
			
			$q = "INSERT INTO `#__mijoshop_category_to_store` (`category_id` , `store_id`) VALUES ('".$cat['category_id']."' , '0')";
			$db->setQuery($q);
			$db->query();
			
			if ($version == '1' && !empty($shoplangs)) {
				foreach($shoplangs as $shoplang){
					$q = "SELECT id FROM #__languages WHERE `shortcode`='{$shoplang['code']}'";
					$db->setQuery($q);
					$joomlang = $db->loadResult();
					
					if(!empty($joomlang)){
						$q = "SELECT language_id FROM `#__mijoshop_category_description` WHERE `language_id`='{$shoplang['language_id']}' AND `category_id`='{$cat['category_id']}'";
						$db->setQuery($q);
						$existss = $db->loadResult();
						
						$q = "SELECT value FROM #__jf_content WHERE reference_id = '{$cat['category_id']}' AND reference_field = 'category_name' AND `language_id`={$joomlang}";
						$db->setQuery($q);
						$joomfishname = ($jstatus) ? $db->escape($db->loadResult()) : $db->getEscaped($db->loadResult());
						
						$q = "SELECT value FROM #__jf_content WHERE reference_id = '{$cat['category_id']}' AND reference_field = 'category_description' AND `language_id`={$joomlang}";
						$db->setQuery($q);
						$joomfishdesc = ($jstatus) ? $db->escape($db->loadResult()) : $db->getEscaped($db->loadResult());
						
						if(!empty($joomfishname)){
							if(!empty($existss)){
								$q = "UPDATE `#__mijoshop_category_description` SET `name`='{$joomfishname}', `description`='{$joomfishdesc}' WHERE `language_id`='{$shoplang['language_id']}' AND category_id='{$cat['category_id']}'";
								$db->setQuery($q);
								$db->query();
							}
							else {
								$q = "INSERT INTO `#__mijoshop_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`) VALUES ('".$cat['category_id']."' , '".$shoplang['language_id']."' , '".$joomfishname."' , '".$joomfishdesc."', '". $cat_metadesc."', '". $cat_metakey."')";
								$db->setQuery($q);
								$db->query();
							}
						}
					}
				}
			}

			echo 'Importing <i>' . $cat['category_name'] .'</i> : Completed.<br />';
			$i++;
		}
	}
  	
  	public function importProducts($post) {
		$db = JFactory::getDBO();
		$version = self::_getVmVersion();
		
		$oc_lang_id = (int)$this->config->get('config_language_id');
		$oc_lang = MijoShop::get('db')->getLanguage($oc_lang_id);
		
		if ($version == '1') {
			$q = "SELECT code, language_id, locale FROM #__mijoshop_language WHERE code != '{$oc_lang['code']}'";
		}
		else {
			$q = "SELECT code, language_id, locale AS langcode FROM #__mijoshop_language ORDER BY language_id";
		}
		$db->setQuery($q);
		$shoplangs = $db->loadAssocList();
		
		$l = $m = 0;
		if ($version == '1') {
			$query = "SELECT p.product_id, p.product_full_image, p.product_sku, p.product_in_stock, p.cdate, p.mdate, p.product_desc, p.product_weight, p.product_name, p.product_publish AS published, pp.product_price FROM #__vm_product AS p LEFT JOIN #__vm_product_price AS pp ON p.product_id = pp.product_id WHERE p.product_parent_id='0'";
			
			$db->setQuery($query);
			$pros = $db->loadAssocList();
			
			self::importProductsToDB($pros, $oc_lang_id, $shoplangs);
		
			if (empty($pros)) {
				echo '<strong>No product to import.</strong>';
				exit;
			}
		}
		else {
			if(!empty($shoplangs)){
				foreach ($shoplangs AS $shoplang){
					$l++;
					$lang_code = explode(',' , $shoplang['langcode']);
					$last = array_pop($lang_code);
					$lang_code = end($lang_code);
					$lang_code = strtolower(trim($lang_code));
					$lang_code = str_replace("-", "_", $lang_code);
					
					$oc_lang_id = $shoplang['language_id'];
					
					$query = "SELECT p.virtuemart_product_id AS product_id, p.product_sku, p.product_in_stock, p.product_weight, p.published, p.created_on AS cdate, p.modified_on AS mdate, peg.product_name, peg.product_desc, peg.metadesc, peg.metakey "
							."FROM #__virtuemart_products AS p, #__virtuemart_products_{$lang_code} AS peg "
							."WHERE p.virtuemart_product_id = peg.virtuemart_product_id ORDER BY p.virtuemart_product_id";
		
					$db->setQuery($query);
					$pros = $db->loadAssocList();
					
					self::importProductsToDB($pros, $oc_lang_id, $shoplangs);
			
					if (empty($pros)) {
						echo '<strong>No product to import for '.ucfirst($last).'.</strong><br/>';
						$m++;
						continue;
					}
				}
			}
		}
		
		if ($l == $m && $version != '1') {
			exit;
		}
		
		if ($version == '1') {
			$q = "SELECT product_id, category_id FROM #__vm_product_category_xref";
		}
		else {
			$q = "SELECT virtuemart_product_id AS product_id, virtuemart_category_id AS category_id FROM #__virtuemart_product_categories";
		}
		
		$db->setQuery($q);
		$results = $db->loadAssocList();
		
		if (!empty($results)) {
			foreach($results as $ptcs) {
				$q = "INSERT INTO `#__mijoshop_product_to_category` (`product_id`, `category_id`) VALUES ('".$ptcs['product_id']."', '".$ptcs['category_id']."');";
				$db->setQuery($q);
				$db->query();
			}
		}

		echo '<strong>Products has been imported successfully.</strong><br />';
		exit;
	}
  	
  	public function importProductsToDB($pros, $oc_lang_id, $shoplangs) {
		$db = JFactory::getDBO();
        $version = self::_getVmVersion();
		$jstatus = MijoShop::get('base')->is30();
		
		$i = 0;
		foreach($pros as $pro){
			if ($version == '1') {
				if ($pro['published'] == 'Y'){
					$pro['published'] = '1';
				}
				else {
					$pro['published'] = '0';
				}
			
				$q = "SELECT manufacturer_id FROM #__vm_product_mf_xref WHERE product_id = ".$pro['product_id'];
				$db->setQuery($q);
				$man_id = $db->loadResult();
			}
			else {
				$q = "SELECT product_price FROM #__virtuemart_product_prices WHERE virtuemart_product_id = ".$pro['product_id'];
				$db->setQuery($q);
				$pro['product_price'] = $db->loadResult();
				
				$q = "SELECT m.file_url, pm.virtuemart_media_id, pm.ordering FROM #__virtuemart_product_medias AS pm, #__virtuemart_medias AS m WHERE pm.virtuemart_media_id = m.virtuemart_media_id AND pm.virtuemart_product_id = ".$pro['product_id'];
				$db->setQuery($q);
				$pro_imagess = $db->loadAssocList();
				foreach($pro_imagess as $pro_images){
					$extra_image = str_replace('images/stories/virtuemart/product/', '', $pro_images['file_url']);
					
					if($pro_images['ordering'] == 1){
						$pro['product_full_image'] = $extra_image;
					}
					else {
						$pro_image = (($jstatus) ? 'data/'.$db->escape($extra_image) : 'data/'.$db->getEscaped($extra_image));
						$q = "INSERT INTO `#__mijoshop_product_image` (`product_image_id` , `product_id` , `image` , `sort_order`) VALUES ('".$pro_images['virtuemart_media_id']."' , '".$pro['product_id']."' , '".$pro_image."' , '".$pro_images['ordering']."')";
						$db->setQuery($q);
						$db->query();
					}
				}
			
				$q = "SELECT virtuemart_manufacturer_id FROM #__virtuemart_product_manufacturers WHERE virtuemart_product_id = ".$pro['product_id'];
				$db->setQuery($q);
				$man_id = $db->loadResult();
			}
			
			$datec = ($jstatus) ? JFactory::getDate($pro['cdate'])->toSql() : JFactory::getDate($pro['cdate'])->toMySQL();
			$datem = ($jstatus) ? JFactory::getDate($pro['mdate'])->toSql() : JFactory::getDate($pro['mdate'])->toMySQL();
			
			$pro_image = empty($pro['product_full_image']) ? '' : (($jstatus) ? 'data/'.$db->escape($pro['product_full_image']) : 'data/'.$db->getEscaped($pro['product_full_image']));
			$pro_metadesc = empty($pro['metadesc']) ? '' : (($jstatus) ? 'data/'.$db->escape($pro['metadesc']) : 'data/'.$db->getEscaped($pro['metadesc']));
			$pro_metakey = empty($pro['metakey']) ? '' : (($jstatus) ? 'data/'.$db->escape($pro['metakey']) : 'data/'.$db->getEscaped($pro['metakey']));
			$pro_name = ($jstatus) ? $db->escape($pro['product_name']) : $db->getEscaped($pro['product_name']);
			$pro_desc = ($jstatus) ? $db->escape($pro['product_desc']) : $db->getEscaped($pro['product_desc']);
			$pro_price = ($jstatus) ? $db->escape($pro['product_price']) : $db->getEscaped($pro['product_price']);
			
			$q = "INSERT INTO `#__mijoshop_product` (`product_id`, `model`, `sku`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `status`, `date_added`, `date_modified`, `viewed`) VALUES ('".$pro['product_id']."', '".$pro['product_sku']."', '".$pro['product_sku']."', '', '".$pro['product_in_stock']."', '7', '".$pro_image."', '".$man_id."', '1', '".$pro_price."', '', CURDATE(), '".$pro['product_weight']."', '0', '0.00', '0.00', '0.00',  '".$pro['published']."', '".$datec."', '".$datem."', '0')";
			$db->setQuery($q);
			$db->query();
			
			$q = "INSERT INTO `#__mijoshop_product_description` (`product_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`) VALUES ('".$pro['product_id']."' , '".$oc_lang_id."' , '".$pro_name."' , '".$pro_desc."', '". $pro_metadesc."', '". $pro_metakey."')";
			$db->setQuery($q);
			$db->query();
			
			$q = "INSERT INTO `#__mijoshop_product_to_store` (`product_id` , `store_id`) VALUES ('".$pro['product_id']."' , '0')";
			$db->setQuery($q);
			$db->query();
			
			if ($version == '1' && !empty($shoplangs)) {
				foreach($shoplangs as $shoplang){
					$q = "SELECT id FROM #__languages WHERE `shortcode`='{$shoplang['code']}'";
					$db->setQuery($q);
					$joomlang = $db->loadResult();
					
					if(!empty($joomlang)){
						$q = "SELECT language_id FROM `#__mijoshop_product_description` WHERE `language_id`='{$shoplang['language_id']}' AND `product_id`='{$pro['product_id']}'";
						$db->setQuery($q);
						$existss = $db->loadResult();
						
						$q = "SELECT value FROM #__jf_content WHERE reference_id = '{$pro['product_id']}' AND reference_field = 'product_name' AND `language_id`={$joomlang}";
						$db->setQuery($q);
						$joomfishname = ($jstatus) ? $db->escape($db->loadResult()) : $db->getEscaped($db->loadResult());
						
						$q = "SELECT value FROM #__jf_content WHERE reference_id = '{$pro['product_id']}' AND reference_field = 'product_desc' AND `language_id`={$joomlang}";
						$db->setQuery($q);
						$joomfishdescs = ($jstatus) ? $db->escape($db->loadResult()) : $db->getEscaped($db->loadResult());
						
						if(!empty($joomfishname)){
							if(!empty($existss)){
								$q = "UPDATE `#__mijoshop_product_description` SET `name`='{$joomfishname}', `description`='{$joomfishdescs}' WHERE `language_id`='{$shoplang['language_id']}' AND product_id='{$pro['product_id']}'";
								$db->setQuery($q);
								$db->query();
							}
							else {
								$q = "INSERT INTO `#__mijoshop_product_description` (`product_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`) VALUES ('".$pro['product_id']."' , '".$shoplang['language_id']."' , '".$joomfishname."', '".$joomfishdescs."', '". $pro_metadesc."', '". $pro_metakey."')";
								$db->setQuery($q);
								$db->query();
							}
						}
					}
				}
			}
		
			echo 'Importing <i>' . $pro['product_name'] .'</i> : Completed.<br />';
		}
	}
	
	public function importManufacturers($post) {
		$db = JFactory::getDBO();
		$version = self::_getVmVersion();
		$jstatus = MijoShop::get('base')->is30();
		$oc_lang_id = (int)$this->config->get('config_language_id');
		
		if ($version == '1') {
			$query = "SELECT manufacturer_id, mf_name FROM `#__vm_manufacturer`";
		}
		else {
			$query = "SELECT virtuemart_manufacturer_id AS manufacturer_id, mf_name FROM `#__virtuemart_manufacturers_en_gb`";
		}
		
		$db->setQuery($query);
		$mans = $db->loadAssocList();
		
		if (empty($mans)) {
			echo '<strong>No manufacturer to import.</strong>';
			exit;
		}
		
		foreach($mans as $man) {
			if ($version == '2') {
				$q = "SELECT file_url FROM #__virtuemart_manufacturer_medias AS mm, #__virtuemart_medias AS m WHERE mm.virtuemart_media_id = m.virtuemart_media_id AND mm.virtuemart_manufacturer_id = ".$man['manufacturer_id'];
				$db->setQuery($q);
				$man['image'] = $db->loadResult();
				$man['image'] = str_replace('images/stories/virtuemart/manufacturer/', '', $man['image']);
			}
			
			$man_image = empty($pro['image']) ? '' : (($jstatus) ? 'data/'.$db->escape($man['image']) : 'data/'.$db->getEscaped($man['image']));
			$man_name = ($jstatus) ? 'data/'.$db->escape(htmlspecialchars($man['mf_name'])) : $db->getEscaped(htmlspecialchars($man['mf_name']));
			
			$q = "INSERT INTO `#__mijoshop_manufacturer` (`manufacturer_id`, `name`, `image`) VALUES ('".$man['manufacturer_id']."', '".$man_name."', '".$man_image."');";
			$db->setQuery($q);
			$db->query();
			
			$q = "INSERT INTO `#__mijoshop_manufacturer_to_store` (`manufacturer_id` , `store_id`) VALUES ('".$man['manufacturer_id']."' , '0')";
			$db->setQuery($q);
			$db->query();
			
			echo 'Importing <i>' . $man['mf_name'] .'</i> : Completed.<br />';
		}
		
		echo '<strong>Manufacturers has been imported successfully.</strong><br />';
		exit;
	}

	public function importUsers($post) {
		$db = JFactory::getDBO();
		$version = self::_getVmVersion();
		$jstatus = MijoShop::get('base')->is30();

        $oc_lang_id = (int)$this->config->get('config_language_id');

		if ($version == '1') {
			$query = "SELECT user_id, company, first_name, last_name, phone_1, fax, address_1, address_2, city, country, state, zip FROM `#__vm_user_info`";
		}
		else {
			$query = "SELECT virtuemart_user_id AS user_id, virtuemart_userinfo_id AS userinfo_id, name, first_name, last_name, phone_1, company, fax, address_1, address_2, city, zip, virtuemart_country_id, virtuemart_state_id, created_on FROM `#__virtuemart_userinfos`";
		}

		$db->setQuery($query);
		$users = $db->loadAssocList();

		if (empty($users)) {
			echo '<strong>No user to import.</strong>';
			exit;
		}

		foreach($users as $user) {
            if ($version == '1') {
                $query = "SELECT country_2_code AS code2, country_3_code AS code3 FROM `#__vm_country` WHERE country_3_code ='".$user['country']."'";
            }
            else {
                $query = "SELECT country_2_code AS code2, country_3_code AS code3 FROM `#__virtuemart_countries` WHERE virtuemart_country_id = '".$user['virtuemart_country_id']."'";
            }
            $db->setQuery($query);
            $country = $db->loadAssoc();

            $query = "SELECT country_id FROM `#__mijoshop_country` WHERE iso_code_2 = '".$country['code2']."' AND iso_code_3 = '".$country['code3']."'";
            $db->setQuery($query);
            $oc_country = $db->loadResult();

            if ($version == '1') {
                $query = "SELECT state_2_code AS code2, state_3_code AS code3 FROM `#__vm_state` WHERE state_2_code ='".$user['state']."'";
            }
            else {
                $query = "SELECT state_2_code AS code2, state_3_code AS code3 FROM `#__virtuemart_states` WHERE virtuemart_state_id = '".$user['virtuemart_state_id']."'";
            }
            $db->setQuery($query);
            $zone = $db->loadAssoc();

            $query = "SELECT zone_id FROM `#__mijoshop_zone` WHERE code = '".$zone['code2']."' AND country_id='".$oc_country."'";
            $db->setQuery($query);
            $oc_zone = $db->loadResult();

            $query = "SELECT ocustomer_id FROM `#__mijoshop_juser_ocustomer_map` WHERE juser_id = '".$user['user_id']."'";
            $db->setQuery($query);
            $customer_id = $db->loadResult();

			$user_fname = ($jstatus) ? 'data/'.$db->escape(htmlspecialchars($user['first_name'])) : $db->getEscaped(htmlspecialchars($user['first_name']));
			$user_lname = ($jstatus) ? 'data/'.$db->escape(htmlspecialchars($user['last_name'])) : $db->getEscaped(htmlspecialchars($user['last_name']));
			$user_company = ($jstatus) ? 'data/'.$db->escape(htmlspecialchars($user['company'])) : $db->getEscaped(htmlspecialchars($user['company']));

            $fname = $lname = '';
            if(!empty($user_fname)){
                $fname = "`firstname`='".$user_fname."',";
            }
            if(!empty($user_lname)){
                $lname = "`lastname`='".$user_lname."',";
            }

            if(!empty($customer_id)){
                $q = "UPDATE `#__mijoshop_customer` SET ".$fname.$lname." `telephone`='".$user['phone_1']."', `fax`='".$user['fax']."' WHERE `customer_id`='".$customer_id."'";
                $db->setQuery($q);
                $db->query();

                $q = "UPDATE `#__mijoshop_address` SET ".$fname.$lname." `company`='".$user_company."', `address_1`='".$user['address_1']."', `address_2`='".$user['address_2']."', `city`='".$user['city']."', `postcode`='".$user['zip']."', `country_id`='".$oc_country."', `zone_id`='".$oc_zone."' WHERE `customer_id`='".$customer_id."'";
                $db->setQuery($q);
                $db->query();

                echo 'Importing <i>' . $user_fname .' '. $user_lname .'</i> : Completed.<br />';
            }
            else {
                echo '<i>'. $user_fname .' '. $user_lname .'</i> is not a Joomla! user.<br />';
            }
		}

		echo '<strong>Users has been imported successfully.</strong><br />';
		exit;
	}
	
	public function copyImages($post) {
		$version = self::_getVmVersion();
		
		if ($version == '1') {
			$vm_cats = JPATH_SITE.'/components/com_virtuemart/shop_image/category/';
			$vm_pros = JPATH_SITE.'/components/com_virtuemart/shop_image/product/';
			
			self::_copyImages($vm_cats);
			self::_copyImages($vm_pros);
		}
		else {
			$vm_cats = JPATH_SITE.'/images/stories/virtuemart/category/';
			$vm_pros = JPATH_SITE.'/images/stories/virtuemart/product/';
			$vm_mans = JPATH_SITE.'/images/stories/virtuemart/manufacturer/';
			$vm_shis = JPATH_SITE.'/images/stories/virtuemart/shipment/';
			$vm_vens = JPATH_SITE.'/images/stories/virtuemart/vendor/';
			
			self::_copyImages($vm_cats);
			self::_copyImages($vm_pros);
			self::_copyImages($vm_mans);
			self::_copyImages($vm_shis);
			self::_copyImages($vm_vens);
		}
	  
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