<?php
/*
* @package		MijoShop
* @copyright	2009-2013 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

class Session {
	public $data = array();
			
  	public function __construct($session_id = '') {		
		ini_set('session.use_cookies', 'On');
		ini_set('session.use_trans_sid', 'Off');
		
		if ($session_id) {
			session_id($session_id);
		}
		
		//if (preg_match('/^[0-9a-z]*$/i', session_id())) {
            session_set_cookie_params(0, '/');
            session_start();

            $this->data =& $_SESSION;
        //}
	}
	
	function getId() {
		return session_id();
	}
}
?>