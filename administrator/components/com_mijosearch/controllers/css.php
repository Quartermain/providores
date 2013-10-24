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

class MijosearchControllerCSS extends MijosearchController {

	// Main constructer
    function __construct() {
        parent::__construct('css');
    }
	
	function edit() {
		$view = $this->getView('CSS', 'html');
		JRequest::setVar('hidemainmenu', 1);
		$view->view();
	}
	
	function save() {
		// Check for request forgeries
		JRequest::checkToken() or jexit( 'Invalid Token' );
		
		if ($this->_model->save()) {
			$this->setRedirect('index.php?option=com_mijosearch', JText::_('COM_MIJOSEARCH_FILE_SAVED'));
		}
		else {
			$this->setRedirect('index.php?option=com_mijosearch', JText::_('COM_MIJOSEARCH_FILE_NOT_SAVED'));
		}
	}
	
	function apply() {
		// Check for request forgeries
		JRequest::checkToken() or jexit( 'Invalid Token' );
		
		if ($this->_model->save()) {
			$this->setRedirect('index.php?option=com_mijosearch&controller=css&task=edit', JText::_('COM_MIJOSEARCH_FILE_SAVED'));
		}
		else {
			$this->setRedirect('index.php?option=com_mijosearch&controller=css&task=edit', JText::_('COM_MIJOSEARCH_FILE_NOT_SAVED'));
		}
	}	
	
	// Cancel saving changes
	function cancel() {
		// Check token
		JRequest::checkToken() or jexit('Invalid Token');
		
		$this->setRedirect('index.php?option=com_mijosearch', JText::_('COM_MIJOSEARCH_FILE_NOT_SAVED'));
	}
}