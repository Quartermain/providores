<?php
/*
* @package		MijoShop
* @copyright	2009-2013 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

// No Permission
defined('_JEXEC') or die('Restricted Access');

// Imports
jimport('joomla.installer.installer');
jimport('joomla.installer.helper');
jimport('joomla.filesystem.file');
jimport('joomla.filesystem.folder');

class ModelCommonUpgrade extends Model {

    // Upgrade
    public function upgrade() {
        $base = Mijoshop::get('base');
        $utility = Mijoshop::get('utility');

        $type = JRequest::getCmd('type');
        if ($type == 'upload') {
            $userfile = JRequest::getVar('install_package', null, 'files', 'array');
            $package = $utility->getPackageFromUpload($userfile);
        }
        elseif ($type == 'server') {
            $package = $utility->getPackageFromServer('index.php?option=com_mijoextensions&view=download&model=com_mijoshop&pid='.$base->getConfig()->get('pid'));
        }

        if (!$package || empty($package['dir'])) {
            //$this->setState('message', 'Unable to find install package.');
            return false;
        }

        $file_name = $package['dir'].'/com_mijoshop.zip';

        if (JFile::exists($file_name)) {
            $p1 = $utility->unpack($file_name);
            $installer = new JInstaller();
            $installer->install($p1['dir']);

            $lib_file_name = $package['dir'].'/pkg_mijoshop_library.zip';
            if (JFile::exists($lib_file_name)) {
                $p2 = $utility->unpack($lib_file_name);
                $installer = new JInstaller();
                $installer->install($p2['dir']);
            }

            $plg_file_name = $package['dir'].'/plg_mijoshop_jquery.zip';
            if (JFile::exists($plg_file_name)) {
                $p3 = $utility->unpack($plg_file_name);
                $installer = new JInstaller();
                $installer->install($p3['dir']);
            }

            /*$thm_file_name = $package['dir'].'/pkg_mijoshop_themes.zip';
            if (JFile::exists($thm_file_name)) {
                $p4 = $utility->unpack($thm_file_name);
                $installer = new JInstaller();
                $installer->install($p4['dir']);
            }*/
        }
        else {
            $installer = new JInstaller();
            $installer->install($package['dir']);
        }

        JFolder::delete($package['dir']);

        return true;
    }
}