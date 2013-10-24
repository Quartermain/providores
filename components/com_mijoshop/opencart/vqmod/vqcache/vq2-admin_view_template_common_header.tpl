<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php MijoShop::get('base')->addHeader(JPATH_MIJOSHOP_OC . '/admin/view/stylesheet/stylesheet.css'); ?>
<?php foreach ($styles as $style) { ?>
	<?php JHTML::stylesheet(basename($style['href']), str_replace(basename($style['href']), '', 'components/com_mijoshop/opencart/admin/'.$style['href'])); ?>
<?php } ?>
<?php MijoShop::get('base')->addHeader(JPATH_MIJOSHOP_OC . '/admin/view/javascript/common.js', false); ?>
<?php foreach ($scripts as $script) { ?>
	<?php JHTML::script(basename($script), str_replace(basename($script), '', 'components/com_mijoshop/opencart/admin/'.$script)); ?>
<?php } ?>
<script type="text/javascript">
//-----------------------------------------
// Confirm Actions (delete, uninstall)
//-----------------------------------------
$(document).ready(function(){

                           $('li a.parent').each(function(index) {
                               if($(this).next('ul').children('li').size() == 0) {
                                   $(this).parent('li').css('display', 'none');
                               }
                           })

                           if($('#catalog ul li:not(:has(a.parent))').size() == 0) $('#catalog').css('display', 'none');
                           if($('#extension ul li:not(:has(a.parent))').size() == 0) $('#extension').css('display', 'none');
                           if($('#sale ul li:not(:has(a.parent))').size() == 0) $('#sale').css('display', 'none');
                           if($('#system ul li:not(:has(a.parent))').size() == 0) $('#system').css('display', 'none');
                           if($('#reports ul li:not(:has(a.parent))').size() == 0) $('#reports').css('display', 'none');
   			
    // Confirm Delete
    $('#form').submit(function(){
        if ($(this).attr('action').indexOf('delete',1) != -1) {
            if (!confirm('<?php echo $text_confirm; ?>')) {
                return false;
            }
        }
    });
    	
    // Confirm Uninstall
    $('a').click(function(){
        if ($(this).attr('href') != null && $(this).attr('href').indexOf('uninstall', 1) != -1) {
            if (!confirm('<?php echo $text_confirm; ?>')) {
                return false;
            }
        }
    });
});
</script>

