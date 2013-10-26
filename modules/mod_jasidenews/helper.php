<?php
/**
 * ------------------------------------------------------------------------
 * JA SideNews Module for J25 & J31
 * ------------------------------------------------------------------------
 * Copyright (C) 2004-2011 J.O.O.M Solutions Co., Ltd. All Rights Reserved.
 * @license - GNU/GPL, http://www.gnu.org/licenses/gpl.html
 * Author: J.O.O.M Solutions Co., Ltd
 * Websites: http://www.joomlart.com - http://www.joomlancers.com
 * ------------------------------------------------------------------------
 */
// no direct access
defined('_JEXEC') or die('Restricted access');
jimport('joomla.application.component.model');
require_once JPATH_SITE . '/components/com_content/helpers/route.php';
//JModelLegacy::addIncludePath(JPATH_SITE . '/components/com_content/models');
if (version_compare(JVERSION, '3.0', 'ge'))
{
	JModelLegacy::addIncludePath(JPATH_SITE . '/components/com_content/models');
}
else if (version_compare(JVERSION, '2.5', 'ge'))
{
   	JModel::addIncludePath(JPATH_SITE . '/components/com_content/models');
}
else
{
	JModel::addIncludePath(JPATH_SITE . '/components/com_content/models');
}


if (file_exists(JPATH_SITE .   '/components/com_k2/helpers/route.php')) {
    require_once (JPATH_SITE . '/components/com_k2/helpers/route.php');
}
if (file_exists(JPATH_SITE .   '/components/com_k2/helpers/route.php')) {
    require_once (JPATH_SITE . '/components/com_k2/helpers/route.php');
}
/**
 * modJASildeNews class.
 */
class modJASildeNewsHelper
{

    /**
     * @var string $condition;
     *
     * @access private
     */
    var $conditons = '';

    /**
     * @var string $order
     *
     * @access private
     */
    var $order = 'a.ordering';

    /**
     * @var string $limit
     *
     * @access private
     */
    var $limit = '';

	/**
     * Get helper object
     * @return ObjectExtendable
     */
    public static function getInstance()
    {
        static $instance    =    null;
        if (!$instance) {
            $instance    =    new modJASildeNewsHelper();
        }
        return $instance;
    }
    
	/**
     * magic method
     *
     * @param string method  method is calling
     * @param string $params.
     * @return unknown
     */
    function callMethod($method, $params)
    {
		if (method_exists($this, $method)) {
            if (is_callable(array($this, $method))) {
                return call_user_func(array($this, $method), $params);
            }
        }
        return false;
    }
	
	/**
     * get listing items from rss link or from list of categories.
     *
     * @param JParameter $params
     * @return array
     */
    function getListArticle($params)
    {
        $rows = array();

        // check cache was endable ?
        if ($params->get('enable_cache')) {
            $cache = JFactory::getCache();
            $cache->setCaching(true);
            $cache->setLifeTime($params->get('cache_time', 30) * 60);
            $rows = $cache->get(array($this, 'getArticles'), array($params));
        } else {
            $rows = $this->getArticles($params);
        }

        return $rows;
    }


    /**
     * get articles from list of categories and follow up owner paramer.
     *
     * @param JParameter $params.
     * @return array list of articles
     */
    function getArticles($params)
    {
        //$this->setOrder($params->get('sort_order_field' ,'created'), $params->get('sort_order','DESC'));
        //$this->setLimit( $params->get('max_items', 5) );
        $rows = $this->getListArticles($params);
        return $rows;
    }


