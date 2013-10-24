<?php
/**
 * @package		MijoSearch
 * @copyright	2009-2013 Mijosoft LLC, www.mijosoft.com
 * @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
 * @license		2009-2012 GNU/GPL based on AceSearch www.joomace.net
 */

// No Permission
defined('_JEXEC') or die('Restricted Access');

// Extension class
class MijosearchExtension {
	
	protected $extension = null;
	protected $params = null;
	protected $filter_params = null;
	protected $aid = null;
	protected $db = null;
	protected $is_advanced_search = false;
	
	protected $admin = true;
	protected $site = false;

    public function __construct($extension, $ext_params, $filter_params = null) {
		// Set variables
		$this->MijosearchConfig = MijoSearch::getConfig();
		$this->extension = $extension;
		$this->fields = self::getFields($extension->extension);
		$this->params = $ext_params;
		$this->filter_params = $filter_params;
		$this->aid = JFactory::getUser()->get('aid');
		$this->db = JFactory::getDBO();
		$this->admin = JFactory::getApplication()->isAdmin();
		$this->site = JFactory::getApplication()->isSite();		
	}

    public static function is16() {
		return MijoSearch::get('utility')->is16();
	}

    public static function is30() {
		return MijoSearch::get('utility')->is30();
	}
	
	public function getExtraFields($params, &$fields) {
	}

	public function getCategoryList() {
		return array();
	}
	
	public function getMenuParams($id) {
		static $params = array();
		
		if (!isset($params[$id])) {
			$params[$id] = MijoSearch::get('utility')->getMenu()->getParams($id);
		}
		
		return $params[$id];
	}
	
	public static function getInt($name, $default = 0) {
		$var = JRequest::getVar($name, $default, 'post', 'int');
		
		return $var;
	}
	
	public static function getWord($name, $default = '') {
		$var = JRequest::getVar($name, $default, 'post', 'word');
		
		return $var;
	}
	
	public static function getCmd($name, $default = '') {
		$var = JRequest::getVar($name, $default, 'post', 'cmd');
		
		return $var;
	}
	
	public static function getString($name, $default = '') {
		$var = (string) JRequest::getVar($name, $default, 'post', 'string', 0);
		
		return $var;
	}
	
	public static function getSecureString($name, $default = '') {
		$var = (string) JRequest::getVar($name, $default, 'post', 'string', 0);
		
		$var = self::getSecureText($var);
		
		return $var;
	}
	
	protected function getFields($component) {
		$fields = new stdClass();

		$childrens = MijoSearch::get('utility')->getExtensionFieldsFromXml($component);

        if (empty($childrens)) {
            return;
        }

		foreach ($childrens as $children) {
			$name = $children->attributes()->name;
			
			$fields->$name = new stdClass();
			$fields->$name->client = $children->attributes()->client;
			$fields->$name->type = $children->attributes()->type;
		}
		
		return $fields;
	}

	protected function getExtraFieldsWhere($sql, $secure = true) {
        return self::getCckFieldsWhere($sql, $secure);
    }

	protected function getCckFieldsWhere($sql, $prefix = '', $secure = true) {
		$ret = array();

        $fields = $this->params->get('extrafields', '');

		if (empty($fields)) {
			return $ret;
		}

		if (!is_array($fields)) {
            $fields = array($fields);
		}
		
        foreach ($fields as $field) {
            self::_getCckFieldsWhereQuery($field, $custom_fields, $sql, $prefix, $secure);
        }

		if (empty($custom_fields)) {
			return $ret;
		}

		return $custom_fields;
	}

	protected function _getCckFieldsWhereQuery($field, &$custom_fields, $sql, $prefix, $secure) {
		$qu = JRequest::getString('query', '');
		$all = JRequest::getString('all', '');
		$no = JRequest::getString('none', '');
        $query = JString::strtolower(MijoSearchSearch::getQuery('post'));

        if (empty($query)) {
            return;
        }

		list($field_id, $field_name) = explode('_', $field);

		$f = '1';
		if (empty($qu)) {
			$f = JRequest::getInt('ja_'.$field_id);
		}

		if ($f == '1') {
			if (empty($field_id)) {
				return;
			}

            $words = explode(' ', $query);

            $words_count = count($words);
            $prfx_sffx = 0;

            foreach($words as $word) {
                $word = JString::trim($word);

                if (empty($word)) {
                    continue;
                }

                $word = self::getSecureText($word);

                if (!isset($custom_fields[$word])) {
                    $custom_fields[$word] = array();
                }

                if ($words_count == 1 || empty($all)) {
                    $prfx_sffx = '';
                }
                else {
                    $prfx_sffx++;
                }

                $search = array('{prefix}', '{field_name}', '{field_id}', '{query}');
                $replace = array($prefix.$prfx_sffx, $field_name, $field_id, $word);

                $custom_fields[$word][] = str_replace($search, $replace, $sql);
            }

            /*if (!empty($no)) {
                $words = explode(' ', $no);

                foreach($words as $word) {
                    $word = JString::trim($word);

                    if (empty($word)) {
                        continue;
                    }

                    $word = self::getSecureText($word);

                    if (!isset($custom_fields[$word])) {
                        $custom_fields[$word] = array();
                    }

                    $search = array('{field_name}', '{field_id}', '{query}');
                    $replace = array($field_name, $field_id, $word);

                    $sql = str_replace(' LIKE ', ' NOT LIKE ', $sql);

                    $custom_fields[$word][] = str_replace($search, $replace, $sql);
                }
            }*/
		}
	}
	
