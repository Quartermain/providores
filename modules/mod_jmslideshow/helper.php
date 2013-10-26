<?php
/*
#------------------------------------------------------------------------
# Package - JoomlaMan JMSlideShow
# Version 1.0
# -----------------------------------------------------------------------
# Author - JoomlaMan http://www.joomlaman.com
# Copyright © 2012 - 2013 JoomlaMan.com. All Rights Reserved.
# @license http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 or Later
# Websites: http://www.JoomlaMan.com
#------------------------------------------------------------------------
*/
//-- No direct access
defined('_JEXEC') or die('Restricted access');

class modJmSlideshowHelper {

    static function getSlides($params) {
				$slidesource = $params->get('slider_source', 1);
		switch ($slidesource) {
			case 1:
				return modJmSlideshowHelper::getSlidesFromCategories($params);
				break;
			case 2:
				return modJmSlideshowHelper::getSlidesFromArticleIDs($params);
				break;
			case 3:
				return modJmSlideshowHelper::getSlidesFromK2Categories($params);
				break;
			case 4:
				return modJmSlideshowHelper::getSlidesFromK2IDs($params);
				break;
			case 5:
				return modJmSlideshowHelper::getSlidesFromCategoriesProduct($params);
				break;
			case 6:
				return modJmSlideshowHelper::getSlidesFromProductIDs($params);
				break;
			case 7:
				return modJmSlideshowHelper::getSlidesFeatured($params);
				break;
			case 8:
				return modJmSlideshowHelper::getSlidesK2Featured($params);
				break;
			case 9:
				return modJmSlideshowHelper::getSlidesFromFoder($params);
				break;

		}
		}
	
	static function getSlidesFromFoder($params){
		$slides = array();
		$dir = $params->get('jmslideshow_foder_image', 'images');
		$limit = $params->get('jmslideshow_count', 0);
		if(is_dir(JPATH_SITE.DS.$dir)){
			$imagesDir = JPATH_SITE.DS.$dir.DS;
			$exts = array('jpg','jpeg','png','gif','JPG','JPGE','PNG','GIF');
			$images = array();
			foreach ($exts as $ext){
				$tmp = glob($imagesDir.'*.'.$ext);
				$images = array_merge($images, $tmp);
			}
			if (empty($images)) {
				return $slides;
			}
			foreach ($images as $i=>$image) {
				if ($limit > 0 && $i <= ($limit-1)) {
					$slide = new JMSlide($params);
					$slide->loadImages($image);
					$slides[] = $slide; 
				} elseif($limit <= 0 ) {
					$slide = new JMSlide($params);
					$slide->loadImages($image);
					$slides[] = $slide;
				}
			}
			return $slides;
		}else{
			echo "Folder does not exist or not accessible: <b>".JPATH_SITE.DS.$dir."</b>";
		}
	}
	
		static function getSlidesFromCategories($params) {
			$limit = $params->get('jmslideshow_count', 0);
			$categories = $params->get('jmslideshow_categories', array());
			$categories = implode(',', $categories);
			$db = JFactory::getDbo();
			$ordering = $params->get('jmslideshow_ordering','ASC');
			$orderby = $params->get('jmslideshow_orderby',1);
			if($orderby==1){$field = 'c.title';}
			elseif($orderby==2){$field = 'c.ordering';}
			else{$field = 'c.id';}
			$query = $db->getQuery(true)
					->select("c.id")
					->from("#__content AS c")
					->where("c.catid IN({$categories})")
					->where("c.state > 0")
					->order($field.' '.$ordering);
			if ($limit > 0) {
				$db->setQuery($query, 0, $limit); 
			} else {
				$db->setQuery($query);
			}
			$rows = $db->loadObjectList();
			$slides = array();
			if (empty($rows)) {
				return $slides;
			}
			foreach ($rows as $row) {
				$slide = new JMSlide($params);
				$slide->loadArticle($row->id);
				$slides[] = $slide;
			}
			return $slides;
		}

		static function getSlidesFromArticleIDs($params) {
		$ids = $params->get('jmslideshow_article_ids', '');
				$ids = str_replace(' ', '', $ids);
		$db = JFactory::getDbo();
		$ordering = $params->get('jmslideshow_ordering','ASC');
		$orderby = $params->get('jmslideshow_orderby',1);
		if($orderby==1){$field = 'c.title';}
		elseif($orderby==2){$field = 'c.ordering';}
		else{$field = 'c.id';}
				$query = $db->getQuery(true) 
								->select("c.id")
								->from("#__content AS c")
								->where("c.state > 0")
								->where("c.id IN ({$ids})")
				->order($field.' '.$ordering);
		$db->setQuery($query);
		$rows = $db->loadObjectList();
		if (empty($rows)) {
						return $slides;
				}
		foreach ($rows as $row) {
			$slide = new JMSlide($params); 
			$slide->loadArticle($row->id);
			$slides[] = $slide;
		}
				return $slides;
		}
	
	static function getSlidesFeatured($params) {
		$limit = $params->get('jmslideshow_count', 0);
		$db = JFactory::getDbo();
		$ordering = $params->get('jmslideshow_ordering','ASC');
		$orderby = $params->get('jmslideshow_orderby',1);
		if($orderby==1){$field = 'c.title';}
		elseif($orderby==2){$field = 'c.ordering';}
		else{$field = 'c.id';}
		$query = $db->getQuery(true)
								->select("c.id")
								->from("#__content AS c")
								->where("c.state > 0")
								->where("c.featured = 1")
								->order($field.' '.$ordering); 
		if ($limit > 0) {
				$db->setQuery($query, 0, $limit);
		} else {
				$db->setQuery($query);
		}
		$rows = $db->loadObjectList();
		$slides = array();
		if (empty($rows)) {
				return $slides;
		}
		foreach ($rows as $row) {
				$slide = new JMSlide($params);
				$slide->loadArticle($row->id);
				$slides[] = $slide;
		}
		return $slides;
 }

