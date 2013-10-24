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

// View Class
class MijosearchViewExtensions extends MijosearchView{
	
	// Display extensions
	function view($tpl = null){
		// Toolbar
		JToolBarHelper::title(JText::_('COM_MIJOSEARCH_CPANEL_EXTENSIONS'), 'mijosearch');
		$this->toolbar->appendButton('Confirm', JText::_('COM_MIJOSEARCH_EXTENSIONS_VIEW_BTN_REMOVE_WARN'), 'remove', JText::_('Uninstall'), 'uninstall', true, false);
		JToolBarHelper::apply();
		JToolBarHelper::divider();
		$this->toolbar->appendButton('Popup', 'cache', JText::_('COM_MIJOSEARCH_COMMON_CLEAN_CACHE'), 'index.php?option=com_mijosearch&amp;controller=purge&amp;task=cache&amp;tmpl=component', 300, 250);
		JToolBarHelper::divider();
		$this->toolbar->appendButton('Popup', 'help1', JText::_('Help'), 'http://www.mijosoft.com/support/docs/mijosearch/user-manual/extensions?tmpl=component', 650, 500);

		// Get behaviors
		JHTML::_('bootstrap.tooltip');
		JHTML::_('behavior.modal', 'a.modal', array('onClose'=>'\function(){location.reload(true);}'));
		
		$this->lists =		$this->get('Lists');
		$this->info =		$this->get('Info');
		$this->levels =		MijoSearch::get('utility')->getAccessLevels();
		$this->items =		$this->get('Items');
		$this->pagination =	$this->get('Pagination');

		parent::display($tpl);
	}
}