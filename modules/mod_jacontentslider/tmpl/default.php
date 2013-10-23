<?php
/**
 * ------------------------------------------------------------------------
 * JA Content Slider Module for J25 & J31
 * ------------------------------------------------------------------------
 * Copyright (C) 2004-2011 J.O.O.M Solutions Co., Ltd. All Rights Reserved.
 * @license - GNU/GPL, http://www.gnu.org/licenses/gpl.html
 * Author: J.O.O.M Solutions Co., Ltd
 * Websites: http://www.joomlart.com - http://www.joomlancers.com
 * ------------------------------------------------------------------------
 */

// no direct access
defined('_JEXEC') or die('Restricted access');

if ($total):
    $mainframe = JFactory::getApplication();
    $tmplPath = 'templates/' . $mainframe->getTemplate() . '/';
    $tmplimages = $tmplPath . 'images/';
    $modPath = 'modules/mod_jacontentslider/assets/images/';
    //Images
    $image_path = $modPath;
    if (file_exists(JPATH_SITE . '/' . $tmplimages . 're-left.gif')) {
        $image_path = $tmplimages;
    }
    $image_path = str_replace('\\', '/', $image_path);

    $cateArr = array();
    foreach ($contents as $contn) {
        if (isset($contn->cateName) && !isset($cateArr[$contn->catid])) {
            $cateArr[$contn->catid] = $contn->cateName;
        }
    }
    if (!$showTab || count($cateArr) <= 1) {
        //if not display tabs
        //we must show all items of All Categories on one tab
        $firstCid = 0;
    } else {
        $firstCid = array_keys($cateArr);
        $firstCid = $firstCid[0];
    }
    ?>
<script type="text/javascript">
	//<!--[CDATA[
	function contentSliderInit_<?php echo $module->id;?> (cid) {
		cid = parseInt(cid);
		var containerID = 'ja-contentslider-<?php echo $module->id;?>';
		var container =  $(containerID);

		container.getElements('.jsslide').each(function(el){
			el.dispose();
		});

		if(cid == 0) {
			var elems = $('ja-contentslider-center-<?php echo $module->id;?>').getElements('div[class*=content_element]');
		}else{
			var elems = $('ja-contentslider-center-<?php echo $module->id;?>').getElements('div[class*=jaslide2_'+cid+']');
		}
		var total = elems.length;

		var options={
			w: <?php echo $xwidth; ?>,
			h: <?php echo $xheight; ?>,
			num_elem: <?php echo  $numElem; ?>,
			mode: '<?php  echo  $mode; ?>', //horizontal or vertical
			direction: '<?php echo $direction; ?>', //horizontal: left or right; vertical: up or down
			total: total,
			url: '<?php echo JURI::base(); ?>modules/mod_jacontentslider/mod_jacontentslider.php',
			wrapper:  container.getElement("div.ja-contentslider-center"),
			duration: <?php echo $animationtime; ?>,
			interval: <?php echo $delaytime; ?>,
			modid: <?php echo $module->id;?>,
			running: false,
			auto: <?php echo $auto;?>
		};

		var jscontentslider = new JS_ContentSlider( options );

		for(i=0;i<elems.length;i++){
			jscontentslider.update (elems[i].innerHTML, i);
		}
		jscontentslider.setPos(null);
		if(jscontentslider.options.auto){
			jscontentslider.nextRun();
		}

		<?php if( $params->get( 'showbutton' ) || ($params->get( 'showbutton' ) == '') ): ?>
		  <?php if($params->get( 'scroll_when', 'click' ) == 'click'): ?>
			<?php if ($mode == 'vertical'): ?>
			container.getElement(".ja-contentslide-up-img").onclick = function(){setDirection2<?php echo $module->id;?>('down', jscontentslider);};
			container.getElement(".ja-contentslide-down-img").onclick = function(){setDirection2<?php echo $module->id;?>('up', jscontentslider);};
			<?php else: ?>
			container.getElement(".ja-contentslide-left-img").onclick = function(){setDirection2<?php echo $module->id;?>('right', jscontentslider);};
			container.getElement(".ja-contentslide-right-img").onclick = function(){setDirection2<?php echo $module->id;?>('left', jscontentslider);};
			<?php endif; //vertical? ?>
		  <?php else: ?>
			<?php if ($mode == 'vertical'): ?>
			container.getElement(".ja-contentslide-up-img").onmouseover = function(){setDirection<?php echo $module->id;?>('down',0, jscontentslider);};
			container.getElement(".ja-contentslide-up-img").onmouseout = function(){setDirection<?php echo $module->id;?>('down',1, jscontentslider);};
			container.getElement(".ja-contentslide-down-img").onmouseover = function(){setDirection<?php echo $module->id;?>('up',0, jscontentslider);};
			container.getElement(".ja-contentslide-down-img").onmouseout = function(){setDirection<?php echo $module->id;?>('up',1, jscontentslider);};
			<?php else: ?>
			container.getElement(".ja-contentslide-left-img").onmouseover = function(){setDirection<?php echo $module->id;?>('right',0, jscontentslider);};
			container.getElement(".ja-contentslide-left-img").onmouseout = function(){setDirection<?php echo $module->id;?>('right',1, jscontentslider);};
			container.getElement(".ja-contentslide-right-img").onmouseover = function(){setDirection<?php echo $module->id;?>('left',0, jscontentslider);};
			container.getElement(".ja-contentslide-right-img").onmouseout = function(){setDirection<?php echo $module->id;?>('left',1, jscontentslider);};
			<?php endif; //vertical? ?>
		  <?php endif; //scroll event ?>
		<?php endif; //show control? ?>

		/**active tab**/
		if (container.getElement('.ja-button-control')) {
		container.getElement('.ja-button-control').getElements('a').each(function(el){
			var css = (el.getProperty('rel') == cid) ? 'active' : '';
			el.className = css;
		});
		}
	}
	window.addEvent( 'domready', function(){ contentSliderInit_<?php echo $module->id;?>(<?php echo $firstCid; ?>); } );

	function setDirection<?php echo $module->id;?>(direction,ret, jscontentslider) {
		jscontentslider.options.direction = direction;
		
		if(ret){
			jscontentslider.options.auto = <?php echo $auto; ?>;
			jscontentslider.options.interval = <?php echo $delaytime; ?>;
			jscontentslider.options.direction = '<?php echo $direction; ?>';
		}
		else{
			jscontentslider.options.auto = 1;
			jscontentslider.options.interval = 100;
			jscontentslider.nextRun();
			jscontentslider.options.interval = <?php echo $delaytime; ?>;
		}
	}
	
	function setDirection2<?php echo $module->id;?>(direction, jscontentslider) {
		var oldDirection = jscontentslider.options.direction;
		
		jscontentslider.options.direction = direction;
		
		jscontentslider.options.interval = 100;
		jscontentslider.options.auto = 1;
		jscontentslider.nextRun();
		jscontentslider.options.auto = <?php echo $auto; ?>;
		jscontentslider.options.interval = <?php echo $delaytime; ?>;
		
		setTimeout(function(){
			jscontentslider.options.direction = oldDirection;
		}, 510);
	}
	//]]-->
