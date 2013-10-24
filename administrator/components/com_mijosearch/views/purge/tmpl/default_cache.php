<?php
/**
* @version		1.5.0
* @package		MijoSearch
* @subpackage	MijoSearch
* @copyright	2009-2011 Mijosoft LLC, www.mijosoft.com
* @license		GNU/GPL, http://www.gnu.org/copyleft/gpl.html
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

?>
<form action="index.php?option=com_mijosearch&amp;controller=purge&amp;task=cache&amp;tmpl=component" name="adminForm" method="post">
	<fieldset>
		<legend><?php echo JText::_('COM_MIJOSEARCH_COMMON_CACHE'); ?></legend>
		<table>
			<tr>
				<td width="5%" height="20">
					&nbsp;
				</td>
				<td width="70%" height="20">
					<label for="name">
						<b><?php echo JText::_('Type'); ?></b>
					</label>
				</td>
				<td width="25%" height="20">
					<label for="name">
						<b><?php echo JText::_('COM_MIJOSEARCH_COMMON_RECORDS'); ?></b>
					</label>
				</td>
			</tr>
			<tr>
				<td width="5%" height="20">
					<input type="checkbox" name="cache_versions" value="1" />
				</td>
				<td width="70%" height="20">
					<label for="name">
						<?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_CACHE_VERSION'); ?>
					</label>
				</td>
				<td width="25%" height="20">
					<label for="name">
						<?php echo $this->count['versions']; ?>
					</label>
				</td>
			</tr>
			<tr>
				<td width="5%" height="20">
					<input type="checkbox" name="cache_extensions" value="1" />
				</td>
				<td width="70%" height="20">
					<label for="name">
						<?php echo JText::_('COM_MIJOSEARCH_CPANEL_EXTENSIONS'); ?>
					</label>
				</td>
				<td width="25%" height="20">
					<label for="name">
						<?php echo $this->count['extensions']; ?>
					</label>
				</td>
			</tr>
		</table>
		<br/>
		<input type="submit" class="button" name="cleancache" onclick="window.top.setTimeout('window.parent.document.getElementById(\'sbox-window\').close();', 1500);" value="<?php echo JText::_('COM_MIJOSEARCH_COMMON_CLEAN_CACHE'); ?>" />
	</fieldset>
	
	<input type="hidden" name="option" value="com_mijosearch" />
	<input type="hidden" name="controller" value="purge" />
	<input type="hidden" name="task" value="cleancache" />
	<?php echo JHTML::_('form.token'); ?>
</form>
<br/>