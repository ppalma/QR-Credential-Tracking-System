-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 24, 2011 at 03:20 PM
-- Server version: 5.1.47
-- PHP Version: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `QR-Credential-Tracking-System`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendees`
--

CREATE TABLE IF NOT EXISTS `attendees` (
  `id_attende` char(36) COLLATE utf8_bin NOT NULL,
  `id` char(36) COLLATE utf8_bin NOT NULL,
  `id_type` char(36) COLLATE utf8_bin NOT NULL,
  `rut_attendee` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `name_attendee` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `user` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_attende`),
  KEY `FK_ATTENDEES_USERS` (`id`),
  KEY `FK_TYPES_ATTENDEES` (`id_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `attendees`
--


-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` char(36) COLLATE utf8_bin NOT NULL,
  `name` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


-- --------------------------------------------------------

--
-- Table structure for table `groups_permissions`
--

CREATE TABLE IF NOT EXISTS `groups_permissions` (
  `group_id` char(36) COLLATE utf8_bin NOT NULL,
  `permission_id` char(36) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`group_id`,`permission_id`),
  KEY `FK_GROUPS_PERMISSIONS2` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



-- --------------------------------------------------------

--
-- Table structure for table `groups_users`
--

CREATE TABLE IF NOT EXISTS `groups_users` (
  `group_id` char(36) COLLATE utf8_bin NOT NULL,
  `user_id` char(36) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `FK_GROUPS_USERS2` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` char(36) COLLATE utf8_bin NOT NULL,
  `name` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



-- --------------------------------------------------------

--
-- Table structure for table `ranges`
--

CREATE TABLE IF NOT EXISTS `ranges` (
  `id` char(36) COLLATE utf8_bin NOT NULL,
  `name` char(50) COLLATE utf8_bin DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `ranges`
--


-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE IF NOT EXISTS `rooms` (
  `id` char(36) COLLATE utf8_bin NOT NULL,
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `rooms`
--


-- --------------------------------------------------------

--
-- Table structure for table `rooms_users`
--

CREATE TABLE IF NOT EXISTS `rooms_users` (
  `room_id` char(36) COLLATE utf8_bin NOT NULL,
  `user_id` char(36) COLLATE utf8_bin NOT NULL,
  `attend`  TIMESTAMP NOT NULL,
  PRIMARY KEY (`room_id`,`user_id`),
  KEY `FK_ROOMS_USERS2` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `rooms_users`
--


-- --------------------------------------------------------

--
-- Table structure for table `singers`
--

CREATE TABLE IF NOT EXISTS `singers` (
  `range_id` char(36) COLLATE utf8_bin NOT NULL,
  `singer_id` char(36) COLLATE utf8_bin NOT NULL,
  `total_score` int(11) DEFAULT NULL,
  PRIMARY KEY (`singer_id`),
  KEY `FK_RANGES_SINGERS` (`range_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `singers`
--


-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE IF NOT EXISTS `songs` (
  `id` char(36) COLLATE utf8_bin NOT NULL,
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `songs`
--


-- --------------------------------------------------------

--
-- Table structure for table `songs_singers`
--

CREATE TABLE IF NOT EXISTS `songs_singers` (
  `song_id` char(36) COLLATE utf8_bin NOT NULL,
  `singer_id` char(36) COLLATE utf8_bin NOT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`song_id`),
  KEY `FK_SONGS_SINGERS` (`singer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `songs_singers`
--


-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE IF NOT EXISTS `types` (
  `id` char(36) COLLATE utf8_bin NOT NULL,
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `types`
--


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` char(36) COLLATE utf8_bin NOT NULL,
  `username` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `email_address` varchar(127) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `active` smallint(6) DEFAULT NULL,
  `rut` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `name_user` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `institution` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


--
-- Dumping data for table `permissions`
--

 INSERT INTO `permissions` (`id`, `name`, `created`, `modified`) VALUES
('4db47029-4550-4d70-8f68-1e2aa457f137', '*', '2011-04-24 18:47:05', '2011-04-24 18:47:05'),
('4db47036-1f70-432c-aec9-1e2ba457f137', 'users:index', '2011-04-24 18:47:18', '2011-04-24 18:47:18');

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `created`, `modified`) VALUES
('4db47041-6de0-42a4-b02a-22c6a457f137', 'System Developers', '2011-04-24 18:47:29', '2011-04-24 18:47:29'),
('4db47049-9be0-49e4-93d9-1e2da457f137', 'Guest', '2011-04-24 18:47:37', '2011-04-24 18:47:37');

--
-- Dumping data for table `groups_permissions`
--

INSERT INTO `groups_permissions` (`group_id`, `permission_id`) VALUES
('4db47041-6de0-42a4-b02a-22c6a457f137', '4db47029-4550-4d70-8f68-1e2aa457f137'),
('4db47049-9be0-49e4-93d9-1e2da457f137', '4db47036-1f70-432c-aec9-1e2ba457f137');


--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email_address`, `password`, `active`, `rut`, `name_user`, `institution`, `created`, `modified`) VALUES
('4db4705a-fd98-4194-8be5-1e2ca457f137', 'admin', 'admin@admin.cl', '8f2ac97b65681833dd57301f3b5b3da0397b8f77', 1, NULL, NULL, NULL, '2011-04-24 18:47:54', '2011-04-24 18:48:11');

--
-- Dumping data for table `groups_users`
--


INSERT INTO `groups_users` (`group_id`, `user_id`) VALUES
('4db47041-6de0-42a4-b02a-22c6a457f137', '4db4705a-fd98-4194-8be5-1e2ca457f137');


