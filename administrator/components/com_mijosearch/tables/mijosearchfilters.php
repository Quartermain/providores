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
defined('_JEXEC') or die('Restricted access');

class TableMijosearchFilters extends JTable {

	var $id 		= null;
	var $title		= null;
	var $published 	= null;
	var $author		= null;
	var $extension  = null;
	var $params 	= null;
	var $group_id	= null;
	var $date 		= null;
	
	function __construct(& $db) {
		parent::__construct('#__mijosearch_filters', 'id', $db);
	}
}