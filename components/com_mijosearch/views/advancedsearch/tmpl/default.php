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
		var e = document.getElementById("e").value.length;
		var al = document.getElementById("al").value.length;
		var a = document.getElementById("a").value.length;
		var n = document.getElementById("n").value.length;
		
		if (e >= "<?php echo $this->MijosearchConfig->search_char; ?>" || al >= "<?php echo $this->MijosearchConfig->search_char; ?>" || a >= "<?php echo $this->MijosearchConfig->search_char; ?>") {
			return true;
		} 
		else {
			alert("<?php echo JText::_('COM_MIJOSEARCH_QUERY_ERROR'). ' ' .$this->MijosearchConfig->search_char. ' ' .JText::_('COM_MIJOSEARCH_QUERY_ERROR_CHARS');?>");
			return false;
		}
	}
	
	<?php if ($this->MijosearchConfig->enable_complete == '1') { ?>
	window.addEvent('load', function() {
		var url = '<?php echo JRoute::_('index.php?option=com_mijosearch&task=complete&format=raw', false); ?>';
		var c1 = new Autocompleter.Ajax.Json($('e'), url, {'postVar': 'q'});
		var c2 = new Autocompleter.Ajax.Json($('a'), url, {'postVar': 'q'});
		var c3 = new Autocompleter.Ajax.Json($('al'), url, {'postVar': 'q'});
		var c4 = new Autocompleter.Ajax.Json($('n'), url, {'postVar': 'q'});
	});
	<?php } ?>

	function ChangeType(a){
		url = '<?php echo JRoute::_("index.php?option=com_mijosearch&task=changeExtension&format=raw".$this->filter, false);?>&ext='+a;
		new Request({method: "get", url: url, onComplete : function(result) {$('custom_fields').innerHTML = result;}}).send();
	}

	function ajaxFunction(selected, data, html_field){
		if (selected == 0) {
		   $(html_field).innerHTML = '';
		   return;
		}
		
		var url = '<?php echo JRoute::_("index.php?option=com_mijosearch&task=ajaxFunction&format=raw", false);?>'+data+'&selected='+selected;
		new Request({method: "get", url: url, onComplete : function(result) {$(html_field).innerHTML = result;}}).send();
	}
</script>

<form id="adminForm" action="<?php echo JRoute::_(JFactory::getURI()->toString());?>" method="post" name="adminForm" onsubmit="return submitbutton();">
	<?php
	$page_title = $this->params->get('page_title', '');
	if (($this->params->get('show_page_heading', '0') == '1') && !empty($page_title)) {
		?><h1><?php
		echo $page_title;
		?></h1><?php
	} 
	?>
	<fieldset class="mijosearch_fieldset">
		<legend class="mijosearch_legend"><?php echo JText::_('COM_MIJOSEARCH_SEARCH');?></legend>

		<div style="float:left;width:100%;">
			<span class="mijosearch_span_label">
				<?php echo JText::_('COM_MIJOSEARCH_SEARCH_EXACT');?>
			</span>
			<span class="mijosearch_span_field">
				<input class="mijosearch_input_image" id="e" type="text" name="exact" value=""  maxlength="<?php echo $this->MijosearchConfig->max_search_char; ?>"/>
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
				<input class="mijosearch_input_image" id="a" type="text" name="any" value="" maxlength="<?php echo $this->MijosearchConfig->max_search_char; ?>" />
			</span>
		</div>
		
		<div style="float:left;width:100%;">
			<span class="mijosearch_span_label">
				<?php echo JText::_('COM_MIJOSEARCH_SEARCH_NONE');?>
			</span>
			<span class="mijosearch_span_field">
				<input class="mijosearch_input_image" id="n" type="text" name="none" value="" maxlength="<?php echo $this->MijosearchConfig->max_search_char; ?>" />
			</span>
		</div>

        <?php if ($this->MijosearchConfig->show_order == '1') { ?>
            <div style="float:left;width:100%;">
                <span class="mijosearch_span_label">
                    <?php echo JText::_('COM_MIJOSEARCH_FIELDS_ORDER');?>
                </span>
                <span class="mijosearch_span_field">
                    <?php echo $this->lists['order']; ?>
                </span>
            </div>
		<?php } ?>
		<?php if (MijoSearch::get('utility')->getConfigState($this->params, 'show_ext_flt') && empty($this->component) && !is_int($this->lists['extension'])) { ?>
            <div style="float:left;width:100%;">
                <span class="mijosearch_span_label">
                    <?php echo JText::_('COM_MIJOSEARCH_SEARCH_SECTION');?>
                </span>
                <div class="mijosearch_span_field">
                    <?php echo $this->lists['extension']; ?>
                    &nbsp;<div class="mijosearch_progress"></div>
                </div>
            </div>
		<?php
        }
		elseif(is_int($this->lists['extension'])) {
			echo '<input type="hidden" name="ext" value="'.$this->lists['ext'].'"/>';
		}
		?>
		
	</fieldset>
	
	<div class="mijosearch_clear"></div>
	
	<?php 
	if (!empty($this->component)) {
		echo MijoSearch::getExtraFields($this->component);
	}
	else {
		?>
		<div id="custom_fields"></div>
		<?php
	}
	?>
	
	<div class="mijosearch_clear" style="height:10px;width:100%;"></div>
	
	<button type="submit" class="btn btn-primary"><?php echo JText::_('COM_MIJOSEARCH_SEARCH'); ?></button>
	
	<div class="mijosearch_clear"></div>
	
	<input type="hidden" name="option" value="com_mijosearch" />
	<input type="hidden" name="task" value="search" />
	
	<?php if ($this->uri->getVar('filter')) { ?>
		<input type="hidden" name="filter" value="<?php echo (int)$this->uri->getVar('filter'); ?>"/>
		<input type="hidden" name="Itemid" value="<?php echo MijoSearch::get('utility')->getItemid($this->uri->getVar('filter')); ?>" />
	<?php }	else { ?>
		<input type="hidden" name="Itemid" value="<?php echo MijoSearch::get('utility')->getItemid(); ?>" />
	<?php
	}
	
	if (!empty($this->component)) {
		?>
		<input type="hidden" name="ext" value="<?php echo $this->component; ?>"/>
		<?php
	}
	?>
</form>