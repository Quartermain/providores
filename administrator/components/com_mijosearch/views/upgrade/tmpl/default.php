<?php
/**
* @package		MijoSearch
* @copyright	2009-2013 Mijosoft LLC, www.mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

// Check to ensure this file is included in Joomla!
defined('_JEXEC') or die('Restricted access');
?>

<script type="text/javascript">
    Joomla.submitbutton = function(pressbutton) {
        var form = document.getElementById('upgradeFromUpload');

        // do field validation
        if (form.install_package.value == ""){
            alert("<?php echo JText::_('No file selected', true); ?>");
        }
        else {
            form.submit();
        }
    }
</script>

<fieldset class="adminform">
    <legend><?php echo JText::_('COM_MIJOSEARCH_UPGRADE_VERSION_INFO'); ?></legend>
    <table class="adminform">
        <tr>
            <th>
                <?php echo JText::_('COM_MIJOSEARCH_CPANEL_INSTALLED_VERSION'); ?> : <?php echo $this->versions['installed'];?>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <?php echo JText::_('COM_MIJOSEARCH_CPANEL_LATEST_VERSION'); ?> : <?php echo $this->versions['latest'];?>
            </th>
        </tr>
    </table>
</fieldset>
<br/><br/>
<div id="installer-install">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#automatic" data-toggle="tab"><?php echo JText::_('COM_MIJOSEARCH_UPGRADE_FROM_SERVER'); ?></a></li>
        <li><a href="#manual" data-toggle="tab"><?php echo JText::_('COM_MIJOSEARCH_UPGRADE_FROM_FILE'); ?></a></li>
    </ul>

    <div class="tab-content">
        <div class="tab-pane active" id="automatic">
            <form enctype="multipart/form-data" action="index.php" method="post" name="upgradeFromServer" id="upgradeFromServer" class="form-horizontal">
                <fieldset class="uploadform">
                    <legend><?php echo JText::_('COM_MIJOSEARCH_UPGRADE_FROM_SERVER'); ?></legend>
                    <?php
                    $pid = $this->MijosearchConfig->pid;
                    if (empty($pid)) {
                        echo '<b><font color="red">'.JText::_('COM_MIJOSEARCH_UPGRADE_PERSONAL_ID').'</font></b>';
                    } else {
                        ?>
                        <div class="form-actions">
                            <input class="btn btn-primary" type="button" value="<?php echo JText::_('COM_MIJOSEARCH_UPGRADE_FROM_SERVER_BTN'); ?>" onclick="form.submit()" />
                        </div>
                        <?php } ?>
                </fieldset>

                <input type="hidden" name="option" value="com_mijosearch" />
                <input type="hidden" name="controller" value="upgrade" />
                <input type="hidden" name="task" value="upgrade" />
                <input type="hidden" name="type" value="server" />
                <?php echo JHTML::_('form.token'); ?>
            </form>
        </div>
        <div class="tab-pane" id="manual">
            <form enctype="multipart/form-data" action="index.php" method="post" name="upgradeFromUpload" id="upgradeFromUpload" class="form-horizontal">
                <fieldset class="uploadform">
                    <legend><?php echo JText::_('COM_MIJOSEARCH_UPGRADE_FROM_FILE'); ?></legend>
                    <div class="control-group">
                        <label for="install_package" class="control-label"><?php echo JText::_('COM_MIJOSEARCH_UPGRADE_PACKAGE'); ?></label>
                        <div class="controls">
                            <input class="input_box" id="install_package" name="install_package" type="file" size="57" />
                        </div>
                    </div>
                    <div class="form-actions">
                        <input class="btn btn-primary" type="button" value="<?php echo JText::_('COM_MIJOSEARCH_UPGRADE_UPLOAD_UPGRADE'); ?>" onclick="Joomla.submitbutton()" />
                    </div>
                </fieldset>

                <input type="hidden" name="option" value="com_mijosearch" />
                <input type="hidden" name="controller" value="upgrade" />
                <input type="hidden" name="task" value="upgrade" />
                <input type="hidden" name="type" value="upload" />
                <?php echo JHTML::_('form.token'); ?>
            </form>
        </div>
    </div>
</div>