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
<div class="ja-sidenews-list clearfix">
	<?php foreach( $list as $item ) :
		$item->date = null;
		if( $showdate) {
			//$item->date =  strtotime ( $item->modified ) ? $item->created : $item->modified;
			$item->date = ($item->modified != '' && $item->modified != '0000-00-00 00:00:00') ? $item->modified : $item->created;
		}
		if(isset($item->text)){
			$item->text = $item->introtext . $item->text;
		}else{
			$item->text = $item->introtext;
		}
		

	?>
		<div class="ja-slidenews-item">

			<a class="ja-title" href="<?php echo  $item->link; ?>"><?php echo  $helper->trimString( $item->title, $titleMaxChars );?></a>

		  <?php if( $showimage ):  ?>
  		  	<?php echo $helper->renderImage ($item, $params, $descMaxChars, $iwidth, $iheight ); ?>
		  <?php endif; ?>
		  <?php if (isset($item->date)) : ?>
				<span class="ja-createdate"><?php echo JHTML::_('date', $item->date, JText::_('DATE_FORMAT_LC4')); ?> - </span>
			<?php endif; ?>
		  <?php if ($descMaxChars!=0) : ?>	
			<?php echo $helper->trimString( strip_tags($item->introtext), $descMaxChars); ?>
		  <?php endif;?>
		  <?php if( $showMoredetail ) : ?>
		  <a class="readon" href="<?php echo  $item->link; ?>"> <?php echo JTEXT::_("MORE_DETAIL"); ?></a>
		  <?php endif;?>

		</div>
  <?php endforeach; ?>
</div>