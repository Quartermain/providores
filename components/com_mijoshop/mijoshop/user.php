<?php
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

// No Permission
defined('_JEXEC') or die ('Restricted access');

jimport('joomla.user.user');
jimport('joomla.user.helper');
require_once(JPATH_ROOT.'/components/com_mijoshop/mijoshop/mijoshop.php');

class MijoShopUser {

    public function createOAccountFromJ($user, $is_login = false) {
        static $cache = array();

        if (isset($cache[$user['id']])) {
            return true;
        }

        $cache[$user['id']] = 'true';
		
		$db = MijoShop::get('db');
		if (empty($user['password']) and empty($user['password_clear']) and !empty($user['id'])) {
			$pass = $db->run("SELECT password FROM #__users WHERE id = " . $user['id'], 'loadResult');
			$user['password'] = $pass;
		}

        if (empty($user['password']) && empty($user['password_clear'])) {
            return true;
        }

        $db = MijoShop::get('db');
        $base = MijoShop::get('base');

        $name = explode(' ', $user['name']);
        $fname = $db->run($name[0], 'escape');
        $lname = $db->run(self::getLastName($name), 'escape');
        $username = $db->run($user['username'], 'escape');
        $email = $db->run($user['email'], 'escape');

        if (!empty($user['password'])) {
            $password = $db->run($this->getCleanPassword($user['password']), 'escape');
        }
        else {
            $password = $db->run(md5($user['password_clear']), 'escape');
        }

        $status = empty($user['block']) ? 1 : 0;

        $customer_id = $this->getOCustomerIdFromJUser($user['id'], $email);
        $customer_exists = $this->getOCustomerById($customer_id);

        if (!empty($customer_exists) && $is_login == true) {
            return true;
        }

        if ($base->isAdmin('joomla')) {
            $user_id = $this->getOUserIdFromJUser($user['id'], $username, $email);
            $user_exists = $this->getOUserById($user_id);

            if (!empty($user_exists) && $is_login == true) {
                return true;
            }
        }


        $_id = null;

        foreach ($user['groups'] as $group_id) {
            $_id = $this->getOCustomerGroupIdByJGroup($group_id);

            if (!empty($_id)) {
                $customer_group_id = $_id;
                break;
            }
        }

        if (empty($customer_group_id)) {
            $customer_group_id = 1;
        }

        if (!empty($customer_exists)) {
            $db->run("UPDATE #__mijoshop_customer SET firstname = '".$fname."', lastname = '".$lname."', email = '".$email."', password = '".$password."', customer_group_id = '".$customer_group_id."', status = ".$status.", approved = ".$status." WHERE customer_id = '".$customer_id."'", 'query');
        
			$user_id = $this->getOUserIdFromJUser($user['id'], $username, $email);
            $user_exists = $this->getOUserById($user_id);
            if (!empty($user_exists)) {
                $db->run("UPDATE #__mijoshop_user SET firstname = '".$fname."', lastname = '".$lname."', email = '".$email."', password = '".$password."', status = ".$status." WHERE user_id = '".$user_id."'", 'query');
            }
		}
        else {
            $db->run("INSERT INTO #__mijoshop_customer SET firstname = '".$fname."', lastname = '".$lname."', email = '".$email."', telephone = '', fax = '', password = '".$password."', newsletter = '0', customer_group_id = '".$customer_group_id."', status = '".$status."', approved = '".$status."', date_added = NOW()", 'query');
            $customer_id = $db->run('', 'getLastId');

            $db->run("INSERT IGNORE INTO #__mijoshop_juser_ocustomer_map SET juser_id = '{$user['id']}', ocustomer_id = '".$customer_id."'", 'query');

            if (!empty($user['profile']) && is_array($user['profile'])) {
                $address_1 = $address_2 = $city = $postcode = '';
                $country_id = $zone_id = 0;

                if (!empty($user['profile']['address1'])) {
                    $address_1 = $user['profile']['address1'];
                }

                if (!empty($user['profile']['address2'])) {
                    $address_2 = $user['profile']['address2'];
                }

                if (!empty($user['profile']['city'])) {
                    $city = $user['profile']['city'];
                }

                if (!empty($user['profile']['postal_code'])) {
                    $postcode = $user['profile']['postal_code'];
                }

                if (!empty($user['profile']['country'])) {
                    $country_id = $db->run("SELECT country_id FROM #__mijoshop_country WHERE name = '{$user['profile']['country']}'", 'loadResult');

                    if (!empty($user['profile']['region'])) {
                        $zone_id = $db->run("SELECT zone_id FROM #__mijoshop_zone WHERE name = '{$user['profile']['region']}' AND country_id = {$country_id}", 'loadResult');
                    }
                    else if (!empty($user['profile']['city'])) {
                        $zone_id = $db->run("SELECT zone_id FROM #__mijoshop_zone WHERE name = '{$user['profile']['city']}' AND country_id = {$country_id}", 'loadResult');
                    }
                }

                $db->run("INSERT INTO #__mijoshop_address SET customer_id = '" . (int)$customer_id . "', firstname = '".$fname."', lastname = '".$lname."', address_1 = '".$address_1."', address_2 = '".$address_2."', city = '".$city."', postcode = '".$postcode."', country_id = '".$country_id."', zone_id = '".$zone_id."'", 'query');
            }
            else {
                $db->run("INSERT INTO #__mijoshop_address SET customer_id = '" . (int)$customer_id . "', firstname = '".$fname."', lastname = '".$lname."'", 'query');
            }

            $address_id = $db->run('', 'getLastId');

            $db->run("UPDATE #__mijoshop_customer SET address_id = '" . (int)$address_id . "' WHERE customer_id = '" . (int)$customer_id . "'", 'query');

        }

        if (!$base->isAdmin('joomla')) {
            return true;
        }

        $_id = null;

        foreach ($user['groups'] as $group_id) {
            $_id = $this->getOUserGroupIdByJGroup($group_id);

            if (!empty($_id)) {
                $user_group_id = $_id;
                break;
            }
        }

        if (empty($user_group_id)) {
            return true;
        }

        if (!empty($user_exists)){
            $db->run("UPDATE #__mijoshop_user SET username = '".$username."', password = '".$password."', email = '".$email."', firstname = '".$fname."', lastname = '".$lname."', user_group_id = '".$user_group_id."' WHERE user_id = '".$user_id."'", 'query');
        }
        else {
            $db->run("INSERT INTO #__mijoshop_user SET firstname = '".$fname."', lastname = '".$lname."', email = '".$email."', username = '".$username."', password = '".$password."', user_group_id = '".$user_group_id."', status = '".$status."', date_added = NOW()", 'query');
            $user_id = $db->run('', 'getLastId');

            $db->run("INSERT IGNORE INTO #__mijoshop_juser_ouser_map SET juser_id = '{$user['id']}', ouser_id = '".$user_id."'", 'query');
        }

        return true;
    }

