<?php
/**
 * @package		MijoSearch
 * @copyright	2009-2013 Mijosoft LLC, www.mijosoft.com
 * @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
 * @license		2009-2012 GNU/GPL based on AceSearch www.joomace.net
 */

//No Permision
defined( '_JEXEC' ) or die( 'Restricted access' );

$filter_value = "";
$ajax_filter = JRequest::getInt('filter');
if (!empty($ajax_filter)) {
	$filter_value = '&filter='.$ajax_filter;
}

$_ext = JRequest::getCmd('ext');
?>

<script type="text/javascript">	
	window.onload = function Mijosearch(){
        <?php if (!empty($_ext)) { ?>
		url = '<?php echo JRoute::_("index.php?option=com_mijosearch&task=changeExtensionMod&format=raw&ext=".$_ext.$filter_value, false);?>';
		new Request({method: "get", url: url, onComplete : function(result) {$('custom_fields').innerHTML = result;}}).send();
        <?php } ?>
	} 
	
	function submitbutton(){
		var query = document.getElementById("q").value.length;
		if (query >= "<?php echo $this->MijosearchConfig->search_char; ?>") {
			return true;
		} 
		else {
			alert("<?php echo JText::_('COM_MIJOSEARCH_QUERY_ERROR'). ' ' .$this->MijosearchConfig->search_char. ' ' .JText::_('COM_MIJOSEARCH_QUERY_ERROR_CHARS');?>");
			return false;
		}
	}
	
	function redirect (link) {
		var query = document.getElementById("q").value;
		
		if (query != '') {
			document.location.href=link+'&query='+query;		
		}
		else {
			document.location.href=link;		
		}
	}

	function ajaxFunction(selected, data, html_field){
		if (selected == 0) {
		   $(html_field).innerHTML = '';
		   return;
		}
		
		var url = '<?php echo JRoute::_("index.php?option=com_mijosearch&task=ajaxFunction&format=raw", false);?>'+data+'&selected='+selected;
		new Request({method: "get", url: url, onComplete : function(result) {$(html_field).innerHTML = result;}}).send();
	}
	
	window.addEvent('load', function() {
	<?php
	if ($this->MijosearchConfig->enable_complete == '1') { ?>
		$('q').addEvent('focus', function(){
			var url = '<?php echo JRoute::_('index.php?option=com_mijosearch&task=complete&format=raw', false); ?>';
			var completer = new Autocompleter.Ajax.Json($('q'), url, {'postVar': 'q'});
		});
	<?php }  ?>
		var mySlide = new Fx.Slide('more-menu',{duration: 1000, transition: Fx.Transitions.Quad.easeInOut});
		mySlide.hide();		
		$('more-link').addEvent('click', function(e){
			e = new Event(e);
			mySlide.toggle();
			e.stop();
			$('more-link').setStyle('display','none');
			$('fewer-link').setStyle('display','block');
		});
		$('fewer-link').addEvent('click', function(e){
			e = new Event(e);
			mySlide.hide();
			e.stop();
			$('more-link').setStyle('display','block');
			$('fewer-link').setStyle('display','none');
		});
	});

</script>

