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

class MijoShopRouter {

    static $cats = array();

	public function buildRoute(&$query){
		$Itemid	= null;
		$segments = array();

        $menu = $this->getMenu();

		if (!empty($query['Itemid'])) {
			$Itemid = $query['Itemid'];
		}
		else {
			$Itemid = $this->getItemid();
		}

		if (empty($Itemid)) {
            $a_menu = $menu->getActive();
		}
        else {
            $a_menu = $menu->getItem($Itemid);
        }

		if (isset($query['view'])) {
            if ($query['view'] == 'admin') {
                unset($query['view']);

                return $segments;
            }
			$segments[] = $query['view'];
			unset($query['view']);
		}

		if (isset($query['route'])) {
			switch($query['route']) {
				case 'product/product':
                    if (is_object($a_menu) and $a_menu->query['view'] == 'product' and $a_menu->query['product_id'] == @$query['product_id']){
                        unset($query['path']);
                        unset($query['product_id']);
                        unset($query['manufacturer_id']);
                        break;
                    }

					$segments[] = 'product';

					if (isset($query['product_id'])) {
						$id = $query['product_id'];
						$name = MijoShop::get('db')->getRecordAlias($id);

						if (!empty($name)) {
							$segments[] = $id.':'.$name;
						}
						else {
							$segments[] = $id;
						}

						unset($query['path']);
						unset($query['product_id']);
						unset($query['manufacturer_id']);
						unset($query['sort']);
						unset($query['order']);
                        unset($query['filter_name']);
						unset($query['filter_tag']);
						unset($query['limit']);
						unset($query['page']);

					}

					break;
				case 'product/category':
					$_path = explode('_', @$query['path']);
					$m_id = end($_path);

					if (is_object($a_menu) and $a_menu->query['view'] == 'category' and $a_menu->query['path'] == $m_id){
						unset($query['path']);
						break;
					}
					
					$segments[] = 'category';

					if (isset($query['path'])) {
						$id = $query['path'];

						if (strpos($id, '_')) {
							$old_id = $id;
                            $id = end(explode('_', $id));

                            self::$cats[$id] = $old_id;
						}
						else {
                            self::$cats[$id] = $id;
						}

						$name = MijoShop::get('db')->getRecordAlias($id, 'category');

						if (!empty($name)) {
							$segments[] = $id.':'.$name;
						}
						else {
							$segments[] = $id;
						}

						unset($query['path']);
					}

					break;
				case 'product/manufacturer/info':
                    if (is_object($a_menu) and $a_menu->query['view'] == 'manufacturer' and $a_menu->query['manufacturer_id'] == @$query['manufacturer_id']){
                        unset($query['manufacturer_id']);
                        break;
                    }

					$segments[] = 'manufacturer';

					if (isset($query['manufacturer_id'])) {
						$id = $query['manufacturer_id'];
						$name = MijoShop::get('db')->getRecordAlias($id, 'manufacturer');

						if (!empty($name)) {
							$segments[] = $id.':'.$name;
						}
						else {
							$segments[] = $id;
						}

						unset($query['manufacturer_id']);
					}

					break;
				case 'information/information':
                    if (is_object($a_menu) and $a_menu->query['view'] == 'information' and $a_menu->query['information_id'] == @$query['information_id']){
                        unset($query['information_id']);
                        break;
                    }

					$segments[] = 'information';

					if (isset($query['information_id'])) {
						$id = $query['information_id'];
						$name = MijoShop::get('db')->getRecordAlias($id, 'information');

						if (!empty($name)) {
							$segments[] = $id.':'.$name;
						}
						else {
							$segments[] = $id;
						}

						unset($query['information_id']);
					}

					break;
                case 'common/home':
                    break;
				default:
                    $_view = $this->getView($query['route']);

                    $_itemid_r = $this->getItemid($_view);
                    $_itemid_h = $this->getItemid('home');

                    if (($_itemid_r == $_itemid_h)) {
                        $segments[] = $query['route'];
                    }

					break;
			}

			unset($query['route']);
		}

        /*if (MijoShop::get('base')->is30()
            and JRequest::getString('option') != 'com_search'
            and JRequest::getString('option') != 'com_users'
            and  is_object($a_menu)
            and (empty($_GET) or !isset($_GET['path']))
        ) {
            $url = str_replace('index.php?', '', $a_menu->link);
            parse_str($url, $vars);
            JRequest::set($vars, 'get');
        }*/

		return $segments;
	}

