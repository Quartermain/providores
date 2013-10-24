<?php 
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

class ControllerToolAyelshop extends Controller {

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
       		'text'      => 'AyelShop',
			'href'      => $this->url->link('tool/ayelshop', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

		$this->template = 'tool/ayelshop.tpl';
		$this->children = array(
			'common/header'
		);
		
		$this->response->setOutput($this->render());
  	} 
  	
  	public function migrateDatabase(){
		$this->load->model('tool/aceshop');
        $post = $this->request->post['ayelshop'];
        $post['component'] = 'ayelshop';
		
		$this->model_tool_aceshop->migrateDatabase($post);
	}
  	
  	public function migrateFiles() {
		$this->load->model('tool/aceshop');
          $post = $this->request->post['ayelshop'];
          $post['component'] = 'ayelshop';
		
		$this->model_tool_aceshop->migrateFiles($post);
	}
	
	public function fixMenus() {
		$this->load->model('tool/aceshop');
        $post = $this->request->post['ayelshop'];
        $post['component'] = 'ayelshop';
		
		$this->model_tool_aceshop->fixMenus($post);
	}
	
	public function fixModules() {
		$this->load->model('tool/aceshop');
        $post = $this->request->post['ayelshop'];
        $post['component'] = 'ayelshop';
		
		$this->model_tool_aceshop->fixModules($post);
	}
}