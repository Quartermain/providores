<?php
/**
* @version		1.5.0
* @package		MijoSearch
* @subpackage	MijoSearch
* @copyright	2009-2011 Mijosoft LLC, www.mijosoft.com
* @license		GNU GPL
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

// tmpl var
$tmpl = JRequest::getVar('tmpl');
?>

<script language="javascript">
	function submitbutton(pressbutton){
		// Check if is modal ivew
		<?php if ($tmpl == 'component') { ?>
		document.adminForm.modal.value = '1';
		<?php } ?>
		
		submitform(pressbutton);
	}
</script>

<form action="index.php?option=com_mijosearch&amp;controller=extensions&amp;task=edit&amp;cid[]=<?php echo $this->row->id; ?>&amp;tmpl=component" method="post" name="adminForm">
	<fieldset class="panelform">
		<table class="toolbar1">
			<tr>
				<td class="desc" width="550px">
					<?php  echo '<h3>'.$this->row->description.'</h3>';  ?>
				</td>
                <td>
                    <a href="#" onclick="javascript: submitbutton('editApply');" class="toolbar1"><span class="icon-32-apply1" title="<?php echo JText::_('Save'); ?>"></span><?php echo JText::_('Save'); ?></a>
                </td>
				<td>
					<a href="#" onclick="javascript: submitbutton('editSave'); window.top.setTimeout('SqueezeBox.close();', 1000);" class="toolbar1"><span class="icon-32-save1" title="<?php echo JText::_('Save & Close'); ?>"></span><?php echo JText::_('Save & Close'); ?></a>
				</td>
				<td>
					<a href="#" onclick="javascript: submitbutton('editCancel'); window.top.setTimeout('SqueezeBox.close();', 1000);" class="toolbar1"><span class="icon-32-cancel1" title="<?php echo JText::_('Cancel'); ?>"></span><?php echo JText::_('Cancel'); ?></a>
				</td>
			</tr>
		</table>
	</fieldset>
	
	<fieldset class="panelform">
		<legend><?php echo JText::_('Parameters'); ?></legend>
        <?php echo JHtml::_('tabs.start', 'mijosearch-extension'); ?>
			
			<?php if ($fields = $this->ext_params->getFieldset('extension')) { ?>
             <?php echo JHtml::_('tabs.panel', JText::_('COM_MIJOSEARCH_PARAMS_EXTENSION'), 'extension'); ?>
                <fieldset class="panelform form-horizontal">
                        <?php foreach($fields as $field) { ?>
                            <div class="control-group">
                                <div class="control-label">
                                    <?php echo $field->label; ?>
                                </div>
                                <div class="controls">
                                    <?php echo $field->input; ?>
                                </div>
                            </div>
                        <?php } ?>
                </fieldset>
			<?php }	?>
			
			<?php if ($fields = $this->ext_params->getFieldset('properties')) { ?>
             <?php echo JHtml::_('tabs.panel', JText::_('COM_MIJOSEARCH_PARAMS_PROPERTIES'), 'properties'); ?>
                <fieldset class="panelform form-horizontal">
                    <?php foreach($fields as $field) { ?>
                        <div class="control-group">
                            <div class="control-label">
                                <?php echo $field->label; ?>
                            </div>
                            <div class="controls">
                                <?php echo $field->input; ?>
                            </div>
                        </div>
                    <?php } ?>
                </fieldset>
			<?php }	?>

            <?php echo JHtml::_('tabs.panel', JText::_('COM_MIJOSEARCH_PARAMS_COMMON'), 'common'); ?>
                <fieldset class="panelform form-horizontal">
                    <?php foreach($this->common_params->getFieldset('default_params') as $field) { ?>
                        <div class="control-group">
                            <div class="control-label">
                                <?php echo $field->label; ?>
                            </div>
                            <div class="controls">
                                <?php echo $field->input; ?>
                            </div>
                        </div>
                    <?php } ?>
                </fieldset>
				<?php if ($fields = $this->ext_params->getFieldset('common')) { ?>
					<fieldset class="panelform form-horizontal">
                        <?php foreach($fields as $field) { ?>
                            <div class="control-group">
                                <div class="control-label">
                                    <?php echo $field->label; ?>
                                </div>
                                <div class="controls">
                                    <?php echo $field->input; ?>
                                </div>
                            </div>
                        <?php } ?>
					</fieldset>
				<?php }	?>
        <?php echo JHtml::_('tabs.end'); ?>
	</fieldset>
	
	<input type="hidden" name="option" value="com_mijosearch" />
	<input type="hidden" name="controller" value="extensions" />
	<input type="hidden" name="task" value="view" />
	<input type="hidden" name="modal" value="0" />
	<input type="hidden" name="id" value="<?php echo $this->row->id; ?>" />
	<?php echo JHTML::_('form.token'); ?>
</form>