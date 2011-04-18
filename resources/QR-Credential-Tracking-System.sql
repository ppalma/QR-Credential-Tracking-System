-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 17, 2011 at 10:53 PM
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
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `created`, `modified`) VALUES
('4da63a3d-f5ac-4191-959b-0a66a457f137', 'System Developers', '2011-04-14 00:05:17', '2011-04-14 00:05:17'),
('4dab80fd-7fd0-42fd-984c-24d6a457f137', 'Guest', '2011-04-18 00:08:29', '2011-04-18 00:08:39');

-- --------------------------------------------------------

--
-- Table structure for table `groups_permissions`
--

CREATE TABLE IF NOT EXISTS `groups_permissions` (
  `group_id` char(36) NOT NULL,
  `permission_id` char(36) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups_permissions`
--

INSERT INTO `groups_permissions` (`group_id`, `permission_id`) VALUES
('4da63a3d-f5ac-4191-959b-0a66a457f137', '4da63a15-bb28-4c8c-ae3d-0a61a457f137'),
('4dab80fd-7fd0-42fd-984c-24d6a457f137', '4dab80e3-d8f0-4f32-a257-24d6a457f137');

-- --------------------------------------------------------

--
-- Table structure for table `groups_users`
--

CREATE TABLE IF NOT EXISTS `groups_users` (
  `group_id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups_users`
--

INSERT INTO `groups_users` (`group_id`, `user_id`) VALUES
('4da63a3d-f5ac-4191-959b-0a66a457f137', '4da636cd-8b78-40f8-a205-0a61a457f137'),
('4da63a3d-f5ac-4191-959b-0a66a457f137', '4daa455f-6248-47af-a5b9-110fa457f137'),
('4da63a3d-f5ac-4191-959b-0a66a457f137', '4daa4906-0174-4cbc-999c-110fa457f137'),
('4dab80fd-7fd0-42fd-984c-24d6a457f137', '4dab9a57-f3e0-462c-b87c-24d6a457f137'),
('4dab80fd-7fd0-42fd-984c-24d6a457f137', '4dab947c-0ef0-47fd-86ff-24d6a457f137');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` char(36) NOT NULL,
  `name` varchar(40) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `created`, `modified`) VALUES
('4da63a15-bb28-4c8c-ae3d-0a61a457f137', '*', '2011-04-14 00:04:37', '2011-04-14 00:04:37'),
('4dab80e3-d8f0-4f32-a257-24d6a457f137', 'users:index', '2011-04-18 00:08:03', '2011-04-18 00:08:03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` char(36) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email_address` varchar(127) NOT NULL,
  `password` varchar(40) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email_address`, `password`, `active`, `created`, `modified`) VALUES
('4daa4906-0174-4cbc-999c-110fa457f137', 'ppalma', 'mail@ppalma.cl', '8f2ac97b65681833dd57301f3b5b3da0397b8f77', 1, '2011-04-17 01:57:26', '2011-04-17 01:57:40');