    /**
     * get list articles follow setting configuration.
     *
     * @param JParameter $param
     * @return array
     */
    function getListArticles($params)
    {

        $db = JFactory::getDbo();
		$db->getQuery(true);		

		// Access filter
		$access = !JComponentHelper::getParams('com_content')->get('show_noauth');
		$authorised = JAccess::getAuthorisedViewLevels(JFactory::getUser()->get('id'));		

		// Filter by start and end dates.
		$nullDate = $db->getNullDate();
		$date = JFactory::getDate();
		
    	if (version_compare(JVERSION, '3.0', 'ge'))
		{
			
			$nowDate = $date->toSql();
		}
		else if (version_compare(JVERSION, '2.5', 'ge'))
		{
			
			$nowDate = $date->toMySQL();
		}
		else
		{
			
			$nowDate = $date->toMySQL();
		}
		//Remove a.title_alias
		
		$query = "SELECT a.fulltext, a.id, a.title, a.alias,  a.introtext, a.images, a.state, a.catid, a.created, a.created_by, a.created_by_alias, a.modified, a.modified_by,a.publish_up, a.publish_down, a.attribs, a.metadata, a.metakey, a.metadesc, a.access, c.alias AS category_alias, a.hits, a.featured, a.ordering, LENGTH(a.fulltext) AS readmore";		
		$query .= " FROM #__content AS a LEFT JOIN #__languages AS l ON l.lang_code = a.language";
		$query .= " LEFT JOIN #__users AS uc ON uc.id = a.checked_out";
		$query .= " LEFT JOIN #__viewlevels AS ag ON ag.id = a.access";
		$query .= " LEFT JOIN #__categories AS c ON c.id = a.catid";
		$query .= " LEFT JOIN #__users AS ua ON ua.id = a.created_by";
		$query .= " WHERE a.state = 1";
		// Filter by start and end dates.
		$query .= " AND (a.publish_up = '" .$nullDate. "' OR a.publish_up <= '" . $nowDate."')";
		$query .= " AND (a.publish_down = '" .$nullDate. "' OR a.publish_down >= '" . $nowDate."')";
		//Language filter
		$query .= " AND a.language in ('".JFactory::getLanguage()->getTag()."','*')";
		if($access){
			$query .= " AND a.access = ".$access;
		}
		//get featured setting
		$featured = $params->get('show_featured', 1);
        if ($featured ==0) {
            $query .= " AND a.featured = 0";
        } elseif ($featured == 2) {
            $query .= " AND a.featured = 1";
        } 
		
		$categories = $params->get('display_model-modcats-category', '');
		if ($categories && $categories[0] > 0) {
			$catids_new = $categories;
			foreach ($categories as $k => $catid) {
				$subcatids = $this->getCategoryChildren($catid, true);
				if ($subcatids) {
					$catids_new = array_merge($catids_new, array_diff($subcatids, $catids_new));
				}
			}
			$categories = implode(',', $catids_new);
			$query .= " AND c.id IN ($categories)";
		}			
		
		if ($params->get('sort_order_field', 'created') == "random") {
           $query .= " ORDER BY RAND() ".$params->get('sort_order', 'ASC');
        } elseif ($params->get('sort_order_field', 'created') == "ordering") {
		   $query .= " ORDER BY a.ordering ".$params->get('sort_order', 'ASC');
		} elseif ($params->get('sort_order_field', 'created') == "hits") {
		   $query .= " ORDER BY a.hits ".$params->get('sort_order', 'ASC');        
		}else {
			$query .= " ORDER BY a.created ".$params->get('sort_order', 'ASC');
        }
		
		$query .= " LIMIT 0 ,".$params->get('max_items', 5);
	
		$db->setQuery($query);
		$items = $db->loadObjectList();
		
		foreach ($items as &$item) {
            $item->slug = $item->id . ':' . $item->alias;
            $item->catslug = $item->catid . ':' . $item->category_alias;

            if ($access || in_array($item->access, $authorised)) {
                // We know that user has the privilege to view the article
                $item->link = JRoute::_(ContentHelperRoute::getArticleRoute($item->slug, $item->catslug));
            } else {
                $item->link = JRoute::_('index.php?option=com_user&view=login');
            }
			$item->modified =($item->modified != '' && $item->modified != '0000-00-00 00:00:00') ? $item->created : $item->created;
            $item->introtext = JHtml::_('content.prepare', $item->introtext);
        }
        return $items;
    }
	
