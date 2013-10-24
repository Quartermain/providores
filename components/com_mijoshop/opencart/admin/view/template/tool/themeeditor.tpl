<?php echo $header; ?>
<style type="text/css">
	.fileTree {
		height: 670px;
		border-top: solid 1px #BBB;
		border-left: solid 1px #BBB;
		border-bottom: solid 1px #FFF;
		border-right: solid 1px #FFF;
		background: #FFF;
		overflow: scroll;
		padding: 5px;
		width: 240px;
	}

	.CodeMirror-line-numbers {
		font-size: 10pt;
		margin: 0.4em;
		padding-right: 0.4em;
		text-align: right;
		background: #FAF0E6;
	}

    input {
        height: 20px;
        font-size: 14px;
    }

	table { width: 100%; } 
	table.info { border-collapse: collapse;  }
	table.info td { padding: 0 10px 10px 10px; color: #000000; }
	table.info td.right { text-align: right; }
	#loading, #message { display: none; }
</style>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/backup.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="clearAllCache();" id="clear" class="button"><?php echo $button_clear_cache; ?></a> <a href="index.php?option=com_mijoshop&route=tool/themeeditor" class="button">New Theme</a> </div>
    </div>
    <div class="content">
      <table>
		<tr>
			<td valign="top" style="width: 240px;"><div id="column-left" class="fileTree"></div></td>
			<td valign="top" style="margin-left: 10px;">
				<div id="message" class="attention"></div>
				<div id="display_file" style="margin: 0px 10px 0px 10px;">
				  <br/>
				  <div>
                      <table>
                          <tr>
                            <td style="vertical-align: middle;">
                                New Theme Name:&nbsp;&nbsp;<input type="text" id="new_name" style="width: 150px;">&nbsp;&nbsp;&nbsp;<a onclick="folderCreate()" id="clone_theme" class="button">Create</a>
                            </td>
                          </tr>
                      </table>
                  </div>
			      <br/><br/>
				  <?php if ($text_folder_no_writable) { ?>
				  <div class="warning"><?php echo $text_folder_no_writable; ?></div>
				  <?php } ?>
				  <div class="attention" id="sfb"><?php echo $entry_backup_files; ?> <?php echo $size; ?></div>
				  <table class="form">
					<tr>
					  <td><?php echo $entry_last_backup_files; ?></td>
					  <td>
					  <?php foreach ($files as $file_cache) {
					    echo $file_cache['date'] . ' - ' . $file_cache['name'] . ' (' . $file_cache['size'] . ')<br />';
					  } ?>
					  </td>
				    </tr>
				  </table>
				</div>
				<div id="loading"><img src="view/image/loading.gif" /></div>
			</td>
		</tr>
      </table>
    </div>
  </div>
</div>
<link rel="stylesheet" type="text/css" href="view/javascript/jquery/filetree/jqueryFileTree.css" media="screen" />
<script type="text/javascript" src="view/javascript/jquery/filetree/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="view/javascript/jquery/filetree/jqueryFileTree.js"></script>
<script src="../media/editors/codemirror/js/codemirror.js" type="text/javascript"></script>
<script type="text/javascript"><!--
function MirrorFrame(place, options) {
  this.home = document.createElement("DIV");

  if (place.appendChild)
    place.appendChild(this.home);
  else
    place(this.home);

  var self = this;

  function makeButton(name, action) {
    var button = document.createElement("INPUT");
    if(action == 'search_oc'){
        action = 'search';
    }

    button.type = "button";
    button.value = name;
    document.getElementById('ds').appendChild(button);
    button.onclick = function(){self[action].call(self);};
  }

  function makeInput(name) {
    var input = document.createElement("INPUT");

    input.type = "text";
    input.name = name;
	input.style.width = '200px';
    document.getElementById('ds').appendChild(input);
  }

  makeInput("keyword");
  makeButton("Search", "search");
  makeButton("Replace", "replace");
  makeButton("Save", "getCode");

  this.mirror = new CodeMirror(this.home, options);
}

MirrorFrame.prototype = {
  search: function() {
    var text = $('input[name=\'keyword\']').val();

    if (!text || text == 'search') return;

    var first = true;
    do {
      var cursor = this.mirror.getSearchCursor(text, first, true);
      first = false;
      while (cursor.findNext()) {
        cursor.select();
        if (!confirm("Search again?"))
          return;
      }
    } while (confirm("End of document reached. Start over?"));
  },

  replace: function() {
    // This is a replace-all, but it is possible to implement a
    // prompting replace.
    var from = prompt("Enter search string:", ""), to;
    if (from) to = prompt("What should it be replaced with?", "");
    if (to == null) return;

    var cursor = this.mirror.getSearchCursor(from.toLowerCase(), false);
    while (cursor.findNext())
      cursor.replace(to);
  },

  getCode: function() {
    $('.success, .warning, .wait').remove();
	$('#message').html('<?php echo $text_wait; ?>').show();

    var  path_file =  document.getElementById('path_file').value;
    var  edit_file =  document.getElementById('edit_file').value;

	$.ajax({
		type: "POST",
		url: "index.php?route=tool/themeeditor/save&token=<?php echo $token; ?>",
		data: {templates: this.mirror.getCode(), path_file: path_file, edit_file: edit_file},
		dataType: 'json',
		success: function(json) {
			$('#message').html('').hide();
			//$('#display_file').empty().hide();

			if (json['success']) {
				$('.breadcrumb').after('<div class="success">' + json['success'] + '</div>');
				getBackupFiles($('input[name=\'edit_file\']').val());
			}

			if (json['error']) {
				$('.breadcrumb').after('<div class="warning">' + json['error'] + '</div>');
			}
		}
	});
  }
};

jQuery(document).ready(function () {
	jQuery('#column-left').fileTree({
        script: 'index.php?option=com_mijoshop&route=tool/themeeditor/folder&token=<?php echo $token; ?>',
        folderEvent: 'click', 
        expandSpeed: 750, 
        collapseSpeed: 750, 
        multiFolder: false 
    });
});

function getBackupFiles(file) {
	if (file == '')
		return;

	$.ajax({
		type: "POST",
		url: "index.php?route=tool/themeeditor/getbackupfiles&token=<?php echo $token; ?>",
		data: "&file=" + file,
		dataType: 'json',
		success: function(json){
			if (json['files']) {
				var p = json['files'];
				html = '<?php echo $entry_available_backups; ?> <select name="files_cache" id="files_cache"  style="margin-right: 10px;">';

				for (var key in p) {
					if (p.hasOwnProperty(key)) {
						html += '<option value="' + p[key].id + '">' + p[key].name + ' (' + p[key].size + ')</option>';
					}
				}

				html += '</select>';
				html += '<a id="button-restore" class="button"><span><?php echo $button_restore; ?></span></a> <a id="button-delete-cache" class="button"><span><?php echo $button_delete; ?></span></a></td>';

				$('table.info tr:eq(1)').remove();
				$('table.info').append('<tr><td class="right">' + html + '</td></tr>');
			}
		}
	});
}

function tpl_edit(path_file, file, extension) {
	$('.success, .warning, #message').hide();
	$('.content').css('background', 'none');
	$('#display_file').empty();
	$('#loading').show();

	$.ajax({
		type: "POST",
		url: "index.php?route=tool/themeeditor/edit&format=raw&tmpl=component&token=<?php echo $token; ?>",
		data: "&path_file=" + path_file + "&file=" + file,
		success: function(msg){
			$('#display_file').html(msg);
			$('#loading').hide();
			tpl_code_mirror(extension);
			$('#display_file').fadeIn('fast');
		}
	});

	return false;
}

function tpls_restore(id, path_file, edit_file) {
	$('#display_file').empty().hide();
	$('#message').hide();

	$.ajax({
		type: "POST",
		url: "index.php?route=tool/themeeditor/restore&token=<?php echo $token; ?>",
		data: "&id=" + id + "&path_file=" + path_file + "&edit_file=" + edit_file,
		success: function(msg){
			$('#message').html(msg).show();

			setTimeout(function(){
				$('#message').hide();
            }, 2500);
		}
	});

	return false;
}

function folderCreate() {
	$.ajax({
		type: "POST",
		url: "index.php?route=tool/themeeditor/folderCreate&token=<?php echo $token; ?>",
		data: "&name="+ $('#new_name').val(),
		success: function(msg){
            window.location = 'index.php?route=tool/themeeditor';
		}
	});

	return false;
}

function cloneFile(curr_path, file){
    var opt = document.getElementById('theme_name');

    jQuery.ajax({
   		type: "POST",
   		url: "index.php?option=com_mijoshop&route=tool/themeeditor/cloneFile",
   		data: "&path="+ $("#theme_name").val() + "&curr_path="+ curr_path + "&file="+file,
   		success: function(msg){
               window.location = 'index.php?route=tool/themeeditor';
   		}
   	});

   	return false;
}

function tpls_delete_cache(id) {
	$('.success, .warning, .wait').remove();
	$('#message').hide();

	$.ajax({
		type: "POST",
		url: "index.php?route=tool/themeeditor/delete&token=<?php echo $token; ?>",
		data: "&file_id=" + id,
		dataType: 'json',
		success: function(json){
			if (json['success']) {
				$('.breadcrumb').after('<div class="success">' + json['success'] + '</div>');
				$('select[name=\'files_cache\'] option:selected').remove();

				if ($('select[name=\'files_cache\'] option').length <= 0) {
					$('table.info tr:eq(0)').remove();
				}
			}

			if (json['error']) {
				$('.breadcrumb').after('<div class="warning">' + json['error'] + '</div>');
			}

			setTimeout(function(){
				$('.warning, .success').hide();
            }, 2500);
		}
	});

	return false;
}

function tpl_code_mirror(extension) {
	var textarea = document.getElementById('code_mirror');

	if(extension == "css") {
		var editor = new MirrorFrame(CodeMirror.replace(textarea), {
			height: "620px",
			content: textarea.value,
			parserfile: "parsecss.js",
			stylesheet: "../media/editors/codemirror/css/csscolors.css",
			path: "../media/editors/codemirror/js/",
			lineNumbers: true,
			textWrapping: false,
			autoMatchParens: true
		});
	} else if(extension == "js") {
		var editor = new MirrorFrame(CodeMirror.replace(textarea), {
			height: "620px",
			content: textarea.value,
			parserfile: ["tokenizejavascript.js", "parsejavascript.js"],
			stylesheet: "../media/editors/codemirror/css/jscolors.css",
			autoMatchParens: true,
			lineNumbers: true,
			textWrapping: false, 
			path: "../media/editors/codemirror/js/"
		});
	} else {
		var editor = new MirrorFrame(CodeMirror.replace(textarea), {
			height: "620px",
			content: textarea.value,
			parserfile: ["parsexml.js", "parsecss.js", "tokenizejavascript.js", "parsejavascript.js",
						"tokenizephp.js", "parsephp.js", "parsephphtmlmixed.js"],
			stylesheet: ["../media/editors/codemirror/css/xmlcolors.css", "../media/editors/codemirror/css/jscolors.css", "../media/editors/codemirror/css/csscolors.css", "../media/editors/codemirror/css/phpcolors.css"],
			continuousScanning: 500,
			lineNumbers: true,
			path: "../media/editors/codemirror/js/"
		});
	}
}

function clearAllCache() {
	if (!confirm('Are you sure you want to do this?')) {
		return false;
	}

	$('.success, .warning, .wait').remove();
	$('#clear').html('<img src="view/image/loading.gif" alt="" />');

	$.getJSON("index.php?route=tool/themeeditor/clearcache&token=<?php echo $token; ?>", function(result) {
		$('.wait').remove();

		if (result.error) {
			$('.breadcrumb').after('<div class="warning">' + result.error + '</div>');
		} else {
			$('.breadcrumb').after('<div class="success">' + result.success + '</div>');

			$('table.form:eq(1) td:eq(1)').html('');
			$('#sfb').html('<?php echo $entry_backup_files; ?> 0');
		}

		$('#clear').html('<?php echo $button_clear_cache; ?>');
	});
}

$('#button-restore').live('click', function() {
    var files_cache = document.getElementById('files_cache');
    var path_file = document.getElementById('path_file');
    var edit_file = document.getElementById('edit_file');

	tpls_restore(files_cache.value, path_file.value, edit_file.value);
});

$('#button-delete-cache').live('click', function() {
	tpls_delete_cache(document.getElementById('files_cache').value);
});
//--></script>
<?php echo $footer; ?>