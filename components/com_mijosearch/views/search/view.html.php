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

class MijosearchViewSearch extends MijosoftView {

	function display($tpl = null) {
		$mainframe = JFactory::getApplication();
		$params = $mainframe->getParams();
		$document = JFactory::getDocument();
		$this->MijosearchConfig = MijoSearch::getConfig();
		$this->extensions = MijoSearch::get('cache')->getExtensions();
		
		$this->suffix = $this->hiddenfilt ="";
		
		$flt = JRequest::getInt('filter');
		if(!empty($flt)) {
			$this->suffix = '&filter='.$flt;
			$this->hiddenfilt = '<input type="hidden" name="filter" value="'.$flt.'"/>';
		}
		
		$this->Itemid = '';
		$i_id = JRequest::getInt('Itemid', 0, 'get');
		if (!empty($i_id)) {
			$this->Itemid = '&Itemid='.$i_id;
		}
		
		$this->query = MijosearchSearch::getSearchQuery();
		
		$document->addStyleSheet(JURI::root().'components/com_mijosearch/assets/css/mijosearch.css');
		
		if ($this->MijosearchConfig->google == '1') {
			$document->addStyleSheet(JURI::root().'components/com_mijosearch/assets/css/mijosearch_google.css');
		}
		elseif ($this->MijosearchConfig->yahoo_sections  == '1') {
			$document->addStyleSheet(JURI::root().'components/com_mijosearch/assets/css/mijosearch_style1.css');
		}
		
		// Get autocomplete
		if ($this->MijosearchConfig->enable_complete == '1') {
			$document->addScript(JURI::root().'components/com_mijosearch/assets/js/autocompleter.js');
		}
		
		$lists = MijosearchHTML::getExtensionList();

        if ($this->MijosearchConfig->show_order == '1') {
            $css = 'class="mijosearch_selectbox"';

            if ($this->MijosearchConfig->google == '1') {
                $css = 'class="mijosearch_selectbox_module"';
            }

            $lists['order'] = MijosearchHTML::_renderFieldOrder('', $css, ' onchange="document.mijosearchForm.submit();"');
			$lists['orderdir'] = MijosearchHTML::_renderFieldOrderDir('', $css, ' onchange="document.mijosearchForm.submit();"');
        }

        JHtml::_('formbehavior.chosen', 'select[size="1"], select:not([size])');

        $this->params       = $params;
        $this->lists        = $lists;
        $this->results      = $this->get('Data');
        $this->total        = $this->get('Total');
        $this->refines      = $this->get('Refines');
        $this->pagination   = $this->get('Pagination');
		
		parent::display($tpl);
	}

    function renderModules($position = 'mijosearch_top') {
		$modules = JModuleHelper::getModules($position);

        if (count($modules) > 0) {
            $renderer = JFactory::getDocument()->loadRenderer('module');
            $attribs = array('style' => 'xhtml');

            ?><div><?php

            foreach ($modules as $mod) {
                echo $renderer->render($mod, $attribs);
            }

            ?></div><?php
        }
    }
}