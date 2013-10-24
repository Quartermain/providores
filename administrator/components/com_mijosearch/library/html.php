<?php
/**
* @version		1.5.0
* @package		MijoSearch Library
* @subpackage	HTML
* @copyright	2009-2011 Mijosoft LLC, www.mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceSearch www.joomace.net
*/

//No Permision
defined( '_JEXEC' ) or die( 'Restricted access' );

class MijosearchHTML {

	protected $aid = null;
	protected $db = null;
	protected $admin = true;
	protected $site = false;
	
	function __construct($option, $ext_params, $filter_params, $is_module) {
		$this->option = $option;
		$this->ext_params = $ext_params;
		$this->is_module = $is_module;
		$this->filter_params = $filter_params;
        
		$this->MijosearchConfig = MijoSearch::getConfig();
		$this->aid = JFactory::getUser()->get('aid');
		$this->db = JFactory::getDBO();
		$this->admin = JFactory::getApplication()->isAdmin();
		$this->site = JFactory::getApplication()->isSite();

        $this->onchange = "";
        if ($this->MijosearchConfig->ajax_enable == 1){
            $this->onchange = 'onchange="ajaxSearch()" ';
        }
	}

	static function getExtensionList($filter = 0, $filt_ext = -1, $module = '', $class = '', $group_id = null) {
		$mstyle = "";
		$cache = MijoSearch::getCache();
		$extension = JRequest::getCmd('ext', '');

		if (!empty($module)) {
			if (empty($class)) {
				$class = 'mijosearch_selectbox_module';
			}

			//$mstyle = 'style="margin-top:10px;"';
		}
        else {
			$class = 'mijosearch_selectbox';
		}

		if (empty($extension)) {
			$extension = JFactory::getURI()->getVar('ext', '');
		}

		$extensions = array();
		$text = "COM_MIJOSEARCH_SEARCH_SECTIONS";
		$javascript= ' onchange="ChangeType(this.value)"';

		if (!empty($module)){
			$text = "MOD_MIJOSEARCH_SEARCH_ALL";
			$javascript= ' onchange="changeExtModule(this.value)"';
		}

		$extensions[] = JHTML::_('select.option', '', JText::_($text));

		if (is_null($group_id)) {
			$group_id = MijosearchExtension::getCmd('filter');
		}

		if (!empty($group_id)) {
			$rows = $cache->getFilterExtensions($group_id);
		}
		else {
			$rows = $cache->getExtensions($filter);
		}

		if (!empty($rows) and is_array($rows) and (count($rows) == 1) and (JFactory::getApplication()->isSite() or !empty($module))) {
			$lists['extension'] = 1;
            foreach ($rows as $row) {
			    $lists['ext'] = $row->extension;
                break;
			}

			return $lists;
		}

		if (!empty($rows) and is_array($rows)) {
			foreach ($rows as $row) {
				$params = new JRegistry($row->params);
				
				$handler = $params->get('handler', '0');

				if ($handler == '2' and $filter == '1') {
					continue;
				}

				$name = MijosearchExtension::getExtensionName($row->extension);

				$extensions[$row->extension] = JHTML::_('select.option', $row->extension, $name);
			}
		}

		if ($filter == '0') {
			$lists['extension'] = JHTML::_('select.genericlist', $extensions, 'ext', 'class="'.$class.'"'.$mstyle.''.$javascript, 'value' ,'text', $extension);
		} else {
			$lists['extension'] = JHTML::_('select.genericlist', $extensions, 'extension', 'class="inputbox" multiple="multiple" size="10" style="width:120px;"'.$javascript, 'value' ,'text', $filt_ext);
		}

		return $lists;
	}

