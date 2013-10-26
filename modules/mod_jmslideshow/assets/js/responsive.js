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
var matched, browser;
jQuery(document).ready(function(){
    jmslideshow_responsive();
    jQuery(window).resize(function(){
        jmslideshow_responsive();
    });
    if(typeof jQuery.browser != 'function'){
        jQuery.uaMatch = function( ua ) {
            ua = ua.toLowerCase();
            var match = /(chrome)[ \/]([\w.]+)/.exec( ua ) ||
            /(webkit)[ \/]([\w.]+)/.exec( ua ) ||
            /(opera)(?:.*version|)[ \/]([\w.]+)/.exec( ua ) ||
            /(msie) ([\w.]+)/.exec( ua ) ||
            ua.indexOf("compatible") < 0 && /(mozilla)(?:.*? rv:([\w.]+)|)/.exec( ua ) ||
            [];
            return {
                browser: match[ 1 ] || "",
                version: match[ 2 ] || "0"
            };
        };
        matched = jQuery.uaMatch( navigator.userAgent );
        browser = {};
        if ( matched.browser ) {
            browser[ matched.browser ] = true;
            browser.version = matched.version;
        }
        // Chrome is Webkit, but Webkit is also Safari.
        if ( browser.chrome ) {
            browser.webkit = true;
        } else if ( browser.webkit ) {
            browser.safari = true;
        }
        jQuery.browser = browser;
    }
    if(jQuery.browser.msie  && parseInt(jQuery.browser.version, 10) === 8) {
        jQuery.each(jQuery('.jmslide-item'), function(i, el){
            var $img = jQuery(el).find('img.jmslide-img').attr('src');
            jQuery(el).css({
                backgroundImage:'url('+$img+')'
            });
        })
    }
})
function jmslideshow_responsive(){
    if(jQuery(window).width() < 768){
        jQuery('.jmhidden-mobile').css({
            display:'none'
        });
    }else{
        jQuery('.jmhidden-mobile').css({
            display:'block'
        });
    }
    jQuery.each(jQuery('.jmslide-item'), function(i, el){
        var $width = jQuery(el).parents('.jmslideshow').width();
        jQuery(el).find('img.jmslide-img').width($width);
    });
}