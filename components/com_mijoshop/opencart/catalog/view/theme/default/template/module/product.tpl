<?php if ($show_box) { ?>
<div class="box_oc">
<?php } ?>

<?php if ($show_heading) { ?>
<div class="box-heading"><?php echo $heading_title; ?></div>
<?php } ?>

<div class="box-content">
	<div class="box-product" style="margin: 2px;">
		<div style="margin-bottom: 5px; margin-right: 0px;">
			<?php if ($product['thumb']) { ?>
				<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
			<?php } ?>

            <?php if ($product['name']) { ?>
			    <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
            <?php } ?>

			<?php if ($product['price']) { ?>
				<div class="price">
				    <?php if (!$product['special']) { ?>
				        <?php echo $product['price']; ?>
				    <?php } else { ?>
				        <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
				    <?php } ?>
				</div>
			<?php } ?>
			
			<?php if ($product['rating']) { ?>
				<div class="rating"><img src="components/com_mijoshop/opencart/catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
			<?php } ?>

            <?php if ($product['button']) { ?>
			    <div class="cart"><a onclick="addProductToCart('<?php echo $product['product_id']; ?>', '<?php echo $product['options']; ?>');" class="<?php echo MijoShop::getButton(); ?>"><span><?php echo $button_cart; ?></span></a></div>
            <?php } ?>
        </div>
	</div>
</div>

<?php if ($show_box) { ?>
</div>
<?php } ?>