    public function deleteOAccountFromJ($user) {
        $db = MijoShop::get('db');

        $ouser_id = $this->getOUserIdFromJUser((int)$user['id']);
        if (!empty($ouser_id)) {
            $db->run("DELETE FROM #__mijoshop_user WHERE user_id = '".(int)$ouser_id."'", 'query');
            $db->run("DELETE FROM #__mijoshop_juser_ouser_map WHERE ouser_id = '".(int)$ouser_id."'", 'query');
        }

        $customer_id = $this->getOCustomerIdFromJUser((int)$user['id']);

        if (empty($customer_id)) {
            return true;
        }

        $db->run("DELETE FROM #__mijoshop_juser_ocustomer_map WHERE ocustomer_id = '".(int)$customer_id."'", 'query');

        $db->run("DELETE FROM #__mijoshop_customer WHERE customer_id = '".(int)$customer_id."'", 'query');
        $db->run("DELETE FROM #__mijoshop_customer_reward WHERE customer_id = '" . (int)$customer_id . "'", 'query');
        $db->run("DELETE FROM #__mijoshop_customer_transaction WHERE customer_id = '" . (int)$customer_id . "'", 'query');
        $db->run("DELETE FROM #__mijoshop_customer_ip WHERE customer_id = '" . (int)$customer_id . "'", 'query');
        $db->run("DELETE FROM #__mijoshop_address WHERE customer_id = '".(int)$customer_id."'", 'query');

        return true;
    }

    public function loginOFromJ($_class, $user = null, $is_backend = false) {
        $j_user = JFactory::getUser();

        if ($j_user->get('id') <= 0 || $_class->isLogged()) {
            return;
        }

        if (empty($user)) {
            $user = array();
            $user['id'] = $j_user->get('id');
            $user['name'] = $j_user->get('name');
            $user['username'] = $j_user->get('username');
            $user['email'] = $j_user->get('email');
            $user['password'] = $this->getCleanPassword($j_user->get('password'));
            $user['block'] = 0;

            $this->createOAccountFromJ($user, true);
        }

		if(!empty($user) and !empty($user['type']) and ($user['type'] == 'JFBConnectAuth' or $user['type'] == 'JLinkedAuthentication')){
            $user['password'] = $this->getCleanPassword($j_user->get('password'));
        }
		
        //gmail
        /*if (!empty($user) and isset($user['type']) and $user['type'] == 'GMail'){
            $user['id'] = $j_user->get('id');
            $user['name'] = $j_user->get('name');
            $user['block'] = 0;

            $this->createOAccountFromJ($user, true);
        }*/

        if ($is_backend == true) {
            $_class->login($user['username'], $user['password']);
        }
        else {
            $_class->login($user['email'], $user['password']);
        }
    }

