<?php 
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

class ControllerModuleMijoshopminicart extends Controller {
	public function index() {
		if (file_exists(JPATH_ROOT.'/templates/'.MijoShop::getTmpl().'/html/com_mijoshop/module/mijoshopminicart.tpl')) {
            $this->template = '/templates/'.MijoShop::getTmpl().'/html/com_mijoshop/module/mijoshopminicart.tpl';
        }
        else if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/mijoshopminicart.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/mijoshopminicart.tpl';
		} else {
			$this->template = 'default/template/module/mijoshopminicart.tpl';
		}

		return $this->render();
	}
}
?>