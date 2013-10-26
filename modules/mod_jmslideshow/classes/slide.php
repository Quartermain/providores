<?php
ob_start();
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
if (!class_exists('JMImage')) {
  require_once JPATH_SITE . DS . 'modules' . DS . 'mod_jmslideshow' . DS . 'classes' . DS . 'jmimage.class.php';
}
class JMSlide extends stdClass {
  var $id = null;
  var $category = null;
  var $image = null;
  var $title = null;
  var $description = null;
  var $link = null;
  var $params = null;
  public function JMSlide($params) {
    $this->params = $params;
  }
  public function loadArticle($id) {
    $article = JTable::getInstance("content");
    $article->load($id);
    $this->category = $article->get('catid');
    if (!class_exists('ContentHelperRoute')) {
      require_once(JPATH_SITE . DS . 'components' . DS . 'com_content' . DS . 'helpers' . DS . 'route.php');
    }
    if ($article) {
      $this->title = $article->get('title');
      $image_source = $this->params->get('jmslideshow_article_image_source', 1);
      $imageobj = json_decode($article->images);
      if ($image_source == 1) {
        //Intro Image
        $this->image = $imageobj->image_intro;
      } elseif ($image_source == 2) {
        //Full Image
        $this->image = $imageobj->image_fulltext;
      } else {
        $this->image = $this->getFirstImage($article->introtext . $article->fulltext);
      }
      $maxleght = $this->params->get('jmslideshow_desc_length', 50);
      $allowable_tags = $this->params->get('jmslideshow_desc_html', '');
      $tags = "";
      if ($allowable_tags) {
        $allowable_tags = explode(',', $allowable_tags);
        foreach ($allowable_tags as $tag) {
          $tags .= "<$tag>";
        }
      }
      $this->description = substr(strip_tags($article->introtext . $article->fulltext, $tags), 0, $maxleght);
      if ($maxleght < strlen(strip_tags($article->introtext . $article->fulltext, $tags))) {
        $this->description = preg_replace('/ [^ ]*$/', ' ...', $this->description);
      }
      $this->link = JRoute::_(ContentHelperRoute::getArticleRoute($article->id, $article->catid));
      $this->id = $id;
      if ($this->params->get('jmslideshow_title_link')) {
        $this->title = '<a href="' . $this->link . '">' . $this->title . '</a>';
      }
    } else {
      return null;
    }
  }
  public function loadProduct($id) {
    $db = JFactory::getDbo();
    $query = $db->getQuery(true)
            ->select("p.*,pc.product_category_id")
            ->select("f.file_path")
            ->from("#__hikashop_product AS p")
            ->leftjoin("#__hikashop_file AS f ON p.product_id = f.file_ref_id")
            ->leftjoin("#__hikashop_product_category AS pc ON pc.product_id = p.product_id")
            ->leftjoin("#__hikashop_category AS hc ON hc.category_id = pc.category_id")
            ->where("p.product_id = {$id}")
            ->where("f.file_type = 'product' ");
    $product = $db->setQuery($query)->loadObject();
    if ($product) {
      $this->title = $product->product_name;
      $image_source = $this->params->get('jmslideshow_image_source', 0);
      if (empty($image_source)) {
        $this->image = JPATH_SITE . DS . 'media' . DS . 'com_hikashop' . DS . 'upload' . DS . $product->file_path;
      } else {
        $this->image = $this->getFirstImage($product->product_description);
      }
      //$this->image = JPATH_SITE . DS . 'media' . DS . 'com_hikashop' . DS . 'upload' . DS . $product->file_path;
      $maxleght = $this->params->get('jmslideshow_desc_length', 50);
      $allowable_tags = $this->params->get('jmslideshow_desc_html', '');
      $tags = "";
      if ($allowable_tags) {
        $allowable_tags = explode(',', $allowable_tags);
        foreach ($allowable_tags as $tag) {
          $tags .= "<$tag>";
        }
      }
      $this->description = substr(strip_tags($product->product_description, $tags), 0, $maxleght);
      $this->id = $product->product_id;
      $this->category = $product->product_category_id;
      if ($maxleght < strlen(strip_tags($product->product_description, $tags))) {
        $this->description = preg_replace('/ [^ ]*$/', ' ...', $this->description);
      }
      $this->link = JRoute::_("index.php?option=com_hikashop&ctrl=product&task=show&cid={$product->product_id}&name={$product->product_name}");
      if ($this->params->get('jmslideshow_title_link')) {
        $this->title = '<a href=' . $this->link . '>' . $this->title . '</a>';
      }
    } else {
      return null;
    }
  }
  public function loadK2($id) {
    $db = JFactory::getDbo();
    $query = $db->getQuery(true)
            ->select("k2.*")
            ->from("#__k2_items AS k2")
            ->where("k2.id = {$id}");
    $k2 = $db->setQuery($query)->loadObject();
    if ($k2) {
      $this->title = $k2->title;
      $image_source = $this->params->get('jmslideshow_image_source', 0);
      if (empty($image_source)) {
        //$size = XS, S, M, L, XL
        $size = 'XL';
        jimport('joomla.filesystem.file');
        if (JFile::exists(JPATH_SITE . DS . 'media' . DS . 'k2' . DS . 'items' . DS . 'cache' . DS . md5("Image" . $k2->id) . '_L.jpg')) {
          $this->image = JPATH_SITE . '/media/k2/items/cache/' . md5("Image" . $id) . '_' . $size . '.jpg';
        }
      } else {
        $this->image = $this->getFirstImage($k2->introtext . $k2->fulltext);
      }
      $maxleght = $this->params->get('jmslideshow_desc_length', 50);
      $allowable_tags = $this->params->get('jmslideshow_desc_html', '');
      $tags = "";
      if ($allowable_tags) {
        $allowable_tags = explode(',', $allowable_tags);
        foreach ($allowable_tags as $tag) {
          $tags .= "<$tag>";
        }
      }
      $this->description = substr(strip_tags($k2->introtext . $k2->fulltext, $tags), 0, $maxleght);
      $this->id = $k2->id;
      $this->category = $k2->catid;
      if ($maxleght < strlen(strip_tags($k2->introtext . $k2->fulltext, $tags))) {
        $this->description = preg_replace('/ [^ ]*$/', ' ...', $this->description);
      }
      $this->link = JRoute::_('index.php?option=com_k2&view=item&id=' . $k2->id . ':' . $k2->alias);
      if ($this->params->get('jmslideshow_title_link')) {
        $this->title = '<a href=' . $this->link . '>' . $this->title . '</a>';
      }
    } else {
      return null;
    }
  }
  public function loadImages($image) {
    $this->image = $image;
  }
  function getFirstImage($str) {
    $str = strip_tags($str, '<img>');
    preg_match_all('/<img.+src=[\'"]([^\'"]+)[\'"].*>/i', $str, $matches);
    if (isset($matches[1][0])) {
      return $image = $matches[1][0];
    }
    return '';
  }
  function getMainImage() {
    if (empty($this->image)) {
      $this->image = JPATH_SITE . '/modules/mod_jmslideshow/images/no-image.jpg';
    } elseif (str_replace(array('http://', 'https://'), '', $this->image) != $this->image) {
      $imageArray = @getimagesize($this->image);
      if (!$imageArray[0]) {
        $this->image = JPATH_SITE . '/modules/mod_jmslideshow/images/no-image.jpg';
      }
    } elseif (!file_exists($this->image)) {
      $this->image = JPATH_SITE . '/modules/mod_jmslideshow/images/no-image.jpg';
    }
    $style = $this->params->get('jmslideshow_image_style', 'fill');
    $width = $this->params->get('jmslideshow_image_width');
    $height = $this->params->get('jmslideshow_image_height');
    if (false === file_get_contents($this->image, 0, null, 0, 1)) {
      $this->image = JURI::root() . 'modules/mod_jmslideshow/images/no-image.jpg';
    }
    $file = pathinfo($this->image);
    $basename = $width . 'x' . $height . '_' . $style . '_' . $file['basename'];
    $safe_name = str_replace(array(' ', '(', ')', '[', ']'), '_', $basename);
    $newfile = JM_SLIDESHOW_IMAGE_FOLDER . '/' . $safe_name;
    //print $newfile; die;
    $flush = isset($_GET['flush']) ? true : false;
    if (!file_exists($newfile) || $flush) {
      @unlink($newfile);
      $jmimage = new JMImage($this->image);
      switch ($style) {
        case 'fill':
          $jmimage->reFill($width, $height);
          break;
        case 'fix':
          $jmimage->scale($width, $height);
          $jmimage->enlargeCanvas($width, $height, array(0, 0, 0));
          break;
        case 'stretch':
          $jmimage->resample($width, $height, false);
          break;
      }
      $jmimage->save($newfile);
    }
    return JM_SLIDESHOW_IMAGE_PATH . '/' . $safe_name;
  }
  function getThumbnail() {
    $width = $this->params->get('jmslideshow_image_thumbnail_width', 200);
    $height = $this->params->get('jmslideshow_image_thumbnail_height', 100);
    $file = pathinfo($this->image);
    $basename = $width . 'x' . $height . '_' . $file['basename'];
    $safe_name = str_replace(array(' ', '(', ')', '[', ']'), '_', $basename);
    $newfile = JM_SLIDESHOW_IMAGE_FOLDER . '/' . $safe_name;
    if (!file_exists($newfile)) {
      //unlink($newfile);
      $jmimage = new JMImage($this->image);
      $jmimage->resample($width, $height);
      $jmimage->enlargeCanvas($width, $height, array(255, 255, 255));
      $jmimage->save($newfile);
    }
    return JM_SLIDESHOW_IMAGE_PATH . '/' . $safe_name;
  }
}
ob_clean();