    public function getEncryptedOPassword($var, $password, $func_suffix = 'Email') {
        $function = 'getJUserBy'.$func_suffix;
        $j_user = $this->$function($var);

        if (empty($j_user)) {
            return;
        }

        $new_user = $j_user;
        $new_user['password'] = $this->getCleanPassword($new_user['password']);
        $this->createOAccountFromJ($new_user, true);

        $parts	= explode(':', $j_user['password']);
        $crypt	= $parts[0];
        $salt	= @$parts[1];
        $new_password = JUserHelper::getCryptedPassword($password, $salt);

        if ($crypt == $new_password) {
            return $new_password;
        }
        else {
            return $password;
        }
    }

    public function logoutOFromJ() {
        unset($_SESSION);
        return;

        $customer = MijoShop::get('opencart')->get('customer');

        if (!is_object($customer)) {
            return;
        }

        $customer->logout();
    }

    public function redirectOAfterLoginFromJ($_class) {
        $redirected = JFactory::getSession()->get('mijoshop.login.redirected');
        if ($redirected == true) {
            return;
        }

        $token = md5(mt_rand());
        $_class->session->data['token'] = $token;
        $_class->request->set['token'] = $token;

        $option = JRequest::getCmd('option');
        if ($option != 'com_mijoshop') {
            return;
        }

        $link = 'index.php?option=com_mijoshop';

        $route = JRequest::getString('route');
        if (!empty($route)) {
            $link .= '&route='.$route;
        }
		
        $order_id = JRequest::getInt('order_id');
        if (!empty($order_id)) {
            $link .= '&order_id='.$order_id;
        }
		
        $customer_id = JRequest::getInt('customer_id');
        if (!empty($customer_id)) {
            $link .= '&customer_id='.$customer_id;
        }
		
        $product_id = JRequest::getInt('product_id');
        if (!empty($product_id)) {
            $link .= '&product_id='.$product_id;
        }
		
        $category_id = JRequest::getInt('category_id');
        if (!empty($category_id)) {
            $link .= '&category_id='.$category_id;
        }

        $view = JRequest::getWord('view');
        if (!empty($view)) {
            $link .= '&view='.$view;
        }

        $Itemid = JRequest::getInt('Itemid');
        if (!empty($Itemid)) {
            $link .= '&Itemid='.$Itemid;
        }

        JFactory::getSession()->set('mijoshop.login.redirected', true);

        JFactory::getApplication()->redirect($link);
    }

    //-------------------------------------------------------------------------------------------------
    //-------------------------------------------------------------------------------------------------

