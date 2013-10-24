<?php
/**
 * @package		MijoSearch
 * @copyright	2009-2013 Mijosoft LLC, www.mijosoft.com
 * @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
 * @license		2009-2012 GNU/GPL based on AceSearch www.joomace.net
 */

//No Permision
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport('joomla.application.component.view');

if (!class_exists('MijosoftView')) {
    if (interface_exists('JView')) {
        abstract class MijosoftView extends JViewLegacy {}
    }
    else {
        class MijosoftView extends JView {}
    }
}

class MijosearchViewAjaxsearch extends MijosoftView {

	function display($tpl = null) {
		$mainframe = JFactory::getApplication();
		$params = $mainframe->getParams();
		$this->MijosearchConfig = MijoSearch::getConfig();

		$this->suffix = $this->hiddenfilt ="";

		$this->Itemid = '';
		$i_id = JRequest::getInt('Itemid', 0, 'get');
		if (!empty($i_id)) {
			$this->Itemid = '&Itemid='.$i_id;
		}


        $this->query = MijosearchSearch::getSearchQuery();

        $this->params       = $params;
        $this->results      = $this->get('Data');
        $this->total        = $this->get('Total');
        $this->pagination   = $this->get('Pagination');
		
		return parent::display($tpl);
        exit();
	}
}