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

class JFormFieldMijoshopManufacturer extends JFormField {

    protected $type = 'MijoshopManufacturer';

    protected function getInput() {
        $db = JFactory::getDbo();
        $query = "SELECT DISTINCT manufacturer_id, name FROM #__mijoshop_manufacturer ORDER BY name";
        $db->setQuery($query);
        $rows = $db->loadObjectList();

        if (empty($rows)) {
            return 'No manufacturers created.';
        }

        foreach ($rows as $row){
            $options[] = array('manufacturer_id' => $row->manufacturer_id, 'name' => $row->name);
        }

        return JHTML::_('select.genericlist', $options, $this->name, 'class="inputbox"', 'manufacturer_id', 'name', $this->value, $this->name);
    }
}
