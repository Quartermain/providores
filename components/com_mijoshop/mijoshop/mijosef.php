<?php
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

// No Permission
defined('_JEXEC') or die ('Restricted access');

require_once(JPATH_ROOT.'/components/com_mijoshop/mijoshop/mijoshop.php');

class MijoShopMijosef {

    public function _getPathID($id) {
        static $cache = array();

        $_id = $id;

        if (!isset($cache[$id])) {
            $cache[$id] = $_id;

            while ($_id > 0) {
                $cat_id = MijoDatabase::loadResult("SELECT parent_id FROM #__mijoshop_category WHERE category_id = ".$_id);

                if (!empty($cat_id) && $cat_id != 0){
                    $cache[$id] = $cat_id.'_'.$cache[$id];
                }

                $_id = $cat_id;
            }
        }

        return $cache[$id];
    }

    public function get($var, $type, $id, $lang_id) {
        static $cache = array();

        if (!isset($cache[$type][$id][$lang_id])) {
            $field = $type.'_id';
            if ($type == 'category') {
                $field = 'path';
            }

            $lang = '';
            if (count(MijoShop::get('db')->getLanguageList()) > 1) {
                require_once(JPATH_ADMINISTRATOR.'/components/com_mijosef/library/mijosef.php');

                $_l = MijoShop::get('db')->getLanguage($lang_id);

                if ((Mijosef::getConfig()->joomfish_main_lang != $_l['code']) || (Mijosef::getConfig()->joomfish_main_lang_del == 0)) {
                    $lang = 'lang='.$_l['code'];
                }
            }

            $route = MijoShop::get('router')->getRoute($type, false);

            $url_1 = "index.php?option=com_mijoshop";

            if($route == 'product/product'){
                $cat_id = MijoShop::get('db')->getProductCategoryId($id);
                $_id = self::_getPathID($cat_id);
                $url_2 = "{$lang}&path={$_id}&{$field}={$id}&route={$route}";
            }
			elseif($route == 'product/category') {
                $_id = self::_getPathID($id);
                $url_2 = "{$lang}&{$field}={$_id}&route={$route}";
            }
			else {
                $url_2 = "{$lang}&{$field}={$id}&route={$route}";
            }

            $cache[$type][$id][$lang_id] = MijoShop::get('db')->run("SELECT u.id AS url_id, u.url_sef, m.id AS meta_id, m.title, m.description, m.keywords, m.lang, m.robots, m.googlebot, m.canonical "
                                    ."FROM #__mijosef_urls AS u "
                                    ."LEFT JOIN #__mijosef_metadata AS m ON u.url_sef = m.url_sef "
                                    ."WHERE u.url_real LIKE '{$url_1}%' AND u.url_real LIKE '%{$url_2}%' "
                                    ."ORDER BY u.used, u.cdate "
                                    ."LIMIT 1");

            if (empty($cache[$type][$id][$lang_id])) {
                $cache[$type][$id][$lang_id] = array();
                $cache[$type][$id][$lang_id]['url_id'] = 0;
                $cache[$type][$id][$lang_id]['url_sef'] = '';
                $cache[$type][$id][$lang_id]['meta_id'] = 0;
                $cache[$type][$id][$lang_id]['title'] = '';
                $cache[$type][$id][$lang_id]['description'] = '';
                $cache[$type][$id][$lang_id]['keywords'] = '';
                $cache[$type][$id][$lang_id]['lang'] = '';
                $cache[$type][$id][$lang_id]['robots'] = '';
                $cache[$type][$id][$lang_id]['googlebot'] = '';
                $cache[$type][$id][$lang_id]['canonical'] = '';
            }
        }

        return $cache[$type][$id][$lang_id][$var];
    }

    public function store($posts, $rec_id = 0) {
        if (!MijoShop::get('base')->isMijosefInstalled() || empty($posts)) {
            return;
        }

        $db = MijoShop::get('db');

        foreach ($posts as $lang_id => $post) {
            if (empty($post['url_sef'])) {
                continue;
            }

            if ($post['url_id'] == 0) {
                $this->_saveNewSefUrl($post, $lang_id, $rec_id);
            }
            else {
                $db->run("UPDATE #__mijosef_urls SET url_sef = '{$post['url_sef']}' WHERE id = {$post['url_id']}", 'query');
            }

            if ($post['meta_id'] == 0) {
                $db->run("INSERT IGNORE INTO #__mijosef_metadata (url_sef, title, description, keywords, lang, robots, googlebot, canonical) ".
                                    "VALUES('{$post['url_sef']}', ".$db->run($post['title'], 'Quote').", ".$db->run($post['description'], 'Quote').", ".$db->run($post['keywords'], 'Quote').", '{$post['lang']}', '{$post['robots']}', '{$post['googlebot']}', '{$post['canonical']}')", 'query');
            }
            else {
                $db->run("UPDATE #__mijosef_metadata SET url_sef = ".$db->run($post['url_sef'], 'Quote').", title = ".$db->run($post['title'], 'Quote').", description = ".$db->run($post['description'], 'Quote').", keywords = ".$db->run($post['keywords'], 'Quote').", lang = '{$post['lang']}', robots = '{$post['robots']}', googlebot = '{$post['googlebot']}', canonical = '{$post['canonical']}' WHERE id = {$post['meta_id']}", 'query');
            }
        }
    }

