<?php
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

// No Permission
defined('_JEXEC') or die ('Restricted access');

class ControllerModuleCategoryhome extends Controller {

	public function index($setting) {
		$this->language->load('module/categoryhome');
		
    	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->load->model('catalog/category');
		
		$this->load->model('tool/image');

		$this->data['categories'] = $this->getCategories($setting['parent_cat_id']);

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/categoryhome.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/categoryhome.tpl';
		} else {
			$this->template = 'default/template/module/categoryhome.tpl';
		}
		
		$this->render();
  	}
	
	protected function getCategories($parent_cat_id) {
		$categories = array();
		
		$results = $this->model_catalog_category->getCategories($parent_cat_id);

        if (empty($results)) {
            return $categories;
        }
		
		$i = 0;
		foreach ($results as $result) {
            $categories[$i]['href'] = $this->url->link('product/category', 'path=' . $result['category_id']);

			if ($result['image']) {
                $image = $result['image'];
            } else {
                $image = 'no_image.jpg';
            }

            $categories[$i]['thumb'] = $this->model_tool_image->resize($image, $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));
            $categories[$i]['name'] = $result['name'];
			
            $i++;
		}
		
		return $categories;
	}		
}
?>