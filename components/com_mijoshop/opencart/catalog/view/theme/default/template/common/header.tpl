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
<script type="text/javascript">
$(document).ready(function(){
	$('.box-category li').each(function(index,element){
		if($(this).children('ul').length !='') {
			element.addClass('parent');
		}
	})

    
  
	$('.box-category li').hover(function(){
		//if($(this).children('ul').is(':visible')) {
		//	return false;
		//}
		//else {
		
		$(this).children('ul').stop().slideDown();
			//if($($(this).next('ul')).length !='' ) return false;
			//else return true;
		//}
	},function(){
		$('.box-category li ul').stop().hide();
	}
	
	)
})
</script>
<?php echo $google_analytics; ?>

<div id="container">

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
