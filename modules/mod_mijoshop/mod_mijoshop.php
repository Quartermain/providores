<?php
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

// No Permission
defined('_JEXEC') or die ('Restricted access');

require_once(JPATH_SITE.'/components/com_mijoshop/mijoshop/mijoshop.php');

$base = MijoShop::get('base');

if (!$base->checkRequirements('module')) {
    return;
}

$outputs = MijoShop::get('opencart')->loadModule($params->get('module', 'mijoshopcart'), $params->get('layout_id', '12'));

foreach($outputs as $output) {
    if (is_object($output) || empty($output)) {
        return;
    }

    $output = preg_replace('#(<div class="box-heading">)(.*)(</div>)#e', "", $output);
    $output = preg_replace('#(<div class="top">)(.*)(</div>)#e', "", $output);

    $output = $base->replaceOutput($output, 'module');

    echo $output;
}