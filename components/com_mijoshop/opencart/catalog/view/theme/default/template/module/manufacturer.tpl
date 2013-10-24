<div class="box_oc">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content" style="text-align: center;">
    <?php if ($manufacturers) { ?>
    <select onchange="location=this.options[this.selectedIndex].value;">
      <option value=""><?php echo $text_select; ?></option>
      <?php foreach ($manufacturers as $manufacturer) { ?>
      <option value="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></option>
      <?php } ?>
    </select>
    <?php } ?>
  </div>
</div>