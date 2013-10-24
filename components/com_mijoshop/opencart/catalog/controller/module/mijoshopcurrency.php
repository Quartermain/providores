<?php 
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

class ControllerModuleMijoshopcurrency extends Controller {
	protected function index() {
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/mijoshopcurrency.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/mijoshopcurrency.tpl';
		} else {
			$this->template = 'default/template/module/mijoshopcurrency.tpl';
		}

		$this->render();
	}
}
?>