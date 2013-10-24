

<?php
/*
* @package		MijoShop
* @copyright	2009-2013 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

class ControllerCommonEdit extends Controller {

    public function changeStatus() {
        $type   = JRequest::getCmd('type');
        $select = JRequest::getVar('selected', array(), 'get', 'array');
        $status = JRequest::getInt('status', null);


        if ((count($select) == 0) or is_null($status) or !$this->validate($type)) {
            exit();
        }

        $this->load->model('common/edit');

        switch($type) {
            case 'review':
            case 'product':
            case 'category':
            case 'information':
                $this->language->load('catalog/'.$type);
                $this->model_common_edit->changeStatus($type, $select, (int)$status);
                break;
            case 'payment':
            case 'feed':
            case 'shipping':
            case 'total':
                $this->language->load('extension/'.$type);
                $this->model_common_edit->changeStatus($type, $select, (int)$status, true);
                break;
            default:
                break;
        }

        $this->session->data['success'] = $this->language->get('text_success');
        echo 0;
        exit();
    }

    public function fixLanguage(){
        $json           = array();
        $json['error']  = '';
        $json['success']= '';
        $this->load->model('common/edit');
        $languages    = $this->model_common_edit->getLanguages();
        $this->language->load('setting/setting');

        if(empty($languages)){
            $json['error'] .= $this->language->get('error_language_no_in_db').'  ';
            echo json_encode($json);
            exit();
        }

        foreach($languages as $oc_lang){
            $oc_lang_code = $this->_getLangCode($oc_lang['locale']);

            if(empty($oc_lang_code)){
                $json['error'] .= $oc_lang['name'] . $this->language->get('error_language_wrong_language_code').'  ';
                continue;
            }

            jimport('joomla.filesystem.file');
            jimport('joomla.filesystem.folder');

            $j_lang_site_path  = JPATH_SITE . '/language/'. $oc_lang_code;
            $j_lang_admin_path = JPATH_SITE . '/administrator/language/'. $oc_lang_code;
            $oc_lang_site_path  = JPATH_MIJOSHOP_OC . '/catalog/language/'. $oc_lang['directory'];
            $oc_lang_admin_path = JPATH_MIJOSHOP_OC . '/admin/language/'. $oc_lang['directory'];

            $check_folder_site = $this->_checkLangDirectories($oc_lang_site_path, $j_lang_site_path);
            $check_folder_admin = $this->_checkLangDirectories($oc_lang_admin_path, $j_lang_admin_path);

            if(!$check_folder_site or !$check_folder_admin){
                $json['error'] .= $oc_lang['name'] . $this->language->get('error_language_no_directory').'  ';
                continue;
            }

            $this->_fix($oc_lang_site_path, $j_lang_site_path, $oc_lang_code);
            $this->_fix($oc_lang_admin_path, $j_lang_admin_path, $oc_lang_code);

            $json['success'] .=  $oc_lang['name'] . $this->language->get('success_language_updated').'  ';
        }

        $this->response->setOutput(json_encode($json));
    }

    public function fixLanguageIds(){
        $this->load->model('common/edit');
        $oc_langs   = $this->model_common_edit->getLanguages();
        $j_langs    = $this->model_common_edit->getJoomlaLangs();

        try{
            foreach($oc_langs as $key => $oc_lang) {
                if(isset($j_langs[$key])){
                    $this->_updateLangId($oc_lang['language_id'], $j_langs[$key]['lang_id']);
                    $this->model_common_edit->updateOcLang($oc_lang['language_id'], $j_langs[$key]['lang_id']);
                }
            }

            $json['success'] = "Ids was fixed";
        }
        catch ( Exception $e)
        {
            $json['error'] = $e->getMessage ();
        }

        $this->response->setOutput(json_encode($json));
    }

    public function copyLang(){
        $from	= JRequest::getInt('from', 0);
        $to 	= JRequest::getInt('to', 0);

        if (!empty($from) and !empty($to)) {
            // Attribute
            $this->load->model('common/edit');
            $this->model_common_edit->copyLang($from, $to);
        }
    }

    public function insertPID() {
        $pid = JRequest::getString('pid');

        if (empty($pid)) {
            JError::raiseWarning('100', JText::sprintf('COM_MIJOSHOP_PID_INSERT_ERROR'));
            $this->redirect($this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'));
        }

        MijoShop::get('base')->setConfig('pid',$pid);
        $this->redirect($this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'));
    }

    /** changeStatus **/
    private function validate($type) {
        if($type = 'extension'){
            return true;
        }

        if (!$this->user->hasPermission('modify', 'catalog/'.$type)) {
            $error['warning'] = $this->language->get('error_permission');
            echo json_encode($error);
        }

        if (empty($error['warning'])) {
            return true;
        } else {
            return false;
        }
    }
    /**end changeStatus **/

    /** language fix **/
    private function _fix($oc_lang_path, $j_lang_path, $oc_lang_code){
        $oc_files = JFolder::files($oc_lang_path, '.php', true, true);
        $vq_files = $this->_getVqFiles($oc_lang_path);

        $j_file = $j_lang_path.'/'.$oc_lang_code.'.com_mijoshop.ini';
        $j_file_content = $this->_iniToArray($j_file);

        $oc_array = $this->_checkNewStrings($oc_files, $j_file_content);
        $ini_array = $this->_checkNewStrings($vq_files, $oc_array, true);

        $ini_str = $this->_arrayToIni($ini_array);

        if(JFile::exists($j_file)) {
            JFile::delete($j_file);
            JFile::write($j_file, $ini_str);
        }
    }

    private function _checkNewStrings($files, $j_file_content, $vq = false){
        foreach($files as $_file) {
            if(JFile::exists($_file)) {
                unset($_);
                require($_file);

                if(isset($_)) {
                    foreach( $_ as $key => $text ){
                        $j_key = $this->_getJoomlaKey($_file, $key, $vq);
						if(!isset($j_file_content[$j_key])){
							$text = str_replace('"', '"_QQ_"', $text);
							$text = str_replace("\n", "\\n", $text);
							$text = str_replace("\r", "\\r", $text);
							$j_file_content[$j_key] = $text;
						}
                    }
                }
            }
        }

        return $j_file_content;
    }

    private function _getVqFiles($path){
        $str_path = strstr($path, 'opencart');
        $str_path = str_replace('opencart/', '', $str_path);
        $str_path = str_replace('/', '_', $str_path);

        $files = JFolder::files(JPATH_MIJOSHOP_OC .'/vqmod/vqcache', $str_path.'(.*?).php', true, true);

        return $files;
    }

    private function _getJoomlaKey($path, $key, $vq = false){
        if(!$vq) {
            $str_path = strstr($path, 'language');
            $str_path = str_replace('.php', '', $str_path);
            $str_path = str_replace('/', '\\', $str_path);
            $path_array = explode('\\', $str_path);
            $count = count($path_array);
            unset($path_array[0]);
            unset($path_array[1]);
            if($count == 3) {
                unset($path_array[2]);
            }
        }
        else{
            $str_path = strstr($path, 'vq2-');
            $str_path = str_replace('.php', '', $str_path);
            $str_path = str_replace('vq2-', '', $str_path);
            $path_array =  explode('_', $str_path);
            unset($path_array[0]);
            unset($path_array[1]);
            unset($path_array[2]);
        }

        if( count($path_array) > 0 ){
            $j_key ='COM_MIJOSHOP_'. strtoupper(implode('_', $path_array)) .'_'. strtoupper($key);
        }
        else{
            $j_key ='COM_MIJOSHOP_'. strtoupper($key);
        }

        return $j_key;
    }

    private function _getLangCode($locale){
        if(empty($locale)) {
            return false;
        }

        $locale = explode('.', $locale );
        $lang_code = str_replace('_', '-', $locale[0]);
        if($lang_code == 'en-US') {
            $lang_code = 'en-GB';
        }

        return $lang_code;
    }

    private function _checkLangDirectories($od, $jd){
        $check = true;
        if(JFolder::exists($jd) == false){
            $check =false;
        }

        if(JFolder::exists($od) == false){
            $check =false;
        }

        return $check;
    }

    private function _arrayToIni($array){
        $string = '';

        foreach ($array as $key => $elem) {
            $string .= $key."=\"".$elem."\"\n";
        }

        return $string;
    }

    private function _iniToArray($filename)
    {
        if (!is_file($filename))
        {
            return array();
        }

        $contents = file_get_contents($filename);
        $contents = str_replace('_QQ_', '"\""', $contents);
        $strings  = @parse_ini_string($contents);
        
        if ($strings === false)
        {
            return array();
        }
		
		foreach($strings as $key => $string){
            $strings[$key] = str_replace('"', '"_QQ_"', $string);
        }

        return $strings;
    }
    /** end language fix **/

    /** fix id **/
    private function _updateLangId($old_id, $new_id) {
        $results = array();
        $this->load->model('common/edit');
        $results = $this->model_common_edit->updateLangId($old_id, $new_id);
    }
    /** end fix id **/
	

}