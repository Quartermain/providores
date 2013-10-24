<?php 
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

jimport('joomla.filesystem.file');
jimport('joomla.filesystem.folder');

class ModelToolAceshop extends Model {
  	
  	public function migrateDatabase($post){
		$version = self::_getAceShopVersion();
        $this->com = $post['component'];

        $db = MijoShop::get('db');
		$dbo = JFactory::getDBO();

        $db_tables = $dbo->getTableList();
        $db_prefix = $dbo->getPrefix();

        foreach ($db_tables as $table) {
            if (strpos($table, $db_prefix.$this->com.'_') === false) {
                continue;
            }

            $table = str_replace($db_prefix.$this->com.'_', '', $table);

            $db->run("DROP TABLE IF EXISTS #__mijoshop_{$table}", 'query');

            $db->run("RENAME TABLE #__{$this->com}_{$table} TO #__mijoshop_{$table}", 'query');
        }
		
		if ($version == '1') {
			$db->run("DROP TABLE IF EXISTS #__mijoshop_customer_online", 'query');
			$db->run("DROP TABLE IF EXISTS #__mijoshop_customer_ip_blacklist", 'query');
			$db->run("DROP TABLE IF EXISTS #__mijoshop_order_fraud", 'query');
			$db->run("DROP TABLE IF EXISTS #__mijoshop_order_voucher", 'query');
			$db->run("DROP TABLE IF EXISTS #__mijoshop_customer_group_description", 'query');
			$db->run("DROP TABLE IF EXISTS #__mijoshop_order_misc", 'query');
		}
		
        $p = $db->run('SELECT permission FROM #__mijoshop_user_group WHERE user_group_id = 1', 'loadResult');
        $permissions = unserialize($p);

        $permissions['access'][] = 'tool/'.$this->com;
        $permissions['modify'][] = 'tool/'.$this->com;

        $permissions = serialize($permissions);

        $db->run("UPDATE #__mijoshop_user_group SET permission = '{$permissions}' WHERE user_group_id = 1", 'query');
		
		if ($version == '1') {
			$this->_upgradeTo153();

			$this->_upgradeTo154();
		}
		
		MijoShop::get('install')->upgradeDbToV155();
		MijoShop::get('install')->createIntegrationTables();
		
		echo '<strong>Database migration has been done successfully.</strong><br />';
		exit;
	}

    public function migrateFiles($post) {
		$version = self::_getAceShopVersion();
        $this->com = $post['component'];

        $this->mijoshop_path = JPATH_ROOT.'/components/com_mijoshop/opencart';
        $this->old_path = JPATH_ROOT.'/components/com_'.$this->com.'/opencart';

        // Images & Downloads
        JFolder::copy($this->old_path.'/image', $this->mijoshop_path.'/image', '', true);
        JFolder::copy($this->old_path.'/download', $this->mijoshop_path.'/download', '', true);

        // Languages
        //JFolder::copy($this->old_path.'/admin/language', $this->mijoshop_path.'/admin/language', '', true);
        //JFolder::copy($this->old_path.'/catalog/language', $this->mijoshop_path.'/catalog/language', '', true);

        self::_copyVqmod();
        self::_copyTemplates();
        self::_copyExtensions();
        self::_emptyCache();

        echo '<strong>Files migration has been done successfully.</strong><br />';
        exit;
    }
	
	public function fixMenus($post) {
		$version = self::_getAceShopVersion();
        $this->com = $post['component'];

        $db = JFactory::getDBO();
        $and = 'AND menutype != "main"';

		$db->setQuery("SELECT id, link FROM #__menu WHERE type = 'component' AND link LIKE 'index.php?option=com_{$this->com}%' {$and}");
		$menus = $db->loadObjectList();

        if (!empty($menus)) {
            jimport('joomla.application.component.helper');

            foreach($menus as $menu) {
                $link = str_replace('com_'.$this->com, 'com_mijoshop', $menu->link);

                $componentid = 'component_id = '.JComponentHelper::getComponent('com_mijoshop')->id;

                $db->setQuery("UPDATE #__menu SET link = '{$link}', {$componentid} WHERE id = ".$menu->id);
                $db->query();
            }
        }
		
		echo '<strong>Menus has been fixed successfully.</strong><br />';
		exit;
	}
	
