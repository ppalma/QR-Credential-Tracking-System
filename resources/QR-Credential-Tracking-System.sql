-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 17, 2011 at 01:06 AM
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
  `id` char(36) COLLATE utf8_bin NOT NULL,
  `type_id` char(36) COLLATE utf8_bin NOT NULL,
  `rut` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `user_id` char(36) COLLATE utf8_bin DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `attendees`
--

INSERT INTO `attendees` (`id`, `type_id`, `rut`, `name`, `user_id`, `status`) VALUES
('4dd1fcc5-e080-4089-ac89-0aa6a457f137', '4dd1ed95-fd98-4238-9225-0aa3a457f137', '12345678-5', 'Juanito Perez', '4db4705a-fd98-4194-8be5-1e2ca457f137', NULL),
('4dd1fcd5-4610-4991-a5f6-0aa7a457f137', '4dd1edb2-4fb0-40ac-930e-0aa5a457f137', '16320457-6', 'ppalma', '4db489ed-9108-4845-8a42-1e2ba457f137', NULL);

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

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `created`, `modified`) VALUES
('4db47041-6de0-42a4-b02a-22c6a457f137', 'System Developers', '2011-04-24 18:47:29', '2011-04-24 18:47:29'),
('4db47049-9be0-49e4-93d9-1e2da457f137', 'Guest', '2011-04-24 18:47:37', '2011-05-17 04:34:16');

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

--
-- Dumping data for table `groups_permissions`
--

INSERT INTO `groups_permissions` (`group_id`, `permission_id`) VALUES
('4db47041-6de0-42a4-b02a-22c6a457f137', '4db47029-4550-4d70-8f68-1e2aa457f137'),
('4db47049-9be0-49e4-93d9-1e2da457f137', '4dc457c4-4b94-413a-8c7c-5224a457f137'),
('4db47049-9be0-49e4-93d9-1e2da457f137', '4dc457d0-76c4-4b50-bf0c-5225a457f137'),
('4db47049-9be0-49e4-93d9-1e2da457f137', '4dc457dc-73dc-485b-b5b5-5223a457f137'),
('4db47049-9be0-49e4-93d9-1e2da457f137', '4dc457e6-1500-45ba-842c-5221a457f137'),
('4db47049-9be0-49e4-93d9-1e2da457f137', '4dd1fb22-c9b0-466a-b4b4-0aa6a457f137');

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

--
-- Dumping data for table `groups_users`
--

INSERT INTO `groups_users` (`group_id`, `user_id`) VALUES
('4db47041-6de0-42a4-b02a-22c6a457f137', '4db4705a-fd98-4194-8be5-1e2ca457f137'),
('4db47049-9be0-49e4-93d9-1e2da457f137', '4db489ed-9108-4845-8a42-1e2ba457f137');

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

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `created`, `modified`) VALUES
('4db47029-4550-4d70-8f68-1e2aa457f137', '*', '2011-04-24 18:47:05', '2011-04-24 18:47:05'),
('4db47036-1f70-432c-aec9-1e2ba457f137', 'users:index', '2011-04-24 18:47:18', '2011-04-24 18:47:18'),
('4db4e7bd-5ac4-4e06-bcb8-2fcba457f137', 'users:add', '2011-04-25 03:17:17', '2011-04-25 03:17:17'),
('4dc4578a-bbc4-4799-bcef-5223a457f137', 'attendees:*', '2011-05-06 20:18:18', '2011-05-17 04:32:44'),
('4dc457c4-4b94-413a-8c7c-5224a457f137', 'attendees:index', '2011-05-06 20:19:16', '2011-05-17 04:33:24'),
('4dc457d0-76c4-4b50-bf0c-5225a457f137', 'attendees:view', '2011-05-06 20:19:28', '2011-05-17 04:33:31'),
('4dc457dc-73dc-485b-b5b5-5223a457f137', 'attendees:edit', '2011-05-06 20:19:40', '2011-05-17 04:33:39'),
('4dc457e6-1500-45ba-842c-5221a457f137', 'attendees:delete', '2011-05-06 20:19:50', '2011-05-17 04:33:47'),
('4dd1fb22-c9b0-466a-b4b4-0aa6a457f137', 'attendees:add', '2011-05-17 04:35:46', '2011-05-17 04:35:46');

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

INSERT INTO `types` (`id`, `name`, `created`, `modified`) VALUES
('4dd1ed95-fd98-4238-9225-0aa3a457f137', 'Student', '2011-05-17 03:37:57', '2011-05-17 03:37:57'),
('4dd1edb2-4fb0-40ac-930e-0aa5a457f137', 'Group', '2011-05-17 03:38:26', '2011-05-17 03:38:26'),
('4dd1edba-4d08-43c6-8f9a-0aa4a457f137', 'Normal', '2011-05-17 03:38:34', '2011-05-17 03:38:34');

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
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email_address`, `password`, `active`, `rut`, `name_user`, `institution`, `created`, `modified`) VALUES
('4db4705a-fd98-4194-8be5-1e2ca457f137', 'admin', 'admin@admin.cl', '8f2ac97b65681833dd57301f3b5b3da0397b8f77', 1, NULL, NULL, NULL, '2011-04-24 18:47:54', '2011-04-24 18:48:11'),
('4db489ed-9108-4845-8a42-1e2ba457f137', 'ignis', 'asdasdf@asdf.cl', '8f2ac97b65681833dd57301f3b5b3da0397b8f77', 1, '', '', '', '2011-04-24 20:37:01', '2011-04-24 20:37:01');
