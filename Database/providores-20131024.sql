-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2013 at 07:13 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `i8a13_assets`
--

INSERT INTO `i8a13_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 1, 71, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.offline":{"6":1},"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(8, 1, 17, 22, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(9, 1, 23, 24, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 25, 26, 1, 'com_installer', 'com_installer', '{"core.admin":[],"core.manage":{"7":0},"core.delete":{"7":0},"core.edit.state":{"7":0}}'),
(11, 1, 27, 28, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(12, 1, 29, 30, 1, 'com_login', 'com_login', '{}'),
(13, 1, 31, 32, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 33, 34, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 35, 36, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
(16, 1, 37, 38, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(17, 1, 39, 40, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 41, 42, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 43, 46, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(20, 1, 47, 48, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 49, 50, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 51, 52, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 53, 54, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 55, 58, 1, 'com_users', 'com_users', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(25, 1, 59, 62, 1, 'com_weblinks', 'com_weblinks', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(26, 1, 63, 64, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 18, 21, 2, 'com_content.category.2', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(30, 19, 44, 45, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(31, 25, 60, 61, 2, 'com_weblinks.category.6', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(32, 24, 56, 57, 1, 'com_users.category.7', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(33, 1, 65, 66, 1, 'com_finder', 'com_finder', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(34, 1, 67, 68, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{"core.admin":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(35, 27, 19, 20, 3, 'com_content.article.1', 'Getting Started', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(36, 1, 69, 70, 1, 'com_tags', 'com_tags', '{"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `i8a13_categories`
--

INSERT INTO `i8a13_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
(1, 0, 0, 0, 13, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '', 553, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 553, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":"","foobar":""}', '', '', '{"page_title":"","author":"","robots":""}', 553, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 553, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 553, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(6, 31, 1, 9, 10, 1, 'uncategorised', 'com_weblinks', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 553, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(7, 32, 1, 11, 12, 1, 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 553, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `i8a13_content`
--

INSERT INTO `i8a13_content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(1, 35, 'Getting Started', 'getting-started', '<p>It''s easy to get started creating your website. Knowing some of the basics will help.</p>\r\n<h3>What is a Content Management System?</h3>\r\n<p>A content management system is software that allows you to create and manage webpages easily by separating the creation of your content from the mechanics required to present it on the web.</p>\r\n<p>In this site, the content is stored in a <em>database</em>. The look and feel are created by a <em>template</em>. The Joomla! software brings together the template and the content to create web pages.</p>\r\n<h3>Site and Administrator</h3>\r\n<p>Your site actually has two separate sites. The site (also called the front end) is what visitors to your site will see. The administrator (also called the back end) is only used by people managing your site. You can access the administrator by clicking the "Site Administrator" link on the "User Menu" menu (visible once you login) or by adding /administrator to the end of your domain name.</p>\r\n<p>Log in to the administrator using the username and password created during the installation of Joomla.</p>\r\n<h3>Logging in</h3>\r\n<p>To login to the front end of your site use the login form. Use the user name and password that were created as part of the installation process. Once logged-in you will be able to create and edit articles.</p>\r\n<p>In managing your site, you will be able to create content that only logged-in users are able to see.</p>\r\n<h3>Creating an article</h3>\r\n<p>Once you are logged-in, a new menu will be visible. To create a new article, click on the "Submit Article" link on that menu.</p>\r\n<p>The new article interface gives you a lot of options, but all you need to do is add a title and put something in the content area. To make it easy to find, set the state to published.</p>\r\n<div>You can edit an existing article by clicking on the edit icon (this only displays to users who have the right to edit).</div>\r\n<h3>Template and modules</h3>\r\n<p>The look and feel of your site is controlled by a template. You can change the site name, background colour, highlights colour and more by editing the template options. In the administrator go to the Template Styles and click on My Default Template (Protostar). Most changes will be made on the Options tab.</p>\r\n<p>The boxes around the main content of the site are called modules. You can change the image at the top of the page by editing the Image Module module in the Module Manager.</p>\r\n<h3>Learn more</h3>\r\n<p>There is much more to learn about how to use Joomla! to create the web site you envision. You can learn much more at the <a href="http://docs.joomla.org">Joomla! documentation site</a> and on the<a href="http://forum.joomla.org"> Joomla! forums</a>.</p>', '', 1, 2, '2011-01-01 10:01:00', 553, '', '2012-09-25 05:25:14', 401, 0, '0000-00-00 00:00:00', '2012-09-23 10:01:10', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"0","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 4, 0, '', '', 1, 84, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10003 ;

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
(10002, 'JA Content Slider', 'module', 'mod_jacontentslider', '', 0, 1, 0, 0, '{"name":"JA Content Slider","type":"module","creationDate":"15 July 2013","author":"JoomlArt.com","copyright":"Copyright (C), J.O.O.M Solutions Co., Ltd. All Rights Reserved.","authorEmail":"webmaster@joomlart.com","authorUrl":"www.joomlart.com","version":"2.6.5","description":"\\n\\t\\n\\t \\t<span style=\\"color: #008000;\\"><strong>JA Content Slider Module for Joomla! 2.5 and Joomla! 3.x<\\/strong><\\/span><br \\/>\\n\\t \\t<p><img alt=\\"JA Content Slider Module\\" src=\\"http:\\/\\/static.joomlart.com\\/images\\/stories\\/extensions\\/joomla\\/ja_contentslider.png\\" \\/><\\/p>\\n\\t\\t<div style=''font-weight:normal''>\\n\\t \\tSlide your articles from Joomla categories with cool effects, rich backend configs covering layout, animation control, auto thumbnail creation, images size, number of articles, sorting and much more\\n\\t \\t<p style=\\"clear:both\\"><span style=\\"color: #ff6600;\\"><strong>Important Instruction:<\\/strong><\\/span><\\/p>\\n\\t\\tCheck in configuration in your site if it does not have this line \\"var $absolute_path by ''your absolute path'';\\" you have to add its there to run.\\n\\t\\t<p style=\\"clear:both\\"><span style=\\"color: #ff6600;\\"><strong>Brief features:<\\/strong><\\/span><\\/p>\\n\\t \\t<ul>\\n\\t\\t\\t  <li>Slide your content with width and height properties.<\\/li>\\n\\t\\t\\t  <li>You can set the number of content to display in a tab.<\\/li>\\n\\t\\t\\t  <li>You can set categories contents to display.<\\/li>\\n\\t\\t\\t  <li>You can set display title, link title, introtext, readmore text links or not.<\\/li>\\n\\t\\t\\t  <li>You can set the slide to auto run or not. Default is YES.<\\/li>\\n\\t\\t\\t  <li>Set direction of slide. Default is left.<\\/li>\\n\\t\\t\\t  <li>Set time for rolling delay time and animation time.<\\/li>\\n\\t\\t<\\/ul>\\n\\t\\t<p><strong><span style=\\"color: #ff0000;\\">Upgrade Method:<\\/span><br \\/><\\/strong><\\/p>\\n\\t\\t<ol><li>You can install new version directly over this version. Uninstallation is not required. Backup any customized files before upgrading. OR<\\/li><li>Use <strong><a href=\\"http:\\/\\/extensions.joomla.org\\/extensions\\/core-enhancements\\/installers\\/12077\\" target=\\"_blank\\">JA Extensions Manager<\\/a><\\/strong> Component for easy upgrades and rollbacks. <strong><a href=\\"http:\\/\\/www.youtube.com\\/user\\/JoomlArt#p\\/c\\/BC9B0C0BFE98657E\\/2\\/mNAuJRmifG8\\" target=\\"_blank\\">Watch Video..<\\/a><\\/strong><\\/li><\\/ol>\\n\\t\\t<p><span style=\\"color: #008000;\\"><strong>Links:<\\/strong><\\/span><\\/p>\\n\\t\\t<ul><li><a target=\\"_blank\\" href=\\"http:\\/\\/www.joomlart.com\\/forums\\/showthread.php?51825\\">JA Content Slider Userguide<\\/a><\\/li><li><a target=\\"_blank\\" href=\\"http:\\/\\/pm.joomlart.com\\/browse\\/JAECMODJACSLIDERJVI\\">Report Bug<\\/a><\\/li><li><a target=\\"_blank\\" href=\\"http:\\/\\/update.joomlart.com\\/\\">Updates &amp; Versions<\\/a><\\/li><\\/ul>\\n\\t\\t<p>Copyright 2004 - 2013 <a href=\\"http:\\/\\/www.joomlart.com\\/\\" title=\\"Visit Joomlart.com!\\">JoomlArt.com<\\/a>.<\\/p>\\n\\t\\t<\\/div>\\n\\t \\n\\t","group":""}', '{"source":"content","folder_images":"","catid":"","k2catsid":"","text_heading":"","showTab":"1","sort_order_field":"created","sort_order":"DESC","numElem":"3","maxitems":"10","showtitle":"1","link_titles":"1","showimages":"1","iwidth":"130","iheight":"90","showreadmore":"0","showintrotext":"1","numchar":"50","xwidth":"140","xheight":"170","auto":"0","mode":"horizontal","direction":"left","delaytime":"5000","animationtime":"1000","showbutton":"1","scroll_when":"click","source-articles-images-thumbnail_mode":"crop","source-articles-images-thumbnail_mode-resize-use_ratio":"0","cache":"1","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=472 ;

--
-- Dumping data for table `i8a13_menu`
--

INSERT INTO `i8a13_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 235, 0, '*', 0),
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
(467, 'mainmenu', 'Shop', 'shop', '', 'shop', 'index.php?option=com_content&view=article&id=1', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_tags":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 225, 226, 0, '*', 0),
(468, 'mainmenu', 'Cooking School', 'cooking-school', '', 'cooking-school', 'index.php?option=com_content&view=category&layout=blog&id=2', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","page_subheading":"","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 227, 228, 0, '*', 0),
(469, 'mainmenu', 'Alliances', 'alliances', '', 'alliances', 'index.php?option=com_content&view=article&id=1', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_tags":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 229, 230, 0, '*', 0),
(470, 'mainmenu', 'Corporate', 'corporate', '', 'corporate', 'index.php?option=com_content&view=category&id=2', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_category_heading_title":"","show_subcat_desc":"","show_cat_num_articles":"","page_subheading":"","show_pagination_limit":"","filter_field":"","show_headings":"","list_show_date":"","date_format":"","list_show_hits":"","list_show_author":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","display_num":"10","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 231, 232, 0, '*', 0),
(471, 'mainmenu', 'Contact', 'contact', '', 'contact', 'index.php?option=com_contact&view=categories&id=4', 'component', 1, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_base_description":"","categories_description":"","maxLevelcat":"","show_empty_categories_cat":"","show_subcat_desc_cat":"","show_cat_items_cat":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_subcat_desc":"","show_cat_items":"","filter_field":"","show_pagination_limit":"","show_headings":"","show_position_headings":"","show_email_headings":"","show_telephone_headings":"","show_mobile_headings":"","show_fax_headings":"","show_suburb_headings":"","show_state_headings":"","show_country_headings":"","show_pagination":"","show_pagination_results":"","presentation_style":"","show_contact_category":"","show_contact_list":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_links":"","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":"","show_feed_link":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 233, 234, 0, '*', 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `i8a13_menu_types`
--

INSERT INTO `i8a13_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site'),
(2, 'usermenu', 'User Menu', 'A Menu for logged-in Users');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

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
(87, 'JA Content Slider', '', '', 1, 'home-1', 553, '2013-10-23 17:11:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_jacontentslider', 1, 1, '{"source":"folder","folder_images":"images\\/slides","catid":[""],"text_heading":"","showTab":"1","sort_order_field":"created","sort_order":"DESC","numElem":3,"maxitems":10,"showtitle":"1","link_titles":"1","showimages":"1","iwidth":950,"iheight":420,"showreadmore":"0","showintrotext":"1","numchar":50,"xwidth":980,"xheight":455,"auto":"1","mode":"horizontal","direction":"left","delaytime":5000,"animationtime":1000,"showbutton":"1","scroll_when":"click","source-articles-images-thumbnail_mode":"crop","source-articles-images-thumbnail_mode-resize-use_ratio":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*');

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
(87, 450);

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
('5vbetivpv9q7p5somq9d10a4n6', 0, 1, '1382548268', '__default|a:8:{s:15:"session.counter";i:15;s:19:"session.timer.start";i:1382547787;s:18:"session.timer.last";i:1382548230;s:17:"session.timer.now";i:1382548266;s:22:"session.client.browser";s:72:"Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Firefox/24.0";s:8:"registry";O:9:"JRegistry":1:{s:7:"\\0\\0\\0data";O:8:"stdClass":4:{s:10:"vars_theme";N;s:9:"DIRECTION";s:3:"ltr";s:18:"vars_last_modified";s:10:"1382509132";s:12:"vars_content";s:52770:"//\n// Variables\n// --------------------------------------------------\n\n\n// Global values\n// --------------------------------------------------\n\n\n// Grays\n// -------------------------\n@black:                 #000;\n@grayDarker:            #222;\n@grayDark:              #333;\n@gray:                  #555;\n@grayLight:             #999;\n@grayLighter:           #eee;\n@white:                 #fff;\n\n\n// Accent colors\n// -------------------------\n@blue:                  #049cdb;\n@blueDark:              #0064cd;\n@green:                 #46a546;\n@red:                   #9d261d;\n@yellow:                #ffc40d;\n@orange:                #f89406;\n@pink:                  #c3325f;\n@purple:                #7a43b6;\n\n\n// Scaffolding\n// -------------------------\n@bodyBackground:        @white;\n@textColor:             @grayDark;\n\n\n// Links\n// -------------------------\n@linkColor:             #08c;\n@linkColorHover:        darken(@linkColor, 15%);\n\n\n// Typography\n// -------------------------\n@sansFontFamily:        "Helvetica Neue", Helvetica, Arial, sans-serif;\n@serifFontFamily:       Georgia, "Times New Roman", Times, serif;\n@monoFontFamily:        Monaco, Menlo, Consolas, "Courier New", monospace;\n\n@baseFontSize:          14px;\n@baseFontFamily:        @sansFontFamily;\n@baseLineHeight:        20px;\n@altFontFamily:         @serifFontFamily;\n\n@headingsFontFamily:    inherit; // empty to use BS default, @baseFontFamily\n@headingsFontWeight:    bold;    // instead of browser default, bold\n@headingsColor:         inherit; // empty to use BS default, @textColor\n\n\n// Component sizing\n// -------------------------\n// Based on 14px font-size and 20px line-height\n\n@fontSizeLarge:         @baseFontSize * 1.25; // ~18px\n@fontSizeSmall:         @baseFontSize * 0.85; // ~12px\n@fontSizeMini:          @baseFontSize * 0.75; // ~11px\n\n@paddingLarge:          11px 19px; // 44px\n@paddingSmall:          2px 10px;  // 26px\n@paddingMini:           0 6px;   // 22px\n\n@baseBorderRadius:      4px;\n@borderRadiusLarge:     6px;\n@borderRadiusSmall:     3px;\n\n\n// Tables\n// -------------------------\n@tableBackground:                   transparent; // overall background-color\n@tableBackgroundAccent:             #f9f9f9; // for striping\n@tableBackgroundHover:              #f5f5f5; // for hover\n@tableBorder:                       #ddd; // table and cell border\n\n// Buttons\n// -------------------------\n@btnBackground:                     @white;\n@btnBackgroundHighlight:            darken(@white, 10%);\n@btnBorder:                         #ccc;\n\n@btnPrimaryBackground:              @linkColor;\n@btnPrimaryBackgroundHighlight:     spin(@btnPrimaryBackground, 20%);\n\n@btnInfoBackground:                 #5bc0de;\n@btnInfoBackgroundHighlight:        #2f96b4;\n\n@btnSuccessBackground:              #62c462;\n@btnSuccessBackgroundHighlight:     #51a351;\n\n@btnWarningBackground:              lighten(@orange, 15%);\n@btnWarningBackgroundHighlight:     @orange;\n\n@btnDangerBackground:               #ee5f5b;\n@btnDangerBackgroundHighlight:      #bd362f;\n\n@btnInverseBackground:              #444;\n@btnInverseBackgroundHighlight:     @grayDarker;\n\n\n// Forms\n// -------------------------\n@inputBackground:               @white;\n@inputBorder:                   #ccc;\n@inputBorderRadius:             @baseBorderRadius;\n@inputDisabledBackground:       @grayLighter;\n@formActionsBackground:         #f5f5f5;\n@inputHeight:                   @baseLineHeight + 10px; // base line-height + 8px vertical padding + 2px top/bottom border\n\n\n// Dropdowns\n// -------------------------\n@dropdownBackground:            @white;\n@dropdownBorder:                rgba(0,0,0,.2);\n@dropdownDividerTop:            #e5e5e5;\n@dropdownDividerBottom:         @white;\n\n@dropdownLinkColor:             @grayDark;\n@dropdownLinkColorHover:        @white;\n@dropdownLinkColorActive:       @white;\n\n@dropdownLinkBackgroundActive:  @linkColor;\n@dropdownLinkBackgroundHover:   @dropdownLinkBackgroundActive;\n\n\n\n// COMPONENT VARIABLES\n// --------------------------------------------------\n\n\n// Z-index master list\n// -------------------------\n// Used for a bird''s eye view of components dependent on the z-axis\n// Try to avoid customizing these :)\n@zindexDropdown:          1000;\n@zindexPopover:           1010;\n@zindexTooltip:           1030;\n@zindexFixedNavbar:       1030;\n@zindexModalBackdrop:     1040;\n@zindexModal:             1050;\n\n\n// Sprite icons path\n// -------------------------\n@iconSpritePath:          "../img/glyphicons-halflings.png";\n@iconWhiteSpritePath:     "../img/glyphicons-halflings-white.png";\n\n\n// Input placeholder text color\n// -------------------------\n@placeholderText:         @grayLight;\n\n\n// Hr border color\n// -------------------------\n@hrBorder:                @grayLighter;\n\n\n// Horizontal forms & lists\n// -------------------------\n@horizontalComponentOffset:       180px;\n\n\n// Wells\n// -------------------------\n@wellBackground:                  #f5f5f5;\n\n\n// Navbar\n// -------------------------\n@navbarCollapseWidth:             979px;\n@navbarCollapseDesktopWidth:      @navbarCollapseWidth + 1;\n\n@navbarHeight:                    40px;\n@navbarBackgroundHighlight:       #ffffff;\n@navbarBackground:                darken(@navbarBackgroundHighlight, 5%);\n@navbarBorder:                    darken(@navbarBackground, 12%);\n\n@navbarText:                      #777;\n@navbarLinkColor:                 #777;\n@navbarLinkColorHover:            @grayDark;\n@navbarLinkColorActive:           @gray;\n@navbarLinkBackgroundHover:       transparent;\n@navbarLinkBackgroundActive:      darken(@navbarBackground, 5%);\n\n@navbarBrandColor:                @navbarLinkColor;\n\n// Inverted navbar\n@navbarInverseBackground:                #111111;\n@navbarInverseBackgroundHighlight:       #222222;\n@navbarInverseBorder:                    #252525;\n\n@navbarInverseText:                      @grayLight;\n@navbarInverseLinkColor:                 @grayLight;\n@navbarInverseLinkColorHover:            @white;\n@navbarInverseLinkColorActive:           @navbarInverseLinkColorHover;\n@navbarInverseLinkBackgroundHover:       transparent;\n@navbarInverseLinkBackgroundActive:      @navbarInverseBackground;\n\n@navbarInverseSearchBackground:          lighten(@navbarInverseBackground, 25%);\n@navbarInverseSearchBackgroundFocus:     @white;\n@navbarInverseSearchBorder:              @navbarInverseBackground;\n@navbarInverseSearchPlaceholderColor:    #ccc;\n\n@navbarInverseBrandColor:                @navbarInverseLinkColor;\n\n\n// Pagination\n// -------------------------\n@paginationBackground:                #fff;\n@paginationBorder:                    #ddd;\n@paginationActiveBackground:          #f5f5f5;\n\n\n// Hero unit\n// -------------------------\n@heroUnitBackground:              @grayLighter;\n@heroUnitHeadingColor:            inherit;\n@heroUnitLeadColor:               inherit;\n\n\n// Form states and alerts\n// -------------------------\n@warningText:             #c09853;\n@warningBackground:       #fcf8e3;\n@warningBorder:           darken(spin(@warningBackground, -10), 3%);\n\n@errorText:               #b94a48;\n@errorBackground:         #f2dede;\n@errorBorder:             darken(spin(@errorBackground, -10), 3%);\n\n@successText:             #468847;\n@successBackground:       #dff0d8;\n@successBorder:           darken(spin(@successBackground, -10), 5%);\n\n@infoText:                #3a87ad;\n@infoBackground:          #d9edf7;\n@infoBorder:              darken(spin(@infoBackground, -10), 7%);\n\n\n// Tooltips and popovers\n// -------------------------\n@tooltipColor:            #fff;\n@tooltipBackground:       #000;\n@tooltipArrowWidth:       5px;\n@tooltipArrowColor:       @tooltipBackground;\n\n@popoverBackground:       #fff;\n@popoverArrowWidth:       10px;\n@popoverArrowColor:       #fff;\n@popoverTitleBackground:  darken(@popoverBackground, 3%);\n\n// Special enhancement for popovers\n@popoverArrowOuterWidth:  @popoverArrowWidth + 1;\n@popoverArrowOuterColor:  rgba(0,0,0,.25);\n\n\n\n// GRID\n// --------------------------------------------------\n\n\n// Default 940px grid\n// -------------------------\n@gridColumns:             12;\n@gridColumnWidth:         60px;\n@gridGutterWidth:         20px;\n@gridRowWidth:            (@gridColumns * @gridColumnWidth) + (@gridGutterWidth * (@gridColumns - 1));\n\n// 1200px min\n@gridColumnWidth1200:     70px;\n@gridGutterWidth1200:     30px;\n@gridRowWidth1200:        (@gridColumns * @gridColumnWidth1200) + (@gridGutterWidth1200 * (@gridColumns - 1));\n\n// 768px-979px\n@gridColumnWidth768:      42px;\n@gridGutterWidth768:      20px;\n@gridRowWidth768:         (@gridColumns * @gridColumnWidth768) + (@gridGutterWidth768 * (@gridColumns - 1));\n\n\n// Fluid grid\n// -------------------------\n@fluidGridColumnWidth:    percentage(@gridColumnWidth/@gridRowWidth);\n@fluidGridGutterWidth:    percentage(@gridGutterWidth/@gridRowWidth);\n\n// 1200px min\n@fluidGridColumnWidth1200:     percentage(@gridColumnWidth1200/@gridRowWidth1200);\n@fluidGridGutterWidth1200:     percentage(@gridGutterWidth1200/@gridRowWidth1200);\n\n// 768px-979px\n@fluidGridColumnWidth768:      percentage(@gridColumnWidth768/@gridRowWidth768);\n@fluidGridGutterWidth768:      percentage(@gridGutterWidth768/@gridRowWidth768);\n/** \n *------------------------------------------------------------------------------\n * @package       T3 Framework for Joomla!\n *------------------------------------------------------------------------------\n * @copyright     Copyright (C) 2004-2013 JoomlArt.com. All Rights Reserved.\n * @license       GNU General Public License version 2 or later; see LICENSE.txt\n * @authors       JoomlArt, JoomlaBamboo, (contribute to this project at github \n *                & Google group to become co-author)\n * @Google group: https://groups.google.com/forum/#!forum/t3fw\n * @Link:         https://github.com/t3framework/ \n *------------------------------------------------------------------------------\n*/\n\n//\n// USE TO OVERRIDE BOOTSTRAP VARIABLES \n// AND DEFINE THOSE NEWS VARIABLE WHICH WILL BE USED IN T3 CORE\n// ---------------------------------------------------------\n\n\n\n// OVERRIDE BOOTSTRAP VARIABLES\n// --------------------------------------------------\n\n// Define Navbar Collapse Width\n@navbarCollapseWidth:   767px;\n@navbarCollapseDesktopWidth:  @navbarCollapseWidth + 1;\n\n\n// T3 GLOBAL STYLES\n// --------------------------------------------------\n\n// Module Styles\n// -------------------------\n// Module General\n@T3moduleBackground:            transparent;\n@T3moduleColor:                 inherit;\n@T3modulePadding:               0;\n@T3moduleBorder:                1px solid #ddd;\n\n// Module Title\n@T3moduleTitleBackground:       inherit; // inherit from @moduleBackground\n@T3moduleTitleColor:            @headingsColor; // inherit from @moduleColor\n@T3moduleTitlePadding:          0;\n\n// Module Content\n@T3moduleContentBackground:     inherit; // inherit from @moduleBackground\n@T3moduleContentColor:          inherit; // inherit from @moduleColor\n@T3moduleContentPadding:        0;\n\n\n// Global Margin& Padding\n// -------------------------\n@T3globalMargin:            @baseLineHeight;\n@T3globalPadding:           @baseLineHeight;\n\n\n// Typography\n// -------------------------\n@T3bigFontSize:         @baseFontSize + 1px;\n@T3biggerFontSize:      @baseFontSize + 2px;\n\n@T3smallFontSize:       @baseFontSize - 1px;\n@T3smallerFontSize:     @baseFontSize - 2px;\n\n\n// Off-Canvas menu width \n// -------------------------\n@T3OffCanvasWidth: 			250px;/** \r\n *------------------------------------------------------------------------------\r\n * @package       T3 Framework for Joomla!\r\n *------------------------------------------------------------------------------\r\n * @copyright     Copyright (C) 2004-2013 JoomlArt.com. All Rights Reserved.\r\n * @license       GNU General Public License version 2 or later; see LICENSE.txt\r\n * @authors       JoomlArt, JoomlaBamboo, (contribute to this project at github \r\n *                & Google group to become co-author)\r\n * @Google group: https://groups.google.com/forum/#!forum/t3fw\r\n * @Link:         http://t3-framework.org \r\n *------------------------------------------------------------------------------\r\n */\r\n\r\n//\r\n// Variables\r\n// --------------------------------------------------\r\n\r\n\r\n// Global values\r\n// --------------------------------------------------\r\n@T3ImagePath:           "../images";\r\n\r\n// Grays\r\n// -------------------------\r\n@black:                 #000;\r\n@grayDarker:            #222;\r\n@grayDark:              #444;\r\n@gray:                  #666;\r\n@grayLight:             #999;\r\n@grayLighter:           #eee;\r\n@white:                 #fff;\r\n\r\n\r\n// Accent colors\r\n// -------------------------\r\n@blue:                  #07b;\r\n@blueDark:              darken(@blue, 15%);\r\n@green:                 #690;\r\n@cyan:                  #09c; // T3 added\r\n@red:                   #c00;\r\n@yellow:                #fc0;\r\n@orange:                #f80;\r\n@pink:                  #d60a6c;\r\n@purple:                #8b08ae;\r\n\r\n\r\n// T3 Main colors\r\n// -------------------------\r\n@T3primaryColor:        @blue;\r\n@T3secondaryColor:      @green;\r\n\r\n\r\n\r\n// Scaffolding\r\n// -------------------------\r\n@bodyBackground:        @white;\r\n@textColor:             @gray;\r\n\r\n\r\n// Links\r\n// -------------------------\r\n@linkColor:             @T3primaryColor;\r\n@linkColorHover:        darken(@linkColor, 15%);\r\n\r\n\r\n// Typography\r\n// -------------------------\r\n@sansFontFamily:        sans-serif;\r\n@serifFontFamily:       serif;\r\n@monoFontFamily:        monospace;\r\n\r\n@baseFontSize:          14px;\r\n@baseFontFamily:        @sansFontFamily;\r\n@baseLineHeight:        20px;\r\n@altFontFamily:         @serifFontFamily;\r\n\r\n@headingsFontFamily:    @sansFontFamily; // empty to use BS default, @baseFontFamily\r\n@headingsFontWeight:    bold;    // instead of browser default, bold\r\n@headingsColor:         @grayDark; // empty to use BS default, @textColor\r\n\r\n\r\n@T3bigFontSize:         @baseFontSize + 1px;\r\n@T3biggerFontSize:      @baseFontSize + 2px;\r\n\r\n@T3smallFontSize:       @baseFontSize - 1px;\r\n@T3smallerFontSize:     @baseFontSize - 2px;\r\n\r\n\r\n// Component sizing\r\n// -------------------------\r\n// Based on 14px font-size and 20px line-height\r\n\r\n@fontSizeLarge:         @baseFontSize * 1.25; // ~18px\r\n@fontSizeSmall:         @baseFontSize * 0.85; // ~12px\r\n@fontSizeMini:          @baseFontSize * 0.75; // ~11px\r\n\r\n@paddingLarge:          11px 19px; // 44px\r\n@paddingSmall:          2px 10px;  // 26px\r\n@paddingMini:           1px 6px;   // 24px\r\n\r\n@baseBorderRadius:      4px;\r\n@borderRadiusLarge:     6px;\r\n@borderRadiusSmall:     3px;\r\n@LargeBorderRadius:		  @borderRadiusLarge;\r\n\r\n// Tables\r\n// -------------------------\r\n@tableBackground:                   transparent; // overall background-color\r\n@tableBackgroundAccent:             #f9f9f9; // for striping\r\n@tableBackgroundHover:              #f5f5f5; // for hover\r\n@tableBorder:                       #ddd; // table and cell border\r\n\r\n\r\n// Buttons\r\n// -------------------------\r\n@btnBackground:                     @grayLighter;\r\n@btnBackgroundHighlight:            lighten(@grayLighter, 10%);\r\n@btnBorder:                         darken(@grayLighter, 10%);\r\n\r\n@btnPrimaryBackground:              @linkColor;\r\n@btnPrimaryBackgroundHighlight:     lighten(@linkColor, 10%);\r\n\r\n@btnInfoBackground:                 @cyan;\r\n@btnInfoBackgroundHighlight:        lighten(@cyan, 10%);\r\n\r\n@btnSuccessBackground:              @green;\r\n@btnSuccessBackgroundHighlight:     lighten(@green, 10%);\r\n\r\n@btnWarningBackground:              @orange;\r\n@btnWarningBackgroundHighlight:     lighten(@orange, 10%);\r\n\r\n@btnDangerBackground:               @red;\r\n@btnDangerBackgroundHighlight:      lighten(@red, 10%);\r\n\r\n@btnInverseBackground:              @grayDark;\r\n@btnInverseBackgroundHighlight:     lighten(@grayDark, 10%);\r\n\r\n\r\n// Forms\r\n// -------------------------\r\n@inputBackground:         @white;\r\n@inputBorder:             #ccc;\r\n@inputBorderRadius:       @baseBorderRadius;\r\n@inputDisabledBackground: @grayLighter;\r\n@formActionsBackground:   #f5f5f5;\r\n\r\n\r\n\r\n// COMPONENT VARIABLES\r\n// --------------------------------------------------\r\n\r\n// Z-index master list\r\n// -------------------------\r\n// Used for a bird''s eye view of components dependent on the z-axis\r\n// Try to avoid customizing these :)\r\n@zindexDropdown:          1000;\r\n@zindexPopover:           1010;\r\n@zindexTooltip:           1030;\r\n@zindexFixedNavbar:       1030;\r\n@zindexModalBackdrop:     1040;\r\n@zindexModal:             1050;\r\n\r\n\r\n// Sprite icons path\r\n// -------------------------\r\n@iconSpritePath:          "../images/glyphicons-halflings.png";\r\n@iconWhiteSpritePath:     "../images/glyphicons-halflings-white.png";\r\n\r\n\r\n// Input placeholder text color\r\n// -------------------------\r\n@placeholderText:         @grayLight;\r\n\r\n\r\n// Hr border color\r\n// -------------------------\r\n@hrBorder:                @grayLighter;\r\n\r\n\r\n// Wells\r\n// -------------------------\r\n@wellBackground:          #f5f5f5;\r\n\r\n\r\n// Navbar\r\n// -------------------------\r\n@navbarCollapseWidth:             767px;\r\n\r\n@navbarHeight:                    40px;\r\n@navbarBackground:                darken(@navbarBackgroundHighlight, 10%);\r\n@navbarBackgroundHighlight:       #ffffff;\r\n@navbarBorder:                    darken(@navbarBackground, 12%);\r\n\r\n@navbarText:                      @gray;\r\n@navbarLinkColor:                 @gray;\r\n@navbarLinkColorHover:            @grayLighter;\r\n@navbarLinkColorActive:           @grayLighter;\r\n@navbarLinkBackgroundHover:       @gray;\r\n@navbarLinkBackgroundActive:      @linkColor;\r\n\r\n@navbarBrandColor:                @navbarLinkColor;\r\n\r\n// Inverted navbar\r\n@navbarInverseBackground:                #111111;\r\n@navbarInverseBackgroundHighlight:       #222222;\r\n@navbarInverseBorder:                    #252525;\r\n\r\n@navbarInverseText:                      @grayLight;\r\n@navbarInverseLinkColor:                 @grayLight;\r\n@navbarInverseLinkColorHover:            @white;\r\n@navbarInverseLinkColorActive:           @navbarInverseLinkColorHover;\r\n@navbarInverseLinkBackgroundHover:       transparent;\r\n@navbarInverseLinkBackgroundActive:      @navbarInverseBackground;\r\n\r\n@navbarInverseSearchBackground:          lighten(@navbarInverseBackground, 25%);\r\n@navbarInverseSearchBackgroundFocus:     @white;\r\n@navbarInverseSearchBorder:              @navbarInverseBackground;\r\n@navbarInverseSearchPlaceholderColor:    #ccc;\r\n\r\n@navbarInverseBrandColor:                @navbarInverseLinkColor;\r\n\r\n\r\n// Dropdowns\r\n// -------------------------\r\n// (T3 Note: Move "dropdowns" variables belows "navbar")\r\n@dropdownBackground:            @white;\r\n@dropdownBorder:                rgba(0,0,0,.2);\r\n@dropdownDividerTop:            #e5e5e5;\r\n@dropdownDividerBottom:         @white;\r\n\r\n@dropdownLinkColor:             @grayDark;\r\n\r\n@dropdownLinkColorHover:        @navbarLinkColorHover;\r\n@dropdownLinkBackgroundHover:   @navbarLinkBackgroundHover;\r\n\r\n@dropdownLinkColorActive:       @navbarLinkColorActive;\r\n@dropdownLinkBackgroundActive:  @navbarLinkBackgroundActive;\r\n\r\n\r\n// Pagination\r\n// -------------------------\r\n@paginationBackground:          #fff;\r\n@paginationBorder:              #ddd;\r\n@paginationActiveBackground:    #f5f5f5;\r\n\r\n\r\n// Hero unit\r\n// -------------------------\r\n@heroUnitBackground:            @grayLighter;\r\n@heroUnitHeadingColor:          inherit;\r\n@heroUnitLeadColor:             inherit;\r\n\r\n\r\n// Form states and alerts\r\n// -------------------------\r\n@warningText:             @orange;\r\n@warningBackground:       #fcf8e3;\r\n@warningBorder:           darken(spin(@warningBackground, -10), 3%);\r\n\r\n@errorText:               @red;\r\n@errorBackground:         #f2dede;\r\n@errorBorder:             darken(spin(@errorBackground, -10), 3%);\r\n\r\n@successText:             @green;\r\n@successBackground:       #dff0d8;\r\n@successBorder:           darken(spin(@successBackground, -10), 5%);\r\n\r\n@infoText:                @blue;\r\n@infoBackground:          #d9edf7;\r\n@infoBorder:              darken(spin(@infoBackground, -10), 7%);\r\n\r\n\r\n// Tooltips and popovers\r\n// -------------------------\r\n@tooltipColor:            #fff;\r\n@tooltipBackground:       #000;\r\n@tooltipArrowWidth:       5px;\r\n@tooltipArrowColor:       @tooltipBackground;\r\n\r\n@popoverBackground:       #fff;\r\n@popoverArrowWidth:       10px;\r\n@popoverArrowColor:       #fff;\r\n@popoverTitleBackground:  darken(@popoverBackground, 3%);\r\n\r\n// Special enhancement for popovers\r\n@popoverArrowOuterWidth:  @popoverArrowWidth + 1;\r\n@popoverArrowOuterColor:  rgba(0,0,0,.25);\r\n\r\n\r\n\r\n// GRID\r\n// --------------------------------------------------\r\n\r\n// Default 940px grid\r\n// -------------------------\r\n@T3gridWidth:             940px;  // T3 add. For non-responsive layout.\r\n@gridColumns:             12;\r\n@gridGutterWidth:         40px;\r\n@gridColumnWidth:     	  floor((@T3gridWidth - @gridGutterWidth * (@gridColumns - 1)) / @gridColumns);\r\n@gridRowWidth:            (@gridColumns * @gridColumnWidth) + (@gridGutterWidth * (@gridColumns - 1));\r\n\r\n// 1200px min\r\n@T3gridWidth1200:         1200px;  // T3 add\r\n@gridGutterWidth1200:     40px;\r\n@gridColumnWidth1200:     floor((@T3gridWidth1200 - @gridGutterWidth1200 * (@gridColumns - 1)) / @gridColumns);\r\n@gridRowWidth1200:        (@gridColumns * @gridColumnWidth1200) + (@gridGutterWidth1200 * (@gridColumns - 1));\r\n\r\n// 980px-1199px\r\n@T3gridWidth980:          940px;  // T3 add\r\n@gridGutterWidth980:      40px;\r\n@gridColumnWidth980:      floor((@T3gridWidth980 - @gridGutterWidth980 * (@gridColumns - 1)) / @gridColumns);\r\n@gridRowWidth980:         (@gridColumns * @gridColumnWidth980) + (@gridGutterWidth980 * (@gridColumns - 1));\r\n\r\n// T3 Add: 768px-979px\r\n@T3gridWidth768:          740px;  // T3 add\r\n@gridGutterWidth768:      20px;\r\n@gridColumnWidth768:      floor((@T3gridWidth768 - @gridGutterWidth768 * (@gridColumns - 1)) / @gridColumns);\r\n@gridRowWidth768:         (@gridColumns * @gridColumnWidth768) + (@gridGutterWidth768 * (@gridColumns - 1));\r\n\r\n\r\n// Fluid grid\r\n// -------------------------\r\n@fluidGridColumnWidth:      percentage(@gridColumnWidth/@gridRowWidth);\r\n@fluidGridGutterWidth:      percentage(@gridGutterWidth/@gridRowWidth);\r\n\r\n// 1200px min\r\n@fluidGridColumnWidth1200:  percentage(@gridColumnWidth1200/@gridRowWidth1200);\r\n@fluidGridGutterWidth1200:  percentage(@gridGutterWidth1200/@gridRowWidth1200);\r\n\r\n// 980px-1199px\r\n@fluidGridColumnWidth980:   percentage(@gridColumnWidth980/@gridRowWidth980);\r\n@fluidGridGutterWidth980:   percentage(@gridGutterWidth980/@gridRowWidth980);\r\n\r\n// T3 Extensed: 768px-979px\r\n@fluidGridColumnWidth768:   percentage(@gridColumnWidth768/@gridRowWidth768);\r\n@fluidGridGutterWidth768:   percentage(@gridGutterWidth768/@gridRowWidth768);\r\n\r\n\r\n\r\n//\r\n// T3 TEMPLATE STYLES\r\n// --------------------------------------------------\r\n@T3borderColor:             #ddd;\r\n@T3bodyBackgroundImage:     none;\r\n\r\n// Global Margin & Padding\r\n@T3globalMargin:            @baseLineHeight;\r\n@T3globalPadding:           @baseLineHeight;\r\n\r\n\r\n// ThemeMagic\r\n// -------------------------\r\n@T3NavbarInverted:          0;\r\n@T3SpotlightsInverted:      0;\r\n\r\n\r\n\r\n//\r\n// T3 LOGO\r\n// --------------------------------------------------\r\n@T3logoWidth:               204px;\r\n@T3logoHeight:              65px;\r\n\r\n@T3LogoImage:               "@{T3ImagePath}/logo.png";\r\n\r\n\r\n\r\n//\r\n// T3 GLOBAL STYLES\r\n// --------------------------------------------------\r\n\r\n// Module Styles\r\n// -------------------------\r\n// Module General\r\n@T3moduleBackground:            transparent;\r\n@T3moduleColor:                 inherit;\r\n@T3modulePadding:               0;\r\n@T3moduleBorder:                1px solid @T3borderColor;\r\n\r\n// Module Title\r\n@T3moduleTitleBackground:       inherit; // inherit from @moduleBackground\r\n@T3moduleTitleColor:            @headingsColor; // inherit from @moduleColor\r\n@T3moduleTitlePadding:          0;\r\n\r\n// Module Content\r\n@T3moduleContentBackground:     inherit; // inherit from @moduleBackground\r\n@T3moduleContentColor:          inherit; // inherit from @moduleColor\r\n@T3moduleContentPadding:        0;\r\n\r\n\r\n// Footer Modules Styles\r\n// -------------------------\r\n@T3FooterModuleTitleColor:      @grayLight;\r\n@T3FooterModuleColor:           @grayLight;\r\n\r\n\r\n\r\n//\n// Mixins\n// --------------------------------------------------\n\n\n// UTILITY MIXINS\n// --------------------------------------------------\n\n// Clearfix\n// --------\n// For clearing floats like a boss h5bp.com/q\n.clearfix {\n  *zoom: 1;\n  &:before,\n  &:after {\n    display: table;\n    content: "";\n    // Fixes Opera/contenteditable bug:\n    // http://nicolasgallagher.com/micro-clearfix-hack/#comment-36952\n    line-height: 0;\n  }\n  &:after {\n    clear: both;\n  }\n}\n\n// Webkit-style focus\n// ------------------\n.tab-focus() {\n  // Default\n  outline: thin dotted #333;\n  // Webkit\n  outline: 5px auto -webkit-focus-ring-color;\n  outline-offset: -2px;\n}\n\n// Center-align a block level element\n// ----------------------------------\n.center-block() {\n  display: block;\n  margin-left: auto;\n  margin-right: auto;\n}\n\n// IE7 inline-block\n// ----------------\n.ie7-inline-block() {\n  *display: inline; /* IE7 inline-block hack */\n  *zoom: 1;\n}\n\n// IE7 likes to collapse whitespace on either side of the inline-block elements.\n// Ems because we''re attempting to match the width of a space character. Left\n// version is for form buttons, which typically come after other elements, and\n// right version is for icons, which come before. Applying both is ok, but it will\n// mean that space between those elements will be .6em (~2 space characters) in IE7,\n// instead of the 1 space in other browsers.\n.ie7-restore-left-whitespace() {\n  *margin-left: .3em;\n\n  &:first-child {\n    *margin-left: 0;\n  }\n}\n\n.ie7-restore-right-whitespace() {\n  *margin-right: .3em;\n}\n\n// Sizing shortcuts\n// -------------------------\n.size(@height, @width) {\n  width: @width;\n  height: @height;\n}\n.square(@size) {\n  .size(@size, @size);\n}\n\n// Placeholder text\n// -------------------------\n.placeholder(@color: @placeholderText) {\n  &:-moz-placeholder {\n    color: @color;\n  }\n  &:-ms-input-placeholder {\n    color: @color;\n  }\n  &::-webkit-input-placeholder {\n    color: @color;\n  }\n}\n\n// Text overflow\n// -------------------------\n// Requires inline-block or block for proper styling\n.text-overflow() {\n  overflow: hidden;\n  text-overflow: ellipsis;\n  white-space: nowrap;\n}\n\n// CSS image replacement\n// -------------------------\n// Source: https://github.com/h5bp/html5-boilerplate/commit/aa0396eae757\n.hide-text {\n  font: 0/0 a;\n  color: transparent;\n  text-shadow: none;\n  background-color: transparent;\n  border: 0;\n}\n\n\n// FONTS\n// --------------------------------------------------\n\n#font {\n  #family {\n    .serif() {\n      font-family: @serifFontFamily;\n    }\n    .sans-serif() {\n      font-family: @sansFontFamily;\n    }\n    .monospace() {\n      font-family: @monoFontFamily;\n    }\n  }\n  .shorthand(@size: @baseFontSize, @weight: normal, @lineHeight: @baseLineHeight) {\n    font-size: @size;\n    font-weight: @weight;\n    line-height: @lineHeight;\n  }\n  .serif(@size: @baseFontSize, @weight: normal, @lineHeight: @baseLineHeight) {\n    #font > #family > .serif;\n    #font > .shorthand(@size, @weight, @lineHeight);\n  }\n  .sans-serif(@size: @baseFontSize, @weight: normal, @lineHeight: @baseLineHeight) {\n    #font > #family > .sans-serif;\n    #font > .shorthand(@size, @weight, @lineHeight);\n  }\n  .monospace(@size: @baseFontSize, @weight: normal, @lineHeight: @baseLineHeight) {\n    #font > #family > .monospace;\n    #font > .shorthand(@size, @weight, @lineHeight);\n  }\n}\n\n\n// FORMS\n// --------------------------------------------------\n\n// Block level inputs\n.input-block-level {\n  display: block;\n  width: 100%;\n  min-height: @inputHeight; // Make inputs at least the height of their button counterpart (base line-height + padding + border)\n  .box-sizing(border-box); // Makes inputs behave like true block-level elements\n}\n\n\n\n// Mixin for form field states\n.formFieldState(@textColor: #555, @borderColor: #ccc, @backgroundColor: #f5f5f5) {\n  // Set the text color\n  .control-label,\n  .help-block,\n  .help-inline {\n    color: @textColor;\n  }\n  // Style inputs accordingly\n  .checkbox,\n  .radio,\n  input,\n  select,\n  textarea {\n    color: @textColor;\n  }\n  input,\n  select,\n  textarea {\n    border-color: @borderColor;\n    .box-shadow(inset 0 1px 1px rgba(0,0,0,.075)); // Redeclare so transitions work\n    &:focus {\n      border-color: darken(@borderColor, 10%);\n      @shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 6px lighten(@borderColor, 20%);\n      .box-shadow(@shadow);\n    }\n  }\n  // Give a small background color for input-prepend/-append\n  .input-prepend .add-on,\n  .input-append .add-on {\n    color: @textColor;\n    background-color: @backgroundColor;\n    border-color: @textColor;\n  }\n}\n\n\n\n// CSS3 PROPERTIES\n// --------------------------------------------------\n\n// Border Radius\n.border-radius(@radius) {\n  -webkit-border-radius: @radius;\n     -moz-border-radius: @radius;\n          border-radius: @radius;\n}\n\n// Single Corner Border Radius\n.border-top-left-radius(@radius) {\n  -webkit-border-top-left-radius: @radius;\n      -moz-border-radius-topleft: @radius;\n          border-top-left-radius: @radius;\n}\n.border-top-right-radius(@radius) {\n  -webkit-border-top-right-radius: @radius;\n      -moz-border-radius-topright: @radius;\n          border-top-right-radius: @radius;\n}\n.border-bottom-right-radius(@radius) {\n  -webkit-border-bottom-right-radius: @radius;\n      -moz-border-radius-bottomright: @radius;\n          border-bottom-right-radius: @radius;\n}\n.border-bottom-left-radius(@radius) {\n  -webkit-border-bottom-left-radius: @radius;\n      -moz-border-radius-bottomleft: @radius;\n          border-bottom-left-radius: @radius;\n}\n\n// Single Side Border Radius\n.border-top-radius(@radius) {\n  .border-top-right-radius(@radius);\n  .border-top-left-radius(@radius);\n}\n.border-right-radius(@radius) {\n  .border-top-right-radius(@radius);\n  .border-bottom-right-radius(@radius);\n}\n.border-bottom-radius(@radius) {\n  .border-bottom-right-radius(@radius);\n  .border-bottom-left-radius(@radius);\n}\n.border-left-radius(@radius) {\n  .border-top-left-radius(@radius);\n  .border-bottom-left-radius(@radius);\n}\n\n// Drop shadows\n.box-shadow(@shadow) {\n  -webkit-box-shadow: @shadow;\n     -moz-box-shadow: @shadow;\n          box-shadow: @shadow;\n}\n\n// Transitions\n.transition(@transition) {\n  -webkit-transition: @transition;\n     -moz-transition: @transition;\n       -o-transition: @transition;\n          transition: @transition;\n}\n.transition-delay(@transition-delay) {\n  -webkit-transition-delay: @transition-delay;\n     -moz-transition-delay: @transition-delay;\n       -o-transition-delay: @transition-delay;\n          transition-delay: @transition-delay;\n}\n.transition-duration(@transition-duration) {\n  -webkit-transition-duration: @transition-duration;\n     -moz-transition-duration: @transition-duration;\n       -o-transition-duration: @transition-duration;\n          transition-duration: @transition-duration;\n}\n\n// Transformations\n.rotate(@degrees) {\n  -webkit-transform: rotate(@degrees);\n     -moz-transform: rotate(@degrees);\n      -ms-transform: rotate(@degrees);\n       -o-transform: rotate(@degrees);\n          transform: rotate(@degrees);\n}\n.scale(@ratio) {\n  -webkit-transform: scale(@ratio);\n     -moz-transform: scale(@ratio);\n      -ms-transform: scale(@ratio);\n       -o-transform: scale(@ratio);\n          transform: scale(@ratio);\n}\n.translate(@x, @y) {\n  -webkit-transform: translate(@x, @y);\n     -moz-transform: translate(@x, @y);\n      -ms-transform: translate(@x, @y);\n       -o-transform: translate(@x, @y);\n          transform: translate(@x, @y);\n}\n.skew(@x, @y) {\n  -webkit-transform: skew(@x, @y);\n     -moz-transform: skew(@x, @y);\n      -ms-transform: skewX(@x) skewY(@y); // See https://github.com/twitter/bootstrap/issues/4885\n       -o-transform: skew(@x, @y);\n          transform: skew(@x, @y);\n  -webkit-backface-visibility: hidden; // See https://github.com/twitter/bootstrap/issues/5319\n}\n.translate3d(@x, @y, @z) {\n  -webkit-transform: translate3d(@x, @y, @z);\n     -moz-transform: translate3d(@x, @y, @z);\n       -o-transform: translate3d(@x, @y, @z);\n          transform: translate3d(@x, @y, @z);\n}\n\n// Backface visibility\n// Prevent browsers from flickering when using CSS 3D transforms.\n// Default value is `visible`, but can be changed to `hidden\n// See git pull https://github.com/dannykeane/bootstrap.git backface-visibility for examples\n.backface-visibility(@visibility){\n	-webkit-backface-visibility: @visibility;\n	   -moz-backface-visibility: @visibility;\n	        backface-visibility: @visibility;\n}\n\n// Background clipping\n// Heads up: FF 3.6 and under need "padding" instead of "padding-box"\n.background-clip(@clip) {\n  -webkit-background-clip: @clip;\n     -moz-background-clip: @clip;\n          background-clip: @clip;\n}\n\n// Background sizing\n.background-size(@size) {\n  -webkit-background-size: @size;\n     -moz-background-size: @size;\n       -o-background-size: @size;\n          background-size: @size;\n}\n\n\n// Box sizing\n.box-sizing(@boxmodel) {\n  -webkit-box-sizing: @boxmodel;\n     -moz-box-sizing: @boxmodel;\n          box-sizing: @boxmodel;\n}\n\n// User select\n// For selecting text on the page\n.user-select(@select) {\n  -webkit-user-select: @select;\n     -moz-user-select: @select;\n      -ms-user-select: @select;\n       -o-user-select: @select;\n          user-select: @select;\n}\n\n// Resize anything\n.resizable(@direction) {\n  resize: @direction; // Options: horizontal, vertical, both\n  overflow: auto; // Safari fix\n}\n\n// CSS3 Content Columns\n.content-columns(@columnCount, @columnGap: @gridGutterWidth) {\n  -webkit-column-count: @columnCount;\n     -moz-column-count: @columnCount;\n          column-count: @columnCount;\n  -webkit-column-gap: @columnGap;\n     -moz-column-gap: @columnGap;\n          column-gap: @columnGap;\n}\n\n// Optional hyphenation\n.hyphens(@mode: auto) {\n  word-wrap: break-word;\n  -webkit-hyphens: @mode;\n     -moz-hyphens: @mode;\n      -ms-hyphens: @mode;\n       -o-hyphens: @mode;\n          hyphens: @mode;\n}\n\n// Opacity\n.opacity(@opacity) {\n  opacity: @opacity / 100;\n  filter: ~"alpha(opacity=@{opacity})";\n}\n\n\n\n// BACKGROUNDS\n// --------------------------------------------------\n\n// Add an alphatransparency value to any background or border color (via Elyse Holladay)\n#translucent {\n  .background(@color: @white, @alpha: 1) {\n    background-color: hsla(hue(@color), saturation(@color), lightness(@color), @alpha);\n  }\n  .border(@color: @white, @alpha: 1) {\n    border-color: hsla(hue(@color), saturation(@color), lightness(@color), @alpha);\n    .background-clip(padding-box);\n  }\n}\n\n// Gradient Bar Colors for buttons and alerts\n.gradientBar(@primaryColor, @secondaryColor, @textColor: #fff, @textShadow: 0 -1px 0 rgba(0,0,0,.25)) {\n  color: @textColor;\n  text-shadow: @textShadow;\n  #gradient > .vertical(@primaryColor, @secondaryColor);\n  border-color: @secondaryColor @secondaryColor darken(@secondaryColor, 15%);\n  border-color: rgba(0,0,0,.1) rgba(0,0,0,.1) fadein(rgba(0,0,0,.1), 15%);\n}\n\n// Gradients\n#gradient {\n  .horizontal(@startColor: #555, @endColor: #333) {\n    background-color: @endColor;\n    background-image: -moz-linear-gradient(left, @startColor, @endColor); // FF 3.6+\n    background-image: -webkit-gradient(linear, 0 0, 100% 0, from(@startColor), to(@endColor)); // Safari 4+, Chrome 2+\n    background-image: -webkit-linear-gradient(left, @startColor, @endColor); // Safari 5.1+, Chrome 10+\n    background-image: -o-linear-gradient(left, @startColor, @endColor); // Opera 11.10\n    background-image: linear-gradient(to right, @startColor, @endColor); // Standard, IE10\n    background-repeat: repeat-x;\n    filter: e(%("progid:DXImageTransform.Microsoft.gradient(startColorstr=''%d'', endColorstr=''%d'', GradientType=1)",argb(@startColor),argb(@endColor))); // IE9 and down\n  }\n  .vertical(@startColor: #555, @endColor: #333) {\n    background-color: mix(@startColor, @endColor, 60%);\n    background-image: -moz-linear-gradient(top, @startColor, @endColor); // FF 3.6+\n    background-image: -webkit-gradient(linear, 0 0, 0 100%, from(@startColor), to(@endColor)); // Safari 4+, Chrome 2+\n    background-image: -webkit-linear-gradient(top, @startColor, @endColor); // Safari 5.1+, Chrome 10+\n    background-image: -o-linear-gradient(top, @startColor, @endColor); // Opera 11.10\n    background-image: linear-gradient(to bottom, @startColor, @endColor); // Standard, IE10\n    background-repeat: repeat-x;\n    filter: e(%("progid:DXImageTransform.Microsoft.gradient(startColorstr=''%d'', endColorstr=''%d'', GradientType=0)",argb(@startColor),argb(@endColor))); // IE9 and down\n  }\n  .directional(@startColor: #555, @endColor: #333, @deg: 45deg) {\n    background-color: @endColor;\n    background-repeat: repeat-x;\n    background-image: -moz-linear-gradient(@deg, @startColor, @endColor); // FF 3.6+\n    background-image: -webkit-linear-gradient(@deg, @startColor, @endColor); // Safari 5.1+, Chrome 10+\n    background-image: -o-linear-gradient(@deg, @startColor, @endColor); // Opera 11.10\n    background-image: linear-gradient(@deg, @startColor, @endColor); // Standard, IE10\n  }\n  .horizontal-three-colors(@startColor: #00b3ee, @midColor: #7a43b6, @colorStop: 50%, @endColor: #c3325f) {\n    background-color: mix(@midColor, @endColor, 80%);\n    background-image: -webkit-gradient(left, linear, 0 0, 0 100%, from(@startColor), color-stop(@colorStop, @midColor), to(@endColor));\n    background-image: -webkit-linear-gradient(left, @startColor, @midColor @colorStop, @endColor);\n    background-image: -moz-linear-gradient(left, @startColor, @midColor @colorStop, @endColor);\n    background-image: -o-linear-gradient(left, @startColor, @midColor @colorStop, @endColor);\n    background-image: linear-gradient(to right, @startColor, @midColor @colorStop, @endColor);\n    background-repeat: no-repeat;\n    filter: e(%("progid:DXImageTransform.Microsoft.gradient(startColorstr=''%d'', endColorstr=''%d'', GradientType=0)",argb(@startColor),argb(@endColor))); // IE9 and down, gets no color-stop at all for proper fallback\n  }\n\n  .vertical-three-colors(@startColor: #00b3ee, @midColor: #7a43b6, @colorStop: 50%, @endColor: #c3325f) {\n    background-color: mix(@midColor, @endColor, 80%);\n    background-image: -webkit-gradient(linear, 0 0, 0 100%, from(@startColor), color-stop(@colorStop, @midColor), to(@endColor));\n    background-image: -webkit-linear-gradient(@startColor, @midColor @colorStop, @endColor);\n    background-image: -moz-linear-gradient(top, @startColor, @midColor @colorStop, @endColor);\n    background-image: -o-linear-gradient(@startColor, @midColor @colorStop, @endColor);\n    background-image: linear-gradient(@startColor, @midColor @colorStop, @endColor);\n    background-repeat: no-repeat;\n    filter: e(%("progid:DXImageTransform.Microsoft.gradient(startColorstr=''%d'', endColorstr=''%d'', GradientType=0)",argb(@startColor),argb(@endColor))); // IE9 and down, gets no color-stop at all for proper fallback\n  }\n  .radial(@innerColor: #555, @outerColor: #333) {\n    background-color: @outerColor;\n    background-image: -webkit-gradient(radial, center center, 0, center center, 460, from(@innerColor), to(@outerColor));\n    background-image: -webkit-radial-gradient(circle, @innerColor, @outerColor);\n    background-image: -moz-radial-gradient(circle, @innerColor, @outerColor);\n    background-image: -o-radial-gradient(circle, @innerColor, @outerColor);\n    background-repeat: no-repeat;\n  }\n  .striped(@color: #555, @angle: 45deg) {\n    background-color: @color;\n    background-image: -webkit-gradient(linear, 0 100%, 100% 0, color-stop(.25, rgba(255,255,255,.15)), color-stop(.25, transparent), color-stop(.5, transparent), color-stop(.5, rgba(255,255,255,.15)), color-stop(.75, rgba(255,255,255,.15)), color-stop(.75, transparent), to(transparent));\n    background-image: -webkit-linear-gradient(@angle, rgba(255,255,255,.15) 25%, transparent 25%, transparent 50%, rgba(255,255,255,.15) 50%, rgba(255,255,255,.15) 75%, transparent 75%, transparent);\n    background-image: -moz-linear-gradient(@angle, rgba(255,255,255,.15) 25%, transparent 25%, transparent 50%, rgba(255,255,255,.15) 50%, rgba(255,255,255,.15) 75%, transparent 75%, transparent);\n    background-image: -o-linear-gradient(@angle, rgba(255,255,255,.15) 25%, transparent 25%, transparent 50%, rgba(255,255,255,.15) 50%, rgba(255,255,255,.15) 75%, transparent 75%, transparent);\n    background-image: linear-gradient(@angle, rgba(255,255,255,.15) 25%, transparent 25%, transparent 50%, rgba(255,255,255,.15) 50%, rgba(255,255,255,.15) 75%, transparent 75%, transparent);\n  }\n}\n// Reset filters for IE\n.reset-filter() {\n  filter: e(%("progid:DXImageTransform.Microsoft.gradient(enabled = false)"));\n}\n\n\n\n// COMPONENT MIXINS\n// --------------------------------------------------\n\n// Horizontal dividers\n// -------------------------\n// Dividers (basically an hr) within dropdowns and nav lists\n.nav-divider(@top: #e5e5e5, @bottom: @white) {\n  // IE7 needs a set width since we gave a height. Restricting just\n  // to IE7 to keep the 1px left/right space in other browsers.\n  // It is unclear where IE is getting the extra space that we need\n  // to negative-margin away, but so it goes.\n  *width: 100%;\n  height: 1px;\n  margin: ((@baseLineHeight / 2) - 1) 1px; // 8px 1px\n  *margin: -5px 0 5px;\n  overflow: hidden;\n  background-color: @top;\n  border-bottom: 1px solid @bottom;\n}\n\n// Button backgrounds\n// ------------------\n.buttonBackground(@startColor, @endColor, @textColor: #fff, @textShadow: 0 -1px 0 rgba(0,0,0,.25)) {\n  // gradientBar will set the background to a pleasing blend of these, to support IE<=9\n  .gradientBar(@startColor, @endColor, @textColor, @textShadow);\n  *background-color: @endColor; /* Darken IE7 buttons by default so they stand out more given they won''t have borders */\n  .reset-filter();\n\n  // in these cases the gradient won''t cover the background, so we override\n  &:hover, &:focus, &:active, &.active, &.disabled, &[disabled] {\n    color: @textColor;\n    background-color: @endColor;\n    *background-color: darken(@endColor, 5%);\n  }\n\n  // IE 7 + 8 can''t handle box-shadow to show active, so we darken a bit ourselves\n  &:active,\n  &.active {\n    background-color: darken(@endColor, 10%) e("\\9");\n  }\n}\n\n// Navbar vertical align\n// -------------------------\n// Vertically center elements in the navbar.\n// Example: an element has a height of 30px, so write out `.navbarVerticalAlign(30px);` to calculate the appropriate top margin.\n.navbarVerticalAlign(@elementHeight) {\n  margin-top: (@navbarHeight - @elementHeight) / 2;\n}\n\n\n\n// Grid System\n// -----------\n\n// Centered container element\n.container-fixed() {\n  margin-right: auto;\n  margin-left: auto;\n  .clearfix();\n}\n\n// Table columns\n.tableColumns(@columnSpan: 1) {\n  float: none; // undo default grid column styles\n  width: ((@gridColumnWidth) * @columnSpan) + (@gridGutterWidth * (@columnSpan - 1)) - 16; // 16 is total padding on left and right of table cells\n  margin-left: 0; // undo default grid column styles\n}\n\n// Make a Grid\n// Use .makeRow and .makeColumn to assign semantic layouts grid system behavior\n.makeRow() {\n  margin-left: @gridGutterWidth * -1;\n  .clearfix();\n}\n.makeColumn(@columns: 1, @offset: 0) {\n  float: left;\n  margin-left: (@gridColumnWidth * @offset) + (@gridGutterWidth * (@offset - 1)) + (@gridGutterWidth * 2);\n  width: (@gridColumnWidth * @columns) + (@gridGutterWidth * (@columns - 1));\n}\n\n// The Grid\n#grid {\n\n  .core (@gridColumnWidth, @gridGutterWidth) {\n\n    .spanX (@index) when (@index > 0) {\n      (~".span@{index}") { .span(@index); }\n      .spanX(@index - 1);\n    }\n    .spanX (0) {}\n\n    .offsetX (@index) when (@index > 0) {\n      (~".offset@{index}") { .offset(@index); }\n      .offsetX(@index - 1);\n    }\n    .offsetX (0) {}\n\n    .offset (@columns) {\n      margin-left: (@gridColumnWidth * @columns) + (@gridGutterWidth * (@columns + 1));\n    }\n\n    .span (@columns) {\n      width: (@gridColumnWidth * @columns) + (@gridGutterWidth * (@columns - 1));\n    }\n\n    .row {\n      margin-left: @gridGutterWidth * -1;\n      .clearfix();\n    }\n\n    [class*="span"] {\n      float: left;\n      min-height: 1px; // prevent collapsing columns\n      margin-left: @gridGutterWidth;\n    }\n\n    // Set the container width, and override it for fixed navbars in media queries\n    .container,\n    .navbar-static-top .container,\n    .navbar-fixed-top .container,\n    .navbar-fixed-bottom .container { .span(@gridColumns); }\n\n    // generate .spanX and .offsetX\n    .spanX (@gridColumns);\n    .offsetX (@gridColumns);\n\n  }\n\n  .fluid (@fluidGridColumnWidth, @fluidGridGutterWidth) {\n\n    .spanX (@index, @fluidGridColumnWidth, @fluidGridGutterWidth) when (@index > 0) {\n      (~".span@{index}") { .span(@index); }\n      .spanX(@index - 1, @fluidGridColumnWidth, @fluidGridGutterWidth);\n    }\n    .spanX (0, @fluidGridColumnWidth, @fluidGridGutterWidth) {}\n\n    .offsetX (@index, @fluidGridColumnWidth, @fluidGridGutterWidth) when (@index > 0) {\n      (~''.offset@{index}'') { .offset(@index); }\n      (~''.offset@{index}:first-child'') { .offsetFirstChild(@index); }\n      .offsetX(@index - 1, @fluidGridColumnWidth, @fluidGridGutterWidth);\n    }\n    .offsetX (0, @fluidGridColumnWidth, @fluidGridGutterWidth) {}\n\n    .offset (@columns) {\n      margin-left: (@fluidGridColumnWidth * @columns) + (@fluidGridGutterWidth * (@columns - 1)) + (@fluidGridGutterWidth*2);\n  	  *margin-left: (@fluidGridColumnWidth * @columns) + (@fluidGridGutterWidth * (@columns - 1)) - (.5 / @gridRowWidth * 100 * 1%) + (@fluidGridGutterWidth*2) - (.5 / @gridRowWidth * 100 * 1%);\n    }\n\n    .offsetFirstChild (@columns) {\n      margin-left: (@fluidGridColumnWidth * @columns) + (@fluidGridGutterWidth * (@columns - 1)) + (@fluidGridGutterWidth);\n      *margin-left: (@fluidGridColumnWidth * @columns) + (@fluidGridGutterWidth * (@columns - 1)) - (.5 / @gridRowWidth * 100 * 1%) + @fluidGridGutterWidth - (.5 / @gridRowWidth * 100 * 1%);\n    }\n\n    .span (@columns) {\n      width: (@fluidGridColumnWidth * @columns) + (@fluidGridGutterWidth * (@columns - 1));\n      *width: (@fluidGridColumnWidth * @columns) + (@fluidGridGutterWidth * (@columns - 1)) - (.5 / @gridRowWidth * 100 * 1%);\n    }\n\n    .row-fluid {\n      width: 100%;\n      .clearfix();\n      [class*="span"] {\n        .input-block-level();\n        float: left;\n        margin-left: @fluidGridGutterWidth;\n        *margin-left: @fluidGridGutterWidth - (.5 / @gridRowWidth * 100 * 1%);\n      }\n      [class*="span"]:first-child {\n        margin-left: 0;\n      }\n\n      // Space grid-sized controls properly if multiple per line\n      .controls-row [class*="span"] + [class*="span"] {\n        margin-left: @fluidGridGutterWidth;\n      }\n\n      // generate .spanX and .offsetX\n      .spanX (@gridColumns, @fluidGridColumnWidth, @fluidGridGutterWidth);\n      .offsetX (@gridColumns, @fluidGridColumnWidth, @fluidGridGutterWidth);\n    }\n\n  }\n\n  .input(@gridColumnWidth, @gridGutterWidth) {\n\n    .spanX (@index) when (@index > 0) {\n      (~"input.span@{index}, textarea.span@{index}, .uneditable-input.span@{index}") { .span(@index); }\n      .spanX(@index - 1);\n    }\n    .spanX (0) {}\n\n    .span(@columns) {\n      width: ((@gridColumnWidth) * @columns) + (@gridGutterWidth * (@columns - 1)) - 14;\n    }\n\n    input,\n    textarea,\n    .uneditable-input {\n      margin-left: 0; // override margin-left from core grid system\n    }\n\n    // Space grid-sized controls properly if multiple per line\n    .controls-row [class*="span"] + [class*="span"] {\n      margin-left: @gridGutterWidth;\n    }\n\n    // generate .spanX\n    .spanX (@gridColumns);\n\n  }\n}\n/** \n *------------------------------------------------------------------------------\n * @package       T3 Framework for Joomla!\n *------------------------------------------------------------------------------\n * @copyright     Copyright (C) 2004-2013 JoomlArt.com. All Rights Reserved.\n * @license       GNU General Public License version 2 or later; see LICENSE.txt\n * @authors       JoomlArt, JoomlaBamboo, (contribute to this project at github \n *                & Google group to become co-author)\n * @Google group: https://groups.google.com/forum/#!forum/t3fw\n * @Link:         http://t3-framework.org \n *------------------------------------------------------------------------------\n */\n\n\n// The Grid extend\n// MIXINS\n#grid-extend {\n  \n  // extend left offset\n  .offset (@gridColumnWidth, @gridGutterWidth) {\n    .offset-X (@index) when (@index > 0) {\n      (~".offset-@{index}") { .offset-(@index); }\n      .offset-X(@index - 1);\n    }\n    .offset-X (0) {}\n\n    .offset- (@columns) {\n      margin-left: -(@gridColumnWidth * @columns) - (@gridGutterWidth * (@columns - 1));\n    }\n    \n    .offset-X (@gridColumns);\n  }\n\n  // fix the offset, used in t3-admin-layout-preview.less for layout configuration in template admin\n  .fixOffsetX (@fluidGridColumnWidth, @fluidGridGutterWidth) {\n\n    .offsetX (@index) when (@index > 0) {\n      (~''.offset@{index}'') { .offset(@index); }\n      (~''.offset@{index}:first-child'') { .offsetFirstChild(@index); }\n      .offsetX(@index - 1);\n    }\n    .offsetX (0) {}\n    .offset (@columns) {\n      margin-left: (@fluidGridColumnWidth * @columns) + (@fluidGridGutterWidth * (@columns - 1)) + (@fluidGridGutterWidth*2) !important;\n      *margin-left: (@fluidGridColumnWidth * @columns) + (@fluidGridGutterWidth * (@columns - 1)) - (.5 / @gridRowWidth * 100 * 1%) + (@fluidGridGutterWidth*2) - (.5 / @gridRowWidth * 100 * 1%) !important;\n    }\n    .offsetFirstChild (@columns) {\n      margin-left: (@fluidGridColumnWidth * @columns) + (@fluidGridGutterWidth * (@columns - 1)) + (@fluidGridGutterWidth) !important;\n      *margin-left: (@fluidGridColumnWidth * @columns) + (@fluidGridGutterWidth * (@columns - 1)) - (.5 / @gridRowWidth * 100 * 1%) + @fluidGridGutterWidth - (.5 / @gridRowWidth * 100 * 1%) !important;\n    }\n\n    .offset-X (@index) when (@index > 0) {\n      (~''.offset-@{index}'') { .offset-(@index); }\n      .offset-X(@index - 1);\n    }\n    .offset-X (0) {}\n    .offset- (@columns) {\n      margin-left: -(@fluidGridColumnWidth * @columns) - (@fluidGridGutterWidth * (@columns - 1)) !important;\n      *margin-left: -(@fluidGridColumnWidth * @columns) - (@fluidGridGutterWidth * (@columns - 1)) + (.5 / @gridRowWidth * 100 * 1%) + (.5 / @gridRowWidth * 100 * 1%) !important;\n    }\n    \n    .offsetX (@gridColumns);\n    .offset-X (@gridColumns);\n  }\n\n  // fluid for all type of row - apply for small screen as mobile, portrait tablet\n  .fluid (@fluidGridColumnWidth, @fluidGridGutterWidth) {\n\n    .spanX (@index) when (@index > 0) {\n      (~".span@{index}") { .span(@index); }\n      .spanX(@index - 1);\n    }\n    .spanX (0) {}\n\n    .span (@columns) {\n      width: (@fluidGridColumnWidth * @columns) + (@fluidGridGutterWidth * (@columns - 1));\n      *width: (@fluidGridColumnWidth * @columns) + (@fluidGridGutterWidth * (@columns - 1)) - (.5 / @gridRowWidth * 100 * 1%);\n    }\n\n    .row, .row-fluid {\n      width: 100%;\n      margin-left: 0;\n      .clearfix();\n      [class*="span"] {\n        .input-block-level();\n        float: left;\n        margin-left: @fluidGridGutterWidth;\n        *margin-left: @fluidGridGutterWidth - (.5 / @gridRowWidth * 100 * 1%);\n      }\n      [class*="span"]:first-child:not(.pull-right) {\n        margin-left: 0;\n      }\n\n      [class*="span"].pull-right:first-child + [class*="span"]:not(.pull-right) {\n        margin-left: 0;\n      }\n      \n      // generate .spanX\n      .spanX (@gridColumns);\n    }\n\n\n    .spanxy_(@pcols, @cols) {\n      width: percentage(((@fluidGridColumnWidth * @cols) + (@fluidGridGutterWidth * (@cols - 1)))/((@fluidGridColumnWidth * @pcols) + (@fluidGridGutterWidth * (@pcols - 1))));\n      *width: percentage(((@fluidGridColumnWidth * @cols) + (@fluidGridGutterWidth * (@cols - 1)))/((@fluidGridColumnWidth * @pcols) + (@fluidGridGutterWidth * (@pcols - 1)))) - (.5 / @gridRowWidth * 100 * 1%);\n    }\n    .spanXY (@indexx) when(@indexx > 0) {\n      (~".span@{indexx}") { \n        .row {\n          // span for spany in spanx\n          [class*="span"] {\n            margin-left: percentage(@fluidGridGutterWidth / ((@fluidGridColumnWidth * @indexx) + (@fluidGridGutterWidth * (@indexx - 1))));\n            *margin-left: percentage(@fluidGridGutterWidth / ((@fluidGridColumnWidth * @indexx) + (@fluidGridGutterWidth * (@indexx - 1)))) - (.5 / @gridRowWidth * 100 * 1%);\n          }\n          [class*="span"]:first-child {\n            margin-left: 0;\n          }\n\n          .spanY (@indexy) when (@indexy > 0) {\n            (~".span@{indexy}") {\n              .spanxy_(@indexx, @indexy);\n            }\n            .spanY (@indexy - 1); \n          }\n\n          .spanY (0) {}\n\n          .spanY (@indexx);\n        }\n      }\n      .spanXY(@indexx - 1);\n    }\n    .spanXY (0) {}\n\n    // generate .spanXY\n    .spanXY (@gridColumns);\n  }\n}\n";}}s:4:"user";O:5:"JUser":24:{s:9:"\\0\\0\\0isRoot";b:0;s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:5:"block";N;s:9:"sendEmail";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:6:"groups";a:1:{i:0;s:1:"9";}s:5:"guest";i:1;s:13:"lastResetTime";N;s:10:"resetCount";N;s:10:"\\0\\0\\0_params";O:9:"JRegistry":1:{s:7:"\\0\\0\\0data";O:8:"stdClass":0:{}}s:14:"\\0\\0\\0_authGroups";a:2:{i:0;i:1;i:1;i:9;}s:14:"\\0\\0\\0_authLevels";a:3:{i:0;i:1;i:1;i:1;i:2;i:5;}s:15:"\\0\\0\\0_authActions";N;s:12:"\\0\\0\\0_errorMsg";N;s:10:"\\0\\0\\0_errors";a:0:{}s:3:"aid";i:0;}s:16:"com_mailto.links";a:1:{s:40:"6b33e2b23e2dd8ae1e9e9274076c0f269d169bca";O:8:"stdClass":2:{s:4:"link";s:28:"http://localhost/providores/";s:6:"expiry";i:1382547832;}}}', 0, '');
INSERT INTO `i8a13_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`) VALUES
('ed6q0dnc4mcfmleajildn49n17', 1, 0, '1382548265', '__default|a:8:{s:15:"session.counter";i:103;s:19:"session.timer.start";i:1382543076;s:18:"session.timer.last";i:1382548263;s:17:"session.timer.now";i:1382548265;s:22:"session.client.browser";s:72:"Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Firefox/24.0";s:8:"registry";O:9:"JRegistry":1:{s:7:"\\0\\0\\0data";O:8:"stdClass":7:{s:11:"application";O:8:"stdClass":1:{s:4:"lang";s:0:"";}s:13:"com_installer";O:8:"stdClass":3:{s:7:"message";s:0:"";s:17:"extension_message";s:0:"";s:12:"redirect_url";N;}s:13:"com_templates";O:8:"stdClass":1:{s:4:"edit";O:8:"stdClass":1:{s:5:"style";O:8:"stdClass":2:{s:2:"id";a:1:{i:0;i:9;}s:4:"data";N;}}}s:7:"oparams";a:17:{i:0;a:2:{s:4:"name";s:7:"devmode";s:5:"value";s:1:"1";}i:1;a:2:{s:4:"name";s:10:"themermode";s:5:"value";s:1:"1";}i:2;a:2:{s:4:"name";s:10:"responsive";s:5:"value";s:1:"1";}i:3;a:2:{s:4:"name";s:9:"build_rtl";s:5:"value";s:1:"0";}i:4;a:2:{s:4:"name";s:6:"minify";s:5:"value";s:1:"0";}i:5;a:2:{s:4:"name";s:9:"t3-assets";s:5:"value";s:9:"t3-assets";}i:6;a:2:{s:4:"name";s:10:"t3-rmvlogo";s:5:"value";s:1:"1";}i:7;a:2:{s:4:"name";s:18:"navigation_trigger";s:5:"value";s:5:"hover";}i:8;a:2:{s:4:"name";s:29:"navigation_collapse_offcanvas";s:5:"value";s:1:"1";}i:9;a:2:{s:4:"name";s:27:"navigation_collapse_showsub";s:5:"value";s:1:"1";}i:10;a:2:{s:4:"name";s:20:"navigation_animation";s:5:"value";s:6:"fading";}i:11;a:2:{s:4:"name";s:29:"navigation_animation_duration";s:5:"value";s:3:"400";}i:12;a:2:{s:4:"name";s:9:"mm_config";s:5:"value";N;}i:13;a:2:{s:4:"name";s:17:"snippet_open_head";s:5:"value";N;}i:14;a:2:{s:4:"name";s:18:"snippet_close_head";s:5:"value";N;}i:15;a:2:{s:4:"name";s:17:"snippet_open_body";s:5:"value";N;}i:16;a:2:{s:4:"name";s:18:"snippet_close_body";s:5:"value";N;}}s:9:"com_menus";O:8:"stdClass":2:{s:5:"items";O:8:"stdClass":2:{s:6:"filter";O:8:"stdClass":1:{s:8:"menutype";s:8:"mainmenu";}s:10:"limitstart";i:0;}s:4:"edit";O:8:"stdClass":1:{s:4:"item";O:8:"stdClass":4:{s:4:"data";N;s:4:"type";N;s:4:"link";N;s:8:"menutype";s:8:"mainmenu";}}}s:4:"item";O:8:"stdClass":1:{s:6:"filter";O:8:"stdClass":1:{s:8:"menutype";s:8:"mainmenu";}}s:11:"com_modules";O:8:"stdClass":3:{s:7:"modules";O:8:"stdClass":1:{s:6:"filter";O:8:"stdClass":1:{s:18:"client_id_previous";i:0;}}s:4:"edit";O:8:"stdClass":1:{s:6:"module";O:8:"stdClass":2:{s:2:"id";a:1:{i:0;i:87;}s:4:"data";N;}}s:3:"add";O:8:"stdClass":1:{s:6:"module";O:8:"stdClass":2:{s:12:"extension_id";N;s:6:"params";N;}}}}}s:4:"user";O:5:"JUser":24:{s:9:"\\0\\0\\0isRoot";b:1;s:2:"id";s:3:"553";s:4:"name";s:10:"Super User";s:8:"username";s:5:"admin";s:5:"email";s:21:"trungqt2005@gmail.com";s:8:"password";s:65:"5ecf74adf5e87c39f3ef7f80649c2877:stPxhQ60xMDAFo1LAlP9WB0NBLOt7GYP";s:14:"password_clear";s:0:"";s:5:"block";s:1:"0";s:9:"sendEmail";s:1:"1";s:12:"registerDate";s:19:"2013-10-23 05:38:05";s:13:"lastvisitDate";s:19:"2013-10-23 06:14:43";s:10:"activation";s:1:"0";s:6:"params";s:0:"";s:6:"groups";a:1:{i:8;s:1:"8";}s:5:"guest";i:0;s:13:"lastResetTime";s:19:"0000-00-00 00:00:00";s:10:"resetCount";s:1:"0";s:10:"\\0\\0\\0_params";O:9:"JRegistry":1:{s:7:"\\0\\0\\0data";O:8:"stdClass":0:{}}s:14:"\\0\\0\\0_authGroups";a:2:{i:0;i:1;i:1;i:8;}s:14:"\\0\\0\\0_authLevels";a:4:{i:0;i:1;i:1;i:1;i:2;i:2;i:3;i:3;}s:15:"\\0\\0\\0_authActions";N;s:12:"\\0\\0\\0_errorMsg";N;s:10:"\\0\\0\\0_errors";a:0:{}s:3:"aid";i:0;}s:13:"session.token";s:32:"b84d14fd7046c37b13ee57aabd5e553c";}', 553, 'admin');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Available Updates' AUTO_INCREMENT=251 ;

--
-- Dumping data for table `i8a13_updates`
--

INSERT INTO `i8a13_updates` (`update_id`, `update_site_id`, `extension_id`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`) VALUES
(1, 3, 0, 'Bulgarian', '', 'pkg_bg-BG', 'package', '', 0, '3.0.3.1', '', 'http://update.joomla.org/language/details3/bg-BG_details.xml', ''),
(2, 3, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '3.1.4.1', '', 'http://update.joomla.org/language/details3/ca-ES_details.xml', ''),
(3, 3, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/zh-CN_details.xml', ''),
(4, 3, 0, 'Croatian', '', 'pkg_hr-HR', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/hr-HR_details.xml', ''),
(5, 3, 0, 'Czech', '', 'pkg_cs-CZ', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/cs-CZ_details.xml', ''),
(6, 3, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/da-DK_details.xml', ''),
(7, 3, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/nl-NL_details.xml', ''),
(8, 3, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '3.1.0.1', '', 'http://update.joomla.org/language/details3/en-AU_details.xml', ''),
(9, 3, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '3.1.0.1', '', 'http://update.joomla.org/language/details3/en-US_details.xml', ''),
(10, 3, 0, 'Malay', '', 'pkg_ms-MY', 'package', '', 0, '3.1.5.4', '', 'http://update.joomla.org/language/details3/ms-MY_details.xml', ''),
(11, 3, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '3.1.2.1', '', 'http://update.joomla.org/language/details3/et-EE_details.xml', ''),
(12, 3, 0, 'Romanian', '', 'pkg_ro-RO', 'package', '', 0, '3.1.1.2', '', 'http://update.joomla.org/language/details3/ro-RO_details.xml', ''),
(13, 3, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/it-IT_details.xml', ''),
(14, 3, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/nl-BE_details.xml', ''),
(15, 3, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/ja-JP_details.xml', ''),
(16, 3, 0, 'Chinese Traditional', '', 'pkg_zh-TW', 'package', '', 0, '3.1.4.1', '', 'http://update.joomla.org/language/details3/zh-TW_details.xml', ''),
(17, 3, 0, 'Korean', '', 'pkg_ko-KR', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/ko-KR_details.xml', ''),
(18, 3, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/fr-FR_details.xml', ''),
(19, 3, 0, 'Kurdish Sorani', '', 'pkg_ckb-IQ', 'package', '', 0, '3.0.2.1', '', 'http://update.joomla.org/language/details3/ckb-IQ_details.xml', ''),
(20, 3, 0, 'Galician', '', 'pkg_gl-ES', 'package', '', 0, '3.0.2.2', '', 'http://update.joomla.org/language/details3/gl-ES_details.xml', ''),
(21, 3, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/lv-LV_details.xml', ''),
(22, 3, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/de-DE_details.xml', ''),
(23, 3, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '3.1.4.1', '', 'http://update.joomla.org/language/details3/mk-MK_details.xml', ''),
(24, 3, 0, 'Greek', '', 'pkg_el-GR', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/el-GR_details.xml', ''),
(25, 3, 0, 'Norwegian Bokmal', '', 'pkg_nb-NO', 'package', '', 0, '3.1.1.1', '', 'http://update.joomla.org/language/details3/nb-NO_details.xml', ''),
(26, 3, 0, 'Hebrew', '', 'pkg_he-IL', 'package', '', 0, '3.1.1.1', '', 'http://update.joomla.org/language/details3/he-IL_details.xml', ''),
(27, 3, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '3.1.4.1', '', 'http://update.joomla.org/language/details3/fa-IR_details.xml', ''),
(28, 3, 0, 'Hungarian', '', 'pkg_hu-HU', 'package', '', 0, '3.1.4.1', '', 'http://update.joomla.org/language/details3/hu-HU_details.xml', ''),
(29, 3, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '3.1.4.2', '', 'http://update.joomla.org/language/details3/pl-PL_details.xml', ''),
(30, 3, 0, 'Afrikaans', '', 'pkg_af-ZA', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/af-ZA_details.xml', ''),
(31, 3, 0, 'Portuguese', '', 'pkg_pt-PT', 'package', '', 0, '3.0.2.2', '', 'http://update.joomla.org/language/details3/pt-PT_details.xml', ''),
(32, 3, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/ar-AA_details.xml', ''),
(33, 3, 0, 'Russian', '', 'pkg_ru-RU', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/ru-RU_details.xml', ''),
(34, 3, 0, 'Belarusian', '', 'pkg_be-BY', 'package', '', 0, '3.0.2.1', '', 'http://update.joomla.org/language/details3/be-BY_details.xml', ''),
(35, 3, 0, 'Scottish Gaelic', '', 'pkg_gd-GB', 'package', '', 0, '3.1.0.1', '', 'http://update.joomla.org/language/details3/gd-GB_details.xml', ''),
(36, 3, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '3.1.5.3', '', 'http://update.joomla.org/language/details3/sk-SK_details.xml', ''),
(37, 3, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/sv-SE_details.xml', ''),
(38, 3, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '3.1.2.1', '', 'http://update.joomla.org/language/details3/sy-IQ_details.xml', ''),
(39, 3, 0, 'Tamil', '', 'pkg_ta-IN', 'package', '', 0, '3.1.5.2', '', 'http://update.joomla.org/language/details3/ta-IN_details.xml', ''),
(40, 3, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '3.1.4.2', '', 'http://update.joomla.org/language/details3/th-TH_details.xml', ''),
(41, 3, 0, 'Turkish', '', 'pkg_tr-TR', 'package', '', 0, '3.1.4.1', '', 'http://update.joomla.org/language/details3/tr-TR_details.xml', ''),
(42, 3, 0, 'Ukrainian', '', 'pkg_uk-UA', 'package', '', 0, '3.1.4.4', '', 'http://update.joomla.org/language/details3/uk-UA_details.xml', ''),
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
(53, 3, 0, 'Bahasa Indonesia', '', 'pkg_id-ID', 'package', '', 0, '3.1.4.1', '', 'http://update.joomla.org/language/details3/id-ID_details.xml', ''),
(54, 3, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '3.1.4.1', '', 'http://update.joomla.org/language/details3/fi-FI_details.xml', ''),
(55, 3, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/sw-KE_details.xml', ''),
(56, 4, 0, 'JA Amazon S3 for joomla 16', '', 'com_com_jaamazons3', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/com_com_jaamazons3.xml', ''),
(57, 4, 0, 'JA Extenstion Manager Component j16', '', 'com_com_jaextmanager', 'file', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/com_com_jaextmanager.xml', ''),
(58, 4, 0, 'JA Amazon S3 for joomla 2.5 & 3.1', '', 'com_jaamazons3', 'component', '', 1, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/com_jaamazons3.xml', ''),
(59, 4, 0, 'JA Comment Package for Joomla 2.5 & 3.0', '', 'com_jacomment', 'component', '', 1, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/com_jacomment.xml', ''),
(60, 4, 0, 'JA Extenstion Manager Component for J25 & J31', '', 'com_jaextmanager', 'component', '', 1, '2.5.7', '', 'http://update.joomlart.com/service/tracking/j16/com_jaextmanager.xml', ''),
(61, 4, 0, 'JA Google Storage Package for J2.5 & J3.0', '', 'com_jagooglestorage', 'component', '', 1, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/com_jagooglestorage.xml', ''),
(62, 4, 0, 'JA Job Board Package For J25', '', 'com_jajobboard', 'component', '', 1, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j16/com_jajobboard.xml', ''),
(63, 4, 0, 'JA K2 Filter Package for J25 & J31', '', 'com_jak2filter', 'component', '', 1, '1.0.9', '', 'http://update.joomlart.com/service/tracking/j16/com_jak2filter.xml', ''),
(64, 4, 0, 'JA K2 Filter Package for J25 & J30', '', 'com_jak2fiter', 'component', '', 1, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/com_jak2fiter.xml', ''),
(65, 4, 0, 'JA Showcase component for Joomla 1.7', '', 'com_jashowcase', 'component', '', 1, '1.1.0', '', 'http://update.joomlart.com/service/tracking/j16/com_jashowcase.xml', ''),
(66, 4, 0, 'JA Voice Package for Joomla 2.5 & 3.x', '', 'com_javoice', 'component', '', 1, '1.1.0', '', 'http://update.joomlart.com/service/tracking/j16/com_javoice.xml', ''),
(67, 4, 0, 'Theme Fixel for Easyblog J25 & J30', '', 'easyblog_theme_fixel', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/easyblog_theme_fixel.xml', ''),
(68, 4, 0, 'Theme Magz for Easyblog J25 & J30', '', 'easyblog_theme_magz', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/easyblog_theme_magz.xml', ''),
(69, 4, 0, 'JA Muzic Theme for EasyBlog', '', 'easyblog_theme_muzic', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/easyblog_theme_muzic.xml', ''),
(70, 4, 0, 'JA Anion template for Joomla 2.5', '', 'ja_anion', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_anion.xml', ''),
(71, 4, 0, 'JA Argo Template', '', 'ja_argo', 'template', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_argo.xml', ''),
(72, 4, 0, 'JA Beranis Template', '', 'ja_beranis', 'template', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_beranis.xml', ''),
(73, 4, 0, 'JA Bistro Template for Joomla 2.5', '', 'ja_bistro', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_bistro.xml', ''),
(74, 4, 0, 'JA Blazes Template for J25 & J31', '', 'ja_blazes', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_blazes.xml', ''),
(75, 4, 0, 'JA Brisk Template', '', 'ja_brisk', 'template', '', 0, '1.0.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_brisk.xml', ''),
(76, 4, 0, 'JA Business Template for Joomla 2.5', '', 'ja_business', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_business.xml', ''),
(77, 4, 0, 'JA Cloris Template for Joomla 2.5.x', '', 'ja_cloris', 'template', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_cloris.xml', ''),
(78, 4, 0, 'JA Community PLus Template for Joomla 2.5', '', 'ja_community_plus', 'template', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_community_plus.xml', ''),
(79, 4, 0, 'JA Droid Template for Joomla 2.5', '', 'ja_droid', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_droid.xml', ''),
(80, 4, 0, 'JA Edenite Template for J25 & J30', '', 'ja_edenite', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_edenite.xml', ''),
(81, 4, 0, 'JA Elastica Template for Joomla 2.5', '', 'ja_elastica', 'template', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_elastica.xml', ''),
(82, 4, 0, 'JA Erio Template for Joomla 2.5 & 3.1', '', 'ja_erio', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_erio.xml', ''),
(83, 4, 0, 'Ja Events Template for Joomla 2.5', '', 'ja_events', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_events.xml', ''),
(84, 4, 0, 'JA Fubix Template for J25 & J30', '', 'ja_fubix', 'template', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_fubix.xml', ''),
(85, 4, 0, 'JA Graphite Template for Joomla 2.5', '', 'ja_graphite', 'template', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_graphite.xml', ''),
(86, 4, 0, 'JA Hawkstore Template', '', 'ja_hawkstore', 'template', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/ja_hawkstore.xml', ''),
(87, 4, 0, 'JA Ironis Template for Joomla 2.5 & 3.1', '', 'ja_ironis', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_ironis.xml', ''),
(88, 4, 0, 'JA Kranos Template for J25 & J30', '', 'ja_kranos', 'template', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_kranos.xml', ''),
(89, 4, 0, 'JA Lens Template for Joomla 2.5 & 3.1', '', 'ja_lens', 'template', '', 0, '1.0.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_lens.xml', ''),
(90, 4, 0, 'Ja Lime Template for Joomla 2.5 & J31', '', 'ja_lime', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_lime.xml', ''),
(91, 4, 0, 'JA Magz Template', '', 'ja_magz', 'template', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/ja_magz.xml', ''),
(92, 4, 0, 'JA Mendozite Template for J25 & J30', '', 'ja_mendozite', 'template', '', 0, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_mendozite.xml', ''),
(93, 4, 0, 'JA Mero Template', '', 'ja_mero', 'template', '', 0, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_mero.xml', ''),
(94, 4, 0, 'JA Mers Template for J25 & J30', '', 'ja_mers', 'template', '', 0, '1.0.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_mers.xml', ''),
(95, 4, 0, 'JA Methys Template for Joomla 2.5', '', 'ja_methys', 'template', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_methys.xml', ''),
(96, 4, 0, 'Ja Minisite Template for Joomla 2.5', '', 'ja_minisite', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_minisite.xml', ''),
(97, 4, 0, 'JA Mitius Template', '', 'ja_mitius', 'template', '', 0, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_mitius.xml', ''),
(98, 4, 0, 'JA Mixmaz Template', '', 'ja_mixmaz', 'template', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/ja_mixmaz.xml', ''),
(99, 4, 0, 'JA Nex Template for J25 & J30', '', 'ja_nex', 'template', '', 0, '2.5.9', '', 'http://update.joomlart.com/service/tracking/j16/ja_nex.xml', ''),
(100, 4, 0, 'JA Nex T3 Template', '', 'ja_nex_t3', 'template', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/ja_nex_t3.xml', ''),
(101, 4, 0, 'JA Norite Template for J2.5 & J31', '', 'ja_norite', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_norite.xml', ''),
(102, 4, 0, 'JA Onepage Template', '', 'ja_onepage', 'template', '', 0, '1.0.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_onepage.xml', ''),
(103, 4, 0, 'JA ores template for Joomla 2.5 & 3.1', '', 'ja_ores', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_ores.xml', ''),
(104, 4, 0, 'JA Orisite Template  for J25 & J30', '', 'ja_orisite', 'template', '', 0, '1.1.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_orisite.xml', ''),
(105, 4, 0, 'JA Portfolio Real Estate template for Joomla 1.6.x', '', 'ja_portfolio', 'file', '', 0, '1.0.0 beta', '', 'http://update.joomlart.com/service/tracking/j16/ja_portfolio.xml', ''),
(106, 4, 0, 'JA Portfolio Template for Joomla 2.5', '', 'ja_portfolio_real_estate', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_portfolio_real_estate.xml', ''),
(107, 4, 0, 'JA Puresite Template for J25 & J31', '', 'ja_puresite', 'template', '', 0, '1.0.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_puresite.xml', ''),
(108, 4, 0, 'JA Puresite Template for J25 & J31', '', 'ja_puresite', 'template', '', 0, '1.0.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_puresite.xml', ''),
(109, 4, 0, 'JA Purity II template for Joomla 2.5', '', 'ja_purity_ii', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_purity_ii.xml', ''),
(110, 4, 0, 'JA Pyro Template for Joomla 2.5', '', 'ja_pyro', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_pyro.xml', ''),
(111, 4, 0, 'JA Pyro Template for Joomla 2.5', '', 'ja_pyro', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_pyro.xml', ''),
(112, 4, 0, 'JA Rasite Template for J2.5 & J31', '', 'ja_rasite', 'template', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_rasite.xml', ''),
(113, 4, 0, 'JA Rave Template for Joomla 2.5', '', 'ja_rave', 'template', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_rave.xml', ''),
(114, 4, 0, 'JA Smashboard Template', '', 'ja_smashboard', 'template', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_smashboard.xml', ''),
(115, 4, 0, 'JA Social Template for Joomla 2.5', '', 'ja_social', 'template', '', 0, '2.5.8', '', 'http://update.joomlart.com/service/tracking/j16/ja_social.xml', ''),
(116, 4, 0, 'JA Social T3 j25', '', 'ja_social_ii', 'template', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/ja_social_ii.xml', ''),
(117, 4, 0, 'JA System Pager Plugin for J25 & J30', '', 'ja_system_japager', 'plugin', 'ja_system_japager', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_system_japager.xml', ''),
(118, 4, 0, 'JA T3V2 Blank Template', '', 'ja_t3_blank', 'template', '', 0, '2.5.7', '', 'http://update.joomlart.com/service/tracking/j16/ja_t3_blank.xml', ''),
(119, 4, 0, 'JA T3 Blank template for joomla 1.6', '', 'ja_t3_blank_j16', 'template', '', 0, '1.0.0 Beta', '', 'http://update.joomlart.com/service/tracking/j16/ja_t3_blank_j16.xml', ''),
(120, 4, 0, 'JA Blank Template for T3v3', '', 'ja_t3v3_blank', 'template', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/ja_t3v3_blank.xml', ''),
(121, 4, 0, 'JA Teline III  Template for Joomla 1.6', '', 'ja_teline_iii', 'file', '', 0, '1.0.0 Beta', '', 'http://update.joomlart.com/service/tracking/j16/ja_teline_iii.xml', ''),
(122, 4, 0, 'JA Teline IV Template for Joomla 2.5', '', 'ja_teline_iv', 'template', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_teline_iv.xml', ''),
(123, 4, 0, 'JA Tiris Template for J25 & J30', '', 'ja_tiris', 'template', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/ja_tiris.xml', ''),
(124, 4, 0, 'JA Travel Template for Joomla 2.5 & 3.0', '', 'ja_travel', 'template', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_travel.xml', ''),
(125, 4, 0, 'JA University Template for J25 & J31', '', 'ja_university', 'template', '', 0, '1.0.5', '', 'http://update.joomlart.com/service/tracking/j16/ja_university.xml', ''),
(126, 4, 0, 'JA Vintas Template for J25 & J31', '', 'ja_vintas', 'template', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/ja_vintas.xml', ''),
(127, 4, 0, 'JA Wall Template for J25 & J30', '', 'ja_wall', 'template', '', 0, '1.0.9', '', 'http://update.joomlart.com/service/tracking/j16/ja_wall.xml', ''),
(128, 4, 0, 'JA ZiteTemplate', '', 'ja_zite', 'template', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/ja_zite.xml', ''),
(129, 4, 0, 'JA Bookmark plugin for Joomla 1.6.x', '', 'jabookmark', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jabookmark.xml', ''),
(130, 4, 0, 'JA Comment plugin for Joomla 1.6.x', '', 'jacomment', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jacomment.xml', ''),
(131, 4, 0, 'JA Comment Off Plugin for Joomla 1.6', '', 'jacommentoff', 'file', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/jacommentoff.xml', ''),
(132, 4, 0, 'JA Comment On Plugin for Joomla 1.6', '', 'jacommenton', 'file', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/jacommenton.xml', ''),
(133, 4, 0, 'JA Content Extra Fields for Joomla 1.6', '', 'jacontentextrafields', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jacontentextrafields.xml', ''),
(134, 4, 0, 'JA Disqus Debate Echo plugin for Joomla 1.6.x', '', 'jadisqus_debate_echo', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jadisqus_debate_echo.xml', ''),
(135, 4, 0, 'JA System Google Map plugin for Joomla 1.6.x', '', 'jagooglemap', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jagooglemap.xml', ''),
(136, 4, 0, 'JA Google Translate plugin for Joomla 1.6.x', '', 'jagoogletranslate', 'plugin', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jagoogletranslate.xml', ''),
(137, 4, 0, 'JA Highslide plugin for Joomla 1.6.x', '', 'jahighslide', 'plugin', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jahighslide.xml', ''),
(138, 4, 0, 'JA K2 Search Plugin for Joomla 2.5', '', 'jak2_filter', 'plugin', '', 0, '1.0.0 Alph', '', 'http://update.joomlart.com/service/tracking/j16/jak2_filter.xml', ''),
(139, 4, 0, 'JA K2 Extra Fields Plugin for Joomla 2.5', '', 'jak2_indexing', 'plugin', '', 0, '1.0.0 Alph', '', 'http://update.joomlart.com/service/tracking/j16/jak2_indexing.xml', ''),
(140, 4, 0, 'JA Load module Plugin for Joomla 2.5', '', 'jaloadmodule', 'plugin', 'jaloadmodule', 0, '2.5.1', '', 'http://update.joomlart.com/service/tracking/j16/jaloadmodule.xml', ''),
(141, 4, 0, 'JA System Nrain plugin for Joomla 1.6.x', '', 'janrain', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/janrain.xml', ''),
(142, 4, 0, 'JA Popup plugin for Joomla 1.6', '', 'japopup', 'file', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/japopup.xml', ''),
(143, 4, 0, 'JA System Social plugin for Joomla 1.7', '', 'jasocial', 'file', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/jasocial.xml', ''),
(144, 4, 0, 'JA T3 System plugin for Joomla 1.6', '', 'jat3', 'plugin', '', 0, '1.0.0 Beta', '', 'http://update.joomlart.com/service/tracking/j16/jat3.xml', ''),
(145, 4, 0, 'JA Tabs plugin for Joomla 1.6.x', '', 'jatabs', 'plugin', 'jatabs', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/jatabs.xml', ''),
(146, 4, 0, 'JA Typo plugin For Joomla 1.6', '', 'jatypo', 'plugin', 'jatypo', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jatypo.xml', ''),
(147, 4, 0, 'Jomsocial Theme 3.x for JA Social', '', 'jomsocial_theme_social', 'custom', '', 0, '3.0.1', '', 'http://update.joomlart.com/service/tracking/j16/jomsocial_theme_social.xml', ''),
(148, 4, 0, 'JA Jomsocial theme for Joomla 2.5', '', 'jomsocial_theme_social_j16', 'file', '', 0, '2.5.1', '', 'http://update.joomlart.com/service/tracking/j16/jomsocial_theme_social_j16.xml', ''),
(149, 4, 0, 'JA Jomsocial theme for Joomla 2.5', '', 'jomsocial_theme_social_j16_26', 'custom', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/jomsocial_theme_social_j16_26.xml', ''),
(150, 4, 0, 'JShopping Template for Ja Orisite', '', 'jshopping_theme_orisite', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jshopping_theme_orisite.xml', ''),
(151, 4, 0, 'JA Tiris Jshopping theme for J25 & J30', '', 'jshopping_theme_tiris', 'custom', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/jshopping_theme_tiris.xml', ''),
(152, 4, 0, 'Theme for Jshopping j17', '', 'jshopping_theme_tiris_j17', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/jshopping_theme_tiris_j17.xml', ''),
(153, 4, 0, 'JA Kranos kunena theme for Joomla 2.5', '', 'kunena_theme_kranos_j17', 'custom', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_kranos_j17.xml', ''),
(154, 4, 0, 'Kunena Template for JA Mendozite', '', 'kunena_theme_mendozite', 'custom', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_mendozite.xml', ''),
(155, 4, 0, 'JA Mitius Kunena Theme for Joomla 25 ', '', 'kunena_theme_mitius', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_mitius.xml', ''),
(156, 4, 0, 'Kunena theme for JA Nex J2.5', '', 'kunena_theme_nex_j17', 'custom', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_nex_j17.xml', ''),
(157, 4, 0, 'Kunena theme for JA Nex T3', '', 'kunena_theme_nex_t3', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_nex_t3.xml', ''),
(158, 4, 0, 'Kunena Template for Ja Orisite', '', 'kunena_theme_orisite', 'custom', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_orisite.xml', ''),
(159, 4, 0, 'Kunena theme for JA Social T3 2.5', '', 'kunena_theme_social', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_social.xml', ''),
(160, 4, 0, 'Kunena theme for Joomla 2.5', '', 'kunena_theme_social_j16', 'custom', '', 0, '2.5.1', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_social_j16.xml', ''),
(161, 4, 0, 'JA Tiris kunena theme for Joomla 2.5', '', 'kunena_theme_tiris_j16', 'custom', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/kunena_theme_tiris_j16.xml', ''),
(162, 4, 0, 'JA Jobs Tags module for Joomla 2.5', '', 'mod_ja_jobs_tags', 'module', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_ja_jobs_tags.xml', ''),
(163, 4, 0, 'JA Accordion Module for J25 & J31', '', 'mod_jaaccordion', 'module', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaaccordion.xml', ''),
(164, 4, 0, 'JA Animation module for Joomla 2.5 & 3.0', '', 'mod_jaanimation', 'module', '', 0, '2.5.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaanimation.xml', ''),
(165, 4, 0, 'JA Bulletin Module for J25 & J31', '', 'mod_jabulletin', 'module', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/mod_jabulletin.xml', ''),
(166, 4, 0, 'JA Latest Comment Module for Joomla 2.5 & 3.0', '', 'mod_jaclatest_comments', 'module', '', 0, '2.5.3', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaclatest_comments.xml', ''),
(167, 4, 0, 'JA Content Popup Module for J25 & J31', '', 'mod_jacontentpopup', 'module', '', 0, '1.0.6', '', 'http://update.joomlart.com/service/tracking/j16/mod_jacontentpopup.xml', ''),
(168, 4, 0, 'JA Content Scroll module for Joomla 1.6', '', 'mod_jacontentscroll', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_jacontentscroll.xml', ''),
(169, 4, 0, 'JA Contenslider module for Joomla 1.6', '', 'mod_jacontentslide', 'file', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_jacontentslide.xml', ''),
(170, 4, 0, 'JA Content Slider Module for J25 & J31', '', 'mod_jacontentslider', 'module', '', 0, '2.6.5', '', 'http://update.joomlart.com/service/tracking/j16/mod_jacontentslider.xml', ''),
(171, 4, 0, 'JA CountDown Module for J25 & J31', '', 'mod_jacountdown', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jacountdown.xml', ''),
(172, 4, 0, 'JA Facebook Activity Module for J25 & J30', '', 'mod_jafacebookactivity', 'module', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/mod_jafacebookactivity.xml', ''),
(173, 4, 0, 'JA Facebook Like Box Module for J25 & J30', '', 'mod_jafacebooklikebox', 'module', '', 0, '2.5.7', '', 'http://update.joomlart.com/service/tracking/j16/mod_jafacebooklikebox.xml', ''),
(174, 4, 0, 'JA Featured Employer module for Joomla 2.5', '', 'mod_jafeatured_employer', 'module', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_jafeatured_employer.xml', ''),
(175, 4, 0, 'JA Filter Jobs module for Joomla 2.5', '', 'mod_jafilter_jobs', 'module', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/mod_jafilter_jobs.xml', ''),
(176, 4, 0, 'JA flowlist module for Joomla 2.5 & 3.0', '', 'mod_jaflowlist', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaflowlist.xml', ''),
(177, 4, 0, 'JAEC Halloween Module for Joomla 2.5 & 3.0', '', 'mod_jahalloween', 'module', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_jahalloween.xml', ''),
(178, 4, 0, 'JA Image Hotspot Module for Joomla 2.5 & 3.1', '', 'mod_jaimagehotspot', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaimagehotspot.xml', ''),
(179, 4, 0, 'JA static module for Joomla 2.5', '', 'mod_jajb_statistic', 'module', '', 0, '1.0.0 stab', '', 'http://update.joomlart.com/service/tracking/j16/mod_jajb_statistic.xml', ''),
(180, 4, 0, 'JA Jobboard Menu module for Joomla 2.5', '', 'mod_jajobboard_menu', 'module', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/mod_jajobboard_menu.xml', ''),
(181, 4, 0, 'JA Jobs Counter module for Joomla 2.5', '', 'mod_jajobs_counter', 'module', '', 0, '1.0.3', '', 'http://update.joomlart.com/service/tracking/j16/mod_jajobs_counter.xml', ''),
(182, 4, 0, 'JA Jobs Map module for Joomla 2.5', '', 'mod_jajobs_map', 'module', '', 0, '1.0.4', '', 'http://update.joomlart.com/service/tracking/j16/mod_jajobs_map.xml', ''),
(183, 4, 0, 'JA K2 Fillter Module for Joomla 2.5', '', 'mod_jak2_filter', 'module', '', 0, '1.0.0 Alph', '', 'http://update.joomlart.com/service/tracking/j16/mod_jak2_filter.xml', ''),
(184, 4, 0, 'JA K2 Filter Module for J25 & J31', '', 'mod_jak2filter', 'module', '', 0, '1.0.9', '', 'http://update.joomlart.com/service/tracking/j16/mod_jak2filter.xml', ''),
(185, 4, 0, 'JA K2 Timeline', '', 'mod_jak2timeline', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jak2timeline.xml', ''),
(186, 4, 0, 'JA Latest Resumes module for Joomla 2.5', '', 'mod_jalatest_resumes', 'module', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_jalatest_resumes.xml', ''),
(187, 4, 0, 'JA List Employer module for Joomla 2.5', '', 'mod_jalist_employers', 'module', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_jalist_employers.xml', ''),
(188, 4, 0, 'JA List Jobs module for Joomla 2.5', '', 'mod_jalist_jobs', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jalist_jobs.xml', ''),
(189, 4, 0, 'JA List Resumes module for Joomla 2.5', '', 'mod_jalist_resumes', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jalist_resumes.xml', ''),
(190, 4, 0, 'JA Login module for J25 & J31', '', 'mod_jalogin', 'module', '', 0, '2.5.8', '', 'http://update.joomlart.com/service/tracking/j16/mod_jalogin.xml', ''),
(191, 4, 0, 'JA Masshead Module for J25 & J31', '', 'mod_jamasshead', 'module', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/mod_jamasshead.xml', ''),
(192, 4, 0, 'JA News Featured Module for J25 & J31', '', 'mod_janews_featured', 'module', '', 0, '2.5.6', '', 'http://update.joomlart.com/service/tracking/j16/mod_janews_featured.xml', ''),
(193, 4, 0, 'JA Newsflash module for Joomla 1.6.x', '', 'mod_janewsflash', 'module', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_janewsflash.xml', ''),
(194, 4, 0, 'JA Newsmoo module for Joomla 1.6.x', '', 'mod_janewsmoo', 'module', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_janewsmoo.xml', ''),
(195, 4, 0, 'JA News Pro Module for J25 & J31', '', 'mod_janewspro', 'module', '', 0, '2.5.7', '', 'http://update.joomlart.com/service/tracking/j16/mod_janewspro.xml', ''),
(196, 4, 0, 'JA Newsticker Module for J25 & J31', '', 'mod_janewsticker', 'module', '', 0, '2.5.7', '', 'http://update.joomlart.com/service/tracking/j16/mod_janewsticker.xml', ''),
(197, 4, 0, 'JA Quick Contact Module for J25 & J31', '', 'mod_jaquickcontact', 'module', '', 0, '2.5.5', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaquickcontact.xml', ''),
(198, 4, 0, 'JA Recent Viewed Jobs module for Joomla 2.5', '', 'mod_jarecent_viewed_jobs', 'module', '', 0, '1.0.0 stab', '', 'http://update.joomlart.com/service/tracking/j16/mod_jarecent_viewed_jobs.xml', ''),
(199, 4, 0, 'JA SideNews Module for J25 & J31', '', 'mod_jasidenews', 'module', '', 0, '2.6.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jasidenews.xml', ''),
(200, 4, 0, 'JA Slideshow Module for J25 & J31', '', 'mod_jaslideshow', 'module', '', 0, '2.6.4', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaslideshow.xml', ''),
(201, 4, 0, 'JA Slideshow Lite Module for J25 & J31', '', 'mod_jaslideshowlite', 'module', '', 0, '1.1.8', '', 'http://update.joomlart.com/service/tracking/j16/mod_jaslideshowlite.xml', ''),
(202, 4, 0, 'JA Soccerway Module for J25 & J31', '', 'mod_jasoccerway', 'module', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_jasoccerway.xml', ''),
(203, 4, 0, 'JA Tab module for Joomla 2.5', '', 'mod_jatabs', 'module', '', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/mod_jatabs.xml', ''),
(204, 4, 0, 'JA Toppanel Module for Joomla 2.5', '', 'mod_jatoppanel', 'module', '', 0, '2.5.4', '', 'http://update.joomlart.com/service/tracking/j16/mod_jatoppanel.xml', ''),
(205, 4, 0, 'JA Twitter Module for J25 & J31', '', 'mod_jatwitter', 'module', '', 0, '2.5.8', '', 'http://update.joomlart.com/service/tracking/j16/mod_jatwitter.xml', ''),
(206, 4, 0, 'JA List of Voices Module for J2.5 & J3.x', '', 'mod_javlist_voices', 'module', '', 0, '1.1.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_javlist_voices.xml', ''),
(207, 4, 0, 'JA VMProducts Module', '', 'mod_javmproducts', 'module', '', 0, '1.0.2', '', 'http://update.joomlart.com/service/tracking/j16/mod_javmproducts.xml', ''),
(208, 4, 0, 'JA Voice  Work Flow Module for J2.5 & J3.x', '', 'mod_javwork_flow', 'module', '', 0, '1.1.0', '', 'http://update.joomlart.com/service/tracking/j16/mod_javwork_flow.xml', ''),
(209, 4, 0, 'JA Amazon S3 Button Plugin for joomla 2.5 & 3.1', '', 'jaamazons3', 'plugin', 'button', 0, '1.0.1', '', 'http://update.joomlart.com/service/tracking/j16/plg_button_jaamazons3.xml', ''),
(210, 4, 0, 'JA AVTracklist Button plugin for J2.5 & J3.1', '', 'jaavtracklist', 'plugin', 'button', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_button_jaavtracklist.xml', ''),
(211, 4, 0, 'JA AVTracklist Button plugin for J2.5 & J3.1', '', 'jaavtracklist', 'plugin', 'button', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_button_jaavtracklist.xml', ''),
(212, 4, 0, 'JA Comment Off Plugin for Joomla 2.5 & 3.0', '', 'jacommentoff', 'plugin', 'button', 0, '2.5.2', '', 'http://update.joomlart.com/service/tracking/j16/plg_button_jacommentoff.xml', ''),
(213, 4, 0, 'JA Comment On Plugin for Joomla 2.5 & 3.0', '', 'jacommenton', 'plugin', 'button', 0, '2.5.1', '', 'http://update.joomlart.com/service/tracking/j16/plg_button_jacommenton.xml', ''),
(214, 4, 0, 'JA Comment On Plugin for Joomla 2.5 & 3.0', '', 'jacommenton', 'plugin', 'button', 0, '2.5.1', '', 'http://update.joomlart.com/service/tracking/j16/plg_button_jacommenton.xml', ''),
(215, 4, 0, 'JA Amazon S3 System plugin for joomla 2.5 & 3.1', '', 'plg_jaamazons3', 'plugin', 'plg_jaamazons3', 0, '2.5.2', '', 'http://update.joomlart.com/service/tracking/j16/plg_jaamazons3.xml', ''),
(216, 4, 0, 'JA AVTracklist plugin for J2.5 & J3.1', '', 'plg_jaavtracklist', 'plugin', 'plg_jaavtracklist', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/plg_jaavtracklist.xml', ''),
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
(250, 4, 0, 'Thirdparty Extensions Compatibility Bundle', '', 'thirdparty_exts_compatibility', 'custom', '', 0, '1.0.0', '', 'http://update.joomlart.com/service/tracking/j16/thirdparty_exts_compatibility.xml', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Update Sites' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `i8a13_update_sites`
--

INSERT INTO `i8a13_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`) VALUES
(1, 'Joomla Core', 'collection', 'http://update.joomla.org/core/list.xml', 1, 1382543180),
(2, 'Joomla Extension Directory', 'collection', 'http://update.joomla.org/jed/list.xml', 1, 1382543180),
(3, 'Accredited Joomla! Translations', 'collection', 'http://update.joomla.org/language/translationlist_3.xml', 1, 1382543180),
(4, '', 'collection', 'http://update.joomlart.com/service/tracking/list.xml', 1, 1382543180);

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
(4, 10001);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=554 ;

--
-- Dumping data for table `i8a13_users`
--

INSERT INTO `i8a13_users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`) VALUES
(553, 'Super User', 'admin', 'trungqt2005@gmail.com', '5ecf74adf5e87c39f3ef7f80649c2877:stPxhQ60xMDAFo1LAlP9WB0NBLOt7GYP', 0, 1, '2013-10-23 05:38:05', '2013-10-23 15:46:14', '0', '', '0000-00-00 00:00:00', 0);

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
(553, 8);

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
