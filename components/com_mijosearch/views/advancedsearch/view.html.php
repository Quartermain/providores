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

class MijosearchViewAdvancedSearch extends MijosoftView {

	function display( $tpl = null){
		$mainframe = JFactory::getApplication();
        $uri = JFactory::getURI();
		$document = JFactory::getDocument();
        $params = $mainframe->getParams();
        
        $cache = MijoSearch::getCache();
		$this->MijosearchConfig = MijoSearch::getConfig();
		
		$document->addStyleSheet(JURI::root().'components/com_mijosearch/assets/css/mijosearch.css');

		if ($this->MijosearchConfig->enable_complete == 1) {
			$document->addScript(JURI::root().'components/com_mijosearch/assets/js/autocompleter.js');
		}
		
        $component = $params->get('component', $uri->getVar('ext'));

        $filter = "";
        $req_filter = JRequest::getInt('filter');
        if (!empty($req_filter)) {
            $filter = '&amp;filter='.$req_filter;

            $extensions = $cache->getFilterExtensions($req_filter);
            if (!empty($extensions) && is_array($extensions) && count($extensions) == 1) {
                $component = $extensions[0]->extension;
            }
        }
        elseif (empty($component)) {
            $extensions = $cache->getExtensions();
            if (!empty($extensions) && is_array($extensions) && count($extensions) == 1) {
                foreach ($extensions as $extension) {
                    $component = $extension->extension;
                    break;
                }
            }
        }
		
		$lists = MijosearchHTML::getExtensionList();

        if ($this->MijosearchConfig->show_order == '1') {
            $lists['order'] = MijosearchHTML::_renderFieldOrder();
        }

        JHtml::_('formbehavior.chosen', 'select[size="1"], select:not([size])');
		
		$this->params       = $params;
		$this->component    = $component;
		$this->filter       = $filter;
		$this->uri          = $uri;
		$this->lists        = $lists;
		$this->results      = $this->get('Data');
		$this->pagination   = $this->get('Pagination');
		
		parent::display($tpl);
	}
}