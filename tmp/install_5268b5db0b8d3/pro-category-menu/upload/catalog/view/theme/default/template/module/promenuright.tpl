<?php
// ----------------------------------
// Pro Category Menu for OpenCart 
// By Best-Byte
// www.best-byte.com
// ----------------------------------
?>
<script type="text/javascript" src="catalog/view/javascript/pro-category-menu/pro_category_menu_right.js"></script>
<style type="text/css">
.box .box-content-menu1{
	background: <?php echo $boxback; ?>;
	-webkit-border-radius: 0px 0px 7px 7px;
	-moz-border-radius: 0px 0px 7px 7px;
	-khtml-border-radius: 0px 0px 7px 7px;
	border-radius: 0px 0px 7px 7px;
	border-width: <?php echo $boxbsize; ?>px;
	border-color: <?php echo $boxbcolor; ?>;
	border-style: <?php echo $boxbstyle; ?>;
	border-top: none;
	padding: <?php echo $boxpad; ?>px;  
}
.webwidget_vertical_menu1 ul{
  padding: 0px;
  margin: 0px;
  font-family: <?php echo $fontfamily; ?>;
}
.webwidget_vertical_menu1 ul li{
  list-style: none;
  position: relative;
}
.webwidget_vertical_menu1 ul li a{
  padding-right: <?php echo $fontlrpad; ?>px;
  text-decoration: none; 
  color: <?php echo $fontcolor; ?>;
  text-align: right;
  font-weight: <?php echo $fontweight; ?>;
}
/*
.webwidget_vertical_menu1 ul li a{  
  padding-top: 10px; 
  line-height: 12px !important;
}
*/
.webwidget_vertical_menu1 ul li a:hover {
  color: <?php echo $fonthcolor; ?>;
}
.webwidget_vertical_menu1 ul li a.active {
  color: <?php echo $fontacolor; ?>;
  background: <?php echo $menuaback; ?> url('catalog/view/theme/default/image/arrow-left.png') 0% 50% no-repeat;
}
.webwidget_vertical_menu1 ul li a.active:hover {
  color: <?php echo $fontahcolor; ?>;
  background: <?php echo $menuahback; ?> url('catalog/view/theme/default/image/arrow-left.png') 0% 50% no-repeat;
}
.webwidget_vertical_menu1 ul li ul{
  display: none;
  position: absolute;
  background-color: #fff;
  z-index: 999999;
}
/*
.webwidget_vertical_menu1 ul li ul li {  
padding-left: 50px;
}
.webwidget_vertical_menu1 ul li ul li a {  
white-space: nowrap;
}
.webwidget_vertical_menu1 ul li ul li ul {  
margin-right: 50px; 
}
*/
.webwidget_vertical_menu1 ul li ul li{
  margin: 0px;
  border-top-width: <?php echo $menusubsize; ?>px;
  border-top-color: <?php echo $menusubcolor; ?>;
  border-top-style: <?php echo $menusubstyle; ?>;
}
.webwidget_vertical_menu1 ul li ul li ul li {
  margin: 0px;
  border-top-width: <?php echo $menusubsize; ?>px;
  border-top-color: <?php echo $menusubcolor; ?>;
  border-top-style: <?php echo $menusubstyle; ?>;
} 
.webwidget_vertical_menu_down_drop1{
	background-position: left center;
	background-repeat: no-repeat !important;
}
.webwidget_vertical_menu1 ul li li{
  font-weight: normal;
}
</style>
        <script language="javascript" type="text/javascript">
            $(function() {
                $("#webwidget_vertical_menu1").webwidget_vertical_menu1({
                    menu_width: '<?php echo $menuwidth; ?>',
                    menu_height: '<?php echo $menuheight; ?>',
                    menu_margin: '<?php echo $menumargin; ?>',
                    menu_text_size: '<?php echo $fontsize; ?>',
                    menu_text_color: '',
                    menu_background_color: '<?php echo $menuback; ?>',
                    menu_border_size: '<?php echo $menubsize; ?>',
                    menu_border_color: '<?php echo $menubcolor; ?>',
                    menu_border_style: '<?php echo $menubstyle; ?>',
                    menu_background_hover_color: '<?php echo $menuhback; ?>',
                    directory: 'catalog/view/theme/default/image'
                });
            });
        </script>
<div class="box">
  <div class="box-heading" style="text-align: right;"><?php echo $heading_title; ?></div>
  <div class="box-content-menu1">
    <div id="webwidget_vertical_menu1" class="webwidget_vertical_menu1">
      <ul> 
        <?php foreach ($categories as $category) { ?>
        <li>  
          <?php if ($category['category_id'] == $category_id) { ?>
          <a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?></a>
          <?php } else { ?>
          <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
          <?php } ?>  
          <?php if ($category['children']) { ?>
          <ul>
            <?php foreach ($category['children'] as $child) { ?>
            <li>
            <?php if ($child['category_id'] == $child_id) { ?>
            <a href="<?php echo $child['href']; ?>" class="active"><?php echo $child['name']; ?></a>
            <?php } else { ?>
            <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
            <?php } ?>
            <?php if($child['child2_id']){ ?>
          <ul>
            <?php foreach ($child['child2_id'] as $child2) { ?>
            <li>
            <?php if ($child2['category_id'] == $child2_id) { ?>  
            <a href="<?php echo $child2['href']; ?>" class="active"><?php echo $child2['name']; ?></a>
            <?php } else { ?>
            <a href="<?php echo $child2['href']; ?>"><?php echo $child2['name']; ?></a>
            <?php } ?>            
            <?php if($child2['child3_id']){ ?>
          <ul>
            <?php foreach ($child2['child3_id'] as $child3) { ?>
            <li>
            <?php if ($child3['category_id'] == $child3_id) { ?>
            <a href="<?php echo $child3['href']; ?>" class="active"><?php echo $child3['name']; ?></a>
            <?php } else { ?>
            <a href="<?php echo $child3['href']; ?>"><?php echo $child3['name']; ?></a>
            <?php } ?>
            </li>
            <?php } ?>
          </ul>
            <?php } ?>              
            </li>
            <?php } ?>
            </ul>
            <?php } ?>
            </li>
            <?php } ?>
           </ul>
          <?php } ?>
         </li>
        <?php } ?>
      </ul>
    </div>
  </div>
</div>