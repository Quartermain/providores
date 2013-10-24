<?php
/*
* @package		MijoShop
* @copyright	2009-2013 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

class ControllerCommonSupport extends Controller {

    public function index() {
        $this->language->load('common/support');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->data['heading_title'] = $this->language->get('heading_title');

        if (!$this->validate('access')) {
            exit();
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->url->link('common/support', '' , 'SSL'),
            'separator' => ' :: '
        );

        $this->template = 'common/support.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    protected function validate($type) {
        if (!$this->user->hasPermission($type, 'common/support')) {
            $error['warning'] = $this->language->get('error_permission');
            echo json_encode($error);
        }

        if (empty($error['warning'])) {
            return true;
        } else {
            return false;
        }
    }
}
?>