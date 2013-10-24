<style type="text/css">
    #header_oc {
        height: 60px;
        margin-bottom: 7px;
        padding-bottom: 4px;
        position: relative;
        z-index: 99;
    }

    .heading {
        width:150px;
        padding-right: 0 !important;
    }
</style>
<div id="header_oc">
	<?php 
			$content = MijoShop::get('opencart')->loadControllerFunction('module/cart');
			echo str_replace('<div id="cart">', '<div id="cart" style="left:0 !important;">', $content);  
	?>
</div>
