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
if (!class_exists('MijosearchUtility')) {
	require_once(JPATH_ADMINISTRATOR.'/components/com_mijosearch/library/utility.php');
}

class JFormFieldHandlerList extends JFormField{

    protected $type = 'HandlerList';

	protected function getInput() {
		// Construct the various argument calls that are supported
		$attribs = 'class="inputbox"';

        $extension = MijoSearch::get('utility')->getExtensionFromRequest();

		$options = MijoSearch::get('utility')->getHandlerList($extension);

		return JHTML::_('select.genericlist', $options, $this->name, $attribs, 'value', 'text', $this->value, $this->name);
	}
}