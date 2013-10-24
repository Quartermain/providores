<?php
/*
* @package		MijoShop
* @copyright	2009-2013 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

class ModelCommonEdit extends Model {

    public function changeStatus($type, $ids, $status, $extension = false) {
		$db = MijoShop::get('db');
		
        if($extension){
            foreach($ids as $id) {
                $db->run("UPDATE #__mijoshop_setting SET `value` = {$status} WHERE `group` = '{$id}' AND `key` = '{$id}_status'");
            }
        }
        else{
            foreach($ids as $id) {
                $db->run("UPDATE #__mijoshop_{$type} SET status = {$status} WHERE {$type}_id = {$id}");
            }
        }
    }

    public function updateLangId($old_id, $new_id){
        $results = array();
        $db      = MijoShop::get('db');
        $db_name = JFactory::getConfig()->get('db');
        $tables  = $db->run("SELECT TABLE_NAME from information_schema.COLUMNS WHERE TABLE_SCHEMA = '{$db_name}' AND COLUMN_NAME = 'language_id' AND TABLE_NAME LIKE '%mijoshop%' AND TABLE_NAME NOT LIKE '%mijoshop_language'", 'loadColumn');

        foreach($tables as $table){
            if(strpos($table, 'mijoshop_language') === true ){
                continue;
            }

            $result = $db->run("UPDATE {$table} SET language_id = {$new_id} WHERE language_id = {$old_id}");
            $results[$table] = $result;
        }

        return $results;
    }

    public function updateOcLang($old_id, $new_id){
        $db = MijoShop::get('db')->run("UPDATE #__mijoshop_language SET language_id = {$new_id} WHERE language_id = {$old_id}");
    }

    public function getJoomlaLangs(){
        $langs      = array();
        $db         = MijoShop::get('db');
        $results    =  $db->run("SELECT * FROM #__languages", 'loadAssocList');

        foreach($results as $result){
            $langs[$result['sef']] = $result;
        }

        return $langs;
    }

    public function getLanguages() {
        $language_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "language ORDER BY sort_order, name");

        foreach ($query->rows as $result) {
            $language_data[$result['code']] = array(
                'language_id' => $result['language_id'],
                'name'        => $result['name'],
                'code'        => $result['code'],
                'locale'      => $result['locale'],
                'image'       => $result['image'],
                'directory'   => $result['directory'],
                'filename'    => $result['filename'],
                'sort_order'  => $result['sort_order'],
                'status'      => $result['status']
            );
        }

        $this->cache->set('language', $language_data);

        return $language_data;
    }

    public function copyLang($def_lang_id, $language_id){
        $db      = MijoShop::get('db');

        $query = $db->run("SELECT * FROM #__mijoshop_attribute_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $attribute) {
            $db->run("INSERT IGNORE INTO #__mijoshop_attribute_description SET attribute_id = '" . (int)$attribute['attribute_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($attribute['name']) . "'", 'query');
        }

        // Attribute Group
        $query = $db->run("SELECT * FROM #__mijoshop_attribute_group_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $attribute_group) {
            $db->run("INSERT IGNORE INTO #__mijoshop_attribute_group_description SET attribute_group_id = '" . (int)$attribute_group['attribute_group_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($attribute_group['name']) . "'", 'query');
        }

        // Banner
        $query = $db->run("SELECT * FROM #__mijoshop_banner_image_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $banner_image) {
            $db->run("INSERT IGNORE INTO #__mijoshop_banner_image_description SET banner_image_id = '" . (int)$banner_image['banner_image_id'] . "', banner_id = '" . (int)$banner_image['banner_id'] . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($banner_image['title']) . "'", 'query');
        }

        // Category
        $query = $db->run("SELECT * FROM #__mijoshop_category_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $category) {
            $db->run("INSERT IGNORE INTO #__mijoshop_category_description SET category_id = '" . (int)$category['category_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($category['name']) . "', meta_description = '" . $this->db->escape($category['meta_description']) . "', meta_keyword = '" . $this->db->escape($category['meta_keyword']) . "', description = '" . $this->db->escape($category['description']) . "'", 'query');
        }

        // Customer Group
        $query = $db->run("SELECT * FROM #__mijoshop_customer_group_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $customer_group) {
            $db->run("INSERT IGNORE INTO #__mijoshop_customer_group_description SET customer_group_id = '" . (int)$customer_group['customer_group_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($customer_group['name']) . "', description = '" . $this->db->escape($customer_group['description']) . "'", 'query');
        }

        // Download
        $query = $db->run("SELECT * FROM #__mijoshop_download_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $download) {
            $db->run("INSERT IGNORE INTO #__mijoshop_download_description SET download_id = '" . (int)$download['download_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($download['name']) . "'", 'query');
        }

        // Filter
        $query = $db->run("SELECT * FROM #__mijoshop_filter_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $filter) {
            $db->run("INSERT IGNORE INTO #__mijoshop_filter_description SET filter_id = '" . (int)$filter['filter_id'] . "', language_id = '" . (int)$language_id . "', filter_group_id = '" . (int)$filter['filter_group_id'] . "', name = '" . $this->db->escape($filter['name']) . "'", 'query');
        }

        // Filter Group
        $query = $db->run("SELECT * FROM #__mijoshop_filter_group_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $filter_group) {
            $db->run("INSERT IGNORE INTO #__mijoshop_filter_group_description SET filter_group_id = '" . (int)$filter_group['filter_group_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($filter_group['name']) . "'", 'query');
        }

        // Information
        $query = $db->run("SELECT * FROM #__mijoshop_information_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $information) {
            $db->run("INSERT IGNORE INTO #__mijoshop_information_description SET information_id = '" . (int)$information['information_id'] . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($information['title']) . "', description = '" . $this->db->escape($information['description']) . "'", 'query');
        }

        // Length
        $query = $db->run("SELECT * FROM #__mijoshop_length_class_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $length) {
            $db->run("INSERT IGNORE INTO #__mijoshop_length_class_description SET length_class_id = '" . (int)$length['length_class_id'] . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($length['title']) . "', unit = '" . $this->db->escape($length['unit']) . "'", 'query');
        }

        // Option
        $query = $db->run("SELECT * FROM #__mijoshop_option_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $option) {
            $db->run("INSERT IGNORE INTO #__mijoshop_option_description SET option_id = '" . (int)$option['option_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($option['name']) . "'", 'query');
        }

        // Option Value
        $query = $db->run("SELECT * FROM #__mijoshop_option_value_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $option_value) {
            $db->run("INSERT IGNORE INTO #__mijoshop_option_value_description SET option_value_id = '" . (int)$option_value['option_value_id'] . "', language_id = '" . (int)$language_id . "', option_id = '" . (int)$option_value['option_id'] . "', name = '" . $this->db->escape($option_value['name']) . "'", 'query');
        }

        // Order Status
        $query = $db->run("SELECT * FROM #__mijoshop_order_status WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $order_status) {
            $db->run("INSERT IGNORE INTO #__mijoshop_order_status SET order_status_id = '" . (int)$order_status['order_status_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($order_status['name']) . "'", 'query');
        }

        // Product
        $query = $db->run("SELECT * FROM #__mijoshop_product_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $product) {
            $db->run("INSERT IGNORE INTO #__mijoshop_product_description SET product_id = '" . (int)$product['product_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($product['name']) . "', meta_description = '" . $this->db->escape($product['meta_description']) . "', meta_keyword = '" . $this->db->escape($product['meta_keyword']) . "', description = '" . $this->db->escape($product['description']) . "', tag = '" . $this->db->escape($product['tag']) . "'", 'query');
        }

        // Product Attribute
        $query = $db->run("SELECT * FROM #__mijoshop_product_attribute WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $product_attribute) {
            $db->run("INSERT IGNORE INTO #__mijoshop_product_attribute SET product_id = '" . (int)$product_attribute['product_id'] . "', attribute_id = '" . (int)$product_attribute['attribute_id'] . "', language_id = '" . (int)$language_id . "', text = '" . $this->db->escape($product_attribute['text']) . "'", 'query');
        }

        // Return Action
        $query = $db->run("SELECT * FROM #__mijoshop_return_action WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $return_action) {
            $db->run("INSERT IGNORE INTO #__mijoshop_return_action SET return_action_id = '" . (int)$return_action['return_action_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($return_action['name']) . "'", 'query');
        }

        // Return Reason
        $query = $db->run("SELECT * FROM #__mijoshop_return_reason WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $return_reason) {
            $db->run("INSERT IGNORE INTO #__mijoshop_return_reason SET return_reason_id = '" . (int)$return_reason['return_reason_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($return_reason['name']) . "'", 'query');
        }

        // Return Status
        $query = $db->run("SELECT * FROM #__mijoshop_return_status WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $return_status) {
            $db->run("INSERT IGNORE INTO #__mijoshop_return_status SET return_status_id = '" . (int)$return_status['return_status_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($return_status['name']) . "'", 'query');
        }

        // Stock Status
        $query = $db->run("SELECT * FROM #__mijoshop_stock_status WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $stock_status) {
            $db->run("INSERT IGNORE INTO #__mijoshop_stock_status SET stock_status_id = '" . (int)$stock_status['stock_status_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($stock_status['name']) . "'", 'query');
        }

        // Voucher Theme
        $query = $db->run("SELECT * FROM #__mijoshop_voucher_theme_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $voucher_theme) {
            $db->run("INSERT IGNORE INTO #__mijoshop_voucher_theme_description SET voucher_theme_id = '" . (int)$voucher_theme['voucher_theme_id'] . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($voucher_theme['name']) . "'", 'query');
        }

        // Weight Class
        $query = $db->run("SELECT * FROM #__mijoshop_weight_class_description WHERE language_id = '" . (int)$def_lang_id . "'", 'loadAssocList');

        foreach ($query as $weight_class) {
            $db->run("INSERT IGNORE INTO #__mijoshop_weight_class_description SET weight_class_id = '" . (int)$weight_class['weight_class_id'] . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($weight_class['title']) . "', unit = '" . $this->db->escape($weight_class['unit']) . "'", 'query');
        }
    }



    /*Enable/Disable Product with Category */
    /*private function _changeStatusProduct($selected, $status, $withcat = false){

        foreach($selected as $_selected) {
            if($withcat) {
                $count = MijoShop::get('db')->run("SELECT COUNT(category_id) FROM  #__mijoshop_product_to_category WHERE product_id = " . (int)$_selected, 'loadResult');
                if($count < 2){
                    MijoShop::get('db')->run("UPDATE #__mijoshop_product SET status = {$status} WHERE product_id = {$_selected}");
                }
            }

        }
    }*/

    /*private function _changeStatusCategory($selected, $status){
        foreach($selected as $_selected) {
            MijoShop::get('db')->run("UPDATE #__mijoshop_category SET status = {$status} WHERE category_id = {$_selected}");

            $products = MijoShop::get('db')->run("SELECT p.product_id FROM #__mijoshop_product p LEFT JOIN #__mijoshop_product_to_category p2c ON (p.product_id = p2c.product_id) WHERE p2c.category_id = '" . (int)$_selected . "'", 'loadResultArray');
            $this->_changeStatusProduct($products, (int)$status, true);
        }
    }*/
}