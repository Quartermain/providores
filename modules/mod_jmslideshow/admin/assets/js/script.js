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
  jQuery('#jform_params___field1-lbl').parent().hide();
  JMSlideShow_ReadMoreChange(jQuery('#jform_params_jmslideshow_show_readmore:checked').val());
  JMSlideShow_ResponsiveChange(jQuery('[id^=jform_params_jmslideshow_responsive]:checked').val());
  JMSlideShow_AutoChange(jQuery('#jform_params_jmslideshow_auto').val());
  JMSlideShow_PagerChange(jQuery('#jform_params_jmslideshow_pager_position').val());
  JMSlideShow_CaptionChange(jQuery('#jform_params_jmslideshow_caption_position').val());
  JMSlideShow_title_toggle();
  JMSlideShow_desc_toggle();
  JMSlideShow_SourceChange(jQuery('#jform_params_slider_source').val());
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
  jQuery(".s1, .s2, .s3, .s4, .s5, .s6, .s7, .s8, .s9").not(".s"+source).parents('li').css({
    display:'none'
  });
  jQuery(".s"+source).parents('li').css({
    display:'block'
  });
  return true;
}
function ShowOption(){
  return false;
  jQuery('#jform_params_jmslideshow_caption_position').parent().css({
    display:'block'
  });
  jQuery('#jform_params_jmslideshow_caption_left').parent().css({
    display:'block'
  });
  jQuery('#jform_params_jmslideshow_caption_top').parent().css({
    display:'block'
  });
  jQuery('#jform_params_jmslideshow_caption_right').parent().css({
    display:'block'
  });
  jQuery('#jform_params_jmslideshow_caption_bottom').parent().css({
    display:'block'
  });
  jQuery('#jform_params_jmslideshow_caption_width').parent().css({
    display:'block'
  });
  jQuery('#jform_params_jmslideshow_show_title').parent().css({
    display:'block'
  });
  jQuery('#jform_params_jmslideshow_title_link').parent().css({
    display:'block'
  });
  jQuery('#jform_params_jmslideshow_show_desc').parent().css({
    display:'block'
  });
  jQuery('#jform_params_jmslideshow_desc_length').parent().css({
    display:'block'
  });
	
  jQuery('#jform_params_jmslideshow_show_readmore').parent().css({
    display:'block'
  });
	
  jQuery('#jform_params_jmslideshow_ordering').parent().css({
    display:'block'
  });
  jQuery('#jform_params_jmslideshow_orderby').parent().css({
    display:'block'
  });
}
function JMSlideShow_ReadMoreChange(source){
  if(source){
    jQuery('#jform_params_jmslideshow_readmore_text').parent().css({
      display:'block'
    });
  }else{       
    jQuery('#jform_params_jmslideshow_readmore_text').parent().css({
      display:'none'
    });
  }
}
function JMSlideShow_ResponsiveChange(source){
  switch(source){
    case '0':
      jQuery('#jform_params_jmslideshow_width').parent().css({
        display:'block'
      });
      break;
    case '1':
      jQuery('#jform_params_jmslideshow_width').parent().css({
        display:'none'
      });
      break;
  }
}
function JMSlideShow_AutoChange(source){
  switch(source){
    case '1':
      jQuery('#jform_params_jmslideshow_timeout').parent().css({
        display:'block'
      });
      break;
    case '0':
      jQuery('#jform_params_jmslideshow_timeout').parent().css({
        display:'none'
      });
      break;
  }
}
function JMSlideShow_PagerChange(source){
  switch(source){
    case 'topleft':
      jQuery('#jform_params_jmslideshow_pager_left').parent().css({
        display:'block'
      });
      jQuery('#jform_params_jmslideshow_pager_top').parent().css({
        display:'block'
      });
      jQuery('#jform_params_jmslideshow_pager_bottom').parent().css({
        display:'none'
      });
      jQuery('#jform_params_jmslideshow_pager_right').parent().css({
        display:'none'
      });
      break;
    case 'topright':
      jQuery('#jform_params_jmslideshow_pager_left').parent().css({
        display:'none'
      });
      jQuery('#jform_params_jmslideshow_pager_top').parent().css({
        display:'block'
      });
      jQuery('#jform_params_jmslideshow_pager_bottom').parent().css({
        display:'none'
      });
      jQuery('#jform_params_jmslideshow_pager_right').parent().css({
        display:'block'
      });
      break;
    case 'bottomleft':
      jQuery('#jform_params_jmslideshow_pager_left').parent().css({
        display:'block'
      });
      jQuery('#jform_params_jmslideshow_pager_top').parent().css({
        display:'none'
      });
      jQuery('#jform_params_jmslideshow_pager_bottom').parent().css({
        display:'block'
      });
      jQuery('#jform_params_jmslideshow_pager_right').parent().css({
        display:'none'
      });
      break;
    case 'bottomright':
      jQuery('#jform_params_jmslideshow_pager_left').parent().css({
        display:'none'
      });
      jQuery('#jform_params_jmslideshow_pager_top').parent().css({
        display:'none'
      });
      jQuery('#jform_params_jmslideshow_pager_bottom').parent().css({
        display:'block'
      });
      jQuery('#jform_params_jmslideshow_pager_right').parent().css({
        display:'block'
      });
      break;
  }
}
//caption
function JMSlideShow_CaptionChange(source){
  switch(source){
    case 'topleft':
      jQuery('#jform_params_jmslideshow_caption_left').parent().css({
        display:'block'
      });
      jQuery('#jform_params_jmslideshow_caption_top').parent().css({
        display:'block'
      });
      jQuery('#jform_params_jmslideshow_caption_bottom').parent().css({
        display:'none'
      });
      jQuery('#jform_params_jmslideshow_caption_right').parent().css({
        display:'none'
      });
      break;
    case 'topright':
      jQuery('#jform_params_jmslideshow_caption_left').parent().css({
        display:'none'
      });
      jQuery('#jform_params_jmslideshow_caption_top').parent().css({
        display:'block'
      });
      jQuery('#jform_params_jmslideshow_caption_bottom').parent().css({
        display:'none'
      });
      jQuery('#jform_params_jmslideshow_caption_right').parent().css({
        display:'block'
      });
      break;
    case 'bottomleft':
      jQuery('#jform_params_jmslideshow_caption_left').parent().css({
        display:'block'
      });
      jQuery('#jform_params_jmslideshow_caption_top').parent().css({
        display:'none'
      });
      jQuery('#jform_params_jmslideshow_caption_bottom').parent().css({
        display:'block'
      });
      jQuery('#jform_params_jmslideshow_caption_right').parent().css({
        display:'none'
      });
      break;
    case 'bottomright':
      jQuery('#jform_params_jmslideshow_caption_left').parent().css({
        display:'none'
      });
      jQuery('#jform_params_jmslideshow_caption_top').parent().css({
        display:'none'
      });
      jQuery('#jform_params_jmslideshow_caption_bottom').parent().css({
        display:'block'
      });
      jQuery('#jform_params_jmslideshow_caption_right').parent().css({
        display:'block'
      });
      break;
  }
}
function JMSlideShow_title_toggle(){
  if(jQuery('#jform_params_jmslideshow_show_title').attr('checked')){
    jQuery('#jform_params_jmslideshow_title_link').parents('li').css({
      display:'block'
    });
  }else{
    jQuery('#jform_params_jmslideshow_title_link').parents('li').css({
      display:'none'
    });
  }
}
function JMSlideShow_desc_toggle(){
  if(jQuery('#jform_params_jmslideshow_show_desc').attr('checked')){
    jQuery('#jform_params_jmslideshow_desc_length').parents('li').css({
      display:'block'
    });
    jQuery('#jform_params_jmslideshow_desc_html').parents('li').css({
      display:'block'
    });
  }else{
    jQuery('#jform_params_jmslideshow_desc_length').parents('li').css({
      display:'none'
    });
    jQuery('#jform_params_jmslideshow_desc_html').parents('li').css({
      display:'none'
    });
  }
}