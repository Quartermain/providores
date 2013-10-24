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
	
	protected function index($setting) {
	
		  $this->language->load('module/promenu');
		
    	$this->data['heading_title'] = $this->language->get('heading_title');
		
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}
		
		if (isset($parts[0])) {
			$this->data['category_id'] = $parts[0];
		} else {
			$this->data['category_id'] = 0;
		}
		
    if (isset($parts[1])) {
      $this->data['child_id'] = $parts[1];
    } else {
      $this->data['child_id'] = 0;
    }

    if (isset($parts[2])) {
      $this->data['child2_id'] = $parts[2];
    } else {
      $this->data['child2_id'] = 0;
    }

    if (isset($parts[3])) {
      $this->data['child3_id'] = $parts[3];
    } else {
      $this->data['child3_id'] = 0;
    }     
    
      $this->data['boxback'] = $this->config->get($this->_name . '_boxback');  
      $this->data['boxpad'] = $this->config->get($this->_name . '_boxpad');  
      $this->data['boxbsize'] = $this->config->get($this->_name . '_boxbsize'); 
      $this->data['boxbcolor'] = $this->config->get($this->_name . '_boxbcolor'); 
      $this->data['boxbstyle'] = $this->config->get($this->_name . '_boxbstyle'); 
      $this->data['fontfamily'] = $this->config->get($this->_name . '_fontfamily'); 
      $this->data['fontsize'] = $this->config->get($this->_name . '_fontsize'); 
      $this->data['fontweight'] = $this->config->get($this->_name . '_fontweight'); 
      $this->data['fontcolor'] = $this->config->get($this->_name . '_fontcolor'); 
      $this->data['fonthcolor'] = $this->config->get($this->_name . '_fonthcolor');
      $this->data['fontacolor'] = $this->config->get($this->_name . '_fontacolor');
      $this->data['fontahcolor'] = $this->config->get($this->_name . '_fontahcolor');             
      $this->data['fontlrpad'] = $this->config->get($this->_name . '_fontlrpad');
      $this->data['menuwidth'] = $this->config->get($this->_name . '_menuwidth');
      $this->data['menuheight'] = $this->config->get($this->_name . '_menuheight');
      $this->data['menumargin'] = $this->config->get($this->_name . '_menumargin');
      $this->data['menuback'] = $this->config->get($this->_name . '_menuback');
      $this->data['menuhback'] = $this->config->get($this->_name . '_menuhback');
      $this->data['menuaback'] = $this->config->get($this->_name . '_menuaback');
      $this->data['menuahback'] = $this->config->get($this->_name . '_menuahback');            
      $this->data['menubsize'] = $this->config->get($this->_name . '_menubsize');
      $this->data['menubcolor'] = $this->config->get($this->_name . '_menubcolor');
      $this->data['menubstyle'] = $this->config->get($this->_name . '_menubstyle');
      $this->data['menusubsize'] = $this->config->get($this->_name . '_menusubsize');
      $this->data['menusubcolor'] = $this->config->get($this->_name . '_menusubcolor');
      $this->data['menusubstyle'] = $this->config->get($this->_name . '_menusubstyle');
             
      $this->load->model('catalog/category');
      $this->load->model('catalog/product');
      
      $this->data['categories'] = array();
               
      $categories = $this->model_catalog_category->getCategories(0);
      
		  foreach ($categories as $category) {
		  
    if ($setting['count']) {
			$total = $this->model_catalog_product->getTotalProducts(array('filter_category_id' => $category['category_id']));
    } else {
      $total = 0;
    } 
       
			$children_data = array();

			$children = $this->model_catalog_category->getCategories($category['category_id']);

			foreach ($children as $child) {
				$data = array(
					'filter_category_id'  => $child['category_id'],
					'filter_sub_category' => true
				);

    if ($setting['count']) {
				$product_total = $this->model_catalog_product->getTotalProducts($data);
    } else {
        $product_total = 0;
    }
    
				$total += $product_total;

        $children2_data = array();
 
        $children2 = $this->model_catalog_category->getCategories($child['category_id']);

      foreach ($children2 as $child2) {

        $data2 = array(
          'filter_category_id'  => $child2['category_id'],
          'filter_sub_category' => true
        );
        
    if ($setting['count']) {
        $product_total2 = $this->model_catalog_product->getTotalProducts($data2);
    } else {
        $product_total2 = 0;
    }
    
        $total += $product_total2;

        $children3_data = array();

        $children3 = $this->model_catalog_category->getCategories($child2['category_id']);

      foreach ($children3 as $child3) {

        $data3 = array(
          'filter_category_id'  => $child3['category_id'],
          'filter_sub_category' => true
        );
        
    if ($setting['count']) {
        $product_total3 = $this->model_catalog_product->getTotalProducts($data3);
    } else {
        $product_total3 = 0;
    }
    
        $total += $product_total3;

    if ($setting['count']) {
        $children3_data[] = array(
          'category_id' => $child3['category_id'],
          'name'        => $child3['name'] . ' (' . $product_total3 . ')',
          'href'        => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'] . '_' . $child2['category_id'] . '_' . $child3['category_id'])
        );
    } else {
        $children3_data[] = array(
          'category_id' => $child3['category_id'],
          'name'        => $child3['name'],
          'href'        => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'] . '_' . $child2['category_id'] . '_' . $child3['category_id'])
        );    
    }
    }

    if ($setting['count']) {
        $children2_data[] = array(
          'category_id' => $child2['category_id'],
          'child3_id'   => $children3_data,                    
          'name'        => $child2['name'] . ' (' . $product_total2 . ')',
          'href'        => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'] . '_' . $child2['category_id'])
        );
    } else {
        $children2_data[] = array(
          'category_id' => $child2['category_id'],
          'child3_id'   => $children3_data,                    
          'name'        => $child2['name'],
          'href'        => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'] . '_' . $child2['category_id'])
        );                        
    }
    }

    if ($setting['count']) {
				$children_data[] = array(
					'category_id' => $child['category_id'],
					'child2_id'   => $children2_data,
					'name'        => $child['name'] . ' (' . $product_total . ')',
					'href'        => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])	
				);		
    } else {
				$children_data[] = array(
					'category_id' => $child['category_id'],
					'child2_id'   => $children2_data,
					'name'        => $child['name'],
					'href'        => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])	
				);
    }    
		}

    if ($setting['count']) {
			$this->data['categories'][] = array(
				'category_id' => $category['category_id'],
				'name'        => $category['name'] . ' (' . $total . ')',
				'children'    => $children_data,
				'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
			);
    } else {
			$this->data['categories'][] = array(
				'category_id' => $category['category_id'],
				'name'        => $category['name'],
				'children'    => $children_data,
				'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
			);
    }      
		}
          
		if ($setting['position'] == 'column_left') {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/promenu.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/module/promenu.tpl';
			} else {
				$this->template = 'default/template/module/promenu.tpl';
			}
		} else {
		if ($setting['position'] == 'column_right') {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/promenuright.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/module/promenuright.tpl';
			} else {
				$this->template = 'default/template/module/promenuright.tpl';
			}
		} else {
		  if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/promenu.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/module/promenu.tpl';
		  } else {
				$this->template = 'default/template/module/promenu.tpl';
			}
		 }
		}

			$this->render();
  	}
}
?>