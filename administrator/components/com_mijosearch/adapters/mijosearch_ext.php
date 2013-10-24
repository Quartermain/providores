<?php
/**
* @version		1.7.0
* @package		MijoSearch
* @subpackage	MijoSearch
* @copyright	2009-2011 Mijosoft LLC, www.mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceSearch www.joomace.net
*/

// No permission
defined('_JEXEC') or die('Restricted Access');

jimport('joomla.html.parameter');

// MijoSearch extension installation adapater
class JInstallerMijosearch_Ext extends JObject {

	function __construct(&$parent) {
		$this->parent = $parent;
	}

	function install() {		
		// Get the extension manifest object
		$this->manifest = $this->parent->getManifest();
		
		// Set the extension's name
		$name = (string)$this->manifest->name;
		$this->parent->set('name', $name);
		
		// Set the extension's description
        $description = (string)$this->manifest->description;
        $this->parent->set('message', $description);

		// Set the installation path
		$this->parent->setPath('extension_root', JPATH_ADMINISTRATOR.'/components/com_mijosearch/extensions');
		
		/**
		* ---------------------------------------------------------------------------------------------
		* Filesystem Processing Section
		* ---------------------------------------------------------------------------------------------
		*/
		
		// If the extension directory does not exist, lets create it
        $created = false;
        if (!file_exists($this->parent->getPath('extension_root'))) {
            if (!$created = JFolder::create($this->parent->getPath('extension_root'))) {
                $this->parent->abort(JText::_('MijoSearch Extension').' '.JText::_('Install').': '.JText::_('Failed to create directory').': "'.$this->parent->getPath('extension_root').'"');
                return false;
            }
        }

        if ($created) {
            $this->parent->pushStep(array ('type' => 'folder', 'path' => $this->parent->getPath('extension_root')));
        }
		
		// Copy all necessary files
		$element = $this->manifest->files;
		if ($this->parent->parseFiles($element, -1) === false) {
            // Install failed, roll back changes
            $this->parent->abort();
            return false;
        }
		
		// If there is an install file, lets copy it.
        $installScriptElement = (string)$this->manifest->installfile;
        if ($installScriptElement) {
            // Make sure it hasn't already been copied (this would be an error in the xml install file)
            if (!file_exists($this->parent->getPath('extension_root').'/'.$installScriptElement))
            {
                $path['src']	= $this->parent->getPath('source').'/'.$installScriptElement;
                $path['dest']	= $this->parent->getPath('extension_root').'/'.$installScriptElement;
                if (!$this->parent->copyFiles(array ($path))) {
                    // Install failed, rollback changes
                    $this->parent->abort(JText::_('MijoSearch Extension').' '.JText::_('Install').': '.JText::_('Could not copy PHP install file.'));
                    return false;
                }
            }
            $this->set('install.script', $installScriptElement);
        }

        // If there is an uninstall file, lets copy it.
        $uninstallScriptElement = (string)$this->manifest->uninstallfile;
        if ($uninstallScriptElement) {
            // Make sure it hasn't already been copied (this would be an error in the xml install file)
            if (!file_exists($this->parent->getPath('extension_root').'/'.$uninstallScriptElement))
            {
                $path['src']	= $this->parent->getPath('source').'/'.$uninstallScriptElement;
                $path['dest']	= $this->parent->getPath('extension_root').'/'.$uninstallScriptElement;
                if (!$this->parent->copyFiles(array ($path))) {
                    // Install failed, rollback changes
                    $this->parent->abort(JText::_('MijoSearch Extension').' '.JText::_('Install').': '.JText::_('Could not copy PHP uninstall file.'));
                    return false;
                }
            }
        }
		
		/**
		* ---------------------------------------------------------------------------------------------
		* Database Processing Section
		* ---------------------------------------------------------------------------------------------
		*/
		$db = JFactory::getDBO();
		
		/*
        * Let's run the install queries for the component
        *	If backward compatibility is required - run queries in xml file
        *	If Joomla 1.5 compatible, with discreet sql files - execute appropriate
        *	file for utf-8 support or non-utf-8 support
        */
		if ($this->manifest->install->queries) {
			$result = $this->parent->parseQueries($this->manifest->install->queries);
			if ($result === false) {
				// Install failed, rollback changes
				$this->parent->abort(JText::_('MijoSearch Extension').' '.JText::_('Install').': '.JText::_('SQL Error')." ".$db->stderr(true));
				return false;
			} elseif ($result === 0) {
				// no backward compatibility queries found - try for Joomla 1.5 type queries
				// second argument is the utf compatible version attribute
				$utfresult = $this->parent->parseSQLFiles($this->manifest->install->sql);
				if ($utfresult === false) {
					// Install failed, rollback changes
					$this->parent->abort(JText::_('MijoSearch Extension').' '.JText::_('Install').': '.JText::_('SQLERRORORFILE')." ".$db->stderr(true));
					return false;
				}
			}
		}
		
		//Get Cilent 
		$client = (string)$this->manifest->client;
		
		// Get extension
		$extension = preg_replace('/.xml$/', '', basename($this->parent->getPath('manifest')));
		
		// Check if extension exists and upgrade is performed
		$db->setQuery("SELECT name, params FROM #__mijosearch_extensions WHERE extension = '{$extension}'");
		$existing = $db->loadObject();
		
		$installation = false;
		
		// Existing Install
		if (!is_null($existing)) {
			if ($existing->name == "") {
				$old_p = new JRegistry($existing->params);
				$new_p = new JRegistry(self::_getDefaultParams());
		
				$new_p->set('custom_name', $old_p->get('custom_name', ''));
				
				$params = $new_p->toString();
				
				$db->setQuery("UPDATE #__mijosearch_extensions SET name = '{$name}', params = '{$params}', client = '{$client}' WHERE extension = '{$extension}'");
				$db->query();
				
				$installation = true;
			}
		}
		// New Install
		else {
			JTable::addIncludePath(JPATH_ADMINISTRATOR.'/components/com_mijosearch/tables');
			$row = JTable::getInstance('MijosearchExtensions', 'Table');
			$row->name 			= $name;
			$row->extension 	= $extension;
			$row->client		= $client;
			$row->params 		= self::_getDefaultParams();
			$row->store();
			
			$installation = true;
		}
		
		/**
		* ---------------------------------------------------------------------------------------------
		* Custom Installation Script Section
		* ---------------------------------------------------------------------------------------------
		*/

		/*
		* If we have an install script, lets include it, execute the custom
		* install method, and append the return value from the custom install
		* method to the installation message.
		*/
		if ($this->get('install.script')) {
			if (is_file($this->parent->getPath('extension_root').'/'.$this->get('install.script'))) {
				ob_start();
				ob_implicit_flush(false);
				require_once ($this->parent->getPath('extension_root').'/'.$this->get('install.script'));
				if (function_exists('com_install')) {
					if (com_install() === false) {
						$this->parent->abort(JText::_('MijoSearch Extension').' '.JText::_('Install').': '.JText::_('Custom install routine failure'));
						return false;
					}
				}
				$msg = ob_get_contents();
				ob_end_clean();
				if ($msg != '') {
					$this->parent->set('extension.message', $msg);
				}
			}
		}
		
		/**
		* ---------------------------------------------------------------------------------------------
		* Finalization and Cleanup Section
		* ---------------------------------------------------------------------------------------------
		*/
		
		// Lastly, we will copy the manifest file to its appropriate place.
		if (!$this->parent->copyManifest(-1)) {
			// Install failed, rollback changes
			$this->parent->abort(JText::_('Could not copy setup file'));
			return false;
		}

		return true;
		
	}
    
	// Get default params
    function _getDefaultParams() {
		$prms = array();
		$prms['handler'] = 1;
		$prms['custom_name'] = ' ';
		$prms['access'] = 1;
		$prms['result_limit'] = ' ';
		
        $element = $this->manifest->install->defaultParams;
		if (($element instanceof SimpleXMLElement) and count($element->children())) {
			$defaultParams = $element->children();
			
			if (count($defaultParams) != 0) {
				foreach ($defaultParams as $param) {
					$name = (string)$param->attributes()->name;
					$value = (string)$param->attributes()->value;
					
					$prms[$name] = $value;
				}
			}
		}
		
		$reg = new JRegistry($prms);
		$params = $reg->toString();
		
		return $params;
    }
}