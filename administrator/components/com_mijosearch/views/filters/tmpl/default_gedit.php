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
defined( '_JEXEC' ) or die( 'Restricted access' );
?>
<script language="javascript">

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
		else {
			submitform(pressbutton);
			return true;
		}
	}
</script>
<form action="<?php echo JFilterOutput::ampReplace(JFactory::getURI()->toString()); ?>" method="post" name="adminForm" id="adminForm">
	<fieldset class="adminform">
		<legend><?php echo JText::_('COM_MIJOSEARCH_CPANEL_FILTERS_GROUPS'); ?></legend>
		<table class="admintable">
			<tr>
				<td width="20%" class="key2">
					<?php echo JText::_('COM_MIJOSEARCH_FIELDS_TITLE'); ?>
				</td>
				<td width="80%">
					<input type="text" name="title" id="title" value="<?php echo $this->item->title; ?>" />
				</td>
			</tr>			
		</table>
	</fieldset>

	<input type="hidden" name="option" value="com_mijosearch" />
	<input type="hidden" name="controller" value="filters"/>
	<input type="hidden" name="task" value="editSave" />
	<input type="hidden" name="id" value="<?php echo $this->item->id; ?>" />
	<input type="hidden" name="cid" value="<?php echo $this->item->id; ?>" />
	<input type="hidden" name="is_group" value="1" />
	<?php echo JHTML::_('form.token'); ?>
</form>