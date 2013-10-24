<style type="text/css">
    .column-css { border: 3px solid #EEE; padding: 10px; }
    .image-css { display: block; margin-left: auto; margin-right: auto; width: 128px; height: 128px; }
</style>
<?php echo $header; ?>
<div id="content">
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <div class="box">
        <div class="heading">
            <h1><img src="view/image/user-group.png" alt="" /> <?php echo $heading_title; ?></h1>
        </div>
        <div class="content">
            <table align="center" width="600">
                <tr>
                    <td class="column-css">
                        <a href="http://mijosoft.com/support/search" target="_blank"><img src="http://mijosoft.com/images/support/search.png" class="image-css" /></a>
                        <br />
                        <div style="text-align: center;"><a href="http://mijosoft.com/support/search" target="_blank"><strong>Find Solutions</strong></a></div>
                    </td>
                    <td class="column-css">
                        <a href="http://mijosoft.com/support/docs/mijoshop" target="_blank"><img src="http://mijosoft.com/images/support/documentation.png" class="image-css" /></a>
                        <br />
                        <div style="text-align: center;"><a href="http://mijosoft.com/support/docs/mijoshop" target="_blank"><strong>Documentation</strong></a></div>
                    </td>
                    <td class="column-css">
                        <a href="http://mijosoft.com/support/docs/mijoshop/video-tutorials" target="_blank"><img src="http://mijosoft.com/images/support/videos.png" class="image-css" /></a>
                        <br />
                        <div style="text-align: center;"><a href="http://mijosoft.com/support/docs/mijoshop/video-tutorials" target="_blank"><strong>Video Tutorials</strong></a></div>
                    </td>
                </tr>
                <tr>
                    <td class="column-css">
                        <a href="http://mijosoft.com/support/tickets" target="_blank"><img src="http://mijosoft.com/images/support/tickets.png" class="image-css" /></a>
                        <br />
                        <div style="text-align: center;"><a href="http://mijosoft.com/support/tickets" target="_blank"><strong>Tickets System</strong></a></div>
                    </td>
                    <td class="column-css">
                        <a href="http://mijosoft.com/services/new-extension-request" target="_blank"><img src="http://mijosoft.com/images/support/new-extension.png" class="image-css" /></a>
                        <br />
                        <div style="text-align: center;"><a href="http://mijosoft.com/services/new-extension-request" target="_blank"><strong>New Extension Request (Paid)</strong></a></div>
                    </td>
                    <td class="column-css">
                        <a href="http://mijosoft.com/services/support" target="_blank"><img src="http://mijosoft.com/images/support/paid-support.png" class="image-css" /></a>
                        <br />
                        <div style="text-align: center;"><a href="http://mijosoft.com/services/support" target="_blank"><strong>Support Service (Paid)</strong></a></div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>