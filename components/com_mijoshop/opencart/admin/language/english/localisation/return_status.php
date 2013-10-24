<?php
/*
* @package		MijoShop
* @copyright	2009-2013 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

// Heading
$_['heading_title']    = 'Return Status';

// Text
$_['text_success']     = 'Success: You have modified return statuses!';

// Column
$_['column_name']      = 'Return Status Name';
$_['column_action']    = 'Action';

// Entry
$_['entry_name']       = 'Return Status Name:';

// Error
$_['error_permission'] = 'Warning: You do not have permission to modify return statues!';
$_['error_name']       = 'Return Status Name must be between 3 and 32 characters!';
$_['error_default']    = 'Warning: This return status cannot be deleted as it is currently assigned as the default return status!';
$_['error_return']     = 'Warning: This return status cannot be deleted as it is currently assigned to %s returns!';
?>