	public function getExtensions($group_id = null) {
		$extensions = $more = $more_label = $li = $html = "";

		$cache = MijoSearch::getCache();
		if (is_null($group_id)) {
			$group_id = MijosearchExtension::getInt('filter');
		}

		if (isset($group_id) && !empty($group_id)) {
			$rows = $cache->getFilterExtensions($group_id);
		}
		else {
			$rows = $cache->getExtensions();
		}
		
		if (count($rows) == 1) {
			return '';
		}

		if (!empty($rows)) {
			$extensions = $more = array();
            $ext = JRequest::getCmd('ext');
            $query = JRequest::getWord('query');
            $order = JRequest::getWord('order');
            $orderdir = JRequest::getWord('orderdir');
            $lang = JRequest::getWord('lang');

			if ($this->MijosearchConfig->google != '1') {
				$li ='</li>';
				$html = '<li class="last" role="presentation">';
				$html .='<a href="#" class="more-link" id="more-link">'.JText::_('MIJOSEARCH_SEARCH_MORE').'</a>';
			}
			else {
				$more_label = '<li class="last"><a href="#" class="more-link" id="more-link">'.JText::_('MIJOSEARCH_SEARCH_MORE').'</a></li>';
				$more_label .= '<li class="last"><a href="#" class="more-link" style="display:none;" id="fewer-link">'.JText::_('Fewer').'</a></li>';
			}

			$html .='<div id="more-menu" class="more-menu">';
			$html .='<ol id="mijosearch_more_menu_ol" class="first-of-type">';

            $link = 'index.php?option=com_mijosearch&view=search';

            if (!empty($group_id)) {
                $link .= '&filter='.$group_id;
            }

            if (!empty($order)) {
                $link .= '&order='.$order;
            }

            if (!empty($orderdir)) {
                $link .= '&orderdir='.$orderdir;
            }

            $link .= MijoSearch::get('utility')->getItemid($group_id);

            if (!empty($query)) {
                $link .= '&query='.$query;
            }

            if (!empty($lang)) {
                $link .= '&lang='.$lang;
            }

            $ev_link = JRoute::_($link);

            $css_class = empty($ext) ? 'class="on"' : '';

			$extensions[] = '<li><a '.$css_class.' href="'.$ev_link.'">'.JText::_('MIJOSEARCH_SEARCH_EVERYTHING').'</a></li>';

			foreach($rows as $row){
				/*$handler = MijoSearch::get('utility')->getParam($row->params , 'handler');

				if ($handler == '2') {
					continue;
				}*/

                $name = MijosearchExtension::getExtensionName($row->extension);

				$ext_link = $link . '&ext='.$row->extension;

                $ext_link = JRoute::_($ext_link);
				
				$not_selected_style = $this->MijosearchConfig->google == '1' ? '' : 'style="margin-left:5px;"';
				$css_class = ($ext == $row->extension) ? 'class="on"' : $not_selected_style;

				$ext_count = count($extensions);
				
				if ($ext_count > 3) {
					$more[] = '<li><a '.$css_class.' href="'.$ext_link.'">'.$name.'</a></li>';
				}
				else {
					$extensions[] = '<li><a '.$css_class.' href="'.$ext_link.'">'.$name.'</a></li>';
				}
			}

			$more = !empty($more) ? $html.implode('', $more).'</ol></div>'.$li : '';

			$extensions = !empty($extensions) ? implode(' ', $extensions): '';
			$extensions .= !empty($more) ? $more : '';
			
			if ($ext_count > 3) {
				$extensions .= $more_label;
			}
			
			$extensions = '<ol id="mijosearch_tabs" class="mijosearch_tabs">'.$extensions.'</ol>';
		}

		return $extensions;
	}

    function getExtraFields($childrens, $name) {
        $html = '';
		$fields = array();

		foreach ($childrens->field as $children) {
			$field_name = (string)$children->attributes()->name;
			$field_client = (string)$children->attributes()->name;

			if (($this->ext_params->get($field_name, '1') != '1') && JFactory::getApplication()->isSite()) {
				continue;
			}

			if (!empty($this->filter_params) && $this->filter_params->get($field_name, '0') == '') {
				continue;
			}

			if ($field_client == '0' && !(JFactory::getApplication()->isSite())) {
				continue;
			}

			if ($field_client == '1' && !(JFactory::getApplication()->isAdmin())) {
				continue;
			}

			$fields[] = self::_renderField($children);
		}

		$mijosearch_ext = MijoSearch::getExtension($this->option);
		$mijosearch_ext->getExtraFieldsHTML($this->ext_params, $fields, $this->is_module);

		if (empty($fields)) {
			return $html;
		}

		foreach ($fields as $field) {
			if (empty($field)) {
				continue;
			}

			$html .= $field;
		}

		if (!empty($html) and !$this->is_module) {
			$mijosearch_fieldset = JFactory::getApplication()->isSite() ? 'mijosearch_fieldset' : 'mijosearch_fieldset_admin';
			$html = '<fieldset class="'.$mijosearch_fieldset.'"><legend class="mijosearch_legend" style="width: 220px;">'.$name.' ('.JText::_('COM_MIJOSEARCH_SEARCH_EXTRA').') </legend>'.$html.'</fieldset>';
		}

        JHtml::_('formbehavior.chosen', 'select[size="1"], select:not([size])');

		return $html;
    }

