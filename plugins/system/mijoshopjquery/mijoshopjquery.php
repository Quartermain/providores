<?php
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU GPL, based on AceShop, www.joomace.net
*/

// no direct access
defined('_JEXEC') or die('Restricted access');

jimport('joomla.plugin.plugin');
jimport('joomla.environment.browser');
jimport('joomla.application.module.helper');

class plgSystemMijoshopJquery extends JPlugin {

	public $p_params = null;

	public function __construct(&$subject, $config) {
		parent::__construct($subject, $config);

        $mijoshop = JPATH_ROOT.'/components/com_mijoshop/mijoshop/mijoshop.php';
        $library = JPATH_ROOT.'/components/com_mijoshop/opencart/config.php';
        if (!file_exists($mijoshop) or !file_exists($library)) {
            return;
        }

        require_once($mijoshop);

        $plugin = JPluginHelper::getPlugin('system', 'mijoshopjquery');
        $this->p_params = new JRegistry($plugin->params);
	}

	public function onAfterRoute() {
        if (!$this->_checkUp()) {
            return;
        }

		$app = JFactory::getApplication();
		$document = JFactory::getDocument();

        if(MijoShop::getClass('base')->is30() == true) {
            JHtml::_('behavior.framework');
            JHtml::_('jquery.framework');
        }
        else {
            JHTML::_('behavior.mootools');
        }

		$route = JRequest::getString('route');

		$browser = JBrowser::getInstance()->getBrowser();

		$lib_folder = MijoShop::get('base')->getFullUrl(true).'plugins/system/mijoshopjquery/mijoshopjquery';

        if(MijoShop::getClass('base')->is30() == false) {
            $load_jquery = $this->_loadJquery($app);

            if ($load_jquery == true) {
                $app->set('jquery', true);
                $app->set('jquery_loaded', true);

                if ($this->p_params->get('remove_other_jq', '0') == '0') {
                    $document->addScript($lib_folder.'/jquery-1.7.1.min.js');
                }
                else {
                    $document->addScript("MIJOSHOPJQLIB");
                    $this->_jqpath = $lib_folder.'/jquery-1.7.1.min.js';
                }
            }

            if ($this->p_params->get('load_noconflict', '1') == '1') {
                if ($this->p_params->get('remove_other_jq', '0') == '0') {
                    $document->addScript($lib_folder.'/jquery.noconflict.js');
                }
                else {
                    $document->addScript("MIJOSHOPJQNOCONFLICT");
                    $this->_jqncpath = $lib_folder.'/jquery.noconflict.js';
                }
            }
        }
        else {
            if ($this->_replaceJqueryLib()) {
                JRequest::setVar('hidemainmenu', 1);

                $document->addScript("MIJOSHOPJQLIB");
                $this->_jqpath = $lib_folder.'/jquery-1.7.1.min.js';
            }
        }

        if ($this->p_params->get('load_migrate', '0') == '1') {
             $document->addScript($lib_folder.'/jquery-migrate-1.2.1.js');
        }

		if ($this->p_params->get('load_ui', '1') == '1') {
			$this->_loadUi($document,$lib_folder);
		}

		if ($app->isSite()) {

            if ($this->p_params->get('load_ui', '1') == '2') {
				$this->_loadUi($document,$lib_folder);
			}

			if ($this->p_params->get('load_cookie', '0') == '1') {
				$document->addScript($lib_folder.'/ui/external/jquery.cookie.js');
			}

			if ($this->p_params->get('load_colorbox', '1') == '1') {
				$document->addScript($lib_folder.'/colorbox/jquery.colorbox.js');
				$document->addStyleSheet($lib_folder.'/colorbox/colorbox.css');
			}

			$document->addScript($lib_folder.'/tabs_site.js');
			$document->addScript($lib_folder.'/jquery.total-storage.min.js');

			if ($route == 'product/product' or JRequest::getInt('product_id', 0) > 0 ) {
				$document->addScript($lib_folder.'/ajaxupload.js');
				$document->addScript($lib_folder.'/ui/jquery-ui-timepicker-addon.js');
			}

			if ($this->p_params->get('load_cycle', '1') == '1') {
				$document->addScript($lib_folder.'/jquery.cycle.js');
			}

			if ($this->p_params->get('load_jcarousel', '1') == '1') {
				$document->addScript($lib_folder.'/jquery.jcarousel.min.js');
			}

			if ($this->p_params->get('load_nivo_slider', '1') == '1') {
				$document->addScript($lib_folder.'/nivo-slider/jquery.nivo.slider.pack.js');
			}

		}

        if (MijoShop::get()->isAdmin('mijoshop') || MijoShop::get()->isAdmin('joomla')) {
			
			if ($this->p_params->get('load_ui', '1') == '3') {
				$this->_loadUi($document,$lib_folder);
			}
		
			$document->addScript($lib_folder.'/tabs_admin.js');
			$document->addScript($lib_folder.'/ui/external/jquery.bgiframe-2.1.2.js');
			$document->addScript($lib_folder.'/superfish/js/superfish.js');

			if (empty($route) || $route == 'common/home') {
				if ($browser == 'msie') {
					$document->addScript($lib_folder.'/flot/excanvas.js'); // Only IE
				}

				$document->addScript($lib_folder.'/flot/jquery.flot.js');
			}

			if ($route == 'catalog/product/insert' || $route == 'catalog/product/update' || strpos($route, 'order')) {
				$document->addScript($lib_folder.'/ui/jquery-ui-timepicker-addon.js');
			}
		}

		return;
	}