<div id="container">
<div id="header">
  
  <?php if ($logged) { ?>
  <div id="menu">
    <ul class="left" style="display: none;">
      <li id="dashboard"><a href="<?php echo $home; ?>" class="top"><?php echo $text_dashboard; ?></a></li>
      <li id="catalog"><a class="top"><?php echo $text_catalog; ?></a>
        <ul>
          
                           <?php if($this->user->hasPermission('access','catalog/category')) {  ?>
                           <li><a href="<?php echo $category; ?>"><?php echo $text_category; ?></a></li>
                           <?php } ?>
   			
          
                           <?php if($this->user->hasPermission('access','catalog/product')) {  ?>
                           <li><a href="<?php echo $product; ?>"><?php echo $text_product; ?></a></li>
                           <?php } ?>
   			
          
                           <?php if($this->user->hasPermission('access','catalog/filter')) {  ?>
                           <li><a href="<?php echo $filter; ?>"><?php echo $text_filter; ?></a></li>
                           <?php } ?>
   			
          <li><a class="parent"><?php echo $text_attribute; ?></a>
            <ul>
              
                           <?php if($this->user->hasPermission('access','catalog/attribute')) { ?>
                           <li><a href="<?php echo $attribute; ?>"><?php echo $text_attribute; ?></a></li>
                           <?php } ?>
   			
              
                           <?php if($this->user->hasPermission('access','catalog/attribute_group')) { ?>
                           <li><a href="<?php echo $attribute_group; ?>"><?php echo $text_attribute_group; ?></a></li>
                           <?php } ?>
   			
            </ul>
          </li>
          
                           <?php if($this->user->hasPermission('access','catalog/option')) {  ?>
                           <li><a href="<?php echo $option; ?>"><?php echo $text_option; ?></a></li>
                           <?php } ?>
   			
          
                           <?php if($this->user->hasPermission('access','catalog/manufacturer')) {  ?>
                           <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
                           <?php } ?>
   			
          
                           <?php if($this->user->hasPermission('access','catalog/download')) {  ?>
                           <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                           <?php } ?>
   			
          
                           <?php if($this->user->hasPermission('access','catalog/review')) {  ?>
                           <li><a href="<?php echo $review; ?>"><?php echo $text_review; ?></a></li>
                           <?php } ?>
   			
          
                           <?php if($this->user->hasPermission('access','catalog/information')) {  ?>
                           <li><a href="<?php echo $information; ?>"><?php echo $text_information; ?></a></li>
                           <?php } ?>
   			
        </ul>
      </li>
      <li id="extension"><a class="top"><?php echo $text_extension; ?></a>
        <ul>
          
                           <?php if($this->user->hasPermission('access','extension/module')) {  ?>
                           <li><a href="<?php echo $module; ?>"><?php echo $text_module; ?></a></li>
                           <?php } ?>
   			
          
                           <?php if($this->user->hasPermission('access','extension/shipping')) {  ?>
                           <li><a href="<?php echo $shipping; ?>"><?php echo $text_shipping; ?></a></li>
                           <?php } ?>
   			
          
                           <?php if($this->user->hasPermission('access','extension/payment')) {  ?>
                           <li><a href="<?php echo $payment; ?>"><?php echo $text_payment; ?></a></li>
                           <?php } ?>
   			
          
                           <?php if($this->user->hasPermission('access','extension/total')) {  ?>
                           <li><a href="<?php echo $total; ?>"><?php echo $text_total; ?></a></li>
                           <?php } ?>
   			
          
                           <?php if($this->user->hasPermission('access','extension/feed')) {  ?>
                           <li><a href="<?php echo $feed; ?>"><?php echo $text_feed; ?></a></li>
                           <?php } ?>
   			
        </ul>
      </li>
      <li id="sale"><a class="top"><?php echo $text_sale; ?></a>
        <ul>
          
                           <?php if($this->user->hasPermission('access','sale/order')) {  ?>
                           <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                           <?php } ?>
   			
          
                           <?php if($this->user->hasPermission('access','sale/return')) {  ?>
                           <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                           <?php } ?>
   			
          <li><a class="parent"><?php echo $text_customer; ?></a>
            <ul>
              
                           <?php if($this->user->hasPermission('access','sale/customer')) { ?>
                           <li><a href="<?php echo $customer; ?>"><?php echo $text_customer; ?></a></li>
                           <?php } ?>
   			
              
                           <?php if($this->user->hasPermission('access','sale/customer_group')) { ?>
                           <li><a href="<?php echo $customer_group; ?>"><?php echo $text_customer_group; ?></a></li>
                           <?php } ?>
   			
              
                           <?php if($this->user->hasPermission('access','sale/customer_ban_ip')) {?>
                           <li><a href="<?php echo $customer_ban_ip; ?>"><?php echo $text_customer_ban_ip; ?></a></li>
                           <?php } ?>
            
            </ul>
          </li>
          
                           <?php if($this->user->hasPermission('access','sale/affiliate')) {  ?>
                           <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
                           <?php } ?>
   			
          
                           <?php if($this->user->hasPermission('access','sale/coupon')) {  ?>
                           <li><a href="<?php echo $coupon; ?>"><?php echo $text_coupon; ?></a></li>
                           <?php } ?>
   			
          <li><a class="parent"><?php echo $text_voucher; ?></a>
            <ul>
              
                           <?php if($this->user->hasPermission('access','sale/voucher')) { ?>
                           <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
                           <?php } ?>
   			
              
                           <?php if($this->user->hasPermission('access','sale/voucher_theme')) { ?>
                           <li><a href="<?php echo $voucher_theme; ?>"><?php echo $text_voucher_theme; ?></a></li>
                           <?php } ?>
   			
            </ul>
          </li>
          
                           <?php if($this->user->hasPermission('access','sale/contact')) {  ?>
                           <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                           <?php } ?>
   			
		  <!-- PAYPAL MANAGE NAVIGATION LINK -->
          <?php if ($pp_express_status) { ?>
           <li><a class="parent" href="<?php echo $paypal_express; ?>"><?php echo $text_paypal_express; ?></a>
             <ul>
               <li><a href="<?php echo $paypal_express_search; ?>"><?php echo $text_paypal_express_search; ?></a></li>
             </ul>
           </li>
          <?php } ?>
          <!-- PAYPAL MANAGE NAVIGATION LINK END -->
        </ul>
      </li>
      <li id="system"><a class="top"><?php echo $text_system; ?></a>
        <ul>
          
                           <?php if($this->user->hasPermission('access','setting/setting')) { ?>
                           <li><a href="<?php echo $setting; ?>"><?php echo $text_setting; ?></a></li>
                           <?php } ?>
   			
          <li><a class="parent"><?php echo $text_design; ?></a>
            <ul>
              
                           <?php if($this->user->hasPermission('access','design/layout')) { ?>
                           <li><a href="<?php echo $layout; ?>"><?php echo $text_layout; ?></a></li>
                           <?php } ?>
   			
              
                           <?php if($this->user->hasPermission('access','design/banner')) { ?>
                           <li><a href="<?php echo $banner; ?>"><?php echo $text_banner; ?></a></li>
                           <?php } ?>
   			
            </ul>
          </li>
          <li><a class="parent"><?php echo $text_users; ?></a>
            <ul>
              
                           <?php if($this->user->hasPermission('access','user/user')) { ?>
                           <li><a href="<?php echo $user; ?>"><?php echo $text_user; ?></a></li>
                           <?php } ?>
   			
              
                           <?php if($this->user->hasPermission('access','user/user_permission')) { ?>
                           <li><a href="<?php echo $user_group; ?>"><?php echo $text_user_group; ?></a></li>
                           <?php } ?>
   			
            </ul>
          </li>
          <li><a class="parent"><?php echo $text_localisation; ?></a>
            <ul>
              
              
                           <?php if($this->user->hasPermission('access','localisation/currency')) { ?>
                           <li><a href="<?php echo $currency; ?>"><?php echo $text_currency; ?></a></li>
                           <?php } ?>
   			
              
                           <?php if($this->user->hasPermission('access','localisation/stock_status')) { ?>
                           <li><a href="<?php echo $stock_status; ?>"><?php echo $text_stock_status; ?></a></li>
                           <?php } ?>
   			
              
                           <?php if($this->user->hasPermission('access','localisation/order_status')) { ?>
                           <li><a href="<?php echo $order_status; ?>"><?php echo $text_order_status; ?></a></li>
                           <?php } ?>
   			

                           <?php
                               $preturn_status = $this->user->hasPermission('access','localisation/return_status');
                               $preturn_action = $this->user->hasPermission('access','localisation/return_action');
                               $preturn_reason = $this->user->hasPermission('access','localisation/return_reason');
                               if( $preturn_status != false and $preturn_action != false and $preturn_reason != false) {
                           ?>
               
              <li><a class="parent"><?php echo $text_return; ?></a>
                <ul>
                  
                           <?php if($preturn_status) { ?>
                           <li><a href="<?php echo $return_status; ?>"><?php echo $text_return_status; ?></a></li>
                           <?php } ?>
   			
                  
                           <?php if($preturn_action) { ?>
                           <li><a href="<?php echo $return_action; ?>"><?php echo $text_return_action; ?></a></li>
                           <?php } ?>
   			
                  
                           <?php if($preturn_reason) { ?>
                           <li><a href="<?php echo $return_reason; ?>"><?php echo $text_return_reason; ?></a></li>
                           <?php } ?>
   			
                </ul>
              </li>

                           <?php } ?>
               
              
                           <?php if($this->user->hasPermission('access','localisation/country')) { ?>
                           <li><a href="<?php echo $country; ?>"><?php echo $text_country; ?></a></li>
                           <?php } ?>
   			
              
                           <?php if($this->user->hasPermission('access','localisation/zone')) { ?>
                           <li><a href="<?php echo $zone; ?>"><?php echo $text_zone; ?></a></li>
                           <?php } ?>
   			
              
                           <?php if($this->user->hasPermission('access','localisation/geo_zone')) { ?>
                           <li><a href="<?php echo $geo_zone; ?>"><?php echo $text_geo_zone; ?></a></li>
                           <?php } ?>
   			

                           <?php
                               $ptax_class = $this->user->hasPermission('access','localisation/tax_class');
                               $ptax_rate = $this->user->hasPermission('access','localisation/tax_rate');
                               if($preturn_status != false and $preturn_action != false and $preturn_reason) {
                           ?>
               
              <li><a class="parent"><?php echo $text_tax; ?></a>
                <ul>
                  
                           <?php if($ptax_class) { ?>
                           <li><a href="<?php echo $tax_class; ?>"><?php echo $text_tax_class; ?></a></li>
                           <?php } ?>
   			
                  
                           <?php if($ptax_rate) { ?>
                           <li><a href="<?php echo $tax_rate; ?>"><?php echo $text_tax_rate; ?></a></li>
                           <?php } ?>
   			
                </ul>
              </li>

                           <?php } ?>
               
              
                           <?php if($this->user->hasPermission('access','localisation/length_class')) { ?>
                           <li><a href="<?php echo $length_class; ?>"><?php echo $text_length_class; ?></a></li>
                           <?php } ?>
   			
              
                           <?php if($this->user->hasPermission('access','localisation/weight_class')) { ?>
                           <li><a href="<?php echo $weight_class; ?>"><?php echo $text_weight_class; ?></a></li>
                           <?php } ?>
   			
            </ul>
          </li>
          
                           <?php if($this->user->hasPermission('access','tool/error_log')) {?>
                           <li><a href="<?php echo $error_log; ?>"><?php echo $text_error_log; ?></a></li>
                           <?php } ?>
   			
          
                           <?php if($this->user->hasPermission('access','tool/backup')) {?>
                           <li><a href="<?php echo $backup; ?>"><?php echo $text_backup; ?></a></li>
                           <?php } ?>
   			
          
                           <?php if($this->user->hasPermission('access','tool/themeeditor')) {?>
                           <li><a href="<?php echo $themeeditor; ?>"><?php echo $text_themeeditor; ?></a></li>
                           <?php } ?>
   			
          
                           <?php if($this->user->hasPermission('access','module/vqmod_manager')) {?>
                           <li><a href="<?php echo $vqmod_manager; ?>"><?php echo $text_vqmod_manager; ?></a></li>
                           <?php } ?>
   			
		  <li><a class="parent">Migration Tools</a>
			<ul>
             
                           <?php if($this->user->hasPermission('access','tool/virtuemart')) {?>
                           <li><a href="<?php echo MijoShop::get('router')->route('index.php?option=com_mijoshop&route=tool/virtuemart'); ?>">VirtueMart</a></li>
                           <?php } ?>
   			
             
                           <?php if($this->user->hasPermission('access','tool/hikashop')) {?>
                           <li><a href="<?php echo MijoShop::get('router')->route('index.php?option=com_mijoshop&route=tool/hikashop'); ?>">HikaShop</a></li>
                           <?php } ?>
   			
             
                           <?php if($this->user->hasPermission('access','tool/redshop')) {?>
                           <li><a href="<?php echo MijoShop::get('router')->route('index.php?option=com_mijoshop&route=tool/redshop'); ?>">redSHOP</a></li>
                           <?php } ?>
   			
             
                           <?php if($this->user->hasPermission('access','tool/tienda')) {?>
                           <li><a href="<?php echo MijoShop::get('router')->route('index.php?option=com_mijoshop&route=tool/tienda'); ?>">Tienda</a></li>
                           <?php } ?>
   			
			 
                           <?php if($this->user->hasPermission('access','tool/joomshopping')) {?>
                           <li><a href="<?php echo MijoShop::get('router')->route('index.php?option=com_mijoshop&route=tool/joomshopping'); ?>">JoomShopping</a></li>
                           <?php } ?>
   			
             
                           <?php if($this->user->hasPermission('access','tool/rokquickcart')) {?>
                           <li><a href="<?php echo MijoShop::get('router')->route('index.php?option=com_mijoshop&route=tool/rokquickcart'); ?>">RokQuickCart</a></li>
                           <?php } ?>
   			
             
                           <?php if($this->user->hasPermission('access','tool/aceshop')) {?>
                           <li><a href="<?php echo MijoShop::get('router')->route('index.php?option=com_mijoshop&route=tool/aceshop'); ?>">AceShop</a></li>
                           <?php } ?>
   			
			 
                           <?php if($this->user->hasPermission('access','tool/joocart')) {?>
                           <li><a href="<?php echo MijoShop::get('router')->route('index.php?option=com_mijoshop&route=tool/joocart'); ?>">JooCart</a></li>
                           <?php } ?>
   			
             
                           <?php if($this->user->hasPermission('access','tool/ayelshop')) {?>
                           <li><a href="<?php echo MijoShop::get('router')->route('index.php?option=com_mijoshop&route=tool/ayelshop'); ?>">AyelShop</a></li>
                           <?php } ?>
   			
            </ul>
		  </li>
		  
        </ul>
      </li>
      <li id="reports"><a class="top"><?php echo $text_reports; ?></a>
        <ul>
          <li><a class="parent"><?php echo $text_sale; ?></a>
            <ul>
              
                           <?php if($this->user->hasPermission('access','report/sale_order')) {?>
                           <li><a href="<?php echo $report_sale_order; ?>"><?php echo $text_report_sale_order; ?></a></li>
                           <?php } ?>
   			
              
                           <?php if($this->user->hasPermission('access','report/sale_tax')) {?>
                           <li><a href="<?php echo $report_sale_tax; ?>"><?php echo $text_report_sale_tax; ?></a></li>
                           <?php } ?>
   			
              
                           <?php if($this->user->hasPermission('access','report/sale_shipping')) {?>
                           <li><a href="<?php echo $report_sale_shipping; ?>"><?php echo $text_report_sale_shipping; ?></a></li>
                           <?php } ?>
   			
              
                           <?php if($this->user->hasPermission('access','report/sale_return')) {?>
                           <li><a href="<?php echo $report_sale_return; ?>"><?php echo $text_report_sale_return; ?></a></li>
                           <?php } ?>
   			
              
                           <?php if($this->user->hasPermission('access','report/sale_coupon')) {?>
                           <li><a href="<?php echo $report_sale_coupon; ?>"><?php echo $text_report_sale_coupon; ?></a></li>
                           <?php } ?>
   			
            </ul>
          </li>
          <li><a class="parent"><?php echo $text_product; ?></a>
            <ul>
              
                           <?php if($this->user->hasPermission('access','report/product_viewed')) {?>
                           <li><a href="<?php echo $report_product_viewed; ?>"><?php echo $text_report_product_viewed; ?></a></li>
                           <?php } ?>
   			
              
                           <?php if($this->user->hasPermission('access','report/product_purchased')) {?>
                           <li><a href="<?php echo $report_product_purchased; ?>"><?php echo $text_report_product_purchased; ?></a></li>
                           <?php } ?>
   			
            </ul>
          </li>
          <li><a class="parent"><?php echo $text_customer; ?></a>
            <ul>
              
                           <?php if($this->user->hasPermission('access','report/customer_online')) {?>
                           <li><a href="<?php echo $report_customer_online; ?>"><?php echo $text_report_customer_online; ?></a></li>
                           <?php } ?>
   			
              
                           <?php if($this->user->hasPermission('access','report/customer_order')) {?>
                           <li><a href="<?php echo $report_customer_order; ?>"><?php echo $text_report_customer_order; ?></a></li>
                           <?php } ?>
   			
              
                           <?php if($this->user->hasPermission('access','report/customer_reward')) {?>
                           <li><a href="<?php echo $report_customer_reward; ?>"><?php echo $text_report_customer_reward; ?></a></li>
                           <?php } ?>
   			
              
                           <?php if($this->user->hasPermission('access','report/customer_credit')) {?>
                           <li><a href="<?php echo $report_customer_credit; ?>"><?php echo $text_report_customer_credit; ?></a></li>
                           <?php } ?>
   			
            </ul>
          </li>
          <li><a class="parent"><?php echo $text_affiliate; ?></a>
            <ul>
              
                           <?php if($this->user->hasPermission('access','report/affiliate_commission')) {?>
                           <li><a href="<?php echo $report_affiliate_commission; ?>"><?php echo $text_report_affiliate_commission; ?></a></li>
                           <?php } ?>
   			
            </ul>
          </li>
        </ul>
      </li>
      <?php if (MijoShop::get('base')->isAdmin('joomla') and $this->user->hasPermission('access','common/upgrade')) { ?><li id="upgrade"><a href="<?php echo $this->url->link('common/upgrade', 'token=' . $this->session->data['token'], 'SSL'); ?>" class="top"><?php echo $text_upgrade ?></a><?php } ?>
			<?php if (MijoShop::get('base')->isAdmin('joomla') and $this->user->hasPermission('access','common/support')) { ?><li id="support"><a href="<?php echo $this->data['support'] = $this->url->link('common/support', '', 'SSL'); ?>" class="top"><?php echo $text_support_oc; ?></a><?php } ?>
			
    </ul>
    <ul class="right" style="display: none;">
      <li id="store"><a href="<?php echo $store; ?>" target="_blank" class="top"><?php echo $text_front; ?></a>
        <ul>
          <?php foreach ($stores as $stores) { ?>
          <li><a href="<?php echo $stores['href']; ?>" target="_blank"><?php echo $stores['name']; ?></a></li>
          <?php } ?>
        </ul>
      </li>
      <li><a class="top" href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
    </ul>
  </div>
  <?php } ?>
</div>