	function _renderField($field) {
		$suffix = '';
		$type = (string)$field->attributes()->type;
		$name = (string)$field->attributes()->name;

		$function = '_renderField'.ucfirst($type);
		
		if (($type == 'order') || ($type == 'orderdir')) {
            return "";
		}

		if ($this->is_module) {
			if ($type == 'daterange') {
				return "";
			}

			if ($type == 'days' && $this->MijosearchConfig->google == '0') {
				return "";
			}

            $suffix = '_module';
		}

		$filter = !empty($this->filter_params) ? $this->filter_params->get($name,'') : '';
		if (!empty($filter)) {
			if ($type == 'category' || $type == 'sql' || $type == 'function') {
				$show = $this->filter_params->get($name.'_show','');
				if (empty($show)) {
					return "";
				}
			}

			if ($type == 'text') {
				return "";
			}
		}

		$html = '<div class="advancedsearch_div">';
		$html .= '<span class="mijosearch_span_label'.$suffix.'">';
		$html .= self::_renderFieldJText($field, $suffix);
		$html .= '</span>';
		$html .= '<span class="mijosearch_span_field'.$suffix.'">';
        $html .= self::$function($field, $suffix);
		$html .= '</span>';
		$html .= '</div>';

		return $html;
	}
	
	function _renderFieldDivStart($id, $class, $style) {
		return '<div style="'.$style.'" id="'.$id.'" class="'.$class.'" >';
	}
	
	function _renderFieldDivEnd() {
		return '</div>';
	}
	
	function _renderFieldText($field, $suffix, $filter = "") {
		$name = (string)$field->attributes()->name;
		$size = (string)$field->attributes()->size;
		$style = (string)$field->attributes()->style;
		$maxlength = (string)$field->attributes()->maxlength;
		
		if (empty($maxlength)) {
			$maxlength = "50";
		}
        
		$param = !empty($this->filter_params) ? $this->filter_params->get($name) : '';
	
		$read = $value = "";
		if (!empty($param) && $this->site) {
			$read = "readonly";
		}
		elseif (!empty($filter)) {
			$value = implode(',', $filter);
			return '<span style="'.$style.'"><textarea name="'.$name.'" class="mijosearch_textarea'.$suffix.'" >'.$value.'</textarea></span>';
		}
	
		return '<span style="'.$style.'"><input type="text" name="'.$name.'" size="'.$size.'" class="mijosearch_input_small'.$suffix.'" value="'.$value.'" '.$read.' /></span>';
	}

	function _renderFieldJText($field, $suffix) {
		$jtext = (string)$field->attributes()->jtext;
		
		return JText::_($jtext);
	}
	
	function _renderFieldCheckBox($field, $suffix) {
		$name = (string)$field->attributes()->name;
		$title = (string)$field->attributes()->title;
		$value = (string)$field->attributes()->value;
		$style = (string)$field->attributes()->style;
		
		$checked = '';
		if ($value == '1') {
			$checked = 'checked';
		}
		
		return '<span style="'.$style.'"><input type="checkbox" name="'.$name.'" class="mijosearch_checkbox'.$suffix.'" '.$this->onchange.' value="1" '.$checked.' /></span>';
	}
	
