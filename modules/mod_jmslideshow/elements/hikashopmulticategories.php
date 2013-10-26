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
jimport('joomla.html.html');
jimport('joomla.form.formfield');
class JFormFieldHikashopmulticategories extends JFormFieldList {
	protected $type = 'Hikashopmulticategories'; //the form field type
    var $options = array();
    protected function getInput() {
		// Initialize variables.
		$html = array();
		$attr = '';
		
		$attr .= $this->element['size'] ? ' size="'.(int) $this->element['size'].'"' : '';
		$attr .= $this->multiple ? ' multiple="multiple"' : '';
		$attr .= $this->element['class'] ? ' class="' . (string) $this->element['class'] . '"' : '';
	// Get the field options.
		$options = (array) $this->getOptions();
		// Create a read-only list (no name) with a hidden input to store the value.
		if ((string) $this->element['readonly'] == 'true') {
			$html[] = JHtml::_('select.genericlist', $options, '', trim($attr), 'value', 'text', $this->value, $this->id);
			$html[] = '<input type="hidden" name="'.$this->name.'" value="'.$this->value.'"/>';
		}
		// Create a regular list.
		else {
			$html[] = JHtml::_('select.genericlist', $options, $this->name, trim($attr), 'value', 'text', $this->value, $this->id);
		}
		
		return implode($html);
	}
    protected function getOptions() {
        // Initialize variables.
        $session = JFactory::getSession();
  
        $db = JFactory::getDBO();
				
		$query = "SELECT extension_id FROM #__extensions WHERE name IN('hikashop') AND type='component'";
        $db->setQuery($query);
        $result = $db->loadResult();
        if(empty($result)){
					return array();
        }
				
        // generating query
		$db->setQuery("SELECT c.category_name AS name, c.category_id AS id, c.category_parent_id AS parents FROM #__hikashop_category AS c WHERE category_published = 1 ORDER BY c.category_name, c.category_parent_id ASC");
 		// getting results
   		$results = $db->loadObjectList();
		if(count($results)){
  	     	// iterating
			$temp_options = array();
			
			foreach ($results as $item) {
				//print_r($item);
				array_push($temp_options, array($item->id, $item->name, $item->parents));	
			}
			
			foreach ($temp_options as $option) {
				//print_r($option);
        		if($option[2] == 1) {
        	    	$this->options[] = JHtml::_('select.option', $option[0], $option[1]);
        	    	$this->recursive_options($temp_options, 1, $option[0]);
        	    }
        	}		
            return $this->options;
		} else {	
            return $this->options;
		}
	}
 	// bind function to save
    function bind( $array, $ignore = '' ) {
        if (key_exists( 'field-name', $array ) && is_array( $array['field-name'] )) {
        	$array['field-name'] = implode( ',', $array['field-name'] );
        }
        
        return parent::bind( $array, $ignore );
    }
    function recursive_options($temp_options, $level, $parent){
		foreach ($temp_options as $option) {
      		if($option[2] == $parent) {
		  		$level_string = '';
		  		for($i = 0; $i < $level; $i++) $level_string .= '- - ';
        	    $this->options[] = JHtml::_('select.option',  $option[0], $level_string . $option[1]);
       	    	$this->recursive_options($temp_options, $level+1, $option[0]);
			}
       	}
    }
}
