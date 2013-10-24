<?php
/**
* @version		1.5.0
* @package		MijoSearch
* @subpackage	MijoSearch
* @copyright	2009-2011 Mijosoft LLC, www.mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceSearch www.joomace.net
*/

//No Permision
defined( '_JEXEC' ) or die( 'Restricted access' );

// Imports
jimport('joomla.filesystem.file');
jimport('joomla.filesystem.folder');
jimport('joomla.installer.installer');
jimport('joomla.installer.helper');
require_once(JPATH_MIJOSEARCH_ADMIN.'/adapters/mijosearch_ext.php');

class MijosearchModelExtensions extends MijosearchModel{
	
	function __construct() {
		parent::__construct('extensions');
		
		$this->_getUserStates();
		$this->_buildViewQuery();
	}
	
	function _getUserStates() {
		$this->filter_order		= parent::_getSecureUserState($this->_option . '.' . $this->_context . '.filter_order',		'filter_order',		'name');
		$this->filter_order_Dir	= parent::_getSecureUserState($this->_option . '.' . $this->_context . '.filter_order_Dir',	'filter_order_Dir',	'ASC');
		$this->search_name		= parent::_getSecureUserState($this->_option . '.' . $this->_context . '.search_name', 		'search_name', 		'');
        $this->filter_access	= parent::_getSecureUserState($this->_option . '.' . $this->_context . '.filter_access', 	'filter_access', 	'-1');
        $this->filter_handler	= parent::_getSecureUserState($this->_option . '.' . $this->_context . '.filter_handler', 	'filter_handler', 	'-1');
        $this->search_cname		= parent::_getSecureUserState($this->_option . '.' . $this->_context . '.search_cname', 	'search_cname', 	'');
        $this->client			= parent::_getSecureUserState($this->_option . '.' . $this->_context . '.client',  			'client', 			'-1');
        $this->search_name		= JString::strtolower($this->search_name);
		$this->search_cname		= JString::strtolower($this->search_cname);
	}
	
	
	function getLists() {
		$lists = array();
		
		// Table ordering
		$lists['order_dir'] = $this->filter_order_Dir;
		$lists['order'] 	= $this->filter_order;
		
		// Filter's action
		$javascript = ' onchange="document.adminForm.submit();"';
		
		// Client filters
		$clients = array();
		$clients[] = JHTML::_('select.option', '-1', JText::_('COM_MIJOSEARCH_EXTENSIONS_CLIENT_ALL'));
		$clients[] = JHTML::_('select.option', '0', JText::_('COM_MIJOSEARCH_EXTENSIONS_CLIENT_FRONT'));
		$clients[] = JHTML::_('select.option', '1', JText::_('COM_MIJOSEARCH_EXTENSIONS_CLIENT_BACK'));
		$clients[] = JHTML::_('select.option', '2', JText::_('COM_MIJOSEARCH_EXTENSIONS_CLIENT_BOTH'));
		$lists['client'] = JHTML::_('select.genericlist',$clients , 'client', 'class="inputbox" size="1" style="width:100px;"'.$javascript, 'value' ,'text' , $this->client);
		
		// Reset filters
		$lists['reset_filters'] = '<input type="submit" class="btn btn-primary" style="margin-bottom: 10px !important;" onClick="resetFilters();" value="'. JText::_('Reset') .'" />';
		
		// Search name
        $lists['search_name'] = "<input type=\"text\" name=\"search_name\" value=\"{$this->search_name}\" size=\"25\" style=\"width:150px;\" maxlength=\"255\" onchange=\"document.adminForm.submit();\" />";

		// Access Filter
		$access_levels_list = array();
		$access_levels_list[] = JHTML::_('select.option', '-1', JText::_('COM_MIJOSEARCH_COMMON_SELECT'));
		$access_levels = MijoSearch::get('utility')->getAccessLevels();
		foreach($access_levels as $access_level) {
			$access_levels_list[] = JHTML::_('select.option', $access_level->id, $access_level->title);
		}
		$lists['access_list'] = JHTML::_('select.genericlist', $access_levels_list, 'filter_access', 'class="inputbox" size="1" style="width:85px;"'.$javascript, 'value', 'text', $this->filter_access);
		
		// Handler Filter
		$handler_list = array();
		$handler_list[] = JHTML::_('select.option', '-1', JText::_('COM_MIJOSEARCH_COMMON_SELECT'));
		$handler_list[] = JHTML::_('select.option', '1', JText::_('COM_MIJOSEARCH_EXTENSIONS_VIEW_SELECT_EXTENSION'));
		$handler_list[] = JHTML::_('select.option', '2', JText::_('COM_MIJOSEARCH_EXTENSIONS_VIEW_SELECT_PLUGIN'));
		$handler_list[] = JHTML::_('select.option', '0', JText::_('COM_MIJOSEARCH_EXTENSIONS_VIEW_SELECT_DISABLE'));
   	   	$lists['handler_list'] = JHTML::_('select.genericlist', $handler_list, 'filter_handler', 'class="inputbox" size="1" style="width:150px;"'.$javascript,'value', 'text', $this->filter_handler);
		
        // Search custon name
        $lists['search_cname'] = "<input type=\"text\" name=\"search_cname\" value=\"{$this->search_cname}\" size=\"20\" style=\"width:150px;\" maxlength=\"255\" onchange=\"document.adminForm.submit();\" />";
        
		return $lists;
	}
	
