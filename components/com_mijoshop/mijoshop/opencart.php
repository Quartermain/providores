<?php
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, www.mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

// No Permission
defined('_JEXEC') or die ('Restricted access');

require_once(JPATH_ROOT.'/components/com_mijoshop/mijoshop/mijoshop.php');

class MijoShopOpencart {

    public static $version = null;
    public static $vqmod = null;
    public static $registry = null;
    public static $loader = null;
    public static $config = null;
    public static $db = null;
    public static $store_id = null;
    public static $url = null;
    public static $log = null;
    public static $request = null;
    public static $response = null;
    public static $cache = null;
    public static $session = null;
    public static $language = null;
    public static $document = null;
    public static $customer = null;
    public static $affiliate = null;
    public static $tax = null;
    public static $currency = null;
    public static $weight = null;
    public static $length = null;
    public static $cart = null;
    public static $user = null;
    public static $encryption = null;

    public function __construct() {
        self::$version = MijoShop::get('base')->getOcVersion();

        // Version
        define('VERSION', self::$version);

        if (!MijoShop::get('base')->isAdmin('joomla') && MijoShop::get('base')->getConfig()->get('fix_ie_cache', 0) == 1) {
            header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
            header("Cache-Control: no-store, no-cache, must-revalidate");
            header("Cache-Control: post-check=0, pre-check=0", false);
            header("Pragma: no-cache");
        }

        // Config
        if (MijoShop::get('base')->isAdmin('mijoshop') || MijoShop::get('base')->isAdmin('joomla')) {
            require_once(JPATH_MIJOSHOP_OC.'/admin/config.php');
        }
        else {
            require_once(JPATH_MIJOSHOP_OC.'/config.php');
        }

        // vQmod
        global $vqmod;
        if (empty($vqmod)) {
            require_once(JPATH_MIJOSHOP_OC.'/vqmod/vqmod.php');
            $vqmod = new VQMod();
        }

        self::$vqmod = $vqmod;

        $route = JRequest::getString('route');

        $manual_order = false;
        if ($route == 'checkout/manual') {
            $manual_order = true;
        }

        // Startup
        require_once($vqmod->modCheck(DIR_SYSTEM . 'startup.php'));

        // Application Classes
        require_once($vqmod->modCheck(DIR_SYSTEM . 'library/currency.php'));
        require_once($vqmod->modCheck(DIR_SYSTEM . 'library/weight.php'));
        require_once($vqmod->modCheck(DIR_SYSTEM . 'library/length.php'));

        if (MijoShop::get('base')->isAdmin('mijoshop') || MijoShop::get('base')->isAdmin('joomla') || $manual_order) {
            require_once($vqmod->modCheck(DIR_SYSTEM . 'library/user.php'));
        }

        if (!MijoShop::get('base')->isAdmin('joomla')) {
            require_once($vqmod->modCheck(DIR_SYSTEM . 'library/tax.php'));
            require_once($vqmod->modCheck(DIR_SYSTEM . 'library/customer.php'));
            require_once($vqmod->modCheck(DIR_SYSTEM . 'library/cart.php'));
            require_once($vqmod->modCheck(DIR_SYSTEM . 'library/affiliate.php'));
        }

        // Registry
        self::$registry = new Registry();

        // Loader
        self::$loader = new Loader(self::$registry);
        self::$registry->set('load', self::$loader);

        // Config
        self::$config = new Config();
        self::$registry->set('config', self::$config);

        // Database
        self::$db = new DB(DB_DRIVER, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
        self::$registry->set('db', self::$db);

        // Store
        self::$store_id = MijoShop::get('base')->getStoreId(); //-------
        $this->setStoreId(); //-------

        // Settings
        $query = self::$db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE store_id = '0' OR store_id = '" . (int) self::$config->get('config_store_id') . "' ORDER BY store_id ASC");

        foreach ($query->rows as $setting) {
            if (!$setting['serialized']) {
                self::$config->set($setting['key'], $setting['value']);
            } else {
                self::$config->set($setting['key'], unserialize($setting['value']));
            }
        }

        if (!MijoShop::get('base')->isAdmin('mijoshop') && !MijoShop::get('base')->isAdmin('joomla')) {
            $this->defineHttpConstants();
        }

        if (!self::$store_id) {
            self::$config->set('config_url', HTTP_SERVER);
            self::$config->set('config_ssl', HTTPS_SERVER);
        }

        // Url
        if (MijoShop::get('base')->isAdmin('mijoshop') || MijoShop::get('base')->isAdmin('joomla')) {
            self::$url = new Url(HTTP_SERVER, self::$config->get('config_secure') ? HTTPS_SERVER : HTTP_SERVER);
        }
        else {
            self::$url = new Url(self::$config->get('config_url'), self::$config->get('config_secure') ? self::$config->get('config_ssl') : self::$config->get('config_url'));
        }
        self::$url->addRewrite(MijoShop::get('router'));
        self::$registry->set('url', self::$url);

        // Log
        self::$log = new Log(self::$config->get('config_error_filename'));
        self::$registry->set('log', self::$log);

        // Error Handler
        require_once(JPATH_MIJOSHOP_LIB.'/error.php'); //-------

        // Request
        self::$request = new Request();
        self::$registry->set('request', self::$request);

        // Response
        self::$response = new Response();
        self::$response->addHeader('Content-Type: text/html; charset=utf-8');
        self::$response->setCompression(self::$config->get('config_compression'));
        self::$registry->set('response', self::$response);

        // Cache
        self::$cache = new Cache();
        self::$registry->set('cache', self::$cache);

        // Session
        self::$session = new Session();
        self::$registry->set('session', self::$session);

        // Language Detection
        $languages = array();

        $results = MijoShop::get('db')->getLanguageList();

        foreach ($results as $result) {
            $languages[$result['code']] = $result;
        }

        $j_lang_code = JFactory::getConfig()->get('language');
        $j_lang = MijoShop::get('db')->getLanguage($j_lang_code, true);


        if (MijoShop::get('base')->isAdmin('mijoshop') || MijoShop::get('base')->isAdmin('joomla')) {
            self::$config->set('config_language_id', $j_lang['language_id']);

            // Language
            self::$language = new Language($j_lang['directory']);
            self::$language->load($j_lang['filename']);
			self::$registry->set('language', self::$language);
        }
        else {
            $detect = '';

            if (isset(self::$request->server['HTTP_ACCEPT_LANGUAGE']) && (self::$request->server['HTTP_ACCEPT_LANGUAGE'])) {
                $browser_languages = explode(',', self::$request->server['HTTP_ACCEPT_LANGUAGE']);

                foreach ($browser_languages as $browser_language) {
                    foreach ($languages as $key => $value) {
                        if ($value['status']) {
                            $locale = explode(',', $value['locale']);

                            if (in_array($browser_language, $locale)) {
                                $detect = $key;
                            }
                        }
                    }
                }
            }

            if (isset(self::$request->get['lang']) && array_key_exists(self::$request->get['lang'], $languages) && (MijoShop::get('base')->isAjax() == false)) {
				$code = self::$request->get['lang'];
			}
			else if (isset(self::$request->get['language']) && array_key_exists(self::$request->get['language'], $languages) && $languages[self::$request->get['language']]['status']) {
                $code = self::$request->get['language'];
            }
			else if (!empty($j_lang)) {
                $code = $j_lang['code'];
            }
            else if (isset($_REQUEST['language'])) {
                $_language = explode('-', $_REQUEST['language']);
                $code = $_language[0];
            }
			else if (isset(self::$session->data['language']) && array_key_exists(self::$session->data['language'], $languages)) {
                $code = self::$session->data['language'];
            }
			else if (isset(self::$request->cookie['language']) && array_key_exists(self::$request->cookie['language'], $languages)) {
                $code = self::$request->cookie['language'];
            }
			else if ($detect) {
                $code = $detect;
            }
			else {
                $code = self::$config->get('config_language');
            }

            if (!isset(self::$session->data['language']) || self::$session->data['language'] != $code) {
                self::$session->data['language'] = $code;
            }

            if (!isset(self::$request->cookie['language']) || self::$request->cookie['language'] != $code) {
                setcookie('language', $code, time() + 60 * 60 * 24 * 30, '/', self::$request->server['HTTP_HOST']);
            }

            self::$config->set('config_language_id', $languages[$code]['language_id']);
            self::$config->set('config_language', $languages[$code]['code']);

            // Language
            self::$language = new Language($languages[$code]['directory']);
            self::$language->load($languages[$code]['filename']);
			self::$registry->set('language', self::$language);
        }

        // Document
        self::$document = new Document();
        self::$registry->set('document', self::$document);

        if (MijoShop::get('base')->isAdmin('mijoshop') || MijoShop::get('base')->isAdmin('joomla') || $manual_order) {
            // User
            $user = new User(self::$registry);

            if ($manual_order) {
                $j_user = JFactory::getUser(JRequest::getInt('j_user_id'));
                $user->login($j_user->get('username'), MijoShop::get('user')->getCleanPassword($j_user->get('password')));
            }

            self::$user = $user;
            self::$registry->set('user', self::$user);
        }

        if (!MijoShop::get('base')->isAdmin('joomla')) {
            // Customer
            self::$customer = new Customer(self::$registry);
            self::$registry->set('customer', self::$customer);

            // Affiliate
            self::$affiliate = new Affiliate(self::$registry);
            self::$registry->set('affiliate', self::$affiliate);

            if (isset(self::$request->get['tracking']) && !isset(self::$request->cookie['tracking'])) {
                setcookie('tracking', self::$request->get['tracking'], time() + 3600 * 24 * 1000, '/');
            }
        }

        // Currency
        self::$currency = new Currency(self::$registry);
        self::$registry->set('currency', self::$currency);

        if (!MijoShop::get('base')->isAdmin('joomla')) {
            // Tax
            self::$tax = new Tax(self::$registry);
            self::$registry->set('tax', self::$tax);
        }

        // Weight
        self::$weight = new Weight(self::$registry);
        self::$registry->set('weight', self::$weight);

        // Length
        self::$length = new Length(self::$registry);
        self::$registry->set('length', self::$length);

        if (!MijoShop::get('base')->isAdmin('joomla')) {
            // Cart
            self::$cart = new Cart(self::$registry);
            self::$registry->set('cart', self::$cart);
			
            // Encryption
            self::$encryption = new Encryption(self::$registry);
            self::$registry->set('encryption', self::$encryption);
        }

        global $registry;
        $registry = self::$registry;

        global $config;
        $config = self::$config;

        global $db;
        $db = self::$db;

        global $log;
        $log = self::$log;
    }

    public function get($var) {
   		return self::${$var};
   	}

    public function set($var, $value) {
        self::${$var} = $value;
   	}

    public function loadFront() {
        // Front Controller
        $controller = new Front(self::$registry);

        // Maintenance Mode
        $controller->addPreAction(new Action('common/maintenance'));

        // SEO URL's
        //$controller->addPreAction(new Action('common/seo_url'));

        // Router
        if (isset(self::$request->get['route'])) {
            $action = new Action(self::$request->get['route']);
        } else {
            $action = new Action('common/home');
        }

        // Dispatch
        $controller->dispatch($action, new Action('error/not_found'));

        // Output
        self::$response->output();
   	}

    public function loadBack() {
        // Front Controller
        $controller = new Front(self::$registry);

        // Login
        $controller->addPreAction(new Action('common/home/login'));

        // Permission
        $controller->addPreAction(new Action('common/home/permission'));

        // Router
        if (isset(self::$request->get['route'])) {
        	$action = new Action(self::$request->get['route']);
        } else {
        	$action = new Action('common/home');
        }

        // Dispatch
        $controller->dispatch($action, new Action('error/not_found'));

        // Output
        self::$response->output();
   	}

    public function loadModule($module_name = '', $layout_id = '') {
        MijoShop::get()->addHeader(JPATH_MIJOSHOP_OC.'/catalog/view/javascript/common.js', false);

        if (!MijoShop::get('base')->isAdmin()){
            MijoShop::get()->addHeader(JPATH_MIJOSHOP_OC.'/catalog/view/theme/'.self::$config->get('config_template').'/stylesheet/stylesheet.css');
        }

        $action = new Action('module/'.$module_name);

        $file = $action->getFile();
        $class = $action->getClass();
        $method = $action->getMethod();
        $args = $action->getArgs();

        $file = self::$vqmod->modCheck($file);

        if (!file_exists($file)) {
            return '';
        }

        require_once($file);

        // Module Controller
        $controller = new $class(self::$registry);

        // Dispatch
        if (!is_callable(array($controller, $method))) {
            return '';
        }

        $modules = self::$config->get($module_name.'_module');
        if (!empty($modules)) {
            //$args['setting'] = $modules[0];

            foreach ($modules as $module) {
                if ($module['layout_id'] == $layout_id) {
                    $args['setting'] = $module;
                    $output[] = call_user_func_array(array($controller, $method), $args);
                }
            }
        }

        return $output;
   	}

    public function loadControllerFunction($action, $extra_args = array()) {
        $ret = '';

        $action = new Action($action);

        $file = $action->getFile();
        $class = $action->getClass();
        $args = array_merge($action->getArgs(), $extra_args);
        $method = $action->getMethod();

        $file = self::$vqmod->modCheck($file);

        if (!file_exists($file)) {
            return $ret;
        }

        require_once($file);

        $controller = new $class(self::$registry);

        if (!is_callable(array($controller, $method))) {
            return $ret;
        }

        $ret = call_user_func_array(array($controller, $method), $args);

        return $ret;
   	}

    public function loadModelFunction($action, $args = array(), $multi_vars = false) {
		$ret = '';

		$vars = explode('/', $action);

		$file  = DIR_APPLICATION . 'model/'.$vars[0].'/'.$vars[1].'.php';
		$class = 'Model'.ucfirst($vars[0]).ucfirst($vars[1]);
		$function = $vars[2];

		$file = self::$vqmod->modCheck($file);

		if (!file_exists($file)) {
			return $ret;
		}

		require_once($file);

		$model = new $class(self::$registry);

		if (!is_callable(array($model, $function))) {
			return $ret;
		}
			
		if ($multi_vars == true) {
			$c = count($args);
			 
			switch ($c) {
				case 2:
					$ret = $model->$function($args[0], $args[1]);
					break;
				case 3:
					$ret = $model->$function($args[0], $args[1], $args[2]);
					break;
				case 4:
					$ret = $model->$function($args[0], $args[1], $args[2], $args[3]);
					break;
				case 5:
					$ret = $model->$function($args[0], $args[1], $args[2], $args[3], $args[4]);
					break;
			}
		}
		else {
			$ret = $model->$function($args);
		}

		return $ret;
	}

    public function defineHttpConstants() {
		if (is_object(self::$config) && ((self::$config->get('config_url') == 'http://www.yoursite.com/') || (self::$config->get('config_url') == ''))) {
           define('HTTP_SERVER', HTTP_SERVER_TEMP);
		}
		else {
           define('HTTP_SERVER', self::$config->get('config_url'));
		}

		define('HTTP_IMAGE', HTTP_SERVER.'components/com_mijoshop/opencart/image/');

		if (is_object(self::$config) && self::$config->get('config_secure')){
           $_url = self::$config->get('config_url');
           if (empty($_url)) {
               $_url = HTTP_SERVER;
           }

           define('HTTPS_SERVER', str_replace('///', '//', 'https://'.substr($_url, 7)));
           define('HTTPS_IMAGE', HTTPS_SERVER.'components/com_mijoshop/opencart/image/');
		}
		else {
           define('HTTPS_SERVER', HTTP_SERVER);
           define('HTTPS_IMAGE', HTTP_IMAGE);
		}
   	}

   	public function setStoreId() {
   		$store_id = JRequest::getInt('mijoshop_store_id', null);

   		if (is_null($store_id)) {
   			$store_id = self::$store_id;

   			JRequest::setVar('mijoshop_store_id', $store_id);
   		}

        self::$config->set('config_store_id', $store_id);
   	}
}