	protected function getSearchFieldsWhere($src_fields, $cck_fields = null) {
		$where = $wh = array();
		
		if (empty($src_fields)) {
			return $where;
		}
		
		$query 		= self::getSearchQuery('query');   
		$exact 		= self::getSearchQuery('exact');
		$all 		= self::getSearchQuery('all');
		$any 		= self::getSearchQuery('any');
		$none 		= self::getSearchQuery('none');
		
		$ext        = "exact";
		
		if (!empty($query) && trim($query, '"') != $query) {
			$exact = JString::trim($query, '"');
			$query = "";
			$ext   = "query";
		}
		
		$fields = explode(', ', $src_fields);

		if (!empty($all)) {
			$sub_where = array();
			$this->is_advanced_search = true;

            $words = explode(' ', $all);

            foreach ($words as $word) {
                $word = JString::trim($word);

                if (empty($word)) {
                    continue;
                }

                $sub_wh = array();

                $word = self::getSecureText($word);

                self::_getSearchFieldsWhereQuery($sub_wh, $word, $fields, 'all');

                self::_getSearchFieldsWhereQueryCck($sub_wh, $word, $cck_fields);

                if (empty($sub_wh)) {
                    continue;
                }

                $sub_where[] = implode(' OR ', $sub_wh);
            }

			if (!empty($sub_where)) {
				$where[] = '(' . implode(') AND (', $sub_where) . ')';
			}
		}
	    elseif (!empty($exact)) {
			$sub_where = array();
			$this->is_advanced_search = true;

			$exact = self::getSecureText($exact);

			self::_getSearchFieldsWhereQuery($sub_where, $exact, $fields, $ext);

            self::_getSearchFieldsWhereQueryCck($sub_where, $exact, $cck_fields);

			if (!empty($sub_where)) {
				$where[] = '(' . implode(' OR ', $sub_where) . ')';
			}
		}
	    elseif (!empty($query) || !empty($any)) {
			$sub_where = array();
			if (!empty($any)) {
			    $this->is_advanced_search = true;
			}
			
			$x = 'query';
			
			if (empty($query)) {
				$query = $any;
				$x = 'any';
			}

            $words = explode(' ', $query);

            foreach($words as $word) {
                $word = JString::trim($word);

                if (empty($word)) {
                    continue;
                }

                $word = self::getSecureText($word);

                self::_getSearchFieldsWhereQuery($sub_where, $word, $fields, $x);

                self::_getSearchFieldsWhereQueryCck($sub_where, $word, $cck_fields);
            }
			
			if (!empty($sub_where)) {
				$where[] = '(' . implode(' OR ', $sub_where) . ')';
			}
		}
		
		if (!empty($none)) {
			$sub_where = array();
			$this->is_advanced_search = true;
			
			$none = self::getSecureText($none);
			
			self::_getSearchFieldsWhereQuery($sub_where, $none, $fields, 'none', ' NOT ');

            self::_getSearchFieldsWhereQueryCck($sub_where, $none, $cck_fields);
		
			if (!empty($sub_where)) {
				$where[] = '(' . implode(' AND ', $sub_where) . ')';
			}
		}
		
		if (!empty($this->MijosearchConfig->blacklist)) {
			$sub_where = array();
			$keywords = explode(',', $this->MijosearchConfig->blacklist);
			
			foreach($keywords as $keyword) {
				$keyword = trim($keyword);
				
				$key = self::getSecureText($keyword);
				
				self::_getSearchFieldsWhereQuery($sub_where, $key, $fields, 'blacklist', ' NOT ');
			}
		
			if (!empty($sub_where)) {
				$where[] = '(' . implode(' OR ', $sub_where) . ')';
			}
		}
		
		if (!empty($where)) {
            $wh[] = '('.implode(' AND ', $where) . ')';
		}
		
		return $wh;
	}

