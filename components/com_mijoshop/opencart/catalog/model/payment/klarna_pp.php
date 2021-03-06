<?php
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

// No Permission
defined('_JEXEC') or die('Restricted access');
 
class ModelPaymentKlarnaPP extends Model {
  	public function getMethod($address, $total) {
		$this->language->load('payment/klarna_pp');
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('klarna_pp_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");
		
		if ($this->config->get('klarna_pp_total') > $total) {
			$status = false;
		} elseif (!$this->config->get('klarna_pp_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}	
		
		if (!$this->cart->hasShipping()) {
			$status = false;
		}	
			
		$currencies = array(
			'SEK',
			'NOK',
			'EUR',
			'DKK'
		);
		
		if (!in_array(strtoupper($this->currency->getCode()), $currencies)) {
			$status = false;
		}	
					
		$countries = array(
			'SE',
			'FI',
			'DK',
			'NO',
			'DE',
			'NL'
		);
		
		if (!in_array(strtoupper($address['iso_code_2']), $countries)) {
			$status = false;
		}	
				
		$method_data = array();
	
		if ($status) {  
      		$method_data = array( 
        		'code'       => 'klarna_pp',
        		'title'      => $this->language->get('text_title'),
				'sort_order' => $this->config->get('klarna_pp_sort_order')
      		);
    	}
   
    	return $method_data;
  	}
}
?>