<?php
/**
* @version		1.5.0
* @package		MijoSearch
* @subpackage	MijoSearch
* @copyright	2009-2011 Mijosoft LLC, www.mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceSearch www.joomace.net
*/

//No Permision
defined( '_JEXEC' ) or die( 'Restricted access' );

?>

<script type="text/javascript">
	<?php if ($this->MijosearchConfig->admin_enable_complete == '1') { ?>
	window.addEvent('load', function() {
		var url = '<?php echo JRoute::_('index.php?option=com_mijosearch&controller=ajax&task=complete', false); ?>';
		var c1 = new Autocompleter.Ajax.Json($('e'), url, {'postVar': 'q'});
		var c2 = new Autocompleter.Ajax.Json($('al'), url, {'postVar': 'q'});
		var c3 = new Autocompleter.Ajax.Json($('a'), url, {'postVar': 'q'});
		var c4 = new Autocompleter.Ajax.Json($('n'), url, {'postVar': 'q'});
	});
	<?php } ?>
	
	function ChangeType(a){
		url = '<?php echo JURI::base();?>index.php?option=com_mijosearch&controller=ajax&format=raw&task=changeExtension&ext='+a;
		new Request({method: "get", url: url, onComplete : function(result) {$('custom_fields').innerHTML = result;}}).send();
	}

	function submitbutton(){
		var form = document.adminForm;
		var boxesTicked = ""
		
		if (form.query.value || form.all.value  || form.any.value || form.none.value || form.exact.value) {
			return true;
		} else{
			alert("<?php echo JText::_('COM_MIJOSEARCH_SEARCH_ENTER_QUERY'); ?>");
			return false;
		}
	}
</script>

<form id="adminForm" action="index.php?com_mijosearch&controller=search&task=view" method="post" name="adminForm" onsubmit="return submitbutton();">
	<div style="width:800px; margin-left:auto;margin-right:auto;text-align:center;">
        <fieldset class="mijosearch_fieldset">
            <legend class="mijosearch_legend"><?php echo JText::_('COM_MIJOSEARCH_SEARCH');?></legend>
            <div style="float:left;width:100%;">
                <span class="mijosearch_span_label">
                    <?php echo JText::_('COM_MIJOSEARCH_SEARCH_EXACT');?>
                </span>
                <span class="mijosearch_span_field">
                    <input class="mijosearch_input_image" id="e" type="text" name="exact" value=""  maxlength="<?php echo $this->MijosearchConfig->admin_max_search_char; ?>"/>
                </span>
            </div>

            <div style="float:left;width:100%;">
                <span class="mijosearch_span_label">
                    <?php echo JText::_('COM_MIJOSEARCH_SEARCH_ALL');?>
                </span>
                <span class="mijosearch_span_field">
                    <input class="mijosearch_input_image" id="al" type="text" name="all" value="" maxlength="<?php echo $this->MijosearchConfig->max_search_char; ?>" />
                </span>
            </div>

            <div style="float:left;width:100%;">
                <span class="mijosearch_span_label">
                    <?php echo JText::_('COM_MIJOSEARCH_SEARCH_ANY');?>
                </span>
                <span class="mijosearch_span_field">
                    <input class="mijosearch_input_image" id="a" type="text" name="any" value="" maxlength="<?php echo $this->MijosearchConfig->admin_max_search_char; ?>" />
                </span>
            </div>

            <div style="float:left;width:100%;">
                <span class="mijosearch_span_label">
                    <?php echo JText::_('COM_MIJOSEARCH_SEARCH_NONE');?>
                </span>
                <span class="mijosearch_span_field">
                    <input class="mijosearch_input_image" id="n" type="text" name="none" value="" maxlength="<?php echo $this->MijosearchConfig->admin_max_search_char; ?>" />
                </span>
            </div>
            <div style="float:left;width:100%;">
                <span class="mijosearch_span_label">
                    <?php echo JText::_('COM_MIJOSEARCH_FIELDS_ORDER');?>
                </span>
                <span class="mijosearch_span_field">
                    <?php echo MijosearchHTML::_renderFieldOrder(); ?>
                </span>
            </div>
            <?php if ($this->MijosearchConfig->admin_show_ext_flt) {?>
            <div style="float:left;width:100%;">
                <span class="mijosearch_span_label">
                    <?php echo JText::_('COM_MIJOSEARCH_SEARCH_SECTION');?>
                </span>
                <span class="mijosearch_span_field">
                    <?php echo $this->lists['extension']; ?>
                    &nbsp;<div id="mijosearch_progress"></div>
                </span>
            </div>
            <?php } ?>
        </fieldset>

        <div class="mijosearch_clear"></div>

        <div id="custom_fields"></div>

        <div class="mijosearch_clear" style="height:10px;width:100%;"></div>

        <button type="submit" class="btn btn-primary" style="float:left;"><?php echo JText::_('COM_MIJOSEARCH_SEARCH' ); ?></button>

        <div class="mijosearch_clear"></div>

        <input type="hidden" name="option" value="com_mijosearch" />
        <input type="hidden" name="view" value="search" />
        <input type="hidden" name="Itemid" value="<?php echo JRequest::getInt('Itemid'); ?>"/>
	</div>
</form>