	public function parseRoute($segments) {
		$vars = array();

		if (empty($segments)) {
			//return $vars;
		}

		$c = count($segments);
		if ($c == 1) {
			$vars['view'] = $segments[0];
            $vars['route'] = $this->getRoute($segments[0]);

			return $vars;
		}

		$route = '';

		foreach ($segments as $segment) {
			if ($segment == 'product' and strpos($segments[1], ':')) {
				$route = 'product/product';

				list($id, $alias) = explode(':', $segments[1], 2);
				$vars['product_id'] = $id;

				break;
			}

			if ($segment == 'category' and strpos($segments[1], ':')) {
				$route = 'product/category';

				list($id, $alias) = explode(':', $segments[1], 2);

                $id = isset(self::$cats[$id]) ? self::$cats[$id] : $id;

                $parent_id = MijoShop::get('db')->getParentCategoryId($id);
                while ($parent_id != 0) {
                    $id = $parent_id.'_'.$id;

                    $parent_id = MijoShop::get('db')->getParentCategoryId($parent_id);
                }

				$vars['path'] = $id;

				break;
			}

			if ($segment == 'manufacturer' and strpos($segments[1], ':')) {
				$route = 'product/manufacturer/info';

				list($id, $alias) = explode(':', $segments[1], 2);

				$vars['manufacturer_id'] = $id;

				break;
			}

			if ($segment == 'information' and strpos($segments[1], ':')) {
				$route = 'information/information';

				list($id, $alias) = explode(':', $segments[1], 2);
				$vars['information_id'] = $id;

				break;
			}

            if ($segment == 'admin') {
                $vars['view'] = 'admin';
            }

			$route .= '/'.$segment;
		}

		if (!empty($route)) {
			$route = ltrim($route, '/');

			$vars['route'] = $route;
		}

        if (MijoShop::get('base')->is30()) {
            JRequest::set($vars, 'get');
        }

		return $vars;
	}

    public function rewrite($url) {
        if (!strpos($url, 'page')) {
            $url = $this->route($url);
        }
        else {
            if(!strpos($url, 'option') and MijoShop::get('base')->isAdmin('mijoshop')){
                $url = str_replace('&amp;', '&', $url);
                $url = str_replace('index.php?route=', 'index.php?option=com_mijoshop&view=admin&route=', $url);
            }
        }

        return $url;
    }

