<?php
// ----------------------------------
// Pro Category Menu for OpenCart 
// By Best-Byte
// www.best-byte.com
// ----------------------------------
?>
<?php
class ControllerModulePromenu extends Controller {
  private $_name = 'promenu';
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/promenu');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('promenu', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		$this->data['text_boxcontent'] = $this->language->get('text_boxcontent');
		$this->data['text_font'] = $this->language->get('text_font');
		$this->data['text_menu'] = $this->language->get('text_menu');
		
		$this->data['entry_boxback'] = $this->language->get('entry_boxback');
		$this->data['entry_boxpad'] = $this->language->get('entry_boxpad');
		$this->data['entry_boxbsize'] = $this->language->get('entry_boxbsize');
		$this->data['entry_boxbcolor'] = $this->language->get('entry_boxbcolor');
		$this->data['entry_boxbstyle'] = $this->language->get('entry_boxbstyle');
		$this->data['entry_fontfamily'] = $this->language->get('entry_fontfamily');
		$this->data['entry_fontsize'] = $this->language->get('entry_fontsize');
		$this->data['entry_fontweight'] = $this->language->get('entry_fontweight');
		$this->data['entry_fontcolor'] = $this->language->get('entry_fontcolor');
		$this->data['entry_fonthcolor'] = $this->language->get('entry_fonthcolor');
		$this->data['entry_fontacolor'] = $this->language->get('entry_fontacolor');
		$this->data['entry_fontahcolor'] = $this->language->get('entry_fontahcolor');		
		$this->data['entry_fontlrpad'] = $this->language->get('entry_fontlrpad');
		$this->data['entry_menuwidth'] = $this->language->get('entry_menuwidth');
		$this->data['entry_menuheight'] = $this->language->get('entry_menuheight');
		$this->data['entry_menumargin'] = $this->language->get('entry_menumargin');
		$this->data['entry_menuback'] = $this->language->get('entry_menuback');
		$this->data['entry_menuhback'] = $this->language->get('entry_menuhback');
		$this->data['entry_menuaback'] = $this->language->get('entry_menuaback');
		$this->data['entry_menuahback'] = $this->language->get('entry_menuahback');		
		$this->data['entry_menubsize'] = $this->language->get('entry_menubsize');
		$this->data['entry_menubcolor'] = $this->language->get('entry_menubcolor');
		$this->data['entry_menubstyle'] = $this->language->get('entry_menubstyle');
		$this->data['entry_menusubsize'] = $this->language->get('entry_menusubsize');
		$this->data['entry_menusubcolor'] = $this->language->get('entry_menusubcolor');
		$this->data['entry_menusubstyle'] = $this->language->get('entry_menusubstyle');
		$this->data['entry_moduleinfo'] = $this->language->get('entry_moduleinfo');		
		
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_count'] = $this->language->get('entry_count');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/promenu', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/promenu', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->post[$this->_name . '_boxback'])) { 
			$this->data[$this->_name . '_boxback'] = $this->request->post[$this->_name . '_boxback']; 
		} else { 
			$this->data[$this->_name . '_boxback'] = $this->config->get($this->_name . '_boxback' ); 
		}	
    
		if (isset($this->request->post[$this->_name . '_boxpad'])) { 
			$this->data[$this->_name . '_boxpad'] = $this->request->post[$this->_name . '_boxpad']; 
		} else { 
			$this->data[$this->_name . '_boxpad'] = $this->config->get($this->_name . '_boxpad' ); 
		}	
    
		if (isset($this->request->post[$this->_name . '_boxbsize'])) { 
			$this->data[$this->_name . '_boxbsize'] = $this->request->post[$this->_name . '_boxbsize']; 
		} else { 
			$this->data[$this->_name . '_boxbsize'] = $this->config->get($this->_name . '_boxbsize' ); 
		}	
    
		if (isset($this->request->post[$this->_name . '_boxbcolor'])) { 
			$this->data[$this->_name . '_boxbcolor'] = $this->request->post[$this->_name . '_boxbcolor']; 
		} else { 
			$this->data[$this->_name . '_boxbcolor'] = $this->config->get($this->_name . '_boxbcolor' ); 
		}	 
    
		if (isset($this->request->post[$this->_name . '_boxbstyle'])) { 
			$this->data[$this->_name . '_boxbstyle'] = $this->request->post[$this->_name . '_boxbstyle']; 
		} else { 
			$this->data[$this->_name . '_boxbstyle'] = $this->config->get($this->_name . '_boxbstyle' ); 
		}	              
    
		if (isset($this->request->post[$this->_name . '_fontfamily'])) { 
			$this->data[$this->_name . '_fontfamily'] = $this->request->post[$this->_name . '_fontfamily']; 
		} else { 
			$this->data[$this->_name . '_fontfamily'] = $this->config->get($this->_name . '_fontfamily' ); 
		}	    
    
		if (isset($this->request->post[$this->_name . '_fontsize'])) { 
			$this->data[$this->_name . '_fontsize'] = $this->request->post[$this->_name . '_fontsize']; 
		} else { 
			$this->data[$this->_name . '_fontsize'] = $this->config->get($this->_name . '_fontsize' ); 
		}	
    
		if (isset($this->request->post[$this->_name . '_fontweight'])) { 
			$this->data[$this->_name . '_fontweight'] = $this->request->post[$this->_name . '_fontweight']; 
		} else { 
			$this->data[$this->_name . '_fontweight'] = $this->config->get($this->_name . '_fontweight' ); 
		}	  
    
		if (isset($this->request->post[$this->_name . '_fontcolor'])) { 
			$this->data[$this->_name . '_fontcolor'] = $this->request->post[$this->_name . '_fontcolor']; 
		} else { 
			$this->data[$this->_name . '_fontcolor'] = $this->config->get($this->_name . '_fontcolor' ); 
		}	  
    
		if (isset($this->request->post[$this->_name . '_fonthcolor'])) { 
			$this->data[$this->_name . '_fonthcolor'] = $this->request->post[$this->_name . '_fonthcolor']; 
		} else { 
			$this->data[$this->_name . '_fonthcolor'] = $this->config->get($this->_name . '_fonthcolor' ); 
		}	
    
		if (isset($this->request->post[$this->_name . '_fontacolor'])) { 
			$this->data[$this->_name . '_fontacolor'] = $this->request->post[$this->_name . '_fontacolor']; 
		} else { 
			$this->data[$this->_name . '_fontacolor'] = $this->config->get($this->_name . '_fontacolor' ); 
		} 
    
		if (isset($this->request->post[$this->_name . '_fontahcolor'])) { 
			$this->data[$this->_name . '_fontahcolor'] = $this->request->post[$this->_name . '_fontahcolor']; 
		} else { 
			$this->data[$this->_name . '_fontahcolor'] = $this->config->get($this->_name . '_fontahcolor' ); 
		}              
    
		if (isset($this->request->post[$this->_name . '_fontlrpad'])) { 
			$this->data[$this->_name . '_fontlrpad'] = $this->request->post[$this->_name . '_fontlrpad']; 
		} else { 
			$this->data[$this->_name . '_fontlrpad'] = $this->config->get($this->_name . '_fontlrpad' ); 
		}	  
    
		if (isset($this->request->post[$this->_name . '_menuwidth'])) { 
			$this->data[$this->_name . '_menuwidth'] = $this->request->post[$this->_name . '_menuwidth']; 
		} else { 
			$this->data[$this->_name . '_menuwidth'] = $this->config->get($this->_name . '_menuwidth' ); 
		}	                              	
		
		if (isset($this->request->post[$this->_name . '_menuheight'])) { 
			$this->data[$this->_name . '_menuheight'] = $this->request->post[$this->_name . '_menuheight']; 
		} else { 
			$this->data[$this->_name . '_menuheight'] = $this->config->get($this->_name . '_menuheight' ); 
		}	 
    
		if (isset($this->request->post[$this->_name . '_menumargin'])) { 
			$this->data[$this->_name . '_menumargin'] = $this->request->post[$this->_name . '_menumargin']; 
		} else { 
			$this->data[$this->_name . '_menumargin'] = $this->config->get($this->_name . '_menumargin' ); 
		}	
    
		if (isset($this->request->post[$this->_name . '_menuback'])) { 
			$this->data[$this->_name . '_menuback'] = $this->request->post[$this->_name . '_menuback']; 
		} else { 
			$this->data[$this->_name . '_menuback'] = $this->config->get($this->_name . '_menuback' ); 
		}	
    
		if (isset($this->request->post[$this->_name . '_menuhback'])) { 
			$this->data[$this->_name . '_menuhback'] = $this->request->post[$this->_name . '_menuhback']; 
		} else { 
			$this->data[$this->_name . '_menuhback'] = $this->config->get($this->_name . '_menuhback' ); 
		}	
    
		if (isset($this->request->post[$this->_name . '_menuaback'])) { 
			$this->data[$this->_name . '_menuaback'] = $this->request->post[$this->_name . '_menuaback']; 
		} else { 
			$this->data[$this->_name . '_menuaback'] = $this->config->get($this->_name . '_menuaback' ); 
		}
    
		if (isset($this->request->post[$this->_name . '_menuahback'])) { 
			$this->data[$this->_name . '_menuahback'] = $this->request->post[$this->_name . '_menuahback']; 
		} else { 
			$this->data[$this->_name . '_menuahback'] = $this->config->get($this->_name . '_menuahback' ); 
		}          
    
		if (isset($this->request->post[$this->_name . '_menubsize'])) { 
			$this->data[$this->_name . '_menubsize'] = $this->request->post[$this->_name . '_menubsize']; 
		} else { 
			$this->data[$this->_name . '_menubsize'] = $this->config->get($this->_name . '_menubsize' ); 
		}	
    
		if (isset($this->request->post[$this->_name . '_menubcolor'])) { 
			$this->data[$this->_name . '_menubcolor'] = $this->request->post[$this->_name . '_menubcolor']; 
		} else { 
			$this->data[$this->_name . '_menubcolor'] = $this->config->get($this->_name . '_menubcolor' ); 
		}	        
    
		if (isset($this->request->post[$this->_name . '_menubstyle'])) { 
			$this->data[$this->_name . '_menubstyle'] = $this->request->post[$this->_name . '_menubstyle']; 
		} else { 
			$this->data[$this->_name . '_menubstyle'] = $this->config->get($this->_name . '_menubstyle' ); 
		}	 
    
		if (isset($this->request->post[$this->_name . '_menusubsize'])) { 
			$this->data[$this->_name . '_menusubsize'] = $this->request->post[$this->_name . '_menusubsize']; 
		} else { 
			$this->data[$this->_name . '_menusubsize'] = $this->config->get($this->_name . '_menusubsize' ); 
		}	
    
		if (isset($this->request->post[$this->_name . '_menusubcolor'])) { 
			$this->data[$this->_name . '_menusubcolor'] = $this->request->post[$this->_name . '_menusubcolor']; 
		} else { 
			$this->data[$this->_name . '_menusubcolor'] = $this->config->get($this->_name . '_menusubcolor' ); 
		}	        
    
		if (isset($this->request->post[$this->_name . '_menusubstyle'])) { 
			$this->data[$this->_name . '_menusubstyle'] = $this->request->post[$this->_name . '_menusubstyle']; 
		} else { 
			$this->data[$this->_name . '_menusubstyle'] = $this->config->get($this->_name . '_menusubstyle' ); 
		}	                          		
		
		$this->data['modules'] = array();
		
		if (isset($this->request->post['promenu_module'])) {
			$this->data['modules'] = $this->request->post['promenu_module'];
		} elseif ($this->config->get('promenu_module')) { 
			$this->data['modules'] = $this->config->get('promenu_module');
		}	
				
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/promenu.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/promenu')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>