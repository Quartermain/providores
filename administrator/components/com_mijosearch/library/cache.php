<?php
/**
 * @package		MijoSearch
 * @copyright	2009-2013 Mijosoft LLC, www.mijosoft.com
 * @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
 * @license		2009-2012 GNU/GPL based on AceSearch www.joomace.net
 */

// No Permission
defined('_JEXEC') or die('Restricted Access');

// Imports
jimport('joomla.cache.cache');

// Cache class
class MijosearchCache extends JCache {

	function __construct($lifetime) {
		$this->MijosearchConfig = MijoSearch::getConfig();
		
        $options = array(
			'defaultgroup' 	=> 'com_mijosearch',
			'cachebase'		=> JPATH_SITE.'/cache',
			'lifetime' 		=> $lifetime,
			'language' 		=> 'en-GB',
			'storage'		=> JFactory::getConfig()->get('cache_handler', 'file'),
            'caching'       => true,
		);
		
		parent::__construct($options);
	}

    function load($id) {
        $content = parent::get($id);
        
        if ($content === false) {
            return false;
        }
        
        $cache = @unserialize($content);
		
		if ($cache === false || !is_array($cache)) {
            return false;
        }
		
		return $cache;
    }
	
	function save($content, $id) {
		// Store the cache string
		for ($i = 0; $i < 5; $i++) {
            if (parent::store(serialize($content), $id)) {
                return;
            }
        }
		
		parent::remove($id);
	}
	
	function getExtensions($apply_filter = 0) {
		if ($this->MijosearchConfig->cache_extensions == 1) {
			$cache = MijoSearch::getCache();
			$cached_extensions = $cache->load('extensions');

			if (!empty($cached_extensions)) {
				return $cached_extensions;
			}
		}

        static $extensions;
		if (!isset($extensions)) {
            $levels	= JFactory::getUser()->getAuthorisedViewLevels();
            
			$fields = "id, name, extension, params";

            if (($apply_filter == 1) or (JFactory::getApplication()->isSite())) {
                $where = "WHERE params NOT LIKE '%\"handler\":0%' AND (client = 0 OR client = 2)";
            }
            elseif (JFactory::getApplication()->isAdmin()){
                $where = "WHERE params LIKE '%\"handler\":1%' AND (client = 1 OR client = 2)";
            }

			$extensions = MijoDatabase::loadObjectList("SELECT {$fields} FROM #__mijosearch_extensions {$where} ORDER BY ordering ASC, name ASC", 'extension');

            if (($apply_filter == 1) or (JFactory::getApplication()->isSite())) {
                foreach ($extensions as $key => $value) {
                    $params = new JRegistry($value->params);

                    if (!in_array($params->get('access'), $levels)) {
                        unset($extensions[$key]);
                    }
                }
            }
        }
		
		if (!empty($extensions)) {
			if ($this->MijosearchConfig->cache_extensions == 1) {
				$cache->save($extensions, 'extensions');
			}
			
			return $extensions;
		}
		
		return false;
	}
	
	function getFilterExtensions($group_id) {
		if ($this->MijosearchConfig->cache_extensions == 1) {
			$cache = MijoSearch::getCache();
			$cached_filt_extension = $cache->load('filter_extensions');
		
			if (!empty($cached_filt_extension)) {
				return $cached_filt_extension;
			}
		}
		
		static $extensions;
		if (!isset($extensions)) {
            $levels	= JFactory::getUser()->getAuthorisedViewLevels();

			$query = "SELECT flt.extension, ext.params, ext.name, flt.params AS flt_params FROM #__mijosearch_filters AS flt LEFT JOIN #__mijosearch_extensions AS ext ON ext.extension = flt.extension WHERE flt.group_id = '{$group_id}' AND flt.published = 1";
			$extensions = MijoDatabase::loadObjectList($query);

            foreach ($extensions as $key => $value) {
                $params = new JRegistry($value->flt_params);

                if (!in_array($params->get('access'), $levels)) {
                    unset($extensions[$key]);
					continue;
                }
				
				$params = new JRegistry($value->params);

                if (!in_array($params->get('access'), $levels)) {
                    unset($extensions[$key]);
                }
            }
		}
		
		if (!empty($extensions)) {
			if ($this->MijosearchConfig->cache_extensions == 1) {
				$cache->save($extensions, 'filter_extensions');
			}
			
			return $extensions;
		}
		
		return false;
	}
		
