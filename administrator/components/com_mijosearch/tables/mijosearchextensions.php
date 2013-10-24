<?php
/**
* @version		1.7.0
* @package		MijoSearch
* @subpackage	MijoSearch
* @copyright	2009-2011 Mijosoft LLC, www.mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceSearch www.joomace.net
*/

//No Permision
defined('_JEXEC') or die('Restricted access');

class TableMijosearchExtensions extends JTable {

	var $id 		 		= null;
	var $name 		 		= null;
	var $extension 	 		= null;
	var $params		 		= null;
	var $ordering			= null;
	var $client				= null;
	
	public function __construct(& $db) {
		parent::__construct('#__mijosearch_extensions', 'id', $db);
	}
	
	public function bind($array) {
		if (is_array($array['params'])) {
            $array['params']['handler'] = (int)$array['params']['handler'];

            $params = new JRegistry($array['params']);

			$array['params'] = $params->toString();
		}
		
		return parent::bind($array);
	}
}