-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2019 at 12:31 PM
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
  `name` varchar(80) NOT NULL
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
(39, 'Can delete request', 13, 'delete_request');

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
(2, 'pbkdf2_sha256$100000$h4CHUpnYQrHN$+7nxO7QTMr/AYU3rsLyDT+C6zyN6mbT+nJXIhbl9oh0=', '2019-04-01 07:44:24.197247', 1, 'user', '', '', 'cj.rdwn@gmail.com', 1, 1, '2019-04-01 07:44:08.504442');

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
  `contact_no` varchar(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `NID` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ID`, `first_name`, `last_name`, `contact_no`, `email`, `city`, `NID`, `rating`, `password`) VALUES
('123132', '', '', '', NULL, '', NULL, NULL, '123'),
('dvdvsd', '', '', '', '', '', NULL, NULL, '123'),
('user', 'Ridwan123', 'Bin Sarwar', '015', 'rdwn@outlook.com', 'Dhaka', NULL, NULL, '123'),
('user420', '', '', '', NULL, '', NULL, NULL, '123'),
('userasdas', '', '', '', '', '', NULL, NULL, '1234');

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
(5, 'contenttypes', 'contenttype'),
(7, 'home', 'admin'),
(8, 'home', 'customer'),
(11, 'home', 'location'),
(13, 'home', 'request'),
(12, 'home', 'request1'),
(9, 'home', 'serviceprovider'),
(10, 'home', 'users'),
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
(15, 'home', '0001_initial', '2019-04-01 07:45:29.021967');

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
('70w3i6v17grbjlmpxja72ouvj5hr15e4', 'OTdmZWE4NzYwZGVjODRlZjI4YjBkZTkyNmUzZTk1MDMwZWM2M2NiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxODY1Y2RhMWNjNDc0ODljYjQwZmVhZjMyNTQxM2JjZTllMzU3ODExIn0=', '2019-03-04 09:01:57.213167'),
('ig49du8qrra59ks2x5su7v2j9r8ix6o5', 'NWM4ZGI5ZTE1MzY1YWMzMjNhZmIxMDc2OTc5N2NjZTMwNGEyZGNkMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YzU0YmExNzM0NzJkZTlhZjg2ZjgwMzI4YWJmODkwMjJmZGUxOGYxIn0=', '2019-04-15 07:44:24.239892'),
('pwuay2qnsaimlyeduu2om12mr8js31bn', 'MmNhMWFkZGMxZmVkYjBmOTk5NGVjOWYxNjJkNjk5ZDAyYjZlN2Q3Yzp7InVzZXIiOiIxMjMifQ==', '2019-04-21 08:42:03.989124'),
('shrors0ii3rw6lnamdigs0aruu93kq7x', 'OTdmZWE4NzYwZGVjODRlZjI4YjBkZTkyNmUzZTk1MDMwZWM2M2NiODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxODY1Y2RhMWNjNDc0ODljYjQwZmVhZjMyNTQxM2JjZTllMzU3ODExIn0=', '2019-03-27 09:22:39.751507');

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
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `id` int(6) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`id`, `firstname`, `lastname`, `email`) VALUES
(1, 'Ridwan', 'Bin Sarwar', 'rdwn@outlook.com');

-- --------------------------------------------------------

--
-- Table structure for table `req`
--

CREATE TABLE `req` (
  `location` varchar(50) DEFAULT NULL,
  `service_type` int(2) DEFAULT NULL,
  `customer` varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL,
  `start_time` varchar(20) NOT NULL,
  `end_time` varchar(20) NOT NULL,
  `id` int(11) NOT NULL,
  `sp_id` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `req`
--

INSERT INTO `req` (`location`, `service_type`, `customer`, `status`, `start_time`, `end_time`, `id`, `sp_id`) VALUES
('request', 1, '123', 'pending', '0000-00-00 00:00:00', '', 14, NULL),
('asddf', 2, '123', 'complete', '0000-00-00 00:00:00', '', 15, NULL),
('asd', 21, '123', 'pending', '0000-00-00 00:00:00', '', 16, NULL),
('new', 12, '123', 'pending', '2019-04-07', '', 17, NULL),
('saddas', 1, '123', 'pending', '2019-04-07', '2017-02-05T19:32', 18, NULL),
('sdas', 12, '123', 'pending', '2019-04-07', '2019-04-07T10:04', 19, NULL),
('asddf', 1, '123', 'pending', '2019-04-07', '2019-05-07T10:08', 20, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `customer_id` varchar(20) NOT NULL,
  `service_provider_id` varchar(20) NOT NULL,
  `location` varchar(15) NOT NULL,
  `service_type` varchar(10) NOT NULL,
  `date_` datetime DEFAULT CURRENT_TIMESTAMP,
  `rating` int(11) DEFAULT NULL,
  `review` text,
  `status_` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `service_provider`
--

CREATE TABLE `service_provider` (
  `ID` varchar(30) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `contact_no` varchar(11) DEFAULT NULL,
  `NID` int(11) DEFAULT NULL,
  `service_type` char(1) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `img` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_provider`
--

INSERT INTO `service_provider` (`ID`, `first_name`, `last_name`, `email`, `city`, `contact_no`, `NID`, `service_type`, `rating`, `verified`, `password`, `img`) VALUES
('1231', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '1231', ''),
('user1', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '1234', ''),
('user1234', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '1234', ''),
('user4321', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '123', ''),
('123', 'abcd', 'Bin Sarwar', 'rdwn@outlook.com', 'Noakhali', '01532601363', 11112312, '1', 1, NULL, '123', '');

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
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `req`
--
ALTER TABLE `req`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sp_id` (`sp_id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`customer_id`,`service_provider_id`),
  ADD KEY `fk` (`location`),
  ADD KEY `fk2` (`service_provider_id`);

--
-- Indexes for table `service_provider`
--
ALTER TABLE `service_provider`
  ADD UNIQUE KEY `ID` (`ID`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `req`
--
ALTER TABLE `req`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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

--
-- Constraints for table `req`
--
ALTER TABLE `req`
  ADD CONSTRAINT `req_ibfk_1` FOREIGN KEY (`sp_id`) REFERENCES `service_provider` (`ID`);

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `fk` FOREIGN KEY (`location`) REFERENCES `location` (`location`),
  ADD CONSTRAINT `fk1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`ID`),
  ADD CONSTRAINT `fk2` FOREIGN KEY (`service_provider_id`) REFERENCES `service_provider` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