	protected function _getSearchFieldsWhereQuery(&$where, $query, $fields, $x, $not = '') {
		foreach ($fields as $field) {
			$field = trim($field);
			
			$pos = strpos($field, ':');
            if ($pos !== false) {
                list($field_db, $field_req) = explode(':', $field);
				
				if (empty($field_db) || empty($field_req)) {
					continue;
				}
			}
			else {
				$field_db = $field_req = $field;
			}
			
			if ($this->site && $this->fields->$field_req->client == '1') {
				continue;
			}
			
			if ($this->admin && $this->fields->$field_req->client == '0') {
				continue;
			}
			
			if ($this->params->get($field_req, '1') == '0') {
				continue;
			}
			
			if ($this->fields->$field_req->type == 'checkbox') {
				$ext = self::getCmd('ext');
				$limitstart = self::getCmd('limitstart');
				
				if ($x != 'query' && $x != 'blacklist' && !empty($ext) && empty($limitstart)) {
					$req = self::getInt($field_req);
					
					if (empty($req) && $this->params->get($field_req, '1') != '2') {
						continue;
					}
				}
			}
			else {
				$req = self::getCmd($field_req, '1');
				if (empty($req)) {
					continue;
				}
			}
			
			$where[] = "(LOWER({$field_db}) {$not}LIKE {$query})";
		}
	}

	protected function _getSearchFieldsWhereQueryCck(&$sub_wh, $word, $cck_fields) {
        if (empty($cck_fields) || !is_array($cck_fields) || !isset($cck_fields[$word])) {
            return;
        }

        $queries = $cck_fields[$word];

        foreach ($queries as $query) {
            $sub_wh[] = $query;
        }
    }
	
	public function getFilterWhere(&$where, $fields, $statuss = false, $cat_table = 'categories', $cat_id = 'id', $cat_parent = 'parent_id') {
		foreach ($fields as $key => $values) {
			$sub_where = array();
			$is_text = $is_secure = false;
			
			$db_fields = explode(',', $values);
			
			$types = explode(':', $key);			
			$req_field = $types[0];
			if (!empty($types[1])) {
				if ($types[1] == 'text') {
					$is_text = true;
				}
				else {
					$is_secure = true;
				}
			}
			
			if ($is_text) {
				$request = self::getString($req_field);
			}
			elseif ($is_secure) {
				$request = self::getSecureText(self::getString($req_field));
			}
			else {
				$request = self::getInt($req_field);
			}
			
			if (!empty($request)) {
				foreach ($db_fields as $db_field) {
					$db_field = trim($db_field);
					
					if ($is_secure) {
						$sub_where[] = "{$db_field} LIKE {$request}";
					}
					else {
						$sub_where[] = "{$db_field} = '{$request}'";
					}
				}

                if ($key == 'category' && $statuss == true) {
                    $sub_cat_ids = $this->_getSubCatIds($request, $cat_table, $cat_id, $cat_parent);

                    if (!empty($sub_cat_ids)) {
                        foreach ($sub_cat_ids as $sub_cat_id) {
                            if ($is_secure) {
                                $sub_where[] = "{$db_field} LIKE {$sub_cat_id}";
                            }
                            else {
                                $sub_where[] = "{$db_field} = '{$sub_cat_id}'";
                            }
                        }
                    }
                }
			}
			elseif ($this->site) { 
				if (empty($this->filter_params)) {
					return;
				} 
				
				$value = $this->filter_params->get($req_field);
				
				if (empty($value)) {
					continue;
				}
				
				foreach ($db_fields as $db_field) {
					$db_field = trim($db_field);
					
					if ($is_text || $is_secure) {
						$sub_where[] = "{$db_field} IN ('{$value}')";
					}
					else {
						$sub_where[] = "{$db_field} IN ({$value})";
					}
				}

                if ($key == 'category' && $statuss == true) {
                    $sub_cat_ids = $this->_getSubCatIds($request, $cat_table, $cat_id, $cat_parent);

                    if (!empty($sub_cat_ids)) {
                        foreach ($sub_cat_ids as $sub_cat_id) {
                            if ($is_secure) {
                                $sub_where[] = "{$db_field} LIKE {$sub_cat_id}";
                            }
                            else {
                                $sub_where[] = "{$db_field} = '{$sub_cat_id}'";
                            }
                        }
                    }
                }
			}
			
			$sub_where = (count($sub_where) ? implode(' OR ', $sub_where): '');
			if (!empty($sub_where)) {
				$where[] = '('.$sub_where.')';
			}
		}
	}

    public function _getSubCatIds($id, $table, $field_id, $field_parent) {
        static $cat_ids = array();

        $cat_id = $id;

        while ($cat_id != 0) {
            if (is_array($cat_id)) {
                $cat_id = $cat_id[0];
            }

            $cat_id = MijoDatabase::loadResultArray("SELECT {$field_id} FROM #__{$table} WHERE {$field_parent} = {$cat_id}");

            if (empty($cat_id)) {
                $cat_ids[] = $id;
                break;
            }

            if (count($cat_id) > 1) {
                foreach ($cat_id as $c_id) {
                    $this->_getSubCatIds($c_id, $table, $field_id, $field_parent);
                }
            }
            else {
                $cat_ids[] = $cat_id[0];
            }
        }

        return $cat_ids;
    }
	