	/**
	 * get list k2 items follow setting configuration.
	 *
	 * @param JParameter $param
	 * @return array
	 */
	public function getListK2($params)
	{
		global $mainframe;
		if (!$this->checkComponent('com_k2')) {
			return array();
		}
		$catsid = $params->get('k2catsid');
		$catids = array();
		if (!is_array($catsid)) {
			$catids[] = $catsid;
		} else {
			$catids = $catsid;
		}

		JArrayHelper::toInteger($catids);
		if ($catids) {
			if ($catids && count($catids) > 0) {
				foreach ($catids as $k => $catid) {
					if (!$catid)
						unset($catids[$k]);
				}
			}
		}
		
		jimport('joomla.filesystem.file');

		$user = JFactory::getUser();
		$aid = $user->get('aid') ? $user->get('aid') : 1;
		$db = JFactory::getDBO();

		$jnow = JFactory::getDate();
		if (version_compare(JVERSION, '3.0', 'ge'))
		{
			$now = $jnow->toSql();
		}
		else if (version_compare(JVERSION, '2.5', 'ge'))
		{
			$now = $jnow->toMySQL();
		}
		else
		{
			$now = $jnow->toMySQL();
		}
		
		$nullDate = $db->getNullDate();

		$query 	= "SELECT i.*, c.name AS categoryname,c.id AS categoryid, c.alias AS categoryalias, c.name as cattitle, c.params AS categoryparams";
		$query .= "\n FROM #__k2_items as i LEFT JOIN #__k2_categories c ON c.id = i.catid";
		$query .= "\n WHERE i.published = 1 AND i.access <= {$aid} AND i.trash = 0 AND c.published = 1 AND c.access <= {$aid} AND c.trash = 0";
		$query .= "\n AND ( i.publish_up = " . $db->Quote($nullDate) . " OR i.publish_up <= " . $db->Quote($now) . " )";
		$query .= "\n AND ( i.publish_down = " . $db->Quote($nullDate) . " OR i.publish_down >= " . $db->Quote($now) . " )";
	
		
		if ($catids) {
			$catids_new = $catids;
			foreach ($catids as $k => $catid) {
				$subcatids = $this->getK2CategoryChildren($catid, true);
				if ($subcatids) {
					$catids_new = array_merge($catids_new, array_diff($subcatids, $catids_new));
				}
			}
			$catids = implode(',', $catids_new);
			$query .= "\n AND i.catid IN ($catids)";
		}
		
		
		//get featured setting
		$featured = $params->get('show_featured', 1);
        if ($featured ==0) {
            $query .= " AND i.featured = 0";
        } elseif ($featured == 2) {
            $query .= " AND i.featured = 1";
        }
		
		// order by
        $ordering = $params->get('sort_order_field', 'created');
        
        $dir = $params->get('sort_order', 'DESC');
        // Set ordering		
		switch ($ordering) {
			
			case 'created':
				$orderby = 'i.created';
				break;
			
			case 'hits':
				$orderby = 'i.hits';
				break;
			
			case 'ordering':
				if (JRequest::getInt('featured') == '2')
						$orderby = 'i.featured_ordering';
				else
						$orderby = 'c.ordering, i.ordering';
				break;
				
			case 'random':
				$orderby = 'RAND()';
				break;
		}						
		$query .= " ORDER BY ".$orderby." ".$dir." ";
				
		if ((int) trim($params->get('max_items', 5))==0) {
			$query = str_replace("i.published = 1 AND", "i.published = 10 AND", $query);
		}

		$db->setQuery($query, 0, (int) trim($params->get('max_items', 5)));
		$items = $db->loadObjectList();

		if ($items) {

			$i = 0;
			$showHits = $params->get('show_hits', 0);
			$showHits = $showHits == "1" ? true : false;
			$showimg = $params->get('show_image', 1);
			$w = (int) $params->get('width', 80);
			$h = (int) $params->get('height', 96);
			$showdate = $params->get('show_date', 1);

			$thumbnailMode = $params->get('thumbnail_mode', 'crop');
			$aspect = $params->get('use_ratio', '1');
			$crop = $thumbnailMode == 'crop' ? true : false;
			$lists = array();

			foreach ($items as &$item) {

				$item->link = urldecode(JRoute::_(K2HelperRoute::getItemRoute($item->id . ':' . urlencode($item->alias), $item->catid . ':' . urlencode($item->categoryalias))));
				
				$item->text = htmlspecialchars($item->title);
				
				$item->modified =($item->modified != '' && $item->modified != '0000-00-00 00:00:00') ? $item->created : $item->created;
				
				if ($showdate) {
					$item->date = $item->modified == null || $item->modified == "" || $item->modified == "0000-00-00 00:00:00" ? $item->created : $item->modified;
				}

				//Author
				$author = JFactory::getUser($item->created_by);
				$item->creater = $author->name;

				if ($showHits) {
					$item->hits = isset($item->hits) ? $item->hits : 0;
				} else {
					$item->hits = null;
				}
			}
		}
		return $items;
	}
	
