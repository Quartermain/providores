<?php
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

//No Permision
defined('_JEXEC') or die('Restricted access');

jimport('joomla.filesystem.file');
jimport('joomla.filesystem.folder');
require_once(JPATH_ROOT.'/components/com_mijoshop/mijoshop/mijoshop.php');

jimport('joomla.form.formfield');

class JFormFieldMijoshopModule extends JFormField {

    protected $type = 'MijoshopModule';

    protected function getInput() {
        $files = JFolder::files(JPATH_ROOT.'/components/com_mijoshop/opencart/catalog/controller/module', '', false, false, array('index.html', 'cart.php'));

        if (empty($files) || !is_array($files)) {
            return 'No modules created.';
        }

        $options = array();

        foreach ($files as $file) {
            $_title = '';
            $_value = JFile::stripExt($file);

            $_file = JPATH_ROOT.'/components/com_mijoshop/opencart/catalog/language/english/module/'.$file;
            if (JFile::exists($_file)) {
                require_once($_file);

                if (isset($_['heading_title'])) {
                    $_title = $_['heading_title'];
                }
            }

            if (empty($_title)) {
                $_title = ucwords(str_replace('_', ' ', $_value));
            }

            $_title .= " ({$_value})";

            $options[] = array('value' => $_value, 'text' => $_title);
        }

        return JHTML::_('select.genericlist', $options, $this->name, 'class="inputbox" style="width:200px !important;"', 'value', 'text', $this->value, $this->name);
    }
}