	public function fixModules($post) {
		$version = self::_getAceShopVersion();
        $this->com = $post['component'];

        $db = JFactory::getDBO();

        $db->setQuery("SELECT id FROM #__modules WHERE module = 'mod_'.{$this->com} AND client_id = 0");
        $mods = $db->loadObjectList();

        if (!empty($mods)) {
            foreach($mods as $mod) {
                $db->setQuery("UPDATE #__modules SET module = 'mod_mijoshop' WHERE id = ".$mod->id);
                $db->query();
            }
        }

        echo '<strong>Modules has been fixed successfully.</strong><br />';
        exit;
	}

    private function _copyVqmod() {
        $exclude = array($this->com.'_admin.xml', $this->com.'_catalog.xml', $this->com.'_catalog_js.xml', $this->com.'_catalog_css_default.xml',
        $this->com.'_catalog_css_zzzzzzz.xml', $this->com.'_system.xml', 'vqmm_menu_shortcut.xml', 'vqmod_opencart.xml',
        $this->com.'_custom_theme_css.xml_', $this->com.'_custom_theme_html.xml_', $this->com.'_custom_theme_js.xml_',
        $this->com.'_remove_affiliates.xml_', $this->com.'_remove_compare.xml_', $this->com.'_remove_rewardpoints.xml_', $this->com.'_remove_wishlist.xml_');
        
		$files = JFolder::files($this->old_path.'/vqmod/xml', '', false, false, $exclude);

        self::_copyFiles($this->old_path.'/vqmod/xml', $this->mijoshop_path.'/vqmod/xml', $files);
    }

    private function _copyTemplates() {
        $templates = JFolder::folders($this->old_path.'/catalog/view/theme', '', false, false, array('default'));

        if (empty($templates)) {
            return;
        }

        foreach ($templates as $template) {
            $old_template_folder = $this->old_path.'/catalog/view/theme/'.$template;
            $new_template_folder = $this->mijoshop_path.'/catalog/view/theme/'.$template;

            $img_folder = $old_template_folder.'/image';
            if (JFolder::exists($img_folder)) {
                JFolder::copy($img_folder, $new_template_folder.'/image', '', true);
            }

            $css_folder = $old_template_folder.'/stylesheet';
            if (JFolder::exists($css_folder)) {
                JFolder::copy($css_folder, $new_template_folder.'/stylesheet', '', true);
            }

            $tpl_folders = array('account', 'affiliate', 'checkout', 'common', 'error', 'information', 'mail', 'module', 'payment', 'product', 'total');

            foreach ($tpl_folders as $tpl_folder) {
                if (!JFolder::exists($old_template_folder.'/template/'.$tpl_folder)) {
                    continue;
                }

                $files = JFolder::files($old_template_folder.'/template/'.$tpl_folder, '');
                if (empty($files)) {
                    continue;
                }

                JFolder::create($new_template_folder.'/template/'.$tpl_folder);
                if (!JFolder::exists($new_template_folder.'/template/'.$tpl_folder)) {
                    continue;
                }

                self::_copyFiles($old_template_folder.'/template/'.$tpl_folder, $new_template_folder.'/template/'.$tpl_folder, $files);
            }
        }
    }

    private function _copyExtensions() {
        $folders = array('admin/controller', 'admin/language', 'admin/model', 'admin/view/image', 'admin/view/javascript',
                            'admin/view/stylesheet', 'admin/view/template', 'catalog/controller', 'catalog/language', 'catalog/model',
                            'catalog/view/javascript', 'catalog/view/theme/default/template');

        $types = array('payment', 'shipping', 'total', 'module', 'feed', 'report', 'tool');

        foreach ($folders as $folder) {
            foreach ($types as $type) {
                $old_type_folder = $this->old_path.'/'.$folder;
                $new_type_folder = $this->mijoshop_path.'/'.$folder;

                if ($folder != 'admin/view/javascript' && $folder != 'admin/view/stylesheet' && $folder != 'catalog/view/javascript') {
                    $old_type_folder .= '/'.$type;
                    $new_type_folder .= '/'.$type;
                }

                if (!JFolder::exists($old_type_folder)) {
                    continue;
                }

                $files = JFolder::files($old_type_folder, '');

                self::_copyFiles($old_type_folder, $new_type_folder, $files, false);
            }
        }
    }

