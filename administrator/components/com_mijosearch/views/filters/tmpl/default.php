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
	function resetFilters() {
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
					<?php echo JText::_('COM_MIJOSEARCH_COMMON_NUM');?>
				</th>	
				<th width="20px">
					<input type="checkbox" name="checkall-toggle" value="" title="<?php echo JText::_('JGLOBAL_CHECK_ALL'); ?>" onclick="Joomla.checkAll(this)" />
				</th>
				<th nowrap="nowrap">
					<?php echo JHTML::_('grid.sort', JText::_('COM_MIJOSEARCH_FIELDS_TITLE'), 'title', $this->lists['order_dir'], $this->lists['order']);?>
				</th>
				<th width="250px" class="title">
					<?php echo JHTML::_('grid.sort', JText::_('COM_MIJOSEARCH_EXTENSIONS_VIEW_COMPONENT' ), 'extension', $this->lists['order_dir'], $this->lists['order']);?>
				</th>				
				<th width="80px" class="title">
					<?php echo JHTML::_('grid.sort', JText::_('Published' ), 'state', $this->lists['order_dir'], $this->lists['order']);?>
				</th>
			</tr>
			<tr>
				<th colspan="2">
					<?php echo $this->lists['reset_filters'];?>
				</th>				
				<th>
					<?php echo $this->lists['search_name'];?>
				</th>
				
				<th>
					<?php echo $this->lists['search_com']; ?>
				</th>
				<th>
					&nbsp;
				</th>
			</tr>
		</thead>
		<tbody>
		<?php
		$k =$gk =0;
		
		$gs = count($this->groups); 
		for ($g = 0; $g < $gs; $g ++) {
			$group = $this->groups[$g];
						
            $delete_g_link = JRoute::_('index.php?option=com_mijosearch&controller=filters&task=deleteGroup&id='.$group->id);
            $edit_g_link = JRoute::_('index.php?option=com_mijosearch&controller=filters&task=editGroup&cid[]='.$group->id);
            ?>
            <tr class="<?php echo "group$gk";?>">
                <td>
                    <?php echo $this->pagination->getRowOffset($g); ?>
                </td>
                <td align="center">
                    <a href="<?php echo $delete_g_link;?>"><img src="<?php echo 'components/com_mijosearch/assets/images/remove.gif'; ?>" width="16" height="16" border="0" alt="No"/></a>
                </td>
                <td>
                    <a href="<?php echo $edit_g_link;?>"><?php echo $group->title;?></a>
                </td>
                <td align="center" colspan="2">
                    &nbsp;
                </td>
            </tr>
			<?php
			
			$n = count($this->items);
			for ($i = 0; $i < $n; $i ++) {
				$row = $this->items[$i];
				if($row->group_id != $group->id) {
					continue;
				}
				$checked = JHTML::_('grid.id', $i ,$row->id);
				
				$published_icon = $this->getIcon($i, $row->published ? 'unpublish' : 'publish', $row->published ? 'icon-16-published-on.png' : 'icon-16-published-off.png');
				
				$link = JRoute::_('index.php?option=com_mijosearch&controller=filters&task=edit&cid[]='.$row->id);
				?>
				<tr class="<?php echo "row$k";?>">
					<td>
						<?php echo $this->pagination->getRowOffset($i); ?>
					</td>
					<td align="center">
						<?php echo $checked;?>
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<a href="<?php echo $link;?>">|_ <?php echo $row->title;?></a>
					</td>
					<td align="center">
						<?php echo $row->extension;?>
					</td>				
					<td align="center">
						<?php echo $published_icon;?>
					</td>
				</tr>
			<?php
			$k = 1 - $k;
			}
			$gk = 1 - $gk;
		} ?>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="6"><?php echo $this->pagination->getListFooter(); ?></td>
			</tr>
		</tfoot>
	</table>
	
	<input type="hidden" name="option" value="com_mijosearch" />
	<input type="hidden" name="controller" value="filters"/>
	<input type="hidden" name="task" value="view" />
	<input type="hidden" name="boxchecked" value="0" />
	<input type="hidden" name="filter_order" value="<?php echo $this->lists['order']; ?>" />
	<input type="hidden" name="filter_order_Dir" value="<?php echo $this->lists['order_dir']; ?>" />
	<?php echo JHTML::_('form.token'); ?>
</form>	