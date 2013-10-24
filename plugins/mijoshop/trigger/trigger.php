<?php
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

// No Permission
defined('_JEXEC') or die ('Restricted access');

jimport('joomla.plugin.plugin');

class plgMijoshopTrigger extends JPlugin {

    public $hasView = false;

	public function __construct(&$subject, $config) {
		parent::__construct($subject, $config);
		
		$file = JPATH_SITE.'/components/com_mijoshop/mijoshop/mijoshop.php';
		
		if (file_exists($file)) {
			require_once($file);
		}
	}

    public function onMijoshopAfterProductSave($data, $product_id, $isNew) {
        $data['id'] = $product_id;
        $results = MijoShop::get('base')->trigger('onFinderAfterSave', array('com_mijoshop.product', $data, $isNew), 'finder');
    }

    public function onMijoshopAfterProductDelete($product_id) {
        $results = MijoShop::get('base')->trigger('onFinderAfterDelete', array('com_mijoshop.product', $product_id), 'finder');
    }

    public function onMijoshopAfterCategorySave($data, $category_id, $isNew) {
		if (!$isNew) {
            $results = MijoShop::get('base')->trigger('onFinderChangeState', array('com_mijoshop.category', $category_id, $data['status']), 'finder');
        }
    }
}