	protected function getUserWhere(&$where, $field_1, $field_2 = null) {
		$sub_where = array();
		
		$request = self::getSecureText(self::getString('user', null));
		
		if (!empty($request)) {
			$id = MijoDatabase::loadResult("SELECT id FROM #__users WHERE LOWER(name) LIKE {$request}");  
			if (empty($id)) {
				return "";
			}
			
			if (!empty($field_1)) {
				$sub_where[] = "{$field_1} = {$id}"; 
			}
			
			if (!empty($field_2)) {
				$sub_where[] = "LOWER({$field_2}) LIKE {$request}";
			}
			
			$sub_where = (!empty($sub_where) ? implode(' OR ', $sub_where) : '');
			if (!empty($sub_where)) {				
				$where[] = '('.$sub_where.')';
			}			 
		}	
		elseif (!empty($this->filter_params)) {
			$user_filter = $this->filter_params->get('user');
			if (empty($user_filter)) {
				return;
			}
			
			$users = explode(',', $user_filter);
			
			if (!empty($field_1)) {
				$sub_where_1 = array();
				
				foreach ($users AS $user) {
					if (empty($user)) {
						continue;
					}
					
					$sub_where_1[] = "LOWER(name) LIKE '{$user}'";
				}
			
				$sub_where_1 = (!empty($sub_where_1) ? ' WHERE ' . implode(' OR ', $sub_where_1): '');
				if (empty($sub_where_1)) {
					return "";
				}
				
				$user_ids = MijoDatabase::loadResultArray("SELECT id FROM #__users {$sub_where_1}");
				$ids = implode(',', $user_ids);
				
				if (empty($ids)) {
					return "";
				}
				
				$sub_where[] = "({$field_1} IN ({$ids}))"; 
			}
			
			if (!empty($field_2)) {
				$sub_where_2 = array();
			
				foreach ($users AS $user) {
					if (empty($user)) {
						continue;
					}
					
					$sub_where_2[] = "LOWER({$field_2}) LIKE '{$user}'";
				}
				
				$sub_where_2 = (!empty($sub_where_2) ? implode(' OR ', $sub_where_2): '');
				
				if (!empty($sub_where_2)) {
					$sub_where[] = $sub_where_2;
				}
			}
			
			$sub_where = (!empty($sub_where) ? implode(' OR ', $sub_where): '');
			if (!empty($sub_where)) {
				$where[] = $sub_where;
			}
		}
	}
	
	protected function getDateWhere(&$where, $db_field, $db_field2 = '0', $linux = 0) {
		$sub_where = "";
        $filter = JRequest::getInt('filter');

		if ($this->is_advanced_search == false && !empty($filter)) {
            $sub_where = array();

			if ($this->filter_params->get('start_date','') != ''){
				$sub_where[] = $db_field." >= '".$this->filter_params->get('start_date')."'";
			}
			
			if ($this->filter_params->get('end_date','')!= ''){
				$sub_where[] = $db_field." <= '".$this->filter_params->get('end_date')."'";
			}
			
			if (!empty($sub_where)) {
				$sub_where = '('.(count($sub_where) ? '' . implode(' AND ', $sub_where): '').')'; 
			}
		}
		elseif ($this->is_advanced_search == true && ($this->params->get('days', '1') == '1' || $this->params->get('daterange', '1') == '1' || !empty($filter))) {
            if ($db_field2 == '0') {
				$db_field2 = $db_field;
			}
			
			$days = self::getInt('days');
			
			if (!empty($days) && $days != '-1') {
				$date = '';
				
				if ($days == 1) {
					if ($linux == 1) {
						$date = mktime(12, 00, 00, date('m'), date("d")-1, date('Y'));
					}
					else {
						$date = date('Y-m-d', mktime(12, 00, 00, date('m'), date("d")-1, date('Y')));
					}
				}
				elseif ($days == 3 || $days == 6) {
					if ($linux == 1) {
						$date = mktime(12, 00, 00, date("m") - $days, date('d'), date('Y'));
					}
					else {
						$date = date('Y-m-d', mktime(12, 00, 00, date("m") - $days, date('d'), date('Y')));
					}
				}
				elseif ($days == 12) {
					if ($linux == 1) {
						$date =	mktime(12, 00, 00, 01, 01, date('Y') -1);
					}
					else {
						$date = date('Y-m-d', mktime(12, 00, 00, 01, 01, date('Y') -1));
					}
				}
				
				$sub_where = "({$db_field} >= '".$date."')";
			}
			else {
                $fltr = !empty($this->filter_params) ? $this->filter_params->get('start_date', '2000-01-01') : '2000-01-01';
                list($fltr_year, $fltr_month, $fltr_day) = explode('-', $fltr);

                $from_year	= self::getInt('fromyear', $fltr_year);
                $to_year	= self::getInt('toyear', date('Y'));
                $from_month	= self::getInt('frommonth', $fltr_month);
                $to_month	= self::getInt('tomonth', date('m'));
                $from_day	= self::getInt('fromday', $fltr_day);
                $to_day		= self::getInt('today', date('d'));

                if ($to_year == date('Y') && $to_month == date('m') && $to_day == date('d') && $from_year == 2000 && $from_month == 01 && $from_day == 01) {
                   return;
                }

                if ($linux == '1') {
                    $from_date     = mktime(date("H"), date("i"), date("s"), $from_month, $from_day, $from_year);
                    $to_date       = mktime(date("H"), date("i"), date("s"), $to_month, $to_day, $to_year);
                }
                else {
                    $from_date = $from_year.'-'.$from_month.'-'.$from_day;
                    $to_date = $to_year.'-'.$to_month.'-'.$to_day;
                }

				$sub_where = "({$db_field} >='".$from_date."' AND {$db_field2} <= '".$to_date."')";
			}
		}
		
		if (!empty($sub_where)) {
			$where[] = $sub_where;
		}
	}
	
