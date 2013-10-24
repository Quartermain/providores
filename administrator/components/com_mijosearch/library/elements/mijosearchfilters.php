<?php
/**
 * @package		MijoSearch
 * @copyright	2009-2013 Mijosoft LLC, www.mijosoft.com
 * @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
 * @license		2009-2012 GNU/GPL based on AceSearch www.joomace.net
 */

//No Permision
defined('_JEXEC') or die('Restricted access');

jimport('joomla.form.formfield');
jimport('joomla.html.parameter.element');

class JFormFieldMijosearchFilters extends JFormField{

    protected $type = 'MijosearchFilters';

	protected function getInput() {
		// Construct the various argument calls that are supported
		$attribs = 'class="inputbox"';

		$db = JFactory::getDBO();
		$db->setQuery("SELECT id, title FROM #__mijosearch_filters_groups");
		$rows = $db->loadObjectList();

        $options = array();
        $options[] = array('option' => '', 'name' => JText::_('- - - - - -'));

		foreach ($rows as $row){
			$options[] = array('option' => $row->id, 'name' => $row->title);
		}

		return JHTML::_('select.genericlist', $options, $this->name, $attribs, 'option', 'name', $this->value, $this->name);
	}
}