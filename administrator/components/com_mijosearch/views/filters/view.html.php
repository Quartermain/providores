<?php
/**
* @version		1.7.0
* @package		MijoSearch
* @subpackage	MijoSearch
* @copyright	2009-2011 Mijosoft LLC, www.mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceSearch www.joomace.net
*/

//No Permision
defined( '_JEXEC' ) or die( 'Restricted access' );

class MijosearchViewFilters extends MijosearchView {

	function view($tpl = null){
		// Toolbar
		JToolBarHelper::title(JText::_('COM_MIJOSEARCH_CPANEL_FILTERS' ), 'mijosearch');
        JToolBarHelper::addNew();
        JToolBarHelper::editList();
		$this->toolbar->appendButton('Confirm', JText::_('COM_MIJOSEARCH_COMMON_CONFIRM_DELETE'), 'delete', JText::_('Delete'), 'delete', true, false);
		JToolBarHelper::divider();
		JToolBarHelper::publishList();
		JToolBarHelper::unpublishList();
		JToolBarHelper::divider();
		$this->toolbar->appendButton('Popup', 'cache', JText::_('COM_MIJOSEARCH_COMMON_CLEAN_CACHE'), 'index.php?option=com_mijosearch&amp;controller=purge&amp;task=cache&amp;tmpl=component', 300, 250);
		JToolBarHelper::divider();
		$this->toolbar->appendButton('Popup', 'help1', JText::_('Help'), 'http://www.mijosoft.com/support/docs/mijosearch/user-manual/filters?tmpl=component', 650, 500);

		$this->lists = $this->get('Lists');
		$this->items = $this->get('Items');
		$this->groups = $this->get('Groups');
		$this->pagination = $this->get('Pagination');
		
		parent::display($tpl);
	}
}