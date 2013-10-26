<?php
/*
#------------------------------------------------------------------------
# Package - JoomlaMan JMSlideShow
# Version 1.0
# -----------------------------------------------------------------------
# Author - JoomlaMan http://www.joomlaman.com
# Copyright © 2012 - 2013 JoomlaMan.com. All Rights Reserved.
# @license http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 or Later
# Websites: http://www.JoomlaMan.com
#------------------------------------------------------------------------
*/
//-- No direct access
defined('_JEXEC') or die('Restricted access');
class JFormFieldSlideSource extends JFormField {
    /**
     * The form field type.
     *
     * @var    string
     * @since  11.1
     */
    protected $type = 'SlideSource';
    /**
     * Method to get the field input markup for a generic list.
     * Use the multiple attribute to enable multiselect.
     *
     * @return  string  The field input markup.
     *
     * @since   11.1
     */
    protected function getInput() {
        // Initialize variables.
        $html = array();
        $attr = '';
        // Initialize some field attributes.
        $attr .= $this->element['class'] ? ' class="' . (string) $this->element['class'] . '"' : '';
        // To avoid user's confusion, readonly="true" should imply disabled="true".
        if ((string) $this->element['readonly'] == 'true' || (string) $this->element['disabled'] == 'true') {
            $attr .= ' disabled="disabled"';
        }
        $attr .= $this->element['size'] ? ' size="' . (int) $this->element['size'] . '"' : '';
        $attr .= $this->multiple ? ' multiple="multiple"' : '';
        // Initialize JavaScript field attributes.
        $attr .= $this->element['onchange'] ? ' onchange="' . (string) $this->element['onchange'] . '"' : '';
        // Get the field options.
        $options = (array) $this->getOptions();
        // Create a read-only list (no name) with a hidden input to store the value.
        if ((string) $this->element['readonly'] == 'true') {
            $html[] = JHtml::_('select.genericlist', $options, '', trim($attr), 'value', 'text', $this->value, $this->id);
            $html[] = '<input type="hidden" name="' . $this->name . '" value="' . $this->value . '"/>';
        }
        // Create a regular list.
        else {
            $html[] = JHtml::_('select.genericlist', $options, $this->name, trim($attr), 'value', 'text', $this->value, $this->id);
        }
        return implode($html);
    }
    /**
     * Method to get the field options.
     *
     * @return  array  The field option objects.
     *
     * @since   11.1
     */
    protected function getOptions() {
        // Initialize variables.
        $options = array();
        //Joomla Categories Options
        $options[] = JHtml::_('select.option', 1, 'Joomla Categories');
        //Special Articles IDs
        $options[] = JHtml::_('select.option', 2, 'Special Articles IDs');
		
		$options[] = JHtml::_('select.option',7,'Featured Articles');
        //K2 Categories
        $db = JFactory::getDbo();
        $query = "SELECT extension_id FROM #__extensions WHERE name IN('k2','com_k2') AND type='component'";
        $db->setQuery($query);
        $result = $db->loadResult();
        if ($result) {
            $options[] = JHtml::_('select.option', 3, 'K2 Categories');
            $options[] = JHtml::_('select.option', 4, 'Special K2 IDs');
            $options[] = JHtml::_('select.option',8,'K2 Featured Articles');
        }
		
		//Hilashop Categories
		$query = "SELECT extension_id FROM #__extensions WHERE name IN('hikashop') AND type='component'";
        $db->setQuery($query);
        $result = $db->loadResult();
        if($result){
            $options[] = JHtml::_('select.option',5,'Hikashop Categories');
            $options[] = JHtml::_('select.option',6,'Hikashop Product IDs');
        }
		
		$options[] = JHtml::_('select.option',9,'From directory');
        reset($options);
        return $options;
    }
}