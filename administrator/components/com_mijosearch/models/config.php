<?php
/**
 * @package		MijoSearch
 * @copyright	2009-2013 Mijosoft LLC, www.mijosoft.com
 * @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
 * @license		2009-2012 GNU/GPL based on AceSearch www.joomace.net
 */

// No Permission
defined('_JEXEC') or die('Restricted Access');

// Model Class
class MijosearchModelConfig extends MijosearchModel {

	function __construct(){
		parent::__construct('config');
	}

	// Save configuration
	function save() {
		$config = new stdClass();
		
		// Main
		$config->version_checker				= JRequest::getVar('version_checker',			1,	    'post', 'int');
		$config->pid							= JRequest::getVar('pid',						'',     'post',	'string');
		$config->cache_versions					= JRequest::getVar('cache_versions',			0,	    'post', 'int');
		$config->cache_extensions				= JRequest::getVar('cache_extensions',			0,	    'post', 'int');
		$config->suggestions_always		        = JRequest::getVar('suggestions_always',		0,	    'post', 'int');
		$config->suggestions_engine				= JRequest::getVar('suggestions_engine', 		'mijosearch', 'post', 'string');
		$config->suggestions_yahoo_key			= JRequest::getVar('suggestions_yahoo_key', 	'',     'post', 'string');
		$config->suggestions_bing_key			= JRequest::getVar('suggestions_bing_key', 		'',     'post', 'string');

		// Google
		$config->google							= JRequest::getVar('google',					1,	'post', 'int');

		// Ajax Search
		$config->ajax_show_desc					= JRequest::getVar('ajax_show_desc',			1,		'post', 'int');
		$config->ajax_show_image				= JRequest::getVar('show_ajax_image',			1,		'post', 'int');
		$config->ajax_image_positions			= JRequest::getVar('ajax_image_positions',		'_left','post', 'string');
		$config->ajax_image_sizew				= JRequest::getVar('ajax_image_sizew',		 	'60', 	'post',	'string');
		$config->ajax_image_sizeh				= JRequest::getVar('ajax_image_sizeh',		 	'60', 	'post',	'string');
		$config->ajax_description_length		= JRequest::getVar('ajax_description_length', 	'200', 	'post',	'string');
		$config->ajax_title_length				= JRequest::getVar('ajax_title_length', 		'100', 	'post',	'string');
        $config->ajax_show_properties			= JRequest::getVar('ajax_show_properties',		1,		'post', 'int');
		$config->ajax_display_limit				= JRequest::getVar('ajax_display_limit',		'5',	'post', 'string');
		$config->ajax_enable				    = JRequest::getVar('ajax_enable',		        1,  	'post', 'int');
		$config->ajax_result_width				= JRequest::getVar('ajax_result_width',		    '250',	'post', 'int');
		$config->ajax_title_color				= JRequest::getVar('ajax_title_color',		    '#4E6170',	    'post', 'string');
		$config->ajax_title_color_hover			= JRequest::getVar('ajax_title_color_hover',    '#FFFFFF',	    'post', 'string');
		$config->ajax_desc_color				= JRequest::getVar('ajax_desc_color',		    '#E4EAEE',	    'post', 'string');
		$config->ajax_desc_color_hover			= JRequest::getVar('ajax_desc_color_hover',		'#FFFFFF',	    'post', 'string');
		$config->ajax_bg_color			    	= JRequest::getVar('ajax_bg_color',		        '#FFFFFF',	    'post', 'string');
		$config->ajax_bg_color_hover			= JRequest::getVar('ajax_bg_color_hover',		'#0044CC',	    'post', 'string');
		$config->ajax_button_class				= JRequest::getVar('ajax_button_class',		    'more',	    'post', 'string');
		$config->ajax_title_bg			    	= JRequest::getVar('ajax_title_bg',		        '#E4EAEE',	    'post', 'string');

		// Front-end
		$config->show_order					    = JRequest::getVar('show_order',				1,		'post', 'int');
		$config->show_ext_flt					= JRequest::getVar('show_ext_flt',				1,		'post', 'int');
		$config->save_results    				= JRequest::getVar('save_results',				1,		'post', 'int');
		$config->show_db_errors    				= JRequest::getVar('show_db_errors',			1,		'post', 'int');
		$config->show_url						= JRequest::getVar('show_url',					1,		'post', 'int');
		$config->show_properties				= JRequest::getVar('show_properties',			1,		'post', 'int');
		$config->show_search_refine				= JRequest::getVar('show_search_refine',		1,		'post', 'int');
		$config->show_display					= JRequest::getVar('show_display',				1,		'post', 'int');
		$config->search_char					= JRequest::getVar('search_char',				'', 	'post',	'string');
		$config->show_adv_search				= JRequest::getVar('show_adv_search',			1,		'post', 'int');
		$config->yahoo_sections 				= JRequest::getVar('yahoo_sections',    		1,		'post', 'int');
		$config->enable_complete				= JRequest::getVar('enable_complete',			1,		'post', 'int');
		$config->enable_suggestion				= JRequest::getVar('enable_suggestion',			1,		'post', 'int');
		$config->enable_highlight				= JRequest::getVar('enable_highlight',			1,		'post', 'int');
		$config->show_desc						= JRequest::getVar('show_desc',					1,		'post', 'int');
		$config->show_image						= JRequest::getVar('show_image',				1,		'post', 'int');
		$config->image_positions				= JRequest::getVar('image_positions',			'_left', 'post', 'string');
		$config->image_sizew					= JRequest::getVar('image_sizew',		 		'80', 	'post',	'string');
		$config->image_sizeh					= JRequest::getVar('image_sizeh',		 		'80', 	'post',	'string');
		$config->description_length				= JRequest::getVar('description_length', 		'', 	'post',	'string');
		$config->title_length					= JRequest::getVar('title_length', 				'', 	'post',	'string');
		$config->blacklist						= JRequest::getVar('blacklist', 				'', 	'post',	'string');
		$config->result_limit					= JRequest::getVar('result_limit',				'50', 	'post',	'string');
		$config->access_checker					= JRequest::getVar('access_checker',			0,		'post', 'int');
		$config->max_search_char				= JRequest::getVar('max_search_char',			0,		'post', 'int');
		$config->results_format					= JRequest::getVar('results_format',			1,		'post', 'int');
		$config->display_limit					= JRequest::getVar('display_limit',				'15',	'post', 'string');
		$config->date_format					= JRequest::getVar('date_format',				0,		'post', 'string');
		$config->google_more_results			= JRequest::getVar('google_more_results',		1,  	'post', 'int');
		$config->google_more_results_length		= JRequest::getVar('google_more_results_length', '',  	'post', 'string');
		
		// Back-end
		$config->admin_display					= JRequest::getVar('admin_display', 			'', 	'post',	'string');
		$config->admin_show_desc				= JRequest::getVar('admin_show_desc',			1,		'post', 'int');
		$config->admin_show_url					= JRequest::getVar('admin_show_url',			1,		'post', 'int');
		$config->admin_show_properties			= JRequest::getVar('admin_show_properties',		1,		'post', 'int');
		$config->admin_show_search_info			= JRequest::getVar('admin_show_search_info',	1,		'post', 'int');
		$config->admin_show_display				= JRequest::getVar('admin_show_display',		1,		'post', 'int');
		$config->admin_show_ext_flt				= JRequest::getVar('admin_show_ext_flt',		1,		'post', 'int');
		$config->admin_enable_complete			= JRequest::getVar('admin_enable_complete',		1,		'post', 'int');
		$config->admin_enable_suggestion		= JRequest::getVar('admin_enable_suggestion',	1,		'post', 'int');
		$config->admin_enable_highlight			= JRequest::getVar('admin_enable_highlight',	1,		'post', 'int');
		$config->admin_show_page_title			= JRequest::getVar('admin_show_page_title',		1,		'post', 'int');
		$config->admin_show_page_desc			= JRequest::getVar('admin_show_page_desc',		1,		'post', 'int');
		$config->admin_description_length		= JRequest::getVar('admin_description_length', 	'', 	'post',	'string');
		$config->admin_title_length				= JRequest::getVar('admin_title_length', 		'', 	'post',	'string');
		$config->admin_result_limit				= JRequest::getVar('admin_result_limit',		'50', 	'post',	'string');
		$config->admin_max_search_char			= JRequest::getVar('admin_max_search_char',		0,		'post', 'int');
		
		//Highlight
		$config->highlight_back1				= JRequest::getVar('highlight_back1', 		'', 	'post',	'string');
		$config->highlight_back2				= JRequest::getVar('highlight_back2', 		'', 	'post',	'string');
		$config->highlight_back3				= JRequest::getVar('highlight_back3',		'', 	'post',	'string');
		$config->highlight_back4				= JRequest::getVar('highlight_back4',		'', 	'post',	'string');
		$config->highlight_back5				= JRequest::getVar('highlight_back5',		'', 	'post',	'string');
		$config->highlight_text1				= JRequest::getVar('highlight_text1', 		'', 	'post',	'string');
		$config->highlight_text2				= JRequest::getVar('highlight_text2', 		'', 	'post',	'string');
		$config->highlight_text3				= JRequest::getVar('highlight_text3',		'', 	'post',	'string');
		$config->highlight_text4				= JRequest::getVar('highlight_text4',		'', 	'post',	'string');
		$config->highlight_text5				= JRequest::getVar('highlight_text5',		'', 	'post',	'string');

		MijoSearch::get('utility')->storeConfig($config);
		
		$this->cleanCache('_system');
	}