    public function route($url) {
        $uri = JFactory::getURI();
   		$app = JFactory::getApplication();
        $oc_config = MijoShop::get('opencart')->get('config');

   		$url = str_replace('&amp;', '&', $url);
        $url = str_replace('//index.php', '/index.php', $url);
   		$url = str_replace('index.php?token=', 'index.php?option=com_mijoshop&token=', $url);
   		$url = str_replace('index.php?route=', 'index.php?option=com_mijoshop&route=', $url);

   		if ($app->isSite()) {
            $domain = MijoShop::get('base')->getDomain();
            $full_url = MijoShop::get('base')->getFullUrl();

            if (($oc_config->get('config_secure') == 1) and (substr($url, 0, 5) == 'https') and (substr($domain, 0, 5) != 'https')) {
                $domain = str_replace('http://', 'https://', $domain);
            }

   			$url = str_replace($full_url, '', $url);
            $url = str_replace(str_replace('http', 'https', $full_url), '', $url);

            if (substr($url, 0, 10) == 'index.php?') {
                $url = str_replace('index.php?', '', $url);
                parse_str($url, $vars);

                if (!isset($vars['Itemid'])) {
                    $id = 0;

                    if (!isset($vars['view']) and !isset($vars['route'])) {
                        $view = 'home';
                    }

                    if (MijoShop::get('base')->isAdmin('mijoshop')) {
                        $view = 'admin';
                    }
                    else if (isset($vars['route'])) {
                        if ($vars['route'] == 'product/category') {
                            $path_array = explode('_', $vars['path']);
                            $id = end($path_array);
                        }
                        elseif ($vars['route'] == 'product/product') {
                            $id = $vars['product_id'];
                        }
                        elseif ($vars['route'] == 'product/manufacturer/info') {
                            $id = $vars['manufacturer_id'];
                        }
                        elseif ($vars['route'] == 'information/information') {
                            $id = $vars['information_id'];
                        }

                        $view = $this->getView($vars['route']);
                    }

                    $Itemid = $this->getItemid($view, $id);

                    if (!empty($Itemid)) {
                        $vars['Itemid'] = $Itemid;
                    }
                }

                if (strpos($url, 'captcha')) {
                    $vars['tmpl'] = 'component';
                    $vars['format'] = 'raw';
                }

                if ($this->_addLangCode($url)) {
                    $_lang_id = (int) MijoShop::getClass('opencart')->get('config')->get('config_language_id');
                    $_lang = MijoShop::getClass('db')->getLanguage($_lang_id);

                    if (!empty($_lang['code'])) {
                        $vars['lang'] = $_lang['code'];
                    }
                }

                if (MijoShop::get('base')->isAdmin('mijoshop') and (!isset($vars['view']) || $vars['view'] != 'admin')) {
                    $vars['view'] = 'admin';
                }

                if (isset($vars['view']) and isset($vars['route']) and ($vars['view'] != 'admin')) {
                    unset($vars['view']);
                }

                unset($vars['mijoshop_store_id']);

                $url = 'index.php';
                foreach ($vars as $var => $val) {
                    $sign = '&';

                    if ($var == 'option') {
                        $sign = '?';
                    }

                    $url .= $sign.$var.'='.$val;
                }

                $ssl_checkouts = array('checkout/simplecheckout', 'checkout/simplified_checkout');
                if (($oc_config->get('config_secure') == 1) and isset($vars['route']) and in_array($vars['route'], $ssl_checkouts)) {
                    $domain = str_replace('http://', 'https://', $domain);
                }

                if (MijoShop::get('base')->is30() and isset($vars['route']) and isset($_GET['route']) and $vars['route'] == $_GET['route']) {
					JRequest::set($vars, 'get');
                }
            }

   		    $url = JRoute::_($url);

            $url = str_replace('&amp;', '&', $url);
            
			//for external links
            $out = strpos($url, '#outurl');
               
            if($out === false) {
                $url = $domain.ltrim($url, '/');
            }
            else{
                $url = str_replace('#outurl', '', $url);
            }
   		}
        else {
            if (MijoShop::get()->isExternal()) {
                $url .= '&view='.JRequest::getCmd('view');
            }
        }

   		return $url;
   	}

    public function getItemid($view = 'home', $record_id = 0, $with_name = false) {
   		static $ids = array();
        static $store_id;
        static $items;

        if (!isset($store_id)) {
            $store_id = MijoShop::get('base')->getStoreId();
        }

        if (!isset($items)) {
            $component = JComponentHelper::getComponent('com_mijoshop');

         	$items = $this->getMenu()->getItems('component_id', $component->id);
        }

   		if (!isset($ids[$view][$record_id]) and is_array($items)) {
            if ($view == 'product') {
                $cat_id = MijoShop::get('db')->getProductCategoryId($record_id);
                $needles = array(
                    'product' => (int) $record_id,
                    'category' => (int) $cat_id
                );
            }
            else if ($view == 'category') {
                $needles = array(
                    'category' => (int) $record_id
                );
            }
            else if ($view == 'manufacturer') {
                $needles = array(
                    'manufacturer' => (int) $record_id
                );
            }
            else if ($view == 'information') {
                $needles = array(
                    'information' => (int) $record_id
                );
            }
            else {
                $needles = array(
                    $view => $record_id
                );
            }

            $menu_id = $this->_findItemId($needles, $items, $store_id);

            $ids[$view][$record_id] = $menu_id;
		}

		$Itemid = '';

		if (empty($ids[$view][$record_id])) {
			return $Itemid;
		}

		$Itemid = $ids[$view][$record_id];

		if ($with_name == true) {
           $Itemid = '&Itemid='.$Itemid;
		}

   		return $Itemid;
   	}