	public function createJUserFromO($userdata, $o_id) {
        $odb = MijoShop::get('db');

        if (empty($userdata['email'])) {
            return;
        }

		$ex_user = $this->getJUserByEmail($userdata['email']);
		
		if (is_array($ex_user) && !empty($ex_user['id'])) {
            $this->updateJUserFromO($ex_user['id'], $userdata, $o_id);

			return array($ex_user['id'], $this->encryptPassword($ex_user['password']), true);
		}

        if (!empty($userdata['username'])) {
            $ex_user = $this->getJUserByUsername($userdata['username']);

            if (is_array($ex_user) && !empty($ex_user['id'])) {
                $this->updateJUserFromO($ex_user['id'], $userdata, $o_id);

                return array($ex_user['id'], $this->encryptPassword($ex_user['password']), true);
            }
        }

        $_lang = JFactory::getLanguage();
        $_lang->load('com_users', JPATH_SITE, $_lang->getDefault(), true);

        #joomla user regisration
		$config             = JFactory::getConfig();
		$db                 = JFactory::getDbo();
		$params             = JComponentHelper::getParams('com_users');
		$j_user_group_id 	= $this->getJGroupId($userdata);
		$user               = new JUser;

		$data               	= $userdata;
		$data['name']       	= $data['firstname']. ' ' . $data['lastname'];
		$data['username']   	= $userdata['email'];
		$data['groups'] 		= array($j_user_group_id);
		$data['from_mijoshop'] 	= 'yes';
		$useractivation     	= $params->get('useractivation', 1);
		$sendpassword       	= $params->get('sendpassword', 1);
		
		// Check if the user needs to activate their account.
		$check_block_status = Mijoshop::get('base')->getConfig()->get('check_j_block_status', 0);

        if ($check_block_status and ($useractivation == 1) || ($useractivation == 2))
		{
			$data['activation'] = JApplication::getHash(JUserHelper::genRandomPassword());
			$data['block'] = 1;
		}
		else {
			$useractivation = 0;
		}

		// Bind the data.
		$user->bind($data);

		// Load the users plugin group.
		JPluginHelper::importPlugin('user');

		// Store the data.
		$user->save();

		// Compile the notification mail values.
		$data               = $user->getProperties();
		$data['fromname']   = $config->get('fromname');
		$data['mailfrom']   = $config->get('mailfrom');
		$data['sitename']   = $config->get('sitename');
		$data['siteurl']    = JUri::root();

		// Handle account activation/confirmation emails.
		if ($useractivation == 2)
		{
			// Set the link to confirm the user email.
			$uri = JUri::getInstance();
			$base = $uri->toString(array('scheme', 'user', 'pass', 'host', 'port'));
			$data['activate'] = $base . JRoute::_('index.php?option=com_users&task=registration.activate&token=' . $data['activation'], false);

			$emailSubject = JText::sprintf(
				'COM_USERS_EMAIL_ACCOUNT_DETAILS',
				$data['name'],
				$data['sitename']
			);

			if ($sendpassword)
			{
				$emailBody = JText::sprintf(
					'COM_USERS_EMAIL_REGISTERED_WITH_ADMIN_ACTIVATION_BODY',
					$data['name'],
					$data['sitename'],
					$data['activate'],
					$data['siteurl'],
					$data['username'],
					$data['password_clear']
				);
			}
			else
			{
				$emailBody = JText::sprintf(
					'COM_USERS_EMAIL_REGISTERED_WITH_ADMIN_ACTIVATION_BODY_NOPW',
					$data['name'],
					$data['sitename'],
					$data['activate'],
					$data['siteurl'],
					$data['username']
				);
			}
		}
		elseif ($useractivation == 1)
		{
			// Set the link to activate the user account.
			$uri = JUri::getInstance();
			$base = $uri->toString(array('scheme', 'user', 'pass', 'host', 'port'));
			$data['activate'] = $base . JRoute::_('index.php?option=com_users&task=registration.activate&token=' . $data['activation'], false);

			$emailSubject = JText::sprintf(
				'COM_USERS_EMAIL_ACCOUNT_DETAILS',
				$data['name'],
				$data['sitename']
			);

			if ($sendpassword)
			{
				$emailBody = JText::sprintf(
					'COM_USERS_EMAIL_REGISTERED_WITH_ACTIVATION_BODY',
					$data['name'],
					$data['sitename'],
					$data['activate'],
					$data['siteurl'],
					$data['username'],
					$data['password_clear']
				);
			}
			else
			{
				$emailBody = JText::sprintf(
					'COM_USERS_EMAIL_REGISTERED_WITH_ACTIVATION_BODY_NOPW',
					$data['name'],
					$data['sitename'],
					$data['activate'],
					$data['siteurl'],
					$data['username']
				);
			}
		}
		else if ($sendpassword)
		{
			$emailSubject = JText::sprintf(
				'COM_USERS_EMAIL_ACCOUNT_DETAILS',
				$data['name'],
				$data['sitename']
			);

			if ($sendpassword)
			{
				$emailBody = JText::sprintf(
					'COM_USERS_EMAIL_REGISTERED_BODY',
					$data['name'],
					$data['sitename'],
					$data['siteurl'],
					$data['username'],
					$data['password_clear']
				);
			}
			
		}

		// Send the registration email.
		if ($useractivation == 1 or $useractivation == 2 or $sendpassword) {
			JFactory::getMailer()->sendMail($data['mailfrom'], $data['fromname'], $data['email'], $emailSubject, $emailBody);
		}

		// Send Notification mail to administrators
		if (($useractivation < 2) && ($params->get('mail_to_admin', 0) == 1))
		{
			$emailSubject = JText::sprintf(
				'COM_USERS_EMAIL_ACCOUNT_DETAILS',
				$data['name'],
				$data['sitename']
			);

			$emailBodyAdmin = JText::sprintf(
				'COM_USERS_EMAIL_REGISTERED_NOTIFICATION_TO_ADMIN_BODY',
				$data['name'],
				$data['username'],
				$data['siteurl']
			);

			// Get all admin users
			$db->setQuery("SELECT name, email, sendEmail FROM #__users WHERE sendEmail = 1");

			try
			{
				$rows = $db->loadObjectList();
			}
			catch (RuntimeException $e){}

			// Send mail to all superadministrators id
			foreach ($rows as $row)
			{
				JFactory::getMailer()->sendMail($data['mailfrom'], $data['fromname'], $row->email, $emailSubject, $emailBodyAdmin);
			}
		}

		#end joomla user registration

        $j_user_id = $user->id;

        if (isset($userdata['user_group_id'])) {
            $odb->run("INSERT IGNORE INTO #__mijoshop_juser_ouser_map SET juser_id = '{$j_user_id}', ouser_id = '".$o_id."'", 'query');
        }
        else {
            $odb->run("INSERT IGNORE INTO #__mijoshop_juser_ocustomer_map SET juser_id = '{$j_user_id}', ocustomer_id = '".$o_id."'", 'query');
        }

        return array($j_user_id, self::encryptPassword($userdata['password']), false);

        /*$post = array();
        $post['name'] = $userdata['firstname'] . " " . $userdata['lastname'];
        if (!empty($userdata['username'])) {
            $post['username'] = $userdata['username'];
        }
        else {
            $post['username'] = $userdata['email'];
        }
        $post['email'] = $userdata['email'];
        $post['password'] = JUserHelper::getCryptedPassword($db->run($userdata['password'], 'escape'));
        $post['block'] = $this->getBlockStatus($userdata);

        $j_user_group_id = $this->getJGroupId($userdata);

        $post['groups'] = array($j_user_group_id);

        $post['from_mijoshop'] = 'yes';

        $j_user = new JUser();
        $j_user->setProperties($post);
        $j_user->save();*/

	}

