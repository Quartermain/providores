<?php echo $header; ?>
<div id="content">
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
	<?php if ($error_warning) { ?>
		<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>
	<?php if ($success) { ?>
		<div class="success"><?php echo $success; ?></div>
	<?php } ?>
	<div class="box">
		<div class="left"></div>
		<div class="right"></div>
		<div class="heading">
			<h1><img src="view/image/backup.png" alt="" />JoomShopping Migration Tool</h1>
			<div class="buttons">
				<a onclick="importCategories()" class="button"><span>Import Categories</span></a>
				<a onclick="importProducts()" class="button"><span>Import Products</span></a>
				<a onclick="importManufacturers()" class="button"><span>Import Manufacturers</span></a>
				<a onclick="copyImages()" class="button"><span>Copy Images</span></a>
			</div>
	  </div>
	  <div class="content">
			<div id="importCategories"></div>
			<div id="importProducts"></div>
			<div id="importManufacturers"></div>
			<div id="copyImages"></div>
		</div>
	</div>
</div>
<?php echo $footer; ?>

<script type="text/javascript">
<!--
function importCategories() {
    document.getElementById('importCategories').innerHTML = '<span style="color:green;">Loading...</span>';
    jQuery('#importCategories').load('index.php?option=com_mijoshop&route=tool/joomshopping/importCategories');
}

function importProducts() {
    document.getElementById('importProducts').innerHTML = '<span style="color:green;">Loading...</span>';
    jQuery('#importProducts').load('index.php?option=com_mijoshop&route=tool/joomshopping/importProducts');
}

function importManufacturers() {
    document.getElementById('importManufacturers').innerHTML = '<span style="color:green;">Loading...</span>';
    jQuery('#importManufacturers').load('index.php?option=com_mijoshop&route=tool/joomshopping/importManufacturers');
}

function copyImages() {
    document.getElementById('copyImages').innerHTML = '<span style="color:green;">Loading...</span>';
    jQuery('#copyImages').load('index.php?option=com_mijoshop&route=tool/joomshopping/copyImages');
}
-->
</script>