    function _saveNewSefUrl($post, $lang_id, $rec_id) {
        $db = MijoShop::get('db');

        require_once(JPATH_ADMINISTRATOR.'/components/com_mijosef/library/mijosef.php');

        $component = 'com_mijoshop';
        $route = end(explode('=', $post['route_var']));
        $record_id = end(explode('=', $post['route_id']));

        if ($record_id == 0) {
            $record_id = $rec_id;

            $_a = explode('=', $post['route_id']);
            $post['route_id'] = $_a[0].'='.$record_id;
        }

        $lang = '';
        if (count($db->getLanguageList()) > 1) {
            $_l = $db->getLanguage($lang_id);

            if ((Mijosef::getConfig()->joomfish_main_lang != $_l['code']) || (Mijosef::getConfig()->joomfish_main_lang_del == 0)) {
                $lang = '&lang='.$_l['code'];
            }
        }

        $sef_url = $post['url_sef'];
        $real_url = 'index.php?option=com_mijoshop'.MijoShop::get('router')->getItemid(MijoShop::get('router')->getView($route), $record_id, true).$lang.'&'.$post['route_id'].'&'.$post['route_var'];

        $uri = new JURI($real_url);
        $mijosef_ext = Mijosef::getExtension($component);
		
		if (!is_object($mijosef_ext)) {
			return;
		}
		
        $ext_params = Mijosef::getCache()->getExtensionParams($component);

        // Override menu item id if set to
        if ($ext_params->get('override', '1') != '1' && $ext_params->get('override_id', '') != '') {
            $uri->setVar('Itemid', $ext_params->get('override_id'));
        }

        // Make changes on URI before building route
        $mijosef_ext->beforeBuild($uri);

        // Category status
        $real_url = Mijosef::get('uri')->sortURItoString($uri);
        $mijosef_ext->catParam($uri->getQuery(true), $real_url);

        // Check if we should track the URL source
        $source = "";

        // Cat statuses
        $tags = $this->_paramValue('tags', $component, $ext_params);
        $ilinks = $this->_paramValue('ilinks', $component, $ext_params);
        $bookmarks = $this->_paramValue('bookmarks', $component, $ext_params);

        // Params
        $prms = array();
        $prms['custom'] = 0;
        $prms['published'] = 1;
        $prms['locked'] = 0;
        $prms['blocked'] = 0;
        $prms['trashed'] = 0;
        $prms['notfound'] = 0;
        $prms['tags'] = (int)$tags;
        $prms['ilinks'] = (int)$ilinks;
        $prms['bookmarks'] = (int)$bookmarks;
        $prms['visited'] = 0;
        $prms['notes'] = '';

        $reg = new JRegistry($prms);
        $params = $reg->toString();

        // Finally, save record in DB
        $values = "(".$db->run($sef_url, 'Quote').", ".$db->run($real_url, 'Quote').", '0', '".date('Y-m-d H:i:s')."', '{$source}', '{$params}')";

        $db->run("INSERT IGNORE INTO #__mijosef_urls (url_sef, url_real, used, cdate, source, params) VALUES {$values}", 'query');
    }

    function _paramValue($section, $component, $params) {
        $MijosefConfig = Mijosef::getConfig();

   		$_components = $section."_components";
   		$_cats = $section."_cats";
   		$_enable_cats = $section."_enable_cats";
   		$_in_cats = $section."_in_cats";
   		$cat = Mijosef::get('utility')->get('category.param');

   		if (!in_array($component, $MijosefConfig->$_components)) {
   			return 0;
   		}

   		if (Mijosef::get('utility')->getConfigState($params, $_enable_cats) && ($cat[$_cats.'_status'] == 0 && $cat['_flag'] == 1)) {
   			return 0;
   		}

   		if (!Mijosef::get('utility')->getConfigState($params, $_in_cats) && $cat['_is_cat'] == 1) {
   			return 0;
   		}

   		return 1;
   	}
}