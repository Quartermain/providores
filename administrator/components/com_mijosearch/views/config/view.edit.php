<?php
/**
* @package		MijoSearch
* @copyright	2009-2013 Mijosoft LLC, www.mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

// No Permission
defined('_JEXEC') or die('Restricted Access');

class MijosearchViewConfig extends MijosearchView {

	function edit($tpl = null) {
        JFactory::getApplication()->input->set('hidemainmenu', false);

		JToolBarHelper::title(JText::_('COM_MIJOSEARCH_CPANEL_CONFIGURATION'), 'mijosearch');
        JToolBarHelper::apply();
        JToolBarHelper::save();
        JToolBarHelper::cancel();
		$this->toolbar->appendButton('Popup', 'cache', JText::_('COM_MIJOSEARCH_COMMON_CLEAN_CACHE'), 'index.php?option=com_mijosearch&amp;controller=purge&amp;task=cache&amp;tmpl=component', 300, 250);
		$this->toolbar->appendButton('Popup', 'help1', JText::_('Help'), 'http://www.mijosoft.com/support/docs/mijosearch/user-manual/configuration?tmpl=component', 650, 500);

		$this->document->addStyleSheet('components/com_mijosearch/assets/css/colorpicker.css');
		$this->document->addScript('components/com_mijosearch/assets/js/colorpicker.js');
		$this->document->addScript('components/com_mijosearch/assets/js/eye.js');
		$this->document->addScript('components/com_mijosearch/assets/js/layout.js?ver=1.0.2');
		
		// Get behaviors
		JHTML::_('behavior.combobox');
		JHTML::_('behavior.tooltip');
		JHTML::_('bootstrap.tooltip');

		$this->lists = $this->get('Lists');
		
		parent::display($tpl);
	}
}