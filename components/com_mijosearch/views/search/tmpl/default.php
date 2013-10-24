<?php
/**
 * @package		MijoSearch
 * @copyright	2009-2013 Mijosoft LLC, www.mijosoft.com
 * @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
 * @license		2009-2012 GNU/GPL based on AceSearch www.joomace.net
 */

//No Permision
defined( '_JEXEC' ) or die( 'Restricted access' );

$filter = JRequest::getInt('filter');
?>

<script type="text/javascript">
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
			document.location.href = link + '&query=' + query;
		}
		else {
			document.location.href = link;
		}
	}

	window.addEvent('load', function() {
	<?php if ($this->MijosearchConfig->enable_complete == '1') { ?>
		$('q').addEvent('focus', function(){
			var url = '<?php echo JRoute::_('index.php?option=com_mijosearch&task=complete&format=raw', false); ?>';
			var completer = new Autocompleter.Ajax.Json($('q'), url, {'postVar': 'q'});
		});
	<?php }
		if ($this->MijosearchConfig->yahoo_sections  == '1' && empty($ajax_filter)) { ?>
        if (document.getElementById('more-link')) {
            $('more-link').addEvent('click', function(e){
                e.preventDefault();
                 $("more-menu").setStyle('display','block');
            });
            document.addEvent('mouseup', function(e) {
                $("more-menu").setStyle('display','none');
            });
        }
	<?php } ?>


	});

    <?php if($this->MijosearchConfig->ajax_enable){ ?>
        jQuery(document).ready(function() {
            jQuery('#q').keyup(function() {
                var text = this.value;
                if(text.length < <?php echo $this->MijosearchConfig->search_char ?> || text == 'search...' ){
                    return;
                }

                var url = document.getElementById('mijosearchForm').action;
                var q = parseQueryString(url);
                if(typeof(q['query']) != "undefined"){
                    var queryold ='query='+ q['query'];
                    var querynew ='query='+ this.value;
                    url = url.replace(queryold,querynew);
                }
                else{
                    var querynew ='?query='+ this.value;
                    url = url+querynew;
                }

                if(typeof(queryold) == "undefined"){
                    window.location.href = url;
                }


                jQuery.ajax({
                    type: "POST",
                    url:url+'&type=ajax&limitstart=0&limit=<?php echo  $this->MijosearchConfig->display_limit ?>',
                    success:function(data){
                        var htmlObject = jQuery(data);
                        var results = htmlObject.find('div#mijosearch-results')[0];
                        if(!results) {
                            document.getElementById('mijosearch-results').innerHTML = '';
                        }
                        else {
                            document.getElementById('mijosearch-results').innerHTML = results.innerHTML;
                        }

                        var page = htmlObject.find('div#mijosearch_pagination')[0];
                        if(!page) {
                            document.getElementById('mijosearch_pagination').innerHTML = '';
                        }
                        else {
                            document.getElementById('mijosearch_pagination').innerHTML = page.innerHTML.replace(new RegExp("&amp;type=ajax","g"),"");
                        }

                        var total = htmlObject.find('div#total')[0];
                        if(!total) {
                            document.getElementById('total').innerHTML = '';
                        }
                        else {
                            document.getElementById('total').innerHTML = total.innerHTML;
                        }
                    }
                });
            });
        });

        function parseQueryString( queryString ) {
            var params = {}, queries, temp, i, l, _queries;

            // Split into key/value pairs
            if( queryString.indexOf("?") > -1){
                _queries = queryString.split("?");
                queries = _queries[1].split("&");
            }
            else{
                queries = queryString.split("&");
            }

            // Convert the array of strings into an object
            for ( i = 0, l = queries.length; i < l; i++ ) {
                temp = queries[i].split('=');
                params[temp[0]] = temp[1];
            }

            return params;
        }

    <?php } ?>
</script>

<form id="mijosearchForm" name="mijosearchForm" action="<?php echo JRoute::_(JFactory::getURI()->toString()); ?>" method="post" onsubmit="return submitbutton();" >
	<?php
	$page_title = $this->params->get('page_title', '');
	if (($this->params->get('show_page_heading', '0') == '1') && !empty($page_title)) {
		?><h1><?php
		echo $page_title;
		?></h1><?php
	} 
	?>		
	<fieldset class="mijosearch_fieldset">
		<legend class="mijosearch_legend"><?php echo JText::_('COM_MIJOSEARCH_SEARCH'); ?></legend>
		<?php $mijosearch_bg = $this->MijosearchConfig->yahoo_sections ? 'mijosearch_bg2' : 'mijosearch_bg'; ?>
		<div id="<?php echo $mijosearch_bg; ?>">
            <?php
            if ($this->MijosearchConfig->yahoo_sections  == '1'){
                echo MijosearchHTML::getExtensions();
            } ?>
			<input class="mijosearch_input_image" type="text" name="query" id="q" value="<?php echo $this->query; ?>" maxlength="<?php echo $this->MijosearchConfig->max_search_char; ?>" />&nbsp;
			<?php
			if ($this->MijosearchConfig->show_ext_flt == '1' && $this->MijosearchConfig->yahoo_sections  == '0' && empty($filter)) {
			    if (is_int($this->lists['extension'])) {
					echo '<input type="hidden" name="ext" value="'.$this->lists['ext'].'"/>';
					$this->suffix.='&ext='.$this->lists['ext'];
				}
				else {
					echo $this->lists['extension'];
				}
			}
			?>
			
			<button type="submit" class="btn btn-primary" style="margin-bottom: 9px;"><?php echo JText::_('COM_MIJOSEARCH_SEARCH' ); ?></button>
			
			<?php 
			if ($this->MijosearchConfig->show_adv_search == '1') {
				?>
				<a  style="font-size:12px;" href="<?php echo JRoute::_('index.php?option=com_mijosearch&view=advancedsearch'.$this->suffix .$this->Itemid); ?>" title="<?php echo JText::_('COM_MIJOSEARCH_SEARCH_ADVANCED_SEARCH'); ?>" >
				<?php echo JText::_('COM_MIJOSEARCH_SEARCH_ADVANCED_SEARCH'); ?></a>
			<?php } ?>
		</div>
	</fieldset>
	<div class="mijosearch_clear"></div>
	
	<?php
	if (!empty($this->query)) {
		if ($this->MijosearchConfig->results_format == '1') {
			echo $this->loadTemplate('results');
		}
		else {
			echo $this->loadTemplate('results_table');
		}
	}
	
	echo $this->hiddenfilt;
	$limit = JRequest::getInt('limit');
	if(!isset($limit )) {
	?>
	<input type="hidden" name="limit" value="<?php echo $this->MijosearchConfig->display_limit; ?>"/><?php } ?>
	<input type="hidden" name="limitstart" value="" />
	<input type="hidden" name="option" value="com_mijosearch" />
	<input type="hidden" name="task" value="search" />
</form>
<div class="mijosearch_clear"></div>