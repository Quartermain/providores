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
jQuery(document).ready(function(){
  //Slider source
  //jQuery('#jform_params___field1-lbl').parent().hide();
    
  JMSlideShow_ReadMoreChange(jQuery('#jform_params_jmslideshow_show_readmore:checked').val());
  JMSlideShow_ResponsiveChange(jQuery('[id^=jform_params_jmslideshow_responsive]:checked').val());
  JMSlideShow_AutoChange(jQuery('#jform_params_jmslideshow_auto').val());
  JMSlideShow_PagerChange(jQuery('#jform_params_jmslideshow_pager_position').val());
  JMSlideShow_CaptionChange(jQuery('#jform_params_jmslideshow_caption_position').val());
  JMSlideShow_SourceChange(jQuery('#jform_params_slider_source').val());
  JMSlideShow_title_toggle();
  JMSlideShow_desc_toggle();
  jQuery('#jform_params_slider_source').change(function(){
    JMSlideShow_SourceChange(jQuery(this).val());
  });
  jQuery('#jform_params_jmslideshow_show_readmore').change(function(){
    JMSlideShow_ReadMoreChange(jQuery(this).is(':checked'));
  });
  jQuery('[id^=jform_params_jmslideshow_responsive]').click(function(){
    JMSlideShow_ResponsiveChange(jQuery(this).val());
  });
  jQuery('#jform_params_jmslideshow_auto').change(function(){
    JMSlideShow_AutoChange(jQuery(this).val());
  });
  jQuery('#jform_params_jmslideshow_pager_position').change(function(){
    JMSlideShow_PagerChange(jQuery(this).val());
  });
  jQuery('#jform_params_jmslideshow_caption_position').change(function(){
    JMSlideShow_CaptionChange(jQuery(this).val());
  });
  jQuery('#jform_params_jmslideshow_show_title').change(function(){
    JMSlideShow_title_toggle();
  });
  jQuery('#jform_params_jmslideshow_show_desc').change(function(){
    JMSlideShow_desc_toggle();
  });
})
function JMSlideShow_SourceChange(source){
  jQuery(".s1, .s2, .s3, .s4, .s5, .s6, .s7, .s8, .s9").not(".s"+source).parents('.control-group').css({
    display:'none'
  });
  jQuery(".s"+source).parents('.control-group').css({
    display:'block'
  });
  return true;
}
function JMSlideShow_ReadMoreChange(source){
  if(source){
    jQuery('#jform_params_jmslideshow_readmore_text').parents('.control-group').css({
      display:'block'
    });
  }else{       
    jQuery('#jform_params_jmslideshow_readmore_text').parents('.control-group').css({
      display:'none'
    });
  }
}
function JMSlideShow_ResponsiveChange(source){
  switch(source){
    case '0':
      jQuery('#jform_params_jmslideshow_width').parents('.control-group').css({
        display:'block'
      });
      break;
    case '1':
      jQuery('#jform_params_jmslideshow_width').parents('.control-group').css({
        display:'none'
      });
      break;
  }
}
function JMSlideShow_AutoChange(source){
  switch(source){
    case '1':
      jQuery('#jform_params_jmslideshow_timeout').parents('.control-group').css({
        display:'block'
      });
      break;
    case '0':
      jQuery('#jform_params_jmslideshow_timeout').parents('.control-group').css({
        display:'none'
      });
      break;
  }
}
function JMSlideShow_PagerChange(source){
  switch(source){
    case 'topleft':
      jQuery('#jform_params_jmslideshow_pager_left').parents('.control-group').css({
        display:'block'
      });
      jQuery('#jform_params_jmslideshow_pager_top').parents('.control-group').css({
        display:'block'
      });
      jQuery('#jform_params_jmslideshow_pager_bottom').parents('.control-group').css({
        display:'none'
      });
      jQuery('#jform_params_jmslideshow_pager_right').parents('.control-group').css({
        display:'none'
      });
      break;
    case 'topright':
      jQuery('#jform_params_jmslideshow_pager_left').parents('.control-group').css({
        display:'none'
      });
      jQuery('#jform_params_jmslideshow_pager_top').parents('.control-group').css({
        display:'block'
      });
      jQuery('#jform_params_jmslideshow_pager_bottom').parents('.control-group').css({
        display:'none'
      });
      jQuery('#jform_params_jmslideshow_pager_right').parents('.control-group').css({
        display:'block'
      });
      break;
    case 'bottomleft':
      jQuery('#jform_params_jmslideshow_pager_left').parents('.control-group').css({
        display:'block'
      });
      jQuery('#jform_params_jmslideshow_pager_top').parents('.control-group').css({
        display:'none'
      });
      jQuery('#jform_params_jmslideshow_pager_bottom').parents('.control-group').css({
        display:'block'
      });
      jQuery('#jform_params_jmslideshow_pager_right').parents('.control-group').css({
        display:'none'
      });
      break;
    case 'bottomright':
      jQuery('#jform_params_jmslideshow_pager_left').parents('.control-group').css({
        display:'none'
      });
      jQuery('#jform_params_jmslideshow_pager_top').parents('.control-group').css({
        display:'none'
      });
      jQuery('#jform_params_jmslideshow_pager_bottom').parents('.control-group').css({
        display:'block'
      });
      jQuery('#jform_params_jmslideshow_pager_right').parents('.control-group').css({
        display:'block'
      });
      break;
  }
}