	public function getAccessLevelsWhere($field = 'access') {
		if (self::is16()) {
			$groups	= implode(',', JFactory::getUser()->getAuthorisedViewLevels());
			$ret = $field.' IN ('.$groups.')';
		}
		else {
			$ret = $field.' <= '.$this->aid;
		}
		
		return $ret;
	}
	
	public function getOrderBy(&$where, $prefix = '', $just_relevance = false) {
		$where .= " ORDER BY mijosearch_relevance DESC";
		
		/*if ($just_relevance == true) {
			$where .= " ORDER BY mijosearch_relevance DESC";
			return;
		}
		
		$order = self::getWord('order');
		$orderdir = self::getWord('orderdir');
		if (!empty($order) && !empty($orderdir)) {
			if ($order == 'mijosearch_relevance') {
				$where .= " ORDER BY {$order} {$orderdir}";
			}
			else {
				$where .= " ORDER BY {$prefix}{$order} {$orderdir}";
			}
		}
		else {
			$where .= " ORDER BY mijosearch_relevance DESC";
		}*/
	}
	
	public function getOrder($date = 1, $hits = 1, $relevance = 1) {
		$ret = '';
		
		if ($this->MijosearchConfig->google_more_results == '0') {
			//return $ret;
		}

        $default = $relevance ? 'relevance' : '';
		
		$order = JRequest::getWord('order', $default);

        if (empty($order)) {
            return $ret;
        }
		
		if ($order == 'relevance') {
            if ($relevance == 0) {
                return $ret;
            }

            $order = 'mijosearch_relevance';
        }
        else if ($order == 'date' && $date == 0) {
            return $ret;
        }
        else if ($order == 'hits' && $hits == 0) {
            return $ret;
        }
		
		$ret = " ORDER BY {$order} DESC";

		return $ret;
	}
	
	public function getIdentifier($type = 'Item') {
		return "'{$this->extension->extension}' AS mijosearch_ext, '{$type}' AS mijosearch_type";
	}
	
	public function getRelevance($fields) {
		$relevance = '';
		$is_exact = true;
		$sub_rel = array();
		
		$q = JRequest::getString('exact');
		
		if (empty($q)) {
			$is_exact = false;
			
			$q = JRequest::getString('query');
			if (empty($q)) {
				$q = JRequest::getString('any');
                if (empty($q)) {
                    $q = JRequest::getString('all');
                }
			}
		}
		
		if (empty($q)) {
			return $relevance;
		}
		
		$q = JString::strtolower($q);
		
		foreach ($fields as $type => $field) {
			$flds = explode(',', $field);

            foreach ($flds as $fld) {
                $fld = JString::trim($fld);

                if (empty($fld)) {
                    continue;
                }

                self::_getRelevanceQuery($sub_rel, $type, $fld, $q, $is_exact);
            }
		}

		$sub_rel = (count($sub_rel) ? implode(' + ', $sub_rel) : '');

		if (!empty($sub_rel)) {
			$relevance = '('.$sub_rel.') AS mijosearch_relevance';
		}
		
		return $relevance;
	}
	
	public function _getRelevanceQuery(&$sub_rel, $type, $field, $q, $is_exact) {
		if ($type == 'title') {
			$sub_rel[] = self::_getRelevanceQuerySql($field, $q, 100, 90, 80);
		}
		else {
			$sub_rel[] = self::_getRelevanceQuerySql($field, $q, 10, 9, 8);
		}
		
		if ($is_exact == true || !strpos(JString::trim($q), ' ')) {
            return;
        }
        
        $words = explode(' ', $q);

        if (empty($words) || !is_array($words)) {
            return;
        }

        foreach ($words as $word) {
            if (empty($word)) {
                continue;
            }

            $sub_rel[] = self::_getRelevanceQuerySql($field, $word, 3, 2, 1);
        }
	}
	
