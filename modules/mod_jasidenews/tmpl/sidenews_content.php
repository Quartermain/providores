<?php
/**
 * ------------------------------------------------------------------------
 * JA SideNews Module for J25 & J31
 * ------------------------------------------------------------------------
 * Copyright (C) 2004-2011 J.O.O.M Solutions Co., Ltd. All Rights Reserved.
 * @license - GNU/GPL, http://www.gnu.org/licenses/gpl.html
 * Author: J.O.O.M Solutions Co., Ltd
 * Websites: http://www.joomlart.com - http://www.joomlancers.com
 * ------------------------------------------------------------------------
 */
// no direct access
defined('_JEXEC') or die('Restricted access');
?>

<div class="" id="ja-sidenews-<?php echo $moduleID; ?>">
	<?php foreach( $list as $i => $item ) :
		$item->text = $item->introtext . $item->fulltext;
		$onclick = ' onclick="location.href=\''.$item->link.'\'"';
		$class='even';
		if ($i%2==0) $class='odd';
	?>
	<div class=" ja-<?php echo $class ?> ja-sidenews" <?php echo $onclick ;?> style="display:none; height:<?php echo $height;?>px" >
		<div class="ja-icon-<?php echo $class ?> "></div><?php echo $helper->renderImage ($item, $params, $descMaxChars, $iwidth, $iheight ); ?>
		<div class="ja-slidenews-cover" style="height:<?php echo $height;?>px;">
			
			<div class="ja-opacity" style="<?php echo $bgcolor;?>height:<?php echo $height;?>px;"></div>
			<div class="ja-sidenews-display">
				<div class="ja-sidenews-desc" style="<?php echo $color; ?>">
					<h3 style="<?php echo $color; ?>"><?php echo  $helper->trimString( $item->title, $titleMaxChars );?></h3>
					<?php echo $helper->trimString( strip_tags($item->introtext), $descMaxChars); ?>
				</div>
			</div>
		</div>
	</div>
	<?php endforeach; ?>
</div>