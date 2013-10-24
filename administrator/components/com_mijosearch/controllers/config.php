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
defined('_JEXEC') or die('Restricted Access');

// Controller Class
class MijosearchControllerConfig extends MijosearchController {
	
	// Main constructer
 	function __construct() {
		if (!JFactory::getUser()->authorise('core.admin', 'com_mijosearch')) {
			return JError::raiseWarning(404, JText::_('JERROR_ALERTNOAUTHOR'));
		}

		parent::__construct('config');
	}
	
	// Save changes
	function save() {
		// Check token
		JRequest::checkToken() or jexit('Invalid Token');
		
		$this->_model->save();
		
		$this->setRedirect('index.php?option=com_mijosearch', JText::_('COM_MIJOSEARCH_CONFIG_SAVED'));
	}
	
	// Apply changes
	function apply() {
		// Check token
		JRequest::checkToken() or jexit('Invalid Token');
		
		$this->_model->save();
		
		$this->setRedirect('index.php?option=com_mijosearch&controller=config&task=edit', JText::_('COM_MIJOSEARCH_CONFIG_SAVED'));
	}
	
	// Cancel saving changes
	function cancel() {
		// Check token
		JRequest::checkToken() or jexit('Invalid Token');
		
		$this->setRedirect('index.php?option=com_mijosearch', JText::_('COM_MIJOSEARCH_CONFIG_NOT_SAVED'));
	
	}
}