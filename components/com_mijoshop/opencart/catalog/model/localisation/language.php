<?php
/*
* @package		MijoShop
* @copyright	2009-2013 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
* @license		GNU/GPL based on AceShop www.joomace.net
*/

// No Permission
defined('_JEXEC') or die('Restricted access');

class ModelLocalisationLanguage extends Model {
    public function getLanguage($language_id) {
        $language_data = MijoShop::get('db')->getLanguage($language_id);

        return $language_data;
   	}

   	public function getLanguages($data = array()) {
        $language_data = $this->cache->get('language');

        if (!$language_data) {
            $language_data = MijoShop::get('db')->getLanguageList();

            $this->cache->set('language', $language_data);
        }

        return $language_data;
   	}
}
?>