    public function updateJUserFromO($j_user_id, $data, $o_id = 0) {
        $db = MijoShop::get('db');
        $j_user = new JUser((int)$j_user_id);

        $post = array();

        $post['name'] = $data['firstname'] . " " . $data['lastname'];
        $post['email'] = $data['email'];
        $post['block'] = $this->getBlockStatus($data);
        $post['from_mijoshop'] = 'yes';

        if (!empty($data['username'])) {
            $post['username'] = $data['username'];
        }
        else {
            $post['username'] = $j_user->get('username');
        }

        if (!empty($data['password'])) {
            $post['password'] = JUserHelper::getCryptedPassword(MijoShop::get('db')->run($data['password'], 'escape'));
        }

        if (MijoShop::get('base')->isAdmin('mijoshop') || MijoShop::get('base')->isAdmin('joomla')) {
            $j_user_group_id = $this->getJGroupId($data);

            $u_groups = JUserHelper::getUserGroups($j_user_id);

            if (!isset($u_groups[$j_user_group_id])) {
                $u_groups[$j_user_group_id] = $j_user_group_id;
            }

            $post['groups'] = $u_groups;
        }

        $j_user->setProperties($post);
        $j_user->save();

        if (isset($data['user_group_id'])) {
            $db->run("INSERT IGNORE INTO #__mijoshop_juser_ouser_map SET juser_id = '{$j_user_id}', ouser_id = '".$o_id."'", 'query');
        }
        else {
            $db->run("INSERT IGNORE INTO #__mijoshop_juser_ocustomer_map SET juser_id = '{$j_user_id}', ocustomer_id = '".$o_id."'", 'query');
        }
    }

    public function updateJUserPasswordFromO($email, $password) {
        $db = MijoShop::get('db');
        $encrypted_password = $this->encryptPassword($password);

        $db->run("UPDATE #__users SET password = '".$encrypted_password."' WHERE email = '".$db->run($email, 'escape')."'", 'query');

        $user = $this->getOUserByEmail($email);
        if (!empty($user)) {
            $db->run("UPDATE #__mijoshop_user SET password = '".$db->run(md5($password), 'escape')."' WHERE email = '".$db->run($email, 'escape')."'", 'query');
        }
    }

    public function approveJUserFromO($cust_id) {
        $user_id = $this->getJUserIdFromOCustomer($cust_id);

        if (empty($user_id)) {
            return;
        }

        $j_user = new JUser($user_id);
        $j_user->set('block', '0');
        $j_user->set('activation', '');
        $j_user->set('from_mijoshop', 'yes');
        $j_user->save();
    }

	public function deleteJUserFromO($id, $is_ouser = false) {
		$delete_juser = true;
		
        if ($is_ouser == true) {
            $juser_id = $this->getJUserIdFromOUser($id);
        }
        else {
            $juser_id = $this->getJUserIdFromOCustomer($id);
        }

        if (empty($juser_id)) {
            return;
        }
		
		if ($is_ouser == true) {
			MijoShop::get('db')->run("DELETE FROM #__mijoshop_juser_ouser_map WHERE juser_id = {$juser_id}", 'query');

            $ocustomer_id = $this->getOCustomerIdFromJUser($juser_id);
            if (!empty($ocustomer_id)) {
                $delete_juser = false;
            }
		}
		else {
			MijoShop::get('db')->run("DELETE FROM #__mijoshop_juser_ocustomer_map WHERE juser_id = {$juser_id}", 'query');
			
			$ouser_id = $this->getOUserIdFromJUser($juser_id);
			if (!empty($ouser_id)) {
                $delete_juser = false;
            }
		}
		
		if ($delete_juser == true) {
			$j_user = new JUser($juser_id);
			$j_user->set('from_mijoshop', 'yes');
			$j_user->delete();
		}
	}
	