	/**
	 *
	 * Get category children
	 * @param int $catid
	 * @param boolean $clear if true return array which is removed value construction
	 * @return array
	 */
	function getCategoryChildren($catid, $clear = false) {

		static $array = array();
		if ($clear)
		$array = array();
		$user = JFactory::getUser();
		$aid = $user->get('aid') ? $user->get('aid') : 1;
		$catid = (int) $catid;
		$db = JFactory::getDBO();
		$query = "SELECT * FROM #__categories WHERE parent_id={$catid} AND published=1 AND access={$aid} ";
		$db->setQuery($query);
		$rows = $db->loadObjectList();

		foreach ($rows as $row) {
			array_push($array, $row->id);
			if ($this->hasChildren($row->id)) {
				$this->getCategoryChildren($row->id);
			}
		}
		return $array;
	}


	/**
	 *
	 * Check category has children
	 * @param int $id
	 * @return boolean
	 */
	function hasChildren($id) {

		$user = JFactory::getUser();
		$aid = $user->get('aid') ? $user->get('aid') : 1;
		$id = (int) $id;
		$db = JFactory::getDBO();
		$query = "SELECT * FROM #__categories WHERE parent_id={$id} AND published=1 AND access={$aid} ";
		$db->setQuery($query);
		$rows = $db->loadObjectList();

		if (count($rows)) {
			return true;
		} else {
			return false;
		}
	}

    /**
     * get condition from setting configuration.
     *
     * @param JParameter $params
     * @return string.
     */
	 
   
	/**
	 *
	 * Get K2 category children
	 * @param int $catid
	 * @param boolean $clear if true return array which is removed value construction
	 * @return array
	 */
	function getK2CategoryChildren($catid, $clear = false) {

		static $array = array();
		if ($clear)
		$array = array();
		$user = JFactory::getUser();
		$aid = $user->get('aid') ? $user->get('aid') : 1;
		$catid = (int) $catid;
		$db = JFactory::getDBO();
		$query = "SELECT * FROM #__k2_categories WHERE parent={$catid} AND published=1 AND trash=0 AND access<={$aid} ORDER BY ordering ";
		$db->setQuery($query);
		$rows = $db->loadObjectList();

		foreach ($rows as $row) {
			array_push($array, $row->id);
			if ($this->hasK2Children($row->id)) {
				$this->getK2CategoryChildren($row->id);
			}
		}
		return $array;
	}


