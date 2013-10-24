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

jimport('joomla.application.component.view');

class MijosearchViewFilters extends MijosearchView {
	
	function edit($tpl = null) {
        // Get Group
		$model = $this->getModel();
		$item = $model->getEditData('MijosearchGroups');

		JToolBarHelper::title(JText::_('COM_MIJOSEARCH_CPANEL_FILTERS_GROUPS'),'mijosearch');
        JToolBarHelper::apply('editApply');
        JToolBarHelper::save('editSave');
        JToolBarHelper::cancel('editCancel');
		JToolBarHelper::divider();
		$this->toolbar->appendButton('Popup', 'help1', JText::_('Help'), 'http://www.mijosoft.com/support/docs/mijosearch/user-manual/filters?tmpl=component', 650, 500);

		$this->item = $item;

		parent::display($tpl);
	}
}