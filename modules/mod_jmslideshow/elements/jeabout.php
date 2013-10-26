<?php
/*
#------------------------------------------------------------------------
# Package - JoomlaMan JMSlideShow
# Version 1.0
# -----------------------------------------------------------------------
# Author - JoomlaMan http://www.joomlaman.com
# Copyright © 2012 - 2013 JoomlaMan.com. All Rights Reserved.
# @license http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 or Later
# Websites: http://www.JoomlaMan.com
#------------------------------------------------------------------------
*/
//-- No direct access
defined('_JEXEC') or die('Restricted access');
jimport('joomla.html.html');
jimport('joomla.form.formfield');
class JFormFieldJEAbout extends JFormField {
    protected $type = 'JEAbout'; //the form field type
    var $options = array();
    protected function getInput() {
        $html = '
            <div class="about-tab">
                JoomlaMan makes easy to use Joomla Templates and Extensions.<br/>
				To view all of our Templates and Extensions, please visits <a href="http://www.joomlaman.com">www.joomlaman.com</a><br/>
				If you require support, please login to your account and use our support forum and ticket system
            </div>
        ';
        return $html;
    }
    function getLabel() {
        return '';
    }
}
