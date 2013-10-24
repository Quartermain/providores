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

class MijosearchControllerMijosearch extends MijosearchController {

	// Main constructer
    function __construct() {
        parent::__construct('mijosearch');
    }
	
	function saveDownloadID() {
		// Check token
		JRequest::checkToken() or jexit('Invalid Token');
		
		$model = $this->getModel('Mijosearch');
		$msg = $model->saveDownloadID();
        
        $this->setRedirect('index.php?option=com_mijosearch', $msg);
    }
}