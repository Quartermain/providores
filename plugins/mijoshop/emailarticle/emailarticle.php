<?php
/*
* @package		MijoShop
* @copyright	2009-2013 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

// No Permission
defined('_JEXEC') or die ('Restricted access');

jimport('joomla.plugin.plugin');

class plgMijoshopEmailarticle extends JPlugin {

	public function __construct(&$subject, $config) {
		parent::__construct($subject, $config);
		
		$file = JPATH_SITE.'/components/com_mijoshop/mijoshop/mijoshop.php';
		
		if (file_exists($file)) {
			require_once($file);
		}
	}
	
	public function getViewHtml($integration) {
        if (!isset($integration['emailarticle_add'])) {
            $integration['emailarticle_add'] = "";
        }

		$html  = '<fieldset style="width:47%; float: left; margin: 5px;">';
        $html .=    '<legend>Email Article</legend>';
        $html .=        '<table class="form">';
        $html .=            '<tr>';
        $html .=                '<td><strong>Article</strong></br> </br> 5=8:2,3=4:7 </br>(orderstatusid=articleid:articleid)</td>';
        $html .=                '<td><textarea name="content[emailarticle][add]" style="width:350px; height:60px">'. $integration['emailarticle_add'] .'</textarea></td>';
        $html .=            '</tr>';
        $html .=        '</table>';
        $html .=    '</fieldset>';
		
		return $html;
	}
	
    public function onMijoshopBeforeOrderStatusUpdate($data, $order_id, $order_status_id, $notify) {
        $results = $this->_sendEmail($data, $order_id, $order_status_id, $notify);
    }

    public function onMijoshopBeforeOrderConfirm($data, &$order_id, &$order_status_id, &$notify) {
        $results = $this->_sendEmail($data, $order_id, $order_status_id, $notify);
    }

    private function _sendEmail($data, $order_id, $order_status_id, $notify){
        $db = JFactory::getDBO();

        $db->setQuery("SELECT * FROM #__mijoshop_order_product WHERE order_id = " . $order_id);
        $order_products = $db->loadAssocList();
		
		if (empty($order_products)) {
			return;
		}

        foreach ($order_products as $order_product) {
            $order_product_intg = MijoShop::get('base')->getIntegrations($order_product['product_id']);
			
            if (isset($order_product_intg->emailarticle)) {
                $tmp = $order_product_intg->emailarticle;

                if (isset($tmp->add) and isset($tmp->add->$order_status_id)){
                    $article_ids = $tmp->add->$order_status_id;
                    
					$this->_send($article_ids);
                }
            }
        }
    }
	
	private function _send($order_id, $article_ids) {
		jimport('joomla.mail.mail');
		
		$customer_info = MijoShop::get('db')->run("SELECT customer_id, email FROM #__mijoshop_order WHERE order_id = {$order_id}", 'loadRow');

        $user_id = MijoShop::get('user')->getJUserIdFromOCustomer($customer_info[0], $customer_info[1]);
		
        if (empty($user_id)) {
            return;
        }
		
		$user = JFactory::getUser($user_id);
		
		foreach ($article_ids as $article_id) {
			$db->setQuery('SELECT * FROM #__content WHERE id = '.(int)$article_id);
			$article = $db->loadObject();
			if (empty($article)) {
				continue;
			}

			// Parse the text a bit
			$article_text = $article->introtext;
			$article_text = str_replace('{name}', $user->name, $article_text);
			$article_text = str_replace('{email}', $user->email, $article_text);

			// Construct other variables
			$app = JFactory::getApplication();
			$sender = array(
				$app->getCfg('mailfrom'),
				$app->getCfg('fromname'),
			);

			// Send the mail
			
			$mail = JFactory::getMailer();
			$mail->setSender($sender);
			$mail->addRecipient($user->email);
			$mail->addCC($app->getCfg('mailfrom'));
			$mail->setBody($article_text);
			$mail->setSubject($article->title);
			$mail->isHTML(true);
			$mail->send();
		}
	}
}