<?php
/**
 * @package		MijoSearch
 * @copyright	2009-2013 Mijosoft LLC, www.mijosoft.com
 * @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
 * @license		2009-2012 GNU/GPL based on AceSearch www.joomace.net
 */

//No Permision
defined( '_JEXEC' ) or die( 'Restricted access' );
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
	
	function setLucky() {
		document.mijosearchForm.lucky.value = '1';
	}
	
	<?php if ($this->MijosearchConfig->enable_complete == '1') { ?>
	window.addEvent('load', function() {
		var url = '<?php echo JRoute::_('index.php?option=com_mijosearch&task=complete&format=raw', false); ?>';
		var completer = new Autocompleter.Ajax.Json($('q'), url, {'postVar': 'q'});
	});
	<?php } ?>

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

                        var total = htmlObject.find('span#total')[0];
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
	if (empty($this->query)) {
	?>
		<div class="mijosearch_google_search">
			<?php
			$page_title = $this->params->get('page_title', '');
			if (($this->params->get('show_page_heading', '0') == '1') && !empty($page_title)) {
				?><h1 class="mijosearch_google_empty"><?php
				echo $page_title;
				?></h1><?php
			} 
			?>
		
			<input class="mijosearch_google_search_input" style="width:75%;" type="text" name="query" id="q" value="<?php echo $this->query; ?>" maxlength="<?php echo $this->MijosearchConfig->max_search_char; ?>" />&nbsp;
			
			<?php if ($this->MijosearchConfig->show_adv_search == '1') {	?>
				<a class="mijosearch_google_results_about" style="font-size:13px;  color: #3366CC;" href="<?php echo JRoute::_('index.php?option=com_mijosearch&view=advancedsearch'.$this->suffix .$this->Itemid); ?>" title="<?php echo JText::_('COM_MIJOSEARCH_SEARCH_ADVANCED_SEARCH'); ?>" >
					<?php echo JText::_('COM_MIJOSEARCH_SEARCH_ADVANCED_SEARCH'); ?>
				</a>
			<?php }	?>
		
			<div class="mijosearch_clear"></div>
		
			<button type="submit" class="mijosearch_button_google" onclick="this.checked=1"><?php echo JText::_('COM_MIJOSEARCH_SEARCH'); ?></button>
			<button type="submit" class="mijosearch_button_google" style="width:140px;" onClick="setLucky();"><?php echo JText::_("I'm feeling lucky"); ?></button>
		</div>
		
		<div class="mijosearch_clear"></div>
		<div class="mijosearch_clear"></div>
	<?php
	} else {
		echo $this->loadTemplate('results_google');
	}
	
	echo $this->hiddenfilt;
	
	$limit = JRequest::getInt('limit');
	if(!isset($limit)) { ?>
	<input type="hidden" name="limit" value="<?php echo $this->MijosearchConfig->display_limit; ?>"/>
	<?php } ?>
	<input type="hidden" name="limitstart" value="" />
	<input type="hidden" name="option" value="com_mijosearch" />
	<input type="hidden" name="task" value="search" />
	<input type="hidden" name="lucky" value="0" />
</form>
<div class="mijosearch_clear"></div>