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

class MijosearchViewCSS extends MijosearchView {

	function view($tpl = null){
		// Toolbar
		JToolBarHelper::title(JText::_('CSS' ), 'mijosearch');
        JToolBarHelper::apply();
        JToolBarHelper::save();
        JToolBarHelper::cancel();
		
		global $mainframe;

		jimport('joomla.filesystem.file');
		$content = JFile::read(JPATH_MIJOSEARCH.'/assets/css/mijosearch.css');

		if ($content !== false)	{
			$content = htmlspecialchars($content, ENT_COMPAT, 'UTF-8');
		}
		else {
			$msg = JText::sprintf('Operation Failed Could not open', JPATH_MIJOSEARCH.'/assets/css/mijosearch.css');
			$mainframe->redirect('index.php?option=com_mijosearch', $msg);
		}
		
		$this->content = $content;
			
		parent::display($tpl);
	}
}