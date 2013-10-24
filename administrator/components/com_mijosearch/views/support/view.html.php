<?php
/**
* @version		1.5.0
* @package		MijoSearch
* @subpackage	MijoSearch
* @copyright	2009-2011 Mijosoft LLC, www.mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceSearch www.joomace.net
*/

// No Permission
defined('_JEXEC') or die('Restricted Access');

// View Class
class MijosearchViewSupport extends MijosearchView {

	function display($tpl = null) {
		// Toolbar
		JToolBarHelper::title(JText::_('COM_MIJOSEARCH_SUPPORT'), 'mijosearch');		
		JToolBarHelper::back(JText::_('Back'), 'index.php?option=com_mijosearch');
		
		if (JRequest::getCmd('task', '') == 'translators') {
			$this->document->setCharset('iso-8859-9');
		}
		
		parent::display($tpl);
	}
}