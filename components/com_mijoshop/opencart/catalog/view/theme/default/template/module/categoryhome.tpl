<div class="box">
    <div class="box-heading"><?php echo $heading_title; ?></div>
        <div class="box-content">
        <div class="box-product">

        <?php foreach ($categories as $category) { ?>
            <div>
                  <div class="image"><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" title="<?php echo $category['name']; ?>" alt="<?php echo $category['name']; ?>" /></a></div>
                  <div class="name"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></div>
            </div>
        <?php } ?>
        </div>
    </div>
</div>