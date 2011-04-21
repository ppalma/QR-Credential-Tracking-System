<<<<<<< HEAD:resources/QR-Credential-Tracking-System.sql
-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.37-1ubuntu5.5


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema `QR-Credential-Tracking-System`
--

CREATE DATABASE IF NOT EXISTS `QR-Credential-Tracking-System`;
USE `QR-Credential-Tracking-System`;

--
-- Definition of table `QR-Credential-Tracking-System`.`attendees`
--

DROP TABLE IF EXISTS `QR-Credential-Tracking-System`.`attendees`;
CREATE TABLE  `QR-Credential-Tracking-System`.`attendees` (
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
-- Dumping data for table `QR-Credential-Tracking-System`.`attendees`
--

/*!40000 ALTER TABLE `attendees` DISABLE KEYS */;
LOCK TABLES `attendees` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `attendees` ENABLE KEYS */;


--
-- Definition of table `QR-Credential-Tracking-System`.`groups`
--

DROP TABLE IF EXISTS `QR-Credential-Tracking-System`.`groups`;
CREATE TABLE  `QR-Credential-Tracking-System`.`groups` (
  `id_group` char(36) COLLATE utf8_bin NOT NULL,
  `name_group` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `created_group` datetime DEFAULT NULL,
  `modified_group` datetime DEFAULT NULL,
  PRIMARY KEY (`id_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `QR-Credential-Tracking-System`.`groups`
--

/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
LOCK TABLES `groups` WRITE;
INSERT INTO `QR-Credential-Tracking-System`.`groups` VALUES  (0x34646136336133642D663561632D343139312D393539622D306136366134353766313337,0x53797374656D20446576656C6F70657273,'2011-04-14 00:05:17','2011-04-14 00:05:17'),
 (0x34646162383066642D376664302D343266642D393834632D323464366134353766313337,0x4775657374,'2011-04-18 00:08:29','2011-04-18 00:08:39');
UNLOCK TABLES;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;


--
-- Definition of table `QR-Credential-Tracking-System`.`groups_permissions`
--

DROP TABLE IF EXISTS `QR-Credential-Tracking-System`.`groups_permissions`;
CREATE TABLE  `QR-Credential-Tracking-System`.`groups_permissions` (
  `id_group` char(36) COLLATE utf8_bin NOT NULL,
  `id_permision` char(36) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_group`,`id_permision`),
  KEY `FK_GROUPS_PERMISSIONS2` (`id_permision`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `QR-Credential-Tracking-System`.`groups_permissions`
--

/*!40000 ALTER TABLE `groups_permissions` DISABLE KEYS */;
LOCK TABLES `groups_permissions` WRITE;
INSERT INTO `QR-Credential-Tracking-System`.`groups_permissions` VALUES  (0x34646136336133642D663561632D343139312D393539622D306136366134353766313337,0x34646136336131352D626232382D346338632D616533642D306136316134353766313337),
 (0x34646162383066642D376664302D343266642D393834632D323464366134353766313337,0x34646162383065332D643866302D346633322D613235372D323464366134353766313337);
UNLOCK TABLES;
/*!40000 ALTER TABLE `groups_permissions` ENABLE KEYS */;


--
-- Definition of table `QR-Credential-Tracking-System`.`groups_users`
--

DROP TABLE IF EXISTS `QR-Credential-Tracking-System`.`groups_users`;
CREATE TABLE  `QR-Credential-Tracking-System`.`groups_users` (
  `id` char(36) COLLATE utf8_bin NOT NULL,
  `id_group` char(36) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`,`id_group`),
  KEY `FK_GROUPS_USERS2` (`id_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `QR-Credential-Tracking-System`.`groups_users`
--

/*!40000 ALTER TABLE `groups_users` DISABLE KEYS */;
LOCK TABLES `groups_users` WRITE;
INSERT INTO `QR-Credential-Tracking-System`.`groups_users` VALUES  (0x34646136336133642D663561632D343139312D393539622D306136366134353766313337,0x34646136333663642D386237382D343066382D613230352D306136316134353766313337),
 (0x34646136336133642D663561632D343139312D393539622D306136366134353766313337,0x34646161343535662D363234382D343761662D613562392D313130666134353766313337),
 (0x34646136336133642D663561632D343139312D393539622D306136366134353766313337,0x34646161343930362D303137342D346362632D393939632D313130666134353766313337),
 (0x34646162383066642D376664302D343266642D393834632D323464366134353766313337,0x34646162393437632D306566302D343766642D383666662D323464366134353766313337),
 (0x34646162383066642D376664302D343266642D393834632D323464366134353766313337,0x34646162396135372D663365302D343632632D623837632D323464366134353766313337);
UNLOCK TABLES;
/*!40000 ALTER TABLE `groups_users` ENABLE KEYS */;


--
-- Definition of table `QR-Credential-Tracking-System`.`permissions`
--

DROP TABLE IF EXISTS `QR-Credential-Tracking-System`.`permissions`;
CREATE TABLE  `QR-Credential-Tracking-System`.`permissions` (
  `id_permision` char(36) COLLATE utf8_bin NOT NULL,
  `name_permis` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `created_permis` datetime DEFAULT NULL,
  `modified_permis` datetime DEFAULT NULL,
  PRIMARY KEY (`id_permision`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `QR-Credential-Tracking-System`.`permissions`
--

/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
LOCK TABLES `permissions` WRITE;
INSERT INTO `QR-Credential-Tracking-System`.`permissions` VALUES  (0x34646136336131352D626232382D346338632D616533642D306136316134353766313337,0x2A,'2011-04-14 00:04:37','2011-04-14 00:04:37'),
 (0x34646162383065332D643866302D346633322D613235372D323464366134353766313337,0x75736572733A696E646578,'2011-04-18 00:08:03','2011-04-18 00:08:03');
UNLOCK TABLES;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;


--
-- Definition of table `QR-Credential-Tracking-System`.`ranges`
--

DROP TABLE IF EXISTS `QR-Credential-Tracking-System`.`ranges`;
CREATE TABLE  `QR-Credential-Tracking-System`.`ranges` (
  `id_range` char(36) COLLATE utf8_bin NOT NULL,
  `name_range` char(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_range`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `QR-Credential-Tracking-System`.`ranges`
--

/*!40000 ALTER TABLE `ranges` DISABLE KEYS */;
LOCK TABLES `ranges` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `ranges` ENABLE KEYS */;


--
-- Definition of table `QR-Credential-Tracking-System`.`rooms`
--

DROP TABLE IF EXISTS `QR-Credential-Tracking-System`.`rooms`;
CREATE TABLE  `QR-Credential-Tracking-System`.`rooms` (
  `id_room` char(36) COLLATE utf8_bin NOT NULL,
  `name_room` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_room`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `QR-Credential-Tracking-System`.`rooms`
--

/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
LOCK TABLES `rooms` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;


--
-- Definition of table `QR-Credential-Tracking-System`.`rooms_users`
--

DROP TABLE IF EXISTS `QR-Credential-Tracking-System`.`rooms_users`;
CREATE TABLE  `QR-Credential-Tracking-System`.`rooms_users` (
  `id_room` char(36) COLLATE utf8_bin NOT NULL,
  `id` char(36) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_room`,`id`),
  KEY `FK_ROOMS_USERS2` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `QR-Credential-Tracking-System`.`rooms_users`
--

/*!40000 ALTER TABLE `rooms_users` DISABLE KEYS */;
LOCK TABLES `rooms_users` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `rooms_users` ENABLE KEYS */;


--
-- Definition of table `QR-Credential-Tracking-System`.`singers`
--

DROP TABLE IF EXISTS `QR-Credential-Tracking-System`.`singers`;
CREATE TABLE  `QR-Credential-Tracking-System`.`singers` (
  `id_range` char(36) COLLATE utf8_bin NOT NULL,
  `id_singer` char(36) COLLATE utf8_bin NOT NULL,
  `total_score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_singer`),
  KEY `FK_RANGES_SINGERS` (`id_range`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `QR-Credential-Tracking-System`.`singers`
--

/*!40000 ALTER TABLE `singers` DISABLE KEYS */;
LOCK TABLES `singers` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `singers` ENABLE KEYS */;


--
-- Definition of table `QR-Credential-Tracking-System`.`songs`
--

DROP TABLE IF EXISTS `QR-Credential-Tracking-System`.`songs`;
CREATE TABLE  `QR-Credential-Tracking-System`.`songs` (
  `id_song` char(36) COLLATE utf8_bin NOT NULL,
  `name_song` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_song`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `QR-Credential-Tracking-System`.`songs`
--

/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
LOCK TABLES `songs` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;


--
-- Definition of table `QR-Credential-Tracking-System`.`songs_singers`
--

DROP TABLE IF EXISTS `QR-Credential-Tracking-System`.`songs_singers`;
CREATE TABLE  `QR-Credential-Tracking-System`.`songs_singers` (
  `id_song` char(36) COLLATE utf8_bin NOT NULL,
  `id_singer` char(36) COLLATE utf8_bin NOT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_song`),
  KEY `FK_SONGS_SINGERS` (`id_singer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `QR-Credential-Tracking-System`.`songs_singers`
--

/*!40000 ALTER TABLE `songs_singers` DISABLE KEYS */;
LOCK TABLES `songs_singers` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `songs_singers` ENABLE KEYS */;


--
-- Definition of table `QR-Credential-Tracking-System`.`types`
--

DROP TABLE IF EXISTS `QR-Credential-Tracking-System`.`types`;
CREATE TABLE  `QR-Credential-Tracking-System`.`types` (
  `id_type` char(36) COLLATE utf8_bin NOT NULL,
  `name_type` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `QR-Credential-Tracking-System`.`types`
--

/*!40000 ALTER TABLE `types` DISABLE KEYS */;
LOCK TABLES `types` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `types` ENABLE KEYS */;


--
-- Definition of table `QR-Credential-Tracking-System`.`users`
--

DROP TABLE IF EXISTS `QR-Credential-Tracking-System`.`users`;
CREATE TABLE  `QR-Credential-Tracking-System`.`users` (
  `id` char(36) COLLATE utf8_bin NOT NULL,
  `username` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `email_address` varchar(127) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `active` smallint(6) DEFAULT NULL,
  `created_user` datetime DEFAULT NULL,
  `modified_user` datetime DEFAULT NULL,
  `rut` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `name_user` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `institution` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `QR-Credential-Tracking-System`.`users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
LOCK TABLES `users` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
=======
-- phpMyAdmin SQL Dump
-- version 2.11.8.1deb5+lenny8
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 20-04-2011 a las 16:43:56
-- Versión del servidor: 5.0.51
-- Versión de PHP: 5.2.6-1+lenny10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
DROP DATABASE `QR-Credential-Tracking-System`;
create database `QR-Credential-Tracking-System`;
use  `QR-Credential-Tracking-System`;


--
-- Base de datos: `QR-Credential-Tracking-System`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ATTENDEES`
--

CREATE TABLE IF NOT EXISTS `ATTENDEES` (
  `ID_ATTENDE` char(36) collate utf8_bin NOT NULL,
  `ID` char(36) collate utf8_bin NOT NULL,
  `ID_TYPE` char(36) collate utf8_bin NOT NULL,
  `RUT_ATTENDEE` varchar(10) collate utf8_bin default NULL,
  `NAME_ATTENDEE` varchar(50) collate utf8_bin default NULL,
  `USER` varchar(10) collate utf8_bin default NULL,
  `STATUS` tinyint(1) default NULL,
  PRIMARY KEY  (`ID_ATTENDE`),
  KEY `FK_ATTENDEES_USERS` (`ID`),
  KEY `FK_TYPES_ATTENDEES` (`ID_TYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcar la base de datos para la tabla `ATTENDEES`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `GROUPS`
--

CREATE TABLE IF NOT EXISTS `GROUPS` (
  `ID_GROUP` char(36) collate utf8_bin NOT NULL,
  `NAME_GROUP` varchar(40) collate utf8_bin default NULL,
  `CREATED_GROUP` datetime default NULL,
  `MODIFIED_GROUP` datetime default NULL,
  PRIMARY KEY  (`ID_GROUP`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcar la base de datos para la tabla `GROUPS`
--

INSERT INTO `GROUPS` (`ID_GROUP`, `NAME_GROUP`, `CREATED_GROUP`, `MODIFIED_GROUP`) VALUES
('4da63a3d-f5ac-4191-959b-0a66a457f137', 'System Developers', '2011-04-14 00:05:17', '2011-04-14 00:05:17'),
('4dab80fd-7fd0-42fd-984c-24d6a457f137', 'Guest', '2011-04-18 00:08:29', '2011-04-18 00:08:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `GROUPS_PERMISSIONS`
--

CREATE TABLE IF NOT EXISTS `GROUPS_PERMISSIONS` (
  `ID_GROUP` char(36) collate utf8_bin NOT NULL,
  `ID_PERMISION` char(36) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`ID_GROUP`,`ID_PERMISION`),
  KEY `FK_GROUPS_PERMISSIONS2` (`ID_PERMISION`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcar la base de datos para la tabla `GROUPS_PERMISSIONS`
--

INSERT INTO `GROUPS_PERMISSIONS` (`ID_GROUP`, `ID_PERMISION`) VALUES
('4da63a3d-f5ac-4191-959b-0a66a457f137', '4da63a15-bb28-4c8c-ae3d-0a61a457f137'),
('4dab80fd-7fd0-42fd-984c-24d6a457f137', '4dab80e3-d8f0-4f32-a257-24d6a457f137');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `GROUPS_USERS`
--

CREATE TABLE IF NOT EXISTS `GROUPS_USERS` (
  `ID` char(36) collate utf8_bin NOT NULL,
  `ID_GROUP` char(36) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`ID`,`ID_GROUP`),
  KEY `FK_GROUPS_USERS2` (`ID_GROUP`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcar la base de datos para la tabla `GROUPS_USERS`
--

INSERT INTO `GROUPS_USERS` (`ID`, `ID_GROUP`) VALUES
('4da63a3d-f5ac-4191-959b-0a66a457f137', '4da636cd-8b78-40f8-a205-0a61a457f137'),
('4da63a3d-f5ac-4191-959b-0a66a457f137', '4daa455f-6248-47af-a5b9-110fa457f137'),
('4da63a3d-f5ac-4191-959b-0a66a457f137', '4daa4906-0174-4cbc-999c-110fa457f137'),
('4dab80fd-7fd0-42fd-984c-24d6a457f137', '4dab947c-0ef0-47fd-86ff-24d6a457f137'),
('4dab80fd-7fd0-42fd-984c-24d6a457f137', '4dab9a57-f3e0-462c-b87c-24d6a457f137');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PERMISSIONS`
--

CREATE TABLE IF NOT EXISTS `PERMISSIONS` (
  `ID_PERMISION` char(36) collate utf8_bin NOT NULL,
  `NAME_PERMIS` varchar(40) collate utf8_bin default NULL,
  `CREATED_PERMIS` datetime default NULL,
  `MODIFIED_PERMIS` datetime default NULL,
  PRIMARY KEY  (`ID_PERMISION`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcar la base de datos para la tabla `PERMISSIONS`
--

INSERT INTO `PERMISSIONS` (`ID_PERMISION`, `NAME_PERMIS`, `CREATED_PERMIS`, `MODIFIED_PERMIS`) VALUES
('4da63a15-bb28-4c8c-ae3d-0a61a457f137', '*', '2011-04-14 00:04:37', '2011-04-14 00:04:37'),
('4dab80e3-d8f0-4f32-a257-24d6a457f137', 'users:index', '2011-04-18 00:08:03', '2011-04-18 00:08:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RANGES`
--

CREATE TABLE IF NOT EXISTS `RANGES` (
  `ID_RANGE` char(36) collate utf8_bin NOT NULL,
  `NAME_RANGE` char(50) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_RANGE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcar la base de datos para la tabla `RANGES`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ROOMS`
--

CREATE TABLE IF NOT EXISTS `ROOMS` (
  `ID_ROOM` char(36) collate utf8_bin NOT NULL,
  `NAME_ROOM` varchar(20) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_ROOM`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcar la base de datos para la tabla `ROOMS`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ROOMS_USERS`
--

CREATE TABLE IF NOT EXISTS `ROOMS_USERS` (
  `ID_ROOM` char(36) collate utf8_bin NOT NULL,
  `ID` char(36) collate utf8_bin NOT NULL,
  PRIMARY KEY  (`ID_ROOM`,`ID`),
  KEY `FK_ROOMS_USERS2` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcar la base de datos para la tabla `ROOMS_USERS`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SINGERS`
--

CREATE TABLE IF NOT EXISTS `SINGERS` (
  `ID_RANGE` char(36) collate utf8_bin NOT NULL,
  `ID_SINGER` char(36) collate utf8_bin NOT NULL,
  `TOTAL_SCORE` int(11) default NULL,
  PRIMARY KEY  (`ID_SINGER`),
  KEY `FK_RANGES_SINGERS` (`ID_RANGE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcar la base de datos para la tabla `SINGERS`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SONGS`
--

CREATE TABLE IF NOT EXISTS `SONGS` (
  `ID_SONG` char(36) collate utf8_bin NOT NULL,
  `NAME_SONG` varchar(50) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_SONG`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcar la base de datos para la tabla `SONGS`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SONGS_SINGERS`
--

CREATE TABLE IF NOT EXISTS `SONGS_SINGERS` (
  `ID_SONG` char(36) collate utf8_bin NOT NULL,
  `ID_SINGER` char(36) collate utf8_bin NOT NULL,
  `SCORE` int(11) default NULL,
  PRIMARY KEY  (`ID_SONG`),
  KEY `FK_SONGS_SINGERS` (`ID_SINGER`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcar la base de datos para la tabla `SONGS_SINGERS`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TYPES`
--

CREATE TABLE IF NOT EXISTS `TYPES` (
  `ID_TYPE` char(36) collate utf8_bin NOT NULL,
  `NAME_TYPE` varchar(50) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_TYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcar la base de datos para la tabla `TYPES`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `USERS`
--

CREATE TABLE IF NOT EXISTS `USERS` (
  `ID` char(36) collate utf8_bin NOT NULL,
  `USERNAME` varchar(20) collate utf8_bin default NULL,
  `EMAIL_ADDRES` varchar(127) collate utf8_bin default NULL,
  `PASSWORD` varchar(40) collate utf8_bin default NULL,
  `ACTIVE` smallint(6) default NULL,
  `CREATED_USER` datetime default NULL,
  `MODIFIED_USER` datetime default NULL,
  `RUT` varchar(10) collate utf8_bin default NULL,
  `NAME_USER` varchar(50) collate utf8_bin default NULL,
  `INSTITUTION` varchar(50) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcar la base de datos para la tabla `USERS`
--

>>>>>>> 671a5d46a3076749e491ac2a3cc4be418f97c303:resources/QR-Credential-Tracking-System.sql
