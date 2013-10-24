<?php
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

// No Permission
defined('_JEXEC') or die('Restricted access');
  
class ControllerModuleLogin extends Controller {
	public function index() {
		$this->language->load('module/login');

		if ($this->customer->isLogged()) {
			$this->data['text_greeting'] = sprintf($this->language->get('text_logged'), $this->customer->getFirstName());
		}

		$this->data['logged'] = $this->customer->isLogged();

      	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['entry_email_address'] = $this->language->get('entry_email_address');
		$this->data['entry_password'] = $this->language->get('entry_password');
		
		$this->data['button_login'] = $this->language->get('button_login');
		$this->data['button_logout'] = $this->language->get('button_logout');
		$this->data['button_create'] = $this->language->get('button_create');
		$this->data['text_my_account'] = $this->language->get('text_my_account');
		$this->data['text_my_orders'] = $this->language->get('text_my_orders');
		$this->data['text_my_newsletter'] = $this->language->get('text_my_newsletter');
    	$this->data['text_information'] = $this->language->get('text_information');
    	$this->data['text_password'] = $this->language->get('text_password');
    	$this->data['text_address'] = $this->language->get('text_address');
    	$this->data['text_history'] = $this->language->get('text_history');
    	$this->data['text_download'] = $this->language->get('text_download');
		$this->data['text_newsletter'] = $this->language->get('text_newsletter');
		$this->data['text_create'] = $this->language->get('text_create');
		$this->data['text_forgotten'] = $this->language->get('text_forgotten');
		$this->data['text_welcome'] = $this->language->get('text_welcome');

		
		$this->data['action'] = $this->url->link('account/login');
 		
        if (file_exists(JPATH_ROOT.'/templates/'.MijoShop::getTmpl().'/html/com_mijoshop/module/login.tpl')) {
            $this->template = '/templates/'.MijoShop::getTmpl().'/html/com_mijoshop/module/login.tpl';
        }
        else if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/login.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/module/login.tpl';
        } else {
            $this->template = 'default/template/module/login.tpl';
        }
		
		return $this->render();
	}
}
?>