    private function _copyFiles($old_path, $new_path, $files, $overwrite = true) {
        if (empty($files)) {
            return;
        }

        foreach ($files as $file) {
            if ($overwrite == false && JFile::exists($new_path.'/'.$file)) {
                continue;
            }

            $ext = JFile::getExt($file);
            $images = array('jpeg', 'jpg', 'png', 'gif');

            if (in_array($ext, $images)) {
                JFile::copy($old_path.'/'.$file, $new_path.'/'.$file);
                continue;
            }

            $content = JFile::read($old_path.'/'.$file);

            $str_1 = 'aceshop';
            $str_2 = 'AceShop';
            $str_3 = 'ACESHOP';

            if ($this->com == 'ayelshop') {
                $str_1 = 'ayelshop';
                $str_2 = 'AyelShop';
                $str_3 = 'AYELSHOP';
            }

            $content = str_replace($str_1, 'mijoshop', $content);
            $content = str_replace($str_2, 'MijoShop', $content);
            $content = str_replace($str_3, 'MIJOSHOP', $content);

            JFile::write($new_path.'/'.$file, $content);
        }
    }

    private function _emptyCache() {
		$folder = $this->mijoshop_path.'/opencart/system/cache';
		
        $files = JFolder::files($folder, '', false, false, array('index.html'));
		
		if (empty($files)) {
            return;
        }
		
		foreach ($files as $file) {
			JFile::delete($folder.'/'.$file);
		}
    }
	
