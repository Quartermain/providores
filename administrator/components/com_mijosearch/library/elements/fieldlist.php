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

class JFormFieldFieldList extends JFormField{

    protected $type = 'FieldList';

	protected function getInput() {
        $this->MijosearchConfig = MijoSearch::getConfig();

		// Construct the various argument calls that are supported
		$attribs = 'class="inputbox" multiple="multiple" size="7"';

		// Get rows
		$fields = array();

        $option = MijoSearch::get('utility')->getExtensionFromRequest();

		if (file_exists(JPATH_MIJOSEARCH_ADMIN.'/extensions/'.$option.'.php')) {
			$rows = MijoSearch::getExtension($option, 1)->getFieldList();

			if (!empty($rows)) {
				foreach ($rows as $row) {
					if (isset($row->id)) {
						$id = $row->id.'_'.$row->name;
					}
                    else {
						$id = $row->name;
					}
					
                    $fields[] = array('option' => $id, 'name' => $row->name);
				}
			}
		}

		return JHTML::_('select.genericlist', $fields, $this->name, $attribs, 'option', 'name', $this->value, $this->name);
	}
}