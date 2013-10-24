<?php
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

//No Permision
defined('_JEXEC') or die('Restricted access');

require_once(JPATH_ROOT.'/components/com_mijoshop/mijoshop/mijoshop.php');

jimport('joomla.form.formfield');

class JFormFieldMijoshopLayout extends JFormField {

    protected $type = 'MijoshopLayout';

    protected function getInput() {
        $db = JFactory::getDbo();
        $db->setQuery("SELECT layout_id, name FROM #__mijoshop_layout");
        $rows = $db->loadObjectList();

        if (empty($rows)) {
            return 'No layouts created.';
        }

        $options = array();
        foreach ($rows as $row){
            $options[] = array('value' => $row->layout_id, 'text' => $row->name);
        }

        return JHTML::_('select.genericlist', $options, $this->name, 'class="inputbox" style="width:150px !important;"', 'value', 'text', $this->value, $this->name);
    }
}