    public function onAfterRender() {
        if (!$this->_checkUp()) {
            return true;
        }

        if(MijoShop::getClass('base')->is30() == true) {
            $this->_onAfterRender30();
        }
        else{
            $this->_onAfterRender25();
        }

        return true;
    }

    public function _checkUp() {
        $app = JFactory::getApplication();
        $document = JFactory::getDocument();
		$option = JRequest::getCmd('option');

        if ($document->getType() != 'html') {
            return false;
        }

        if ($option == 'com_jce') {
            return false;
        }
		
        if (!file_exists(JPATH_ROOT.'/components/com_mijoshop/mijoshop/mijoshop.php')) {
            return false;
        }
		
        if (!file_exists(JPATH_ROOT.'/components/com_mijoshop/opencart/config.php')) {
            return false;
        }

		if (!is_object($this->p_params)) {
			return false;
		}

        if ($this->p_params->get('only_mijoshop', '1') == '1') {
            
            $module = JModuleHelper::getModule('mijoshop');

            if ($app->isSite()) {
                if ($option != 'com_mijoshop' && (!is_object($module) || $module->id == 0)) {
                    return false;
                }
            }
            else {
                if ($option != 'com_mijoshop') {
                    return false;
                }
            }
        }

        return true;
    }

	public function _replaceJqueryLib() {
		static $state;

		if (isset($state)) {
			return $state;
		}

		$state = false;

		$app = JFactory::getApplication();
		$route = JRequest::getString('route');

		if ($app->isSite()) {
			return $state;
		}

		if ($route == 'module/featured') {
			$state = true;

			return $state;
		}

		$route_parts = explode('/', $route);

		if (isset($route_parts[2]) && (($route_parts[2] == 'insert') || ($route_parts[2] == 'update'))) {
			$state = true;
		}

		return $state;
	}

    public function _loadJquery($app){
        $load_jquery = false;
        switch ($this->p_params->get('load_main', 1)) {
            case 1:
                $load_jquery = true;
                break;
            case 2:
                if ($app->isSite()) {
                    $load_jquery = true;
                }
                break;
            case 3:
                if (MijoShop::get()->isAdmin('mijoshop') || MijoShop::get()->isAdmin('joomla')) {
                    $load_jquery = true;
                }
                break;
        }

        return $load_jquery;
    }

