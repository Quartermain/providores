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

class JFormFieldComponentList extends JFormField{

    protected $type = 'ComponentList';

	protected function getInput() {
		// Construct the various argument calls that are supported
		$attribs = 'class="inputbox"';
		
		$db = JFactory::getDBO();
		$db->setQuery("SELECT name, extension, `params`, `client` FROM #__mijosearch_extensions");
		$rows = $db->loadObjectList();

        $options = array();
        $options[] = array('option' => '', 'name' => JText::_('- All Components -'));

		foreach ($rows as $row){
            if($row->client == 1){
                unset($row);
            }
            else {
                $ext_params = json_decode($row->params, true);
                if($ext_params['handler'] == 0){
                    unset($row);
                }
                else {
                    if(empty($row->name)){
                        $row->name = $ext_params['extension'];
                    }
                    if(!empty($ext_params['custom_name'])){
                        $row->name = $ext_params['custom_name'];
                    }
                    $options[] = array('option' => $row->extension, 'name' => $row->name);
                }
            }
		}

		return JHTML::_('select.genericlist', $options, $this->name, $attribs, 'option', 'name', $this->value, $this->name);
	}
}