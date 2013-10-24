<?php
/**
* @version		1.5.0
* @package		MijoSearch
* @subpackage	MijoSearch
* @copyright	2009-2011 Mijosoft LLC, www.mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceSearch www.joomace.net
*/

//No Permision
defined('_JEXEC') or die('Restricted access');

class MijosearchModelFilters extends MijosearchModel {
	
	// Main constructer
	function __construct() {
		parent::__construct('filters');
		
		$this->_getUserStates();
		$this->_buildViewQuery();
	}

	function deleteGroup() {
		$id = JRequest::getInt('id');

		$g_where = " WHERE id IN (".$id.")";
		$f_where = " WHERE group_id IN (".$id.")";

		if (!MijoDatabase::query("DELETE FROM #__mijosearch_filters_groups {$g_where}")) {
			return false;
		}

		if (!MijoDatabase::query("DELETE FROM #__mijosearch_filters {$f_where}")) {
			return false;
		}

        return true;
	}
	
	function _getUserStates(){
		$this->filter_order		= parent::_getSecureUserState($this->_option . '.' . $this->_context . '.filter_order',		'filter_order',		'title');
		$this->filter_order_Dir	= parent::_getSecureUserState($this->_option . '.' . $this->_context . '.filter_order_Dir',	'filter_order_Dir',	'ASC');
		$this->search_name		= parent::_getSecureUserState($this->_option . '.' . $this->_context . '.search_name', 		'search_name', 		'');
		$this->search_com		= parent::_getSecureUserState($this->_option . '.' . $this->_context . '.search_com', 		'search_com', 		'');
		$this->search_name 	 	= JString::strtolower($this->search_name);
		$this->search_com 	 	= JString::strtolower($this->search_com);
	}
	
	function getLists() {
		$lists = array();

		// Table ordering
		$lists['order_dir'] = $this->filter_order_Dir;
		$lists['order'] 	= $this->filter_order;
		
		// Reset filters
		$lists['reset_filters'] = '<input class="btn btn-primary" onclick="resetFilters();" value="'. JText::_('Reset') .'" style="margin-bottom: 10px !important; width: 35px;"  />';
	
		// Search name
        $lists['search_name'] = "<input type=\"text\" name=\"search_name\" value=\"{$this->search_name}\" size=\"50\" maxlength=\"255\" onchange=\"document.adminForm.submit();\" />";
		
		// Search component
        $lists['search_com'] = "<input type=\"text\" name=\"search_com\" value=\"{$this->search_com}\" size=\"20\" maxlength=\"255\" onchange=\"document.adminForm.submit();\" />";

		return $lists;
	}

    function getExtensionList($filt_ext = -1){
        $items = MijoSearch::getCache()->getExtensions();

		$extensions = array();
		$text = "COM_MIJOSEARCH_SEARCH_SECTIONS";
		$javascript= ' onchange="changeExtension(this.value)"';

        $extensions[] = JHTML::_('select.option', '', JText::_($text));

		if (!empty($items)) {
			foreach($items as $item) {
				$params = new JRegistry($item->params);
				
				$handler = $params->get('handler');

				if ($handler == '2') {
					continue;
				}

				$custom_name = $params->get('custom_name');

				if (!empty($custom_name)) {
					$name = $custom_name;
				}
				elseif (!empty($item->name)) {
					$name = $item->name;
				}
				else {
					$name = $item->extension;
				}

				$extensions[$item->extension] = JHTML::_('select.option', $item->extension, $name);
			}
		}

		$lists['extension'] = JHTML::_('select.genericlist', $extensions, 'extension', 'class="inputbox" size="10" style="width:120px;"'.$javascript, 'value' ,'text', $filt_ext);

		return $lists;
    }
	
	// Query filters
	function _buildViewWhere() {
		$where = array();
		
		// Search name
		if (!empty($this->search_name)) {
			$src = parent::secureQuery($this->search_name, true);
			$where[] = "LOWER(title) LIKE {$src}";
		}
		
		// Search component
		if (!empty($this->search_com)) {
			$src = parent::secureQuery($this->search_com, true);
			$where[] = "LOWER(extension) LIKE {$src}";
		}
	
		// Execute
		$where = (count($where) ? ' WHERE '. implode(' AND ', $where) : '');
	
		return $where;
	}
	
	function getGroupList($value) { 		
		$items = self::getGroups();

		$groups = array();	
		$groups[] = JHTML::_('select.option', '', 'Create new Group');

		foreach($items AS $item) {
			$groups[] = JHTML::_('select.option', $item->id, $item->title);
		}
		
		return JHTML::_('select.genericlist', $groups, 'groups', 'class="inputbox"', 'value', 'text', $value);
	}
	