	function _renderFieldSelectBox($field, $suffix, $filter = '', $custom_style = '') {
		$name = (string)$field->attributes()->name;
		$title = (string)$field->attributes()->title;
		$value = (string)$field->attributes()->value;
		$style = (string)$field->attributes()->style;
		$all = (string)$field->attributes()->all;
		
		$ttls = explode(',', $title);
		$opts = explode(',', $value);
	
		$n = count($opts);
		
		$options = array();
		
		if ($all == '1' || $n > 0) {
			$options[] = JHTML::_('select.option', '', JText::_('COM_MIJOSEARCH_ALL'));
		}		
		
		if (!empty($opts) && !empty($ttls)) {
			for ($i = 0; $i < $n; $i++){ 
				$options[] = JHTML::_('select.option', $opts[$i], JText::_($ttls[$i]));
			}
		}
		
		if (!empty($filter)) {			
			return '<span style="'.$style.'">'.JHTML::_('select.genericlist', $options, $name.'[]', 'style="float:left; padding-left:5px; width:170px;" multiple="multiple" size="10" '.$this->onchange, 'value', 'text', $filter).'</span>';
		}
		else {
			return '<span style="'.$style.'">'.JHTML::_('select.genericlist', $options, $name, 'class="mijosearch_selectbox'.$suffix.'" '.$custom_style.' size="1" '.$this->onchange , 'value', 'text', null).'</span>';
		}
	}
	
	function _renderFieldRadio($field, $suffix) {
		$name = (string)$field->attributes()->name;
		$title = (string)$field->attributes()->title;
		$value = (string)$field->attributes()->value;
		$style = (string)$field->attributes()->style;
		$default = (string)$field->attributes()->default;
		
		$options = array();
		$ttls = explode(',', $title);
		$opts = explode(',', $value);
		
		$n = count($opts);
		for ($i = 0; $i < $n; $i++){
			$options[] = JHTML::_('select.option', $opts[$i], JText::_($ttls[$i]));
		}
		
		return '<span style="'.$style.'">'.JHTML::_('select.radiolist', $options, $name, '', 'value', 'text', $default).'</span>';
	}
	
	function _renderFieldCalendar($field, $suffix) {
		$name = (string)$field->attributes()->name;
		$style = (string)$field->attributes()->style;
		
		JHTML::_('behavior.calendar');

		$format	= ((string)$field->attributes()->format ? (string)$field->attributes()->format : '%Y-%m-%d');
		$class	= (string)$field->attributes()->class ? (string)$field->attributes()->class : 'mijosearch_input_small';

		return '<span style="'.$style.'">'.JHTML::_('calendar', date('Y-m-d'), $name, $name, $format, array('class' => $class)).'</span>';
	}
	
	function _renderFieldSQL($field, $suffix, $filter = "") {
		$name = (string)$field->attributes()->name;
		
		$style = (string)$field->attributes()->style;
		$query = (string)$field->attributes()->db_query;
		$all = (string)$field->attributes()->all;
		
		$key = ((string)$field->attributes()->db_id ? (string)$field->attributes()->db_id : 'id');
		$val = ((string)$field->attributes()->db_name ? (string)$field->attributes()->db_name : 'name');
		
		$where = "";

		if (empty($filter)) {
			$where = self::_getFilterParam($key, $name);
		}

		$req_filter = JRequest::getInt('filter');
		if (!empty($req_filter)) {
			$where = self::_getFilterParam($key, $name);
		}		
		
		$db	= JFactory::getDBO();
		$db->setQuery($query.$where);		
		
		$options = $db->loadObjectList();
		
		$options = self::_getSelectOptions($options, $val, $all);

		if (!empty($filter)) {
			return JHTML::_('select.genericlist', $options, $name.'[]', 'style="float:left;padding-left:5px; width:150px;" multiple=multiple size="10" '.$this->onchange, 'value', 'text', $filter);
		}	
		else {
			return '<span style="'.$style.'">'.JHTML::_('select.genericlist', $options, $name, 'class="mijosearch_selectbox'.$suffix.'" size ="1" '.$this->onchange, 'value', 'text', null).'</span>';
		}	
	}
		
	function _renderFieldCategory($field, $suffix, $filter = "") {
		$style = (string)$field->attributes()->style;
		
		$mijosearch_ext = MijoSearch::getExtension($this->option);
		
		$rows = $mijosearch_ext->getCategoryList();
		
		$categories = self::_getSelectOptions($rows);
		
		if (!empty($filter)) {
			return JHTML::_('select.genericlist', $categories, 'category[]', 'style="float:left;padding-left:5px;width:180px;" multiple="multiple" size ="10" '.$this->onchange, 'value', 'text', $filter);
		}
		else {
			return '<span style="'.$style.'">'.JHTML::_('select.genericlist', $categories, 'category', 'class="mijosearch_selectbox'.$suffix.'" '.$this->onchange, 'value', 'text', JRequest::getInt('category')).'</span>';
		}
	}
	
