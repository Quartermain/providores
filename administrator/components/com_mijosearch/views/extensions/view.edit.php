<?php
/**
 * @package		MijoSearch
 * @copyright	2009-2013 Mijosoft LLC, www.mijosoft.com
 * @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
 * @license		2009-2012 GNU/GPL based on AceSearch www.joomace.net
 */

//No Permision
defined('_JEXEC') or die('Restricted access');

// Imports
jimport('joomla.form.form');
MijoSearch::get('utility')->import('library.elements.fieldlist');
MijoSearch::get('utility')->import('library.elements.handlerlist');
MijoSearch::get('utility')->import('library.elements.multiselectsql');

class MijosearchViewExtensions extends MijosearchView {
	
	function edit($tpl = null){
        $row = $this->getModel()->getEditData('MijosearchExtensions');
		
		$ext_form = JForm::getInstance('extensionForm', JPATH_MIJOSEARCH_ADMIN.'/extensions/'.$row->extension.'.xml', array(), true, 'config');
		$ext_values = array('params' => json_decode($row->params));
		$ext_form->bind($ext_values);
		
		$common_form = JForm::getInstance('commonForm', JPATH_MIJOSEARCH_ADMIN.'/extensions/default_params.xml', array(), true, 'config');
		$common_values = array('params' => json_decode($row->params));
		$common_form->bind($common_values);
		
		// Get description from XML
		$xml_file = JPATH_MIJOSEARCH_ADMIN.'/extensions/'.$row->extension.'.xml';
		if (file_exists($xml_file)) {
			$row->description = MijoSearch::get('utility')->getXmlText($xml_file, 'description');
		}
		
		// Get behaviors
		JHTML::_('behavior.combobox');
		JHTML::_('behavior.tooltip');
		JHTML::_('bootstrap.tooltip');
		
		// Get search values              
		$this->row =			$row;
		$this->ext_params =     $ext_form;
		$this->common_params =  $common_form;
		
		parent::display($tpl);
	}
}