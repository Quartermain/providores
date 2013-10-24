<?php
/*
* @package		MijoShop
* @copyright	2009-2013 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

class ControllerCommonUpgrade extends Controller {

    public function index() {
        $this->language->load('common/upgrade');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->data['heading_title'] = $this->language->get('heading_title');
        $this->data['text_auto'] = $this->language->get('text_auto');
        $this->data['text_manual'] = $this->language->get('text_manual');
        $this->data['text_upload_upgrade'] = $this->language->get('text_upload_upgrade');
        $this->data['text_upload_pkg'] = $this->language->get('text_upload_pkg');
        $this->data['text_error'] = '';
        $this->data['text_success'] = '';

        if (!$this->validate('access')) {
            exit();
        }

        if (isset($this->session->data['msg']) and ($this->session->data['msg'] !== $this->language->get('text_success'))) {
            $this->data['text_error'] = $this->session->data['msg'];
            unset($this->session->data['msg']);
        } else if(isset($this->session->data['msg'])) {
            $this->data['text_success'] = $this->session->data['msg'];;
            unset($this->session->data['msg']);
        }

        $pid = Mijoshop::get('base')->getConfig()->get('pid');
        if (!empty($pid)) {
            $this->data['text_auto_btn'] = $this->language->get('text_auto_btn');
        } else {
            $this->data['error_personal_id'] = $this->language->get('error_personal_id');
        }

        $this->data['error_personal_id'] = $this->language->get('error_personal_id');

        $this->data['token'] = $this->session->data['token'];

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->url->link('common/upgrade', 'token=' . $this->session->data['token'] , 'SSL'),
            'separator' => ' :: '
        );

        $this->data['action'] = $this->url->link('common/upgrade/upgrade', 'token=' . $this->session->data['token'], 'SSL');

        $this->template = 'common/upgrade.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }
	
    public function upgrade() {
        $this->language->load('common/upgrade');

        if (!$this->validate('modify')) {
            exit();
        }

        $this->load->model('common/upgrade');

        // Upgrade
        if (!$this->model_common_upgrade->upgrade()) {
            $this->session->data['msg'] = $this->language->get('text_error');
        }
        else {
            $this->session->data['msg'] = $this->language->get('text_success');
        }

        // Return
        $this->redirect($this->url->link('common/upgrade', 'token=' . $this->session->data['token'] , 'SSL'));
    }

    protected function validate($type) {
        if (!$this->user->hasPermission($type, 'common/upgrade')) {
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