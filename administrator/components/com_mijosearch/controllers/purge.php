<?php
/**
* @version		1.5.0
* @package		MijoSearch
* @subpackage	MijoSearch
* @copyright	2009-2011 Mijosoft LLC, www.mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceSearch www.joomace.net
*/

// No permission
defined('_JEXEC') or die('Restricted Access');

// Controller Class
class MijosearchControllerPurge extends MijosearchController {
	
	// Main constructer
	function __construct() {
        parent::__construct('purge');
    }
	
	// Cache
	function cache() {
		$view = $this->getView('Purge', 'cache');
		$view->setModel($this->_model, true);
		$view->view('cache');
	}
	
	function cleanCache() {
		// Check token
		JRequest::checkToken() or jexit('Invalid Token');
		
		if (!$this->_model->cleanCache()) {
			return JError::raiseWarning(500, JText::_('COM_MIJOSEARCH_CACHE_CLEANED_NOT'));
		} else {
			JFactory::getApplication()->enqueueMessage(JText::_('COM_MIJOSEARCH_CACHE_CLEANED'));
		}
	}
}