	function getFilterParams($group_id, $option) {
		static $cache = array();

		if (!isset($cache[$group_id])) {
			$cache[$group_id] = MijoDatabase::loadObjectList("SELECT params, extension FROM #__mijosearch_filters WHERE group_id = {$group_id} AND published = '1'", "extension");
		}

        if (!isset($cache[$group_id][$option]->params_object)) {
            $cache[$group_id][$option]->params_object = new JRegistry($cache[$group_id][$option]->params);
        }
		
		return $cache[$group_id][$option]->params_object;
	}

	function getExtensionParams($option) {
		static $params = array();

        if (!isset($params[$option])) {
		    $extensions = self::getExtensions();

			$params[$option] = new JRegistry($extensions[$option]->params);
		}

		return $params[$option];
	}
	
	function getRemoteInfo() {
		if (!isset($this->MijosearchConfig)) {
			$this->MijosearchConfig = MijoSearch::getConfig();
		}
		
		static $information;
		
		if ($this->MijosearchConfig->cache_versions == 1) {
			$cache = MijoSearch::getCache('86400');
			$information = $cache->load('versions');
		}
		
		if (!is_array($information)) {
			$information = array();
			$information['mijosearch'] = '?.?.?';
			
			$components = MijoSearch::get('utility')->getRemoteData('http://mijosoft.com/index.php?option=com_mijoextensions&view=xml&format=xml&catid=1');
			$extensions = MijoSearch::get('utility')->getRemoteData('http://mijosoft.com/index.php?option=com_mijoextensions&view=xml&format=xml&catid=3');
			
			if (strstr($components, '<?xml version="1.0" encoding="UTF-8" ?>')) {
				$manifest = simplexml_load_string($components);

				if (is_null($manifest)) {
					return $information;
				}
				
				$category = $manifest->category;
				if (!($category instanceof SimpleXMLElement) or (count($category->children()) == 0)) {
					return $information;
				}
				
				foreach ($category->children() as $component) {
                    $option = (string)$component->attributes()->option;
                    $compability = (string)$component->attributes()->compability;

					if ($option == 'com_mijosearch' and ($compability == 'all' or $compability == '3.0' or $compability == '1.6_3.0' or $compability == '1.5_1.6_3.0')) {
						$information['mijosearch'] = trim((string)$component->attributes()->version);
						break;
					}
				}
			}
			
			if (strstr($extensions, '<?xml version="1.0" encoding="UTF-8" ?>')) {
                $manifest = simplexml_load_string($extensions);

				if (is_null($manifest)) {
					return $information;
				}

				$category = $manifest->category;
				if (!($category instanceof SimpleXMLElement) or (count($category->children()) == 0)) {
					return $information;
				}
				
				foreach ($category->children() as $extension) {
                    $option = (string)$extension->attributes()->option;
                    $compability = (string)$extension->attributes()->compability;
					
					if ($compability == 'all' or $compability == '3.0' or $compability == '1.6_3.0' or $compability == '1.5_1.6_3.0') {
						$ext = new stdClass();
						$ext->version		= trim((string)$extension->attributes()->version);
						$ext->link			= trim((string)$extension->attributes()->download);
						$ext->description	= trim((string)$extension->attributes()->description);
					
						$information[$option] = $ext;
					}
				}
			}
			
			if ($this->MijosearchConfig->cache_versions == 1 and !empty($information)) {
				$cache->save($information, 'versions');
			}
		}
		
		return $information;
	}
}