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
			<h1><img src="view/image/backup.png" alt="" />AyelShop Migration Tool</h1>
			<div class="buttons">
				<a onClick="migrateDatabase();" class="button_oc"><span>Migrate Database</span></a>
				<a onClick="migrateFiles();" class="button_oc"><span>Migrate Files</span></a>
				<a onClick="fixMenus();" class="button_oc"><span>Fix Menus</span></a>
				<a onClick="fixModules();" class="button_oc"><span>Fix Modules</span></a>
			</div>
	  </div>
	  <div class="content">
			<div id="migrateDatabase"></div>
			<div id="migrateFiles"></div>
			<div id="fixMenus"></div>
			<div id="fixModules"></div>
		</div>
	</div>
</div>
<?php echo $footer; ?>

<script type="text/javascript">
<!--
function migrateDatabase() {
    document.getElementById('migrateDatabase').innerHTML = '<span style="color:green;">Loading...</span>';
    jQuery('#migrateDatabase').load('index.php?option=com_mijoshop&route=tool/ayelshop/migrateDatabase');
}

function migrateFiles() {
    document.getElementById('migrateFiles').innerHTML = '<span style="color:green;">Loading...</span>';
    jQuery('#migrateFiles').load('index.php?option=com_mijoshop&route=tool/ayelshop/migrateFiles');
}

function fixMenus() {
    document.getElementById('fixMenus').innerHTML = '<span style="color:green;">Loading...</span>';
    jQuery('#fixMenus').load('index.php?option=com_mijoshop&route=tool/ayelshop/fixMenus');
}

function fixModules() {
    document.getElementById('fixModules').innerHTML = '<span style="color:green;">Loading...</span>';
    jQuery('#fixModules').load('index.php?option=com_mijoshop&route=tool/ayelshop/fixModules');
}
-->
</script>