<?php
/**
* @version		1.7.0
* @package		MijoSearch
* @subpackage	MijoSearch
* @copyright	2009-2011 Mijosoft LLC, www.mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceSearch www.joomace.net
*/

//No Permision
defined( '_JEXEC' ) or die( 'Restricted access');

?>
<script language="javascript">
	window.onload = function changeExtension(){
        var url = '<?php echo JFactory::getURI()->base(); ?>index.php?option=com_mijosearch&controller=filters&format=raw&task=getExtensionFields&ext=<?php echo $this->ext;?>&id=<?php echo $this->item->id;?>';
		new Request({method: "get", url: url, onComplete : function(result) {$('fields').innerHTML = result;}}).send();
	}

	function changeExtension(ext){
		var url = '<?php echo JFactory::getURI()->base(); ?>index.php?option=com_mijosearch&controller=filters&format=raw&task=getExtensionFields&ext='+ext+'&id=<?php echo $this->item->id;?>';
		new Request({method: "get", url: url, onComplete : function(result) {$('fields').innerHTML = result;}}).send();
	}

	function submitbutton(pressbutton){
		var form = document.adminForm;
		if (pressbutton == 'editCancel') {
			submitform(pressbutton);
			return true;
		}
		
		if (form.title.value == '') {
			alert("<?php echo JText::_('COM_MIJOSEARCH_FILTERS_ENTER_NAME'); ?>");
			return;
		}
		else if (form.extension.value == '') {
			alert("<?php echo JText::_('COM_MIJOSEARCH_FILTERS_SELECT_FILTER'); ?>");
			return;
		}
		else if (form.groups.value == '' && form.new_group.value == '') {
			alert("<?php echo JText::_('COM_MIJOSEARCH_FILTERS_SELECT_GROUP'); ?>");
			return;
		}
		else {
			submitform(pressbutton);
			return true;
		}
	}
</script>

<form action="<?php echo JFilterOutput::ampReplace(JFactory::getURI()->toString()); ?>" method="post" name="adminForm" id="adminForm">
	<fieldset class="panelform">
		<legend><?php echo JText::_('COM_MIJOSEARCH_CPANEL_FILTERS'); ?></legend>
		<table class="admintable">
			<tr>
				<td  class="key2">
					<?php echo JText::_('COM_MIJOSEARCH_FIELDS_TITLE'); ?>
									
				</td>
				<td width="80%">
					<input type="text" name="title" id="q" value="<?php echo $this->item->title; ?>" />
				</td>
			</tr>
			<tr>
				<td class="key2">
					<span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CPANEL_FILTERS_GROUP'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CPANEL_FILTERS_GROUP_HELP'); ?>">
						<?php echo JText::_('COM_MIJOSEARCH_CPANEL_FILTERS_GROUP'); ?>
					</span>	
				</td>
				<td width="80%">
					<?php echo $this->lists['groups']; ?>
					<input type="text" name="new_group" value="" style="width=100px; margin-left:10px;"/>
				</td>
			</tr>
			<tr>
				<td  class="key2">
					<?php echo JText::_('Published'); ?>
				</td>
				<td width="80%">
					<?php echo $this->lists['published']; ?>
				</td>
			</tr>
			<tr>
				<td class="key2">
					<span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_FILTERS_FILTERS'); ?>::<?php echo JText::_('COM_MIJOSEARCH_FILTERS_FILTERS_HELP'); ?>">
						<?php echo JText::_('COM_MIJOSEARCH_FILTERS_FILTERS'); ?>
					</span>	
				</td>
				<td width="80%">
					<div style="width:100px; float:left; margin-top:5px;">	
						<strong><?php echo JText::_('COM_MIJOSEARCH_MENU_COMPONENT'); ?></strong><br/>
						<?php echo $this->lists['extension']; ?>
					</div>	
					<div style="float:left;">
						<div id="fields" style="float:left; padding-left:20px; padding-right:10px;"></div>
					</div>
				</td>
			</tr>
			<tr>
				<td class="key2">
					<span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CPANEL_FILTERS_START_DATE'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CPANEL_FILTERS_START_DATE_HELP'); ?>">
						<?php echo JText::_('COM_MIJOSEARCH_CPANEL_FILTERS_START_DATE'); ?>
					</span>	
				</td>
				<td width="80%">
					<?php echo JHTML::_('calendar', $this->params->get('start_date'), 'start_date', 'start_date'); ?>
				</td>
			</tr>
			<tr>
				<td class="key2">
					<span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CPANEL_FILTERS_END_DATE'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CPANEL_FILTERS_END_DATE_HELP'); ?>">
						<?php echo JText::_('COM_MIJOSEARCH_CPANEL_FILTERS_END_DATE'); ?>
					</span>	
				</td>
				<td width="80%">
					<?php echo JHTML::_('calendar', $this->params->get('end_date'), 'end_date', 'end_date'); ?>
				</td>
			</tr>
			
		</table>
	</fieldset>

	<input type="hidden" name="option" value="com_mijosearch" />
	<input type="hidden" name="controller" value="filters"/>
	<input type="hidden" name="task" value="editSave" />
	<input type="hidden" name="id" value="<?php echo $this->item->id; ?>" />
	<input type="hidden" name="cid" value="<?php echo $this->item->id; ?>" />
	<input type="hidden" name="is_group" value="0" />
	<?php echo JHTML::_('form.token'); ?>
</form>