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

class JFormFieldMijoshopProduct extends JFormField {

    protected $type = 'MijoshopProduct';

    protected function getInput() {
        JHtml::_('behavior.framework');
        JHtml::_('behavior.modal', 'a.modal');

        $script = array();
        $script[] = '	function jSelectProducts(title, object) {';
        $script[] = '		document.id("'.$this->id.'_id").value = id;';
        $script[] = '		document.id("'.$this->id.'_name").value = title;';
        $script[] = '		SqueezeBox.close();';
        $script[] = '	}';
        JFactory::getDocument()->addScriptDeclaration(implode("\n", $script));

        $html = "";
        $doc 		=& JFactory::getDocument();
        $fieldName	= $control_name ? $control_name.'['.$name.']' : $name;
        $title = JText::_('Select a Product');

        $db = jFactory::getDBO();
        $q = "SELECT pd.product_id AS id, pd.name, pd.description, c.category_id AS cid FROM #__mijoshop_product AS p".
            " LEFT JOIN #__mijoshop_product_description AS pd ON p.product_id = pd.product_id".
            " LEFT JOIN #__mijoshop_product_to_category AS c ON p.product_id = c.product_id"
            ."WHERE p.status = '1'";
        $db->setQuery($q);
        $prods = $db->loadObjectList();

        if ($prods) {
            foreach ($prods AS $prod){
                $title = $prod->name;
            }
        }
        else {
            $title = JText::_('Select a Product');
        }

        $link = 'index.php?option=com_mijoshop&task=products&tmpl=component&object='.$this->name;

        $html = "\n".'<div style="float: left;"><input style="background: #ffffff;" type="text" id="'.$this->id.'_name" value="'.htmlspecialchars($title, ENT_QUOTES, 'UTF-8').'" disabled="disabled" /></div>';
        $html .= '<div class="button2-left"><div class="blank"><a class="modal" title="'.JText::_('Select a Product').'"  href="'.$link.'" rel="{handler: \'iframe\', size: {x: 800, y: 500}}">'.JText::_('Select').'</a></div></div>'."\n";
        $html .= "\n".'<input type="hidden" id="'.$this->id.'_id" name="'.$this->name.'" value="'.(int)$this->value.'" />';

        return $html;
    }
}