<div id="mijosearch_google_empty">
    <div class="mijosearch_google_results">
        <?php if ($this->MijosearchConfig->show_ext_flt == '1') { ?>
            <div class="mijosearch_google_results_left">
                <?php echo MijosearchHTML::getExtensions();?>
                <?php if ($this->MijosearchConfig->show_order == '1') { ?>
                    <div class="advancedsearch_div">
                        <span class="mijosearch_span_label_module">
                            <?php echo JText::_('COM_MIJOSEARCH_FIELDS_ORDER'); ?>
                        </span>
                        <span class="mijosearch_span_field_module">
                            <?php echo $this->lists['order']; ?>
                            <?php echo $this->lists['orderdir']; ?>
                        </span>
                    </div>
                <?php } ?>
                <div id="custom_fields"></div>
            </div>
        <?php } ?>
        <div class="mijosearch_google_results_center" <?php if ($this->MijosearchConfig->show_ext_flt == '0') { echo 'style="width: 100%; padding-left: 0px; border-left: 0px solid #ccc;"'; }?>>
            <div class="mijosearch_google_results_top">
                <div class="mijosearch_google_results_up">
                    <table style="position:relative; z-index:2; border-bottom:1px solid transparent" border="0" cellpadding="0" cellspacing="0">
                        <tbody>
                            <tr style="border:0px !important;">
                                <td style="width:100%; border:0px !important;">
                                    <div class="mijosearch_google_results_inputbox">
                                        <input class="mijosearch_result_google" type="text" name="query" id="q" value="<?php echo $this->query; ?>" maxlength="<?php echo $this->MijosearchConfig->max_search_char; ?>" />
                                    </div>
                                    <div class="mijosearch_google_results_jsb"> </div>
                                </td>
                                <td style="border:0px !important;">
                                    <div class="mijosearch_google_results_lsbb" id="mijosearch_google_results_sblsbb">
                                        <button class="mijosearch_google_results_lsb" type="submit" name="btnG">
                                            <span class="mijosearch_google_results_sbico"></span>
                                        </button>
                                    </div>
                                </td>
                                <td style="border:0px !important;">
                                    <div style="position:relative;height:29px;z-index:2">
                                        <div class="mijosearch_google_results_lsd">
                                            <div id="ss-bar" style="white-space:nowrap;z-index:98"></div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="mijosearch_google_results_bottom">
                    <span class="mijosearch_google_results_about" id="total"><?php echo JText::_('COM_MIJOSEARCH_SEARCH_TOTAL_RESULTS').'&nbsp;'.$this->total.'&nbsp;'.JText::_('COM_MIJOSEARCH_SEARCH_RESULTS_FOUND'); ?> </span>
                    <?php if ($this->MijosearchConfig->show_adv_search == '1') { ?>
                        <a class="mijosearch_google_results_about" style="font-size:10px; float:right;  color: #3366CC;" href="<?php echo JRoute::_('index.php?option=com_mijosearch&view=advancedsearch'.$this->suffix .$this->Itemid); ?>" title="<?php echo JText::_('COM_MIJOSEARCH_SEARCH_ADVANCED_SEARCH'); ?>" >
                            <?php echo JText::_('COM_MIJOSEARCH_SEARCH_ADVANCED_SEARCH'); ?>
                        </a>
                    <?php } ?>
                </div>
            </div>
            <div id="mijosearch-results">

            <?php

            if ($this->MijosearchConfig->enable_suggestion == '1' && !empty($this->results["suggest"])) {
                echo $this->results["suggest"];
            }

            $this->renderModules();

            if (!empty($this->results[0])) {
                $ext = JRequest::getCmd('ext','');
                $n = count($this->results);
                $more_results = array();
                
                for ($i = 0; $i < $n; $i++){
                    $result = isset($this->results[$i]) ? $this->results[$i] : "";

                    if (!empty($result)){
                        MijosearchSearch::finalizeResult($result);
						?>
						<div class="mijosearch_search_results" >
						  <div>
							  <?php if (!empty($result->imagename)) { ?>
							  <div class="image_position<?php echo $this->MijosearchConfig->image_positions?>">
								<a href="<?php echo $result->link; ?>"><img src="<?php echo $result->imagename; ?>" width="<?php echo $this->MijosearchConfig->image_sizew?>" height="<?php echo $this->MijosearchConfig->image_sizeh?>"/></a>
							  </div>
							  <?php } ?>
								<div>
									<span style="font-size:15px;"><a href="<?php echo $result->link; ?>"><?php echo $result->name; ?></a></span>
								</div>
							  <?php
								
								if(!empty($result->description)) {
									?><div class="description"><?php echo $result->description; ?></div><?php
								}
								
								if(!empty($result->properties)) {
									?><div><span style="color:#6a6767;"><?php echo $result->properties; ?></span></div><?php
								}
								
								if(!empty($result->route)) {
									?><div><a class="mijosearch_results_route_link" href="<?php echo $result->route; ?>"><?php echo $result->route; ?></a></div><?php
								}
							  
								if ($this->MijosearchConfig->google_more_results == '1' && empty($ext) && empty($ajax_filter)) {
									if (!isset($more_results[$result->mijosearch_ext])) {
										$more_results[$result->mijosearch_ext] = 1;
									}
									else {
										$more_results[$result->mijosearch_ext]++;
									}
									
									$prm_results_length = MijoSearch::getCache()->getExtensionParams($result->mijosearch_ext)->get('google_more_results_length', '');
									if (!empty($prm_results_length)){
										$results_length = intval($prm_results_length);
									}
									else {
										$results_length = $this->MijosearchConfig->google_more_results_length;
									}

									if ($more_results[$result->mijosearch_ext] == $results_length) {
										$name = MijosearchExtension::getExtensionName($result->mijosearch_ext);
										?>
										<br/>
										<div style="padding-top: 20px;">
											<div class="google_pluss"></div>
											<a href="<?php echo JRoute::_(JFactory::getURI()->toString()).'&ext='.$result->mijosearch_ext; ?>" class="google_pluss_link">
												<?php echo JText::_('COM_MIJOSEARCH_SEARCH_SHOW_MORE_RESULTS').' "'.$name.'" '. JText::_('COM_MIJOSEARCH_SEARCH_SHOW_MORE_RESULTS_SEC'); ?>
											</a>
										</div>
										<?php
										$more_results[$result->mijosearch_ext] = 1;
									}
								}  ?>
							</div> <?php
                            if ($i < $n - 1) { ?>
								<div class="dottttttttt"></div> <?php
							} ?>
						 </div>
						<?php
                    }
                }
                
				$this->renderModules('mijosearch_bottom'); 
				
			} else{
                ?>
                <h2><?php echo JText::_('COM_MIJOSEARCH_SEARCH_NO_RESULTS'); ?></h2>
                    <span><?php echo JText::_('COM_MIJOSEARCH_SEARCH_NO_RESULTS_QUERY'); ?><?php echo MijosearchSearch::getSearchQuery(); ?></span>
                <?php
            }
            ?>
			</div>
            <div class="mijosearch_clear"></div>
            <div id="mijosearch_pagination">
                <div class="pagination">
                    <?php echo $this->pagination->getPagesLinks(); ?>&nbsp;
                </div>
            </div>
            </div>


    <div class="mijosearch_clear"></div>
    </div>
</div>