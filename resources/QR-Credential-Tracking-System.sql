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