    protected function _findItemId($needles, $items, $store_id, $recursive_cats = true) {
        static $home_id;
        static $menu_ids = array();

        $menu = $this->getMenu();
		$menu_id = null;

        foreach ($needles as $needle => $id) {
            if (!empty($menu_ids[$needle][$id])){
                $menu_id = $menu_ids[$needle][$id];
                break;
            }

            foreach ($items as $item) {
				$params = $item->params instanceof JRegistry ? $item->params : $menu->getParams($item->id);

				if ($params->get('mijoshop_store_id', 0) != $store_id) {
					continue;
				}

                if ($needle == 'product') {
                    if ((@$item->query['view'] == $needle) and (@$item->query['product_id'] == $id)) {
                        $menu_id = $item->id;
                        $menu_ids[$needle][$id] = $menu_id;
                        break;
                    }
                }
                else if ($needle == 'category') {
                    if ((@$item->query['view'] == $needle)) {
                        if (@$item->query['path'] == $id) {
                            $menu_id = $item->id;
                            $menu_ids[$needle][$id] = $menu_id;
                            break;
                        }
                        else if ($recursive_cats == true) {
							$parent_id = MijoShop::get('db')->getParentCategoryId($id);
							
                            if ($parent_id != 0) {
                                $needles = array(
                                    'category' => (int) $parent_id
                                );

                                $menu_id = $this->_findItemId($needles, $items, $store_id);
                                $menu_ids[$needle][$id] = $menu_id;
                            }
                        }
                    }
                }
                else if ($needle == 'manufacturer') {
                    if ((@$item->query['view'] == $needle) and (@$item->query['manufacturer_id'] == $id)) {
                        $menu_id = $item->id;
                        $menu_ids[$needle][$id] = $menu_id;
                        break;
                    }
                }
                else if ($needle == 'information') {
                    if ((@$item->query['view'] == $needle) and (@$item->query['information_id'] == $id)) {
                        $menu_id = $item->id;
                        $menu_ids[$needle][$id] = $menu_id;
                        break;
                    }
                }
                else {
                    if (@$item->query['view'] == $needle) {
                        $menu_id = $item->id;
                        $menu_ids[$needle][$id] = $menu_id;
                        break;
                    }
                }

                if (empty($home_id) and @$item->query['view'] == 'home') {
                    $home_id = $item->id;
                    $menu_ids[$needle][$id] = $menu_id;
                }
            }

            if (!empty($menu_id)) {
                break;
            }
        }

        if (empty($menu_id) and !empty($home_id)) {
            $menu_id = $home_id;
        }

        return $menu_id;
    }

	public function getMenu() {
		jimport('joomla.application.menu');
		$options = array();

		$menu = JMenu::getInstance('site', $options);

		if (JError::isError($menu)) {
			$null = null;
			return $null;
		}

		return $menu;
	}

    public function generateAlias($title) {
        $alias = html_entity_decode($title, ENT_QUOTES, 'UTF-8');

        if (JFactory::getConfig()->get('unicodeslugs') == 1) {
            $alias = JFilterOutput::stringURLUnicodeSlug($alias);
        }
        else {
            $alias = JFilterOutput::stringURLSafe($alias);
        }

        if (trim(str_replace('-', '', $alias)) == '') {
            $mainframe = JFactory::getApplication();

            $date = JFactory::getDate();

			if (MijoShop::get('base')->is30()) {
				$date->setTimezone($mainframe->getCfg('offset'));
				$alias = $date->format("%Y-%m-%d-%H-%M-%S");
			}
			else {
				$date->setOffset($mainframe->getCfg('offset'));
				$alias = $date->toFormat("%Y-%m-%d-%H-%M-%S");
			}
        }

        return $alias;
    }