	public function loginJFromO($var, $password, $func_suffix = 'Email') {
        $db = MijoShop::get('db');
		$app = JFactory::getApplication();

		$user_id = JFactory::getUser()->get('id');
		if (!empty($user_id)) {
			return;
		}

        $function = 'getJUserBy'.$func_suffix;
        $j_user = $this->$function($var);

        if (empty($j_user) and $app->isSite()) {
			$data = $this->getOCustomerByEmail($var);
			$data['password'] = $password;
			$this->createJUserFromO($data, $data['customer_id']);
			
			$j_user = $db->run("SELECT * FROM #__users WHERE email = '".$db->run($data['email'], 'escape')."'");
        }
		
		if (empty($j_user)) {
			return;
		}

        if (!MijoShop::get('base')->isAdmin('joomla') && !MijoShop::get('base')->isAdmin('mijoshop')) {
            $this->getOCustomerIdFromJUser($j_user['id'], $j_user['email']);
        }
        else {
            $this->getOUserIdFromJUser($j_user['id'], $j_user['username'], $j_user['email']);
        }
		
		$options = array();
        $options['return'] = '';
		$options['remember'] = false;

        $credentials = array();
		$credentials['username'] = $db->run($j_user['username'], 'escape');
		$credentials['password'] = $db->run($password, 'escape');
		
		$app->login($credentials, $options);
	}
	
	public function logoutJFromO() {
		$user_id = JFactory::getUser()->get('id');

		if (empty($user_id)) {
			return;
		}
		
		JFactory::getApplication()->logout();
	}

    //-------------------------------------------------------------------------------------------------
    //-------------------------------------------------------------------------------------------------
    //-------------------------------------------------------------------------------------------------
    //-------------------------------------------------------------------------------------------------

    public function getOCustomerById($id) {
        $id = (int)$id;
        $db = MijoShop::get('db');

        static $cache;

        if (!isset($cache[$id])) {
            $cache[$id] = $db->run("SELECT * FROM #__mijoshop_customer WHERE customer_id = {$id}");
        }

        return $cache[$id];
    }

    public function getOCustomerByEmail($email) {
        $db = MijoShop::get('db');

        static $cache;

        if (!isset($cache[$email])) {
            $_email = $db->run($email, 'Quote');

            $cache[$email] = $db->run("SELECT * FROM #__mijoshop_customer WHERE email = {$_email}");
        }

        return $cache[$email];
    }

    public function getOCustomerIdFromJUser($juser_id, $email = '') {
        $juser_id = (int)$juser_id;
        $db = MijoShop::get('db');

        static $cache;

        if (!isset($cache[$juser_id])) {
            $cache[$juser_id] = MijoShop::get('db')->run("SELECT ocustomer_id FROM #__mijoshop_juser_ocustomer_map WHERE juser_id = {$juser_id}", 'loadResult');

            if (empty($cache[$juser_id])) {
                if (!empty($email)) {
                    $o_customer = $this->getOCustomerByEmail($email);

                    if (!empty($o_customer['customer_id'])) {
                        $db->run("INSERT IGNORE INTO #__mijoshop_juser_ocustomer_map SET juser_id = '{$juser_id}', ocustomer_id = '".$o_customer['customer_id']."'", 'query');

                        $cache[$juser_id] = $o_customer['customer_id'];
                    }
                }
            }
        }

        return $cache[$juser_id];
    }

    public function getOCustomerGroupIdByJGroup($jgroup_id) {
        $jgroup_id = (int)$jgroup_id;
        $db = MijoShop::get('db');

        static $cache;

        if (!isset($cache[$jgroup_id])) {
            $cache[$jgroup_id] = $db->run("SELECT cgroup_id FROM #__mijoshop_jgroup_cgroup_map WHERE jgroup_id = {$jgroup_id}", 'loadResult');
        }

        return $cache[$jgroup_id];
    }

