<?php
/**
* @version		1.5.0
* @package		AceSarch
* @subpackage	AceSarch
* @copyright	2009-2011 Mijosoft LLC, www.mijosoft.com
* @license		GNU/GPL, http://www.gnu.org/copyleft/gpl.html
*/

// No Permission
defined('_JEXEC') or die('Restricted Access');

// View Class
class MijosearchViewPurge extends MijosearchView {

	function view($tpl = null) {
		// Get data from the model
		$this->count = $this->get('CountCache');
		
		parent::display($tpl);
	}
}