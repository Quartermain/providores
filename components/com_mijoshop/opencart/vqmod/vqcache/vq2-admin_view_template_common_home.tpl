<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_install) { ?>
  <div class="warning"><?php echo $error_install; ?></div>
  <?php } ?>
  <?php if ($error_image) { ?>
  <div class="warning"><?php echo $error_image; ?></div>
  <?php } ?>
  <?php if ($error_image_cache) { ?>
  <div class="warning"><?php echo $error_image_cache; ?></div>
  <?php } ?>
  <?php if ($error_cache) { ?>
  <div class="warning"><?php echo $error_cache; ?></div>
  <?php } ?>
  <?php if ($error_download) { ?>
  <div class="warning"><?php echo $error_download; ?></div>
  <?php } ?>
  <?php if ($error_logs) { ?>
  <div class="warning"><?php echo $error_logs; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/home.png" alt="" /> <?php echo $heading_title; ?></h1>
    </div>
    
            <script language="javascript">
                function upgrade() {
                    window.location = "<?php echo $this->url->link('common/upgrade', 'token=' . $this->session->data['token'], 'SSL'); ?>";
                }
            </script>
			<div class="content" style="background: none repeat scroll 0 0 #F4F4F4;">
				<?php $base = MijoShop::get('base'); ?>
				<?php $utility = MijoShop::get('utility'); ?>
				<table cellspacing="0" cellpadding="0" border="0" width="100%">
					<tr>
						<td valign="top" width="58%">
							<div id="MijoshopQuickIcons">
								<?php
								$utility->getMijoshopIcon($this->url->link('setting/store', 'token=' . $this->session->data['token'], 'SSL'), 'icon-48-mijoshop-settings.png', $text_setting);
								$utility->getMijoshopIcon($this->url->link('catalog/product', 'token=' . $this->session->data['token'], 'SSL'), 'icon-48-mijoshop-products.png', $text_product);
								$utility->getMijoshopIcon($this->url->link('catalog/category', 'token=' . $this->session->data['token'], 'SSL'), 'icon-48-mijoshop-categories.png', $text_category);
								$utility->getMijoshopIcon($this->url->link('catalog/manufacturer', 'token=' . $this->session->data['token'], 'SSL'), 'icon-48-mijoshop-manufacturers.png', $text_manufacturer);
								$utility->getMijoshopIcon($this->url->link('catalog/option', 'token=' . $this->session->data['token'], 'SSL'), 'icon-48-mijoshop-options.png', $text_option);
								$utility->getMijoshopIcon($this->url->link('catalog/review', 'token=' . $this->session->data['token'], 'SSL'), 'icon-48-mijoshop-reviews.png', $text_review);
								$utility->getMijoshopIcon($this->url->link('catalog/information', 'token=' . $this->session->data['token'], 'SSL'), 'icon-48-mijoshop-informations.png', JText::_('COM_MIJOSHOP_PAGES'));
								$utility->getMijoshopIcon($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'), 'icon-48-mijoshop-modules.png', $text_module);
								$utility->getMijoshopIcon($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'), 'icon-48-mijoshop.png', $text_payment);
								$utility->getMijoshopIcon($this->url->link('extension/shipping', 'token=' . $this->session->data['token'], 'SSL'), 'icon-48-mijoshop-shipping.png', $text_shipping);
								$utility->getMijoshopIcon($this->url->link('sale/order', 'token=' . $this->session->data['token'], 'SSL'), 'icon-48-mijoshop-orders.png', $text_order);
								$utility->getMijoshopIcon($this->url->link('sale/customer', 'token=' . $this->session->data['token'], 'SSL'), 'icon-48-mijoshop-customers.png', $text_customer);
								//$utility->getMijoshopIcon($this->url->link('sale/coupon', 'token=' . $this->session->data['token'], 'SSL'), 'icon-48-mijoshop-coupons.png', $text_coupon);
								if(JFactory::getApplication()->isAdmin()){$utility->getMijoshopIcon('index.php?option=com_languages&view=installed', 'icon-48-mijoshop-languages.png', $text_language);}
								$utility->getMijoshopIcon($this->url->link('user/user', 'token=' . $this->session->data['token'], 'SSL'), 'icon-48-mijoshop-users.png', $text_user);
								$utility->getMijoshopIcon($this->url->link('module/vqmod_manager', 'token=' . $this->session->data['token'], 'SSL'), 'icon-48-mijoshop-vqmod.png', $text_vqmod_manager);
								?>
							</div>
						</td>
						<td valign="top" width="42%" style="padding: 7px 0 0 5px">
						<?php
						$installed_version = $base->getMijoshopVersion();
                        $latest_version = $base->getLatestMijoshopVersion();
                        $version_status = version_compare($installed_version, $latest_version);
                        $config = $base->getConfig();
                        $pid = $base->getConfig()->get('pid');
						?>

						<?php echo JHtml::_('sliders.start', 'mijoshop'); ?>
						<?php echo JHtml::_('sliders.panel', JText::_('COM_MIJOSHOP_CPANEL_WELLCOME'), 'welcome'); ?>
							<div class="dashboard-slider">
							    <table class="adminlist table table-striped">
                                    <tr height="70">
                                        <td width="%25">
                                            <?php
                                                $template = 'bluestork';
                                                if ($base->is30()) {
                                                    $template = 'hathor';
                                                }

                                                if ($version_status == 0) {
                                                    echo JHTML::_('image', 'administrator/templates/'.$template.'/images/header/icon-48-checkin.png', null);
                                                }
                                                elseif($version_status == -1) {
                                                    echo JHTML::_('image', 'administrator/templates/'.$template.'/images/header/icon-48-help_header.png', null);
                                                }
                                                else {
                                                    echo JHTML::_('image', 'administrator/templates/'.$template.'/images/header/icon-48-help_header.png', null);
                                                }
                                            ?>
                                        </td>
                                        <td width="%35">
                                            <?php
                                                if ($version_status == 0) {
                                                    echo '<b><font color="green">'.JText::_('COM_MIJOSHOP_CPANEL_LATEST_VERSION_INSTALLED').'</font></b>';
                                                }
                                                elseif($version_status == -1) {
                                                    echo '<b><font color="red">'.JText::_('COM_MIJOSHOP_CPANEL_OLD_VERSION').'</font></b>';
                                                }
                                                else {
                                                    echo '<b><font color="orange">'.JText::_('COM_MIJOSHOP_CPANEL_NEWER_VERSION').'</font></b>';
                                                }
                                            ?>
                                        </td>
                                        <td align="center" style="vertical-align: middle;" rowspan="5">
                                            <a href="http://mijosoft.com/joomla-extensions/mijoshop-joomla-shopping-cart">
                                            <img src="components/com_mijoshop/assets/images/logo.png" width="140" height="140" style="display: block; margin: auto;" alt="MijoShop" title="MijoShop" align="middle" border="0">
                                            </a>
                                        </td>
                                    </tr>
                                    <?php if (empty($pid)) { ?>
									<tr height="40">
										<td>
											<?php echo '<b><font color="red">'.JText::_('COM_MIJOSHOP_CPANEL_PID').'</font></b>';?>
										</td>
										<td>
											<form id="pid" method="post" action="index.php?route=common/edit/insertPID&token=<?php echo $token; ?>">
												<input type="text" name="pid" id="pid" class="inputbox" size="18" style="width: 150px;" />
												&nbsp;
												<input type="submit" class="btn btn-danger" style="margin-bottom: 10px;" value="<?php echo JText::_('Save'); ?>" />
											</form>

										</td>
									</tr>
									<?php } ?>
                                    <tr height="40">
                                        <td>
                                            <?php
                                                if ($version_status == 0) {
                                                    echo JText::_('COM_MIJOSHOP_CPANEL_LATEST_VERSION');
                                                }
                                                elseif ($version_status == -1) {
                                                    echo '<b><font color="red">'.JText::_('COM_MIJOSHOP_CPANEL_LATEST_VERSION').'</font></b>';
                                                }
                                                else {
                                                    echo '<b><font color="orange">'.JText::_('COM_MIJOSHOP_CPANEL_LATEST_VERSION').'</font></b>';
                                                }
                                            ?>
                                        </td>
                                        <td>
                                            <?php
                                                if ($version_status == 0) {
                                                    echo $latest_version;
                                                }
                                                elseif ($version_status == -1) {
                                                    echo '<b><font color="red">'.$latest_version.'</font></b>&nbsp;';
                                                    echo '<input type="button" class="button btn btn-danger" value="'.JText::_('COM_MIJOSHOP_UPGRADE').'" onclick="upgrade();" />';
                                                }
                                                else {
                                                    echo '<b><font color="orange">'.$latest_version.'</font></b>';
                                                }
                                            ?>
                                        </td>
                                    </tr>
                                    <tr height="40">
                                        <td>
                                            <?php echo JText::_('COM_MIJOSHOP_CPANEL_INSTALLED_VERSION'); ?>
                                        </td>
                                        <td>
                                            <?php echo $installed_version; ?>
                                        </td>
                                    </tr>
                                    <tr height="40">
                                        <td>
                                            <?php echo JText::_('COM_MIJOSHOP_CPANEL_COPYRIGHT'); ?>
                                        </td>
                                        <td>
                                            <a href="http://mijosoft.com" target="_blank"><?php echo $base->getXmlText(JPATH_MIJOSHOP_ADMIN.'/mijoshop.xml', 'copyright'); ?></a>
                                        </td>
                                    </tr>
                                </table>
							</div>
						<?php echo JHtml::_('sliders.panel', $text_overview, 'overview'); ?>
							<div class="dashboard-slider">
							  <table class="adminlist table table-striped">
								<tr class="row0">
								  <td class="key"><?php echo $text_total_sale; ?></td>
								  <td><?php echo $total_sale; ?></td>
								</tr>
								<tr class="row1">
								  <td class="key"><?php echo $text_total_sale_year; ?></td>
								  <td><?php echo $total_sale_year; ?></td>
								</tr>
								<tr class="row0">
								  <td class="key"><?php echo $text_total_order; ?></td>
								  <td><?php echo $total_order; ?></td>
								</tr>
								<tr class="row1">
								  <td class="key"><?php echo $text_total_customer; ?></td>
								  <td><?php echo $total_customer; ?></td>
								</tr>
								<tr class="row0">
								  <td class="key"><?php echo $text_total_customer_approval; ?></td>
								  <td><?php echo $total_customer_approval; ?></td>
								</tr>
								<tr class="row1">
								  <td class="key"><?php echo $text_total_review_approval; ?></td>
								  <td><?php echo $total_review_approval; ?></td>
								</tr>
								<tr class="row0">
								  <td class="key"><?php echo $text_total_affiliate; ?></td>
								  <td><?php echo $total_affiliate; ?></td>
								</tr>
								<tr class="row1">
								  <td class="key"><?php echo $text_total_affiliate_approval; ?></td>
								  <td><?php echo $total_affiliate_approval; ?></td>
								</tr>
							  </table>
							</div>
						<?php echo JHtml::_('sliders.panel', $text_statistics, 'statistics'); ?>
							<div class="dashboard-content" style="border: 0px !important;">
								<div class="range"><?php echo $entry_range; ?>
								  <select id="range" onchange="getSalesChart(this.value)">
									<option value="day"><?php echo $text_day; ?></option>
									<option value="week"><?php echo $text_week; ?></option>
									<option value="month"><?php echo $text_month; ?></option>
									<option value="year"><?php echo $text_year; ?></option>
								  </select>
								</div>
								<div style="clear:both;"></div>
								<div id="report" style="width: 390px; height: 170px; margin: auto;"></div>
							</div>
						<?php echo JHtml::_('sliders.panel', $text_latest_10_orders, 'orders'); ?>
							<div class="dashboard-slider">
							  <table class="list">
								<thead>
								  <tr>
									<td class="right"><?php echo $column_order; ?></td>
									<td class="left"><?php echo $column_customer; ?></td>
									<td class="left"><?php echo $column_status; ?></td>
									<td class="left"><?php echo $column_date_added; ?></td>
									<td class="right"><?php echo $column_total; ?></td>
									<td class="right"><?php echo $column_action; ?></td>
								  </tr>
								</thead>
								<tbody>
								  <?php if ($orders) { ?>
								  <?php foreach ($orders as $order) { ?>
								  <tr>
									<td class="right"><?php echo $order['order_id']; ?></td>
									<td class="left"><?php echo $order['customer']; ?></td>
									<td class="left"><?php echo $order['status']; ?></td>
									<td class="left"><?php echo $order['date_added']; ?></td>
									<td class="right"><?php echo $order['total']; ?></td>
									<td class="right"><?php foreach ($order['action'] as $action) { ?>
									  [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
									  <?php } ?></td>
								  </tr>
								  <?php } ?>
								  <?php } else { ?>
								  <tr>
									<td class="center" colspan="6"><?php echo $text_no_results; ?></td>
								  </tr>
								  <?php } ?>
								</tbody>
							  </table>
							</div>
						<?php echo JHtml::_('sliders.end'); ?>
					  </td>
					</tr>
				</table>
			</div>
    </div>
  </div>
</div>

<script type="text/javascript"><!--
function getSalesChart(range) {
	$.ajax({
		type: 'get',
		url: 'index.php?option=com_mijoshop&route=common/home/chart&token=<?php echo $token; ?>&range=' + range,
		dataType: 'json',
		async: false,
		success: function(json) {
			var option = {	
				shadowSize: 0,
				lines: { 
					show: true,
					fill: true,
					lineWidth: 1
				},
				grid: {
					backgroundColor: '#FFFFFF'
				},	
				xaxis: {
            		ticks: json.xaxis
				}
			}

			$.plot($('#report'), [json.order, json.customer], option);
		}
	});
}

getSalesChart($('#range').val());
//--></script> 
<?php echo $footer; ?>