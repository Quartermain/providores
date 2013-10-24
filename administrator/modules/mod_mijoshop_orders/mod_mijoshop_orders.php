<?php
/**
* @package		MijoShop Orders
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL
*/

// no direct access
defined('_JEXEC') or die('Restricted access');

$file = JPATH_ROOT.'/components/com_mijoshop/mijoshop/mijoshop.php';
if (!file_exists($file)) {
	return;
}

$limit		= intval($params->get('limit', 10));
$pending	= $params->get('display_pending');
$confirmed	= $params->get('display_confirmed');
$cancelled	= $params->get('display_cancelled');
$refunded	= $params->get('display_refunded');
$shipped	= $params->get('display_shipped');

if (($pending) or ($confirmed) or ($cancelled) or ($refunded) or ($shipped)){
	$where = "WHERE ";
	
	if ($pending){
		$where_array[] = "os.order_status_id = 1";
	}
	
	if ($confirmed){
		$where_array[] = "os.order_status_id = 5";
	}
	
	if ($cancelled){
		$where_array[] = "os.order_status_id = 7";
	}
	
	if ($refunded){
		$where_array[] = "os.order_status_id = 11";
	}
	
	if ($shipped){
		$where_array[] = "os.order_status_id = 3";
	}
	
	$total_where = count($where_array);
	
	if ($total_where == 1) {
		$where .= $where_array[0];
	}
	else {
		$where .= implode(" OR ", $where_array);
	}
}
else {
	$where = "WHERE os.order_status_id <> 0";
}

$ordering = null;
switch ($params->get('ordering')) {
	case 'status':
		$ordering = 'o.order_status_id DESC';
		break;
	case 'price':
		$ordering = 'o.total DESC';
		break;
	case 'date':
		$ordering = 'o.date_added DESC';
		break;
	case 'id':
	default:
		$ordering = 'o.order_id DESC';
		break;
}

$query= " SELECT DISTINCT o.order_id, CONCAT_WS(' ', o.firstname, o.lastname) AS name, o.customer_id, o.total, os.name AS order_status, o.date_added".
		" FROM #__mijoshop_order AS o".
		" LEFT JOIN #__mijoshop_order_status os ON o.order_status_id = os.order_status_id".
		" LEFT JOIN #__mijoshop_customer AS c ON o.customer_id = c.customer_id".
		" $where".
		" ORDER BY ".$ordering."".
		" LIMIT ".$limit."";
$db = JFactory::getDBO();
$db->setQuery($query);
$rows = $db->loadObjectList();

require(dirname( __FILE__ ).'/tmpl/default.php');
