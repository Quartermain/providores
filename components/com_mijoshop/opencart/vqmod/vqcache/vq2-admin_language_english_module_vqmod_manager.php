<?php
/*
* @package		MijoShop
* @copyright	2009-2013 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

// Button
$_['button_backup']        = 'Backup';
$_['button_cancel']        = 'Cancel';
$_['button_clear']         = 'Clear';
$_['button_download_log']  = 'Download Log';
$_['button_vqcache_dump']  = 'vqcache Dump';

// Heading
$_['heading_title']        = 'vQmod Manager';

// Columns
$_['column_action']        = 'Install / Uninstall';
$_['column_author']        = 'Author';
$_['column_delete']        = 'Delete';
$_['column_file_name']     = 'File Name';
$_['column_id']            = 'Name / Description';
$_['column_status']        = 'Status';
$_['column_version']       = 'Version';
$_['column_vqmver']        = 'vQmod Version';

// Entry
$_['entry_author']         = 'Author:'; // Change
$_['entry_backup']         = 'Backup vQmod Scripts:';
$_['entry_ext_store']      = 'Latest Version:';
$_['entry_ext_version']    = 'vQmod Manager Version:';
$_['entry_forum']          = 'OpenCart Forum Thread:';
$_['entry_license']        = 'License:';
$_['entry_upload']         = 'vQmod Script Upload:';
$_['entry_vqcache']        = 'vQmod Cache:';
$_['entry_vqmod_path']     = 'vQmod Path:';
$_['entry_website']        = 'Website:';

// Text Highlighting
$_['highlight']            = '<span class="highlight">%s</span>';

// vQmod Manager Use Errors
$_['error_delete']         = 'Warning: Unable to delete vQmod script!';
$_['error_filetype']       = 'Warning: Invalid filetype!  Please only upload .xml files.';
$_['error_install']        = 'Warning: Unable to install vQmod script!';
$_['error_invalid_xml']    = 'Warning: vQmod script XML syntax is not valid!  Please contact the author for support.';
$_['error_log_size']       = 'Warning: Your vQmod error log is %sMBs.  The limit for vQmod Manager is 6MB.  You can download the error log by FTP or by clicking the \'Download Log\' button in the Error Log tab.  Otherwise consider clearing it.';
$_['error_moddedfile']     = 'Warning: vQmod script attempts to mod file \'%s\' which does not appear to exist!';
$_['error_move']           = 'Warning: Unable to save file on server.  Please check directory permissions.';
$_['error_permission']     = 'Warning: You do not have permission to modify module vQmod Manager!';
$_['error_uninstall']      = 'Warning: Unable to uninstall vQmod script!';
$_['error_vqmod_opencart'] = 'Warning: \'vqmod_opencart.xml\' is rquired for vQmod to function properly!';

// $_FILE Upload Errors
$_['error_form_max_file_size']   = 'Warning: vQmod script exceeds max allowable size!';
$_['error_ini_max_file_size']    = 'Warning: vQmod script exceeds max php.ini file size!';
$_['error_no_temp_dir']          = 'Warning: No temporary directory found!';
$_['error_no_upload']            = 'Warning: No file selected for upload!';
$_['error_partial_upload']       = 'Warning: Upload incomplete!';
$_['error_php_conflict']         = 'Warning: Unknown PHP conflict!';
$_['error_unknown']              = 'Warning: Unknown error!';
$_['error_write_fail']           = 'Warning: Failed to write vQmod script!';

// vQmod Installation Errors
$_['error_error_log_write']            = 'Unabled to write to vQmod error log! Please set "/vqmod" directory permissions to 755 or 777 and try again.';
$_['error_opencart_version']           = 'OpenCart 1.5.x or later is required to use vQmod Manager!';
$_['error_opencart_xml']               = '"/vqmod/xml/vqmod_opencart.xml" does not appear to exist!  Please upload the OpenCart version of vQmod from <a href="http://code.google.com/p/vqmod/">http://code.google.com/p/vqmod/</a> and try again.';
$_['error_opencart_xml_version']       = 'You appear to be using a version of "vqmod_opencart.xml" that is out-of-date for your store!  Please install the latest OpenCart version of vQmod from <a href="http://code.google.com/p/vqmod/">http://code.google.com/p/vqmod/</a> and try again.';
$_['error_vqcache_dir']                = '"/vqmod/vqcache" directory does not appear to exist!';
$_['error_vqcache_write']              = 'Unabled to write to "/vqmod/vqcache" directory!  Set permissions to 755 or 777 and try again.';
$_['error_vqcache_files_missing']      = 'vQmod does not appear to be properly generating vqcache files!';
$_['error_vqmod_core']                 = 'Required file "vqmod.php" is missing!  Please install the latest OpenCart version of vQmod from <a href="http://code.google.com/p/vqmod/">http://code.google.com/p/vqmod/</a> and try again.';
$_['error_vqmod_dir']                  = 'The "/vqmod" directory does not appear to exist!';
$_['error_vqmod_install_link']         = 'vQmod does not appear to have been integrated with OpenCart! You can run the vQmod installer at <a href="%1$s">%1$s</a>.';
$_['error_vqmod_opencart_integration'] = 'vQmod does not appear to have been integrated with OpenCart!  Please upload the latest OpenCart version of vQmod from <a href="http://code.google.com/p/vqmod/">http://code.google.com/p/vqmod/</a> and try again.';
$_['error_vqmod_script_dir']           = '"/vqmod/xml" directory does not appear to exist!';
$_['error_vqmod_script_write']         = 'Unable to write to "/vqmod/xml" directory!  Set permissions to 755 or 777 and try again.';

// vQmod Manager Dependency Errors
$_['error_simplexml']       = '<a href="http://php.net/manual/en/book.simplexml.php">SimpleXML</a> must be installed for vQmod Manager to work properly!';
$_['error_ziparchive']      = '<a href="http://php.net/manual/en/class.ziparchive.php">ZipArchive</a> must be installed for vQmod Manager to work properly!';

// vQmod Log Errors
$_['error_mod_aborted']     = 'Mod Aborted';
$_['error_mod_skipped']     = 'Operation Skipped';

// vQmod Variable Settings
$_['setting_cachetime']     = 'cacheTime:<br /><span class="help">Depricated as of vQmod 2.2.0</span>';
$_['setting_logfolder']     = 'Log Folder:<br /><span class="help">vQmod 2.2.0 and later</span>';
$_['setting_logging']       = 'Error Logging:';
$_['setting_modcache']      = 'modCache:';
$_['setting_usecache']      = 'useCache:<br /><span class="help">Depricated as of vQmod 2.1.7</span>';

// Success
$_['success_clear_vqcache'] = 'Success: vQmod cache cleared!';
$_['success_clear_log']     = 'Success: vQmod error log cleared!';
$_['success_delete']        = 'Success: vQmod script deleted!';
$_['success_install']       = 'Success: vQmod script installed!';
$_['success_uninstall']     = 'Success: vQmod script uninstalled!';
$_['success_upload']        = 'Success: vQmod script uploaded!';

// Tabs
$_['tab_about']             = 'About';
$_['tab_error_log']         = 'Error Log';
$_['tab_settings']          = 'Settings and Maintenance';
$_['tab_scripts']           = 'vQmod Scripts';

// Text
$_['text_autodetect']       = 'vQmod appears to be installed at the following path. Press Save to confirm path and complete installation.';
$_['text_autodetect_fail']  = 'Unable to detect vQmod installation.  Please download and install the <a href="http://code.google.com/p/vqmod/downloads/list" target="_blank">latest version</a> or enter the non-standard server installation path.';
$_['text_cachetime']        = '%s seconds';
$_['text_delete']           = 'Delete';
$_['text_disabled']         = 'Disabled';
$_['text_enabled']          = 'Enabled';
$_['text_install']          = 'Install';
$_['text_module']           = 'Module';
$_['text_no_results']       = 'No vQmod scripts were found!';
$_['text_success']          = 'Success: You have modified module vQmod Manager!';
$_['text_unavailable']      = '&mdash;';
$_['text_uninstall']        = 'Uninstall';
$_['text_upload']           = 'Upload';
$_['text_usecache_help']    = 'useCache is depricated as of vQmod 2.1.7'; // @TODO
$_['text_vqcache_help']     = 'Some system files will always be present even after clearing the cache.';

// Version
$_['vqmod_manager_author']  = 'rph';
$_['vqmod_manager_license'] = 'GNU GPL';
$_['vqmod_manager_version'] = '2.0-beta.6';

// Javascript Warnings
$_['warning_required_delete']    = 'WARNING: Deleting \\\'vqmod_opencart.xml\\\' will cause vQmod to STOP WORKING! Continue?';
$_['warning_required_uninstall'] = 'WARNING: Uninstalling \\\'vqmod_opencart.xml\\\' will cause vQmod to STOP WORKING! Continue?';
$_['warning_vqmod_delete']       = 'WARNING: Deleting a vQmod script cannot be undone! Are you sure you want to do this?';
?>