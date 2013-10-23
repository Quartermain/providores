<?php
/** 
 *------------------------------------------------------------------------------
 * @package       T3 Framework for Joomla!
 *------------------------------------------------------------------------------
 * @copyright     Copyright (C) 2004-2013 JoomlArt.com. All Rights Reserved.
 * @license       GNU General Public License version 2 or later; see LICENSE.txt
 * @authors       JoomlArt, JoomlaBamboo, (contribute to this project at github 
 *                & Google group to become co-author)
 * @Google group: https://groups.google.com/forum/#!forum/t3fw
 * @Link:         http://t3-framework.org 
 *------------------------------------------------------------------------------
 */

defined('_JEXEC') or die;

// Initiasile related data.
require_once JPATH_ADMINISTRATOR.'/components/com_menus/helpers/menus.php';
$menuTypes = MenusHelper::getMenuLinks();
$user = JFactory::getUser();
?>

<div class="t3-admin-assignment clearfix">

  <div class="t3-admin-fieldset-desc">
    <?php echo JText::_('T3_MENUS_ASSIGNMENT_DESC'); ?>
  </div>

  <div class="control-group t3-control-group">

    <div class="control-label t3-control-label">
      <label id="jform_menuselect-lbl" for="jform_menuselect"><?php echo JText::_('JGLOBAL_MENU_SELECTION'); ?></label>
    </div>

    <div class="controls t3-controls">
      <div class="btn-toolbar">
        <button type="button" class="btn" onclick="$$('.chk-menulink').each(function(el) { el.checked = !el.checked; });">
          <i class="icon-checkbox-partial"></i> <?php echo JText::_('JGLOBAL_SELECTION_INVERT'); ?>
        </button>
      </div>
      <div id="menu-assignment">
        <ul class="menu-links thumbnails">
          <?php foreach ($menuTypes as &$type) : ?>
              <li class="span3">
                <div class="thumbnail">
                <h5><?php echo $type->title ? $type->title : $type->menutype; ?></h5>
                  <?php foreach ($type->links as $link) :?>
                    <label class="checkbox small" for="link<?php echo (int) $link->value;?>" >
                    <input type="checkbox" name="jform[assigned][]" value="<?php echo (int) $link->value;?>" id="link<?php echo (int) $link->value;?>"<?php if ($link->template_style_id == $form->getValue('id')):?> checked="checked"<?php endif;?><?php if ($link->checked_out && $link->checked_out != $user->id):?> disabled="disabled"<?php else:?> class="chk-menulink "<?php endif;?> />
                      <?php echo $link->text; ?>
                    </label>
                  <?php endforeach; ?>
                </div>
              </li>
          <?php endforeach; ?>
        </ul>
      </div>
    </div>
  </div>
</div>

