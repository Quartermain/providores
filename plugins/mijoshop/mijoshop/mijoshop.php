<?php
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

// No Permission
defined('_JEXEC') or die ('Restricted access');

jimport('joomla.plugin.plugin');

class plgMijoshopMijoshop extends JPlugin {

	public function __construct(&$subject, $config) {
		parent::__construct($subject, $config);
		
		$file = JPATH_SITE.'/components/com_mijoshop/mijoshop/mijoshop.php';
		
		if (file_exists($file)) {
			require_once($file);
		}
	}
	
	public function getViewHtml($integration){

        if(!isset($integration['mijoshop_add'])){
            $integration['mijoshop_add'] = "";
        }

		$html  = '<fieldset style="width:47%; float: left; margin: 5px;">';
        $html .=    '<legend>MijoShop</legend>';
        $html .=        '<table class="form">';
        $html .=            '<tr>';
        $html .=                '<td><strong>Customer Group</strong></br> </br> 5=8,3=3 </br>(orderstatusid=customergroupid)</td>';
        $html .=                '<td><textarea name="content[mijoshop][add]" style="width:350px; height:60px">'. $integration['mijoshop_add'] .'</textarea></td>';
        $html .=            '</tr>';
        $html .=        '</table>';
        $html .= '</fieldset>';
		
		return $html;
	}
	
    public function onMijoshopBeforeOrderStatusUpdate($data, $order_id, $order_status_id, $notify) {
        $results = self::_updateGroup($data, $order_id, $order_status_id, $notify);
    }

    public function onMijoshopBeforeOrderConfirm($data, &$order_id, &$order_status_id, &$notify) {
        $results = self::_updateGroup($data, $order_id, $order_status_id, $notify);
    }

    private function _updateGroup($data, $order_id, $order_status_id, $notify){
        $db = JFactory::getDBO();
        $db->setQuery("SELECT * FROM #__mijoshop_order_product WHERE order_id = " . $order_id);
        $order_products = $db->loadAssocList();
		
		if (empty($order_products)) {
			return;
		}
       
		foreach($order_products as $order_product)
        {
            $order_product =  MijoShop::get('base')->getIntegrations($order_product['product_id']);
            if (isset($order_product->mijoshop)) {
                $tmp = $order_product->mijoshop;

                if(isset($tmp->add) && isset($tmp->add->$order_status_id)){
                    $groups = $tmp->add->$order_status_id;
                    self::_addUserToGroup($order_id, $groups);
                }
            }
        }
    }
	
	protected function _addUserToGroup( $order_id, $groupid )
    {
        if(!isset($groupid[0])){
            return true;
        }
		
		$customer_info = MijoShop::get('db')->run("SELECT customer_id, email FROM #__mijoshop_order WHERE order_id = {$order_id}", 'loadRow');
		$db = JFactory::getDbo();
        
		$query = 'UPDATE #__mijoshop_customer SET `customer_group_id` = ' . $groupid[0] . ' WHERE `customer_id` = ' . $customer_info[0];
        
        $db->setQuery( $query );
        $db->query();
    }
}