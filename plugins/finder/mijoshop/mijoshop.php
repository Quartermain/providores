<?php
/*
* @package		MijoShop
* @copyright	2009-2012 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

// No Permission
defined('_JEXEC') or die ('Restricted access');

jimport('joomla.application.component.helper');

require_once JPATH_ADMINISTRATOR . '/components/com_finder/helpers/indexer/adapter.php';

class plgFinderMijoshop extends FinderIndexerAdapter {

	protected $context = 'Mijoshop';
	protected $extension = 'com_mijoshop';
	protected $layout = 'product';
	protected $type_title = 'Product';
	protected $table = '#__mijoshop_product_description';

	public function __construct(&$subject, $config) {
		parent::__construct($subject, $config);
		$this->loadLanguage();
		
		$file = JPATH_SITE.'/components/com_mijoshop/mijoshop/mijoshop.php';
		
		if (file_exists($file)) {
			require_once($file);
		}
	}

	public function onFinderAfterDelete($context, $table) {
        if ($context == 'com_mijoshop.product') {
            $id = $table;
        }
        elseif ($context == 'com_finder.index') {
            $id = $table->link_id;
        }
        else {
            return true;
        }
        
        return $this->remove($id);
	}

	public function onFinderAfterSave($context, $row, $isNew) {
        if ($context == 'com_mijoshop.product') {
            $this->reindex($row['id']);
        }

        return true;
	}

	public function onFinderChangeState($context, $pks, $value) {
        if ($context == 'com_mijoshop.category') {
            $this->categoryStateChange($pks, $value);
        }
	}

	protected function index(FinderIndexerResult $item, $format = 'html') {
        if (JComponentHelper::isEnabled($this->extension) == false) {
            return;
        }

        $registry = new JRegistry;
        $registry->loadString($item->metadata);
        $item->metadata = $registry;

        $item->addInstruction(FinderIndexer::META_CONTEXT, 'link');
        $item->addInstruction(FinderIndexer::META_CONTEXT, 'metakey');
        $item->addInstruction(FinderIndexer::META_CONTEXT, 'metadesc');

        $item->url = 'index.php?option=com_mijoshop&route=product/product&product_id='.$item->id;
        $item->route = Mijoshop::get('router')->route('index.php?route=product/product&product_id='.$item->id);
        $item->access = 1;

        $item->state = $this->translateState(intval($item->state));

        $item->addTaxonomy('Type', 'MijoShop Product');

        $manufacturer =$item->getElement('manufacturer_name');
        if (!empty($manufacturer)) {
            $item->addTaxonomy('MijoShop Manufacturer', $manufacturer);
        }

        $cats = self::getProductCategoryId($item->id);
        foreach($cats as $cat) {
            if (!empty($cat->name)){
                $item->addTaxonomy('MijoShop Category', $cat->name);
            }
        }

        FinderIndexerHelper::getContentExtras($item);

        if (method_exists('FinderIndexer', 'getInstance')) {
            FinderIndexer::getInstance()->index($item);
        }
        else {
            FinderIndexer::index($item);
        }
	}

	protected function setup() {
		return true;
	}

	protected function getListQuery($sql = null) {
        $db = JFactory::getDbo();

        $sql = is_a($sql, 'JDatabaseQuery') ? $sql : $db->getQuery(true);
        $sql->select('a.product_id as id, a.status AS state, a.date_added as start_date, a.product_id AS slug');
        $sql->select('pd.name as title, pd.description, pd.meta_keyword AS metakey, pd.meta_description AS metadesc');
        $sql->select('m.name As manufacturer_name');

        $sql->from('#__mijoshop_product AS a');
        $sql->join('LEFT', '#__mijoshop_product_description AS pd ON a.product_id = pd.product_id');
        $sql->join('LEFT', '#__mijoshop_manufacturer AS m ON m.manufacturer_id = a.manufacturer_id');


        return $sql;
	}

    protected function getItem($id) {
        JLog::add('FinderIndexerAdapter::getItem', JLog::INFO);

        $sql = $this->getListQuery();
        $sql->where('a.' . $this->db->quoteName('product_id') . ' = ' . (int) $id);

        $this->db->setQuery($sql);
        $row = $this->db->loadAssoc();

        if ($this->db->getErrorNum()) {
            throw new Exception($this->db->getErrorMsg(), 500);
        }

        $item = JArrayHelper::toObject($row, 'FinderIndexerResult');

        $item->type_id = $this->type_id;

        $item->layout = $this->layout;

        return $item;
    }

    protected function getProductCategoryId($id){
        $db = JFactory::getDbo();
		
        $sql = 'SELECT c.name FROM #__mijoshop_category_description AS c , #__mijoshop_product_to_category pc
                WHERE pc.category_id = c.category_id AND pc.product_id = '.$id;
        $db->setQuery($sql);
        $result = $db->loadObjectList();

        return $result;
    }

    protected function categoryStateChange($pk, $value) {
        $sql = $this->getStateQuery($pk);
        $this->db->setQuery($sql);
        $items = $this->db->loadObjectList();

        foreach ($items as $item) {
            if ($value !== null) {
                $temp = intval($value);
            }
            else {
                $temp = intvall($item->state);
            }

            $this->change($item->id, 'state', $temp);

            $this->reindex($item->id);
        }
    }

    protected function getStateQuery($id) {
        $sql = "SELECT p.product_id AS id, p.status AS state, c.status AS cat_state
                FROM #__mijoshop_category AS c
                LEFT JOIN #__mijoshop_product_to_category AS pc ON pc.category_id = c.category_id
                LEFT JOIN #__mijoshop_product AS p ON p.product_id = pc.product_id
                WHERE (
                        SELECT COUNT( x.product_id )
                        FROM #__mijoshop_product_to_category AS x
                        WHERE x.product_id = pc.product_id
                      ) = 1
                AND c.category_id ={$id}";
				
        return $sql;
    }
}