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

// load js and css files.
JHTML::_('behavior.framework', true);

// Include the syndicate functions only once
require_once (dirname(__FILE__).'/helper.php');
require_once (dirname(__FILE__).'/jaimage.php');

$moduleID     	= 'jasd-modid' . $module->id;
$titleMaxChars 	= (int) $params->get( 'title_max_chars', 60 );
$descMaxChars 	=  (int) $params->get( 'maxchars', 60 );

$autoresize 	= 	intval (trim( $params->get( 'autoresize', 0) ));
$iwidth 		= 	intval (trim( $params->get( 'iwidth', 152 ) ));
$iheight 		= 	intval (trim( $params->get( 'iheight', 200 ) ));
$sidemode 	    = $params->get( 'layout-sidenews-element_apply_side', 'content' );

$expheight 		= intval($params->get('layout-sidenews-play_mode-caption-expandheight', 150)); 
$colheight 		= intval($params->get('layout-sidenews-play_mode-caption-collapseheight', 30));
$showimage 		= $params->get('layout-default-showimage', 1);
$showdate       = $params->get('layout-default-showdate', 1);
$showMoredetail = $params->get('layout-default-show_moredetail', 1);
$height 	    = intval($params->get('layout-sidenews-height', 200));
$layout 		= $params->get( 'layout', 'default' );
$color 			= $params->get('layout-sidenews-textcolor', '#FFFFFF');
$color = '#'.str_replace('#', '', $color);
$color = " color:{$color};";
$playMode 		= $params->get('layout-sidenews-play_mode', 'caption'); 
$bgcolor 		= $params->get('layout-sidenews-bgcolor', '#4F4F4F');
$bgcolor = '#'.str_replace('#', '', $bgcolor);
$bgcolor = " background-color:{$bgcolor};";
$trans 			= intval($params->get('layout-sidenews-transparent', 80));

$thumbnailMode = $params->get( 'thumbnail_mode', 'crop' );
$aspect 	   = $params->get( 'thumbnail_mode-resize-use_ratio', '1' );
$crop = $thumbnailMode == 'crop' ? true:false;
$lists = array ();
$jaimage = JAImage::getInstance();


if( $layout ==-1 ){	
	$layout = 'default';
}

include_once(dirname(__FILE__).'/asset/asset.php');

// get instance.
$source = $params->get('using_mode', 'article');

$helper = modJASildeNewsHelper::getInstance();

$list = $helper->callMethod("getList" . ucfirst($source), $params);

if( $layout == 'sidenews' || $layout == "sidenews.php" ):
	$layout = str_replace('.php', '', $layout .'_'. $sidemode);
	
	require(JModuleHelper::getLayoutPath( 'mod_jasidenews',  $layout));
?>

<script type="text/javascript">
//$(window).addEvent( 'load', function(){
	var options = { 	wrapperId:"ja-sidenews-<?php echo $moduleID; ?>", 
						mode:'<?php echo $playMode;?>',
						start:<?php echo $colheight; ?>,
						end:<?php echo $expheight; ?>,
						fullsize:<?php echo ($playMode=='caption'? 0: 1);?>,
						opacity:<?php echo $trans; ?>,
						fxOptions:{transition:<?php echo $params->get('layout-sidenews-animation_transition', 'Fx.Transitions.Expo.easeOut'); ?>}	
		 };
		var demo = new JaSlidingBox( options );	
//});
</script>
<?php
else:
	require(JModuleHelper::getLayoutPath( 'mod_jasidenews', 'default' ));
endif;
