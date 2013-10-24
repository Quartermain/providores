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

class MijosearchControllerSearch extends MijosearchController {
	
	function __construct() {
		if (!JFactory::getUser()->authorise('mijosearch.search', 'com_mijosearch')) {
			//return JError::raiseWarning(404, JText::_('JERROR_ALERTNOAUTHOR'));
		}

		parent::__construct('search');
	}
	
	function advancedSearch() {
		$view = $this->getView('Search', 'html');
		$view->setModel($this->_model, true);
		$view->view('advanced');
	}	
}