	function _getSelectOptions($rows, $name = 'name', $all = '1') {
		$items = array();
		
		if ($all == '1') {
			$items[] = JHTML::_('select.option', '', JText::_('COM_MIJOSEARCH_ALL'));
		}
		
		if (!empty($rows)) {
			// Collect childrens
			$children = array();
			foreach ($rows as $row) {
				// Not subcategories
				if (empty($row->parent)) {
					$row->parent = 0;
				}
				
				$pt = $row->parent;
				$list = @$children[$pt] ? $children[$pt] : array();
				array_push($list, $row);
				$children[$pt] = $list;
			}
			
			// Not subcategories
			if (empty($rows[0]->parent)) {
				$rows[0]->parent = 0;
			}
			
			// Build Tree
			$tree = self::_buildTree(intval($rows[0]->parent), '', array(), $children, $name);
			
			foreach ($tree as $item){
				$items[] = array('value' => $item->id, 'text' => $item->$name);
			}
		}
		
		return $items;
	}
	
	function _buildTree($id, $indent, $list, &$children, $name) {
		if (@$children[$id]) {
			foreach ($children[$id] as $ch) {
				$id = $ch->id;

				$pre 	= '|_&nbsp;';
				$spacer = '.&nbsp;&nbsp;&nbsp;';

				if ($ch->parent == 0) {
					$txt = $ch->$name;
				} else {
					$txt = $pre . $ch->$name;
				}
				
				$list[$id] = $ch;
				$list[$id]->$name = "$indent$txt";
				$list[$id]->children = count(@$children[$id]);
				$list = self::_buildTree($id, $indent . $spacer, $list, $children, $name);
			}
		}
		
		return $list;
	}

	static function _renderFieldOrder($field = '', $css = 'class="mijosearch_selectbox"', $js = '') {
        $options = array();
        $options[] = JHTML::_('select.option', 'relevance', JText::_('COM_MIJOSEARCH_FIELDS_ORDER_RELEVANCE'));
        $options[] = JHTML::_('select.option', 'date', JText::_('COM_MIJOSEARCH_FIELDS_DATE'));
        $options[] = JHTML::_('select.option', 'hits', JText::_('COM_MIJOSEARCH_FIELDS_HITS'));

        $order = JHTML::_('select.genericlist', $options, 'order', ''.$css.$js.' size ="1" ', 'value', 'text', JRequest::getWord('order', 'relevance'));

        return $order;
    }

	static function _renderFieldOrderDir($field = '', $css = 'class="mijosearch_selectbox"', $js = '') {
        $options = array();
        $options[] = JHTML::_('select.option', 'desc', JText::_('COM_MIJOSEARCH_FIELDS_ORDER_DESC'));
        $options[] = JHTML::_('select.option', 'asc', JText::_('COM_MIJOSEARCH_FIELDS_ORDER_ASC'));

        $orderdir = JHTML::_('select.genericlist', $options, 'orderdir', ''.$css.$js.' size="1" ', 'value', 'text', JRequest::getWord('orderdir', 'desc'));

        return $orderdir;
    }
	
	function _renderFieldDays($field, $suffix) {
		$lists = array();
		
		$lists['any'] = JHTML::_('select.option', -1, JText::_('COM_MIJOSEARCH_FIELDS_DAYS_ANY_TIME'));
		$lists['yesterday'] = JHTML::_('select.option', 1, JText::_('COM_MIJOSEARCH_FIELDS_DAYS_YESTERDAY'));
		$lists['three'] = JHTML::_('select.option', 3, JText::_('COM_MIJOSEARCH_FIELDS_DAYS_THREE'));
		$lists['six'] = JHTML::_('select.option', 6, JText::_('COM_MIJOSEARCH_FIELDS_DAYS_SIX'));
		$lists['year'] = JHTML::_('select.option', 12, JText::_('COM_MIJOSEARCH_FIELDS_DAYS_YEAR'));
		
		return JHTML::_('select.genericlist', $lists, 'days', 'class="mijosearch_selectbox'.$suffix.'" size="1" '.$this->onchange, 'value','text', '-1');
	}
	