    public function getView($route, $use_default = true) {
        $view = '';

        switch ($route) {
            case 'common/home':
                $view = 'home';
                break;
            case 'account/account':
                $view = 'account';
                break;
            case 'checkout/cart':
                $view = 'cart';
                break;
            case 'checkout/checkout':
                $view = 'checkout';
                break;
            case 'account/wishlist':
                $view = 'wishlist';
                break;
            case 'information/contact':
                $view = 'contact';
                break;
            case 'product/product':
                $view = 'product';
                break;
            case 'product/category':
                $view = 'category';
                break;
            case 'product/compare':
                $view = 'compare';
                break;
            case 'product/manufacturer/info':
                $view = 'manufacturer';
                break;
            case 'product/manufacturer':
                $view = 'manufacturers';
                break;
            case 'account/login':
                $view = 'login';
                break;
            case 'account/register':
                $view = 'registration';
                break;
            case 'account/order':
                $view = 'orders';
                break;
            case 'account/download':
                $view = 'downloads';
                break;
            case 'product/search':
                $view = 'search';
                break;
            case 'account/newsletter':
                $view = 'newsletter';
                break;
            case 'account/voucher':
                $view = 'voucher';
                break;
            case 'information/sitemap':
                $view = 'sitemap';
                break;
            case 'account/return/insert':
                $view = 'returns';
                break;
            case 'affiliate/account':
                $view = 'affiliates';
                break;
            case 'product/special':
                $view = 'specials';
                break;
            case 'information/information':
                $view = 'information';
                break;
            case 'admin':
                $view = 'admin';
                break;
            case 'product/latest':
                $view = 'latest';
                break;
            case 'product/popular':
                $view = 'popular';
                break;
            case 'product/bestseller':
                $view = 'bestseller';
                break;
            default:
                if ($use_default == true) {
                    $view = 'home';
                }
                break;
        }

        return $view;
    }

    public function getRoute($view, $use_default = true) {
        $route = '';

        switch ($view) {
            case 'home':
                $route = 'common/home';
                break;
            case 'account':
                $route = 'account/account';
                break;
            case 'cart':
                $route = 'checkout/cart';
                break;
            case 'checkout':
                $route = 'checkout/checkout';
                break;
            case 'wishlist':
                $route = 'account/wishlist';
                break;
            case 'contact':
                $route = 'information/contact';
                break;
            case 'product':
                $route = 'product/product';
                break;
            case 'category':
                $route = 'product/category';
                break;
            case 'compare':
                $route = 'product/compare';
                break;
            case 'manufacturer':
                $route = 'product/manufacturer/info';
                break;
            case 'manufacturers':
                $route = 'product/manufacturer';
                break;
            case 'login':
                $route = 'account/login';
                break;
            case 'registration':
                $route = 'account/register';
                break;
            case 'orders':
                $route = 'account/order';
                break;
            case 'downloads':
                $route = 'account/download';
                break;
            case 'search':
                $route = 'product/search';
                break;
            case 'newsletter':
                $route = 'account/newsletter';
                break;
            case 'voucher':
                $route = 'account/voucher';
                break;
            case 'sitemap':
                $route = 'information/sitemap';
                break;
            case 'returns':
                $route = 'account/return/insert';
                break;
            case 'affiliates':
                $route = 'affiliate/account';
                break;
            case 'specials':
                $route = 'product/special';
                break;
            case 'information':
                $route = 'information/information';
                break;
            case 'admin':
                $route = 'admin';
                break;
            case 'latest':
                $route = 'product/latest';
                break;
            case 'popular':
                $route = 'product/popular';
                break;
            case 'bestseller':
                $route = 'product/bestseller';
                break;
            default:
                if ($use_default == true) {
                    $route = 'common/home';
                }
                break;
        }

        return $route;
    }

    public function _cleanTitle($text) {
        $replace = array("&quot;");

        foreach ($replace as $value) {
            $text = str_replace($value, "", $text);
        }

        return $text;
    }

    public function _addLangCode($url) {
        if (strpos($url, '&lang=')) {
            return false;
        }

        if (MijoShop::get('base')->isAdmin('mijoshop')) {
            return false;
        }

        if (MijoShop::get('base')->isMijosefInstalled() and (Mijosef::getConfig()->multilang == 1)) {
            return true;
        }

        if (MijoShop::get('base')->isSh404sefInstalled() and (Sh404sefFactory::getConfig()->enableMultiLingualSupport == 1)) {
            return true;
        }

        if (MijoShop::get('base')->isJoomsefInstalled() and (SEFConfig::getConfig()->langEnable)) {
            return true;
        }

        if (MijoShop::get('base')->plgEnabled('system', 'languagefilter')) {
            return true;
        }

        return false;
    }

    function _getParentCat($id){
        static $cats = array();

        if (!empty($cats)){
            return $cats[$id];
        }

        $sql = "SELECT category_id, parent_id FROM #__mijoshop_category WHERE status = 1";
        $jdb = JFactory::getDbo();
        $jdb->setQuery($sql);
        $_cats = $jdb->loadRowList();


        foreach($_cats as $_cat){
            $cats[$_cat[0]] = $_cat[1];
        }

        return $cats[$id];
    }
}