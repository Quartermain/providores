<script type="text/javascript" src="catalog/view/javascript/category_accordion/jquery.dcjqaccordion.js"></script> 
<link rel="stylesheet" media="all" type="text/css" href="catalog/view/theme/default/stylesheet/category_accordion.css" />

<div class="box">

	<div class="box-heading"><?php echo $heading_title; ?></div>

	<div class="box-content box-category"><?php echo $category_accordion; ?></div>
	
</div>

<script type="text/javascript">
$(document).ready(function() {
	$('#cat_accordion').dcAccordion({
		classExpand : 'cid<?php echo $category_accordion_cid; ?>',
		menuClose: false,
		autoClose: true,
		saveState: false,
		disableLink: false,		
		autoExpand: true
	});
});
</script>
