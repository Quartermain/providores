<?php
/**
 * @package		MijoSearch
 * @copyright	2009-2013 Mijosoft LLC, www.mijosoft.com
 * @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
 * @license		2009-2012 GNU/GPL based on AceSearch www.joomace.net
 */

// No Permission
defined('_JEXEC') or die('Restricted access');
?>

<form action="index.php" method="post" name="adminForm" id="adminForm">
    <fieldset class="panelform">
        <?php echo JHtml::_('tabs.start', 'mijosearch-config'); ?>

        <?php echo JHtml::_('tabs.panel', JText::_('COM_MIJOSEARCH_COMMON_MAIN'), 'mainn'); ?>
        <table class="noshow">
            <tr>
                <td width="50%">
                    <fieldset class="panelform form-horizontal">
                        <legend><?php echo JText::_('MijoSearch'); ?></legend>
                        <table class="admintable">
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_VERSION_CHECKER'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_VERSION_CHECKER_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_VERSION_CHECKER'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['version_checker'];?>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_SHOW_DB_ERRORS'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_SHOW_DB_ERRORS_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_SHOW_DB_ERRORS'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['show_db_errors'];?>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                    <fieldset class="panelform form-horizontal">
                        <legend><?php echo JText::_('COM_MIJOSEARCH_CONFIG_LEGEND_UPGRADE'); ?></legend>
                        <table class="admintable">
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_UPGRADE_ID'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_UPGRADE_ID_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_UPGRADE_ID'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="password" name="pid" id="pid" value="<?php echo $this->MijosearchConfig->pid;?>" style="width:150px"/>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                    <fieldset class="panelform form-horizontal">
                        <legend><?php echo JText::_('COM_MIJOSEARCH_CONFIG_LEGEND_CACHE_PERMANENT'); ?></legend>
                        <table class="admintable">
                            <tbody>
                                <tr>
                                    <td class="key2">
                                        <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_CACHE_VERSION'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_CACHE_VERSION_HELP'); ?>">
                                            <?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_CACHE_VERSION'); ?>
                                        </span>
                                    </td>
                                    <td>
                                        <?php echo $this->lists['cache_versions']; ?>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="key2">
                                        <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_CACHE_PARAMS'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_CACHE_PARAMS_HELP'); ?>">
                                            <?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_CACHE_PARAMS'); ?>
                                        </span>
                                    </td>
                                    <td>
                                        <?php echo $this->lists['cache_extensions']; ?>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </fieldset>
                </td>
                <td width="50%">
                    <fieldset class="panelform form-horizontal">
                        <legend><?php echo JText::_('COM_MIJOSEARCH_CONFIG_LEGEND_SUGGESTIONS'); ?></legend>
                        <table class="admintable">
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_SUGGESTIONS_ALWAYS'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_SUGGESTIONS_ALWAYS_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_SUGGESTIONS_ALWAYS'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['suggestions_always'];?>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_SUGGESTIONS_ENGINE'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_SUGGESTIONS_ENGINE_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_SUGGESTIONS_ENGINE'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <?php echo $this->lists['suggestions_engine']; ?>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_SUGGESTIONS_YAHOO'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_SUGGESTIONS_YAHOO_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_SUGGESTIONS_YAHOO'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" name="suggestions_yahoo_key" id="suggestions_yahoo_key" value="<?php echo $this->MijosearchConfig->suggestions_yahoo_key;?>" style="width:120px"/>
                                    &nbsp;&nbsp;
                                    <a href="https://developer.apps.yahoo.com/wsregapp/" target="_blank"><?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_SUGGESTIONS_GET_KEY'); ?></a>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_SUGGESTIONS_BING'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_SUGGESTIONS_BING_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_SUGGESTIONS_BING'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" name="suggestions_bing_key" id="suggestions_bing_key" value="<?php echo $this->MijosearchConfig->suggestions_bing_key;?>" style="width:120px"/>
                                    &nbsp;&nbsp;
                                    <a href="http://www.bing.com/developers/createapp.aspx" target="_blank"><?php echo JText::_('COM_MIJOSEARCH_CONFIG_MAIN_SUGGESTIONS_GET_KEY'); ?></a>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>
        </table>

        <?php echo JHtml::_('tabs.panel', JText::_('Google'), 'google'); ?>
        <table class="noshow">
            <tr>
                <td width="100%">
                    <fieldset class="panelform form-horizontal">
                        <legend><?php echo JText::_('COM_MIJOSEARCH_COMMON_MAIN'); ?></legend>
                        <table class="admintable">
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_GOOGLE_ENABLE'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_GOOGLE_ENABLE_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_GOOGLE_ENABLE'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <?php echo $this->lists['google'];?>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>
        </table>

        <?php echo JHtml::_('tabs.panel', JText::_('Ajax Search'), 'ajaxsearch'); ?>
        <table class="noshow">
            <tr>
                <td width="50%">
                    <fieldset class="panelform form-horizontal">
                        <legend><?php echo JText::_('COM_MIJOSEARCH_CONFIG_LEGEND_SEARCH'); ?></legend>
                        <table class="admintable">
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_ENABLE_AJAX'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_ENABLE_AJAX_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_ENABLE_AJAX'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['ajax_enable'];?>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_AJAX_RESULT_WIDTH'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_AJAX_RESULT_WIDTH_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_AJAX_RESULT_WIDTH'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" name="ajax_result_width" id="ajax_result_width" value="<?php echo $this->MijosearchConfig->ajax_result_width;?>" style="width:30px" maxlength="5"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_TITLE_LNG'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_TITLE_LNG_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_TITLE_LNG'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" name="ajax_title_length" id="ajax_title_length" value="<?php echo $this->MijosearchConfig->ajax_title_length;?>" style="width:30px" maxlength="5"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_DESC'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_DESC_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_DESC'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['ajax_show_desc'];?>&nbsp;&nbsp;&nbsp;<?php echo JText::_('COM_MIJOSEARCH_CONFIG_DESC_LNG'); ?>&nbsp;&nbsp;&nbsp;=>
                                    <input type="text" name="ajax_description_length" id="ajax_description_length" value="<?php echo $this->MijosearchConfig->ajax_description_length;?>" style="width:30px; float: none" maxlength="5"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_IMAGE'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_IMAGE_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_IMAGE'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['ajax_show_image'];?>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_IMAGE_POSITION'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_IMAGE_POSITION_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_IMAGE_POSITION'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <?php echo $this->lists['ajax_image_positions'];?>&nbsp;&nbsp;&nbsp;<?php echo JText::_('COM_MIJOSEARCH_CONFIG_IMAGE_SIZE'); ?>&nbsp;&nbsp;&nbsp;=>
                                    <input type="text" name="ajax_image_sizew" id="ajax_image_sizew" value="<?php echo $this->MijosearchConfig->ajax_image_sizew;?>" style="width:30px; float: none" maxlength="5"/>
                                    <input type="text" name="ajax_image_sizeh" id="ajax_image_sizeh" value="<?php echo $this->MijosearchConfig->ajax_image_sizeh;?>" style="width:30px; float: none" maxlength="5"/>
                                </td>
                            </tr>

                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_PROPERTIES'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_PROPERTIES_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_PROPERTIES'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['ajax_show_properties'];?>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_RESULTS_DISPLAY'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_RESULTS_DISPLAY_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_RESULTS_DISPLAY'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" name="ajax_display_limit" value="<?php echo $this->MijosearchConfig->ajax_display_limit;?>" size="1"/>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
                <td width="50%">
                    <fieldset class="panelform form-horizontal">
                        <legend><?php echo JText::_('COM_MIJOSEARCH_SEARCH_RESULTS'); ?></legend>
                        <table class="admintable">
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_AJAX_TITLE_COLOR'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_AJAX_TITLE_COLOR_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_AJAX_TITLE_COLOR'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" maxlength="7" name="ajax_title_color" size="7" id="colorpickerField11" value="<?php echo $this->MijosearchConfig->ajax_title_color;?>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_AJAX_TITLE_COLOR_HOVER'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_AJAX_TITLE_COLOR_HOVER_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_AJAX_TITLE_COLOR_HOVER'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" maxlength="7" name="ajax_title_color_hover" size="7" id="colorpickerField12" value="<?php echo $this->MijosearchConfig->ajax_title_color_hover;?>" />
                                </td>
                            </tr>
                            <tr>
							    <td class="key2">
								    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_AJAX_DESC_COLOR'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_AJAX_DESC_COLOR_HELP'); ?>">
								 	   <?php echo JText::_('COM_MIJOSEARCH_CONFIG_AJAX_DESC_COLOR'); ?>
							 	    </span>
							    </td>
							    <td class="value2">
								    <input type="text" maxlength="7" name="ajax_desc_color" size="7" id="colorpickerField14" value="<?php echo $this->MijosearchConfig->ajax_desc_color;?>" />
							    </td>
						    </tr>
						    <tr>
							    <td class="key2">
								    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_AJAX_DESC_COLOR_HOVER'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_AJAX_DESC_COLOR_HOVER_HELP'); ?>">
									   <?php echo JText::_('COM_MIJOSEARCH_CONFIG_AJAX_DESC_COLOR_HOVER'); ?>
								    </span>
							    </td>
							    <td class="value2">
								    <input type="text" maxlength="7" name="ajax_desc_color_hover" size="7" id="colorpickerField13" value="<?php echo $this->MijosearchConfig->ajax_desc_color_hover;?>" />
							    </td>
						    </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_AJAX_BACKGROUND_COLOR'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_AJAX_BACKGROUND_COLOR_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_AJAX_BACKGROUND_COLOR'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" maxlength="7" name="ajax_bg_color" size="7" id="colorpickerField15" value="<?php echo $this->MijosearchConfig->ajax_bg_color;?>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_AJAX_BACKGROUND_COLOR_HOVER'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_AJAX_BACKGROUND_COLOR_HOVER_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_AJAX_BACKGROUND_COLOR_HOVER'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" maxlength="7" name="ajax_bg_color_hover" size="7" id="colorpickerField16" value="<?php echo $this->MijosearchConfig->ajax_bg_color_hover;?>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_AJAX_BUTTON_CLASS'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_AJAX_BUTTON_CLASS_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_AJAX_BUTTON_CLASS'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" name="ajax_button_class" size="7" id="colorpickerField17" value="<?php echo $this->MijosearchConfig->ajax_button_class;?>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_AJAX_TITLE_BACKGROUND'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_AJAX_TITLE_BACKGROUND_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_AJAX_TITLE_BACKGROUND'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" maxlength="7" name="ajax_title_bg" size="7" id="colorpickerField18" value="<?php echo $this->MijosearchConfig->ajax_title_bg;?>" />
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>
        </table>

        <?php echo JHtml::_('tabs.panel', JText::_('COM_MIJOSEARCH_COMMON_FRONTEND'), 'frontend'); ?>
        <table class="noshow">
            <tr>
                <td width="50%">
                    <fieldset class="panelform form-horizontal">
                        <legend><?php echo JText::_('COM_MIJOSEARCH_CONFIG_LEGEND_SEARCH'); ?></legend>
                        <table class="admintable">
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_ORDER'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_ORDER_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_ORDER'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['show_order'];?>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_EXT_FILTER'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_EXT_FILTER_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_EXT_FILTER'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['show_ext_flt'];?>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_ENABLE_AUTOCOMPLETER'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_ENABLE_AUTOCOMPLETER_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_ENABLE_AUTOCOMPLETER'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['enable_complete'];?>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_ENABLE_SUGGESTION'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_ENABLE_SUGGESTION_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_ENABLE_SUGGESTION'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['enable_suggestion'];?>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_ENABLE_HIGHTLIGHT'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_ENABLE_HIGHTLIGHT_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_ENABLE_HIGHTLIGHT'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['enable_highlight'];?>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SAVE_KEYWORDS'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SAVE_KEYWORDS_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_SAVE_KEYWORDS'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['save_results'];?>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_ADV_SEARCH'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_ADV_SEARCH_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_ADV_SEARCH'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['show_adv_search'];?>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_YAHOO_STYLE'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_YAHOO_STYLE_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_YAHOO_STYLE'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['yahoo_sections'];?>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_RESULT_LIMIT'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_RESULT_LIMIT_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_RESULT_LIMIT'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" name="result_limit" value="<?php echo $this->MijosearchConfig->result_limit; ?>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SEARCH_CHAR'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SEARCH_CHAR_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_SEARCH_CHAR'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" name="search_char" value="<?php echo $this->MijosearchConfig->search_char;?>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_RESULT_MAX_SEARCH'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_RESULT_MAX_SEARCH_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_RESULT_MAX_SEARCH'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" name="max_search_char" value="<?php echo $this->MijosearchConfig->max_search_char; ?>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_BLACKLIST'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_BLACKLIST_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_BLACKLIST'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <textarea name="blacklist" cols="40" rows="8"><?php echo $this->MijosearchConfig->blacklist;?></textarea>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
                <td width="%50">
                    <fieldset class="panelform form-horizontal">
                        <legend><?php echo JText::_('COM_MIJOSEARCH_SEARCH_RESULTS'); ?></legend>
                        <table class="admintable">
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_ACCESS_CHECKER'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_ACCESS_CHECKER_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_ACCESS_CHECKER'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['access_checker'];?>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_RESULTS_FORMAT'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_RESULTS_FORMAT_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_RESULTS_FORMAT'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <?php echo $this->lists['results_format'];?>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SEARCH_REFINE'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SEARCH_REFINE_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_SEARCH_REFINE'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['show_search_refine'];?>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_TITLE_LNG'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_TITLE_LNG_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_TITLE_LNG'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" name="title_length" id="title_length" value="<?php echo $this->MijosearchConfig->title_length;?>" style="width:30px" maxlength="5"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_IMAGE'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_IMAGE_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_IMAGE'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['show_image'];?>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_IMAGE_POSITION'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_IMAGE_POSITION_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_IMAGE_POSITION'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <?php echo $this->lists['image_positions'];?>&nbsp;&nbsp;&nbsp;<?php echo JText::_('COM_MIJOSEARCH_CONFIG_IMAGE_SIZE'); ?>&nbsp;&nbsp;&nbsp;=>
                                    <input type="text" name="image_sizew" id="image_sizew" value="<?php echo $this->MijosearchConfig->image_sizew;?>" style="width:30px; float: none" maxlength="5"/>
                                    <input type="text" name="image_sizeh" id="image_sizeh" value="<?php echo $this->MijosearchConfig->image_sizeh;?>" style="width:30px; float: none" maxlength="5"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_DESC'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_DESC_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_DESC'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['show_desc'];?>&nbsp;&nbsp;&nbsp;<?php echo JText::_('COM_MIJOSEARCH_CONFIG_DESC_LNG'); ?>&nbsp;&nbsp;&nbsp;=>
                                    <input type="text" name="description_length" id="description_length" value="<?php echo $this->MijosearchConfig->description_length;?>" style="width:30px; float: none" maxlength="5"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_PROPERTIES'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_PROPERTIES_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_PROPERTIES'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['show_properties'];?>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_DATE_FORMAT'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_DATE_FORMAT_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_DATE_FORMAT'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <?php echo $this->lists['date_format'];?>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_URL'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_URL_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_URL'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['show_url'];?>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_DISPLAY'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_DISPLAY_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_DISPLAY'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['show_display'];?>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_RESULTS_DISPLAY'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_RESULTS_DISPLAY_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_RESULTS_DISPLAY'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" name="display_limit" value="<?php echo $this->MijosearchConfig->display_limit;?>" size="1"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_GOOGLE_MORE_RESULTS'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_GOOGLE_MORE_RESULTS_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_GOOGLE_MORE_RESULTS'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['google_more_results'];?>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_GOOGLE_MORE_RESULTS_LENGTH'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_GOOGLE_MORE_RESULTS_LENGTH_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_GOOGLE_MORE_RESULTS_LENGTH'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" name="google_more_results_length" id="google_more_results_length" value="<?php echo $this->MijosearchConfig->google_more_results_length;?>" size="1"/>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>
        </table>

        <?php echo JHtml::_('tabs.panel', JText::_('COM_MIJOSEARCH_COMMON_BACKEND'), 'backend'); ?>
        <table class="noshow">
            <tr>
                <td width="50%">
                    <fieldset class="panelform form-horizontal">
                        <legend><?php echo JText::_('COM_MIJOSEARCH_CONFIG_LEGEND_SEARCH'); ?></legend>
                        <table class="admintable">
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_EXT_FILTER'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_EXT_FILTER_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_EXT_FILTER'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['admin_show_ext_flt'];?>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_ENABLE_AUTOCOMPLETER'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_ENABLE_AUTOCOMPLETER_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_ENABLE_AUTOCOMPLETER'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['admin_enable_complete'];?>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_ENABLE_SUGGESTION'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_ENABLE_SUGGESTION_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_ENABLE_SUGGESTION'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['admin_enable_suggestion'];?>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_ENABLE_HIGHTLIGHT'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_ENABLE_HIGHTLIGHT_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_ENABLE_HIGHTLIGHT'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['admin_enable_highlight'];?>
                                </td>
                            </tr>
                                <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_RESULT_LIMIT'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_RESULT_LIMIT_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_RESULT_LIMIT'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" name="admin_result_limit" value="<?php echo $this->MijosearchConfig->admin_result_limit;?>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_RESULT_MAX_SEARCH'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_RESULT_MAX_SEARCH_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_RESULT_MAX_SEARCH'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" name="admin_max_search_char" value="<?php echo $this->MijosearchConfig->admin_max_search_char; ?>" />
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
                <td width="50%">
                    <fieldset class="panelform form-horizontal">
                        <legend><?php echo JText::_('COM_MIJOSEARCH_SEARCH_RESULTS'); ?></legend>
                        <table class="admintable">

                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_TITLE_LNG'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_TITLE_LNG_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_TITLE_LNG'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" name="admin_title_length" id="admin_title_length" value="<?php echo $this->MijosearchConfig->admin_title_length;?>" style="width:30px" maxlength="5" />
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_DESC'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_DESC_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_DESC'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['admin_show_desc'];?>&nbsp;&nbsp;&nbsp;<?php echo JText::_('COM_MIJOSEARCH_CONFIG_DESC_LNG'); ?>&nbsp;&nbsp;&nbsp;=>
                                    <input type="text" name="admin_description_length" id="admin_description_length" value="<?php echo $this->MijosearchConfig->admin_description_length;?>" style="width:30px; float: none;" maxlength="5"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_PROPERTIES'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_PROPERTIES_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_PROPERTIES'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['admin_show_properties'];?>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_URL'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_URL_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_URL'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['admin_show_url'];?>
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_DISPLAY'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_DISPLAY_HELP'); ?>">
                                        <?php echo JText::_('COM_MIJOSEARCH_CONFIG_SHOW_DISPLAY'); ?>
                                    </span>
                                </td>
                                <td>
                                    <?php echo $this->lists['admin_show_display'];?>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>
        </table>

        <?php echo JHtml::_('tabs.panel', JText::_('COM_MIJOSEARCH_COMMON_STYLE'), 'highlight'); ?>
        <table class="noshow">
            <tr>
                <td width="%50">
                <fieldset class="panelform form-horizontal">
                    <legend><?php echo JText::_('COM_MIJOSEARCH_COMMON_HIGHLIGH_TEXT'); ?></legend>
                        <table class="admintable">
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo '1.'.JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD_HELP'); ?>">
                                        <?php echo '1. '.JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" maxlength="6" name="highlight_text1" size="6" id="colorpickerField6" value="<?php echo $this->MijosearchConfig->highlight_text1;?>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo '2.'.JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD_HELP'); ?>">
                                        <?php echo '2. '.JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" maxlength="6" name="highlight_text2" size="6" id="colorpickerField7" value="<?php echo $this->MijosearchConfig->highlight_text2;?>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo '3.'.JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD_HELP'); ?>">
                                        <?php echo '3. '.JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" maxlength="6" name="highlight_text3" size="6" id="colorpickerField8" value="<?php echo $this->MijosearchConfig->highlight_text3;?>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo '4.'.JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD_HELP'); ?>">
                                        <?php echo '4. '.JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" maxlength="6" name="highlight_text4" size="6" id="colorpickerField9" value="<?php echo $this->MijosearchConfig->highlight_text4;?>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo '5.'.JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD_HELP'); ?>">
                                        <?php echo '5. '.JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" maxlength="6" name="highlight_text5" size="6" id="colorpickerField10" value="<?php echo $this->MijosearchConfig->highlight_text5;?>" />
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
                <td width="%50">
                <fieldset class="panelform form-horizontal">
                    <legend><?php echo JText::_('COM_MIJOSEARCH_COMMON_HIGHLIGH_BACK'); ?></legend>
                        <table class="admintable">
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo '1.'.JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD_HELP'); ?>">
                                        <?php echo '1. '.JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" maxlength="6" name="highlight_back1" size="6" id="colorpickerField1" value="<?php echo $this->MijosearchConfig->highlight_back1;?>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo '2.'.JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD_HELP'); ?>">
                                        <?php echo '2. '.JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" maxlength="6" name="highlight_back2" size="6" id="colorpickerField2" value="<?php echo $this->MijosearchConfig->highlight_back2;?>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo '3.'.JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD_HELP'); ?>">
                                        <?php echo '3. '.JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" maxlength="6" name="highlight_back3" size="6" id="colorpickerField3" value="<?php echo $this->MijosearchConfig->highlight_back3;?>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo '4.'.JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD_HELP'); ?>">
                                        <?php echo '4. '.JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" maxlength="6" name="highlight_back4" size="6" id="colorpickerField4" value="<?php echo $this->MijosearchConfig->highlight_back4;?>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="key2">
                                    <span class="hasTip" title="<?php echo '5.'.JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD'); ?>::<?php echo JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD_HELP'); ?>">
                                        <?php echo '5. '.JText::_('COM_MIJOSEARCH_CONFIG_KEYWORD'); ?>
                                    </span>
                                </td>
                                <td class="value2">
                                    <input type="text" maxlength="6" name="highlight_back5" size="6" id="colorpickerField5" value="<?php echo $this->MijosearchConfig->highlight_back5;?>" />
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>
        </table>

        <?php echo JHtml::_('tabs.end'); ?>
    </fieldset>

	<input type="hidden" name="id" value="" />
	<input type="hidden" name="option" value="com_mijosearch" />
	<input type="hidden" name="controller" value="config" />
	<input type="hidden" name="task" value="edit" />
	<?php echo JHTML::_('form.token'); ?>
</form>