	/**
	 *
	 * Check category has children
	 * @param int $id
	 * @return boolean
	 */
	function hasK2Children($id) {

		$user = JFactory::getUser();
		$aid = $user->get('aid') ? $user->get('aid') : 1;
		$id = (int) $id;
		$db = JFactory::getDBO();
		$query = "SELECT * FROM #__k2_categories WHERE parent={$id} AND published=1 AND trash=0 AND access<={$aid} ";
		$db->setQuery($query);
		$rows = $db->loadObjectList();

		if (count($rows)) {
			return true;
		} else {
			return false;
		}
	}

    
	/**
	 *
	 * Check component is existed
	 * @param string $component component name
	 * @return int return > 0 when component is installed
	 */
	function checkComponent($component)
	{
		$db = JFactory::getDBO();
		$query = " SELECT Count(*) FROM #__extensions as e WHERE e.element ='$component' and e.enabled=1";
		$db->setQuery($query);
		return $db->loadResult();
	}

    /**
     * parser options, helper for clause where sql.
     *
     * @string array $options
     * @return string.
     */
    function getIds($options)
    {
        if (!is_array($options)) {
            return (int) $options;
        } else {
            return "'" . implode("','", $options) . "'";
        }
    }


    /**
     * add sort order sql
     *
     * @param string $order is article's field.
     * @param string $mode is DESC or ASC
     * @return .
     */
    function setOrder($order, $mode)
    {
        $this->order = ' a.' . $order . ' ' . $mode;
        return $this;
    }


    /**
     * add set limit sql
     *
     * @param integer $limit.
     * @return .
     */
    function setLimit($limit)
    {
        $this->limit = $limit;
        return $this;
    }


    /**
     * trim string with max specify
     *
     * @param string $subject
     * @param integer $length.
     */
    function trimString($subject, $length = 60, $moretxt = '...')
    {
		if(!$length) return '';
		
    	$subject = strip_tags($subject);
		$subject = str_replace('/[\r\n\s\t]+/', ' ', $subject);
		//remove short code
		$subject = preg_replace('/\{(loadposition|ja|rk|gk)[a-z0-9\s]+\}/i', '', $subject);
		
		if(strlen($subject) > $length) {
			$pos = strpos($subject, ' ', $length);
			if(!$pos) {
				return substr($subject, 0, $length);
			} elseif($pos > $length + 10) {
				return substr($subject, 0, $length).$moretxt;
			} else {
				return substr($subject, 0, $pos).$moretxt;
			}
		} else {
			return $subject;
		}
    }


    /**
     * detect and get link with each resource
     *
     * @param string $item
     * @param bool $useRSS.
     * @return string.
     */

    /**
     *
     * Render image from article
     * @param object $row
     * @param object $params
     * @param int $maxchars
     * @param int $width
     * @param int $height
     * @return string image
     */
    function renderImage(&$row, $params, $maxchars, $width = 0, $height = 0)
    {

        global $database, $_MAMBOTS, $current_charset;
        $image = "";
		$align = ($tmp = $params->get("image_alignment", "left")) != "auto" ? 'align="' . $tmp . '"' : "";
		$source = $params->get('using_mode', 'content');
		$image = $this->parseImage($row,$source);
		
        if ($image) {
            $thumbnailMode = $params->get('thumbnail_mode', 'crop');
            $aspect = $params->get('thumbnail_mode-resize-use_ratio', '1');
            $crop = $thumbnailMode == 'crop' ? true : false;
            $jaimage = JAImage::getInstance();

            if ($thumbnailMode != 'none' && $jaimage->sourceExited($image)) {
                $imageURL = $jaimage->resize($image, $width, $height, $crop, $aspect);
                if ($imageURL == $image) {
                    $width = $width ? "width=\"$width\"" : "";
                    $height = $height ? "height=\"$height\"" : "";
                    $image = "<img src=\"$imageURL\" $align  alt=\"{$row->title}\" title=\"{$row->title}\" $width $height />";
                } else {
                    $image = "<img src=\"$imageURL\"  $align  alt=\"{$row->title}\" title=\"{$row->title}\" />";
                }
            } else {
                $width = $width ? "width=\"$width\"" : "";
                $height = $height ? "height=\"$height\"" : "";
                $image = "<img src=\"$image\" alt=\"{$row->title}\" $align  title=\"{$row->title}\" $width $height />";
            }
        } else {
            $image = '';
        }

        $regex1 = "/\<img.*\/\>/";
        $row->introtext = preg_replace($regex1, '', $row->introtext);
        $row->introtext = trim($row->introtext);

        // clean up globals
        return $image;
    }
	
