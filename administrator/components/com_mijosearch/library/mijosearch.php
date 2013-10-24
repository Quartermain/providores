<?php
/**
* @package		MijoSearch
* @copyright	2009-2013 Mijosoft LLC, www.mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

// No Permission
defined('_JEXEC') or die('Restricted Access');

define('MIJOSEARCH_PACK', 'pro');
define('JPATH_MIJOSEARCH', JPATH_ROOT.'/components/com_mijosearch');
define('JPATH_MIJOSEARCH_ADMIN', JPATH_ROOT.'/administrator/components/com_mijosearch');
define('JPATH_MIJOSEARCH_LIB', JPATH_MIJOSEARCH_ADMIN.'/library');

if (!class_exists('MijoDatabase')) {
	JLoader::register('MijoDatabase', JPATH_MIJOSEARCH_LIB.'/database.php');
}

JLoader::register('MijosearchExtension', JPATH_MIJOSEARCH_LIB.'/extension.php');
JLoader::register('MijosearchHTML', JPATH_MIJOSEARCH_LIB.'/html.php');
JLoader::register('MijosearchSearch', JPATH_MIJOSEARCH_LIB.'/search.php');

abstract class MijoSearch {

    public static function &get($class, $options = null) {
        static $instances = array();
		
		if (!isset($instances[$class])) {			
			require_once(JPATH_MIJOSEARCH_LIB.'/'.$class.'.php');
			
			$class_name = 'Mijosearch'.ucfirst($class);
			
			$instances[$class] = new $class_name($options);
		}

		return $instances[$class];
    }
	
	public static function &getConfig() {
		static $instance;

        if (version_compare(PHP_VERSION, '5.2.0', '<')) {
			JError::raiseWarning('100', JText::sprintf('MijoSearch requires PHP 5.2.x to run, please contact your hosting company.'));
			return false;
		}
		
		if (!is_object($instance)) {
			jimport('joomla.application.component.helper');

			$reg = new JRegistry(JComponentHelper::getParams('com_mijosearch'));

            $instance = $reg->toObject()->data;
		}
		
		return $instance;
	}
	
	public static function &getCache($lifetime = '315360000') {
		static $instances = array();
		
		if (!isset($instances[$lifetime])) {
			require_once(JPATH_ADMINISTRATOR.'/components/com_mijosearch/library/cache.php');
			$instances[$lifetime] = new MijosearchCache($lifetime);
		}
		
		return $instances[$lifetime];
	}

	public static function getTable($name) {
		static $tables = array();
		
		if (!isset($tables[$name])) {
			JTable::addIncludePath(JPATH_ADMINISTRATOR.'/components/com_mijosearch/tables');
			$tables[$name] = JTable::getInstance($name, 'Table');
		}
		
		return $tables[$name];
	}
	
	public static function &getExtension($option, $apply_filter = 0) {
		static $instances = array();

		$filter_prms = null;
        $cache = self::getCache();

		// Filters params
		$group_id = JRequest::getInt('filter');
		if (is_object($option)) {
			$filter_prms = new JRegistry($option->params);
			$option = $option->extension;
		}
		elseif (!empty($group_id)) { //For Html class
			$filter_prms = $cache->getFilterParams($group_id, $option);
		}
		
		if (!isset($instances[$option])) {
			$file = JPATH_ADMINISTRATOR.'/components/com_mijosearch/extensions/'.$option.'.php';
			
			if (!file_exists($file)) {
				$instances[$option] = null;
				
				return $instances[$option];
			}
			
			require_once($file);

			$extensions = $cache->getExtensions($apply_filter);
			$ext_params = new JRegistry($extensions[$option]->params);
			
			$class_name = 'MijoSearch_'.$option;
			
			$instances[$option] = new $class_name($extensions[$option], $ext_params, $filter_prms);
		}
		
		return $instances[$option];
	}

    public static function getExtraFields($option, $is_module = false) {
		$html = '';

		$fields = MijoSearch::get('utility')->getExtensionFieldsFromXml($option);

        if (empty($fields)) {
            return $html;
        }

		$extensions = self::getCache()->getExtensions();
		$ext_params = new JRegistry($extensions[$option]->params);

		if ($ext_params->get('handler', '1') == '2') {
			return $html;
		}

		$custom_name = $ext_params->get('custom_name', '');
		if (!empty($custom_name)) {
			$name = $custom_name;
		} else {
			$name = $extensions[$option]->name;
		}

		$filter_params = null;
		$group_id = JRequest::getInt('filter');
		if (!empty($group_id)) {
			$filter_params = self::getCache()->getFilterParams($group_id, $option);
		}

		$html_class = new MijosearchHTML($option, $ext_params, $filter_params, $is_module);

        $html = $html_class->getExtraFields($fields, $name);

        return $html;
    }
}

require_once(JPATH_MIJOSEARCH_LIB.'/factory.php');