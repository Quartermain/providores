<?php
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

class ControllerCommonEditorbutton extends Controller {
	public function index() {
		$this->load->model('catalog/product');


        $results = $this->model_catalog_product->getProducts();

        $name  = JRequest::getString('name');
		
		$this->data['products'] = $results;
		$this->data['name'] = $name;

		$this->template = 'common/editorbutton.tpl';
	
        $this->response->setOutput($this->render());
  	}

    public function getProductOptions() {
		$this->load->model('catalog/product');

        $product_id= JRequest::getInt('product_id');



        $results = $this->model_catalog_product->getProductOptions($product_id);
        $option="";

        foreach($results as $result)
        {
            $value = '"option_oc['. $result['product_option_id']. ']:'. $result['product_option_value'][0]['product_option_value_id'] .'"';
            $name = $result['name'].'.'.$result['product_option_id'];
            $option .= '<option value='.$value.'>'. $name. '</option>';
        }

        $this->response->setOutput($option);
  	}
}
?>