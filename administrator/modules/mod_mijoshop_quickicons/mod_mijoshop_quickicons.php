<?php
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

$file = JPATH_ROOT.'/components/com_mijoshop/mijoshop/mijoshop.php';
if (!file_exists($file)) {
	return;
}

require_once($file);

$base = MijoShop::get('base');
$utility = MijoShop::get('utility');
$document = JFactory::getDocument();
$mainframe = JFactory::getApplication();

$document->addStyleSheet('components/com_mijoshop/assets/css/mijoshop.css');
?>

<div id="MijoshopQuickIcons">
	<?php
	if ($params->get('mijoshop_dashboard', 1) == 1) {
		$link = 'index.php?option=com_mijoshop';
        $utility->getMijoshopIcon($link, 'icon-48-mijoshop.png', JText::_('COM_MIJOSHOP_DASHBOARD'));
	}
	
	if ($params->get('mijoshop_categories', 1) == 1) {
		$link = 'index.php?option=com_mijoshop&amp;route=catalog/category';
        $utility->getMijoshopIcon($link, 'icon-48-mijoshop-categories.png', JText::_('COM_MIJOSHOP_CATEGORIES'));
	}
	
	if ($params->get('mijoshop_products', 1) == 1) {
		$link = 'index.php?option=com_mijoshop&amp;route=catalog/product';
        $utility->getMijoshopIcon($link, 'icon-48-mijoshop-products.png', JText::_('COM_MIJOSHOP_PRODUCTS'));
	}
	
	if ($params->get('mijoshop_coupons', 0) == 1) {
		$link = 'index.php?option=com_mijoshop&amp;route=sale/coupon';
        $utility->getMijoshopIcon($link, 'icon-48-mijoshop-coupons.png', JText::_('COM_MIJOSHOP_COUPONS'));
	}
	
	if ($params->get('mijoshop_customers', 1) == 1) {
		$link = 'index.php?option=com_mijoshop&amp;route=sale/customer';
        $utility->getMijoshopIcon($link, 'icon-48-mijoshop-customers.png', JText::_('COM_MIJOSHOP_CUSTOMERS'));
	}
	
	if ($params->get('mijoshop_orders', 1) == 1) {
		$link = 'index.php?option=com_mijoshop&amp;route=sale/order';
        $utility->getMijoshopIcon($link, 'icon-48-mijoshop-orders.png', JText::_('COM_MIJOSHOP_ORDERS'));
	}
	
	if ($params->get('mijoshop_affiliates', 0) == 1) {
		$link = 'index.php?option=com_mijoshop&amp;route=sale/affiliate';
        $utility->getMijoshopIcon($link, 'icon-48-mijoshop-affiliates.png', JText::_('COM_MIJOSHOP_AFFILIATES'));
	}
	?>
</div>