<?php
/**
* @package		MijoSearch
* @copyright	2009-2012 Mijosoft LLC, www.mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceSearch www.joomace.net
*/

//No Permision
defined('_JEXEC') or die('Restricted Access');

// Controller Class
class MijosearchControllerUpgrade extends MijosearchController {

	// Main constructer
	function __construct() {
		parent::__construct('upgrade');
	}
	
	// Upgrade
    function upgrade() {
		// Check token
		JRequest::checkToken() or jexit('Invalid Token');
		
		// Upgrade
		if ($this->_model->upgrade()) {
            $msg = JText::_('COM_MIJOSEARCH_UPGRADE_SUCCESS');
        }
        else {
            $msg = '';
        }
		
		// Return
		$this->setRedirect('index.php?option=com_mijosearch&controller=upgrade&task=view', $msg);
    }
}