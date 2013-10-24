<?php
/**
 * @package		MijoSearch
 * @copyright	2009-2013 Mijosoft LLC, www.mijosoft.com
 * @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
 * @license		2009-2012 GNU/GPL based on AceSearch www.joomace.net
 */

// No Permission
defined('_JEXEC') or die('Restricted Access');

jimport('joomla.form.formfield');
jimport('joomla.html.parameter.element');

// Load MijoSearch library
if (!class_exists('MijoDatabase')) {
	require_once(JPATH_ADMINISTRATOR.'/components/com_mijosearch/library/database.php');
}
if (!class_exists('MijosearchFactory')) {
	require_once(JPATH_ADMINISTRATOR.'/components/com_mijosearch/library/mijosearch.php');
}
if (!class_exists('MijosearchUtility')) {
	require_once(JPATH_ADMINISTRATOR.'/components/com_mijosearch/library/utility.php');
}

class JFormFieldMultiSelectSQL extends JFormField {

    protected $type = 'MultiSelectSQL';

	protected function getInput() {
        $this->MijosearchConfig = MijoSearch::getConfig();

		// Construct the various argument calls that are supported
		$attribs = 'class="inputbox" multiple="multiple" size="7"';
		
		$db	= JFactory::getDBO();
		$db->setQuery($this->element['db_query']);
		
		$key = ($this->element['db_id'] ? $this->element['db_id'] : 'id');
		$val = ($this->element['db_name'] ? $this->element['db_name'] : 'name');

		$rows = array();

		if ($this->element['default'] == 'alll') {
			$rows[0] = new stdClass();
			$rows[0]->id = 'alll';
			$rows[0]->name = JText::_('- All -');
		}

		$apps = array_merge($rows, $db->loadObjectList());

		return JHTML::_('select.genericlist', $apps, $this->name, $attribs, $key, $val, $this->value, $this->name);
	}
}