	// Routers state
	function checkComponents() {
        $filter = MijoSearch::get('utility')->getSkippedComponents();
        $components = MijoDatabase::loadResultArray("SELECT `element` FROM `#__extensions` WHERE `type` = 'component' AND `element` NOT IN ({$filter}) ORDER BY `element`");

		foreach ($components as $component) {
			// Check if there is already a record available
			$total = MijoDatabase::loadResult("SELECT COUNT(*) FROM #__mijosearch_extensions WHERE extension = '{$component}'");
			
			if ($total < 1) {
				$name = "";
                $client = 0;
				$handler = 0;
				$handler_found = false;
				
				if (!$handler_found){
					$ext = JPATH_MIJOSEARCH_ADMIN.'/extensions/'.$component.'.php';
					
					if (file_exists($ext)) {
						$name = MijoSearch::get('utility')->getXmlText(JPATH_MIJOSEARCH_ADMIN.'/extensions/'.$component.'.xml', 'name');
						$client = MijoSearch::get('utility')->getXmlText(JPATH_MIJOSEARCH_ADMIN.'/extensions/'.$component.'.xml', 'client');
						$handler = 1;
						$handler_found = true;
					}
				}
				
				if (!$handler_found){
					$plugin = MijoSearch::get('utility')->findSearchPlugin($component);
					
					if ($plugin) {
						$handler = 2;
						$handler_found = true;
					}
				}

				$prms = array();
				$prms['handler'] = "{$handler}";
				$prms['custom_name'] = ' ';
				$prms['access'] = '1';
				$prms['result_limit'] = ' ';
				
				$reg = new JRegistry($prms);
				$params = $reg->toString();
	
				MijoDatabase::query("INSERT INTO #__mijosearch_extensions (name, extension, params, client) VALUES ('{$name}', '{$component}', '{$params}', '{$client}')");
            }
		}
	}
	
	// Install / Upgrade extensions
	function installUpgrade() {
		// Check if the extensions directory is writable
		$directory = JPATH_MIJOSEARCH_ADMIN.'/extensions';
		if (!is_writable($directory)) {
			JError::raiseWarning('1001', JText::_('COM_MIJOSEARCH_EXTENSIONS_VIEW_INSTALL_DIR_CHMOD_ERROR'));
		}
		
		$result = false;
		
		// Get vars
		$userfile 	= JRequest::getVar('install_package', null, 'files', 'array');
		$ext_url 	= JRequest::getVar('mijosofturl');
		
		// Manual upgrade or install
		MijoSearch::get('utility')->import('library.installer');
		if ($userfile) {
			$package = MijosearchInstaller::getPackageFromUpload($userfile);
		}
		// Automatic upgrade
		elseif($ext_url) {
			// Download the package
			$package = MijosearchInstaller::getPackageFromServer($ext_url);
		}

        $files = JFolder::files($package['dir']);
        if (!empty($files)) {
            foreach ($files as $file) {
                if (!strpos($file, '.j3.xml')) {
                    continue;
                }

                $ext = str_replace('.j3.xml', '', $file);

                if (file_exists($package['dir'].'/'.$ext.'.xml')) {
                    unset($files[2]);
                    JFile::delete($package['dir'].'/'.$ext.'.xml');
                }

                JFile::move($package['dir'].'/'.$ext.'.j3.xml', $package['dir'].'/'.$ext.'.xml');
            }
        }

		// Get an installer instance
		$installer = JInstaller::getInstance();
		$adapter = new JInstallerMijosearch_Ext($installer);
		$installer->setAdapter('mijosearch_ext', $adapter);
		
		// Install the package
		if (!$installer->install($package['dir'])) {
			// There was an error installing the package
			$msg = JText::sprintf('INSTALLEXT', JText::_($package['type']), JText::_('Error'));
			$result = false;
		} else {
			// Package installed sucessfully
			$msg = JText::sprintf('INSTALLEXT', JText::_($package['type']), JText::_('Success'));
			$result = true;
		}

		return $result;
	}
	