		static function getSlidesFromCategoriesProduct($params) {
		$limit = $params->get('jmslideshow_count', 0);
				$categories = $params->get('jmslideshow_hikashop_categories', array());
				$categories = implode(',', $categories);
				$db = JFactory::getDbo();
				$query = $db->getQuery(true)
								->select("p.product_id")
								->from("#__hikashop_product AS p")
				->leftjoin("#__hikashop_product_category AS c ON p.product_id = c.product_id")
								->where("c.category_id IN({$categories})")
								->where("p.product_published > 0");
				if ($limit > 0) {
						$db->setQuery($query, 0, $limit);
				} else {
						$db->setQuery($query);
				}
				$rows = $db->loadObjectList();
				$slides = array(); 
				if (empty($rows)) { 
						return $slides;	
				}
				foreach ($rows as $row) {
						$slide = new JMSlide($params);
						$slide->loadProduct($row->product_id);
						$slides[] = $slide;
				}
				return $slides;
		}

	 static function getSlidesFromProductIDs($params) {
				$ids = $params->get('jmslideshow_hikashop_ids', '');
				$ids = str_replace(' ', '', $ids);
				if (empty($ids))
						return $slides;
				$ids = explode(',', $ids);
				$slides = array();
				if (empty($ids))
						return $slides;
				foreach ($ids as $id) {
						$slide = new JMSlide($params);
						$slide->loadProduct($id);
						$slides[] = $slide;
				}
				return $slides;
		}
	
	 static function getSlidesFromK2Categories($params) {
				$limit = $params->get('jmslideshow_count', 0);
				$categories = $params->get('jmslideshow_k2_categories', array());
				$categories = implode(',', $categories);
				$ordering = $params->get('jmslideshow_ordering','ASC');
				$orderby = $params->get('jmslideshow_orderby',1);
				if($orderby==1){$field = 'k2.title';}
				elseif($orderby==2){$field = 'k2.ordering';}
				else{$field = 'k2.id';}
				$db = JFactory::getDbo();
				$query = $db->getQuery(true)
								->select("k2.id")
								->from("#__k2_items AS k2")
								->where("k2.catid IN({$categories})")
								->where("k2.published = 1")
								->where("k2.trash = 0")
								->order($field.' '.$ordering);
				if ($limit > 0) {
						$db->setQuery($query, 0, $limit);
				} else {
						$db->setQuery($query);
				}
				$rows = $db->loadObjectList();
				$slides = array();
				if (empty($rows)) {
						return $slides;
				}
		//print_r($rows);
				foreach ($rows as $row) {
						$slide = new JMSlide($params);
						$slide->loadK2($row->id);
			if($slide->image)
						$slides[] = $slide;
				}
		//print_r($slides);
				return $slides;
		}

	static function getSlidesFromK2IDs($params) {
		$ids = $params->get('jmslideshow', '');
		$ids = str_replace(' ', '', $ids);
		$db = JFactory::getDbo();
		$ordering = $params->get('jmslideshow_ordering','ASC');
		$orderby = $params->get('jmslideshow_orderby',1);
		if($orderby==1){$field = 'k2.title';}
		elseif($orderby==2){$field = 'k2.ordering';}
		else{$field = 'k2.id';}
		$query = $db->getQuery(true)
								->select("k2.id")
								->from("#__k2_items AS k2")
								->where("k2.featured = 1") 
								->where("k2.id IN ({$ids})")
								->where("k2.published = 1")
								->where("k2.trash = 0")
								->order($field.' '.$ordering);
		$db->setQuery($query);
				$rows = $db->loadObjectList();
		if (empty($rows)) {
						return $slides;
				}
				foreach ($rows as $row) {
						$slide = new JMSlide($params);
						$slide->loadK2($row->id);
			if($slide->image)
						$slides[] = $slide;
				}
				return $slides;
		}
	
	static function getSlidesK2Featured($params) {
				$limit = $params->get('jmslideshow_count', 0);
				$categories = $params->get('jmslideshow_k2_categories', array());
				$categories = implode(',', $categories);
				$db = JFactory::getDbo();
		$ordering = $params->get('jmslideshow_ordering','ASC');
		$orderby = $params->get('jmslideshow_orderby',1);
		if($orderby==1){$field = 'k2.title';}
		elseif($orderby==2){$field = 'k2.ordering';}
		else{$field = 'k2.id';}
		$query = $db->getQuery(true)
								->select("k2.id")
								->from("#__k2_items AS k2")
								->where("k2.featured = 1")
								->where("k2.published = 1")
								->where("k2.trash = 0")
								->order($field.' '.$ordering); 
		if ($limit > 0) {
						$db->setQuery($query, 0, $limit);
				} else {
						$db->setQuery($query);
				}
				$rows = $db->loadObjectList();
				$slides = array();
				if (empty($rows)) {
						return $slides;
				}
				foreach ($rows as $row) {
						$slide = new JMSlide($params);
						$slide->loadK2($row->id);
			if($slide->image)
						$slides[] = $slide;
				}
				return $slides;
		}
		
		static function getTemplate(){
			$db=JFactory::getDBO();
			$query=$db->getQuery(true);
			$query->select('*');
			$query->from('#__template_styles');
			$query->where('home=1');
			$query->where('client_id=0');
			$db->setQuery($query);
			return $db->loadObject()->template;
		}
}