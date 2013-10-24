<?php
/**
* @version		1.5.0
* @package		MijoSearch
* @subpackage	MijoSearch
* @copyright	2010-2011 Mijosoft LLC, www.mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceSearch www.joomace.net
*/

//No Permision
defined( '_JEXEC' ) or die( 'Restricted access' );
?>
<script language="javascript">
	function resetFilters(){
		document.adminForm.search_name.value='';
		document.adminForm.search_com.value='';
		document.adminForm.submit();
	}
</script>

<form action="<?php echo JFilterOutput::ampReplace(JFactory::getURI()->toString()); ?>" method="post" name="adminForm" id="adminForm">
	<table class="adminlist table table-striped" cellspacing="1">
		<thead>
			<tr>
				<th width="13px">
					<?php echo JText::_('#');?>
				</th>
				<th width="20px">
					<input type="checkbox" name="checkall-toggle" value="" title="<?php echo JText::_('JGLOBAL_CHECK_ALL'); ?>" onclick="Joomla.checkAll(this)" />
				</th>
				<th nowrap="nowrap">
					<?php echo JHTML::_('grid.sort', JText::_('COM_MIJOSEARCH_STATISTICS_TEXT' ), 'keyword', $this->lists['order_dir'], $this->lists['order']); ?>
				</th>
				<th width="140px" class="title">
					<?php echo JHTML::_('grid.sort', JText::_('COM_MIJOSEARCH_EXTENSIONS_VIEW_COMPONENT' ), 'extension', $this->lists['order_dir'], $this->lists['order']); ?>
				</th>
				<th width="110px" class="title">
					<?php echo JHTML::_('grid.sort', JText::_('COM_MIJOSEARCH_STATISTICS_REQUESTED'), 'search_count', $this->lists['order_dir'], $this->lists['order']); ?>
				</th>
				<th width="110px" class="title">
					<?php echo JHTML::_('grid.sort', JText::_('COM_MIJOSEARCH_STATISTICS_RETURNED'), 'search_result', $this->lists['order_dir'], $this->lists['order']); ?>
				</th>
				<th width="150px" class="title">
					<?php echo JHTML::_('grid.sort', JText::_('COM_MIJOSEARCH_STATISTICS_DATE'), 'search_date', $this->lists['order_dir'], $this->lists['order']); ?>
				</th>
			</tr>
			<tr>
				<th colspan="2">
					<?php echo $this->lists['reset_filters']; ?>
				</th>
				<th>
					<?php echo $this->lists['search_name']; ?>
				</th>
				<th>
					<?php echo $this->lists['search_com']; ?>
				</th>			
				<th>
					&nbsp;
				</th>
				<th>
					&nbsp;
				</th>
				<th>
					&nbsp;
				</th>
			</tr>
		</thead>
		<tbody>
		<?php
		$k =0;
		$n=count($this->items);
		for ($i = 0; $i < $n; $i ++) {
			$row = $this->items[$i];
			
			$checked = JHTML::_('grid.id', $i ,$row->id);
			
			?>
			<tr class="<?php echo "row$k";?>">
				<td>
					<?php echo $this->pagination->getRowOffset($i); ?>
				</td>
				<td align="center">
					<?php echo $checked;?>
				</td>
				<td >
					<?php echo $row->keyword;?>
				</td>
				<td align="center">
					<?php echo $row->extension;?>
				</td>
				<td align="center">
					<?php echo $row->search_count;?>
				</td>
				<td align="center">
					<?php echo $row->search_result;?>
				</td>
				<td align="center">
					<?php echo $row->search_date;?>
				</td>
			</tr>
		<?php
		$k = 1 - $k;
		}
		?>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="8"><?php echo $this->pagination->getListFooter(); ?></td>
			</tr>
		</tfoot>
	</table>
	
	<input type="hidden" name="option" value="com_mijosearch" />
	<input type="hidden" name="controller" value="statistics"/>
	<input type="hidden" name="task" value="view" />
	<input type="hidden" name="boxchecked" value="0" />
	<input type="hidden" name="filter_order" value="<?php echo $this->lists['order']; ?>" />
	<input type="hidden" name="filter_order_Dir" value="<?php echo $this->lists['order_dir']; ?>" />
	<?php echo JHTML::_('form.token'); ?>
</form>	