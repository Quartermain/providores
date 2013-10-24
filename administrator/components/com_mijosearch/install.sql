# ---------------
# MijoSearch SQL Installation
# ---------------
DROP TABLE IF EXISTS `#__mijosearch_extensions`;
DROP TABLE IF EXISTS `#__mijosearch_filters`;
DROP TABLE IF EXISTS `#__mijosearch_search_results`;

CREATE TABLE IF NOT EXISTS `#__mijosearch_extensions`(
	`id` INT(255) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL DEFAULT '',
	`extension` VARCHAR(255) NOT NULL DEFAULT '',
	`params` TEXT NOT NULL DEFAULT '',
	`ordering` INT(255) NOT NULL DEFAULT '1',
	`client` INT(2) NOT NULL DEFAULT '0',
	PRIMARY KEY(`id`)
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `#__mijosearch_filters`(
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `group_id` int(10) NOT NULL DEFAULT '0',
  `published` int(1) NOT NULL DEFAULT '0',
   PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `#__mijosearch_filters_groups` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `#__mijosearch_search_results`(
	`id` INT(255) NOT NULL AUTO_INCREMENT,
	`keyword` VARCHAR(255) NOT NULL DEFAULT '',
	`extension` VARCHAR(255) NOT NULL DEFAULT '',
	`search_result` INT(255) NOT NULL DEFAULT '0',
	`search_count` INT(255) NOT NULL DEFAULT '0',
	`search_date` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
	PRIMARY KEY(`id`)
) DEFAULT CHARSET=utf8;