    function getLists(){
        $utility = MijoSearch::get('utility');

        $lists = array();

        $suggestions_engine = array();
        $suggestions_engine[] = JHTML::_('select.option', 'mijosearch', JText::_('MijoSearch'));
        $suggestions_engine[] = JHTML::_('select.option', 'google', JText::_('Google'));
        $suggestions_engine[] = JHTML::_('select.option', 'yahoo', JText::_('Yahoo'));
        $suggestions_engine[] = JHTML::_('select.option', 'bing', JText::_('Bing'));
        $suggestions_engine[] = JHTML::_('select.option', 'pspell', JText::_('PHP Spell'));

        $results_format = array();
        $results_format[] = JHTML::_('select.option', '1', JText::_('COM_MIJOSEARCH_CONFIG_RESULTS_FORMAT_1'));
        $results_format[] = JHTML::_('select.option', '2', JText::_('COM_MIJOSEARCH_CONFIG_RESULTS_FORMAT_2'));

        $image_positions = array();
        $image_positions[] = JHTML::_('select.option', '_left', JText::_('COM_MIJOSEARCH_CONFIG_IMAGE_LEFT'));
        $image_positions[] = JHTML::_('select.option', '_right', JText::_('COM_MIJOSEARCH_CONFIG_IMAGE_RIGHT'));

        $ajax_image_positions = array();
        $ajax_image_positions[] = JHTML::_('select.option', '_left', JText::_('COM_MIJOSEARCH_CONFIG_IMAGE_LEFT'));
        $ajax_image_positions[] = JHTML::_('select.option', '_right', JText::_('COM_MIJOSEARCH_CONFIG_IMAGE_RIGHT'));

        $date_format = array();
        $date_format[] = JHTML::_('select.option', 'l, d F Y', JText::_('Monday, 01 April 2011'));
        $date_format[] = JHTML::_('select.option', 'm/d/y', JText::_('01/04/2011'));
        $date_format[] = JHTML::_('select.option', 'm-d-y', JText::_('(US Format) 01-25-2011'));
        $date_format[] = JHTML::_('select.option', 'd-m-y', JText::_('(European Format) 25-01-2011'));
		$date_format[] = JHTML::_('select.option', 'D, d M y H:m:s', JText::_('Tue, 09 Jan 2002 22:14:02'));

        // Main
        $lists['version_checker']				= $utility->getRadioList('version_checker',       $this->MijosearchConfig->version_checker);
        $lists['show_db_errors']				= $utility->getRadioList('show_db_errors',        $this->MijosearchConfig->show_db_errors);
        $lists['cache_versions']				= $utility->getRadioList('cache_versions',        $this->MijosearchConfig->cache_versions);
        $lists['cache_extensions']				= $utility->getRadioList('cache_extensions',      $this->MijosearchConfig->cache_extensions);
        $lists['suggestions_always']			= $utility->getRadioList('suggestions_always',    $this->MijosearchConfig->suggestions_always);
        $lists['suggestions_engine']			= JHTML::_('select.genericlist', $suggestions_engine, 'suggestions_engine', 'class="inputbox" style="width: 150px;" size="1"', 'value' , 'text', $this->MijosearchConfig->suggestions_engine);

        // Google
        $lists['google']			            = $utility->getRadioList('google',    $this->MijosearchConfig->google);

        // Ajax Search
        $lists['ajax_show_desc']			    = $utility->getRadioList('ajax_show_desc',              $this->MijosearchConfig->ajax_show_desc);
        $lists['ajax_show_image']			    = $utility->getRadioList('ajax_show_image',             $this->MijosearchConfig->ajax_show_image);
        $lists['ajax_image_positions']			= JHTML::_('select.genericlist', $ajax_image_positions, 'ajax_image_positions', 'class="inputbox" style="width: 60px; margin-bottom: 1px !important;" size="1"', 'value' , 'text', $this->MijosearchConfig->ajax_image_positions);
        $lists['ajax_show_properties']			= $utility->getRadioList('ajax_show_properties',        $this->MijosearchConfig->ajax_show_properties);
        $lists['ajax_enable']			        = $utility->getRadioList('ajax_enable',                 $this->MijosearchConfig->ajax_enable);


        // Front-end
        $lists['save_results']			        = $utility->getRadioList('save_results',                $this->MijosearchConfig->save_results);
        $lists['show_url']			            = $utility->getRadioList('show_url',                    $this->MijosearchConfig->show_url);
        $lists['show_search_refine']			= $utility->getRadioList('show_search_refine',          $this->MijosearchConfig->show_search_refine);
        $lists['show_properties']			    = $utility->getRadioList('show_properties',             $this->MijosearchConfig->show_properties);
        $lists['show_display']			        = $utility->getRadioList('show_display',                $this->MijosearchConfig->show_display);
        $lists['show_order']			        = $utility->getRadioList('show_order',                  $this->MijosearchConfig->show_order);
        $lists['show_ext_flt']			        = $utility->getRadioList('show_ext_flt',                $this->MijosearchConfig->show_ext_flt);
        $lists['show_adv_search']			    = $utility->getRadioList('show_adv_search',             $this->MijosearchConfig->show_adv_search);
        $lists['yahoo_sections']			    = $utility->getRadioList('yahoo_sections',              $this->MijosearchConfig->yahoo_sections);
        $lists['access_checker']			    = $utility->getRadioList('access_checker',              $this->MijosearchConfig->access_checker);
        $lists['enable_complete']			    = $utility->getRadioList('enable_complete',             $this->MijosearchConfig->enable_complete);
        $lists['enable_highlight']			    = $utility->getRadioList('enable_highlight',            $this->MijosearchConfig->enable_highlight);
        $lists['enable_suggestion']			    = $utility->getRadioList('enable_suggestion',           $this->MijosearchConfig->enable_suggestion);
        $lists['show_desc']			            = $utility->getRadioList('show_desc',                   $this->MijosearchConfig->show_desc);
        $lists['show_image']			        = $utility->getRadioList('show_image',                  $this->MijosearchConfig->show_image);
        $lists['google_more_results']			= $utility->getRadioList('google_more_results',         $this->MijosearchConfig->google_more_results);
        $lists['google_more_results_length']	= $utility->getRadioList('google_more_results_length',  $this->MijosearchConfig->google_more_results_length);
        $lists['image_positions']				= JHTML::_('select.genericlist', $image_positions, 'image_positions', 'class="inputbox" style="width: 60px; margin-bottom: 1px !important;" size="1"', 'value' , 'text', $this->MijosearchConfig->image_positions);
        $lists['results_format']				= JHTML::_('select.genericlist', $results_format, 'results_format', 'class="inputbox" style="width: 150px; margin-bottom: 1px !important;" size="1"', 'value' , 'text', $this->MijosearchConfig->results_format);
        $lists['date_format']					= JHTML::_('select.genericlist', $date_format, 'date_format', 'class="inputbox" style="width: 150px; margin-bottom: 1px !important;" size="1"', 'value' , 'text', $this->MijosearchConfig->date_format);

        // Back-end
        $lists['admin_show_desc']			    = $utility->getRadioList('admin_show_desc',             $this->MijosearchConfig->admin_show_desc);
        $lists['admin_show_url']			    = $utility->getRadioList('admin_show_url',              $this->MijosearchConfig->admin_show_url);
        $lists['admin_show_properties']			= $utility->getRadioList('admin_show_properties',       $this->MijosearchConfig->admin_show_properties);
        $lists['admin_show_display']			= $utility->getRadioList('admin_show_display',          $this->MijosearchConfig->admin_show_display);
        $lists['admin_show_ext_flt']			= $utility->getRadioList('admin_show_ext_flt',          $this->MijosearchConfig->admin_show_ext_flt);
        $lists['admin_enable_complete']			= $utility->getRadioList('admin_enable_complete',       $this->MijosearchConfig->admin_enable_complete);
        $lists['admin_enable_suggestion']		= $utility->getRadioList('admin_enable_suggestion',     $this->MijosearchConfig->admin_enable_suggestion);
        $lists['admin_enable_highlight']		= $utility->getRadioList('admin_enable_highlight',      $this->MijosearchConfig->admin_enable_highlight);
        $lists['admin_show_page_title']			= $utility->getRadioList('admin_show_page_title',       $this->MijosearchConfig->admin_show_page_title);
        $lists['admin_show_page_desc']			= $utility->getRadioList('admin_show_page_desc',        $this->MijosearchConfig->admin_show_page_desc);
        $lists['admin_description_length']		= $utility->getRadioList('admin_description_length',    $this->MijosearchConfig->admin_description_length);
        $lists['admin_title_length']			= $utility->getRadioList('admin_title_length',          $this->MijosearchConfig->admin_title_length);
        $lists['admin_result_limit']			= $utility->getRadioList('admin_result_limit',          $this->MijosearchConfig->admin_result_limit);
        $lists['admin_max_search_char']			= $utility->getRadioList('admin_max_search_char',       $this->MijosearchConfig->admin_max_search_char);

        return $lists;
    }
}