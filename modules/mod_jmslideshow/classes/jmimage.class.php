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
class JMImage {
    /**
     * @var int
     */
    protected $width;
    /**
     * @var int
     */
    protected $height;
    /**
     * @var resource
     */
    protected $image;
    public $type;
    /**
     * Image manipulator constructor
     *
     * @param string $file OPTIONAL Path to image file or image data as string
     * @return void
     */
    public function __construct($file = null) {
        if (null !== $file) {
            if (is_file($file)) {
                $this->setImageFile($file);
            } else {
                $this->setImageString($file);
            }
        }
    }
    /**
     * Set image resource from file
     *
     * @param string $file Path to image file
     * @return ImageManipulator for a fluent interface
     * @throws InvalidArgumentException
     */
    public function setImageFile($file) {
        if (!(is_readable($file) && is_file($file))) {
            throw new InvalidArgumentException("Image file $file is not readable");
        }
        if (is_resource($this->image)) {
            imagedestroy($this->image);
        }
        list ($this->width, $this->height, $this->type) = getimagesize($file);
        switch ($this->type) {
            case IMAGETYPE_GIF :
                $this->image = imagecreatefromgif($file);
                break;
            case IMAGETYPE_JPEG :
                $this->image = imagecreatefromjpeg($file);
                break;
            case IMAGETYPE_PNG :
                $this->image = imagecreatefrompng($file);
                break;
            default :
                throw new InvalidArgumentException("Image type $type not supported");
        }
        return $this;
    }
    /**
     * Set image resource from string data
     *
     * @param string $data
     * @return ImageManipulator for a fluent interface
     * @throws RuntimeException
     */
    public function setImageString($data) {
        if (is_resource($this->image)) {
            imagedestroy($this->image);
        }
        if (str_replace(array('http://', 'https://'), '', $data) != $data) {
            $data = $this->copyImageFormUrl($data);
        }
        //print $data; die;
        if (!$this->image = imagecreatefromstring($data)) {
            return $this;
            //throw new RuntimeException('Cannot create image from data string');
        }
        $this->width = imagesx($this->image);
        $this->height = imagesy($this->image);
        return $this;
    }
    /**
     * Resamples the current image
     *
     * @param int $width New width
     * @param int $height New height
     * @param bool $constrainProportions Constrain current image proportions when resizing
     * @return ImageManipulator for a fluent interface
     * @throws RuntimeException
     */
    public function resample($width, $height, $constrainProportions = true) {
        if (!is_resource($this->image)) {
            throw new RuntimeException('No image set');
        }
        if ($constrainProportions) {
            if ($this->height >= $this->width) {
                $width = round($height / $this->height * $this->width);
            } else {
                $height = round($width / $this->width * $this->height);
            }
        }
        $temp = imagecreatetruecolor($width, $height);
        if ($this->type == IMAGETYPE_PNG) {
            imagealphablending($temp, false);
            imagesavealpha($temp, true);
            $transparent = imagecolorallocatealpha($temp, 255, 255, 255, 127);
            imagefilledrectangle($temp, 0, 0, $width, $height, $transparent);
        }
        imagecopyresampled($temp, $this->image, 0, 0, 0, 0, $width, $height, $this->width, $this->height);
        return $this->_replace($temp);
    }
    public function scale($width, $height) {
        if (!is_resource($this->image)) {
            throw new RuntimeException('No image set');
        }
        $rate = $this->width / $this->height;
        //if()
        $curHeight = $height;
        $curWidth = $width;
        $height = $width / $rate;
        if ($height > $curHeight) {
            $height = $curHeight;
            $width = $height * $rate;
        }
        if ($width > $curWidth) {
            $width = $curWidth;
            $height = $width / $rate;
        }
        $temp = imagecreatetruecolor($width, $height);
        if ($this->type == IMAGETYPE_PNG) {
            imagealphablending($temp, false);
            imagesavealpha($temp, true);
            $transparent = imagecolorallocatealpha($temp, 255, 255, 255, 127);
            imagefilledrectangle($temp, 0, 0, $width, $height, $transparent);
        }
        imagecopyresampled($temp, $this->image, 0, 0, 0, 0, $width, $height, $this->width, $this->height);
        return $this->_replace($temp);
    }
    public function scaleUp($width, $height) {
        if (!is_resource($this->image)) {
            throw new RuntimeException('No image set');
        }
        $rate = $this->width / $this->height;
        $curHeight = $height;
        $height = $width / $rate;
        if ($height < $curHeight) {
            $height = $curHeight;
            $width = $height * $rate;
        }
        $temp = imagecreatetruecolor($width, $height);
        if ($this->type == IMAGETYPE_PNG) {
            imagealphablending($temp, false);
            imagesavealpha($temp, true);
            $transparent = imagecolorallocatealpha($temp, 255, 255, 255, 127);
            imagefilledrectangle($temp, 0, 0, $width, $height, $transparent);
        }
        imagecopyresampled($temp, $this->image, 0, 0, 0, 0, $width, $height, $this->width, $this->height);
        return $this->_replace($temp);
    }
    public function reFill($width, $height) {
        if (!is_resource($this->image)) {
            return $this;
            //throw new RuntimeException('No image set');
        }
        $this->scaleUp($width, $height);
        $temp = imagecreatetruecolor($width, $height);
        if ($this->type == IMAGETYPE_PNG) {
            imagealphablending($temp, false);
            imagesavealpha($temp, true);
            $transparent = imagecolorallocatealpha($temp, 255, 255, 255, 127);
            imagefilledrectangle($temp, 0, 0, $width, $height, $transparent);
        }
        imagecopy($temp, $this->image, 0, 0, 0 - ($width - $this->width) / 2, 0 - ($height - $this->height) / 2, $width, $height);
        return $this->_replace($temp);
    }
    /**
     * Enlarge canvas
     *
     * @param int $width Canvas width
     * @param int $height Canvas height
     * @param array $rgb RGB colour values
     * @param int $xpos X-Position of image in new canvas, null for centre
     * @param int $ypos Y-Position of image in new canvas, null for centre
     * @return ImageManipulator for a fluent interface
     * @throws RuntimeException
     */
    public function enlargeCanvas($width, $height, array $rgb = array(), $xpos = null, $ypos = null) {
        if (!is_resource($this->image)) {
            throw new RuntimeException('No image set');
        }
        $width = max($width, $this->width);
        $height = max($height, $this->height);
        $temp = imagecreatetruecolor($width, $height);
        if (count($rgb) == 3) {
            $bg = imagecolorallocate($temp, $rgb[0], $rgb[1], $rgb[2]);
            imagefill($temp, 0, 0, $bg);
        }
        if (null === $xpos) {
            $xpos = round(($width - $this->width) / 2);
        }
        if (null === $ypos) {
            $ypos = round(($height - $this->height) / 2);
        }
        imagecopy($temp, $this->image, (int) $xpos, (int) $ypos, 0, 0, $this->width, $this->height);
        return $this->_replace($temp);
    }
    /**
     * Crop image
     *
     * @param int|array $x1 Top left x-coordinate of crop box or array of coordinates
     * @param int $y1 Top left y-coordinate of crop box
     * @param int $x2 Bottom right x-coordinate of crop box
     * @param int $y2 Bottom right y-coordinate of crop box
     * @return ImageManipulator for a fluent interface
     * @throws RuntimeException
     */
    public function crop($x1, $y1 = 0, $x2 = 0, $y2 = 0) {
        if (!is_resource($this->image)) {
            throw new RuntimeException('No image set');
        }
        if (is_array($x1) && 4 == count($x1)) {
            list($x1, $y1, $x2, $y2) = $x1;
        }
        $x1 = max($x1, 0);
        $y1 = max($y1, 0);
        $x2 = min($x2, $this->width);
        $y2 = min($y2, $this->height);
        $width = $x2 - $x1;
        $height = $y2 - $y1;
        $temp = imagecreatetruecolor($width, $height);
        imagecopy($temp, $this->image, 0, 0, $x1, $y1, $width, $height);
        return $this->_replace($temp);
    }
    /**
     * Replace current image resource with a new one
     *
     * @param resource $res New image resource
     * @return ImageManipulator for a fluent interface
     * @throws UnexpectedValueException
     */
    protected function _replace($res) {
        if (!is_resource($res)) {
            throw new UnexpectedValueException('Invalid resource');
        }
        if (is_resource($this->image)) {
            imagedestroy($this->image);
        }
        $this->image = $res;
        $this->width = imagesx($res);
        $this->height = imagesy($res);
        return $this;
    }
    /**
     * Save current image to file
     *
     * @param string $fileName
     * @return void
     * @throws RuntimeException
     */
    public function save($fileName, $type = null) {
        if ($type == null)
            $type = $this->type;
        $dir = dirname($fileName);
        if (!is_dir($dir)) {
            if (!mkdir($dir, 0755, true)) {
                throw new RuntimeException('Error creating directory ' . $dir);
            }
        }
        try {
            switch ($type) {
                case IMAGETYPE_GIF :
                    if (!imagegif($this->image, $fileName)) {
                        throw new RuntimeException;
                    }
                    break;
                case IMAGETYPE_PNG :
                    if (!imagepng($this->image, $fileName)) {
                        throw new RuntimeException;
                    }
                    break;
                case IMAGETYPE_JPEG :
                default :
                    if (!imagejpeg($this->image, $fileName, 100)) {
                        throw new RuntimeException;
                    }
            }
        } catch (Exception $ex) {
            return;
            //throw new RuntimeException('Error saving image file to ' . $fileName);
        }
    }
    /**
     * Returns the GD image resource
     *
     * @return resource
     */
    public function getResource() {
        return $this->image;
    }
    /**
     * Get current image resource width
     *
     * @return int
     */
    public function getWidth() {
        return $this->width;
    }
    /**
     * Get current image height
     *
     * @return int
     */
    public function getHeight() {
        return $this->height;
    }
    public function copyImageFormUrl($url) {
        return file_get_contents($url);
        $newifle = dirname(__FILE__) . '/' . basename($url);
        copy($url, $newifle);
        return $newifle;
    }
}