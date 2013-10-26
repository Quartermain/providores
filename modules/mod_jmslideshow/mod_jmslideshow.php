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
global $jquery_cycle_load;
if (!defined('DS'))
    define('DS', '/');
if (!defined('JM_SLIDESHOW_IMAGE_FOLDER')) {
    define('JM_SLIDESHOW_IMAGE_FOLDER', JPATH_SITE . DS . 'media' . DS . 'mod_jmslideshow');
}
if (!defined('JM_SLIDESHOW_IMAGE_PATH')) {
    define('JM_SLIDESHOW_IMAGE_PATH', JURI::base(true) . '/media/mod_jmslideshow');
}
if (!file_exists(JM_SLIDESHOW_IMAGE_FOLDER)) {
    @mkdir(JM_SLIDESHOW_IMAGE_FOLDER, 0755) or die('The folder "'. JPATH_SITE . DS . 'media" is not writeable, please change the permission');
}
if (!class_exists('JMSlide')) {
    require_once JPATH_SITE . DS . 'modules' . DS . 'mod_jmslideshow' . DS . 'classes' . DS . 'slide.php';
}
// Include the syndicate functions only once
require_once (dirname(__file__) . DS . 'helper.php');
$module_id = $module->id;
$slides = modJmSlideshowHelper::getSlides($params);
$doc = JFactory::getDocument();
$app = JFactory::getApplication();
$custom_css = JPATH_SITE . '/templates/' . modJmSlideshowHelper::getTemplate() . '/css/' . $module->module.'_'.$params->get('jmslideshow_layout', 'default') . '.css';
if (file_exists($custom_css)) {
    $doc->addStylesheet(JURI::base(true) . '/templates/' . modJmSlideshowHelper::getTemplate() . '/css/' . $module->module.'_'.$params->get('jmslideshow_layout', 'default') . '.css');
} else {
    $doc->addStylesheet(JURI::base(true) . '/modules/mod_jmslideshow/assets/css/mod_jmslideshow_'.$params->get('jmslideshow_layout', 'default').'.css');
}
if ($params->get('jmslideshow_include_jquery', 0) == 1) {
    $doc->addScript(JURI::base(true) . '/modules/mod_jmslideshow/assets/js/jquery.js');
}
$jm_responsive = $params->get('jmslideshow_responsive', 1);
$jm_width = $params->get('jmslideshow_width', 1);
$jm_speed = $params->get('jmslideshow_speed', 500);
$jm_auto = $params->get('jmslideshow_auto', 1);
$timeout = $params->get('jmslideshow_timeout', 0);
$jm_effect = $params->get('jmslideshow_effect', 'fade');
$jm_pause_onhover = $params->get('jmslideshow_pause_onhover', 0);
$jm_show_nav_buttons = $params->get('jmslideshow_show_nav_buttons', 0);
$jm_caption_width = $params->get('jmslideshow_caption_width', 500);
$jm_show_title = $params->get('jmslideshow_show_title', 0);
$jm_show_desc = $params->get('jmslideshow_show_desc', 0);
$jm_show_readmore = $params->get('jmslideshow_show_readmore', 0);
$jm_readmore_text = $params->get('jmslideshow_readmore_text', 'Read more');
$jm_show_pager = $params->get('jmslideshow_show_pager', 0);
$jmslideshow_caption_hidden_mobile = $params->get('jmslideshow_caption_hidden_mobile', 0);
$jmslideshow_pager_hidden_mobile = $params->get('jmslideshow_pager_hidden_mobile', 0);
$jmslideshow_control_hidden_mobile = $params->get('jmslideshow_control_hidden_mobile', 0);
$jm_pager_position = $params->get('jmslideshow_pager_position', 'bottomleft');
$jm_pager_top = $params->get('jmslideshow_pager_top', 30);
$jm_pager_left = $params->get('jmslideshow_pager_left', 30);
$jm_pager_right = $params->get('jmslideshow_pager_right', 30);
$jm_pager_bottom = $params->get('jmslideshow_pager_bottom', 30);
$jm_caption_position = $params->get('jmslideshow_caption_position', 'topleft');
$jm_caption_top = $params->get('jmslideshow_caption_top', 30);
$jm_caption_left = $params->get('jmslideshow_caption_left', 30);
$jm_caption_right = $params->get('jmslideshow_caption_right', 30);
$jm_caption_bottom = $params->get('jmslideshow_caption_bottom', 30);
$jmslideshow_pager_type = $params->get("jmslideshow_pager_type",1);
global $jm_jquery_autoload;
if($params->get('jmslideshow_include_jquery')==2 && empty($jm_jquery_autoload)):?>
<script type="text/javascript">
var jQueryScriptOutputted = false;
function JMInitJQuery() {    
  if (typeof(jQuery) == 'undefined') {   
    if (! jQueryScriptOutputted) {
      jQueryScriptOutputted = true;
      document.write("<scr" + "ipt type=\"text/javascript\" src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js\"></scr" + "ipt>");
    }
    setTimeout("JMInitJQuery()", 50);
  }         
}
JMInitJQuery();
</script>
<?php
$jm_jquery_autoload = 1;
endif;
require JModuleHelper::getLayoutPath('mod_jmslideshow', $params->get('jmslideshow_layout', 'default'));