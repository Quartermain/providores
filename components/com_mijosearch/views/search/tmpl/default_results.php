<?php
/**
 * @package		MijoSearch
 * @copyright	2009-2013 Mijosoft LLC, www.mijosoft.com
 * @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
 * @license		2009-2012 GNU/GPL based on AceSearch www.joomace.net
 */

//No Permision
defined( '_JEXEC' ) or die( 'Restricted access' );

$filter = JRequest::getInt('filter');
?>

<fieldset class="mijosearch_fieldset">
	<legend class="mijosearch_legend"><?php echo JText::_('COM_MIJOSEARCH_SEARCH_RESULTS'); ?></legend>
	<?php
	if ($this->MijosearchConfig->enable_suggestion == '1' && !empty($this->results["suggest"])) {
		echo $this->results["suggest"];
	}
	
	if (!empty($this->results[0])) {
		?>
		<div id="total">
		<span  class="about"><?php echo JText::_('COM_MIJOSEARCH_SEARCH_TOTAL_RESULTS').'&nbsp;'.$this->total.'&nbsp;'.JText::_('COM_MIJOSEARCH_SEARCH_RESULTS_FOUND'); ?> </span>
		
		<?php
		$ext = JRequest::getCmd('ext');
		
		if ($this->MijosearchConfig->show_search_refine == '1' && empty($ext) && !empty($this->refines) && empty($filter)) {
		?>
		<div class="mijosearch_clear"></div>
		<span class="about">
		<?php
			echo JText::_('COM_MIJOSEARCH_SEARCH_REFINE').'&nbsp;';
			
			foreach($this->refines as $key => $value) {
				if (empty($value)) {
					continue;
				}
				
				$link  = 'index.php?option=com_mijosearch&view=search&amp;query='.$this->query.'&amp;ext='.$key.$this->suffix.$this->Itemid;
				
				$name = MijosearchExtension::getExtensionName($key);
				
				echo '&nbsp;'.$name.'&nbsp;(<a href="'.JRoute::_($link).'" title="'.$name.'" >'.$value.'</a>) ';				
			}
		?>
		</span>

		<?php } ?>
		</div>
		<div class="mijosearch_clear" style="margin-bottom:10px;"></div>
		<div class="mijosearch_pagination">
            <?php if ($this->MijosearchConfig->show_order == '1') { ?>
                <span class="limitboxtext"><?php echo JText::_('COM_MIJOSEARCH_FIELDS_ORDER'); ?></span>
                <div class="limitbox">
                    <?php echo $this->lists['order']; ?>
                    <?php echo $this->lists['orderdir']; ?>
                    &nbsp;&nbsp;
                </div>
            <?php } ?>
			<?php if ($this->MijosearchConfig->show_display == '1') { ?>
                <span class="limitboxtext"><?php echo JText::_('Display'); ?></span>
				<div class="limitbox">
					<?php echo $this->pagination->getLimitBox(); ?>
				</div>
			<?php } ?>
		</div>
	
		<div id="dotttt"></div>
		<div class="mijosearch_clear"></div>

        <?php $this->renderModules();
		
		$n = count($this->results);
        $more_results = array(); ?>
        <div id="mijosearch-results">
        <?php
		for ($i = 0; $i < $n; $i++){
			$result = isset($this->results[$i]) ? $this->results[$i] : "";
			
			if (!empty($result)){
				MijosearchSearch::finalizeResult($result);
				?>
				<div class="mijosearch_search_results">
				  <div>
					  <?php if (!empty($result->imagename)) { ?>
					  <div class="image_position<?php echo $this->MijosearchConfig->image_positions;?>">
						<a href="<?php echo $result->link; ?>"><img src="<?php echo $result->imagename; ?>" width="<?php echo $this->MijosearchConfig->image_sizew;?>" height="<?php echo $this->MijosearchConfig->image_sizeh;?>"/></a>
					  </div>
					  <?php } ?>
						<div>
							<span style="font-size:15px; color:#6a6767;"><?php echo $this->pagination->getRowOffset($i); ?>.</span>
							<span style="font-size:15px;"><a href="<?php echo $result->link; ?>"><?php echo $result->name; ?></a></span>
						</div>
					  <?php
						
						if(!empty($result->description)) {
							?><div class="description"><?php echo $result->description; ?></div><?php
						}
						
						if(!empty($result->properties)) {
							?><div><span style="color:#6a6767;"><?php echo $result->properties; ?></span></div><?php
						}
						
						if(!empty($result->route)) {
							?><div><a class="mijosearch_results_route_link" href="<?php echo $result->route; ?>"><?php echo $result->route; ?></a></div><?php
						}
					  
						if ($this->MijosearchConfig->google_more_results == '1' && empty($ext) && empty($ajax_filter)) {
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

							if ($more_results[$result->mijosearch_ext] == $results_length) {
								$name = MijosearchExtension::getExtensionName($result->mijosearch_ext);
								?>
								<br/>
								<div style="padding-top: 20px;">
									<div class="google_pluss"></div>
									<a href="<?php echo JRoute::_(JFactory::getURI()->toString()).'&amp;ext='.$result->mijosearch_ext; ?>" class="google_pluss_link">
										<?php echo JText::_('COM_MIJOSEARCH_SEARCH_SHOW_MORE_RESULTS').' "'.$name.'" '. JText::_('COM_MIJOSEARCH_SEARCH_SHOW_MORE_RESULTS_SEC'); ?>
									</a>
								</div>
								<?php
								$more_results[$result->mijosearch_ext] = 1;
							}
						}  ?>
					</div> <?php
					if ($i < $n - 1) { ?>
						<div class="dottttttttt"></div> <?php
					} ?>
				</div>
				<?php
			}
		}
		
		$this->renderModules('mijosearch_bottom'); ?>
        </div>
		<div class="mijosearch_clear"></div>
		<div id="mijosearch_pagination" class="mijosearch_pagination">
			<div class="pagination" style="margin: 0px 0; float: right;">
				<?php echo $this->pagination->getPagesLinks(); ?>&nbsp;
			</div>
		</div>
		<?php
	}
    else {
        ?>
		<div id="total" ></div>
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
    <?php }	?>
</fieldset>
<div class="mijosearch_clear"></div>