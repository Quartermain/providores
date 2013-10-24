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

class JFormFieldMijoshopCategory extends JFormField {

    protected $type = 'MijoshopCategory';

    protected function getInput() {
        $db 		= JFactory::getDbo();
        $lang_id 	= Mijoshop::get('opencart')->get('config')->get('config_language_id', 1);

        $query = "SELECT cp.category_id AS id, GROUP_CONCAT(cd1.name ORDER BY cp.level SEPARATOR ' &gt; ') AS name, c.parent_id
                  FROM #__mijoshop_category_path cp
                    LEFT JOIN #__mijoshop_category c ON (cp.category_id = c.category_id)
                    LEFT JOIN #__mijoshop_category_description cd1 ON (cp.path_id = cd1.category_id)
                    LEFT JOIN #__mijoshop_category_description cd2 ON (cp.category_id = cd2.category_id)
                  WHERE c.status = '1' AND cd1.language_id=". $lang_id ." AND cd2.language_id=". $lang_id ."
                  GROUP BY cp.category_id ORDER BY name";
        
		$db->setQuery($query);
        $rows = $db->loadObjectList();

        if (empty($rows)) {
            return 'No categories created.';
        }
		
		/*
        // Collect childrens
        $children = array();
        foreach ($rows as $row) {
            // Not subcategories
            if (empty($row->parent)) {
                $row->parent = 0;
            }

            $pt = $row->parent;
            $list = @$children[$pt] ? $children[$pt] : array();
            array_push($list, $row);
            $children[$pt] = $list;
        }

        // Not subcategories
        if (empty($rows[0]->parent)) {
            $rows[0]->parent = 0;
        }

        // Build Tree
        $tree = MijoShop::get('base')->buildIndentTree(intval($rows[0]->parent), '', array(), $children);
		*/
		
        foreach ($rows as $item){
            $options[] = array('path' => $item->id, 'name' => $item->name);
        }

        return JHTML::_('select.genericlist', $options, $this->name, 'class="inputbox"', 'path', 'name', $this->value, $this->name);
    }
}
