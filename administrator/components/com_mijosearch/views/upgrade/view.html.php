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
class MijosearchViewUpgrade extends MijosearchView {

	function view($tpl = null) {		
		// Toolbar
		JToolBarHelper::title(JText::_('COM_MIJOSEARCH_UPGRADE_TITLE'), 'mijosearch');
		$this->toolbar->appendButton('Popup', 'help1', JText::_('Help'), 'http://www.mijosoft.com/support/docs/mijosearch/installation-upgrading/upgrade?tmpl=component', 650, 500);
		
		$versions = array(2);
		$version_info = MijoSearch::get('cache')->getRemoteInfo();
		$versions['latest'] = $version_info['mijosearch'];
		$versions['installed'] = MijoSearch::get('utility')->getXmlText(JPATH_MIJOSEARCH_ADMIN.'/a_mijosearch.xml', 'version');
		
		$this->versions = $versions;
		
		parent::display($tpl);
	}
}