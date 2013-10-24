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

class MijosearchViewStatistics extends MijosearchView {
	
	function view($tpl = null){
		JToolBarHelper::title(JText::_('COM_MIJOSEARCH_CPANEL_STATISTICS'), 'mijosearch');
		$this->toolbar->appendButton('Confirm', JText::_('COM_MIJOSEARCH_COMMON_CONFIRM_DELETE'), 'delete', JText::_('Delete'), 'delete', true, false);
		JToolBarHelper::divider();
		$this->toolbar->appendButton('Popup', 'help1', JText::_('Help'), 'http://www.mijosoft.com/support/docs/mijosearch/user-manual/statistics?tmpl=component', 650, 500);
		
		$this->lists =			$this->get('Lists');
		$this->items = 			$this->get('Items');
		$this->pagination =		$this->get('Pagination');
		
		parent::display($tpl);
	}
}