	function _renderFieldDateRange($field, $suffix) {
		$style = (string)$field->attributes()->style;
		
		$lists = self::_getDateLists($suffix);
		
		$html = '<span style="'.$style.'">'.JText::_('From ').$lists['fromyear']. ' ' . $lists['frommonth'] . ' ' . $lists['fromday'] .'</span>'.
		'<div class="mijosearch_clear"></div><span style="'.$style.'">&nbsp;&nbsp;'.JText::_('To ').'&nbsp;&nbsp;&nbsp;'. $lists['toyear'] . ' ' . $lists['tomonth'] . ' ' . $lists['today'].'</span>';
	
		return $html;
	}
	
	function _getDateLists($suffix) {
		$years = $months =$tomonths= array();
		$smonth = 1;
		$emonth = 12;
		$syear = 2000;
		$eyear = date('Y');
		
		$smnth = $emnth = '';
		
		$start_date = !empty($this->filter_params) ? $this->filter_params->get('start_date') : '';
		$end_date   = !empty($this->filter_params) ? $this->filter_params->get('end_date')   : '';
				
		if(!empty($start_date)) {
			list($syr,$smnth,$sdy) = explode('-',$start_date);				
			if(!empty($syr)) {
				$syear = (int)$syr;		
			}			
		}
		if(!empty($end_date)) {
			list($eyr,$emnth,$edy) = explode('-',$end_date);
			if(!empty($eyr)) {
				$eyear = (int)$eyr;		
			}
		}
			
		for ($i = $syear; $i <= $eyear; $i++) {
			$years[] = JHTML::_('select.option', $i, $i);
		}
		
		for ($i = 1; $i <= 12 ; $i++) {
			if ($i < 10) {
				$i = ('0'.$i);
			}
			$months[] = JHTML::_('select.option', (int)$i, $i);
		}
		
		$lists['fromyear'] = JHTML::_('select.genericlist', $years, 'fromyear', 'class="mijosearch_selectbox'.$suffix.'"  style="width:70px; margin-right:4px;"size="1" '.$this->onchange, 'value', 'text', '2000');
		$lists['toyear'] = JHTML::_('select.genericlist', $years, 'toyear', 'class="mijosearch_selectbox'.$suffix.'"style="width:70px; margin-right:4px;" size="1" '.$this->onchange, 'value', 'text', date('Y'));
		$lists['frommonth'] = JHTML::_('select.genericlist', $months, 'frommonth', 'class="mijosearch_selectbox'.$suffix.'" style="width:50px; margin-right:4px;" size="1" '.$this->onchange, 'value', 'text', '01');
		$lists['tomonth'] = JHTML::_('select.genericlist', $months, 'tomonth', 'class="mijosearch_selectbox'.$suffix.'" style="width:50px; margin-right:4px;" size="1" '.$this->onchange, 'value', 'text', date('m'));
		$lists['fromday'] = '<input class="mijosearch_input_tiny" type="text" name="fromday" '.$this->onchange.'value="01" maxlength="2" />';
		$lists['today'] = '<input class="mijosearch_input_tiny" type="text" name="today" '.$this->onchange.' value="'.date("d").'" maxlength="2" />';
		
		return $lists;
	}
		
	function _renderFieldFunction($field, $suffix, $filter="") {
		$function = (string)$field->attributes()->function;

		$mijosearch_ext = MijoSearch::getExtension($this->option, $this->filter_params);
		
		return $mijosearch_ext->$function($field, $suffix,$filter);
	}
	
	function _getFilterParam($db_field, $name) {
		$param = !empty($this->filter_params) ? $this->filter_params->get($name) : '';
	
		if (empty($param)) {
			return ' ';
		}
		
		$where = array();

		$ext_params = explode(',', $param);

		foreach ($ext_params AS $prm) {
			$where[] = $db_field.'='.$prm;
		}

		if (!empty($where)) {
			$where = ' WHERE ('.implode(' OR ',$where).')';

			return $where;
		}

		return ' ';
	}
}