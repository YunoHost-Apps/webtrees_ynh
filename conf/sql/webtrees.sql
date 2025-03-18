-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 18 mars 2025 à 18:45
-- Version du serveur : 10.11.11-MariaDB-0+deb12u1
-- Version de PHP : 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `webtrees`
--

-- --------------------------------------------------------

--
-- Structure de la table `wt_block`
--

CREATE TABLE `wt_block` (
  `block_id` int(11) NOT NULL,
  `gedcom_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `xref` varchar(20) DEFAULT NULL,
  `location` enum('main','side') DEFAULT NULL,
  `block_order` int(11) NOT NULL,
  `module_name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wt_block_setting`
--

CREATE TABLE `wt_block_setting` (
  `block_id` int(11) NOT NULL,
  `setting_name` varchar(32) NOT NULL,
  `setting_value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wt_change`
--

CREATE TABLE `wt_change` (
  `change_id` int(11) NOT NULL,
  `change_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('accepted','pending','rejected') NOT NULL DEFAULT 'pending',
  `gedcom_id` int(11) NOT NULL,
  `xref` varchar(20) NOT NULL,
  `old_gedcom` longtext NOT NULL,
  `new_gedcom` longtext NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wt_dates`
--

CREATE TABLE `wt_dates` (
  `d_day` tinyint(4) NOT NULL,
  `d_month` char(5) DEFAULT NULL,
  `d_mon` tinyint(4) NOT NULL,
  `d_year` smallint(6) NOT NULL,
  `d_julianday1` mediumint(9) NOT NULL,
  `d_julianday2` mediumint(9) NOT NULL,
  `d_fact` varchar(15) NOT NULL,
  `d_gid` varchar(20) NOT NULL,
  `d_file` int(11) NOT NULL,
  `d_type` enum('@#DGREGORIAN@','@#DJULIAN@','@#DHEBREW@','@#DFRENCH R@','@#DHIJRI@','@#DROMAN@','@#DJALALI@') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `wt_dates`
--

INSERT INTO `wt_dates` (`d_day`, `d_month`, `d_mon`, `d_year`, `d_julianday1`, `d_julianday2`, `d_fact`, `d_gid`, `d_file`, `d_type`) VALUES
(1, 'JAN', 1, 1850, 2396759, 2396759, 'BIRT', 'X1', 1, '@#DGREGORIAN@');

-- --------------------------------------------------------

--
-- Structure de la table `wt_default_resn`
--

CREATE TABLE `wt_default_resn` (
  `default_resn_id` int(11) NOT NULL,
  `gedcom_id` int(11) NOT NULL,
  `xref` varchar(20) DEFAULT NULL,
  `tag_type` varchar(15) DEFAULT NULL,
  `resn` enum('none','privacy','confidential','hidden') NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `wt_default_resn`
--

INSERT INTO `wt_default_resn` (`default_resn_id`, `gedcom_id`, `xref`, `tag_type`, `resn`, `comment`, `updated`) VALUES
(1, -1, NULL, 'SSN', 'confidential', NULL, '2025-03-18 18:38:36'),
(2, -1, NULL, 'SOUR', 'privacy', NULL, '2025-03-18 18:38:36'),
(3, -1, NULL, 'REPO', 'privacy', NULL, '2025-03-18 18:38:36'),
(4, -1, NULL, 'SUBM', 'confidential', NULL, '2025-03-18 18:38:36'),
(5, -1, NULL, 'SUBN', 'confidential', NULL, '2025-03-18 18:38:36'),
(6, 1, NULL, 'SSN', 'confidential', NULL, '2025-03-18 18:39:00'),
(7, 1, NULL, 'SOUR', 'privacy', NULL, '2025-03-18 18:39:00'),
(8, 1, NULL, 'REPO', 'privacy', NULL, '2025-03-18 18:39:00'),
(9, 1, NULL, 'SUBM', 'confidential', NULL, '2025-03-18 18:39:00'),
(10, 1, NULL, 'SUBN', 'confidential', NULL, '2025-03-18 18:39:00');

-- --------------------------------------------------------

--
-- Structure de la table `wt_families`
--

CREATE TABLE `wt_families` (
  `f_id` varchar(20) NOT NULL,
  `f_file` int(11) NOT NULL,
  `f_husb` varchar(20) DEFAULT NULL,
  `f_wife` varchar(20) DEFAULT NULL,
  `f_gedcom` longtext NOT NULL,
  `f_numchil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wt_favorite`
--

CREATE TABLE `wt_favorite` (
  `favorite_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `gedcom_id` int(11) NOT NULL,
  `xref` varchar(20) DEFAULT NULL,
  `favorite_type` enum('INDI','FAM','SOUR','REPO','OBJE','NOTE','URL') NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wt_gedcom`
--

CREATE TABLE `wt_gedcom` (
  `gedcom_id` int(11) NOT NULL,
  `gedcom_name` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `wt_gedcom`
--

INSERT INTO `wt_gedcom` (`gedcom_id`, `gedcom_name`, `sort_order`) VALUES
(-1, 'DEFAULT_TREE', 0),
(1, 'monarbre', 0);

-- --------------------------------------------------------

--
-- Structure de la table `wt_gedcom_chunk`
--

CREATE TABLE `wt_gedcom_chunk` (
  `gedcom_chunk_id` int(11) NOT NULL,
  `gedcom_id` int(11) NOT NULL,
  `chunk_data` longtext NOT NULL,
  `imported` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wt_gedcom_setting`
--

CREATE TABLE `wt_gedcom_setting` (
  `gedcom_id` int(11) NOT NULL,
  `setting_name` varchar(32) NOT NULL,
  `setting_value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `wt_gedcom_setting`
--

INSERT INTO `wt_gedcom_setting` (`gedcom_id`, `setting_name`, `setting_value`) VALUES
(1, 'CONTACT_USER_ID', '1'),
(1, 'imported', '1'),
(1, 'LANGUAGE', 'fr'),
(1, 'REQUIRE_AUTHENTICATION', ''),
(1, 'title', 'GASPAR'),
(1, 'WEBMASTER_USER_ID', '1');

-- --------------------------------------------------------

--
-- Structure de la table `wt_hit_counter`
--

CREATE TABLE `wt_hit_counter` (
  `gedcom_id` int(11) NOT NULL,
  `page_name` varchar(32) NOT NULL,
  `page_parameter` varchar(32) NOT NULL,
  `page_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wt_individuals`
--

CREATE TABLE `wt_individuals` (
  `i_id` varchar(20) NOT NULL,
  `i_file` int(11) NOT NULL,
  `i_rin` varchar(20) NOT NULL,
  `i_sex` enum('U','M','F') NOT NULL,
  `i_gedcom` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `wt_individuals`
--

INSERT INTO `wt_individuals` (`i_id`, `i_file`, `i_rin`, `i_sex`, `i_gedcom`) VALUES
('X1', 1, 'X1', 'M', '0 @X1@ INDI\n1 NAME Jean /DUPONT/\n1 SEX M\n1 BIRT\n2 DATE 01 JAN 1850\n2 NOTE Modifier cette personne et remplacer ses informations par les vôtres.');

-- --------------------------------------------------------

--
-- Structure de la table `wt_link`
--

CREATE TABLE `wt_link` (
  `l_file` int(11) NOT NULL,
  `l_from` varchar(20) NOT NULL,
  `l_type` varchar(15) NOT NULL,
  `l_to` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wt_log`
--

CREATE TABLE `wt_log` (
  `log_id` int(11) NOT NULL,
  `log_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `log_type` enum('auth','config','debug','edit','error','media','search') NOT NULL,
  `log_message` longtext NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `gedcom_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `wt_log`
--

INSERT INTO `wt_log` (`log_id`, `log_time`, `log_type`, `log_message`, `ip_address`, `user_id`, `gedcom_id`) VALUES
(1, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"1\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(2, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"2\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(3, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"3\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(4, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"4\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(5, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"5\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(6, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"6\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(7, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"7\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(8, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"8\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(9, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"9\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(10, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"10\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(11, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"11\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(12, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"12\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(13, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"13\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(14, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"14\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(15, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"15\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(16, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"16\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(17, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"17\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(18, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"18\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(19, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"19\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(20, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"20\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(21, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"21\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(22, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"22\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(23, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"23\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(24, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"24\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(25, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"25\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(26, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"26\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(27, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"27\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(28, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"28\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(29, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"29\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(30, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"30\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(31, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"31\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(32, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"32\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(33, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"33\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(34, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"34\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(35, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"35\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(36, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"36\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(37, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"37\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(38, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"38\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(39, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"39\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(40, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"40\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(41, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"41\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(42, '2025-03-18 18:38:35', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"42\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(43, '2025-03-18 18:38:36', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"43\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(44, '2025-03-18 18:38:36', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"44\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(45, '2025-03-18 18:38:36', 'config', 'Site preference \"WT_SCHEMA_VERSION\" set to \"45\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', NULL, NULL),
(46, '2025-03-18 18:38:37', 'config', 'Site preference \"LATEST_WT_VERSION_TIMESTAMP\" set to \"1742323117\"', '127.0.0.1', 1, NULL),
(47, '2025-03-18 18:38:37', 'config', 'Site preference \"SITE_UUID\" set to \"92ffe134a6ca44c59f83258c9d0f3a13\"', '127.0.0.1', 1, NULL),
(48, '2025-03-18 18:38:37', 'config', 'Site preference \"LATEST_WT_VERSION\" set to \"2.2.1|2.0.0|https://github.com/fisharebest/webtrees/releases/download/2.2.1/webtrees-2.2.1.zip\"', '127.0.0.1', 1, NULL),
(49, '2025-03-18 18:39:00', 'config', 'Tree preference \"imported\" set to \"1\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', 1, 1),
(50, '2025-03-18 18:39:00', 'config', 'Tree preference \"title\" set to \"GASPAR\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', 1, 1),
(51, '2025-03-18 18:39:00', 'config', 'Tree preference \"REQUIRE_AUTHENTICATION\" set to \"\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', 1, 1),
(52, '2025-03-18 18:39:00', 'config', 'Tree preference \"CONTACT_USER_ID\" set to \"1\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', 1, 1),
(53, '2025-03-18 18:39:00', 'config', 'Tree preference \"WEBMASTER_USER_ID\" set to \"1\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', 1, 1),
(54, '2025-03-18 18:39:00', 'config', 'Tree preference \"LANGUAGE\" set to \"fr\"', '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `wt_media`
--

CREATE TABLE `wt_media` (
  `m_id` varchar(20) NOT NULL,
  `m_file` int(11) NOT NULL,
  `m_gedcom` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wt_media_file`
--

CREATE TABLE `wt_media_file` (
  `id` int(11) NOT NULL,
  `m_id` varchar(20) NOT NULL,
  `m_file` int(11) NOT NULL,
  `multimedia_file_refn` varchar(248) NOT NULL,
  `multimedia_format` varchar(4) NOT NULL,
  `source_media_type` varchar(15) NOT NULL,
  `descriptive_title` varchar(248) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wt_message`
--

CREATE TABLE `wt_message` (
  `message_id` int(11) NOT NULL,
  `sender` varchar(64) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wt_module`
--

CREATE TABLE `wt_module` (
  `module_name` varchar(32) NOT NULL,
  `status` enum('enabled','disabled') NOT NULL DEFAULT 'enabled',
  `tab_order` int(11) DEFAULT NULL,
  `menu_order` int(11) DEFAULT NULL,
  `sidebar_order` int(11) DEFAULT NULL,
  `footer_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `wt_module`
--

INSERT INTO `wt_module` (`module_name`, `status`, `tab_order`, `menu_order`, `sidebar_order`, `footer_order`) VALUES
('ahnentafel_report', 'enabled', NULL, NULL, NULL, NULL),
('ancestors_chart', 'enabled', NULL, NULL, NULL, NULL),
('austrian-history', 'disabled', NULL, NULL, NULL, NULL),
('austrian-presidents', 'disabled', NULL, NULL, NULL, NULL),
('bdm_report', 'enabled', NULL, NULL, NULL, NULL),
('bing-maps', 'disabled', NULL, NULL, NULL, NULL),
('bing-webmaster-tools', 'disabled', NULL, NULL, NULL, NULL),
('birth_report', 'enabled', NULL, NULL, NULL, NULL),
('branches_list', 'enabled', NULL, NULL, NULL, NULL),
('british-monarchs', 'disabled', NULL, NULL, NULL, NULL),
('british-prime-ministers', 'disabled', NULL, NULL, NULL, NULL),
('british-social-history', 'disabled', NULL, NULL, NULL, NULL),
('calendar-menu', 'enabled', NULL, NULL, NULL, NULL),
('cemetery_report', 'enabled', NULL, NULL, NULL, NULL),
('change_report', 'enabled', NULL, NULL, NULL, NULL),
('charts', 'enabled', NULL, NULL, NULL, NULL),
('charts-menu', 'enabled', NULL, NULL, NULL, NULL),
('check-for-new-version', 'enabled', NULL, NULL, NULL, NULL),
('ckeditor', 'enabled', NULL, NULL, NULL, NULL),
('clippings', 'enabled', NULL, NULL, NULL, NULL),
('clouds', 'enabled', NULL, NULL, NULL, NULL),
('colors', 'enabled', NULL, NULL, NULL, NULL),
('compact-chart', 'enabled', NULL, NULL, NULL, NULL),
('contact-links', 'enabled', NULL, NULL, NULL, NULL),
('custom-css-js', 'disabled', NULL, NULL, NULL, NULL),
('czech-leaders', 'disabled', NULL, NULL, NULL, NULL),
('death_report', 'enabled', NULL, NULL, NULL, NULL),
('descendancy', 'enabled', NULL, NULL, NULL, NULL),
('descendancy_chart', 'enabled', NULL, NULL, NULL, NULL),
('descendancy_report', 'enabled', NULL, NULL, NULL, NULL),
('dutch_monarchs', 'disabled', NULL, NULL, NULL, NULL),
('dutch_prime_ministers', 'disabled', NULL, NULL, NULL, NULL),
('esri-maps', 'disabled', NULL, NULL, NULL, NULL),
('extra_info', 'enabled', NULL, NULL, NULL, NULL),
('fab', 'enabled', NULL, NULL, NULL, NULL),
('fact_sources', 'enabled', NULL, NULL, NULL, NULL),
('family_book_chart', 'enabled', NULL, NULL, NULL, NULL),
('family_group_report', 'enabled', NULL, NULL, NULL, NULL),
('family_list', 'enabled', NULL, NULL, NULL, NULL),
('family_nav', 'enabled', NULL, NULL, NULL, NULL),
('fan_chart', 'enabled', NULL, NULL, NULL, NULL),
('faq', 'enabled', NULL, NULL, NULL, NULL),
('fix-add-death', 'enabled', NULL, NULL, NULL, NULL),
('fix-ceme-tag', 'enabled', NULL, NULL, NULL, NULL),
('fix-duplicate-links', 'enabled', NULL, NULL, NULL, NULL),
('fix-name-slashes-spaces', 'enabled', NULL, NULL, NULL, NULL),
('fix-name-tags', 'enabled', NULL, NULL, NULL, NULL),
('fix-place-names', 'enabled', NULL, NULL, NULL, NULL),
('fix-prim-tag', 'enabled', NULL, NULL, NULL, NULL),
('fix-search-and-replace', 'enabled', NULL, NULL, NULL, NULL),
('fix-wt-obje-sort', 'enabled', NULL, NULL, NULL, NULL),
('french-history', 'disabled', NULL, NULL, NULL, NULL),
('gedcom_block', 'enabled', NULL, NULL, NULL, NULL),
('gedcom_favorites', 'enabled', NULL, NULL, NULL, NULL),
('gedcom_news', 'enabled', NULL, NULL, NULL, NULL),
('gedcom_stats', 'enabled', NULL, NULL, NULL, NULL),
('GEDFact_assistant', 'enabled', NULL, NULL, NULL, NULL),
('geonames', 'disabled', NULL, NULL, NULL, NULL),
('google-analytics', 'disabled', NULL, NULL, NULL, NULL),
('google-maps', 'disabled', NULL, NULL, NULL, NULL),
('google-webmaster-tools', 'disabled', NULL, NULL, NULL, NULL),
('here-maps', 'disabled', NULL, NULL, NULL, NULL),
('hit-counter', 'enabled', NULL, NULL, NULL, NULL),
('hourglass_chart', 'enabled', NULL, NULL, NULL, NULL),
('html', 'enabled', NULL, NULL, NULL, NULL),
('individual_ext_report', 'enabled', NULL, NULL, NULL, NULL),
('individual_list', 'enabled', NULL, NULL, NULL, NULL),
('individual_report', 'enabled', NULL, NULL, NULL, NULL),
('language-af', 'enabled', NULL, NULL, NULL, NULL),
('language-ar', 'enabled', NULL, NULL, NULL, NULL),
('language-bg', 'enabled', NULL, NULL, NULL, NULL),
('language-bs', 'enabled', NULL, NULL, NULL, NULL),
('language-ca', 'enabled', NULL, NULL, NULL, NULL),
('language-cs', 'enabled', NULL, NULL, NULL, NULL),
('language-cy', 'disabled', NULL, NULL, NULL, NULL),
('language-da', 'enabled', NULL, NULL, NULL, NULL),
('language-de', 'enabled', NULL, NULL, NULL, NULL),
('language-dv', 'disabled', NULL, NULL, NULL, NULL),
('language-el', 'enabled', NULL, NULL, NULL, NULL),
('language-en-AU', 'disabled', NULL, NULL, NULL, NULL),
('language-en-GB', 'enabled', NULL, NULL, NULL, NULL),
('language-en-US', 'enabled', NULL, NULL, NULL, NULL),
('language-es', 'enabled', NULL, NULL, NULL, NULL),
('language-et', 'enabled', NULL, NULL, NULL, NULL),
('language-eu', 'disabled', NULL, NULL, NULL, NULL),
('language-fa', 'disabled', NULL, NULL, NULL, NULL),
('language-fi', 'enabled', NULL, NULL, NULL, NULL),
('language-fo', 'disabled', NULL, NULL, NULL, NULL),
('language-fr', 'enabled', NULL, NULL, NULL, NULL),
('language-fr-CA', 'disabled', NULL, NULL, NULL, NULL),
('language-gl', 'enabled', NULL, NULL, NULL, NULL),
('language-he', 'enabled', NULL, NULL, NULL, NULL),
('language-hi', 'enabled', NULL, NULL, NULL, NULL),
('language-hr', 'enabled', NULL, NULL, NULL, NULL),
('language-hu', 'enabled', NULL, NULL, NULL, NULL),
('language-id', 'disabled', NULL, NULL, NULL, NULL),
('language-is', 'enabled', NULL, NULL, NULL, NULL),
('language-it', 'enabled', NULL, NULL, NULL, NULL),
('language-ja', 'disabled', NULL, NULL, NULL, NULL),
('language-jv', 'disabled', NULL, NULL, NULL, NULL),
('language-ka', 'enabled', NULL, NULL, NULL, NULL),
('language-kk', 'enabled', NULL, NULL, NULL, NULL),
('language-ko', 'disabled', NULL, NULL, NULL, NULL),
('language-ku', 'disabled', NULL, NULL, NULL, NULL),
('language-ln', 'disabled', NULL, NULL, NULL, NULL),
('language-lt', 'enabled', NULL, NULL, NULL, NULL),
('language-lv', 'disabled', NULL, NULL, NULL, NULL),
('language-mi', 'disabled', NULL, NULL, NULL, NULL),
('language-mr', 'disabled', NULL, NULL, NULL, NULL),
('language-ms', 'disabled', NULL, NULL, NULL, NULL),
('language-nb', 'disabled', NULL, NULL, NULL, NULL),
('language-ne', 'disabled', NULL, NULL, NULL, NULL),
('language-nl', 'enabled', NULL, NULL, NULL, NULL),
('language-nn', 'disabled', NULL, NULL, NULL, NULL),
('language-oc', 'disabled', NULL, NULL, NULL, NULL),
('language-pl', 'enabled', NULL, NULL, NULL, NULL),
('language-pt', 'enabled', NULL, NULL, NULL, NULL),
('language-pt-BR', 'disabled', NULL, NULL, NULL, NULL),
('language-ro', 'disabled', NULL, NULL, NULL, NULL),
('language-ru', 'enabled', NULL, NULL, NULL, NULL),
('language-sk', 'enabled', NULL, NULL, NULL, NULL),
('language-sl', 'disabled', NULL, NULL, NULL, NULL),
('language-sq', 'disabled', NULL, NULL, NULL, NULL),
('language-sr', 'disabled', NULL, NULL, NULL, NULL),
('language-sr-Latn', 'disabled', NULL, NULL, NULL, NULL),
('language-su', 'disabled', NULL, NULL, NULL, NULL),
('language-sv', 'enabled', NULL, NULL, NULL, NULL),
('language-sw', 'disabled', NULL, NULL, NULL, NULL),
('language-ta', 'disabled', NULL, NULL, NULL, NULL),
('language-th', 'disabled', NULL, NULL, NULL, NULL),
('language-tl', 'disabled', NULL, NULL, NULL, NULL),
('language-tr', 'enabled', NULL, NULL, NULL, NULL),
('language-tt', 'disabled', NULL, NULL, NULL, NULL),
('language-uk', 'enabled', NULL, NULL, NULL, NULL),
('language-ur', 'disabled', NULL, NULL, NULL, NULL),
('language-uz', 'disabled', NULL, NULL, NULL, NULL),
('language-vi', 'enabled', NULL, NULL, NULL, NULL),
('language-yi', 'disabled', NULL, NULL, NULL, NULL),
('language-zh-Hans', 'enabled', NULL, NULL, NULL, NULL),
('language-zh-Hant', 'enabled', NULL, NULL, NULL, NULL),
('legacy-urls', 'enabled', NULL, NULL, NULL, NULL),
('lifespans_chart', 'enabled', NULL, NULL, NULL, NULL),
('lightbox', 'enabled', NULL, NULL, NULL, NULL),
('lists-menu', 'enabled', NULL, NULL, NULL, NULL),
('location_list', 'enabled', NULL, NULL, NULL, NULL),
('logged_in', 'enabled', NULL, NULL, NULL, NULL),
('login_block', 'enabled', NULL, NULL, NULL, NULL),
('low_countries_rulers', 'disabled', NULL, NULL, NULL, NULL),
('map-link-bing', 'enabled', NULL, NULL, NULL, NULL),
('map-link-google', 'enabled', NULL, NULL, NULL, NULL),
('map-link-openstreetmap', 'enabled', NULL, NULL, NULL, NULL),
('map-location-geonames', 'disabled', NULL, NULL, NULL, NULL),
('map-location-nominatim', 'disabled', NULL, NULL, NULL, NULL),
('map-location-ors', 'disabled', NULL, NULL, NULL, NULL),
('mapbox', 'disabled', NULL, NULL, NULL, NULL),
('marriage_report', 'enabled', NULL, NULL, NULL, NULL),
('matomo-analytics', 'disabled', NULL, NULL, NULL, NULL),
('media', 'enabled', NULL, NULL, NULL, NULL),
('media_list', 'enabled', NULL, NULL, NULL, NULL),
('minimal', 'enabled', NULL, NULL, NULL, NULL),
('missing_facts_report', 'enabled', NULL, NULL, NULL, NULL),
('notes', 'enabled', NULL, NULL, NULL, NULL),
('note_list', 'enabled', NULL, NULL, NULL, NULL),
('nz-leaders', 'disabled', NULL, NULL, NULL, NULL),
('occupation_report', 'enabled', NULL, NULL, NULL, NULL),
('openrouteservice', 'disabled', NULL, NULL, NULL, NULL),
('openstreetmap', 'enabled', NULL, NULL, NULL, NULL),
('pedigree-map', 'enabled', NULL, NULL, NULL, NULL),
('pedigree_chart', 'enabled', NULL, NULL, NULL, NULL),
('pedigree_report', 'enabled', NULL, NULL, NULL, NULL),
('personal_facts', 'enabled', NULL, NULL, NULL, NULL),
('places', 'enabled', NULL, NULL, NULL, NULL),
('places_list', 'enabled', NULL, NULL, NULL, NULL),
('powered-by-webtrees', 'enabled', NULL, NULL, NULL, NULL),
('privacy-policy', 'enabled', NULL, NULL, NULL, NULL),
('random_media', 'enabled', NULL, NULL, NULL, NULL),
('recent_changes', 'enabled', NULL, NULL, NULL, NULL),
('relationships_chart', 'enabled', NULL, NULL, NULL, NULL),
('relatives', 'enabled', NULL, NULL, NULL, NULL),
('relative_ext_report', 'enabled', NULL, NULL, NULL, NULL),
('reports-menu', 'enabled', NULL, NULL, NULL, NULL),
('repository_list', 'enabled', NULL, NULL, NULL, NULL),
('review_changes', 'enabled', NULL, NULL, NULL, NULL),
('search-menu', 'enabled', NULL, NULL, NULL, NULL),
('share-anniversary', 'enabled', NULL, NULL, NULL, NULL),
('share-url', 'enabled', NULL, NULL, NULL, NULL),
('sitemap', 'disabled', NULL, NULL, NULL, NULL),
('sources_tab', 'enabled', NULL, NULL, NULL, NULL),
('source_list', 'enabled', NULL, NULL, NULL, NULL),
('statcounter', 'disabled', NULL, NULL, NULL, NULL),
('statistics_chart', 'enabled', NULL, NULL, NULL, NULL),
('stories', 'enabled', NULL, NULL, NULL, NULL),
('submitter_list', 'disabled', NULL, NULL, NULL, NULL),
('theme_select', 'enabled', NULL, NULL, NULL, NULL),
('timeline_chart', 'enabled', NULL, NULL, NULL, NULL),
('todays_events', 'enabled', NULL, NULL, NULL, NULL),
('todo', 'enabled', NULL, NULL, NULL, NULL),
('top10_givnnames', 'enabled', NULL, NULL, NULL, NULL),
('top10_pageviews', 'enabled', NULL, NULL, NULL, NULL),
('top10_surnames', 'enabled', NULL, NULL, NULL, NULL),
('tree', 'enabled', NULL, NULL, NULL, NULL),
('trees-menu', 'enabled', NULL, NULL, NULL, NULL),
('upcoming_events', 'enabled', NULL, NULL, NULL, NULL),
('us-presidents', 'disabled', NULL, NULL, NULL, NULL),
('user_blog', 'enabled', NULL, NULL, NULL, NULL),
('user_favorites', 'enabled', NULL, NULL, NULL, NULL),
('user_messages', 'enabled', NULL, NULL, NULL, NULL),
('user_welcome', 'enabled', NULL, NULL, NULL, NULL),
('webtrees', 'enabled', NULL, NULL, NULL, NULL),
('xenea', 'enabled', NULL, NULL, NULL, NULL),
('yahrzeit', 'enabled', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `wt_module_privacy`
--

CREATE TABLE `wt_module_privacy` (
  `id` int(10) UNSIGNED NOT NULL,
  `module_name` varchar(32) NOT NULL,
  `gedcom_id` int(11) NOT NULL,
  `interface` varchar(255) NOT NULL,
  `access_level` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wt_module_setting`
--

CREATE TABLE `wt_module_setting` (
  `module_name` varchar(32) NOT NULL,
  `setting_name` varchar(32) NOT NULL,
  `setting_value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wt_name`
--

CREATE TABLE `wt_name` (
  `n_file` int(11) NOT NULL,
  `n_id` varchar(20) NOT NULL,
  `n_num` int(11) NOT NULL,
  `n_type` varchar(15) NOT NULL,
  `n_sort` varchar(255) NOT NULL,
  `n_full` varchar(255) NOT NULL,
  `n_surname` varchar(255) DEFAULT NULL,
  `n_surn` varchar(255) DEFAULT NULL,
  `n_givn` varchar(255) DEFAULT NULL,
  `n_soundex_givn_std` varchar(255) DEFAULT NULL,
  `n_soundex_surn_std` varchar(255) DEFAULT NULL,
  `n_soundex_givn_dm` varchar(255) DEFAULT NULL,
  `n_soundex_surn_dm` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `wt_name`
--

INSERT INTO `wt_name` (`n_file`, `n_id`, `n_num`, `n_type`, `n_sort`, `n_full`, `n_surname`, `n_surn`, `n_givn`, `n_soundex_givn_std`, `n_soundex_surn_std`, `n_soundex_givn_dm`, `n_soundex_surn_dm`) VALUES
(1, 'X1', 0, 'NAME', 'DUPONT,Jean', 'Jean DUPONT', 'DUPONT', 'DUPONT', 'Jean', 'J500', 'D153', '160000:460000:560000', '376300');

-- --------------------------------------------------------

--
-- Structure de la table `wt_news`
--

CREATE TABLE `wt_news` (
  `news_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `gedcom_id` int(11) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wt_other`
--

CREATE TABLE `wt_other` (
  `o_id` varchar(20) NOT NULL,
  `o_file` int(11) NOT NULL,
  `o_type` varchar(15) NOT NULL,
  `o_gedcom` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `wt_other`
--

INSERT INTO `wt_other` (`o_id`, `o_file`, `o_type`, `o_gedcom`) VALUES
('HEAD', 1, 'HEAD', '0 HEAD\n1 SOUR webtrees\n1 DEST webtrees\n1 GEDC\n2 VERS 5.5.1\n2 FORM LINEAGE-LINKED\n1 CHAR UTF-8\n1 DATE 18 MAR 2025');

-- --------------------------------------------------------

--
-- Structure de la table `wt_placelinks`
--

CREATE TABLE `wt_placelinks` (
  `pl_p_id` int(11) NOT NULL,
  `pl_gid` varchar(20) NOT NULL,
  `pl_file` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wt_places`
--

CREATE TABLE `wt_places` (
  `p_id` int(11) NOT NULL,
  `p_place` varchar(150) NOT NULL,
  `p_parent_id` int(11) DEFAULT NULL,
  `p_file` int(11) NOT NULL,
  `p_std_soundex` longtext DEFAULT NULL,
  `p_dm_soundex` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wt_place_location`
--

CREATE TABLE `wt_place_location` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `place` varchar(120) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wt_session`
--

CREATE TABLE `wt_session` (
  `session_id` varchar(256) NOT NULL,
  `session_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `session_data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `wt_session`
--

INSERT INTO `wt_session` (`session_id`, `session_time`, `user_id`, `ip_address`, `session_data`) VALUES
('063597c99bfd514f0bea6a86672457e3', '2025-03-18 18:38:36', 1, '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', 'initiated|b:1;wt_user|i:1;language|s:2:\"fr\";theme|s:8:\"webtrees\";CSRF_TOKEN|s:32:\"yYBgNgQWKunn8ecrxMAqrYHVrMt1THRj\";'),
('57a60830a3e9237008212e2aa7cfa989', '2025-03-18 18:38:36', 0, '2a01:e0a:19a:8320:1ddd:9e0:3691:8f46', 'initiated|b:1;');

-- --------------------------------------------------------

--
-- Structure de la table `wt_site_setting`
--

CREATE TABLE `wt_site_setting` (
  `setting_name` varchar(32) NOT NULL,
  `setting_value` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `wt_site_setting`
--

INSERT INTO `wt_site_setting` (`setting_name`, `setting_value`) VALUES
('LANGUAGE', 'en-US'),
('LATEST_WT_VERSION', '2.2.1|2.0.0|https://github.com/fisharebest/webtrees/releases/download/2.2.1/webtrees-2.2.1.zip'),
('LATEST_WT_VERSION_TIMESTAMP', '1742323117'),
('SITE_UUID', '92ffe134a6ca44c59f83258c9d0f3a13'),
('WT_SCHEMA_VERSION', '45');

-- --------------------------------------------------------

--
-- Structure de la table `wt_sources`
--

CREATE TABLE `wt_sources` (
  `s_id` varchar(20) NOT NULL,
  `s_file` int(11) NOT NULL,
  `s_name` varchar(255) NOT NULL,
  `s_gedcom` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wt_user`
--

CREATE TABLE `wt_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(32) NOT NULL,
  `real_name` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `wt_user`
--

INSERT INTO `wt_user` (`user_id`, `user_name`, `real_name`, `email`, `password`) VALUES
(-1, 'DEFAULT_USER', 'DEFAULT_USER', 'DEFAULT_USER', 'DEFAULT_USER'),
(1, 'Gaspar', 'Éric', 'ericgaspar@free.fr', '$2y$12$68mV4IQD7ZXOKZI5d9yoc.TPaxeUKK7hFVRV7sc9O5NxpQPWXEfHa');

-- --------------------------------------------------------

--
-- Structure de la table `wt_user_gedcom_setting`
--

CREATE TABLE `wt_user_gedcom_setting` (
  `user_id` int(11) NOT NULL,
  `gedcom_id` int(11) NOT NULL,
  `setting_name` varchar(32) NOT NULL,
  `setting_value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wt_user_setting`
--

CREATE TABLE `wt_user_setting` (
  `user_id` int(11) NOT NULL,
  `setting_name` varchar(32) NOT NULL,
  `setting_value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `wt_user_setting`
--

INSERT INTO `wt_user_setting` (`user_id`, `setting_name`, `setting_value`) VALUES
(1, 'canadmin', '1'),
(1, 'language', 'fr'),
(1, 'sessiontime', '1742323116'),
(1, 'verified', '1'),
(1, 'verified_by_admin', '1'),
(1, 'visibleonline', '1');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `wt_block`
--
ALTER TABLE `wt_block`
  ADD PRIMARY KEY (`block_id`),
  ADD KEY `wt_block_module_name_index` (`module_name`),
  ADD KEY `wt_block_gedcom_id_index` (`gedcom_id`),
  ADD KEY `wt_block_user_id_index` (`user_id`);

--
-- Index pour la table `wt_block_setting`
--
ALTER TABLE `wt_block_setting`
  ADD PRIMARY KEY (`block_id`,`setting_name`);

--
-- Index pour la table `wt_change`
--
ALTER TABLE `wt_change`
  ADD PRIMARY KEY (`change_id`),
  ADD KEY `wt_change_gedcom_id_status_xref_index` (`gedcom_id`,`status`,`xref`),
  ADD KEY `wt_change_user_id_index` (`user_id`);

--
-- Index pour la table `wt_dates`
--
ALTER TABLE `wt_dates`
  ADD KEY `wt_dates_d_day_index` (`d_day`),
  ADD KEY `wt_dates_d_month_index` (`d_month`),
  ADD KEY `wt_dates_d_mon_index` (`d_mon`),
  ADD KEY `wt_dates_d_year_index` (`d_year`),
  ADD KEY `wt_dates_d_julianday1_index` (`d_julianday1`),
  ADD KEY `wt_dates_d_julianday2_index` (`d_julianday2`),
  ADD KEY `wt_dates_d_gid_index` (`d_gid`),
  ADD KEY `wt_dates_d_file_index` (`d_file`),
  ADD KEY `wt_dates_d_type_index` (`d_type`),
  ADD KEY `wt_dates_d_fact_d_gid_index` (`d_fact`,`d_gid`);

--
-- Index pour la table `wt_default_resn`
--
ALTER TABLE `wt_default_resn`
  ADD PRIMARY KEY (`default_resn_id`),
  ADD UNIQUE KEY `wt_default_resn_gedcom_id_xref_tag_type_unique` (`gedcom_id`,`xref`,`tag_type`);

--
-- Index pour la table `wt_families`
--
ALTER TABLE `wt_families`
  ADD PRIMARY KEY (`f_id`,`f_file`),
  ADD UNIQUE KEY `wt_families_f_file_f_id_unique` (`f_file`,`f_id`),
  ADD KEY `wt_families_f_husb_index` (`f_husb`),
  ADD KEY `wt_families_f_wife_index` (`f_wife`);

--
-- Index pour la table `wt_favorite`
--
ALTER TABLE `wt_favorite`
  ADD PRIMARY KEY (`favorite_id`),
  ADD KEY `wt_favorite_user_id_index` (`user_id`),
  ADD KEY `wt_favorite_gedcom_id_user_id_index` (`gedcom_id`,`user_id`);

--
-- Index pour la table `wt_gedcom`
--
ALTER TABLE `wt_gedcom`
  ADD PRIMARY KEY (`gedcom_id`),
  ADD UNIQUE KEY `wt_gedcom_gedcom_name_unique` (`gedcom_name`),
  ADD KEY `wt_gedcom_sort_order_index` (`sort_order`);

--
-- Index pour la table `wt_gedcom_chunk`
--
ALTER TABLE `wt_gedcom_chunk`
  ADD PRIMARY KEY (`gedcom_chunk_id`),
  ADD KEY `wt_gedcom_chunk_gedcom_id_imported_index` (`gedcom_id`,`imported`);

--
-- Index pour la table `wt_gedcom_setting`
--
ALTER TABLE `wt_gedcom_setting`
  ADD PRIMARY KEY (`gedcom_id`,`setting_name`);

--
-- Index pour la table `wt_hit_counter`
--
ALTER TABLE `wt_hit_counter`
  ADD PRIMARY KEY (`gedcom_id`,`page_name`,`page_parameter`);

--
-- Index pour la table `wt_individuals`
--
ALTER TABLE `wt_individuals`
  ADD PRIMARY KEY (`i_id`,`i_file`),
  ADD UNIQUE KEY `wt_individuals_i_file_i_id_unique` (`i_file`,`i_id`);

--
-- Index pour la table `wt_link`
--
ALTER TABLE `wt_link`
  ADD PRIMARY KEY (`l_from`,`l_file`,`l_type`,`l_to`),
  ADD UNIQUE KEY `wt_link_l_to_l_file_l_type_l_from_unique` (`l_to`,`l_file`,`l_type`,`l_from`);

--
-- Index pour la table `wt_log`
--
ALTER TABLE `wt_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `wt_log_log_time_index` (`log_time`),
  ADD KEY `wt_log_log_type_index` (`log_type`),
  ADD KEY `wt_log_ip_address_index` (`ip_address`),
  ADD KEY `wt_log_user_id_index` (`user_id`),
  ADD KEY `wt_log_gedcom_id_index` (`gedcom_id`);

--
-- Index pour la table `wt_media`
--
ALTER TABLE `wt_media`
  ADD PRIMARY KEY (`m_file`,`m_id`),
  ADD UNIQUE KEY `wt_media_m_id_m_file_unique` (`m_id`,`m_file`);

--
-- Index pour la table `wt_media_file`
--
ALTER TABLE `wt_media_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wt_media_file_m_id_m_file_index` (`m_id`,`m_file`),
  ADD KEY `wt_media_file_m_file_m_id_index` (`m_file`,`m_id`),
  ADD KEY `wt_media_file_m_file_multimedia_file_refn_index` (`m_file`,`multimedia_file_refn`),
  ADD KEY `wt_media_file_m_file_multimedia_format_index` (`m_file`,`multimedia_format`),
  ADD KEY `wt_media_file_m_file_source_media_type_index` (`m_file`,`source_media_type`),
  ADD KEY `wt_media_file_m_file_descriptive_title_index` (`m_file`,`descriptive_title`);

--
-- Index pour la table `wt_message`
--
ALTER TABLE `wt_message`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `wt_message_user_id_index` (`user_id`);

--
-- Index pour la table `wt_module`
--
ALTER TABLE `wt_module`
  ADD PRIMARY KEY (`module_name`);

--
-- Index pour la table `wt_module_privacy`
--
ALTER TABLE `wt_module_privacy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wt_module_privacy_ix1` (`gedcom_id`,`module_name`,`interface`),
  ADD UNIQUE KEY `wt_module_privacy_ix2` (`module_name`,`gedcom_id`,`interface`);

--
-- Index pour la table `wt_module_setting`
--
ALTER TABLE `wt_module_setting`
  ADD PRIMARY KEY (`module_name`,`setting_name`);

--
-- Index pour la table `wt_name`
--
ALTER TABLE `wt_name`
  ADD PRIMARY KEY (`n_id`,`n_file`,`n_num`),
  ADD KEY `wt_name_n_full_n_id_n_file_index` (`n_full`,`n_id`,`n_file`),
  ADD KEY `wt_name_n_surn_n_file_n_type_n_id_index` (`n_surn`,`n_file`,`n_type`,`n_id`),
  ADD KEY `wt_name_n_givn_n_file_n_type_n_id_index` (`n_givn`,`n_file`,`n_type`,`n_id`);

--
-- Index pour la table `wt_news`
--
ALTER TABLE `wt_news`
  ADD PRIMARY KEY (`news_id`),
  ADD KEY `wt_news_user_id_updated_index` (`user_id`,`updated`),
  ADD KEY `wt_news_gedcom_id_updated_index` (`gedcom_id`,`updated`);

--
-- Index pour la table `wt_other`
--
ALTER TABLE `wt_other`
  ADD PRIMARY KEY (`o_id`,`o_file`),
  ADD UNIQUE KEY `wt_other_o_file_o_id_unique` (`o_file`,`o_id`);

--
-- Index pour la table `wt_placelinks`
--
ALTER TABLE `wt_placelinks`
  ADD PRIMARY KEY (`pl_p_id`,`pl_gid`,`pl_file`),
  ADD KEY `wt_placelinks_pl_p_id_index` (`pl_p_id`),
  ADD KEY `wt_placelinks_pl_gid_index` (`pl_gid`),
  ADD KEY `wt_placelinks_pl_file_index` (`pl_file`);

--
-- Index pour la table `wt_places`
--
ALTER TABLE `wt_places`
  ADD PRIMARY KEY (`p_id`),
  ADD UNIQUE KEY `wt_places_p_parent_id_p_file_p_place_unique` (`p_parent_id`,`p_file`,`p_place`),
  ADD KEY `wt_places_p_file_p_place_index` (`p_file`,`p_place`);

--
-- Index pour la table `wt_place_location`
--
ALTER TABLE `wt_place_location`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wt_place_location_parent_id_place_unique` (`parent_id`,`place`),
  ADD UNIQUE KEY `wt_place_location_place_parent_id_unique` (`place`,`parent_id`),
  ADD KEY `wt_place_location_latitude_index` (`latitude`),
  ADD KEY `wt_place_location_longitude_index` (`longitude`);

--
-- Index pour la table `wt_session`
--
ALTER TABLE `wt_session`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `wt_session_session_time_index` (`session_time`),
  ADD KEY `wt_session_user_id_ip_address_index` (`user_id`,`ip_address`);

--
-- Index pour la table `wt_site_setting`
--
ALTER TABLE `wt_site_setting`
  ADD PRIMARY KEY (`setting_name`);

--
-- Index pour la table `wt_sources`
--
ALTER TABLE `wt_sources`
  ADD PRIMARY KEY (`s_id`,`s_file`),
  ADD UNIQUE KEY `wt_sources_s_file_s_id_unique` (`s_file`,`s_id`),
  ADD KEY `wt_sources_s_name_index` (`s_name`);

--
-- Index pour la table `wt_user`
--
ALTER TABLE `wt_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `wt_user_user_name_unique` (`user_name`),
  ADD UNIQUE KEY `wt_user_email_unique` (`email`);

--
-- Index pour la table `wt_user_gedcom_setting`
--
ALTER TABLE `wt_user_gedcom_setting`
  ADD PRIMARY KEY (`user_id`,`gedcom_id`,`setting_name`),
  ADD KEY `wt_user_gedcom_setting_gedcom_id_index` (`gedcom_id`);

--
-- Index pour la table `wt_user_setting`
--
ALTER TABLE `wt_user_setting`
  ADD PRIMARY KEY (`user_id`,`setting_name`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `wt_block`
--
ALTER TABLE `wt_block`
  MODIFY `block_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wt_change`
--
ALTER TABLE `wt_change`
  MODIFY `change_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wt_default_resn`
--
ALTER TABLE `wt_default_resn`
  MODIFY `default_resn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `wt_favorite`
--
ALTER TABLE `wt_favorite`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wt_gedcom`
--
ALTER TABLE `wt_gedcom`
  MODIFY `gedcom_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `wt_gedcom_chunk`
--
ALTER TABLE `wt_gedcom_chunk`
  MODIFY `gedcom_chunk_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wt_log`
--
ALTER TABLE `wt_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT pour la table `wt_media_file`
--
ALTER TABLE `wt_media_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wt_message`
--
ALTER TABLE `wt_message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wt_module_privacy`
--
ALTER TABLE `wt_module_privacy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wt_news`
--
ALTER TABLE `wt_news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wt_places`
--
ALTER TABLE `wt_places`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wt_place_location`
--
ALTER TABLE `wt_place_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wt_user`
--
ALTER TABLE `wt_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `wt_block`
--
ALTER TABLE `wt_block`
  ADD CONSTRAINT `wt_block_gedcom_id_foreign` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`),
  ADD CONSTRAINT `wt_block_module_name_foreign` FOREIGN KEY (`module_name`) REFERENCES `wt_module` (`module_name`),
  ADD CONSTRAINT `wt_block_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`);

--
-- Contraintes pour la table `wt_block_setting`
--
ALTER TABLE `wt_block_setting`
  ADD CONSTRAINT `wt_block_setting_block_id_foreign` FOREIGN KEY (`block_id`) REFERENCES `wt_block` (`block_id`);

--
-- Contraintes pour la table `wt_change`
--
ALTER TABLE `wt_change`
  ADD CONSTRAINT `wt_change_gedcom_id_foreign` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`),
  ADD CONSTRAINT `wt_change_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`);

--
-- Contraintes pour la table `wt_default_resn`
--
ALTER TABLE `wt_default_resn`
  ADD CONSTRAINT `wt_default_resn_gedcom_id_foreign` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`);

--
-- Contraintes pour la table `wt_favorite`
--
ALTER TABLE `wt_favorite`
  ADD CONSTRAINT `wt_favorite_gedcom_id_foreign` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wt_favorite_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `wt_gedcom_chunk`
--
ALTER TABLE `wt_gedcom_chunk`
  ADD CONSTRAINT `wt_gedcom_chunk_gedcom_id_foreign` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`);

--
-- Contraintes pour la table `wt_gedcom_setting`
--
ALTER TABLE `wt_gedcom_setting`
  ADD CONSTRAINT `wt_gedcom_setting_gedcom_id_foreign` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`);

--
-- Contraintes pour la table `wt_hit_counter`
--
ALTER TABLE `wt_hit_counter`
  ADD CONSTRAINT `wt_hit_counter_gedcom_id_foreign` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`);

--
-- Contraintes pour la table `wt_log`
--
ALTER TABLE `wt_log`
  ADD CONSTRAINT `wt_log_gedcom_id_foreign` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`),
  ADD CONSTRAINT `wt_log_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`);

--
-- Contraintes pour la table `wt_message`
--
ALTER TABLE `wt_message`
  ADD CONSTRAINT `wt_message_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`);

--
-- Contraintes pour la table `wt_module_privacy`
--
ALTER TABLE `wt_module_privacy`
  ADD CONSTRAINT `wt_module_privacy_gedcom_id_foreign` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wt_module_privacy_module_name_foreign` FOREIGN KEY (`module_name`) REFERENCES `wt_module` (`module_name`) ON DELETE CASCADE;

--
-- Contraintes pour la table `wt_module_setting`
--
ALTER TABLE `wt_module_setting`
  ADD CONSTRAINT `wt_module_setting_module_name_foreign` FOREIGN KEY (`module_name`) REFERENCES `wt_module` (`module_name`);

--
-- Contraintes pour la table `wt_news`
--
ALTER TABLE `wt_news`
  ADD CONSTRAINT `wt_news_gedcom_id_foreign` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wt_news_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `wt_place_location`
--
ALTER TABLE `wt_place_location`
  ADD CONSTRAINT `wt_place_location_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `wt_place_location` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `wt_user_gedcom_setting`
--
ALTER TABLE `wt_user_gedcom_setting`
  ADD CONSTRAINT `wt_user_gedcom_setting_gedcom_id_foreign` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`),
  ADD CONSTRAINT `wt_user_gedcom_setting_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`);

--
-- Contraintes pour la table `wt_user_setting`
--
ALTER TABLE `wt_user_setting`
  ADD CONSTRAINT `wt_user_setting_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
