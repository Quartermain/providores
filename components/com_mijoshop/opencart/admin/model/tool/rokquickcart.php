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

class ModelToolRokquickcart extends Model {
  	
  	public function importProducts($post) {
		$db = JFactory::getDBO();
		$jstatus = MijoShop::get('base')->is30();
		
		$oc_lang_id = (int)$this->config->get('config_language_id');
	 
		$q = "SELECT * FROM #__rokquickcart";
		$db->setQuery($q);
		$pros = $db->loadAssocList();
		
		if (empty($pros)) {
			echo '<strong>No product to import.</strong>';
			exit;
		}
		
		foreach($pros as $pro){
			
			$images = explode("/", $pro['image']);
			if(!empty($images)){
				$pro_image = 'data/'.end($images);
			}
			//$pro_image = empty($pro['image']) ? '' : 'data/'.$db->getEscaped($pro['image']);
			
			$pro_name = ($jstatus) ? $db->escape(htmlspecialchars($pro['name'])) : $db->getEscaped(htmlspecialchars($pro['name']));
			$pro_desc = ($jstatus) ? $db->escape(htmlspecialchars($pro['description'])) : $db->getEscaped(htmlspecialchars($pro['description']));
			
			$q = "INSERT INTO `#__mijoshop_product` (`product_id`, `model`, `sku`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `tax_class_id`, `weight`, `weight_class_id`, `length`, `width`, `height`, `status`, `sort_order`) VALUES ('".$pro['id']."', '', '', '', '9999', '7', '".$pro_image."', '', '1', '".$pro['price']."', '', '".$pro['product_weight']."', '0', '0.00', '0.00', '0.00', '".$pro['published']."', '".$pro['ordering']."')";
			$db->setQuery($q);
			$db->query();
			
			$q = "INSERT INTO `#__mijoshop_product_description` (`product_id` , `language_id` , `name` , `description`) VALUES ('".$pro['id']."' , '".$oc_lang_id."' , '".$pro_name."' , '".$pro_desc."')";
			$db->setQuery($q);
			$db->query();
			
			$q = "INSERT INTO `#__mijoshop_product_to_store` (`product_id`, `store_id`) VALUES ('".$pro['id']."' , '0')";
			$db->setQuery($q);
			$db->query();
	    
			echo 'Importing <i>' . $pro['name'] .'</i> : Completed.<br />';
		}

		echo '<strong>Products has been imported successfully.</strong><br />';
		exit;
	}
	
	public function copyImages($post) {
		$pro_images = JPATH_SITE.'/images/rokquickcart/samples/';
		self::_copyImages($pro_images);
	  
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