    public function _onAfterRender30() {
        if ($this->_replaceJqueryLib()) {
            $body = JResponse::getBody();

            $body = preg_replace("#([\\\/a-zA-Z0-9_:~\.-]*)jquery([0-9\.-]|min|pack)*?.js#", "", $body); // find jQuery versions
            $body = str_ireplace('<script src="" type="text/javascript"></script>', "", $body); // remove newly empty scripts
            $body = preg_replace("#MIJOSHOPJQLIB#", $this->_jqpath, $body); // use our version of jQuery

            $body = str_replace('<a class="nolink">', '', $body); // use our version of jQuery

            JResponse::setBody($body);
        }

        $body       = JResponse::getBody();
        $matches    = array();
        $_mootools    = array();
        $_core    = array();

        preg_match_all("#([\\\/a-zA-Z0-9_:~\.-]*)/jquery([0-9\.-]|min|pack)*?.js#", $body, $matches);
        $last_jquery = '<script src="'. end($matches[0]) .'" type="text/javascript"></script>';

        preg_match_all("#([\\\/a-zA-Z0-9_:~\.-]*)mootools-core([0-9\.-]|min|pack)*?.js#", $body, $_mootools);
        $mootools = '<script src="'. end($_mootools[0]) .'" type="text/javascript"></script>';


        preg_match_all("#([\\\/a-zA-Z0-9_:~\.-]*)/core.js#", $body, $_core);
        $core = '<script src="'. end($_core[0]) .'" type="text/javascript"></script>';

        if(!empty($matches[0]) and (!empty($_mootools[0]) or !empty($_core[0]))){
            $body = preg_replace("#([\\\/a-zA-Z0-9_:~\.-]*)/jquery([0-9_\.-]|min|pack)*?.js#", "", $body);
            $body = str_ireplace('<script src="" type="text/javascript"></script>', "", $body);

            if(!empty($_mootools[0])){
                $body = str_replace($mootools, $mootools. "\n" .$last_jquery, $body);
            }
            else{
                $body = str_replace($core, $core. "\n" .$last_jquery, $body);
            }
            JResponse::setBody($body);
        }
    }

    public function _onAfterRender25() {
        if ($this->p_params->get('remove_other_jq', '0') == '0') {
            return true;
        }

        $app = JFactory::getApplication();
        $body = JResponse::getBody();
        $load_jquery = $this->_loadJquery($app);

        if ($load_jquery == true) {
            $body = preg_replace("#([\\\/a-zA-Z0-9_:\.-]*)jquery([0-9\.-]|min|pack)*?.js#", "", $body); // find jQuery versions
            $body = str_ireplace('<script src="" type="text/javascript"></script>', "", $body); // remove newly empty scripts
            $body = preg_replace("#MIJOSHOPJQLIB#", $this->_jqpath, $body); // use our version of jQuery
        }

        if ($this->p_params->get('load_noconflict', '1') == '1') {
            $body = preg_replace("#([\\\/a-zA-Z0-9_:\.-]*)jquery[.-]noconflict\.js#", "", $body); // find potential jquery-noconflict.js
            $body = preg_replace("#jQuery\.noConflict\(\);#", "", $body); // remove all jQuery.noConflict();
            $body = preg_replace("#MIJOSHOPJQNOCONFLICT#", $this->_jqncpath, $body);
        }

        JResponse::setBody($body);
    }
	
	public function _loadUi($document,$lib_folder) {
		$document->addScript($lib_folder.'/ui/jquery-ui-1.8.16.custom.min.js');
		if(MijoShop::getClass('base')->is30() == true) {
			$document->addScript($lib_folder.'/ui/jquery-ui-timepicker-addon.js');
		}
		$document->addStyleSheet($lib_folder.'/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css');
	}

}