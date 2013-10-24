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

class MijosearchViewFilters extends MijosearchView{
	
	function edit($tpl = null) {		
		JToolBarHelper::title(JText::_('COM_MIJOSEARCH_CPANEL_FILTERS'),'mijosearch');
        JToolBarHelper::apply('editApply');
        JToolBarHelper::save('editSave');
        JToolBarHelper::save2new('editApply');
        JToolBarHelper::cancel('editCancel');
		JToolBarHelper::divider();
		$this->toolbar->appendButton('Popup', 'help1', JText::_('Help'), 'http://www.mijosoft.com/support/docs/mijosearch/user-manual/filters?tmpl=component', 650, 500);

        JHTML::_('bootstrap.tooltip');
		
		$model = $this->getModel();
		$item = $model->getEditData('MijosearchFilters');
		
		if (JRequest::getVar('task') == 'edit') {
			$filter_extension = $item->extension;
		}
		else {
            $item->id = 0;
            $item->published = 1;
			$filter_extension = '';
		}
		
		$lists = $model->getExtensionList($filter_extension);

		$lists['groups'] = $model->getGroupList($item->group_id);

        $lists['published'] = MijoSearch::get('utility')->getRadioList('published', $item->published);

        $params = new JRegistry($item->params);
		
		// Get search values              
		$this->item = $item;
		$this->params = $params;
		$this->lists = $lists;
		$this->ext = $filter_extension;
		
		parent::display($tpl);
	}
}