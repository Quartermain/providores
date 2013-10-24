<?php
/**
* @version		1.5.0
* @package		MijoSearch
* @subpackage	MijoSearch
* @copyright	2009-2011 Mijosoft LLC, www.mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceSearch www.joomace.net
*/

//No Permision
defined( '_JEXEC' ) or die( 'Restricted access' );

class MijosearchViewSearch extends MijosearchView {

	function view($tpl = null){
		JToolBarHelper::title(JText::_('COM_MIJOSEARCH_CPANEL_SEARCH'), 'mijosearch');
		$this->toolbar->appendButton('Popup', 'help1', JText::_('Help'), 'http://www.mijosoft.com/support/docs/mijosearch/user-manual/search?tmpl=component', 650, 500);
		
		$document = JFactory::getDocument();
		$this->MijosearchConfig = MijoSearch::getConfig();
		
		$document->addStyleSheet(JURI::root(true).'/administrator/components/com_mijosearch/assets/css/mijosearch.css');
		$document->addStyleSheet(JURI::root(true).'/components/com_mijosearch/assets/css/mijosearch.css');
		
		//Get autocomplete
		if ($this->MijosearchConfig->admin_enable_complete == '1') { 
			$document->addScript(JURI::root(true).'/components/com_mijosearch/assets/js/autocompleter.js');
		}
		
		$this->results =	$this->get('Data');
		$this->total = 		$this->get('Total');
		$this->refines = 	$this->get('Refines');
		$this->pagination = $this->get('Pagination');
		$this->lists = 		MijosearchHTML::getExtensionList();
		
		parent::display($tpl);
	}
}