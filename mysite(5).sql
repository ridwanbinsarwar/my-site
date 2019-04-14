-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2019 at 06:25 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mysite`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `contact_no` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add admin', 7, 'add_admin'),
(20, 'Can change admin', 7, 'change_admin'),
(21, 'Can delete admin', 7, 'delete_admin'),
(22, 'Can add customer', 8, 'add_customer'),
(23, 'Can change customer', 8, 'change_customer'),
(24, 'Can delete customer', 8, 'delete_customer'),
(25, 'Can add service provider', 9, 'add_serviceprovider'),
(26, 'Can change service provider', 9, 'change_serviceprovider'),
(27, 'Can delete service provider', 9, 'delete_serviceprovider'),
(28, 'Can add users', 10, 'add_users'),
(29, 'Can change users', 10, 'change_users'),
(30, 'Can delete users', 10, 'delete_users'),
(31, 'Can add location', 11, 'add_location'),
(32, 'Can change location', 11, 'change_location'),
(33, 'Can delete location', 11, 'delete_location'),
(34, 'Can add request1', 12, 'add_request1'),
(35, 'Can change request1', 12, 'change_request1'),
(36, 'Can delete request1', 12, 'delete_request1'),
(37, 'Can add request', 13, 'add_request'),
(38, 'Can change request', 13, 'change_request'),
(39, 'Can delete request', 13, 'delete_request'),
(40, 'Can add req', 14, 'add_req'),
(41, 'Can change req', 14, 'change_req'),
(42, 'Can delete req', 14, 'delete_req'),
(43, 'Can add user thread', 15, 'add_userthread'),
(44, 'Can change user thread', 15, 'change_userthread'),
(45, 'Can delete user thread', 15, 'delete_userthread'),
(46, 'Can add message', 16, 'add_message'),
(47, 'Can change message', 16, 'change_message'),
(48, 'Can delete message', 16, 'delete_message'),
(49, 'Can add thread', 17, 'add_thread'),
(50, 'Can change thread', 17, 'change_thread'),
(51, 'Can delete thread', 17, 'delete_thread'),
(52, 'Can add check_field', 18, 'add_check_field'),
(53, 'Can change check_field', 18, 'change_check_field'),
(54, 'Can delete check_field', 18, 'delete_check_field'),
(55, 'Can view log entry', 1, 'view_logentry'),
(56, 'Can view permission', 2, 'view_permission'),
(57, 'Can view group', 3, 'view_group'),
(58, 'Can view user', 4, 'view_user'),
(59, 'Can view content type', 5, 'view_contenttype'),
(60, 'Can view session', 6, 'view_session'),
(61, 'Can view admin', 7, 'view_admin'),
(62, 'Can view customer', 8, 'view_customer'),
(63, 'Can view location', 11, 'view_location'),
(64, 'Can view req', 14, 'view_req'),
(65, 'Can view service provider', 9, 'view_serviceprovider'),
(66, 'Can view users', 10, 'view_users'),
(67, 'Can view request', 13, 'view_request'),
(68, 'Can view check_field', 18, 'view_check_field'),
(69, 'Can add shop', 19, 'add_shop'),
(70, 'Can change shop', 19, 'change_shop'),
(71, 'Can delete shop', 19, 'delete_shop'),
(72, 'Can view shop', 19, 'view_shop'),
(73, 'Can add point of interest', 20, 'add_pointofinterest'),
(74, 'Can change point of interest', 20, 'change_pointofinterest'),
(75, 'Can delete point of interest', 20, 'delete_pointofinterest'),
(76, 'Can view point of interest', 20, 'view_pointofinterest'),
(77, 'Can add venue', 21, 'add_venue'),
(78, 'Can change venue', 21, 'change_venue'),
(79, 'Can delete venue', 21, 'delete_venue'),
(80, 'Can view venue', 21, 'view_venue'),
(81, 'Can add chat', 22, 'add_chat'),
(82, 'Can change chat', 22, 'change_chat'),
(83, 'Can delete chat', 22, 'delete_chat'),
(84, 'Can view chat', 22, 'view_chat'),
(85, 'Can add users_chat', 23, 'add_users_chat'),
(86, 'Can change users_chat', 23, 'change_users_chat'),
(87, 'Can delete users_chat', 23, 'delete_users_chat'),
(88, 'Can view users_chat', 23, 'view_users_chat'),
(89, 'Can add message', 24, 'add_message'),
(90, 'Can change message', 24, 'change_message'),
(91, 'Can delete message', 24, 'delete_message'),
(92, 'Can view message', 24, 'view_message'),
(93, 'Can add user profile', 25, 'add_userprofile'),
(94, 'Can change user profile', 25, 'change_userprofile'),
(95, 'Can delete user profile', 25, 'delete_userprofile'),
(96, 'Can view user profile', 25, 'view_userprofile'),
(97, 'Can add messages', 26, 'add_messages'),
(98, 'Can change messages', 26, 'change_messages'),
(99, 'Can delete messages', 26, 'delete_messages'),
(100, 'Can view messages', 26, 'view_messages'),
(101, 'Can add messages user', 27, 'add_messagesuser'),
(102, 'Can change messages user', 27, 'change_messagesuser'),
(103, 'Can delete messages user', 27, 'delete_messagesuser'),
(104, 'Can view messages user', 27, 'view_messagesuser'),
(105, 'Can add checking', 28, 'add_checking'),
(106, 'Can change checking', 28, 'change_checking'),
(107, 'Can delete checking', 28, 'delete_checking');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$100000$Jxs9BRH6co4O$0CjNXw2vlA2U4cnFoNj32SlJ2ely1bC+0flyqeU1h68=', '2019-03-13 09:22:39.702529', 1, 'xenon', '', '', 'cj.rdwn@gmail.com', 1, 1, '2019-02-18 09:01:18.761087'),
(2, 'pbkdf2_sha256$100000$h4CHUpnYQrHN$+7nxO7QTMr/AYU3rsLyDT+C6zyN6mbT+nJXIhbl9oh0=', '2019-04-01 07:44:24.197247', 1, 'user', '', '', 'cj.rdwn@gmail.com', 1, 1, '2019-04-01 07:44:08.504442'),
(3, 'pbkdf2_sha256$150000$Q8t6dgqOpev6$VX+fyCHdK406nwBydgRIkMdTCVIDr6IVjHutWeGQqXY=', '2019-04-11 10:18:31.344173', 1, 'ridwan', '', '', 'cj.rdwn@gmail.com', 1, 1, '2019-04-11 06:21:59.691294');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID` varchar(30) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `birth_day` date DEFAULT NULL,
  `image` varchar(100) NOT NULL DEFAULT 'default.jpg',
  `contact_no` varchar(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `lat` double NOT NULL,
  `lon` double NOT NULL DEFAULT '90.390171',
  `NID` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ID`, `first_name`, `last_name`, `birth_day`, `image`, `contact_no`, `email`, `city`, `lat`, `lon`, `NID`, `rating`, `password`) VALUES
('1212', '', '', '0000-00-00', 'default.jpg', '', '', '', 0, 0, NULL, NULL, '123'),
('123123', '', '', '0000-00-00', 'default.jpg', '', '', '', 0, 0, NULL, NULL, '123'),
('123132', '', '', '0000-00-00', '', '', NULL, '', 0, 0, NULL, NULL, '123'),
('adf', '', '', NULL, 'default.jpg', '', '', '', 23.758642, 90.390171, NULL, NULL, '123'),
('asde', '', '', NULL, 'default.jpg', '', '', '', 23.758642, 90.390171, NULL, NULL, 'asde'),
('dvdvsd', '', '', '0000-00-00', '', '', '', '', 0, 0, NULL, NULL, '123'),
('new', '', '', '0000-00-00', '', '', '', '', 0, 0, NULL, NULL, '123'),
('newu', '', '', NULL, 'default.jpg', '', '', '', 0, 0, NULL, NULL, '123'),
('ridwan12', '', '', '0000-00-00', '', '', '', '', 0, 0, NULL, NULL, '123'),
('user', 'Ridwan123', 'Bin Sarwar', NULL, 'profile_pics/12312_DldeJha.jpg', '015', 'rdwn@outlook.com', 'Dhaka', 10, 4.110000000000014, NULL, NULL, '123'),
('user1', '', '', NULL, 'default.jpg', '', '', '', 23.758642, 90.390171, NULL, NULL, '123'),
('user12', '', '', NULL, 'default.jpg', '', '', '', 23.758642, 90.390171, NULL, NULL, '123'),
('user420', '', '', '0000-00-00', '', '', NULL, '', 0, 0, NULL, NULL, '123'),
('userasdas', '', '', '0000-00-00', '', '', '', '', 0, 0, NULL, NULL, '1234'),
('useru', '', '', NULL, 'default.jpg', '', '', '', 23.758642, 90.390171, NULL, NULL, '123');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2019-04-11 06:23:35.674333', 'image', 'image', 1, '[{\"added\": {}}]', 9, 3),
(2, '2019-04-11 06:29:09.645468', 'image1', 'image1', 1, '[{\"added\": {}}]', 9, 3),
(3, '2019-04-11 06:41:42.283212', '123', '123', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 9, 3),
(4, '2019-04-11 06:43:59.889086', 'imagecheck', 'imagecheck', 1, '[{\"added\": {}}]', 9, 3),
(5, '2019-04-11 09:54:10.635009', '1', 'Shop object (1)', 1, '[{\"added\": {}}]', 19, 3),
(6, '2019-04-11 10:35:02.890767', '2', 'Shop object (2)', 1, '[{\"added\": {}}]', 19, 3),
(7, '2019-04-11 10:35:18.539420', '3', 'Shop object (3)', 1, '[{\"added\": {}}]', 19, 3),
(8, '2019-04-11 10:37:44.226739', '4', 'Shop object (4)', 1, '[{\"added\": {}}]', 19, 3),
(9, '2019-04-11 10:46:28.097711', '5', 'Shop object (5)', 1, '[{\"added\": {}}]', 19, 3),
(10, '2019-04-11 10:55:40.587931', '6', 'Shop object (6)', 1, '[{\"added\": {}}]', 19, 3),
(11, '2019-04-11 10:56:34.664395', '6', 'Shop object (6)', 3, '', 19, 3),
(12, '2019-04-11 10:56:34.764417', '5', 'Shop object (5)', 3, '', 19, 3),
(13, '2019-04-11 10:56:34.877638', '4', 'Shop object (4)', 3, '', 19, 3),
(14, '2019-04-11 10:56:34.906164', '3', 'Shop object (3)', 3, '', 19, 3),
(15, '2019-04-11 10:56:34.935320', '2', 'Shop object (2)', 3, '', 19, 3),
(16, '2019-04-11 10:56:34.964942', '1', 'Shop object (1)', 3, '', 19, 3),
(17, '2019-04-11 12:16:33.816501', '7', 'Shop object (7)', 1, '[{\"added\": {}}]', 19, 3),
(18, '2019-04-11 12:18:24.429385', '8', 'Shop object (8)', 1, '[{\"added\": {}}]', 19, 3),
(19, '2019-04-11 12:19:06.054866', '9', 'Shop object (9)', 1, '[{\"added\": {}}]', 19, 3),
(20, '2019-04-11 12:20:00.819847', '10', 'Shop object (10)', 1, '[{\"added\": {}}]', 19, 3),
(21, '2019-04-11 12:20:20.069190', '11', 'Shop object (11)', 1, '[{\"added\": {}}]', 19, 3),
(22, '2019-04-11 12:20:49.426246', '12', 'Shop object (12)', 1, '[{\"added\": {}}]', 19, 3),
(23, '2019-04-11 12:21:32.142299', '13', 'Shop object (13)', 1, '[{\"added\": {}}]', 19, 3),
(24, '2019-04-11 12:21:53.241701', '14', 'Shop object (14)', 1, '[{\"added\": {}}]', 19, 3),
(25, '2019-04-11 12:23:05.201950', 'None', 'Shop object (None)', 1, '[{\"added\": {}}]', 19, 3),
(26, '2019-04-11 12:24:04.919990', '14', 'Shop object (14)', 3, '', 19, 3),
(27, '2019-04-11 12:24:04.990725', '13', 'Shop object (13)', 3, '', 19, 3),
(28, '2019-04-11 12:24:05.040847', '12', 'Shop object (12)', 3, '', 19, 3),
(29, '2019-04-11 12:24:05.136145', '11', 'Shop object (11)', 3, '', 19, 3),
(30, '2019-04-11 12:24:05.165914', '10', 'Shop object (10)', 3, '', 19, 3),
(31, '2019-04-11 12:24:05.219951', '9', 'Shop object (9)', 3, '', 19, 3),
(32, '2019-04-11 12:24:05.282218', '8', 'Shop object (8)', 3, '', 19, 3),
(33, '2019-04-11 12:24:05.338198', '7', 'Shop object (7)', 3, '', 19, 3),
(34, '2019-04-11 12:24:13.712372', '15', 'Shop object (15)', 1, '[{\"added\": {}}]', 19, 3),
(35, '2019-04-11 12:29:44.492024', '16', 'Shop object (16)', 1, '[{\"added\": {}}]', 19, 3),
(36, '2019-04-11 12:30:29.498378', '17', 'Shop object (17)', 1, '[{\"added\": {}}]', 19, 3),
(37, '2019-04-11 12:31:03.772922', '18', 'Shop object (18)', 1, '[{\"added\": {}}]', 19, 3),
(38, '2019-04-11 12:45:03.457140', '19', 'Shop object (19)', 1, '[{\"added\": {}}]', 19, 3),
(39, '2019-04-11 12:59:03.811575', '1', 'PointOfInterest object (1)', 1, '[{\"added\": {}}]', 20, 3),
(40, '2019-04-11 12:59:12.716491', '1', 'PointOfInterest object (1)', 3, '', 20, 3),
(41, '2019-04-11 13:15:28.307979', '2', 'PointOfInterest object (2)', 1, '[{\"added\": {}}]', 20, 3),
(42, '2019-04-11 13:16:58.377769', '3', 'PointOfInterest object (3)', 1, '[{\"added\": {}}]', 20, 3),
(43, '2019-04-11 13:27:16.663984', '1', 'Venue object (1)', 1, '[{\"added\": {}}]', 21, 3),
(44, '2019-04-11 14:01:09.975183', '4', 'PointOfInterest object (4)', 1, '[{\"added\": {}}]', 20, 3),
(45, '2019-04-11 14:14:38.104350', '20', 'Shop object (20)', 1, '[{\"added\": {}}]', 19, 3);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(24, 'chat', 'message'),
(25, 'chat', 'userprofile'),
(5, 'contenttypes', 'contenttype'),
(7, 'home', 'admin'),
(22, 'home', 'chat'),
(28, 'home', 'checking'),
(18, 'home', 'check_field'),
(8, 'home', 'customer'),
(11, 'home', 'location'),
(26, 'home', 'messages'),
(27, 'home', 'messagesuser'),
(20, 'home', 'pointofinterest'),
(14, 'home', 'req'),
(13, 'home', 'request'),
(12, 'home', 'request1'),
(9, 'home', 'serviceprovider'),
(19, 'home', 'shop'),
(10, 'home', 'users'),
(23, 'home', 'users_chat'),
(21, 'home', 'venue'),
(16, 'pinax_messages', 'message'),
(17, 'pinax_messages', 'thread'),
(15, 'pinax_messages', 'userthread'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-02-17 18:51:33.689985'),
(2, 'auth', '0001_initial', '2019-02-17 18:51:38.979421'),
(3, 'admin', '0001_initial', '2019-02-17 18:51:40.589196'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-02-17 18:51:40.673891'),
(5, 'contenttypes', '0002_remove_content_type_name', '2019-02-17 18:51:41.546377'),
(6, 'auth', '0002_alter_permission_name_max_length', '2019-02-17 18:51:42.136540'),
(7, 'auth', '0003_alter_user_email_max_length', '2019-02-17 18:51:42.631191'),
(8, 'auth', '0004_alter_user_username_opts', '2019-02-17 18:51:42.693927'),
(9, 'auth', '0005_alter_user_last_login_null', '2019-02-17 18:51:43.088584'),
(10, 'auth', '0006_require_contenttypes_0002', '2019-02-17 18:51:43.115450'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2019-02-17 18:51:43.161440'),
(12, 'auth', '0008_alter_user_username_max_length', '2019-02-17 18:51:43.637471'),
(13, 'auth', '0009_alter_user_last_name_max_length', '2019-02-17 18:51:44.161707'),
(14, 'sessions', '0001_initial', '2019-02-17 18:51:44.466273'),
(15, 'home', '0001_initial', '2019-04-01 07:45:29.021967'),
(17, 'home', '0002_check_field', '2019-04-11 06:15:21.935858'),
(18, 'home', '0003_auto_20190411_1218', '2019-04-11 06:18:12.819158'),
(19, 'admin', '0003_logentry_add_action_flag_choices', '2019-04-11 09:50:17.544120'),
(20, 'auth', '0010_alter_group_name_max_length', '2019-04-11 09:50:18.504394'),
(21, 'auth', '0011_update_proxy_permissions', '2019-04-11 09:50:18.565435'),
(22, 'home', '0004_shop', '2019-04-11 09:52:02.316056'),
(23, 'home', '0005_pointofinterest', '2019-04-11 12:57:59.784666'),
(24, 'home', '0006_auto_20190411_1904', '2019-04-11 13:04:13.419274'),
(25, 'home', '0007_venue', '2019-04-11 13:25:25.927304'),
(26, 'home', '0008_auto_20190411_2000', '2019-04-11 14:00:26.084450'),
(27, 'home', '0002_chat_users_chat', '2019-04-12 08:51:29.253503'),
(28, 'chat', '0001_initial', '2019-04-12 09:30:59.636008'),
(29, 'chat', '0002_userprofile', '2019-04-12 10:02:51.736975'),
(30, 'home', '0002_auto_20190412_1719', '2019-04-12 11:20:01.281491'),
(31, 'home', '0002_checking', '2019-04-14 06:18:20.664212'),
(32, 'pinax_messages', '0001_initial', '2019-04-14 06:27:27.043425');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2qknb8d9v8mdxaz9f7uwysjsjr7x3r1d', 'MGMzMzMxNDQ4ZDZkYjI4YWE0OWE5M2U1MTI1M2JjMTc3MmU0MmFkMjp7ImtleSI6MzEsInR5cGUiOiJzZXJ2aWNlX3Byb3ZpZGVyIiwidXNlciI6IjEyMyJ9', '2019-04-27 01:11:16.340367'),
('70w3i6v17grbjlmpxja72ouvj5hr15e4', 'OTdmZWE4NzYwZGVjODRlZjI4YjBkZTkyNmUzZTk1MDMwZWM2M2NiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxODY1Y2RhMWNjNDc0ODljYjQwZmVhZjMyNTQxM2JjZTllMzU3ODExIn0=', '2019-03-04 09:01:57.213167'),
('9os0jse6kooqw25z9yrve18jnxoqjkvv', 'ZGVhZWZhZmRjYTVkYWNkYWU5ODYyNGQwNjAxNTk2ZDkxMzgxMjFmOTp7ImtleSI6MSwidHlwZSI6InNlcnZpY2VfcHJvdmlkZXIiLCJ1c2VyIjoiMTIzIn0=', '2019-04-28 10:53:20.072635'),
('a7v1ojh440ei63kjiiyrq1tuvduckofr', 'MDMxN2NmN2E4MmUzMTNiOTQwZmRjNWE4NTZjZDU4ZWU4NmVmNWJhMzp7ImtleSI6OSwidHlwZSI6InVzZXIiLCJ1c2VyIjoidXNlciJ9', '2019-04-28 16:01:07.783688'),
('bmmpyh6rlybdvqc8xxksk1mu5vxj9aoi', 'MTczNzY0ODVhZmU4MzYzZjg3NTdkMTEzMTBhM2NlZmM2NDU2ZWQ5MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NDRhNDcyMzUyZGJkMGE4NjE1MmYyZTU4YjQyMmFkODJkMjU3YjE1IiwidHlwZSI6InNlcnZpY2VfcHJvdmlkZXIiLCJ1c2VyIjoiMTIzIn0=', '2019-04-26 06:37:10.857023'),
('czsc7f0qncymbdyd8mxs6w9saxf0gqw3', 'OWE0MDgxZTU1NTM2MzQxNjM4MmJkMmU0MDk1NzA3ODAxZGU1N2M2Yjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NDRhNDcyMzUyZGJkMGE4NjE1MmYyZTU4YjQyMmFkODJkMjU3YjE1In0=', '2019-04-26 08:32:38.597001'),
('ig49du8qrra59ks2x5su7v2j9r8ix6o5', 'NWM4ZGI5ZTE1MzY1YWMzMjNhZmIxMDc2OTc5N2NjZTMwNGEyZGNkMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YzU0YmExNzM0NzJkZTlhZjg2ZjgwMzI4YWJmODkwMjJmZGUxOGYxIn0=', '2019-04-15 07:44:24.239892'),
('pwuay2qnsaimlyeduu2om12mr8js31bn', 'NmViNjc4NWQ3NzBmYmRkODg5ZTU1NDE2OWNmODMyMzQ2OTVjNDk5Mjp7InR5cGUiOiJzZXJ2aWNlX3Byb3ZpZGVyIiwidXNlciI6IjEyMyIsImtleSI6M30=', '2019-04-27 07:52:23.204158'),
('shrors0ii3rw6lnamdigs0aruu93kq7x', 'OTdmZWE4NzYwZGVjODRlZjI4YjBkZTkyNmUzZTk1MDMwZWM2M2NiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxODY1Y2RhMWNjNDc0ODljYjQwZmVhZjMyNTQxM2JjZTllMzU3ODExIn0=', '2019-03-27 09:22:39.751507'),
('ucqodfjikp224h124sxul7enz2rtm9jw', 'OWExM2U5NmE4ZmQ3ZTM1OGEzMTZlNjM2NjU1MmQ0NTMwZmI2ZWRkNjp7ImtleSI6MSwidHlwZSI6InVzZXIiLCJ1c2VyIjoiYWRmIn0=', '2019-04-27 07:29:47.162903'),
('z8989sq0ty3jzrol8qn63dpne419ubs6', 'Nzg0YTQyNzU1MzU4ZDZlMjNiZWJjMGI1MmU4MDljNDUyYWQzZGU2Zjp7ImtleSI6MTgsInR5cGUiOiJzZXJ2aWNlX3Byb3ZpZGVyIiwidXNlciI6IjEyMyJ9', '2019-04-28 16:15:19.456242');

-- --------------------------------------------------------

--
-- Table structure for table `home_chat`
--

CREATE TABLE `home_chat` (
  `id` int(11) NOT NULL,
  `sender` varchar(256) NOT NULL,
  `receiver` varchar(256) NOT NULL,
  `msg` longtext NOT NULL,
  `time` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `home_checking`
--

CREATE TABLE `home_checking` (
  `id` int(11) NOT NULL,
  `haha` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `home_check_field`
--

CREATE TABLE `home_check_field` (
  `id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `home_messagesuser`
--

CREATE TABLE `home_messagesuser` (
  `id` int(11) NOT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `reciever` varchar(50) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `time` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `home_messagesuser`
--

INSERT INTO `home_messagesuser` (`id`, `sender`, `reciever`, `details`, `time`) VALUES
(1, 'user', '123', 'hi', '2019-04-14 11:05:16.500324'),
(2, 'user', '123', 'bye', '2019-04-14 11:05:20.092544'),
(3, 'user', '123', 'a', '2019-04-14 11:05:22.534602'),
(4, '123', 'user', 'kire bhai', '2019-04-14 11:05:41.128073'),
(5, '123', 'user', 'kaaj kore toh dekhi', '2019-04-14 11:05:50.052542'),
(6, 'user', '123', 'lol naa', '2019-04-14 11:05:57.685811'),
(7, '123', 'user', 'hahah', '2019-04-14 11:07:25.615927'),
(8, '123', 'user', NULL, '2019-04-14 11:07:39.723593'),
(9, '123', 'user', NULL, '2019-04-14 11:07:43.060993'),
(10, '123', 'user', 'hi', '2019-04-14 11:08:00.727228'),
(11, '123', 'user', 'ok', '2019-04-14 11:09:48.128725'),
(12, '123', 'user', 'ebnar', '2019-04-14 11:10:01.814099'),
(13, 'user', '123', 'ji', '2019-04-14 11:10:31.428573'),
(14, '123', 'user', 'naa', '2019-04-14 11:11:09.232308'),
(15, 'user', '123', 'ji', '2019-04-14 11:11:35.004321'),
(16, 'user', '123', 'ajib', '2019-04-14 11:16:09.644838'),
(17, '123', 'user', 'hahah', '2019-04-14 11:16:30.143103'),
(18, 'user', '123', 'ajib', '2019-04-14 11:17:24.476514'),
(19, '123', 'user', 'hahah', '2019-04-14 11:17:34.417724'),
(20, '123', 'user', 'naa', '2019-04-14 11:17:38.217402'),
(21, '123', 'user', 'naa', '2019-04-14 11:17:41.206484'),
(22, '123', 'user', 'naa', '2019-04-14 11:18:51.346728'),
(23, '123', 'user', 'oo', '2019-04-14 11:19:01.022997'),
(24, '123', 'user', 'nnna', '2019-04-14 11:19:11.583848'),
(25, '123', 'user', 'hahaha', '2019-04-14 11:19:15.657207'),
(26, '123', 'user', 'abar ashilam firey tomar kajhe', '2019-04-14 11:22:54.189484'),
(27, 'user', '123', 'haha bocj', '2019-04-14 11:23:08.164504'),
(28, 'user', '123', 'e hotey pare naa', '2019-04-14 11:23:15.255537'),
(29, 'user', '123', 'yo', '2019-04-14 11:57:02.793169'),
(30, '123', 'user1', 'hi', '2019-04-14 14:48:56.758933'),
(31, 'user1', '123', 'ok', '2019-04-14 14:51:26.951412'),
(32, 'user1', '123', '...', '2019-04-14 14:51:53.661495'),
(33, '123', 'user1', 'hh', '2019-04-14 14:51:58.793965'),
(34, '123', 'user', 'asdas', '2019-04-14 16:12:33.779490'),
(35, 'user', '123', 'naa', '2019-04-14 16:12:39.182038');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location` varchar(25) NOT NULL,
  `street` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `req`
--

CREATE TABLE `req` (
  `location` varchar(150) DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lon` double DEFAULT NULL,
  `radius` int(11) DEFAULT NULL,
  `service_type` int(11) DEFAULT NULL,
  `customer` varchar(30) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `start_time` varchar(20) DEFAULT NULL,
  `end_time` varchar(20) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `sp_id` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `req`
--

INSERT INTO `req` (`location`, `lat`, `lon`, `radius`, `service_type`, `customer`, `status`, `start_time`, `end_time`, `id`, `sp_id`) VALUES
('Bir Uttam Ziaur Rahman Road, Near Mohakhali DOHS, Dhaka 1205, Bangladesh', 23.7766, 90.39444800000001, 300, 1, 'user', 'confirmed', '2019-04-10', '00:31', 18, '123');

-- --------------------------------------------------------

--
-- Table structure for table `service_provider`
--

CREATE TABLE `service_provider` (
  `ID` varchar(30) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `birth_day` date DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `contact_no` varchar(11) DEFAULT NULL,
  `NID` int(11) DEFAULT NULL,
  `service_type` char(1) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `lat` double NOT NULL,
  `lon` double NOT NULL,
  `radius` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_provider`
--

INSERT INTO `service_provider` (`ID`, `first_name`, `last_name`, `birth_day`, `image`, `email`, `city`, `contact_no`, `NID`, `service_type`, `rating`, `verified`, `password`, `lat`, `lon`, `radius`, `status`) VALUES
('1231', '', '', '0000-00-00', '', '', '', NULL, NULL, NULL, NULL, NULL, '1231', 0, 0, NULL, NULL),
('user1', '', '', '0000-00-00', '', '', '', NULL, NULL, NULL, NULL, NULL, '1234', 0, 0, NULL, NULL),
('user1234', '', '', '0000-00-00', '', '', '', NULL, NULL, NULL, NULL, NULL, '1234', 0, 0, NULL, NULL),
('user4321', '', '', '0000-00-00', '', '', '', NULL, NULL, NULL, NULL, NULL, '123', 0, 0, NULL, NULL),
('123', 'abcdfredfgdgdfgd', 'Bin Sarwar', '2019-05-13', 'default.jpg', 'rdwn@outlook.com', '2019-04-13', '01532601363', 11112312, '7', 1, NULL, '123', 23.77801381594981, 90.39783831219484, 300, 'confirmed'),
('image1', 'image1', 'image1', '0000-00-00', 'profile_pics/49896751_2503031203103181_3124222437323964416_n.jpg', 'image1@g.com', 'asd', '123', 213, '1', 1, 1, '123', 0, 0, NULL, NULL),
('imagecheck', 'Ridwan', 'imagecheck', '0000-00-00', 'profile_pics/12312_VrfMuB3.jpg', 'a@n.com', 'imagecheck', '1231', NULL, '', NULL, NULL, 'imagecheck', 0, 0, NULL, NULL),
('123123', '', '', '0000-00-00', 'default.jpg', '', '', '', NULL, '', NULL, NULL, '123', 0, 0, NULL, NULL),
('asasdas', '', '', '0000-00-00', 'default.jpg', '', '', '', NULL, '', NULL, NULL, 'asd', 0, 0, NULL, NULL),
('ok', '', '', '0000-00-00', 'default.jpg', '', '', '', NULL, '', NULL, NULL, '123', 0, 0, NULL, NULL),
('asd', '', '', NULL, 'default.jpg', '', '', '', NULL, '', NULL, NULL, 'asd', 0, 0, NULL, NULL),
('news', '', '', NULL, 'default.jpg', '', '', '', NULL, '', NULL, NULL, '123', 0, 0, NULL, NULL),
('afg', '', '', NULL, 'default.jpg', '', '', '', NULL, '', NULL, NULL, 'afg', 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `todo`
--

CREATE TABLE `todo` (
  `req_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `details` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `todo`
--

INSERT INTO `todo` (`req_id`, `id`, `details`, `status`) VALUES
(4, 3, NULL, NULL),
(5, 4, NULL, NULL),
(6, 5, NULL, NULL),
(7, 6, NULL, NULL),
(9, 7, NULL, NULL),
(11, 8, NULL, NULL),
(13, 9, NULL, NULL),
(14, 10, NULL, NULL),
(15, 11, NULL, NULL),
(16, 12, NULL, NULL),
(17, 13, NULL, NULL),
(17, 14, NULL, NULL),
(18, 15, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_type` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_email`, `user_password`, `user_type`) VALUES
('cj.rdwn@g.com', '1234', 2),
('rdwn@g.com', '1234', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD KEY `pk` (`ID`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `home_chat`
--
ALTER TABLE `home_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_checking`
--
ALTER TABLE `home_checking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_check_field`
--
ALTER TABLE `home_check_field`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_messagesuser`
--
ALTER TABLE `home_messagesuser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location`);

--
-- Indexes for table `req`
--
ALTER TABLE `req`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK` (`sp_id`);

--
-- Indexes for table `service_provider`
--
ALTER TABLE `service_provider`
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `todo`
--
ALTER TABLE `todo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PK,AK` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `home_chat`
--
ALTER TABLE `home_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_checking`
--
ALTER TABLE `home_checking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_check_field`
--
ALTER TABLE `home_check_field`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_messagesuser`
--
ALTER TABLE `home_messagesuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `req`
--
ALTER TABLE `req`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `todo`
--
ALTER TABLE `todo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
