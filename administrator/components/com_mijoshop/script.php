<?php
/**
* @package		MijoShop
* @copyright	2009-2013 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

defined('_JEXEC') or die('Restricted access');

// Import Libraries
jimport('joomla.application.helper');
jimport('joomla.filesystem.file');
jimport('joomla.installer.installer');

class com_MijoshopInstallerScript {

    private $_current_version = null;
    private $_is_new_installation = true;

    public function preflight($type, $parent) {
        $db = JFactory::getDBO();
        $db->setQuery('SELECT params FROM #__extensions WHERE element = "com_mijoshop" AND type = "component"');
        $config = $db->loadResult();

        if (!empty($config)) {
            $this->_is_new_installation = false;

            $mijoshop_xml = JPATH_ADMINISTRATOR.'/components/com_mijoshop/mijoshop.xml';
            $a_mijoshop_xml = JPATH_ADMINISTRATOR.'/components/com_mijoshop/a_mijoshop.xml';

            if (JFile::exists($mijoshop_xml)) {
                $xml = simplexml_load_file($mijoshop_xml, 'SimpleXMLElement');
                $this->_current_version = (string)$xml->version;
            }
			else if (JFile::exists($a_mijoshop_xml)) {
                $xml = simplexml_load_file($a_mijoshop_xml, 'SimpleXMLElement');
                $this->_current_version = (string)$xml->version;
            }
        }
    }
	
	public function postflight($type, $parent) {
        $db = JFactory::getDBO();
        $src = $parent->getParent()->getPath('source');
		
		require_once(JPATH_SITE.'/components/com_mijoshop/mijoshop/mijoshop.php');

        $status = new JObject();
        $status->adapters = array();
        $status->extensions = array();
        $status->modules = array();
        $status->plugins = array();

		/***********************************************************************************************
		* ---------------------------------------------------------------------------------------------
		* MODULE INSTALLATION SECTION
		* ---------------------------------------------------------------------------------------------
		***********************************************************************************************/
		$modules = array(
					array('title' => 'MijoShop - All-in-One', 'element' => 'mod_mijoshop', 'client' => 'Site', 'position' => 'left', 'update' => false),
					array('title' => 'MijoShop - Orders', 'element' => 'mod_mijoshop_orders', 'client' => 'Administrator', 'position' => 'cpanel', 'update' => true),
					array('title' => 'MijoShop - Quick Icons', 'element' => 'mod_mijoshop_quickicons', 'client' => 'Administrator', 'position' => 'icon', 'update' => true)
				);
				
		if (!empty($modules)) {
			foreach ($modules as $module) {
				$mtitle		= $module['title'];
				$melement	= $module['element'];
				$mclient	= $module['client'];
				$mposition	= $module['position'];
				$mupdate	= $module['update'];

                $path = $src.'/modules/'.$melement;
                if (!JFolder::exists($path)) {
                    continue;
                }
				
				$installer = new JInstaller();
				$result = $installer->install($path);

                if (!$result) {
                    continue;
                }
				
				$root = $mclient == 'Administrator' ? JPATH_ADMINISTRATOR : JPATH_SITE;
				
				if (($mupdate == true) and $this->_is_new_installation) {
					if (MijoShop::getClass('base')->is30() and ($melement == 'mod_mijoshop_quickicons')) {
						$mposition = 'cpanel';
					}
					
					$db->setQuery("UPDATE #__modules SET position = '{$mposition}', ordering = '0', published = '1' WHERE module = '{$melement}'");
					$db->query();
					
					$db->setQuery("SELECT id FROM #__modules WHERE `module` = ".$db->quote($melement));
					$mid = (int)$db->loadResult();
					
					$db->setQuery("INSERT IGNORE INTO #__modules_menu (`moduleid`, `menuid`) VALUES (".$mid.", 0)");
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
		$plugins = array(
					array('title' => 'Content - MijoShop', 'folder' => 'content', 'element' => 'mijoshop', 'ordering' => '0', 'update' => false),
					array('title' => 'Editor Button - MijoShop', 'folder' => 'editors-xtd', 'element' => 'mijoshop', 'ordering' => '10', 'update' => true),
					array('title' => 'MijoShop - ACL', 'folder' => 'mijoshop', 'element' => 'acl', 'ordering' => '0', 'update' => true),
					array('title' => 'MijoShop - Email Article', 'folder' => 'mijoshop', 'element' => 'emailarticle', 'ordering' => '0', 'update' => true),
					array('title' => 'MijoShop - MijoShop Customer Group', 'folder' => 'mijoshop', 'element' => 'mijoshop', 'ordering' => '0', 'update' => true),
					array('title' => 'MijoShop - SQL', 'folder' => 'mijoshop', 'element' => 'sql', 'ordering' => '0', 'update' => true),
					array('title' => 'MijoShop - Trigger', 'folder' => 'mijoshop', 'element' => 'trigger', 'ordering' => '0', 'update' => true),
					array('title' => 'Search - MijoShop', 'folder' => 'search', 'element' => 'mijoshop', 'ordering' => '0', 'update' => false),
					array('title' => 'Smart Search - MijoShop', 'folder' => 'finder', 'element' => 'mijoshop', 'ordering' => '0', 'update' => false),
					array('title' => 'System - MijoShop Redirect', 'folder' => 'system', 'element' => 'mijoshopredirect', 'ordering' => '0', 'update' => true),
					array('title' => 'User - MijoShop', 'folder' => 'user', 'element' => 'mijoshop', 'ordering' => '100', 'update' => true)
				);

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
				
				if (($pupdate == true) and $this->_is_new_installation) {
					$db->setQuery("UPDATE #__extensions SET enabled = 1, ordering = '{$pordering}' WHERE type = 'plugin' AND element = '{$pelement}' AND folder = '{$pfolder}'");
					$db->query();
				}

				$status->plugins[] = array('name' => $ptitle, 'group' => $pfolder);
			}
		}
		
        if ($this->_is_new_installation == true) {
			$this->_installMijoshop();
		}
        else {
            $this->_updateMijoshop();
        }
		
		if (JFile::exists(JPATH_ADMINISTRATOR.'/components/com_mijoshop/a_mijoshop.xml')) {
			JFile::delete(JPATH_ADMINISTRATOR.'/components/com_mijoshop/a_mijoshop.xml');
		}

        $this->_installationOutput($status);
	}

    protected function _installMijoshop() {
		/***********************************************************************************************
		* ---------------------------------------------------------------------------------------------
		* DATABASE INSTALLATION SECTION
		* ---------------------------------------------------------------------------------------------
		***********************************************************************************************/
		MijoShop::get('install')->createTables();
		MijoShop::get('install')->createUserTables();
		MijoShop::get('install')->createGroupTables();
        MijoShop::get('install')->createIntegrationTables();
		MijoShop::get('install')->install150();
		
        if (empty($this->_current_version)) {
            return;
        }

        if ($this->_current_version = '1.0.0') {
            return;
        }		
    }

    protected function _updateMijoshop() {
        if (empty($this->_current_version)) {
            return;
        }

        if (version_compare($this->_current_version, '1.4.0') == -1) {
            MijoShop::get('install')->createIntegrationTables();
            MijoShop::get('install')->upgradeDbToV155();
        }
		
		if (version_compare($this->_current_version, '1.4.4') == -1) {
            MijoShop::get('install')->upgrade144();
        }
		
		if (version_compare($this->_current_version, '1.5.0') == -1) {
            MijoShop::get('install')->upgrade150();
        }
		
		if (version_compare($this->_current_version, '2.0.2') == -1) {
            MijoShop::get('install')->upgrade202();
        }
		
		if (version_compare($this->_current_version, '2.1.0') == -1) {
            MijoShop::get('install')->upgrade210();
        }
		
		if (version_compare($this->_current_version, '2.1.3') == -1) {
            MijoShop::get('install')->upgrade213();
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
        $status->packages = array();

        /***********************************************************************************************
		 * ---------------------------------------------------------------------------------------------
		 * PACKAGES REMOVAL SECTION
		 * ---------------------------------------------------------------------------------------------
		 ***********************************************************************************************/
		$packages = array(
					array('title' => 'MijoShop Component', 'element' => 'mijoshop'),
					array('title' => 'MijoShop Library', 'element' => 'mijoshoplibrary'),
					array('title' => 'MijoShop Themes', 'element' => 'mijoshopthemes')
				);

		if (!empty($packages)) {
			foreach ($packages as $package) {
				$ptitle		= $package['title'];
				$pelement	= $package['element'];
				
				if ($pelement != 'mijoshop') {
					$db->setQuery("SELECT extension_id FROM #__extensions WHERE type = 'file' AND element = '{$pelement}' LIMIT 1");
					$id = $db->loadResult();
					if ($id) {
						$installer = new JInstaller();
						$installer->uninstall('file', $id);
					}
				}
				
				$status->packages[] = array('name' => $ptitle);
			}
		}
		
        /***********************************************************************************************
		 * ---------------------------------------------------------------------------------------------
		 * MODULE REMOVAL SECTION
		 * ---------------------------------------------------------------------------------------------
		 ***********************************************************************************************/
		$modules = array(
					array('title' => 'MijoShop - All-in-One', 'element' => 'mod_mijoshop', 'client' => 'Site', 'position' => 'left'),
					array('title' => 'MijoShop - Orders', 'element' => 'mod_mijoshop_orders', 'client' => 'Administrator', 'position' => 'cpanel'),
					array('title' => 'MijoShop - Quick Icons', 'element' => 'mod_mijoshop_quickicons', 'client' => 'Administrator', 'position' => 'icon')
				);

		if (!empty($modules)) {
			foreach ($modules as $module) {
				$mtitle		= $module['title'];
				$melement	= $module['element'];
				$mclient	= $module['client'];
				$mmclient 	= ($mclient == 'Site') ? 0 : 1;
				
				$db->setQuery("SELECT extension_id FROM #__extensions WHERE type = 'module' AND element = '{$melement}' AND client_id = '{$mmclient}' LIMIT 1");
				$id = $db->loadResult();
				if ($id) {
					$installer = new JInstaller();
					$installer->uninstall('module', $id);
				}

				$status->modules[] = array('name' => $mtitle, 'client' => $mclient);
			}
		}


		/***********************************************************************************************
		 * ---------------------------------------------------------------------------------------------
		 * PLUGIN REMOVAL SECTION
		 * ---------------------------------------------------------------------------------------------
		 ***********************************************************************************************/
		$plugins = array(
					array('title' => 'Content - MijoShop', 'folder' => 'content', 'element' => 'mijoshop'),
					array('title' => 'Editors-xtd - MijoShop', 'folder' => 'editors-xtd', 'element' => 'mijoshop'),
					array('title' => 'MijoShop - ACL', 'folder' => 'mijoshop', 'element' => 'acl'),
					array('title' => 'MijoShop - Email Article', 'folder' => 'mijoshop', 'element' => 'emailarticle'),
					array('title' => 'MijoShop - MijoShop Customer Group', 'folder' => 'mijoshop', 'element' => 'mijoshop'),
					array('title' => 'MijoShop - SQL', 'folder' => 'mijoshop', 'element' => 'sql'),
					array('title' => 'MijoShop - Trigger', 'folder' => 'mijoshop', 'element' => 'trigger'),
					array('title' => 'Search - MijoShop', 'folder' => 'search', 'element' => 'mijoshop'),
					array('title' => 'Smart Search - MijoShop', 'folder' => 'finder', 'element' => 'mijoshop'),
					array('title' => 'System - MijoShop Redirect', 'folder' => 'system', 'element' => 'mijoshopredirect'),
					array('title' => 'User - MijoShop', 'folder' => 'user', 'element' => 'mijoshop')
				);
				
		if (!empty($plugins)) {
			foreach ($plugins as $plugin) {
				$ptitle		= $plugin['title'];
				$pfolder	= $plugin['folder'];
				$pelement	= $plugin['element'];

				$db->setQuery("SELECT extension_id FROM #__extensions WHERE type = 'plugin' AND element = '{$pelement}' AND folder = '{$pfolder}' LIMIT 1");
				$id = $db->loadResult();
				if ($id) {
					$installer = new JInstaller();
					$installer->uninstall('plugin', $id);
				}
				
				$status->plugins[] = array('name' => $ptitle, 'group' => $pfolder);
			}
		}

        $this->_uninstallationOutput($status);
	}

    private function _installationOutput($status) {

$rows = 0;
?>
<img src="components/com_mijoshop/assets/images/logo.png" alt="Joomla Shopping Cart" style="width:80px; height:80px; float: left; padding-right:15px;" />

<h2>MijoShop Installation</h2>
<h2><a href="index.php?option=com_mijoshop">Go to MijoShop</a></h2>
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
			<td class="key" colspan="2"><?php echo 'MijoShop '.JText::_('Component'); ?></td>
			<td><strong><?php echo JText::_('Installed'); ?></strong></td>
		</tr>
	<?php
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

<h2>MijoShop Removal</h2>
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
		<?php foreach ($status->packages as $package) : ?>
		<tr class="row<?php echo (++ $rows % 2); ?>">
			<td class="key" colspan="2"><?php echo $package['name']; ?></td>
			<td><strong><?php echo JText::_('Removed'); ?></strong></td>
		</tr>
	<?php endforeach;
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