    public function getOUserIdFromJUser($juser_id, $username = '', $email = '') {
        $juser_id = (int)$juser_id;
        $db = MijoShop::get('db');

        static $cache;

        if (!isset($cache[$juser_id])) {
            $cache[$juser_id] = $db->run("SELECT ouser_id FROM #__mijoshop_juser_ouser_map WHERE juser_id = {$juser_id}", 'loadResult');

            if (empty($cache[$juser_id])) {
                if (!empty($email)) {
                    $o_user = $this->getOUserByEmail($email);

                    if (!empty($o_user['user_id'])) {
                        $db->run("INSERT IGNORE INTO #__mijoshop_juser_ouser_map SET juser_id = '{$juser_id}', ouser_id = '".$o_user['user_id']."'", 'query');

                        $cache[$juser_id] = $o_user['id'];
                    }
                }

                if (empty($cache[$juser_id]) && !empty($username)) {
                    $o_user = $this->getOUserByUsername($username);

                    if (!empty($o_user['user_id'])) {
                        $db->run("INSERT IGNORE INTO #__mijoshop_juser_ouser_map SET juser_id = '{$juser_id}', ouser_id = '".$o_user['user_id']."'", 'query');

                        $cache[$juser_id] = $o_user['id'];
                    }
                }
            }
        }

        return $cache[$juser_id];
    }

    public function getOUserById($id) {
        $id = (int)$id;
        $db = MijoShop::get('db');

        static $cache;

        if (!isset($cache[$id])) {
            $cache[$id] = $db->run("SELECT * FROM #__mijoshop_user WHERE user_id = {$id}");
        }

        return $cache[$id];
    }

    public function getOUserByEmail($email) {
        $db = MijoShop::get('db');

        static $cache;

        if (!isset($cache[$email])) {
            $_email = $db->run($email, 'Quote');

            $cache[$email] = $db->run("SELECT * FROM #__mijoshop_user WHERE email = {$_email}");
        }

        return $cache[$email];
    }

    public function getOUserByUsername($username) {
        $db = MijoShop::get('db');

        static $cache;

        if (!isset($cache[$username])) {
            $_username = $db->run($username, 'Quote');

            $cache[$username] = $db->run("SELECT * FROM #__mijoshop_user WHERE username = {$_username}");
        }

        return $cache[$username];
    }

    public function getOUserGroupIdByJGroup($jgroup_id) {
        static $cache;

        $jgroup_id = (int)$jgroup_id;

        if (!isset($cache[$jgroup_id])) {
            $cache[$jgroup_id] = MijoShop::get('db')->run("SELECT ugroup_id FROM #__mijoshop_jgroup_ugroup_map WHERE jgroup_id = {$jgroup_id}", 'loadResult');
        }

        return $cache[$jgroup_id];
    }

    //-------------------------------------------------------------------------------------------------
    //-------------------------------------------------------------------------------------------------

    public function getJUserByEmail($email) {
        $db = MijoShop::get('db');

        static $cache;

        if (!isset($cache[$email])) {
            $cache[$email] = $db->run("SELECT * FROM #__users WHERE email = '".$db->run($email, 'escape')."'");
        }

        return $cache[$email];
    }

    public function getJUserByUsername($username) {
        $db = MijoShop::get('db');

        static $cache;

        if (!isset($cache[$username])) {
            $cache[$username] = $db->run("SELECT * FROM #__users WHERE username = '".$db->run($username, 'escape')."'");
        }

        return $cache[$username];
    }

    public function getJUserIdFromOCustomer($customer_id, $email = '') {
        $customer_id = (int)$customer_id;
        $db = MijoShop::get('db');

        static $cache;

        if (!isset($cache[$customer_id])) {
            $cache[$customer_id] = $db->run("SELECT juser_id FROM #__mijoshop_juser_ocustomer_map WHERE ocustomer_id = {$customer_id}", 'loadResult');

            if (empty($cache[$customer_id])) {
                if (!empty($email)) {
                    $j_user = $this->getJUserByEmail($email);

                    if (!empty($j_user['id'])) {
                        $db->run("INSERT IGNORE INTO #__mijoshop_juser_ocustomer_map SET juser_id = '{$j_user['id']}', ocustomer_id = '".$customer_id."'", 'query');

                        $cache[$customer_id] = $j_user['id'];
                    }
                }
            }
        }

        return $cache[$customer_id];
    }

