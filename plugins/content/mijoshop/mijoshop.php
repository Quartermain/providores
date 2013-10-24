<?php 
/**
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

// No Permision
defined('_JEXEC') or die ('Restricted access');

jimport('joomla.plugin.plugin');
jimport('joomla.plugin.helper');

class plgContentMijoshop extends JPlugin {

    public $p_params = null;

	public function onContentPrepare($context, &$row, &$params, $limitstart) {
		return $this->onPrepareContent($row, $params, $limitstart);
	}
	
	public function onPrepareContent(&$row, &$params, $limitstart) {
		if (JFactory::getApplication()->isAdmin()) {
			return true;
		}
		
		$file = JPATH_SITE.'/components/com_mijoshop/mijoshop/mijoshop.php';
		if (!file_exists($file)) {
			return true;
		}
		
		require_once($file);
	
		$plugin = JPluginHelper::getPlugin('content', 'mijoshop');

        $this->p_params = new JRegistry($plugin->params);

		$regex = '/{mijoshop\s*.*?}/i';
		
		// find all instances of plugin and put in $matches
		preg_match_all($regex, $row->text, $matches);

		// Number of plugins
		$count = count($matches[0]);

		// plugin only processes if there are any instances of the plugin in the text
		if ($count) {
			self::_processMatches($row, $matches, $count, $regex);
		}
		
		return true;
	}
	
	public function _processMatches(&$row, &$matches, $count, $regex) {
        $row->text = '<div id="p_notification"></div>'.$row->text;

        $image = $this->p_params->get('show_image', 1);
        $name = $this->p_params->get('show_name', 1);
        $price = $this->p_params->get('show_price', 1);
        $rating = $this->p_params->get('show_rating', 1);
        $button = $this->p_params->get('show_button', 1);
        $options = '';

		for ($i = 0; $i < $count; $i++) {
			$attribs = str_replace('mijoshop', '', $matches[0][$i]);
            $attribs = str_replace('{', '', $attribs);
            $attribs = str_replace('}', '', $attribs);
            $attribs = explode(',', trim($attribs));

            foreach ($attribs as $attrib) {
                $array = explode('=', $attrib);

                ${$array[0]} = $array[1];
            }

            if (empty($id)) {
                continue;
            }

			$product = MijoShop::get('db')->getRecord($id);
            if (empty($product)) {
                continue;
            }

			$content = self::_renderProduct($product, $image, $name, $price, $rating, $button, $options);
			
			$row->text = str_replace($matches[0][$i], $content, $row->text);
		}

		// removes tags without matching module positions
		$row->text = preg_replace($regex, '', $row->text);
	}
	
	public function _renderProduct($row, $show_image, $show_name, $show_price, $show_rating, $show_button, $options) {
        $oc_config = MijoShop::get('opencart')->get('config');
        $oc_registry = MijoShop::get('opencart')->get('registry');
        $oc_customer = MijoShop::get('opencart')->get('customer');
        $oc_tax = MijoShop::get('opencart')->get('tax');
        $oc_currency = MijoShop::get('opencart')->get('currency');
        $oc_language = MijoShop::get('opencart')->get('language');
        $oc_vqmod = MijoShop::get('opencart')->get('vqmod');

        MijoShop::get('base')->addHeader(JPATH_MIJOSHOP_SITE.'/assets/js/product.js', false);
        MijoShop::get('base')->addHeader(JPATH_MIJOSHOP_OC.'/catalog/view/theme/'.$oc_config->get('config_template').'/stylesheet/stylesheet.css');

        if (strpos($show_image, ':')) {
            $img_array = explode(':', $show_image);

            $show_image = $img_array[0];
            $image_width = $img_array[1];
            $image_height = $img_array[2];
        }

        if ($show_image && $row['image']) {
            require_once($oc_vqmod->modCheck(JPATH_MIJOSHOP_OC.'/catalog/model/tool/image.php'));
            $oc_img_tool = new ModelToolImage($oc_registry);

            $image_width = isset($image_width) ? $image_width : $this->p_params->get('image_width', 80);
            $image_height = isset($image_height) ? $image_height : $this->p_params->get('image_height', 80);

            $image = $oc_img_tool->resize($row['image'], $image_width, $image_height);
        }
        else {
            $image = false;
        }

        if ($show_name) {
            $name = $row['name'];
        }
        else {
            $name = false;
        }

        if ($show_price && (($oc_config->get('config_customer_price') && $oc_customer->isLogged()) || !$oc_config->get('config_customer_price'))) {
            $price = $oc_currency->format($oc_tax->calculate($row['price'], $row['tax_class_id'], $oc_config->get('config_tax')));
        }
        else {
            $price = false;
        }

        if ($show_price && (float)$row['special']) {
            $special = $oc_currency->format($oc_tax->calculate($row['special'], $row['tax_class_id'], $oc_config->get('config_tax')));
        }
        else {
            $special = false;
        }

        if ($show_rating && $oc_config->get('config_review_status')) {
            $rating = $row['rating'];
        }
        else {
            $rating = false;
        }

        if ($show_button) {
            $button = true;
            $button_cart = $oc_language->get('button_cart');
        }
        else {
            $button = false;
        }

        $oc_language->load('module/product');

        $product = array(
            'product_id' => $row['product_id'],
            'thumb'   	 => $image,
            'name'    	 => $name,
            'price'   	 => $price,
            'special' 	 => $special,
            'rating'     => $rating,
            'reviews'    => sprintf($oc_language->get('text_reviews'), (int)$row['reviews']),
            'button'     => $button,
            'options'    => $options,
            'href'    	 => MijoShop::get('router')->route('index.php?route=product/product&product_id=' . $row['product_id']),
        );

        $show_box = $this->p_params->get('show_box', 0);
        $show_heading = $this->p_params->get('show_heading', 0);
        $heading_title = $oc_language->get('heading_title');

        if (file_exists(DIR_TEMPLATE . $oc_config->get('config_template') . '/template/module/product.tpl')) {
            $template = $oc_config->get('config_template') . '/template/module/product.tpl';
        }
        else {
            $template = 'default/template/module/product.tpl';
        }

        ob_start();

        require(JPATH_MIJOSHOP_OC.'/catalog/view/theme/'.$template);

        $output = ob_get_contents();

        ob_end_clean();

		return $output;
	}
}