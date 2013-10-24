<?php
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

//No Permision
defined('_JEXEC') or die('Restricted access');

require_once(JPATH_ROOT.'/components/com_mijoshop/mijoshop/mijoshop.php');

jimport('joomla.form.formfield');

class JFormFieldMijoshopStore extends JFormField {

    protected $type = 'MijoshopStore';

    protected function getInput() {
        $db = JFactory::getDbo();
        $query = "SELECT DISTINCT store_id, name FROM #__mijoshop_store ORDER BY name";
        $db->setQuery($query);
        $rows = $db->loadObjectList();

        $options[] = array('mijoshop_store_id' => 0, 'name' => 'Default');

        if (!empty($rows)) {
            foreach ($rows as $row){
                $options[] = array('mijoshop_store_id' => $row->store_id, 'name' => $row->name);
            }
        }

        return JHTML::_('select.genericlist', $options, $this->name, 'class="inputbox"', 'mijoshop_store_id', 'name', $this->value, $this->name);
    }
}
