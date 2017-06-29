-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 29, 2017 at 09:45 PM
-- Server version: 10.0.30-MariaDB-0+deb8u2
-- PHP Version: 5.6.30-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_webapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `wt_block`
--

CREATE TABLE `wt_block` (
  `block_id` int(11) NOT NULL,
  `gedcom_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `xref` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` enum('main','side') COLLATE utf8_unicode_ci DEFAULT NULL,
  `block_order` int(11) NOT NULL,
  `module_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wt_block`
--

INSERT INTO `wt_block` (`block_id`, `gedcom_id`, `user_id`, `xref`, `location`, `block_order`, `module_name`) VALUES
(1, NULL, -1, NULL, 'main', 1, 'todays_events'),
(2, NULL, -1, NULL, 'main', 2, 'user_messages'),
(3, NULL, -1, NULL, 'main', 3, 'user_favorites'),
(4, NULL, -1, NULL, 'side', 1, 'user_welcome'),
(5, NULL, -1, NULL, 'side', 2, 'random_media'),
(6, NULL, -1, NULL, 'side', 3, 'upcoming_events'),
(7, NULL, -1, NULL, 'side', 4, 'logged_in'),
(8, -1, NULL, NULL, 'main', 1, 'gedcom_stats'),
(9, -1, NULL, NULL, 'main', 2, 'gedcom_news'),
(10, -1, NULL, NULL, 'main', 3, 'gedcom_favorites'),
(11, -1, NULL, NULL, 'main', 4, 'review_changes'),
(12, -1, NULL, NULL, 'side', 1, 'gedcom_block'),
(13, -1, NULL, NULL, 'side', 2, 'random_media'),
(14, -1, NULL, NULL, 'side', 3, 'todays_events'),
(15, -1, NULL, NULL, 'side', 4, 'logged_in');

-- --------------------------------------------------------

--
-- Table structure for table `wt_block_setting`
--

CREATE TABLE `wt_block_setting` (
  `block_id` int(11) NOT NULL,
  `setting_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wt_change`
--

CREATE TABLE `wt_change` (
  `change_id` int(11) NOT NULL,
  `change_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('accepted','pending','rejected') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `gedcom_id` int(11) NOT NULL,
  `xref` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `old_gedcom` longtext COLLATE utf8_unicode_ci NOT NULL,
  `new_gedcom` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wt_dates`
--

CREATE TABLE `wt_dates` (
  `d_day` tinyint(4) NOT NULL,
  `d_month` char(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `d_mon` tinyint(4) NOT NULL,
  `d_year` smallint(6) NOT NULL,
  `d_julianday1` mediumint(9) NOT NULL,
  `d_julianday2` mediumint(9) NOT NULL,
  `d_fact` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `d_gid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `d_file` int(11) NOT NULL,
  `d_type` enum('@#DGREGORIAN@','@#DJULIAN@','@#DHEBREW@','@#DFRENCH R@','@#DHIJRI@','@#DROMAN@','@#DJALALI@') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wt_default_resn`
--

CREATE TABLE `wt_default_resn` (
  `default_resn_id` int(11) NOT NULL,
  `gedcom_id` int(11) NOT NULL,
  `xref` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag_type` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resn` enum('none','privacy','confidential','hidden') COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wt_default_resn`
--

INSERT INTO `wt_default_resn` (`default_resn_id`, `gedcom_id`, `xref`, `tag_type`, `resn`, `comment`, `updated`) VALUES
(1, -1, NULL, 'SSN', 'confidential', NULL, '2017-06-29 18:43:22'),
(2, -1, NULL, 'SOUR', 'privacy', NULL, '2017-06-29 18:43:22'),
(3, -1, NULL, 'REPO', 'privacy', NULL, '2017-06-29 18:43:22'),
(4, -1, NULL, 'SUBM', 'confidential', NULL, '2017-06-29 18:43:22'),
(5, -1, NULL, 'SUBN', 'confidential', NULL, '2017-06-29 18:43:22');

-- --------------------------------------------------------

--
-- Table structure for table `wt_families`
--

CREATE TABLE `wt_families` (
  `f_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `f_file` int(11) NOT NULL,
  `f_husb` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_wife` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_gedcom` longtext COLLATE utf8_unicode_ci NOT NULL,
  `f_numchil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wt_favorite`
--

CREATE TABLE `wt_favorite` (
  `favorite_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `gedcom_id` int(11) NOT NULL,
  `xref` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `favorite_type` enum('INDI','FAM','SOUR','REPO','OBJE','NOTE','URL') COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wt_gedcom`
--

CREATE TABLE `wt_gedcom` (
  `gedcom_id` int(11) NOT NULL,
  `gedcom_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wt_gedcom`
--

INSERT INTO `wt_gedcom` (`gedcom_id`, `gedcom_name`, `sort_order`) VALUES
(-1, 'DEFAULT_TREE', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wt_gedcom_chunk`
--

CREATE TABLE `wt_gedcom_chunk` (
  `gedcom_chunk_id` int(11) NOT NULL,
  `gedcom_id` int(11) NOT NULL,
  `chunk_data` longblob NOT NULL,
  `imported` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wt_gedcom_setting`
--

CREATE TABLE `wt_gedcom_setting` (
  `gedcom_id` int(11) NOT NULL,
  `setting_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wt_gedcom_setting`
--

INSERT INTO `wt_gedcom_setting` (`gedcom_id`, `setting_name`, `setting_value`) VALUES
(-1, 'ADVANCED_NAME_FACTS', 'NICK,_AKA'),
(-1, 'ADVANCED_PLAC_FACTS', ''),
(-1, 'ALLOW_THEME_DROPDOWN', '1'),
(-1, 'CALENDAR_FORMAT', 'gregorian'),
(-1, 'CHART_BOX_TAGS', ''),
(-1, 'DEFAULT_PEDIGREE_GENERATIONS', '4'),
(-1, 'EXPAND_RELATIVES_EVENTS', '0'),
(-1, 'EXPAND_SOURCES', '0'),
(-1, 'FAM_FACTS_ADD', 'CENS,MARR,RESI,SLGS,MARR_CIVIL,MARR_RELIGIOUS,MARR_PARTNERS,RESN'),
(-1, 'FAM_FACTS_QUICK', 'MARR,DIV,_NMR'),
(-1, 'FAM_FACTS_UNIQUE', 'NCHI,MARL,DIV,ANUL,DIVF,ENGA,MARB,MARC,MARS,_NMR'),
(-1, 'FAM_ID_PREFIX', 'F'),
(-1, 'FORMAT_TEXT', 'markdown'),
(-1, 'FULL_SOURCES', '0'),
(-1, 'GEDCOM_ID_PREFIX', 'I'),
(-1, 'GEDCOM_MEDIA_PATH', ''),
(-1, 'GENERATE_UIDS', '0'),
(-1, 'HIDE_GEDCOM_ERRORS', '1'),
(-1, 'HIDE_LIVE_PEOPLE', '1'),
(-1, 'INDI_FACTS_ADD', 'AFN,BIRT,DEAT,BURI,CREM,ADOP,BAPM,BARM,BASM,BLES,CHRA,CONF,FCOM,ORDN,NATU,EMIG,IMMI,CENS,PROB,WILL,GRAD,RETI,DSCR,EDUC,IDNO,NATI,NCHI,NMR,OCCU,PROP,RELI,RESI,SSN,TITL,BAPL,CONL,ENDL,SLGC,_MILI,ASSO,RESN'),
(-1, 'INDI_FACTS_QUICK', 'BIRT,BURI,BAPM,CENS,DEAT,OCCU,RESI'),
(-1, 'INDI_FACTS_UNIQUE', ''),
(-1, 'KEEP_ALIVE_YEARS_BIRTH', ''),
(-1, 'KEEP_ALIVE_YEARS_DEATH', ''),
(-1, 'LANGUAGE', 'en-US'),
(-1, 'MAX_ALIVE_AGE', '120'),
(-1, 'MAX_DESCENDANCY_GENERATIONS', '15'),
(-1, 'MAX_PEDIGREE_GENERATIONS', '10'),
(-1, 'MEDIA_DIRECTORY', 'media/'),
(-1, 'MEDIA_ID_PREFIX', 'M'),
(-1, 'MEDIA_UPLOAD', '1'),
(-1, 'META_DESCRIPTION', ''),
(-1, 'META_TITLE', 'webtrees'),
(-1, 'NO_UPDATE_CHAN', '0'),
(-1, 'NOTE_FACTS_ADD', 'SOUR,RESN'),
(-1, 'NOTE_FACTS_QUICK', ''),
(-1, 'NOTE_FACTS_UNIQUE', ''),
(-1, 'NOTE_ID_PREFIX', 'N'),
(-1, 'PEDIGREE_FULL_DETAILS', '1'),
(-1, 'PEDIGREE_LAYOUT', '1'),
(-1, 'PEDIGREE_ROOT_ID', ''),
(-1, 'PEDIGREE_SHOW_GENDER', '0'),
(-1, 'PREFER_LEVEL2_SOURCES', '1'),
(-1, 'QUICK_REQUIRED_FACTS', 'BIRT,DEAT'),
(-1, 'QUICK_REQUIRED_FAMFACTS', 'MARR'),
(-1, 'REPO_FACTS_ADD', 'PHON,EMAIL,FAX,WWW,RESN'),
(-1, 'REPO_FACTS_QUICK', ''),
(-1, 'REPO_FACTS_UNIQUE', 'NAME,ADDR'),
(-1, 'REPO_ID_PREFIX', 'R'),
(-1, 'REQUIRE_AUTHENTICATION', '0'),
(-1, 'SAVE_WATERMARK_IMAGE', '0'),
(-1, 'SAVE_WATERMARK_THUMB', '0'),
(-1, 'SHOW_AGE_DIFF', '0'),
(-1, 'SHOW_COUNTER', '1'),
(-1, 'SHOW_DEAD_PEOPLE', '2'),
(-1, 'SHOW_EST_LIST_DATES', '0'),
(-1, 'SHOW_FACT_ICONS', '1'),
(-1, 'SHOW_GEDCOM_RECORD', '0'),
(-1, 'SHOW_HIGHLIGHT_IMAGES', '1'),
(-1, 'SHOW_LDS_AT_GLANCE', '0'),
(-1, 'SHOW_LEVEL2_NOTES', '1'),
(-1, 'SHOW_LIVING_NAMES', '1'),
(-1, 'SHOW_MEDIA_DOWNLOAD', '0'),
(-1, 'SHOW_NO_WATERMARK', '1'),
(-1, 'SHOW_PARENTS_AGE', '1'),
(-1, 'SHOW_PEDIGREE_PLACES', '9'),
(-1, 'SHOW_PEDIGREE_PLACES_SUFFIX', '0'),
(-1, 'SHOW_PRIVATE_RELATIONSHIPS', '1'),
(-1, 'SHOW_RELATIVES_EVENTS', '_BIRT_CHIL,_BIRT_SIBL,_MARR_CHIL,_MARR_PARE,_DEAT_CHIL,_DEAT_PARE,_DEAT_GPAR,_DEAT_SIBL,_DEAT_SPOU'),
(-1, 'SOUR_FACTS_ADD', 'NOTE,REPO,SHARED_NOTE,RESN'),
(-1, 'SOUR_FACTS_QUICK', 'TEXT,NOTE,REPO'),
(-1, 'SOUR_FACTS_UNIQUE', 'AUTH,ABBR,TITL,PUBL,TEXT'),
(-1, 'SOURCE_ID_PREFIX', 'S'),
(-1, 'SUBLIST_TRIGGER_I', '200'),
(-1, 'SURNAME_LIST_STYLE', 'style2'),
(-1, 'SURNAME_TRADITION', 'paternal'),
(-1, 'THUMBNAIL_WIDTH', '100'),
(-1, 'USE_RIN', '0'),
(-1, 'USE_SILHOUETTE', '1'),
(-1, 'WATERMARK_THUMB', '0'),
(-1, 'WEBTREES_EMAIL', 'webtrees-noreply@datamol.tk'),
(-1, 'WORD_WRAPPED_NOTES', '0');

-- --------------------------------------------------------

--
-- Table structure for table `wt_hit_counter`
--

CREATE TABLE `wt_hit_counter` (
  `gedcom_id` int(11) NOT NULL,
  `page_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `page_parameter` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `page_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wt_individuals`
--

CREATE TABLE `wt_individuals` (
  `i_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `i_file` int(11) NOT NULL,
  `i_rin` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `i_sex` enum('U','M','F') COLLATE utf8_unicode_ci NOT NULL,
  `i_gedcom` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wt_link`
--

CREATE TABLE `wt_link` (
  `l_file` int(11) NOT NULL,
  `l_from` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `l_type` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `l_to` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wt_log`
--

CREATE TABLE `wt_log` (
  `log_id` int(11) NOT NULL,
  `log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_type` enum('auth','config','debug','edit','error','media','search') COLLATE utf8_unicode_ci NOT NULL,
  `log_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `gedcom_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wt_log`
--

INSERT INTO `wt_log` (`log_id`, `log_time`, `log_type`, `log_message`, `ip_address`, `user_id`, `gedcom_id`) VALUES
(1, '2017-06-29 18:43:18', 'config', 'Site preference \"INDEX_DIRECTORY\" set to \"data/\"', '182.77.62.2', NULL, NULL),
(2, '2017-06-29 18:43:18', 'config', 'Site preference \"USE_REGISTRATION_MODULE\" set to \"1\"', '182.77.62.2', NULL, NULL),
(3, '2017-06-29 18:43:18', 'config', 'Site preference \"ALLOW_USER_THEMES\" set to \"1\"', '182.77.62.2', NULL, NULL),
(4, '2017-06-29 18:43:18', 'config', 'Site preference \"ALLOW_CHANGE_GEDCOM\" set to \"1\"', '182.77.62.2', NULL, NULL),
(5, '2017-06-29 18:43:18', 'config', 'Site preference \"SESSION_TIME\" set to \"7200\"', '182.77.62.2', NULL, NULL),
(6, '2017-06-29 18:43:18', 'config', 'Site preference \"SMTP_ACTIVE\" set to \"internal\"', '182.77.62.2', NULL, NULL),
(7, '2017-06-29 18:43:18', 'config', 'Site preference \"SMTP_HOST\" set to \"localhost\"', '182.77.62.2', NULL, NULL),
(8, '2017-06-29 18:43:18', 'config', 'Site preference \"SMTP_PORT\" set to \"25\"', '182.77.62.2', NULL, NULL),
(9, '2017-06-29 18:43:18', 'config', 'Site preference \"SMTP_AUTH\" set to \"1\"', '182.77.62.2', NULL, NULL),
(10, '2017-06-29 18:43:18', 'config', 'Site preference \"SMTP_SSL\" set to \"none\"', '182.77.62.2', NULL, NULL),
(11, '2017-06-29 18:43:18', 'config', 'Site preference \"SMTP_HELO\" set to \"datamol.tk\"', '182.77.62.2', NULL, NULL),
(12, '2017-06-29 18:43:18', 'config', 'Site preference \"SMTP_FROM_NAME\" set to \"datamol.tk\"', '182.77.62.2', NULL, NULL),
(13, '2017-06-29 18:43:18', 'config', 'Site preference \"FV_SCHEMA_VERSION\" set to \"1\"', '182.77.62.2', NULL, NULL),
(14, '2017-06-29 18:43:19', 'config', 'Site preference \"FV_SCHEMA_VERSION\" set to \"2\"', '182.77.62.2', NULL, NULL),
(15, '2017-06-29 18:43:19', 'config', 'Site preference \"FV_SCHEMA_VERSION\" set to \"3\"', '182.77.62.2', NULL, NULL),
(16, '2017-06-29 18:43:19', 'config', 'Site preference \"FV_SCHEMA_VERSION\" set to \"4\"', '182.77.62.2', NULL, NULL),
(17, '2017-06-29 18:43:19', 'config', 'Site preference \"NB_SCHEMA_VERSION\" set to \"1\"', '182.77.62.2', NULL, NULL),
(18, '2017-06-29 18:43:19', 'config', 'Site preference \"NB_SCHEMA_VERSION\" set to \"2\"', '182.77.62.2', NULL, NULL),
(19, '2017-06-29 18:43:20', 'config', 'Site preference \"NB_SCHEMA_VERSION\" set to \"3\"', '182.77.62.2', NULL, NULL),
(20, '2017-06-29 18:43:20', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"1\"', '182.77.62.2', NULL, NULL),
(21, '2017-06-29 18:43:20', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"2\"', '182.77.62.2', NULL, NULL),
(22, '2017-06-29 18:43:20', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"3\"', '182.77.62.2', NULL, NULL),
(23, '2017-06-29 18:43:20', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"4\"', '182.77.62.2', NULL, NULL),
(24, '2017-06-29 18:43:20', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"5\"', '182.77.62.2', NULL, NULL),
(25, '2017-06-29 18:43:20', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"6\"', '182.77.62.2', NULL, NULL),
(26, '2017-06-29 18:43:20', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"7\"', '182.77.62.2', NULL, NULL),
(27, '2017-06-29 18:43:20', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"8\"', '182.77.62.2', NULL, NULL),
(28, '2017-06-29 18:43:21', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"9\"', '182.77.62.2', NULL, NULL),
(29, '2017-06-29 18:43:21', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"10\"', '182.77.62.2', NULL, NULL),
(30, '2017-06-29 18:43:21', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"11\"', '182.77.62.2', NULL, NULL),
(31, '2017-06-29 18:43:21', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"12\"', '182.77.62.2', NULL, NULL),
(32, '2017-06-29 18:43:21', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"13\"', '182.77.62.2', NULL, NULL),
(33, '2017-06-29 18:43:21', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"14\"', '182.77.62.2', NULL, NULL),
(34, '2017-06-29 18:43:21', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"15\"', '182.77.62.2', NULL, NULL),
(35, '2017-06-29 18:43:21', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"16\"', '182.77.62.2', NULL, NULL),
(36, '2017-06-29 18:43:21', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"17\"', '182.77.62.2', NULL, NULL),
(37, '2017-06-29 18:43:21', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"18\"', '182.77.62.2', NULL, NULL),
(38, '2017-06-29 18:43:21', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"19\"', '182.77.62.2', NULL, NULL),
(39, '2017-06-29 18:43:21', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"20\"', '182.77.62.2', NULL, NULL),
(40, '2017-06-29 18:43:21', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"21\"', '182.77.62.2', NULL, NULL),
(41, '2017-06-29 18:43:21', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"22\"', '182.77.62.2', NULL, NULL),
(42, '2017-06-29 18:43:21', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"23\"', '182.77.62.2', NULL, NULL),
(43, '2017-06-29 18:43:22', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"24\"', '182.77.62.2', NULL, NULL),
(44, '2017-06-29 18:43:22', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"25\"', '182.77.62.2', NULL, NULL),
(45, '2017-06-29 18:43:22', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"26\"', '182.77.62.2', NULL, NULL),
(46, '2017-06-29 18:43:22', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"27\"', '182.77.62.2', NULL, NULL),
(47, '2017-06-29 18:43:22', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"28\"', '182.77.62.2', NULL, NULL),
(48, '2017-06-29 18:43:22', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"29\"', '182.77.62.2', NULL, NULL),
(49, '2017-06-29 18:43:22', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"30\"', '182.77.62.2', NULL, NULL),
(50, '2017-06-29 18:43:22', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"31\"', '182.77.62.2', NULL, NULL),
(51, '2017-06-29 18:43:22', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"32\"', '182.77.62.2', NULL, NULL),
(52, '2017-06-29 18:43:22', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"33\"', '182.77.62.2', NULL, NULL),
(53, '2017-06-29 18:43:22', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"34\"', '182.77.62.2', NULL, NULL),
(54, '2017-06-29 18:43:23', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"35\"', '182.77.62.2', NULL, NULL),
(55, '2017-06-29 18:43:26', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"36\"', '182.77.62.2', NULL, NULL),
(56, '2017-06-29 18:43:27', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"37\"', '182.77.62.2', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wt_media`
--

CREATE TABLE `wt_media` (
  `m_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `m_ext` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `m_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `m_titl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `m_filename` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `m_file` int(11) NOT NULL,
  `m_gedcom` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wt_message`
--

CREATE TABLE `wt_message` (
  `message_id` int(11) NOT NULL,
  `sender` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wt_module`
--

CREATE TABLE `wt_module` (
  `module_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'enabled',
  `tab_order` int(11) DEFAULT NULL,
  `menu_order` int(11) DEFAULT NULL,
  `sidebar_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wt_module`
--

INSERT INTO `wt_module` (`module_name`, `status`, `tab_order`, `menu_order`, `sidebar_order`) VALUES
('ahnentafel_report', 'enabled', NULL, NULL, NULL),
('ancestors_chart', 'enabled', NULL, NULL, NULL),
('batch_update', 'enabled', NULL, NULL, NULL),
('bdm_report', 'enabled', NULL, NULL, NULL),
('birth_report', 'enabled', NULL, NULL, NULL),
('cemetery_report', 'enabled', NULL, NULL, NULL),
('change_report', 'enabled', NULL, NULL, NULL),
('charts', 'enabled', NULL, NULL, NULL),
('ckeditor', 'enabled', NULL, NULL, NULL),
('clippings', 'enabled', NULL, 20, 60),
('compact_tree_chart', 'enabled', NULL, NULL, NULL),
('death_report', 'enabled', NULL, NULL, NULL),
('descendancy', 'enabled', NULL, NULL, 30),
('descendancy_chart', 'enabled', NULL, NULL, NULL),
('descendancy_report', 'enabled', NULL, NULL, NULL),
('extra_info', 'enabled', NULL, NULL, 10),
('fact_sources', 'enabled', NULL, NULL, NULL),
('families', 'enabled', NULL, NULL, 50),
('family_book_chart', 'enabled', NULL, NULL, NULL),
('family_group_report', 'enabled', NULL, NULL, NULL),
('family_nav', 'enabled', NULL, NULL, 20),
('fan_chart', 'enabled', NULL, NULL, NULL),
('faq', 'enabled', NULL, 40, NULL),
('gedcom_block', 'enabled', NULL, NULL, NULL),
('gedcom_favorites', 'enabled', NULL, NULL, NULL),
('gedcom_news', 'enabled', NULL, NULL, NULL),
('gedcom_stats', 'enabled', NULL, NULL, NULL),
('GEDFact_assistant', 'enabled', NULL, NULL, NULL),
('googlemap', 'enabled', 80, NULL, NULL),
('hourglass_chart', 'enabled', NULL, NULL, NULL),
('html', 'enabled', NULL, NULL, NULL),
('individual_ext_report', 'enabled', NULL, NULL, NULL),
('individual_report', 'enabled', NULL, NULL, NULL),
('individuals', 'enabled', NULL, NULL, 40),
('lifespans_chart', 'enabled', NULL, NULL, NULL),
('lightbox', 'enabled', 60, NULL, NULL),
('logged_in', 'enabled', NULL, NULL, NULL),
('login_block', 'enabled', NULL, NULL, NULL),
('marriage_report', 'enabled', NULL, NULL, NULL),
('media', 'enabled', 50, NULL, NULL),
('missing_facts_report', 'enabled', NULL, NULL, NULL),
('notes', 'enabled', 40, NULL, NULL),
('occupation_report', 'enabled', NULL, NULL, NULL),
('page_menu', 'enabled', NULL, 10, NULL),
('pedigree_chart', 'enabled', NULL, NULL, NULL),
('pedigree_report', 'enabled', NULL, NULL, NULL),
('personal_facts', 'enabled', 10, NULL, NULL),
('random_media', 'enabled', NULL, NULL, NULL),
('recent_changes', 'enabled', NULL, NULL, NULL),
('relationships_chart', 'enabled', NULL, NULL, NULL),
('relative_ext_report', 'enabled', NULL, NULL, NULL),
('relatives', 'enabled', 20, NULL, NULL),
('review_changes', 'enabled', NULL, NULL, NULL),
('sitemap', 'enabled', NULL, NULL, NULL),
('sources_tab', 'enabled', 30, NULL, NULL),
('statistics_chart', 'enabled', NULL, NULL, NULL),
('stories', 'enabled', 55, 30, NULL),
('theme_select', 'enabled', NULL, NULL, NULL),
('timeline_chart', 'enabled', NULL, NULL, NULL),
('todays_events', 'enabled', NULL, NULL, NULL),
('todo', 'enabled', NULL, NULL, NULL),
('top10_givnnames', 'enabled', NULL, NULL, NULL),
('top10_pageviews', 'enabled', NULL, NULL, NULL),
('top10_surnames', 'enabled', NULL, NULL, NULL),
('tree', 'enabled', 68, NULL, NULL),
('upcoming_events', 'enabled', NULL, NULL, NULL),
('user_blog', 'enabled', NULL, NULL, NULL),
('user_favorites', 'enabled', NULL, NULL, NULL),
('user_messages', 'enabled', NULL, NULL, NULL),
('user_welcome', 'enabled', NULL, NULL, NULL),
('yahrzeit', 'enabled', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wt_module_privacy`
--

CREATE TABLE `wt_module_privacy` (
  `module_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `gedcom_id` int(11) NOT NULL,
  `component` enum('block','chart','menu','report','sidebar','tab','theme') COLLATE utf8_unicode_ci NOT NULL,
  `access_level` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wt_module_privacy`
--

INSERT INTO `wt_module_privacy` (`module_name`, `gedcom_id`, `component`, `access_level`) VALUES
('ahnentafel_report', -1, 'report', 2),
('ancestors_chart', -1, 'chart', 2),
('bdm_report', -1, 'report', 2),
('birth_report', -1, 'report', 2),
('cemetery_report', -1, 'report', 2),
('change_report', -1, 'report', 1),
('charts', -1, 'block', 2),
('clippings', -1, 'menu', 1),
('clippings', -1, 'sidebar', 1),
('compact_tree_chart', -1, 'chart', 2),
('death_report', -1, 'report', 2),
('descendancy', -1, 'sidebar', 2),
('descendancy_chart', -1, 'chart', 2),
('descendancy_report', -1, 'report', 2),
('extra_info', -1, 'sidebar', 2),
('fact_sources', -1, 'report', 1),
('families', -1, 'sidebar', 2),
('family_book_chart', -1, 'chart', 2),
('family_group_report', -1, 'report', 2),
('family_nav', -1, 'sidebar', 2),
('fan_chart', -1, 'chart', 2),
('faq', -1, 'menu', 2),
('gedcom_block', -1, 'block', 2),
('gedcom_favorites', -1, 'block', 2),
('gedcom_news', -1, 'block', 2),
('gedcom_stats', -1, 'block', 2),
('googlemap', -1, 'chart', 2),
('googlemap', -1, 'tab', 2),
('hourglass_chart', -1, 'chart', 2),
('html', -1, 'block', 2),
('individual_ext_report', -1, 'report', 1),
('individual_report', -1, 'report', 2),
('individuals', -1, 'sidebar', 2),
('lifespans_chart', -1, 'chart', 2),
('lightbox', -1, 'tab', 2),
('logged_in', -1, 'block', 2),
('login_block', -1, 'block', 2),
('marriage_report', -1, 'report', 2),
('media', -1, 'tab', 2),
('missing_facts_report', -1, 'report', 1),
('notes', -1, 'tab', 2),
('occupation_report', -1, 'report', 1),
('page_menu', -1, 'menu', 2),
('pedigree_chart', -1, 'chart', 2),
('pedigree_report', -1, 'report', 2),
('personal_facts', -1, 'tab', 2),
('random_media', -1, 'block', 2),
('recent_changes', -1, 'block', 2),
('relationships_chart', -1, 'chart', 2),
('relative_ext_report', -1, 'report', 2),
('relatives', -1, 'tab', 2),
('review_changes', -1, 'block', 2),
('sources_tab', -1, 'tab', 2),
('statistics_chart', -1, 'chart', 2),
('stories', -1, 'menu', -1),
('stories', -1, 'tab', -1),
('theme_select', -1, 'block', 2),
('timeline_chart', -1, 'chart', 2),
('todays_events', -1, 'block', 2),
('todo', -1, 'block', 2),
('top10_givnnames', -1, 'block', 2),
('top10_pageviews', -1, 'block', 2),
('top10_surnames', -1, 'block', 2),
('tree', -1, 'chart', 2),
('tree', -1, 'tab', 2),
('upcoming_events', -1, 'block', 2),
('user_blog', -1, 'block', 2),
('user_favorites', -1, 'block', 2),
('user_messages', -1, 'block', 2),
('user_welcome', -1, 'block', 2),
('yahrzeit', -1, 'block', 2);

-- --------------------------------------------------------

--
-- Table structure for table `wt_module_setting`
--

CREATE TABLE `wt_module_setting` (
  `module_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `setting_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wt_name`
--

CREATE TABLE `wt_name` (
  `n_file` int(11) NOT NULL,
  `n_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `n_num` int(11) NOT NULL,
  `n_type` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `n_sort` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `n_full` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `n_surname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `n_surn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `n_givn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `n_soundex_givn_std` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `n_soundex_surn_std` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `n_soundex_givn_dm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `n_soundex_surn_dm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wt_news`
--

CREATE TABLE `wt_news` (
  `news_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `gedcom_id` int(11) DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wt_next_id`
--

CREATE TABLE `wt_next_id` (
  `gedcom_id` int(11) NOT NULL,
  `record_type` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `next_id` decimal(20,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wt_other`
--

CREATE TABLE `wt_other` (
  `o_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `o_file` int(11) NOT NULL,
  `o_type` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `o_gedcom` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wt_placelinks`
--

CREATE TABLE `wt_placelinks` (
  `pl_p_id` int(11) NOT NULL,
  `pl_gid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `pl_file` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wt_places`
--

CREATE TABLE `wt_places` (
  `p_id` int(11) NOT NULL,
  `p_place` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `p_parent_id` int(11) DEFAULT NULL,
  `p_file` int(11) NOT NULL,
  `p_std_soundex` longtext COLLATE utf8_unicode_ci NOT NULL,
  `p_dm_soundex` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wt_session`
--

CREATE TABLE `wt_session` (
  `session_id` char(128) COLLATE utf8_unicode_ci NOT NULL,
  `session_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wt_session`
--

INSERT INTO `wt_session` (`session_id`, `session_time`, `user_id`, `ip_address`, `session_data`) VALUES
('4bghb87q5rahrona5cvb5pj6o3', '2017-06-29 18:43:00', 0, '182.77.62.2', 0x696e697469617465647c623a313b6c6f63616c657c733a353a22656e2d5553223b61637469766974795f74696d657c693a313439383736313830383b7468656d655f69647c733a383a227765627472656573223b435352465f544f4b454e7c733a33323a224e4d4353736b536a496a6b674a664f6972505759687748316972746d5644716f223b);

-- --------------------------------------------------------

--
-- Table structure for table `wt_site_access_rule`
--

CREATE TABLE `wt_site_access_rule` (
  `site_access_rule_id` int(11) NOT NULL,
  `ip_address_start` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ip_address_end` int(10) UNSIGNED NOT NULL DEFAULT '4294967295',
  `user_agent_pattern` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rule` enum('allow','deny','robot','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wt_site_access_rule`
--

INSERT INTO `wt_site_access_rule` (`site_access_rule_id`, `ip_address_start`, `ip_address_end`, `user_agent_pattern`, `rule`, `comment`, `updated`) VALUES
(1, 0, 4294967295, 'Mozilla/5.0 (%) Gecko/% %/%', 'allow', 'Gecko-based browsers', '2017-06-29 18:43:21'),
(2, 0, 4294967295, 'Mozilla/5.0 (%) AppleWebKit/% (KHTML, like Gecko)%', 'allow', 'WebKit-based browsers', '2017-06-29 18:43:21'),
(3, 0, 4294967295, 'Opera/% (%) Presto/% Version/%', 'allow', 'Presto-based browsers', '2017-06-29 18:43:21'),
(4, 0, 4294967295, 'Mozilla/% (compatible; MSIE %', 'allow', 'Trident-based browsers', '2017-06-29 18:43:21'),
(5, 0, 4294967295, 'Mozilla/5.0 (% Konqueror/%', 'allow', 'Konqueror browser', '2017-06-29 18:43:22'),
(6, 0, 4294967295, 'Mozilla/% (Windows%; Trident%; rv:%) like Gecko', 'allow', 'Modern Internet Explorer', '2017-06-29 18:43:22'),
(7, 0, 4294967295, 'Mozilla/5.0 (Mobile; Windows Phone 8.1; % Microsoft; %', 'allow', 'Windows Phone 8.1', '2017-06-29 18:43:22');

-- --------------------------------------------------------

--
-- Table structure for table `wt_site_setting`
--

CREATE TABLE `wt_site_setting` (
  `setting_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` varchar(2000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wt_site_setting`
--

INSERT INTO `wt_site_setting` (`setting_name`, `setting_value`) VALUES
('ALLOW_CHANGE_GEDCOM', '1'),
('ALLOW_USER_THEMES', '1'),
('FV_SCHEMA_VERSION', '4'),
('INDEX_DIRECTORY', 'data/'),
('NB_SCHEMA_VERSION', '3'),
('SESSION_TIME', '7200'),
('SMTP_ACTIVE', 'internal'),
('SMTP_AUTH', '1'),
('SMTP_FROM_NAME', 'datamol.tk'),
('SMTP_HELO', 'datamol.tk'),
('SMTP_HOST', 'localhost'),
('SMTP_PORT', '25'),
('SMTP_SSL', 'none'),
('USE_REGISTRATION_MODULE', '1'),
('WT_SCHEMA_VERSION', '37');

-- --------------------------------------------------------

--
-- Table structure for table `wt_sources`
--

CREATE TABLE `wt_sources` (
  `s_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `s_file` int(11) NOT NULL,
  `s_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `s_gedcom` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wt_user`
--

CREATE TABLE `wt_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `real_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wt_user`
--

INSERT INTO `wt_user` (`user_id`, `user_name`, `real_name`, `email`, `password`) VALUES
(-1, 'DEFAULT_USER', 'DEFAULT_USER', 'DEFAULT_USER', 'DEFAULT_USER');

-- --------------------------------------------------------

--
-- Table structure for table `wt_user_gedcom_setting`
--

CREATE TABLE `wt_user_gedcom_setting` (
  `user_id` int(11) NOT NULL,
  `gedcom_id` int(11) NOT NULL,
  `setting_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wt_user_setting`
--

CREATE TABLE `wt_user_setting` (
  `user_id` int(11) NOT NULL,
  `setting_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wt_block`
--
ALTER TABLE `wt_block`
  ADD PRIMARY KEY (`block_id`),
  ADD KEY `wt_block_fk1` (`gedcom_id`),
  ADD KEY `wt_block_fk2` (`user_id`),
  ADD KEY `wt_block_fk3` (`module_name`);

--
-- Indexes for table `wt_block_setting`
--
ALTER TABLE `wt_block_setting`
  ADD PRIMARY KEY (`block_id`,`setting_name`);

--
-- Indexes for table `wt_change`
--
ALTER TABLE `wt_change`
  ADD PRIMARY KEY (`change_id`),
  ADD KEY `wt_change_ix1` (`gedcom_id`,`status`,`xref`),
  ADD KEY `wt_change_fk1` (`user_id`);

--
-- Indexes for table `wt_dates`
--
ALTER TABLE `wt_dates`
  ADD KEY `wt_dates_ix1` (`d_day`),
  ADD KEY `wt_dates_ix2` (`d_month`),
  ADD KEY `wt_dates_ix3` (`d_mon`),
  ADD KEY `wt_dates_ix4` (`d_year`),
  ADD KEY `wt_dates_ix5` (`d_julianday1`),
  ADD KEY `wt_dates_ix6` (`d_julianday2`),
  ADD KEY `wt_dates_ix7` (`d_gid`),
  ADD KEY `wt_dates_ix8` (`d_file`),
  ADD KEY `wt_dates_ix9` (`d_type`),
  ADD KEY `wt_dates_ix10` (`d_fact`,`d_gid`);

--
-- Indexes for table `wt_default_resn`
--
ALTER TABLE `wt_default_resn`
  ADD PRIMARY KEY (`default_resn_id`),
  ADD UNIQUE KEY `wt_default_resn_ix1` (`gedcom_id`,`xref`,`tag_type`);

--
-- Indexes for table `wt_families`
--
ALTER TABLE `wt_families`
  ADD PRIMARY KEY (`f_id`,`f_file`),
  ADD UNIQUE KEY `wt_families_ix1` (`f_file`,`f_id`),
  ADD KEY `wt_families_ix2` (`f_husb`),
  ADD KEY `wt_families_ix3` (`f_wife`);

--
-- Indexes for table `wt_favorite`
--
ALTER TABLE `wt_favorite`
  ADD PRIMARY KEY (`favorite_id`),
  ADD KEY `news_ix1` (`gedcom_id`,`user_id`),
  ADD KEY `wt_favorite_fk1` (`user_id`);

--
-- Indexes for table `wt_gedcom`
--
ALTER TABLE `wt_gedcom`
  ADD PRIMARY KEY (`gedcom_id`),
  ADD UNIQUE KEY `wt_gedcom_ix1` (`gedcom_name`),
  ADD KEY `wt_gedcom_ix2` (`sort_order`),
  ADD KEY `ix1` (`sort_order`);

--
-- Indexes for table `wt_gedcom_chunk`
--
ALTER TABLE `wt_gedcom_chunk`
  ADD PRIMARY KEY (`gedcom_chunk_id`),
  ADD KEY `ix1` (`gedcom_id`,`imported`);

--
-- Indexes for table `wt_gedcom_setting`
--
ALTER TABLE `wt_gedcom_setting`
  ADD PRIMARY KEY (`gedcom_id`,`setting_name`);

--
-- Indexes for table `wt_hit_counter`
--
ALTER TABLE `wt_hit_counter`
  ADD PRIMARY KEY (`gedcom_id`,`page_name`,`page_parameter`);

--
-- Indexes for table `wt_individuals`
--
ALTER TABLE `wt_individuals`
  ADD PRIMARY KEY (`i_id`,`i_file`),
  ADD UNIQUE KEY `wt_individuals_ix1` (`i_file`,`i_id`);

--
-- Indexes for table `wt_link`
--
ALTER TABLE `wt_link`
  ADD PRIMARY KEY (`l_from`,`l_file`,`l_type`,`l_to`),
  ADD UNIQUE KEY `wt_link_ix1` (`l_to`,`l_file`,`l_type`,`l_from`);

--
-- Indexes for table `wt_log`
--
ALTER TABLE `wt_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `wt_log_ix1` (`log_time`),
  ADD KEY `wt_log_ix2` (`log_type`),
  ADD KEY `wt_log_ix3` (`ip_address`),
  ADD KEY `wt_log_fk1` (`user_id`),
  ADD KEY `wt_log_fk2` (`gedcom_id`);

--
-- Indexes for table `wt_media`
--
ALTER TABLE `wt_media`
  ADD PRIMARY KEY (`m_file`,`m_id`),
  ADD UNIQUE KEY `wt_media_ix1` (`m_id`,`m_file`),
  ADD KEY `wt_media_ix2` (`m_ext`,`m_type`),
  ADD KEY `wt_media_ix3` (`m_titl`);

--
-- Indexes for table `wt_message`
--
ALTER TABLE `wt_message`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `wt_message_fk1` (`user_id`);

--
-- Indexes for table `wt_module`
--
ALTER TABLE `wt_module`
  ADD PRIMARY KEY (`module_name`);

--
-- Indexes for table `wt_module_privacy`
--
ALTER TABLE `wt_module_privacy`
  ADD PRIMARY KEY (`module_name`,`gedcom_id`,`component`),
  ADD KEY `wt_module_privacy_fk2` (`gedcom_id`);

--
-- Indexes for table `wt_module_setting`
--
ALTER TABLE `wt_module_setting`
  ADD PRIMARY KEY (`module_name`,`setting_name`);

--
-- Indexes for table `wt_name`
--
ALTER TABLE `wt_name`
  ADD PRIMARY KEY (`n_id`,`n_file`,`n_num`),
  ADD KEY `wt_name_ix1` (`n_full`,`n_id`,`n_file`),
  ADD KEY `wt_name_ix2` (`n_surn`,`n_file`,`n_type`,`n_id`),
  ADD KEY `wt_name_ix3` (`n_givn`,`n_file`,`n_type`,`n_id`);

--
-- Indexes for table `wt_news`
--
ALTER TABLE `wt_news`
  ADD PRIMARY KEY (`news_id`),
  ADD KEY `news_ix1` (`user_id`,`updated`),
  ADD KEY `news_ix2` (`gedcom_id`,`updated`);

--
-- Indexes for table `wt_next_id`
--
ALTER TABLE `wt_next_id`
  ADD PRIMARY KEY (`gedcom_id`,`record_type`);

--
-- Indexes for table `wt_other`
--
ALTER TABLE `wt_other`
  ADD PRIMARY KEY (`o_id`,`o_file`),
  ADD UNIQUE KEY `wt_other_ix1` (`o_file`,`o_id`);

--
-- Indexes for table `wt_placelinks`
--
ALTER TABLE `wt_placelinks`
  ADD PRIMARY KEY (`pl_p_id`,`pl_gid`,`pl_file`),
  ADD KEY `wt_placelinks_ix1` (`pl_p_id`),
  ADD KEY `wt_placelinks_ix2` (`pl_gid`),
  ADD KEY `wt_placelinks_ix3` (`pl_file`);

--
-- Indexes for table `wt_places`
--
ALTER TABLE `wt_places`
  ADD PRIMARY KEY (`p_id`),
  ADD UNIQUE KEY `wt_places_ix2` (`p_parent_id`,`p_file`,`p_place`),
  ADD KEY `wt_places_ix1` (`p_file`,`p_place`);

--
-- Indexes for table `wt_session`
--
ALTER TABLE `wt_session`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `ix1` (`session_time`),
  ADD KEY `ix2` (`user_id`,`ip_address`);

--
-- Indexes for table `wt_site_access_rule`
--
ALTER TABLE `wt_site_access_rule`
  ADD PRIMARY KEY (`site_access_rule_id`),
  ADD UNIQUE KEY `wt_site_access_rule_ix1` (`ip_address_end`,`ip_address_start`,`user_agent_pattern`,`rule`),
  ADD KEY `wt_site_access_rule_ix2` (`rule`);

--
-- Indexes for table `wt_site_setting`
--
ALTER TABLE `wt_site_setting`
  ADD PRIMARY KEY (`setting_name`);

--
-- Indexes for table `wt_sources`
--
ALTER TABLE `wt_sources`
  ADD PRIMARY KEY (`s_id`,`s_file`),
  ADD UNIQUE KEY `wt_sources_ix1` (`s_file`,`s_id`),
  ADD KEY `wt_sources_ix2` (`s_name`);

--
-- Indexes for table `wt_user`
--
ALTER TABLE `wt_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `wt_user_ix1` (`user_name`),
  ADD UNIQUE KEY `wt_user_ix2` (`email`);

--
-- Indexes for table `wt_user_gedcom_setting`
--
ALTER TABLE `wt_user_gedcom_setting`
  ADD PRIMARY KEY (`user_id`,`gedcom_id`,`setting_name`),
  ADD KEY `wt_user_gedcom_setting_fk2` (`gedcom_id`);

--
-- Indexes for table `wt_user_setting`
--
ALTER TABLE `wt_user_setting`
  ADD PRIMARY KEY (`user_id`,`setting_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wt_block`
--
ALTER TABLE `wt_block`
  MODIFY `block_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `wt_change`
--
ALTER TABLE `wt_change`
  MODIFY `change_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wt_default_resn`
--
ALTER TABLE `wt_default_resn`
  MODIFY `default_resn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `wt_favorite`
--
ALTER TABLE `wt_favorite`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wt_gedcom`
--
ALTER TABLE `wt_gedcom`
  MODIFY `gedcom_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wt_gedcom_chunk`
--
ALTER TABLE `wt_gedcom_chunk`
  MODIFY `gedcom_chunk_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wt_log`
--
ALTER TABLE `wt_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `wt_message`
--
ALTER TABLE `wt_message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wt_news`
--
ALTER TABLE `wt_news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wt_places`
--
ALTER TABLE `wt_places`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wt_site_access_rule`
--
ALTER TABLE `wt_site_access_rule`
  MODIFY `site_access_rule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `wt_user`
--
ALTER TABLE `wt_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `wt_block`
--
ALTER TABLE `wt_block`
  ADD CONSTRAINT `wt_block_fk1` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`),
  ADD CONSTRAINT `wt_block_fk2` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`),
  ADD CONSTRAINT `wt_block_fk3` FOREIGN KEY (`module_name`) REFERENCES `wt_module` (`module_name`);

--
-- Constraints for table `wt_block_setting`
--
ALTER TABLE `wt_block_setting`
  ADD CONSTRAINT `wt_block_setting_fk1` FOREIGN KEY (`block_id`) REFERENCES `wt_block` (`block_id`);

--
-- Constraints for table `wt_change`
--
ALTER TABLE `wt_change`
  ADD CONSTRAINT `wt_change_fk1` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`),
  ADD CONSTRAINT `wt_change_fk2` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`);

--
-- Constraints for table `wt_default_resn`
--
ALTER TABLE `wt_default_resn`
  ADD CONSTRAINT `wt_default_resn_fk1` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`);

--
-- Constraints for table `wt_favorite`
--
ALTER TABLE `wt_favorite`
  ADD CONSTRAINT `wt_favorite_fk1` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wt_favorite_fk2` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`) ON DELETE CASCADE;

--
-- Constraints for table `wt_gedcom_chunk`
--
ALTER TABLE `wt_gedcom_chunk`
  ADD CONSTRAINT `wt_gedcom_chunk_fk1` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`);

--
-- Constraints for table `wt_gedcom_setting`
--
ALTER TABLE `wt_gedcom_setting`
  ADD CONSTRAINT `wt_gedcom_setting_fk1` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`);

--
-- Constraints for table `wt_hit_counter`
--
ALTER TABLE `wt_hit_counter`
  ADD CONSTRAINT `wt_hit_counter_fk1` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`);

--
-- Constraints for table `wt_log`
--
ALTER TABLE `wt_log`
  ADD CONSTRAINT `wt_log_fk1` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`),
  ADD CONSTRAINT `wt_log_fk2` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`);

--
-- Constraints for table `wt_message`
--
ALTER TABLE `wt_message`
  ADD CONSTRAINT `wt_message_fk1` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`);

--
-- Constraints for table `wt_module_privacy`
--
ALTER TABLE `wt_module_privacy`
  ADD CONSTRAINT `wt_module_privacy_fk1` FOREIGN KEY (`module_name`) REFERENCES `wt_module` (`module_name`),
  ADD CONSTRAINT `wt_module_privacy_fk2` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`);

--
-- Constraints for table `wt_module_setting`
--
ALTER TABLE `wt_module_setting`
  ADD CONSTRAINT `wt_module_setting_fk1` FOREIGN KEY (`module_name`) REFERENCES `wt_module` (`module_name`);

--
-- Constraints for table `wt_news`
--
ALTER TABLE `wt_news`
  ADD CONSTRAINT `wt_news_fk1` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wt_news_fk2` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`) ON DELETE CASCADE;

--
-- Constraints for table `wt_next_id`
--
ALTER TABLE `wt_next_id`
  ADD CONSTRAINT `wt_next_id_fk1` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`);

--
-- Constraints for table `wt_user_gedcom_setting`
--
ALTER TABLE `wt_user_gedcom_setting`
  ADD CONSTRAINT `wt_user_gedcom_setting_fk1` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`),
  ADD CONSTRAINT `wt_user_gedcom_setting_fk2` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`);

--
-- Constraints for table `wt_user_setting`
--
ALTER TABLE `wt_user_setting`
  ADD CONSTRAINT `wt_user_setting_fk1` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
