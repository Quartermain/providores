<?php 
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

class ControllerToolJoocart extends Controller {

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
       		'text'      => 'Joocart',
			'href'      => $this->url->link('tool/joocart', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

		$this->template = 'tool/joocart.tpl';
		$this->children = array(
			'common/header'
		);
		
		$this->response->setOutput($this->render());
  	} 
  	
  	public function migrateDatabase(){
		$this->load->model('tool/joocart');
        $post = $this->request->post['opencart'];
        $post['component'] = 'opencart';
		
		$this->model_tool_joocart->migrateDatabase($post);
	}
  	
  	public function migrateFiles() {
		$this->load->model('tool/joocart');
        $post = $this->request->post['joocart'];
        $post['component'] = 'joocart';
		
		$this->model_tool_joocart->migrateFiles($post);
	}
	
	public function fixMenus() {
		$this->load->model('tool/joocart');
        $post = $this->request->post['joocart'];
        $post['component'] = 'joocart';
		
		$this->model_tool_joocart->fixMenus($post);
	}
	
	public function fixModules() {
		$this->load->model('tool/joocart');
        $post = $this->request->post['joocart'];
        $post['component'] = 'joocart';
		
		$this->model_tool_joocart->fixModules($post);
	}
}