	function getGroups() {
		return MijoDatabase::loadObjectList("SELECT id, title FROM #__mijosearch_filters_groups");
	}

	function getFilterParams(&$post) {
		$params = array();

		$fields = MijoSearch::get('utility')->getExtensionFieldsFromXml($post['extension']);

        if (empty($fields)) {
            return;
        }

		foreach ($fields AS $field) {
			$field_type = (string)$field->attributes()->type;

			if (($field_type == 'category') or ($field_type  == 'sql') or ($field_type == 'function') or ($field_type == 'text')) {
				$field_name = (string)$field->attributes()->name;

				$param = JRequest::getVar($field_name, array(), 'post', 'array');

				$params[$field_name]= (!empty($param) ? implode(',', $param) : '');
				$params[$field_name.'_show'] = JRequest::getCmd($field_name.'_show', '0');
			}
		}

		$params['start_date'] = $post['start_date'];
		$params['end_date'] = $post['end_date'];
		$params['access'] = empty($post['access']) ? '1' : $post['access'];
		
		$reg = new JRegistry($params);
		$post['params'] = $reg->toString();

		$group_id = JRequest::getInt('groups');
		if (!empty($group_id)) {
			$post['group_id'] = $group_id;
		}
		else {
			$post['group_id'] = self::_saveNewGroup();
		}
	}

	function _saveNewGroup() {
        $post = array();
        
		$post['title'] = JRequest::getString('new_group');
        
		$row = MijoSearch::getTable('MijosearchGroups');

		// Bind the form fields to the table
		if (!$row->bind($post)) {
			return JError::raiseWarning(500, $row->getError());
		}

		// Make sure the record is valid
		if (!$row->check()) {
			return JError::raiseWarning(500, $row->getError());
		}

		// Save record
		if (!$row->store()) {
			return JError::raiseWarning(500, $row->getError());
		}

		return $row->id;
	}

	function getExtensionFields($option) {
        $html = '';

        $extensions = MijoSearch::getCache()->getExtensions();
		$ext_params = new JRegistry($extensions[$option]->params);

        $html_class = new MijosearchHTML($option, $ext_params, null, false);

		$id = JRequest::getCmd('id');
		$fields = MijoSearch::get('utility')->getExtensionFieldsFromXml($option);

        if (empty($fields)) {
            return $html;
        }

		foreach ($fields as $field) {
			$name = (string)$field->attributes()->name;
			$type = (string)$field->attributes()->type;
			$client = (string)$field->attributes()->client;

			if ($client == '1') {
				continue;
			}

			if ($type == 'category' or $type  == 'sql' or $type == 'function' or $type == 'text') {
				$custom_style = "";
				
				if ($type == 'category') {
					$custom_style = 'margin-top:5px; width:180px;';
				}

				if ($type == 'text') {
					$custom_style = 'margin-top:5px;';
				}

				$function = '_renderField'.ucfirst($type);

				$html .= '<div style="float:left; margin-left:10px;'.$custom_style.'"><strong>'.MijosearchHTML::_renderFieldJText($field,'').'(s)';

                if ($type != 'text' and $type != 'sql') {
					$checked = "";
					$ids = self::_getExtensionFieldsParam($id, $name.'_show');
					if ($ids[0] == '1' ) {
						$checked = "checked";
					}

					$html .= '<span style="padding-left:5px;">  '.JText::_('Show').'<input type="checkbox" name="'.$name.'_show'.'" value="1" '.$checked.' style="float:right; margin: 2px 45px 0px 0;" /></span>';
				}

				$html .= '</strong><br/>';
				$html .= $html_class->$function($field, '', self::_getExtensionFieldsParam($id, $name));
				$html .= '</div>';
			}
		}

		$html .= '<div style="float:left;margin-left:10px;margin-top:5px;">';
		$html .= '<strong>'.JText::_('COM_MIJOSEARCH_EXTENSIONS_VIEW_ACCESS').'</strong><br/>';

		$access_levels = MijoSearch::get('utility')->getAccessLevels();
		foreach($access_levels as $access_level) {
			$access_levels_list[] = JHTML::_('select.option', $access_level->id, $access_level->title);
		}

		$html .= JHTML::_('select.genericlist', $access_levels_list, 'access', 'size="10" style="width:120px;"', 'value', 'text', self::_getExtensionFieldsParam($id, 'access'));

		$html .= '</div>';

        return $html;
	}

	function _getExtensionFieldsParam($id, $prm_name) {
        static $params = array();

        if (!isset($params[$id])) {
            $prms = MijoDatabase::loadResult("SELECT params FROM #__mijosearch_filters WHERE id = {$id}");
			
            $params[$id] = new JRegistry($prms);
        }

		$ids = explode(',', $params[$id]->get($prm_name));

		return $ids;
	}
}