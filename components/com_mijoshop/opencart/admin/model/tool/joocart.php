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

class ModelToolJoocart extends Model {
  	
  	public function migrateDatabase($post){
        $this->com = $post['component'];

        $db = MijoShop::get('db');
		$dbo = JFactory::getDBO();

        $db_tables = $dbo->getTableList();

        foreach ($db_tables as $table) {
            if (substr($table, 0, 3) != 'oc_') {
                continue;
            }

            $table = str_replace('oc_', '', $table);

            $db->run("DROP TABLE IF EXISTS #__mijoshop_{$table}", 'query');

            $db->run("RENAME TABLE oc_{$table} TO #__mijoshop_{$table}", 'query');
        }

        $this->_addOCustomerToJUser();
        $this->_addDefaultCustomerGroupDescription();

        $p = $db->run('SELECT permission FROM #__mijoshop_user_group WHERE user_group_id = 1', 'loadResult');
        $permissions = unserialize($p);

        $permissions['access'][] = 'tool/'.$this->com;
        $permissions['modify'][] = 'tool/'.$this->com;

        $permissions = serialize($permissions);

        $db->run("UPDATE #__mijoshop_user_group SET permission = '{$permissions}' WHERE user_group_id = 1", 'query');

		echo '<strong>Database migration has been done successfully.</strong><br />';
		exit;
	}

    public function migrateFiles($post) {
        $this->com = $post['component'];

        $this->mijoshop_path = JPATH_ROOT.'/components/com_mijoshop/opencart';
        $this->old_path = JPATH_ROOT.'/components/com_opencart';

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

            $str_1 = 'joocart';
            $str_2 = 'JooCart';
            $str_3 = 'JOOCART';

            $content = str_replace($str_1, 'mijoshop', $content);
            $content = str_replace($str_2, 'MijoShop', $content);
            $content = str_replace($str_3, 'MIJOSHOP', $content);

            JFile::write($new_path.'/'.$file, $content);
        }
    }

    private function _emptyCache() {
		$folder = $this->mijoshop_path.'/system/cache';
		
        $files = JFolder::files($folder, '', false, false, array('index.html'));
		
		if (empty($files)) {
            return;
        }
		
		foreach ($files as $file) {
			JFile::delete($folder.'/'.$file);
		}
    }

    //Joocart
    private function _addOCustomerToJUser() {
        $db = JFactory::getDBO();

        $customers = $db->loadAssocList("SELECT * FROM #__mijoshop_customer m WHERE m.email NOT IN (SELECT email FROM #__users)");
        if (!empty($customers)){
            foreach($customers as $customer){
                MijoShop::get('user')->createJUserFromO($customer, $customer['customer_id']);
            }
        }
    }

    private function _addDefaultCustomerGroupDescription() {
        $db = JFactory::getDBO();

        $count = $db->loadResult("SELECT COUNT(*) FROM #__mijoshop_customer_group_description m WHERE m.email NOT IN (SELECT email FROM #__users)");
        if (empty($count)){
            $db->run("INSERT INTO #__mijoshop_customer_group_description SET customer_group_id	 = 1, name = 'Default' language = 1, description = 'Default'", 'query');
        }
    }
}