	/**
	 * check the image source is existed ?
	 *
	 * @param string $imageSource the path of image source.
	 * @access public,
	 * @return boolean,
	 */
	function parseImage( $row ,$context = 'content') {
		
		//check if the context is k2 to get k2 images first
		if($context == 'k2'){
		    $arrImages = $this->getK2Images($row, $context);
			if(!empty($arrImages)){
			    return $arrImages['imageGeneric'];		
			}
		}
		//check to see if there is an  intro image or fulltext image  first
		$images = "";
		if (isset($row->images)) {
			$images = json_decode($row->images);
		}
		if((isset($images->image_fulltext) and !empty($images->image_fulltext)) || (isset($images->image_intro) and !empty($images->image_intro))){
			$image = (isset($images->image_intro) and !empty($images->image_intro))?$images->image_intro:((isset($images->image_fulltext) and !empty($images->image_fulltext))?$images->image_fulltext:"");
		}
		else {
			$regex = '/\<img.+src\s*=\s*\"([^\"]*)\"[^\>]*\>/';
			preg_match($regex, $row->introtext. $row->fulltext, $matches);
			$images = (count($matches)) ? $matches : array();
			$image = count($images) > 1 ? $images[1] : '';
		}
		return $image;			
	}
 /**
     *
     * Get image in k2 item
     * @param object $item
     * @param string $context
     * @return array
     */
    function getK2Images($item, $context = 'content')
    {
        jimport('joomla.filesystem.file');
        //Image
        $arr_return = array();

        if ($context == 'k2') {
            if (JFile::exists(JPATH_SITE .  '/media/k2/items/cache/' . md5("Image" . $item->id) . '_XS.jpg'))
                $arr_return['imageXSmall'] = JURI::root() . 'media/k2/items/cache/' . md5("Image" . $item->id) . '_XS.jpg';

            if (JFile::exists(JPATH_SITE .  '/media/k2/items/cache/' . md5("Image" . $item->id) . '_S.jpg'))
                $arr_return['imageSmall'] = JURI::root() . 'media/k2/items/cache/' . md5("Image" . $item->id) . '_S.jpg';

            if (JFile::exists(JPATH_SITE .  '/media/k2/items/cache/' . md5("Image" . $item->id) . '_M.jpg'))
                $arr_return['imageMedium'] = JURI::root() . 'media/k2/items/cache/' . md5("Image" . $item->id) . '_M.jpg';

            if (JFile::exists(JPATH_SITE .  '/media/k2/items/cache/' . md5("Image" . $item->id) . '_L.jpg'))
                $arr_return['imageLarge'] = JURI::root() . 'media/k2/items/cache/' . md5("Image" . $item->id) . '_L.jpg';

            if (JFile::exists(JPATH_SITE .  '/media/k2/items/cache/' . md5("Image" . $item->id) . '_XL.jpg'))
                $arr_return['imageXLarge'] = JURI::root() . 'media/k2/items/cache/' . md5("Image" . $item->id) . '_XL.jpg';

            if (JFile::exists(JPATH_SITE .  '/media/k2/items/cache/' . md5("Image" . $item->id) . '_Generic.jpg'))
                $arr_return['imageGeneric'] = JURI::root() . 'media/k2/items/cache/' . md5("Image" . $item->id) . '_Generic.jpg';
        } else {
            //com content
        }

        return $arr_return;
    }
}