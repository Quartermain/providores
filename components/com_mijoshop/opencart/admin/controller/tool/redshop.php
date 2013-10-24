<?php 
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

class ControllerToolRedshop extends Controller {

	private $error = array(); 
    
  	public function index() {
		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),     		
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => 'MijoShop Migration Tools',
			'href'      => '',
      		'separator' => ' :: '
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => 'redSHOP',
			'href'      => $this->url->link('tool/redshop', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		//$this->data['virtuemart_link'] = $this->url->link('tool/redshop', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->template = 'tool/redshop.tpl';
		$this->children = array(
			'common/header'
		);
		
		$this->response->setOutput($this->render());
  	} 
  	
  	public function importCategories(){
		if (!$this->validate()) {
			return $this->forward('error/permission');
		}

		$this->load->model('tool/redshop');
		
		$this->model_tool_redshop->importCategories($this->request->post['redshop']);
	}
  	
  	public function importProducts() {
		if (!$this->validate()) {
			return $this->forward('error/permission');
		}

		$this->load->model('tool/redshop');
		
		$this->model_tool_redshop->importProducts($this->request->post['redshop']);
	}
	
	public function importManufacturers() {
		if (!$this->validate()) {
			return $this->forward('error/permission');
		}

		$this->load->model('tool/redshop');
		
		$this->model_tool_redshop->importManufacturers($this->request->post['redshop']);
	}
	
	public function importUserInformation() {
		if (!$this->validate()) {
			return $this->forward('error/permission');
		}

		$this->load->model('tool/redshop');
		
		$this->model_tool_redshop->importUserInformation($this->request->post['redshop']);
	}
	
	public function copyImages() {
		if (!$this->validate()) {
			return $this->forward('error/permission');
		}

		$this->load->model('tool/redshop');
		
		$this->model_tool_redshop->copyImages($this->request->post['redshop']);
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'tool/redshop')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		}
		else {
			return false;
		}		
	}
}