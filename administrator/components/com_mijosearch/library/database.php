<?php
/**
* @package		MijoSearch
* @copyright	2009-2013 Mijosoft LLC, mijosoft.com
* @license		GNU/GPL http://www.gnu.org/copyleft/gpl.html
*/

// No Permission
defined('_JEXEC') or die('Restricted Access');

abstract class MijoDatabase {

	protected static $_dbo;

	public static function getDBO() {
		if (!isset(self::$_dbo)) {
			self::$_dbo = JFactory::getDBO();
		}
	}
	
	public static function quote($text, $escaped = true) {
		self::getDBO();
		
		$result = self::$_dbo->Quote($text, $escaped);
		
		self::showError();
	
		return $result;
	}
	
	public static function getEscaped($text, $extra = false) {
		self::getDBO();
		
		if (version_compare(JVERSION, '1.6.0', 'ge')) {
			$result = self::$_dbo->escape($text, $extra);
		}
		else {
			$result = self::$_dbo->getEscaped($text, $extra);
		}
		
		self::showError();
	
		return $result;
	}
	
	public static function query($query) {
		self::getDBO();
		
		self::$_dbo->setQuery($query);
		$result = self::$_dbo->query();
		
		self::showError();
	
		return $result;
	}
	
	public static function loadResult($query) {
		self::getDBO();
		
		self::$_dbo->setQuery($query);
		$result = self::$_dbo->loadResult();
		
		self::showError();

		return $result;
	}
	
	public static function loadRow($query) {
		self::getDBO();
		
		self::$_dbo->setQuery($query);
		$result = self::$_dbo->loadRow();
		
		self::showError();

		return $result;
	}
	
	public static function loadAssoc($query) {
		self::getDBO();
		
		self::$_dbo->setQuery($query);
		$result = self::$_dbo->loadAssoc();
		
		self::showError();

		return $result;
	}
	
	public static function loadObject($query) {
		self::getDBO();
		
		self::$_dbo->setQuery($query);
		$result = self::$_dbo->loadObject();
		
		self::showError();

		return $result;
	}
	
	public static function loadColumn($query, $index = 0) {
		self::getDBO();
		
		self::$_dbo->setQuery($query);
	    $result = self::$_dbo->loadColumn($index);
		
		self::showError();

		return $result;
	}

	public static function loadResultArray($query, $index = 0) {
		return self::loadColumn($query, $index);
	}

	public static function loadRowList($query, $offset = 0, $limit = 0) {
		self::getDBO();
		
		self::$_dbo->setQuery($query, $offset, $limit);
		$result = self::$_dbo->loadRowList();
		
		self::showError();

		return $result;
	}
	
	public static function loadAssocList($query, $key = '', $offset = 0, $limit = 0) {
		self::getDBO();
		
		self::$_dbo->setQuery($query, $offset, $limit);
		$result = self::$_dbo->loadAssocList($key);
		
		self::showError();

		return $result;
	}

	public static function loadObjectList($query, $key = '', $offset = 0, $limit = 0) {
		self::getDBO();
		
		self::$_dbo->setQuery($query, $offset, $limit);
		$result = self::$_dbo->loadObjectList($key);
		
		self::showError();

		return $result;
	}
	
	protected static function showError() {
		if (Mijosearch::getConfig()->show_db_errors == 1 && self::$_dbo->getErrorNum()) {
			throw new Exception(__METHOD__.' failed. ('.self::$_dbo->getErrorMsg().')');
		}
	}
}