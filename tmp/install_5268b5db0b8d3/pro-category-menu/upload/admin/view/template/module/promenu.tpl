<?php
// ----------------------------------
// Pro Category Menu for OpenCart 
// By Best-Byte
// www.best-byte.com
// ----------------------------------
?>
<?php echo $header; ?>
<div id="content">
<link rel="stylesheet" type="text/css" href="view/colorpick/jquery.miniColors.css" />
<script type="text/javascript" src="view/colorpick/jquery.miniColors.js"></script>
<script type="text/javascript">
	$(document).ready( function() {
		$(".color").miniColors({
			change: function(hex, rgb) {
			$("#console").prepend('HEX: ' + hex + ' (RGB: ' + rgb.r + ', ' + rgb.g + ', ' + rgb.b + ')<br />');
		}
	});
});
</script>
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="heading">
    <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
  </div>
  <div class="content">
   <div id="vtabs" class="vtabs"><a href="#tab-box"><?php echo $text_boxcontent; ?></a><a href="#tab-font"><?php echo $text_font; ?></a><a href="#tab-menu"><?php echo $text_menu; ?></a></div>  
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
    <div id="tab-box" class="vtabs-content">
      <table class="form">
        <tr>
         <td class="left"><?php echo $entry_boxback; ?></td> 
			   <td class="left"><input name="promenu_boxback" class="color" type="text" size="5" maxlength="6" value="<?php echo $promenu_boxback; ?>"></td>
        </tr>
        <tr>
         <td class="left"><?php echo $entry_boxpad; ?></td>			 
         <td class="left"><input name="promenu_boxpad" type="text" size="3" maxlength="4" value="<?php echo $promenu_boxpad; ?>">px</td>              
        </tr>
        <tr>
         <td class="left"><?php echo $entry_boxbsize; ?></td>			 
         <td class="left"><input name="promenu_boxbsize" type="text" size="3" maxlength="4" value="<?php echo $promenu_boxbsize; ?>">px</td>              
        </tr>
        <tr>
         <td class="left"><?php echo $entry_boxbcolor; ?></td>			 
         <td class="left"><input name="promenu_boxbcolor" class="color" type="text" size="5" maxlength="6" value="<?php echo $promenu_boxbcolor; ?>"></td>              
        </tr>
        <tr>
         <td class="left"><?php echo $entry_boxbstyle; ?></td>
         <td class="left">
      <select name="promenu_boxbstyle">
      <option value="">-Please Select-</option>
      <?php if ($promenu_boxbstyle == 'none') { ?> 
      <option value="none" selected="selected">none</option>
      <?php } else { ?>
      <option value="none">none</option>
      <?php } ?>      
      <?php if ($promenu_boxbstyle == 'solid') { ?> 
      <option value="solid" selected="selected">solid</option>
      <?php } else { ?>
      <option value="solid">solid</option>
      <?php } ?>
      <?php if ($promenu_boxbstyle == 'dashed') { ?> 
      <option value="dashed" selected="selected">dashed</option>
      <?php } else { ?>
      <option value="none">dashed</option>
      <?php } ?> 
      <?php if ($promenu_boxbstyle == 'dotted') { ?> 
      <option value="dotted" selected="selected">dotted</option>
      <?php } else { ?>
      <option value="none">dotted</option>
      <?php } ?>  
      <?php if ($promenu_boxbstyle == 'double') { ?> 
      <option value="double" selected="selected">double</option>
      <?php } else { ?>
      <option value="none">double</option>
      <?php } ?> 
      <?php if ($promenu_boxbstyle == 'groove') { ?> 
      <option value="groove" selected="selected">groove</option>
      <?php } else { ?>
      <option value="none">groove</option>
      <?php } ?>   
      <?php if ($promenu_boxbstyle == 'ridge') { ?> 
      <option value="ridge" selected="selected">ridge</option>
      <?php } else { ?>
      <option value="none">ridge</option>
      <?php } ?> 
      <?php if ($promenu_boxbstyle == 'inset') { ?> 
      <option value="inset" selected="selected">inset</option>
      <?php } else { ?>
      <option value="none">inset</option>
      <?php } ?>  
      <?php if ($promenu_boxbstyle == 'outset') { ?> 
      <option value="outset" selected="selected">outset</option>
      <?php } else { ?>
      <option value="none">outset</option>
      <?php } ?>                                            
      </select> 
      </td>
      </tr>        
      </table>
    </div>    
    <div id="tab-font" class="vtabs-content">
      <table class="form">
        <tr>
         <td class="left"><?php echo $entry_fontfamily; ?></td> 
			   <td class="left"><input name="promenu_fontfamily" type="text" size="35" maxlength="35" value="<?php echo $promenu_fontfamily; ?>"></td>
        </tr>
        <tr>
         <td class="left"><?php echo $entry_fontsize; ?></td>			 
         <td class="left"><input name="promenu_fontsize" type="text" size="3" maxlength="4" value="<?php echo $promenu_fontsize; ?>">px</td>              
        </tr>
        <tr>
         <td class="left"><?php echo $entry_fontweight; ?></td>
         <td class="left">
      <select name="promenu_fontweight">
      <option value="">-Please Select-</option>
      <?php if ($promenu_fontweight == 'normal') { ?> 
      <option value="normal" selected="selected">normal</option>
      <?php } else { ?>
      <option value="normal">normal</option>
      <?php } ?> 
      <?php if ($promenu_fontweight == 'bold') { ?> 
      <option value="bold" selected="selected">bold</option>
      <?php } else { ?>
      <option value="bold">bold</option>
      <?php } ?>         
      </select>
      </td>
      </tr>         
        <tr>
         <td class="left"><?php echo $entry_fontcolor; ?></td>			 
         <td class="left"><input name="promenu_fontcolor" class="color" type="text" size="5" maxlength="6" value="<?php echo $promenu_fontcolor; ?>"></td>              
        </tr> 
        <tr>
         <td class="left"><?php echo $entry_fonthcolor; ?></td>			 
         <td class="left"><input name="promenu_fonthcolor" class="color" type="text" size="5" maxlength="6" value="<?php echo $promenu_fonthcolor; ?>"></td>              
        </tr>
        <tr>
         <td class="left"><?php echo $entry_fontacolor; ?></td>			 
         <td class="left"><input name="promenu_fontacolor" class="color" type="text" size="5" maxlength="6" value="<?php echo $promenu_fontacolor; ?>"></td>              
        </tr>
        <tr>
         <td class="left"><?php echo $entry_fontahcolor; ?></td>			 
         <td class="left"><input name="promenu_fontahcolor" class="color" type="text" size="5" maxlength="6" value="<?php echo $promenu_fontahcolor; ?>"></td>              
        </tr>                         
        <tr>
         <td class="left"><?php echo $entry_fontlrpad; ?></td>			 
         <td class="left"><input name="promenu_fontlrpad" type="text" size="3" maxlength="4" value="<?php echo $promenu_fontlrpad; ?>">px</td>              
        </tr>                              
      </table>
    </div>     
    <div id="tab-menu" class="vtabs-content">
      <table class="form">
        <tr>
         <td class="left"><?php echo $entry_menuwidth; ?></td> 
			   <td class="left"><input name="promenu_menuwidth" type="text" size="3" maxlength="4" value="<?php echo $promenu_menuwidth; ?>">px</td>
        </tr>
        <tr>
         <td class="left"><?php echo $entry_menuheight; ?></td> 
			   <td class="left"><input name="promenu_menuheight" type="text" size="3" maxlength="4" value="<?php echo $promenu_menuheight; ?>">px</td>
        </tr> 
        <tr>
         <td class="left"><?php echo $entry_menumargin; ?></td> 
			   <td class="left"><input name="promenu_menumargin" type="text" size="3" maxlength="4" value="<?php echo $promenu_menumargin; ?>">px</td>
        </tr>   
        <tr>
         <td class="left"><?php echo $entry_menuback; ?></td> 
			   <td class="left"><input name="promenu_menuback" class="color" type="text" size="5" maxlength="6" value="<?php echo $promenu_menuback; ?>"></td>
        </tr>   
        <tr>
         <td class="left"><?php echo $entry_menuhback; ?></td> 
			   <td class="left"><input name="promenu_menuhback" class="color" type="text" size="5" maxlength="6" value="<?php echo $promenu_menuhback; ?>"></td>
        </tr> 
        <tr>
         <td class="left"><?php echo $entry_menuaback; ?></td> 
			   <td class="left"><input name="promenu_menuaback" class="color" type="text" size="5" maxlength="6" value="<?php echo $promenu_menuaback; ?>"></td>
        </tr>
        <tr>
         <td class="left"><?php echo $entry_menuahback; ?></td> 
			   <td class="left"><input name="promenu_menuahback" class="color" type="text" size="5" maxlength="6" value="<?php echo $promenu_menuahback; ?>"></td>
        </tr>                     
        <tr>
         <td class="left"><?php echo $entry_menubsize; ?></td> 
			   <td class="left"><input name="promenu_menubsize" type="text" size="3" maxlength="4" value="<?php echo $promenu_menubsize; ?>">px</td>
        </tr>
        <tr>
         <td class="left"><?php echo $entry_menubcolor; ?></td> 
			   <td class="left"><input name="promenu_menubcolor" class="color" type="text" size="5" maxlength="6" value="<?php echo $promenu_menubcolor; ?>"></td>
        </tr>          
        <tr>
         <td class="left"><?php echo $entry_menubstyle; ?></td>
         <td class="left">
      <select name="promenu_menubstyle">
      <option value="">-Please Select-</option>
      <?php if ($promenu_menubstyle == 'none') { ?> 
      <option value="none" selected="selected">none</option>
      <?php } else { ?>
      <option value="none">none</option>
      <?php } ?>      
      <?php if ($promenu_menubstyle == 'solid') { ?> 
      <option value="solid" selected="selected">solid</option>
      <?php } else { ?>
      <option value="solid">solid</option>
      <?php } ?>
      <?php if ($promenu_menubstyle == 'dashed') { ?> 
      <option value="dashed" selected="selected">dashed</option>
      <?php } else { ?>
      <option value="none">dashed</option>
      <?php } ?> 
      <?php if ($promenu_menubstyle == 'dotted') { ?> 
      <option value="dotted" selected="selected">dotted</option>
      <?php } else { ?>
      <option value="none">dotted</option>
      <?php } ?>  
      <?php if ($promenu_menubstyle == 'double') { ?> 
      <option value="double" selected="selected">double</option>
      <?php } else { ?>
      <option value="none">double</option>
      <?php } ?> 
      <?php if ($promenu_menubstyle == 'groove') { ?> 
      <option value="groove" selected="selected">groove</option>
      <?php } else { ?>
      <option value="none">groove</option>
      <?php } ?>   
      <?php if ($promenu_menubstyle == 'ridge') { ?> 
      <option value="ridge" selected="selected">ridge</option>
      <?php } else { ?>
      <option value="none">ridge</option>
      <?php } ?> 
      <?php if ($promenu_menubstyle == 'inset') { ?> 
      <option value="inset" selected="selected">inset</option>
      <?php } else { ?>
      <option value="none">inset</option>
      <?php } ?>  
      <?php if ($promenu_menubstyle == 'outset') { ?> 
      <option value="outset" selected="selected">outset</option>
      <?php } else { ?>
      <option value="none">outset</option>
      <?php } ?>                                            
      </select> 
      </td>
      </tr>
        <tr>
         <td class="left"><?php echo $entry_menusubsize; ?></td> 
			   <td class="left"><input name="promenu_menusubsize" type="text" size="3" maxlength="4" value="<?php echo $promenu_menusubsize; ?>">px</td>
        </tr>
        <tr>
         <td class="left"><?php echo $entry_menusubcolor; ?></td> 
			   <td class="left"><input name="promenu_menusubcolor" class="color" type="text" size="5" maxlength="6" value="<?php echo $promenu_menusubcolor; ?>"></td>
        </tr>          
        <tr>
         <td class="left"><?php echo $entry_menusubstyle; ?></td>
         <td class="left">
      <select name="promenu_menusubstyle">
      <option value="">-Please Select-</option>
      <?php if ($promenu_menusubstyle == 'none') { ?> 
      <option value="none" selected="selected">none</option>
      <?php } else { ?>
      <option value="none">none</option>
      <?php } ?>      
      <?php if ($promenu_menusubstyle == 'solid') { ?> 
      <option value="solid" selected="selected">solid</option>
      <?php } else { ?>
      <option value="solid">solid</option>
      <?php } ?>
      <?php if ($promenu_menusubstyle == 'dashed') { ?> 
      <option value="dashed" selected="selected">dashed</option>
      <?php } else { ?>
      <option value="none">dashed</option>
      <?php } ?> 
      <?php if ($promenu_menusubstyle == 'dotted') { ?> 
      <option value="dotted" selected="selected">dotted</option>
      <?php } else { ?>
      <option value="none">dotted</option>
      <?php } ?>  
      <?php if ($promenu_menusubstyle == 'double') { ?> 
      <option value="double" selected="selected">double</option>
      <?php } else { ?>
      <option value="none">double</option>
      <?php } ?> 
      <?php if ($promenu_menusubstyle == 'groove') { ?> 
      <option value="groove" selected="selected">groove</option>
      <?php } else { ?>
      <option value="none">groove</option>
      <?php } ?>   
      <?php if ($promenu_menusubstyle == 'ridge') { ?> 
      <option value="ridge" selected="selected">ridge</option>
      <?php } else { ?>
      <option value="none">ridge</option>
      <?php } ?> 
      <?php if ($promenu_menusubstyle == 'inset') { ?> 
      <option value="inset" selected="selected">inset</option>
      <?php } else { ?>
      <option value="none">inset</option>
      <?php } ?>  
      <?php if ($promenu_menusubstyle == 'outset') { ?> 
      <option value="outset" selected="selected">outset</option>
      <?php } else { ?>
      <option value="none">outset</option>
      <?php } ?>                                            
      </select> 
      </td>
      </tr>                                                 
      </table>
    </div>             
      <table id="module" class="list">
        <thead>
          <tr>
            <td class="left"><?php echo $entry_layout; ?></td>
            <td class="left"><?php echo $entry_position; ?></td>
			      <td class="left"><?php echo $entry_count; ?></td>
            <td class="left"><?php echo $entry_status; ?></td>
            <td class="right"><?php echo $entry_sort_order; ?></td>
            <td></td>
          </tr>
        </thead>
        <?php $module_row = 0; ?>
        <?php foreach ($modules as $module) { ?>
        <tbody id="module-row<?php echo $module_row; ?>">
          <tr>
            <td class="left"><select name="promenu_module[<?php echo $module_row; ?>][layout_id]">
                <?php foreach ($layouts as $layout) { ?>
                <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
            <td class="left"><select name="promenu_module[<?php echo $module_row; ?>][position]">
                <?php if ($module['position'] == 'content_top') { ?>
                <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                <?php } else { ?>
                <option value="content_top"><?php echo $text_content_top; ?></option>
                <?php } ?>  
                <?php if ($module['position'] == 'content_bottom') { ?>
                <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                <?php } else { ?>
                <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                <?php } ?>     
                <?php if ($module['position'] == 'column_left') { ?>
                <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
                <?php } else { ?>
                <option value="column_left"><?php echo $text_column_left; ?></option>
                <?php } ?>
                <?php if ($module['position'] == 'column_right') { ?>
                <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
                <?php } else { ?>
                <option value="column_right"><?php echo $text_column_right; ?></option>
                <?php } ?>
              </select></td>
			      <td class="left"><select name="promenu_module[<?php echo $module_row; ?>][count]">
                <?php if ($module['count']) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
            <td class="left"><select name="promenu_module[<?php echo $module_row; ?>][status]">
                <?php if ($module['status']) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
            <td class="right"><input type="text" name="promenu_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
            <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
          </tr>
        </tbody>
        <?php $module_row++; ?>
        <?php } ?>
        <tfoot>
          <tr>
            <td colspan="5"></td>
            <td class="left"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
          </tr>
        </tfoot>
      </table>
    </form>
   <center><?php echo $entry_moduleinfo ?></center>    
  </div>
</div>
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<tbody id="module-row' + module_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><select name="promenu_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="promenu_module[' + module_row + '][position]">';
	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="promenu_module[' + module_row + '][count]">';
  html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
  html += '      <option value="0"><?php echo $text_disabled; ?></option>';
  html += '    </select></td>';
	html += '    <td class="left"><select name="promenu_module[' + module_row + '][status]">';
  html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
  html += '      <option value="0"><?php echo $text_disabled; ?></option>';
  html += '    </select></td>';
	html += '    <td class="right"><input type="text" name="promenu_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#module tfoot').before(html);
	
	module_row++;
}
//--></script>
<script type="text/javascript"><!--
$('.vtabs a').tabs();
//--></script> 
<?php echo $footer; ?>