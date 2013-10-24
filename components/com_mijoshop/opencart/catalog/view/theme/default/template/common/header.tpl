<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php MijoShop::getClass('base')->addHeader(JPATH_MIJOSHOP_OC . '/catalog/view/theme/default/stylesheet/stylesheet.css'); ?>
<?php foreach ($styles as $style) { ?>
	<?php MijoShop::getClass('base')->addHeader(JPATH_MIJOSHOP_OC . ($style['href'][0] == '/' ? $style['href'] : '/' . $style['href'])); ?>
<?php } ?>

<?php MijoShop::getClass('base')->addHeader(JPATH_MIJOSHOP_OC . '/catalog/view/javascript/common.js', false); ?>
<?php foreach ($scripts as $script) { ?>
	<?php MijoShop::getClass('base')->addHeader(JPATH_MIJOSHOP_OC . ($script[0] == '/' ? $script : '/' . $script), false); ?>
<?php } ?>
<!--[if IE 7]>
<link rel="stylesheet" type="text/css" href="components/com_mijoshop/opencart/catalog/view/theme/default/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="components/com_mijoshop/opencart/catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="components/com_mijoshop/opencart/catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->
<?php echo $google_analytics; ?>

<div id="container">
<div id="header" <?php echo (MijoShop::get('base')->getConfig()->get('show_header', 1) == 1) ? '' : 'style="display:none;"'; ?>>
  <?php echo $currency; ?>
  <?php echo $cart; ?>
  <div id="search">
    <div class="button-search"></div>
    <?php if ($search) { ?>
    <input type="text" name="search" value="<?php echo $search; ?>" />
    <?php } else { ?>
    <input type="text" name="search" value="<?php echo $text_search; ?>" onclick="this.value = '';" onkeydown="this.style.color = '#000000';" />
    <?php } ?>
  </div>
  <div id="welcome">
    <?php if (!$logged) { ?>
    <?php echo $text_welcome; ?>
    <?php } else { ?>
    <?php echo $text_logged; ?>
    <?php } ?>
  </div>
  <div class="links"><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></div>
</div>
<?php if (!empty($categories)) { ?>
<div id="menu">
  <ul>
    <?php foreach ($categories as $category) { ?>
    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
      <?php if ($category['children']) { ?>
      <div>
        <?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul>
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['children'][$i])) { ?>
          <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
      </div>
      <?php } ?>
    </li>
    <?php } ?>
  </ul>
</div>
<?php } ?>
<div id="notification"></div>