    private function _upgradeTo153() {
	    $db = MijoShop::get('db');
		$dbo = MijoShop::get('db')->getDbo();

        $tables	= $dbo->getTableList();
        $mijoshop_customer_ip_blacklist = $dbo->getPrefix().'mijoshop_customer_ip_blacklist';
        if (!is_array($tables) || in_array($mijoshop_customer_ip_blacklist, $tables)) {
            return;
        }

		$db->run("CREATE TABLE IF NOT EXISTS #__mijoshop_customer_ip_blacklist (
                customer_ip_blacklist_id int(11) NOT NULL COMMENT '' auto_increment,
                ip varchar(15) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                PRIMARY KEY (customer_ip_blacklist_id),
                INDEX ip (ip)
            ) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;", 'query');
		$db->run("CREATE TABLE IF NOT EXISTS #__mijoshop_order_fraud (
                order_id int(11) NOT NULL COMMENT '',
                customer_id int(11) NOT NULL DEFAULT 0 COMMENT '',
                country_match varchar(3) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                country_code varchar(2) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                high_risk_country varchar(3) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                distance int(11) NOT NULL DEFAULT 0 COMMENT '',
                ip_region varchar(255) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                ip_city varchar(255) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                ip_latitude decimal(10,6) NOT NULL DEFAULT '0.0000' COMMENT '',
                ip_longitude decimal(10,6) NOT NULL DEFAULT '0.0000' COMMENT '',
                ip_isp varchar(255) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                ip_org varchar(255) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                ip_asnum int(11) NOT NULL DEFAULT 0 COMMENT '',
                ip_user_type varchar(255) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                ip_country_confidence varchar(3) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                ip_region_confidence varchar(3) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                ip_city_confidence varchar(3) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                ip_postal_confidence varchar(3) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                ip_postal_code varchar(10) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                ip_accuracy_radius int(11) NOT NULL DEFAULT 0 COMMENT '',
                ip_net_speed_cell varchar(255) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                ip_metro_code int(3) NOT NULL DEFAULT 0 COMMENT '',
                ip_area_code int(3) NOT NULL DEFAULT 0 COMMENT '',
                ip_time_zone varchar(255) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                ip_region_name varchar(255) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                ip_domain varchar(255) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                ip_country_name varchar(255) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                ip_continent_code varchar(2) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                ip_corporate_proxy varchar(3) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                anonymous_proxy varchar(3) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                proxy_score int(3) NOT NULL DEFAULT 0 COMMENT '',
                is_trans_proxy varchar(3) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                free_mail varchar(3) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                carder_email varchar(3) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                high_risk_username varchar(3) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                high_risk_password varchar(3) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                bin_match varchar(10) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                bin_country varchar(2) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                bin_name_match varchar(3) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                bin_name varchar(255) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                bin_phone_match varchar(3) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                bin_phone varchar(32) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                customer_phone_in_billing_location varchar(8) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                ship_forward varchar(3) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                city_postal_match varchar(3) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                ship_city_postal_match varchar(3) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                score decimal(10,5) NOT NULL DEFAULT '0.0000' COMMENT '',
                explanation text NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                risk_score decimal(10,5) NOT NULL DEFAULT '0.0000' COMMENT '',
                queries_remaining int(11) NOT NULL DEFAULT 0 COMMENT '',
                maxmind_id varchar(8) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                error text NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                date_added datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '',
                PRIMARY KEY (order_id)
            ) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;", 'query');
		$db->run("CREATE TABLE IF NOT EXISTS #__mijoshop_order_voucher (
                order_voucher_id int(11) NOT NULL COMMENT '' auto_increment,
                order_id int(11) NOT NULL DEFAULT 0 COMMENT '',
                voucher_id int(11) NOT NULL DEFAULT 0 COMMENT '',
                description varchar(255) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                code varchar(10) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                from_name varchar(64) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                from_email varchar(96) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                to_name varchar(64) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                to_email varchar(96) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                voucher_theme_id int(11) NOT NULL DEFAULT 0 COMMENT '',
                message text NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                amount decimal(15,4) NOT NULL DEFAULT '0.00' COMMENT '',
                PRIMARY KEY (order_voucher_id)
            ) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;", 'query');
		$db->run("ALTER TABLE #__mijoshop_order ADD shipping_code varchar(128) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin AFTER shipping_method;", 'query');
		$db->run("ALTER TABLE #__mijoshop_order ADD payment_code varchar(128) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin AFTER payment_method;", 'query');
		$db->run("ALTER TABLE #__mijoshop_order ADD forwarded_ip varchar(15) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin AFTER ip;", 'query');
		$db->run("ALTER TABLE #__mijoshop_order ADD user_agent varchar(255) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin AFTER forwarded_ip;", 'query');
		$db->run("ALTER TABLE #__mijoshop_order ADD accept_language varchar(255) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin AFTER user_agent;", 'query');
		$db->run("ALTER TABLE #__mijoshop_order DROP reward;", 'query');
		$db->run("ALTER TABLE #__mijoshop_order_product ADD reward int(8) NOT NULL DEFAULT 0 COMMENT '' AFTER tax;", 'query');
		$db->run("ALTER TABLE #__mijoshop_product MODIFY `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000' COMMENT '';", 'query');
		$db->run("ALTER TABLE #__mijoshop_product MODIFY `length` decimal(15,8) NOT NULL DEFAULT '0.00000000' COMMENT '';", 'query');
		$db->run("ALTER TABLE #__mijoshop_product MODIFY `width` decimal(15,8) NOT NULL DEFAULT '0.00000000' COMMENT '';", 'query');
		$db->run("ALTER TABLE #__mijoshop_product MODIFY `height` decimal(15,8) NOT NULL DEFAULT '0.00000000' COMMENT '';", 'query');
		$db->run("ALTER TABLE `#__mijoshop_return` ADD `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '' AFTER `order_id`;", 'query');
		$db->run("ALTER TABLE `#__mijoshop_return` ADD `product` varchar(255) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin AFTER `telephone`;", 'query');
		$db->run("ALTER TABLE `#__mijoshop_return` ADD `model` varchar(64) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin AFTER `product`;", 'query');
		$db->run("ALTER TABLE `#__mijoshop_return` ADD `quantity` int(4) NOT NULL DEFAULT '0' COMMENT '' AFTER `model`;", 'query');
		$db->run("ALTER TABLE `#__mijoshop_return` ADD `opened` tinyint(1) NOT NULL DEFAULT '0' COMMENT '' AFTER `quantity`;", 'query');
		$db->run("ALTER TABLE `#__mijoshop_return` ADD `return_reason_id` int(11) NOT NULL DEFAULT '0' COMMENT '' AFTER `opened`;", 'query');
		$db->run("ALTER TABLE `#__mijoshop_return` ADD `return_action_id` int(11) NOT NULL DEFAULT '0' COMMENT '' AFTER `return_reason_id`;", 'query');
		$db->run("DROP TABLE IF EXISTS #__mijoshop_return_product;", 'query');
		$db->run("ALTER TABLE #__mijoshop_tax_rate_to_customer_group DEFAULT CHARSET=utf8 COLLATE=utf8_bin;", 'query');
		$db->run("UPDATE `#__mijoshop_setting` SET `value` = replace(`value`, 's:6:\"status\";s:1:\"1\"', 's:6:\"status\";s:1:\"0\"') WHERE `key` = 'category_module';", 'query');
		$db->run("UPDATE `#__mijoshop_setting` SET `value` = 0 WHERE `key` = 'ups_status';", 'query');
		$db->run("CREATE TABLE IF NOT EXISTS #__mijoshop_customer_group_description (
                customer_group_id int(11) NOT NULL COMMENT '',
                language_id int(11) NOT NULL DEFAULT 0 COMMENT '',
                name varchar(32) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                description text NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                PRIMARY KEY (customer_group_id, language_id)
            ) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;", 'query');
		$db->run("ALTER TABLE #__mijoshop_address ADD company_id varchar(32) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin AFTER company;", 'query');
		$db->run("ALTER TABLE #__mijoshop_address ADD tax_id varchar(32) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin AFTER company_id;", 'query');
		$db->run("ALTER TABLE #__mijoshop_customer_group ADD approval int(1) NOT NULL DEFAULT 0 COMMENT '' AFTER customer_group_id;", 'query');
		$db->run("ALTER TABLE #__mijoshop_customer_group ADD company_id_display int(1) NOT NULL DEFAULT 0 COMMENT '' AFTER approval;", 'query');
		$db->run("ALTER TABLE #__mijoshop_customer_group ADD company_id_required int(1) NOT NULL DEFAULT 0 COMMENT '' AFTER company_id_display;", 'query');
		$db->run("ALTER TABLE #__mijoshop_customer_group ADD tax_id_display int(1) NOT NULL DEFAULT 0 COMMENT '' AFTER company_id_required;", 'query');
		$db->run("ALTER TABLE #__mijoshop_customer_group ADD tax_id_required int(1) NOT NULL DEFAULT 0 COMMENT '' AFTER tax_id_display;", 'query');
		$db->run("ALTER TABLE #__mijoshop_customer_group ADD sort_order int(3) NOT NULL DEFAULT 0 COMMENT '' AFTER tax_id_required;", 'query');
		$db->run("ALTER TABLE `#__mijoshop_order` ADD payment_company_id varchar(32) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin AFTER payment_company;", 'query');
		$db->run("ALTER TABLE `#__mijoshop_order` ADD payment_tax_id varchar(32) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin AFTER payment_company_id;", 'query');
		$db->run("ALTER TABLE `#__mijoshop_information` ADD bottom int(1) NOT NULL DEFAULT '1' COMMENT '' AFTER information_id;", 'query');
		$db->run("CREATE TABLE IF NOT EXISTS #__mijoshop_order_misc (
                order_id int(11) NOT NULL DEFAULT 0 COMMENT '',
                `key` varchar(64) NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                value text NOT NULL DEFAULT '' COMMENT '' COLLATE utf8_bin,
                PRIMARY KEY (order_id, `key`)
            ) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;", 'query');
		$db->run("UPDATE `#__mijoshop_setting` SET `value` = '1' WHERE `key` = 'config_voucher_min';", 'query');
		$db->run("UPDATE `#__mijoshop_setting` SET `value` = '1000' WHERE `key` = 'config_voucher_max';", 'query');
		
        // Settings
        $query = $db->run("SELECT * FROM #__mijoshop_setting WHERE store_id = '0' ORDER BY store_id ASC", 'loadAssocList');

        foreach ($query as $setting) {
            if (!$setting['serialized']) {
                $settings[$setting['key']] = $setting['value'];
            } else {
                $settings[$setting['key']] = unserialize($setting['value']);
            }
        }

        // Layout routes now require "%" for wildcard paths
        $layout_route_query = $db->run("SELECT * FROM #__mijoshop_layout_route", 'loadAssocList');
        foreach ($layout_route_query as $layout_route) {
            if (strpos($layout_route['route'], '/') === false) { // If missing the trailing slash, add "/%"
                    $db->run("UPDATE #__mijoshop_layout_route SET route = '" . $layout_route['route'] . "/%' WHERE `layout_route_id` = '" . $layout_route['layout_route_id'] . "'", 'query');
            }
            elseif (strrchr($layout_route['route'], '/') == "/") { // If has the trailing slash, then just add "%"
                    $db->run("UPDATE #__mijoshop_layout_route SET route = '" . $layout_route['route'] . "%' WHERE `layout_route_id` = '" . $layout_route['layout_route_id'] . "'", 'query');
            }
        }

        // Customer Group 'name' field moved to new customer_group_description table. Need to loop through and move over.
        $column_query = $db->run("DESC #__mijoshop_customer_group `name`");
        if ($column_query) {
            $default_language_id = $db->run("SELECT language_id FROM #__mijoshop_language WHERE code = '" . $settings['config_admin_language'] . "'", 'loadResult');

            $customer_group_query = $db->run("SELECT customer_group_id, name FROM #__mijoshop_customer_group", 'loadAssocList');
            foreach ($customer_group_query as $customer_group) {
                $db->run("INSERT INTO #__mijoshop_customer_group_description SET customer_group_id = '" . (int)$customer_group['customer_group_id'] . "', language_id = '" . (int)$default_language_id . "', `name` = '" . $db->run($customer_group['name'], 'escape') . "' ON DUPLICATE KEY UPDATE customer_group_id=customer_group_id", 'query');
            }

            // Comment this for now in case people want to roll back to 1.5.2 from 1.5.3
            // Uncomment it when 1.5.4 is out.
            //$db->query("ALTER TABLE #__mijoshop_customer_group DROP `name`");
        }

		// Default to "default" customer group display for registration if this is the first time using this version to avoid registration confusion.
		// In 1.5.2 and earlier, the default install uses "8" as the "Default" customer group
		// In 1.5.3 the default install uses "1" as the "Default" customer group.
		// Since this is an upgrade script and only triggers if the checkboxes aren't selected, I use 8 since that is what people will be upgrading from.
		$query = $db->run("SELECT setting_id FROM #__mijoshop_setting WHERE `group` = 'config' AND `key` = 'config_customer_group_display'");
		if (!$query) {
			$db->run("INSERT INTO `#__mijoshop_setting` SET `store_id` = 0, `group` = 'config', `key` = 'config_customer_group_display', `value` = 'a:1:{i:0;s:1:\"8\";}', `serialized` = 1", 'query');
		}
    }

