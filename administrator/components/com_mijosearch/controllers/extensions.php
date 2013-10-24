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

class MijosearchControllerExtensions extends MijosearchController {
	
	// Main constructer
	function __construct() {
		if (!JFactory::getUser()->authorise('mijosearch.extensions', 'com_mijosearch')) {
			//return JError::raiseWarning(404, JText::_('JERROR_ALERTNOAUTHOR'));
		}

		parent::__construct('extensions');
	}
	
	// Display
	function view() {
		$this->_model->checkComponents();
		
		$view = $this->getView(ucfirst($this->_context), 'html');
		$view->setModel($this->_model, true);
		$view->view();
	}
	
	// Uninstall extensions
	function uninstall() {
		// Check token
		JRequest::checkToken() or jexit('Invalid Token');
		
		// Uninstall selected extensions
		$this->_model->uninstall();

		// Return
		parent::route(JText::_('COM_MIJOSEARCH_EXTENSIONS_VIEW_REMOVED'));
	}
	
	// Save changes
	function apply() {
		// Check token
		JRequest::checkToken() or jexit('Invalid Token');
		
		// Save
		$this->_model->apply();
		
		// Return
		parent::route(JText::_('COM_MIJOSEARCH_EXTENSIONS_VIEW_SAVED'));
	}
	
	
	// Install a new extension
	function installUpgrade() {
		// Check token
		JRequest::checkToken() or jexit('Invalid Token');
		
		if (!$this->_model->installUpgrade()){
			JError::raiseWarning('1001', JText::_('COM_MIJOSEARCH_EXTENSIONS_VIEW_NOT_INSTALLED'));
		}
        else {
			parent::route(JText::_('COM_MIJOSEARCH_EXTENSIONS_VIEW_INSTALLED'));
		}
	}
}