	public function _getRelevanceQuerySql($field, $q, $point_1, $point_2, $point_3, $point_false = 0) {
		$q_1 = self::_getRelevanceSecureText($q, '', '');
		$q_2 = self::_getRelevanceSecureText($q, '', '%');
		$q_3 = self::_getRelevanceSecureText($q, '%', '%');
		
		return "(CASE ".
				"WHEN {$field} = {$q_1} THEN {$point_1} ".
				"WHEN {$field} LIKE {$q_2} THEN {$point_2} ".
				"WHEN {$field} LIKE {$q_3} THEN {$point_3} ".
				"ELSE {$point_false} ".
				"END)";
	}
	
	public function _getRelevanceSecureText($text, $sep_1 = '%', $sep_2 = '%') {
		if (empty($text)) {
			return $text;
		}
	
		return MijoDatabase::quote(''.$sep_1.''.MijoDatabase::getEscaped(urldecode($text), true).''.$sep_2.'', false);
	}
	
	public function getSlug($id = 'id', $alias = 'alias', $name = 'slug') {
		return "CASE WHEN CHAR_LENGTH({$alias}) THEN CONCAT_WS(':', {$id}, {$alias}) ELSE {$id} END AS {$name}";
	}
	
	public function insertCckFieldsAllJoins(&$query, $sql, $prefix) {
		// all araması için son tabloyu çoğaltmamız lazım ki her kelime aranabilsin
        $words = explode(' ', self::getString('all', ''));
        if (empty($words) || count($words) <= 1) {
			return;
		}
		
		$pre_no = 0;

		foreach($words as $word) {
			$word = JString::trim($word);

			if (empty($word)) {
				continue;
			}

			$pre_no++;

			$query .= str_replace('{prefix}', $prefix.$pre_no, $sql);
		}
	}
	
	public function getSqlLimit() {
		if ($this->site) {
			$limit = $this->params->get('result_limit', '');
			
			if (empty($limit)) {
				$limit = $this->MijosearchConfig->result_limit;
			}
			
			return $limit;
		}
		else {
			return $this->MijosearchConfig->admin_result_limit;
		}
	}
	
	public function getUser() {
		return "";
	}

    //---------------------

	function _getRealLink($id, $options = 'com_content', $type = 'item', $item = 0, $category = 0) {
		$rows = MijoDatabase::loadRowList("SELECT url_real FROM #__mijosef_urls");
		$flexi = $case = false;

		if($rows){
			foreach($rows AS $row){
				$url_real = explode("?", $row[0]);

				if(!empty($url_real[1])){
					$real_vars = explode("&", $url_real[1]);
					$count = count($real_vars);

					for($i = 0; $i < $count; $i++){
						//foreach($real_vars AS $real_var){
						$real_var = explode("=", $real_vars[$i]);

						if($real_var[1] == $options){
							$flexi = true;
						}

						if($type = 'item'){
							if($real_var[0] == $item){
								$real_id = $real_var[1];
							}
						}
						else {
							if($real_var[0] == $category){
								$real_id = $real_var[1];
							}
						}
					}

					if($flexi){
						$case = true;
						$flexi = false;
					}
				}

				if($case){
					if($real_id == $id){
						$name = $row[0];
						break;
					}
				}
			}
			return $name;
		}
	}
	
	// --------------------

	public function getImageName($result) {
        if ($result->extimage == 'content_cat'){
            $imagename = @json_decode($result->imagename, true);

            if(!empty($imagename)){
                $result->imagename = str_replace("\/", "/", $imagename['image']);
            } else {
                $result->imagename = '';
            }
        }

        if ($result->extimage == 'content_item'){
            $imagename = @json_decode($result->imagename, true);
            $select_image = $this->params->get('select_image', '0') == '0' ? str_replace("\/", "/", $imagename['image_intro'])  : str_replace("\/", "/", $imagename['image_fulltext']);

            if(!empty($select_image)){
                $result->imagename = $select_image;
            } else {
                $result->imagename = '';
            }
        }

        if (!empty($result->imagename)){
            $result->imagename = $result->imagesource . $result->imagename;
        }

		return $result->imagename;
	}
	
	// --------------------
	
	public function _getItemProperties(&$item) {
		$properties = '';
        
		if ($this->params->get('show_section', '1') == '1'){
            $properties .= self::_getProperty($item, 'section');
        }
		
		if ($this->params->get('show_category', '1') == '1'){
            $properties .= self::_getProperty($item, 'category');
        }
		
		if ($this->params->get('show_date', '1') == '1'){
            $properties .= self::_getProperty($item, 'date');
        }
		
		if ($this->params->get('show_hits', '1') == '1'){
            $properties .= self::_getProperty($item, 'hits');
        }
		
		$item->properties = rtrim($properties, ' | ');
		
		unset($item->category);
		unset($item->date);
		unset($item->hits);
	}
	