    private function _upgradeTo154() {
        $db = MijoShop::get('db');
        $dbo = MijoShop::get('db')->getDbo();

        $tables    = $dbo->getTableList();
        $mijoshop_customer_online = $dbo->getPrefix().'mijoshop_customer_online';
        if (!is_array($tables) || in_array($mijoshop_customer_online, $tables)) {
           return;
        }

        $db->run("CREATE TABLE IF NOT EXISTS `#__mijoshop_customer_online` (
             `ip` varchar(40) COLLATE utf8_bin NOT NULL,
             `customer_id` int(11) NOT NULL,
             `url` text COLLATE utf8_bin NOT NULL,
             `referer` text COLLATE utf8_bin NOT NULL,
             `date_added` datetime NOT NULL,
             PRIMARY KEY (`ip`)
           ) DEFAULT CHARSET=utf8 COLLATE=utf8_bin;", 'query');
        $db->run("UPDATE `#__mijoshop_setting` set `group` = replace(`group`, 'alertpay', 'payza');", 'query');
        $db->run("UPDATE `#__mijoshop_setting` set `key` = replace(`key`, 'alertpay', 'payza');", 'query');
        $db->run("UPDATE `#__mijoshop_order` set `payment_method` = replace(`payment_method`, 'AlertPay', 'Payza');", 'query');
        $db->run("UPDATE `#__mijoshop_order` set `payment_code` = replace(`payment_code`, 'alertpay', 'payza');", 'query');
        $db->run("ALTER TABLE `#__mijoshop_affiliate` ADD `salt` varchar(9) COLLATE utf8_bin NOT NULL DEFAULT '' AFTER `password`;", 'query');
        $db->run("ALTER TABLE `#__mijoshop_customer` ADD `salt` varchar(9) COLLATE utf8_bin NOT NULL DEFAULT '' AFTER `password`;", 'query');
        $db->run("ALTER TABLE `#__mijoshop_customer` MODIFY `ip` varchar(40) NOT NULL;", 'query');
        $db->run("ALTER TABLE `#__mijoshop_customer_ip` MODIFY `ip` varchar(40) NOT NULL;", 'query');
        $db->run("ALTER TABLE `#__mijoshop_customer_ip_blacklist` MODIFY `ip` varchar(40) NOT NULL;", 'query');
        $db->run("ALTER TABLE `#__mijoshop_order` MODIFY `ip` varchar(40) NOT NULL;", 'query');
        $db->run("ALTER TABLE `#__mijoshop_order` MODIFY `forwarded_ip` varchar(40) NOT NULL;", 'query');
        $db->run("ALTER TABLE `#__mijoshop_order_product` MODIFY `model` varchar(64) NOT NULL;", 'query');
        $db->run("ALTER TABLE `#__mijoshop_product` ADD `ean` varchar(12) COLLATE utf8_bin NOT NULL DEFAULT '' AFTER `upc`;", 'query');
        $db->run("ALTER TABLE `#__mijoshop_product` ADD `jan` varchar(12) COLLATE utf8_bin NOT NULL DEFAULT '' AFTER `ean`;", 'query');
        $db->run("ALTER TABLE `#__mijoshop_product` ADD `isbn` varchar(12) COLLATE utf8_bin NOT NULL DEFAULT '' AFTER `jan`;", 'query');
        $db->run("ALTER TABLE `#__mijoshop_product` ADD `mpn` varchar(12) COLLATE utf8_bin NOT NULL DEFAULT '' AFTER `isbn`;", 'query');
        $db->run("ALTER TABLE `#__mijoshop_product_description` ADD `tag` text COLLATE utf8_bin NOT NULL DEFAULT '' AFTER `meta_keyword`;", 'query');
        $db->run("ALTER TABLE `#__mijoshop_product_description` ADD FULLTEXT (`description`);", 'query');
        $db->run("ALTER TABLE `#__mijoshop_product_description` ADD FULLTEXT (`tag`);", 'query');
        $db->run("ALTER TABLE `#__mijoshop_user` ADD `salt` varchar(9) COLLATE utf8_bin NOT NULL DEFAULT '' AFTER `password`;", 'query');
        $db->run("ALTER TABLE `#__mijoshop_user` MODIFY `password` varchar(40) NOT NULL;", 'query');
        $db->run("ALTER TABLE `#__mijoshop_user` MODIFY `ip` varchar(40) NOT NULL;", 'query');
    }

	function _getAceShopVersion() {
		static $version;
		
		if (!isset($version)) {
			$v = MijoShop::get('base')->getXmlText(JPATH_ADMINISTRATOR.'/components/com_aceshop/aceshop.xml', 'version');
		
			$compare_1 = version_compare($v, '2.0.0');
			$version = ($compare_1 == -1 ? '1' : '2');
		}
		
		return $version;
	}
}