	// Uninstall extensions
	function uninstall() {
		// Get where
		$where = MijosearchController::_buildSelectedWhere();
		
		// Get extensions
		$extensions = MijoDatabase::loadAssocList("SELECT id, extension, params FROM #__mijosearch_extensions {$where}", "id");
		
		// Action
        foreach ($extensions as $id => $record) {
            $extension = $record['extension'];

            if (JFolder::exists(JPATH_SITE.'/components/'.$extension) or JFolder::exists(JPATH_ADMINISTRATOR.'/components/'.$extension)) {
				$params = array();
				$params['handler'] = 0;
				if (MijoSearch::get('utility')->findSearchPlugin($extension) != false) {
					$params['handler'] = 2;
				}
				MijoSearch::get('utility')->storeParams('MijosearchExtensions', $id, 'params', $params);

				// Update name
				MijoSearch::get('utility')->setData('MijosearchExtensions', $id, 'name', '');
			}
            else {
                MijoDatabase::query("DELETE FROM #__mijosearch_extensions WHERE extension = '{$extension}'");
            }

            // Remove the extension files
            if (file_exists(JPATH_MIJOSEARCH_ADMIN.'/extensions/'.$extension.'.php')){
                JFile::delete(JPATH_MIJOSEARCH_ADMIN.'/extensions/'.$extension.'.xml');
                JFile::delete(JPATH_MIJOSEARCH_ADMIN.'/extensions/'.$extension.'.php');
            }
        }
		
		return;
	}
	
	// Save changes
	function apply() {
		$ids 			= JRequest::getVar('id');
		$handler 		= JRequest::getVar('handler');
		$custom_name 	= JRequest::getVar('custom_name');
		$order			= JRequest::getVar('order');
	
		foreach ($ids as $id => $val) {
			$params = array();
			$params['handler'] = (int)$handler[$id];
			$params['custom_name'] = $custom_name[$id];

			MijoSearch::get('utility')->storeParams('MijosearchExtensions', $id, 'params', $params);
			
			MijoSearch::get('utility')->setData('MijosearchExtensions', $id, 'ordering', $order[$id]);
		}
	}
	
	function getInfo() {
		static $information;
		
		$information = array();
		if ($this->MijosearchConfig->version_checker == 1) {
			$information = MijoSearch::get('cache')->getRemoteInfo();
			unset($information['mijosearch']);
		}
		
		return $information;
    }
	
	function _buildViewQuery() {
		$where = $this->_buildViewWhere();
		$orderby = " ORDER BY {$this->filter_order} {$this->filter_order_Dir}, extension";
		
		$this->_query = "SELECT * FROM #__mijosearch_extensions {$where}{$orderby}";
	}
	
	// Filters function
	function _buildViewWhere() {
		$where = array();
		
		if (!empty($this->search_name)) {
			$src = parent::secureQuery($this->search_name, true);
			$where[] = "LOWER(name) LIKE {$src} OR LOWER(extension) LIKE {$src}";
		}
		
		if ($this->filter_access != '-1') {
			$src = $this->_db->escape($this->filter_access, true);
			$where[] = "params LIKE '%\"access\":{$src}%'";
		}
		
		if ($this->filter_handler != '-1') {
			$src = $this->_db->escape($this->filter_handler, true);
			$where[] = "params LIKE '%\"handler\":{$src}%'";
		}
		
		if (!empty($this->search_cname)) {
			$src = $this->_db->escape($this->search_cname, true);
			$where[] = "params LIKE '%\"custom_name\":{$src}%'";
		}
		
		if ($this->client != '-1') {
			$where[] = "client = {$this->client}";
		}
		
		$where = (count($where) ? ' WHERE '. implode(' AND ', $where) : '');
		
		return $where;
	}
}