	public function _getCategoryProperties(&$cat) {
		self::_getItemProperties($cat);
	}
	
	public function _getProperty($row, $type, $field = null) {
		$property = '';
		
		switch($type) {
			case 'section':
				if ($this->params->get('custom_name', '')) {
					$property = JText::_('COM_MIJOSEARCH_SEARCH_SECTION').': '.$this->params->get('custom_name', '').' | ';
				}
				else {
					$property = JText::_('COM_MIJOSEARCH_SEARCH_SECTION').': '.$this->extension->name.' | ';
				}
				break;
			case 'category':
				if (!empty($field)) {
					$fld = $field;
				}
				else {
					$fld = $type;
				}
				
				if (!empty($row->$fld)){ 
					$property = JText::_('COM_MIJOSEARCH_FIELDS_CATEGORY').': '.$row->$fld.' | ';
				}
				break;
			case 'date':
				if (!empty($field)) {
					$fld = $field;
				}
				else {
					$fld = $type;
				}
				
				if (!empty($row->$fld)){ 
					if (is_numeric($row->$fld)) {
						$date = $row->$fld;				
					}
					else {
						$date = strtotime($row->$fld);
					}
					
					$property = JText::_('COM_MIJOSEARCH_FIELDS_DATE').': '.date($this->MijosearchConfig->date_format, $date).' | ';
				}
				break;
			case 'hits':
				if (!empty($field)) {
					$fld = $field;
				}
				else {
					$fld = $type;
				}
				
				if (!empty($row->$fld)) {
					$property = JText::_('COM_MIJOSEARCH_FIELDS_HITS').': '.$row->$fld.' | ';
				}
				break;
		}
		
		return $property;
	}
	
	// --------------------
	
	public function getCategory($catid){
		static $cache = array();
		
		if (!isset($cache[$catid])) {
			$catid = intval($catid);
			$cache[$catid] = MijoDatabase::loadObject("SELECT title, alias FROM #__categories WHERE id = {$catid}");
		}
		
		return $cache[$catid];
	}
	
	public function _getCategories($option) {
		$where = self::getSearchFieldsWhere('title:name, description');
		if (empty($where)){
			return array();
		}

        if (self::is16()) {
            $field = 'extension';
        }
        else{
            $field = 'section';
        }
		
		$where[] = "{$field} = '{$option}'";
		
		if ($this->site) {
			$where[] = 'published = 1';

			if ($this->MijosearchConfig->access_checker == '1') {
				$where[] = self::getAccessLevelsWhere();
			}
			
			$filter = JRequest::getInt('filter');
			if (!empty($filter)) {
				self::getFilterWhere($where, array('category' => 'id'), true, 'categories', 'id', 'parent_id');
			}
		}
		
		$where = (count($where) ? ' WHERE ' . implode(' AND ', $where): '');

        $order_by = self::getOrder(0, 0);
		
		$identifier = self::getIdentifier('Category');
		
		$relevance = self::getRelevance(array('title' => 'title', 'desc' => 'description'));
		
		$query = "SELECT {$identifier}, {$relevance}, id, alias, title AS name, description, params AS imagename, 'content_cat' AS extimage".
		" FROM #__categories".
		" {$where}{$order_by}";
		
        return MijoDatabase::loadObjectList($query, '', 0, self::getSqlLimit());
	}
	
	// -------------------
	
	public function getExtraFieldsHTML($params, &$html, $is_module) {
		$fields = $params->get('extrafields', '');
		$module ="";
		if($is_module) {
			$module = '_module';
		}
		if (empty($fields)) {
			return '';
		}
		
		if (is_array($fields)) {
			foreach ($fields as $field) {
				$html[] = self::_getExtraFieldsHTML($field,$module);
			}
		}
		else {
			$html[] = self::_getExtraFieldsHTML($fields,$module);
		}
	}
	
	protected function _getExtraFieldsHTML($field,$module) {
		$output = '';
		
		list($field_id, $field_name) = explode('_', $field);
		
		$output  = '<div style="float:left; width:95%">';
		$output .= '<span class="mijosearch_span_label'.$module.'">';
		$output .= JText::_($field_name);
		$output .= '</span>';
		$output .= '<span class="mijosearch_span_field'.$module.'">';
		$output .= '<span><input type="checkbox" name="ja_'.$field_id.'" value="1" checked /></span>';
		$output .= '</span>';
		$output .= '</div>';
		
		return $output;
	}
	
