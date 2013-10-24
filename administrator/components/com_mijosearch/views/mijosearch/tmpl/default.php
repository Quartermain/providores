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

?>

<script language="javascript" type="text/javascript">
	function upgrade() {	    
	    document.adminForm.controller.value = 'upgrade';
		document.adminForm.submit();
	}
	
	function search() {
	    document.adminForm.controller.value = 'search';
		document.adminForm.submit();
	}
</script>

<form name="adminForm" id="adminForm" action="index.php?option=com_mijosearch" method="post">
	<table cellspacing="0" cellpadding="0" border="0" width="100%">
		<tr>
			<th>		
				<?php
					if(empty($this->MijosearchConfig->pid) && (MIJOSEARCH_PACK == 'plus' || MIJOSEARCH_PACK == 'pro')){
						JError::raiseWarning('100', JText::sprintf('COM_MIJOSEARCH_CPANEL_STATUS_NOTE_PERSONAL_ID', '<a href="index.php?option=com_mijosearch&controller=config&task=edit">', '</a>'));
					}
				?>	
			</th>
		</tr>
		<tr>
			<td valign="top" width="58%">
				<table>
					<tr>
						<td>
							<div id="cpanel" width="30%">
							<?php
							$option = JRequest::getWord('option');
							
							$link = 'index.php?option='.$option.'&amp;controller=config&amp;task=edit';
							$this->quickIconButton($link, 'icon-48-configuration.png', JText::_('COM_MIJOSEARCH_CPANEL_CONFIGURATION'));

							$link = 'index.php?option='.$option.'&controller=extensions&task=view';
							$this->quickIconButton($link, 'icon-48-extensions.png', JText::_('COM_MIJOSEARCH_CPANEL_EXTENSIONS'));
							
							$link = 'index.php?option='.$option.'&amp;controller=upgrade&amp;task=view';
							$this->quickIconButton($link, 'icon-48-upgrade.png', JText::_('COM_MIJOSEARCH_CPANEL_UPGRADE'));
							?>
							
							<br /><br /><br /><br /><br /><br /><br />
							
							<?php
							$link = 'index.php?option='.$option.'&amp;controller=filters&amp;task=view';
							$this->quickIconButton($link, 'icon-48-filters.png', JText::_('COM_MIJOSEARCH_CPANEL_FILTERS'));
							
							$link = 'index.php?option='.$option.'&amp;controller=statistics&amp;task=view';
							$this->quickIconButton($link, 'icon-48-statistics.png', JText::_('COM_MIJOSEARCH_CPANEL_STATISTICS'));
							
							$link = 'index.php?option='.$option.'&amp;controller=search&amp;task=view';
							$this->quickIconButton($link, 'icon-48-search.png', JText::_('COM_MIJOSEARCH_CPANEL_SEARCH'));
							
							$link = 'index.php?option='.$option.'&amp;controller=css&amp;task=view';
							$this->quickIconButton($link, 'icon-48-css.png', JText::_('CSS'));
							?>
							
							<br /><br /><br /><br /><br /><br /><br />
							
							<?php
							$link = 'index.php?option='.$option.'&amp;controller=support&amp;task=support';
							$this->quickIconButton($link, 'icon-48-support.png', JText::_('COM_MIJOSEARCH_CPANEL_SUPPORT'), true, 650, 420);
							
							$link = 'index.php?option='.$option.'&amp;controller=support&amp;task=translators';
							$this->quickIconButton($link, 'icon-48-translators.png', JText::_('COM_MIJOSEARCH_CPANEL_TRANSLATORS'), true);
							
							$link = 'http://www.mijosoft.com/joomla-extensions/mijosearch/changelog?tmpl=component';
							$this->quickIconButton($link, 'icon-48-changelog.png', JText::_('COM_MIJOSEARCH_CPANEL_CHANGELOG'), true);
							
							$link = 'http://www.mijosoft.com';
							$this->quickIconButton($link, 'icon-48-mijosoft.png', 'Mijosoft.com', false, 0, 0, true);
							
							?>
							</div>
						</td>
					</tr>
				</table>
			</td>

			<td valign="top" width="42%" style="padding: 7px 0 0 5px">
                <?php echo JHtml::_('sliders.start', 'mijosearch'); ?>
                <?php echo JHtml::_('sliders.panel', JText::_('COM_MIJOSEARCH_CPANEL_WELLCOME'), 'welcome'); ?>
				<table class="adminlist">
					<tr>
						<td valign="top" width="50%" align="center">
							<table class="adminlist table table-striped">
								<?php
									$rowspan = 5;
									$pid = ((MIJOSEARCH_PACK == 'plus' || MIJOSEARCH_PACK == 'pro') && empty($this->MijosearchConfig->pid)); 
									if ($pid) {
										$rowspan = 6;
									}
								?>
								<tr height="70">
									<td width="%25">
										<?php
											if ($this->info['version_enabled'] == 0) {
												echo JHTML::_('image', 'administrator/templates/hathor/images/header/icon-48-info.png', null);
											} elseif ($this->info['version_status'] == 0) {
												echo JHTML::_('image', 'administrator/templates/hathor/images/header/icon-48-checkin.png', null);
											} elseif($this->info['version_status'] == -1) {
												echo JHTML::_('image', 'administrator/templates/hathor/images/header/icon-48-help_header.png', null);
											} else {
												echo JHTML::_('image', 'administrator/templates/hathor/images/header/icon-48-help_header.png', null);
											}
										?>
									</td>
									<td width="%35">
										<?php
											if ($this->info['version_enabled'] == 0) {
												echo '<b>'.JText::_('COM_MIJOSEARCH_CPANEL_VERSION_CHECKER_DISABLED_1').'</b>';
											} elseif ($this->info['version_status'] == 0) {
												echo '<b><font color="green">'.JText::_('COM_MIJOSEARCH_CPANEL_LATEST_VERSION_INSTALLED').'</font></b>';
											} elseif($this->info['version_status'] == -1) {
												echo '<b><font color="red">'.JText::_('COM_MIJOSEARCH_CPANEL_OLD_VERSION').'</font></b>';
											} else {
												echo '<b><font color="orange">'.JText::_('COM_MIJOSEARCH_CPANEL_NEWER_VERSION').'</font></b>';
											}
										?>
									</td>
									<td align="center" style="vertical-align: middle;" rowspan="<?php echo $rowspan; ?>">
										<a href="http://www.mijosoft.com/joomla-extensions/mijosearch" target="_blank">
										<img src="components/com_mijosearch/assets/images/logo.png" width="140" height="140" style="display: block; margin: auto;" alt="MijoSearch" title="MijoSearch" align="middle" border="0">
										</a>
									</td>
								</tr>
								<?php if ($pid) { ?>
								<tr height="40">
									<td>
										<?php echo '<b><font color="red">'.JText::_('COM_MIJOSEARCH_CONFIG_MAIN_UPGRADE_ID').'</font></b>';?>
									</td>
									<td>
										<input type="text" name="pid" id="pid" class="inputbox" size="18" style="width: 150px;" />
										&nbsp;
										<input type="button" class="btn btn-danger" style="margin-bottom: 10px;" onclick="javascript: submitbutton('saveDownloadID')" value="<?php echo JText::_('Save'); ?>" />
									</td>
								</tr>
								<?php } ?>
								<tr height="40">
									<td>
										<?php
											if($this->info['version_status'] == 0 || $this->info['version_enabled'] == 0) {
												echo JText::_('COM_MIJOSEARCH_CPANEL_LATEST_VERSION');
											} elseif($this->info['version_status'] == -1) {
												echo '<b><font color="red">'.JText::_('COM_MIJOSEARCH_CPANEL_LATEST_VERSION').'</font></b>';
											} else {
												echo '<b><font color="orange">'.JText::_('COM_MIJOSEARCH_CPANEL_LATEST_VERSION').'</font></b>';
											}
										?>
									</td>
									<td>
										<?php
											if ($this->info['version_enabled'] == 0) {
												echo JText::_('COM_MIJOSEARCH_CPANEL_VERSION_CHECKER_DISABLED_2');
											} elseif($this->info['version_status'] == 0) {
												echo $this->info['version_latest'];
											} elseif($this->info['version_status'] == -1) {
												// Version output in red
												echo '<b><font color="red">'.$this->info['version_latest'].'</font></b>&nbsp;&nbsp;&nbsp;&nbsp;';
												?>
												<input type="button" class="btn btn-danger" value="<?php echo JText::_('COM_MIJOSEARCH_CPANEL_UPGRADE'); ?>" onclick="upgrade();" />
												<?php
											} else {
												echo '<b><font color="orange">'.$this->info['version_latest'].'</font></b>';
											}
										?>
									</td>
								</tr>
								<tr height="40">
									<td>
										<?php echo JText::_('COM_MIJOSEARCH_CPANEL_INSTALLED_VERSION'); ?>
									</td>
									<td>
										<?php 
											if ($this->info['version_enabled'] == 0) {
												echo JText::_('COM_MIJOSEARCH_CPANEL_VERSION_CHECKER_DISABLED_2');
											} else {
												echo $this->info['version_installed'];
											}
										?>
									</td>
								</tr>
								<tr height="40">
									<td>
										<?php echo JText::_('COM_MIJOSEARCH_CPANEL_COPYRIGHT'); ?>
									</td>
									<td>
										<a href="http://www.mijosoft.com" target="_blank"><?php echo MijoSearch::get('utility')->getXmlText(JPATH_MIJOSEARCH_ADMIN.'/a_mijosearch.xml', 'copyright'); ?></a>
									</td>
								</tr>
							</table>
						</td>		
					</tr>
				</table>

                <?php echo JHtml::_('sliders.panel', JText::_('COM_MIJOSEARCH_MENU_ADVANCED_SEARCH'), 'search'); ?>
				<table class="adminlist">
					<tr>
						<td width="100%">
                            <?php
							$mod_mijosearch_admin = JPATH_ADMINISTRATOR.'/modules/mod_mijosearch_admin/mod_mijosearch_admin.php';
							if (file_exists($mod_mijosearch_admin)) {
                                $module = new stdClass();
                                $module->position = 'cpanel';
                                $module->params = "moduleclass_sfx=\ntext=search...\nshow_order=1\nshow_ext_flt=1\nshow_advanced_options=1\nshow_advanced_search=0\nadvanced_label=Advanced Search\nenable_complete=1\nshow_button=1";

                                $params = new JRegistry($module->params);

								require($mod_mijosearch_admin);
							}
                            ?>
						</td>
					</tr>
				</table>

                <?php echo JHtml::_('sliders.panel', JText::_('COM_MIJOSEARCH_CPANEL_STATISTICS'), 'stats'); ?>
				<table class="adminlist table table-striped">
					<tr>
						<td width="25%">
							<?php echo JText::_('COM_MIJOSEARCH_CPANEL_EXTENSIONS'); ?>
						</td>
						<td width="75%">
							<b><?php echo $this->stats['extensions']; ?></b>
						</td>
					</tr>
					<tr>
						<td width="25%">	
							<?php echo JText::_('COM_MIJOSEARCH_CPANEL_KEYWORD'); ?>
						</td>
						<td width="75%">
							<b><?php echo $this->stats['statistics'];?></b>
						</td>
					</tr>
					<tr>
						<td width="25%">	
							<?php echo JText::_('COM_MIJOSEARCH_CPANEL_FILTERS'); ?>
						</td>
						<td width="75%">
							<b><?php echo $this->stats['filters'];?></b>
						</td>
					</tr>
				</table>
                <?php echo JHtml::_('sliders.end'); ?>
			</td>
		</tr>
	</table>
	
	<input type="hidden" name="option" value="com_mijosearch" />
	<input type="hidden" name="controller" value="mijosearch"/>
	<input type="hidden" name="task" value="view" />
	<input type="hidden" name="boxchecked" value="0" />
	<?php echo JHTML::_('form.token'); ?>
</form>