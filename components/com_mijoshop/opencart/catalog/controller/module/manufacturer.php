<?php
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

class ControllerModuleManufacturer extends Controller {
    protected function index() {
        $this->language->load('module/manufacturer');

        $this->data['heading_title'] = $this->language->get('heading_title');
        $this->data['text_select'] = $this->language->get('text_select');

        if (isset($this->request->get['manufacturer_id'])) {
            $this->data['manufacturer_id'] = $this->request->get['manufacturer_id'];
        } else {
            $this->data['manufacturer_id'] = 0;
        }

        $this->load->model('catalog/manufacturer');
				
        $this->data['manufacturers'] = array();

        $results = $this->model_catalog_manufacturer->getManufacturers();

        foreach ($results as $result) {
						
			$this->data['manufacturers'][] = array(
                'manufacturer_id' => $result['manufacturer_id'],
                'name'       	  => $result['name'],
				'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $result['manufacturer_id'])
            );
        }

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/manufacturer.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/module/manufacturer.tpl';
        } else {
            $this->template = 'default/template/module/manufacturer.tpl';
        }

        $this->render();
    }
}
?>