	public function _getCategoryList($option, $apply_filter) {
		$where = array();
        $status = self::is16();

        if ($status) {
            $field = 'extension';
        }
        else{
            $field = 'section';
        }

		$where[] = "{$field} = '{$option}'";

		if ($this->site || $apply_filter == '1') {
			$where[] = "published = '1'";
			
			$filter = JRequest::getInt('filter');
			if (!empty($filter)) {
				self::getFilterWhere($where, array('category' => 'id'), true, 'categories', 'id', 'parent_id');
			}

			if ($this->MijosearchConfig->access_checker == '1') {
				$where[] = self::getAccessLevelsWhere();
			}
		}

		if ($status) {
			$where[] = 'parent_id > 0';
		}

		$where = (count($where) ? ' WHERE ' . implode(' AND ', $where) : '');

		if ($status) {
            $query = "SELECT id, title AS name, parent_id AS parent FROM #__categories {$where} ORDER BY parent_id, lft";
        }
        else{
            $query = "SELECT id, title AS name, parent_id AS parent FROM #__categories {$where}";
        }
		
		$rows = MijoDatabase::loadObjectList($query);
		
		return $rows;
	}
	
	public static function getExtensionName($extension) {
        static $names = array();

        if (!isset($names[$extension])) {
            $extensions = MijoSearch::getCache()->getExtensions();
            
            $params = new JRegistry($extensions[$extension]->params);

            $custom_name = trim($params->get('custom_name', ''));

            if (!empty($custom_name)) {
                $names[$extension] = $custom_name;
            }
            elseif (!empty($extensions[$extension]->name)) {
                $names[$extension] = $extensions[$extension]->name;
            }
            else {
                $names[$extension] = $extensions[$extension]->extension;
            }
        }

        return $names[$extension];
	}
	
	// -------------------
	
	public function getItemid($vars = array(), $params = null) {
		$v['option'] = $this->extension->extension;
		
		$vars = array_merge($v, $vars);
		
		$item = self::findItemid($vars, $params);
		
		if (!empty($item->id)) {
			return '&Itemid='.$item->id;
		}
		
		return '';
	}
	
	// thanks to Nicholas K. Dionysopoulos, akeebabackup.com
	public static function findItemid($vars = array(), $params = null) {
		if (empty($vars) || !is_array($vars)) {
			$vars = array();
		}
		
		$menus = MijoSearch::get('utility')->getMenu();
		
		$items = $menus->getMenu();
		if (empty($items)) {
			return null;
		}
		
		$option_found = null;
		
		foreach ($items as $item) {
			if (!is_object($item) || !isset($item->query)) {
				continue;
			}
			
			$query = $item->query;
			
			if (empty($query['option'])) {
				continue;
			}
			
			if ($query['option'] != $vars['option']) {
				continue;
			}
			
			if (count($vars) == 1) {
				return $item;
			}
			
			if (is_null($option_found)) {
				$option_found = $item;
			}
			
			if (self::_checkMenu($item, $vars, $params)) {
				return $item;
			}
		}
		
		if (!empty($option_found)) {
			return $option_found;
		}

		return null; 
	} 

	protected static function _checkMenu($item, $vars, $params = null) {
		$query = $item->query;
		
		unset($vars['option']);
		unset($query['option']);
		
		foreach ($vars as $key => $value) {
			if (is_null($value)) {
				return false;
			}
			
			if (!isset($query[$key])) {
				return false;
			}
			
			if ($query[$key] != $value) {
				return false;
			}
		} 

		if (!is_null($params)) {
			$menus = MijoSearch::get('utility')->getMenu();
			$check = $item->params instanceof JRegistry ? $item->params : $menus->getParams($item->id);
			
			foreach ($params as $key => $value) {
				if (empty($value)) { // son anda değiştirildi, is_null idi, MijoSearch::get('utility')->getItemid(); çağırırken JRequest::getInt('filter'); ile ilgili
					continue;
				}
				
				if ($check->get($key) != $value) {
					return false;
				}
			}
		}

        $user = JFactory::getUser();
        if (self::is16()){
            $access_levels = $user->getAuthorisedViewLevels();
            if (!in_array($item->access, $access_levels)){
                return false;
            }
        }
        else {
            if ($user->aid != $item->access){
                return false;
            }
        }

		return true;
	}
	
	public function fixVar($var) {
        if (!is_null($var)) {
            $pos = strpos($var, ':');
            if ($pos !== false) {
                $var = substr($var, 0, $pos);
			}
        }
		
		return $var;
    }
	
	public function getSecureText($text, $sep = '%') {
		if (empty($text)) {
			return $text;
		}
	
		return MijoDatabase::quote(''.$sep.''.MijoDatabase::getEscaped(urldecode($text), true).''.$sep.'', false);
	}
	
	public function getSearchQuery($query, $type = '') {
		return JString::trim(JString::strtolower(urldecode(JRequest::getString($query, '', $type))));
		//return preg_replace('/\s/u', ' ', trim(strtolower(urldecode(JRequest::getString($query,'',$type)))));
	}
}