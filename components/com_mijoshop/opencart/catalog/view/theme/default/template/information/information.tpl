<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="box">
  <div class="box-heading"><h1 class="mijoshop_heading_h1"><?php echo $heading_title; ?></h1></div>
  <div class="box-content">
  <?php echo MijoShop::get('base')->triggerContentPlg($description); ?>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  </div>
  </div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>