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

class MijosearchControllerAjax extends MijosearchController {

	function changeExtension(){
		$extension = JRequest::getCmd('ext');

		if (!empty($extension)) {
			echo MijoSearch::getExtraFields($extension);
		}
	}
	
	function changeUser() {
		$users = "";
		
		$extension = JRequest::getCmd('ext', '-1');
		$id = JRequest::getInt('usr', '0');
		
		if ($extension != '-1') {
			$mijosearch_ext = MijoSearch::getExtension($extension);
			
			$users = $mijosearch_ext->getUser($id);
		}
		
		if (!empty($users)) {
			?>
			<strong><?php echo JText::_("COM_MIJOSEARCH_EXTENSIONS_VIEW_AUTHOR"); ?>:</strong><br />
			<?php
			echo $users;
		}
	}
	
	function complete() {
		$return	= MijosearchSearch::getComplete();
		
		echo json_encode($return);
		
		JFactory::getApplication()->close();
	}
}