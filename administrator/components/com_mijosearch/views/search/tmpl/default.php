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
defined( '_JEXEC' ) or die( 'Restricted access' );

$any = $none = $exact = $query = $all = '';
$al = JRequest::getString('all', '');
$an = JRequest::getString('any', '');
$ex = JRequest::getString('exact', '');
$nn = JRequest::getString('none', '');

if (!empty($al)) {
	$all = ' '.$al.' ';
}

if (!empty($an)) {
	$any = ' '.$an.' ';
}

if (!empty($ex)) {
	$exact = ' "'.$ex.'" ';
}

if (!empty($nn)) {
	$none = ' -'.$nn;
}
	
$query = $this->escape(JRequest::getString('query', '').$all.$any.$exact.$none);

?>
<script type="text/javascript">
	<?php if ($this->MijosearchConfig->admin_enable_complete == '1') { ?>
	window.addEvent('load', function() {
		var url = '<?php echo JRoute::_('index.php?option=com_mijosearch&controller=ajax&task=complete', false); ?>';
		var completer = new Autocompleter.Ajax.Json($('q'), url, {'postVar': 'q'});
	});
	<?php } ?>
	
	function submitbutton(){
		var form = document.adminForm;
		var boxesTicked = "";
		
		if (form.query.value) {
			return true;
		} else{
			alert("<?php echo JText::_('COM_MIJOSEARCH_SEARCH_ENTER_QUERY'); ?>");
			return false;
		}
	}
</script>

<form action="<?php echo JFactory::getURI()->toString(); ?>" method="post" name="adminForm" id="adminForm" onsubmit="return submitbutton();">

