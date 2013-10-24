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

class JFormFieldMijoshopInformation extends JFormField {

    protected $type = 'MijoshopInformation';

    protected function getInput() {
        $db = JFactory::getDbo();

        $query = "SELECT DISTINCT id.information_id AS id, id.title AS name "
                ."FROM #__mijoshop_information AS i, #__mijoshop_information_description AS id "
                ."WHERE i.status = '1' "
                //."AND id.language_id = '1' "
                ."ORDER BY i.sort_order, id.title";

        $db->setQuery($query);
        $rows = $db->loadObjectList();

        if (empty($rows)) {
            return 'No information pages created.';
        }

        foreach ($rows as $row){
            $options[] = array('id' => $row->id, 'name' => $row->name);
        }

        return JHTML::_('select.genericlist', $options, $this->name, 'class="inputbox"', 'id', 'name', $this->value, $this->name);
    }
}
