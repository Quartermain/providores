<?php
/**
 * @package		MijoSearch
 * @copyright	2009-2013 Mijosoft LLC, www.mijosoft.com
 * @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
 * @license		2009-2012 GNU/GPL based on AceSearch www.joomace.net
 */

//No Permision
defined( '_JEXEC' ) or die( 'Restricted access' );
if(empty($this->results)){
    return;
}

?>
<style type="text/css">
#search-results {
        position: absolute;
        margin-top: 2px;
        text-decoration: none;
        z-index: 1000;
        font-size: 12px;
        border: solid 1px;
        border-color:  <?php echo $this->MijosearchConfig->ajax_title_bg; ?>;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
        width: <?php echo $this->MijosearchConfig->ajax_result_width; ?>px;
    }

    #search-results-inner {
        position: relative;
        overflow: hidden;
    }

    #search-results .plugin-title.first {
        -webkit-box-shadow: inset 0px 0px 2px rgba(255, 255, 255, 0.4);
        -moz-box-shadow: inset 0px 0px 2px rgba(255, 255, 255, 0.4);
        box-shadow: inset 0px 0px 2px rgba(255, 255, 255, 0.4);
        -moz-border-radius-topleft: 5px;
        -moz-border-radius-topright: 5px;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
        margin-top: -1px;
    }

    #search-results .plugin-title {
        -webkit-box-shadow: inset 0px 0px 2px rgba(255, 255, 255, 0.4);
        -moz-box-shadow: inset 0px 0px 2px rgba(255, 255, 255, 0.4);
        box-shadow: inset 0px 0px 2px rgba(255, 255, 255, 0.4);
        line-height: 26px;
        font-size: 14px;
        background: <?php echo $this->MijosearchConfig->ajax_title_bg; ?>;
        background-size: auto 100%;
        text-align: left;
        border-top: 1px solid #e5e5e5;
        border-bottom: 1px solid #c2d5e1;
        font-weight: bold;
        margin: 0;
        padding: 0;
    }

    #search-results .plugin-title-inner {
        -moz-user-select: none;
        padding-left: 10px;
        padding-right: 5px;
        float: left;
        cursor: default;
        color: #4E6170;
        font-family: "Arimo", Arial;
        font-weight: bold;
        font-style: normal;
        font-size: 11px;
        text-shadow: #ffffff 1px 1px 0px;
        text-decoration: none;
        text-transform: 27px;
        line-height: left;
        text-align: center;
    }

    .ajax-clear {
        clear: both;
    }

    #search-results .page-container {
        position: relative;
        overflow: hidden;
        background: none repeat scroll 0 0 <?php echo $this->MijosearchConfig->ajax_bg_color; ?>;
    }

    #search-results .result-element {
        display: block;
        font-weight: bold;
        border-top: 1px solid #e5e5e5;
        border-bottom: 1px solid #c2d5e1;
        overflow: hidden;
        min-height: 65px;
        text-decoration: none;
		float:none;
    }

    #search-results .result-element img {
        display: block;
        float: <?php echo str_replace('_','',$this->MijosearchConfig->ajax_image_positions); ?>;
        padding: 2px;
        padding-right: 10px;
        border: 0;
        width: <?php echo $this->MijosearchConfig->ajax_image_sizew; ?>px;
        height: <?php echo $this->MijosearchConfig->ajax_image_sizeh; ?>px;
    }

    #search-results .result-element span.small-desc {
        margin-top: 2px;
        font-weight: normal;
        line-height: 13px;
        color: #7794aa;
        font-size: 11px;
    }

    #search-results .result-element span {
        display: block;
        margin-left: 5px;
        margin-right: 12px;
        line-height: 14px;
        text-align: left;
        cursor: pointer;
        margin-top: 5px;
        color: <?php echo $this->MijosearchConfig->ajax_title_color; ?>;
        font-family: "Arimo", Arial;
        font-weight: bold;
        font-style: normal;
        font-size: 12px;
        text-shadow: none;
        text-decoration: none;
        text-transform: none;
        line-height: left;
    }

    #search-results #search-results-inner .result-element:hover span.small-desc, #search-results #search-results-inner .selected-element span.small-desc {
        color: <?php echo $this->MijosearchConfig->ajax_desc_color_hover; ?>;;
        font-family: "Arimo", Arial, Helvetica;
        font-weight: normal;
        font-style: normal;
        font-size: 11px;
        text-shadow: none;
        text-decoration: none;
        text-transform: none;
        line-height: left;
    }

    #search-results #search-results-inner .result-element:hover span, #search-results #search-results-inner .selected-element span {
        color: <?php echo $this->MijosearchConfig->ajax_title_color_hover; ?>;
        font-family: "Arimo", Arial, Helvetica;
        font-weight: bold;
        font-style: normal;
        font-size: 12px;
        text-shadow: none;
        text-decoration: none;
        text-transform: none;
        line-height: left;
    }

    #search-results #search-results-inner .result-element:hover {
        text-decoration: none;
        background: <?php echo $this->MijosearchConfig->ajax_bg_color_hover; ?>;
        background-size: auto 100%;
        border-top: none;
        padding-top: 1px;
    }

    #more-result{
        width: <?php echo ((int)$this->MijosearchConfig->ajax_result_width - 30); ?>px;
    }

    .closeajax{
        float: right;
        margin-right: 10px;
    }

    .closeajax:hover{
        cursor: pointer
    }
	
	.more {
        margin-top: 0;
        width: <?php echo ((int)$this->MijosearchConfig->ajax_result_width - 2); ?>px !important;
        background: -webkit-gradient(linear,0% 0,0% 100%,from(#e6eaf2),to(#a2acbf));
        background: -moz-linear-gradient(top, #e6eaf2 0%, #a2acbf 100%);
        border-top: 1px solid #a3b1cc;
        border-right: 1px solid #8f9bb3;
        border-bottom: 1px solid #666f80;
        border-left: 1px solid #8f9bb3;
        -moz-border-radius: 4px;
        -webkit-border-radius: 4px;
        border-radius: 4px;
        -moz-box-shadow: inset 0 1px 0 0 rgba(255,255,255,.5),0 1px 2px 0 rgba(0,0,0,.1);
        -webkit-box-shadow: inset 0 1px 0 0 rgba(255,255,255,.5),0 1px 2px 0 rgba(0,0,0,.1);
        box-shadow: inset 0 1px 0 0 rgba(255,255,255,.5),0 1px 2px 0 rgba(0,0,0,.1);
        color: #292c33;
        display: inline-block;
        font-weight: bold;
        line-height: 2em;
        overflow: hidden;
        padding: 0;
        text-align: center;
        text-decoration: none;
        text-overflow: ellipsis;
        text-shadow: 0 1px 0 rgba(255,255,255,.5);

    }

    .more:hover {
        background: #3282d3;
        border: 1px solid #154c8c;
        border-bottom: 1px solid #0e408e;
        -moz-box-shadow: inset 0 0 2px 1px #1657b5,0 1px 0 0 #fff;
        -webkit-box-shadow: inset 0 0 2px 1px #1657b5,0 1px 0 0 #fff;
        box-shadow: inset 0 0 2px 1px #1657b5,0 1px 0 0 #fff;
        color: #FFF;
        text-decoration: none;
        text-shadow: 0 -1px 1px #2361a4;
        cursor: pointer;
    }

</style>

<div id="search-results">
    <div id="search-results-inner" class="withoutseemore">
        <div class="plugin-title first">
            <div class="plugin-title-inner"><?php echo JText::_('COM_MIJOSEARCH_SEARCH_AJAX_RESULTS') .' ( '. $this->total.' )'; ?></div> <div class="closeajax" onclick="document.getElementById('mijoajax').innerHTML = ''"><img style="width: 15px; height: 15px;" src="<?php echo JUri::root(). '/components/com_mijosearch/assets/images/close-16.png'; ?>"></div>
            <div class="ajax-clear"></div>
        </div>
        <div class="page-container">
			<?php
			if(empty($this->results)){ ?>
					<a class="result-element">
						<span><?php echo JText::_('COM_MIJOSEARCH_SEARCH_AJAX_NO_RESULTS'); ?></span>
						<div class="ajax-clear"></div>
					</a>
				<?php
			}   
			else{	
                $count = 0;
                foreach($this->results as $result) {
                    if(empty($result->imagename) and empty($result->name) and empty($result->description)){
                    	continue;
                    }
                    $count++;

                    if($count > $this->MijosearchConfig->ajax_display_limit){ ?>
                       <button type="submit" id="more-result" onclick="return searchSubmit();" class="<?php echo $this->MijosearchConfig->ajax_button_class ?>" ><?php echo JText::_('COM_MIJOSEARCH_SEARCH_AJAX_MORE'); ?></button>

                    <?php
                        break;
                    }
                    
                    MijosearchSearch::finalizeResult($result);
            	?>

                <a class="result-element" href="<?php echo $result->link ?>">
                    <?php if($result->imagename != '' and $this->MijosearchConfig->ajax_show_image == 1) { ?>
                            <img  src="<?php echo $result->imagename ?>">
                    <?php } ?>

                    <span><?php echo substr(strip_tags($result->name), 0, $this->MijosearchConfig->ajax_title_length ); ?></span>

                    <?php if($this->MijosearchConfig->ajax_show_desc == 1) { ?>
                        <span class="small-desc" ><?php echo substr(strip_tags($result->description), 0, (int)$this->MijosearchConfig->ajax_description_length ). ' ...'; ?></span>
                    <?php } ?>

                    <?php if($this->MijosearchConfig->ajax_show_properties == 1) { ?>
                        <span class="small-desc" ><?php echo $result->properties; ?></span>
                    <?php } ?>

                    <div class="ajax-clear"></div>
                </a>
            <?php }
			} ?>
        </div>
    </div>
</div>
