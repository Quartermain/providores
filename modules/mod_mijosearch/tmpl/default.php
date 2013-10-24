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
	<?php if($params->get('show_extra_fields', '1') == '1' && $params->get('show_sections', '0') == '1') { ?>
        window.onload = function MijosearchModule(){
            url = '<?php echo JRoute::_("index.php?option=com_mijosearch&task=changeExtensionMod&format=raw".$flter, false); ?>&ext=<?php echo JRequest::getCmd('ext', '', 'post'); ?>';
            new Request({method: "get", url: url, onComplete : function(result) {$('custom_fields_module-<?php echo $module->id; ?>').innerHTML = result;}}).send();
        }
	<?php
	}

	if ($params->get('enable_complete', '0') == '1') { ?>
	window.addEvent('load', function() {
		var url = '<?php echo JRoute::_("index.php?option=com_mijosearch&task=complete&format=raw", false); ?>';
		var completer = new Autocompleter.Ajax.Json($('qr-<?php echo $module->id; ?>'), url, {'postVar': 'q'});
	});
	<?php } 
	
	if ($params->get('show_extra_fields', '1') == '1' && $params->get('show_sections', '0') == '1') { ?>

	function changeExtModule(a){
		url = '<?php echo JRoute::_("index.php?option=com_mijosearch&task=changeExtensionMod&format=raw".$flter, false); ?>&ext='+a;
		new Request({method: "get", url: url, onComplete : function(result) {$('custom_fields_module-<?php echo $module->id; ?>').innerHTML = result;}}).send();
	}
	<?php } ?>
	
	function mijosearchsubmit(){
		var form = document.getElementById("mijosearchModule-<?php echo $module->id; ?>");
		var moquery = document.getElementById("qr-<?php echo $module->id; ?>").value.length;

		if (moquery >= "<?php echo $MijosearchConfig->search_char; ?>"  ) {
            form.submit();
		} 
		else {
			alert("<?php echo JText::_('MOD_MIJOSEARCH_QUERY_ERROR'). ' ' .$MijosearchConfig->search_char. ' ' .JText::_('MOD_MIJOSEARCH_QUERY_ERROR_CHARS');?>");
			return false;
		}
	}

    <?php if($params->get('enable_ajaxsearch', '0')){ ?>
        jQuery(document).ready(function() {
            jQuery('#qr-<?php echo $module->id; ?>').keyup(function() {
                ajaxSearch();
            });

            jQuery('#ext').change(function() {
                ajaxSearch();
            });

            jQuery('#order').change(function() {
                ajaxSearch();
            });
        });


        function ajaxSearch(){
            var text = document.getElementById('qr-<?php echo $module->id; ?>').value;
            if(text.length < <?php echo $MijosearchConfig->search_char ?> || text == 'search...' ){
                return;
            }

            var postdata = jQuery('#mijosearchModule-<?php echo $module->id; ?>').serialize();
            postdata = postdata.replace('&view=search&task=search', '');

            jQuery.ajax({
                type: "GET",
                url: "index.php?option=com_mijosearch&task=ajaxsearch",
                data: postdata,
                success:function(data){
                    document.getElementById('mijoajax').innerHTML = data;
                }
            });
        }

    <?php } ?>

</script>

<form id="mijosearchModule-<?php echo $module->id; ?>" action="<?php echo JRoute::_('index.php?option=com_mijosearch&view=search'); ?>" method="post" name="mijosearchModule" onsubmit="mijosearchsubmit();">
	<div class="search<?php echo $params->get('moduleclass_sfx', ''); ?> mijosearch_bg_module">
		<?php
		echo $output;
		echo $order;
		echo $section;
		
		if ($params->get('show_button', '1') == '1') {	?>
			<button type="submit" class="<?php echo $params->get('button_class', 'btn btn-primary');?>" id="module_button-<?php echo $module->id; ?>"><?php echo JText::_('COM_MIJOSEARCH_SEARCH'); ?></button>
			<?php
		}
		
		echo $advanced;
		echo $hidden;
		?>
	</div>
	
	<input type="hidden" name="option" value="com_mijosearch"/>
	<input type="hidden" name="view" value="search"/>
	<input type="hidden" name="task" value="search"/>
</form>
<div class="mijosearch_clear"></div>