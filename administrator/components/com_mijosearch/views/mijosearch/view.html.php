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

class MijosearchViewMijosearch extends MijosearchView {

	function display($tpl = null) {
		JToolBarHelper::title(JText::_('COM_MIJOSEARCH_COMMON_PANEL'),'mijosearch');
		$this->toolbar->appendButton('Popup', 'cache', JText::_('COM_MIJOSEARCH_COMMON_CLEAN_CACHE'), 'index.php?option=com_mijosearch&amp;controller=purge&amp;task=cache&amp;tmpl=component', 300, 250);
		JToolBarHelper::divider();

		if (JFactory::getUser()->authorise('core.admin', 'com_mijosearch')) {
			//JToolBarHelper::preferences('com_mijosearch');
			//JToolBarHelper::divider();
		}
		
		$this->toolbar->appendButton('Popup', 'help1', JText::_('Help'), 'http://www.mijosoft.com/support/docs/mijosearch/user-manual/control-panel?tmpl=component', 650, 500);

        $this->info = $this->get('Info');
		$this->stats = $this->get('Stats');
		
		parent::display($tpl);
	}
	
	function quickIconButton($link, $image, $text, $modal = 0, $x = 500, $y = 450, $new_window = false) {
		// Initialise variables
		$lang = JFactory::getLanguage();
		
		$new_window	= ($new_window) ? ' target="_blank"' : '';
  		?>

		<div style="float:<?php echo ($lang->isRTL()) ? 'right' : 'left'; ?>;">
			<div class="icon">
				<?php
				if ($modal) {
					JHTML::_('behavior.modal');
					
					if (!strpos($link, 'tmpl=component')) {
						$link .= '&amp;tmpl=component';
					}
				?>
					<a href="<?php echo $link; ?>" style="cursor:pointer" class="modal" rel="{handler: 'iframe', size: {x: <?php echo $x; ?>, y: <?php echo $y; ?>}}"<?php echo $new_window; ?>>
				<?php
				} else {
				?>
					<a href="<?php echo $link; ?>"<?php echo $new_window; ?>>
				<?php
				}
					echo JHTML::_('image', 'administrator/components/com_mijosearch/assets/images/'.$image, $text );
				?>
					<span><?php echo $text; ?></span>
				</a>
			</div>
		</div>
		<?php
	}
}