    public function getJUserIdFromOUser($ouser_id, $username = '', $email = '') {
        $ouser_id = (int)$ouser_id;
        $db = MijoShop::get('db');

        static $cache;

        if (!isset($cache[$ouser_id])) {
            $cache[$ouser_id] = $db->run("SELECT juser_id FROM #__mijoshop_juser_ouser_map WHERE ouser_id = {$ouser_id}", 'loadResult');

            if (empty($cache[$ouser_id])) {
                if (!empty($email)) {
                    $j_user = $this->getJUserByEmail($email);
                    
                    if (!empty($j_user['id'])) {
                        $db->run("INSERT IGNORE INTO #__mijoshop_juser_ouser_map SET juser_id = '{$j_user['id']}', ouser_id = '".$ouser_id."'", 'query');

                        $cache[$ouser_id] = $j_user['id'];
                    }
                }
                
                if (empty($cache[$ouser_id]) && !empty($username)) {
                    $j_user = $this->getJUserByUsername($username);

                    if (!empty($j_user['id'])) {
                        $db->run("INSERT IGNORE INTO #__mijoshop_juser_ouser_map SET juser_id = '{$j_user['id']}', ouser_id = '".$ouser_id."'", 'query');

                        $cache[$ouser_id] = $j_user['id'];
                    }
                }
            }
        }

        return $cache[$ouser_id];
    }

	public function getJGroupId($data) {
        if (isset($data['user_group_id'])) {
            $j_user_group_id = $this->getJGroupIdOfUGroup((int)$data['user_group_id']);
        }
        else {
            $o_customer_group_id = (int)MijoShop::get('opencart')->get('config')->get('config_customer_group_id');

            if (!empty($data['customer_group_id'])) {
                $o_customer_group_id = (int)$data['customer_group_id'];
            }

            $j_user_group_id = $this->getJGroupIdOfCGroup((int)$o_customer_group_id);
        }

        return $j_user_group_id;
    }

    public function getJGroupIdOfCGroup($customer_group_id) {
        static $cache;

        $customer_group_id = (int)$customer_group_id;

        if (!isset($cache[$customer_group_id])) {
            $cache[$customer_group_id] = MijoShop::get('db')->run("SELECT jgroup_id FROM #__mijoshop_jgroup_cgroup_map WHERE cgroup_id = {$customer_group_id}", 'loadResult');
        }

        if (empty($cache[$customer_group_id])) {
            $cache[$customer_group_id] = 2;
        }

        return $cache[$customer_group_id];
    }

    public function getJGroupIdOfUGroup($user_group_id) {
        static $cache;

        $user_group_id = (int)$user_group_id;

        if (!isset($cache[$user_group_id])) {
            $cache[$user_group_id] = MijoShop::get('db')->run("SELECT jgroup_id FROM #__mijoshop_jgroup_ugroup_map WHERE ugroup_id = {$user_group_id}", 'loadResult');
        }

        if (empty($cache[$user_group_id])) {
            $cache[$user_group_id] = 6;
        }

        return $cache[$user_group_id];
    }

    public function getJoomlaUserGroups() {
        return JHtml::_('user.groups', true);
    }

    //-------------------------------------------------------------------------------------------------
    //-------------------------------------------------------------------------------------------------

    public function encryptPassword($password) {
        $salt = JUserHelper::genRandomPassword(32);
        $crypt = JUserHelper::getCryptedPassword(MijoShop::get('db')->run($password, 'escape'), $salt);
        $encrypted_password = $crypt.":".$salt;

        return $encrypted_password;
    }

    public function getCleanPassword($password) {
        if (strpos($password, ':')) {
            $a = explode(':', $password);
            $password = $a[0];
        }

        return $password;
    }

    public function getBlockStatus($data) {
        $block = '1';

        $oc_config =  MijoShop::get('opencart')->get('config');
       
        if (isset($data['status'])) {
            if ($data['status'] == '1') {
                $block = '0';
            }
        }
        else {
            $db = MijoShop::get('db');
            $approval = $db->run('SELECT approval FROM #__mijoshop_customer_group WHERE customer_group_id = '.$oc_config->get('config_customer_group_id'), 'loadResult');
            
            if (!$approval) {
                $block = '0';
            }
        }

        return $block;
    }

    public function getLastName($name) {
        $lname = '';

        if (!is_array($name)) {
            $name = explode(' ', $name);
        }

        if (count($name) > 1) {
            for($i = 1; $i <= count($name); $i++){
                if (!isset($name[$i])) {
                    continue;
                }

                if ($i == 1) {
                    $lname = $name[$i];
                }
                else {
                    $lname = $lname." ".$name[$i];
                }
            }
        }

        return $lname;
    }

    public function addJUsersToO() {
        MijoShop::get('install')->createUserTables();
    }

    public function synchronizeAccountsManually() {
        $db = MijoShop::get('db');

		$users = $db->run('SELECT id, name, username, email, password, block FROM #__users', 'loadAssocList');

		if (!empty($users)) {
			foreach ($users as $user) {
				$this->createOAccountFromJ($user);
			}
		}

		MijoShop::get('base')->setConfig('account_sync_done', '1');

        JFactory::getApplication()->redirect('index.php?option=com_mijoshop&ctrl=syncdone', JText::_('COM_MIJOSHOP_ACCOUNT_SYNC_DONE'));
    }
}