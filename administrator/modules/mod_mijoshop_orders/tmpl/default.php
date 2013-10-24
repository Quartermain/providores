<?php
/**
* @package		MijoShop Orders
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL
*/

// no direct access
defined('_JEXEC') or die('Restricted access');
?>

<table class="adminlist table table-striped">
	<thead>
		<tr>
			<th><?php echo JText::_('Number'); ?></th>
		    <th><?php echo JText::_('Status'); ?></th>
		    <th><?php echo JText::_('Customer'); ?></th>
		    <th><?php echo JText::_('Amount'); ?></th>
		    <th><?php echo JText::_('Date'); ?></th>
		</tr>
	</thead>
	<tbody>
	<?php
		foreach ($rows as $row)	{
			$user_link 	= 'index.php?option=com_mijoshop&route=sale/customer/update&customer_id='.$row->customer_id;
			$user_name 	= '<a href="'.$user_link.'">'.$row->name.'</a>';
			?>
			<tr>
				<td style="text-align: center; ">
					<a href="index.php?option=com_mijoshop&route=sale/order/info&order_id=<?php echo $row->order_id; ?>"><?php printf("%06d", $row->order_id); ?></a>
				</td>
				<td style="text-align: center; ">
					<?php echo $row->order_status; ?>
				</td>
				<td>
					<?php echo $user_name; ?>
				</td>
				<td style="text-align: center; ">
					<?php echo number_format($row->total, '2'); ?>
				</td>
				<td style="text-align: center; ">
					<?php echo JHTML::_('date', $row->date_added, 'd.m.Y'); ?>
				</td>
			</tr>
			<?php
		}
		?>
	</tbody>
</table>
<table cellpadding="0" cellspacing="0" width="100%" bgcolor="#FFFFFF">
	<tr>
		<td width="25%">
			<div style="text-align:center;">
				<a href="index.php?option=com_mijoshop"><img src="components/com_mijoshop/assets/images/icon-48-mijoshop.png" width="48px" height="48px"></a>
			</div>
			<div style="text-align:center;">
		  		<a href="index.php?option=com_mijoshop"><?php echo JText::_('COM_MIJOSHOP_DASHBOARD'); ?></a>
			</div>
		</td>
		<td width="25%" height="80" >
			<div style="text-align:center;">
				<a href="index.php?option=com_mijoshop&route=sale/order"><img src="components/com_mijoshop/assets/images/icon-48-mijoshop-orders.png" width="48px" height="48px"></a>
			</div>
			<div style="text-align:center;">
		  		<a href="index.php?option=com_mijoshop&route=sale/order"><?php echo JText::_('COM_MIJOSHOP_ORDERS'); ?></a>
			</div>
		</td>
		<td width="25%">
			<div style="text-align:center;">
				<a href="index.php?option=com_mijoshop&route=sale/customer"><img src="components/com_mijoshop/assets/images/icon-48-mijoshop-customers.png" width="48px" height="48px"></a>
			</div>
			<div style="text-align:center;">
				<a href="index.php?option=com_mijoshop&route=sale/customer"><?php echo JText::_('COM_MIJOSHOP_CUSTOMERS'); ?></a>
			</div>
		</td>
		<td width="25%">
			<div style="text-align:center;">
				<a href="index.php?option=com_mijoshop&route=catalog/product"><img src="components/com_mijoshop/assets/images/icon-48-mijoshop-products.png" width="48px" height="48px"></a>
			</div>
			<div style="text-align:center;">
		  		<a href="index.php?option=com_mijoshop&route=catalog/product"><?php echo JText::_('COM_MIJOSHOP_PRODUCTS'); ?></a>
			</div>
		</td>
	</tr>
</table>