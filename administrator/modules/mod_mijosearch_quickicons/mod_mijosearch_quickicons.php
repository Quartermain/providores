<?php
/**
 * @package		MijoSearch
 * @copyright	2009-2013 Mijosoft LLC, www.mijosoft.com
 * @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
 * @license		2009-2012 GNU/GPL based on AceSearch www.joomace.net
 */

// No Permission
defined('_JEXEC') or die('Restricted access');

JFactory::getDocument()->addStyleSheet('components/com_mijosearch/assets/css/mijosearch.css');

function getMijosearchIcon($link, $image, $text) {
	$lang = JFactory::getLanguage();
	?>
	<div class="icon-wrapper" style="float:<?php echo ($lang->isRTL()) ? 'right' : 'left'; ?>;">
		<div class="icon">
			<a href="<?php echo $link; ?>">
                <img src="<?php echo JURI::root(true); ?>/administrator/components/com_mijosearch/assets/images/<?php echo $image; ?>" alt="<?php echo $text; ?>" />
				<span><?php echo $text; ?></span>
			</a>
		</div>
	</div>
	<?php
}

function getMijosearchVersion() {
	$factory_file = JPATH_ADMINISTRATOR.'/components/com_mijosearch/library/mijosearch.php';
	$utility_file = JPATH_ADMINISTRATOR.'/components/com_mijosearch/library/utility.php';
	$cache_file   = JPATH_ADMINISTRATOR.'/components/com_mijosearch/library/cache.php';
	
	if (!file_exists($factory_file) || !file_exists($utility_file)) {
		return 0;
	}
	
	require_once($factory_file);
	require_once($utility_file);
	require_once($cache_file);
	
	$utility = new MijosearchUtility();
	$cache   = new MijosearchCache($lifetime = '315360000');
	
	$installed = $utility->getXmlText(JPATH_ADMINISTRATOR.'/components/com_mijosearch/a_mijosearch.xml', 'version');
	$version_info = $cache->getRemoteInfo();
	$latest = $version_info['mijosearch'];
	
	$version = version_compare($installed, $latest);
	
	return $version;
}

?>

<div id="cpanel">
	<?php
	if ($params->get('mijosearch_version', '1') == '1') {
		$link = 'index.php?option=com_mijosearch&amp;controller=upgrade&amp;task=view';
		$version = getMijosearchVersion();
		if ($version != 0) {
			getMijosearchIcon($link, 'icon-48-version-up.png', JText::_('MOD_UPGRADE_AVAILABLE'));
		} else {
			getMijosearchIcon($link, 'icon-48-version-ok.png', JText::_('MOD_UP-TO-DATE'));
		}
	}
	
	if ($params->get('mijosearch_configuration', '0') == '1') {
		$link = 'index.php?option=com_mijosearch&amp;controller=config&amp;task=edit';
		getMijosearchIcon($link, 'icon-48-configuration.png', JText::_('MOD_MIJOSEARCH_CONFIG'));
	}
	
	if ($params->get('mijosearch_extensions', '0') == '1') {
		$link = 'index.php?option=com_mijosearch&amp;controller=extensions&amp;task=view';
		getMijosearchIcon($link, 'icon-48-extensions.png', JText::_('MOD_MIJOSEARCH_EXT'));
	}
	
	if ($params->get('mijosearch_search', '1') == '1') {
		$link = 'index.php?option=com_mijosearch&amp;controller=search&amp;task=view';
		getMijosearchIcon($link, 'icon-48-search.png', JText::_('MOD_MIJOSEARCH_SEARCH'));
	}
	
	if ($params->get('mijosearch_filter', '0') == '1') {
		$link = 'index.php?option=com_mijosearch&amp;controller=filters&amp;task=view';
		getMijosearchIcon($link, 'icon-48-filters.png', JText::_('MOD_MIJOSEARCH_FILTERS'));
	}
	
	if ($params->get('mijosearch_statistics', '0') == '1') {
		$link = 'index.php?option=com_mijosearch&amp;controller=statistics&amp;task=view';
		getMijosearchIcon($link, 'icon-48-statistics.png', JText::_('MOD_MIJOSEARCH_STATISTICS'));
	}
	
	?>
</div>