</script>

<div id="ja-contentslider-<?php echo $module->id;?>" class="ja-contentslider<?php echo $params->get( 'moduleclass_sfx' );?> clearfix" >
  <!--toolbar-->
  <?php if( $params->get( 'showbutton' ) || ($params->get( 'showbutton' ) == '') ) : ?>
  <div class="ja-button-control">
    <?php if(!empty($text_heading)): ?>
    <span class="ja-text-heading"><?php echo $text_heading; ?></span>
    <?php endif; ?>
    <?php if(count($cateArr) > 1) : ?>
    <?php if ($showTab == 1): ?>
    <a href="javascript:contentSliderInit_<?php echo $module->id;?>(0)" rel="0"><?php echo JText::_('All'); ?></a>
    <?php foreach ($cateArr as $key=>$value): ?>
    <?php if(!empty($value)): ?>
    <a href="javascript:contentSliderInit_<?php echo $module->id;?>('<?php echo $key;?>')" rel="<?php echo $key;?>"><?php echo $value; ?></a>
    <?php endif; ?>
    <?php endforeach; ?>
    <?php endif; //show tab? ?>
    <?php endif; //if more than one category ?>
     
		<?php if ($mode == 'vertical'){ ?>
			<div class="ja-contentslider-right ja-contentslide-up-img" title="<?php echo JText::_('Next'); ?>">&nbsp;</div>
			<div class="ja-contentslider-left ja-contentslide-down-img" title="<?php echo JText::_('Previous'); ?>">&nbsp;</div>
		<?php } else {?>
			<div class="ja-contentslider-right ja-contentslide-right-img" title="<?php echo JText::_('Next'); ?>">&nbsp;</div>
			<div class="ja-contentslider-left ja-contentslide-left-img" title="<?php echo JText::_('Previous'); ?>">&nbsp;</div>
		<?php } ?>
  </div>
  <?php endif; //show showbutton? ?>

  <!--items-->
  <div class="ja-contentslider-center-wrap clearfix">
    <div id="ja-contentslider-center-<?php echo $module->id;?>" class="ja-contentslider-center">
      <?php
	foreach( $contents  as $contn ) :
		$link = $contn->link;
		$image = $contn->image;
		$show_data = false;
		if (!empty($image)){
			$show_data = true;
		}
		if ($params->get( 'showintrotext' )){
			$show_data = true;
		}
		if ($params->get( 'showtitle' )){
			$show_data = true;
		}
		if ($show_data == true) :
	?>
      <div class="content_element jaslide2_<?php echo $contn->catid; ?>" style="display:none;">
        <?php if( $params->get( 'showtitle' ) ) { ?>
        <div class="ja_slidetitle">
          <?php  echo ($params->get( 'link_titles' ) ) ? '<a href="'.$link.'" title="">'.$contn->title.'</a>' : $contn->title;?>
        </div>
        <?php } ?>
        <?php /* if ($contn->featured == 1) { ?>
	  <span class="featured">&nbsp;</span>
	  <?php } */?>
        <?php if(  $params->get( 'showimages' ) && (strlen($image)>3) ) { ?>
        <div class="ja_slideimages tooltips clearfix">
          <div class="ja_slideimages_inner">
            <div class="content">
              <?php echo $image; ?>
            </div>
          </div>
        </div>
        <?php } ?>
        <?php if(  $params->get( 'showintrotext' ) ) { ?>
        <div class="ja_slideintro"> <?php echo ( $params->get('numchar') ) ? $contn->introtext1 : $contn->introtext; ?> </div>
        <?php } ?>
        <?php if( $params->get('showreadmore') ){ ?>
        <div class="ja-slidereadmore"> <a href="<?php echo $link;?>" class="readon"><?php echo JTEXT::_('READMORE');?></a> </div>
        <?php } // endif;?>
        <?php if (isset($contn->demoUrl) && $contn->demoUrl != '') { ?>
        <div class="ja-slideDemo"> <a href="<?php echo $contn->demoUrl;?>" class="readon"><?php echo $contn->demoUrl;?></a> </div>
        <?php } ?>
      </div>
      <?php
		endif;
	  endforeach; ?>
    </div>
  </div>
</div>
<?php endif; //not total ?>