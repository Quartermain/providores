<?php if ($text_file_empty) { ?>
<div class="attention"><?php echo $text_file_empty; ?></div>
<?php } ?>
<style type="text/css">
.CodeMirror {
	border: 1px solid #aaa;
	width: 910px;
}
.CodeMirror-wrapping {
    height: 620px !important;
}
</style>
<table class="info">
    <tr>
    	<td class="left">
            <?php $_file = '/components/com_mijoshop/opencart/catalog/view/theme/'.$edit_file ?>
            <?php echo sprintf($text_edit, (is_writable($path_file) ? 'green' : 'red'), $_file); ?>
        </td>
    	<td class="right">
			<span style="font-weight: bold; margin-left: 30px;">Clone file to theme</span>
            <select id="theme_name" style="margin: 0 10px 0 10px;">
                <?php foreach($themes as $theme) { ?>
                    <?php if (($curr_theme == $theme) or ($theme == 'default')) { ?>
                    <option value="<?php echo str_replace($curr_theme, $theme, $edit_file);  ?>" disabled="disabled"><?php echo $theme ?></option>
                    <?php } else { ?>
                    <option value="<?php echo str_replace($curr_theme, $theme, $edit_file);  ?>"><?php echo $theme ?></option>
					<?php } ?>
                <?php } ?>
            </select>
            <a onclick="cloneFile('<?php echo $edit_file ?>','<?php echo $filename ?>')" class="button"><span>Clone</span></a>
        </td>
    </tr>

  <?php if ($restore) { ?>
  <tr>
    <td class="right"><?php echo $entry_available_backups; ?> <select name="files_cache" id="files_cache" style="margin-right: 10px;">
	  <?php foreach ($restore as $cache_file) { ?>
		<option value="<?php echo $cache_file['id']; ?>"><?php echo $cache_file['name']; ?> (<?php echo $cache_file['size']; ?>)</option>
		<?php } ?>
		</select>
	   <a id="button-restore" class="button btn"><span><?php echo $button_restore; ?></span></a>
	   <a id="button-delete-cache" class="button btn"><span><?php echo $button_delete; ?></span></a></td>
  </tr>
  <?php } ?>
</table>
<div style="position: relative; margin-bottom: 2px; border: 1px solid #ccc; -webkit-border-radius: 7px 7px 0px 0px;
	-moz-border-radius: 7px 7px 0px 0px; -khtml-border-radius: 7px 7px 0px 0px; border-radius: 7px 7px 0px 0px; background: url('view/image/box.png') repeat-x;">
	<div class="buttons" style="padding: 4px;">
		<a onclick="$('#display_file').empty().hide();" class="button"><span><?php echo $button_cancel; ?></span></a>
		<div style="position: absolute; top: 5px; right: 10px;" id="ds"></div>
	</div>
</div>
<textarea id="code_mirror" name="templates"><?php echo $content ?></textarea>
<input type="hidden" name="edit_file" id="edit_file" value="<?php echo $edit_file; ?>">
<input type="hidden" name="path_file" id="path_file" value="<?php echo $path_file; ?>">
<input type="hidden" name="filename" value="<?php echo $filename; ?>">
<input type="hidden" name="ext" value="<?php echo $ext; ?>">


