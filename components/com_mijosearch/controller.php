<?php
/**
 * @package		MijoSearch
 * @copyright	2009-2013 Mijosoft LLC, www.mijosoft.com
 * @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
 * @license		2009-2012 GNU/GPL based on AceSearch www.joomace.net
 */

//No Permision
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport('joomla.application.component.controller');

if (!class_exists('MijosoftController')) {
    if (interface_exists('JController')) {
        abstract class MijosoftController extends JControllerLegacy {}
    }
    else {
        class MijosoftController extends JController {}
    }
}

class MijosearchController extends MijosoftController {
	
	function __construct() {
		parent::__construct();
		
		$this->MijosearchConfig = MijoSearch::getConfig();
	}
	
	function display() {
		$view_name = JRequest::getWord('view', '');
		$view_type = JFactory::getDocument()->getType();

        //JFactory::getSession()->clear('mijosearch.post');

        $view = $this->getView($view_name, $view_type);
		$model = $this->getModel('Search');
		
		if (!JError::isError($model)) {
			$view->setModel($model, true);
		}
		
		$params = JFactory::getApplication()->getParams();
		
		$prm_filter = $params->get('filter', '');
		$url_filter = JRequest::getCmd('filter');
		
		if (!empty($prm_filter) && empty($url_filter)) {
			$uri = JFactory::getURI();
			$uri->setVar('filter', $prm_filter);
			$this->setRedirect(JRoute::_('index.php'.$uri->toString(array('query', 'fragment')), false));
		}
		
		$tpl = null;
		
		if ($view_name == 'search' && $this->MijosearchConfig->google == 1) {
			$tpl = 'google';
		}

		$view->display($tpl);

        $type= JRequest::getString('type','');
        if($type == 'ajax'){
            exit();
        }

	}
	
	function search() {		
		$post = array();
		$post['option'] = 'com_mijosearch';
		$post['view'] = 'search';
		
		$filter = JRequest::getInt('filter');
		if (!empty($filter)) {
			$post['filter'] = $filter;
		}
		else {
			$ext = JRequest::getCmd('ext');
			if (!empty($ext)){
				$post['ext'] = $ext;
			}
		}
		
		$post['query'] = MijosearchSearch::getQuery('post');
		$post['limit'] = JRequest::getInt('limit', null, 'post');
		
		if ($post['limit'] === null) {
			unset($post['limit']);
		}

		unset($post['task']);
		unset($post['submit']);
		
		$uri = JFactory::getURI();
		
		$post_data = JRequest::get();
		
		$suggest = $uri->getVar('suggest');
		if (empty($post_data['query']) && !empty($suggest)) {
			$post['query'] = $suggest;
			$post_data['ext'] = '';
			$post_data['query'] = $suggest;
		}

        if (!empty($post_data['order'])) {
			$post['order'] = $post_data['order'];
		}

        if (!empty($post_data['orderdir'])) {
			$post['orderdir'] = $post_data['orderdir'];
		}
		
		$mod_itemid = JRequest::getInt('mod_itemid');
		if (!empty($mod_itemid)) {
			$post['Itemid'] = $mod_itemid;
		}
		else {
			$Itemid = JRequest::getInt('Itemid');
			if (!empty($Itemid)) {
				$post['Itemid'] = $Itemid;
			}
			else {
				$Itemid = MijoSearch::get('utility')->getItemid($filter);
				if (!empty($Itemid)) {
					$post['Itemid'] = str_replace('&Itemid=', '', $Itemid);
				}
			}
		}
		
		$lang = JRequest::getWord('lang');
		if (!empty($lang)) {
			$post['lang'] = $lang;
		}
		
		$uri->setQuery($post);
		
		JFactory::getSession()->set('mijosearch.post', $post_data);
		
		$this->setRedirect(JRoute::_('index.php'.$uri->toString(array('query', 'fragment')), false));
	}
	
	function changeExtension() {
		$extension = JRequest::getCmd('ext', '');
		
		if (!empty($extension)) {
			echo MijoSearch::getExtraFields($extension);
		}
	}
	
	function changeExtensionMod() {
		$extension = JRequest::getCmd('ext', '');
		
		if (!empty($extension)) {
			echo MijoSearch::getExtraFields($extension, true);
		}
	}
	
	function complete() {
		$output	= MijosearchSearch::getComplete();
		
		echo json_encode($output);
		
		JFactory::getApplication()->close();
	}
	
	function ajaxFunction() {
		$extension = JRequest::getCmd('extension');
		$function = JRequest::getWord('function');
		$selected = JRequest::getString('selected');
		
		if (empty($extension) || empty($function)) {
			return;		
		}
		
		$mijosearch_ext = MijoSearch::getExtension($extension);
		
		echo $mijosearch_ext->$function($selected);
	}

    function ajaxSearch() {
        JFactory::getSession()->clear('mijosearch.post');
		
		
        $view_name = 'ajaxsearch';
        $view_type = 'html';

        $view = $this->getView($view_name, $view_type);
        $model = $this->getModel('Search');

        if (!JError::isError($model)) {
            $view->setModel($model, true);
        }

        $tpl = null;
        $view->display($tpl);
        exit();
    }
}