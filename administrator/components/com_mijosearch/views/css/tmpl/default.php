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
<form action="index.php" method="post" id="adminForm" name="adminForm">
<table class="adminform">
	<tr>
		<th>
			<?php echo JPATH_MIJOSEARCH.'/assets/css/mijosearch.css'; ?>
		</th>
	</tr>
	<tr>
		<td>
			<textarea style="width:100%;height:500px" cols="110" rows="25" name="filecontent" class="inputbox"><?php echo $this->content; ?></textarea>
		</td>
	</tr>
	</table>

<input type="hidden" name="option" value="com_mijosearch" />
<input type="hidden" name="controller" value="css" />
<input type="hidden" name="task" value="" />

<?php echo JHTML::_( 'form.token' ); ?>
</form>