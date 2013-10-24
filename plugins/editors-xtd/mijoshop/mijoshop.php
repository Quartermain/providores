<?php
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

// No Permission
defined('_JEXEC') or die ('Restricted access');
jimport( 'joomla.plugin.plugin' );

class plgButtonMijoshop extends JPlugin
{
	
	public function __construct(& $subject, $config)
	{
		parent::__construct($subject, $config);
		$this->loadLanguage();
		
		require_once(JPATH_ROOT.'/components/com_mijoshop/mijoshop/mijoshop.php');
	}

	function onDisplay($name, $asset = null, $author = null) {
		
		$app 			= JFactory::getApplication();
		$enableFrontend = $this->params->get('enable_frontend', 0);
		$link			= "index.php?option=com_mijoshop&route=common/editorbutton&format=raw&tmpl=component&name=".$name;

        MijoShop::get('base')->addHeader(JPATH_ROOT.'/plugins/editors-xtd/mijoshop/assets/css/mijoshop_editor_button.css');

        JHTML::_('behavior.modal');

		$button = new JObject();
		$button->set('modal', true);
		$button->set('link', $link);
		$button->set('text', JText::_('MijoShop'));
		$button->set('name', 'editor_button');
		$button->set('options', "{handler: 'iframe', size: {x: 400, y: 370}}");
		
		if ($enableFrontend == 0) {
			if (!$app->isAdmin()) {
				$button = null;
			}
		}
		
		return $button;
	}
}