function JMSlideShow_CaptionChange(source){
  switch(source){
    case 'topleft':
      jQuery('#jform_params_jmslideshow_caption_left').parents('.control-group').css({
        display:'block'
      });
      jQuery('#jform_params_jmslideshow_caption_top').parents('.control-group').css({
        display:'block'
      });
      jQuery('#jform_params_jmslideshow_caption_bottom').parents('.control-group').css({
        display:'none'
      });
      jQuery('#jform_params_jmslideshow_caption_right').parents('.control-group').css({
        display:'none'
      });
      break;
    case 'topright':
      jQuery('#jform_params_jmslideshow_caption_left').parents('.control-group').css({
        display:'none'
      });
      jQuery('#jform_params_jmslideshow_caption_top').parents('.control-group').css({
        display:'block'
      });
      jQuery('#jform_params_jmslideshow_caption_bottom').parents('.control-group').css({
        display:'none'
      });
      jQuery('#jform_params_jmslideshow_caption_right').parents('.control-group').css({
        display:'block'
      });
      break;
    case 'bottomleft':
      jQuery('#jform_params_jmslideshow_caption_left').parents('.control-group').css({
        display:'block'
      });
      jQuery('#jform_params_jmslideshow_caption_top').parents('.control-group').css({
        display:'none'
      });
      jQuery('#jform_params_jmslideshow_caption_bottom').parents('.control-group').css({
        display:'block'
      });
      jQuery('#jform_params_jmslideshow_caption_right').parents('.control-group').css({
        display:'none'
      });
      break;
    case 'bottomright':
      jQuery('#jform_params_jmslideshow_caption_left').parents('.control-group').css({
        display:'none'
      });
      jQuery('#jform_params_jmslideshow_caption_top').parents('.control-group').css({
        display:'none'
      });
      jQuery('#jform_params_jmslideshow_caption_bottom').parents('.control-group').css({
        display:'block'
      });
      jQuery('#jform_params_jmslideshow_caption_right').parents('.control-group').css({
        display:'block'
      });
      break;
  }
}
function JMSlideShow_title_toggle(){
  if(jQuery('#jform_params_jmslideshow_show_title').attr('checked')){
    jQuery('#jform_params_jmslideshow_title_link').parents('.control-group').css({
      display:'block'
    });
  }else{
    jQuery('#jform_params_jmslideshow_title_link').parents('.control-group').css({
      display:'none'
    });
  }
}
function JMSlideShow_desc_toggle(){
  if(jQuery('#jform_params_jmslideshow_show_desc').attr('checked')){
    jQuery('#jform_params_jmslideshow_desc_length').parents('.control-group').css({
      display:'block'
    });
    jQuery('#jform_params_jmslideshow_desc_html').parents('.control-group').css({
      display:'block'
    });
  }else{
    jQuery('#jform_params_jmslideshow_desc_length').parents('.control-group').css({
      display:'none'
    });
    jQuery('#jform_params_jmslideshow_desc_html').parents('.control-group').css({
      display:'none'
    });
  }
}