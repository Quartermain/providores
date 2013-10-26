<?php
/*
#------------------------------------------------------------------------
# Package - JoomlaMan JMSlideShow
# Version 1.0
# -----------------------------------------------------------------------
# Author - JoomlaMan http://www.joomlaman.com
# Copyright © 2012 - 2013 JoomlaMan.com. All Rights Reserved.
# @license http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 or Later
# Websites: http://www.JoomlaMan.com
#------------------------------------------------------------------------
*/
//-- No direct access
defined('_JEXEC') or die('Restricted access');
/*
 * $slide JMSlide object
 * $slide->title
 * $slide->description
 * $slide->link read more link
 * $slide->getMainImage() image resized
 * $slide->image original image (no resize)
 * $slide->getThumbnail() image resized for thumbnail
 */
//get params
global $jquery_cycle_load;
global $jquery_cycle_tile_load;
global $jquery_cycle_responsive;
if ($jquery_cycle_load != 1) {
  print '<script type="text/javascript" src="' . JURI::base(true) . '/modules/mod_jmslideshow/assets/js/jquery.cycle2.min.js"></script>';
  $jquery_cycle_load = 1;
}
print '<script type="text/javascript" src="' . JURI::base(true) . '/modules/mod_jmslideshow/assets/js/jquery.cycle2.swipe.js"></script>';
if ($jquery_cycle_responsive != 1) {
  print '<script type="text/javascript" src="' . JURI::base(true) . '/modules/mod_jmslideshow/assets/js/responsive.js"></script>';
  $jquery_cycle_responsive = 1;
}
print '<script type="text/javascript" src="' . JURI::base(true) . '/modules/mod_jmslideshow/assets/js/ios6fix.js"></script>';
if ($jm_auto == 1) {
  $jm_timeout = $timeout;
} else {
  $jm_timeout = 0;
}
if ($jm_pause_onhover == 0) {
  $jm_pause_onhover = 'false';
} else {
  $jm_pause_onhover = 'true';
}
$pager_css = "";
if ($jm_pager_position == 'bottomleft') {
  $pager_css .= "left:{$jm_pager_left}px;";
  $pager_css .= "bottom:{$jm_pager_bottom}px";
} elseif ($jm_pager_position == 'bottomright') {
  $pager_css .= "right:{$jm_pager_right}px;";
  $pager_css .= "bottom:{$jm_pager_bottom}px";
} elseif ($jm_pager_position == 'topleft') {
  $pager_css .= "top:{$jm_pager_top}px;";
  $pager_css .= "left:{$jm_pager_left}px";
} elseif ($jm_pager_position == 'topright') {
  $pager_css .= "top:{$jm_pager_top}px;";
  $pager_css .= "right:{$jm_pager_right}px";
}
if ($jquery_cycle_tile_load != 1 && in_array($jm_effect, array('tileSlide', 'tileBlind'))) {
  print '<script type="text/javascript" src="' . JURI::base(true) . '/modules/mod_jmslideshow/assets/js/jquery.cycle2.tile.js"></script>';
  $jquery_cycle_tile_load = 1;
}
//Caption
$caption_css = "";
if ($jm_caption_position == 'bottomleft') {
  $caption_css .= "left:{$jm_caption_left}px;";
  $caption_css .= "bottom:{$jm_caption_bottom}px";
} elseif ($jm_caption_position == 'bottomright') {
  $caption_css .= "right:{$jm_caption_right}px;";
  $caption_css .= "bottom:{$jm_caption_bottom}px";
} elseif ($jm_caption_position == 'topleft') {
  $caption_css .= "top:{$jm_caption_top}px;";
  $caption_css .= "left:{$jm_caption_left}px";
} elseif ($jm_caption_position == 'topright') {
  $caption_css .= "top:{$jm_caption_top}px;";
  $caption_css .= "right:{$jm_caption_right}px";
}
$slider_source = $params->get('slider_source',1);
if($slider_source == 9){
  $jm_show_title = null;
  $jm_show_desc =null;
  $jm_show_readmore = null;
}
?>
<style type="text/css">
  #jmslideshow-<?php print $module->id; ?>{
    <?php if ($jm_responsive == 0): ?>
      width: <?php print $jm_width; ?>px;
    <?php else: ?>
      width: 100%;
    <?php endif; ?>
  }
  #jmslideshow-<?php print $module->id; ?> img{
    width: 100%; 
    height: auto;
    max-height: <?php print $params->get('jmslideshow_image_width'); ?>px;
  }
</style>
<!--[if lte IE 8]>
<style type="text/css">#jmslideshow-<?php print $module->id; ?> .jmslide-item{background:none !important;}</style>
<![endif]-->
<div id="jmslideshow">
<div id="jmslideshow-inner">
<div id="jmslideshow-<?php print $module->id; ?>"
     class="cycle-slideshow jmslideshow"
     data-cycle-fx="<?php print $jm_effect; ?>"
     data-cycle-pause-on-hover="<?php print $jm_pause_onhover; ?>"
     data-cycle-speed="<?php print $jm_speed; ?>"
     data-cycle-timeout="<?php print $jm_timeout; ?>"
     data-cycle-swipe="true"
     <?php if ($jm_show_nav_buttons): ?>
       data-cycle-prev="#jmslideshow-<?php print $module->id; ?> .cycle-prev" 
       data-cycle-next="#jmslideshow-<?php print $module->id; ?> .cycle-next" 
     <?php endif; ?>
     data-cycle-slides="> div.jmslide-item"
     <?php if($jmslideshow_pager_type == 2):?>
     data-cycle-pager-template="<span><a href=#> {{slideNum}} </a></span>"
     <?php endif;?>>
     <?php if (empty($slides)): ?>
      There are no slide to show, Please make sure you have configured SlideShow correctly.
    <?php else: ?>
    <?php foreach ($slides as $slide): ?>
      <div class="jmslide-item">
        <img class="jmslide-img" src="<?php print $slide->getMainImage(); ?>"/>
        <?php if ($jm_show_title || $jm_show_desc || $jm_show_readmore) { ?>
          <div  class="slideshow-content<?php if ($jmslideshow_caption_hidden_mobile) print " jmhidden-mobile"; ?>" style="<?php print 'width:' . $jm_caption_width . 'px; ' . $caption_css; ?>">
            <?php if ($jm_show_title) { ?><h3><?php print $slide->title; ?></h3><?php } ?>
            <?php if ($jm_show_desc) { ?><p><?php print $slide->description; ?></p><?php } ?>
            <?php if ($jm_show_readmore) { ?><p><a href="<?php print $slide->link; ?>"><?php print $jm_readmore_text; ?></a></p><?php } ?>
          </div>
        <?php } ?>
      </div>
    <?php endforeach; ?>
  <?php endif; ?>
  <?php if ($jm_show_pager): ?>
    <div class="cycle-pager<?php if ($jmslideshow_pager_hidden_mobile) print " jmhidden-mobile"; ?><?php if($jmslideshow_pager_type ==2) print " pager-number";?>" style="<?php print $pager_css; ?>"></div>
  <?php endif; ?>
  <?php if ($jm_show_nav_buttons): ?>
    <a href="#" class="cycle-prev<?php if ($jmslideshow_control_hidden_mobile) print " jmhidden-mobile"; ?>"><span>Prev</span></a>
    <a href="#" class="cycle-next<?php if ($jmslideshow_control_hidden_mobile) print " jmhidden-mobile"; ?>"><span>Next</span></a> 
  <?php endif; ?>
</div>
</div>
</div>