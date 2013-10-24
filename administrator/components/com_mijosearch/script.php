<?php
/**
* @package		MijoSearch
* @copyright	2009-2012 Mijosoft LLC, www.mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

defined('_JEXEC') or die('Restricted access');

// Import Libraries
jimport('joomla.application.helper');
jimport('joomla.filesystem.file');
jimport('joomla.installer.installer');

JLoader::register('JModuleHelper', JPATH_ROOT.'/libraries/joomla/application/module/helper.php');

class com_MijoSearchInstallerScript {

    private $_current_version = null;
    private $_is_new_installation = true;

    public function preflight($type, $parent) {
        $db = JFactory::getDBO();
        $db->setQuery('SELECT `params` FROM `#__extensions` WHERE `element` = "com_mijosearch" AND `type` = "component"');
        $config = $db->loadResult();

        if (!empty($config)) {
            $this->_is_new_installation = false;

            $mijosearch_xml = JPATH_ADMINISTRATOR.'/components/com_mijosearch/a_mijosearch.xml';

            if (JFile::exists($mijosearch_xml)) {
                $xml = simplexml_load_file($mijosearch_xml);
                $this->_current_version = (string)$xml->version;
            }
        }
    }
	
	public function postflight($type, $parent) {
        $db = JFactory::getDBO();
        $src = $parent->getParent()->getPath('source');

        $status = new JObject();
        $status->adapters = array();
        $status->extensions = array();
        $status->modules = array();
        $status->plugins = array();

		/***********************************************************************************************
		* ---------------------------------------------------------------------------------------------
		* ADAPTER INSTALLATION SECTION
		* ---------------------------------------------------------------------------------------------
		***********************************************************************************************/
		$adp_src = JPATH_ADMINISTRATOR.'/components/com_mijosearch/adapters/mijosearch_ext.php';
		$adp_dst = JPATH_LIBRARIES.'/joomla/installer/adapters/mijosearch_ext.php';
		if (is_writable(dirname($adp_dst))) {
			JFile::copy($adp_src, $adp_dst);
			$status->adapter[] = 1;
		}
		
        /***********************************************************************************************
		* ---------------------------------------------------------------------------------------------
		* EXTENSION INSTALLATION SECTION
		* ---------------------------------------------------------------------------------------------
		***********************************************************************************************/
		if ($this->_is_new_installation == true) {
			$extensions = array(
					array('option' => 'com_banners', 'ordering' => '3'),
					array('option' => 'com_content', 'ordering' => '1'),
					array('option' => 'com_components', 'ordering' => '9'),
					array('option' => 'com_menus', 'ordering' => '6'),
					array('option' => 'com_modules', 'ordering' => '8'),
					array('option' => 'com_newsfeeds', 'ordering' => '4'),
					array('option' => 'com_plugins', 'ordering' => '10'),
					array('option' => 'com_users', 'ordering' => '7'),
					array('option' => 'com_weblinks', 'ordering' => '2')
				);
				
			if (!empty($extensions)) {
				foreach ($extensions as $extension) {
					$option		= $extension['option'];
					$ordering	= $extension['ordering'];
					
					$file = $src.'/admin/extensions/'.$option.'.xml';
					if (!file_exists($file)) {
						continue;
					}
					
					$manifest = simplexml_load_file($file);
					
					if (is_null($manifest)) {
						continue;
					}
					
					$name = (string)$manifest->name;
					
					$db->setQuery('SELECT id FROM #__mijosearch_extensions WHERE extension = '.$db->Quote($option));
					$ext = $db->loadResult();
					
					if (empty($ext)) {
						$client = (string)$manifest->client;

						$prms = array();
						$prms['handler'] = 1;
						$prms['custom_name'] = '';
						$prms['access'] = 1;
						$prms['result_limit'] = '';
						
						$element = $manifest->install->defaultParams;
						if (($element instanceof SimpleXMLElement) and count($element->children())) {
							$defaultParams = $element->children();
							
							if (count($defaultParams) != 0) {
								foreach ($defaultParams as $param) {
									$pname = (string)$param->attributes()->name;
									$value = (string)$param->attributes()->value;
									
									$prms[$pname] = $value;
								}
							}
						}
						
						$reg = new JRegistry($prms);
						$params = $reg->toString();
						
						JTable::addIncludePath(JPATH_ADMINISTRATOR.'/components/com_mijosearch/tables');
						$row = JTable::getInstance('MijosearchExtensions', 'Table');	
						$row->name 			= $name;
						$row->extension 	= $option;
						$row->ordering 		= $ordering;
						$row->params 		= $params;
						$row->client 		= $client;
						$row->store();
					}
					
					$status->extensions[] = array('name' => $name);
				}
			}
		}

		/***********************************************************************************************
		* ---------------------------------------------------------------------------------------------
		* MODULE INSTALLATION SECTION
		* ---------------------------------------------------------------------------------------------
		***********************************************************************************************/
		$modules = array(
					array('title' => 'MijoSearch - Search', 'element' => 'mod_mijosearch', 'client' => 'Site', 'position' => 'position-7', 'published' => '1', 'ordering' => '1'),
					array('title' => 'MijoSearch - Search', 'element' => 'mod_mijosearch_admin', 'client' => 'Administrator', 'position' => 'menu', 'published' => '1', 'ordering' => '1'),
					array('title' => 'MijoSearch - Quick Icons', 'element' => 'mod_mijosearch_quickicons', 'client' => 'Administrator', 'position' => 'cpanel', 'published' => '1', 'ordering' => '1')
				);
				
		if (!empty($modules)) {
			foreach ($modules as $module) {
				$mtitle		= $module['title'];
				$melement	= $module['element'];
				$mclient	= $module['client'];
				$mposition	= $module['position'];
				$mpublished	= $module['published'];
				$mordering	= $module['ordering'];
				
				$path = $src.'/modules/'.$melement;
                if (!JFolder::exists($path)) {
                    continue;
                }
				
				$installer = new JInstaller();
				$installer->install($path);
				
				if ($this->_is_new_installation == true) {
					$db->setQuery("UPDATE #__modules SET position = '{$mposition}', ordering = '{$mordering}', published = '{$mpublished}' WHERE module = '{$melement}'");
					$db->query();
				}
				
				$status->modules[] = array('name' => $mtitle, 'client' => $mclient);
			}
		}

		/***********************************************************************************************
		* ---------------------------------------------------------------------------------------------
		* PLUGIN INSTALLATION SECTION
		* ---------------------------------------------------------------------------------------------
		***********************************************************************************************/
		$plugins = array(/*array('title' => 'Content - MijoShop', 'folder' => 'content', 'element' => 'mijoshop', 'ordering' => '0', 'update' => false)*/);

		if (!empty($plugins)) {
			foreach ($plugins as $plugin) {
				$ptitle		= $plugin['title'];
				$pfolder	= $plugin['folder'];
				$pelement	= $plugin['element'];
				$pordering	= $plugin['ordering'];
				$pupdate	= $plugin['update'];

                $path = $src.'/plugins/plg_'.$pfolder.'_'.$pelement;
                if (!JFolder::exists($path)) {
                    continue;
                }

                $installer = new JInstaller();
            	$result = $installer->install($path);

                if (!$result) {
                    continue;
                }
				
				if ($pupdate == true) {
					$db->setQuery("UPDATE #__extensions SET enabled = 1, ordering = '{$pordering}' WHERE type = 'plugin' AND element = '{$pelement}' AND folder = '{$pfolder}'");
					$db->query();
				}

				$status->plugins[] = array('name' => $ptitle, 'group' => $pfolder);
			}
		}

        if ($this->_is_new_installation == true) {
            $this->_installConfig();
        }
		else {
			$this->_updateMijosearch();
		}

        $this->_installationOutput($status);
	}
	
	protected function _installConfig() {
		$config = new stdClass();
		$config->version_checker = '1';
		$config->cache_versions = '1';
		$config->cache_extensions = '0';
		$config->show_db_errors = '0';
		$config->show_properties = '1';
		$config->pid = '';
		$config->suggestions_always = '0';
		$config->suggestions_engine = 'google';
		$config->suggestions_yahoo_key = '';
		$config->suggestions_bing_key = '';
		$config->google = '0';
		$config->google_more_results = '0';
		$config->google_more_results_length = '4';
		$config->save_results = '1';
		$config->show_order = '1';
		$config->show_url = '1';
		$config->show_search_refine = '1';
		$config->show_display = '1';
		$config->show_ext_flt = '1';
		$config->show_adv_search = '1';
		$config->yahoo_sections = '1';
		$config->search_char = '3';
		$config->access_checker = '1';
		$config->result_limit = '50';
		$config->enable_complete = '1';
		$config->enable_suggestion = '1';
		$config->enable_highlight = '1';
		$config->show_desc = '1';
		$config->show_image = '1';
		$config->image_positions = '_left';
		$config->image_sizew = '80';
		$config->image_sizeh = '80';
		$config->title_length = '60';
		$config->display_limit = '15';
		$config->description_length = '350';
		$config->max_search_char = '20';
		$config->blacklist = '';
		$config->results_format = '1';
		$config->date_format = 'l, d F Y';
		$config->admin_show_url = '1';
		$config->admin_show_desc = '1';
		$config->admin_title_length = '80';
		$config->admin_show_display = '1';
		$config->admin_show_properties = '1';
		$config->admin_show_ext_flt = '1';
		$config->admin_enable_complete = '1';
		$config->admin_enable_suggestion = '1';
		$config->admin_enable_highlight = '1';
		$config->admin_show_page_title = '1';
		$config->admin_show_page_desc = '1';
		$config->admin_description_length = '350';
		$config->admin_max_search_char = '20';
		$config->admin_result_limit = '50';
		$config->highlight_textall = '141414';
		$config->highlight_all = 'ffffb2';
		$config->highlight_back1 = 'ffff9e';
		$config->highlight_back2 = 'ffadb1';
		$config->highlight_back3 = 'a3ccff';
		$config->highlight_back4 = 'abffd2';
		$config->highlight_back5 = 'ff8fe9';
		$config->highlight_text1 = '0a080a';
		$config->highlight_text2 = '242424';
		$config->highlight_text3 = '0f0b0f';
		$config->highlight_text4 = '141214';
		$config->highlight_text5 = '1a191a';
        $config->ajax_show_desc	= '1';
        $config->ajax_show_image = '1';
        $config->ajax_image_positions = 'left';
        $config->ajax_image_sizew = '60';
        $config->ajax_image_sizeh = '60';
        $config->ajax_description_length = '100';
        $config->ajax_title_length = '30';
        $config->ajax_show_properties = '1';
        $config->ajax_display_limit	= '5';
        $config->ajax_enable = '1';
        $config->ajax_result_width = '250';
        $config->ajax_title_color = '#4e6170';
        $config->ajax_title_color_hover = '#ffffff';
        $config->ajax_desc_color = '#7794aa';
        $config->ajax_desc_color_hover = '#ffffff';
        $config->ajax_bg_color = '#ffffff';
        $config->ajax_bg_color_hover = '#0044CC';
        $config->ajax_button_class = 'btn btn-primary';
        $config->ajax_title_bg = '#e4eaee';


		$reg = new JRegistry($config);
        $config = $reg->toString();

        $db = JFactory::getDBO();
        $db->setQuery('UPDATE #__extensions SET params = '.$db->Quote($config).' WHERE element = "com_mijosearch" AND type = "component"');
        $db->query();
	}

    protected function _updateMijosearch() {
        if (empty($this->_current_version)) {
            return;
        }
		if (version_compare($this->_current_version, '2.0.0') == -1) {
            $this->_upgrade20();
        }
    }
	
	public function _upgrade20(){
        $db = JFactory::getDBO();
		
		$db->setQuery("SELECT `params` FROM `#__extensions` WHERE `type` = 'component' AND `element` = 'com_mijosearch'");
		$params = $db->loadResult();
		  
		if (!empty($params) and ($params != '{}')) {
			
			$config = json_decode($params);
			
			$config->ajax_show_desc	= '1';
			$config->ajax_show_image = '1';
			$config->ajax_image_positions = 'left';
			$config->ajax_image_sizew = '60';
			$config->ajax_image_sizeh = '60';
			$config->ajax_description_length = '100';
			$config->ajax_title_length = '30';
			$config->ajax_show_properties = '1';
			$config->ajax_display_limit	= '5';
			$config->ajax_enable = '1';
			$config->ajax_result_width = '250';
			$config->ajax_title_color = '#4e6170';
			$config->ajax_title_color_hover = '#ffffff';
			$config->ajax_desc_color = '#7794aa';
			$config->ajax_desc_color_hover = '#ffffff';
			$config->ajax_bg_color = '#ffffff';
			$config->ajax_bg_color_hover = '#0044CC';
			$config->ajax_button_class = 'btn btn-primary';
			$config->ajax_title_bg = '#e4eaee';

			$config = json_encode($config);
		   
			$db->setQuery('UPDATE #__extensions SET params = '.$db->Quote($config).' WHERE element = "com_mijosearch" AND type = "component"');
			$db->query();
		}
	}

    public function uninstall($parent) {
        $db = JFactory::getDBO();
        $src = $parent->getParent()->getPath('source');

        $status = new JObject();
        $status->adapters = array();
        $status->extensions = array();
        $status->modules = array();
        $status->plugins = array();

        /***********************************************************************************************
		 * ---------------------------------------------------------------------------------------------
		 * DATABASE REMOVAL SECTION
		 * ---------------------------------------------------------------------------------------------
		 ***********************************************************************************************/
		$db->setQuery('DROP TABLE IF EXISTS `#__mijosearch_extensions_backup`');
		$db->query();
		$db->setQuery('RENAME TABLE `#__mijosearch_extensions` TO `#__mijosearch_extensions_backup`');
		$db->query();

		$db->setQuery('DROP TABLE IF EXISTS `#__mijosearch_filters_backup`');
		$db->query();
		$db->setQuery('RENAME TABLE `#__mijosearch_filters` TO `#__mijosearch_filters_backup`');
		$db->query();

		$db->setQuery('DROP TABLE IF EXISTS `#__mijosearch_filters_groups_backup`');
		$db->query();
		$db->setQuery('RENAME TABLE `#__mijosearch_filters_groups` TO `#__mijosearch_filters_groups_backup`');
		$db->query();

		$db->setQuery('DROP TABLE IF EXISTS `#__mijosearch_search_results_backup`');
		$db->query();
		$db->setQuery('RENAME TABLE `#__mijosearch_search_results` TO `#__mijosearch_search_results_backup`');
		$db->query();

		/***********************************************************************************************
		* ---------------------------------------------------------------------------------------------
		* ADAPTER REMOVAL SECTION
		* ---------------------------------------------------------------------------------------------
		***********************************************************************************************/
		$adapter = JPATH_LIBRARIES.'/joomla/installer/adapters/mijosearch_ext.php';
		if (JFile::exists($adapter)) {
			JFile::delete($adapter);
			$status->adapter[] = 1;
		}

		/***********************************************************************************************
		* ---------------------------------------------------------------------------------------------
		* EXTENSION REMOVAL SECTION
		* ---------------------------------------------------------------------------------------------
		***********************************************************************************************/
		$db = JFactory::getDBO();
		$db->setQuery("SELECT name FROM #__mijosearch_extensions_backup WHERE name != ''");
		$extensions = $db->loadResultArray();

		if (!empty($extensions)) {
			foreach ($extensions as $extension) {
				$status->extensions[] = array('name' => $extension);
			}
		}

		/***********************************************************************************************
		 * ---------------------------------------------------------------------------------------------
		 * MODULE REMOVAL SECTION
		 * ---------------------------------------------------------------------------------------------
		 ***********************************************************************************************/
		$modules = $parent->getParent()->getManifest()->xpath('modules/module');
		if (!empty($modules)) {
			foreach ($modules as $module) {
				$mtitle		= $module->attributes('title');
				$mpath		= $module->attributes('path');
				$mclient	= $module->attributes('client');
				
				$arr = array_reverse(explode('/', $mpath));
				$mmodule = $arr[0];
				
				$db->setQuery("SELECT extension_id FROM #__extensions WHERE type = 'module' AND element = '{$mmodule}' LIMIT 1");
				$id = $db->loadResult();
				
				if ($id) {
					$installer = new JInstaller();
					$installer->uninstall('module', $id);
					$status->modules[] = array('name' => $mtitle, 'client' => $mclient);
				}
			}
		}

		/***********************************************************************************************
		 * ---------------------------------------------------------------------------------------------
		 * PLUGIN REMOVAL SECTION
		 * ---------------------------------------------------------------------------------------------
		 ***********************************************************************************************/
		$plugins = $parent->getParent()->getManifest()->xpath('plugins/plugin');
		if (!empty($plugins)) {
			foreach ($plugins as $plugin) {
				$ppath		= $plugin->attributes('path');
				$ptitle		= $plugin->attributes('title');
				$pfolder	= $plugin->attributes('folder');
				
				$arr = array_reverse(explode('/', $ppath));
				$pelement = $arr[0];
				
				$db->setQuery("SELECT extension_id FROM #__extensions WHERE type = 'plugin' AND element = '{$pelement}' LIMIT 1");
				$id = $db->loadResult();
				
				if ($id) {
					$installer = new JInstaller();
					$installer->uninstall('plugin', $id);
					$status->plugins[] = array('name' => $ptitle, 'group' => $pfolder);
				}
			}
		}

        $this->_uninstallationOutput($status);
	}

    private function _installationOutput($status) {
$rows = 0;
?>
<img src="components/com_mijosearch/assets/images/logo.png" alt="Joomla! Search Component" style="width:80px; height:80px; float: left; padding-right:15px;" />

<h2>MijoSearch Installation</h2>
<h2><a href="index.php?option=com_mijosearch">Go to MijoSearch</a></h2>
<table class="adminlist table table-striped">
	<thead>
		<tr>
			<th class="title" colspan="2"><?php echo JText::_('Extension'); ?></th>
			<th width="30%"><?php echo JText::_('Status'); ?></th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="3"></td>
		</tr>
	</tfoot>
	<tbody>
		<tr class="row0">
			<td class="key" colspan="2"><?php echo 'MijoSearch '.JText::_('Component'); ?></td>
			<td><strong><?php echo JText::_('Installed'); ?></strong></td>
		</tr>
	<?php
if (count($status->adapter)) : ?>
		<tr class="row1">
			<td class="key" colspan="2"><?php echo 'MijoSearch Adapter'; ?></td>
			<td><strong><?php echo JText::_('Installed'); ?></strong></td>
		</tr>
	<?php
endif;
if (count($status->extensions)) : ?>
		<tr>
			<th colspan="3"><?php echo JText::_('MijoSearch Extension'); ?></th>
		</tr>
	<?php foreach ($status->extensions as $extension) : ?>
		<tr class="row<?php echo (++ $rows % 2); ?>">
			<td class="key" colspan="2"><?php echo $extension['name']; ?></td>
			<td><strong><?php echo JText::_('Installed'); ?></strong></td>
		</tr>
	<?php endforeach;
endif;
if (count($status->modules)) : ?>
		<tr>
			<th><?php echo JText::_('Module'); ?></th>
			<th><?php echo JText::_('Client'); ?></th>
			<th></th>
		</tr>
	<?php foreach ($status->modules as $module) : ?>
		<tr class="row<?php echo (++ $rows % 2); ?>">
			<td class="key"><?php echo $module['name']; ?></td>
			<td class="key"><?php echo ucfirst($module['client']); ?></td>
			<td><strong><?php echo JText::_('Installed'); ?></strong></td>
		</tr>
	<?php endforeach;
endif;
if (count($status->plugins)) : ?>
		<tr>
			<th><?php echo JText::_('Plugin'); ?></th>
			<th><?php echo JText::_('Group'); ?></th>
			<th></th>
		</tr>
	<?php foreach ($status->plugins as $plugin) : ?>
		<tr class="row<?php echo (++ $rows % 2); ?>">
			<td class="key"><?php echo ucfirst($plugin['name']); ?></td>
			<td class="key"><?php echo ucfirst($plugin['group']); ?></td>
			<td><strong><?php echo JText::_('Installed'); ?></strong></td>
		</tr>
	<?php endforeach;
endif;
 ?>

	</tbody>
</table>
        <?php
    }

    private function _uninstallationOutput($status) {
$rows = 0;
?>

<h2>MijoSearch Removal</h2>
<table class="adminlist table table-striped">
	<thead>
		<tr>
			<th class="title" colspan="2"><?php echo JText::_('Extension'); ?></th>
			<th width="30%"><?php echo JText::_('Status'); ?></th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="3"></td>
		</tr>
	</tfoot>
	<tbody>
		<tr class="row0">
			<td class="key" colspan="2"><?php echo 'MijoSearch '.JText::_('Component'); ?></td>
			<td><strong><?php echo JText::_('Removed'); ?></strong></td>
		</tr>
	<?php
if (count($status->adapter)) : ?>
		<tr class="row1">
			<td class="key" colspan="2"><?php echo 'MijoSearch Adapter'; ?></td>
			<td><strong><?php echo JText::_('Removed'); ?></strong></td>
		</tr>
	<?php
endif;
if (count($status->extensions)) : ?>
		<tr>
			<th colspan="3"><?php echo JText::_('MijoSearch Extension'); ?></th>
		</tr>
	<?php foreach ($status->extensions as $extension) : ?>
		<tr class="row<?php echo (++ $rows % 2); ?>">
			<td class="key" colspan="2"><?php echo $extension['name']; ?></td>
			<td><strong><?php echo JText::_('Removed'); ?></strong></td>
		</tr>
	<?php endforeach;
endif;
if (count($status->modules)) : ?>
		<tr>
			<th><?php echo JText::_('Module'); ?></th>
			<th><?php echo JText::_('Client'); ?></th>
			<th></th>
		</tr>
	<?php foreach ($status->modules as $module) : ?>
		<tr class="row<?php echo (++ $rows % 2); ?>">
			<td class="key"><?php echo $module['name']; ?></td>
			<td class="key"><?php echo ucfirst($module['client']); ?></td>
			<td><strong><?php echo JText::_('Removed'); ?></strong></td>
		</tr>
	<?php endforeach;
endif;
if (count($status->plugins)) : ?>
		<tr>
			<th><?php echo JText::_('Plugin'); ?></th>
			<th><?php echo JText::_('Group'); ?></th>
			<th></th>
		</tr>
	<?php foreach ($status->plugins as $plugin) : ?>
		<tr class="row<?php echo (++ $rows % 2); ?>">
			<td class="key"><?php echo ucfirst($plugin['name']); ?></td>
			<td class="key"><?php echo ucfirst($plugin['group']); ?></td>
			<td><strong><?php echo JText::_('Removed'); ?></strong></td>
		</tr>
	<?php endforeach;
endif;
?>
	</tbody>
</table>
        <?php
    }
}