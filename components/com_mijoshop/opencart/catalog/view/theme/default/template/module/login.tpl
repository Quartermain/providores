<?php if (!$this->customer->isLogged()) { ?>
<div class="box_oc">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="module_login"> 
	<b><?php echo $entry_email_address; ?></b>
	<br />
    <span style="text-align: left;"><input type="text" name="email" /></span>
    <br /><br />
    <b><?php echo $entry_password; ?></b>
	<br />
    <input type="password" name="password" />
    <br /><br />
<div style="float:left; text-align: right;"><a onclick="jQuery('#module_login').submit();" class="<?php echo MijoShop::getButton(); ?>"><span><?php echo $button_login; ?></span></a>&nbsp;</div>
    <div style="float:left; text-align: right;"><a href="<?php echo $this->url->link('account/register', '', 'SSL');?>" class="<?php echo MijoShop::getButton(); ?>"><span><?php echo $button_create; ?></span></a></div>
    <br style="clear:both;"/>
    </form>
  </div>
 </div>
<script type="text/javascript"><!--
jQuery('#module_login input').keydown(function(e) {
  if (e.keyCode == 13) {
	  jQuery('#module_login').submit();
  }
});
//--></script>
<?php } else { ?>
<div class="box_oc">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
	  <div class="middle" id="information" style="text-align: left;">
		<?php echo $text_greeting; ?>
		<div id="information" style="margin-top: 10px;">
		<p style="margin:0;"><b><?php echo $text_my_account; ?></b></p>
		<ul>
		  <li><a href="<?php echo $this->url->link('account/edit', '', 'SSL');?>"><?php echo $text_information; ?></a></li>
		  <li><a href="<?php echo $this->url->link('account/password', '', 'SSL');?>"><?php echo $text_password; ?></a></li>
		  <li><a href="<?php echo $this->url->link('account/address', '', 'SSL');?>"><?php echo $text_address; ?></a></li>
		</ul>
		&nbsp;
		<p style="margin:0;"><b><?php echo $text_my_orders; ?></b></p>
		<ul>
		  <li><a href="<?php echo $this->url->link('account/order', '', 'SSL');?>"><?php echo $text_history; ?></a></li>
		  <li><a href="<?php echo $this->url->link('account/download', '', 'SSL');?>"><?php echo $text_download; ?></a></li>
		</ul>
		&nbsp;
		<p style="margin:0;"><b><?php echo $text_my_newsletter; ?></b></p>
		<ul>
		  <li><a href="<?php echo $this->url->link('account/newsletter', '', 'SSL');?>"><?php echo $text_newsletter; ?></a></li>
		</ul>
		</div> 
		</div>
		<div style="text-align: center;border-top:1px solid #ccc;padding: 15px 0;">
			<a href="<?php echo $this->url->link('account/logout', '', 'SSL');?>" class="<?php echo MijoShop::getButton(); ?>"><span><?php echo $button_logout; ?></span></a>
		</div>
	</div>
</div>
<?php } ?>