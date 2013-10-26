-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2013 at 03:04 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `providores`
--

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_assets`
--

CREATE TABLE IF NOT EXISTS `i8a13_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `i8a13_assets`
--

INSERT INTO `i8a13_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 1, 89, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.offline":{"6":1},"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(8, 1, 17, 36, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(9, 1, 37, 38, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 39, 40, 1, 'com_installer', 'com_installer', '{"core.admin":[],"core.manage":{"7":0},"core.delete":{"7":0},"core.edit.state":{"7":0}}'),
(11, 1, 41, 42, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(12, 1, 43, 44, 1, 'com_login', 'com_login', '{}'),
(13, 1, 45, 46, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 47, 48, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 49, 50, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
(16, 1, 51, 52, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(17, 1, 53, 54, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 55, 56, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 57, 60, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(20, 1, 61, 62, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 63, 64, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 65, 66, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 67, 68, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 69, 72, 1, 'com_users', 'com_users', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(25, 1, 73, 76, 1, 'com_weblinks', 'com_weblinks', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(26, 1, 77, 78, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 18, 19, 2, 'com_content.category.2', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(30, 19, 58, 59, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(31, 25, 74, 75, 2, 'com_weblinks.category.6', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(32, 24, 70, 71, 1, 'com_users.category.7', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(33, 1, 79, 80, 1, 'com_finder', 'com_finder', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(34, 1, 81, 82, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{"core.admin":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(35, 39, 21, 22, 3, 'com_content.article.1', 'Lorem ipsum dolor sit amet ,  ', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(36, 1, 83, 84, 1, 'com_tags', 'com_tags', '{"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(37, 1, 85, 86, 1, 'com_mijoshop', 'com_mijoshop', '{}'),
(38, 1, 87, 88, 1, 'com_mijosearch', 'com_mijosearch', '{}'),
(39, 8, 20, 25, 2, 'com_content.category.8', 'slideshow', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(40, 39, 23, 24, 3, 'com_content.article.2', 'Lorem ipsum dolor sit amet ,', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(41, 8, 26, 35, 2, 'com_content.category.9', 'new', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(42, 41, 27, 28, 3, 'com_content.article.3', 'Lorem Ipsum dolor ', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(43, 41, 29, 30, 3, 'com_content.article.4', 'Lorem Ipsum dolor 2', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(44, 41, 31, 32, 3, 'com_content.article.5', 'Lorem Ipsum dolor  3', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(45, 41, 33, 34, 3, 'com_content.article.6', 'Lorem Ipsum dolor 4', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_associations`
--

CREATE TABLE IF NOT EXISTS `i8a13_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_banners`
--

CREATE TABLE IF NOT EXISTS `i8a13_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_banner_clients`
--

CREATE TABLE IF NOT EXISTS `i8a13_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_banner_tracks`
--

CREATE TABLE IF NOT EXISTS `i8a13_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_categories`
--

CREATE TABLE IF NOT EXISTS `i8a13_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `i8a13_categories`
--

INSERT INTO `i8a13_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
(1, 0, 0, 0, 17, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '', 553, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 553, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":"","foobar":""}', '', '', '{"page_title":"","author":"","robots":""}', 553, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 553, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 553, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(6, 31, 1, 9, 10, 1, 'uncategorised', 'com_weblinks', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 553, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(7, 32, 1, 11, 12, 1, 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 553, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(8, 39, 1, 13, 14, 1, 'slideshow', 'com_content', 'slideshow', 'slideshow', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 553, '2013-10-26 03:01:30', 0, '0000-00-00 00:00:00', 0, '*', 1),
(9, 41, 1, 15, 16, 1, 'new', 'com_content', 'new', 'new', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 553, '2013-10-26 06:09:13', 0, '0000-00-00 00:00:00', 0, '*', 1);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_contact_details`
--

CREATE TABLE IF NOT EXISTS `i8a13_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL,
  `sortname2` varchar(255) NOT NULL,
  `sortname3` varchar(255) NOT NULL,
  `language` char(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_content`
--

CREATE TABLE IF NOT EXISTS `i8a13_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `i8a13_content`
--

INSERT INTO `i8a13_content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(1, 35, 'Lorem ipsum dolor sit amet ,  ', 'getting-started', '<p>It''s easy to get started creating your website. Knowing some of the basics will help.</p>\r\n<h3>What is a Content Management System?</h3>\r\n<p>A content management system is software that allows you to create and manage webpages easily by separating the creation of your content from the mechanics required to present it on the web.</p>\r\n<p>In this site, the content is stored in a <em>database</em>. The look and feel are created by a <em>template</em>. The Joomla! software brings together the template and the content to create web pages.</p>\r\n<h3>Site and Administrator</h3>\r\n<p>Your site actually has two separate sites. The site (also called the front end) is what visitors to your site will see. The administrator (also called the back end) is only used by people managing your site. You can access the administrator by clicking the "Site Administrator" link on the "User Menu" menu (visible once you login) or by adding /administrator to the end of your domain name.</p>\r\n<p>Log in to the administrator using the username and password created during the installation of Joomla.</p>\r\n<h3>Logging in</h3>\r\n<p>To login to the front end of your site use the login form. Use the user name and password that were created as part of the installation process. Once logged-in you will be able to create and edit articles.</p>\r\n<p>In managing your site, you will be able to create content that only logged-in users are able to see.</p>\r\n<h3>Creating an article</h3>\r\n<p>Once you are logged-in, a new menu will be visible. To create a new article, click on the "Submit Article" link on that menu.</p>\r\n<p>The new article interface gives you a lot of options, but all you need to do is add a title and put something in the content area. To make it easy to find, set the state to published.</p>\r\n<div>You can edit an existing article by clicking on the edit icon (this only displays to users who have the right to edit).</div>\r\n<h3>Template and modules</h3>\r\n<p>The look and feel of your site is controlled by a template. You can change the site name, background colour, highlights colour and more by editing the template options. In the administrator go to the Template Styles and click on My Default Template (Protostar). Most changes will be made on the Options tab.</p>\r\n<p>The boxes around the main content of the site are called modules. You can change the image at the top of the page by editing the Image Module module in the Module Manager.</p>\r\n<h3>Learn more</h3>\r\n<p>There is much more to learn about how to use Joomla! to create the web site you envision. You can learn much more at the <a href="http://docs.joomla.org">Joomla! documentation site</a> and on the<a href="http://forum.joomla.org"> Joomla! forums</a>.</p>', '', 1, 8, '2011-01-01 10:01:00', 553, '', '2013-10-26 09:13:23', 553, 0, '0000-00-00 00:00:00', '2012-09-23 10:01:10', '0000-00-00 00:00:00', '{"image_intro":"images\\/slides\\/food.jpg","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"0","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 8, 1, '', '', 1, 499, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(2, 40, 'Lorem ipsum dolor sit amet ,', 'slideshow', '<p>consectetur adipiscing  vestibulum enim libero.</p>', '', 1, 8, '2013-10-26 03:08:58', 553, '', '2013-10-26 09:13:34', 553, 0, '0000-00-00 00:00:00', '2013-10-26 03:08:58', '0000-00-00 00:00:00', '{"image_intro":"images\\/slides\\/food.jpg","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(3, 42, 'Lorem Ipsum dolor ', 'lorem-ipsum-dolor', '<p><br />Cras faucibus tempor pharetra nisi nec tempus semper, dolor ac nulla.</p>', '', 1, 9, '2013-10-26 06:11:35', 553, '', '0000-00-00 00:00:00', 0, 553, '2013-10-26 09:11:07', '2013-10-26 06:11:35', '0000-00-00 00:00:00', '{"image_intro":"images\\/TheProvidoresTable-Home_03-02.png","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 3, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(4, 43, 'Lorem Ipsum dolor 2', 'lorem-ipsum-dolor-2', '<p><br />Cras faucibus tempor pharetra nisi nec tempus semper, dolor ac nulla. </p>', '', 1, 9, '2013-10-26 06:12:49', 553, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2013-10-26 06:12:49', '0000-00-00 00:00:00', '{"image_intro":"images\\/TheProvidoresTable-Home_03-04.png","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 2, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(5, 44, 'Lorem Ipsum dolor  3', 'lorem-ipsum-dolor-3', '<p><br />Cras faucibus tempor pharetra nisi nec tempus semper, dolor ac nulla. </p>', '', 1, 9, '2013-10-26 06:13:51', 553, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2013-10-26 06:13:51', '0000-00-00 00:00:00', '{"image_intro":"images\\/TheProvidoresTable-Home_03-03.png","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 1, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(6, 45, 'Lorem Ipsum dolor 4', 'lorem-ipsum-dolor-4', '<p><br />Cras faucibus tempor pharetra nisi nec tempus semper, dolor ac nulla. </p>', '', 1, 9, '2013-10-26 06:14:48', 553, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2013-10-26 06:14:48', '0000-00-00 00:00:00', '{"image_intro":"images\\/TheProvidoresTable-Home_03-05.png","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_contentitem_tag_map`
--

CREATE TABLE IF NOT EXISTS `i8a13_contentitem_tag_map` (
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `core_content_id` int(10) unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(8) NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_tag` (`tag_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps items from content tables to tags';

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `i8a13_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_content_rating`
--

CREATE TABLE IF NOT EXISTS `i8a13_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_content_types`
--

CREATE TABLE IF NOT EXISTS `i8a13_content_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) NOT NULL DEFAULT '',
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `table` varchar(255) NOT NULL DEFAULT '',
  `rules` text NOT NULL,
  `field_mappings` text NOT NULL,
  `router` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `i8a13_content_types`
--

INSERT INTO `i8a13_content_types` (`type_id`, `type_title`, `type_alias`, `table`, `rules`, `field_mappings`, `router`) VALUES
(1, 'Article', 'com_content.article', '{"special":{"dbtable":"#__content","key":"id","type":"Content","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"state","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"introtext", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"attribs", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"asset_id"}, "special": {"fulltext":"fulltext"}}', 'ContentHelperRoute::getArticleRoute'),
(2, 'Weblink', 'com_weblinks.weblink', '{"special":{"dbtable":"#__weblinks","key":"id","type":"Weblink","prefix":"WeblinksTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"state","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"url", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special": {}}', 'WeblinksHelperRoute::getWeblinkRoute'),
(3, 'Contact', 'com_contact.contact', '{"special":{"dbtable":"#__contact_details","key":"id","type":"Contact","prefix":"ContactTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"address", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"image", "core_urls":"webpage", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special": {"con_position":"con_position","suburb":"suburb","state":"state","country":"country","postcode":"postcode","telephone":"telephone","fax":"fax","misc":"misc","email_to":"email_to","default_con":"default_con","user_id":"user_id","mobile":"mobile","sortname1":"sortname1","sortname2":"sortname2","sortname3":"sortname3"}}', 'ContactHelperRoute::getContactRoute'),
(4, 'Newsfeed', 'com_newsfeeds.newsfeed', '{"special":{"dbtable":"#__newsfeeds","key":"id","type":"Newsfeed","prefix":"NewsfeedsTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special": {"numarticles":"numarticles","cache_time":"cache_time","rtl":"rtl"}}', 'NewsfeedsHelperRoute::getNewsfeedRoute'),
(5, 'User', 'com_users.user', '{"special":{"dbtable":"#__users","key":"id","type":"User","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"null","core_alias":"username","core_created_time":"registerdate","core_modified_time":"lastvisitDate","core_body":"null", "core_hits":"null","core_publish_up":"null","core_publish_down":"null","access":"null", "core_params":"params", "core_featured":"null", "core_metadata":"null", "core_language":"null", "core_images":"null", "core_urls":"null", "core_version":"null", "core_ordering":"null", "core_metakey":"null", "core_metadesc":"null", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}, "special": {}}', 'UsersHelperRoute::getUserRoute'),
(6, 'Article Category', 'com_content.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special": {"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContentHelperRoute::getCategoryRoute'),
(7, 'Contact Category', 'com_contact.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special": {"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContactHelperRoute::getCategoryRoute'),
(8, 'Newsfeeds Category', 'com_newsfeeds.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special": {"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'NewsfeedsHelperRoute::getCategoryRoute'),
(9, 'Weblinks Category', 'com_weblinks.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special": {"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'WeblinksHelperRoute::getCategoryRoute'),
(10, 'Tag', 'com_tags.tag', '{"special":{"dbtable":"#__tags","key":"tag_id","type":"Tag","prefix":"TagsTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}, "special": {"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path"}}', 'TagsHelperRoute::getTagRoute');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `i8a13_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_extensions`
--

CREATE TABLE IF NOT EXISTS `i8a13_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10027 ;

--
-- Dumping data for table `i8a13_extensions`
--

INSERT INTO `i8a13_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{"name":"com_mailto","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MAILTO_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{"name":"com_wrapper","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_WRAPPER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{"name":"com_admin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_ADMIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '{"name":"com_banners","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_BANNERS_XML_DESCRIPTION","group":""}', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{"name":"com_cache","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CACHE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{"name":"com_categories","type":"component","creationDate":"December 2007","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{"name":"com_checkin","type":"component","creationDate":"Unknown","author":"Joomla! Project","copyright":"(C) 2005 - 2008 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CHECKIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '{"name":"com_contact","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTACT_XML_DESCRIPTION","group":""}', '{"show_contact_category":"hide","show_contact_list":"0","presentation_style":"sliders","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_misc":"1","show_image":"1","image":"","allow_vcard":"0","show_articles":"0","show_profile":"0","show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","show_headings":"1","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","allow_vcard_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_category_crumb":"0","metakey":"","metadesc":"","robots":"","author":"","rights":"","xreference":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{"name":"com_cpanel","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CPANEL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{"name":"com_installer","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_INSTALLER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{"name":"com_languages","type":"component","creationDate":"2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LANGUAGES_XML_DESCRIPTION","group":""}', '{"administrator":"en-GB","site":"en-GB"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{"name":"com_login","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{"name":"com_media","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MEDIA_XML_DESCRIPTION","group":""}', '{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS","upload_maxsize":"10","file_path":"images","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip","upload_mime_illegal":"text\\/html"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{"name":"com_menus","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MENUS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{"name":"com_messages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MESSAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{"name":"com_modules","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MODULES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '{"name":"com_newsfeeds","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_word_count":"0","show_headings":"1","show_name":"1","show_articles":"0","show_link":"1","show_description":"1","show_description_image":"1","display_num":"","show_pagination_limit":"1","show_pagination":"1","show_pagination_results":"1","show_cat_items":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{"name":"com_plugins","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_PLUGINS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 'com_search', 'component', 'com_search', '', 1, 1, 1, 0, '{"name":"com_search","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_SEARCH_XML_DESCRIPTION","group":""}', '{"enabled":"0","show_date":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{"name":"com_templates","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_TEMPLATES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(21, 'com_weblinks', 'component', 'com_weblinks', '', 1, 1, 1, 0, '{"name":"com_weblinks","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_WEBLINKS_XML_DESCRIPTION","group":""}', '{"show_comp_description":"1","comp_description":"","show_link_hits":"1","show_link_description":"1","show_other_cats":"0","show_headings":"0","show_numbers":"0","show_report":"1","count_clicks":"1","target":"0","link_icons":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{"name":"com_content","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTENT_XML_DESCRIPTION","group":""}', '{"article_layout":"_:default","show_title":"1","link_titles":"1","show_intro":"1","show_category":"1","link_category":"1","show_parent_category":"0","link_parent_category":"0","show_author":"1","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"1","show_item_navigation":"1","show_vote":"0","show_readmore":"1","show_readmore_title":"1","readmore_limit":"100","show_icons":"1","show_print_icon":"1","show_email_icon":"1","show_hits":"1","show_noauth":"0","show_publishing_options":"1","show_article_options":"1","show_urls_images_frontend":"0","show_urls_images_backend":"1","targeta":0,"targetb":0,"targetc":0,"float_intro":"left","float_fulltext":"left","category_layout":"_:blog","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_subcat_desc":"1","show_cat_num_articles":"0","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_articles_cat":"1","num_leading_articles":"1","num_intro_articles":"4","num_columns":"2","num_links":"4","multi_column_order":"0","show_subcategory_content":"0","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"1","show_feed_link":"1","feed_summary":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{"name":"com_config","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONFIG_XML_DESCRIPTION","group":""}', '{"filters":{"1":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"NONE","filter_tags":"","filter_attributes":""},"2":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"10":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"12":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{"name":"com_redirect","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_REDIRECT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{"name":"com_users","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_USERS_XML_DESCRIPTION","group":""}', '{"allowUserRegistration":"1","new_usertype":"2","guest_usergroup":"9","sendpassword":"1","useractivation":"2","mail_to_admin":"1","captcha":"","frontend_userparams":"1","site_language":"0","change_login_name":"0","reset_count":"10","reset_time":"1","mailSubjectPrefix":"","mailBodySuffix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(27, 'com_finder', 'component', 'com_finder', '', 1, 1, 0, 0, '{"name":"com_finder","type":"component","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_FINDER_XML_DESCRIPTION","group":""}', '{"show_description":"1","description_length":255,"allow_empty_query":"0","show_url":"1","show_advanced":"1","expand_advanced":"0","show_date_filters":"0","highlight_terms":"1","opensearch_name":"","opensearch_description":"","batch_size":"50","memory_table_limit":30000,"title_multiplier":"1.7","text_multiplier":"0.7","meta_multiplier":"1.2","path_multiplier":"2.0","misc_multiplier":"0.3","stemmer":"snowball"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(28, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '{"name":"com_joomlaupdate","type":"component","creationDate":"February 2012","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(29, 'com_tags', 'component', 'com_tags', '', 1, 1, 1, 1, '{"name":"com_tags","type":"component","creationDate":"December 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"COM_TAGS_XML_DESCRIPTION","group":""}', '{"show_tag_title":"0","tag_list_show_tag_image":"0","tag_list_show_tag_description":"0","tag_list_image":"","show_tag_num_items":"0","tag_list_orderby":"title","tag_list_orderby_direction":"ASC","show_headings":"0","tag_list_show_date":"0","tag_list_show_item_image":"0","tag_list_show_item_description":"0","tag_list_item_maximum_characters":0,"return_any_or_all":"1","include_children":"0","maximum":200,"tag_list_language_filter":"all","tags_layout":"_:default","all_tags_orderby":"title","all_tags_orderby_direction":"ASC","all_tags_show_tag_image":"0","all_tags_show_tag_descripion":"0","all_tags_tag_maximum_characters":20,"all_tags_show_tag_hits":"0","filter_field":"1","show_pagination_limit":"1","show_pagination":"2","show_pagination_results":"1","tag_field_ajax_mode":"1","show_feed_link":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(100, 'PHPMailer', 'library', 'phpmailer', '', 0, 1, 1, 1, '{"name":"PHPMailer","type":"library","creationDate":"2001","author":"PHPMailer","copyright":"(c) 2001-2003, Brent R. Matzelle, (c) 2004-2009, Andy Prevost. All Rights Reserved., (c) 2010-2013, Jim Jagielski. All Rights Reserved.","authorEmail":"jimjag@gmail.com","authorUrl":"https:\\/\\/github.com\\/PHPMailer\\/PHPMailer","version":"5.2.6","description":"LIB_PHPMAILER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(101, 'SimplePie', 'library', 'simplepie', '', 0, 1, 1, 1, '{"name":"SimplePie","type":"library","creationDate":"2004","author":"SimplePie","copyright":"Copyright (c) 2004-2009, Ryan Parman and Geoffrey Sneddon","authorEmail":"","authorUrl":"http:\\/\\/simplepie.org\\/","version":"1.2","description":"LIB_SIMPLEPIE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 'phputf8', 'library', 'phputf8', '', 0, 1, 1, 1, '{"name":"phputf8","type":"library","creationDate":"2006","author":"Harry Fuecks","copyright":"Copyright various authors","authorEmail":"hfuecks@gmail.com","authorUrl":"http:\\/\\/sourceforge.net\\/projects\\/phputf8","version":"0.5","description":"LIB_PHPUTF8_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 'Joomla! Platform', 'library', 'joomla', '', 0, 1, 1, 1, '{"name":"Joomla! Platform","type":"library","creationDate":"2008","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"12.2","description":"LIB_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(104, 'IDNA Convert', 'library', 'idna_convert', '', 0, 1, 1, 1, '{"name":"IDNA Convert","type":"library","creationDate":"2004","author":"phlyLabs","copyright":"2004-2011 phlyLabs Berlin, http:\\/\\/phlylabs.de","authorEmail":"phlymail@phlylabs.de","authorUrl":"http:\\/\\/phlylabs.de","version":"0.8.0","description":"LIB_IDNA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 0, '{"name":"mod_articles_archive","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters.\\n\\t\\tAll rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 0, '{"name":"mod_articles_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_NEWS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '{"name":"mod_articles_popular","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 0, '{"name":"mod_banners","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BANNERS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{"name":"mod_breadcrumbs","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BREADCRUMBS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 0, '{"name":"mod_footer","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FOOTER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{"name":"mod_menu","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{"name":"mod_articles_news","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_NEWS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '{"name":"mod_random_image","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RANDOM_IMAGE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{"name":"mod_related_items","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RELATED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '{"name":"mod_search","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SEARCH_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '{"name":"mod_stats","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{"name":"mod_syndicate","type":"module","creationDate":"May 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SYNDICATE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 0, '{"name":"mod_users_latest","type":"module","creationDate":"December 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_USERS_LATEST_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(217, 'mod_weblinks', 'module', 'mod_weblinks', '', 0, 1, 1, 0, '{"name":"mod_weblinks","type":"module","creationDate":"July 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WEBLINKS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '{"name":"mod_whosonline","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WHOSONLINE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '{"name":"mod_wrapper","type":"module","creationDate":"October 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WRAPPER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 0, '{"name":"mod_articles_category","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 0, '{"name":"mod_articles_categories","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{"name":"mod_languages","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LANGUAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(223, 'mod_finder', 'module', 'mod_finder', '', 0, 1, 0, 0, '{"name":"mod_finder","type":"module","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FINDER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{"name":"mod_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{"name":"mod_logged","type":"module","creationDate":"January 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGGED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"March 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{"name":"mod_menu","type":"module","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{"name":"mod_popular","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{"name":"mod_quickicon","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_QUICKICON_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{"name":"mod_status","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATUS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{"name":"mod_submenu","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SUBMENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{"name":"mod_title","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TITLE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{"name":"mod_toolbar","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TOOLBAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '{"name":"mod_multilangstatus","type":"module","creationDate":"September 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MULTILANGSTATUS_XML_DESCRIPTION","group":""}', '{"cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(314, 'mod_version', 'module', 'mod_version', '', 1, 1, 1, 0, '{"name":"mod_version","type":"module","creationDate":"January 2012","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_VERSION_XML_DESCRIPTION","group":""}', '{"format":"short","product":"1","cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(315, 'mod_stats_admin', 'module', 'mod_stats_admin', '', 1, 1, 1, 0, '{"name":"mod_stats_admin","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":""}', '{"serverinfo":"0","siteinfo":"0","counter":"0","increase":"0","cache":"1","cache_time":"900","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(316, 'mod_tags_popular', 'module', 'mod_tags_popular', '', 0, 1, 1, 0, '{"name":"mod_tags_popular","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_POPULAR_XML_DESCRIPTION","group":""}', '{"maximum":"5","timeframe":"alltime","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(317, 'mod_tags_similar', 'module', 'mod_tags_similar', '', 0, 1, 1, 0, '{"name":"mod_tags_similar","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_SIMILAR_XML_DESCRIPTION","group":""}', '{"maximum":"5","matchtype":"any","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_gmail","type":"plugin","creationDate":"February 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_GMAIL_XML_DESCRIPTION","group":""}', '{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{"name":"plg_authentication_joomla","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTH_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_ldap","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LDAP_XML_DESCRIPTION","group":""}', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(404, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{"name":"plg_content_emailcloak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION","group":""}', '{"mode":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(406, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{"name":"plg_content_loadmodule","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOADMODULE_XML_DESCRIPTION","group":""}', '{"style":"xhtml"}', '', '', 0, '2011-09-18 15:22:50', 0, 0),
(407, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagebreak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION","group":""}', '{"title":"1","multipage_toc":"1","showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagenavigation","type":"plugin","creationDate":"January 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_PAGENAVIGATION_XML_DESCRIPTION","group":""}', '{"position":"1"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 1, 1, 0, '{"name":"plg_content_vote","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_VOTE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_codemirror","type":"plugin","creationDate":"28 March 2011","author":"Marijn Haverbeke","copyright":"","authorEmail":"N\\/A","authorUrl":"","version":"1.0","description":"PLG_CODEMIRROR_XML_DESCRIPTION","group":""}', '{"linenumbers":"0","tabmode":"indent"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_none","type":"plugin","creationDate":"August 2004","author":"Unknown","copyright":"","authorEmail":"N\\/A","authorUrl":"","version":"3.0.0","description":"PLG_NONE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(412, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 0, '{"name":"plg_editors_tinymce","type":"plugin","creationDate":"2005-2012","author":"Moxiecode Systems AB","copyright":"Moxiecode Systems AB","authorEmail":"N\\/A","authorUrl":"tinymce.moxiecode.com\\/","version":"3.5.6","description":"PLG_TINY_XML_DESCRIPTION","group":""}', '{"mode":"1","skin":"0","entity_encoding":"raw","lang_mode":"0","lang_code":"en","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","invalid_elements":"script,applet,iframe","extended_elements":"","toolbar":"top","toolbar_align":"left","html_height":"550","html_width":"750","resizing":"true","resize_horizontal":"false","element_path":"1","fonts":"1","paste":"1","searchreplace":"1","insertdate":"1","format_date":"%Y-%m-%d","inserttime":"1","format_time":"%H:%M:%S","colors":"1","table":"1","smilies":"1","media":"1","hr":"1","directionality":"1","fullscreen":"1","style":"1","layer":"1","xhtmlxtras":"1","visualchars":"1","nonbreaking":"1","template":"1","blockquote":"1","wordcount":"1","advimage":"1","advlink":"1","advlist":"1","autosave":"1","contextmenu":"1","inlinepopups":"1","custom_plugin":"","custom_button":""}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 1, '{"name":"plg_editors-xtd_article","type":"plugin","creationDate":"October 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_ARTICLE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_image","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_IMAGE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_pagebreak","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_readmore","type":"plugin","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_READMORE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(417, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '{"name":"plg_search_categories","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '{"name":"plg_search_contacts","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTACTS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '{"name":"plg_search_content","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTENT_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '{"name":"plg_search_newsfeeds","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(421, 'plg_search_weblinks', 'plugin', 'weblinks', 'search', 0, 1, 1, 0, '{"name":"plg_search_weblinks","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_WEBLINKS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 0, 1, 1, '{"name":"plg_system_languagefilter","type":"plugin","creationDate":"July 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(423, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 1, 1, 0, '{"name":"plg_system_p3p","type":"plugin","creationDate":"September 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_P3P_XML_DESCRIPTION","group":""}', '{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(424, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '{"name":"plg_system_cache","type":"plugin","creationDate":"February 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CACHE_XML_DESCRIPTION","group":""}', '{"browsercache":"0","cachetime":"15"}', '', '', 0, '0000-00-00 00:00:00', 9, 0);
INSERT INTO `i8a13_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(425, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '{"name":"plg_system_debug","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_DEBUG_XML_DESCRIPTION","group":""}', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(426, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '{"name":"plg_system_log","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOG_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(427, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 0, 1, 1, '{"name":"plg_system_redirect","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_REDIRECT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(428, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{"name":"plg_system_remember","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_REMEMBER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(429, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{"name":"plg_system_sef","type":"plugin","creationDate":"December 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEF_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(430, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{"name":"plg_system_logout","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(431, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 0, '{"name":"plg_user_contactcreator","type":"plugin","creationDate":"August 2009","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTACTCREATOR_XML_DESCRIPTION","group":""}', '{"autowebpage":"","category":"34","autopublish":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{"name":"plg_user_joomla","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2009 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_JOOMLA_XML_DESCRIPTION","group":""}', '{"autoregister":"1"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 0, '{"name":"plg_user_profile","type":"plugin","creationDate":"January 2008","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_PROFILE_XML_DESCRIPTION","group":""}', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{"name":"plg_extension_joomla","type":"plugin","creationDate":"May 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '{"name":"plg_content_joomla","type":"plugin","creationDate":"November 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(436, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 0, 1, 0, '{"name":"plg_system_languagecode","type":"plugin","creationDate":"November 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(437, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_joomlaupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(438, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_extensionupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(439, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 0, 1, 0, '{"name":"plg_captcha_recaptcha","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION","group":""}', '{"public_key":"","private_key":"","theme":"clean"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(440, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '{"name":"plg_system_highlight","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(441, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 0, 1, 0, '{"name":"plg_content_finder","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_FINDER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(442, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_categories","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CATEGORIES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(443, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_contacts","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTACTS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(444, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_content","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTENT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(445, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_newsfeeds","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(446, 'plg_finder_weblinks', 'plugin', 'weblinks', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_weblinks","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_WEBLINKS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(447, 'plg_finder_tags', 'plugin', 'tags', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_tags","type":"plugin","creationDate":"February 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_TAGS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(503, 'beez3', 'template', 'beez3', '', 0, 1, 1, 0, '{"name":"beez3","type":"template","creationDate":"25 November 2009","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"3.1.0","description":"TPL_BEEZ3_XML_DESCRIPTION","group":""}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","templatecolor":"nature"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{"name":"hathor","type":"template","creationDate":"May 2010","author":"Andrea Tarr","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"hathor@tarrconsulting.com","authorUrl":"http:\\/\\/www.tarrconsulting.com","version":"3.0.0","description":"TPL_HATHOR_XML_DESCRIPTION","group":""}', '{"showSiteName":"0","colourChoice":"0","boldText":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(506, 'protostar', 'template', 'protostar', '', 0, 1, 1, 0, '{"name":"protostar","type":"template","creationDate":"4\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_PROTOSTAR_XML_DESCRIPTION","group":""}', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(507, 'isis', 'template', 'isis', '', 1, 1, 1, 0, '{"name":"isis","type":"template","creationDate":"3\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_ISIS_XML_DESCRIPTION","group":""}', '{"templateColor":"","logoFile":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 'English (United Kingdom)', 'language', 'en-GB', '', 0, 1, 1, 1, '{"name":"English (United Kingdom)","type":"language","creationDate":"2013-03-07","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.4","description":"en-GB site language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 'English (United Kingdom)', 'language', 'en-GB', '', 1, 1, 1, 1, '{"name":"English (United Kingdom)","type":"language","creationDate":"2013-03-07","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.4","description":"en-GB administrator language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{"name":"files_joomla","type":"file","creationDate":"August 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.5","description":"FILES_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10000, 'T3 Framework', 'plugin', 't3', 'system', 0, 1, 1, 0, '{"name":"T3 Framework","type":"plugin","creationDate":"05 August 2013","author":"JoomlArt.com","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"info@joomlart.com","authorUrl":"http:\\/\\/www.t3-framework.org","version":"1.4.1","description":"\\n\\t\\n\\t<div align=\\"center\\">\\n\\t\\t<div class=\\"alert alert-success\\" style=\\"background-color:#DFF0D8;border-color:#D6E9C6;color: #468847;padding: 1px 0;\\">\\n\\t\\t\\t\\t<a href=\\"http:\\/\\/t3-framework.org\\/\\"><img src=\\"http:\\/\\/joomlart.s3.amazonaws.com\\/images\\/jat3v3-documents\\/message-installation\\/logo.png\\" alt=\\"some_text\\" width=\\"300\\" height=\\"99\\"><\\/a>\\n\\t\\t\\t\\t<h4><a href=\\"http:\\/\\/t3-framework.org\\/\\" title=\\"\\">Home<\\/a> | <a href=\\"http:\\/\\/demo.t3-framework.org\\/\\" title=\\"\\">Demo<\\/a> | <a href=\\"http:\\/\\/t3-framework.org\\/documentation\\" title=\\"\\">Document<\\/a> | <a href=\\"https:\\/\\/github.com\\/t3framework\\/t3\\/blob\\/master\\/CHANGELOG.md\\" title=\\"\\">Changelog<\\/a><\\/h4>\\n\\t\\t<p> <\\/p>\\n\\t\\t<p>Copyright 2004 - 2013 <a href=''http:\\/\\/www.joomlart.com\\/'' title=''Visit Joomlart.com!''>JoomlArt.com<\\/a>.<\\/p>\\n\\t\\t<\\/div>\\n     <style>table.adminform{width: 100%;}<\\/style>\\n\\t <\\/div>\\n\\t\\t\\n\\t","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10001, 'providores', 'template', 'providores', '', 0, 1, 1, 0, '{"name":"providores","type":"template","creationDate":"05 August 2013","author":"trungnq","copyright":"Copyright (C), J.O.O.M Solutions Co., Ltd. All Rights Reserved.","authorEmail":"trungqt2005@gmail.com","authorUrl":"http:\\/\\/www.t3-framework.org","version":"1.4.1","description":"\\n\\t\\t\\n\\t\\t<div align=\\"center\\">\\n\\t\\t\\t<div class=\\"alert alert-success\\" style=\\"background-color:#DFF0D8;border-color:#D6E9C6;color: #468847;padding: 1px 0;\\">\\n\\t\\t\\t\\t<a href=\\"http:\\/\\/t3-framework.org\\/\\"><img src=\\"http:\\/\\/joomlart.s3.amazonaws.com\\/images\\/jat3v3-documents\\/message-installation\\/logo.png\\" alt=\\"some_text\\" width=\\"300\\" height=\\"99\\"><\\/a>\\n\\t\\t\\t\\t<h4><a href=\\"http:\\/\\/t3-framework.org\\/\\" title=\\"\\">Home<\\/a> | <a href=\\"http:\\/\\/demo.t3-framework.org\\/\\" title=\\"\\">Demo<\\/a> | <a href=\\"http:\\/\\/t3-framework.org\\/documentation\\" title=\\"\\">Document<\\/a> | <a href=\\"https:\\/\\/github.com\\/t3framework\\/t3\\/blob\\/master\\/CHANGELOG.md\\" title=\\"\\">Changelog<\\/a><\\/h4>\\n\\t\\t\\t\\t<p> <\\/p>\\n\\t\\t\\t\\t<span style=\\"color:#FF0000\\">Note: T3 blank requires T3 plugin to be installed and enabled.<\\/span><p><\\/p>\\n\\t\\t\\t\\t<p>Copyright 2004 - 2013 <a href=''http:\\/\\/www.joomlart.com\\/'' title=''Visit Joomlart.com!''>JoomlArt.com<\\/a>.<\\/p>\\n\\t\\t\\t<\\/div>\\n\\t\\t\\t<style>table.adminform{width: 100%;}<\\/style>\\n\\t\\t<\\/div>\\n\\t\\t\\n\\t","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10002, 'JA Content Slider', 'module', 'mod_jacontentslider', '', 0, 1, 0, 0, '{"name":"JA Content Slider","type":"module","creationDate":"15 July 2013","author":"JoomlArt.com","copyright":"Copyright (C), J.O.O.M Solutions Co., Ltd. All Rights Reserved.","authorEmail":"webmaster@joomlart.com","authorUrl":"www.joomlart.com","version":"2.6.5","description":"\\n\\t\\n\\t \\t<span style=\\"color: #008000;\\"><strong>JA Content Slider Module for Joomla! 2.5 and Joomla! 3.x<\\/strong><\\/span><br \\/>\\n\\t \\t<p><img alt=\\"JA Content Slider Module\\" src=\\"http:\\/\\/static.joomlart.com\\/images\\/stories\\/extensions\\/joomla\\/ja_contentslider.png\\" \\/><\\/p>\\n\\t\\t<div style=''font-weight:normal''>\\n\\t \\tSlide your articles from Joomla categories with cool effects, rich backend configs covering layout, animation control, auto thumbnail creation, images size, number of articles, sorting and much more\\n\\t \\t<p style=\\"clear:both\\"><span style=\\"color: #ff6600;\\"><strong>Important Instruction:<\\/strong><\\/span><\\/p>\\n\\t\\tCheck in configuration in your site if it does not have this line \\"var $absolute_path by ''your absolute path'';\\" you have to add its there to run.\\n\\t\\t<p style=\\"clear:both\\"><span style=\\"color: #ff6600;\\"><strong>Brief features:<\\/strong><\\/span><\\/p>\\n\\t \\t<ul>\\n\\t\\t\\t  <li>Slide your content with width and height properties.<\\/li>\\n\\t\\t\\t  <li>You can set the number of content to display in a tab.<\\/li>\\n\\t\\t\\t  <li>You can set categories contents to display.<\\/li>\\n\\t\\t\\t  <li>You can set display title, link title, introtext, readmore text links or not.<\\/li>\\n\\t\\t\\t  <li>You can set the slide to auto run or not. Default is YES.<\\/li>\\n\\t\\t\\t  <li>Set direction of slide. Default is left.<\\/li>\\n\\t\\t\\t  <li>Set time for rolling delay time and animation time.<\\/li>\\n\\t\\t<\\/ul>\\n\\t\\t<p><strong><span style=\\"color: #ff0000;\\">Upgrade Method:<\\/span><br \\/><\\/strong><\\/p>\\n\\t\\t<ol><li>You can install new version directly over this version. Uninstallation is not required. Backup any customized files before upgrading. OR<\\/li><li>Use <strong><a href=\\"http:\\/\\/extensions.joomla.org\\/extensions\\/core-enhancements\\/installers\\/12077\\" target=\\"_blank\\">JA Extensions Manager<\\/a><\\/strong> Component for easy upgrades and rollbacks. <strong><a href=\\"http:\\/\\/www.youtube.com\\/user\\/JoomlArt#p\\/c\\/BC9B0C0BFE98657E\\/2\\/mNAuJRmifG8\\" target=\\"_blank\\">Watch Video..<\\/a><\\/strong><\\/li><\\/ol>\\n\\t\\t<p><span style=\\"color: #008000;\\"><strong>Links:<\\/strong><\\/span><\\/p>\\n\\t\\t<ul><li><a target=\\"_blank\\" href=\\"http:\\/\\/www.joomlart.com\\/forums\\/showthread.php?51825\\">JA Content Slider Userguide<\\/a><\\/li><li><a target=\\"_blank\\" href=\\"http:\\/\\/pm.joomlart.com\\/browse\\/JAECMODJACSLIDERJVI\\">Report Bug<\\/a><\\/li><li><a target=\\"_blank\\" href=\\"http:\\/\\/update.joomlart.com\\/\\">Updates &amp; Versions<\\/a><\\/li><\\/ul>\\n\\t\\t<p>Copyright 2004 - 2013 <a href=\\"http:\\/\\/www.joomlart.com\\/\\" title=\\"Visit Joomlart.com!\\">JoomlArt.com<\\/a>.<\\/p>\\n\\t\\t<\\/div>\\n\\t \\n\\t","group":""}', '{"source":"content","folder_images":"","catid":"","k2catsid":"","text_heading":"","showTab":"1","sort_order_field":"created","sort_order":"DESC","numElem":"3","maxitems":"10","showtitle":"1","link_titles":"1","showimages":"1","iwidth":"130","iheight":"90","showreadmore":"0","showintrotext":"1","numchar":"50","xwidth":"140","xheight":"170","auto":"0","mode":"horizontal","direction":"left","delaytime":"5000","animationtime":"1000","showbutton":"1","scroll_when":"click","source-articles-images-thumbnail_mode":"crop","source-articles-images-thumbnail_mode-resize-use_ratio":"0","cache":"1","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10003, 'com_mijoshop', 'component', 'com_mijoshop', '', 1, 1, 0, 0, '{"name":"COM_MIJOSHOP","type":"component","creationDate":"October 2013","author":"Mijosoft LLC","copyright":"2009-2013 Mijosoft LLC","authorEmail":"info@mijosoft.com","authorUrl":"http:\\/\\/mijosoft.com","version":"2.1.7","description":"MijoShop is a powerful and turn-key ready shopping cart component that is designed feature rich and user friendly for Joomla.","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10004, 'MijoShop - All-in-One', 'module', 'mod_mijoshop', '', 0, 1, 0, 0, '{"name":"MijoShop - All-in-One","type":"module","creationDate":"October 2012","author":"Mijosoft LLC","copyright":"Copyright (C) Mijosoft LLC, mijosoft.com","authorEmail":"info@mijosoft.com","authorUrl":"http:\\/\\/mijosoft.com","version":"1.0.0","description":"MijoShop All-in-One Module","group":""}', '{"moduleclass_sfx":"","module":"mijoshopcart","layout_id":"12"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10005, 'MijoShop Orders', 'module', 'mod_mijoshop_orders', '', 1, 1, 2, 0, '{"name":"MijoShop Orders","type":"module","creationDate":"October 2012","author":"Mijosoft LLC","copyright":"Copyright (C) Mijosoft LLC, mijosoft.com","authorEmail":"info@mijosoft.com","authorUrl":"http:\\/\\/mijosoft.com","version":"1.0.0","description":"This module will display a list MijoShop orders in back-end. Set the module poisiton to \\"cpanel\\" .","group":""}', '{"limit":"10","display_pending":"0","display_confirmed":"1","display_cancelled":"0","display_refunded":"0","display_shipped":"0","ordering":"id"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10006, 'MijoShop - Quick Icons', 'module', 'mod_mijoshop_quickicons', '', 1, 1, 2, 0, '{"name":"MijoShop - Quick Icons","type":"module","creationDate":"October 2012","author":"Mijosoft LLC","copyright":"Copyright (C) Mijosoft LLC, mijosoft.com","authorEmail":"info@mijosoft.com","authorUrl":"http:\\/\\/mijosoft.com","version":"1.0.0","description":"This module shows MijoShop Quick Icons on the Admin area Home Page. Publish in \\"icon\\" position.","group":""}', '{"mijoshop_dashboard":"1","mijoshop_categories":"1","mijoshop_products":"1","mijoshop_coupons":"0","mijoshop_customers":"1","mijoshop_orders":"1","mijoshop_affiliates":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10007, 'Content - MijoShop', 'plugin', 'mijoshop', 'content', 0, 0, 1, 0, '{"name":"Content - MijoShop","type":"plugin","creationDate":"October 2012","author":"Mijosoft LLC","copyright":"Copyright (C) Mijosoft LLC, mijosoft.com","authorEmail":"info@mijosoft.com","authorUrl":"http:\\/\\/mijosoft.com","version":"1.0.0","description":"Display any product anywhere by using this syntax (only id=5 is compulsory): {mijoshop id=5,image=1:80:80,name=1,price=1,rating=1,button=1,options=option_oc[226]:15}","group":""}', '{"show_image":"1","image_width":"80","image_height":"80","show_name":"1","show_price":"1","show_rating":"1","show_button":"1","show_box":"0","show_heading":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10008, 'Button - Mijoshop', 'plugin', 'mijoshop', 'editors-xtd', 0, 1, 1, 0, '{"name":"Button - Mijoshop","type":"plugin","creationDate":"January 2013","author":"Mijosoft LLC","copyright":"Copyright (C) Mijosoft LLC, mijosoft.com","authorEmail":"info@mijosoft.com","authorUrl":"http:\\/\\/mijosoft.com","version":"1.0.0","description":"Editor buttons plugin for Mijoshop","group":""}', '{"enable_frontend":"0"}', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(10009, 'MijoShop - ACL', 'plugin', 'acl', 'mijoshop', 0, 1, 1, 0, '{"name":"MijoShop - ACL","type":"plugin","creationDate":"March 2013","author":"Mijosoft LLC","copyright":"Copyright (C) Mijosoft LLC, mijosoft.com","authorEmail":"info@mijosoft.com","authorUrl":"http:\\/\\/mijosoft.com","version":"1.0.0","description":"Joomla ACL integration for MijoShop.","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10010, 'MijoShop - Email Article', 'plugin', 'emailarticle', 'mijoshop', 0, 1, 1, 0, '{"name":"MijoShop - Email Article","type":"plugin","creationDate":"March 2013","author":"Mijosoft LLC","copyright":"Copyright (C) Mijosoft LLC, mijosoft.com","authorEmail":"info@mijosoft.com","authorUrl":"http:\\/\\/mijosoft.com","version":"1.0.0","description":"Email Article integration for MijoShop.","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10011, 'MijoShop - MijoShop Customer Group', 'plugin', 'mijoshop', 'mijoshop', 0, 1, 1, 0, '{"name":"MijoShop - MijoShop Customer Group","type":"plugin","creationDate":"March 2013","author":"Mijosoft LLC","copyright":"Copyright (C) Mijosoft LLC, mijosoft.com","authorEmail":"info@mijosoft.com","authorUrl":"http:\\/\\/mijosoft.com","version":"1.0.0","description":"MijoShop Customer Group integration for MijoShop.","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10012, 'MijoShop - SQL', 'plugin', 'sql', 'mijoshop', 0, 1, 1, 0, '{"name":"MijoShop - SQL","type":"plugin","creationDate":"March 2013","author":"Mijosoft LLC","copyright":"Copyright (C) Mijosoft LLC, mijosoft.com","authorEmail":"info@mijosoft.com","authorUrl":"http:\\/\\/mijosoft.com","version":"1.0.0","description":"Run \\"custom SQL query\\" integration for MijoShop.","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10013, 'Mijoshop - Triggers', 'plugin', 'trigger', 'mijoshop', 0, 1, 1, 0, '{"name":"Mijoshop - Triggers","type":"plugin","creationDate":"October 2012","author":"Mijosoft LLC","copyright":"Copyright (C) Mijosoft LLC, mijosoft.com","authorEmail":"info@mijosoft.com","authorUrl":"http:\\/\\/mijosoft.com","version":"1.0.0","description":"Triggers for MijoShop.","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10014, 'Search - MijoShop', 'plugin', 'mijoshop', 'search', 0, 0, 1, 0, '{"name":"Search - MijoShop","type":"plugin","creationDate":"October 2012","author":"Mijosoft LLC","copyright":"Copyright (C) Mijosoft LLC, mijosoft.com","authorEmail":"info@mijosoft.com","authorUrl":"http:\\/\\/mijosoft.com","version":"1.0.0","description":"Displays MijoShop products within the search results","group":""}', '{"search_limit":"50"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10015, 'plg_finder_mijoshop', 'plugin', 'mijoshop', 'finder', 0, 0, 1, 0, '{"name":"plg_finder_mijoshop","type":"plugin","creationDate":"January 2012","author":"Mijosoft LLC","copyright":"Copyright (C) Mijosoft LLC, mijosoft.com","authorEmail":"info@mijosoft.com","authorUrl":"http:\\/\\/mijosoft.com","version":"1.0.0","description":"Smart Search - Mijoshop","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10016, 'System - MijoShop Redirect', 'plugin', 'mijoshopredirect', 'system', 0, 1, 1, 0, '{"name":"System - MijoShop Redirect","type":"plugin","creationDate":"October 2012","author":"Mijosoft LLC","copyright":"Copyright (C) Mijosoft LLC, mijosoft.com","authorEmail":"info@mijosoft.com","authorUrl":"http:\\/\\/mijosoft.com","version":"1.0.0","description":"This plugin makes some required redirects for MijoShop and allows you to redirect imported data from AceShop, Virtuemart, HikaShop, redSHOP, Tienda and JoomShopping to MijoShop.","group":""}', '{"aceshop":"0","virtuemart":"0","hikashop":"0","redshop":"0","tienda":"0","joomshopping":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10017, 'User - MijoShop', 'plugin', 'mijoshop', 'user', 0, 1, 1, 0, '{"name":"User - MijoShop","type":"plugin","creationDate":"October 2012","author":"Mijosoft LLC","copyright":"Copyright (C) Mijosoft LLC, mijosoft.com","authorEmail":"info@mijosoft.com","authorUrl":"http:\\/\\/mijosoft.com","version":"1.0.0","description":"User plugin to integrate Joomla users with OpenCart.","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 100, 0),
(10018, 'System - MijoShop jQuery', 'plugin', 'mijoshopjquery', 'system', 0, 1, 1, 0, '{"name":"System - MijoShop jQuery","type":"plugin","creationDate":"May 2013","author":"Mijosoft LLC","copyright":"Copyright (C) Mijosoft LLC, mijosoft.com","authorEmail":"info@mijosoft.com","authorUrl":"http:\\/\\/mijosoft.com","version":"1.0.0","description":"jQuery libraries required for MijoShop. Don''t unpublish this plugin unless you know what you''re doing.","group":""}', '{"only_mijoshop":"1","load_main":"1","remove_other_jq":"0","load_noconflict":"1","load_ui":"1","load_migrate":"0","load_cookie":"0","load_colorbox":"1","load_cycle":"1","load_jcarousel":"1","load_nivo_slider":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10019, 'MijoShop Library', 'file', 'mijoshoplibrary', '', 0, 1, 0, 0, '{"name":"MijoShop Library","type":"file","creationDate":"June 2013","author":"Mijosoft LLC","copyright":"Copyright (C) Mijosoft LLC, mijosoft.com","authorEmail":"info@mijosoft.com","authorUrl":"http:\\/\\/mijosoft.com","version":"1.0.0","description":"The core library used by MijoShop component.","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10020, 'com_mijosearch', 'component', 'com_mijosearch', '', 1, 1, 0, 0, '{"name":"COM_MIJOSEARCH","type":"component","creationDate":"May 2013","author":"Mijosoft LLC","copyright":"2009-2013 Mijosoft LLC","authorEmail":"info@mijosoft.com","authorUrl":"www.mijosoft.com","version":"2.0.2","description":"MijoSearch is a flexible and powerful Joomla! Search component with an easy-to-use user interface that provides searching through all components from front-end and back-end with custom fields.","group":""}', '{"version_checker":"1","cache_versions":"1","cache_extensions":"0","show_db_errors":"0","show_properties":"1","pid":"","suggestions_always":"0","suggestions_engine":"google","suggestions_yahoo_key":"","suggestions_bing_key":"","google":"0","google_more_results":"0","google_more_results_length":"4","save_results":"1","show_order":"1","show_url":"1","show_search_refine":"1","show_display":"1","show_ext_flt":"1","show_adv_search":"1","yahoo_sections":"1","search_char":"3","access_checker":"1","result_limit":"50","enable_complete":"1","enable_suggestion":"1","enable_highlight":"1","show_desc":"1","show_image":"1","image_positions":"_left","image_sizew":"80","image_sizeh":"80","title_length":"60","display_limit":"15","description_length":"350","max_search_char":"20","blacklist":"","results_format":"1","date_format":"l, d F Y","admin_show_url":"1","admin_show_desc":"1","admin_title_length":"80","admin_show_display":"1","admin_show_properties":"1","admin_show_ext_flt":"1","admin_enable_complete":"1","admin_enable_suggestion":"1","admin_enable_highlight":"1","admin_show_page_title":"1","admin_show_page_desc":"1","admin_description_length":"350","admin_max_search_char":"20","admin_result_limit":"50","highlight_textall":"141414","highlight_all":"ffffb2","highlight_back1":"ffff9e","highlight_back2":"ffadb1","highlight_back3":"a3ccff","highlight_back4":"abffd2","highlight_back5":"ff8fe9","highlight_text1":"0a080a","highlight_text2":"242424","highlight_text3":"0f0b0f","highlight_text4":"141214","highlight_text5":"1a191a","ajax_show_desc":"1","ajax_show_image":"1","ajax_image_positions":"left","ajax_image_sizew":"60","ajax_image_sizeh":"60","ajax_description_length":"100","ajax_title_length":"30","ajax_show_properties":"1","ajax_display_limit":"5","ajax_enable":"1","ajax_result_width":"250","ajax_title_color":"#4e6170","ajax_title_color_hover":"#ffffff","ajax_desc_color":"#7794aa","ajax_desc_color_hover":"#ffffff","ajax_bg_color":"#ffffff","ajax_bg_color_hover":"#0044CC","ajax_button_class":"btn btn-primary","ajax_title_bg":"#e4eaee"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10021, 'MijoSearch', 'module', 'mod_mijosearch', '', 0, 1, 0, 0, '{"name":"MijoSearch","type":"module","creationDate":"February 2013","author":"Mijosoft LLC","copyright":"2009-2013 Mijosoft LLC","authorEmail":"info@mijosoft.com","authorUrl":"www.mijosoft.com","version":"1.0.0","description":"MijoSearch module for front-end.","group":""}', '{"moduleclass_sfx":"","set_itemid":"","text":"search...","filter":"","enable_complete":"1","enable_ajaxsearch":"0","layout":"0","show_order":"0","show_sections":"0","show_sections_label":"1","show_extra_fields":"1","show_button":"0","show_advanced_search_link":"0","box_class":"mijosearch_input_module_simple","button_class":"btn btn-primary"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10022, 'MijoSearch', 'module', 'mod_mijosearch_admin', '', 1, 1, 2, 0, '{"name":"MijoSearch","type":"module","creationDate":"February 2013","author":"Mijosoft LLC","copyright":"2009-2013 Mijosoft LLC","authorEmail":"info@mijosoft.com","authorUrl":"www.mijosoft.com","version":"1.0.0","description":"MijoSearch module for back-end.","group":""}', '{"moduleclass_sfx":"","text":"search...","show_order":"0","show_ext_flt":"0","show_advanced_options":"0","show_advanced_search":"0","advanced_label":"Advanced Search","enable_complete":"1","show_button":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10023, 'MijoSearch - Quick Icons', 'module', 'mod_mijosearch_quickicons', '', 1, 1, 2, 0, '{"name":"MijoSearch - Quick Icons","type":"module","creationDate":"February 2013","author":"Mijosoft LLC","copyright":"2009-2013 Mijosoft LLC","authorEmail":"info@mijosoft.com","authorUrl":"www.mijosoft.com","version":"1.0.0","description":"This module shows MijoSearch Quick Icons on the Admin area Home Page. Publish in \\"cpanel\\" position.","group":""}', '{"mijosearch_version":"1","mijosearch_configuration":"0","mijosearch_extensions":"0","mijosearch_search":"1","mijosearch_filter":"0","mijosearch_statistics":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10024, 'BT Login', 'module', 'mod_bt_login', '', 0, 1, 0, 0, '{"name":"BT Login","type":"module","creationDate":"April 2012","author":"BowThemes","copyright":"Copyright (C) 2012 Bowthemes. All rights reserved.","authorEmail":"support@bowthemes.com","authorUrl":"http:\\/\\/www.bowthemes.com","version":"2.5.4","description":"MOD_BT_LOGIN_XML_DESCRIPTION","group":""}', '{"align_option":"right","display_type":"0","mouse_event":"click","login":"","logout":"","name":"0","logout_button":"1","enabled_registration_tab":"1","tag_login_modal":"","tag_register_modal":"","module_id":"19","module_position":"0","integrated_component":"","module_option":"0","link_option":"","loadJquery":"auto","cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10025, 'JM Slideshow Responsive', 'module', 'mod_jmslideshow', '', 0, 1, 0, 0, '{"name":"JM Slideshow Responsive","type":"module","creationDate":"Sep 2013","author":"JoomlaMan.com","copyright":"\\u00a9 2012-2013 JoomlaMan.com","authorEmail":"info@joomlaman.com","authorUrl":"www.joomlaman.com","version":"1.3.6","description":"\\n        \\n\\t\\t<style type=\\"text\\/css\\">\\n\\t\\t\\tspan.readonly { padding: 10px; font-family: Arial; font-size:13px !important; font-weight: normal !important; text-align: justify; color: #4d4d4d; line-height: 24px; }\\n\\t\\t\\tspan.readonly h1 { clear:both; font-family: Georgia, sans-serif; font-size:38px; margin:30px 20px 23px; padding:0px 0px 24px 10px; color:#333; border-bottom: 1px solid #eee; font-weight: normal; }\\n\\t\\t\\tspan.readonly p { margin: 0 26px 10px }\\n\\t\\t\\tspan.readonly p a { color: #8e0b8c }\\n\\t\\t\\tspan.readonly p.homepage { margin-top: 30px }\\n\\t\\t\\tspan.readonly p.license { border-top: 1px solid #eee; font-size: 11px; margin: 30px 26px 0; padding: 6px 0; }\\n\\t\\t<\\/style>\\n\\t\\t<span class=\\"readonly\\"><h1>JM Slideshow<small> ver. 1.3.6<\\/small><\\/h1><p>JMS is new generation of our extensions dedicated to Joomla 1.6+.<\\/p><p>With JMS module, you can create slideshow on a site which include various images and article fragments or texts defined by a user. Thanks to slide management system integrated in the module, its support is very easy, intuitive and fast. With the new method of creating module styles you can easily move your slideshow style from one template to other template.<\\/p> <p class=''homepage''><a href=''http:\\/\\/www.joomlaman.com\\/joomla-extensions\\/22-jm-slideshow.html'' target=''_blank''>Learn more at the JMS project website.<\\/a><\\/p><p class=''license''>JMS is released under the <a target=\\"_blank\\" href=\\"http:\\/\\/www.gnu.org\\/licenses\\/gpl-2.0.html\\">GNU\\/GPL v2 license.<\\/a><\\/p><\\/span>\\n\\t\\t\\n    ","group":""}', '{"jmslideshow_responsive":"1","jmslideshow_width":"700","jmslideshow_image_width":"700","jmslideshow_image_height":"400","jmslideshow_image_style":"1","class_sfx":"","slider_source":"0","jmslideshow_k2_categories":"","jmslideshow_hikashop_categories":"","jmslideshow_image_source":"0","jmslideshow_article_image_source":"3","jmslideshow_ordering":"0","jmslideshow_orderby":"0","jmslideshow_count":"5","jmslideshow_layout":"default","jmslideshow_effect":"fade","jmslideshow_speed":"500","jmslideshow_auto":"1","jmslideshow_timeout":"5000","jmslideshow_caption_position":"topleft","jmslideshow_caption_left":"30","jmslideshow_caption_top":"30","jmslideshow_caption_right":"30","jmslideshow_caption_bottom":"30","jmslideshow_caption_width":"500","jmslideshow_desc_length":"150","jmslideshow_desc_html":"","jmslideshow_readmore_text":"Read more","jmslideshow_show_nav_buttons":"1","jmslideshow_show_pager":"1","jmslideshow_pager_type":"1","jmslideshow_pager_position":"bottomleft","jmslideshow_pager_left":"30","jmslideshow_pager_top":"30","jmslideshow_pager_right":"30","jmslideshow_pager_bottom":"30","jmslideshow_include_jquery":"2","jmslideshow_about":"MOD_JMSLIDESHOW_ABOUT_TAB_DESC","jmslideshow_update":"UPDATE will be revealed later!"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10026, 'JA Side News', 'module', 'mod_jasidenews', '', 0, 1, 0, 0, '{"name":"JA Side News","type":"module","creationDate":"26 April 2013","author":"Joomlart.com","copyright":"Copyright (C), J.O.O.M Solutions Co., Ltd. All Rights Reserved.","authorEmail":"webmaster@joomlart.com","authorUrl":"http:\\/\\/www.joomlart.com","version":"2.6.1","description":"\\n\\t\\t\\n\\t\\t\\t<span style=\\"color: #008000;\\"><strong>JA Side News Module for Joomla 2.5<\\/strong><\\/span><br \\/>\\n\\t\\t\\t<p><img alt=\\"JA Side News Module\\" src=\\"http:\\/\\/static.joomlart.com\\/images\\/stories\\/extensions\\/joomla\\/ja_sidenews.png\\" \\/><\\/p>\\n\\t\\t\\t<div style=\\"font-weight:normal\\">\\n\\t\\t\\tJA Side News module allows to display a list of articles with meta keyword ''''Featured'''' (this word is declared in the ''''Keyword'''' parameter inside the Metadata Information of each article).\\n\\t\\t\\t<p>Otherwise, it displays articles from one or many categories. The list can be sorted by Date, Order or Hits.<\\/p>\\n\\t\\t\\t\\n\\t\\t\\t<br \\/>\\n\\t\\t\\t<span style=\\"color: #ff6600;\\"><strong>Features:<\\/strong><\\/span><br\\/>\\n\\t\\t\\t<ul>\\n\\t\\t\\t  <li>2 display layouts to choose from.<\\/li>\\n\\t\\t\\t  <li>Configure image sizes, dates and even read more button.<\\/li>\\n\\t\\t\\t  <li>Choose sidenews layout for text overlay effect.<\\/li>\\n\\t\\t\\t  <li>Easy to configure colors for overlay, text. Control animation with easy dimensions.<\\/li>\\n\\t\\t\\t<\\/ul>\\n\\t\\t\\t\\n\\t\\t\\t<br \\/>\\n\\t\\t\\t<strong><span style=\\"color: #ff0000;\\">Upgrade Methods:<\\/span><\\/strong><br \\/>\\n\\n\\t\\t\\t<ul>\\n\\t\\t\\t   <li>You can install new version directly over this version. Uninstallation is not required. Backup any customized files before upgrading OR<\\/li>\\n\\t\\t\\t  <li>Use <strong><a href=\\"http:\\/\\/extensions.joomla.org\\/extensions\\/core-enhancements\\/installers\\/12077\\" target=\\"_blank\\">JA Extensions Manager<\\/a><\\/strong> Component for easy upgrades and rollbacks. <strong><a href=\\"http:\\/\\/www.youtube.com\\/user\\/JoomlArt#p\\/c\\/BC9B0C0BFE98657E\\/2\\/mNAuJRmifG8\\" target=\\"_blank\\">Watch Video.<\\/a><\\/strong><\\/li>\\n\\t\\t\\t<\\/ul>\\n\\t\\t\\t<br\\/>\\n\\t\\t\\t<span style=\\"color: #008000;\\"><strong>Links:<\\/strong><\\/span>\\n\\t\\t\\t<ul>\\n\\t\\t\\t  <li><a target=''_blank'' href=''http:\\/\\/update.joomlart.com\\/''>Updates &amp; Versions<\\/a><\\/li><li><a target=''_blank'' href=''http:\\/\\/www.joomlart.com\\/forums\\/showthread.php?49940''>General Userguide<\\/a><\\/li>\\n\\t\\t\\t  <li>For more details on Thumbnail modes read this <a href=\\"http:\\/\\/www.joomlart.com\\/forums\\/showthread.php?50325\\" title=\\"JA thumbanil modes\\" target=\\"_blank\\"><strong>tutorial<\\/strong><\\/a><\\/li>\\n\\t\\t\\t<\\/ul>\\n\\t\\t\\t<p>Copyright 2004 - 2012 <a href=\\"http:\\/\\/www.joomlart.com\\/\\" title=\\"Visit Joomlart.com!\\">JoomlArt.com<\\/a>.<\\/p>\\n\\t\\t\\t<\\/div>\\n\\n\\t\\t\\n\\t","group":""}', '{"using_mode":"article","display_model-modcats-category":"","k2catsid":"","show_featured":"1","sort_order_field":"created","sort_order":"DESC","max_items":"5","title_max_chars":"200","maxchars":"60","layout":"default","layout-default-showdate":"1","layout-default-show_moredetail":"1","layout-default-showimage":"1","layout-sidenews-height":"200","layout-sidenews-textcolor":"#FFFFFF","layout-sidenews-bgcolor":"#4F4F4F","layout-sidenews-transparent":"80","layout-sidenews-element_apply_side":"content","layout-sidenews-play_mode":"caption","layout-sidenews-play_mode-caption-expandheight":"150","layout-sidenews-play_mode-caption-collapseheight":"30","layout-sidenews-animation_transition":"Fx.Transitions.Expo.easeOut","thumbnail_mode":"crop","thumbnail_mode-resize-use_ratio":"1","iwidth":"152","iheight":"200","image_alignment":"left","moduleclass_sfx":"","cache":"1","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_finder_filters`
--

CREATE TABLE IF NOT EXISTS `i8a13_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_finder_links`
--

CREATE TABLE IF NOT EXISTS `i8a13_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_finder_links_terms0`
--

CREATE TABLE IF NOT EXISTS `i8a13_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_finder_links_terms1`
--

CREATE TABLE IF NOT EXISTS `i8a13_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_finder_links_terms2`
--

CREATE TABLE IF NOT EXISTS `i8a13_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_finder_links_terms3`
--

CREATE TABLE IF NOT EXISTS `i8a13_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_finder_links_terms4`
--

CREATE TABLE IF NOT EXISTS `i8a13_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_finder_links_terms5`
--

CREATE TABLE IF NOT EXISTS `i8a13_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_finder_links_terms6`
--

CREATE TABLE IF NOT EXISTS `i8a13_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_finder_links_terms7`
--

CREATE TABLE IF NOT EXISTS `i8a13_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_finder_links_terms8`
--

CREATE TABLE IF NOT EXISTS `i8a13_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_finder_links_terms9`
--

CREATE TABLE IF NOT EXISTS `i8a13_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_finder_links_termsa`
--

CREATE TABLE IF NOT EXISTS `i8a13_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_finder_links_termsb`
--

CREATE TABLE IF NOT EXISTS `i8a13_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_finder_links_termsc`
--

CREATE TABLE IF NOT EXISTS `i8a13_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_finder_links_termsd`
--

CREATE TABLE IF NOT EXISTS `i8a13_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_finder_links_termse`
--

CREATE TABLE IF NOT EXISTS `i8a13_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_finder_links_termsf`
--

CREATE TABLE IF NOT EXISTS `i8a13_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_finder_taxonomy`
--

CREATE TABLE IF NOT EXISTS `i8a13_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `i8a13_finder_taxonomy`
--

INSERT INTO `i8a13_finder_taxonomy` (`id`, `parent_id`, `title`, `state`, `access`, `ordering`) VALUES
(1, 0, 'ROOT', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_finder_taxonomy_map`
--

CREATE TABLE IF NOT EXISTS `i8a13_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_finder_terms`
--

CREATE TABLE IF NOT EXISTS `i8a13_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  `language` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_finder_terms_common`
--

CREATE TABLE IF NOT EXISTS `i8a13_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i8a13_finder_terms_common`
--

INSERT INTO `i8a13_finder_terms_common` (`term`, `language`) VALUES
('a', 'en'),
('about', 'en'),
('after', 'en'),
('ago', 'en'),
('all', 'en'),
('am', 'en'),
('an', 'en'),
('and', 'en'),
('ani', 'en'),
('any', 'en'),
('are', 'en'),
('aren''t', 'en'),
('as', 'en'),
('at', 'en'),
('be', 'en'),
('but', 'en'),
('by', 'en'),
('for', 'en'),
('from', 'en'),
('get', 'en'),
('go', 'en'),
('how', 'en'),
('if', 'en'),
('in', 'en'),
('into', 'en'),
('is', 'en'),
('isn''t', 'en'),
('it', 'en'),
('its', 'en'),
('me', 'en'),
('more', 'en'),
('most', 'en'),
('must', 'en'),
('my', 'en'),
('new', 'en'),
('no', 'en'),
('none', 'en'),
('not', 'en'),
('noth', 'en'),
('nothing', 'en'),
('of', 'en'),
('off', 'en'),
('often', 'en'),
('old', 'en'),
('on', 'en'),
('onc', 'en'),
('once', 'en'),
('onli', 'en'),
('only', 'en'),
('or', 'en'),
('other', 'en'),
('our', 'en'),
('ours', 'en'),
('out', 'en'),
('over', 'en'),
('page', 'en'),
('she', 'en'),
('should', 'en'),
('small', 'en'),
('so', 'en'),
('some', 'en'),
('than', 'en'),
('thank', 'en'),
('that', 'en'),
('the', 'en'),
('their', 'en'),
('theirs', 'en'),
('them', 'en'),
('then', 'en'),
('there', 'en'),
('these', 'en'),
('they', 'en'),
('this', 'en'),
('those', 'en'),
('thus', 'en'),
('time', 'en'),
('times', 'en'),
('to', 'en'),
('too', 'en'),
('true', 'en'),
('under', 'en'),
('until', 'en'),
('up', 'en'),
('upon', 'en'),
('use', 'en'),
('user', 'en'),
('users', 'en'),
('veri', 'en'),
('version', 'en'),
('very', 'en'),
('via', 'en'),
('want', 'en'),
('was', 'en'),
('way', 'en'),
('were', 'en'),
('what', 'en'),
('when', 'en'),
('where', 'en'),
('whi', 'en'),
('which', 'en'),
('who', 'en'),
('whom', 'en'),
('whose', 'en'),
('why', 'en'),
('wide', 'en'),
('will', 'en'),
('with', 'en'),
('within', 'en'),
('without', 'en'),
('would', 'en'),
('yes', 'en'),
('yet', 'en'),
('you', 'en'),
('your', 'en'),
('yours', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_finder_tokens`
--

CREATE TABLE IF NOT EXISTS `i8a13_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `language` char(3) NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_finder_tokens_aggregate`
--

CREATE TABLE IF NOT EXISTS `i8a13_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  `language` char(3) NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_finder_types`
--

CREATE TABLE IF NOT EXISTS `i8a13_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `i8a13_finder_types`
--

INSERT INTO `i8a13_finder_types` (`id`, `title`, `mime`) VALUES
(1, 'Tag', ''),
(2, 'Category', ''),
(3, 'Contact', ''),
(4, 'Article', ''),
(5, 'News Feed', ''),
(6, 'Web Link', '');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_languages`
--

CREATE TABLE IF NOT EXISTS `i8a13_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `i8a13_languages`
--

INSERT INTO `i8a13_languages` (`lang_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en', '', '', '', '', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_menu`
--

CREATE TABLE IF NOT EXISTS `i8a13_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`,`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_path` (`path`(255)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=500 ;

--
-- Dumping data for table `i8a13_menu`
--

INSERT INTO `i8a13_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 291, 0, '*', 0),
(2, 'menu', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 0, 1, 1, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 3, 12, 0, '*', 1),
(3, 'menu', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 4, 5, 0, '*', 1),
(4, 'menu', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 0, 2, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 6, 7, 0, '*', 1),
(5, 'menu', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 8, 9, 0, '*', 1),
(6, 'menu', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 10, 11, 0, '*', 1),
(7, 'menu', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 0, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 13, 18, 0, '*', 1),
(8, 'menu', 'com_contact', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 0, 7, 2, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 14, 15, 0, '*', 1),
(9, 'menu', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 0, 7, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 16, 17, 0, '*', 1),
(10, 'menu', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 0, 1, 1, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 19, 24, 0, '*', 1),
(11, 'menu', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 0, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 20, 21, 0, '*', 1),
(12, 'menu', 'com_messages_read', 'Read Private Message', '', 'Messaging/Read Private Message', 'index.php?option=com_messages', 'component', 0, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-read', 0, '', 22, 23, 0, '*', 1),
(13, 'menu', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 1, 1, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 25, 30, 0, '*', 1),
(14, 'menu', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 13, 2, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 26, 27, 0, '*', 1),
(15, 'menu', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 0, 13, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 28, 29, 0, '*', 1),
(16, 'menu', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 0, 1, 1, 24, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 43, 44, 0, '*', 1),
(17, 'menu', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', 0, 1, 1, 19, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 33, 34, 0, '*', 1),
(18, 'menu', 'com_weblinks', 'Weblinks', '', 'Weblinks', 'index.php?option=com_weblinks', 'component', 0, 1, 1, 21, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 37, 42, 0, '*', 1),
(19, 'menu', 'com_weblinks_links', 'Links', '', 'Weblinks/Links', 'index.php?option=com_weblinks', 'component', 0, 18, 2, 21, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 38, 39, 0, '*', 1),
(20, 'menu', 'com_weblinks_categories', 'Categories', '', 'Weblinks/Categories', 'index.php?option=com_categories&extension=com_weblinks', 'component', 0, 18, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks-cat', 0, '', 40, 41, 0, '*', 1),
(21, 'menu', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 0, 1, 1, 27, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 31, 32, 0, '*', 1),
(22, 'menu', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 0, 1, 1, 28, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 31, 32, 0, '*', 1),
(201, 'usermenu', 'Your Profile', 'your-profile', '', 'your-profile', 'index.php?option=com_users&view=profile', 'component', 1, 1, 1, 25, 0, '0000-00-00 00:00:00', 0, 2, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 213, 214, 0, '*', 0),
(207, 'top', 'Joomla.org', 'joomlaorg', '', 'joomlaorg', 'http://joomla.org', 'url', 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":""}', 211, 212, 0, '*', 0),
(435, 'mainmenu', 'Home', 'homepage', '', 'homepage', 'index.php?option=com_content&view=article&id=1', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 10, '{"show_title":"1","link_titles":"","show_intro":"","info_block_position":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 1, 2, 1, '*', 0),
(448, 'usermenu', 'Site Administrator', 'site-administrator', '', 'site-administrator', 'administrator', 'url', 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 1, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 219, 220, 0, '*', 0),
(449, 'usermenu', 'Submit an Article', 'submit-an-article', '', 'submit-an-article', 'index.php?option=com_content&view=form&layout=edit', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 3, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 215, 216, 0, '*', 0),
(450, 'usermenu', 'Submit a Web Link', 'submit-a-web-link', '', 'submit-a-web-link', 'index.php?option=com_weblinks&view=form&layout=edit', 'component', 1, 1, 1, 21, 0, '0000-00-00 00:00:00', 0, 3, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 217, 218, 0, '*', 0),
(464, 'top', 'Home', 'home', '', 'home', 'index.php?Itemid=', 'alias', 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"aliasoptions":"435","menu-anchor_title":"","menu-anchor_css":"","menu_image":""}', 205, 206, 0, '*', 0),
(465, 'menu', 'com_tags', 'com-tags', '', 'com-tags', 'index.php?option=com_tags', 'component', 0, 1, 1, 29, 0, '0000-00-00 00:00:00', 0, 1, 'class:tags', 0, '', 221, 222, 0, '', 1),
(466, 'mainmenu', 'Blog', 'blog', '', 'blog', 'index.php?option=com_content&view=article&id=1', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_tags":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 223, 224, 0, '*', 0),
(467, 'mainmenu', 'Shop', 'shop', '', 'shop', 'index.php?option=com_mijoshop&view=home', 'component', 1, 1, 1, 10003, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"mijoshop_store_id":"0","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 225, 228, 0, '*', 0),
(468, 'mainmenu', 'Cooking School', 'cooking-school', '', 'cooking-school', 'index.php?option=com_content&view=category&layout=blog&id=2', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","page_subheading":"","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 229, 230, 0, '*', 0),
(469, 'mainmenu', 'Alliances', 'alliances', '', 'alliances', 'index.php?option=com_content&view=article&id=1', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_tags":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 231, 232, 0, '*', 0),
(470, 'mainmenu', 'Corporate', 'corporate', '', 'corporate', 'index.php?option=com_content&view=category&id=2', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_category_heading_title":"","show_subcat_desc":"","show_cat_num_articles":"","page_subheading":"","show_pagination_limit":"","filter_field":"","show_headings":"","list_show_date":"","date_format":"","list_show_hits":"","list_show_author":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","display_num":"10","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 233, 234, 0, '*', 0),
(471, 'mainmenu', 'Contact', 'contact', '', 'contact', 'index.php?option=com_contact&view=categories&id=4', 'component', 1, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_base_description":"","categories_description":"","maxLevelcat":"","show_empty_categories_cat":"","show_subcat_desc_cat":"","show_cat_items_cat":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_subcat_desc":"","show_cat_items":"","filter_field":"","show_pagination_limit":"","show_headings":"","show_position_headings":"","show_email_headings":"","show_telephone_headings":"","show_mobile_headings":"","show_fax_headings":"","show_suburb_headings":"","show_state_headings":"","show_country_headings":"","show_pagination":"","show_pagination_results":"","presentation_style":"","show_contact_category":"","show_contact_list":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_links":"","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":"","show_feed_link":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 235, 236, 0, '*', 0),
(472, 'main', 'COM_MIJOSHOP', 'com-mijoshop', '', 'com-mijoshop', 'index.php?option=com_mijoshop', 'component', 0, 1, 1, 10003, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_mijoshop/assets/images/icon-16-mijoshop.png', 0, '', 237, 260, 0, '', 1),
(473, 'main', 'COM_MIJOSHOP_DASHBOARD', 'com-mijoshop-dashboard', '', 'com-mijoshop/com-mijoshop-dashboard', 'index.php?option=com_mijoshop', 'component', 0, 472, 2, 10003, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_mijoshop/assets/images/icon-16-mijoshop.png', 0, '', 238, 239, 0, '', 1),
(474, 'main', 'COM_MIJOSHOP_SETTINGS', 'com-mijoshop-settings', '', 'com-mijoshop/com-mijoshop-settings', 'index.php?option=com_mijoshop&route=setting/store', 'component', 0, 472, 2, 10003, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_mijoshop/assets/images/icon-16-mijoshop-settings.png', 0, '', 240, 241, 0, '', 1),
(475, 'main', 'COM_MIJOSHOP_CATEGORIES', 'com-mijoshop-categories', '', 'com-mijoshop/com-mijoshop-categories', 'index.php?option=com_mijoshop&route=catalog/category', 'component', 0, 472, 2, 10003, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_mijoshop/assets/images/icon-16-mijoshop-categories.png', 0, '', 242, 243, 0, '', 1),
(476, 'main', 'COM_MIJOSHOP_PRODUCTS', 'com-mijoshop-products', '', 'com-mijoshop/com-mijoshop-products', 'index.php?option=com_mijoshop&route=catalog/product', 'component', 0, 472, 2, 10003, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_mijoshop/assets/images/icon-16-mijoshop-products.png', 0, '', 244, 245, 0, '', 1),
(477, 'main', 'COM_MIJOSHOP_COUPONS', 'com-mijoshop-coupons', '', 'com-mijoshop/com-mijoshop-coupons', 'index.php?option=com_mijoshop&route=sale/coupon', 'component', 0, 472, 2, 10003, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_mijoshop/assets/images/icon-16-mijoshop-coupons.png', 0, '', 246, 247, 0, '', 1),
(478, 'main', 'COM_MIJOSHOP_CUSTOMERS', 'com-mijoshop-customers', '', 'com-mijoshop/com-mijoshop-customers', 'index.php?option=com_mijoshop&route=sale/customer', 'component', 0, 472, 2, 10003, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_mijoshop/assets/images/icon-16-mijoshop-customers.png', 0, '', 248, 249, 0, '', 1),
(479, 'main', 'COM_MIJOSHOP_ORDERS', 'com-mijoshop-orders', '', 'com-mijoshop/com-mijoshop-orders', 'index.php?option=com_mijoshop&route=sale/order', 'component', 0, 472, 2, 10003, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_mijoshop/assets/images/icon-16-mijoshop-orders.png', 0, '', 250, 251, 0, '', 1),
(480, 'main', 'COM_MIJOSHOP_AFFILIATES', 'com-mijoshop-affiliates', '', 'com-mijoshop/com-mijoshop-affiliates', 'index.php?option=com_mijoshop&route=sale/affiliate', 'component', 0, 472, 2, 10003, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_mijoshop/assets/images/icon-16-mijoshop-affiliates.png', 0, '', 252, 253, 0, '', 1),
(481, 'main', 'COM_MIJOSHOP_MAILING', 'com-mijoshop-mailing', '', 'com-mijoshop/com-mijoshop-mailing', 'index.php?option=com_mijoshop&route=sale/contact', 'component', 0, 472, 2, 10003, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_mijoshop/assets/images/icon-16-mijoshop-mailing.png', 0, '', 254, 255, 0, '', 1),
(482, 'main', 'COM_MIJOSHOP_UPGRADE', 'com-mijoshop-upgrade', '', 'com-mijoshop/com-mijoshop-upgrade', 'index.php?option=com_mijoshop&route=common/upgrade', 'component', 0, 472, 2, 10003, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_mijoshop/assets/images/icon-16-mijoshop-upgrade.png', 0, '', 256, 257, 0, '', 1),
(483, 'main', 'COM_MIJOSHOP_SUPPORT', 'com-mijoshop-support', '', 'com-mijoshop/com-mijoshop-support', 'index.php?option=com_mijoshop&route=common/support', 'component', 0, 472, 2, 10003, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_mijoshop/assets/images/icon-16-mijoshop-support.png', 0, '', 258, 259, 0, '', 1),
(484, 'main', 'COM_MIJOSEARCH', 'com-mijosearch', '', 'com-mijosearch', 'index.php?option=com_mijosearch', 'component', 0, 1, 1, 10020, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_mijosearch/assets/images/mijosearch.png', 0, '', 261, 278, 0, '', 1),
(485, 'main', 'COM_MIJOSEARCH_CPANEL', 'com-mijosearch-cpanel', '', 'com-mijosearch/com-mijosearch-cpanel', 'index.php?option=com_mijosearch', 'component', 0, 484, 2, 10020, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_mijosearch/assets/images/mijosearch.png', 0, '', 262, 263, 0, '', 1),
(486, 'main', 'COM_MIJOSEARCH_CONFIG', 'com-mijosearch-config', '', 'com-mijosearch/com-mijosearch-config', 'index.php?option=com_mijosearch&controller=config&task=edit', 'component', 0, 484, 2, 10020, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_mijosearch/assets/images/icon-16-as-config.png', 0, '', 264, 265, 0, '', 1),
(487, 'main', 'COM_MIJOSEARCH_EXTENSIONS', 'com-mijosearch-extensions', '', 'com-mijosearch/com-mijosearch-extensions', 'index.php?option=com_mijosearch&controller=extensions&task=view', 'component', 0, 484, 2, 10020, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_mijosearch/assets/images/icon-16-as-extensions.png', 0, '', 266, 267, 0, '', 1),
(488, 'main', 'COM_MIJOSEARCH_STATISTICS', 'com-mijosearch-statistics', '', 'com-mijosearch/com-mijosearch-statistics', 'index.php?option=com_mijosearch&controller=statistics&task=view', 'component', 0, 484, 2, 10020, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_mijosearch/assets/images/icon-16-as-statistics.png', 0, '', 268, 269, 0, '', 1),
(489, 'main', 'COM_MIJOSEARCH_FILTERS', 'com-mijosearch-filters', '', 'com-mijosearch/com-mijosearch-filters', 'index.php?option=com_mijosearch&controller=filters&task=view', 'component', 0, 484, 2, 10020, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_mijosearch/assets/images/icon-16-as-filters.png', 0, '', 270, 271, 0, '', 1),
(490, 'main', 'COM_MIJOSEARCH_SEARCH', 'com-mijosearch-search', '', 'com-mijosearch/com-mijosearch-search', 'index.php?option=com_mijosearch&controller=search&task=view', 'component', 0, 484, 2, 10020, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_mijosearch/assets/images/icon-16-as-search.png', 0, '', 272, 273, 0, '', 1),
(491, 'main', 'COM_MIJOSEARCH_UPGRADE', 'com-mijosearch-upgrade', '', 'com-mijosearch/com-mijosearch-upgrade', 'index.php?option=com_mijosearch&controller=upgrade&task=view', 'component', 0, 484, 2, 10020, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_mijosearch/assets/images/icon-16-as-upgrade.png', 0, '', 274, 275, 0, '', 1),
(492, 'main', 'COM_MIJOSEARCH_SUPPORT', 'com-mijosearch-support', '', 'com-mijosearch/com-mijosearch-support', 'index.php?option=com_mijosearch&controller=support&task=support', 'component', 0, 484, 2, 10020, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_mijosearch/assets/images/icon-16-as-support.png', 0, '', 276, 277, 0, '', 1),
(493, 'footer-menu-1', 'Lorem ipsum dolor', 'lorem-ipsum-dolor', '', 'lorem-ipsum-dolor', 'index.php?option=com_mijoshop&view=home', 'component', 1, 1, 1, 10003, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"mijoshop_store_id":"0","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 279, 280, 0, '*', 0),
(494, 'footer-menu-1', ' sit amet consectetur  adipiscing', 'sit-amet-consectetur-adipiscing', '', 'sit-amet-consectetur-adipiscing', 'index.php?option=com_mijoshop&view=category&path=33', 'component', 1, 1, 1, 10003, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"mijoshop_store_id":"0","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 281, 282, 0, '*', 0),
(495, 'footer-menu-1', 'elit Suspendisse cursus lorem ipsum purus ', 'elit-suspendisse-cursus-lorem-ipsum-purus', '', 'elit-suspendisse-cursus-lorem-ipsum-purus', 'index.php?option=com_mijoshop&view=checkout', 'component', 1, 1, 1, 10003, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"mijoshop_store_id":"0","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 283, 284, 0, '*', 0),
(496, 'footer-menu-1', ' amet  consectetur  adipiscing elit Suspendisse', 'amet-consectetur-adipiscing-elit-suspendisse', '', 'amet-consectetur-adipiscing-elit-suspendisse', 'index.php?option=com_mijoshop&view=registration', 'component', 1, 1, 1, 10003, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"mijoshop_store_id":"0","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 285, 286, 0, '*', 0),
(497, 'account-menu', 'my account', 'my-account', '', 'my-account', 'index.php?option=com_mijoshop&view=account', 'component', 1, 1, 1, 10003, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"mijoshop_store_id":"0","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 287, 288, 0, '*', 0),
(498, 'account-menu', 'check out', 'check-out', '', 'check-out', 'index.php?option=com_mijoshop&view=checkout', 'component', 1, 1, 1, 10003, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"mijoshop_store_id":"0","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 289, 290, 0, '*', 0),
(499, 'mainmenu', 'cameras', 'cameras', '', 'shop/cameras', 'index.php?option=com_mijoshop&view=category&path=33', 'component', 1, 467, 2, 10003, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"mijoshop_store_id":"0","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 226, 227, 0, '*', 0);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_menu_types`
--

CREATE TABLE IF NOT EXISTS `i8a13_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `i8a13_menu_types`
--

INSERT INTO `i8a13_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site'),
(2, 'usermenu', 'User Menu', 'A Menu for logged-in Users'),
(3, 'footer-menu-1', 'footer menu 1', ''),
(4, 'account-menu', 'account menu', '');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_messages`
--

CREATE TABLE IF NOT EXISTS `i8a13_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_messages_cfg`
--

CREATE TABLE IF NOT EXISTS `i8a13_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijosearch_extensions`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijosearch_extensions` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `ordering` int(255) NOT NULL DEFAULT '1',
  `client` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `i8a13_mijosearch_extensions`
--

INSERT INTO `i8a13_mijosearch_extensions` (`id`, `name`, `extension`, `params`, `ordering`, `client`) VALUES
(1, 'Banners', 'com_banners', '{"handler":1,"custom_name":"","access":1,"result_limit":""}', 3, 2),
(2, 'Content', 'com_content', '{"handler":1,"custom_name":"","access":1,"result_limit":""}', 1, 2),
(3, 'Components', 'com_components', '{"handler":1,"custom_name":"","access":1,"result_limit":""}', 9, 1),
(4, 'Menus', 'com_menus', '{"handler":1,"custom_name":"","access":1,"result_limit":""}', 6, 2),
(5, 'Modules', 'com_modules', '{"handler":1,"custom_name":"","access":1,"result_limit":""}', 8, 1),
(6, 'News Feeds', 'com_newsfeeds', '{"handler":1,"custom_name":"","access":1,"result_limit":""}', 4, 2),
(7, 'Plugins', 'com_plugins', '{"handler":1,"custom_name":"","access":1,"result_limit":""}', 10, 1),
(8, 'Users', 'com_users', '{"handler":1,"custom_name":"","access":1,"result_limit":""}', 7, 1),
(9, 'Web Links', 'com_weblinks', '{"handler":1,"custom_name":"","access":1,"result_limit":""}', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijosearch_filters`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijosearch_filters` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `group_id` int(10) NOT NULL DEFAULT '0',
  `published` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijosearch_filters_groups`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijosearch_filters_groups` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijosearch_search_results`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijosearch_search_results` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(255) NOT NULL DEFAULT '',
  `search_result` int(255) NOT NULL DEFAULT '0',
  `search_count` int(255) NOT NULL DEFAULT '0',
  `search_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_address`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL DEFAULT '',
  `lastname` varchar(32) NOT NULL DEFAULT '',
  `company` varchar(32) NOT NULL,
  `company_id` varchar(32) NOT NULL,
  `tax_id` varchar(32) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `i8a13_mijoshop_address`
--

INSERT INTO `i8a13_mijoshop_address` (`address_id`, `customer_id`, `firstname`, `lastname`, `company`, `company_id`, `tax_id`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`) VALUES
(1, 1, 'Super', 'User', '', '', '', '', '', '', '', 0, 0),
(2, 2, 'trung', '', '', '', '', '', '', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_affiliate`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL DEFAULT '',
  `lastname` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(96) NOT NULL DEFAULT '',
  `telephone` varchar(32) NOT NULL DEFAULT '',
  `fax` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL DEFAULT '',
  `salt` varchar(9) NOT NULL DEFAULT '',
  `company` varchar(32) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL DEFAULT '',
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL DEFAULT '',
  `postcode` varchar(10) NOT NULL DEFAULT '',
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL DEFAULT '',
  `paypal` varchar(64) NOT NULL DEFAULT '',
  `bank_name` varchar(64) NOT NULL DEFAULT '',
  `bank_branch_number` varchar(64) NOT NULL DEFAULT '',
  `bank_swift_code` varchar(64) NOT NULL DEFAULT '',
  `bank_account_name` varchar(64) NOT NULL DEFAULT '',
  `bank_account_number` varchar(64) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_affiliate_transaction`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_attribute`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `i8a13_mijoshop_attribute`
--

INSERT INTO `i8a13_mijoshop_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_attribute_description`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i8a13_mijoshop_attribute_description`
--

INSERT INTO `i8a13_mijoshop_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 1, 'Description'),
(2, 1, 'No. of Cores'),
(3, 1, 'Clockspeed'),
(4, 1, 'test 1'),
(5, 1, 'test 2'),
(6, 1, 'test 3'),
(7, 1, 'test 4'),
(8, 1, 'test 5'),
(9, 1, 'test 6'),
(10, 1, 'test 7'),
(11, 1, 'test 8');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_attribute_group`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `i8a13_mijoshop_attribute_group`
--

INSERT INTO `i8a13_mijoshop_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_attribute_group_description`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i8a13_mijoshop_attribute_group_description`
--

INSERT INTO `i8a13_mijoshop_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, 'Memory'),
(4, 1, 'Technical'),
(5, 1, 'Motherboard'),
(6, 1, 'Processor');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_banner`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `i8a13_mijoshop_banner`
--

INSERT INTO `i8a13_mijoshop_banner` (`banner_id`, `name`, `status`) VALUES
(8, 'slide show', 1);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_banner_image`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`banner_image_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=77 ;

--
-- Dumping data for table `i8a13_mijoshop_banner_image`
--

INSERT INTO `i8a13_mijoshop_banner_image` (`banner_image_id`, `banner_id`, `link`, `image`) VALUES
(75, 8, '', 'data/slideshow/cache.jpg'),
(76, 8, '', 'data/slideshow/cache.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_banner_image_description`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i8a13_mijoshop_banner_image_description`
--

INSERT INTO `i8a13_mijoshop_banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`) VALUES
(75, 1, 8, 'slide show 1'),
(76, 1, 8, 'slide show 1');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_category`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `i8a13_mijoshop_category`
--

INSERT INTO `i8a13_mijoshop_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(33, 'data/TheProvidoresTable-Home_03.jpg', 0, 1, 1, 6, 1, '2009-02-03 14:17:55', '2013-10-24 17:27:30'),
(34, 'data/TheProvidoresTable-Home_10.jpg', 0, 0, 1, 0, 1, '2013-10-24 13:50:50', '2013-10-24 17:29:11'),
(35, 'data/TheProvidoresTable-Home_17.jpg', 0, 0, 1, 0, 1, '2013-10-24 13:51:36', '2013-10-24 17:36:45'),
(36, 'data/TheProvidoresTable-Home_13.jpg', 0, 0, 1, 0, 1, '2013-10-24 13:52:01', '2013-10-24 17:36:00'),
(37, 'data/TheProvidoresTable-Home_15.jpg', 0, 0, 1, 0, 1, '2013-10-24 13:52:35', '2013-10-24 17:36:19'),
(38, 'data/TheProvidoresTable-Home_22.jpg', 0, 0, 1, 0, 1, '2013-10-24 13:53:11', '2013-10-24 17:37:56'),
(39, 'data/TheProvidoresTable-Home_06.jpg', 0, 0, 1, 0, 1, '2013-10-24 13:53:46', '2013-10-24 17:38:07'),
(40, 'data/TheProvidoresTable-Home_04.jpg', 33, 0, 1, 0, 1, '2013-10-24 13:54:53', '2013-10-24 17:28:07'),
(41, 'data/TheProvidoresTable-Home_08.jpg', 0, 0, 1, 0, 1, '2013-10-24 13:55:14', '2013-10-24 17:28:44'),
(42, 'data/TheProvidoresTable-Home_03.jpg', 0, 0, 1, 0, 1, '2013-10-26 15:12:09', '2013-10-26 15:12:33'),
(43, 'data/TheProvidoresTable-Home_23.jpg', 0, 0, 1, 0, 1, '2013-10-26 15:13:35', '2013-10-26 15:13:35'),
(44, 'data/TheProvidoresTable-Home_28.jpg', 0, 0, 1, 0, 1, '2013-10-26 15:15:13', '2013-10-26 15:15:13'),
(45, 'data/TheProvidoresTable-Home_22.jpg', 0, 0, 1, 0, 1, '2013-10-26 15:16:04', '2013-10-26 15:16:04');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_category_description`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i8a13_mijoshop_category_description`
--

INSERT INTO `i8a13_mijoshop_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`) VALUES
(33, 1, 'Cameras', '', '', ''),
(34, 1, 'smart phone', '', '', ''),
(35, 1, 'LG', '', '', ''),
(36, 1, 'Apple', '', '', ''),
(37, 1, 'HTC', '', '', ''),
(38, 1, 'Samsung', '', '', ''),
(39, 1, 'Nikon', '', '', ''),
(40, 1, 'canon', '', '', ''),
(41, 1, 'laptop', '', '', ''),
(42, 1, 'category 3', '', '', ''),
(43, 1, 'category4', '', '', ''),
(44, 1, 'category 5', '', '', ''),
(45, 1, 'category 6', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_category_filter`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_category_path`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i8a13_mijoshop_category_path`
--

INSERT INTO `i8a13_mijoshop_category_path` (`category_id`, `path_id`, `level`) VALUES
(33, 33, 0),
(34, 34, 0),
(35, 35, 0),
(36, 36, 0),
(37, 37, 0),
(38, 38, 0),
(39, 39, 0),
(40, 33, 0),
(40, 40, 1),
(41, 41, 0),
(42, 42, 0),
(43, 43, 0),
(44, 44, 0),
(45, 45, 0);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_category_to_layout`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_category_to_store`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i8a13_mijoshop_category_to_store`
--

INSERT INTO `i8a13_mijoshop_category_to_store` (`category_id`, `store_id`) VALUES
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(37, 0),
(38, 0),
(39, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_country`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL DEFAULT '',
  `iso_code_3` varchar(3) NOT NULL DEFAULT '',
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=240 ;

--
-- Dumping data for table `i8a13_mijoshop_country`
--

INSERT INTO `i8a13_mijoshop_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '', 0, 1),
(2, 'Albania', 'AL', 'ALB', '', 0, 1),
(3, 'Algeria', 'DZ', 'DZA', '', 0, 1),
(4, 'American Samoa', 'AS', 'ASM', '', 0, 1),
(5, 'Andorra', 'AD', 'AND', '', 0, 1),
(6, 'Angola', 'AO', 'AGO', '', 0, 1),
(7, 'Anguilla', 'AI', 'AIA', '', 0, 1),
(8, 'Antarctica', 'AQ', 'ATA', '', 0, 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 1),
(10, 'Argentina', 'AR', 'ARG', '', 0, 1),
(11, 'Armenia', 'AM', 'ARM', '', 0, 1),
(12, 'Aruba', 'AW', 'ABW', '', 0, 1),
(13, 'Australia', 'AU', 'AUS', '', 0, 1),
(14, 'Austria', 'AT', 'AUT', '', 0, 1),
(15, 'Azerbaijan', 'AZ', 'AZE', '', 0, 1),
(16, 'Bahamas', 'BS', 'BHS', '', 0, 1),
(17, 'Bahrain', 'BH', 'BHR', '', 0, 1),
(18, 'Bangladesh', 'BD', 'BGD', '', 0, 1),
(19, 'Barbados', 'BB', 'BRB', '', 0, 1),
(20, 'Belarus', 'BY', 'BLR', '', 0, 1),
(21, 'Belgium', 'BE', 'BEL', '', 0, 1),
(22, 'Belize', 'BZ', 'BLZ', '', 0, 1),
(23, 'Benin', 'BJ', 'BEN', '', 0, 1),
(24, 'Bermuda', 'BM', 'BMU', '', 0, 1),
(25, 'Bhutan', 'BT', 'BTN', '', 0, 1),
(26, 'Bolivia', 'BO', 'BOL', '', 0, 1),
(27, 'Bosnia and Herzegowina', 'BA', 'BIH', '', 0, 1),
(28, 'Botswana', 'BW', 'BWA', '', 0, 1),
(29, 'Bouvet Island', 'BV', 'BVT', '', 0, 1),
(30, 'Brazil', 'BR', 'BRA', '', 0, 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 1),
(33, 'Bulgaria', 'BG', 'BGR', '', 0, 1),
(34, 'Burkina Faso', 'BF', 'BFA', '', 0, 1),
(35, 'Burundi', 'BI', 'BDI', '', 0, 1),
(36, 'Cambodia', 'KH', 'KHM', '', 0, 1),
(37, 'Cameroon', 'CM', 'CMR', '', 0, 1),
(38, 'Canada', 'CA', 'CAN', '', 0, 1),
(39, 'Cape Verde', 'CV', 'CPV', '', 0, 1),
(40, 'Cayman Islands', 'KY', 'CYM', '', 0, 1),
(41, 'Central African Republic', 'CF', 'CAF', '', 0, 1),
(42, 'Chad', 'TD', 'TCD', '', 0, 1),
(43, 'Chile', 'CL', 'CHL', '', 0, 1),
(44, 'China', 'CN', 'CHN', '', 0, 1),
(45, 'Christmas Island', 'CX', 'CXR', '', 0, 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 1),
(47, 'Colombia', 'CO', 'COL', '', 0, 1),
(48, 'Comoros', 'KM', 'COM', '', 0, 1),
(49, 'Congo', 'CG', 'COG', '', 0, 1),
(50, 'Cook Islands', 'CK', 'COK', '', 0, 1),
(51, 'Costa Rica', 'CR', 'CRI', '', 0, 1),
(52, 'Cote D''Ivoire', 'CI', 'CIV', '', 0, 1),
(53, 'Croatia', 'HR', 'HRV', '', 0, 1),
(54, 'Cuba', 'CU', 'CUB', '', 0, 1),
(55, 'Cyprus', 'CY', 'CYP', '', 0, 1),
(56, 'Czech Republic', 'CZ', 'CZE', '', 0, 1),
(57, 'Denmark', 'DK', 'DNK', '', 0, 1),
(58, 'Djibouti', 'DJ', 'DJI', '', 0, 1),
(59, 'Dominica', 'DM', 'DMA', '', 0, 1),
(60, 'Dominican Republic', 'DO', 'DOM', '', 0, 1),
(61, 'East Timor', 'TP', 'TMP', '', 0, 1),
(62, 'Ecuador', 'EC', 'ECU', '', 0, 1),
(63, 'Egypt', 'EG', 'EGY', '', 0, 1),
(64, 'El Salvador', 'SV', 'SLV', '', 0, 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 1),
(66, 'Eritrea', 'ER', 'ERI', '', 0, 1),
(67, 'Estonia', 'EE', 'EST', '', 0, 1),
(68, 'Ethiopia', 'ET', 'ETH', '', 0, 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 1),
(70, 'Faroe Islands', 'FO', 'FRO', '', 0, 1),
(71, 'Fiji', 'FJ', 'FJI', '', 0, 1),
(72, 'Finland', 'FI', 'FIN', '', 0, 1),
(73, 'France', 'FR', 'FRA', '', 0, 1),
(74, 'France, Metropolitan', 'FX', 'FXX', '', 0, 1),
(75, 'French Guiana', 'GF', 'GUF', '', 0, 1),
(76, 'French Polynesia', 'PF', 'PYF', '', 0, 1),
(77, 'French Southern Territories', 'TF', 'ATF', '', 0, 1),
(78, 'Gabon', 'GA', 'GAB', '', 0, 1),
(79, 'Gambia', 'GM', 'GMB', '', 0, 1),
(80, 'Georgia', 'GE', 'GEO', '', 0, 1),
(81, 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 1),
(82, 'Ghana', 'GH', 'GHA', '', 0, 1),
(83, 'Gibraltar', 'GI', 'GIB', '', 0, 1),
(84, 'Greece', 'GR', 'GRC', '', 0, 1),
(85, 'Greenland', 'GL', 'GRL', '', 0, 1),
(86, 'Grenada', 'GD', 'GRD', '', 0, 1),
(87, 'Guadeloupe', 'GP', 'GLP', '', 0, 1),
(88, 'Guam', 'GU', 'GUM', '', 0, 1),
(89, 'Guatemala', 'GT', 'GTM', '', 0, 1),
(90, 'Guinea', 'GN', 'GIN', '', 0, 1),
(91, 'Guinea-bissau', 'GW', 'GNB', '', 0, 1),
(92, 'Guyana', 'GY', 'GUY', '', 0, 1),
(93, 'Haiti', 'HT', 'HTI', '', 0, 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 1),
(95, 'Honduras', 'HN', 'HND', '', 0, 1),
(96, 'Hong Kong', 'HK', 'HKG', '', 0, 1),
(97, 'Hungary', 'HU', 'HUN', '', 0, 1),
(98, 'Iceland', 'IS', 'ISL', '', 0, 1),
(99, 'India', 'IN', 'IND', '', 0, 1),
(100, 'Indonesia', 'ID', 'IDN', '', 0, 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 1),
(102, 'Iraq', 'IQ', 'IRQ', '', 0, 1),
(103, 'Ireland', 'IE', 'IRL', '', 0, 1),
(104, 'Israel', 'IL', 'ISR', '', 0, 1),
(105, 'Italy', 'IT', 'ITA', '', 0, 1),
(106, 'Jamaica', 'JM', 'JAM', '', 0, 1),
(107, 'Japan', 'JP', 'JPN', '', 0, 1),
(108, 'Jordan', 'JO', 'JOR', '', 0, 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', '', 0, 1),
(110, 'Kenya', 'KE', 'KEN', '', 0, 1),
(111, 'Kiribati', 'KI', 'KIR', '', 0, 1),
(112, 'North Korea', 'KP', 'PRK', '', 0, 1),
(113, 'Korea, Republic of', 'KR', 'KOR', '', 0, 1),
(114, 'Kuwait', 'KW', 'KWT', '', 0, 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', '', 0, 1),
(116, 'Lao People''s Democratic Republic', 'LA', 'LAO', '', 0, 1),
(117, 'Latvia', 'LV', 'LVA', '', 0, 1),
(118, 'Lebanon', 'LB', 'LBN', '', 0, 1),
(119, 'Lesotho', 'LS', 'LSO', '', 0, 1),
(120, 'Liberia', 'LR', 'LBR', '', 0, 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 1),
(122, 'Liechtenstein', 'LI', 'LIE', '', 0, 1),
(123, 'Lithuania', 'LT', 'LTU', '', 0, 1),
(124, 'Luxembourg', 'LU', 'LUX', '', 0, 1),
(125, 'Macau', 'MO', 'MAC', '', 0, 1),
(126, 'Macedonia', 'MK', 'MKD', '', 0, 1),
(127, 'Madagascar', 'MG', 'MDG', '', 0, 1),
(128, 'Malawi', 'MW', 'MWI', '', 0, 1),
(129, 'Malaysia', 'MY', 'MYS', '', 0, 1),
(130, 'Maldives', 'MV', 'MDV', '', 0, 1),
(131, 'Mali', 'ML', 'MLI', '', 0, 1),
(132, 'Malta', 'MT', 'MLT', '', 0, 1),
(133, 'Marshall Islands', 'MH', 'MHL', '', 0, 1),
(134, 'Martinique', 'MQ', 'MTQ', '', 0, 1),
(135, 'Mauritania', 'MR', 'MRT', '', 0, 1),
(136, 'Mauritius', 'MU', 'MUS', '', 0, 1),
(137, 'Mayotte', 'YT', 'MYT', '', 0, 1),
(138, 'Mexico', 'MX', 'MEX', '', 0, 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 1),
(140, 'Moldova, Republic of', 'MD', 'MDA', '', 0, 1),
(141, 'Monaco', 'MC', 'MCO', '', 0, 1),
(142, 'Mongolia', 'MN', 'MNG', '', 0, 1),
(143, 'Montserrat', 'MS', 'MSR', '', 0, 1),
(144, 'Morocco', 'MA', 'MAR', '', 0, 1),
(145, 'Mozambique', 'MZ', 'MOZ', '', 0, 1),
(146, 'Myanmar', 'MM', 'MMR', '', 0, 1),
(147, 'Namibia', 'NA', 'NAM', '', 0, 1),
(148, 'Nauru', 'NR', 'NRU', '', 0, 1),
(149, 'Nepal', 'NP', 'NPL', '', 0, 1),
(150, 'Netherlands', 'NL', 'NLD', '', 0, 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 1),
(152, 'New Caledonia', 'NC', 'NCL', '', 0, 1),
(153, 'New Zealand', 'NZ', 'NZL', '', 0, 1),
(154, 'Nicaragua', 'NI', 'NIC', '', 0, 1),
(155, 'Niger', 'NE', 'NER', '', 0, 1),
(156, 'Nigeria', 'NG', 'NGA', '', 0, 1),
(157, 'Niue', 'NU', 'NIU', '', 0, 1),
(158, 'Norfolk Island', 'NF', 'NFK', '', 0, 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 1),
(160, 'Norway', 'NO', 'NOR', '', 0, 1),
(161, 'Oman', 'OM', 'OMN', '', 0, 1),
(162, 'Pakistan', 'PK', 'PAK', '', 0, 1),
(163, 'Palau', 'PW', 'PLW', '', 0, 1),
(164, 'Panama', 'PA', 'PAN', '', 0, 1),
(165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 1),
(166, 'Paraguay', 'PY', 'PRY', '', 0, 1),
(167, 'Peru', 'PE', 'PER', '', 0, 1),
(168, 'Philippines', 'PH', 'PHL', '', 0, 1),
(169, 'Pitcairn', 'PN', 'PCN', '', 0, 1),
(170, 'Poland', 'PL', 'POL', '', 0, 1),
(171, 'Portugal', 'PT', 'PRT', '', 0, 1),
(172, 'Puerto Rico', 'PR', 'PRI', '', 0, 1),
(173, 'Qatar', 'QA', 'QAT', '', 0, 1),
(174, 'Reunion', 'RE', 'REU', '', 0, 1),
(175, 'Romania', 'RO', 'ROM', '', 0, 1),
(176, 'Russian Federation', 'RU', 'RUS', '', 0, 1),
(177, 'Rwanda', 'RW', 'RWA', '', 0, 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 1),
(179, 'Saint Lucia', 'LC', 'LCA', '', 0, 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 1),
(181, 'Samoa', 'WS', 'WSM', '', 0, 1),
(182, 'San Marino', 'SM', 'SMR', '', 0, 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 1),
(184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 1),
(185, 'Senegal', 'SN', 'SEN', '', 0, 1),
(186, 'Seychelles', 'SC', 'SYC', '', 0, 1),
(187, 'Sierra Leone', 'SL', 'SLE', '', 0, 1),
(188, 'Singapore', 'SG', 'SGP', '', 0, 1),
(189, 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 1),
(190, 'Slovenia', 'SI', 'SVN', '', 0, 1),
(191, 'Solomon Islands', 'SB', 'SLB', '', 0, 1),
(192, 'Somalia', 'SO', 'SOM', '', 0, 1),
(193, 'South Africa', 'ZA', 'ZAF', '', 0, 1),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 1),
(195, 'Spain', 'ES', 'ESP', '', 0, 1),
(196, 'Sri Lanka', 'LK', 'LKA', '', 0, 1),
(197, 'St. Helena', 'SH', 'SHN', '', 0, 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 1),
(199, 'Sudan', 'SD', 'SDN', '', 0, 1),
(200, 'Suriname', 'SR', 'SUR', '', 0, 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 1),
(202, 'Swaziland', 'SZ', 'SWZ', '', 0, 1),
(203, 'Sweden', 'SE', 'SWE', '', 0, 1),
(204, 'Switzerland', 'CH', 'CHE', '', 0, 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 1),
(206, 'Taiwan', 'TW', 'TWN', '', 0, 1),
(207, 'Tajikistan', 'TJ', 'TJK', '', 0, 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 1),
(209, 'Thailand', 'TH', 'THA', '', 0, 1),
(210, 'Togo', 'TG', 'TGO', '', 0, 1),
(211, 'Tokelau', 'TK', 'TKL', '', 0, 1),
(212, 'Tonga', 'TO', 'TON', '', 0, 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 1),
(214, 'Tunisia', 'TN', 'TUN', '', 0, 1),
(215, 'Turkey', 'TR', 'TUR', '', 0, 1),
(216, 'Turkmenistan', 'TM', 'TKM', '', 0, 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 1),
(218, 'Tuvalu', 'TV', 'TUV', '', 0, 1),
(219, 'Uganda', 'UG', 'UGA', '', 0, 1),
(220, 'Ukraine', 'UA', 'UKR', '', 0, 1),
(221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 1),
(222, 'United Kingdom', 'GB', 'GBR', '', 1, 1),
(223, 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 1),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 1),
(225, 'Uruguay', 'UY', 'URY', '', 0, 1),
(226, 'Uzbekistan', 'UZ', 'UZB', '', 0, 1),
(227, 'Vanuatu', 'VU', 'VUT', '', 0, 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 1),
(229, 'Venezuela', 'VE', 'VEN', '', 0, 1),
(230, 'Viet Nam', 'VN', 'VNM', '', 0, 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 1),
(234, 'Western Sahara', 'EH', 'ESH', '', 0, 1),
(235, 'Yemen', 'YE', 'YEM', '', 0, 1),
(236, 'Yugoslavia', 'YU', 'YUG', '', 0, 1),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 1),
(238, 'Zambia', 'ZM', 'ZMB', '', 0, 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_coupon`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`coupon_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `i8a13_mijoshop_coupon`
--

INSERT INTO `i8a13_mijoshop_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', 10.0000, 0, 0, 0.0000, '2011-01-01', '2012-01-01', 10, '10', 1, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', 0.0000, 0, 1, 100.0000, '2009-03-01', '2009-08-31', 10, '10', 1, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', 10.0000, 0, 0, 10.0000, '1970-11-01', '2020-11-01', 100000, '10000', 1, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_coupon_category`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_coupon_history`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_coupon_product`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_currency`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '',
  `code` varchar(3) NOT NULL DEFAULT '',
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `i8a13_mijoshop_currency`
--

INSERT INTO `i8a13_mijoshop_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Pound Sterling', 'GBP', '£', '', '2', 0.61839998, 1, '2013-10-25 22:38:49'),
(2, 'US Dollar', 'USD', '$', '', '2', 1.00000000, 1, '2013-10-26 02:49:43'),
(3, 'Euro', 'EUR', '', '€', '2', 0.72439998, 1, '2013-10-25 22:38:49');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_customer`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL DEFAULT '',
  `lastname` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(96) NOT NULL DEFAULT '',
  `telephone` varchar(32) NOT NULL DEFAULT '',
  `fax` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL DEFAULT '',
  `salt` varchar(9) NOT NULL DEFAULT '',
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `i8a13_mijoshop_customer`
--

INSERT INTO `i8a13_mijoshop_customer` (`customer_id`, `store_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `customer_group_id`, `ip`, `status`, `approved`, `token`, `date_added`) VALUES
(1, 0, 'Super', 'User', 'trungqt2005@gmail.com', '', '', '5ecf74adf5e87c39f3ef7f80649c2877', '', NULL, NULL, 0, 1, 1, '0', 1, 1, '', '2013-10-24 13:48:54'),
(2, 0, 'trung', '', 'trungnguyenthanh70@gmail.com', '', '', 'b7805056a8d99595646fc3ef549f2d0b', '', '', '', 0, 2, 1, '::1', 1, 1, '', '2013-10-24 22:05:54');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_customer_ban_ip`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_customer_ban_ip` (
  `customer_ban_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`customer_ban_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_customer_group`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `company_id_display` int(1) NOT NULL,
  `company_id_required` int(1) NOT NULL,
  `tax_id_display` int(1) NOT NULL,
  `tax_id_required` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `i8a13_mijoshop_customer_group`
--

INSERT INTO `i8a13_mijoshop_customer_group` (`customer_group_id`, `approval`, `company_id_display`, `company_id_required`, `tax_id_display`, `tax_id_required`, `sort_order`) VALUES
(1, 0, 1, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_customer_group_description`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i8a13_mijoshop_customer_group_description`
--

INSERT INTO `i8a13_mijoshop_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_customer_history`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_customer_ip`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `i8a13_mijoshop_customer_ip`
--

INSERT INTO `i8a13_mijoshop_customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(1, 2, '::1', '2013-10-24 22:07:51');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_customer_online`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_customer_reward`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_customer_transaction`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_download`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) NOT NULL DEFAULT '',
  `mask` varchar(128) NOT NULL DEFAULT '',
  `remaining` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`download_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_download_description`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_extension`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=457 ;

--
-- Dumping data for table `i8a13_mijoshop_extension`
--

INSERT INTO `i8a13_mijoshop_extension` (`extension_id`, `type`, `code`) VALUES
(22, 'total', 'shipping'),
(23, 'payment', 'cod'),
(57, 'total', 'sub_total'),
(58, 'total', 'tax'),
(59, 'total', 'total'),
(349, 'total', 'handling'),
(350, 'total', 'low_order_fee'),
(387, 'shipping', 'flat'),
(389, 'total', 'coupon'),
(390, 'total', 'credit'),
(393, 'total', 'reward'),
(398, 'total', 'voucher'),
(407, 'payment', 'free_checkout'),
(408, 'module', 'account'),
(410, 'module', 'banner'),
(411, 'module', 'affiliate'),
(419, 'module', 'slideshow'),
(426, 'module', 'carousel'),
(450, 'module', 'categoryhome'),
(451, 'module', 'mijoshopcart'),
(452, 'module', 'category_accordion'),
(453, 'module', 'latest'),
(454, 'module', 'mijoshopminicart'),
(456, 'module', 'category');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_filter`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_filter_description`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_filter_group`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_filter_group_description`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_geo_zone`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `i8a13_mijoshop_geo_zone`
--

INSERT INTO `i8a13_mijoshop_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2010-02-26 22:33:24', '2009-01-06 23:26:25'),
(4, 'UK Shipping', 'UK Shipping Zones', '2010-12-15 15:18:13', '2009-06-23 01:14:53');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_information`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `i8a13_mijoshop_information`
--

INSERT INTO `i8a13_mijoshop_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_information_description`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i8a13_mijoshop_information_description`
--

INSERT INTO `i8a13_mijoshop_information_description` (`information_id`, `language_id`, `title`, `description`) VALUES
(3, 1, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n'),
(4, 1, 'About Us', '&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n'),
(5, 1, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n'),
(6, 1, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_information_to_layout`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_information_to_store`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i8a13_mijoshop_information_to_store`
--

INSERT INTO `i8a13_mijoshop_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_jgroup_cgroup_map`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_jgroup_cgroup_map` (
  `jgroup_id` int(11) NOT NULL,
  `cgroup_id` int(11) NOT NULL,
  PRIMARY KEY (`cgroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i8a13_mijoshop_jgroup_cgroup_map`
--

INSERT INTO `i8a13_mijoshop_jgroup_cgroup_map` (`jgroup_id`, `cgroup_id`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_jgroup_ugroup_map`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_jgroup_ugroup_map` (
  `jgroup_id` int(11) NOT NULL,
  `ugroup_id` int(11) NOT NULL,
  PRIMARY KEY (`ugroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i8a13_mijoshop_jgroup_ugroup_map`
--

INSERT INTO `i8a13_mijoshop_jgroup_ugroup_map` (`jgroup_id`, `ugroup_id`) VALUES
(8, 1),
(8, 10);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_juser_ocustomer_map`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_juser_ocustomer_map` (
  `juser_id` int(11) NOT NULL,
  `ocustomer_id` int(11) NOT NULL,
  PRIMARY KEY (`juser_id`),
  UNIQUE KEY `ocustomer_id` (`ocustomer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i8a13_mijoshop_juser_ocustomer_map`
--

INSERT INTO `i8a13_mijoshop_juser_ocustomer_map` (`juser_id`, `ocustomer_id`) VALUES
(553, 1),
(554, 2);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_juser_ouser_map`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_juser_ouser_map` (
  `juser_id` int(11) NOT NULL,
  `ouser_id` int(11) NOT NULL,
  PRIMARY KEY (`juser_id`),
  UNIQUE KEY `ouser_id` (`ouser_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i8a13_mijoshop_juser_ouser_map`
--

INSERT INTO `i8a13_mijoshop_juser_ouser_map` (`juser_id`, `ouser_id`) VALUES
(553, 1),
(554, 2);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_j_integrations`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_j_integrations` (
  `product_id` int(11) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i8a13_mijoshop_j_integrations`
--

INSERT INTO `i8a13_mijoshop_j_integrations` (`product_id`, `content`) VALUES
(34, '{"acl":[],"emailarticle":[],"mijoshop":[],"sql":[]}'),
(35, '{"acl":[],"emailarticle":[],"mijoshop":[],"sql":[]}'),
(32, '{"acl":[],"emailarticle":[],"mijoshop":[],"sql":[]}'),
(37, '{"acl":[],"emailarticle":[],"mijoshop":[],"sql":[]}'),
(33, '{"acl":[],"emailarticle":[],"mijoshop":[],"sql":[]}'),
(36, '{"acl":[],"emailarticle":[],"mijoshop":[],"sql":[]}');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_language`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL DEFAULT '',
  `filename` varchar(64) NOT NULL DEFAULT '',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `i8a13_mijoshop_language`
--

INSERT INTO `i8a13_mijoshop_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `filename`, `sort_order`, `status`) VALUES
(1, 'English', 'en', 'en_US.UTF-8,en_US,en-gb,english', 'gb.png', 'english', 'english', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_layout`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `i8a13_mijoshop_layout`
--

INSERT INTO `i8a13_mijoshop_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'Joomla Module');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_layout_route`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `i8a13_mijoshop_layout_route`
--

INSERT INTO `i8a13_mijoshop_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(17, 10, 0, 'affiliate/'),
(20, 2, 0, 'product/product'),
(22, 5, 0, 'product/manufacturer'),
(23, 7, 0, 'checkout/'),
(24, 11, 0, 'information/information'),
(26, 1, 0, 'common/home'),
(29, 3, 0, 'product/category'),
(30, 6, 0, 'account'),
(31, 8, 0, 'information/contact');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_length_class`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `i8a13_mijoshop_length_class`
--

INSERT INTO `i8a13_mijoshop_length_class` (`length_class_id`, `value`) VALUES
(1, 1.00000000),
(2, 10.00000000),
(3, 0.39370000);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_length_class_description`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_length_class_description` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `i8a13_mijoshop_length_class_description`
--

INSERT INTO `i8a13_mijoshop_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Centimeter', 'cm'),
(2, 1, 'Millimeter', 'mm'),
(3, 1, 'Inch', 'in');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_manufacturer`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `i8a13_mijoshop_manufacturer`
--

INSERT INTO `i8a13_mijoshop_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(9, 'Canon', 'data/canon_logo.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_manufacturer_to_store`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i8a13_mijoshop_manufacturer_to_store`
--

INSERT INTO `i8a13_mijoshop_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(9, 0);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_option`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `i8a13_mijoshop_option`
--

INSERT INTO `i8a13_mijoshop_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 2),
(2, 'checkbox', 3),
(4, 'text', 4),
(5, 'select', 1),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 1),
(12, 'date', 1);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_option_description`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i8a13_mijoshop_option_description`
--

INSERT INTO `i8a13_mijoshop_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 1, 'Radio'),
(2, 1, 'Checkbox'),
(4, 1, 'Text'),
(5, 1, 'Select'),
(6, 1, 'Textarea'),
(7, 1, 'File'),
(8, 1, 'Date'),
(9, 1, 'Time'),
(10, 1, 'Date &amp; Time'),
(11, 1, 'Size'),
(12, 1, 'Delivery Date');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_option_value`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `i8a13_mijoshop_option_value`
--

INSERT INTO `i8a13_mijoshop_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(23, 2, '', 1),
(24, 2, '', 2),
(31, 1, '', 2),
(32, 1, '', 1),
(39, 5, '', 1),
(40, 5, '', 2),
(41, 5, '', 3),
(42, 5, '', 4),
(43, 1, '', 3),
(44, 2, '', 3),
(45, 2, '', 4),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_option_value_description`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i8a13_mijoshop_option_value_description`
--

INSERT INTO `i8a13_mijoshop_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(23, 1, 2, 'Checkbox 1'),
(24, 1, 2, 'Checkbox 2'),
(31, 1, 1, 'Medium'),
(32, 1, 1, 'Small'),
(39, 1, 5, 'Red'),
(40, 1, 5, 'Blue'),
(41, 1, 5, 'Green'),
(42, 1, 5, 'Yellow'),
(43, 1, 1, 'Large'),
(44, 1, 2, 'Checkbox 3'),
(45, 1, 2, 'Checkbox 4'),
(46, 1, 11, 'Small'),
(47, 1, 11, 'Medium'),
(48, 1, 11, 'Large');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_order`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL DEFAULT '',
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL DEFAULT '',
  `fax` varchar(32) NOT NULL DEFAULT '',
  `payment_firstname` varchar(32) NOT NULL DEFAULT '',
  `payment_lastname` varchar(32) NOT NULL DEFAULT '',
  `payment_company` varchar(32) NOT NULL,
  `payment_company_id` varchar(32) NOT NULL,
  `payment_tax_id` varchar(32) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL DEFAULT '',
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_method` varchar(128) NOT NULL DEFAULT '',
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL DEFAULT '',
  `shipping_company` varchar(32) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL DEFAULT '',
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL DEFAULT '',
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_order_download`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_order_download` (
  `order_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `filename` varchar(128) NOT NULL DEFAULT '',
  `mask` varchar(128) NOT NULL DEFAULT '',
  `remaining` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_download_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_order_fraud`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_order_fraud` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `country_match` varchar(3) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `high_risk_country` varchar(3) NOT NULL,
  `distance` int(11) NOT NULL,
  `ip_region` varchar(255) NOT NULL,
  `ip_city` varchar(255) NOT NULL,
  `ip_latitude` decimal(10,6) NOT NULL,
  `ip_longitude` decimal(10,6) NOT NULL,
  `ip_isp` varchar(255) NOT NULL,
  `ip_org` varchar(255) NOT NULL,
  `ip_asnum` int(11) NOT NULL,
  `ip_user_type` varchar(255) NOT NULL,
  `ip_country_confidence` varchar(3) NOT NULL,
  `ip_region_confidence` varchar(3) NOT NULL,
  `ip_city_confidence` varchar(3) NOT NULL,
  `ip_postal_confidence` varchar(3) NOT NULL,
  `ip_postal_code` varchar(10) NOT NULL,
  `ip_accuracy_radius` int(11) NOT NULL,
  `ip_net_speed_cell` varchar(255) NOT NULL,
  `ip_metro_code` int(3) NOT NULL,
  `ip_area_code` int(3) NOT NULL,
  `ip_time_zone` varchar(255) NOT NULL,
  `ip_region_name` varchar(255) NOT NULL,
  `ip_domain` varchar(255) NOT NULL,
  `ip_country_name` varchar(255) NOT NULL,
  `ip_continent_code` varchar(2) NOT NULL,
  `ip_corporate_proxy` varchar(3) NOT NULL,
  `anonymous_proxy` varchar(3) NOT NULL,
  `proxy_score` int(3) NOT NULL,
  `is_trans_proxy` varchar(3) NOT NULL,
  `free_mail` varchar(3) NOT NULL,
  `carder_email` varchar(3) NOT NULL,
  `high_risk_username` varchar(3) NOT NULL,
  `high_risk_password` varchar(3) NOT NULL,
  `bin_match` varchar(10) NOT NULL,
  `bin_country` varchar(2) NOT NULL,
  `bin_name_match` varchar(3) NOT NULL,
  `bin_name` varchar(255) NOT NULL,
  `bin_phone_match` varchar(3) NOT NULL,
  `bin_phone` varchar(32) NOT NULL,
  `customer_phone_in_billing_location` varchar(8) NOT NULL,
  `ship_forward` varchar(3) NOT NULL,
  `city_postal_match` varchar(3) NOT NULL,
  `ship_city_postal_match` varchar(3) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `explanation` text NOT NULL,
  `risk_score` decimal(10,5) NOT NULL,
  `queries_remaining` int(11) NOT NULL,
  `maxmind_id` varchar(8) NOT NULL,
  `error` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_order_history`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(5) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_order_misc`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_order_misc` (
  `order_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`order_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_order_option`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_order_product`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(24) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_order_status`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `i8a13_mijoshop_order_status`
--

INSERT INTO `i8a13_mijoshop_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(2, 1, 'Processing'),
(3, 1, 'Shipped'),
(5, 1, 'Complete'),
(7, 1, 'Canceled'),
(8, 1, 'Denied'),
(9, 1, 'Canceled Reversal'),
(10, 1, 'Failed'),
(11, 1, 'Refunded'),
(12, 1, 'Reversed'),
(13, 1, 'Chargeback'),
(14, 1, 'Expired'),
(15, 1, 'Processed'),
(16, 1, 'Voided');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_order_total`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `text` varchar(255) NOT NULL DEFAULT '',
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `idx_orders_total_orders_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_order_voucher`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_product`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL,
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `viewed` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `i8a13_mijoshop_product`
--

INSERT INTO `i8a13_mijoshop_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `date_added`, `date_modified`, `viewed`) VALUES
(30, 'Product 3', '', '', '', '', '', '', '', 7, 6, 'data/canon_eos_5d_1.jpg', 9, 1, 100.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 1, '2009-02-03 16:59:00', '2011-09-30 01:05:23', 10),
(31, 'Product 4', '', '', '', '', '', '', '', 1000, 6, 'data/nikon_d300_1.jpg', 0, 1, 80.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 0, 1, '2009-02-03 17:00:10', '2011-09-30 01:06:00', 2),
(32, 'Product 3', '', '', '', '', '', '', '', 7, 6, 'data/TheProvidoresTable-Home_15.jpg', 9, 1, 100.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 1, '2013-10-24 17:31:28', '2013-10-26 16:37:38', 0),
(33, 'Product 4', '', '', '', '', '', '', '', 1000, 6, 'data/TheProvidoresTable-Home_17.jpg', 0, 1, 80.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 0, 1, '2013-10-24 17:31:28', '2013-10-26 16:41:39', 0),
(34, 'Product 3', '', '', '', '', '', '', '', 7, 6, 'data/canon_eos_5d_1.jpg', 9, 1, 100.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 0, '2013-10-24 17:31:38', '2013-10-24 17:32:15', 0),
(35, 'Product 3', '', '', '', '', '', '', '', 7, 6, 'data/canon_eos_5d_1.jpg', 9, 1, 100.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 0, '2013-10-24 17:31:38', '2013-10-24 17:33:19', 0),
(36, 'Product 4', '', '', '', '', '', '', '', 1000, 6, 'data/TheProvidoresTable-Home_23.jpg', 0, 1, 80.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 0, 1, '2013-10-24 17:31:38', '2013-10-26 16:42:53', 0),
(37, 'Product 4', '', '', '', '', '', '', '', 1000, 6, 'data/TheProvidoresTable-Home_10.jpg', 0, 1, 80.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 0, 1, '2013-10-24 17:31:38', '2013-10-26 16:38:33', 0);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_product_attribute`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_product_description`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_product_description` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `tag` text NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `tag` (`tag`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `i8a13_mijoshop_product_description`
--

INSERT INTO `i8a13_mijoshop_product_description` (`product_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `tag`) VALUES
(31, 1, 'Nikon D300', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', ''),
(30, 1, 'Canon EOS 5D', '&lt;p&gt;\r\n	Canon''s press material for the EOS 5D states that it ''defines (a) new D-SLR category'', while we''re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably ''chunkier''). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR''s, an important difference when compared to the latter is that the EOS 5D doesn''t have any environmental seals. While Canon don''t specifically refer to the EOS 5D as a ''professional'' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they''ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n', '', '', ''),
(32, 1, 'Canon EOS 5D', '&lt;p&gt;Canon''s press material for the EOS 5D states that it ''defines (a) new D-SLR category'', while we''re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably ''chunkier''). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR''s, an important difference when compared to the latter is that the EOS 5D doesn''t have any environmental seals. While Canon don''t specifically refer to the EOS 5D as a ''professional'' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they''ve not bought too many EF-S lenses...) äë&lt;/p&gt;', '', '', ''),
(33, 1, 'Nikon D300', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n&lt;div&gt;Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon''s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt; &lt;br /&gt; Similar to the D3, the D300 features Nikon''s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera''s new features. The D300 features a new 51-point autofocus system with Nikon''s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera''s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt; &lt;br /&gt; The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt; &lt;br /&gt; The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon''s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', ''),
(34, 1, 'Canon EOS 5D', '&lt;p&gt;Canon''s press material for the EOS 5D states that it ''defines (a) new D-SLR category'', while we''re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably ''chunkier''). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR''s, an important difference when compared to the latter is that the EOS 5D doesn''t have any environmental seals. While Canon don''t specifically refer to the EOS 5D as a ''professional'' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they''ve not bought too many EF-S lenses...) äë&lt;/p&gt;', '', '', ''),
(35, 1, 'htc ', '&lt;p&gt;Canon''s press material for the EOS 5D states that it ''defines (a) new D-SLR category'', while we''re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably ''chunkier''). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR''s, an important difference when compared to the latter is that the EOS 5D doesn''t have any environmental seals. While Canon don''t specifically refer to the EOS 5D as a ''professional'' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they''ve not bought too many EF-S lenses...) äë&lt;/p&gt;', '', '', ''),
(36, 1, 'Nikon D300', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n&lt;div&gt;Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon''s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt; &lt;br /&gt; Similar to the D3, the D300 features Nikon''s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera''s new features. The D300 features a new 51-point autofocus system with Nikon''s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera''s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt; &lt;br /&gt; The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt; &lt;br /&gt; The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon''s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', ''),
(37, 1, 'Nikon D300', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n&lt;div&gt;Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon''s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt; &lt;br /&gt; Similar to the D3, the D300 features Nikon''s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera''s new features. The D300 features a new 51-point autofocus system with Nikon''s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera''s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt; &lt;br /&gt; The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt; &lt;br /&gt; The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon''s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_product_discount`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_product_filter`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_product_image`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2370 ;

--
-- Dumping data for table `i8a13_mijoshop_product_image`
--

INSERT INTO `i8a13_mijoshop_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(1985, 31, 'data/nikon_d300_2.jpg', 0),
(1986, 31, 'data/nikon_d300_3.jpg', 0),
(2344, 30, 'data/canon_eos_5d_3.jpg', 0),
(2345, 30, 'data/canon_eos_5d_2.jpg', 0),
(2358, 34, 'data/canon_eos_5d_3.jpg', 0),
(2359, 34, 'data/canon_eos_5d_2.jpg', 0),
(2360, 35, 'data/canon_eos_5d_3.jpg', 0),
(2361, 35, 'data/canon_eos_5d_2.jpg', 0),
(2362, 32, 'data/canon_eos_5d_3.jpg', 0),
(2363, 32, 'data/canon_eos_5d_2.jpg', 0),
(2364, 37, 'data/nikon_d300_2.jpg', 0),
(2365, 37, 'data/nikon_d300_3.jpg', 0),
(2366, 33, 'data/nikon_d300_2.jpg', 0),
(2367, 33, 'data/nikon_d300_3.jpg', 0),
(2368, 36, 'data/nikon_d300_2.jpg', 0),
(2369, 36, 'data/nikon_d300_3.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_product_option`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=230 ;

--
-- Dumping data for table `i8a13_mijoshop_product_option`
--

INSERT INTO `i8a13_mijoshop_product_option` (`product_option_id`, `product_id`, `option_id`, `option_value`, `required`) VALUES
(226, 30, 5, '', 1),
(227, 32, 5, '', 1),
(228, 34, 5, '', 1),
(229, 35, 5, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_product_option_value`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `i8a13_mijoshop_product_option_value`
--

INSERT INTO `i8a13_mijoshop_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(15, 226, 30, 5, 39, 2, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(16, 226, 30, 5, 40, 5, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(17, 227, 32, 5, 39, 2, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(18, 227, 32, 5, 40, 5, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(19, 228, 34, 5, 39, 2, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(20, 228, 34, 5, 40, 5, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(21, 229, 35, 5, 39, 2, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(22, 229, 35, 5, 40, 5, 1, 0.0000, '+', 0, '+', 0.00000000, '+');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_product_related`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i8a13_mijoshop_product_related`
--

INSERT INTO `i8a13_mijoshop_product_related` (`product_id`, `related_id`) VALUES
(30, 31),
(31, 32),
(31, 34),
(31, 35),
(32, 31),
(32, 33),
(32, 36),
(32, 37),
(33, 32),
(33, 35),
(34, 31),
(34, 36),
(35, 31),
(35, 33),
(35, 36),
(35, 37),
(36, 32),
(36, 34),
(36, 35),
(37, 32),
(37, 35);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_product_reward`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=559 ;

--
-- Dumping data for table `i8a13_mijoshop_product_reward`
--

INSERT INTO `i8a13_mijoshop_product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(337, 31, 8, 0),
(338, 31, 6, 0),
(539, 30, 8, 200),
(540, 30, 6, 20),
(553, 34, 1, 0),
(554, 35, 1, 0),
(555, 32, 1, 0),
(556, 37, 1, 0),
(557, 33, 1, 0),
(558, 36, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_product_special`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=452 ;

--
-- Dumping data for table `i8a13_mijoshop_product_special`
--

INSERT INTO `i8a13_mijoshop_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES
(438, 30, 8, 1, 80.0000, '0000-00-00', '0000-00-00'),
(439, 30, 8, 2, 90.0000, '0000-00-00', '0000-00-00'),
(446, 34, 1, 1, 80.0000, '0000-00-00', '0000-00-00'),
(447, 34, 1, 2, 90.0000, '0000-00-00', '0000-00-00'),
(448, 35, 1, 1, 80.0000, '0000-00-00', '0000-00-00'),
(449, 35, 1, 2, 90.0000, '0000-00-00', '0000-00-00'),
(450, 32, 1, 1, 80.0000, '0000-00-00', '0000-00-00'),
(451, 32, 1, 2, 90.0000, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_product_tag`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_product_tag` (
  `product_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `tag` varchar(32) NOT NULL,
  PRIMARY KEY (`product_tag_id`),
  KEY `product_id` (`product_id`),
  KEY `language_id` (`language_id`),
  KEY `tag` (`tag`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=343 ;

--
-- Dumping data for table `i8a13_mijoshop_product_tag`
--

INSERT INTO `i8a13_mijoshop_product_tag` (`product_tag_id`, `product_id`, `language_id`, `tag`) VALUES
(341, 30, 1, 'test 1'),
(342, 30, 1, 'test 2');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_product_to_category`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i8a13_mijoshop_product_to_category`
--

INSERT INTO `i8a13_mijoshop_product_to_category` (`product_id`, `category_id`) VALUES
(30, 33),
(31, 33),
(32, 33),
(33, 33),
(34, 41),
(35, 33),
(35, 34),
(36, 33),
(37, 33);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_product_to_download`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_product_to_layout`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_product_to_store`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i8a13_mijoshop_product_to_store`
--

INSERT INTO `i8a13_mijoshop_product_to_store` (`product_id`, `store_id`) VALUES
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(37, 0);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_return`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_return_action`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `i8a13_mijoshop_return_action`
--

INSERT INTO `i8a13_mijoshop_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Refunded'),
(2, 1, 'Credit Issued'),
(3, 1, 'Replacement Sent');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_return_history`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_return_reason`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `i8a13_mijoshop_return_reason`
--

INSERT INTO `i8a13_mijoshop_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Dead On Arrival'),
(2, 1, 'Received Wrong Item'),
(3, 1, 'Order Error'),
(4, 1, 'Faulty, please supply details'),
(5, 1, 'Other, please supply details');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_return_status`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `i8a13_mijoshop_return_status`
--

INSERT INTO `i8a13_mijoshop_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(2, 1, 'Awaiting Products'),
(3, 1, 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_review`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL DEFAULT '',
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_setting`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `group` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=496 ;

--
-- Dumping data for table `i8a13_mijoshop_setting`
--

INSERT INTO `i8a13_mijoshop_setting` (`setting_id`, `store_id`, `group`, `key`, `value`, `serialized`) VALUES
(1, 0, 'shipping', 'shipping_sort_order', '3', 0),
(2, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(3, 0, 'sub_total', 'sub_total_status', '1', 0),
(4, 0, 'tax', 'tax_status', '1', 0),
(5, 0, 'total', 'total_sort_order', '9', 0),
(6, 0, 'total', 'total_status', '1', 0),
(7, 0, 'tax', 'tax_sort_order', '5', 0),
(8, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(9, 0, 'cod', 'cod_sort_order', '5', 0),
(10, 0, 'cod', 'cod_total', '0.01', 0),
(11, 0, 'cod', 'cod_order_status_id', '1', 0),
(12, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(13, 0, 'cod', 'cod_status', '1', 0),
(14, 0, 'shipping', 'shipping_status', '1', 0),
(15, 0, 'shipping', 'shipping_estimator', '1', 0),
(27, 0, 'coupon', 'coupon_sort_order', '4', 0),
(28, 0, 'coupon', 'coupon_status', '1', 0),
(34, 0, 'flat', 'flat_sort_order', '1', 0),
(35, 0, 'flat', 'flat_status', '1', 0),
(36, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(37, 0, 'flat', 'flat_tax_class_id', '9', 0),
(41, 0, 'flat', 'flat_cost', '5.00', 0),
(42, 0, 'credit', 'credit_sort_order', '7', 0),
(43, 0, 'credit', 'credit_status', '1', 0),
(53, 0, 'reward', 'reward_sort_order', '2', 0),
(54, 0, 'reward', 'reward_status', '1', 0),
(94, 0, 'voucher', 'voucher_sort_order', '8', 0),
(95, 0, 'voucher', 'voucher_status', '1', 0),
(103, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(104, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(132, 0, 'mijoshopcart', 'mijoshopcart_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:2:"12";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}}', 1),
(151, 0, 'latest', 'latest_module', 'a:2:{i:0;a:7:{s:5:"limit";s:1:"5";s:11:"image_width";s:2:"80";s:12:"image_height";s:2:"80";s:9:"layout_id";s:2:"12";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}i:1;a:7:{s:5:"limit";s:1:"5";s:11:"image_width";s:2:"80";s:12:"image_height";s:2:"80";s:9:"layout_id";s:1:"1";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}}', 1),
(152, 0, 'latest', 'option', 'com_mijoshop', 0),
(153, 0, 'latest', 'mijoshop_store_id', '0', 0),
(160, 0, 'mijoshopminicart', 'mijoshopminicart_module', 'a:1:{i:0;a:4:{s:9:"layout_id";s:2:"12";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}}', 1),
(161, 0, 'mijoshopminicart', 'option', 'com_mijoshop', 0),
(162, 0, 'mijoshopminicart', 'mijoshop_store_id', '0', 0),
(163, 0, 'slideshow', 'slideshow_module', 'a:1:{i:0;a:7:{s:9:"banner_id";s:1:"8";s:5:"width";s:3:"935";s:6:"height";s:3:"408";s:9:"layout_id";s:2:"12";s:8:"position";s:11:"content_top";s:6:"status";s:1:"1";s:10:"sort_order";s:0:"";}}', 1),
(164, 0, 'slideshow', 'button', 'save', 0),
(165, 0, 'slideshow', 'option', 'com_mijoshop', 0),
(166, 0, 'slideshow', 'mijoshop_store_id', '0', 0),
(272, 0, 'account', 'button', 'save', 0),
(273, 0, 'account', 'option', 'com_mijoshop', 0),
(274, 0, 'account', 'mijoshop_store_id', '0', 0),
(336, 0, 'category_accordion', 'category_accordion_0_layout_id', '1', 0),
(337, 0, 'category_accordion', 'category_accordion_0_position', 'column_left', 0),
(338, 0, 'category_accordion', 'category_accordion_0_status', '1', 0),
(339, 0, 'category_accordion', 'category_accordion_0_sort_order', '', 0),
(340, 0, 'category_accordion', 'category_accordion_1_layout_id', '3', 0),
(341, 0, 'category_accordion', 'category_accordion_1_position', 'column_left', 0),
(342, 0, 'category_accordion', 'category_accordion_1_status', '1', 0),
(343, 0, 'category_accordion', 'category_accordion_1_sort_order', '', 0),
(344, 0, 'category_accordion', 'category_accordion_2_layout_id', '2', 0),
(345, 0, 'category_accordion', 'category_accordion_2_position', 'column_left', 0),
(346, 0, 'category_accordion', 'category_accordion_2_status', '1', 0),
(347, 0, 'category_accordion', 'category_accordion_2_sort_order', '', 0),
(348, 0, 'category_accordion', 'category_accordion_3_layout_id', '6', 0),
(349, 0, 'category_accordion', 'category_accordion_3_position', 'column_left', 0),
(350, 0, 'category_accordion', 'category_accordion_3_status', '1', 0),
(351, 0, 'category_accordion', 'category_accordion_3_sort_order', '', 0),
(352, 0, 'category_accordion', 'category_accordion_4_layout_id', '7', 0),
(353, 0, 'category_accordion', 'category_accordion_4_position', 'column_left', 0),
(354, 0, 'category_accordion', 'category_accordion_4_status', '1', 0),
(355, 0, 'category_accordion', 'category_accordion_4_sort_order', '', 0),
(356, 0, 'category_accordion', 'category_accordion_5_layout_id', '12', 0),
(357, 0, 'category_accordion', 'category_accordion_5_position', 'column_left', 0),
(358, 0, 'category_accordion', 'category_accordion_5_status', '1', 0),
(359, 0, 'category_accordion', 'category_accordion_5_sort_order', '', 0),
(360, 0, 'category_accordion', 'category_accordion_module', '0,1,2,3,4,5', 0),
(361, 0, 'category_accordion', 'option', 'com_mijoshop', 0),
(362, 0, 'category_accordion', 'mijoshop_store_id', '0', 0),
(392, 0, 'category', 'category_module', 'a:13:{i:0;a:4:{s:9:"layout_id";s:2:"12";s:8:"position";s:11:"column_left";s:6:"status";s:1:"0";s:10:"sort_order";s:0:"";}i:1;a:4:{s:9:"layout_id";s:1:"3";s:8:"position";s:11:"column_left";s:6:"status";s:1:"0";s:10:"sort_order";s:0:"";}i:2;a:4:{s:9:"layout_id";s:1:"2";s:8:"position";s:11:"column_left";s:6:"status";s:1:"0";s:10:"sort_order";s:0:"";}i:3;a:4:{s:9:"layout_id";s:1:"6";s:8:"position";s:11:"column_left";s:6:"status";s:1:"0";s:10:"sort_order";s:0:"";}i:4;a:4:{s:9:"layout_id";s:2:"10";s:8:"position";s:11:"column_left";s:6:"status";s:1:"0";s:10:"sort_order";s:0:"";}i:5;a:4:{s:9:"layout_id";s:1:"7";s:8:"position";s:11:"column_left";s:6:"status";s:1:"0";s:10:"sort_order";s:0:"";}i:6;a:4:{s:9:"layout_id";s:1:"8";s:8:"position";s:11:"column_left";s:6:"status";s:1:"0";s:10:"sort_order";s:0:"";}i:7;a:4:{s:9:"layout_id";s:1:"4";s:8:"position";s:11:"column_left";s:6:"status";s:1:"0";s:10:"sort_order";s:0:"";}i:8;a:4:{s:9:"layout_id";s:2:"11";s:8:"position";s:11:"column_left";s:6:"status";s:1:"0";s:10:"sort_order";s:0:"";}i:9;a:4:{s:9:"layout_id";s:1:"5";s:8:"position";s:11:"column_left";s:6:"status";s:1:"0";s:10:"sort_order";s:0:"";}i:10;a:4:{s:9:"layout_id";s:1:"6";s:8:"position";s:11:"column_left";s:6:"status";s:1:"0";s:10:"sort_order";s:0:"";}i:11;a:4:{s:9:"layout_id";s:1:"9";s:8:"position";s:11:"column_left";s:6:"status";s:1:"0";s:10:"sort_order";s:0:"";}i:12;a:4:{s:9:"layout_id";s:1:"1";s:8:"position";s:11:"column_left";s:6:"status";s:1:"0";s:10:"sort_order";s:0:"";}}', 1),
(393, 0, 'category', 'button', 'save', 0),
(394, 0, 'category', 'option', 'com_mijoshop', 0),
(395, 0, 'category', 'mijoshop_store_id', '0', 0),
(396, 0, 'categoryhome', 'categoryhome_module', 'a:2:{i:0;a:5:{s:13:"parent_cat_id";s:1:"0";s:9:"layout_id";s:2:"12";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"1";}i:1;a:5:{s:13:"parent_cat_id";s:1:"0";s:9:"layout_id";s:1:"1";s:8:"position";s:14:"content_bottom";s:6:"status";s:1:"1";s:10:"sort_order";s:1:"2";}}', 1),
(397, 0, 'categoryhome', 'option', 'com_mijoshop', 0),
(398, 0, 'categoryhome', 'mijoshop_store_id', '0', 0),
(399, 0, 'config', 'config_name', 'Your Store', 0),
(400, 0, 'config', 'config_owner', 'Your Name', 0),
(401, 0, 'config', 'config_address', 'Address 1', 0),
(402, 0, 'config', 'config_email', 'your@store.com', 0),
(403, 0, 'config', 'config_telephone', '123456789', 0),
(404, 0, 'config', 'config_fax', '', 0),
(405, 0, 'config', 'config_title', 'Your Store', 0),
(406, 0, 'config', 'config_meta_description', 'My Store', 0),
(407, 0, 'config', 'config_template', 'default', 0),
(408, 0, 'config', 'config_layout_id', '4', 0),
(409, 0, 'config', 'config_country_id', '222', 0),
(410, 0, 'config', 'config_zone_id', '3563', 0),
(411, 0, 'config', 'config_language', 'en', 0),
(412, 0, 'config', 'config_currency', 'USD', 0),
(413, 0, 'config', 'config_currency_auto', '1', 0),
(414, 0, 'config', 'config_length_class_id', '1', 0),
(415, 0, 'config', 'config_weight_class_id', '1', 0),
(416, 0, 'config', 'config_catalog_limit', '15', 0),
(417, 0, 'config', 'config_admin_limit', '20', 0),
(418, 0, 'config', 'config_product_count', '1', 0),
(419, 0, 'config', 'config_review_status', '1', 0),
(420, 0, 'config', 'config_download', '1', 0),
(421, 0, 'config', 'config_voucher_min', '1', 0),
(422, 0, 'config', 'config_voucher_max', '1000', 0),
(423, 0, 'config', 'config_tax', '1', 0),
(424, 0, 'config', 'config_vat', '0', 0),
(425, 0, 'config', 'config_tax_default', 'shipping', 0),
(426, 0, 'config', 'config_tax_customer', 'shipping', 0),
(427, 0, 'config', 'config_customer_online', '0', 0),
(428, 0, 'config', 'config_customer_group_id', '1', 0),
(429, 0, 'config', 'config_customer_group_display', 'a:1:{i:0;s:1:"1";}', 1),
(430, 0, 'config', 'config_customer_price', '0', 0),
(431, 0, 'config', 'config_account_id', '3', 0),
(432, 0, 'config', 'config_cart_weight', '1', 0),
(433, 0, 'config', 'config_guest_checkout', '1', 0),
(434, 0, 'config', 'config_checkout_id', '5', 0),
(435, 0, 'config', 'config_order_edit', '100', 0),
(436, 0, 'config', 'config_invoice_prefix', 'INV-2012-00', 0),
(437, 0, 'config', 'config_order_status_id', '1', 0),
(438, 0, 'config', 'config_complete_status_id', '5', 0),
(439, 0, 'config', 'config_stock_display', '0', 0),
(440, 0, 'config', 'config_stock_warning', '0', 0),
(441, 0, 'config', 'config_stock_checkout', '0', 0),
(442, 0, 'config', 'config_stock_status_id', '5', 0),
(443, 0, 'config', 'config_affiliate_id', '4', 0),
(444, 0, 'config', 'config_commission', '5', 0),
(445, 0, 'config', 'config_return_id', '0', 0),
(446, 0, 'config', 'config_return_status_id', '2', 0),
(447, 0, 'config', 'config_logo', 'data/logo.png', 0),
(448, 0, 'config', 'config_image_category_width', '204', 0),
(449, 0, 'config', 'config_image_category_height', '206', 0),
(450, 0, 'config', 'config_image_thumb_width', '228', 0),
(451, 0, 'config', 'config_image_thumb_height', '228', 0),
(452, 0, 'config', 'config_image_popup_width', '500', 0),
(453, 0, 'config', 'config_image_popup_height', '500', 0),
(454, 0, 'config', 'config_image_product_width', '204', 0),
(455, 0, 'config', 'config_image_product_height', '206', 0),
(456, 0, 'config', 'config_image_additional_width', '204', 0),
(457, 0, 'config', 'config_image_additional_height', '206', 0),
(458, 0, 'config', 'config_image_related_width', '204', 0),
(459, 0, 'config', 'config_image_related_height', '206', 0),
(460, 0, 'config', 'config_image_compare_width', '204', 0),
(461, 0, 'config', 'config_image_compare_height', '206', 0),
(462, 0, 'config', 'config_image_wishlist_width', '47', 0),
(463, 0, 'config', 'config_image_wishlist_height', '47', 0),
(464, 0, 'config', 'config_image_cart_width', '47', 0),
(465, 0, 'config', 'config_image_cart_height', '47', 0),
(466, 0, 'config', 'config_mail_protocol', 'mail', 0),
(467, 0, 'config', 'config_mail_parameter', '', 0),
(468, 0, 'config', 'config_smtp_host', '', 0),
(469, 0, 'config', 'config_smtp_username', '', 0),
(470, 0, 'config', 'config_smtp_password', '', 0),
(471, 0, 'config', 'config_smtp_port', '25', 0),
(472, 0, 'config', 'config_smtp_timeout', '5', 0),
(473, 0, 'config', 'config_alert_mail', '0', 0),
(474, 0, 'config', 'config_account_mail', '0', 0),
(475, 0, 'config', 'config_alert_emails', '', 0),
(476, 0, 'config', 'config_fraud_detection', '0', 0),
(477, 0, 'config', 'config_fraud_key', '', 0),
(478, 0, 'config', 'config_fraud_score', '', 0),
(479, 0, 'config', 'config_fraud_status_id', '7', 0),
(480, 0, 'config', 'config_secure', '0', 0),
(481, 0, 'config', 'config_shared', '0', 0),
(482, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai''hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwget\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(483, 0, 'config', 'config_file_extension_allowed', 'txt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc\r\nrtf\r\nxls\r\nppt\r\nodt\r\nods', 0),
(484, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/jpeg\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/vnd.microsoft.icon\r\nimage/tiff\r\nimage/tiff\r\nimage/svg+xml\r\nimage/svg+xml\r\napplication/zip\r\napplication/x-zip\r\napplication/zip-compressed\r\napplication/x-zip-compressed\r\napplication/x-compress\r\napplication/octet-stream\r\napplication/x-rar-compressed\r\napplication/x-msdownload\r\napplication/vnd.ms-cab-compressed\r\naudio/mpeg\r\nvideo/quicktime\r\nvideo/quicktime\r\napplication/pdf\r\nimage/vnd.adobe.photoshop\r\napplication/postscript\r\napplication/postscript\r\napplication/postscript\r\napplication/msword\r\napplication/rtf\r\napplication/vnd.ms-excel\r\napplication/vnd.ms-powerpoint\r\napplication/vnd.oasis.opendocument.text\r\napplication/vnd.oasis.opendocument.spreadsheet', 0),
(485, 0, 'config', 'config_maintenance', '0', 0),
(486, 0, 'config', 'config_password', '1', 0),
(487, 0, 'config', 'config_encryption', '12345', 0),
(488, 0, 'config', 'config_compression', '0', 0),
(489, 0, 'config', 'config_error_display', '0', 0),
(490, 0, 'config', 'config_error_log', '0', 0),
(491, 0, 'config', 'config_error_filename', 'error.txt', 0),
(492, 0, 'config', 'config_google_analytics', '', 0),
(493, 0, 'config', 'config_mijoshop', 'a:13:{s:3:"pid";s:72:"[10:27:52 AM] Earthlink Design: YW5kcmV3QGVhcnRobGlua2Rlc2lnbi5jb20uYXU=";s:18:"enable_vqmod_cache";s:1:"1";s:11:"show_header";s:1:"1";s:11:"show_footer";s:1:"1";s:14:"show_cats_menu";s:1:"0";s:19:"trigger_content_plg";s:1:"0";s:12:"fix_ie_cache";s:1:"0";s:20:"check_j_block_status";s:1:"0";s:16:"mijoshop_display";s:1:"0";s:12:"button_class";s:15:"btn btn-primary";s:8:"comments";s:1:"0";s:19:"mijosef_integration";s:1:"0";s:17:"account_sync_done";s:1:"1";}', 1),
(494, 0, 'config', 'option', 'com_mijoshop', 0),
(495, 0, 'config', 'mijoshop_store_id', '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_stock_status`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `i8a13_mijoshop_stock_status`
--

INSERT INTO `i8a13_mijoshop_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(5, 1, 'Out Of Stock'),
(6, 1, '2 - 3 Days'),
(7, 1, 'In Stock'),
(8, 1, 'Pre-Order');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_store`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_tax_class`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_class_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `i8a13_mijoshop_tax_class`
--

INSERT INTO `i8a13_mijoshop_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed Stuff', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_tax_rate`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

--
-- Dumping data for table `i8a13_mijoshop_tax_rate`
--

INSERT INTO `i8a13_mijoshop_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (17.5%)', 17.5000, 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', 2.0000, 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_tax_rate_to_customer_group`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i8a13_mijoshop_tax_rate_to_customer_group`
--

INSERT INTO `i8a13_mijoshop_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_tax_rule`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=129 ;

--
-- Dumping data for table `i8a13_mijoshop_tax_rule`
--

INSERT INTO `i8a13_mijoshop_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(120, 10, 87, 'store', 0),
(121, 10, 86, 'payment', 1),
(127, 9, 87, 'shipping', 2),
(128, 9, 86, 'shipping', 1);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_url_alias`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `i8a13_mijoshop_url_alias`
--

INSERT INTO `i8a13_mijoshop_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(15, 'category_id=33', 'cameras'),
(16, 'category_id=40', 'canon'),
(18, 'category_id=41', 'laptop'),
(19, 'category_id=34', 'smart-phone'),
(29, 'product_id=34', 'canon-eos-5d'),
(30, 'product_id=35', 'canon-eos-5d'),
(35, 'category_id=36', 'apple'),
(36, 'category_id=37', 'htc'),
(37, 'category_id=35', 'LG'),
(39, 'category_id=38', 'samsung'),
(40, 'category_id=39', 'nikon'),
(42, 'category_id=42', 'category-3'),
(43, 'category_id=43', 'category4'),
(44, 'category_id=44', 'category-5'),
(45, 'category_id=45', 'category-6'),
(46, 'product_id=32', 'canon-eos-5d'),
(47, 'product_id=37', 'nikon-d300'),
(48, 'product_id=33', 'nikon-d300'),
(49, 'product_id=36', 'nikon-d300');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_user`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL DEFAULT '',
  `salt` varchar(9) NOT NULL DEFAULT '',
  `firstname` varchar(32) NOT NULL DEFAULT '',
  `lastname` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(96) NOT NULL DEFAULT '',
  `code` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `i8a13_mijoshop_user`
--

INSERT INTO `i8a13_mijoshop_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', '5ecf74adf5e87c39f3ef7f80649c2877', '', 'Super', 'User', 'trungqt2005@gmail.com', '', '::1', 1, '2013-10-24 11:59:39'),
(2, 1, 'trungjc', 'b7805056a8d99595646fc3ef549f2d0b', '', 'trung', '', 'trungnguyenthanh70@gmail.com', '', '::1', 1, '2013-10-24 22:08:00');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_user_group`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `i8a13_mijoshop_user_group`
--

INSERT INTO `i8a13_mijoshop_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Top Administrator', 'a:2:{s:6:"access";a:152:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:16:"catalog/category";i:3;s:16:"catalog/download";i:4;s:14:"catalog/filter";i:5;s:19:"catalog/information";i:6;s:20:"catalog/manufacturer";i:7;s:14:"catalog/option";i:8;s:15:"catalog/product";i:9;s:14:"catalog/review";i:10;s:11:"common/edit";i:11;s:19:"common/editorbutton";i:12;s:18:"common/filemanager";i:13;s:14:"common/support";i:14;s:14:"common/upgrade";i:15;s:13:"design/banner";i:16;s:19:"design/custom_field";i:17;s:13:"design/layout";i:18;s:14:"extension/feed";i:19;s:17:"extension/manager";i:20;s:16:"extension/module";i:21;s:17:"extension/payment";i:22;s:18:"extension/shipping";i:23;s:15:"extension/total";i:24;s:16:"feed/google_base";i:25;s:19:"feed/google_sitemap";i:26;s:20:"localisation/country";i:27;s:21:"localisation/currency";i:28;s:21:"localisation/geo_zone";i:29;s:25:"localisation/length_class";i:30;s:25:"localisation/order_status";i:31;s:26:"localisation/return_action";i:32;s:26:"localisation/return_reason";i:33;s:26:"localisation/return_status";i:34;s:25:"localisation/stock_status";i:35;s:22:"localisation/tax_class";i:36;s:21:"localisation/tax_rate";i:37;s:25:"localisation/weight_class";i:38;s:17:"localisation/zone";i:39;s:14:"module/account";i:40;s:16:"module/affiliate";i:41;s:13:"module/banner";i:42;s:17:"module/bestseller";i:43;s:15:"module/carousel";i:44;s:15:"module/category";i:45;s:25:"module/category_accordion";i:46;s:19:"module/categoryhome";i:47;s:15:"module/featured";i:48;s:13:"module/filter";i:49;s:18:"module/google_talk";i:50;s:18:"module/information";i:51;s:13:"module/latest";i:52;s:12:"module/login";i:53;s:19:"module/manufacturer";i:54;s:19:"module/mijoshopcart";i:55;s:23:"module/mijoshopcurrency";i:56;s:23:"module/mijoshopminicart";i:57;s:16:"module/pp_layout";i:58;s:16:"module/slideshow";i:59;s:14:"module/special";i:60;s:12:"module/store";i:61;s:20:"module/vqmod_manager";i:62;s:14:"module/welcome";i:63;s:16:"payment/alertpay";i:64;s:24:"payment/authorizenet_aim";i:65;s:21:"payment/bank_transfer";i:66;s:14:"payment/cheque";i:67;s:11:"payment/cod";i:68;s:21:"payment/free_checkout";i:69;s:22:"payment/klarna_account";i:70;s:22:"payment/klarna_invoice";i:71;s:14:"payment/liqpay";i:72;s:20:"payment/moneybookers";i:73;s:14:"payment/nochex";i:74;s:15:"payment/paymate";i:75;s:16:"payment/paypoint";i:76;s:13:"payment/payza";i:77;s:26:"payment/perpetual_payments";i:78;s:18:"payment/pp_express";i:79;s:25:"payment/pp_payflow_iframe";i:80;s:14:"payment/pp_pro";i:81;s:21:"payment/pp_pro_iframe";i:82;s:17:"payment/pp_pro_pf";i:83;s:17:"payment/pp_pro_uk";i:84;s:19:"payment/pp_standard";i:85;s:15:"payment/sagepay";i:86;s:22:"payment/sagepay_direct";i:87;s:18:"payment/sagepay_us";i:88;s:19:"payment/twocheckout";i:89;s:28:"payment/web_payment_software";i:90;s:16:"payment/worldpay";i:91;s:27:"report/affiliate_commission";i:92;s:22:"report/customer_credit";i:93;s:22:"report/customer_online";i:94;s:21:"report/customer_order";i:95;s:22:"report/customer_reward";i:96;s:24:"report/product_purchased";i:97;s:21:"report/product_viewed";i:98;s:18:"report/sale_coupon";i:99;s:17:"report/sale_order";i:100;s:18:"report/sale_return";i:101;s:20:"report/sale_shipping";i:102;s:15:"report/sale_tax";i:103;s:14:"sale/affiliate";i:104;s:12:"sale/contact";i:105;s:11:"sale/coupon";i:106;s:13:"sale/customer";i:107;s:20:"sale/customer_ban_ip";i:108;s:19:"sale/customer_group";i:109;s:10:"sale/order";i:110;s:11:"sale/return";i:111;s:12:"sale/voucher";i:112;s:18:"sale/voucher_theme";i:113;s:15:"setting/setting";i:114;s:13:"setting/store";i:115;s:16:"shipping/auspost";i:116;s:17:"shipping/citylink";i:117;s:14:"shipping/fedex";i:118;s:13:"shipping/flat";i:119;s:13:"shipping/free";i:120;s:13:"shipping/item";i:121;s:23:"shipping/parcelforce_48";i:122;s:15:"shipping/pickup";i:123;s:19:"shipping/royal_mail";i:124;s:12:"shipping/ups";i:125;s:13:"shipping/usps";i:126;s:15:"shipping/weight";i:127;s:12:"tool/aceshop";i:128;s:13:"tool/ayelshop";i:129;s:11:"tool/backup";i:130;s:14:"tool/error_log";i:131;s:13:"tool/hikashop";i:132;s:12:"tool/joocart";i:133;s:17:"tool/joomshopping";i:134;s:12:"tool/redshop";i:135;s:17:"tool/rokquickcart";i:136;s:16:"tool/themeeditor";i:137;s:11:"tool/tienda";i:138;s:15:"tool/virtuemart";i:139;s:12:"total/coupon";i:140;s:12:"total/credit";i:141;s:14:"total/handling";i:142;s:16:"total/klarna_fee";i:143;s:19:"total/low_order_fee";i:144;s:12:"total/reward";i:145;s:14:"total/shipping";i:146;s:15:"total/sub_total";i:147;s:9:"total/tax";i:148;s:11:"total/total";i:149;s:13:"total/voucher";i:150;s:9:"user/user";i:151;s:20:"user/user_permission";}s:6:"modify";a:152:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:16:"catalog/category";i:3;s:16:"catalog/download";i:4;s:14:"catalog/filter";i:5;s:19:"catalog/information";i:6;s:20:"catalog/manufacturer";i:7;s:14:"catalog/option";i:8;s:15:"catalog/product";i:9;s:14:"catalog/review";i:10;s:11:"common/edit";i:11;s:19:"common/editorbutton";i:12;s:18:"common/filemanager";i:13;s:14:"common/support";i:14;s:14:"common/upgrade";i:15;s:13:"design/banner";i:16;s:19:"design/custom_field";i:17;s:13:"design/layout";i:18;s:14:"extension/feed";i:19;s:17:"extension/manager";i:20;s:16:"extension/module";i:21;s:17:"extension/payment";i:22;s:18:"extension/shipping";i:23;s:15:"extension/total";i:24;s:16:"feed/google_base";i:25;s:19:"feed/google_sitemap";i:26;s:20:"localisation/country";i:27;s:21:"localisation/currency";i:28;s:21:"localisation/geo_zone";i:29;s:25:"localisation/length_class";i:30;s:25:"localisation/order_status";i:31;s:26:"localisation/return_action";i:32;s:26:"localisation/return_reason";i:33;s:26:"localisation/return_status";i:34;s:25:"localisation/stock_status";i:35;s:22:"localisation/tax_class";i:36;s:21:"localisation/tax_rate";i:37;s:25:"localisation/weight_class";i:38;s:17:"localisation/zone";i:39;s:14:"module/account";i:40;s:16:"module/affiliate";i:41;s:13:"module/banner";i:42;s:17:"module/bestseller";i:43;s:15:"module/carousel";i:44;s:15:"module/category";i:45;s:25:"module/category_accordion";i:46;s:19:"module/categoryhome";i:47;s:15:"module/featured";i:48;s:13:"module/filter";i:49;s:18:"module/google_talk";i:50;s:18:"module/information";i:51;s:13:"module/latest";i:52;s:12:"module/login";i:53;s:19:"module/manufacturer";i:54;s:19:"module/mijoshopcart";i:55;s:23:"module/mijoshopcurrency";i:56;s:23:"module/mijoshopminicart";i:57;s:16:"module/pp_layout";i:58;s:16:"module/slideshow";i:59;s:14:"module/special";i:60;s:12:"module/store";i:61;s:20:"module/vqmod_manager";i:62;s:14:"module/welcome";i:63;s:16:"payment/alertpay";i:64;s:24:"payment/authorizenet_aim";i:65;s:21:"payment/bank_transfer";i:66;s:14:"payment/cheque";i:67;s:11:"payment/cod";i:68;s:21:"payment/free_checkout";i:69;s:22:"payment/klarna_account";i:70;s:22:"payment/klarna_invoice";i:71;s:14:"payment/liqpay";i:72;s:20:"payment/moneybookers";i:73;s:14:"payment/nochex";i:74;s:15:"payment/paymate";i:75;s:16:"payment/paypoint";i:76;s:13:"payment/payza";i:77;s:26:"payment/perpetual_payments";i:78;s:18:"payment/pp_express";i:79;s:25:"payment/pp_payflow_iframe";i:80;s:14:"payment/pp_pro";i:81;s:21:"payment/pp_pro_iframe";i:82;s:17:"payment/pp_pro_pf";i:83;s:17:"payment/pp_pro_uk";i:84;s:19:"payment/pp_standard";i:85;s:15:"payment/sagepay";i:86;s:22:"payment/sagepay_direct";i:87;s:18:"payment/sagepay_us";i:88;s:19:"payment/twocheckout";i:89;s:28:"payment/web_payment_software";i:90;s:16:"payment/worldpay";i:91;s:27:"report/affiliate_commission";i:92;s:22:"report/customer_credit";i:93;s:22:"report/customer_online";i:94;s:21:"report/customer_order";i:95;s:22:"report/customer_reward";i:96;s:24:"report/product_purchased";i:97;s:21:"report/product_viewed";i:98;s:18:"report/sale_coupon";i:99;s:17:"report/sale_order";i:100;s:18:"report/sale_return";i:101;s:20:"report/sale_shipping";i:102;s:15:"report/sale_tax";i:103;s:14:"sale/affiliate";i:104;s:12:"sale/contact";i:105;s:11:"sale/coupon";i:106;s:13:"sale/customer";i:107;s:20:"sale/customer_ban_ip";i:108;s:19:"sale/customer_group";i:109;s:10:"sale/order";i:110;s:11:"sale/return";i:111;s:12:"sale/voucher";i:112;s:18:"sale/voucher_theme";i:113;s:15:"setting/setting";i:114;s:13:"setting/store";i:115;s:16:"shipping/auspost";i:116;s:17:"shipping/citylink";i:117;s:14:"shipping/fedex";i:118;s:13:"shipping/flat";i:119;s:13:"shipping/free";i:120;s:13:"shipping/item";i:121;s:23:"shipping/parcelforce_48";i:122;s:15:"shipping/pickup";i:123;s:19:"shipping/royal_mail";i:124;s:12:"shipping/ups";i:125;s:13:"shipping/usps";i:126;s:15:"shipping/weight";i:127;s:12:"tool/aceshop";i:128;s:13:"tool/ayelshop";i:129;s:11:"tool/backup";i:130;s:14:"tool/error_log";i:131;s:13:"tool/hikashop";i:132;s:12:"tool/joocart";i:133;s:17:"tool/joomshopping";i:134;s:12:"tool/redshop";i:135;s:17:"tool/rokquickcart";i:136;s:16:"tool/themeeditor";i:137;s:11:"tool/tienda";i:138;s:15:"tool/virtuemart";i:139;s:12:"total/coupon";i:140;s:12:"total/credit";i:141;s:14:"total/handling";i:142;s:16:"total/klarna_fee";i:143;s:19:"total/low_order_fee";i:144;s:12:"total/reward";i:145;s:14:"total/shipping";i:146;s:15:"total/sub_total";i:147;s:9:"total/tax";i:148;s:11:"total/total";i:149;s:13:"total/voucher";i:150;s:9:"user/user";i:151;s:20:"user/user_permission";}}'),
(10, 'Demonstration', '');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_voucher`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`voucher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_voucher_history`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_voucher_theme`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `i8a13_mijoshop_voucher_theme`
--

INSERT INTO `i8a13_mijoshop_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(6, 'data/apple_logo.jpg'),
(7, 'data/gift-voucher-birthday.jpg'),
(8, 'data/canon_eos_5d_2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_voucher_theme_description`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i8a13_mijoshop_voucher_theme_description`
--

INSERT INTO `i8a13_mijoshop_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Christmas'),
(7, 1, 'Birthday'),
(8, 1, 'General');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_weight_class`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `i8a13_mijoshop_weight_class`
--

INSERT INTO `i8a13_mijoshop_weight_class` (`weight_class_id`, `value`) VALUES
(1, 1.00000000),
(2, 1000.00000000),
(5, 2.20460000),
(6, 35.27400000);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_weight_class_description`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL DEFAULT '',
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `i8a13_mijoshop_weight_class_description`
--

INSERT INTO `i8a13_mijoshop_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Kilogram', 'kg'),
(2, 1, 'Gram', 'g'),
(5, 1, 'Pound ', 'lb'),
(6, 1, 'Ounce', 'oz');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_zone`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4036 ;

--
-- Dumping data for table `i8a13_mijoshop_zone`
--

INSERT INTO `i8a13_mijoshop_zone` (`zone_id`, `country_id`, `code`, `name`, `status`) VALUES
(1, 1, 'BDS', 'Badakhshan', 1),
(2, 1, 'BDG', 'Badghis', 1),
(3, 1, 'BGL', 'Baghlan', 1),
(4, 1, 'BAL', 'Balkh', 1),
(5, 1, 'BAM', 'Bamian', 1),
(6, 1, 'FRA', 'Farah', 1),
(7, 1, 'FYB', 'Faryab', 1),
(8, 1, 'GHA', 'Ghazni', 1),
(9, 1, 'GHO', 'Ghowr', 1),
(10, 1, 'HEL', 'Helmand', 1),
(11, 1, 'HER', 'Herat', 1),
(12, 1, 'JOW', 'Jowzjan', 1),
(13, 1, 'KAB', 'Kabul', 1),
(14, 1, 'KAN', 'Kandahar', 1),
(15, 1, 'KAP', 'Kapisa', 1),
(16, 1, 'KHO', 'Khost', 1),
(17, 1, 'KNR', 'Konar', 1),
(18, 1, 'KDZ', 'Kondoz', 1),
(19, 1, 'LAG', 'Laghman', 1),
(20, 1, 'LOW', 'Lowgar', 1),
(21, 1, 'NAN', 'Nangrahar', 1),
(22, 1, 'NIM', 'Nimruz', 1),
(23, 1, 'NUR', 'Nurestan', 1),
(24, 1, 'ORU', 'Oruzgan', 1),
(25, 1, 'PIA', 'Paktia', 1),
(26, 1, 'PKA', 'Paktika', 1),
(27, 1, 'PAR', 'Parwan', 1),
(28, 1, 'SAM', 'Samangan', 1),
(29, 1, 'SAR', 'Sar-e Pol', 1),
(30, 1, 'TAK', 'Takhar', 1),
(31, 1, 'WAR', 'Wardak', 1),
(32, 1, 'ZAB', 'Zabol', 1),
(33, 2, 'BR', 'Berat', 1),
(34, 2, 'BU', 'Bulqize', 1),
(35, 2, 'DL', 'Delvine', 1),
(36, 2, 'DV', 'Devoll', 1),
(37, 2, 'DI', 'Diber', 1),
(38, 2, 'DR', 'Durres', 1),
(39, 2, 'EL', 'Elbasan', 1),
(40, 2, 'ER', 'Kolonje', 1),
(41, 2, 'FR', 'Fier', 1),
(42, 2, 'GJ', 'Gjirokaster', 1),
(43, 2, 'GR', 'Gramsh', 1),
(44, 2, 'HA', 'Has', 1),
(45, 2, 'KA', 'Kavaje', 1),
(46, 2, 'KB', 'Kurbin', 1),
(47, 2, 'KC', 'Kucove', 1),
(48, 2, 'KO', 'Korce', 1),
(49, 2, 'KR', 'Kruje', 1),
(50, 2, 'KU', 'Kukes', 1),
(51, 2, 'LB', 'Librazhd', 1),
(52, 2, 'LE', 'Lezhe', 1),
(53, 2, 'LU', 'Lushnje', 1),
(54, 2, 'MM', 'Malesi e Madhe', 1),
(55, 2, 'MK', 'Mallakaster', 1),
(56, 2, 'MT', 'Mat', 1),
(57, 2, 'MR', 'Mirdite', 1),
(58, 2, 'PQ', 'Peqin', 1),
(59, 2, 'PR', 'Permet', 1),
(60, 2, 'PG', 'Pogradec', 1),
(61, 2, 'PU', 'Puke', 1),
(62, 2, 'SH', 'Shkoder', 1),
(63, 2, 'SK', 'Skrapar', 1),
(64, 2, 'SR', 'Sarande', 1),
(65, 2, 'TE', 'Tepelene', 1),
(66, 2, 'TP', 'Tropoje', 1),
(67, 2, 'TR', 'Tirane', 1),
(68, 2, 'VL', 'Vlore', 1),
(69, 3, 'ADR', 'Adrar', 1),
(70, 3, 'ADE', 'Ain Defla', 1),
(71, 3, 'ATE', 'Ain Temouchent', 1),
(72, 3, 'ALG', 'Alger', 1),
(73, 3, 'ANN', 'Annaba', 1),
(74, 3, 'BAT', 'Batna', 1),
(75, 3, 'BEC', 'Bechar', 1),
(76, 3, 'BEJ', 'Bejaia', 1),
(77, 3, 'BIS', 'Biskra', 1),
(78, 3, 'BLI', 'Blida', 1),
(79, 3, 'BBA', 'Bordj Bou Arreridj', 1),
(80, 3, 'BOA', 'Bouira', 1),
(81, 3, 'BMD', 'Boumerdes', 1),
(82, 3, 'CHL', 'Chlef', 1),
(83, 3, 'CON', 'Constantine', 1),
(84, 3, 'DJE', 'Djelfa', 1),
(85, 3, 'EBA', 'El Bayadh', 1),
(86, 3, 'EOU', 'El Oued', 1),
(87, 3, 'ETA', 'El Tarf', 1),
(88, 3, 'GHA', 'Ghardaia', 1),
(89, 3, 'GUE', 'Guelma', 1),
(90, 3, 'ILL', 'Illizi', 1),
(91, 3, 'JIJ', 'Jijel', 1),
(92, 3, 'KHE', 'Khenchela', 1),
(93, 3, 'LAG', 'Laghouat', 1),
(94, 3, 'MUA', 'Muaskar', 1),
(95, 3, 'MED', 'Medea', 1),
(96, 3, 'MIL', 'Mila', 1),
(97, 3, 'MOS', 'Mostaganem', 1),
(98, 3, 'MSI', 'M''Sila', 1),
(99, 3, 'NAA', 'Naama', 1),
(100, 3, 'ORA', 'Oran', 1),
(101, 3, 'OUA', 'Ouargla', 1),
(102, 3, 'OEB', 'Oum el-Bouaghi', 1),
(103, 3, 'REL', 'Relizane', 1),
(104, 3, 'SAI', 'Saida', 1),
(105, 3, 'SET', 'Setif', 1),
(106, 3, 'SBA', 'Sidi Bel Abbes', 1),
(107, 3, 'SKI', 'Skikda', 1),
(108, 3, 'SAH', 'Souk Ahras', 1),
(109, 3, 'TAM', 'Tamanghasset', 1),
(110, 3, 'TEB', 'Tebessa', 1),
(111, 3, 'TIA', 'Tiaret', 1),
(112, 3, 'TIN', 'Tindouf', 1),
(113, 3, 'TIP', 'Tipaza', 1),
(114, 3, 'TIS', 'Tissemsilt', 1),
(115, 3, 'TOU', 'Tizi Ouzou', 1),
(116, 3, 'TLE', 'Tlemcen', 1),
(117, 4, 'E', 'Eastern', 1),
(118, 4, 'M', 'Manu''a', 1),
(119, 4, 'R', 'Rose Island', 1),
(120, 4, 'S', 'Swains Island', 1),
(121, 4, 'W', 'Western', 1),
(122, 5, 'ALV', 'Andorra la Vella', 1),
(123, 5, 'CAN', 'Canillo', 1),
(124, 5, 'ENC', 'Encamp', 1),
(125, 5, 'ESE', 'Escaldes-Engordany', 1),
(126, 5, 'LMA', 'La Massana', 1),
(127, 5, 'ORD', 'Ordino', 1),
(128, 5, 'SJL', 'Sant Julia de Loria', 1),
(129, 6, 'BGO', 'Bengo', 1),
(130, 6, 'BGU', 'Benguela', 1),
(131, 6, 'BIE', 'Bie', 1),
(132, 6, 'CAB', 'Cabinda', 1),
(133, 6, 'CCU', 'Cuando-Cubango', 1),
(134, 6, 'CNO', 'Cuanza Norte', 1),
(135, 6, 'CUS', 'Cuanza Sul', 1),
(136, 6, 'CNN', 'Cunene', 1),
(137, 6, 'HUA', 'Huambo', 1),
(138, 6, 'HUI', 'Huila', 1),
(139, 6, 'LUA', 'Luanda', 1),
(140, 6, 'LNO', 'Lunda Norte', 1),
(141, 6, 'LSU', 'Lunda Sul', 1),
(142, 6, 'MAL', 'Malange', 1),
(143, 6, 'MOX', 'Moxico', 1),
(144, 6, 'NAM', 'Namibe', 1),
(145, 6, 'UIG', 'Uige', 1),
(146, 6, 'ZAI', 'Zaire', 1),
(147, 9, 'ASG', 'Saint George', 1),
(148, 9, 'ASJ', 'Saint John', 1),
(149, 9, 'ASM', 'Saint Mary', 1),
(150, 9, 'ASL', 'Saint Paul', 1),
(151, 9, 'ASR', 'Saint Peter', 1),
(152, 9, 'ASH', 'Saint Philip', 1),
(153, 9, 'BAR', 'Barbuda', 1),
(154, 9, 'RED', 'Redonda', 1),
(155, 10, 'AN', 'Antartida e Islas del Atlantico', 1),
(156, 10, 'BA', 'Buenos Aires', 1),
(157, 10, 'CA', 'Catamarca', 1),
(158, 10, 'CH', 'Chaco', 1),
(159, 10, 'CU', 'Chubut', 1),
(160, 10, 'CO', 'Cordoba', 1),
(161, 10, 'CR', 'Corrientes', 1),
(162, 10, 'DF', 'Distrito Federal', 1),
(163, 10, 'ER', 'Entre Rios', 1),
(164, 10, 'FO', 'Formosa', 1),
(165, 10, 'JU', 'Jujuy', 1),
(166, 10, 'LP', 'La Pampa', 1),
(167, 10, 'LR', 'La Rioja', 1),
(168, 10, 'ME', 'Mendoza', 1),
(169, 10, 'MI', 'Misiones', 1),
(170, 10, 'NE', 'Neuquen', 1),
(171, 10, 'RN', 'Rio Negro', 1),
(172, 10, 'SA', 'Salta', 1),
(173, 10, 'SJ', 'San Juan', 1),
(174, 10, 'SL', 'San Luis', 1),
(175, 10, 'SC', 'Santa Cruz', 1),
(176, 10, 'SF', 'Santa Fe', 1),
(177, 10, 'SD', 'Santiago del Estero', 1),
(178, 10, 'TF', 'Tierra del Fuego', 1),
(179, 10, 'TU', 'Tucuman', 1),
(180, 11, 'AGT', 'Aragatsotn', 1),
(181, 11, 'ARR', 'Ararat', 1),
(182, 11, 'ARM', 'Armavir', 1),
(183, 11, 'GEG', 'Geghark''unik''', 1),
(184, 11, 'KOT', 'Kotayk''', 1),
(185, 11, 'LOR', 'Lorri', 1),
(186, 11, 'SHI', 'Shirak', 1),
(187, 11, 'SYU', 'Syunik''', 1),
(188, 11, 'TAV', 'Tavush', 1),
(189, 11, 'VAY', 'Vayots'' Dzor', 1),
(190, 11, 'YER', 'Yerevan', 1),
(191, 13, 'ACT', 'Australian Capital Territory', 1),
(192, 13, 'NSW', 'New South Wales', 1),
(193, 13, 'NT', 'Northern Territory', 1),
(194, 13, 'QLD', 'Queensland', 1),
(195, 13, 'SA', 'South Australia', 1),
(196, 13, 'TAS', 'Tasmania', 1),
(197, 13, 'VIC', 'Victoria', 1),
(198, 13, 'WA', 'Western Australia', 1),
(199, 14, 'BUR', 'Burgenland', 1),
(200, 14, 'KAR', 'Kärnten', 1),
(201, 14, 'NOS', 'Nieder&ouml;sterreich', 1),
(202, 14, 'OOS', 'Ober&ouml;sterreich', 1),
(203, 14, 'SAL', 'Salzburg', 1),
(204, 14, 'STE', 'Steiermark', 1),
(205, 14, 'TIR', 'Tirol', 1),
(206, 14, 'VOR', 'Vorarlberg', 1),
(207, 14, 'WIE', 'Wien', 1),
(208, 15, 'AB', 'Ali Bayramli', 1),
(209, 15, 'ABS', 'Abseron', 1),
(210, 15, 'AGC', 'AgcabAdi', 1),
(211, 15, 'AGM', 'Agdam', 1),
(212, 15, 'AGS', 'Agdas', 1),
(213, 15, 'AGA', 'Agstafa', 1),
(214, 15, 'AGU', 'Agsu', 1),
(215, 15, 'AST', 'Astara', 1),
(216, 15, 'BA', 'Baki', 1),
(217, 15, 'BAB', 'BabAk', 1),
(218, 15, 'BAL', 'BalakAn', 1),
(219, 15, 'BAR', 'BArdA', 1),
(220, 15, 'BEY', 'Beylaqan', 1),
(221, 15, 'BIL', 'Bilasuvar', 1),
(222, 15, 'CAB', 'Cabrayil', 1),
(223, 15, 'CAL', 'Calilabab', 1),
(224, 15, 'CUL', 'Culfa', 1),
(225, 15, 'DAS', 'Daskasan', 1),
(226, 15, 'DAV', 'Davaci', 1),
(227, 15, 'FUZ', 'Fuzuli', 1),
(228, 15, 'GA', 'Ganca', 1),
(229, 15, 'GAD', 'Gadabay', 1),
(230, 15, 'GOR', 'Goranboy', 1),
(231, 15, 'GOY', 'Goycay', 1),
(232, 15, 'HAC', 'Haciqabul', 1),
(233, 15, 'IMI', 'Imisli', 1),
(234, 15, 'ISM', 'Ismayilli', 1),
(235, 15, 'KAL', 'Kalbacar', 1),
(236, 15, 'KUR', 'Kurdamir', 1),
(237, 15, 'LA', 'Lankaran', 1),
(238, 15, 'LAC', 'Lacin', 1),
(239, 15, 'LAN', 'Lankaran', 1),
(240, 15, 'LER', 'Lerik', 1),
(241, 15, 'MAS', 'Masalli', 1),
(242, 15, 'MI', 'Mingacevir', 1),
(243, 15, 'NA', 'Naftalan', 1),
(244, 15, 'NEF', 'Neftcala', 1),
(245, 15, 'OGU', 'Oguz', 1),
(246, 15, 'ORD', 'Ordubad', 1),
(247, 15, 'QAB', 'Qabala', 1),
(248, 15, 'QAX', 'Qax', 1),
(249, 15, 'QAZ', 'Qazax', 1),
(250, 15, 'QOB', 'Qobustan', 1),
(251, 15, 'QBA', 'Quba', 1),
(252, 15, 'QBI', 'Qubadli', 1),
(253, 15, 'QUS', 'Qusar', 1),
(254, 15, 'SA', 'Saki', 1),
(255, 15, 'SAT', 'Saatli', 1),
(256, 15, 'SAB', 'Sabirabad', 1),
(257, 15, 'SAD', 'Sadarak', 1),
(258, 15, 'SAH', 'Sahbuz', 1),
(259, 15, 'SAK', 'Saki', 1),
(260, 15, 'SAL', 'Salyan', 1),
(261, 15, 'SM', 'Sumqayit', 1),
(262, 15, 'SMI', 'Samaxi', 1),
(263, 15, 'SKR', 'Samkir', 1),
(264, 15, 'SMX', 'Samux', 1),
(265, 15, 'SAR', 'Sarur', 1),
(266, 15, 'SIY', 'Siyazan', 1),
(267, 15, 'SS', 'Susa', 1),
(268, 15, 'SUS', 'Susa', 1),
(269, 15, 'TAR', 'Tartar', 1),
(270, 15, 'TOV', 'Tovuz', 1),
(271, 15, 'UCA', 'Ucar', 1),
(272, 15, 'XA', 'Xankandi', 1),
(273, 15, 'XAC', 'Xacmaz', 1),
(274, 15, 'XAN', 'Xanlar', 1),
(275, 15, 'XIZ', 'Xizi', 1),
(276, 15, 'XCI', 'Xocali', 1),
(277, 15, 'XVD', 'Xocavand', 1),
(278, 15, 'YAR', 'Yardimli', 1),
(279, 15, 'YEV', 'Yevlax', 1),
(280, 15, 'ZAN', 'Zangilan', 1),
(281, 15, 'ZAQ', 'Zaqatala', 1),
(282, 15, 'ZAR', 'Zardab', 1),
(283, 15, 'NX', 'Naxcivan', 1),
(284, 16, 'ACK', 'Acklins', 1),
(285, 16, 'BER', 'Berry Islands', 1),
(286, 16, 'BIM', 'Bimini', 1),
(287, 16, 'BLK', 'Black Point', 1),
(288, 16, 'CAT', 'Cat Island', 1),
(289, 16, 'CAB', 'Central Abaco', 1),
(290, 16, 'CAN', 'Central Andros', 1),
(291, 16, 'CEL', 'Central Eleuthera', 1),
(292, 16, 'FRE', 'City of Freeport', 1),
(293, 16, 'CRO', 'Crooked Island', 1),
(294, 16, 'EGB', 'East Grand Bahama', 1),
(295, 16, 'EXU', 'Exuma', 1),
(296, 16, 'GRD', 'Grand Cay', 1),
(297, 16, 'HAR', 'Harbour Island', 1),
(298, 16, 'HOP', 'Hope Town', 1),
(299, 16, 'INA', 'Inagua', 1),
(300, 16, 'LNG', 'Long Island', 1),
(301, 16, 'MAN', 'Mangrove Cay', 1),
(302, 16, 'MAY', 'Mayaguana', 1),
(303, 16, 'MOO', 'Moore''s Island', 1),
(304, 16, 'NAB', 'North Abaco', 1),
(305, 16, 'NAN', 'North Andros', 1),
(306, 16, 'NEL', 'North Eleuthera', 1),
(307, 16, 'RAG', 'Ragged Island', 1),
(308, 16, 'RUM', 'Rum Cay', 1),
(309, 16, 'SAL', 'San Salvador', 1),
(310, 16, 'SAB', 'South Abaco', 1),
(311, 16, 'SAN', 'South Andros', 1),
(312, 16, 'SEL', 'South Eleuthera', 1),
(313, 16, 'SWE', 'Spanish Wells', 1),
(314, 16, 'WGB', 'West Grand Bahama', 1),
(315, 17, 'CAP', 'Capital', 1),
(316, 17, 'CEN', 'Central', 1),
(317, 17, 'MUH', 'Muharraq', 1),
(318, 17, 'NOR', 'Northern', 1),
(319, 17, 'SOU', 'Southern', 1),
(320, 18, 'BAR', 'Barisal', 1),
(321, 18, 'CHI', 'Chittagong', 1),
(322, 18, 'DHA', 'Dhaka', 1),
(323, 18, 'KHU', 'Khulna', 1),
(324, 18, 'RAJ', 'Rajshahi', 1),
(325, 18, 'SYL', 'Sylhet', 1),
(326, 19, 'CC', 'Christ Church', 1),
(327, 19, 'AND', 'Saint Andrew', 1),
(328, 19, 'GEO', 'Saint George', 1),
(329, 19, 'JAM', 'Saint James', 1),
(330, 19, 'JOH', 'Saint John', 1),
(331, 19, 'JOS', 'Saint Joseph', 1),
(332, 19, 'LUC', 'Saint Lucy', 1),
(333, 19, 'MIC', 'Saint Michael', 1),
(334, 19, 'PET', 'Saint Peter', 1),
(335, 19, 'PHI', 'Saint Philip', 1),
(336, 19, 'THO', 'Saint Thomas', 1),
(337, 20, 'BR', 'Brestskaya (Brest)', 1),
(338, 20, 'HO', 'Homyel''skaya (Homyel'')', 1),
(339, 20, 'HM', 'Horad Minsk', 1),
(340, 20, 'HR', 'Hrodzyenskaya (Hrodna)', 1),
(341, 20, 'MA', 'Mahilyowskaya (Mahilyow)', 1),
(342, 20, 'MI', 'Minskaya', 1),
(343, 20, 'VI', 'Vitsyebskaya (Vitsyebsk)', 1),
(344, 21, 'VAN', 'Antwerpen', 1),
(345, 21, 'WBR', 'Brabant Wallon', 1),
(346, 21, 'WHT', 'Hainaut', 1),
(347, 21, 'WLG', 'Liege', 1),
(348, 21, 'VLI', 'Limburg', 1),
(349, 21, 'WLX', 'Luxembourg', 1),
(350, 21, 'WNA', 'Namur', 1),
(351, 21, 'VOV', 'Oost-Vlaanderen', 1),
(352, 21, 'VBR', 'Vlaams Brabant', 1),
(353, 21, 'VWV', 'West-Vlaanderen', 1),
(354, 22, 'BZ', 'Belize', 1),
(355, 22, 'CY', 'Cayo', 1),
(356, 22, 'CR', 'Corozal', 1),
(357, 22, 'OW', 'Orange Walk', 1),
(358, 22, 'SC', 'Stann Creek', 1),
(359, 22, 'TO', 'Toledo', 1),
(360, 23, 'AL', 'Alibori', 1),
(361, 23, 'AK', 'Atakora', 1),
(362, 23, 'AQ', 'Atlantique', 1),
(363, 23, 'BO', 'Borgou', 1),
(364, 23, 'CO', 'Collines', 1),
(365, 23, 'DO', 'Donga', 1),
(366, 23, 'KO', 'Kouffo', 1),
(367, 23, 'LI', 'Littoral', 1),
(368, 23, 'MO', 'Mono', 1),
(369, 23, 'OU', 'Oueme', 1),
(370, 23, 'PL', 'Plateau', 1),
(371, 23, 'ZO', 'Zou', 1),
(372, 24, 'DS', 'Devonshire', 1),
(373, 24, 'HC', 'Hamilton City', 1),
(374, 24, 'HA', 'Hamilton', 1),
(375, 24, 'PG', 'Paget', 1),
(376, 24, 'PB', 'Pembroke', 1),
(377, 24, 'GC', 'Saint George City', 1),
(378, 24, 'SG', 'Saint George''s', 1),
(379, 24, 'SA', 'Sandys', 1),
(380, 24, 'SM', 'Smith''s', 1),
(381, 24, 'SH', 'Southampton', 1),
(382, 24, 'WA', 'Warwick', 1),
(383, 25, 'BUM', 'Bumthang', 1),
(384, 25, 'CHU', 'Chukha', 1),
(385, 25, 'DAG', 'Dagana', 1),
(386, 25, 'GAS', 'Gasa', 1),
(387, 25, 'HAA', 'Haa', 1),
(388, 25, 'LHU', 'Lhuntse', 1),
(389, 25, 'MON', 'Mongar', 1),
(390, 25, 'PAR', 'Paro', 1),
(391, 25, 'PEM', 'Pemagatshel', 1),
(392, 25, 'PUN', 'Punakha', 1),
(393, 25, 'SJO', 'Samdrup Jongkhar', 1),
(394, 25, 'SAT', 'Samtse', 1),
(395, 25, 'SAR', 'Sarpang', 1),
(396, 25, 'THI', 'Thimphu', 1),
(397, 25, 'TRG', 'Trashigang', 1),
(398, 25, 'TRY', 'Trashiyangste', 1),
(399, 25, 'TRO', 'Trongsa', 1),
(400, 25, 'TSI', 'Tsirang', 1),
(401, 25, 'WPH', 'Wangdue Phodrang', 1),
(402, 25, 'ZHE', 'Zhemgang', 1),
(403, 26, 'BEN', 'Beni', 1),
(404, 26, 'CHU', 'Chuquisaca', 1),
(405, 26, 'COC', 'Cochabamba', 1),
(406, 26, 'LPZ', 'La Paz', 1),
(407, 26, 'ORU', 'Oruro', 1),
(408, 26, 'PAN', 'Pando', 1),
(409, 26, 'POT', 'Potosi', 1),
(410, 26, 'SCZ', 'Santa Cruz', 1),
(411, 26, 'TAR', 'Tarija', 1),
(412, 27, 'BRO', 'Brcko district', 1),
(413, 27, 'FUS', 'Unsko-Sanski Kanton', 1),
(414, 27, 'FPO', 'Posavski Kanton', 1),
(415, 27, 'FTU', 'Tuzlanski Kanton', 1),
(416, 27, 'FZE', 'Zenicko-Dobojski Kanton', 1),
(417, 27, 'FBP', 'Bosanskopodrinjski Kanton', 1),
(418, 27, 'FSB', 'Srednjebosanski Kanton', 1),
(419, 27, 'FHN', 'Hercegovacko-neretvanski Kanton', 1),
(420, 27, 'FZH', 'Zapadnohercegovacka Zupanija', 1),
(421, 27, 'FSA', 'Kanton Sarajevo', 1),
(422, 27, 'FZA', 'Zapadnobosanska', 1),
(423, 27, 'SBL', 'Banja Luka', 1),
(424, 27, 'SDO', 'Doboj', 1),
(425, 27, 'SBI', 'Bijeljina', 1),
(426, 27, 'SVL', 'Vlasenica', 1),
(427, 27, 'SSR', 'Sarajevo-Romanija or Sokolac', 1),
(428, 27, 'SFO', 'Foca', 1),
(429, 27, 'STR', 'Trebinje', 1),
(430, 28, 'CE', 'Central', 1),
(431, 28, 'GH', 'Ghanzi', 1),
(432, 28, 'KD', 'Kgalagadi', 1),
(433, 28, 'KT', 'Kgatleng', 1),
(434, 28, 'KW', 'Kweneng', 1),
(435, 28, 'NG', 'Ngamiland', 1),
(436, 28, 'NE', 'North East', 1),
(437, 28, 'NW', 'North West', 1),
(438, 28, 'SE', 'South East', 1),
(439, 28, 'SO', 'Southern', 1),
(440, 30, 'AC', 'Acre', 1),
(441, 30, 'AL', 'Alagoas', 1),
(442, 30, 'AP', 'Amapa', 1),
(443, 30, 'AM', 'Amazonas', 1),
(444, 30, 'BA', 'Bahia', 1),
(445, 30, 'CE', 'Ceara', 1),
(446, 30, 'DF', 'Distrito Federal', 1),
(447, 30, 'ES', 'Espirito Santo', 1),
(448, 30, 'GO', 'Goias', 1),
(449, 30, 'MA', 'Maranhao', 1),
(450, 30, 'MT', 'Mato Grosso', 1),
(451, 30, 'MS', 'Mato Grosso do Sul', 1),
(452, 30, 'MG', 'Minas Gerais', 1),
(453, 30, 'PA', 'Para', 1),
(454, 30, 'PB', 'Paraiba', 1),
(455, 30, 'PR', 'Parana', 1),
(456, 30, 'PE', 'Pernambuco', 1),
(457, 30, 'PI', 'Piaui', 1),
(458, 30, 'RJ', 'Rio de Janeiro', 1),
(459, 30, 'RN', 'Rio Grande do Norte', 1),
(460, 30, 'RS', 'Rio Grande do Sul', 1),
(461, 30, 'RO', 'Rondonia', 1),
(462, 30, 'RR', 'Roraima', 1),
(463, 30, 'SC', 'Santa Catarina', 1),
(464, 30, 'SP', 'Sao Paulo', 1),
(465, 30, 'SE', 'Sergipe', 1),
(466, 30, 'TO', 'Tocantins', 1),
(467, 31, 'PB', 'Peros Banhos', 1),
(468, 31, 'SI', 'Salomon Islands', 1),
(469, 31, 'NI', 'Nelsons Island', 1),
(470, 31, 'TB', 'Three Brothers', 1),
(471, 31, 'EA', 'Eagle Islands', 1),
(472, 31, 'DI', 'Danger Island', 1),
(473, 31, 'EG', 'Egmont Islands', 1),
(474, 31, 'DG', 'Diego Garcia', 1),
(475, 32, 'BEL', 'Belait', 1),
(476, 32, 'BRM', 'Brunei and Muara', 1),
(477, 32, 'TEM', 'Temburong', 1),
(478, 32, 'TUT', 'Tutong', 1),
(479, 33, '', 'Blagoevgrad', 1),
(480, 33, '', 'Burgas', 1),
(481, 33, '', 'Dobrich', 1),
(482, 33, '', 'Gabrovo', 1),
(483, 33, '', 'Haskovo', 1),
(484, 33, '', 'Kardjali', 1),
(485, 33, '', 'Kyustendil', 1),
(486, 33, '', 'Lovech', 1),
(487, 33, '', 'Montana', 1),
(488, 33, '', 'Pazardjik', 1),
(489, 33, '', 'Pernik', 1),
(490, 33, '', 'Pleven', 1),
(491, 33, '', 'Plovdiv', 1),
(492, 33, '', 'Razgrad', 1),
(493, 33, '', 'Shumen', 1),
(494, 33, '', 'Silistra', 1),
(495, 33, '', 'Sliven', 1),
(496, 33, '', 'Smolyan', 1),
(497, 33, '', 'Sofia', 1),
(498, 33, '', 'Sofia - town', 1),
(499, 33, '', 'Stara Zagora', 1),
(500, 33, '', 'Targovishte', 1),
(501, 33, '', 'Varna', 1),
(502, 33, '', 'Veliko Tarnovo', 1),
(503, 33, '', 'Vidin', 1),
(504, 33, '', 'Vratza', 1),
(505, 33, '', 'Yambol', 1),
(506, 34, 'BAL', 'Bale', 1),
(507, 34, 'BAM', 'Bam', 1),
(508, 34, 'BAN', 'Banwa', 1),
(509, 34, 'BAZ', 'Bazega', 1),
(510, 34, 'BOR', 'Bougouriba', 1),
(511, 34, 'BLG', 'Boulgou', 1),
(512, 34, 'BOK', 'Boulkiemde', 1),
(513, 34, 'COM', 'Comoe', 1),
(514, 34, 'GAN', 'Ganzourgou', 1),
(515, 34, 'GNA', 'Gnagna', 1),
(516, 34, 'GOU', 'Gourma', 1),
(517, 34, 'HOU', 'Houet', 1),
(518, 34, 'IOA', 'Ioba', 1),
(519, 34, 'KAD', 'Kadiogo', 1),
(520, 34, 'KEN', 'Kenedougou', 1),
(521, 34, 'KOD', 'Komondjari', 1),
(522, 34, 'KOP', 'Kompienga', 1),
(523, 34, 'KOS', 'Kossi', 1),
(524, 34, 'KOL', 'Koulpelogo', 1),
(525, 34, 'KOT', 'Kouritenga', 1),
(526, 34, 'KOW', 'Kourweogo', 1),
(527, 34, 'LER', 'Leraba', 1),
(528, 34, 'LOR', 'Loroum', 1),
(529, 34, 'MOU', 'Mouhoun', 1),
(530, 34, 'NAH', 'Nahouri', 1),
(531, 34, 'NAM', 'Namentenga', 1),
(532, 34, 'NAY', 'Nayala', 1),
(533, 34, 'NOU', 'Noumbiel', 1),
(534, 34, 'OUB', 'Oubritenga', 1),
(535, 34, 'OUD', 'Oudalan', 1),
(536, 34, 'PAS', 'Passore', 1),
(537, 34, 'PON', 'Poni', 1),
(538, 34, 'SAG', 'Sanguie', 1),
(539, 34, 'SAM', 'Sanmatenga', 1),
(540, 34, 'SEN', 'Seno', 1),
(541, 34, 'SIS', 'Sissili', 1),
(542, 34, 'SOM', 'Soum', 1),
(543, 34, 'SOR', 'Sourou', 1),
(544, 34, 'TAP', 'Tapoa', 1),
(545, 34, 'TUY', 'Tuy', 1),
(546, 34, 'YAG', 'Yagha', 1),
(547, 34, 'YAT', 'Yatenga', 1),
(548, 34, 'ZIR', 'Ziro', 1),
(549, 34, 'ZOD', 'Zondoma', 1),
(550, 34, 'ZOW', 'Zoundweogo', 1),
(551, 35, 'BB', 'Bubanza', 1),
(552, 35, 'BJ', 'Bujumbura', 1),
(553, 35, 'BR', 'Bururi', 1),
(554, 35, 'CA', 'Cankuzo', 1),
(555, 35, 'CI', 'Cibitoke', 1),
(556, 35, 'GI', 'Gitega', 1),
(557, 35, 'KR', 'Karuzi', 1),
(558, 35, 'KY', 'Kayanza', 1),
(559, 35, 'KI', 'Kirundo', 1),
(560, 35, 'MA', 'Makamba', 1),
(561, 35, 'MU', 'Muramvya', 1),
(562, 35, 'MY', 'Muyinga', 1),
(563, 35, 'MW', 'Mwaro', 1),
(564, 35, 'NG', 'Ngozi', 1),
(565, 35, 'RT', 'Rutana', 1),
(566, 35, 'RY', 'Ruyigi', 1),
(567, 36, 'PP', 'Phnom Penh', 1),
(568, 36, 'PS', 'Preah Seihanu (Kompong Som or Sihanoukville)', 1),
(569, 36, 'PA', 'Pailin', 1),
(570, 36, 'KB', 'Keb', 1),
(571, 36, 'BM', 'Banteay Meanchey', 1),
(572, 36, 'BA', 'Battambang', 1),
(573, 36, 'KM', 'Kampong Cham', 1),
(574, 36, 'KN', 'Kampong Chhnang', 1),
(575, 36, 'KU', 'Kampong Speu', 1),
(576, 36, 'KO', 'Kampong Som', 1),
(577, 36, 'KT', 'Kampong Thom', 1),
(578, 36, 'KP', 'Kampot', 1),
(579, 36, 'KL', 'Kandal', 1),
(580, 36, 'KK', 'Kaoh Kong', 1),
(581, 36, 'KR', 'Kratie', 1),
(582, 36, 'MK', 'Mondul Kiri', 1),
(583, 36, 'OM', 'Oddar Meancheay', 1),
(584, 36, 'PU', 'Pursat', 1),
(585, 36, 'PR', 'Preah Vihear', 1),
(586, 36, 'PG', 'Prey Veng', 1),
(587, 36, 'RK', 'Ratanak Kiri', 1),
(588, 36, 'SI', 'Siemreap', 1),
(589, 36, 'ST', 'Stung Treng', 1),
(590, 36, 'SR', 'Svay Rieng', 1),
(591, 36, 'TK', 'Takeo', 1),
(592, 37, 'ADA', 'Adamawa (Adamaoua)', 1),
(593, 37, 'CEN', 'Centre', 1),
(594, 37, 'EST', 'East (Est)', 1),
(595, 37, 'EXN', 'Extreme North (Extreme-Nord)', 1),
(596, 37, 'LIT', 'Littoral', 1),
(597, 37, 'NOR', 'North (Nord)', 1),
(598, 37, 'NOT', 'Northwest (Nord-Ouest)', 1),
(599, 37, 'OUE', 'West (Ouest)', 1),
(600, 37, 'SUD', 'South (Sud)', 1),
(601, 37, 'SOU', 'Southwest (Sud-Ouest).', 1),
(602, 38, 'AB', 'Alberta', 1),
(603, 38, 'BC', 'British Columbia', 1),
(604, 38, 'MB', 'Manitoba', 1),
(605, 38, 'NB', 'New Brunswick', 1),
(606, 38, 'NL', 'Newfoundland and Labrador', 1),
(607, 38, 'NT', 'Northwest Territories', 1),
(608, 38, 'NS', 'Nova Scotia', 1),
(609, 38, 'NU', 'Nunavut', 1),
(610, 38, 'ON', 'Ontario', 1),
(611, 38, 'PE', 'Prince Edward Island', 1),
(612, 38, 'QC', 'Qu&eacute;bec', 1),
(613, 38, 'SK', 'Saskatchewan', 1),
(614, 38, 'YT', 'Yukon Territory', 1),
(615, 39, 'BV', 'Boa Vista', 1),
(616, 39, 'BR', 'Brava', 1),
(617, 39, 'CS', 'Calheta de Sao Miguel', 1),
(618, 39, 'MA', 'Maio', 1),
(619, 39, 'MO', 'Mosteiros', 1),
(620, 39, 'PA', 'Paul', 1),
(621, 39, 'PN', 'Porto Novo', 1),
(622, 39, 'PR', 'Praia', 1),
(623, 39, 'RG', 'Ribeira Grande', 1),
(624, 39, 'SL', 'Sal', 1),
(625, 39, 'CA', 'Santa Catarina', 1),
(626, 39, 'CR', 'Santa Cruz', 1),
(627, 39, 'SD', 'Sao Domingos', 1),
(628, 39, 'SF', 'Sao Filipe', 1),
(629, 39, 'SN', 'Sao Nicolau', 1),
(630, 39, 'SV', 'Sao Vicente', 1),
(631, 39, 'TA', 'Tarrafal', 1),
(632, 40, 'CR', 'Creek', 1),
(633, 40, 'EA', 'Eastern', 1),
(634, 40, 'ML', 'Midland', 1),
(635, 40, 'ST', 'South Town', 1),
(636, 40, 'SP', 'Spot Bay', 1),
(637, 40, 'SK', 'Stake Bay', 1),
(638, 40, 'WD', 'West End', 1),
(639, 40, 'WN', 'Western', 1),
(640, 41, 'BBA', 'Bamingui-Bangoran', 1),
(641, 41, 'BKO', 'Basse-Kotto', 1),
(642, 41, 'HKO', 'Haute-Kotto', 1),
(643, 41, 'HMB', 'Haut-Mbomou', 1),
(644, 41, 'KEM', 'Kemo', 1),
(645, 41, 'LOB', 'Lobaye', 1),
(646, 41, 'MKD', 'Mambere-KadeÔ', 1),
(647, 41, 'MBO', 'Mbomou', 1),
(648, 41, 'NMM', 'Nana-Mambere', 1),
(649, 41, 'OMP', 'Ombella-M''Poko', 1),
(650, 41, 'OUK', 'Ouaka', 1),
(651, 41, 'OUH', 'Ouham', 1),
(652, 41, 'OPE', 'Ouham-Pende', 1),
(653, 41, 'VAK', 'Vakaga', 1),
(654, 41, 'NGR', 'Nana-Grebizi', 1),
(655, 41, 'SMB', 'Sangha-Mbaere', 1),
(656, 41, 'BAN', 'Bangui', 1),
(657, 42, 'BA', 'Batha', 1),
(658, 42, 'BI', 'Biltine', 1),
(659, 42, 'BE', 'Borkou-Ennedi-Tibesti', 1),
(660, 42, 'CB', 'Chari-Baguirmi', 1),
(661, 42, 'GU', 'Guera', 1),
(662, 42, 'KA', 'Kanem', 1),
(663, 42, 'LA', 'Lac', 1),
(664, 42, 'LC', 'Logone Occidental', 1),
(665, 42, 'LR', 'Logone Oriental', 1),
(666, 42, 'MK', 'Mayo-Kebbi', 1),
(667, 42, 'MC', 'Moyen-Chari', 1),
(668, 42, 'OU', 'Ouaddai', 1),
(669, 42, 'SA', 'Salamat', 1),
(670, 42, 'TA', 'Tandjile', 1),
(671, 43, 'AI', 'Aisen del General Carlos Ibanez', 1),
(672, 43, 'AN', 'Antofagasta', 1),
(673, 43, 'AR', 'Araucania', 1),
(674, 43, 'AT', 'Atacama', 1),
(675, 43, 'BI', 'Bio-Bio', 1),
(676, 43, 'CO', 'Coquimbo', 1),
(677, 43, 'LI', 'Libertador General Bernardo O''Hi', 1),
(678, 43, 'LL', 'Los Lagos', 1),
(679, 43, 'MA', 'Magallanes y de la Antartica Chi', 1),
(680, 43, 'ML', 'Maule', 1),
(681, 43, 'RM', 'Region Metropolitana', 1),
(682, 43, 'TA', 'Tarapaca', 1),
(683, 43, 'VS', 'Valparaiso', 1),
(684, 44, 'AN', 'Anhui', 1),
(685, 44, 'BE', 'Beijing', 1),
(686, 44, 'CH', 'Chongqing', 1),
(687, 44, 'FU', 'Fujian', 1),
(688, 44, 'GA', 'Gansu', 1),
(689, 44, 'GU', 'Guangdong', 1),
(690, 44, 'GX', 'Guangxi', 1),
(691, 44, 'GZ', 'Guizhou', 1),
(692, 44, 'HA', 'Hainan', 1),
(693, 44, 'HB', 'Hebei', 1),
(694, 44, 'HL', 'Heilongjiang', 1),
(695, 44, 'HE', 'Henan', 1),
(696, 44, 'HK', 'Hong Kong', 1),
(697, 44, 'HU', 'Hubei', 1),
(698, 44, 'HN', 'Hunan', 1),
(699, 44, 'IM', 'Inner Mongolia', 1),
(700, 44, 'JI', 'Jiangsu', 1),
(701, 44, 'JX', 'Jiangxi', 1),
(702, 44, 'JL', 'Jilin', 1),
(703, 44, 'LI', 'Liaoning', 1),
(704, 44, 'MA', 'Macau', 1),
(705, 44, 'NI', 'Ningxia', 1),
(706, 44, 'SH', 'Shaanxi', 1),
(707, 44, 'SA', 'Shandong', 1),
(708, 44, 'SG', 'Shanghai', 1),
(709, 44, 'SX', 'Shanxi', 1),
(710, 44, 'SI', 'Sichuan', 1),
(711, 44, 'TI', 'Tianjin', 1),
(712, 44, 'XI', 'Xinjiang', 1),
(713, 44, 'YU', 'Yunnan', 1),
(714, 44, 'ZH', 'Zhejiang', 1),
(715, 46, 'D', 'Direction Island', 1),
(716, 46, 'H', 'Home Island', 1),
(717, 46, 'O', 'Horsburgh Island', 1),
(718, 46, 'S', 'South Island', 1),
(719, 46, 'W', 'West Island', 1),
(720, 47, 'AMZ', 'Amazonas', 1),
(721, 47, 'ANT', 'Antioquia', 1),
(722, 47, 'ARA', 'Arauca', 1),
(723, 47, 'ATL', 'Atlantico', 1),
(724, 47, 'BDC', 'Bogota D.C.', 1),
(725, 47, 'BOL', 'Bolivar', 1),
(726, 47, 'BOY', 'Boyaca', 1),
(727, 47, 'CAL', 'Caldas', 1),
(728, 47, 'CAQ', 'Caqueta', 1),
(729, 47, 'CAS', 'Casanare', 1),
(730, 47, 'CAU', 'Cauca', 1),
(731, 47, 'CES', 'Cesar', 1),
(732, 47, 'CHO', 'Choco', 1),
(733, 47, 'COR', 'Cordoba', 1),
(734, 47, 'CAM', 'Cundinamarca', 1),
(735, 47, 'GNA', 'Guainia', 1),
(736, 47, 'GJR', 'Guajira', 1),
(737, 47, 'GVR', 'Guaviare', 1),
(738, 47, 'HUI', 'Huila', 1),
(739, 47, 'MAG', 'Magdalena', 1),
(740, 47, 'MET', 'Meta', 1),
(741, 47, 'NAR', 'Narino', 1),
(742, 47, 'NDS', 'Norte de Santander', 1),
(743, 47, 'PUT', 'Putumayo', 1),
(744, 47, 'QUI', 'Quindio', 1),
(745, 47, 'RIS', 'Risaralda', 1),
(746, 47, 'SAP', 'San Andres y Providencia', 1),
(747, 47, 'SAN', 'Santander', 1),
(748, 47, 'SUC', 'Sucre', 1),
(749, 47, 'TOL', 'Tolima', 1),
(750, 47, 'VDC', 'Valle del Cauca', 1),
(751, 47, 'VAU', 'Vaupes', 1),
(752, 47, 'VIC', 'Vichada', 1),
(753, 48, 'G', 'Grande Comore', 1),
(754, 48, 'A', 'Anjouan', 1),
(755, 48, 'M', 'Moheli', 1),
(756, 49, 'BO', 'Bouenza', 1),
(757, 49, 'BR', 'Brazzaville', 1),
(758, 49, 'CU', 'Cuvette', 1),
(759, 49, 'CO', 'Cuvette-Ouest', 1),
(760, 49, 'KO', 'Kouilou', 1),
(761, 49, 'LE', 'Lekoumou', 1),
(762, 49, 'LI', 'Likouala', 1),
(763, 49, 'NI', 'Niari', 1),
(764, 49, 'PL', 'Plateaux', 1),
(765, 49, 'PO', 'Pool', 1),
(766, 49, 'SA', 'Sangha', 1),
(767, 50, 'PU', 'Pukapuka', 1),
(768, 50, 'RK', 'Rakahanga', 1),
(769, 50, 'MK', 'Manihiki', 1),
(770, 50, 'PE', 'Penrhyn', 1),
(771, 50, 'NI', 'Nassau Island', 1),
(772, 50, 'SU', 'Surwarrow', 1),
(773, 50, 'PA', 'Palmerston', 1),
(774, 50, 'AI', 'Aitutaki', 1),
(775, 50, 'MA', 'Manuae', 1),
(776, 50, 'TA', 'Takutea', 1),
(777, 50, 'MT', 'Mitiaro', 1),
(778, 50, 'AT', 'Atiu', 1),
(779, 50, 'MU', 'Mauke', 1),
(780, 50, 'RR', 'Rarotonga', 1),
(781, 50, 'MG', 'Mangaia', 1),
(782, 51, 'AL', 'Alajuela', 1),
(783, 51, 'CA', 'Cartago', 1),
(784, 51, 'GU', 'Guanacaste', 1),
(785, 51, 'HE', 'Heredia', 1),
(786, 51, 'LI', 'Limon', 1),
(787, 51, 'PU', 'Puntarenas', 1),
(788, 51, 'SJ', 'San Jose', 1),
(789, 52, 'ABE', 'Abengourou', 1),
(790, 52, 'ABI', 'Abidjan', 1),
(791, 52, 'ABO', 'Aboisso', 1),
(792, 52, 'ADI', 'Adiake', 1),
(793, 52, 'ADZ', 'Adzope', 1),
(794, 52, 'AGB', 'Agboville', 1),
(795, 52, 'AGN', 'Agnibilekrou', 1),
(796, 52, 'ALE', 'Alepe', 1),
(797, 52, 'BOC', 'Bocanda', 1),
(798, 52, 'BAN', 'Bangolo', 1),
(799, 52, 'BEO', 'Beoumi', 1),
(800, 52, 'BIA', 'Biankouma', 1),
(801, 52, 'BDK', 'Bondoukou', 1),
(802, 52, 'BGN', 'Bongouanou', 1),
(803, 52, 'BFL', 'Bouafle', 1),
(804, 52, 'BKE', 'Bouake', 1),
(805, 52, 'BNA', 'Bouna', 1),
(806, 52, 'BDL', 'Boundiali', 1),
(807, 52, 'DKL', 'Dabakala', 1),
(808, 52, 'DBU', 'Dabou', 1),
(809, 52, 'DAL', 'Daloa', 1),
(810, 52, 'DAN', 'Danane', 1),
(811, 52, 'DAO', 'Daoukro', 1),
(812, 52, 'DIM', 'Dimbokro', 1),
(813, 52, 'DIV', 'Divo', 1),
(814, 52, 'DUE', 'Duekoue', 1),
(815, 52, 'FER', 'Ferkessedougou', 1),
(816, 52, 'GAG', 'Gagnoa', 1),
(817, 52, 'GBA', 'Grand-Bassam', 1),
(818, 52, 'GLA', 'Grand-Lahou', 1),
(819, 52, 'GUI', 'Guiglo', 1),
(820, 52, 'ISS', 'Issia', 1),
(821, 52, 'JAC', 'Jacqueville', 1),
(822, 52, 'KAT', 'Katiola', 1),
(823, 52, 'KOR', 'Korhogo', 1),
(824, 52, 'LAK', 'Lakota', 1),
(825, 52, 'MAN', 'Man', 1),
(826, 52, 'MKN', 'Mankono', 1),
(827, 52, 'MBA', 'Mbahiakro', 1),
(828, 52, 'ODI', 'Odienne', 1),
(829, 52, 'OUM', 'Oume', 1),
(830, 52, 'SAK', 'Sakassou', 1),
(831, 52, 'SPE', 'San-Pedro', 1),
(832, 52, 'SAS', 'Sassandra', 1),
(833, 52, 'SEG', 'Seguela', 1),
(834, 52, 'SIN', 'Sinfra', 1),
(835, 52, 'SOU', 'Soubre', 1),
(836, 52, 'TAB', 'Tabou', 1),
(837, 52, 'TAN', 'Tanda', 1),
(838, 52, 'TIE', 'Tiebissou', 1),
(839, 52, 'TIN', 'Tingrela', 1),
(840, 52, 'TIA', 'Tiassale', 1),
(841, 52, 'TBA', 'Touba', 1),
(842, 52, 'TLP', 'Toulepleu', 1),
(843, 52, 'TMD', 'Toumodi', 1),
(844, 52, 'VAV', 'Vavoua', 1),
(845, 52, 'YAM', 'Yamoussoukro', 1),
(846, 52, 'ZUE', 'Zuenoula', 1),
(847, 53, 'BB', 'Bjelovar-Bilogora', 1),
(848, 53, 'CZ', 'City of Zagreb', 1),
(849, 53, 'DN', 'Dubrovnik-Neretva', 1),
(850, 53, 'IS', 'Istra', 1),
(851, 53, 'KA', 'Karlovac', 1),
(852, 53, 'KK', 'Koprivnica-Krizevci', 1),
(853, 53, 'KZ', 'Krapina-Zagorje', 1),
(854, 53, 'LS', 'Lika-Senj', 1),
(855, 53, 'ME', 'Medimurje', 1),
(856, 53, 'OB', 'Osijek-Baranja', 1),
(857, 53, 'PS', 'Pozega-Slavonia', 1),
(858, 53, 'PG', 'Primorje-Gorski Kotar', 1),
(859, 53, 'SI', 'Sibenik', 1),
(860, 53, 'SM', 'Sisak-Moslavina', 1),
(861, 53, 'SB', 'Slavonski Brod-Posavina', 1),
(862, 53, 'SD', 'Split-Dalmatia', 1),
(863, 53, 'VA', 'Varazdin', 1),
(864, 53, 'VP', 'Virovitica-Podravina', 1),
(865, 53, 'VS', 'Vukovar-Srijem', 1),
(866, 53, 'ZK', 'Zadar-Knin', 1),
(867, 53, 'ZA', 'Zagreb', 1),
(868, 54, 'CA', 'Camaguey', 1),
(869, 54, 'CD', 'Ciego de Avila', 1),
(870, 54, 'CI', 'Cienfuegos', 1),
(871, 54, 'CH', 'Ciudad de La Habana', 1),
(872, 54, 'GR', 'Granma', 1),
(873, 54, 'GU', 'Guantanamo', 1),
(874, 54, 'HO', 'Holguin', 1),
(875, 54, 'IJ', 'Isla de la Juventud', 1),
(876, 54, 'LH', 'La Habana', 1),
(877, 54, 'LT', 'Las Tunas', 1),
(878, 54, 'MA', 'Matanzas', 1),
(879, 54, 'PR', 'Pinar del Rio', 1),
(880, 54, 'SS', 'Sancti Spiritus', 1),
(881, 54, 'SC', 'Santiago de Cuba', 1),
(882, 54, 'VC', 'Villa Clara', 1),
(883, 55, 'F', 'Famagusta', 1),
(884, 55, 'K', 'Kyrenia', 1),
(885, 55, 'A', 'Larnaca', 1),
(886, 55, 'I', 'Limassol', 1),
(887, 55, 'N', 'Nicosia', 1),
(888, 55, 'P', 'Paphos', 1),
(889, 56, 'U', 'Ústecký', 1),
(890, 56, 'C', 'Jihočeský', 1),
(891, 56, 'B', 'Jihomoravský', 1),
(892, 56, 'K', 'Karlovarský', 1),
(893, 56, 'H', 'Královehradecký', 1),
(894, 56, 'L', 'Liberecký', 1),
(895, 56, 'T', 'Moravskoslezský', 1),
(896, 56, 'M', 'Olomoucký', 1),
(897, 56, 'E', 'Pardubický', 1),
(898, 56, 'P', 'Plzeňský', 1),
(899, 56, 'A', 'Praha', 1),
(900, 56, 'S', 'Středočeský', 1),
(901, 56, 'J', 'Vysočina', 1),
(902, 56, 'Z', 'Zlínský', 1),
(903, 57, 'AR', 'Arhus', 1),
(904, 57, 'BH', 'Bornholm', 1),
(905, 57, 'CO', 'Copenhagen', 1),
(906, 57, 'FO', 'Faroe Islands', 1),
(907, 57, 'FR', 'Frederiksborg', 1),
(908, 57, 'FY', 'Fyn', 1),
(909, 57, 'KO', 'Kobenhavn', 1),
(910, 57, 'NO', 'Nordjylland', 1),
(911, 57, 'RI', 'Ribe', 1),
(912, 57, 'RK', 'Ringkobing', 1),
(913, 57, 'RO', 'Roskilde', 1),
(914, 57, 'SO', 'Sonderjylland', 1),
(915, 57, 'ST', 'Storstrom', 1),
(916, 57, 'VK', 'Vejle', 1),
(917, 57, 'VJ', 'Vestj&aelig;lland', 1),
(918, 57, 'VB', 'Viborg', 1),
(919, 58, 'S', '''Ali Sabih', 1),
(920, 58, 'K', 'Dikhil', 1),
(921, 58, 'J', 'Djibouti', 1),
(922, 58, 'O', 'Obock', 1),
(923, 58, 'T', 'Tadjoura', 1),
(924, 59, 'AND', 'Saint Andrew Parish', 1),
(925, 59, 'DAV', 'Saint David Parish', 1),
(926, 59, 'GEO', 'Saint George Parish', 1),
(927, 59, 'JOH', 'Saint John Parish', 1),
(928, 59, 'JOS', 'Saint Joseph Parish', 1),
(929, 59, 'LUK', 'Saint Luke Parish', 1),
(930, 59, 'MAR', 'Saint Mark Parish', 1),
(931, 59, 'PAT', 'Saint Patrick Parish', 1),
(932, 59, 'PAU', 'Saint Paul Parish', 1),
(933, 59, 'PET', 'Saint Peter Parish', 1),
(934, 60, 'DN', 'Distrito Nacional', 1),
(935, 60, 'AZ', 'Azua', 1),
(936, 60, 'BC', 'Baoruco', 1),
(937, 60, 'BH', 'Barahona', 1),
(938, 60, 'DJ', 'Dajabon', 1),
(939, 60, 'DU', 'Duarte', 1),
(940, 60, 'EL', 'Elias Pina', 1),
(941, 60, 'SY', 'El Seybo', 1),
(942, 60, 'ET', 'Espaillat', 1),
(943, 60, 'HM', 'Hato Mayor', 1),
(944, 60, 'IN', 'Independencia', 1),
(945, 60, 'AL', 'La Altagracia', 1),
(946, 60, 'RO', 'La Romana', 1),
(947, 60, 'VE', 'La Vega', 1),
(948, 60, 'MT', 'Maria Trinidad Sanchez', 1),
(949, 60, 'MN', 'Monsenor Nouel', 1),
(950, 60, 'MC', 'Monte Cristi', 1),
(951, 60, 'MP', 'Monte Plata', 1),
(952, 60, 'PD', 'Pedernales', 1),
(953, 60, 'PR', 'Peravia (Bani)', 1),
(954, 60, 'PP', 'Puerto Plata', 1),
(955, 60, 'SL', 'Salcedo', 1),
(956, 60, 'SM', 'Samana', 1),
(957, 60, 'SH', 'Sanchez Ramirez', 1),
(958, 60, 'SC', 'San Cristobal', 1),
(959, 60, 'JO', 'San Jose de Ocoa', 1),
(960, 60, 'SJ', 'San Juan', 1),
(961, 60, 'PM', 'San Pedro de Macoris', 1),
(962, 60, 'SA', 'Santiago', 1),
(963, 60, 'ST', 'Santiago Rodriguez', 1),
(964, 60, 'SD', 'Santo Domingo', 1),
(965, 60, 'VA', 'Valverde', 1),
(966, 61, 'AL', 'Aileu', 1),
(967, 61, 'AN', 'Ainaro', 1),
(968, 61, 'BA', 'Baucau', 1),
(969, 61, 'BO', 'Bobonaro', 1),
(970, 61, 'CO', 'Cova Lima', 1),
(971, 61, 'DI', 'Dili', 1),
(972, 61, 'ER', 'Ermera', 1),
(973, 61, 'LA', 'Lautem', 1),
(974, 61, 'LI', 'Liquica', 1),
(975, 61, 'MT', 'Manatuto', 1),
(976, 61, 'MF', 'Manufahi', 1),
(977, 61, 'OE', 'Oecussi', 1),
(978, 61, 'VI', 'Viqueque', 1),
(979, 62, 'AZU', 'Azuay', 1),
(980, 62, 'BOL', 'Bolivar', 1),
(981, 62, 'CAN', 'Ca&ntilde;ar', 1),
(982, 62, 'CAR', 'Carchi', 1),
(983, 62, 'CHI', 'Chimborazo', 1),
(984, 62, 'COT', 'Cotopaxi', 1),
(985, 62, 'EOR', 'El Oro', 1),
(986, 62, 'ESM', 'Esmeraldas', 1),
(987, 62, 'GPS', 'Gal&aacute;pagos', 1),
(988, 62, 'GUA', 'Guayas', 1),
(989, 62, 'IMB', 'Imbabura', 1),
(990, 62, 'LOJ', 'Loja', 1),
(991, 62, 'LRO', 'Los Rios', 1),
(992, 62, 'MAN', 'Manab&iacute;', 1),
(993, 62, 'MSA', 'Morona Santiago', 1),
(994, 62, 'NAP', 'Napo', 1),
(995, 62, 'ORE', 'Orellana', 1),
(996, 62, 'PAS', 'Pastaza', 1),
(997, 62, 'PIC', 'Pichincha', 1),
(998, 62, 'SUC', 'Sucumb&iacute;os', 1),
(999, 62, 'TUN', 'Tungurahua', 1),
(1000, 62, 'ZCH', 'Zamora Chinchipe', 1),
(1001, 63, 'DHY', 'Ad Daqahliyah', 1),
(1002, 63, 'BAM', 'Al Bahr al Ahmar', 1),
(1003, 63, 'BHY', 'Al Buhayrah', 1),
(1004, 63, 'FYM', 'Al Fayyum', 1),
(1005, 63, 'GBY', 'Al Gharbiyah', 1),
(1006, 63, 'IDR', 'Al Iskandariyah', 1),
(1007, 63, 'IML', 'Al Isma''iliyah', 1),
(1008, 63, 'JZH', 'Al Jizah', 1),
(1009, 63, 'MFY', 'Al Minufiyah', 1),
(1010, 63, 'MNY', 'Al Minya', 1),
(1011, 63, 'QHR', 'Al Qahirah', 1),
(1012, 63, 'QLY', 'Al Qalyubiyah', 1),
(1013, 63, 'WJD', 'Al Wadi al Jadid', 1),
(1014, 63, 'SHQ', 'Ash Sharqiyah', 1),
(1015, 63, 'SWY', 'As Suways', 1),
(1016, 63, 'ASW', 'Aswan', 1),
(1017, 63, 'ASY', 'Asyut', 1),
(1018, 63, 'BSW', 'Bani Suwayf', 1),
(1019, 63, 'BSD', 'Bur Sa''id', 1),
(1020, 63, 'DMY', 'Dumyat', 1),
(1021, 63, 'JNS', 'Janub Sina''', 1),
(1022, 63, 'KSH', 'Kafr ash Shaykh', 1),
(1023, 63, 'MAT', 'Matruh', 1),
(1024, 63, 'QIN', 'Qina', 1),
(1025, 63, 'SHS', 'Shamal Sina''', 1),
(1026, 63, 'SUH', 'Suhaj', 1),
(1027, 64, 'AH', 'Ahuachapan', 1),
(1028, 64, 'CA', 'Cabanas', 1),
(1029, 64, 'CH', 'Chalatenango', 1),
(1030, 64, 'CU', 'Cuscatlan', 1),
(1031, 64, 'LB', 'La Libertad', 1),
(1032, 64, 'PZ', 'La Paz', 1),
(1033, 64, 'UN', 'La Union', 1),
(1034, 64, 'MO', 'Morazan', 1),
(1035, 64, 'SM', 'San Miguel', 1),
(1036, 64, 'SS', 'San Salvador', 1),
(1037, 64, 'SV', 'San Vicente', 1),
(1038, 64, 'SA', 'Santa Ana', 1),
(1039, 64, 'SO', 'Sonsonate', 1),
(1040, 64, 'US', 'Usulutan', 1),
(1041, 65, 'AN', 'Provincia Annobon', 1),
(1042, 65, 'BN', 'Provincia Bioko Norte', 1),
(1043, 65, 'BS', 'Provincia Bioko Sur', 1),
(1044, 65, 'CS', 'Provincia Centro Sur', 1),
(1045, 65, 'KN', 'Provincia Kie-Ntem', 1),
(1046, 65, 'LI', 'Provincia Litoral', 1),
(1047, 65, 'WN', 'Provincia Wele-Nzas', 1),
(1048, 66, 'MA', 'Central (Maekel)', 1),
(1049, 66, 'KE', 'Anseba (Keren)', 1),
(1050, 66, 'DK', 'Southern Red Sea (Debub-Keih-Bahri)', 1),
(1051, 66, 'SK', 'Northern Red Sea (Semien-Keih-Bahri)', 1),
(1052, 66, 'DE', 'Southern (Debub)', 1),
(1053, 66, 'BR', 'Gash-Barka (Barentu)', 1),
(1054, 67, 'HA', 'Harjumaa (Tallinn)', 1),
(1055, 67, 'HI', 'Hiiumaa (Kardla)', 1),
(1056, 67, 'IV', 'Ida-Virumaa (Johvi)', 1),
(1057, 67, 'JA', 'Jarvamaa (Paide)', 1),
(1058, 67, 'JO', 'Jogevamaa (Jogeva)', 1),
(1059, 67, 'LV', 'Laane-Virumaa (Rakvere)', 1),
(1060, 67, 'LA', 'Laanemaa (Haapsalu)', 1),
(1061, 67, 'PA', 'Parnumaa (Parnu)', 1),
(1062, 67, 'PO', 'Polvamaa (Polva)', 1),
(1063, 67, 'RA', 'Raplamaa (Rapla)', 1),
(1064, 67, 'SA', 'Saaremaa (Kuessaare)', 1),
(1065, 67, 'TA', 'Tartumaa (Tartu)', 1),
(1066, 67, 'VA', 'Valgamaa (Valga)', 1),
(1067, 67, 'VI', 'Viljandimaa (Viljandi)', 1),
(1068, 67, 'VO', 'Vorumaa (Voru)', 1),
(1069, 68, 'AF', 'Afar', 1),
(1070, 68, 'AH', 'Amhara', 1),
(1071, 68, 'BG', 'Benishangul-Gumaz', 1),
(1072, 68, 'GB', 'Gambela', 1),
(1073, 68, 'HR', 'Hariai', 1),
(1074, 68, 'OR', 'Oromia', 1),
(1075, 68, 'SM', 'Somali', 1),
(1076, 68, 'SN', 'Southern Nations - Nationalities and Peoples Region', 1),
(1077, 68, 'TG', 'Tigray', 1),
(1078, 68, 'AA', 'Addis Ababa', 1),
(1079, 68, 'DD', 'Dire Dawa', 1),
(1080, 71, 'C', 'Central Division', 1),
(1081, 71, 'N', 'Northern Division', 1),
(1082, 71, 'E', 'Eastern Division', 1),
(1083, 71, 'W', 'Western Division', 1),
(1084, 71, 'R', 'Rotuma', 1),
(1085, 72, 'AL', 'Ahvenanmaan Laani', 1),
(1086, 72, 'ES', 'Etela-Suomen Laani', 1),
(1087, 72, 'IS', 'Ita-Suomen Laani', 1),
(1088, 72, 'LS', 'Lansi-Suomen Laani', 1),
(1089, 72, 'LA', 'Lapin Lanani', 1),
(1090, 72, 'OU', 'Oulun Laani', 1),
(1091, 73, 'AL', 'Alsace', 1),
(1092, 73, 'AQ', 'Aquitaine', 1),
(1093, 73, 'AU', 'Auvergne', 1),
(1094, 73, 'BR', 'Brittany', 1),
(1095, 73, 'BU', 'Burgundy', 1),
(1096, 73, 'CE', 'Center Loire Valley', 1),
(1097, 73, 'CH', 'Champagne', 1),
(1098, 73, 'CO', 'Corse', 1),
(1099, 73, 'FR', 'France Comte', 1),
(1100, 73, 'LA', 'Languedoc Roussillon', 1),
(1101, 73, 'LI', 'Limousin', 1),
(1102, 73, 'LO', 'Lorraine', 1),
(1103, 73, 'MI', 'Midi Pyrenees', 1),
(1104, 73, 'NO', 'Nord Pas de Calais', 1),
(1105, 73, 'NR', 'Normandy', 1),
(1106, 73, 'PA', 'Paris / Ill de France', 1),
(1107, 73, 'PI', 'Picardie', 1),
(1108, 73, 'PO', 'Poitou Charente', 1),
(1109, 73, 'PR', 'Provence', 1),
(1110, 73, 'RH', 'Rhone Alps', 1),
(1111, 73, 'RI', 'Riviera', 1),
(1112, 73, 'WE', 'Western Loire Valley', 1),
(1113, 74, 'Et', 'Etranger', 1),
(1114, 74, '01', 'Ain', 1),
(1115, 74, '02', 'Aisne', 1),
(1116, 74, '03', 'Allier', 1),
(1117, 74, '04', 'Alpes de Haute Provence', 1),
(1118, 74, '05', 'Hautes-Alpes', 1),
(1119, 74, '06', 'Alpes Maritimes', 1),
(1120, 74, '07', 'Ard&egrave;che', 1),
(1121, 74, '08', 'Ardennes', 1),
(1122, 74, '09', 'Ari&egrave;ge', 1),
(1123, 74, '10', 'Aube', 1),
(1124, 74, '11', 'Aude', 1),
(1125, 74, '12', 'Aveyron', 1),
(1126, 74, '13', 'Bouches du Rh&ocirc;ne', 1),
(1127, 74, '14', 'Calvados', 1),
(1128, 74, '15', 'Cantal', 1),
(1129, 74, '16', 'Charente', 1),
(1130, 74, '17', 'Charente Maritime', 1),
(1131, 74, '18', 'Cher', 1),
(1132, 74, '19', 'Corr&egrave;ze', 1),
(1133, 74, '2A', 'Corse du Sud', 1),
(1134, 74, '2B', 'Haute Corse', 1),
(1135, 74, '21', 'C&ocirc;te d&#039;or', 1),
(1136, 74, '22', 'C&ocirc;tes d&#039;Armor', 1),
(1137, 74, '23', 'Creuse', 1),
(1138, 74, '24', 'Dordogne', 1),
(1139, 74, '25', 'Doubs', 1),
(1140, 74, '26', 'Dr&ocirc;me', 1),
(1141, 74, '27', 'Eure', 1),
(1142, 74, '28', 'Eure et Loir', 1),
(1143, 74, '29', 'Finist&egrave;re', 1),
(1144, 74, '30', 'Gard', 1),
(1145, 74, '31', 'Haute Garonne', 1),
(1146, 74, '32', 'Gers', 1),
(1147, 74, '33', 'Gironde', 1),
(1148, 74, '34', 'H&eacute;rault', 1),
(1149, 74, '35', 'Ille et Vilaine', 1),
(1150, 74, '36', 'Indre', 1),
(1151, 74, '37', 'Indre et Loire', 1),
(1152, 74, '38', 'Is&eacute;re', 1),
(1153, 74, '39', 'Jura', 1),
(1154, 74, '40', 'Landes', 1),
(1155, 74, '41', 'Loir et Cher', 1),
(1156, 74, '42', 'Loire', 1),
(1157, 74, '43', 'Haute Loire', 1),
(1158, 74, '44', 'Loire Atlantique', 1),
(1159, 74, '45', 'Loiret', 1),
(1160, 74, '46', 'Lot', 1),
(1161, 74, '47', 'Lot et Garonne', 1),
(1162, 74, '48', 'Loz&egrave;re', 1),
(1163, 74, '49', 'Maine et Loire', 1),
(1164, 74, '50', 'Manche', 1),
(1165, 74, '51', 'Marne', 1),
(1166, 74, '52', 'Haute Marne', 1),
(1167, 74, '53', 'Mayenne', 1),
(1168, 74, '54', 'Meurthe et Moselle', 1),
(1169, 74, '55', 'Meuse', 1),
(1170, 74, '56', 'Morbihan', 1),
(1171, 74, '57', 'Moselle', 1),
(1172, 74, '58', 'Ni&egrave;vre', 1),
(1173, 74, '59', 'Nord', 1),
(1174, 74, '60', 'Oise', 1),
(1175, 74, '61', 'Orne', 1),
(1176, 74, '62', 'Pas de Calais', 1),
(1177, 74, '63', 'Puy de D&ocirc;me', 1),
(1178, 74, '64', 'Pyr&eacute;n&eacute;es Atlantiques', 1),
(1179, 74, '65', 'Hautes Pyr&eacute;n&eacute;es', 1),
(1180, 74, '66', 'Pyr&eacute;n&eacute;es Orientales', 1),
(1181, 74, '67', 'Bas Rhin', 1),
(1182, 74, '68', 'Haut Rhin', 1),
(1183, 74, '69', 'Rh&ocirc;ne', 1),
(1184, 74, '70', 'Haute Sa&ocirc;ne', 1),
(1185, 74, '71', 'Sa&ocirc;ne et Loire', 1),
(1186, 74, '72', 'Sarthe', 1),
(1187, 74, '73', 'Savoie', 1),
(1188, 74, '74', 'Haute Savoie', 1),
(1189, 74, '75', 'Paris', 1),
(1190, 74, '76', 'Seine Maritime', 1),
(1191, 74, '77', 'Seine et Marne', 1),
(1192, 74, '78', 'Yvelines', 1),
(1193, 74, '79', 'Deux S&egrave;vres', 1),
(1194, 74, '80', 'Somme', 1),
(1195, 74, '81', 'Tarn', 1),
(1196, 74, '82', 'Tarn et Garonne', 1),
(1197, 74, '83', 'Var', 1),
(1198, 74, '84', 'Vaucluse', 1),
(1199, 74, '85', 'Vend&eacute;e', 1),
(1200, 74, '86', 'Vienne', 1),
(1201, 74, '87', 'Haute Vienne', 1),
(1202, 74, '88', 'Vosges', 1),
(1203, 74, '89', 'Yonne', 1),
(1204, 74, '90', 'Territoire de Belfort', 1),
(1205, 74, '91', 'Essonne', 1),
(1206, 74, '92', 'Hauts de Seine', 1),
(1207, 74, '93', 'Seine St-Denis', 1),
(1208, 74, '94', 'Val de Marne', 1),
(1209, 74, '95', 'Val d''Oise', 1),
(1210, 76, 'M', 'Archipel des Marquises', 1),
(1211, 76, 'T', 'Archipel des Tuamotu', 1),
(1212, 76, 'I', 'Archipel des Tubuai', 1),
(1213, 76, 'V', 'Iles du Vent', 1),
(1214, 76, 'S', 'Iles Sous-le-Vent', 1),
(1215, 77, 'C', 'Iles Crozet', 1),
(1216, 77, 'K', 'Iles Kerguelen', 1),
(1217, 77, 'A', 'Ile Amsterdam', 1),
(1218, 77, 'P', 'Ile Saint-Paul', 1),
(1219, 77, 'D', 'Adelie Land', 1),
(1220, 78, 'ES', 'Estuaire', 1),
(1221, 78, 'HO', 'Haut-Ogooue', 1),
(1222, 78, 'MO', 'Moyen-Ogooue', 1),
(1223, 78, 'NG', 'Ngounie', 1),
(1224, 78, 'NY', 'Nyanga', 1),
(1225, 78, 'OI', 'Ogooue-Ivindo', 1),
(1226, 78, 'OL', 'Ogooue-Lolo', 1),
(1227, 78, 'OM', 'Ogooue-Maritime', 1),
(1228, 78, 'WN', 'Woleu-Ntem', 1),
(1229, 79, 'BJ', 'Banjul', 1),
(1230, 79, 'BS', 'Basse', 1),
(1231, 79, 'BR', 'Brikama', 1),
(1232, 79, 'JA', 'Janjangbure', 1),
(1233, 79, 'KA', 'Kanifeng', 1),
(1234, 79, 'KE', 'Kerewan', 1),
(1235, 79, 'KU', 'Kuntaur', 1),
(1236, 79, 'MA', 'Mansakonko', 1),
(1237, 79, 'LR', 'Lower River', 1),
(1238, 79, 'CR', 'Central River', 1),
(1239, 79, 'NB', 'North Bank', 1),
(1240, 79, 'UR', 'Upper River', 1),
(1241, 79, 'WE', 'Western', 1),
(1242, 80, 'AB', 'Abkhazia', 1),
(1243, 80, 'AJ', 'Ajaria', 1),
(1244, 80, 'TB', 'Tbilisi', 1),
(1245, 80, 'GU', 'Guria', 1),
(1246, 80, 'IM', 'Imereti', 1),
(1247, 80, 'KA', 'Kakheti', 1),
(1248, 80, 'KK', 'Kvemo Kartli', 1),
(1249, 80, 'MM', 'Mtskheta-Mtianeti', 1),
(1250, 80, 'RL', 'Racha Lechkhumi and Kvemo Svanet', 1),
(1251, 80, 'SZ', 'Samegrelo-Zemo Svaneti', 1),
(1252, 80, 'SJ', 'Samtskhe-Javakheti', 1),
(1253, 80, 'SK', 'Shida Kartli', 1),
(1254, 81, 'BAW', 'Baden-W&uuml;rttemberg', 1),
(1255, 81, 'BAY', 'Bayern', 1),
(1256, 81, 'BER', 'Berlin', 1),
(1257, 81, 'BRG', 'Brandenburg', 1),
(1258, 81, 'BRE', 'Bremen', 1),
(1259, 81, 'HAM', 'Hamburg', 1),
(1260, 81, 'HES', 'Hessen', 1),
(1261, 81, 'MEC', 'Mecklenburg-Vorpommern', 1),
(1262, 81, 'NDS', 'Niedersachsen', 1),
(1263, 81, 'NRW', 'Nordrhein-Westfalen', 1),
(1264, 81, 'RHE', 'Rheinland-Pfalz', 1),
(1265, 81, 'SAR', 'Saarland', 1),
(1266, 81, 'SAS', 'Sachsen', 1),
(1267, 81, 'SAC', 'Sachsen-Anhalt', 1),
(1268, 81, 'SCN', 'Schleswig-Holstein', 1),
(1269, 81, 'THE', 'Th&uuml;ringen', 1),
(1270, 82, 'AS', 'Ashanti Region', 1),
(1271, 82, 'BA', 'Brong-Ahafo Region', 1),
(1272, 82, 'CE', 'Central Region', 1),
(1273, 82, 'EA', 'Eastern Region', 1),
(1274, 82, 'GA', 'Greater Accra Region', 1),
(1275, 82, 'NO', 'Northern Region', 1),
(1276, 82, 'UE', 'Upper East Region', 1),
(1277, 82, 'UW', 'Upper West Region', 1),
(1278, 82, 'VO', 'Volta Region', 1),
(1279, 82, 'WE', 'Western Region', 1),
(1280, 84, 'AT', 'Attica', 1),
(1281, 84, 'CN', 'Central Greece', 1),
(1282, 84, 'CM', 'Central Macedonia', 1),
(1283, 84, 'CR', 'Crete', 1),
(1284, 84, 'EM', 'East Macedonia and Thrace', 1),
(1285, 84, 'EP', 'Epirus', 1),
(1286, 84, 'II', 'Ionian Islands', 1),
(1287, 84, 'NA', 'North Aegean', 1),
(1288, 84, 'PP', 'Peloponnesos', 1),
(1289, 84, 'SA', 'South Aegean', 1),
(1290, 84, 'TH', 'Thessaly', 1),
(1291, 84, 'WG', 'West Greece', 1),
(1292, 84, 'WM', 'West Macedonia', 1),
(1293, 85, 'A', 'Avannaa', 1),
(1294, 85, 'T', 'Tunu', 1),
(1295, 85, 'K', 'Kitaa', 1),
(1296, 86, 'A', 'Saint Andrew', 1),
(1297, 86, 'D', 'Saint David', 1),
(1298, 86, 'G', 'Saint George', 1),
(1299, 86, 'J', 'Saint John', 1),
(1300, 86, 'M', 'Saint Mark', 1),
(1301, 86, 'P', 'Saint Patrick', 1),
(1302, 86, 'C', 'Carriacou', 1),
(1303, 86, 'Q', 'Petit Martinique', 1),
(1304, 89, 'AV', 'Alta Verapaz', 1),
(1305, 89, 'BV', 'Baja Verapaz', 1),
(1306, 89, 'CM', 'Chimaltenango', 1),
(1307, 89, 'CQ', 'Chiquimula', 1),
(1308, 89, 'PE', 'El Peten', 1),
(1309, 89, 'PR', 'El Progreso', 1),
(1310, 89, 'QC', 'El Quiche', 1),
(1311, 89, 'ES', 'Escuintla', 1),
(1312, 89, 'GU', 'Guatemala', 1),
(1313, 89, 'HU', 'Huehuetenango', 1),
(1314, 89, 'IZ', 'Izabal', 1),
(1315, 89, 'JA', 'Jalapa', 1),
(1316, 89, 'JU', 'Jutiapa', 1),
(1317, 89, 'QZ', 'Quetzaltenango', 1),
(1318, 89, 'RE', 'Retalhuleu', 1),
(1319, 89, 'ST', 'Sacatepequez', 1),
(1320, 89, 'SM', 'San Marcos', 1),
(1321, 89, 'SR', 'Santa Rosa', 1),
(1322, 89, 'SO', 'Solola', 1),
(1323, 89, 'SU', 'Suchitepequez', 1),
(1324, 89, 'TO', 'Totonicapan', 1),
(1325, 89, 'ZA', 'Zacapa', 1),
(1326, 90, 'CNK', 'Conakry', 1),
(1327, 90, 'BYL', 'Beyla', 1),
(1328, 90, 'BFA', 'Boffa', 1),
(1329, 90, 'BOK', 'Boke', 1),
(1330, 90, 'COY', 'Coyah', 1),
(1331, 90, 'DBL', 'Dabola', 1),
(1332, 90, 'DLB', 'Dalaba', 1),
(1333, 90, 'DGR', 'Dinguiraye', 1),
(1334, 90, 'DBR', 'Dubreka', 1),
(1335, 90, 'FRN', 'Faranah', 1),
(1336, 90, 'FRC', 'Forecariah', 1),
(1337, 90, 'FRI', 'Fria', 1),
(1338, 90, 'GAO', 'Gaoual', 1),
(1339, 90, 'GCD', 'Gueckedou', 1),
(1340, 90, 'KNK', 'Kankan', 1),
(1341, 90, 'KRN', 'Kerouane', 1),
(1342, 90, 'KND', 'Kindia', 1),
(1343, 90, 'KSD', 'Kissidougou', 1),
(1344, 90, 'KBA', 'Koubia', 1),
(1345, 90, 'KDA', 'Koundara', 1),
(1346, 90, 'KRA', 'Kouroussa', 1),
(1347, 90, 'LAB', 'Labe', 1),
(1348, 90, 'LLM', 'Lelouma', 1),
(1349, 90, 'LOL', 'Lola', 1),
(1350, 90, 'MCT', 'Macenta', 1),
(1351, 90, 'MAL', 'Mali', 1),
(1352, 90, 'MAM', 'Mamou', 1),
(1353, 90, 'MAN', 'Mandiana', 1),
(1354, 90, 'NZR', 'Nzerekore', 1),
(1355, 90, 'PIT', 'Pita', 1),
(1356, 90, 'SIG', 'Siguiri', 1),
(1357, 90, 'TLM', 'Telimele', 1),
(1358, 90, 'TOG', 'Tougue', 1),
(1359, 90, 'YOM', 'Yomou', 1),
(1360, 91, 'BF', 'Bafata Region', 1),
(1361, 91, 'BB', 'Biombo Region', 1),
(1362, 91, 'BS', 'Bissau Region', 1),
(1363, 91, 'BL', 'Bolama Region', 1),
(1364, 91, 'CA', 'Cacheu Region', 1),
(1365, 91, 'GA', 'Gabu Region', 1),
(1366, 91, 'OI', 'Oio Region', 1),
(1367, 91, 'QU', 'Quinara Region', 1),
(1368, 91, 'TO', 'Tombali Region', 1),
(1369, 92, 'BW', 'Barima-Waini', 1),
(1370, 92, 'CM', 'Cuyuni-Mazaruni', 1),
(1371, 92, 'DM', 'Demerara-Mahaica', 1),
(1372, 92, 'EC', 'East Berbice-Corentyne', 1),
(1373, 92, 'EW', 'Essequibo Islands-West Demerara', 1),
(1374, 92, 'MB', 'Mahaica-Berbice', 1),
(1375, 92, 'PM', 'Pomeroon-Supenaam', 1),
(1376, 92, 'PI', 'Potaro-Siparuni', 1),
(1377, 92, 'UD', 'Upper Demerara-Berbice', 1),
(1378, 92, 'UT', 'Upper Takutu-Upper Essequibo', 1),
(1379, 93, 'AR', 'Artibonite', 1),
(1380, 93, 'CE', 'Centre', 1),
(1381, 93, 'GA', 'Grand''Anse', 1),
(1382, 93, 'ND', 'Nord', 1),
(1383, 93, 'NE', 'Nord-Est', 1),
(1384, 93, 'NO', 'Nord-Ouest', 1),
(1385, 93, 'OU', 'Ouest', 1),
(1386, 93, 'SD', 'Sud', 1),
(1387, 93, 'SE', 'Sud-Est', 1),
(1388, 94, 'F', 'Flat Island', 1),
(1389, 94, 'M', 'McDonald Island', 1),
(1390, 94, 'S', 'Shag Island', 1),
(1391, 94, 'H', 'Heard Island', 1),
(1392, 95, 'AT', 'Atlantida', 1),
(1393, 95, 'CH', 'Choluteca', 1),
(1394, 95, 'CL', 'Colon', 1),
(1395, 95, 'CM', 'Comayagua', 1),
(1396, 95, 'CP', 'Copan', 1),
(1397, 95, 'CR', 'Cortes', 1),
(1398, 95, 'PA', 'El Paraiso', 1),
(1399, 95, 'FM', 'Francisco Morazan', 1),
(1400, 95, 'GD', 'Gracias a Dios', 1),
(1401, 95, 'IN', 'Intibuca', 1),
(1402, 95, 'IB', 'Islas de la Bahia (Bay Islands)', 1),
(1403, 95, 'PZ', 'La Paz', 1),
(1404, 95, 'LE', 'Lempira', 1),
(1405, 95, 'OC', 'Ocotepeque', 1),
(1406, 95, 'OL', 'Olancho', 1),
(1407, 95, 'SB', 'Santa Barbara', 1),
(1408, 95, 'VA', 'Valle', 1),
(1409, 95, 'YO', 'Yoro', 1),
(1410, 96, 'HCW', 'Central and Western Hong Kong Island', 1),
(1411, 96, 'HEA', 'Eastern Hong Kong Island', 1),
(1412, 96, 'HSO', 'Southern Hong Kong Island', 1),
(1413, 96, 'HWC', 'Wan Chai Hong Kong Island', 1),
(1414, 96, 'KKC', 'Kowloon City Kowloon', 1),
(1415, 96, 'KKT', 'Kwun Tong Kowloon', 1),
(1416, 96, 'KSS', 'Sham Shui Po Kowloon', 1),
(1417, 96, 'KWT', 'Wong Tai Sin Kowloon', 1),
(1418, 96, 'KYT', 'Yau Tsim Mong Kowloon', 1),
(1419, 96, 'NIS', 'Islands New Territories', 1),
(1420, 96, 'NKT', 'Kwai Tsing New Territories', 1),
(1421, 96, 'NNO', 'North New Territories', 1),
(1422, 96, 'NSK', 'Sai Kung New Territories', 1),
(1423, 96, 'NST', 'Sha Tin New Territories', 1),
(1424, 96, 'NTP', 'Tai Po New Territories', 1),
(1425, 96, 'NTW', 'Tsuen Wan New Territories', 1),
(1426, 96, 'NTM', 'Tuen Mun New Territories', 1),
(1427, 96, 'NYL', 'Yuen Long New Territories', 1),
(1428, 97, 'BK', 'Bacs-Kiskun', 1),
(1429, 97, 'BA', 'Baranya', 1),
(1430, 97, 'BE', 'Bekes', 1),
(1431, 97, 'BS', 'Bekescsaba', 1),
(1432, 97, 'BZ', 'Borsod-Abauj-Zemplen', 1),
(1433, 97, 'BU', 'Budapest', 1),
(1434, 97, 'CS', 'Csongrad', 1),
(1435, 97, 'DE', 'Debrecen', 1),
(1436, 97, 'DU', 'Dunaujvaros', 1),
(1437, 97, 'EG', 'Eger', 1),
(1438, 97, 'FE', 'Fejer', 1),
(1439, 97, 'GY', 'Gyor', 1),
(1440, 97, 'GM', 'Gyor-Moson-Sopron', 1),
(1441, 97, 'HB', 'Hajdu-Bihar', 1),
(1442, 97, 'HE', 'Heves', 1),
(1443, 97, 'HO', 'Hodmezovasarhely', 1),
(1444, 97, 'JN', 'Jasz-Nagykun-Szolnok', 1),
(1445, 97, 'KA', 'Kaposvar', 1),
(1446, 97, 'KE', 'Kecskemet', 1),
(1447, 97, 'KO', 'Komarom-Esztergom', 1),
(1448, 97, 'MI', 'Miskolc', 1),
(1449, 97, 'NA', 'Nagykanizsa', 1),
(1450, 97, 'NO', 'Nograd', 1),
(1451, 97, 'NY', 'Nyiregyhaza', 1),
(1452, 97, 'PE', 'Pecs', 1),
(1453, 97, 'PS', 'Pest', 1),
(1454, 97, 'SO', 'Somogy', 1),
(1455, 97, 'SP', 'Sopron', 1),
(1456, 97, 'SS', 'Szabolcs-Szatmar-Bereg', 1),
(1457, 97, 'SZ', 'Szeged', 1),
(1458, 97, 'SE', 'Szekesfehervar', 1),
(1459, 97, 'SL', 'Szolnok', 1),
(1460, 97, 'SM', 'Szombathely', 1),
(1461, 97, 'TA', 'Tatabanya', 1),
(1462, 97, 'TO', 'Tolna', 1),
(1463, 97, 'VA', 'Vas', 1),
(1464, 97, 'VE', 'Veszprem', 1),
(1465, 97, 'ZA', 'Zala', 1),
(1466, 97, 'ZZ', 'Zalaegerszeg', 1),
(1467, 98, 'AL', 'Austurland', 1),
(1468, 98, 'HF', 'Hofuoborgarsvaeoi', 1),
(1469, 98, 'NE', 'Norourland eystra', 1),
(1470, 98, 'NV', 'Norourland vestra', 1),
(1471, 98, 'SL', 'Suourland', 1),
(1472, 98, 'SN', 'Suournes', 1),
(1473, 98, 'VF', 'Vestfiroir', 1),
(1474, 98, 'VL', 'Vesturland', 1),
(1475, 99, 'AN', 'Andaman and Nicobar Islands', 1),
(1476, 99, 'AP', 'Andhra Pradesh', 1),
(1477, 99, 'AR', 'Arunachal Pradesh', 1),
(1478, 99, 'AS', 'Assam', 1),
(1479, 99, 'BI', 'Bihar', 1),
(1480, 99, 'CH', 'Chandigarh', 1),
(1481, 99, 'DA', 'Dadra and Nagar Haveli', 1),
(1482, 99, 'DM', 'Daman and Diu', 1),
(1483, 99, 'DE', 'Delhi', 1),
(1484, 99, 'GO', 'Goa', 1),
(1485, 99, 'GU', 'Gujarat', 1),
(1486, 99, 'HA', 'Haryana', 1),
(1487, 99, 'HP', 'Himachal Pradesh', 1),
(1488, 99, 'JA', 'Jammu and Kashmir', 1),
(1489, 99, 'KA', 'Karnataka', 1),
(1490, 99, 'KE', 'Kerala', 1),
(1491, 99, 'LI', 'Lakshadweep Islands', 1),
(1492, 99, 'MP', 'Madhya Pradesh', 1),
(1493, 99, 'MA', 'Maharashtra', 1),
(1494, 99, 'MN', 'Manipur', 1),
(1495, 99, 'ME', 'Meghalaya', 1),
(1496, 99, 'MI', 'Mizoram', 1),
(1497, 99, 'NA', 'Nagaland', 1),
(1498, 99, 'OR', 'Orissa', 1),
(1499, 99, 'PO', 'Pondicherry', 1),
(1500, 99, 'PU', 'Punjab', 1),
(1501, 99, 'RA', 'Rajasthan', 1),
(1502, 99, 'SI', 'Sikkim', 1),
(1503, 99, 'TN', 'Tamil Nadu', 1),
(1504, 99, 'TR', 'Tripura', 1),
(1505, 99, 'UP', 'Uttar Pradesh', 1),
(1506, 99, 'WB', 'West Bengal', 1),
(1507, 100, 'AC', 'Aceh', 1),
(1508, 100, 'BA', 'Bali', 1),
(1509, 100, 'BT', 'Banten', 1),
(1510, 100, 'BE', 'Bengkulu', 1),
(1511, 100, 'BD', 'BoDeTaBek', 1),
(1512, 100, 'GO', 'Gorontalo', 1),
(1513, 100, 'JK', 'Jakarta Raya', 1),
(1514, 100, 'JA', 'Jambi', 1),
(1515, 100, 'JB', 'Jawa Barat', 1),
(1516, 100, 'JT', 'Jawa Tengah', 1),
(1517, 100, 'JI', 'Jawa Timur', 1),
(1518, 100, 'KB', 'Kalimantan Barat', 1),
(1519, 100, 'KS', 'Kalimantan Selatan', 1),
(1520, 100, 'KT', 'Kalimantan Tengah', 1),
(1521, 100, 'KI', 'Kalimantan Timur', 1),
(1522, 100, 'BB', 'Kepulauan Bangka Belitung', 1),
(1523, 100, 'LA', 'Lampung', 1),
(1524, 100, 'MA', 'Maluku', 1),
(1525, 100, 'MU', 'Maluku Utara', 1),
(1526, 100, 'NB', 'Nusa Tenggara Barat', 1),
(1527, 100, 'NT', 'Nusa Tenggara Timur', 1),
(1528, 100, 'PA', 'Papua', 1),
(1529, 100, 'RI', 'Riau', 1),
(1530, 100, 'SN', 'Sulawesi Selatan', 1),
(1531, 100, 'ST', 'Sulawesi Tengah', 1),
(1532, 100, 'SG', 'Sulawesi Tenggara', 1),
(1533, 100, 'SA', 'Sulawesi Utara', 1),
(1534, 100, 'SB', 'Sumatera Barat', 1),
(1535, 100, 'SS', 'Sumatera Selatan', 1);
INSERT INTO `i8a13_mijoshop_zone` (`zone_id`, `country_id`, `code`, `name`, `status`) VALUES
(1536, 100, 'SU', 'Sumatera Utara', 1),
(1537, 100, 'YO', 'Yogyakarta', 1),
(1538, 101, 'TEH', 'Tehran', 1),
(1539, 101, 'QOM', 'Qom', 1),
(1540, 101, 'MKZ', 'Markazi', 1),
(1541, 101, 'QAZ', 'Qazvin', 1),
(1542, 101, 'GIL', 'Gilan', 1),
(1543, 101, 'ARD', 'Ardabil', 1),
(1544, 101, 'ZAN', 'Zanjan', 1),
(1545, 101, 'EAZ', 'East Azarbaijan', 1),
(1546, 101, 'WEZ', 'West Azarbaijan', 1),
(1547, 101, 'KRD', 'Kurdistan', 1),
(1548, 101, 'HMD', 'Hamadan', 1),
(1549, 101, 'KRM', 'Kermanshah', 1),
(1550, 101, 'ILM', 'Ilam', 1),
(1551, 101, 'LRS', 'Lorestan', 1),
(1552, 101, 'KZT', 'Khuzestan', 1),
(1553, 101, 'CMB', 'Chahar Mahaal and Bakhtiari', 1),
(1554, 101, 'KBA', 'Kohkiluyeh and Buyer Ahmad', 1),
(1555, 101, 'BSH', 'Bushehr', 1),
(1556, 101, 'FAR', 'Fars', 1),
(1557, 101, 'HRM', 'Hormozgan', 1),
(1558, 101, 'SBL', 'Sistan and Baluchistan', 1),
(1559, 101, 'KRB', 'Kerman', 1),
(1560, 101, 'YZD', 'Yazd', 1),
(1561, 101, 'EFH', 'Esfahan', 1),
(1562, 101, 'SMN', 'Semnan', 1),
(1563, 101, 'MZD', 'Mazandaran', 1),
(1564, 101, 'GLS', 'Golestan', 1),
(1565, 101, 'NKH', 'North Khorasan', 1),
(1566, 101, 'RKH', 'Razavi Khorasan', 1),
(1567, 101, 'SKH', 'South Khorasan', 1),
(1568, 102, 'BD', 'Baghdad', 1),
(1569, 102, 'SD', 'Salah ad Din', 1),
(1570, 102, 'DY', 'Diyala', 1),
(1571, 102, 'WS', 'Wasit', 1),
(1572, 102, 'MY', 'Maysan', 1),
(1573, 102, 'BA', 'Al Basrah', 1),
(1574, 102, 'DQ', 'Dhi Qar', 1),
(1575, 102, 'MU', 'Al Muthanna', 1),
(1576, 102, 'QA', 'Al Qadisyah', 1),
(1577, 102, 'BB', 'Babil', 1),
(1578, 102, 'KB', 'Al Karbala', 1),
(1579, 102, 'NJ', 'An Najaf', 1),
(1580, 102, 'AB', 'Al Anbar', 1),
(1581, 102, 'NN', 'Ninawa', 1),
(1582, 102, 'DH', 'Dahuk', 1),
(1583, 102, 'AL', 'Arbil', 1),
(1584, 102, 'TM', 'At Ta''mim', 1),
(1585, 102, 'SL', 'As Sulaymaniyah', 1),
(1586, 103, 'CA', 'Carlow', 1),
(1587, 103, 'CV', 'Cavan', 1),
(1588, 103, 'CL', 'Clare', 1),
(1589, 103, 'CO', 'Cork', 1),
(1590, 103, 'DO', 'Donegal', 1),
(1591, 103, 'DU', 'Dublin', 1),
(1592, 103, 'GA', 'Galway', 1),
(1593, 103, 'KE', 'Kerry', 1),
(1594, 103, 'KI', 'Kildare', 1),
(1595, 103, 'KL', 'Kilkenny', 1),
(1596, 103, 'LA', 'Laois', 1),
(1597, 103, 'LE', 'Leitrim', 1),
(1598, 103, 'LI', 'Limerick', 1),
(1599, 103, 'LO', 'Longford', 1),
(1600, 103, 'LU', 'Louth', 1),
(1601, 103, 'MA', 'Mayo', 1),
(1602, 103, 'ME', 'Meath', 1),
(1603, 103, 'MO', 'Monaghan', 1),
(1604, 103, 'OF', 'Offaly', 1),
(1605, 103, 'RO', 'Roscommon', 1),
(1606, 103, 'SL', 'Sligo', 1),
(1607, 103, 'TI', 'Tipperary', 1),
(1608, 103, 'WA', 'Waterford', 1),
(1609, 103, 'WE', 'Westmeath', 1),
(1610, 103, 'WX', 'Wexford', 1),
(1611, 103, 'WI', 'Wicklow', 1),
(1612, 104, 'BS', 'Be''er Sheva', 1),
(1613, 104, 'BH', 'Bika''at Hayarden', 1),
(1614, 104, 'EA', 'Eilat and Arava', 1),
(1615, 104, 'GA', 'Galil', 1),
(1616, 104, 'HA', 'Haifa', 1),
(1617, 104, 'JM', 'Jehuda Mountains', 1),
(1618, 104, 'JE', 'Jerusalem', 1),
(1619, 104, 'NE', 'Negev', 1),
(1620, 104, 'SE', 'Semaria', 1),
(1621, 104, 'SH', 'Sharon', 1),
(1622, 104, 'TA', 'Tel Aviv (Gosh Dan)', 1),
(1643, 106, 'CLA', 'Clarendon Parish', 1),
(1644, 106, 'HAN', 'Hanover Parish', 1),
(1645, 106, 'KIN', 'Kingston Parish', 1),
(1646, 106, 'MAN', 'Manchester Parish', 1),
(1647, 106, 'POR', 'Portland Parish', 1),
(1648, 106, 'AND', 'Saint Andrew Parish', 1),
(1649, 106, 'ANN', 'Saint Ann Parish', 1),
(1650, 106, 'CAT', 'Saint Catherine Parish', 1),
(1651, 106, 'ELI', 'Saint Elizabeth Parish', 1),
(1652, 106, 'JAM', 'Saint James Parish', 1),
(1653, 106, 'MAR', 'Saint Mary Parish', 1),
(1654, 106, 'THO', 'Saint Thomas Parish', 1),
(1655, 106, 'TRL', 'Trelawny Parish', 1),
(1656, 106, 'WML', 'Westmoreland Parish', 1),
(1657, 107, 'AI', 'Aichi', 1),
(1658, 107, 'AK', 'Akita', 1),
(1659, 107, 'AO', 'Aomori', 1),
(1660, 107, 'CH', 'Chiba', 1),
(1661, 107, 'EH', 'Ehime', 1),
(1662, 107, 'FK', 'Fukui', 1),
(1663, 107, 'FU', 'Fukuoka', 1),
(1664, 107, 'FS', 'Fukushima', 1),
(1665, 107, 'GI', 'Gifu', 1),
(1666, 107, 'GU', 'Gumma', 1),
(1667, 107, 'HI', 'Hiroshima', 1),
(1668, 107, 'HO', 'Hokkaido', 1),
(1669, 107, 'HY', 'Hyogo', 1),
(1670, 107, 'IB', 'Ibaraki', 1),
(1671, 107, 'IS', 'Ishikawa', 1),
(1672, 107, 'IW', 'Iwate', 1),
(1673, 107, 'KA', 'Kagawa', 1),
(1674, 107, 'KG', 'Kagoshima', 1),
(1675, 107, 'KN', 'Kanagawa', 1),
(1676, 107, 'KO', 'Kochi', 1),
(1677, 107, 'KU', 'Kumamoto', 1),
(1678, 107, 'KY', 'Kyoto', 1),
(1679, 107, 'MI', 'Mie', 1),
(1680, 107, 'MY', 'Miyagi', 1),
(1681, 107, 'MZ', 'Miyazaki', 1),
(1682, 107, 'NA', 'Nagano', 1),
(1683, 107, 'NG', 'Nagasaki', 1),
(1684, 107, 'NR', 'Nara', 1),
(1685, 107, 'NI', 'Niigata', 1),
(1686, 107, 'OI', 'Oita', 1),
(1687, 107, 'OK', 'Okayama', 1),
(1688, 107, 'ON', 'Okinawa', 1),
(1689, 107, 'OS', 'Osaka', 1),
(1690, 107, 'SA', 'Saga', 1),
(1691, 107, 'SI', 'Saitama', 1),
(1692, 107, 'SH', 'Shiga', 1),
(1693, 107, 'SM', 'Shimane', 1),
(1694, 107, 'SZ', 'Shizuoka', 1),
(1695, 107, 'TO', 'Tochigi', 1),
(1696, 107, 'TS', 'Tokushima', 1),
(1697, 107, 'TK', 'Tokyo', 1),
(1698, 107, 'TT', 'Tottori', 1),
(1699, 107, 'TY', 'Toyama', 1),
(1700, 107, 'WA', 'Wakayama', 1),
(1701, 107, 'YA', 'Yamagata', 1),
(1702, 107, 'YM', 'Yamaguchi', 1),
(1703, 107, 'YN', 'Yamanashi', 1),
(1704, 108, 'AM', '''Amman', 1),
(1705, 108, 'AJ', 'Ajlun', 1),
(1706, 108, 'AA', 'Al ''Aqabah', 1),
(1707, 108, 'AB', 'Al Balqa''', 1),
(1708, 108, 'AK', 'Al Karak', 1),
(1709, 108, 'AL', 'Al Mafraq', 1),
(1710, 108, 'AT', 'At Tafilah', 1),
(1711, 108, 'AZ', 'Az Zarqa''', 1),
(1712, 108, 'IR', 'Irbid', 1),
(1713, 108, 'JA', 'Jarash', 1),
(1714, 108, 'MA', 'Ma''an', 1),
(1715, 108, 'MD', 'Madaba', 1),
(1716, 109, 'AL', 'Almaty', 1),
(1717, 109, 'AC', 'Almaty City', 1),
(1718, 109, 'AM', 'Aqmola', 1),
(1719, 109, 'AQ', 'Aqtobe', 1),
(1720, 109, 'AS', 'Astana City', 1),
(1721, 109, 'AT', 'Atyrau', 1),
(1722, 109, 'BA', 'Batys Qazaqstan', 1),
(1723, 109, 'BY', 'Bayqongyr City', 1),
(1724, 109, 'MA', 'Mangghystau', 1),
(1725, 109, 'ON', 'Ongtustik Qazaqstan', 1),
(1726, 109, 'PA', 'Pavlodar', 1),
(1727, 109, 'QA', 'Qaraghandy', 1),
(1728, 109, 'QO', 'Qostanay', 1),
(1729, 109, 'QY', 'Qyzylorda', 1),
(1730, 109, 'SH', 'Shyghys Qazaqstan', 1),
(1731, 109, 'SO', 'Soltustik Qazaqstan', 1),
(1732, 109, 'ZH', 'Zhambyl', 1),
(1733, 110, 'CE', 'Central', 1),
(1734, 110, 'CO', 'Coast', 1),
(1735, 110, 'EA', 'Eastern', 1),
(1736, 110, 'NA', 'Nairobi Area', 1),
(1737, 110, 'NE', 'North Eastern', 1),
(1738, 110, 'NY', 'Nyanza', 1),
(1739, 110, 'RV', 'Rift Valley', 1),
(1740, 110, 'WE', 'Western', 1),
(1741, 111, 'AG', 'Abaiang', 1),
(1742, 111, 'AM', 'Abemama', 1),
(1743, 111, 'AK', 'Aranuka', 1),
(1744, 111, 'AO', 'Arorae', 1),
(1745, 111, 'BA', 'Banaba', 1),
(1746, 111, 'BE', 'Beru', 1),
(1747, 111, 'bT', 'Butaritari', 1),
(1748, 111, 'KA', 'Kanton', 1),
(1749, 111, 'KR', 'Kiritimati', 1),
(1750, 111, 'KU', 'Kuria', 1),
(1751, 111, 'MI', 'Maiana', 1),
(1752, 111, 'MN', 'Makin', 1),
(1753, 111, 'ME', 'Marakei', 1),
(1754, 111, 'NI', 'Nikunau', 1),
(1755, 111, 'NO', 'Nonouti', 1),
(1756, 111, 'ON', 'Onotoa', 1),
(1757, 111, 'TT', 'Tabiteuea', 1),
(1758, 111, 'TR', 'Tabuaeran', 1),
(1759, 111, 'TM', 'Tamana', 1),
(1760, 111, 'TW', 'Tarawa', 1),
(1761, 111, 'TE', 'Teraina', 1),
(1762, 112, 'CHA', 'Chagang-do', 1),
(1763, 112, 'HAB', 'Hamgyong-bukto', 1),
(1764, 112, 'HAN', 'Hamgyong-namdo', 1),
(1765, 112, 'HWB', 'Hwanghae-bukto', 1),
(1766, 112, 'HWN', 'Hwanghae-namdo', 1),
(1767, 112, 'KAN', 'Kangwon-do', 1),
(1768, 112, 'PYB', 'P''yongan-bukto', 1),
(1769, 112, 'PYN', 'P''yongan-namdo', 1),
(1770, 112, 'YAN', 'Ryanggang-do (Yanggang-do)', 1),
(1771, 112, 'NAJ', 'Rason Directly Governed City', 1),
(1772, 112, 'PYO', 'P''yongyang Special City', 1),
(1773, 113, 'CO', 'Ch''ungch''ong-bukto', 1),
(1774, 113, 'CH', 'Ch''ungch''ong-namdo', 1),
(1775, 113, 'CD', 'Cheju-do', 1),
(1776, 113, 'CB', 'Cholla-bukto', 1),
(1777, 113, 'CN', 'Cholla-namdo', 1),
(1778, 113, 'IG', 'Inch''on-gwangyoksi', 1),
(1779, 113, 'KA', 'Kangwon-do', 1),
(1780, 113, 'KG', 'Kwangju-gwangyoksi', 1),
(1781, 113, 'KD', 'Kyonggi-do', 1),
(1782, 113, 'KB', 'Kyongsang-bukto', 1),
(1783, 113, 'KN', 'Kyongsang-namdo', 1),
(1784, 113, 'PG', 'Pusan-gwangyoksi', 1),
(1785, 113, 'SO', 'Soul-t''ukpyolsi', 1),
(1786, 113, 'TA', 'Taegu-gwangyoksi', 1),
(1787, 113, 'TG', 'Taejon-gwangyoksi', 1),
(1788, 114, 'AL', 'Al ''Asimah', 1),
(1789, 114, 'AA', 'Al Ahmadi', 1),
(1790, 114, 'AF', 'Al Farwaniyah', 1),
(1791, 114, 'AJ', 'Al Jahra''', 1),
(1792, 114, 'HA', 'Hawalli', 1),
(1793, 115, 'GB', 'Bishkek', 1),
(1794, 115, 'B', 'Batken', 1),
(1795, 115, 'C', 'Chu', 1),
(1796, 115, 'J', 'Jalal-Abad', 1),
(1797, 115, 'N', 'Naryn', 1),
(1798, 115, 'O', 'Osh', 1),
(1799, 115, 'T', 'Talas', 1),
(1800, 115, 'Y', 'Ysyk-Kol', 1),
(1801, 116, 'VT', 'Vientiane', 1),
(1802, 116, 'AT', 'Attapu', 1),
(1803, 116, 'BK', 'Bokeo', 1),
(1804, 116, 'BL', 'Bolikhamxai', 1),
(1805, 116, 'CH', 'Champasak', 1),
(1806, 116, 'HO', 'Houaphan', 1),
(1807, 116, 'KH', 'Khammouan', 1),
(1808, 116, 'LM', 'Louang Namtha', 1),
(1809, 116, 'LP', 'Louangphabang', 1),
(1810, 116, 'OU', 'Oudomxai', 1),
(1811, 116, 'PH', 'Phongsali', 1),
(1812, 116, 'SL', 'Salavan', 1),
(1813, 116, 'SV', 'Savannakhet', 1),
(1814, 116, 'VI', 'Vientiane', 1),
(1815, 116, 'XA', 'Xaignabouli', 1),
(1816, 116, 'XE', 'Xekong', 1),
(1817, 116, 'XI', 'Xiangkhoang', 1),
(1818, 116, 'XN', 'Xaisomboun', 1),
(1819, 117, 'AIZ', 'Aizkraukles Rajons', 1),
(1820, 117, 'ALU', 'Aluksnes Rajons', 1),
(1821, 117, 'BAL', 'Balvu Rajons', 1),
(1822, 117, 'BAU', 'Bauskas Rajons', 1),
(1823, 117, 'CES', 'Cesu Rajons', 1),
(1824, 117, 'DGR', 'Daugavpils Rajons', 1),
(1825, 117, 'DOB', 'Dobeles Rajons', 1),
(1826, 117, 'GUL', 'Gulbenes Rajons', 1),
(1827, 117, 'JEK', 'Jekabpils Rajons', 1),
(1828, 117, 'JGR', 'Jelgavas Rajons', 1),
(1829, 117, 'KRA', 'Kraslavas Rajons', 1),
(1830, 117, 'KUL', 'Kuldigas Rajons', 1),
(1831, 117, 'LPR', 'Liepajas Rajons', 1),
(1832, 117, 'LIM', 'Limbazu Rajons', 1),
(1833, 117, 'LUD', 'Ludzas Rajons', 1),
(1834, 117, 'MAD', 'Madonas Rajons', 1),
(1835, 117, 'OGR', 'Ogres Rajons', 1),
(1836, 117, 'PRE', 'Preilu Rajons', 1),
(1837, 117, 'RZR', 'Rezeknes Rajons', 1),
(1838, 117, 'RGR', 'Rigas Rajons', 1),
(1839, 117, 'SAL', 'Saldus Rajons', 1),
(1840, 117, 'TAL', 'Talsu Rajons', 1),
(1841, 117, 'TUK', 'Tukuma Rajons', 1),
(1842, 117, 'VLK', 'Valkas Rajons', 1),
(1843, 117, 'VLM', 'Valmieras Rajons', 1),
(1844, 117, 'VSR', 'Ventspils Rajons', 1),
(1845, 117, 'DGV', 'Daugavpils', 1),
(1846, 117, 'JGV', 'Jelgava', 1),
(1847, 117, 'JUR', 'Jurmala', 1),
(1848, 117, 'LPK', 'Liepaja', 1),
(1849, 117, 'RZK', 'Rezekne', 1),
(1850, 117, 'RGA', 'Riga', 1),
(1851, 117, 'VSL', 'Ventspils', 1),
(1852, 119, 'BE', 'Berea', 1),
(1853, 119, 'BB', 'Butha-Buthe', 1),
(1854, 119, 'LE', 'Leribe', 1),
(1855, 119, 'MF', 'Mafeteng', 1),
(1856, 119, 'MS', 'Maseru', 1),
(1857, 119, 'MH', 'Mohale''s Hoek', 1),
(1858, 119, 'MK', 'Mokhotlong', 1),
(1859, 119, 'QN', 'Qacha''s Nek', 1),
(1860, 119, 'QT', 'Quthing', 1),
(1861, 119, 'TT', 'Thaba-Tseka', 1),
(1862, 120, 'BI', 'Bomi', 1),
(1863, 120, 'BG', 'Bong', 1),
(1864, 120, 'GB', 'Grand Bassa', 1),
(1865, 120, 'CM', 'Grand Cape Mount', 1),
(1866, 120, 'GG', 'Grand Gedeh', 1),
(1867, 120, 'GK', 'Grand Kru', 1),
(1868, 120, 'LO', 'Lofa', 1),
(1869, 120, 'MG', 'Margibi', 1),
(1870, 120, 'ML', 'Maryland', 1),
(1871, 120, 'MS', 'Montserrado', 1),
(1872, 120, 'NB', 'Nimba', 1),
(1873, 120, 'RC', 'River Cess', 1),
(1874, 120, 'SN', 'Sinoe', 1),
(1875, 121, 'AJ', 'Ajdabiya', 1),
(1876, 121, 'AZ', 'Al ''Aziziyah', 1),
(1877, 121, 'FA', 'Al Fatih', 1),
(1878, 121, 'JA', 'Al Jabal al Akhdar', 1),
(1879, 121, 'JU', 'Al Jufrah', 1),
(1880, 121, 'KH', 'Al Khums', 1),
(1881, 121, 'KU', 'Al Kufrah', 1),
(1882, 121, 'NK', 'An Nuqat al Khams', 1),
(1883, 121, 'AS', 'Ash Shati''', 1),
(1884, 121, 'AW', 'Awbari', 1),
(1885, 121, 'ZA', 'Az Zawiyah', 1),
(1886, 121, 'BA', 'Banghazi', 1),
(1887, 121, 'DA', 'Darnah', 1),
(1888, 121, 'GD', 'Ghadamis', 1),
(1889, 121, 'GY', 'Gharyan', 1),
(1890, 121, 'MI', 'Misratah', 1),
(1891, 121, 'MZ', 'Murzuq', 1),
(1892, 121, 'SB', 'Sabha', 1),
(1893, 121, 'SW', 'Sawfajjin', 1),
(1894, 121, 'SU', 'Surt', 1),
(1895, 121, 'TL', 'Tarabulus (Tripoli)', 1),
(1896, 121, 'TH', 'Tarhunah', 1),
(1897, 121, 'TU', 'Tubruq', 1),
(1898, 121, 'YA', 'Yafran', 1),
(1899, 121, 'ZL', 'Zlitan', 1),
(1900, 122, 'V', 'Vaduz', 1),
(1901, 122, 'A', 'Schaan', 1),
(1902, 122, 'B', 'Balzers', 1),
(1903, 122, 'N', 'Triesen', 1),
(1904, 122, 'E', 'Eschen', 1),
(1905, 122, 'M', 'Mauren', 1),
(1906, 122, 'T', 'Triesenberg', 1),
(1907, 122, 'R', 'Ruggell', 1),
(1908, 122, 'G', 'Gamprin', 1),
(1909, 122, 'L', 'Schellenberg', 1),
(1910, 122, 'P', 'Planken', 1),
(1911, 123, 'AL', 'Alytus', 1),
(1912, 123, 'KA', 'Kaunas', 1),
(1913, 123, 'KL', 'Klaipeda', 1),
(1914, 123, 'MA', 'Marijampole', 1),
(1915, 123, 'PA', 'Panevezys', 1),
(1916, 123, 'SI', 'Siauliai', 1),
(1917, 123, 'TA', 'Taurage', 1),
(1918, 123, 'TE', 'Telsiai', 1),
(1919, 123, 'UT', 'Utena', 1),
(1920, 123, 'VI', 'Vilnius', 1),
(1921, 124, 'DD', 'Diekirch', 1),
(1922, 124, 'DC', 'Clervaux', 1),
(1923, 124, 'DR', 'Redange', 1),
(1924, 124, 'DV', 'Vianden', 1),
(1925, 124, 'DW', 'Wiltz', 1),
(1926, 124, 'GG', 'Grevenmacher', 1),
(1927, 124, 'GE', 'Echternach', 1),
(1928, 124, 'GR', 'Remich', 1),
(1929, 124, 'LL', 'Luxembourg', 1),
(1930, 124, 'LC', 'Capellen', 1),
(1931, 124, 'LE', 'Esch-sur-Alzette', 1),
(1932, 124, 'LM', 'Mersch', 1),
(1933, 125, 'OLF', 'Our Lady Fatima Parish', 1),
(1934, 125, 'ANT', 'St. Anthony Parish', 1),
(1935, 125, 'LAZ', 'St. Lazarus Parish', 1),
(1936, 125, 'CAT', 'Cathedral Parish', 1),
(1937, 125, 'LAW', 'St. Lawrence Parish', 1),
(1938, 127, 'AN', 'Antananarivo', 1),
(1939, 127, 'AS', 'Antsiranana', 1),
(1940, 127, 'FN', 'Fianarantsoa', 1),
(1941, 127, 'MJ', 'Mahajanga', 1),
(1942, 127, 'TM', 'Toamasina', 1),
(1943, 127, 'TL', 'Toliara', 1),
(1944, 128, 'BLK', 'Balaka', 1),
(1945, 128, 'BLT', 'Blantyre', 1),
(1946, 128, 'CKW', 'Chikwawa', 1),
(1947, 128, 'CRD', 'Chiradzulu', 1),
(1948, 128, 'CTP', 'Chitipa', 1),
(1949, 128, 'DDZ', 'Dedza', 1),
(1950, 128, 'DWA', 'Dowa', 1),
(1951, 128, 'KRG', 'Karonga', 1),
(1952, 128, 'KSG', 'Kasungu', 1),
(1953, 128, 'LKM', 'Likoma', 1),
(1954, 128, 'LLG', 'Lilongwe', 1),
(1955, 128, 'MCG', 'Machinga', 1),
(1956, 128, 'MGC', 'Mangochi', 1),
(1957, 128, 'MCH', 'Mchinji', 1),
(1958, 128, 'MLJ', 'Mulanje', 1),
(1959, 128, 'MWZ', 'Mwanza', 1),
(1960, 128, 'MZM', 'Mzimba', 1),
(1961, 128, 'NTU', 'Ntcheu', 1),
(1962, 128, 'NKB', 'Nkhata Bay', 1),
(1963, 128, 'NKH', 'Nkhotakota', 1),
(1964, 128, 'NSJ', 'Nsanje', 1),
(1965, 128, 'NTI', 'Ntchisi', 1),
(1966, 128, 'PHL', 'Phalombe', 1),
(1967, 128, 'RMP', 'Rumphi', 1),
(1968, 128, 'SLM', 'Salima', 1),
(1969, 128, 'THY', 'Thyolo', 1),
(1970, 128, 'ZBA', 'Zomba', 1),
(1971, 129, 'MY-01', 'Johor', 1),
(1972, 129, 'MY-02', 'Kedah', 1),
(1973, 129, 'MY-03', 'Kelantan', 1),
(1974, 129, 'MY-15', 'Labuan', 1),
(1975, 129, 'MY-04', 'Melaka', 1),
(1976, 129, 'MY-05', 'Negeri Sembilan', 1),
(1977, 129, 'MY-06', 'Pahang', 1),
(1978, 129, 'MY-08', 'Perak', 1),
(1979, 129, 'MY-09', 'Perlis', 1),
(1980, 129, 'MY-07', 'Pulau Pinang', 1),
(1981, 129, 'MY-12', 'Sabah', 1),
(1982, 129, 'MY-13', 'Sarawak', 1),
(1983, 129, 'MY-10', 'Selangor', 1),
(1984, 129, 'MY-11', 'Terengganu', 1),
(1985, 129, 'MY-14', 'Kuala Lumpur', 1),
(1986, 130, 'THU', 'Thiladhunmathi Uthuru', 1),
(1987, 130, 'THD', 'Thiladhunmathi Dhekunu', 1),
(1988, 130, 'MLU', 'Miladhunmadulu Uthuru', 1),
(1989, 130, 'MLD', 'Miladhunmadulu Dhekunu', 1),
(1990, 130, 'MAU', 'Maalhosmadulu Uthuru', 1),
(1991, 130, 'MAD', 'Maalhosmadulu Dhekunu', 1),
(1992, 130, 'FAA', 'Faadhippolhu', 1),
(1993, 130, 'MAA', 'Male Atoll', 1),
(1994, 130, 'AAU', 'Ari Atoll Uthuru', 1),
(1995, 130, 'AAD', 'Ari Atoll Dheknu', 1),
(1996, 130, 'FEA', 'Felidhe Atoll', 1),
(1997, 130, 'MUA', 'Mulaku Atoll', 1),
(1998, 130, 'NAU', 'Nilandhe Atoll Uthuru', 1),
(1999, 130, 'NAD', 'Nilandhe Atoll Dhekunu', 1),
(2000, 130, 'KLH', 'Kolhumadulu', 1),
(2001, 130, 'HDH', 'Hadhdhunmathi', 1),
(2002, 130, 'HAU', 'Huvadhu Atoll Uthuru', 1),
(2003, 130, 'HAD', 'Huvadhu Atoll Dhekunu', 1),
(2004, 130, 'FMU', 'Fua Mulaku', 1),
(2005, 130, 'ADD', 'Addu', 1),
(2006, 131, 'GA', 'Gao', 1),
(2007, 131, 'KY', 'Kayes', 1),
(2008, 131, 'KD', 'Kidal', 1),
(2009, 131, 'KL', 'Koulikoro', 1),
(2010, 131, 'MP', 'Mopti', 1),
(2011, 131, 'SG', 'Segou', 1),
(2012, 131, 'SK', 'Sikasso', 1),
(2013, 131, 'TB', 'Tombouctou', 1),
(2014, 131, 'CD', 'Bamako Capital District', 1),
(2015, 132, 'ATT', 'Attard', 1),
(2016, 132, 'BAL', 'Balzan', 1),
(2017, 132, 'BGU', 'Birgu', 1),
(2018, 132, 'BKK', 'Birkirkara', 1),
(2019, 132, 'BRZ', 'Birzebbuga', 1),
(2020, 132, 'BOR', 'Bormla', 1),
(2021, 132, 'DIN', 'Dingli', 1),
(2022, 132, 'FGU', 'Fgura', 1),
(2023, 132, 'FLO', 'Floriana', 1),
(2024, 132, 'GDJ', 'Gudja', 1),
(2025, 132, 'GZR', 'Gzira', 1),
(2026, 132, 'GRG', 'Gargur', 1),
(2027, 132, 'GXQ', 'Gaxaq', 1),
(2028, 132, 'HMR', 'Hamrun', 1),
(2029, 132, 'IKL', 'Iklin', 1),
(2030, 132, 'ISL', 'Isla', 1),
(2031, 132, 'KLK', 'Kalkara', 1),
(2032, 132, 'KRK', 'Kirkop', 1),
(2033, 132, 'LIJ', 'Lija', 1),
(2034, 132, 'LUQ', 'Luqa', 1),
(2035, 132, 'MRS', 'Marsa', 1),
(2036, 132, 'MKL', 'Marsaskala', 1),
(2037, 132, 'MXL', 'Marsaxlokk', 1),
(2038, 132, 'MDN', 'Mdina', 1),
(2039, 132, 'MEL', 'Melliea', 1),
(2040, 132, 'MGR', 'Mgarr', 1),
(2041, 132, 'MST', 'Mosta', 1),
(2042, 132, 'MQA', 'Mqabba', 1),
(2043, 132, 'MSI', 'Msida', 1),
(2044, 132, 'MTF', 'Mtarfa', 1),
(2045, 132, 'NAX', 'Naxxar', 1),
(2046, 132, 'PAO', 'Paola', 1),
(2047, 132, 'PEM', 'Pembroke', 1),
(2048, 132, 'PIE', 'Pieta', 1),
(2049, 132, 'QOR', 'Qormi', 1),
(2050, 132, 'QRE', 'Qrendi', 1),
(2051, 132, 'RAB', 'Rabat', 1),
(2052, 132, 'SAF', 'Safi', 1),
(2053, 132, 'SGI', 'San Giljan', 1),
(2054, 132, 'SLU', 'Santa Lucija', 1),
(2055, 132, 'SPB', 'San Pawl il-Bahar', 1),
(2056, 132, 'SGW', 'San Gwann', 1),
(2057, 132, 'SVE', 'Santa Venera', 1),
(2058, 132, 'SIG', 'Siggiewi', 1),
(2059, 132, 'SLM', 'Sliema', 1),
(2060, 132, 'SWQ', 'Swieqi', 1),
(2061, 132, 'TXB', 'Ta Xbiex', 1),
(2062, 132, 'TRX', 'Tarxien', 1),
(2063, 132, 'VLT', 'Valletta', 1),
(2064, 132, 'XGJ', 'Xgajra', 1),
(2065, 132, 'ZBR', 'Zabbar', 1),
(2066, 132, 'ZBG', 'Zebbug', 1),
(2067, 132, 'ZJT', 'Zejtun', 1),
(2068, 132, 'ZRQ', 'Zurrieq', 1),
(2069, 132, 'FNT', 'Fontana', 1),
(2070, 132, 'GHJ', 'Ghajnsielem', 1),
(2071, 132, 'GHR', 'Gharb', 1),
(2072, 132, 'GHS', 'Ghasri', 1),
(2073, 132, 'KRC', 'Kercem', 1),
(2074, 132, 'MUN', 'Munxar', 1),
(2075, 132, 'NAD', 'Nadur', 1),
(2076, 132, 'QAL', 'Qala', 1),
(2077, 132, 'VIC', 'Victoria', 1),
(2078, 132, 'SLA', 'San Lawrenz', 1),
(2079, 132, 'SNT', 'Sannat', 1),
(2080, 132, 'ZAG', 'Xagra', 1),
(2081, 132, 'XEW', 'Xewkija', 1),
(2082, 132, 'ZEB', 'Zebbug', 1),
(2083, 133, 'ALG', 'Ailinginae', 1),
(2084, 133, 'ALL', 'Ailinglaplap', 1),
(2085, 133, 'ALK', 'Ailuk', 1),
(2086, 133, 'ARN', 'Arno', 1),
(2087, 133, 'AUR', 'Aur', 1),
(2088, 133, 'BKR', 'Bikar', 1),
(2089, 133, 'BKN', 'Bikini', 1),
(2090, 133, 'BKK', 'Bokak', 1),
(2091, 133, 'EBN', 'Ebon', 1),
(2092, 133, 'ENT', 'Enewetak', 1),
(2093, 133, 'EKB', 'Erikub', 1),
(2094, 133, 'JBT', 'Jabat', 1),
(2095, 133, 'JLT', 'Jaluit', 1),
(2096, 133, 'JEM', 'Jemo', 1),
(2097, 133, 'KIL', 'Kili', 1),
(2098, 133, 'KWJ', 'Kwajalein', 1),
(2099, 133, 'LAE', 'Lae', 1),
(2100, 133, 'LIB', 'Lib', 1),
(2101, 133, 'LKP', 'Likiep', 1),
(2102, 133, 'MJR', 'Majuro', 1),
(2103, 133, 'MLP', 'Maloelap', 1),
(2104, 133, 'MJT', 'Mejit', 1),
(2105, 133, 'MIL', 'Mili', 1),
(2106, 133, 'NMK', 'Namorik', 1),
(2107, 133, 'NAM', 'Namu', 1),
(2108, 133, 'RGL', 'Rongelap', 1),
(2109, 133, 'RGK', 'Rongrik', 1),
(2110, 133, 'TOK', 'Toke', 1),
(2111, 133, 'UJA', 'Ujae', 1),
(2112, 133, 'UJL', 'Ujelang', 1),
(2113, 133, 'UTK', 'Utirik', 1),
(2114, 133, 'WTH', 'Wotho', 1),
(2115, 133, 'WTJ', 'Wotje', 1),
(2116, 135, 'AD', 'Adrar', 1),
(2117, 135, 'AS', 'Assaba', 1),
(2118, 135, 'BR', 'Brakna', 1),
(2119, 135, 'DN', 'Dakhlet Nouadhibou', 1),
(2120, 135, 'GO', 'Gorgol', 1),
(2121, 135, 'GM', 'Guidimaka', 1),
(2122, 135, 'HC', 'Hodh Ech Chargui', 1),
(2123, 135, 'HG', 'Hodh El Gharbi', 1),
(2124, 135, 'IN', 'Inchiri', 1),
(2125, 135, 'TA', 'Tagant', 1),
(2126, 135, 'TZ', 'Tiris Zemmour', 1),
(2127, 135, 'TR', 'Trarza', 1),
(2128, 135, 'NO', 'Nouakchott', 1),
(2129, 136, 'BR', 'Beau Bassin-Rose Hill', 1),
(2130, 136, 'CU', 'Curepipe', 1),
(2131, 136, 'PU', 'Port Louis', 1),
(2132, 136, 'QB', 'Quatre Bornes', 1),
(2133, 136, 'VP', 'Vacoas-Phoenix', 1),
(2134, 136, 'AG', 'Agalega Islands', 1),
(2135, 136, 'CC', 'Cargados Carajos Shoals (Saint Brandon Islands)', 1),
(2136, 136, 'RO', 'Rodrigues', 1),
(2137, 136, 'BL', 'Black River', 1),
(2138, 136, 'FL', 'Flacq', 1),
(2139, 136, 'GP', 'Grand Port', 1),
(2140, 136, 'MO', 'Moka', 1),
(2141, 136, 'PA', 'Pamplemousses', 1),
(2142, 136, 'PW', 'Plaines Wilhems', 1),
(2143, 136, 'PL', 'Port Louis', 1),
(2144, 136, 'RR', 'Riviere du Rempart', 1),
(2145, 136, 'SA', 'Savanne', 1),
(2146, 138, 'BN', 'Baja California Norte', 1),
(2147, 138, 'BS', 'Baja California Sur', 1),
(2148, 138, 'CA', 'Campeche', 1),
(2149, 138, 'CI', 'Chiapas', 1),
(2150, 138, 'CH', 'Chihuahua', 1),
(2151, 138, 'CZ', 'Coahuila de Zaragoza', 1),
(2152, 138, 'CL', 'Colima', 1),
(2153, 138, 'DF', 'Distrito Federal', 1),
(2154, 138, 'DU', 'Durango', 1),
(2155, 138, 'GA', 'Guanajuato', 1),
(2156, 138, 'GE', 'Guerrero', 1),
(2157, 138, 'HI', 'Hidalgo', 1),
(2158, 138, 'JA', 'Jalisco', 1),
(2159, 138, 'ME', 'Mexico', 1),
(2160, 138, 'MI', 'Michoacan de Ocampo', 1),
(2161, 138, 'MO', 'Morelos', 1),
(2162, 138, 'NA', 'Nayarit', 1),
(2163, 138, 'NL', 'Nuevo Leon', 1),
(2164, 138, 'OA', 'Oaxaca', 1),
(2165, 138, 'PU', 'Puebla', 1),
(2166, 138, 'QA', 'Queretaro de Arteaga', 1),
(2167, 138, 'QR', 'Quintana Roo', 1),
(2168, 138, 'SA', 'San Luis Potosi', 1),
(2169, 138, 'SI', 'Sinaloa', 1),
(2170, 138, 'SO', 'Sonora', 1),
(2171, 138, 'TB', 'Tabasco', 1),
(2172, 138, 'TM', 'Tamaulipas', 1),
(2173, 138, 'TL', 'Tlaxcala', 1),
(2174, 138, 'VE', 'Veracruz-Llave', 1),
(2175, 138, 'YU', 'Yucatan', 1),
(2176, 138, 'ZA', 'Zacatecas', 1),
(2177, 139, 'C', 'Chuuk', 1),
(2178, 139, 'K', 'Kosrae', 1),
(2179, 139, 'P', 'Pohnpei', 1),
(2180, 139, 'Y', 'Yap', 1),
(2181, 140, 'GA', 'Gagauzia', 1),
(2182, 140, 'CU', 'Chisinau', 1),
(2183, 140, 'BA', 'Balti', 1),
(2184, 140, 'CA', 'Cahul', 1),
(2185, 140, 'ED', 'Edinet', 1),
(2186, 140, 'LA', 'Lapusna', 1),
(2187, 140, 'OR', 'Orhei', 1),
(2188, 140, 'SO', 'Soroca', 1),
(2189, 140, 'TI', 'Tighina', 1),
(2190, 140, 'UN', 'Ungheni', 1),
(2191, 140, 'SN', 'St‚nga Nistrului', 1),
(2192, 141, 'FV', 'Fontvieille', 1),
(2193, 141, 'LC', 'La Condamine', 1),
(2194, 141, 'MV', 'Monaco-Ville', 1),
(2195, 141, 'MC', 'Monte-Carlo', 1),
(2196, 142, '1', 'Ulanbaatar', 1),
(2197, 142, '035', 'Orhon', 1),
(2198, 142, '037', 'Darhan uul', 1),
(2199, 142, '039', 'Hentiy', 1),
(2200, 142, '041', 'Hovsgol', 1),
(2201, 142, '043', 'Hovd', 1),
(2202, 142, '046', 'Uvs', 1),
(2203, 142, '047', 'Tov', 1),
(2204, 142, '049', 'Selenge', 1),
(2205, 142, '051', 'Suhbaatar', 1),
(2206, 142, '053', 'Omnogovi', 1),
(2207, 142, '055', 'Ovorhangay', 1),
(2208, 142, '057', 'Dzavhan', 1),
(2209, 142, '059', 'DundgovL', 1),
(2210, 142, '061', 'Dornod', 1),
(2211, 142, '063', 'Dornogov', 1),
(2212, 142, '064', 'Govi-Sumber', 1),
(2213, 142, '065', 'Govi-Altay', 1),
(2214, 142, '067', 'Bulgan', 1),
(2215, 142, '069', 'Bayanhongor', 1),
(2216, 142, '071', 'Bayan-Olgiy', 1),
(2217, 142, '073', 'Arhangay', 1),
(2218, 143, 'A', 'Saint Anthony', 1),
(2219, 143, 'G', 'Saint Georges', 1),
(2220, 143, 'P', 'Saint Peter', 1),
(2221, 144, 'AGD', 'Agadir', 1),
(2222, 144, 'HOC', 'Al Hoceima', 1),
(2223, 144, 'AZI', 'Azilal', 1),
(2224, 144, 'BME', 'Beni Mellal', 1),
(2225, 144, 'BSL', 'Ben Slimane', 1),
(2226, 144, 'BLM', 'Boulemane', 1),
(2227, 144, 'CBL', 'Casablanca', 1),
(2228, 144, 'CHA', 'Chaouen', 1),
(2229, 144, 'EJA', 'El Jadida', 1),
(2230, 144, 'EKS', 'El Kelaa des Sraghna', 1),
(2231, 144, 'ERA', 'Er Rachidia', 1),
(2232, 144, 'ESS', 'Essaouira', 1),
(2233, 144, 'FES', 'Fes', 1),
(2234, 144, 'FIG', 'Figuig', 1),
(2235, 144, 'GLM', 'Guelmim', 1),
(2236, 144, 'IFR', 'Ifrane', 1),
(2237, 144, 'KEN', 'Kenitra', 1),
(2238, 144, 'KHM', 'Khemisset', 1),
(2239, 144, 'KHN', 'Khenifra', 1),
(2240, 144, 'KHO', 'Khouribga', 1),
(2241, 144, 'LYN', 'Laayoune', 1),
(2242, 144, 'LAR', 'Larache', 1),
(2243, 144, 'MRK', 'Marrakech', 1),
(2244, 144, 'MKN', 'Meknes', 1),
(2245, 144, 'NAD', 'Nador', 1),
(2246, 144, 'ORZ', 'Ouarzazate', 1),
(2247, 144, 'OUJ', 'Oujda', 1),
(2248, 144, 'RSA', 'Rabat-Sale', 1),
(2249, 144, 'SAF', 'Safi', 1),
(2250, 144, 'SET', 'Settat', 1),
(2251, 144, 'SKA', 'Sidi Kacem', 1),
(2252, 144, 'TGR', 'Tangier', 1),
(2253, 144, 'TAN', 'Tan-Tan', 1),
(2254, 144, 'TAO', 'Taounate', 1),
(2255, 144, 'TRD', 'Taroudannt', 1),
(2256, 144, 'TAT', 'Tata', 1),
(2257, 144, 'TAZ', 'Taza', 1),
(2258, 144, 'TET', 'Tetouan', 1),
(2259, 144, 'TIZ', 'Tiznit', 1),
(2260, 144, 'ADK', 'Ad Dakhla', 1),
(2261, 144, 'BJD', 'Boujdour', 1),
(2262, 144, 'ESM', 'Es Smara', 1),
(2263, 145, 'CD', 'Cabo Delgado', 1),
(2264, 145, 'GZ', 'Gaza', 1),
(2265, 145, 'IN', 'Inhambane', 1),
(2266, 145, 'MN', 'Manica', 1),
(2267, 145, 'MC', 'Maputo (city)', 1),
(2268, 145, 'MP', 'Maputo', 1),
(2269, 145, 'NA', 'Nampula', 1),
(2270, 145, 'NI', 'Niassa', 1),
(2271, 145, 'SO', 'Sofala', 1),
(2272, 145, 'TE', 'Tete', 1),
(2273, 145, 'ZA', 'Zambezia', 1),
(2274, 146, 'AY', 'Ayeyarwady', 1),
(2275, 146, 'BG', 'Bago', 1),
(2276, 146, 'MG', 'Magway', 1),
(2277, 146, 'MD', 'Mandalay', 1),
(2278, 146, 'SG', 'Sagaing', 1),
(2279, 146, 'TN', 'Tanintharyi', 1),
(2280, 146, 'YG', 'Yangon', 1),
(2281, 146, 'CH', 'Chin State', 1),
(2282, 146, 'KC', 'Kachin State', 1),
(2283, 146, 'KH', 'Kayah State', 1),
(2284, 146, 'KN', 'Kayin State', 1),
(2285, 146, 'MN', 'Mon State', 1),
(2286, 146, 'RK', 'Rakhine State', 1),
(2287, 146, 'SH', 'Shan State', 1),
(2288, 147, 'CA', 'Caprivi', 1),
(2289, 147, 'ER', 'Erongo', 1),
(2290, 147, 'HA', 'Hardap', 1),
(2291, 147, 'KR', 'Karas', 1),
(2292, 147, 'KV', 'Kavango', 1),
(2293, 147, 'KH', 'Khomas', 1),
(2294, 147, 'KU', 'Kunene', 1),
(2295, 147, 'OW', 'Ohangwena', 1),
(2296, 147, 'OK', 'Omaheke', 1),
(2297, 147, 'OT', 'Omusati', 1),
(2298, 147, 'ON', 'Oshana', 1),
(2299, 147, 'OO', 'Oshikoto', 1),
(2300, 147, 'OJ', 'Otjozondjupa', 1),
(2301, 148, 'AO', 'Aiwo', 1),
(2302, 148, 'AA', 'Anabar', 1),
(2303, 148, 'AT', 'Anetan', 1),
(2304, 148, 'AI', 'Anibare', 1),
(2305, 148, 'BA', 'Baiti', 1),
(2306, 148, 'BO', 'Boe', 1),
(2307, 148, 'BU', 'Buada', 1),
(2308, 148, 'DE', 'Denigomodu', 1),
(2309, 148, 'EW', 'Ewa', 1),
(2310, 148, 'IJ', 'Ijuw', 1),
(2311, 148, 'ME', 'Meneng', 1),
(2312, 148, 'NI', 'Nibok', 1),
(2313, 148, 'UA', 'Uaboe', 1),
(2314, 148, 'YA', 'Yaren', 1),
(2315, 149, 'BA', 'Bagmati', 1),
(2316, 149, 'BH', 'Bheri', 1),
(2317, 149, 'DH', 'Dhawalagiri', 1),
(2318, 149, 'GA', 'Gandaki', 1),
(2319, 149, 'JA', 'Janakpur', 1),
(2320, 149, 'KA', 'Karnali', 1),
(2321, 149, 'KO', 'Kosi', 1),
(2322, 149, 'LU', 'Lumbini', 1),
(2323, 149, 'MA', 'Mahakali', 1),
(2324, 149, 'ME', 'Mechi', 1),
(2325, 149, 'NA', 'Narayani', 1),
(2326, 149, 'RA', 'Rapti', 1),
(2327, 149, 'SA', 'Sagarmatha', 1),
(2328, 149, 'SE', 'Seti', 1),
(2329, 150, 'DR', 'Drenthe', 1),
(2330, 150, 'FL', 'Flevoland', 1),
(2331, 150, 'FR', 'Friesland', 1),
(2332, 150, 'GE', 'Gelderland', 1),
(2333, 150, 'GR', 'Groningen', 1),
(2334, 150, 'LI', 'Limburg', 1),
(2335, 150, 'NB', 'Noord Brabant', 1),
(2336, 150, 'NH', 'Noord Holland', 1),
(2337, 150, 'OV', 'Overijssel', 1),
(2338, 150, 'UT', 'Utrecht', 1),
(2339, 150, 'ZE', 'Zeeland', 1),
(2340, 150, 'ZH', 'Zuid Holland', 1),
(2341, 152, 'L', 'Iles Loyaute', 1),
(2342, 152, 'N', 'Nord', 1),
(2343, 152, 'S', 'Sud', 1),
(2344, 153, 'AUK', 'Auckland', 1),
(2345, 153, 'BOP', 'Bay of Plenty', 1),
(2346, 153, 'CAN', 'Canterbury', 1),
(2347, 153, 'COR', 'Coromandel', 1),
(2348, 153, 'GIS', 'Gisborne', 1),
(2349, 153, 'FIO', 'Fiordland', 1),
(2350, 153, 'HKB', 'Hawke''s Bay', 1),
(2351, 153, 'MBH', 'Marlborough', 1),
(2352, 153, 'MWT', 'Manawatu-Wanganui', 1),
(2353, 153, 'MCM', 'Mt Cook-Mackenzie', 1),
(2354, 153, 'NSN', 'Nelson', 1),
(2355, 153, 'NTL', 'Northland', 1),
(2356, 153, 'OTA', 'Otago', 1),
(2357, 153, 'STL', 'Southland', 1),
(2358, 153, 'TKI', 'Taranaki', 1),
(2359, 153, 'WGN', 'Wellington', 1),
(2360, 153, 'WKO', 'Waikato', 1),
(2361, 153, 'WAI', 'Wairprarapa', 1),
(2362, 153, 'WTC', 'West Coast', 1),
(2363, 154, 'AN', 'Atlantico Norte', 1),
(2364, 154, 'AS', 'Atlantico Sur', 1),
(2365, 154, 'BO', 'Boaco', 1),
(2366, 154, 'CA', 'Carazo', 1),
(2367, 154, 'CI', 'Chinandega', 1),
(2368, 154, 'CO', 'Chontales', 1),
(2369, 154, 'ES', 'Esteli', 1),
(2370, 154, 'GR', 'Granada', 1),
(2371, 154, 'JI', 'Jinotega', 1),
(2372, 154, 'LE', 'Leon', 1),
(2373, 154, 'MD', 'Madriz', 1),
(2374, 154, 'MN', 'Managua', 1),
(2375, 154, 'MS', 'Masaya', 1),
(2376, 154, 'MT', 'Matagalpa', 1),
(2377, 154, 'NS', 'Nuevo Segovia', 1),
(2378, 154, 'RS', 'Rio San Juan', 1),
(2379, 154, 'RI', 'Rivas', 1),
(2380, 155, 'AG', 'Agadez', 1),
(2381, 155, 'DF', 'Diffa', 1),
(2382, 155, 'DS', 'Dosso', 1),
(2383, 155, 'MA', 'Maradi', 1),
(2384, 155, 'NM', 'Niamey', 1),
(2385, 155, 'TH', 'Tahoua', 1),
(2386, 155, 'TL', 'Tillaberi', 1),
(2387, 155, 'ZD', 'Zinder', 1),
(2388, 156, 'AB', 'Abia', 1),
(2389, 156, 'CT', 'Abuja Federal Capital Territory', 1),
(2390, 156, 'AD', 'Adamawa', 1),
(2391, 156, 'AK', 'Akwa Ibom', 1),
(2392, 156, 'AN', 'Anambra', 1),
(2393, 156, 'BC', 'Bauchi', 1),
(2394, 156, 'BY', 'Bayelsa', 1),
(2395, 156, 'BN', 'Benue', 1),
(2396, 156, 'BO', 'Borno', 1),
(2397, 156, 'CR', 'Cross River', 1),
(2398, 156, 'DE', 'Delta', 1),
(2399, 156, 'EB', 'Ebonyi', 1),
(2400, 156, 'ED', 'Edo', 1),
(2401, 156, 'EK', 'Ekiti', 1),
(2402, 156, 'EN', 'Enugu', 1),
(2403, 156, 'GO', 'Gombe', 1),
(2404, 156, 'IM', 'Imo', 1),
(2405, 156, 'JI', 'Jigawa', 1),
(2406, 156, 'KD', 'Kaduna', 1),
(2407, 156, 'KN', 'Kano', 1),
(2408, 156, 'KT', 'Katsina', 1),
(2409, 156, 'KE', 'Kebbi', 1),
(2410, 156, 'KO', 'Kogi', 1),
(2411, 156, 'KW', 'Kwara', 1),
(2412, 156, 'LA', 'Lagos', 1),
(2413, 156, 'NA', 'Nassarawa', 1),
(2414, 156, 'NI', 'Niger', 1),
(2415, 156, 'OG', 'Ogun', 1),
(2416, 156, 'ONG', 'Ondo', 1),
(2417, 156, 'OS', 'Osun', 1),
(2418, 156, 'OY', 'Oyo', 1),
(2419, 156, 'PL', 'Plateau', 1),
(2420, 156, 'RI', 'Rivers', 1),
(2421, 156, 'SO', 'Sokoto', 1),
(2422, 156, 'TA', 'Taraba', 1),
(2423, 156, 'YO', 'Yobe', 1),
(2424, 156, 'ZA', 'Zamfara', 1),
(2425, 159, 'N', 'Northern Islands', 1),
(2426, 159, 'R', 'Rota', 1),
(2427, 159, 'S', 'Saipan', 1),
(2428, 159, 'T', 'Tinian', 1),
(2429, 160, 'AK', 'Akershus', 1),
(2430, 160, 'AA', 'Aust-Agder', 1),
(2431, 160, 'BU', 'Buskerud', 1),
(2432, 160, 'FM', 'Finnmark', 1),
(2433, 160, 'HM', 'Hedmark', 1),
(2434, 160, 'HL', 'Hordaland', 1),
(2435, 160, 'MR', 'More og Romdal', 1),
(2436, 160, 'NT', 'Nord-Trondelag', 1),
(2437, 160, 'NL', 'Nordland', 1),
(2438, 160, 'OF', 'Ostfold', 1),
(2439, 160, 'OP', 'Oppland', 1),
(2440, 160, 'OL', 'Oslo', 1),
(2441, 160, 'RL', 'Rogaland', 1),
(2442, 160, 'ST', 'Sor-Trondelag', 1),
(2443, 160, 'SJ', 'Sogn og Fjordane', 1),
(2444, 160, 'SV', 'Svalbard', 1),
(2445, 160, 'TM', 'Telemark', 1),
(2446, 160, 'TR', 'Troms', 1),
(2447, 160, 'VA', 'Vest-Agder', 1),
(2448, 160, 'VF', 'Vestfold', 1),
(2449, 161, 'DA', 'Ad Dakhiliyah', 1),
(2450, 161, 'BA', 'Al Batinah', 1),
(2451, 161, 'WU', 'Al Wusta', 1),
(2452, 161, 'SH', 'Ash Sharqiyah', 1),
(2453, 161, 'ZA', 'Az Zahirah', 1),
(2454, 161, 'MA', 'Masqat', 1),
(2455, 161, 'MU', 'Musandam', 1),
(2456, 161, 'ZU', 'Zufar', 1),
(2457, 162, 'B', 'Balochistan', 1),
(2458, 162, 'T', 'Federally Administered Tribal Areas', 1),
(2459, 162, 'I', 'Islamabad Capital Territory', 1),
(2460, 162, 'N', 'North-West Frontier', 1),
(2461, 162, 'P', 'Punjab', 1),
(2462, 162, 'S', 'Sindh', 1),
(2463, 163, 'AM', 'Aimeliik', 1),
(2464, 163, 'AR', 'Airai', 1),
(2465, 163, 'AN', 'Angaur', 1),
(2466, 163, 'HA', 'Hatohobei', 1),
(2467, 163, 'KA', 'Kayangel', 1),
(2468, 163, 'KO', 'Koror', 1),
(2469, 163, 'ME', 'Melekeok', 1),
(2470, 163, 'NA', 'Ngaraard', 1),
(2471, 163, 'NG', 'Ngarchelong', 1),
(2472, 163, 'ND', 'Ngardmau', 1),
(2473, 163, 'NT', 'Ngatpang', 1),
(2474, 163, 'NC', 'Ngchesar', 1),
(2475, 163, 'NR', 'Ngeremlengui', 1),
(2476, 163, 'NW', 'Ngiwal', 1),
(2477, 163, 'PE', 'Peleliu', 1),
(2478, 163, 'SO', 'Sonsorol', 1),
(2479, 164, 'BT', 'Bocas del Toro', 1),
(2480, 164, 'CH', 'Chiriqui', 1),
(2481, 164, 'CC', 'Cocle', 1),
(2482, 164, 'CL', 'Colon', 1),
(2483, 164, 'DA', 'Darien', 1),
(2484, 164, 'HE', 'Herrera', 1),
(2485, 164, 'LS', 'Los Santos', 1),
(2486, 164, 'PA', 'Panama', 1),
(2487, 164, 'SB', 'San Blas', 1),
(2488, 164, 'VG', 'Veraguas', 1),
(2489, 165, 'BV', 'Bougainville', 1),
(2490, 165, 'CE', 'Central', 1),
(2491, 165, 'CH', 'Chimbu', 1),
(2492, 165, 'EH', 'Eastern Highlands', 1),
(2493, 165, 'EB', 'East New Britain', 1),
(2494, 165, 'ES', 'East Sepik', 1),
(2495, 165, 'EN', 'Enga', 1),
(2496, 165, 'GU', 'Gulf', 1),
(2497, 165, 'MD', 'Madang', 1),
(2498, 165, 'MN', 'Manus', 1),
(2499, 165, 'MB', 'Milne Bay', 1),
(2500, 165, 'MR', 'Morobe', 1),
(2501, 165, 'NC', 'National Capital', 1),
(2502, 165, 'NI', 'New Ireland', 1),
(2503, 165, 'NO', 'Northern', 1),
(2504, 165, 'SA', 'Sandaun', 1),
(2505, 165, 'SH', 'Southern Highlands', 1),
(2506, 165, 'WE', 'Western', 1),
(2507, 165, 'WH', 'Western Highlands', 1),
(2508, 165, 'WB', 'West New Britain', 1),
(2509, 166, 'AG', 'Alto Paraguay', 1),
(2510, 166, 'AN', 'Alto Parana', 1),
(2511, 166, 'AM', 'Amambay', 1),
(2512, 166, 'AS', 'Asuncion', 1),
(2513, 166, 'BO', 'Boqueron', 1),
(2514, 166, 'CG', 'Caaguazu', 1),
(2515, 166, 'CZ', 'Caazapa', 1),
(2516, 166, 'CN', 'Canindeyu', 1),
(2517, 166, 'CE', 'Central', 1),
(2518, 166, 'CC', 'Concepcion', 1),
(2519, 166, 'CD', 'Cordillera', 1),
(2520, 166, 'GU', 'Guaira', 1),
(2521, 166, 'IT', 'Itapua', 1),
(2522, 166, 'MI', 'Misiones', 1),
(2523, 166, 'NE', 'Neembucu', 1),
(2524, 166, 'PA', 'Paraguari', 1),
(2525, 166, 'PH', 'Presidente Hayes', 1),
(2526, 166, 'SP', 'San Pedro', 1),
(2527, 167, 'AM', 'Amazonas', 1),
(2528, 167, 'AN', 'Ancash', 1),
(2529, 167, 'AP', 'Apurimac', 1),
(2530, 167, 'AR', 'Arequipa', 1),
(2531, 167, 'AY', 'Ayacucho', 1),
(2532, 167, 'CJ', 'Cajamarca', 1),
(2533, 167, 'CL', 'Callao', 1),
(2534, 167, 'CU', 'Cusco', 1),
(2535, 167, 'HV', 'Huancavelica', 1),
(2536, 167, 'HO', 'Huanuco', 1),
(2537, 167, 'IC', 'Ica', 1),
(2538, 167, 'JU', 'Junin', 1),
(2539, 167, 'LD', 'La Libertad', 1),
(2540, 167, 'LY', 'Lambayeque', 1),
(2541, 167, 'LI', 'Lima', 1),
(2542, 167, 'LO', 'Loreto', 1),
(2543, 167, 'MD', 'Madre de Dios', 1),
(2544, 167, 'MO', 'Moquegua', 1),
(2545, 167, 'PA', 'Pasco', 1),
(2546, 167, 'PI', 'Piura', 1),
(2547, 167, 'PU', 'Puno', 1),
(2548, 167, 'SM', 'San Martin', 1),
(2549, 167, 'TA', 'Tacna', 1),
(2550, 167, 'TU', 'Tumbes', 1),
(2551, 167, 'UC', 'Ucayali', 1),
(2552, 168, 'ABR', 'Abra', 1),
(2553, 168, 'ANO', 'Agusan del Norte', 1),
(2554, 168, 'ASU', 'Agusan del Sur', 1),
(2555, 168, 'AKL', 'Aklan', 1),
(2556, 168, 'ALB', 'Albay', 1),
(2557, 168, 'ANT', 'Antique', 1),
(2558, 168, 'APY', 'Apayao', 1),
(2559, 168, 'AUR', 'Aurora', 1),
(2560, 168, 'BAS', 'Basilan', 1),
(2561, 168, 'BTA', 'Bataan', 1),
(2562, 168, 'BTE', 'Batanes', 1),
(2563, 168, 'BTG', 'Batangas', 1),
(2564, 168, 'BLR', 'Biliran', 1),
(2565, 168, 'BEN', 'Benguet', 1),
(2566, 168, 'BOL', 'Bohol', 1),
(2567, 168, 'BUK', 'Bukidnon', 1),
(2568, 168, 'BUL', 'Bulacan', 1),
(2569, 168, 'CAG', 'Cagayan', 1),
(2570, 168, 'CNO', 'Camarines Norte', 1),
(2571, 168, 'CSU', 'Camarines Sur', 1),
(2572, 168, 'CAM', 'Camiguin', 1),
(2573, 168, 'CAP', 'Capiz', 1),
(2574, 168, 'CAT', 'Catanduanes', 1),
(2575, 168, 'CAV', 'Cavite', 1),
(2576, 168, 'CEB', 'Cebu', 1),
(2577, 168, 'CMP', 'Compostela', 1),
(2578, 168, 'DNO', 'Davao del Norte', 1),
(2579, 168, 'DSU', 'Davao del Sur', 1),
(2580, 168, 'DOR', 'Davao Oriental', 1),
(2581, 168, 'ESA', 'Eastern Samar', 1),
(2582, 168, 'GUI', 'Guimaras', 1),
(2583, 168, 'IFU', 'Ifugao', 1),
(2584, 168, 'INO', 'Ilocos Norte', 1),
(2585, 168, 'ISU', 'Ilocos Sur', 1),
(2586, 168, 'ILO', 'Iloilo', 1),
(2587, 168, 'ISA', 'Isabela', 1),
(2588, 168, 'KAL', 'Kalinga', 1),
(2589, 168, 'LAG', 'Laguna', 1),
(2590, 168, 'LNO', 'Lanao del Norte', 1),
(2591, 168, 'LSU', 'Lanao del Sur', 1),
(2592, 168, 'UNI', 'La Union', 1),
(2593, 168, 'LEY', 'Leyte', 1),
(2594, 168, 'MAG', 'Maguindanao', 1),
(2595, 168, 'MRN', 'Marinduque', 1),
(2596, 168, 'MSB', 'Masbate', 1),
(2597, 168, 'MIC', 'Mindoro Occidental', 1),
(2598, 168, 'MIR', 'Mindoro Oriental', 1),
(2599, 168, 'MSC', 'Misamis Occidental', 1),
(2600, 168, 'MOR', 'Misamis Oriental', 1),
(2601, 168, 'MOP', 'Mountain', 1),
(2602, 168, 'NOC', 'Negros Occidental', 1),
(2603, 168, 'NOR', 'Negros Oriental', 1),
(2604, 168, 'NCT', 'North Cotabato', 1),
(2605, 168, 'NSM', 'Northern Samar', 1),
(2606, 168, 'NEC', 'Nueva Ecija', 1),
(2607, 168, 'NVZ', 'Nueva Vizcaya', 1),
(2608, 168, 'PLW', 'Palawan', 1),
(2609, 168, 'PMP', 'Pampanga', 1),
(2610, 168, 'PNG', 'Pangasinan', 1),
(2611, 168, 'QZN', 'Quezon', 1),
(2612, 168, 'QRN', 'Quirino', 1),
(2613, 168, 'RIZ', 'Rizal', 1),
(2614, 168, 'ROM', 'Romblon', 1),
(2615, 168, 'SMR', 'Samar', 1),
(2616, 168, 'SRG', 'Sarangani', 1),
(2617, 168, 'SQJ', 'Siquijor', 1),
(2618, 168, 'SRS', 'Sorsogon', 1),
(2619, 168, 'SCO', 'South Cotabato', 1),
(2620, 168, 'SLE', 'Southern Leyte', 1),
(2621, 168, 'SKU', 'Sultan Kudarat', 1),
(2622, 168, 'SLU', 'Sulu', 1),
(2623, 168, 'SNO', 'Surigao del Norte', 1),
(2624, 168, 'SSU', 'Surigao del Sur', 1),
(2625, 168, 'TAR', 'Tarlac', 1),
(2626, 168, 'TAW', 'Tawi-Tawi', 1),
(2627, 168, 'ZBL', 'Zambales', 1),
(2628, 168, 'ZNO', 'Zamboanga del Norte', 1),
(2629, 168, 'ZSU', 'Zamboanga del Sur', 1),
(2630, 168, 'ZSI', 'Zamboanga Sibugay', 1),
(2631, 170, 'DO', 'Dolnoslaskie', 1),
(2632, 170, 'KP', 'Kujawsko-Pomorskie', 1),
(2633, 170, 'LO', 'Lodzkie', 1),
(2634, 170, 'LL', 'Lubelskie', 1),
(2635, 170, 'LU', 'Lubuskie', 1),
(2636, 170, 'ML', 'Malopolskie', 1),
(2637, 170, 'MZ', 'Mazowieckie', 1),
(2638, 170, 'OP', 'Opolskie', 1),
(2639, 170, 'PP', 'Podkarpackie', 1),
(2640, 170, 'PL', 'Podlaskie', 1),
(2641, 170, 'PM', 'Pomorskie', 1),
(2642, 170, 'SL', 'Slaskie', 1),
(2643, 170, 'SW', 'Swietokrzyskie', 1),
(2644, 170, 'WM', 'Warminsko-Mazurskie', 1),
(2645, 170, 'WP', 'Wielkopolskie', 1),
(2646, 170, 'ZA', 'Zachodniopomorskie', 1),
(2647, 198, 'P', 'Saint Pierre', 1),
(2648, 198, 'M', 'Miquelon', 1),
(2649, 171, 'AC', 'A&ccedil;ores', 1),
(2650, 171, 'AV', 'Aveiro', 1),
(2651, 171, 'BE', 'Beja', 1),
(2652, 171, 'BR', 'Braga', 1),
(2653, 171, 'BA', 'Bragan&ccedil;a', 1),
(2654, 171, 'CB', 'Castelo Branco', 1),
(2655, 171, 'CO', 'Coimbra', 1),
(2656, 171, 'EV', '&Eacute;vora', 1),
(2657, 171, 'FA', 'Faro', 1),
(2658, 171, 'GU', 'Guarda', 1),
(2659, 171, 'LE', 'Leiria', 1),
(2660, 171, 'LI', 'Lisboa', 1),
(2661, 171, 'ME', 'Madeira', 1),
(2662, 171, 'PO', 'Portalegre', 1),
(2663, 171, 'PR', 'Porto', 1),
(2664, 171, 'SA', 'Santar&eacute;m', 1),
(2665, 171, 'SE', 'Set&uacute;bal', 1),
(2666, 171, 'VC', 'Viana do Castelo', 1),
(2667, 171, 'VR', 'Vila Real', 1),
(2668, 171, 'VI', 'Viseu', 1),
(2669, 173, 'DW', 'Ad Dawhah', 1),
(2670, 173, 'GW', 'Al Ghuwayriyah', 1),
(2671, 173, 'JM', 'Al Jumayliyah', 1),
(2672, 173, 'KR', 'Al Khawr', 1),
(2673, 173, 'WK', 'Al Wakrah', 1),
(2674, 173, 'RN', 'Ar Rayyan', 1),
(2675, 173, 'JB', 'Jarayan al Batinah', 1),
(2676, 173, 'MS', 'Madinat ash Shamal', 1),
(2677, 173, 'UD', 'Umm Sa''id', 1),
(2678, 173, 'UL', 'Umm Salal', 1),
(2679, 175, 'AB', 'Alba', 1),
(2680, 175, 'AR', 'Arad', 1),
(2681, 175, 'AG', 'Arges', 1),
(2682, 175, 'BC', 'Bacau', 1),
(2683, 175, 'BH', 'Bihor', 1),
(2684, 175, 'BN', 'Bistrita-Nasaud', 1),
(2685, 175, 'BT', 'Botosani', 1),
(2686, 175, 'BV', 'Brasov', 1),
(2687, 175, 'BR', 'Braila', 1),
(2688, 175, 'B', 'Bucuresti', 1),
(2689, 175, 'BZ', 'Buzau', 1),
(2690, 175, 'CS', 'Caras-Severin', 1),
(2691, 175, 'CL', 'Calarasi', 1),
(2692, 175, 'CJ', 'Cluj', 1),
(2693, 175, 'CT', 'Constanta', 1),
(2694, 175, 'CV', 'Covasna', 1),
(2695, 175, 'DB', 'Dimbovita', 1),
(2696, 175, 'DJ', 'Dolj', 1),
(2697, 175, 'GL', 'Galati', 1),
(2698, 175, 'GR', 'Giurgiu', 1),
(2699, 175, 'GJ', 'Gorj', 1),
(2700, 175, 'HR', 'Harghita', 1),
(2701, 175, 'HD', 'Hunedoara', 1),
(2702, 175, 'IL', 'Ialomita', 1),
(2703, 175, 'IS', 'Iasi', 1),
(2704, 175, 'IF', 'Ilfov', 1),
(2705, 175, 'MM', 'Maramures', 1),
(2706, 175, 'MH', 'Mehedinti', 1),
(2707, 175, 'MS', 'Mures', 1),
(2708, 175, 'NT', 'Neamt', 1),
(2709, 175, 'OT', 'Olt', 1),
(2710, 175, 'PH', 'Prahova', 1),
(2711, 175, 'SM', 'Satu-Mare', 1),
(2712, 175, 'SJ', 'Salaj', 1),
(2713, 175, 'SB', 'Sibiu', 1),
(2714, 175, 'SV', 'Suceava', 1),
(2715, 175, 'TR', 'Teleorman', 1),
(2716, 175, 'TM', 'Timis', 1),
(2717, 175, 'TL', 'Tulcea', 1),
(2718, 175, 'VS', 'Vaslui', 1),
(2719, 175, 'VL', 'Valcea', 1),
(2720, 175, 'VN', 'Vrancea', 1),
(2721, 176, 'AB', 'Abakan', 1),
(2722, 176, 'AG', 'Aginskoye', 1),
(2723, 176, 'AN', 'Anadyr', 1),
(2724, 176, 'AR', 'Arkahangelsk', 1),
(2725, 176, 'AS', 'Astrakhan', 1),
(2726, 176, 'BA', 'Barnaul', 1),
(2727, 176, 'BE', 'Belgorod', 1),
(2728, 176, 'BI', 'Birobidzhan', 1),
(2729, 176, 'BL', 'Blagoveshchensk', 1),
(2730, 176, 'BR', 'Bryansk', 1),
(2731, 176, 'CH', 'Cheboksary', 1),
(2732, 176, 'CL', 'Chelyabinsk', 1),
(2733, 176, 'CR', 'Cherkessk', 1),
(2734, 176, 'CI', 'Chita', 1),
(2735, 176, 'DU', 'Dudinka', 1),
(2736, 176, 'EL', 'Elista', 1),
(2737, 176, 'GO', 'Gomo-Altaysk', 1),
(2738, 176, 'GA', 'Gorno-Altaysk', 1),
(2739, 176, 'GR', 'Groznyy', 1),
(2740, 176, 'IR', 'Irkutsk', 1),
(2741, 176, 'IV', 'Ivanovo', 1),
(2742, 176, 'IZ', 'Izhevsk', 1),
(2743, 176, 'KA', 'Kalinigrad', 1),
(2744, 176, 'KL', 'Kaluga', 1),
(2745, 176, 'KS', 'Kasnodar', 1),
(2746, 176, 'KZ', 'Kazan', 1),
(2747, 176, 'KE', 'Kemerovo', 1),
(2748, 176, 'KH', 'Khabarovsk', 1),
(2749, 176, 'KM', 'Khanty-Mansiysk', 1),
(2750, 176, 'KO', 'Kostroma', 1),
(2751, 176, 'KR', 'Krasnodar', 1),
(2752, 176, 'KN', 'Krasnoyarsk', 1),
(2753, 176, 'KU', 'Kudymkar', 1),
(2754, 176, 'KG', 'Kurgan', 1),
(2755, 176, 'KK', 'Kursk', 1),
(2756, 176, 'KY', 'Kyzyl', 1),
(2757, 176, 'LI', 'Lipetsk', 1),
(2758, 176, 'MA', 'Magadan', 1),
(2759, 176, 'MK', 'Makhachkala', 1),
(2760, 176, 'MY', 'Maykop', 1),
(2761, 176, 'MO', 'Moscow', 1),
(2762, 176, 'MU', 'Murmansk', 1),
(2763, 176, 'NA', 'Nalchik', 1),
(2764, 176, 'NR', 'Naryan Mar', 1),
(2765, 176, 'NZ', 'Nazran', 1),
(2766, 176, 'NI', 'Nizhniy Novgorod', 1),
(2767, 176, 'NO', 'Novgorod', 1),
(2768, 176, 'NV', 'Novosibirsk', 1),
(2769, 176, 'OM', 'Omsk', 1),
(2770, 176, 'OR', 'Orel', 1),
(2771, 176, 'OE', 'Orenburg', 1),
(2772, 176, 'PA', 'Palana', 1),
(2773, 176, 'PE', 'Penza', 1),
(2774, 176, 'PR', 'Perm', 1),
(2775, 176, 'PK', 'Petropavlovsk-Kamchatskiy', 1),
(2776, 176, 'PT', 'Petrozavodsk', 1),
(2777, 176, 'PS', 'Pskov', 1),
(2778, 176, 'RO', 'Rostov-na-Donu', 1),
(2779, 176, 'RY', 'Ryazan', 1),
(2780, 176, 'SL', 'Salekhard', 1),
(2781, 176, 'SA', 'Samara', 1),
(2782, 176, 'SR', 'Saransk', 1),
(2783, 176, 'SV', 'Saratov', 1),
(2784, 176, 'SM', 'Smolensk', 1),
(2785, 176, 'SP', 'St. Petersburg', 1),
(2786, 176, 'ST', 'Stavropol', 1),
(2787, 176, 'SY', 'Syktyvkar', 1),
(2788, 176, 'TA', 'Tambov', 1),
(2789, 176, 'TO', 'Tomsk', 1),
(2790, 176, 'TU', 'Tula', 1),
(2791, 176, 'TR', 'Tura', 1),
(2792, 176, 'TV', 'Tver', 1),
(2793, 176, 'TY', 'Tyumen', 1),
(2794, 176, 'UF', 'Ufa', 1),
(2795, 176, 'UL', 'Ul''yanovsk', 1),
(2796, 176, 'UU', 'Ulan-Ude', 1),
(2797, 176, 'US', 'Ust''-Ordynskiy', 1),
(2798, 176, 'VL', 'Vladikavkaz', 1),
(2799, 176, 'VA', 'Vladimir', 1),
(2800, 176, 'VV', 'Vladivostok', 1),
(2801, 176, 'VG', 'Volgograd', 1),
(2802, 176, 'VD', 'Vologda', 1),
(2803, 176, 'VO', 'Voronezh', 1),
(2804, 176, 'VY', 'Vyatka', 1),
(2805, 176, 'YA', 'Yakutsk', 1),
(2806, 176, 'YR', 'Yaroslavl', 1),
(2807, 176, 'YE', 'Yekaterinburg', 1),
(2808, 176, 'YO', 'Yoshkar-Ola', 1),
(2809, 177, 'BU', 'Butare', 1),
(2810, 177, 'BY', 'Byumba', 1),
(2811, 177, 'CY', 'Cyangugu', 1),
(2812, 177, 'GK', 'Gikongoro', 1),
(2813, 177, 'GS', 'Gisenyi', 1),
(2814, 177, 'GT', 'Gitarama', 1),
(2815, 177, 'KG', 'Kibungo', 1),
(2816, 177, 'KY', 'Kibuye', 1),
(2817, 177, 'KR', 'Kigali Rurale', 1),
(2818, 177, 'KV', 'Kigali-ville', 1),
(2819, 177, 'RU', 'Ruhengeri', 1),
(2820, 177, 'UM', 'Umutara', 1),
(2821, 178, 'CCN', 'Christ Church Nichola Town', 1),
(2822, 178, 'SAS', 'Saint Anne Sandy Point', 1),
(2823, 178, 'SGB', 'Saint George Basseterre', 1),
(2824, 178, 'SGG', 'Saint George Gingerland', 1),
(2825, 178, 'SJW', 'Saint James Windward', 1),
(2826, 178, 'SJC', 'Saint John Capesterre', 1),
(2827, 178, 'SJF', 'Saint John Figtree', 1),
(2828, 178, 'SMC', 'Saint Mary Cayon', 1),
(2829, 178, 'CAP', 'Saint Paul Capesterre', 1),
(2830, 178, 'CHA', 'Saint Paul Charlestown', 1),
(2831, 178, 'SPB', 'Saint Peter Basseterre', 1),
(2832, 178, 'STL', 'Saint Thomas Lowland', 1),
(2833, 178, 'STM', 'Saint Thomas Middle Island', 1),
(2834, 178, 'TPP', 'Trinity Palmetto Point', 1),
(2835, 179, 'AR', 'Anse-la-Raye', 1),
(2836, 179, 'CA', 'Castries', 1),
(2837, 179, 'CH', 'Choiseul', 1),
(2838, 179, 'DA', 'Dauphin', 1),
(2839, 179, 'DE', 'Dennery', 1),
(2840, 179, 'GI', 'Gros-Islet', 1),
(2841, 179, 'LA', 'Laborie', 1),
(2842, 179, 'MI', 'Micoud', 1),
(2843, 179, 'PR', 'Praslin', 1),
(2844, 179, 'SO', 'Soufriere', 1),
(2845, 179, 'VF', 'Vieux-Fort', 1),
(2846, 180, 'C', 'Charlotte', 1),
(2847, 180, 'R', 'Grenadines', 1),
(2848, 180, 'A', 'Saint Andrew', 1),
(2849, 180, 'D', 'Saint David', 1),
(2850, 180, 'G', 'Saint George', 1),
(2851, 180, 'P', 'Saint Patrick', 1),
(2852, 181, 'AN', 'A''ana', 1),
(2853, 181, 'AI', 'Aiga-i-le-Tai', 1),
(2854, 181, 'AT', 'Atua', 1),
(2855, 181, 'FA', 'Fa''asaleleaga', 1),
(2856, 181, 'GE', 'Gaga''emauga', 1),
(2857, 181, 'GF', 'Gagaifomauga', 1),
(2858, 181, 'PA', 'Palauli', 1),
(2859, 181, 'SA', 'Satupa''itea', 1),
(2860, 181, 'TU', 'Tuamasaga', 1),
(2861, 181, 'VF', 'Va''a-o-Fonoti', 1),
(2862, 181, 'VS', 'Vaisigano', 1),
(2863, 182, 'AC', 'Acquaviva', 1),
(2864, 182, 'BM', 'Borgo Maggiore', 1),
(2865, 182, 'CH', 'Chiesanuova', 1),
(2866, 182, 'DO', 'Domagnano', 1),
(2867, 182, 'FA', 'Faetano', 1),
(2868, 182, 'FI', 'Fiorentino', 1),
(2869, 182, 'MO', 'Montegiardino', 1),
(2870, 182, 'SM', 'Citta di San Marino', 1),
(2871, 182, 'SE', 'Serravalle', 1),
(2872, 183, 'S', 'Sao Tome', 1),
(2873, 183, 'P', 'Principe', 1),
(2874, 184, 'BH', 'Al Bahah', 1),
(2875, 184, 'HS', 'Al Hudud ash Shamaliyah', 1),
(2876, 184, 'JF', 'Al Jawf', 1),
(2877, 184, 'MD', 'Al Madinah', 1),
(2878, 184, 'QS', 'Al Qasim', 1),
(2879, 184, 'RD', 'Ar Riyad', 1),
(2880, 184, 'AQ', 'Ash Sharqiyah (Eastern)', 1),
(2881, 184, 'AS', '''Asir', 1),
(2882, 184, 'HL', 'Ha''il', 1),
(2883, 184, 'JZ', 'Jizan', 1),
(2884, 184, 'ML', 'Makkah', 1),
(2885, 184, 'NR', 'Najran', 1),
(2886, 184, 'TB', 'Tabuk', 1),
(2887, 185, 'DA', 'Dakar', 1),
(2888, 185, 'DI', 'Diourbel', 1),
(2889, 185, 'FA', 'Fatick', 1),
(2890, 185, 'KA', 'Kaolack', 1),
(2891, 185, 'KO', 'Kolda', 1),
(2892, 185, 'LO', 'Louga', 1),
(2893, 185, 'MA', 'Matam', 1),
(2894, 185, 'SL', 'Saint-Louis', 1),
(2895, 185, 'TA', 'Tambacounda', 1),
(2896, 185, 'TH', 'Thies', 1),
(2897, 185, 'ZI', 'Ziguinchor', 1),
(2898, 186, 'AP', 'Anse aux Pins', 1),
(2899, 186, 'AB', 'Anse Boileau', 1),
(2900, 186, 'AE', 'Anse Etoile', 1),
(2901, 186, 'AL', 'Anse Louis', 1),
(2902, 186, 'AR', 'Anse Royale', 1),
(2903, 186, 'BL', 'Baie Lazare', 1),
(2904, 186, 'BS', 'Baie Sainte Anne', 1),
(2905, 186, 'BV', 'Beau Vallon', 1),
(2906, 186, 'BA', 'Bel Air', 1),
(2907, 186, 'BO', 'Bel Ombre', 1),
(2908, 186, 'CA', 'Cascade', 1),
(2909, 186, 'GL', 'Glacis', 1),
(2910, 186, 'GM', 'Grand'' Anse (on Mahe)', 1),
(2911, 186, 'GP', 'Grand'' Anse (on Praslin)', 1),
(2912, 186, 'DG', 'La Digue', 1),
(2913, 186, 'RA', 'La Riviere Anglaise', 1),
(2914, 186, 'MB', 'Mont Buxton', 1),
(2915, 186, 'MF', 'Mont Fleuri', 1),
(2916, 186, 'PL', 'Plaisance', 1),
(2917, 186, 'PR', 'Pointe La Rue', 1),
(2918, 186, 'PG', 'Port Glaud', 1),
(2919, 186, 'SL', 'Saint Louis', 1),
(2920, 186, 'TA', 'Takamaka', 1),
(2921, 187, 'E', 'Eastern', 1),
(2922, 187, 'N', 'Northern', 1),
(2923, 187, 'S', 'Southern', 1),
(2924, 187, 'W', 'Western', 1),
(2925, 189, 'BA', 'Banskobystrický', 1),
(2926, 189, 'BR', 'Bratislavský', 1),
(2927, 189, 'KO', 'Košický', 1),
(2928, 189, 'NI', 'Nitriansky', 1),
(2929, 189, 'PR', 'Prešovský', 1),
(2930, 189, 'TC', 'Trenčiansky', 1),
(2931, 189, 'TV', 'Trnavský', 1),
(2932, 189, 'ZI', 'Žilinský', 1),
(2933, 191, 'CE', 'Central', 1),
(2934, 191, 'CH', 'Choiseul', 1),
(2935, 191, 'GC', 'Guadalcanal', 1),
(2936, 191, 'HO', 'Honiara', 1),
(2937, 191, 'IS', 'Isabel', 1),
(2938, 191, 'MK', 'Makira', 1),
(2939, 191, 'ML', 'Malaita', 1),
(2940, 191, 'RB', 'Rennell and Bellona', 1),
(2941, 191, 'TM', 'Temotu', 1),
(2942, 191, 'WE', 'Western', 1),
(2943, 192, 'AW', 'Awdal', 1),
(2944, 192, 'BK', 'Bakool', 1),
(2945, 192, 'BN', 'Banaadir', 1),
(2946, 192, 'BR', 'Bari', 1),
(2947, 192, 'BY', 'Bay', 1),
(2948, 192, 'GA', 'Galguduud', 1),
(2949, 192, 'GE', 'Gedo', 1),
(2950, 192, 'HI', 'Hiiraan', 1),
(2951, 192, 'JD', 'Jubbada Dhexe', 1),
(2952, 192, 'JH', 'Jubbada Hoose', 1),
(2953, 192, 'MU', 'Mudug', 1),
(2954, 192, 'NU', 'Nugaal', 1),
(2955, 192, 'SA', 'Sanaag', 1),
(2956, 192, 'SD', 'Shabeellaha Dhexe', 1),
(2957, 192, 'SH', 'Shabeellaha Hoose', 1),
(2958, 192, 'SL', 'Sool', 1),
(2959, 192, 'TO', 'Togdheer', 1),
(2960, 192, 'WG', 'Woqooyi Galbeed', 1),
(2961, 193, 'EC', 'Eastern Cape', 1),
(2962, 193, 'FS', 'Free State', 1),
(2963, 193, 'GT', 'Gauteng', 1),
(2964, 193, 'KN', 'KwaZulu-Natal', 1),
(2965, 193, 'LP', 'Limpopo', 1),
(2966, 193, 'MP', 'Mpumalanga', 1),
(2967, 193, 'NW', 'North West', 1),
(2968, 193, 'NC', 'Northern Cape', 1),
(2969, 193, 'WC', 'Western Cape', 1),
(2970, 195, 'CA', 'La Coru&ntilde;a', 1),
(2971, 195, 'AL', '&Aacute;lava', 1),
(2972, 195, 'AB', 'Albacete', 1),
(2973, 195, 'AC', 'Alicante', 1),
(2974, 195, 'AM', 'Almeria', 1),
(2975, 195, 'AS', 'Asturias', 1),
(2976, 195, 'AV', '&Aacute;vila', 1),
(2977, 195, 'BJ', 'Badajoz', 1),
(2978, 195, 'IB', 'Baleares', 1),
(2979, 195, 'BA', 'Barcelona', 1),
(2980, 195, 'BU', 'Burgos', 1),
(2981, 195, 'CC', 'C&aacute;ceres', 1),
(2982, 195, 'CZ', 'C&aacute;diz', 1),
(2983, 195, 'CT', 'Cantabria', 1),
(2984, 195, 'CL', 'Castell&oacute;n', 1),
(2985, 195, 'CE', 'Ceuta', 1),
(2986, 195, 'CR', 'Ciudad Real', 1),
(2987, 195, 'CD', 'C&oacute;rdoba', 1),
(2988, 195, 'CU', 'Cuenca', 1),
(2989, 195, 'GI', 'Girona', 1),
(2990, 195, 'GD', 'Granada', 1),
(2991, 195, 'GJ', 'Guadalajara', 1),
(2992, 195, 'GP', 'Guip&uacute;zcoa', 1),
(2993, 195, 'HL', 'Huelva', 1),
(2994, 195, 'HS', 'Huesca', 1),
(2995, 195, 'JN', 'Ja&eacute;n', 1),
(2996, 195, 'RJ', 'La Rioja', 1),
(2997, 195, 'PM', 'Las Palmas', 1),
(2998, 195, 'LE', 'Leon', 1),
(2999, 195, 'LL', 'Lleida', 1),
(3000, 195, 'LG', 'Lugo', 1),
(3001, 195, 'MD', 'Madrid', 1),
(3002, 195, 'MA', 'Malaga', 1),
(3003, 195, 'ML', 'Melilla', 1),
(3004, 195, 'MU', 'Murcia', 1),
(3005, 195, 'NV', 'Navarra', 1),
(3006, 195, 'OU', 'Ourense', 1),
(3007, 195, 'PL', 'Palencia', 1),
(3008, 195, 'PO', 'Pontevedra', 1),
(3009, 195, 'SL', 'Salamanca', 1),
(3010, 195, 'SC', 'Santa Cruz de Tenerife', 1),
(3011, 195, 'SG', 'Segovia', 1),
(3012, 195, 'SV', 'Sevilla', 1),
(3013, 195, 'SO', 'Soria', 1),
(3014, 195, 'TA', 'Tarragona', 1),
(3015, 195, 'TE', 'Teruel', 1),
(3016, 195, 'TO', 'Toledo', 1),
(3017, 195, 'VC', 'Valencia', 1),
(3018, 195, 'VD', 'Valladolid', 1),
(3019, 195, 'VZ', 'Vizcaya', 1),
(3020, 195, 'ZM', 'Zamora', 1),
(3021, 195, 'ZR', 'Zaragoza', 1),
(3022, 196, 'CE', 'Central', 1),
(3023, 196, 'EA', 'Eastern', 1),
(3024, 196, 'NC', 'North Central', 1),
(3025, 196, 'NO', 'Northern', 1),
(3026, 196, 'NW', 'North Western', 1),
(3027, 196, 'SA', 'Sabaragamuwa', 1),
(3028, 196, 'SO', 'Southern', 1),
(3029, 196, 'UV', 'Uva', 1),
(3030, 196, 'WE', 'Western', 1),
(3031, 197, 'A', 'Ascension', 1),
(3032, 197, 'S', 'Saint Helena', 1),
(3033, 197, 'T', 'Tristan da Cunha', 1),
(3034, 199, 'ANL', 'A''ali an Nil', 1),
(3035, 199, 'BAM', 'Al Bahr al Ahmar', 1),
(3036, 199, 'BRT', 'Al Buhayrat', 1),
(3037, 199, 'JZR', 'Al Jazirah', 1),
(3038, 199, 'KRT', 'Al Khartum', 1),
(3039, 199, 'QDR', 'Al Qadarif', 1),
(3040, 199, 'WDH', 'Al Wahdah', 1),
(3041, 199, 'ANB', 'An Nil al Abyad', 1),
(3042, 199, 'ANZ', 'An Nil al Azraq', 1),
(3043, 199, 'ASH', 'Ash Shamaliyah', 1),
(3044, 199, 'BJA', 'Bahr al Jabal', 1),
(3045, 199, 'GIS', 'Gharb al Istiwa''iyah', 1),
(3046, 199, 'GBG', 'Gharb Bahr al Ghazal', 1),
(3047, 199, 'GDA', 'Gharb Darfur', 1),
(3048, 199, 'GKU', 'Gharb Kurdufan', 1),
(3049, 199, 'JDA', 'Janub Darfur', 1),
(3050, 199, 'JKU', 'Janub Kurdufan', 1),
(3051, 199, 'JQL', 'Junqali', 1);
INSERT INTO `i8a13_mijoshop_zone` (`zone_id`, `country_id`, `code`, `name`, `status`) VALUES
(3052, 199, 'KSL', 'Kassala', 1),
(3053, 199, 'NNL', 'Nahr an Nil', 1),
(3054, 199, 'SBG', 'Shamal Bahr al Ghazal', 1),
(3055, 199, 'SDA', 'Shamal Darfur', 1),
(3056, 199, 'SKU', 'Shamal Kurdufan', 1),
(3057, 199, 'SIS', 'Sharq al Istiwa''iyah', 1),
(3058, 199, 'SNR', 'Sinnar', 1),
(3059, 199, 'WRB', 'Warab', 1),
(3060, 200, 'BR', 'Brokopondo', 1),
(3061, 200, 'CM', 'Commewijne', 1),
(3062, 200, 'CR', 'Coronie', 1),
(3063, 200, 'MA', 'Marowijne', 1),
(3064, 200, 'NI', 'Nickerie', 1),
(3065, 200, 'PA', 'Para', 1),
(3066, 200, 'PM', 'Paramaribo', 1),
(3067, 200, 'SA', 'Saramacca', 1),
(3068, 200, 'SI', 'Sipaliwini', 1),
(3069, 200, 'WA', 'Wanica', 1),
(3070, 202, 'H', 'Hhohho', 1),
(3071, 202, 'L', 'Lubombo', 1),
(3072, 202, 'M', 'Manzini', 1),
(3073, 202, 'S', 'Shishelweni', 1),
(3074, 203, 'K', 'Blekinge', 1),
(3075, 203, 'W', 'Dalarna', 1),
(3076, 203, 'X', 'G&auml;vleborg', 1),
(3077, 203, 'I', 'Gotland', 1),
(3078, 203, 'N', 'Halland', 1),
(3079, 203, 'Z', 'J&auml;mtland', 1),
(3080, 203, 'F', 'J&ouml;nk&ouml;ping', 1),
(3081, 203, 'H', 'Kalmar', 1),
(3082, 203, 'G', 'Kronoberg', 1),
(3083, 203, 'BD', 'Norrbotten', 1),
(3084, 203, 'T', '&Ouml;rebro', 1),
(3085, 203, 'E', '&Ouml;sterg&ouml;tland', 1),
(3086, 203, 'M', 'Sk&aring;ne', 1),
(3087, 203, 'D', 'S&ouml;dermanland', 1),
(3088, 203, 'AB', 'Stockholm', 1),
(3089, 203, 'C', 'Uppsala', 1),
(3090, 203, 'S', 'V&auml;rmland', 1),
(3091, 203, 'AC', 'V&auml;sterbotten', 1),
(3092, 203, 'Y', 'V&auml;sternorrland', 1),
(3093, 203, 'U', 'V&auml;stmanland', 1),
(3094, 203, 'O', 'V&auml;stra G&ouml;taland', 1),
(3095, 204, 'AG', 'Aargau', 1),
(3096, 204, 'AR', 'Appenzell Ausserrhoden', 1),
(3097, 204, 'AI', 'Appenzell Innerrhoden', 1),
(3098, 204, 'BS', 'Basel-Stadt', 1),
(3099, 204, 'BL', 'Basel-Landschaft', 1),
(3100, 204, 'BE', 'Bern', 1),
(3101, 204, 'FR', 'Fribourg', 1),
(3102, 204, 'GE', 'Gen&egrave;ve', 1),
(3103, 204, 'GL', 'Glarus', 1),
(3104, 204, 'GR', 'Graub&uuml;nden', 1),
(3105, 204, 'JU', 'Jura', 1),
(3106, 204, 'LU', 'Luzern', 1),
(3107, 204, 'NE', 'Neuch&acirc;tel', 1),
(3108, 204, 'NW', 'Nidwald', 1),
(3109, 204, 'OW', 'Obwald', 1),
(3110, 204, 'SG', 'St. Gallen', 1),
(3111, 204, 'SH', 'Schaffhausen', 1),
(3112, 204, 'SZ', 'Schwyz', 1),
(3113, 204, 'SO', 'Solothurn', 1),
(3114, 204, 'TG', 'Thurgau', 1),
(3115, 204, 'TI', 'Ticino', 1),
(3116, 204, 'UR', 'Uri', 1),
(3117, 204, 'VS', 'Valais', 1),
(3118, 204, 'VD', 'Vaud', 1),
(3119, 204, 'ZG', 'Zug', 1),
(3120, 204, 'ZH', 'Z&uuml;rich', 1),
(3121, 205, 'HA', 'Al Hasakah', 1),
(3122, 205, 'LA', 'Al Ladhiqiyah', 1),
(3123, 205, 'QU', 'Al Qunaytirah', 1),
(3124, 205, 'RQ', 'Ar Raqqah', 1),
(3125, 205, 'SU', 'As Suwayda', 1),
(3126, 205, 'DA', 'Dara', 1),
(3127, 205, 'DZ', 'Dayr az Zawr', 1),
(3128, 205, 'DI', 'Dimashq', 1),
(3129, 205, 'HL', 'Halab', 1),
(3130, 205, 'HM', 'Hamah', 1),
(3131, 205, 'HI', 'Hims', 1),
(3132, 205, 'ID', 'Idlib', 1),
(3133, 205, 'RD', 'Rif Dimashq', 1),
(3134, 205, 'TA', 'Tartus', 1),
(3135, 206, 'CH', 'Chang-hua', 1),
(3136, 206, 'CI', 'Chia-i', 1),
(3137, 206, 'HS', 'Hsin-chu', 1),
(3138, 206, 'HL', 'Hua-lien', 1),
(3139, 206, 'IL', 'I-lan', 1),
(3140, 206, 'KH', 'Kao-hsiung county', 1),
(3141, 206, 'KM', 'Kin-men', 1),
(3142, 206, 'LC', 'Lien-chiang', 1),
(3143, 206, 'ML', 'Miao-li', 1),
(3144, 206, 'NT', 'Nan-t''ou', 1),
(3145, 206, 'PH', 'P''eng-hu', 1),
(3146, 206, 'PT', 'P''ing-tung', 1),
(3147, 206, 'TG', 'T''ai-chung', 1),
(3148, 206, 'TA', 'T''ai-nan', 1),
(3149, 206, 'TP', 'T''ai-pei county', 1),
(3150, 206, 'TT', 'T''ai-tung', 1),
(3151, 206, 'TY', 'T''ao-yuan', 1),
(3152, 206, 'YL', 'Yun-lin', 1),
(3153, 206, 'CC', 'Chia-i city', 1),
(3154, 206, 'CL', 'Chi-lung', 1),
(3155, 206, 'HC', 'Hsin-chu', 1),
(3156, 206, 'TH', 'T''ai-chung', 1),
(3157, 206, 'TN', 'T''ai-nan', 1),
(3158, 206, 'KC', 'Kao-hsiung city', 1),
(3159, 206, 'TC', 'T''ai-pei city', 1),
(3160, 207, 'GB', 'Gorno-Badakhstan', 1),
(3161, 207, 'KT', 'Khatlon', 1),
(3162, 207, 'SU', 'Sughd', 1),
(3163, 208, 'AR', 'Arusha', 1),
(3164, 208, 'DS', 'Dar es Salaam', 1),
(3165, 208, 'DO', 'Dodoma', 1),
(3166, 208, 'IR', 'Iringa', 1),
(3167, 208, 'KA', 'Kagera', 1),
(3168, 208, 'KI', 'Kigoma', 1),
(3169, 208, 'KJ', 'Kilimanjaro', 1),
(3170, 208, 'LN', 'Lindi', 1),
(3171, 208, 'MY', 'Manyara', 1),
(3172, 208, 'MR', 'Mara', 1),
(3173, 208, 'MB', 'Mbeya', 1),
(3174, 208, 'MO', 'Morogoro', 1),
(3175, 208, 'MT', 'Mtwara', 1),
(3176, 208, 'MW', 'Mwanza', 1),
(3177, 208, 'PN', 'Pemba North', 1),
(3178, 208, 'PS', 'Pemba South', 1),
(3179, 208, 'PW', 'Pwani', 1),
(3180, 208, 'RK', 'Rukwa', 1),
(3181, 208, 'RV', 'Ruvuma', 1),
(3182, 208, 'SH', 'Shinyanga', 1),
(3183, 208, 'SI', 'Singida', 1),
(3184, 208, 'TB', 'Tabora', 1),
(3185, 208, 'TN', 'Tanga', 1),
(3186, 208, 'ZC', 'Zanzibar Central/South', 1),
(3187, 208, 'ZN', 'Zanzibar North', 1),
(3188, 208, 'ZU', 'Zanzibar Urban/West', 1),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 1),
(3190, 209, 'Ang Thong', 'Ang Thong', 1),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 1),
(3192, 209, 'Bangkok', 'Bangkok', 1),
(3193, 209, 'Buriram', 'Buriram', 1),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 1),
(3195, 209, 'Chai Nat', 'Chai Nat', 1),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 1),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 1),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 1),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 1),
(3200, 209, 'Chon Buri', 'Chon Buri', 1),
(3201, 209, 'Chumphon', 'Chumphon', 1),
(3202, 209, 'Kalasin', 'Kalasin', 1),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 1),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 1),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 1),
(3206, 209, 'Krabi', 'Krabi', 1),
(3207, 209, 'Lampang', 'Lampang', 1),
(3208, 209, 'Lamphun', 'Lamphun', 1),
(3209, 209, 'Loei', 'Loei', 1),
(3210, 209, 'Lop Buri', 'Lop Buri', 1),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 1),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 1),
(3213, 209, 'Mukdahan', 'Mukdahan', 1),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 1),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 1),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 1),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 1),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 1),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 1),
(3220, 209, 'Nan', 'Nan', 1),
(3221, 209, 'Narathiwat', 'Narathiwat', 1),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 1),
(3223, 209, 'Nong Khai', 'Nong Khai', 1),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 1),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 1),
(3226, 209, 'Pattani', 'Pattani', 1),
(3227, 209, 'Phangnga', 'Phangnga', 1),
(3228, 209, 'Phatthalung', 'Phatthalung', 1),
(3229, 209, 'Phayao', 'Phayao', 1),
(3230, 209, 'Phetchabun', 'Phetchabun', 1),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 1),
(3232, 209, 'Phichit', 'Phichit', 1),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 1),
(3234, 209, 'Phrae', 'Phrae', 1),
(3235, 209, 'Phuket', 'Phuket', 1),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 1),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 1),
(3238, 209, 'Ranong', 'Ranong', 1),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 1),
(3240, 209, 'Rayong', 'Rayong', 1),
(3241, 209, 'Roi Et', 'Roi Et', 1),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 1),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 1),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 1),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 1),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 1),
(3247, 209, 'Sara Buri', 'Sara Buri', 1),
(3248, 209, 'Satun', 'Satun', 1),
(3249, 209, 'Sing Buri', 'Sing Buri', 1),
(3250, 209, 'Sisaket', 'Sisaket', 1),
(3251, 209, 'Songkhla', 'Songkhla', 1),
(3252, 209, 'Sukhothai', 'Sukhothai', 1),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 1),
(3254, 209, 'Surat Thani', 'Surat Thani', 1),
(3255, 209, 'Surin', 'Surin', 1),
(3256, 209, 'Tak', 'Tak', 1),
(3257, 209, 'Trang', 'Trang', 1),
(3258, 209, 'Trat', 'Trat', 1),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 1),
(3260, 209, 'Udon Thani', 'Udon Thani', 1),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 1),
(3262, 209, 'Uttaradit', 'Uttaradit', 1),
(3263, 209, 'Yala', 'Yala', 1),
(3264, 209, 'Yasothon', 'Yasothon', 1),
(3265, 210, 'K', 'Kara', 1),
(3266, 210, 'P', 'Plateaux', 1),
(3267, 210, 'S', 'Savanes', 1),
(3268, 210, 'C', 'Centrale', 1),
(3269, 210, 'M', 'Maritime', 1),
(3270, 211, 'A', 'Atafu', 1),
(3271, 211, 'F', 'Fakaofo', 1),
(3272, 211, 'N', 'Nukunonu', 1),
(3273, 212, 'H', 'Ha''apai', 1),
(3274, 212, 'T', 'Tongatapu', 1),
(3275, 212, 'V', 'Vava''u', 1),
(3276, 213, 'CT', 'Couva/Tabaquite/Talparo', 1),
(3277, 213, 'DM', 'Diego Martin', 1),
(3278, 213, 'MR', 'Mayaro/Rio Claro', 1),
(3279, 213, 'PD', 'Penal/Debe', 1),
(3280, 213, 'PT', 'Princes Town', 1),
(3281, 213, 'SG', 'Sangre Grande', 1),
(3282, 213, 'SL', 'San Juan/Laventille', 1),
(3283, 213, 'SI', 'Siparia', 1),
(3284, 213, 'TP', 'Tunapuna/Piarco', 1),
(3285, 213, 'PS', 'Port of Spain', 1),
(3286, 213, 'SF', 'San Fernando', 1),
(3287, 213, 'AR', 'Arima', 1),
(3288, 213, 'PF', 'Point Fortin', 1),
(3289, 213, 'CH', 'Chaguanas', 1),
(3290, 213, 'TO', 'Tobago', 1),
(3291, 214, 'AR', 'Ariana', 1),
(3292, 214, 'BJ', 'Beja', 1),
(3293, 214, 'BA', 'Ben Arous', 1),
(3294, 214, 'BI', 'Bizerte', 1),
(3295, 214, 'GB', 'Gabes', 1),
(3296, 214, 'GF', 'Gafsa', 1),
(3297, 214, 'JE', 'Jendouba', 1),
(3298, 214, 'KR', 'Kairouan', 1),
(3299, 214, 'KS', 'Kasserine', 1),
(3300, 214, 'KB', 'Kebili', 1),
(3301, 214, 'KF', 'Kef', 1),
(3302, 214, 'MH', 'Mahdia', 1),
(3303, 214, 'MN', 'Manouba', 1),
(3304, 214, 'ME', 'Medenine', 1),
(3305, 214, 'MO', 'Monastir', 1),
(3306, 214, 'NA', 'Nabeul', 1),
(3307, 214, 'SF', 'Sfax', 1),
(3308, 214, 'SD', 'Sidi', 1),
(3309, 214, 'SL', 'Siliana', 1),
(3310, 214, 'SO', 'Sousse', 1),
(3311, 214, 'TA', 'Tataouine', 1),
(3312, 214, 'TO', 'Tozeur', 1),
(3313, 214, 'TU', 'Tunis', 1),
(3314, 214, 'ZA', 'Zaghouan', 1),
(3315, 215, 'ADA', 'Adana', 1),
(3316, 215, 'ADI', 'Adıyaman', 1),
(3317, 215, 'AFY', 'Afyonkarahisar', 1),
(3318, 215, 'AGR', 'Ağrı', 1),
(3319, 215, 'AKS', 'Aksaray', 1),
(3320, 215, 'AMA', 'Amasya', 1),
(3321, 215, 'ANK', 'Ankara', 1),
(3322, 215, 'ANT', 'Antalya', 1),
(3323, 215, 'ARD', 'Ardahan', 1),
(3324, 215, 'ART', 'Artvin', 1),
(3325, 215, 'AYI', 'Aydın', 1),
(3326, 215, 'BAL', 'Balıkesir', 1),
(3327, 215, 'BAR', 'Bartın', 1),
(3328, 215, 'BAT', 'Batman', 1),
(3329, 215, 'BAY', 'Bayburt', 1),
(3330, 215, 'BIL', 'Bilecik', 1),
(3331, 215, 'BIN', 'Bingöl', 1),
(3332, 215, 'BIT', 'Bitlis', 1),
(3333, 215, 'BOL', 'Bolu', 1),
(3334, 215, 'BRD', 'Burdur', 1),
(3335, 215, 'BRS', 'Bursa', 1),
(3336, 215, 'CKL', 'Çanakkale', 1),
(3337, 215, 'CKR', 'Çankırı', 1),
(3338, 215, 'COR', 'Çorum', 1),
(3339, 215, 'DEN', 'Denizli', 1),
(3340, 215, 'DIY', 'Diyarbakir', 1),
(3341, 215, 'DUZ', 'Düzce', 1),
(3342, 215, 'EDI', 'Edirne', 1),
(3343, 215, 'ELA', 'Elazig', 1),
(3344, 215, 'EZC', 'Erzincan', 1),
(3345, 215, 'EZR', 'Erzurum', 1),
(3346, 215, 'ESK', 'Eskişehir', 1),
(3347, 215, 'GAZ', 'Gaziantep', 1),
(3348, 215, 'GIR', 'Giresun', 1),
(3349, 215, 'GMS', 'Gümüşhane', 1),
(3350, 215, 'HKR', 'Hakkari', 1),
(3351, 215, 'HTY', 'Hatay', 1),
(3352, 215, 'IGD', 'Iğdır', 1),
(3353, 215, 'ISP', 'Isparta', 1),
(3354, 215, 'IST', 'İstanbul', 1),
(3355, 215, 'IZM', 'İzmir', 1),
(3356, 215, 'KAH', 'Kahramanmaraş', 1),
(3357, 215, 'KRB', 'Karabük', 1),
(3358, 215, 'KRM', 'Karaman', 1),
(3359, 215, 'KRS', 'Kars', 1),
(3360, 215, 'KAS', 'Kastamonu', 1),
(3361, 215, 'KAY', 'Kayseri', 1),
(3362, 215, 'KLS', 'Kilis', 1),
(3363, 215, 'KRK', 'Kirikkale', 1),
(3364, 215, 'KLR', 'Kirklareli', 1),
(3365, 215, 'KRH', 'Kirsehir', 1),
(3366, 215, 'KOC', 'Kocaeli', 1),
(3367, 215, 'KON', 'Konya', 1),
(3368, 215, 'KUT', 'Kütahya', 1),
(3369, 215, 'MAL', 'Malatya', 1),
(3370, 215, 'MAN', 'Manisa', 1),
(3371, 215, 'MAR', 'Mardin', 1),
(3372, 215, 'MER', 'Mersin', 1),
(3373, 215, 'MUG', 'Muğla', 1),
(3374, 215, 'MUS', 'Muş', 1),
(3375, 215, 'NEV', 'Nevşehir', 1),
(3376, 215, 'NIG', 'Niğde', 1),
(3377, 215, 'ORD', 'Ordu', 1),
(3378, 215, 'OSM', 'Osmaniye', 1),
(3379, 215, 'RIZ', 'Rize', 1),
(3380, 215, 'SAK', 'Sakarya', 1),
(3381, 215, 'SAM', 'Samsun', 1),
(3382, 215, 'SAN', 'Şanlıurfa', 1),
(3383, 215, 'SII', 'Siirt', 1),
(3384, 215, 'SIN', 'Sinop', 1),
(3385, 215, 'SIR', 'Şırnak', 1),
(3386, 215, 'SIV', 'Sivas', 1),
(3387, 215, 'TEL', 'Tekirdağ', 1),
(3388, 215, 'TOK', 'Tokat', 1),
(3389, 215, 'TRA', 'Trabzon', 1),
(3390, 215, 'TUN', 'Tunceli', 1),
(3391, 215, 'USK', 'Uşak', 1),
(3392, 215, 'VAN', 'Van', 1),
(3393, 215, 'YAL', 'Yalova', 1),
(3394, 215, 'YOZ', 'Yozgat', 1),
(3395, 215, 'ZON', 'Zonguldak', 1),
(3396, 216, 'A', 'Ahal Welayaty', 1),
(3397, 216, 'B', 'Balkan Welayaty', 1),
(3398, 216, 'D', 'Dashhowuz Welayaty', 1),
(3399, 216, 'L', 'Lebap Welayaty', 1),
(3400, 216, 'M', 'Mary Welayaty', 1),
(3401, 217, 'AC', 'Ambergris Cays', 1),
(3402, 217, 'DC', 'Dellis Cay', 1),
(3403, 217, 'FC', 'French Cay', 1),
(3404, 217, 'LW', 'Little Water Cay', 1),
(3405, 217, 'RC', 'Parrot Cay', 1),
(3406, 217, 'PN', 'Pine Cay', 1),
(3407, 217, 'SL', 'Salt Cay', 1),
(3408, 217, 'GT', 'Grand Turk', 1),
(3409, 217, 'SC', 'South Caicos', 1),
(3410, 217, 'EC', 'East Caicos', 1),
(3411, 217, 'MC', 'Middle Caicos', 1),
(3412, 217, 'NC', 'North Caicos', 1),
(3413, 217, 'PR', 'Providenciales', 1),
(3414, 217, 'WC', 'West Caicos', 1),
(3415, 218, 'NMG', 'Nanumanga', 1),
(3416, 218, 'NLK', 'Niulakita', 1),
(3417, 218, 'NTO', 'Niutao', 1),
(3418, 218, 'FUN', 'Funafuti', 1),
(3419, 218, 'NME', 'Nanumea', 1),
(3420, 218, 'NUI', 'Nui', 1),
(3421, 218, 'NFT', 'Nukufetau', 1),
(3422, 218, 'NLL', 'Nukulaelae', 1),
(3423, 218, 'VAI', 'Vaitupu', 1),
(3424, 219, 'KAL', 'Kalangala', 1),
(3425, 219, 'KMP', 'Kampala', 1),
(3426, 219, 'KAY', 'Kayunga', 1),
(3427, 219, 'KIB', 'Kiboga', 1),
(3428, 219, 'LUW', 'Luwero', 1),
(3429, 219, 'MAS', 'Masaka', 1),
(3430, 219, 'MPI', 'Mpigi', 1),
(3431, 219, 'MUB', 'Mubende', 1),
(3432, 219, 'MUK', 'Mukono', 1),
(3433, 219, 'NKS', 'Nakasongola', 1),
(3434, 219, 'RAK', 'Rakai', 1),
(3435, 219, 'SEM', 'Sembabule', 1),
(3436, 219, 'WAK', 'Wakiso', 1),
(3437, 219, 'BUG', 'Bugiri', 1),
(3438, 219, 'BUS', 'Busia', 1),
(3439, 219, 'IGA', 'Iganga', 1),
(3440, 219, 'JIN', 'Jinja', 1),
(3441, 219, 'KAB', 'Kaberamaido', 1),
(3442, 219, 'KML', 'Kamuli', 1),
(3443, 219, 'KPC', 'Kapchorwa', 1),
(3444, 219, 'KTK', 'Katakwi', 1),
(3445, 219, 'KUM', 'Kumi', 1),
(3446, 219, 'MAY', 'Mayuge', 1),
(3447, 219, 'MBA', 'Mbale', 1),
(3448, 219, 'PAL', 'Pallisa', 1),
(3449, 219, 'SIR', 'Sironko', 1),
(3450, 219, 'SOR', 'Soroti', 1),
(3451, 219, 'TOR', 'Tororo', 1),
(3452, 219, 'ADJ', 'Adjumani', 1),
(3453, 219, 'APC', 'Apac', 1),
(3454, 219, 'ARU', 'Arua', 1),
(3455, 219, 'GUL', 'Gulu', 1),
(3456, 219, 'KIT', 'Kitgum', 1),
(3457, 219, 'KOT', 'Kotido', 1),
(3458, 219, 'LIR', 'Lira', 1),
(3459, 219, 'MRT', 'Moroto', 1),
(3460, 219, 'MOY', 'Moyo', 1),
(3461, 219, 'NAK', 'Nakapiripirit', 1),
(3462, 219, 'NEB', 'Nebbi', 1),
(3463, 219, 'PAD', 'Pader', 1),
(3464, 219, 'YUM', 'Yumbe', 1),
(3465, 219, 'BUN', 'Bundibugyo', 1),
(3466, 219, 'BSH', 'Bushenyi', 1),
(3467, 219, 'HOI', 'Hoima', 1),
(3468, 219, 'KBL', 'Kabale', 1),
(3469, 219, 'KAR', 'Kabarole', 1),
(3470, 219, 'KAM', 'Kamwenge', 1),
(3471, 219, 'KAN', 'Kanungu', 1),
(3472, 219, 'KAS', 'Kasese', 1),
(3473, 219, 'KBA', 'Kibaale', 1),
(3474, 219, 'KIS', 'Kisoro', 1),
(3475, 219, 'KYE', 'Kyenjojo', 1),
(3476, 219, 'MSN', 'Masindi', 1),
(3477, 219, 'MBR', 'Mbarara', 1),
(3478, 219, 'NTU', 'Ntungamo', 1),
(3479, 219, 'RUK', 'Rukungiri', 1),
(3480, 220, 'CK', 'Cherkasy', 1),
(3481, 220, 'CH', 'Chernihiv', 1),
(3482, 220, 'CV', 'Chernivtsi', 1),
(3483, 220, 'CR', 'Crimea', 1),
(3484, 220, 'DN', 'Dnipropetrovs''k', 1),
(3485, 220, 'DO', 'Donets''k', 1),
(3486, 220, 'IV', 'Ivano-Frankivs''k', 1),
(3487, 220, 'KL', 'Kharkiv Kherson', 1),
(3488, 220, 'KM', 'Khmel''nyts''kyy', 1),
(3489, 220, 'KR', 'Kirovohrad', 1),
(3490, 220, 'KV', 'Kiev', 1),
(3491, 220, 'KY', 'Kyyiv', 1),
(3492, 220, 'LU', 'Luhans''k', 1),
(3493, 220, 'LV', 'L''viv', 1),
(3494, 220, 'MY', 'Mykolayiv', 1),
(3495, 220, 'OD', 'Odesa', 1),
(3496, 220, 'PO', 'Poltava', 1),
(3497, 220, 'RI', 'Rivne', 1),
(3498, 220, 'SE', 'Sevastopol', 1),
(3499, 220, 'SU', 'Sumy', 1),
(3500, 220, 'TE', 'Ternopil''', 1),
(3501, 220, 'VI', 'Vinnytsya', 1),
(3502, 220, 'VO', 'Volyn''', 1),
(3503, 220, 'ZK', 'Zakarpattya', 1),
(3504, 220, 'ZA', 'Zaporizhzhya', 1),
(3505, 220, 'ZH', 'Zhytomyr', 1),
(3506, 221, 'AZ', 'Abu Zaby', 1),
(3507, 221, 'AJ', '''Ajman', 1),
(3508, 221, 'FU', 'Al Fujayrah', 1),
(3509, 221, 'SH', 'Ash Shariqah', 1),
(3510, 221, 'DU', 'Dubayy', 1),
(3511, 221, 'RK', 'R''as al Khaymah', 1),
(3512, 221, 'UQ', 'Umm al Qaywayn', 1),
(3513, 222, 'ABN', 'Aberdeen', 1),
(3514, 222, 'ABNS', 'Aberdeenshire', 1),
(3515, 222, 'ANG', 'Anglesey', 1),
(3516, 222, 'AGS', 'Angus', 1),
(3517, 222, 'ARY', 'Argyll and Bute', 1),
(3518, 222, 'BEDS', 'Bedfordshire', 1),
(3519, 222, 'BERKS', 'Berkshire', 1),
(3520, 222, 'BLA', 'Blaenau Gwent', 1),
(3521, 222, 'BRI', 'Bridgend', 1),
(3522, 222, 'BSTL', 'Bristol', 1),
(3523, 222, 'BUCKS', 'Buckinghamshire', 1),
(3524, 222, 'CAE', 'Caerphilly', 1),
(3525, 222, 'CAMBS', 'Cambridgeshire', 1),
(3526, 222, 'CDF', 'Cardiff', 1),
(3527, 222, 'CARM', 'Carmarthenshire', 1),
(3528, 222, 'CDGN', 'Ceredigion', 1),
(3529, 222, 'CHES', 'Cheshire', 1),
(3530, 222, 'CLACK', 'Clackmannanshire', 1),
(3531, 222, 'CON', 'Conwy', 1),
(3532, 222, 'CORN', 'Cornwall', 1),
(3533, 222, 'DNBG', 'Denbighshire', 1),
(3534, 222, 'DERBY', 'Derbyshire', 1),
(3535, 222, 'DVN', 'Devon', 1),
(3536, 222, 'DOR', 'Dorset', 1),
(3537, 222, 'DGL', 'Dumfries and Galloway', 1),
(3538, 222, 'DUND', 'Dundee', 1),
(3539, 222, 'DHM', 'Durham', 1),
(3540, 222, 'ARYE', 'East Ayrshire', 1),
(3541, 222, 'DUNBE', 'East Dunbartonshire', 1),
(3542, 222, 'LOTE', 'East Lothian', 1),
(3543, 222, 'RENE', 'East Renfrewshire', 1),
(3544, 222, 'ERYS', 'East Riding of Yorkshire', 1),
(3545, 222, 'SXE', 'East Sussex', 1),
(3546, 222, 'EDIN', 'Edinburgh', 1),
(3547, 222, 'ESX', 'Essex', 1),
(3548, 222, 'FALK', 'Falkirk', 1),
(3549, 222, 'FFE', 'Fife', 1),
(3550, 222, 'FLINT', 'Flintshire', 1),
(3551, 222, 'GLAS', 'Glasgow', 1),
(3552, 222, 'GLOS', 'Gloucestershire', 1),
(3553, 222, 'LDN', 'Greater London', 1),
(3554, 222, 'MCH', 'Greater Manchester', 1),
(3555, 222, 'GDD', 'Gwynedd', 1),
(3556, 222, 'HANTS', 'Hampshire', 1),
(3557, 222, 'HWR', 'Herefordshire', 1),
(3558, 222, 'HERTS', 'Hertfordshire', 1),
(3559, 222, 'HLD', 'Highlands', 1),
(3560, 222, 'IVER', 'Inverclyde', 1),
(3561, 222, 'IOW', 'Isle of Wight', 1),
(3562, 222, 'KNT', 'Kent', 1),
(3563, 222, 'LANCS', 'Lancashire', 1),
(3564, 222, 'LEICS', 'Leicestershire', 1),
(3565, 222, 'LINCS', 'Lincolnshire', 1),
(3566, 222, 'MSY', 'Merseyside', 1),
(3567, 222, 'MERT', 'Merthyr Tydfil', 1),
(3568, 222, 'MLOT', 'Midlothian', 1),
(3569, 222, 'MMOUTH', 'Monmouthshire', 1),
(3570, 222, 'MORAY', 'Moray', 1),
(3571, 222, 'NPRTAL', 'Neath Port Talbot', 1),
(3572, 222, 'NEWPT', 'Newport', 1),
(3573, 222, 'NOR', 'Norfolk', 1),
(3574, 222, 'ARYN', 'North Ayrshire', 1),
(3575, 222, 'LANN', 'North Lanarkshire', 1),
(3576, 222, 'YSN', 'North Yorkshire', 1),
(3577, 222, 'NHM', 'Northamptonshire', 1),
(3578, 222, 'NLD', 'Northumberland', 1),
(3579, 222, 'NOT', 'Nottinghamshire', 1),
(3580, 222, 'ORK', 'Orkney Islands', 1),
(3581, 222, 'OFE', 'Oxfordshire', 1),
(3582, 222, 'PEM', 'Pembrokeshire', 1),
(3583, 222, 'PERTH', 'Perth and Kinross', 1),
(3584, 222, 'PWS', 'Powys', 1),
(3585, 222, 'REN', 'Renfrewshire', 1),
(3586, 222, 'RHON', 'Rhondda Cynon Taff', 1),
(3587, 222, 'RUT', 'Rutland', 1),
(3588, 222, 'BOR', 'Scottish Borders', 1),
(3589, 222, 'SHET', 'Shetland Islands', 1),
(3590, 222, 'SPE', 'Shropshire', 1),
(3591, 222, 'SOM', 'Somerset', 1),
(3592, 222, 'ARYS', 'South Ayrshire', 1),
(3593, 222, 'LANS', 'South Lanarkshire', 1),
(3594, 222, 'YSS', 'South Yorkshire', 1),
(3595, 222, 'SFD', 'Staffordshire', 1),
(3596, 222, 'STIR', 'Stirling', 1),
(3597, 222, 'SFK', 'Suffolk', 1),
(3598, 222, 'SRY', 'Surrey', 1),
(3599, 222, 'SWAN', 'Swansea', 1),
(3600, 222, 'TORF', 'Torfaen', 1),
(3601, 222, 'TWR', 'Tyne and Wear', 1),
(3602, 222, 'VGLAM', 'Vale of Glamorgan', 1),
(3603, 222, 'WARKS', 'Warwickshire', 1),
(3604, 222, 'WDUN', 'West Dunbartonshire', 1),
(3605, 222, 'WLOT', 'West Lothian', 1),
(3606, 222, 'WMD', 'West Midlands', 1),
(3607, 222, 'SXW', 'West Sussex', 1),
(3608, 222, 'YSW', 'West Yorkshire', 1),
(3609, 222, 'WIL', 'Western Isles', 1),
(3610, 222, 'WLT', 'Wiltshire', 1),
(3611, 222, 'WORCS', 'Worcestershire', 1),
(3612, 222, 'WRX', 'Wrexham', 1),
(3613, 223, 'AL', 'Alabama', 1),
(3614, 223, 'AK', 'Alaska', 1),
(3615, 223, 'AS', 'American Samoa', 1),
(3616, 223, 'AZ', 'Arizona', 1),
(3617, 223, 'AR', 'Arkansas', 1),
(3618, 223, 'AF', 'Armed Forces Africa', 1),
(3619, 223, 'AA', 'Armed Forces Americas', 1),
(3620, 223, 'AC', 'Armed Forces Canada', 1),
(3621, 223, 'AE', 'Armed Forces Europe', 1),
(3622, 223, 'AM', 'Armed Forces Middle East', 1),
(3623, 223, 'AP', 'Armed Forces Pacific', 1),
(3624, 223, 'CA', 'California', 1),
(3625, 223, 'CO', 'Colorado', 1),
(3626, 223, 'CT', 'Connecticut', 1),
(3627, 223, 'DE', 'Delaware', 1),
(3628, 223, 'DC', 'District of Columbia', 1),
(3629, 223, 'FM', 'Federated States Of Micronesia', 1),
(3630, 223, 'FL', 'Florida', 1),
(3631, 223, 'GA', 'Georgia', 1),
(3632, 223, 'GU', 'Guam', 1),
(3633, 223, 'HI', 'Hawaii', 1),
(3634, 223, 'ID', 'Idaho', 1),
(3635, 223, 'IL', 'Illinois', 1),
(3636, 223, 'IN', 'Indiana', 1),
(3637, 223, 'IA', 'Iowa', 1),
(3638, 223, 'KS', 'Kansas', 1),
(3639, 223, 'KY', 'Kentucky', 1),
(3640, 223, 'LA', 'Louisiana', 1),
(3641, 223, 'ME', 'Maine', 1),
(3642, 223, 'MH', 'Marshall Islands', 1),
(3643, 223, 'MD', 'Maryland', 1),
(3644, 223, 'MA', 'Massachusetts', 1),
(3645, 223, 'MI', 'Michigan', 1),
(3646, 223, 'MN', 'Minnesota', 1),
(3647, 223, 'MS', 'Mississippi', 1),
(3648, 223, 'MO', 'Missouri', 1),
(3649, 223, 'MT', 'Montana', 1),
(3650, 223, 'NE', 'Nebraska', 1),
(3651, 223, 'NV', 'Nevada', 1),
(3652, 223, 'NH', 'New Hampshire', 1),
(3653, 223, 'NJ', 'New Jersey', 1),
(3654, 223, 'NM', 'New Mexico', 1),
(3655, 223, 'NY', 'New York', 1),
(3656, 223, 'NC', 'North Carolina', 1),
(3657, 223, 'ND', 'North Dakota', 1),
(3658, 223, 'MP', 'Northern Mariana Islands', 1),
(3659, 223, 'OH', 'Ohio', 1),
(3660, 223, 'OK', 'Oklahoma', 1),
(3661, 223, 'OR', 'Oregon', 1),
(3662, 223, 'PW', 'Palau', 1),
(3663, 223, 'PA', 'Pennsylvania', 1),
(3664, 223, 'PR', 'Puerto Rico', 1),
(3665, 223, 'RI', 'Rhode Island', 1),
(3666, 223, 'SC', 'South Carolina', 1),
(3667, 223, 'SD', 'South Dakota', 1),
(3668, 223, 'TN', 'Tennessee', 1),
(3669, 223, 'TX', 'Texas', 1),
(3670, 223, 'UT', 'Utah', 1),
(3671, 223, 'VT', 'Vermont', 1),
(3672, 223, 'VI', 'Virgin Islands', 1),
(3673, 223, 'VA', 'Virginia', 1),
(3674, 223, 'WA', 'Washington', 1),
(3675, 223, 'WV', 'West Virginia', 1),
(3676, 223, 'WI', 'Wisconsin', 1),
(3677, 223, 'WY', 'Wyoming', 1),
(3678, 224, 'BI', 'Baker Island', 1),
(3679, 224, 'HI', 'Howland Island', 1),
(3680, 224, 'JI', 'Jarvis Island', 1),
(3681, 224, 'JA', 'Johnston Atoll', 1),
(3682, 224, 'KR', 'Kingman Reef', 1),
(3683, 224, 'MA', 'Midway Atoll', 1),
(3684, 224, 'NI', 'Navassa Island', 1),
(3685, 224, 'PA', 'Palmyra Atoll', 1),
(3686, 224, 'WI', 'Wake Island', 1),
(3687, 225, 'AR', 'Artigas', 1),
(3688, 225, 'CA', 'Canelones', 1),
(3689, 225, 'CL', 'Cerro Largo', 1),
(3690, 225, 'CO', 'Colonia', 1),
(3691, 225, 'DU', 'Durazno', 1),
(3692, 225, 'FS', 'Flores', 1),
(3693, 225, 'FA', 'Florida', 1),
(3694, 225, 'LA', 'Lavalleja', 1),
(3695, 225, 'MA', 'Maldonado', 1),
(3696, 225, 'MO', 'Montevideo', 1),
(3697, 225, 'PA', 'Paysandu', 1),
(3698, 225, 'RN', 'Rio Negro', 1),
(3699, 225, 'RV', 'Rivera', 1),
(3700, 225, 'RO', 'Rocha', 1),
(3701, 225, 'SL', 'Salto', 1),
(3702, 225, 'SJ', 'San Jose', 1),
(3703, 225, 'SO', 'Soriano', 1),
(3704, 225, 'TA', 'Tacuarembo', 1),
(3705, 225, 'TT', 'Treinta y Tres', 1),
(3706, 226, 'AN', 'Andijon', 1),
(3707, 226, 'BU', 'Buxoro', 1),
(3708, 226, 'FA', 'Farg''ona', 1),
(3709, 226, 'JI', 'Jizzax', 1),
(3710, 226, 'NG', 'Namangan', 1),
(3711, 226, 'NW', 'Navoiy', 1),
(3712, 226, 'QA', 'Qashqadaryo', 1),
(3713, 226, 'QR', 'Qoraqalpog''iston Republikasi', 1),
(3714, 226, 'SA', 'Samarqand', 1),
(3715, 226, 'SI', 'Sirdaryo', 1),
(3716, 226, 'SU', 'Surxondaryo', 1),
(3717, 226, 'TK', 'Toshkent City', 1),
(3718, 226, 'TO', 'Toshkent Region', 1),
(3719, 226, 'XO', 'Xorazm', 1),
(3720, 227, 'MA', 'Malampa', 1),
(3721, 227, 'PE', 'Penama', 1),
(3722, 227, 'SA', 'Sanma', 1),
(3723, 227, 'SH', 'Shefa', 1),
(3724, 227, 'TA', 'Tafea', 1),
(3725, 227, 'TO', 'Torba', 1),
(3726, 229, 'AM', 'Amazonas', 1),
(3727, 229, 'AN', 'Anzoategui', 1),
(3728, 229, 'AP', 'Apure', 1),
(3729, 229, 'AR', 'Aragua', 1),
(3730, 229, 'BA', 'Barinas', 1),
(3731, 229, 'BO', 'Bolivar', 1),
(3732, 229, 'CA', 'Carabobo', 1),
(3733, 229, 'CO', 'Cojedes', 1),
(3734, 229, 'DA', 'Delta Amacuro', 1),
(3735, 229, 'DF', 'Dependencias Federales', 1),
(3736, 229, 'DI', 'Distrito Federal', 1),
(3737, 229, 'FA', 'Falcon', 1),
(3738, 229, 'GU', 'Guarico', 1),
(3739, 229, 'LA', 'Lara', 1),
(3740, 229, 'ME', 'Merida', 1),
(3741, 229, 'MI', 'Miranda', 1),
(3742, 229, 'MO', 'Monagas', 1),
(3743, 229, 'NE', 'Nueva Esparta', 1),
(3744, 229, 'PO', 'Portuguesa', 1),
(3745, 229, 'SU', 'Sucre', 1),
(3746, 229, 'TA', 'Tachira', 1),
(3747, 229, 'TR', 'Trujillo', 1),
(3748, 229, 'VA', 'Vargas', 1),
(3749, 229, 'YA', 'Yaracuy', 1),
(3750, 229, 'ZU', 'Zulia', 1),
(3751, 230, 'AG', 'An Giang', 1),
(3752, 230, 'BG', 'Bac Giang', 1),
(3753, 230, 'BK', 'Bac Kan', 1),
(3754, 230, 'BL', 'Bac Lieu', 1),
(3755, 230, 'BC', 'Bac Ninh', 1),
(3756, 230, 'BR', 'Ba Ria-Vung Tau', 1),
(3757, 230, 'BN', 'Ben Tre', 1),
(3758, 230, 'BH', 'Binh Dinh', 1),
(3759, 230, 'BU', 'Binh Duong', 1),
(3760, 230, 'BP', 'Binh Phuoc', 1),
(3761, 230, 'BT', 'Binh Thuan', 1),
(3762, 230, 'CM', 'Ca Mau', 1),
(3763, 230, 'CT', 'Can Tho', 1),
(3764, 230, 'CB', 'Cao Bang', 1),
(3765, 230, 'DL', 'Dak Lak', 1),
(3766, 230, 'DG', 'Dak Nong', 1),
(3767, 230, 'DN', 'Da Nang', 1),
(3768, 230, 'DB', 'Dien Bien', 1),
(3769, 230, 'DI', 'Dong Nai', 1),
(3770, 230, 'DT', 'Dong Thap', 1),
(3771, 230, 'GL', 'Gia Lai', 1),
(3772, 230, 'HG', 'Ha Giang', 1),
(3773, 230, 'HD', 'Hai Duong', 1),
(3774, 230, 'HP', 'Hai Phong', 1),
(3775, 230, 'HM', 'Ha Nam', 1),
(3776, 230, 'HI', 'Ha Noi', 1),
(3777, 230, 'HT', 'Ha Tay', 1),
(3778, 230, 'HH', 'Ha Tinh', 1),
(3779, 230, 'HB', 'Hoa Binh', 1),
(3780, 230, 'HC', 'Ho Chi Minh City', 1),
(3781, 230, 'HU', 'Hau Giang', 1),
(3782, 230, 'HY', 'Hung Yen', 1),
(3783, 232, 'C', 'Saint Croix', 1),
(3784, 232, 'J', 'Saint John', 1),
(3785, 232, 'T', 'Saint Thomas', 1),
(3786, 233, 'A', 'Alo', 1),
(3787, 233, 'S', 'Sigave', 1),
(3788, 233, 'W', 'Wallis', 1),
(3789, 235, 'AB', 'Abyan', 1),
(3790, 235, 'AD', 'Adan', 1),
(3791, 235, 'AM', 'Amran', 1),
(3792, 235, 'BA', 'Al Bayda', 1),
(3793, 235, 'DA', 'Ad Dali', 1),
(3794, 235, 'DH', 'Dhamar', 1),
(3795, 235, 'HD', 'Hadramawt', 1),
(3796, 235, 'HJ', 'Hajjah', 1),
(3797, 235, 'HU', 'Al Hudaydah', 1),
(3798, 235, 'IB', 'Ibb', 1),
(3799, 235, 'JA', 'Al Jawf', 1),
(3800, 235, 'LA', 'Lahij', 1),
(3801, 235, 'MA', 'Ma''rib', 1),
(3802, 235, 'MR', 'Al Mahrah', 1),
(3803, 235, 'MW', 'Al Mahwit', 1),
(3804, 235, 'SD', 'Sa''dah', 1),
(3805, 235, 'SN', 'San''a', 1),
(3806, 235, 'SH', 'Shabwah', 1),
(3807, 235, 'TA', 'Ta''izz', 1),
(3808, 236, 'KOS', 'Kosovo', 1),
(3809, 236, 'MON', 'Montenegro', 1),
(3810, 236, 'SER', 'Serbia', 1),
(3811, 236, 'VOJ', 'Vojvodina', 1),
(3812, 237, 'BC', 'Bas-Congo', 1),
(3813, 237, 'BN', 'Bandundu', 1),
(3814, 237, 'EQ', 'Equateur', 1),
(3815, 237, 'KA', 'Katanga', 1),
(3816, 237, 'KE', 'Kasai-Oriental', 1),
(3817, 237, 'KN', 'Kinshasa', 1),
(3818, 237, 'KW', 'Kasai-Occidental', 1),
(3819, 237, 'MA', 'Maniema', 1),
(3820, 237, 'NK', 'Nord-Kivu', 1),
(3821, 237, 'OR', 'Orientale', 1),
(3822, 237, 'SK', 'Sud-Kivu', 1),
(3823, 238, 'CE', 'Central', 1),
(3824, 238, 'CB', 'Copperbelt', 1),
(3825, 238, 'EA', 'Eastern', 1),
(3826, 238, 'LP', 'Luapula', 1),
(3827, 238, 'LK', 'Lusaka', 1),
(3828, 238, 'NO', 'Northern', 1),
(3829, 238, 'NW', 'North-Western', 1),
(3830, 238, 'SO', 'Southern', 1),
(3831, 238, 'WE', 'Western', 1),
(3832, 239, 'BU', 'Bulawayo', 1),
(3833, 239, 'HA', 'Harare', 1),
(3834, 239, 'ML', 'Manicaland', 1),
(3835, 239, 'MC', 'Mashonaland Central', 1),
(3836, 239, 'ME', 'Mashonaland East', 1),
(3837, 239, 'MW', 'Mashonaland West', 1),
(3838, 239, 'MV', 'Masvingo', 1),
(3839, 239, 'MN', 'Matabeleland North', 1),
(3840, 239, 'MS', 'Matabeleland South', 1),
(3841, 239, 'MD', 'Midlands', 1),
(3842, 105, 'AG', 'Agrigento', 1),
(3843, 105, 'AL', 'Alessandria', 1),
(3844, 105, 'AN', 'Ancona', 1),
(3845, 105, 'AO', 'Aosta', 1),
(3846, 105, 'AR', 'Arezzo', 1),
(3847, 105, 'AP', 'Ascoli Piceno', 1),
(3848, 105, 'AT', 'Asti', 1),
(3849, 105, 'AV', 'Avellino', 1),
(3850, 105, 'BA', 'Bari', 1),
(3851, 105, 'BL', 'Belluno', 1),
(3852, 105, 'BN', 'Benevento', 1),
(3853, 105, 'BG', 'Bergamo', 1),
(3854, 105, 'BI', 'Biella', 1),
(3855, 105, 'BO', 'Bologna', 1),
(3856, 105, 'BZ', 'Bolzano', 1),
(3857, 105, 'BS', 'Brescia', 1),
(3858, 105, 'BR', 'Brindisi', 1),
(3859, 105, 'CA', 'Cagliari', 1),
(3860, 105, 'CL', 'Caltanissetta', 1),
(3861, 105, 'CB', 'Campobasso', 1),
(3862, 105, 'CI', 'Carbonia-Iglesias', 1),
(3863, 105, 'CE', 'Caserta', 1),
(3864, 105, 'CT', 'Catania', 1),
(3865, 105, 'CZ', 'Catanzaro', 1),
(3866, 105, 'CH', 'Chieti', 1),
(3867, 105, 'CO', 'Como', 1),
(3868, 105, 'CS', 'Cosenza', 1),
(3869, 105, 'CR', 'Cremona', 1),
(3870, 105, 'KR', 'Crotone', 1),
(3871, 105, 'CN', 'Cuneo', 1),
(3872, 105, 'EN', 'Enna', 1),
(3873, 105, 'FE', 'Ferrara', 1),
(3874, 105, 'FI', 'Firenze', 1),
(3875, 105, 'FG', 'Foggia', 1),
(3876, 105, 'FC', 'Forli-Cesena', 1),
(3877, 105, 'FR', 'Frosinone', 1),
(3878, 105, 'GE', 'Genova', 1),
(3879, 105, 'GO', 'Gorizia', 1),
(3880, 105, 'GR', 'Grosseto', 1),
(3881, 105, 'IM', 'Imperia', 1),
(3882, 105, 'IS', 'Isernia', 1),
(3883, 105, 'AQ', 'L&#39;Aquila', 1),
(3884, 105, 'SP', 'La Spezia', 1),
(3885, 105, 'LT', 'Latina', 1),
(3886, 105, 'LE', 'Lecce', 1),
(3887, 105, 'LC', 'Lecco', 1),
(3888, 105, 'LI', 'Livorno', 1),
(3889, 105, 'LO', 'Lodi', 1),
(3890, 105, 'LU', 'Lucca', 1),
(3891, 105, 'MC', 'Macerata', 1),
(3892, 105, 'MN', 'Mantova', 1),
(3893, 105, 'MS', 'Massa-Carrara', 1),
(3894, 105, 'MT', 'Matera', 1),
(3895, 105, 'VS', 'Medio Campidano', 1),
(3896, 105, 'ME', 'Messina', 1),
(3897, 105, 'MI', 'Milano', 1),
(3898, 105, 'MO', 'Modena', 1),
(3899, 105, 'NA', 'Napoli', 1),
(3900, 105, 'NO', 'Novara', 1),
(3901, 105, 'NU', 'Nuoro', 1),
(3902, 105, 'OG', 'Ogliastra', 1),
(3903, 105, 'OT', 'Olbia-Tempio', 1),
(3904, 105, 'OR', 'Oristano', 1),
(3905, 105, 'PD', 'Padova', 1),
(3906, 105, 'PA', 'Palermo', 1),
(3907, 105, 'PR', 'Parma', 1),
(3908, 105, 'PV', 'Pavia', 1),
(3909, 105, 'PG', 'Perugia', 1),
(3910, 105, 'PU', 'Pesaro e Urbino', 1),
(3911, 105, 'PE', 'Pescara', 1),
(3912, 105, 'PC', 'Piacenza', 1),
(3913, 105, 'PI', 'Pisa', 1),
(3914, 105, 'PT', 'Pistoia', 1),
(3915, 105, 'PN', 'Pordenone', 1),
(3916, 105, 'PZ', 'Potenza', 1),
(3917, 105, 'PO', 'Prato', 1),
(3918, 105, 'RG', 'Ragusa', 1),
(3919, 105, 'RA', 'Ravenna', 1),
(3920, 105, 'RC', 'Reggio Calabria', 1),
(3921, 105, 'RE', 'Reggio Emilia', 1),
(3922, 105, 'RI', 'Rieti', 1),
(3923, 105, 'RN', 'Rimini', 1),
(3924, 105, 'RM', 'Roma', 1),
(3925, 105, 'RO', 'Rovigo', 1),
(3926, 105, 'SA', 'Salerno', 1),
(3927, 105, 'SS', 'Sassari', 1),
(3928, 105, 'SV', 'Savona', 1),
(3929, 105, 'SI', 'Siena', 1),
(3930, 105, 'SR', 'Siracusa', 1),
(3931, 105, 'SO', 'Sondrio', 1),
(3932, 105, 'TA', 'Taranto', 1),
(3933, 105, 'TE', 'Teramo', 1),
(3934, 105, 'TR', 'Terni', 1),
(3935, 105, 'TO', 'Torino', 1),
(3936, 105, 'TP', 'Trapani', 1),
(3937, 105, 'TN', 'Trento', 1),
(3938, 105, 'TV', 'Treviso', 1),
(3939, 105, 'TS', 'Trieste', 1),
(3940, 105, 'UD', 'Udine', 1),
(3941, 105, 'VA', 'Varese', 1),
(3942, 105, 'VE', 'Venezia', 1),
(3943, 105, 'VB', 'Verbano-Cusio-Ossola', 1),
(3944, 105, 'VC', 'Vercelli', 1),
(3945, 105, 'VR', 'Verona', 1),
(3946, 105, 'VV', 'Vibo Valentia', 1),
(3947, 105, 'VI', 'Vicenza', 1),
(3948, 105, 'VT', 'Viterbo', 1),
(3949, 222, 'ANT', 'County Antrim', 1),
(3950, 222, 'ARM', 'County Armagh', 1),
(3951, 222, 'DOW', 'County Down', 1),
(3952, 222, 'FER', 'County Fermanagh', 1),
(3953, 222, 'LDY', 'County Londonderry', 1),
(3954, 222, 'TYR', 'County Tyrone', 1),
(3955, 222, 'CMA', 'Cumbria', 1),
(3956, 190, '1', 'Pomurska', 1),
(3957, 190, '2', 'Podravska', 1),
(3958, 190, '3', 'Koroška', 1),
(3959, 190, '4', 'Savinjska', 1),
(3960, 190, '5', 'Zasavska', 1),
(3961, 190, '6', 'Spodnjeposavska', 1),
(3962, 190, '7', 'Jugovzhodna Slovenija', 1),
(3963, 190, '8', 'Osrednjeslovenska', 1),
(3964, 190, '9', 'Gorenjska', 1),
(3965, 190, '10', 'Notranjsko-kraška', 1),
(3966, 190, '11', 'Goriška', 1),
(3967, 190, '12', 'Obalno-kraška', 1),
(3968, 33, '', 'Ruse', 1),
(4035, 129, 'MY-16', 'Putrajaya', 1);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_mijoshop_zone_to_geo_zone`
--

CREATE TABLE IF NOT EXISTS `i8a13_mijoshop_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

--
-- Dumping data for table `i8a13_mijoshop_zone_to_geo_zone`
--

INSERT INTO `i8a13_mijoshop_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(57, 222, 0, 3, '2010-02-26 22:33:24', '0000-00-00 00:00:00'),
(65, 222, 0, 4, '2010-12-15 15:18:13', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_modules`
--

CREATE TABLE IF NOT EXISTS `i8a13_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=113 ;

--
-- Dumping data for table `i8a13_modules`
--

INSERT INTO `i8a13_modules` (`id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(1, 'Main Menu', '', '', 1, 'position-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"mainmenu","active":"","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":" nav-pills","window_open":"","layout":"_:default","moduleclass_sfx":"_menu","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"1","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(2, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 'Popular Articles', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1","module_tag":"div","bootstrap_size":"1","header_tag":"h3","header_class":"","style":"0"}', 1, '*'),
(4, 'My Recently Added Articles', '', '', 1, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 2, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"by_me","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1","module_tag":"div","bootstrap_size":"1","header_tag":"h3","header_class":"","style":"0"}', 1, '*'),
(8, 'Toolbar', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 2, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0","module_tag":"div","bootstrap_size":"1","header_tag":"h3","header_class":"","style":"0"}', 1, '*'),
(9, 'Quick Links', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 2, 1, '{"context":"mod_quickicon","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","automatic_title":"0","module_tag":"div","bootstrap_size":"1","header_tag":"h3","header_class":"","style":"0"}', 1, '*'),
(10, 'Logged-in Users', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 2, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(12, 'Admin Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 2, 1, '{"layout":"","moduleclass_sfx":"","shownew":"1","showhelp":"1","cache":"0"}', 1, '*'),
(13, 'Admin Submenu', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 2, 1, '', 1, '*'),
(14, 'User Status', '', '', 2, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 2, 1, '', 1, '*'),
(15, 'Title', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 2, 1, '', 1, '*'),
(16, 'Login Form', '', '', 7, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '{"greeting":"1","name":"0"}', 0, '*'),
(17, 'Breadcrumbs', '', '', 1, 'position-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_breadcrumbs', 1, 1, '{"moduleclass_sfx":"","showHome":"1","homeText":"Home","showComponent":"1","separator":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(19, 'User Menu', '', '', 3, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 2, 1, '{"menutype":"usermenu","active":"","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"_menu","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"1","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(27, 'Archived Articles', '', '', 1, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_archive', 1, 1, '{"count":"10","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(28, 'Latest Article', '', '', 1, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_latest', 1, 1, '{"catid":[""],"count":"5","show_featured":"","ordering":"c_dsc","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"1","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(29, 'Articles Most Read', '', '', 1, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_popular', 1, 1, '{"catid":["26","29"],"count":"5","show_front":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(30, 'Feed Display', '', '', 1, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_feed', 1, 1, '{"rssurl":"http:\\/\\/community.joomla.org\\/blogs\\/community.feed?type=rss","rssrtl":"0","rsstitle":"1","rssdesc":"1","rssimage":"1","rssitems":"3","rssitemdesc":"1","word_count":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900"}', 0, '*'),
(31, 'News Flash', '', '', 1, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_news', 1, 1, '{"catid":["19"],"image":"0","item_title":"0","link_titles":"","item_heading":"h4","showLastSeparator":"1","readmore":"1","count":"1","ordering":"a.publish_up","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(33, 'Random Image', '', '', 1, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_random_image', 1, 0, '{"type":"jpg","folder":"images\\/headers","link":"","width":"","height":"","layout":"_:default","moduleclass_sfx":"","cache":"0","module_tag":"div","bootstrap_size":"1","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(34, 'Articles Related Items', '', '', 1, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_related_items', 1, 1, '{"showDate":"0","layout":"_:default","moduleclass_sfx":"","owncache":"1"}', 0, '*'),
(35, 'Search', '', '', 1, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_search', 1, 1, '{"label":"","width":"20","text":"","button":"","button_pos":"right","imagebutton":"","button_text":"","opensearch":"1","opensearch_title":"","set_itemid":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(36, 'Statistics', '', '', 1, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_stats', 1, 1, '{"serverinfo":"1","siteinfo":"1","counter":"1","increase":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(37, 'Syndicate Feeds', '', '', 1, 'syndicateload', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_syndicate', 1, 1, '{"text":"Feed Entries","format":"rss","layout":"","moduleclass_sfx":"","cache":"0"}', 0, '*'),
(38, 'Users Latest', '', '', 1, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_users_latest', 1, 1, '{"shownumber":"5","linknames":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","cache_time":"900","cachemode":"static"}', 0, '*'),
(39, 'Who''s Online', '', '', 1, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_whosonline', 1, 1, '{"showmode":"2","linknames":"0","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 0, '*'),
(40, 'Wrapper', '', '', 1, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_wrapper', 1, 1, '{"url":"http:\\/\\/www.youtube.com\\/embed\\/vb2eObvmvdI","add":"1","scrolling":"auto","width":"640","height":"390","height_auto":"1","target":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(41, 'Footer', '', '', 1, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_footer', 1, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(48, 'Image Module', '', '<p><img src="images/headers/blue-flower.jpg" alt="Blue Flower" /></p>', 1, 'position-3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"1","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(49, 'Weblinks', '', '', 1, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_weblinks', 1, 1, '{"catid":"32","count":"5","ordering":"title","direction":"asc","target":"3","description":"0","hits":"0","count_clicks":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(52, 'Breadcrumbs', '', '', 1, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_breadcrumbs', 1, 1, '{"showHere":"1","showHome":"1","homeText":"Home","showLast":"1","separator":"","layout":"_:default","moduleclass_sfx":"","cache":"0","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(56, 'Banners', '', '', 1, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_banners', 1, 1, '{"target":"1","count":"1","cid":"1","catid":["15"],"tag_search":"0","ordering":"random","header_text":"","footer_text":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900"}', 0, '*'),
(61, 'Articles Categories', '', '', 1, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_categories', 1, 1, '{"parent":"29","show_description":"0","show_children":"0","count":"0","maxlevel":"0","layout":"_:default","item_heading":"4","moduleclass_sfx":"","owncache":"1","cache_time":"900"}', 0, '*'),
(62, 'Language Switcher', '', '', 3, 'position-4', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_languages', 1, 1, '{"header_text":"","footer_text":"","image":"1","layout":"","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(63, 'Search', '', '', 1, 'position-0', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_search', 1, 1, '{"width":"20","text":"","button":"","button_pos":"right","imagebutton":"1","button_text":"","set_itemid":"","layout":"","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(64, 'Language Switcher', '', '', 1, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_languages', 1, 1, '{"header_text":"","footer_text":"","dropdown":"0","image":"1","inline":"1","show_active":"1","full_name":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"1","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(69, 'Articles Category', '', '', 1, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_category', 1, 1, '{"mode":"normal","show_on_article_page":"1","show_front":"show","count":"0","category_filtering_type":"1","catid":["72"],"show_child_category_articles":"0","levels":"1","author_filtering_type":"1","created_by":[""],"author_alias_filtering_type":"1","created_by_alias":[""],"excluded_articles":"","date_filtering":"off","date_field":"a.created","start_date_range":"","end_date_range":"","relative_date":"30","article_ordering":"a.title","article_ordering_direction":"ASC","article_grouping":"none","article_grouping_direction":"ksort","month_year_format":"F Y","item_heading":"4","link_titles":"1","show_date":"0","show_date_field":"created","show_date_format":"Y-m-d H:i:s","show_category":"0","show_hits":"0","show_author":"0","show_introtext":"0","introtext_limit":"100","show_readmore":"0","show_readmore_title":"1","readmore_limit":"15","layout":"_:default","moduleclass_sfx":"","owncache":"1","cache_time":"900"}', 0, '*'),
(79, 'Multilanguage status', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_multilangstatus', 3, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(84, 'Smart Search Module', '', '', 2, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_finder', 1, 1, '{"searchfilter":"","show_autosuggest":"1","show_advanced":"0","layout":"_:default","moduleclass_sfx":"","field_size":20,"alt_label":"","show_label":"0","label_pos":"top","show_button":"0","button_pos":"right","opensearch":"1","opensearch_title":""}', 0, '*'),
(86, 'Joomla Version', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_version', 2, 1, '{"format":"short","product":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(87, 'JA Content Slider', '', '', 1, 'home-1', 553, '2013-10-26 02:56:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_jacontentslider', 1, 1, '{"source":"folder","folder_images":"images\\/slides","catid":[""],"text_heading":"","showTab":"1","sort_order_field":"created","sort_order":"DESC","numElem":3,"maxitems":10,"showtitle":"1","link_titles":"1","showimages":"1","iwidth":950,"iheight":420,"showreadmore":"0","showintrotext":"1","numchar":50,"xwidth":980,"xheight":455,"auto":"1","mode":"horizontal","direction":"left","delaytime":5000,"animationtime":1000,"showbutton":"1","scroll_when":"click","source-articles-images-thumbnail_mode":"crop","source-articles-images-thumbnail_mode-resize-use_ratio":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(88, 'SHOP BY CATEGORY', '', '', 2, 'home-3', 553, '2013-10-26 07:51:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_mijoshop', 1, 1, '{"moduleclass_sfx":"category","module":"categoryhome","layout_id":"12","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"category","style":"0"}', 0, '*'),
(89, 'MijoShop Orders', '', '', 0, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_mijoshop_orders', 1, 1, '', 1, '*'),
(90, 'MijoShop - Quick Icons', '', '', 0, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_mijoshop_quickicons', 1, 1, '', 1, '*'),
(91, 'MijoSearch', '', '', 1, 'head-search', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_mijosearch', 1, 1, '{"moduleclass_sfx":"","set_itemid":"","text":"search...","filter":"","enable_complete":"1","enable_ajaxsearch":"0","layout":"0","show_order":"0","show_sections":"0","show_sections_label":"1","show_extra_fields":"1","show_button":"0","show_advanced_search_link":"0","box_class":"mijosearch_input_module_simple","button_class":"btn btn-primary","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(92, 'MijoSearch', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_mijosearch_admin', 1, 1, '', 1, '*'),
(93, 'MijoSearch - Quick Icons', '', '', 1, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_mijosearch_quickicons', 1, 1, '', 1, '*'),
(94, 'slide show', '', '', 1, 'home-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_mijoshop', 1, 1, '{"moduleclass_sfx":"","module":"slideshow","layout_id":"12","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(95, 'minicar mijoshop', '', '', 2, 'account-login-shop', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_mijoshop', 1, 1, '{"moduleclass_sfx":"","module":"mijoshopminicart","layout_id":"12","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(96, 'login', '', '', 1, 'account-login-shop', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_bt_login', 1, 1, '{"align_option":"right","display_type":"0","mouse_event":"click","login":"","logout":"","name":"0","logout_button":"1","enabled_registration_tab":"1","tag_login_modal":"","tag_register_modal":"","bg_button_color":"","text_button_color":"","module_id":["19"],"integrated_component":"","link_option":"","loadJquery":"auto","moduleclass_sfx":"","cache":"0","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(97, 'footer menu 1', '', '', 1, 'footer-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"footer-menu-1","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(98, 'footer menu  2', '', '', 1, 'footer-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"footer-menu-1","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(99, 'footer menu  3', '', '', 1, 'footer-3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"footer-menu-1","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(100, 'footer menu   4', '', '', 1, 'footer-4', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"footer-menu-1","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(101, 'footer bottom', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"mainmenu","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(102, 'copy right', '', '<p>© 2013 The Providores Table Inc. All Rights Reserved   </p>', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(103, 'test', '', '', 1, 'head-search', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_mijoshop', 1, 1, '{"moduleclass_sfx":"","module":"account","layout_id":"12","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(104, 'category left accordion', '', '', 1, 'sidebar-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_mijoshop', 1, 1, '{"moduleclass_sfx":"","module":"category","layout_id":"12","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(105, 'adfasdf', '', '<p>sadfasdfasdfasdf</p>', 1, 'sidebar-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(106, 'JM Slideshow Responsive', '', '', 1, 'home-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_jmslideshow', 1, 0, '{"jmslideshow_responsive":"1","jmslideshow_width":"700","jmslideshow_image_width":"934","jmslideshow_image_height":"408","jmslideshow_image_style":"fill","class_sfx":"","slider_source":"2","jmslideshow_categories":["8"],"jmslideshow_article_ids":"1,2","jmslideshow_k2_ids":"","jmslideshow_hikashop_ids":"","jmslideshow_foder_image":"images\\/slides","jmslideshow_image_source":"0","jmslideshow_article_image_source":"1","jmslideshow_ordering":"ASC","jmslideshow_orderby":"1","jmslideshow_count":"5","jmslideshow_layout":"default","jmslideshow_effect":"fade","jmslideshow_speed":"500","jmslideshow_auto":"1","jmslideshow_timeout":"5000","jmslideshow_caption_position":"bottomleft","jmslideshow_caption_left":"130","jmslideshow_caption_top":"30","jmslideshow_caption_right":"30","jmslideshow_caption_bottom":"80","jmslideshow_caption_width":"680","jmslideshow_show_title":"1","jmslideshow_title_link":"1","jmslideshow_show_desc":"1","jmslideshow_desc_length":"80","jmslideshow_desc_html":"","jmslideshow_readmore_text":"Read more","jmslideshow_show_nav_buttons":"1","jmslideshow_show_pager":"1","jmslideshow_pager_type":"1","jmslideshow_pager_position":"bottomleft","jmslideshow_pager_left":"30","jmslideshow_pager_top":"30","jmslideshow_pager_right":"30","jmslideshow_pager_bottom":"30","jmslideshow_include_jquery":"2","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(107, 'Custom Html Follow Us ', '', '<p>Follow Us on <img src="images/f.png" style="vertical-align: middle; margin-left: 5px; margin-right: 5px;" /> and<img src="images/i.png" style="vertical-align: middle; margin-left: 5px; margin-right: 5px;" /></p>', 1, 'head-search', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(108, 'account menu', '', '', 1, 'account-login-shop', 553, '2013-10-26 03:47:34', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 0, '{"menutype":"account-menu","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(109, 'JA Side News', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_jasidenews', 1, 1, '', 0, '*'),
(110, 'new', '', '', 2, 'home-2', 553, '2013-10-26 07:26:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_jasidenews', 1, 1, '{"using_mode":"article","display_model-modcats-category":["9"],"show_featured":"1","sort_order_field":"created","sort_order":"ASC","max_items":4,"title_max_chars":200,"maxchars":60,"layout":"sidenews","layout-default-showdate":"1","layout-default-show_moredetail":"1","layout-default-showimage":"1","layout-sidenews-height":"366","layout-sidenews-textcolor":"#000000","layout-sidenews-bgcolor":"#ffffff","layout-sidenews-transparent":"100","layout-sidenews-element_apply_side":"content","layout-sidenews-play_mode":"caption","layout-sidenews-play_mode-caption-expandheight":"120","layout-sidenews-play_mode-caption-collapseheight":"120","layout-sidenews-animation_transition":"Fx.Transitions.linear","thumbnail_mode":"resize","thumbnail_mode-resize-use_ratio":"1","iwidth":244,"iheight":244,"image_alignment":"left","moduleclass_sfx":"","cache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(111, 'title of new', '', '<h3>Lorem ipsum dolor sit amet</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vestibulum enim libero, consequat commodo sem semper ultricies. Nullam sed ullamcorper ligula. Mauris a felis egestas, pretium nunc id, aliquam ante.</p>', 1, 'home-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"titlenew","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"header","style":"0"}', 0, '*'),
(112, 'title of shop by cateogry ', '', '<h3>SHOP BY CATEGORY</h3>', 1, 'home-3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"title-shop","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"title-shop","style":"0"}', 0, '*');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_modules_menu`
--

CREATE TABLE IF NOT EXISTS `i8a13_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i8a13_modules_menu`
--

INSERT INTO `i8a13_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(19, 0),
(28, 0),
(33, 0),
(48, 0),
(79, 0),
(86, 0),
(87, 201),
(87, 435),
(87, 448),
(87, 449),
(87, 450),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(94, 0),
(95, 0),
(96, 0),
(97, 0),
(98, 0),
(99, 0),
(100, 0),
(101, 0),
(102, 0),
(103, 0),
(104, 0),
(105, 0),
(106, 435),
(107, 0),
(108, 0),
(110, 435),
(111, 435),
(112, 435);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_newsfeeds`
--

CREATE TABLE IF NOT EXISTS `i8a13_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `images` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_overrider`
--

CREATE TABLE IF NOT EXISTS `i8a13_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_redirect_links`
--

CREATE TABLE IF NOT EXISTS `i8a13_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(255) NOT NULL,
  `new_url` varchar(255) NOT NULL,
  `referer` varchar(150) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_link_old` (`old_url`),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_schemas`
--

CREATE TABLE IF NOT EXISTS `i8a13_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i8a13_schemas`
--

INSERT INTO `i8a13_schemas` (`extension_id`, `version_id`) VALUES
(700, '3.1.5');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_session`
--

CREATE TABLE IF NOT EXISTS `i8a13_session` (
  `session_id` varchar(200) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) DEFAULT '',
  `data` mediumtext,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i8a13_session`
--

INSERT INTO `i8a13_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`) VALUES
('170ibhloc9lsjvtf27de7nhga7', 1, 0, '1382781413', '__default|a:9:{s:15:"session.counter";i:38;s:19:"session.timer.start";i:1382780429;s:18:"session.timer.last";i:1382781408;s:17:"session.timer.now";i:1382781411;s:22:"session.client.browser";s:72:"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:24.0) Gecko/20100101 Firefox/24.0";s:8:"registry";O:9:"JRegistry":1:{s:7:"\\0\\0\\0data";O:8:"stdClass":4:{s:11:"application";O:8:"stdClass":1:{s:4:"lang";s:0:"";}s:13:"com_templates";O:8:"stdClass":1:{s:4:"edit";O:8:"stdClass":1:{s:5:"style";O:8:"stdClass":2:{s:2:"id";a:2:{i:0;i:10;i:1;i:9;}s:4:"data";N;}}}s:7:"oparams";a:17:{i:0;a:2:{s:4:"name";s:7:"devmode";s:5:"value";s:1:"1";}i:1;a:2:{s:4:"name";s:10:"themermode";s:5:"value";s:1:"1";}i:2;a:2:{s:4:"name";s:10:"responsive";s:5:"value";s:1:"1";}i:3;a:2:{s:4:"name";s:9:"build_rtl";s:5:"value";s:1:"0";}i:4;a:2:{s:4:"name";s:6:"minify";s:5:"value";s:1:"0";}i:5;a:2:{s:4:"name";s:9:"t3-assets";s:5:"value";s:9:"t3-assets";}i:6;a:2:{s:4:"name";s:10:"t3-rmvlogo";s:5:"value";s:1:"1";}i:7;a:2:{s:4:"name";s:18:"navigation_trigger";s:5:"value";s:5:"hover";}i:8;a:2:{s:4:"name";s:29:"navigation_collapse_offcanvas";s:5:"value";s:1:"1";}i:9;a:2:{s:4:"name";s:27:"navigation_collapse_showsub";s:5:"value";s:1:"1";}i:10;a:2:{s:4:"name";s:20:"navigation_animation";s:5:"value";s:6:"fading";}i:11;a:2:{s:4:"name";s:29:"navigation_animation_duration";s:5:"value";s:3:"400";}i:12;a:2:{s:4:"name";s:9:"mm_config";s:5:"value";N;}i:13;a:2:{s:4:"name";s:17:"snippet_open_head";s:5:"value";N;}i:14;a:2:{s:4:"name";s:18:"snippet_close_head";s:5:"value";N;}i:15;a:2:{s:4:"name";s:17:"snippet_open_body";s:5:"value";N;}i:16;a:2:{s:4:"name";s:18:"snippet_close_body";s:5:"value";N;}}s:13:"com_languages";O:8:"stdClass":1:{s:9:"installed";O:8:"stdClass":1:{s:8:"ordercol";s:6:"a.name";}}}}s:4:"user";O:5:"JUser":24:{s:9:"\\0\\0\\0isRoot";b:1;s:2:"id";s:3:"553";s:4:"name";s:10:"Super User";s:8:"username";s:5:"admin";s:5:"email";s:21:"trungqt2005@gmail.com";s:8:"password";s:65:"5ecf74adf5e87c39f3ef7f80649c2877:stPxhQ60xMDAFo1LAlP9WB0NBLOt7GYP";s:14:"password_clear";s:0:"";s:5:"block";s:1:"0";s:9:"sendEmail";s:1:"1";s:12:"registerDate";s:19:"2013-10-23 05:38:05";s:13:"lastvisitDate";s:19:"2013-10-26 09:39:31";s:10:"activation";s:1:"0";s:6:"params";s:0:"";s:6:"groups";a:1:{i:8;s:1:"8";}s:5:"guest";i:0;s:13:"lastResetTime";s:19:"0000-00-00 00:00:00";s:10:"resetCount";s:1:"0";s:10:"\\0\\0\\0_params";O:9:"JRegistry":1:{s:7:"\\0\\0\\0data";O:8:"stdClass":0:{}}s:14:"\\0\\0\\0_authGroups";a:2:{i:0;i:1;i:1;i:8;}s:14:"\\0\\0\\0_authLevels";a:4:{i:0;i:1;i:1;i:1;i:2;i:2;i:3;i:3;}s:15:"\\0\\0\\0_authActions";N;s:12:"\\0\\0\\0_errorMsg";N;s:10:"\\0\\0\\0_errors";a:0:{}s:3:"aid";i:0;}s:13:"session.token";s:32:"3d2914a08269903ff4fc44a6b1e6d2be";s:25:"mijoshop.login.redirected";b:1;}user_id|s:1:"1";token|s:32:"d7d6b2db3532896130f958085f7cbd22";currency|s:3:"USD";is_db_sync|b:1;', 553, 'admin');
INSERT INTO `i8a13_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`) VALUES
('fnfk7kcviq09e9q1pa7hdi1jt6', 0, 1, '1382781593', '__default|a:8:{s:15:"session.counter";i:257;s:19:"session.timer.start";i:1382754091;s:18:"session.timer.last";i:1382781472;s:17:"session.timer.now";i:1382781590;s:22:"session.client.browser";s:72:"Mozilla/5.0 (Windows NT 6.1; WOW64; rv:24.0) Gecko/20100101 Firefox/24.0";s:8:"registry";O:9:"JRegistry":1:{s:7:"\\0\\0\\0data";O:8:"stdClass":4:{s:10:"vars_theme";N;s:9:"DIRECTION";s:3:"ltr";s:18:"vars_last_modified";s:10:"1382753359";s:12:"vars_content";s:54074:"//\r\n// Variables\r\n// --------------------------------------------------\r\n\r\n\r\n// Global values\r\n// --------------------------------------------------\r\n\r\n\r\n// Grays\r\n// -------------------------\r\n@black:                 #000;\r\n@grayDarker:            #222;\r\n@grayDark:              #333;\r\n@gray:                  #555;\r\n@grayLight:             #999;\r\n@grayLighter:           #eee;\r\n@white:                 #fff;\r\n\r\n\r\n// Accent colors\r\n// -------------------------\r\n@blue:                  #049cdb;\r\n@blueDark:              #0064cd;\r\n@green:                 #46a546;\r\n@red:                   #9d261d;\r\n@yellow:                #ffc40d;\r\n@orange:                #f89406;\r\n@pink:                  #c3325f;\r\n@purple:                #7a43b6;\r\n\r\n\r\n// Scaffolding\r\n// -------------------------\r\n@bodyBackground:        @white;\r\n@textColor:             @grayDark;\r\n\r\n\r\n// Links\r\n// -------------------------\r\n@linkColor:             #08c;\r\n@linkColorHover:        darken(@linkColor, 15%);\r\n\r\n\r\n// Typography\r\n// -------------------------\r\n@sansFontFamily:        "Helvetica Neue", Helvetica, Arial, sans-serif;\r\n@serifFontFamily:       Georgia, "Times New Roman", Times, serif;\r\n@monoFontFamily:        Monaco, Menlo, Consolas, "Courier New", monospace;\r\n\r\n@baseFontSize:          14px;\r\n@baseFontFamily:        @sansFontFamily;\r\n@baseLineHeight:        20px;\r\n@altFontFamily:         @serifFontFamily;\r\n\r\n@headingsFontFamily:    inherit; // empty to use BS default, @baseFontFamily\r\n@headingsFontWeight:    bold;    // instead of browser default, bold\r\n@headingsColor:         inherit; // empty to use BS default, @textColor\r\n\r\n\r\n// Component sizing\r\n// -------------------------\r\n// Based on 14px font-size and 20px line-height\r\n\r\n@fontSizeLarge:         @baseFontSize * 1.25; // ~18px\r\n@fontSizeSmall:         @baseFontSize * 0.85; // ~12px\r\n@fontSizeMini:          @baseFontSize * 0.75; // ~11px\r\n\r\n@paddingLarge:          11px 19px; // 44px\r\n@paddingSmall:          2px 10px;  // 26px\r\n@paddingMini:           0 6px;   // 22px\r\n\r\n@baseBorderRadius:      4px;\r\n@borderRadiusLarge:     6px;\r\n@borderRadiusSmall:     3px;\r\n\r\n\r\n// Tables\r\n// -------------------------\r\n@tableBackground:                   transparent; // overall background-color\r\n@tableBackgroundAccent:             #f9f9f9; // for striping\r\n@tableBackgroundHover:              #f5f5f5; // for hover\r\n@tableBorder:                       #ddd; // table and cell border\r\n\r\n// Buttons\r\n// -------------------------\r\n@btnBackground:                     @white;\r\n@btnBackgroundHighlight:            darken(@white, 10%);\r\n@btnBorder:                         #ccc;\r\n\r\n@btnPrimaryBackground:              @linkColor;\r\n@btnPrimaryBackgroundHighlight:     spin(@btnPrimaryBackground, 20%);\r\n\r\n@btnInfoBackground:                 #5bc0de;\r\n@btnInfoBackgroundHighlight:        #2f96b4;\r\n\r\n@btnSuccessBackground:              #62c462;\r\n@btnSuccessBackgroundHighlight:     #51a351;\r\n\r\n@btnWarningBackground:              lighten(@orange, 15%);\r\n@btnWarningBackgroundHighlight:     @orange;\r\n\r\n@btnDangerBackground:               #ee5f5b;\r\n@btnDangerBackgroundHighlight:      #bd362f;\r\n\r\n@btnInverseBackground:              #444;\r\n@btnInverseBackgroundHighlight:     @grayDarker;\r\n\r\n\r\n// Forms\r\n// -------------------------\r\n@inputBackground:               @white;\r\n@inputBorder:                   #ccc;\r\n@inputBorderRadius:             @baseBorderRadius;\r\n@inputDisabledBackground:       @grayLighter;\r\n@formActionsBackground:         #f5f5f5;\r\n@inputHeight:                   @baseLineHeight + 10px; // base line-height + 8px vertical padding + 2px top/bottom border\r\n\r\n\r\n// Dropdowns\r\n// -------------------------\r\n@dropdownBackground:            @white;\r\n@dropdownBorder:                rgba(0,0,0,.2);\r\n@dropdownDividerTop:            #e5e5e5;\r\n@dropdownDividerBottom:         @white;\r\n\r\n@dropdownLinkColor:             @grayDark;\r\n@dropdownLinkColorHover:        @white;\r\n@dropdownLinkColorActive:       @white;\r\n\r\n@dropdownLinkBackgroundActive:  @linkColor;\r\n@dropdownLinkBackgroundHover:   @dropdownLinkBackgroundActive;\r\n\r\n\r\n\r\n// COMPONENT VARIABLES\r\n// --------------------------------------------------\r\n\r\n\r\n// Z-index master list\r\n// -------------------------\r\n// Used for a bird''s eye view of components dependent on the z-axis\r\n// Try to avoid customizing these :)\r\n@zindexDropdown:          1000;\r\n@zindexPopover:           1010;\r\n@zindexTooltip:           1030;\r\n@zindexFixedNavbar:       1030;\r\n@zindexModalBackdrop:     1040;\r\n@zindexModal:             1050;\r\n\r\n\r\n// Sprite icons path\r\n// -------------------------\r\n@iconSpritePath:          "../img/glyphicons-halflings.png";\r\n@iconWhiteSpritePath:     "../img/glyphicons-halflings-white.png";\r\n\r\n\r\n// Input placeholder text color\r\n// -------------------------\r\n@placeholderText:         @grayLight;\r\n\r\n\r\n// Hr border color\r\n// -------------------------\r\n@hrBorder:                @grayLighter;\r\n\r\n\r\n// Horizontal forms & lists\r\n// -------------------------\r\n@horizontalComponentOffset:       180px;\r\n\r\n\r\n// Wells\r\n// -------------------------\r\n@wellBackground:                  #f5f5f5;\r\n\r\n\r\n// Navbar\r\n// -------------------------\r\n@navbarCollapseWidth:             979px;\r\n@navbarCollapseDesktopWidth:      @navbarCollapseWidth + 1;\r\n\r\n@navbarHeight:                    40px;\r\n@navbarBackgroundHighlight:       #ffffff;\r\n@navbarBackground:                darken(@navbarBackgroundHighlight, 5%);\r\n@navbarBorder:                    darken(@navbarBackground, 12%);\r\n\r\n@navbarText:                      #777;\r\n@navbarLinkColor:                 #777;\r\n@navbarLinkColorHover:            @grayDark;\r\n@navbarLinkColorActive:           @gray;\r\n@navbarLinkBackgroundHover:       transparent;\r\n@navbarLinkBackgroundActive:      darken(@navbarBackground, 5%);\r\n\r\n@navbarBrandColor:                @navbarLinkColor;\r\n\r\n// Inverted navbar\r\n@navbarInverseBackground:                #111111;\r\n@navbarInverseBackgroundHighlight:       #222222;\r\n@navbarInverseBorder:                    #252525;\r\n\r\n@navbarInverseText:                      @grayLight;\r\n@navbarInverseLinkColor:                 @grayLight;\r\n@navbarInverseLinkColorHover:            @white;\r\n@navbarInverseLinkColorActive:           @navbarInverseLinkColorHover;\r\n@navbarInverseLinkBackgroundHover:       transparent;\r\n@navbarInverseLinkBackgroundActive:      @navbarInverseBackground;\r\n\r\n@navbarInverseSearchBackground:          lighten(@navbarInverseBackground, 25%);\r\n@navbarInverseSearchBackgroundFocus:     @white;\r\n@navbarInverseSearchBorder:              @navbarInverseBackground;\r\n@navbarInverseSearchPlaceholderColor:    #ccc;\r\n\r\n@navbarInverseBrandColor:                @navbarInverseLinkColor;\r\n\r\n\r\n// Pagination\r\n// -------------------------\r\n@paginationBackground:                #fff;\r\n@paginationBorder:                    #ddd;\r\n@paginationActiveBackground:          #f5f5f5;\r\n\r\n\r\n// Hero unit\r\n// -------------------------\r\n@heroUnitBackground:              @grayLighter;\r\n@heroUnitHeadingColor:            inherit;\r\n@heroUnitLeadColor:               inherit;\r\n\r\n\r\n// Form states and alerts\r\n// -------------------------\r\n@warningText:             #c09853;\r\n@warningBackground:       #fcf8e3;\r\n@warningBorder:           darken(spin(@warningBackground, -10), 3%);\r\n\r\n@errorText:               #b94a48;\r\n@errorBackground:         #f2dede;\r\n@errorBorder:             darken(spin(@errorBackground, -10), 3%);\r\n\r\n@successText:             #468847;\r\n@successBackground:       #dff0d8;\r\n@successBorder:           darken(spin(@successBackground, -10), 5%);\r\n\r\n@infoText:                #3a87ad;\r\n@infoBackground:          #d9edf7;\r\n@infoBorder:              darken(spin(@infoBackground, -10), 7%);\r\n\r\n\r\n// Tooltips and popovers\r\n// -------------------------\r\n@tooltipColor:            #fff;\r\n@tooltipBackground:       #000;\r\n@tooltipArrowWidth:       5px;\r\n@tooltipArrowColor:       @tooltipBackground;\r\n\r\n@popoverBackground:       #fff;\r\n@popoverArrowWidth:       10px;\r\n@popoverArrowColor:       #fff;\r\n@popoverTitleBackground:  darken(@popoverBackground, 3%);\r\n\r\n// Special enhancement for popovers\r\n@popoverArrowOuterWidth:  @popoverArrowWidth + 1;\r\n@popoverArrowOuterColor:  rgba(0,0,0,.25);\r\n\r\n\r\n\r\n// GRID\r\n// --------------------------------------------------\r\n\r\n\r\n// Default 940px grid\r\n// -------------------------\r\n@gridColumns:             12;\r\n@gridColumnWidth:         60px;\r\n@gridGutterWidth:         20px;\r\n@gridRowWidth:            (@gridColumns * @gridColumnWidth) + (@gridGutterWidth * (@gridColumns - 1));\r\n\r\n// 1200px min\r\n@gridColumnWidth1200:     70px;\r\n@gridGutterWidth1200:     30px;\r\n@gridRowWidth1200:        (@gridColumns * @gridColumnWidth1200) + (@gridGutterWidth1200 * (@gridColumns - 1));\r\n\r\n// 768px-979px\r\n@gridColumnWidth768:      42px;\r\n@gridGutterWidth768:      20px;\r\n@gridRowWidth768:         (@gridColumns * @gridColumnWidth768) + (@gridGutterWidth768 * (@gridColumns - 1));\r\n\r\n\r\n// Fluid grid\r\n// -------------------------\r\n@fluidGridColumnWidth:    percentage(@gridColumnWidth/@gridRowWidth);\r\n@fluidGridGutterWidth:    percentage(@gridGutterWidth/@gridRowWidth);\r\n\r\n// 1200px min\r\n@fluidGridColumnWidth1200:     percentage(@gridColumnWidth1200/@gridRowWidth1200);\r\n@fluidGridGutterWidth1200:     percentage(@gridGutterWidth1200/@gridRowWidth1200);\r\n\r\n// 768px-979px\r\n@fluidGridColumnWidth768:      percentage(@gridColumnWidth768/@gridRowWidth768);\r\n@fluidGridGutterWidth768:      percentage(@gridGutterWidth768/@gridRowWidth768);\r\n/** \r\n *------------------------------------------------------------------------------\r\n * @package       T3 Framework for Joomla!\r\n *------------------------------------------------------------------------------\r\n * @copyright     Copyright (C) 2004-2013 JoomlArt.com. All Rights Reserved.\r\n * @license       GNU General Public License version 2 or later; see LICENSE.txt\r\n * @authors       JoomlArt, JoomlaBamboo, (contribute to this project at github \r\n *                & Google group to become co-author)\r\n * @Google group: https://groups.google.com/forum/#!forum/t3fw\r\n * @Link:         https://github.com/t3framework/ \r\n *------------------------------------------------------------------------------\r\n*/\r\n\r\n//\r\n// USE TO OVERRIDE BOOTSTRAP VARIABLES \r\n// AND DEFINE THOSE NEWS VARIABLE WHICH WILL BE USED IN T3 CORE\r\n// ---------------------------------------------------------\r\n\r\n\r\n\r\n// OVERRIDE BOOTSTRAP VARIABLES\r\n// --------------------------------------------------\r\n\r\n// Define Navbar Collapse Width\r\n@navbarCollapseWidth:   767px;\r\n@navbarCollapseDesktopWidth:  @navbarCollapseWidth + 1;\r\n\r\n\r\n// T3 GLOBAL STYLES\r\n// --------------------------------------------------\r\n\r\n// Module Styles\r\n// -------------------------\r\n// Module General\r\n@T3moduleBackground:            transparent;\r\n@T3moduleColor:                 inherit;\r\n@T3modulePadding:               0;\r\n@T3moduleBorder:                1px solid #ddd;\r\n\r\n// Module Title\r\n@T3moduleTitleBackground:       inherit; // inherit from @moduleBackground\r\n@T3moduleTitleColor:            @headingsColor; // inherit from @moduleColor\r\n@T3moduleTitlePadding:          0;\r\n\r\n// Module Content\r\n@T3moduleContentBackground:     inherit; // inherit from @moduleBackground\r\n@T3moduleContentColor:          inherit; // inherit from @moduleColor\r\n@T3moduleContentPadding:        0;\r\n\r\n\r\n// Global Margin& Padding\r\n// -------------------------\r\n@T3globalMargin:            @baseLineHeight;\r\n@T3globalPadding:           @baseLineHeight;\r\n\r\n\r\n// Typography\r\n// -------------------------\r\n@T3bigFontSize:         @baseFontSize + 1px;\r\n@T3biggerFontSize:      @baseFontSize + 2px;\r\n\r\n@T3smallFontSize:       @baseFontSize - 1px;\r\n@T3smallerFontSize:     @baseFontSize - 2px;\r\n\r\n\r\n// Off-Canvas menu width \r\n// -------------------------\r\n@T3OffCanvasWidth: 			250px;/** \r\n *------------------------------------------------------------------------------\r\n * @package       T3 Framework for Joomla!\r\n *------------------------------------------------------------------------------\r\n * @copyright     Copyright (C) 2004-2013 JoomlArt.com. All Rights Reserved.\r\n * @license       GNU General Public License version 2 or later; see LICENSE.txt\r\n * @authors       JoomlArt, JoomlaBamboo, (contribute to this project at github \r\n *                & Google group to become co-author)\r\n * @Google group: https://groups.google.com/forum/#!forum/t3fw\r\n * @Link:         http://t3-framework.org \r\n *------------------------------------------------------------------------------\r\n */\r\n\r\n//\r\n// Variables\r\n// --------------------------------------------------\r\n\r\n\r\n// Global values\r\n// --------------------------------------------------\r\n@T3ImagePath:           "../images";\r\n\r\n// Grays\r\n// -------------------------\r\n@black:                 #000;\r\n@grayDarker:            #222;\r\n@grayDark:              #444;\r\n@gray:                  #666;\r\n@grayLight:             #999;\r\n@grayLighter:           #eee;\r\n@white:                 #fff;\r\n\r\n\r\n// Accent colors\r\n// -------------------------\r\n@blue:                  #07b;\r\n@blueDark:              darken(@blue, 15%);\r\n@green:                 #690;\r\n@cyan:                  #09c; // T3 added\r\n@red:                   #c00;\r\n@yellow:                #f29400;\r\n@orange:                #f80;\r\n@pink:                  #d60a6c;\r\n@purple:                #8b08ae;\r\n\r\n\r\n// T3 Main colors\r\n// -------------------------\r\n@T3primaryColor:        @yellow;\r\n@T3secondaryColor:      @green;\r\n\r\n\r\n\r\n// Scaffolding\r\n// -------------------------\r\n@bodyBackground:        "@{T3ImagePath}/bg-body.png";\r\n@textColor:             @gray;\r\n\r\n\r\n// Links\r\n// -------------------------\r\n@linkColor:             @T3primaryColor;\r\n@linkColorHover:        darken(@linkColor, 15%);\r\n\r\n\r\n// Typography\r\n// -------------------------\r\n@sansFontFamily:        "QlassikMediumRegular";\r\n@sansFontFamilyBold:        "QlassikBoldRegular";\r\n\r\n@serifFontFamily:       serif;\r\n@monoFontFamily:        monospace;\r\n\r\n@baseFontSize:          14px;\r\n@baseFontFamily:        @sansFontFamily;\r\n@baseLineHeight:        20px;\r\n@altFontFamily:         @serifFontFamily;\r\n\r\n@headingsFontFamily:    @sansFontFamilyBold; // empty to use BS default, @baseFontFamily\r\n@headingsFontWeight:    bold;    // instead of browser default, bold\r\n@headingsColor:         @grayDark; // empty to use BS default, @textColor\r\n\r\n\r\n@T3bigFontSize:         @baseFontSize + 1px;\r\n@T3biggerFontSize:      @baseFontSize + 2px;\r\n\r\n@T3smallFontSize:       @baseFontSize - 1px;\r\n@T3smallerFontSize:     @baseFontSize - 2px;\r\n\r\n\r\n// Component sizing\r\n// -------------------------\r\n// Based on 14px font-size and 20px line-height\r\n\r\n@fontSizeLarge:         @baseFontSize * 1.25; // ~18px\r\n@fontSizeSmall:         @baseFontSize * 0.85; // ~12px\r\n@fontSizeMini:          @baseFontSize * 0.75; // ~11px\r\n\r\n@paddingLarge:          11px 19px; // 44px\r\n@paddingSmall:          2px 10px;  // 26px\r\n@paddingMini:           1px 6px;   // 24px\r\n\r\n@baseBorderRadius:      4px;\r\n@borderRadiusLarge:     6px;\r\n@borderRadiusSmall:     3px;\r\n@LargeBorderRadius:		  @borderRadiusLarge;\r\n\r\n// Tables\r\n// -------------------------\r\n@tableBackground:                   transparent; // overall background-color\r\n@tableBackgroundAccent:             #f9f9f9; // for striping\r\n@tableBackgroundHover:              #f5f5f5; // for hover\r\n@tableBorder:                       #ddd; // table and cell border\r\n\r\n\r\n// Buttons\r\n// -------------------------\r\n@btnBackground:                     @grayLighter;\r\n@btnBackgroundHighlight:            lighten(@grayLighter, 10%);\r\n@btnBorder:                         darken(@grayLighter, 10%);\r\n\r\n@btnPrimaryBackground:              @linkColor;\r\n@btnPrimaryBackgroundHighlight:     lighten(@linkColor, 10%);\r\n\r\n@btnInfoBackground:                 @cyan;\r\n@btnInfoBackgroundHighlight:        lighten(@cyan, 10%);\r\n\r\n@btnSuccessBackground:              @green;\r\n@btnSuccessBackgroundHighlight:     lighten(@green, 10%);\r\n\r\n@btnWarningBackground:              @orange;\r\n@btnWarningBackgroundHighlight:     lighten(@orange, 10%);\r\n\r\n@btnDangerBackground:               @red;\r\n@btnDangerBackgroundHighlight:      lighten(@red, 10%);\r\n\r\n@btnInverseBackground:              @grayDark;\r\n@btnInverseBackgroundHighlight:     lighten(@grayDark, 10%);\r\n\r\n\r\n// Forms\r\n// -------------------------\r\n@inputBackground:         @white;\r\n@inputBorder:             #ccc;\r\n@inputBorderRadius:       @baseBorderRadius;\r\n@inputDisabledBackground: @grayLighter;\r\n@formActionsBackground:   #f5f5f5;\r\n\r\n\r\n\r\n// COMPONENT VARIABLES\r\n// --------------------------------------------------\r\n\r\n// Z-index master list\r\n// -------------------------\r\n// Used for a bird''s eye view of components dependent on the z-axis\r\n// Try to avoid customizing these :)\r\n@zindexDropdown:          1000;\r\n@zindexPopover:           1010;\r\n@zindexTooltip:           1030;\r\n@zindexFixedNavbar:       1030;\r\n@zindexModalBackdrop:     1040;\r\n@zindexModal:             1050;\r\n\r\n\r\n// Sprite icons path\r\n// -------------------------\r\n@iconSpritePath:          "../images/glyphicons-halflings.png";\r\n@iconWhiteSpritePath:     "../images/glyphicons-halflings-white.png";\r\n\r\n\r\n// Input placeholder text color\r\n// -------------------------\r\n@placeholderText:         @grayLight;\r\n\r\n\r\n// Hr border color\r\n// -------------------------\r\n@hrBorder:                @grayLighter;\r\n\r\n\r\n// Wells\r\n// -------------------------\r\n@wellBackground:          #f5f5f5;\r\n\r\n\r\n// Navbar\r\n// -------------------------\r\n@navbarCollapseWidth:             767px;\r\n\r\n@navbarHeight:                    40px;\r\n@navbarBackground:                darken(@navbarBackgroundHighlight, 10%);\r\n@navbarBackgroundHighlight:       #222121;\r\n@navbarBorder:                    darken(@navbarBackground, 12%);\r\n\r\n@navbarText:                      @gray;\r\n@navbarLinkColor:                 @gray;\r\n@navbarLinkColorHover:            @grayLighter;\r\n@navbarLinkColorActive:           @grayLighter;\r\n@navbarLinkBackgroundHover:       @gray;\r\n@navbarLinkBackgroundActive:      @linkColor;\r\n\r\n@navbarBrandColor:                @navbarLinkColor;\r\n\r\n// Inverted navbar\r\n@navbarInverseBackground:                #111111;\r\n@navbarInverseBackgroundHighlight:       #222222;\r\n@navbarInverseBorder:                    #252525;\r\n\r\n@navbarInverseText:                      @grayLight;\r\n@navbarInverseLinkColor:                 @grayLight;\r\n@navbarInverseLinkColorHover:            @white;\r\n@navbarInverseLinkColorActive:           @navbarInverseLinkColorHover;\r\n@navbarInverseLinkBackgroundHover:       transparent;\r\n@navbarInverseLinkBackgroundActive:      @navbarInverseBackground;\r\n\r\n@navbarInverseSearchBackground:          lighten(@navbarInverseBackground, 25%);\r\n@navbarInverseSearchBackgroundFocus:     @white;\r\n@navbarInverseSearchBorder:              @navbarInverseBackground;\r\n@navbarInverseSearchPlaceholderColor:    #ccc;\r\n\r\n@navbarInverseBrandColor:                @navbarInverseLinkColor;\r\n\r\n\r\n// Dropdowns\r\n// -------------------------\r\n// (T3 Note: Move "dropdowns" variables belows "navbar")\r\n@dropdownBackground:            @white;\r\n@dropdownBorder:                rgba(0,0,0,.2);\r\n@dropdownDividerTop:            #e5e5e5;\r\n@dropdownDividerBottom:         @white;\r\n\r\n@dropdownLinkColor:             @grayDark;\r\n\r\n@dropdownLinkColorHover:        @navbarLinkColorHover;\r\n@dropdownLinkBackgroundHover:   @navbarLinkBackgroundHover;\r\n\r\n@dropdownLinkColorActive:       @navbarLinkColorActive;\r\n@dropdownLinkBackgroundActive:  @navbarLinkBackgroundActive;\r\n\r\n\r\n// Pagination\r\n// -------------------------\r\n@paginationBackground:          #fff;\r\n@paginationBorder:              #ddd;\r\n@paginationActiveBackground:    #f5f5f5;\r\n\r\n\r\n// Hero unit\r\n// -------------------------\r\n@heroUnitBackground:            @grayLighter;\r\n@heroUnitHeadingColor:          inherit;\r\n@heroUnitLeadColor:             inherit;\r\n\r\n\r\n// Form states and alerts\r\n// -------------------------\r\n@warningText:             @orange;\r\n@warningBackground:       #fcf8e3;\r\n@warningBorder:           darken(spin(@warningBackground, -10), 3%);\r\n\r\n@errorText:               @red;\r\n@errorBackground:         #f2dede;\r\n@errorBorder:             darken(spin(@errorBackground, -10), 3%);\r\n\r\n@successText:             @green;\r\n@successBackground:       #dff0d8;\r\n@successBorder:           darken(spin(@successBackground, -10), 5%);\r\n\r\n@infoText:                @blue;\r\n@infoBackground:          #d9edf7;\r\n@infoBorder:              darken(spin(@infoBackground, -10), 7%);\r\n\r\n\r\n// Tooltips and popovers\r\n// -------------------------\r\n@tooltipColor:            #fff;\r\n@tooltipBackground:       #000;\r\n@tooltipArrowWidth:       5px;\r\n@tooltipArrowColor:       @tooltipBackground;\r\n\r\n@popoverBackground:       #fff;\r\n@popoverArrowWidth:       10px;\r\n@popoverArrowColor:       #fff;\r\n@popoverTitleBackground:  darken(@popoverBackground, 3%);\r\n\r\n// Special enhancement for popovers\r\n@popoverArrowOuterWidth:  @popoverArrowWidth + 1;\r\n@popoverArrowOuterColor:  rgba(0,0,0,.25);\r\n\r\n\r\n\r\n// GRID\r\n// --------------------------------------------------\r\n\r\n// Default 940px grid\r\n// -------------------------\r\n@T3gridWidth:             940px;  // T3 add. For non-responsive layout.\r\n@gridColumns:             12;\r\n@gridGutterWidth:         40px;\r\n@gridColumnWidth:     	  floor((@T3gridWidth - @gridGutterWidth * (@gridColumns - 1)) / @gridColumns);\r\n@gridRowWidth:            (@gridColumns * @gridColumnWidth) + (@gridGutterWidth * (@gridColumns - 1));\r\n\r\n// 1200px min\r\n@T3gridWidth1200:         990px;  // T3 add\r\n@gridGutterWidth1200:     20px;\r\n@gridColumnWidth1200:     floor((@T3gridWidth1200 - @gridGutterWidth1200 * (@gridColumns - 1)) / @gridColumns);\r\n@gridRowWidth1200:        (@gridColumns * @gridColumnWidth1200) + (@gridGutterWidth1200 * (@gridColumns - 1));\r\n\r\n// 980px-1199px\r\n@T3gridWidth980:          940px;  // T3 add\r\n@gridGutterWidth980:      40px;\r\n@gridColumnWidth980:      floor((@T3gridWidth980 - @gridGutterWidth980 * (@gridColumns - 1)) / @gridColumns);\r\n@gridRowWidth980:         (@gridColumns * @gridColumnWidth980) + (@gridGutterWidth980 * (@gridColumns - 1));\r\n\r\n// T3 Add: 768px-979px\r\n@T3gridWidth768:          740px;  // T3 add\r\n@gridGutterWidth768:      20px;\r\n@gridColumnWidth768:      floor((@T3gridWidth768 - @gridGutterWidth768 * (@gridColumns - 1)) / @gridColumns);\r\n@gridRowWidth768:         (@gridColumns * @gridColumnWidth768) + (@gridGutterWidth768 * (@gridColumns - 1));\r\n\r\n\r\n// Fluid grid\r\n// -------------------------\r\n@fluidGridColumnWidth:      percentage(@gridColumnWidth/@gridRowWidth);\r\n@fluidGridGutterWidth:      percentage(@gridGutterWidth/@gridRowWidth);\r\n\r\n// 1200px min\r\n@fluidGridColumnWidth1200:  percentage(@gridColumnWidth1200/@gridRowWidth1200);\r\n@fluidGridGutterWidth1200:  percentage(@gridGutterWidth1200/@gridRowWidth1200);\r\n\r\n// 980px-1199px\r\n@fluidGridColumnWidth980:   percentage(@gridColumnWidth980/@gridRowWidth980);\r\n@fluidGridGutterWidth980:   percentage(@gridGutterWidth980/@gridRowWidth980);\r\n\r\n// T3 Extensed: 768px-979px\r\n@fluidGridColumnWidth768:   percentage(@gridColumnWidth768/@gridRowWidth768);\r\n@fluidGridGutterWidth768:   percentage(@gridGutterWidth768/@gridRowWidth768);\r\n\r\n\r\n\r\n//\r\n// T3 TEMPLATE STYLES\r\n// --------------------------------------------------\r\n@T3borderColor:             #ddd;\r\n@T3bodyBackgroundImage:     none;\r\n\r\n// Global Margin & Padding\r\n@T3globalMargin:            @baseLineHeight;\r\n@T3globalPadding:           @baseLineHeight;\r\n\r\n\r\n// ThemeMagic\r\n// -------------------------\r\n@T3NavbarInverted:          0;\r\n@T3SpotlightsInverted:      0;\r\n\r\n\r\n\r\n//\r\n// T3 LOGO\r\n// --------------------------------------------------\r\n@T3logoWidth:               305px;\r\n@T3logoHeight:              130px;\r\n\r\n@T3LogoImage:               "@{T3ImagePath}/logo.png";\r\n\r\n\r\n\r\n//\r\n// T3 GLOBAL STYLES\r\n// --------------------------------------------------\r\n\r\n// Module Styles\r\n// -------------------------\r\n// Module General\r\n@T3moduleBackground:            transparent;\r\n@T3moduleColor:                 inherit;\r\n@T3modulePadding:               0;\r\n@T3moduleBorder:                1px solid @T3borderColor;\r\n\r\n// Module Title\r\n@T3moduleTitleBackground:       inherit; // inherit from @moduleBackground\r\n@T3moduleTitleColor:            @headingsColor; // inherit from @moduleColor\r\n@T3moduleTitlePadding:          0;\r\n\r\n// Module Content\r\n@T3moduleContentBackground:     inherit; // inherit from @moduleBackground\r\n@T3moduleContentColor:          inherit; // inherit from @moduleColor\r\n@T3moduleContentPadding:        0;\r\n\r\n\r\n// Footer Modules Styles\r\n// -------------------------\r\n@T3FooterModuleTitleColor:      @grayLight;\r\n@T3FooterModuleColor:           @grayLight;\r\n\r\n\r\n\r\n//\r\n// Mixins\r\n// --------------------------------------------------\r\n\r\n\r\n// UTILITY MIXINS\r\n// --------------------------------------------------\r\n\r\n// Clearfix\r\n// --------\r\n// For clearing floats like a boss h5bp.com/q\r\n.clearfix {\r\n  *zoom: 1;\r\n  &:before,\r\n  &:after {\r\n    display: table;\r\n    content: "";\r\n    // Fixes Opera/contenteditable bug:\r\n    // http://nicolasgallagher.com/micro-clearfix-hack/#comment-36952\r\n    line-height: 0;\r\n  }\r\n  &:after {\r\n    clear: both;\r\n  }\r\n}\r\n\r\n// Webkit-style focus\r\n// ------------------\r\n.tab-focus() {\r\n  // Default\r\n  outline: thin dotted #333;\r\n  // Webkit\r\n  outline: 5px auto -webkit-focus-ring-color;\r\n  outline-offset: -2px;\r\n}\r\n\r\n// Center-align a block level element\r\n// ----------------------------------\r\n.center-block() {\r\n  display: block;\r\n  margin-left: auto;\r\n  margin-right: auto;\r\n}\r\n\r\n// IE7 inline-block\r\n// ----------------\r\n.ie7-inline-block() {\r\n  *display: inline; /* IE7 inline-block hack */\r\n  *zoom: 1;\r\n}\r\n\r\n// IE7 likes to collapse whitespace on either side of the inline-block elements.\r\n// Ems because we''re attempting to match the width of a space character. Left\r\n// version is for form buttons, which typically come after other elements, and\r\n// right version is for icons, which come before. Applying both is ok, but it will\r\n// mean that space between those elements will be .6em (~2 space characters) in IE7,\r\n// instead of the 1 space in other browsers.\r\n.ie7-restore-left-whitespace() {\r\n  *margin-left: .3em;\r\n\r\n  &:first-child {\r\n    *margin-left: 0;\r\n  }\r\n}\r\n\r\n.ie7-restore-right-whitespace() {\r\n  *margin-right: .3em;\r\n}\r\n\r\n// Sizing shortcuts\r\n// -------------------------\r\n.size(@height, @width) {\r\n  width: @width;\r\n  height: @height;\r\n}\r\n.square(@size) {\r\n  .size(@size, @size);\r\n}\r\n\r\n// Placeholder text\r\n// -------------------------\r\n.placeholder(@color: @placeholderText) {\r\n  &:-moz-placeholder {\r\n    color: @color;\r\n  }\r\n  &:-ms-input-placeholder {\r\n    color: @color;\r\n  }\r\n  &::-webkit-input-placeholder {\r\n    color: @color;\r\n  }\r\n}\r\n\r\n// Text overflow\r\n// -------------------------\r\n// Requires inline-block or block for proper styling\r\n.text-overflow() {\r\n  overflow: hidden;\r\n  text-overflow: ellipsis;\r\n  white-space: nowrap;\r\n}\r\n\r\n// CSS image replacement\r\n// -------------------------\r\n// Source: https://github.com/h5bp/html5-boilerplate/commit/aa0396eae757\r\n.hide-text {\r\n  font: 0/0 a;\r\n  color: transparent;\r\n  text-shadow: none;\r\n  background-color: transparent;\r\n  border: 0;\r\n}\r\n\r\n\r\n// FONTS\r\n// --------------------------------------------------\r\n\r\n#font {\r\n  #family {\r\n    .serif() {\r\n      font-family: @serifFontFamily;\r\n    }\r\n    .sans-serif() {\r\n      font-family: @sansFontFamily;\r\n    }\r\n    .monospace() {\r\n      font-family: @monoFontFamily;\r\n    }\r\n  }\r\n  .shorthand(@size: @baseFontSize, @weight: normal, @lineHeight: @baseLineHeight) {\r\n    font-size: @size;\r\n    font-weight: @weight;\r\n    line-height: @lineHeight;\r\n  }\r\n  .serif(@size: @baseFontSize, @weight: normal, @lineHeight: @baseLineHeight) {\r\n    #font > #family > .serif;\r\n    #font > .shorthand(@size, @weight, @lineHeight);\r\n  }\r\n  .sans-serif(@size: @baseFontSize, @weight: normal, @lineHeight: @baseLineHeight) {\r\n    #font > #family > .sans-serif;\r\n    #font > .shorthand(@size, @weight, @lineHeight);\r\n  }\r\n  .monospace(@size: @baseFontSize, @weight: normal, @lineHeight: @baseLineHeight) {\r\n    #font > #family > .monospace;\r\n    #font > .shorthand(@size, @weight, @lineHeight);\r\n  }\r\n}\r\n\r\n\r\n// FORMS\r\n// --------------------------------------------------\r\n\r\n// Block level inputs\r\n.input-block-level {\r\n  display: block;\r\n  width: 100%;\r\n  min-height: @inputHeight; // Make inputs at least the height of their button counterpart (base line-height + padding + border)\r\n  .box-sizing(border-box); // Makes inputs behave like true block-level elements\r\n}\r\n\r\n\r\n\r\n// Mixin for form field states\r\n.formFieldState(@textColor: #555, @borderColor: #ccc, @backgroundColor: #f5f5f5) {\r\n  // Set the text color\r\n  .control-label,\r\n  .help-block,\r\n  .help-inline {\r\n    color: @textColor;\r\n  }\r\n  // Style inputs accordingly\r\n  .checkbox,\r\n  .radio,\r\n  input,\r\n  select,\r\n  textarea {\r\n    color: @textColor;\r\n  }\r\n  input,\r\n  select,\r\n  textarea {\r\n    border-color: @borderColor;\r\n    .box-shadow(inset 0 1px 1px rgba(0,0,0,.075)); // Redeclare so transitions work\r\n    &:focus {\r\n      border-color: darken(@borderColor, 10%);\r\n      @shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 6px lighten(@borderColor, 20%);\r\n      .box-shadow(@shadow);\r\n    }\r\n  }\r\n  // Give a small background color for input-prepend/-append\r\n  .input-prepend .add-on,\r\n  .input-append .add-on {\r\n    color: @textColor;\r\n    background-color: @backgroundColor;\r\n    border-color: @textColor;\r\n  }\r\n}\r\n\r\n\r\n\r\n// CSS3 PROPERTIES\r\n// --------------------------------------------------\r\n\r\n// Border Radius\r\n.border-radius(@radius) {\r\n  -webkit-border-radius: @radius;\r\n     -moz-border-radius: @radius;\r\n          border-radius: @radius;\r\n}\r\n\r\n// Single Corner Border Radius\r\n.border-top-left-radius(@radius) {\r\n  -webkit-border-top-left-radius: @radius;\r\n      -moz-border-radius-topleft: @radius;\r\n          border-top-left-radius: @radius;\r\n}\r\n.border-top-right-radius(@radius) {\r\n  -webkit-border-top-right-radius: @radius;\r\n      -moz-border-radius-topright: @radius;\r\n          border-top-right-radius: @radius;\r\n}\r\n.border-bottom-right-radius(@radius) {\r\n  -webkit-border-bottom-right-radius: @radius;\r\n      -moz-border-radius-bottomright: @radius;\r\n          border-bottom-right-radius: @radius;\r\n}\r\n.border-bottom-left-radius(@radius) {\r\n  -webkit-border-bottom-left-radius: @radius;\r\n      -moz-border-radius-bottomleft: @radius;\r\n          border-bottom-left-radius: @radius;\r\n}\r\n\r\n// Single Side Border Radius\r\n.border-top-radius(@radius) {\r\n  .border-top-right-radius(@radius);\r\n  .border-top-left-radius(@radius);\r\n}\r\n.border-right-radius(@radius) {\r\n  .border-top-right-radius(@radius);\r\n  .border-bottom-right-radius(@radius);\r\n}\r\n.border-bottom-radius(@radius) {\r\n  .border-bottom-right-radius(@radius);\r\n  .border-bottom-left-radius(@radius);\r\n}\r\n.border-left-radius(@radius) {\r\n  .border-top-left-radius(@radius);\r\n  .border-bottom-left-radius(@radius);\r\n}\r\n\r\n// Drop shadows\r\n.box-shadow(@shadow) {\r\n  -webkit-box-shadow: @shadow;\r\n     -moz-box-shadow: @shadow;\r\n          box-shadow: @shadow;\r\n}\r\n\r\n// Transitions\r\n.transition(@transition) {\r\n  -webkit-transition: @transition;\r\n     -moz-transition: @transition;\r\n       -o-transition: @transition;\r\n          transition: @transition;\r\n}\r\n.transition-delay(@transition-delay) {\r\n  -webkit-transition-delay: @transition-delay;\r\n     -moz-transition-delay: @transition-delay;\r\n       -o-transition-delay: @transition-delay;\r\n          transition-delay: @transition-delay;\r\n}\r\n.transition-duration(@transition-duration) {\r\n  -webkit-transition-duration: @transition-duration;\r\n     -moz-transition-duration: @transition-duration;\r\n       -o-transition-duration: @transition-duration;\r\n          transition-duration: @transition-duration;\r\n}\r\n\r\n// Transformations\r\n.rotate(@degrees) {\r\n  -webkit-transform: rotate(@degrees);\r\n     -moz-transform: rotate(@degrees);\r\n      -ms-transform: rotate(@degrees);\r\n       -o-transform: rotate(@degrees);\r\n          transform: rotate(@degrees);\r\n}\r\n.scale(@ratio) {\r\n  -webkit-transform: scale(@ratio);\r\n     -moz-transform: scale(@ratio);\r\n      -ms-transform: scale(@ratio);\r\n       -o-transform: scale(@ratio);\r\n          transform: scale(@ratio);\r\n}\r\n.translate(@x, @y) {\r\n  -webkit-transform: translate(@x, @y);\r\n     -moz-transform: translate(@x, @y);\r\n      -ms-transform: translate(@x, @y);\r\n       -o-transform: translate(@x, @y);\r\n          transform: translate(@x, @y);\r\n}\r\n.skew(@x, @y) {\r\n  -webkit-transform: skew(@x, @y);\r\n     -moz-transform: skew(@x, @y);\r\n      -ms-transform: skewX(@x) skewY(@y); // See https://github.com/twitter/bootstrap/issues/4885\r\n       -o-transform: skew(@x, @y);\r\n          transform: skew(@x, @y);\r\n  -webkit-backface-visibility: hidden; // See https://github.com/twitter/bootstrap/issues/5319\r\n}\r\n.translate3d(@x, @y, @z) {\r\n  -webkit-transform: translate3d(@x, @y, @z);\r\n     -moz-transform: translate3d(@x, @y, @z);\r\n       -o-transform: translate3d(@x, @y, @z);\r\n          transform: translate3d(@x, @y, @z);\r\n}\r\n\r\n// Backface visibility\r\n// Prevent browsers from flickering when using CSS 3D transforms.\r\n// Default value is `visible`, but can be changed to `hidden\r\n// See git pull https://github.com/dannykeane/bootstrap.git backface-visibility for examples\r\n.backface-visibility(@visibility){\r\n	-webkit-backface-visibility: @visibility;\r\n	   -moz-backface-visibility: @visibility;\r\n	        backface-visibility: @visibility;\r\n}\r\n\r\n// Background clipping\r\n// Heads up: FF 3.6 and under need "padding" instead of "padding-box"\r\n.background-clip(@clip) {\r\n  -webkit-background-clip: @clip;\r\n     -moz-background-clip: @clip;\r\n          background-clip: @clip;\r\n}\r\n\r\n// Background sizing\r\n.background-size(@size) {\r\n  -webkit-background-size: @size;\r\n     -moz-background-size: @size;\r\n       -o-background-size: @size;\r\n          background-size: @size;\r\n}\r\n\r\n\r\n// Box sizing\r\n.box-sizing(@boxmodel) {\r\n  -webkit-box-sizing: @boxmodel;\r\n     -moz-box-sizing: @boxmodel;\r\n          box-sizing: @boxmodel;\r\n}\r\n\r\n// User select\r\n// For selecting text on the page\r\n.user-select(@select) {\r\n  -webkit-user-select: @select;\r\n     -moz-user-select: @select;\r\n      -ms-user-select: @select;\r\n       -o-user-select: @select;\r\n          user-select: @select;\r\n}\r\n\r\n// Resize anything\r\n.resizable(@direction) {\r\n  resize: @direction; // Options: horizontal, vertical, both\r\n  overflow: auto; // Safari fix\r\n}\r\n\r\n// CSS3 Content Columns\r\n.content-columns(@columnCount, @columnGap: @gridGutterWidth) {\r\n  -webkit-column-count: @columnCount;\r\n     -moz-column-count: @columnCount;\r\n          column-count: @columnCount;\r\n  -webkit-column-gap: @columnGap;\r\n     -moz-column-gap: @columnGap;\r\n          column-gap: @columnGap;\r\n}\r\n\r\n// Optional hyphenation\r\n.hyphens(@mode: auto) {\r\n  word-wrap: break-word;\r\n  -webkit-hyphens: @mode;\r\n     -moz-hyphens: @mode;\r\n      -ms-hyphens: @mode;\r\n       -o-hyphens: @mode;\r\n          hyphens: @mode;\r\n}\r\n\r\n// Opacity\r\n.opacity(@opacity) {\r\n  opacity: @opacity / 100;\r\n  filter: ~"alpha(opacity=@{opacity})";\r\n}\r\n\r\n\r\n\r\n// BACKGROUNDS\r\n// --------------------------------------------------\r\n\r\n// Add an alphatransparency value to any background or border color (via Elyse Holladay)\r\n#translucent {\r\n  .background(@color: @white, @alpha: 1) {\r\n    background-color: hsla(hue(@color), saturation(@color), lightness(@color), @alpha);\r\n  }\r\n  .border(@color: @white, @alpha: 1) {\r\n    border-color: hsla(hue(@color), saturation(@color), lightness(@color), @alpha);\r\n    .background-clip(padding-box);\r\n  }\r\n}\r\n\r\n// Gradient Bar Colors for buttons and alerts\r\n.gradientBar(@primaryColor, @secondaryColor, @textColor: #fff, @textShadow: 0 -1px 0 rgba(0,0,0,.25)) {\r\n  color: @textColor;\r\n  text-shadow: @textShadow;\r\n  #gradient > .vertical(@primaryColor, @secondaryColor);\r\n  border-color: @secondaryColor @secondaryColor darken(@secondaryColor, 15%);\r\n  border-color: rgba(0,0,0,.1) rgba(0,0,0,.1) fadein(rgba(0,0,0,.1), 15%);\r\n}\r\n\r\n// Gradients\r\n#gradient {\r\n  .horizontal(@startColor: #555, @endColor: #333) {\r\n    background-color: @endColor;\r\n    background-image: -moz-linear-gradient(left, @startColor, @endColor); // FF 3.6+\r\n    background-image: -webkit-gradient(linear, 0 0, 100% 0, from(@startColor), to(@endColor)); // Safari 4+, Chrome 2+\r\n    background-image: -webkit-linear-gradient(left, @startColor, @endColor); // Safari 5.1+, Chrome 10+\r\n    background-image: -o-linear-gradient(left, @startColor, @endColor); // Opera 11.10\r\n    background-image: linear-gradient(to right, @startColor, @endColor); // Standard, IE10\r\n    background-repeat: repeat-x;\r\n    filter: e(%("progid:DXImageTransform.Microsoft.gradient(startColorstr=''%d'', endColorstr=''%d'', GradientType=1)",argb(@startColor),argb(@endColor))); // IE9 and down\r\n  }\r\n  .vertical(@startColor: #555, @endColor: #333) {\r\n    background-color: mix(@startColor, @endColor, 60%);\r\n    background-image: -moz-linear-gradient(top, @startColor, @endColor); // FF 3.6+\r\n    background-image: -webkit-gradient(linear, 0 0, 0 100%, from(@startColor), to(@endColor)); // Safari 4+, Chrome 2+\r\n    background-image: -webkit-linear-gradient(top, @startColor, @endColor); // Safari 5.1+, Chrome 10+\r\n    background-image: -o-linear-gradient(top, @startColor, @endColor); // Opera 11.10\r\n    background-image: linear-gradient(to bottom, @startColor, @endColor); // Standard, IE10\r\n    background-repeat: repeat-x;\r\n    filter: e(%("progid:DXImageTransform.Microsoft.gradient(startColorstr=''%d'', endColorstr=''%d'', GradientType=0)",argb(@startColor),argb(@endColor))); // IE9 and down\r\n  }\r\n  .directional(@startColor: #555, @endColor: #333, @deg: 45deg) {\r\n    background-color: @endColor;\r\n    background-repeat: repeat-x;\r\n    background-image: -moz-linear-gradient(@deg, @startColor, @endColor); // FF 3.6+\r\n    background-image: -webkit-linear-gradient(@deg, @startColor, @endColor); // Safari 5.1+, Chrome 10+\r\n    background-image: -o-linear-gradient(@deg, @startColor, @endColor); // Opera 11.10\r\n    background-image: linear-gradient(@deg, @startColor, @endColor); // Standard, IE10\r\n  }\r\n  .horizontal-three-colors(@startColor: #00b3ee, @midColor: #7a43b6, @colorStop: 50%, @endColor: #c3325f) {\r\n    background-color: mix(@midColor, @endColor, 80%);\r\n    background-image: -webkit-gradient(left, linear, 0 0, 0 100%, from(@startColor), color-stop(@colorStop, @midColor), to(@endColor));\r\n    background-image: -webkit-linear-gradient(left, @startColor, @midColor @colorStop, @endColor);\r\n    background-image: -moz-linear-gradient(left, @startColor, @midColor @colorStop, @endColor);\r\n    background-image: -o-linear-gradient(left, @startColor, @midColor @colorStop, @endColor);\r\n    background-image: linear-gradient(to right, @startColor, @midColor @colorStop, @endColor);\r\n    background-repeat: no-repeat;\r\n    filter: e(%("progid:DXImageTransform.Microsoft.gradient(startColorstr=''%d'', endColorstr=''%d'', GradientType=0)",argb(@startColor),argb(@endColor))); // IE9 and down, gets no color-stop at all for proper fallback\r\n  }\r\n\r\n  .vertical-three-colors(@startColor: #00b3ee, @midColor: #7a43b6, @colorStop: 50%, @endColor: #c3325f) {\r\n    background-color: mix(@midColor, @endColor, 80%);\r\n    background-image: -webkit-gradient(linear, 0 0, 0 100%, from(@startColor), color-stop(@colorStop, @midColor), to(@endColor));\r\n    background-image: -webkit-linear-gradient(@startColor, @midColor @colorStop, @endColor);\r\n    background-image: -moz-linear-gradient(top, @startColor, @midColor @colorStop, @endColor);\r\n    background-image: -o-linear-gradient(@startColor, @midColor @colorStop, @endColor);\r\n    background-image: linear-gradient(@startColor, @midColor @colorStop, @endColor);\r\n    background-repeat: no-repeat;\r\n    filter: e(%("progid:DXImageTransform.Microsoft.gradient(startColorstr=''%d'', endColorstr=''%d'', GradientType=0)",argb(@startColor),argb(@endColor))); // IE9 and down, gets no color-stop at all for proper fallback\r\n  }\r\n  .radial(@innerColor: #555, @outerColor: #333) {\r\n    background-color: @outerColor;\r\n    background-image: -webkit-gradient(radial, center center, 0, center center, 460, from(@innerColor), to(@outerColor));\r\n    background-image: -webkit-radial-gradient(circle, @innerColor, @outerColor);\r\n    background-image: -moz-radial-gradient(circle, @innerColor, @outerColor);\r\n    background-image: -o-radial-gradient(circle, @innerColor, @outerColor);\r\n    background-repeat: no-repeat;\r\n  }\r\n  .striped(@color: #555, @angle: 45deg) {\r\n    background-color: @color;\r\n    background-image: -webkit-gradient(linear, 0 100%, 100% 0, color-stop(.25, rgba(255,255,255,.15)), color-stop(.25, transparent), color-stop(.5, transparent), color-stop(.5, rgba(255,255,255,.15)), color-stop(.75, rgba(255,255,255,.15)), color-stop(.75, transparent), to(transparent));\r\n    background-image: -webkit-linear-gradient(@angle, rgba(255,255,255,.15) 25%, transparent 25%, transparent 50%, rgba(255,255,255,.15) 50%, rgba(255,255,255,.15) 75%, transparent 75%, transparent);\r\n    background-image: -moz-linear-gradient(@angle, rgba(255,255,255,.15) 25%, transparent 25%, transparent 50%, rgba(255,255,255,.15) 50%, rgba(255,255,255,.15) 75%, transparent 75%, transparent);\r\n    background-image: -o-linear-gradient(@angle, rgba(255,255,255,.15) 25%, transparent 25%, transparent 50%, rgba(255,255,255,.15) 50%, rgba(255,255,255,.15) 75%, transparent 75%, transparent);\r\n    background-image: linear-gradient(@angle, rgba(255,255,255,.15) 25%, transparent 25%, transparent 50%, rgba(255,255,255,.15) 50%, rgba(255,255,255,.15) 75%, transparent 75%, transparent);\r\n  }\r\n}\r\n// Reset filters for IE\r\n.reset-filter() {\r\n  filter: e(%("progid:DXImageTransform.Microsoft.gradient(enabled = false)"));\r\n}\r\n\r\n\r\n\r\n// COMPONENT MIXINS\r\n// --------------------------------------------------\r\n\r\n// Horizontal dividers\r\n// -------------------------\r\n// Dividers (basically an hr) within dropdowns and nav lists\r\n.nav-divider(@top: #e5e5e5, @bottom: @white) {\r\n  // IE7 needs a set width since we gave a height. Restricting just\r\n  // to IE7 to keep the 1px left/right space in other browsers.\r\n  // It is unclear where IE is getting the extra space that we need\r\n  // to negative-margin away, but so it goes.\r\n  *width: 100%;\r\n  height: 1px;\r\n  margin: ((@baseLineHeight / 2) - 1) 1px; // 8px 1px\r\n  *margin: -5px 0 5px;\r\n  overflow: hidden;\r\n  background-color: @top;\r\n  border-bottom: 1px solid @bottom;\r\n}\r\n\r\n// Button backgrounds\r\n// ------------------\r\n.buttonBackground(@startColor, @endColor, @textColor: #fff, @textShadow: 0 -1px 0 rgba(0,0,0,.25)) {\r\n  // gradientBar will set the background to a pleasing blend of these, to support IE<=9\r\n  .gradientBar(@startColor, @endColor, @textColor, @textShadow);\r\n  *background-color: @endColor; /* Darken IE7 buttons by default so they stand out more given they won''t have borders */\r\n  .reset-filter();\r\n\r\n  // in these cases the gradient won''t cover the background, so we override\r\n  &:hover, &:focus, &:active, &.active, &.disabled, &[disabled] {\r\n    color: @textColor;\r\n    background-color: @endColor;\r\n    *background-color: darken(@endColor, 5%);\r\n  }\r\n\r\n  // IE 7 + 8 can''t handle box-shadow to show active, so we darken a bit ourselves\r\n  &:active,\r\n  &.active {\r\n    background-color: darken(@endColor, 10%) e("\\9");\r\n  }\r\n}\r\n\r\n// Navbar vertical align\r\n// -------------------------\r\n// Vertically center elements in the navbar.\r\n// Example: an element has a height of 30px, so write out `.navbarVerticalAlign(30px);` to calculate the appropriate top margin.\r\n.navbarVerticalAlign(@elementHeight) {\r\n  margin-top: (@navbarHeight - @elementHeight) / 2;\r\n}\r\n\r\n\r\n\r\n// Grid System\r\n// -----------\r\n\r\n// Centered container element\r\n.container-fixed() {\r\n  margin-right: auto;\r\n  margin-left: auto;\r\n  .clearfix();\r\n}\r\n\r\n// Table columns\r\n.tableColumns(@columnSpan: 1) {\r\n  float: none; // undo default grid column styles\r\n  width: ((@gridColumnWidth) * @columnSpan) + (@gridGutterWidth * (@columnSpan - 1)) - 16; // 16 is total padding on left and right of table cells\r\n  margin-left: 0; // undo default grid column styles\r\n}\r\n\r\n// Make a Grid\r\n// Use .makeRow and .makeColumn to assign semantic layouts grid system behavior\r\n.makeRow() {\r\n  margin-left: @gridGutterWidth * -1;\r\n  .clearfix();\r\n}\r\n.makeColumn(@columns: 1, @offset: 0) {\r\n  float: left;\r\n  margin-left: (@gridColumnWidth * @offset) + (@gridGutterWidth * (@offset - 1)) + (@gridGutterWidth * 2);\r\n  width: (@gridColumnWidth * @columns) + (@gridGutterWidth * (@columns - 1));\r\n}\r\n\r\n// The Grid\r\n#grid {\r\n\r\n  .core (@gridColumnWidth, @gridGutterWidth) {\r\n\r\n    .spanX (@index) when (@index > 0) {\r\n      (~".span@{index}") { .span(@index); }\r\n      .spanX(@index - 1);\r\n    }\r\n    .spanX (0) {}\r\n\r\n    .offsetX (@index) when (@index > 0) {\r\n      (~".offset@{index}") { .offset(@index); }\r\n      .offsetX(@index - 1);\r\n    }\r\n    .offsetX (0) {}\r\n\r\n    .offset (@columns) {\r\n      margin-left: (@gridColumnWidth * @columns) + (@gridGutterWidth * (@columns + 1));\r\n    }\r\n\r\n    .span (@columns) {\r\n      width: (@gridColumnWidth * @columns) + (@gridGutterWidth * (@columns - 1));\r\n    }\r\n\r\n    .row {\r\n      margin-left: @gridGutterWidth * -1;\r\n      .clearfix();\r\n    }\r\n\r\n    [class*="span"] {\r\n      float: left;\r\n      min-height: 1px; // prevent collapsing columns\r\n      margin-left: @gridGutterWidth;\r\n    }\r\n\r\n    // Set the container width, and override it for fixed navbars in media queries\r\n    .container,\r\n    .navbar-static-top .container,\r\n    .navbar-fixed-top .container,\r\n    .navbar-fixed-bottom .container { .span(@gridColumns); }\r\n\r\n    // generate .spanX and .offsetX\r\n    .spanX (@gridColumns);\r\n    .offsetX (@gridColumns);\r\n\r\n  }\r\n\r\n  .fluid (@fluidGridColumnWidth, @fluidGridGutterWidth) {\r\n\r\n    .spanX (@index, @fluidGridColumnWidth, @fluidGridGutterWidth) when (@index > 0) {\r\n      (~".span@{index}") { .span(@index); }\r\n      .spanX(@index - 1, @fluidGridColumnWidth, @fluidGridGutterWidth);\r\n    }\r\n    .spanX (0, @fluidGridColumnWidth, @fluidGridGutterWidth) {}\r\n\r\n    .offsetX (@index, @fluidGridColumnWidth, @fluidGridGutterWidth) when (@index > 0) {\r\n      (~''.offset@{index}'') { .offset(@index); }\r\n      (~''.offset@{index}:first-child'') { .offsetFirstChild(@index); }\r\n      .offsetX(@index - 1, @fluidGridColumnWidth, @fluidGridGutterWidth);\r\n    }\r\n    .offsetX (0, @fluidGridColumnWidth, @fluidGridGutterWidth) {}\r\n\r\n    .offset (@columns) {\r\n      margin-left: (@fluidGridColumnWidth * @columns) + (@fluidGridGutterWidth * (@columns - 1)) + (@fluidGridGutterWidth*2);\r\n  	  *margin-left: (@fluidGridColumnWidth * @columns) + (@fluidGridGutterWidth * (@columns - 1)) - (.5 / @gridRowWidth * 100 * 1%) + (@fluidGridGutterWidth*2) - (.5 / @gridRowWidth * 100 * 1%);\r\n    }\r\n\r\n    .offsetFirstChild (@columns) {\r\n      margin-left: (@fluidGridColumnWidth * @columns) + (@fluidGridGutterWidth * (@columns - 1)) + (@fluidGridGutterWidth);\r\n      *margin-left: (@fluidGridColumnWidth * @columns) + (@fluidGridGutterWidth * (@columns - 1)) - (.5 / @gridRowWidth * 100 * 1%) + @fluidGridGutterWidth - (.5 / @gridRowWidth * 100 * 1%);\r\n    }\r\n\r\n    .span (@columns) {\r\n      width: (@fluidGridColumnWidth * @columns) + (@fluidGridGutterWidth * (@columns - 1));\r\n      *width: (@fluidGridColumnWidth * @columns) + (@fluidGridGutterWidth * (@columns - 1)) - (.5 / @gridRowWidth * 100 * 1%);\r\n    }\r\n\r\n    .row-fluid {\r\n      width: 100%;\r\n      .clearfix();\r\n      [class*="span"] {\r\n        .input-block-level();\r\n        float: left;\r\n        margin-left: @fluidGridGutterWidth;\r\n        *margin-left: @fluidGridGutterWidth - (.5 / @gridRowWidth * 100 * 1%);\r\n      }\r\n      [class*="span"]:first-child {\r\n        margin-left: 0;\r\n      }\r\n\r\n      // Space grid-sized controls properly if multiple per line\r\n      .controls-row [class*="span"] + [class*="span"] {\r\n        margin-left: @fluidGridGutterWidth;\r\n      }\r\n\r\n      // generate .spanX and .offsetX\r\n      .spanX (@gridColumns, @fluidGridColumnWidth, @fluidGridGutterWidth);\r\n      .offsetX (@gridColumns, @fluidGridColumnWidth, @fluidGridGutterWidth);\r\n    }\r\n\r\n  }\r\n\r\n  .input(@gridColumnWidth, @gridGutterWidth) {\r\n\r\n    .spanX (@index) when (@index > 0) {\r\n      (~"input.span@{index}, textarea.span@{index}, .uneditable-input.span@{index}") { .span(@index); }\r\n      .spanX(@index - 1);\r\n    }\r\n    .spanX (0) {}\r\n\r\n    .span(@columns) {\r\n      width: ((@gridColumnWidth) * @columns) + (@gridGutterWidth * (@columns - 1)) - 14;\r\n    }\r\n\r\n    input,\r\n    textarea,\r\n    .uneditable-input {\r\n      margin-left: 0; // override margin-left from core grid system\r\n    }\r\n\r\n    // Space grid-sized controls properly if multiple per line\r\n    .controls-row [class*="span"] + [class*="span"] {\r\n      margin-left: @gridGutterWidth;\r\n    }\r\n\r\n    // generate .spanX\r\n    .spanX (@gridColumns);\r\n\r\n  }\r\n}\r\n/** \r\n *------------------------------------------------------------------------------\r\n * @package       T3 Framework for Joomla!\r\n *------------------------------------------------------------------------------\r\n * @copyright     Copyright (C) 2004-2013 JoomlArt.com. All Rights Reserved.\r\n * @license       GNU General Public License version 2 or later; see LICENSE.txt\r\n * @authors       JoomlArt, JoomlaBamboo, (contribute to this project at github \r\n *                & Google group to become co-author)\r\n * @Google group: https://groups.google.com/forum/#!forum/t3fw\r\n * @Link:         http://t3-framework.org \r\n *------------------------------------------------------------------------------\r\n */\r\n\r\n\r\n// The Grid extend\r\n// MIXINS\r\n#grid-extend {\r\n  \r\n  // extend left offset\r\n  .offset (@gridColumnWidth, @gridGutterWidth) {\r\n    .offset-X (@index) when (@index > 0) {\r\n      (~".offset-@{index}") { .offset-(@index); }\r\n      .offset-X(@index - 1);\r\n    }\r\n    .offset-X (0) {}\r\n\r\n    .offset- (@columns) {\r\n      margin-left: -(@gridColumnWidth * @columns) - (@gridGutterWidth * (@columns - 1));\r\n    }\r\n    \r\n    .offset-X (@gridColumns);\r\n  }\r\n\r\n  // fix the offset, used in t3-admin-layout-preview.less for layout configuration in template admin\r\n  .fixOffsetX (@fluidGridColumnWidth, @fluidGridGutterWidth) {\r\n\r\n    .offsetX (@index) when (@index > 0) {\r\n      (~''.offset@{index}'') { .offset(@index); }\r\n      (~''.offset@{index}:first-child'') { .offsetFirstChild(@index); }\r\n      .offsetX(@index - 1);\r\n    }\r\n    .offsetX (0) {}\r\n    .offset (@columns) {\r\n      margin-left: (@fluidGridColumnWidth * @columns) + (@fluidGridGutterWidth * (@columns - 1)) + (@fluidGridGutterWidth*2) !important;\r\n      *margin-left: (@fluidGridColumnWidth * @columns) + (@fluidGridGutterWidth * (@columns - 1)) - (.5 / @gridRowWidth * 100 * 1%) + (@fluidGridGutterWidth*2) - (.5 / @gridRowWidth * 100 * 1%) !important;\r\n    }\r\n    .offsetFirstChild (@columns) {\r\n      margin-left: (@fluidGridColumnWidth * @columns) + (@fluidGridGutterWidth * (@columns - 1)) + (@fluidGridGutterWidth) !important;\r\n      *margin-left: (@fluidGridColumnWidth * @columns) + (@fluidGridGutterWidth * (@columns - 1)) - (.5 / @gridRowWidth * 100 * 1%) + @fluidGridGutterWidth - (.5 / @gridRowWidth * 100 * 1%) !important;\r\n    }\r\n\r\n    .offset-X (@index) when (@index > 0) {\r\n      (~''.offset-@{index}'') { .offset-(@index); }\r\n      .offset-X(@index - 1);\r\n    }\r\n    .offset-X (0) {}\r\n    .offset- (@columns) {\r\n      margin-left: -(@fluidGridColumnWidth * @columns) - (@fluidGridGutterWidth * (@columns - 1)) !important;\r\n      *margin-left: -(@fluidGridColumnWidth * @columns) - (@fluidGridGutterWidth * (@columns - 1)) + (.5 / @gridRowWidth * 100 * 1%) + (.5 / @gridRowWidth * 100 * 1%) !important;\r\n    }\r\n    \r\n    .offsetX (@gridColumns);\r\n    .offset-X (@gridColumns);\r\n  }\r\n\r\n  // fluid for all type of row - apply for small screen as mobile, portrait tablet\r\n  .fluid (@fluidGridColumnWidth, @fluidGridGutterWidth) {\r\n\r\n    .spanX (@index) when (@index > 0) {\r\n      (~".span@{index}") { .span(@index); }\r\n      .spanX(@index - 1);\r\n    }\r\n    .spanX (0) {}\r\n\r\n    .span (@columns) {\r\n      width: (@fluidGridColumnWidth * @columns) + (@fluidGridGutterWidth * (@columns - 1));\r\n      *width: (@fluidGridColumnWidth * @columns) + (@fluidGridGutterWidth * (@columns - 1)) - (.5 / @gridRowWidth * 100 * 1%);\r\n    }\r\n\r\n    .row, .row-fluid {\r\n      width: 100%;\r\n      margin-left: 0;\r\n      .clearfix();\r\n      [class*="span"] {\r\n        .input-block-level();\r\n        float: left;\r\n        margin-left: @fluidGridGutterWidth;\r\n        *margin-left: @fluidGridGutterWidth - (.5 / @gridRowWidth * 100 * 1%);\r\n      }\r\n      [class*="span"]:first-child:not(.pull-right) {\r\n        margin-left: 0;\r\n      }\r\n\r\n      [class*="span"].pull-right:first-child + [class*="span"]:not(.pull-right) {\r\n        margin-left: 0;\r\n      }\r\n      \r\n      // generate .spanX\r\n      .spanX (@gridColumns);\r\n    }\r\n\r\n\r\n    .spanxy_(@pcols, @cols) {\r\n      width: percentage(((@fluidGridColumnWidth * @cols) + (@fluidGridGutterWidth * (@cols - 1)))/((@fluidGridColumnWidth * @pcols) + (@fluidGridGutterWidth * (@pcols - 1))));\r\n      *width: percentage(((@fluidGridColumnWidth * @cols) + (@fluidGridGutterWidth * (@cols - 1)))/((@fluidGridColumnWidth * @pcols) + (@fluidGridGutterWidth * (@pcols - 1)))) - (.5 / @gridRowWidth * 100 * 1%);\r\n    }\r\n    .spanXY (@indexx) when(@indexx > 0) {\r\n      (~".span@{indexx}") { \r\n        .row {\r\n          // span for spany in spanx\r\n          [class*="span"] {\r\n            margin-left: percentage(@fluidGridGutterWidth / ((@fluidGridColumnWidth * @indexx) + (@fluidGridGutterWidth * (@indexx - 1))));\r\n            *margin-left: percentage(@fluidGridGutterWidth / ((@fluidGridColumnWidth * @indexx) + (@fluidGridGutterWidth * (@indexx - 1)))) - (.5 / @gridRowWidth * 100 * 1%);\r\n          }\r\n          [class*="span"]:first-child {\r\n            margin-left: 0;\r\n          }\r\n\r\n          .spanY (@indexy) when (@indexy > 0) {\r\n            (~".span@{indexy}") {\r\n              .spanxy_(@indexx, @indexy);\r\n            }\r\n            .spanY (@indexy - 1); \r\n          }\r\n\r\n          .spanY (0) {}\r\n\r\n          .spanY (@indexx);\r\n        }\r\n      }\r\n      .spanXY(@indexx - 1);\r\n    }\r\n    .spanXY (0) {}\r\n\r\n    // generate .spanXY\r\n    .spanXY (@gridColumns);\r\n  }\r\n}\r\n";}}s:4:"user";O:5:"JUser":24:{s:9:"\\0\\0\\0isRoot";b:0;s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:5:"block";N;s:9:"sendEmail";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:6:"groups";a:1:{i:0;s:1:"9";}s:5:"guest";i:1;s:13:"lastResetTime";N;s:10:"resetCount";N;s:10:"\\0\\0\\0_params";O:9:"JRegistry":1:{s:7:"\\0\\0\\0data";O:8:"stdClass":0:{}}s:14:"\\0\\0\\0_authGroups";a:2:{i:0;i:1;i:1;i:9;}s:14:"\\0\\0\\0_authLevels";a:3:{i:0;i:1;i:1;i:1;i:2;i:5;}s:15:"\\0\\0\\0_authActions";N;s:12:"\\0\\0\\0_errorMsg";N;s:10:"\\0\\0\\0_errors";a:0:{}s:3:"aid";i:0;}s:13:"session.token";s:32:"01b6032d44163fee07dcd108f99771a4";}language|s:2:"en";currency|s:3:"USD";cart|a:0:{}redirect|s:48:"http://localhost/providores/index.php/my-account";vouchers|a:0:{}', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_tags`
--

CREATE TABLE IF NOT EXISTS `i8a13_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `i8a13_tags`
--

INSERT INTO `i8a13_tags` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `created_by_alias`, `modified_user_id`, `modified_time`, `images`, `urls`, `hits`, `language`, `version`, `publish_up`, `publish_down`) VALUES
(1, 0, 0, 1, 0, '', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '', 0, '2011-01-01 00:00:01', '', 0, '0000-00-00 00:00:00', '', '', 0, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_template_styles`
--

CREATE TABLE IF NOT EXISTS `i8a13_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `i8a13_template_styles`
--

INSERT INTO `i8a13_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(4, 'beez3', 0, '0', 'Beez3 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/joomla_black.gif","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","templatecolor":"personal","html5":"0"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', '{"showSiteName":"0","colourChoice":"","boldText":"0"}'),
(7, 'protostar', 0, '0', 'protostar - Default', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}'),
(8, 'isis', 1, '1', 'isis - Default', '{"templateColor":"","logoFile":""}'),
(9, 'providores', 0, '1', 'providores - Default', '{"t3_template":"1","devmode":"1","themermode":"1","responsive":"1","build_rtl":"0","minify":"0","t3-assets":"t3-assets","t3-rmvlogo":"1","theme":"","logotype":"image","sitename":"","slogan":"","logoimage":"","mainlayout":"home-2","navigation_trigger":"hover","navigation_collapse_offcanvas":"1","navigation_collapse_showsub":"1","navigation_type":"megamenu","navigation_animation":"fading","navigation_animation_duration":"400","mm_type":"mainmenu","mm_config":"","snippet_open_head":"","snippet_close_head":"","snippet_open_body":"","snippet_close_body":""}'),
(10, 'providores', 0, '0', 'providores - home', '{"t3_template":"1","devmode":"1","themermode":"1","responsive":"1","build_rtl":"0","minify":"0","t3-assets":"t3-assets","t3-rmvlogo":"1","theme":"","logotype":"image","sitename":"","slogan":"","logoimage":"","mainlayout":"home-1","navigation_trigger":"hover","navigation_collapse_offcanvas":"1","navigation_collapse_showsub":"1","navigation_type":"megamenu","navigation_animation":"fading","navigation_animation_duration":"400","mm_type":"mainmenu","mm_config":"","snippet_open_head":"","snippet_close_head":"","snippet_open_body":"","snippet_close_body":""}');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_ucm_base`
--

CREATE TABLE IF NOT EXISTS `i8a13_ucm_base` (
  `ucm_id` int(10) unsigned NOT NULL,
  `ucm_item_id` int(10) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL,
  PRIMARY KEY (`ucm_id`),
  KEY `idx_ucm_item_id` (`ucm_item_id`),
  KEY `idx_ucm_type_id` (`ucm_type_id`),
  KEY `idx_ucm_language_id` (`ucm_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_ucm_content`
--

CREATE TABLE IF NOT EXISTS `i8a13_ucm_content` (
  `core_content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `core_type_alias` varchar(255) NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(255) NOT NULL,
  `core_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `core_body` mediumtext NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) NOT NULL DEFAULT '',
  `core_checked_out_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_access` int(10) unsigned NOT NULL DEFAULT '0',
  `core_params` text NOT NULL,
  `core_featured` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) NOT NULL,
  `core_publish_up` datetime NOT NULL,
  `core_publish_down` datetime NOT NULL,
  `core_content_item_id` int(10) unsigned DEFAULT NULL COMMENT 'ID from the individual type table',
  `asset_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to the #__assets table.',
  `core_images` text NOT NULL,
  `core_urls` text NOT NULL,
  `core_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `core_version` int(10) unsigned NOT NULL DEFAULT '1',
  `core_ordering` int(11) NOT NULL DEFAULT '0',
  `core_metakey` text NOT NULL,
  `core_metadesc` text NOT NULL,
  `core_catid` int(10) unsigned NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`core_content_id`),
  KEY `tag_idx` (`core_state`,`core_access`),
  KEY `idx_access` (`core_access`),
  KEY `idx_alias` (`core_alias`),
  KEY `idx_language` (`core_language`),
  KEY `idx_title` (`core_title`),
  KEY `idx_modified_time` (`core_modified_time`),
  KEY `idx_created_time` (`core_created_time`),
  KEY `idx_content_type` (`core_type_alias`),
  KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  KEY `idx_core_created_user_id` (`core_created_user_id`),
  KEY `idx_core_type_id` (`core_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains core content data in name spaced fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_updates`
--

CREATE TABLE IF NOT EXISTS `i8a13_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(10) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Available Updates' AUTO_INCREMENT=253 ;

--
-- Dumping data for table `i8a13_updates`
--

INSERT INTO `i8a13_updates` (`update_id`, `update_site_id`, `extension_id`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`) VALUES
(1, 3, 0, 'Greek', '', 'pkg_el-GR', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/el-GR_details.xml', ''),
(2, 3, 0, 'Hebrew', '', 'pkg_he-IL', 'package', '', 0, '3.1.1.1', '', 'http://update.joomla.org/language/details3/he-IL_details.xml', ''),
(3, 3, 0, 'Hungarian', '', 'pkg_hu-HU', 'package', '', 0, '3.1.4.1', '', 'http://update.joomla.org/language/details3/hu-HU_details.xml', ''),
(4, 3, 0, 'Afrikaans', '', 'pkg_af-ZA', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/af-ZA_details.xml', ''),
(5, 3, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/ar-AA_details.xml', ''),
(6, 3, 0, 'Belarusian', '', 'pkg_be-BY', 'package', '', 0, '3.0.2.1', '', 'http://update.joomla.org/language/details3/be-BY_details.xml', ''),
(7, 3, 0, 'Bulgarian', '', 'pkg_bg-BG', 'package', '', 0, '3.0.3.1', '', 'http://update.joomla.org/language/details3/bg-BG_details.xml', ''),
(8, 3, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '3.1.4.1', '', 'http://update.joomla.org/language/details3/ca-ES_details.xml', ''),
(9, 3, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/zh-CN_details.xml', ''),
(10, 3, 0, 'Croatian', '', 'pkg_hr-HR', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/hr-HR_details.xml', ''),
(11, 3, 0, 'Czech', '', 'pkg_cs-CZ', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/cs-CZ_details.xml', ''),
(12, 3, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/da-DK_details.xml', ''),
(13, 3, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/nl-NL_details.xml', ''),
(14, 3, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '3.1.0.1', '', 'http://update.joomla.org/language/details3/en-AU_details.xml', ''),
(15, 3, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '3.1.0.1', '', 'http://update.joomla.org/language/details3/en-US_details.xml', ''),
(16, 3, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '3.1.2.1', '', 'http://update.joomla.org/language/details3/et-EE_details.xml', ''),
(17, 3, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/it-IT_details.xml', ''),
(18, 3, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/ja-JP_details.xml', ''),
(19, 3, 0, 'Korean', '', 'pkg_ko-KR', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/ko-KR_details.xml', ''),
(20, 3, 0, 'Kurdish Sorani', '', 'pkg_ckb-IQ', 'package', '', 0, '3.0.2.1', '', 'http://update.joomla.org/language/details3/ckb-IQ_details.xml', ''),
(21, 3, 0, 'Malay', '', 'pkg_ms-MY', 'package', '', 0, '3.1.5.4', '', 'http://update.joomla.org/language/details3/ms-MY_details.xml', ''),
(22, 3, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/lv-LV_details.xml', ''),
(23, 3, 0, 'Romanian', '', 'pkg_ro-RO', 'package', '', 0, '3.1.1.2', '', 'http://update.joomla.org/language/details3/ro-RO_details.xml', ''),
(24, 3, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '3.1.4.1', '', 'http://update.joomla.org/language/details3/mk-MK_details.xml', ''),
(25, 3, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/nl-BE_details.xml', ''),
(26, 3, 0, 'Norwegian Bokmal', '', 'pkg_nb-NO', 'package', '', 0, '3.1.1.1', '', 'http://update.joomla.org/language/details3/nb-NO_details.xml', ''),
(27, 3, 0, 'Chinese Traditional', '', 'pkg_zh-TW', 'package', '', 0, '3.1.4.1', '', 'http://update.joomla.org/language/details3/zh-TW_details.xml', ''),
(28, 3, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '3.1.4.1', '', 'http://update.joomla.org/language/details3/fa-IR_details.xml', ''),
(29, 3, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/fr-FR_details.xml', ''),
(30, 3, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '3.1.4.2', '', 'http://update.joomla.org/language/details3/pl-PL_details.xml', ''),
(31, 3, 0, 'Galician', '', 'pkg_gl-ES', 'package', '', 0, '3.0.2.2', '', 'http://update.joomla.org/language/details3/gl-ES_details.xml', ''),
(32, 3, 0, 'Portuguese', '', 'pkg_pt-PT', 'package', '', 0, '3.0.2.2', '', 'http://update.joomla.org/language/details3/pt-PT_details.xml', ''),
(33, 3, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/de-DE_details.xml', ''),
(34, 3, 0, 'Russian', '', 'pkg_ru-RU', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/ru-RU_details.xml', ''),
(35, 3, 0, 'Scottish Gaelic', '', 'pkg_gd-GB', 'package', '', 0, '3.1.0.1', '', 'http://update.joomla.org/language/details3/gd-GB_details.xml', ''),
(36, 3, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '3.1.5.3', '', 'http://update.joomla.org/language/details3/sk-SK_details.xml', ''),
(37, 3, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/sv-SE_details.xml', ''),
(38, 3, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '3.1.2.1', '', 'http://update.joomla.org/language/details3/sy-IQ_details.xml', ''),
(39, 3, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '3.1.2.1', '', 'http://update.joomla.org/language/details3/sy-IQ_details.xml', ''),
(40, 3, 0, 'Tamil', '', 'pkg_ta-IN', 'package', '', 0, '3.1.5.2', '', 'http://update.joomla.org/language/details3/ta-IN_details.xml', ''),
(41, 3, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '3.1.4.2', '', 'http://update.joomla.org/language/details3/th-TH_details.xml', ''),
(42, 3, 0, 'Turkish', '', 'pkg_tr-TR', 'package', '', 0, '3.1.4.1', '', 'http://update.joomla.org/language/details3/tr-TR_details.xml', ''),
(43, 3, 0, 'Ukrainian', '', 'pkg_uk-UA', 'package', '', 0, '3.1.4.4', '', 'http://update.joomla.org/language/details3/uk-UA_details.xml', ''),
(44, 3, 0, 'Uyghur', '', 'pkg_ug-CN', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/ug-CN_details.xml', ''),
(45, 3, 0, 'Albanian', '', 'pkg_sq-AL', 'package', '', 0, '3.1.1.1', '', 'http://update.joomla.org/language/details3/sq-AL_details.xml', ''),
(46, 3, 0, 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', 0, '3.0.3.1', '', 'http://update.joomla.org/language/details3/pt-BR_details.xml', ''),
(47, 3, 0, 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', 0, '3.0.3.1', '', 'http://update.joomla.org/language/details3/pt-BR_details.xml', ''),
(48, 3, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/sr-YU_details.xml', ''),
(49, 3, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/es-ES_details.xml', ''),
(50, 3, 0, 'Bosnian', '', 'pkg_bs-BA', 'package', '', 0, '3.1.1.1', '', 'http://update.joomla.org/language/details3/bs-BA_details.xml', ''),
(51, 3, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/sr-RS_details.xml', ''),
(52, 3, 0, 'Vietnamese', '', 'pkg_vi-VN', 'package', '', 0, '3.0.3.1', '', 'http://update.joomla.org/language/details3/vi-VN_details.xml', ''),
(53, 3, 0, 'Vietnamese', '', 'pkg_vi-VN', 'package', '', 0, '3.0.3.1', '', 'http://update.joomla.org/language/details3/vi-VN_details.xml', ''),
(54, 3, 0, 'Bahasa Indonesia', '', 'pkg_id-ID', 'package', '', 0, '3.1.4.1', '', 'http://update.joomla.org/language/details3/id-ID_details.xml', ''),
(55, 3, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '3.1.4.1', '', 'http://update.joomla.org/language/details3/fi-FI_details.xml', ''),
(56, 3, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '3.1.4.1', '', 'http://update.joomla.org/language/details3/fi-FI_details.xml', ''),
(57, 3, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/sw-KE_details.xml', ''),
(58, 3, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/sw-KE_details.xml', ''),
(59, 4, 0, 'JA Amazon S3 for joomla 16', '', 'com_com_jaamazons3', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/com_com_jaamazons3.xml', ''),
(60, 4, 0, 'JA Extenstion Manager Component j16', '', 'com_com_jaextmanager', 'file', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/com_com_jaextmanager.xml', ''),
(61, 4, 0, 'JA Extenstion Manager Component j16', '', 'com_com_jaextmanager', 'file', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/com_com_jaextmanager.xml', ''),
(62, 4, 0, 'JA Amazon S3 for joomla 2.5 & 3.1', '', 'com_jaamazons3', 'component', '', 1, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/com_jaamazons3.xml', ''),
(63, 4, 0, 'JA Comment Package for Joomla 2.5 & 3.0', '', 'com_jacomment', 'component', '', 1, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/com_jacomment.xml', ''),
(64, 4, 0, 'JA Extenstion Manager Component for J25 & J31', '', 'com_jaextmanager', 'component', '', 1, '2.5.7', '', 'http://update.joomlart.com/service/tracking/j16/com_jaextmanager.xml', ''),
(65, 4, 0, 'JA Google Storage Package for J2.5 & J3.0', '', 'com_jagooglestorage', 'component', '', 1, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/com_jagooglestorage.xml', ''),
(66, 4, 0, 'JA Job Board Package For J25', '', 'com_jajobboard', 'component', '', 1, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j16/com_jajobboard.xml', ''),
(67, 4, 0, 'JA K2 Filter Package for J25 & J31', '', 'com_jak2filter', 'component', '', 1, '1.0.9', '', 'http://update.joomlart.com/service/tracking/j16/com_jak2filter.xml', ''),
(68, 4, 0, 'JA K2 Filter Package for J25 & J30', '', 'com_jak2fiter', 'component', '', 1, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/com_jak2fiter.xml', ''),
(69, 4, 0, 'JA Showcase component for Joomla 1.7', '', 'com_jashowcase', 'component', '', 1, '1.1.0', '', 'http://update.joomlart.com/service/tracking/j16/com_jashowcase.xml', ''),
(70, 4, 0, 'JA Voice Package for Joomla 2.5 & 3.x', '', 'com_javoice', 'component', '', 1, '1.1.0', '', 'http://update.joomlart.com/service/tracking/j16/com_javoice.xml', ''),
(71, 4, 0, 'Theme Fixel for Easyblog J25 & J30', '', 'easyblog_theme_fixel', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/easyblog_theme_fixel.xml', ''),
(72, 4, 0, 'Theme Magz for Easyblog J25 & J30', '', 'easyblog_theme_magz', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/easyblog_theme_magz.xml', ''),
(73, 4, 0, 'JA Muzic Theme for EasyBlog', '', 'easyblog_theme_muzic', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/easyblog_theme_muzic.xml', ''),
(74, 4, 0, 'JA Anion template for Joomla 2.5', '', 'ja_anion', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_anion.xml', ''),
(75, 4, 0, 'JA Argo Template', '', 'ja_argo', 'template', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_argo.xml', ''),
(76, 4, 0, 'JA Argo Template', '', 'ja_argo', 'template', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_argo.xml', ''),
(77, 4, 0, 'JA Beranis Template', '', 'ja_beranis', 'template', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_beranis.xml', ''),
(78, 4, 0, 'JA Bistro Template for Joomla 2.5', '', 'ja_bistro', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_bistro.xml', ''),
(79, 4, 0, 'JA Blazes Template for J25 & J31', '', 'ja_blazes', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_blazes.xml', ''),
(80, 4, 0, 'JA Brisk Template', '', 'ja_brisk', 'template', '', 0, '1.0.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_brisk.xml', ''),
(81, 4, 0, 'JA Business Template for Joomla 2.5', '', 'ja_business', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_business.xml', ''),
(82, 4, 0, 'JA Cloris Template for Joomla 2.5.x', '', 'ja_cloris', 'template', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_cloris.xml', ''),
(83, 4, 0, 'JA Community PLus Template for Joomla 2.5', '', 'ja_community_plus', 'template', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_community_plus.xml', ''),
(84, 4, 0, 'JA Droid Template for Joomla 2.5', '', 'ja_droid', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_droid.xml', ''),
(85, 4, 0, 'JA Edenite Template for J25 & J30', '', 'ja_edenite', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_edenite.xml', ''),
(86, 4, 0, 'JA Elastica Template for Joomla 2.5', '', 'ja_elastica', 'template', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_elastica.xml', ''),
(87, 4, 0, 'JA Erio Template for Joomla 2.5 & 3.1', '', 'ja_erio', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_erio.xml', ''),
(88, 4, 0, 'Ja Events Template for Joomla 2.5', '', 'ja_events', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_events.xml', ''),
(89, 4, 0, 'JA Fubix Template for J25 & J30', '', 'ja_fubix', 'template', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_fubix.xml', ''),
(90, 4, 0, 'JA Graphite Template for Joomla 2.5', '', 'ja_graphite', 'template', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_graphite.xml', ''),
(91, 4, 0, 'JA Hawkstore Template', '', 'ja_hawkstore', 'template', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/ja_hawkstore.xml', ''),
(92, 4, 0, 'JA Ironis Template for Joomla 2.5 & 3.1', '', 'ja_ironis', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_ironis.xml', ''),
(93, 4, 0, 'JA Kranos Template for J25 & J30', '', 'ja_kranos', 'template', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_kranos.xml', ''),
(94, 4, 0, 'JA Lens Template for Joomla 2.5 & 3.1', '', 'ja_lens', 'template', '', 0, '1.0.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_lens.xml', ''),
(95, 4, 0, 'Ja Lime Template for Joomla 2.5 & J31', '', 'ja_lime', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_lime.xml', ''),
(96, 4, 0, 'JA Magz Template', '', 'ja_magz', 'template', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/ja_magz.xml', ''),
(97, 4, 0, 'JA Mendozite Template for J25 & J30', '', 'ja_mendozite', 'template', '', 0, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_mendozite.xml', ''),
(98, 4, 0, 'JA Mero Template', '', 'ja_mero', 'template', '', 0, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_mero.xml', ''),
(99, 4, 0, 'JA Mers Template for J25 & J30', '', 'ja_mers', 'template', '', 0, '1.0.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_mers.xml', ''),
(100, 4, 0, 'JA Methys Template for Joomla 2.5', '', 'ja_methys', 'template', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_methys.xml', ''),
(101, 4, 0, 'Ja Minisite Template for Joomla 2.5', '', 'ja_minisite', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_minisite.xml', ''),
(102, 4, 0, 'JA Mitius Template', '', 'ja_mitius', 'template', '', 0, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_mitius.xml', ''),
(103, 4, 0, 'JA Mitius Template', '', 'ja_mitius', 'template', '', 0, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_mitius.xml', ''),
(104, 4, 0, 'JA Mixmaz Template', '', 'ja_mixmaz', 'template', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/ja_mixmaz.xml', ''),
(105, 4, 0, 'JA Nex Template for J25 & J30', '', 'ja_nex', 'template', '', 0, '2.5.9', '', 'http://update.joomlart.com/service/tracking/j16/ja_nex.xml', ''),
(106, 4, 0, 'JA Nex T3 Template', '', 'ja_nex_t3', 'template', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/ja_nex_t3.xml', ''),
(107, 4, 0, 'JA Norite Template for J2.5 & J31', '', 'ja_norite', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_norite.xml', ''),
(108, 4, 0, 'JA Onepage Template', '', 'ja_onepage', 'template', '', 0, '1.0.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_onepage.xml', ''),
(109, 4, 0, 'JA ores template for Joomla 2.5 & 3.1', '', 'ja_ores', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_ores.xml', ''),
(110, 4, 0, 'JA Orisite Template  for J25 & J30', '', 'ja_orisite', 'template', '', 0, '1.1.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_orisite.xml', ''),
(111, 4, 0, 'JA Portfolio Real Estate template for Joomla 1.6.x', '', 'ja_portfolio', 'file', '', 0, '1.0.0 beta', '', 'http://update.joomlart.com/service/tracking/j16/ja_portfolio.xml', ''),
(112, 4, 0, 'JA Portfolio Template for Joomla 2.5', '', 'ja_portfolio_real_estate', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_portfolio_real_estate.xml', ''),
(113, 4, 0, 'JA Puresite Template for J25 & J31', '', 'ja_puresite', 'template', '', 0, '1.0.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_puresite.xml', ''),
(114, 4, 0, 'JA Purity II template for Joomla 2.5', '', 'ja_purity_ii', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_purity_ii.xml', ''),
(115, 4, 0, 'JA Purity II template for Joomla 2.5', '', 'ja_purity_ii', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_purity_ii.xml', ''),
(116, 4, 0, 'JA Pyro Template for Joomla 2.5', '', 'ja_pyro', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_pyro.xml', ''),
(117, 4, 0, 'JA Rasite Template for J2.5 & J31', '', 'ja_rasite', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_rasite.xml', ''),
(118, 4, 0, 'JA Rave Template for Joomla 2.5', '', 'ja_rave', 'template', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_rave.xml', ''),
(119, 4, 0, 'JA Smashboard Template', '', 'ja_smashboard', 'template', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_smashboard.xml', ''),
(120, 4, 0, 'JA Social Template for Joomla 2.5', '', 'ja_social', 'template', '', 0, '2.5.8', '', 'http://update.joomlart.com/service/tracking/j16/ja_social.xml', ''),
(121, 4, 0, 'JA Social T3 j25', '', 'ja_social_ii', 'template', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/ja_social_ii.xml', ''),
(122, 4, 0, 'JA System Pager Plugin for J25 & J30', '', 'ja_system_japager', 'plugin', 'ja_system_japager', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_system_japager.xml', ''),
(123, 4, 0, 'JA T3V2 Blank Template', '', 'ja_t3_blank', 'template', '', 0, '2.5.7', '', 'http://update.joomlart.com/service/tracking/j16/ja_t3_blank.xml', ''),
(124, 4, 0, 'JA T3 Blank template for joomla 1.6', '', 'ja_t3_blank_j16', 'template', '', 0, '1.0.0 Beta', '', 'http://update.joomlart.com/service/tracking/j16/ja_t3_blank_j16.xml', ''),
(125, 4, 0, 'JA Blank Template for T3v3', '', 'ja_t3v3_blank', 'template', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/ja_t3v3_blank.xml', ''),
(126, 4, 0, 'JA Teline III  Template for Joomla 1.6', '', 'ja_teline_iii', 'file', '', 0, '1.0.0 Beta', '', 'http://update.joomlart.com/service/tracking/j16/ja_teline_iii.xml', ''),
(127, 4, 0, 'JA Teline IV Template for Joomla 2.5', '', 'ja_teline_iv', 'template', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_teline_iv.xml', ''),
(128, 4, 0, 'JA Tiris Template for J25 & J30', '', 'ja_tiris', 'template', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_tiris.xml', ''),
(129, 4, 0, 'JA Travel Template for Joomla 2.5 & 3.0', '', 'ja_travel', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_travel.xml', ''),
(130, 4, 0, 'JA University Template for J25 & J31', '', 'ja_university', 'template', '', 0, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_university.xml', ''),
(131, 4, 0, 'JA Vintas Template for J25 & J31', '', 'ja_vintas', 'template', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_vintas.xml', ''),
(132, 4, 0, 'JA Wall Template for J25 & J30', '', 'ja_wall', 'template', '', 0, '1.0.9', '', 'http://update.joomlart.com/service/tracking/j16/ja_wall.xml', ''),
(133, 4, 0, 'JA ZiteTemplate', '', 'ja_zite', 'template', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_zite.xml', ''),
(134, 4, 0, 'JA Bookmark plugin for Joomla 1.6.x', '', 'jabookmark', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jabookmark.xml', ''),
(135, 4, 0, 'JA Comment plugin for Joomla 1.6.x', '', 'jacomment', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jacomment.xml', ''),
(136, 4, 0, 'JA Comment Off Plugin for Joomla 1.6', '', 'jacommentoff', 'file', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/jacommentoff.xml', ''),
(137, 4, 0, 'JA Comment On Plugin for Joomla 1.6', '', 'jacommenton', 'file', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/jacommenton.xml', ''),
(138, 4, 0, 'JA Content Extra Fields for Joomla 1.6', '', 'jacontentextrafields', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jacontentextrafields.xml', ''),
(139, 4, 0, 'JA Disqus Debate Echo plugin for Joomla 1.6.x', '', 'jadisqus_debate_echo', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jadisqus_debate_echo.xml', ''),
(140, 4, 0, 'JA System Google Map plugin for Joomla 1.6.x', '', 'jagooglemap', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jagooglemap.xml', ''),
(141, 4, 0, 'JA Google Translate plugin for Joomla 1.6.x', '', 'jagoogletranslate', 'plugin', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jagoogletranslate.xml', ''),
(142, 4, 0, 'JA Highslide plugin for Joomla 1.6.x', '', 'jahighslide', 'plugin', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jahighslide.xml', ''),
(143, 4, 0, 'JA K2 Search Plugin for Joomla 2.5', '', 'jak2_filter', 'plugin', '', 0, '1.0.0 Alph', '', 'http://update.joomlart.com/service/tracking/j16/jak2_filter.xml', ''),
(144, 4, 0, 'JA K2 Extra Fields Plugin for Joomla 2.5', '', 'jak2_indexing', 'plugin', '', 0, '1.0.0 Alph', '', 'http://update.joomlart.com/service/tracking/j16/jak2_indexing.xml', ''),
(145, 4, 0, 'JA Load module Plugin for Joomla 2.5', '', 'jaloadmodule', 'plugin', 'jaloadmodule', 0, '2.5.1', '', 'http://update.joomlart.com/service/tracking/j16/jaloadmodule.xml', ''),
(146, 4, 0, 'JA System Nrain plugin for Joomla 1.6.x', '', 'janrain', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/janrain.xml', ''),
(147, 4, 0, 'JA Popup plugin for Joomla 1.6', '', 'japopup', 'file', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/japopup.xml', ''),
(148, 4, 0, 'JA System Social plugin for Joomla 1.7', '', 'jasocial', 'file', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/jasocial.xml', ''),
(149, 4, 0, 'JA T3 System plugin for Joomla 1.6', '', 'jat3', 'plugin', '', 0, '1.0.0 Beta', '', 'http://update.joomlart.com/service/tracking/j16/jat3.xml', ''),
(150, 4, 0, 'JA Tabs plugin for Joomla 1.6.x', '', 'jatabs', 'plugin', 'jatabs', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/jatabs.xml', ''),
(151, 4, 0, 'JA Typo plugin For Joomla 1.6', '', 'jatypo', 'plugin', 'jatypo', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jatypo.xml', ''),
(152, 4, 0, 'Jomsocial Theme 3.x for JA Social', '', 'jomsocial_theme_social', 'custom', '', 0, '3.0.1', '', 'http://update.joomlart.com/service/tracking/j16/jomsocial_theme_social.xml', ''),
(153, 4, 0, 'JA Jomsocial theme for Joomla 2.5', '', 'jomsocial_theme_social_j16', 'file', '', 0, '2.5.1', '', 'http://update.joomlart.com/service/tracking/j16/jomsocial_theme_social_j16.xml', ''),
(154, 4, 0, 'JA Jomsocial theme for Joomla 2.5', '', 'jomsocial_theme_social_j16_26', 'custom', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/jomsocial_theme_social_j16_26.xml', ''),
(155, 4, 0, 'JShopping Template for Ja Orisite', '', 'jshopping_theme_orisite', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jshopping_theme_orisite.xml', ''),
(156, 4, 0, 'JA Tiris Jshopping theme for J25 & J30', '', 'jshopping_theme_tiris', 'custom', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/jshopping_theme_tiris.xml', ''),
(157, 4, 0, 'Theme for Jshopping j17', '', 'jshopping_theme_tiris_j17', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jshopping_theme_tiris_j17.xml', ''),
(158, 4, 0, 'JA Kranos kunena theme for Joomla 2.5', '', 'kunena_theme_kranos_j17', 'custom', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_kranos_j17.xml', ''),
(159, 4, 0, 'Kunena Template for JA Mendozite', '', 'kunena_theme_mendozite', 'custom', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_mendozite.xml', ''),
(160, 4, 0, 'JA Mitius Kunena Theme for Joomla 25 ', '', 'kunena_theme_mitius', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_mitius.xml', ''),
(161, 4, 0, 'Kunena theme for JA Nex J2.5', '', 'kunena_theme_nex_j17', 'custom', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_nex_j17.xml', ''),
(162, 4, 0, 'Kunena theme for JA Nex T3', '', 'kunena_theme_nex_t3', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_nex_t3.xml', ''),
(163, 4, 0, 'Kunena Template for Ja Orisite', '', 'kunena_theme_orisite', 'custom', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_orisite.xml', ''),
(164, 4, 0, 'Kunena theme for JA Social T3 2.5', '', 'kunena_theme_social', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_social.xml', ''),
(165, 4, 0, 'Kunena theme for Joomla 2.5', '', 'kunena_theme_social_j16', 'custom', '', 0, '2.5.1', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_social_j16.xml', ''),
(166, 4, 0, 'JA Tiris kunena theme for Joomla 2.5', '', 'kunena_theme_tiris_j16', 'custom', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_tiris_j16.xml', ''),
(167, 4, 0, 'JA Jobs Tags module for Joomla 2.5', '', 'mod_ja_jobs_tags', 'module', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_ja_jobs_tags.xml', ''),
(168, 4, 0, 'JA Accordion Module for J25 & J31', '', 'mod_jaaccordion', 'module', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaaccordion.xml', ''),
(169, 4, 0, 'JA Animation module for Joomla 2.5 & 3.0', '', 'mod_jaanimation', 'module', '', 0, '2.5.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaanimation.xml', ''),
(170, 4, 0, 'JA Bulletin Module for J25 & J31', '', 'mod_jabulletin', 'module', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/mod_jabulletin.xml', ''),
(171, 4, 0, 'JA Latest Comment Module for Joomla 2.5 & 3.0', '', 'mod_jaclatest_comments', 'module', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaclatest_comments.xml', ''),
(172, 4, 0, 'JA Content Popup Module for J25 & J31', '', 'mod_jacontentpopup', 'module', '', 0, '1.0.6', '', 'http://update.joomlart.com/service/tracking/j16/mod_jacontentpopup.xml', ''),
(173, 4, 0, 'JA Content Scroll module for Joomla 1.6', '', 'mod_jacontentscroll', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_jacontentscroll.xml', ''),
(174, 4, 0, 'JA Contenslider module for Joomla 1.6', '', 'mod_jacontentslide', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_jacontentslide.xml', ''),
(175, 4, 0, 'JA CountDown Module for J25 & J31', '', 'mod_jacountdown', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jacountdown.xml', ''),
(176, 4, 0, 'JA Facebook Activity Module for J25 & J30', '', 'mod_jafacebookactivity', 'module', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/mod_jafacebookactivity.xml', ''),
(177, 4, 0, 'JA Facebook Like Box Module for J25 & J30', '', 'mod_jafacebooklikebox', 'module', '', 0, '2.5.7', '', 'http://update.joomlart.com/service/tracking/j16/mod_jafacebooklikebox.xml', ''),
(178, 4, 0, 'JA Featured Employer module for Joomla 2.5', '', 'mod_jafeatured_employer', 'module', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_jafeatured_employer.xml', ''),
(179, 4, 0, 'JA Filter Jobs module for Joomla 2.5', '', 'mod_jafilter_jobs', 'module', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/mod_jafilter_jobs.xml', ''),
(180, 4, 0, 'JA flowlist module for Joomla 2.5 & 3.0', '', 'mod_jaflowlist', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaflowlist.xml', ''),
(181, 4, 0, 'JAEC Halloween Module for Joomla 2.5 & 3.0', '', 'mod_jahalloween', 'module', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_jahalloween.xml', ''),
(182, 4, 0, 'JA Image Hotspot Module for Joomla 2.5 & 3.1', '', 'mod_jaimagehotspot', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaimagehotspot.xml', ''),
(183, 4, 0, 'JA static module for Joomla 2.5', '', 'mod_jajb_statistic', 'module', '', 0, '1.0.0 stab', '', 'http://update.joomlart.com/service/tracking/j16/mod_jajb_statistic.xml', ''),
(184, 4, 0, 'JA Jobboard Menu module for Joomla 2.5', '', 'mod_jajobboard_menu', 'module', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/mod_jajobboard_menu.xml', ''),
(185, 4, 0, 'JA Jobs Counter module for Joomla 2.5', '', 'mod_jajobs_counter', 'module', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/mod_jajobs_counter.xml', ''),
(186, 4, 0, 'JA Jobs Map module for Joomla 2.5', '', 'mod_jajobs_map', 'module', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/mod_jajobs_map.xml', ''),
(187, 4, 0, 'JA K2 Fillter Module for Joomla 2.5', '', 'mod_jak2_filter', 'module', '', 0, '1.0.0 Alph', '', 'http://update.joomlart.com/service/tracking/j16/mod_jak2_filter.xml', ''),
(188, 4, 0, 'JA K2 Filter Module for J25 & J31', '', 'mod_jak2filter', 'module', '', 0, '1.0.9', '', 'http://update.joomlart.com/service/tracking/j16/mod_jak2filter.xml', ''),
(189, 4, 0, 'JA K2 Timeline', '', 'mod_jak2timeline', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jak2timeline.xml', ''),
(190, 4, 0, 'JA Latest Resumes module for Joomla 2.5', '', 'mod_jalatest_resumes', 'module', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_jalatest_resumes.xml', ''),
(191, 4, 0, 'JA List Employer module for Joomla 2.5', '', 'mod_jalist_employers', 'module', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_jalist_employers.xml', ''),
(192, 4, 0, 'JA List Jobs module for Joomla 2.5', '', 'mod_jalist_jobs', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jalist_jobs.xml', ''),
(193, 4, 0, 'JA List Resumes module for Joomla 2.5', '', 'mod_jalist_resumes', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jalist_resumes.xml', ''),
(194, 4, 0, 'JA Login module for J25 & J31', '', 'mod_jalogin', 'module', '', 0, '2.5.8', '', 'http://update.joomlart.com/service/tracking/j16/mod_jalogin.xml', ''),
(195, 4, 0, 'JA Masshead Module for J25 & J31', '', 'mod_jamasshead', 'module', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/mod_jamasshead.xml', ''),
(196, 4, 0, 'JA News Featured Module for J25 & J31', '', 'mod_janews_featured', 'module', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/mod_janews_featured.xml', ''),
(197, 4, 0, 'JA Newsflash module for Joomla 1.6.x', '', 'mod_janewsflash', 'module', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_janewsflash.xml', ''),
(198, 4, 0, 'JA Newsmoo module for Joomla 1.6.x', '', 'mod_janewsmoo', 'module', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_janewsmoo.xml', ''),
(199, 4, 0, 'JA News Pro Module for J25 & J31', '', 'mod_janewspro', 'module', '', 0, '2.5.7', '', 'http://update.joomlart.com/service/tracking/j16/mod_janewspro.xml', ''),
(200, 4, 0, 'JA Newsticker Module for J25 & J31', '', 'mod_janewsticker', 'module', '', 0, '2.5.7', '', 'http://update.joomlart.com/service/tracking/j16/mod_janewsticker.xml', ''),
(201, 4, 0, 'JA Quick Contact Module for J25 & J31', '', 'mod_jaquickcontact', 'module', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaquickcontact.xml', ''),
(202, 4, 0, 'JA Recent Viewed Jobs module for Joomla 2.5', '', 'mod_jarecent_viewed_jobs', 'module', '', 0, '1.0.0 stab', '', 'http://update.joomlart.com/service/tracking/j16/mod_jarecent_viewed_jobs.xml', ''),
(203, 4, 0, 'JA Slideshow Module for J25 & J31', '', 'mod_jaslideshow', 'module', '', 0, '2.6.4', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaslideshow.xml', ''),
(204, 4, 0, 'JA Slideshow Lite Module for J25 & J31', '', 'mod_jaslideshowlite', 'module', '', 0, '1.1.8', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaslideshowlite.xml', ''),
(205, 4, 0, 'JA Soccerway Module for J25 & J31', '', 'mod_jasoccerway', 'module', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_jasoccerway.xml', ''),
(206, 4, 0, 'JA Tab module for Joomla 2.5', '', 'mod_jatabs', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jatabs.xml', ''),
(207, 4, 0, 'JA Toppanel Module for Joomla 2.5', '', 'mod_jatoppanel', 'module', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/mod_jatoppanel.xml', ''),
(208, 4, 0, 'JA Twitter Module for J25 & J31', '', 'mod_jatwitter', 'module', '', 0, '2.5.8', '', 'http://update.joomlart.com/service/tracking/j16/mod_jatwitter.xml', ''),
(209, 4, 0, 'JA List of Voices Module for J2.5 & J3.x', '', 'mod_javlist_voices', 'module', '', 0, '1.1.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_javlist_voices.xml', ''),
(210, 4, 0, 'JA VMProducts Module', '', 'mod_javmproducts', 'module', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_javmproducts.xml', ''),
(211, 4, 0, 'JA Voice  Work Flow Module for J2.5 & J3.x', '', 'mod_javwork_flow', 'module', '', 0, '1.1.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_javwork_flow.xml', ''),
(212, 4, 0, 'JA Amazon S3 Button Plugin for joomla 2.5 & 3.1', '', 'jaamazons3', 'plugin', 'button', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/plg_button_jaamazons3.xml', ''),
(213, 4, 0, 'JA AVTracklist Button plugin for J2.5 & J3.1', '', 'jaavtracklist', 'plugin', 'button', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_button_jaavtracklist.xml', ''),
(214, 4, 0, 'JA Comment Off Plugin for Joomla 2.5 & 3.0', '', 'jacommentoff', 'plugin', 'button', 0, '2.5.2', '', 'http://update.joomlart.com/service/tracking/j16/plg_button_jacommentoff.xml', ''),
(215, 4, 0, 'JA Comment On Plugin for Joomla 2.5 & 3.0', '', 'jacommenton', 'plugin', 'button', 0, '2.5.1', '', 'http://update.joomlart.com/service/tracking/j16/plg_button_jacommenton.xml', ''),
(216, 4, 0, 'JA Amazon S3 System plugin for joomla 2.5 & 3.1', '', 'plg_jaamazons3', 'plugin', 'plg_jaamazons3', 0, '2.5.2', '', 'http://update.joomlart.com/service/tracking/j16/plg_jaamazons3.xml', ''),
(217, 4, 0, 'JA AVTracklist plugin for J2.5 & J3.1', '', 'plg_jaavtracklist', 'plugin', 'plg_jaavtracklist', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_jaavtracklist.xml', ''),
(218, 4, 0, 'JA Bookmark plugin for J2.5 & J3.1', '', 'plg_jabookmark', 'plugin', 'plg_jabookmark', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/plg_jabookmark.xml', ''),
(219, 4, 0, 'JA Comment Plugin for Joomla 2.5 & 3.0', '', 'plg_jacomment', 'plugin', 'plg_jacomment', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/plg_jacomment.xml', ''),
(220, 4, 0, 'JA Disqus Debate Echo plugin for J2.5 & J3.1', '', 'debate_echo', 'plugin', 'jadisqus', 0, '2.5.9', '', 'http://update.joomlart.com/service/tracking/j16/plg_jadisqus_debate_echo.xml', ''),
(221, 4, 0, 'JA Google Storage Plugin for j25 & j30', '', 'plg_jagooglestorage', 'plugin', 'plg_jagooglestorage', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_jagooglestorage.xml', ''),
(222, 4, 0, 'JA Translate plugin for Joomla 1.6.x', '', 'plg_jagoogletranslate', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_jagoogletranslate.xml', ''),
(223, 4, 0, 'JA Thumbnail Plugin for J25 & J30', '', 'plg_jathumbnail', 'plugin', 'plg_jathumbnail', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/plg_jathumbnail.xml', ''),
(224, 4, 0, 'JA Tooltips plugin for Joomla 1.6.x', '', 'plg_jatooltips', 'plugin', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_jatooltips.xml', ''),
(225, 4, 0, 'JA Typo Button Plugin for J25 & J31', '', 'plg_jatypobutton', 'plugin', 'plg_jatypobutton', 0, '2.5.8', '', 'http://update.joomlart.com/service/tracking/j16/plg_jatypobutton.xml', ''),
(226, 4, 0, 'JA K2 Filter Plg for J25 & J31', '', 'jak2filter', 'plugin', 'k2', 0, '1.0.9', '', 'http://update.joomlart.com/service/tracking/j16/plg_k2_jak2filter.xml', ''),
(227, 4, 0, 'JA K2 Timeline Plugin', '', 'jak2timeline', 'plugin', 'k2', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_k2_jak2timeline.xml', ''),
(228, 4, 0, 'Multi Capcha Engine Plugin for J25 & J30', '', 'captcha_engine', 'plugin', 'multiple', 0, '2.5.2', '', 'http://update.joomlart.com/service/tracking/j16/plg_multiple_captcha_engine.xml', ''),
(229, 4, 0, 'JA JobBoard Payment Plugin Authorize for Joomla 2.5', '', 'plg_payment_jajb_authorize_25', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_payment_jajb_authorize_25.xml', ''),
(230, 4, 0, 'JA JobBoard Payment Plugin MoneyBooker for Joomla 2.5', '', 'plg_payment_jajb_moneybooker_25', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_payment_jajb_moneybooker_25.xml', ''),
(231, 4, 0, 'JA JobBoard Payment Plugin Paypal for Joomla 2.5', '', 'plg_payment_jajb_paypal_25', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_payment_jajb_paypal_25.xml', ''),
(232, 4, 0, 'JA JobBoard Payment Plugin BankWire for Joomla 2.5', '', 'plg_payment_jajb_wirebank_25', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_payment_jajb_wirebank_25.xml', ''),
(233, 4, 0, 'JA Search Comment Plugin for Joomla J2.5 & 3.0', '', 'jacomment', 'plugin', 'search', 0, '2.5.2', '', 'http://update.joomlart.com/service/tracking/j16/plg_search_jacomment.xml', ''),
(234, 4, 0, 'JA Search Jobs plugin for Joomla 2.5', '', 'jajob', 'plugin', 'search', 0, '1.0.0 beta', '', 'http://update.joomlart.com/service/tracking/j16/plg_search_jajob.xml', ''),
(235, 4, 0, 'JA System Comment Plugin for Joomla 2.5 & 3.0', '', 'jacomment', 'plugin', 'system', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jacomment.xml', ''),
(236, 4, 0, 'JA Content Extra Fields for Joomla 2.5', '', 'jacontentextrafields', 'plugin', 'system', 0, '2.5.1', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jacontentextrafields.xml', ''),
(237, 4, 0, 'JA System Google Map plugin for J2.5 & J3.1', '', 'jagooglemap', 'plugin', 'system', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jagooglemap.xml', ''),
(238, 4, 0, 'JAEC PLG System Jobboad Jomsocial Synchonization', '', 'jajb_jomsocial', 'plugin', 'system', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jajb_jomsocial.xml', ''),
(239, 4, 0, 'JA System Lazyload Plugin for J25 & J31', '', 'jalazyload', 'plugin', 'system', 0, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jalazyload.xml', ''),
(240, 4, 0, 'JA System Nrain Plugin for Joomla 2.5 & 3.0', '', 'janrain', 'plugin', 'system', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_janrain.xml', ''),
(241, 4, 0, 'JA Popup Plugin for J25 & J31', '', 'japopup', 'plugin', 'system', 0, '2.6.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_japopup.xml', ''),
(242, 4, 0, 'JA System Social Plugin for Joomla 2.5 & 3.0', '', 'jasocial', 'plugin', 'system', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jasocial.xml', ''),
(243, 4, 0, 'JA System Social Feed Plugin for J25 & J31', '', 'jasocial_feed', 'plugin', 'system', 0, '1.1.1', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jasocial_feed.xml', ''),
(244, 4, 0, 'JA T3v2 System Plugin for J25 & J31', '', 'jat3', 'plugin', 'system', 0, '2.6.8', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jat3.xml', ''),
(245, 4, 0, 'JA T3v3 System Plugin', '', 'jat3v3', 'plugin', 'system', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jat3v3.xml', ''),
(246, 4, 0, 'JA Tabs Plugin for J25 & J30', '', 'jatabs', 'plugin', 'system', 0, '2.6.1', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jatabs.xml', ''),
(247, 4, 0, 'JA Typo Plugin for J25 & J31', '', 'jatypo', 'plugin', 'system', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/plg_system_jatypo.xml', ''),
(248, 4, 0, 'T3 Blank Template', '', 't3_blank', 'template', '', 0, '1.4.1', '', 'http://update.joomlart.com/service/tracking/j16/t3_blank.xml', ''),
(249, 4, 0, 'JA Teline III Template for Joomla 2.5', '', 'teline_iii', 'template', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/teline_iii.xml', ''),
(250, 4, 0, 'Thirdparty Extensions Compatibility Bundle', '', 'thirdparty_exts_compatibility', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/thirdparty_exts_compatibility.xml', ''),
(251, 5, 10025, 'JM Slideshow Responsive', 'JM Slideshow Responsive 1.3.7', 'mod_jmslideshow', 'module', '', 0, '1.3.7', '', 'http://extensions.joomlaman.com/jmslideshow/update.xml', ''),
(252, 5, 10025, 'JM Slideshow Responsive', 'JM Slideshow Responsive 1.3.7', 'mod_jmslideshow', 'module', '', 0, '1.3.7', '', 'http://extensions.joomlaman.com/jmslideshow/update.xml', '');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_update_sites`
--

CREATE TABLE IF NOT EXISTS `i8a13_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Update Sites' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `i8a13_update_sites`
--

INSERT INTO `i8a13_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`) VALUES
(1, 'Joomla Core', 'collection', 'http://update.joomla.org/core/list.xml', 1, 1382774912),
(2, 'Joomla Extension Directory', 'collection', 'http://update.joomla.org/jed/list.xml', 1, 1382774912),
(3, 'Accredited Joomla! Translations', 'collection', 'http://update.joomla.org/language/translationlist_3.xml', 1, 1382774912),
(4, '', 'collection', 'http://update.joomlart.com/service/tracking/list.xml', 1, 1382774912),
(5, 'JM Slideshow Responsive', 'extension', 'http://extensions.joomlaman.com/jmslideshow/update.xml', 1, 1382774910);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_update_sites_extensions`
--

CREATE TABLE IF NOT EXISTS `i8a13_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';

--
-- Dumping data for table `i8a13_update_sites_extensions`
--

INSERT INTO `i8a13_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 700),
(2, 700),
(3, 600),
(4, 10000),
(4, 10001),
(4, 10026),
(5, 10025);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_usergroups`
--

CREATE TABLE IF NOT EXISTS `i8a13_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `i8a13_usergroups`
--

INSERT INTO `i8a13_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 18, 'Public'),
(2, 1, 8, 15, 'Registered'),
(3, 2, 9, 14, 'Author'),
(4, 3, 10, 13, 'Editor'),
(5, 4, 11, 12, 'Publisher'),
(6, 1, 4, 7, 'Manager'),
(7, 6, 5, 6, 'Administrator'),
(8, 1, 16, 17, 'Super Users'),
(9, 1, 2, 3, 'Guest');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_users`
--

CREATE TABLE IF NOT EXISTS `i8a13_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=555 ;

--
-- Dumping data for table `i8a13_users`
--

INSERT INTO `i8a13_users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`) VALUES
(553, 'Super User', 'admin', 'trungqt2005@gmail.com', '5ecf74adf5e87c39f3ef7f80649c2877:stPxhQ60xMDAFo1LAlP9WB0NBLOt7GYP', 0, 1, '2013-10-23 05:38:05', '2013-10-26 09:40:52', '0', '', '0000-00-00 00:00:00', 0),
(554, 'trung', 'trungjc', 'trungnguyenthanh70@gmail.com', 'b7805056a8d99595646fc3ef549f2d0b:pVA7Uz6jAFPkEP5wrWLhVUUKvE3lWYVO', 0, 0, '2013-10-24 15:05:50', '2013-10-24 15:15:31', '', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_user_notes`
--

CREATE TABLE IF NOT EXISTS `i8a13_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_user_profiles`
--

CREATE TABLE IF NOT EXISTS `i8a13_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_user_usergroup_map`
--

CREATE TABLE IF NOT EXISTS `i8a13_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i8a13_user_usergroup_map`
--

INSERT INTO `i8a13_user_usergroup_map` (`user_id`, `group_id`) VALUES
(553, 8),
(554, 7),
(554, 8);

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_viewlevels`
--

CREATE TABLE IF NOT EXISTS `i8a13_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `i8a13_viewlevels`
--

INSERT INTO `i8a13_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 1, '[6,2,8]'),
(3, 'Special', 2, '[6,3,8]'),
(5, 'Guest', 0, '[9]');

-- --------------------------------------------------------

--
-- Table structure for table `i8a13_weblinks`
--

CREATE TABLE IF NOT EXISTS `i8a13_weblinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if link is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `images` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
