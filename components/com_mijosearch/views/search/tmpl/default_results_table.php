<?php
/**
 * @package		MijoSearch
 * @copyright	2009-2013 Mijosoft LLC, www.mijosoft.com
 * @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
 * @license		2009-2012 GNU/GPL based on AceSearch www.joomace.net
 */

//No Permision
defined( '_JEXEC' ) or die( 'Restricted access' );

$check = isset($this->results[0]) ? $this->results[0] : '';
$filter = JRequest::getInt('filter');
?>

<fieldset class="mijosearch_fieldset">
	<legend class="mijosearch_legend"><?php echo JText::_('COM_MIJOSEARCH_SEARCH_RESULTS'); ?></legend>
	<?php
	if ($this->MijosearchConfig->enable_suggestion == '1' && !empty($this->results["suggest"])) {
		echo $this->results["suggest"];
	}

	if (!empty($check)) {
		?>
		
		<div class="mijosearch_pagination">
            <?php if ($this->MijosearchConfig->show_order == '1') { ?>
                <div class="limitbox">
                    &nbsp;
                    <?php echo JText::_('COM_MIJOSEARCH_FIELDS_ORDER'); ?>
                    <?php echo $this->lists['order']; ?>
                    <?php echo $this->lists['orderdir']; ?>
                    &nbsp;&nbsp;
                </div>
            <?php } ?>
			<?php if ($this->MijosearchConfig->show_display == '1') { ?>
				<div class="limitbox">
					&nbsp;<?php echo JText::_('Display'); ?>
					<?php echo $this->pagination->getLimitBox(); ?>
				</div>
			<?php } ?>
		</div>
		<div class="mijosearch_clear" style="margin-bottom:10px;"></div>

        <?php $this->renderModules(); ?>
        <div id="mijosearch-results">
		<div id="editcell">
			<table width="100%" cellpadding="4" cellspacing="0" border="0" align="center" class="contentpane">
				<tr>
					<td class="sectiontableheader" width="1%">
						<?php echo JText::_('Num'); ?>
					</td>
					<td class="sectiontableheader">
						<?php echo JText::_('Image'); ?>
					</td>
					<td class="sectiontableheader">
						<?php echo JText::_('COM_MIJOSEARCH_FIELDS_TITLE'); ?>
					</td>
					<td class="sectiontableheader" width="150px">
						<?php echo JText::_('COM_MIJOSEARCH_SEARCH_SECTION'); ?>
					</td>		
				</tr>
				<?php
				$k =0;
				$n = count($this->results);
                $ext = JRequest::getCmd('ext','');
                $more_results = array();
				
				for ($i = 0; $i < $n; $i++){
					$b = $k +1;
					$result = isset($this->results[$i]) ? $this->results[$i] : "";
					
					if (!empty($result)) {
						MijosearchSearch::finalizeResult($result);
						?>
						<tr class="sectiontableentry<?php echo $b;?>">
							<td>
								<font size="2px" color="#6a6767"><?php echo $this->pagination->getRowOffset($i); ?>.</font>
							</td>
							<td>
							<?php if (!empty($result->imagename)) { ?>
							  <div class="image_position">
								<a href="<?php echo $result->link; ?>"><img src="<?php echo $result->imagename; ?>" width="<?php echo $this->MijosearchConfig->image_sizew?>" height="<?php echo $this->MijosearchConfig->image_sizeh?>"/></a>
							  </div>
							<?php } ?>
							</td>
							<td width="60%">
								<font size="2px"><a href="<?php echo $result->link; ?>"><?php echo $result->name; ?></a></font>
                            </td>
							<td width="20%">
								<font size="2px"><?php echo MijosearchExtension::getExtensionName($result->mijosearch_ext); ?></font>
                            </td>
						</tr>
						<?php
						$k = 1 - $k;

                        if ($this->MijosearchConfig->google_more_results == '1' && empty($ext) && empty($filter)) {
                            if (!isset($more_results[$result->mijosearch_ext])) {
                                $more_results[$result->mijosearch_ext] = 1;
                            }
                            else {
                                $more_results[$result->mijosearch_ext]++;
                            }

                            $prm_results_length = MijoSearch::getCache()->getExtensionParams($result->mijosearch_ext)->get('google_more_results_length', '');
                            if (!empty($prm_results_length)){
                                $results_length = intval($prm_results_length);
                            }
                            else {
                                $results_length = $this->MijosearchConfig->google_more_results_length;
                            }
                            
                            if ($more_results[$result->mijosearch_ext] == $results_length){
                                $name = MijosearchExtension::getExtensionName($result->mijosearch_ext);
                                ?>
                                <tr class="sectiontableentry<?php echo $b;?>">
                                    <td colspan="3">
                                        <div class="google_pluss"></div>
                                        <a href="<?php echo JRoute::_(JFactory::getURI()->toString()).'&ext='.$result->mijosearch_ext; ?>" class="google_pluss_link">
                                            <?php echo JText::_('COM_MIJOSEARCH_SEARCH_SHOW_MORE_RESULTS').' "'.$name.'" '. JText::_('COM_MIJOSEARCH_SEARCH_SHOW_MORE_RESULTS_SEC'); ?>
                                        </a>
                                    </td>
                                </tr>
                                <?php
                                $more_results[$result->mijosearch_ext] = 1;
                            }
                        }
					}
				}
				?>
				<div class="mijosearch_clear" style="margin-bottom:10px;"></div>
			</table>
		</div>

        <?php $this->renderModules('mijosearch_bottom'); ?>

		<div id="mijosearch_pagination" class="mijosearch_pagination">
			<div class="pagination" style="margin: 0px 0; float: right;">
				<?php echo $this->pagination->getPagesLinks(); ?>&nbsp;
			</div>
		</div>
        </div>
		<?php
	}
	
	if (empty($check)){
		?>
		<div class="mijosearch_clear"></div>
        <div class="mijosearch_pagination">
            <?php if ($this->MijosearchConfig->show_order == '1') { ?>
                <div class="limitbox">
                    &nbsp;
                    <?php echo JText::_('COM_MIJOSEARCH_FIELDS_ORDER'); ?>
                    <?php echo $this->lists['order']; ?>
                    <?php echo $this->lists['orderdir']; ?>
                    &nbsp;&nbsp;
                </div>
            <?php } ?>
            <?php if ($this->MijosearchConfig->show_display == '1') { ?>
                <div class="limitbox">
                    &nbsp;<?php echo JText::_('Display'); ?>
                    <?php echo $this->pagination->getLimitBox(); ?>
                </div>
            <?php } ?>
        </div>
        <div class="dotttt"></div>
        <div class="mijosearch_clear"></div>
        <?php $this->renderModules();?>
        <div id="mijosearch-results">
            <h2><?php echo JText::_('COM_MIJOSEARCH_SEARCH_NO_RESULTS'); ?></h2>
            <span><?php echo JText::_('COM_MIJOSEARCH_SEARCH_NO_RESULTS_QUERY'); ?><?php echo MijosearchSearch::getSearchQuery(); ?></span>
        </div>
        <?php $this->renderModules('mijosearch_bottom'); ?>
        <div class="mijosearch_clear"></div>
        <div class="mijosearch_pagination" id="mijosearch_pagination"></div>
		<?php
	}
	?>
</fieldset>

<input type="hidden" name="filter" value="<?php echo JRequest::getCmd('filter', ''); ?>"/>

<div class="mijosearch_clear" style="margin-bottom:10px;"></div>