<div style="width:800px; margin-left:auto;margin-right:auto;text-align:center;">
		<fieldset class="mijosearch_fieldset">
		<legend class="mijosearch_legend"><?php echo JText::_('COM_MIJOSEARCH_SEARCH'); ?></legend>
		<div id="mijosearch_bg">
			<input class="mijosearch_input_image" type="text" name="query" id="q" value="<?php echo $query; ?>" maxlength="<?php echo $this->MijosearchConfig->admin_max_search_char; ?>" />&nbsp;
			
			<?php
			if ($this->MijosearchConfig->admin_show_ext_flt == '1') { 	
				echo $this->lists['extension'];	
			}
			?>
			
			<button type="submit" class="btn btn-primary" style="margin-bottom: 15px !important;"><?php echo JText::_('COM_MIJOSEARCH_SEARCH' ); ?></button>
			
			<?php if ($this->MijosearchConfig->show_adv_search == '1') { ?>
				<a href="<?php echo JRoute::_('index.php?option=com_mijosearch&controller=search&task=advancedsearch'); ?>" title="<?php echo JText::_('COM_MIJOSEARCH_SEARCH_ADVANCED_SEARCH'); ?>" >
					<?php echo JText::_('COM_MIJOSEARCH_SEARCH_ADVANCED_SEARCH'); ?>
				</a>
			<?php } ?>
		</div>
	</fieldset>

	<div class="mijosearch_clear"></div>

	<?php if (!empty($query)) { ?>	
	<div id="result"><?php 
		$check = isset($this->results[0]) ? $this->results[0] : "";
		?>
		
		<fieldset class="mijosearch_fieldset">
			<legend class="mijosearch_legend"><?php echo JText::_('COM_MIJOSEARCH_SEARCH_RESULTS');?></legend>
			
			<?php 
			if ($this->MijosearchConfig->admin_enable_suggestion == 1 && !empty($this->results["suggest"])) {
				echo $this->results["suggest"];
			}
			
			if (!empty($check)) { 
				?>
				<span class="about"><?php echo JText::_('COM_MIJOSEARCH_SEARCH_TOTAL_RESULTS').'&nbsp;'.$this->total.'&nbsp;'.JText::_('COM_MIJOSEARCH_SEARCH_RESULTS_FOUND'); ?> </span>
				
				<?php
				$ext = JRequest::getCmd('ext');
				
				if ($this->MijosearchConfig->show_search_refine == '1' && empty($ext) && !empty($this->refines)) {
				?>
				<div class="mijosearch_clear"></div>
				<span class="about">
				<?php
					echo JText::_('COM_MIJOSEARCH_SEARCH_REFINE').'&nbsp';
					
					foreach ($this->refines as $key => $value) {
						if (empty($value)) {
							continue;
						}
						
						$link = JRoute::_('index.php?option=com_mijosearch&controller=search&task=view&query='.$query.'&ext='.$key);
						
						$name = MijosearchExtension::getExtensionName($key);
						
						echo '&nbsp;'.JText::_($name).'&nbsp;(<a href="'.$link.'" title="'.$name.'" >'.$value.'</a>) ';				
					}
				?>
				</span>
				<?php } ?>

			<div class="mijosearch_clear"></div>

			<div id="mijosearch_pagination">
                <div style="float:left; margin-top:2px;">
					<span style="float: left; padding-top: 6px;">
						&nbsp;&nbsp;<?php echo JText::_('COM_MIJOSEARCH_FIELDS_ORDER'); ?>&nbsp;&nbsp;
					</span>
					<span style="float: right; padding-top: 3px;">
						<?php echo MijosearchHTML::_renderFieldOrder('', 'class="mijosearch_selectbox"', ' onchange="document.adminForm.submit();"'); ?>
					</span>
                </div>
				<?php
				if ($this->MijosearchConfig->admin_show_display) {
					?>
					<div style="float:left; margin-top:2px;">
						<span style="float: left; padding-top: 6px;">
							&nbsp;&nbsp;&nbsp;&nbsp;<?php echo JText::_('Display'); ?>&nbsp;&nbsp;
						</span>
						<span style="float: right; padding-top: 3px;">
							<?php echo $this->pagination->getLimitBox(); ?>
						</span>
					</div>
					<?php 
				}
				?>
				<div class="pagination pagination-toolbar" style="float:right;">
					<?php echo $this->pagination->getPagesLinks(); ?>
				</div>
			</div>
			<div class="mijosearch_clear"></div>
			<?php
			$n = count($this->results);
			for ($i =0; $i <  $n ; $i ++){
				$result = isset($this->results[$i]) ? $this->results[$i] : "";
				
				if (!empty($result)) {
					MijosearchSearch::finalizeResult($result);
					?>
					<div class="mijosearch_search_results" >
						<div style="text-align: left;">
							<div>
								<font size="2px" color="#6a6767"><?php echo $this->pagination->getRowOffset($i).'.';?></font>
								<font size="2px"><a href="<?php echo $result->link; ?>"><?php echo $result->name; ?></a></font>
							</div>
							<?php
							
							if($this->MijosearchConfig->admin_show_desc){ ?>
								<div class="description"><?php echo $result->description; ?></div><?php
							}
							
							if (!empty($result->properties)) { ?>
								<div><font color="#6a6767"><?php echo $result->properties; ?></font></div><?php
							}
							
							if($this->MijosearchConfig->admin_show_url) { ?>
								<div><a href="<?php echo $result->link; ?>"><font color="green"><?php echo $result->link; ?></font></a></div><?php
							} ?>
						</div> <?php
						if ($i < $n - 1) { ?>
							<div id="dottttttttt"></div> <?php
						} ?>
					</div><?php
				}
			} ?> 
			
				<div class="pagination pagination-toolbar" style="float:right;">
					<?php echo $this->pagination->getPagesLinks(); ?>
				</div>
			
		</fieldset><?php
		
		} 
		
		if (empty($check)){
			?>
			<h2><?php echo JText::_('COM_MIJOSEARCH_SEARCH_NO_RESULTS'); ?></h2>
			<span><?php echo JText::_('COM_MIJOSEARCH_SEARCH_NO_RESULTS_QUERY'); ?><?php echo $query; ?></span>
			<?php
		}
	?>
	</div>
</div>
	<?php }
	echo JHTML::_('form.token'); 

	if(empty($query)) { ?>
	 <input type="hidden" name="limit" value="<?php echo $this->MijosearchConfig->display_limit; ?>"/><?php
	 } ?>
	<input type="hidden" name="option" value="com_mijosearch"/>
	<input type="hidden" name="controller" 	value="search"/>
	<input type="hidden" name="task" 	value="view"/>
	<input type="hidden" name="limitstart" value="" />
</form>