<?php
/*
* @package		MijoShop
* @copyright	2009-2013 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/
// No Permission
defined('_JEXEC') or die ('Restricted access');

// Heading
$_['heading_title']    = 'Theme Editor';

// Text
$_['text_edit']                 = '<b>File Location:</b> <span style="color: %s">%s</span>';
$_['text_wait']                 = 'Please wait...';
$_['text_file_empty']           = 'File is empty.';
$_['text_success']              = 'Success: The changes in the file has been saved!';
$_['text_success_restored']     = 'Success: This file has been successfully restored!';
$_['text_success_settings']     = 'Success: Settings has been saved!';
$_['text_success_delete_cache'] = 'Success: Files deleted!';
$_['text_confirm_remove_files'] = 'Are you sure you want to do this?';
$_['text_ftp_connect']          = '<span style="color: #458B00;"> CONNECTED</span>';
$_['text_ftp_failed_connect']   = '<span style="color: #ff0000;"> FAILED CONNECTED</span>';
$_['text_backup']               = 'Data to FTP:';
$_['text_folder_no_writable']   = 'Cache directory needs to be writable to work!<br /> %s';

// Entry
$_['entry_available_backups']   = 'Available backups:';
$_['entry_backup_files']        = 'Backup files:';
$_['entry_last_backup_files']   = 'Last files:';
$_['entry_ftp_host']            = 'Host:';
$_['entry_ftp_port']            = 'Port:';
$_['entry_ftp_username']        = 'Username:';
$_['entry_ftp_password']        = 'Password:';
$_['entry_ftp_path']            = 'Server path to themes catalog:';

// Button
$_['button_clear_cache']         = 'Remove Backups';

// Error
$_['error_permission']           = 'Warning: You do not have permission to modify themes editor!';
$_['error_not_saved']            = 'Warning: Changes in the file are not saved (check chmod)!';
$_['error_not_restored']         = 'Warning: The file was not restored!';
$_['error_not_found_file_cache'] = 'Warning: File not found cache!';
$_['error_file_not_exists']      = 'Warning: File does not exist!';
$_['error_ftp_host']             = 'Host must be greater than 4 and less than 128 characters!';
$_['error_ftp_username']         = 'Username must be greater than 1 and less than 90 characters!';
$_['error_ftp_password']         = 'Wrong password!';
$_['error_ftp_path']             = 'Server path is required!';
$_['error_function_ftp_connect'] = 'Warning: <b>FTP</b> functions are not available!';
$_['error_failed_ftp_connect']   = 'Warning: Couldn\'t connect to %s';
$_['error_failed_file_chmod']    = 'Operation can not be completed due to lack of write permissions for that file / directory!';
$_['error_failed_restore_chmod'] = 'Failed to retrieve copies of the file (most likely error occurred during the chmod change)';
?>