<?php
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

// No Permission
defined('_JEXEC') or die ('Restricted access');

jimport('joomla.plugin.plugin');

class plgUserMijoshop extends JPlugin {
	
	public function __construct(& $subject, $config) {
		parent::__construct($subject, $config);
		
		require_once(JPATH_ROOT.'/components/com_mijoshop/mijoshop/mijoshop.php');
	}

	public function onLoginUser($user, $options = array()) {
		self::onUserLogin($user, $options);
	}

	public function onLogoutUser($user, $options = array()) {
		self::onUserLogout($user, $options);
	}

	public function onAfterStoreUser($user, $isnew, $succes, $msg) {
		self::onUserAfterSave($user, $isnew, $succes, $msg);


	}

	public function onAfterDeleteUser($user, $succes, $msg) {
		self::onUserAfterDelete($user, $succes, $msg);
	}
	
	public function onUserLogin($user, $options = array()) {
        $opencart = MijoShop::get('opencart');
        $mainframe = JFactory::getApplication();

        if ($mainframe->isAdmin()){
            MijoShop::get('user')->loginOFromJ($opencart->get('user'), $user, true);
        }
        else {
            MijoShop::get('user')->loginOFromJ($opencart->get('customer'), $user, false);

            $Itemid = MijoShop::get('router')->getItemid('admin', 0);
            if (empty($Itemid)) {
                return true;
            }

            $user_class = $opencart->get('user');

            if (empty($user_class)) {
                $registry = $opencart->get('registry');

                require_once($opencart->get('vqmod')->modCheck(DIR_SYSTEM . 'library/user.php'));

                $user_class = new User($registry);
                $registry->set('user', $user_class);
            }

            MijoShop::get('user')->loginOFromJ($user_class, $user, true);

            $token = md5(mt_rand());
            $user_class->session->data['token'] = $token;
            $user_class->request->set['token'] = $token;
        }
	}

	public function onUserAfterSave($user, $isnew, $succes, $msg){
        if (!$succes) {
            return false;
        }

        $newsletter = JRequest::getInt('newsletter', 0);
        if ($newsletter) {
            $this->_addUserToAcymailing($user);
        }

        if (!empty($user['from_mijoshop'])) {
            return true;
        }

        $ret = MijoShop::get('user')->createOAccountFromJ($user);

        return $ret;
    }
	
	public function onUserAfterDelete($user, $succes, $msg){
		if (!$succes) {
			return false;
		}

        if (!empty($user['from_mijoshop'])) {
            return true;
        }
		
		$ret = MijoShop::get('user')->deleteOAccountFromJ($user);
		
		return $ret;
	}

    private function _addUserToAcymailing($user) {
        $subid = MijoShop::get('db')->run("SELECT subid FROM #__acymailing_subscriber WHERE userid = {$user['id']}", 'loadResult');
        $config = MijoShop::get('base')->getConfig();
        $route = JRequest::getVar('route');

        if (!empty($route) and $route == 'account/register') {
            $listid = $config->get('acymailling_register');
        }

        if (!empty($route) and $route == 'checkout/register/validate') {
            $listid = $config->get('acymailling_checkout');
        }

        if (empty($listid) or empty($subid)) {
            return;
        }

        $date = JFactory::getDate();

        MijoShop::get('db')->run("INSERT INTO #__acymailing_listsub SET listid = {$listid}, subid = {$subid}, subdate = {$date->toUnix()}, status = 1");
    }
}