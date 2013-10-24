<?php
/**
* @package		MijoSearch
* @copyright	2009-2012 Mijosoft LLC, www.mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

defined('_JEXEC') or die('Restricted access');

$controller	= JRequest::getCmd('controller', 'mijosearch');

JHTML::_('behavior.switcher');

// Load submenus
$views = array(''											=> JText::_('COM_MIJOSEARCH_COMMON_PANEL'),
				'&controller=config&task=edit'				=> JText::_('COM_MIJOSEARCH_CPANEL_CONFIGURATION'),
				'&controller=extensions&task=view'			=> JText::_('COM_MIJOSEARCH_CPANEL_EXTENSIONS'),
				'&controller=filters&task=view'				=> JText::_('COM_MIJOSEARCH_CPANEL_FILTERS'),
				'&controller=statistics&task=view'			=> JText::_('COM_MIJOSEARCH_CPANEL_STATISTICS'),
				'&controller=search&task=view'				=> JText::_('COM_MIJOSEARCH_CPANEL_SEARCH'),
				'&controller=css&task=edit'					=> JText::_('CSS'),
				'&controller=upgrade&task=view'				=> JText::_('COM_MIJOSEARCH_CPANEL_UPGRADE'),
				'&controller=support&task=support'			=> JText::_('COM_MIJOSEARCH_SUPPORT')
				);	

foreach($views as $key => $val) {
	if ($key == '') {
		$img = 'mijosearch.png';

        $active	= (($controller == $key) or ($controller == 'mijosearch'));
	}
	else {
		$a = explode('&', $key);
		$c = explode('=', $a[1]);

		$img = 'icon-16-as-'.$c[1].'.png';

        $active	= ($controller == $c[1]);
	}
	
	JSubMenuHelper::addEntry('<img src="components/com_mijosearch/assets/images/'.$img.'" style="margin-right: 2px;" align="absmiddle" />&nbsp;'.$val, 'index.php?option=com_mijosearch'.$key, $active);
}