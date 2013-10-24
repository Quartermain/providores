<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error) { ?>
  <div class="warning"><?php echo $error; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/payment.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="changeStatus(1);" class="button"><?php echo $button_enable; ?></a><a onclick="changeStatus(0)" class="button"><?php echo $button_disable; ?></a></div>
    </div>
    <div class="content">
      <form id="form" method="post">
      <table class="list">
        <thead>
          <tr>
            <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
            <td class="left"><?php echo $column_name; ?></td>
            <td></td>
            <td class="left"><?php echo $column_status; ?></td>
            <td class="right"><?php echo $column_sort_order; ?></td>
            <td class="right"><?php echo $column_action; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php if ($extensions) { ?>
          <?php foreach ($extensions as $extension) { ?>
          <tr>
            <td style="text-align: center;"><input type="checkbox" name="selected[]" value="<?php echo $extension['extension']; ?>" /></td>
            <td class="left"><?php echo $extension['name']; ?></td>
            <td class="center"><?php echo $extension['link'] ?></td>
            <td class="left"><?php echo $extension['status'] ?></td>
            <td class="right"><?php echo $extension['sort_order']; ?></td>
            <td class="right"><?php foreach ($extension['action'] as $action) { ?>
              [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
              <?php } ?></td>
          </tr>
          <?php } ?>
          <?php } else { ?>
          <tr>
            <td class="center" colspan="6"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?>

<script type="text/javascript"><!--
function changeStatus(status){
    $.ajax({
        url: 'index.php?route=common/edit/changestatus&type=payment&status='+ status +'&token=<?php echo $token; ?>',
        dataType: 'json',
        data: $("#form").serialize(),
        success: function(json) {
            if(json){
                $('.box').before('<div class="warning">'+json.warning+'</div>');
            }
            else{
                location.reload();
            }
        }
    });
}
//--></script>