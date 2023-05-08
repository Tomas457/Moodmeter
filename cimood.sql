-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2023 at 11:46 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cimood`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_users`
--

CREATE TABLE `auth_groups_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_groups_users`
--

INSERT INTO `auth_groups_users` (`id`, `user_id`, `group`, `created_at`) VALUES
(1, 1, 'user', '2023-04-06 08:05:24'),
(3, 3, 'user', '2023-04-11 07:08:26');

-- --------------------------------------------------------

--
-- Table structure for table `auth_identities`
--

CREATE TABLE `auth_identities` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `secret` varchar(255) NOT NULL,
  `secret2` varchar(255) DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `extra` text DEFAULT NULL,
  `force_reset` tinyint(1) NOT NULL DEFAULT 0,
  `last_used_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_identities`
--

INSERT INTO `auth_identities` (`id`, `user_id`, `type`, `name`, `secret`, `secret2`, `expires`, `extra`, `force_reset`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'email_password', NULL, 'tomasvw.school@gmail.com', '$2y$10$cP0oPhXYFRW//2qOrVpCUeNbmbegM3Yh0NA2JOC79WQMr0XWIg7Ua', NULL, NULL, 0, '2023-04-14 09:12:07', '2023-04-06 08:05:23', '2023-04-14 09:12:07'),
(2, 1, 'magic-link', NULL, 'd770d805da10cd52725d', NULL, '2023-04-07 10:40:40', NULL, 0, NULL, '2023-04-07 09:40:40', '2023-04-07 09:40:40'),
(4, 3, 'email_password', NULL, 'boy@gmail.com', '$2y$10$Tx4lh0ODIRQ5aIDNdCoxbOKIj6sD8MhkkqZccfyVOje4ly.pu/65.', NULL, NULL, 0, '2023-04-14 09:39:14', '2023-04-11 07:08:25', '2023-04-14 09:39:14');

-- --------------------------------------------------------

--
-- Table structure for table `auth_logins`
--

CREATE TABLE `auth_logins` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `id_type` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_logins`
--

INSERT INTO `auth_logins` (`id`, `ip_address`, `user_agent`, `id_type`, `identifier`, `user_id`, `date`, `success`) VALUES
(1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', 'magic-link', '', NULL, '2023-04-07 09:40:01', 0),
(2, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', 'email_password', 'pussy@gmail.com', 2, '2023-04-07 10:14:35', 1),
(3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', 'email_password', 'tomasvw.school@gmail.com', 1, '2023-04-07 11:49:34', 1),
(4, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', 'email_password', 'tomasvw.school@gmail.com', 1, '2023-04-11 07:00:15', 1),
(5, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', 'email_password', 'tomasvw.school@gmail.com', 1, '2023-04-14 09:12:07', 1),
(6, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', 'email_password', 'boy@gmail.com', 3, '2023-04-14 09:39:14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permissions_users`
--

CREATE TABLE `auth_permissions_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `permission` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_remember_tokens`
--

CREATE TABLE `auth_remember_tokens` (
  `id` int(11) UNSIGNED NOT NULL,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `expires` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_remember_tokens`
--

INSERT INTO `auth_remember_tokens` (`id`, `selector`, `hashedValidator`, `user_id`, `expires`, `created_at`, `updated_at`) VALUES
(1, '59cbf96267998ef27edccea9', '02fab130b450f7d64fe0f8e92e33dbab05b77a46ada4a2fa39f85b400c24ca37', 1, '2023-05-11 07:00:00', '2023-04-07 11:49:34', '2023-04-11 07:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `auth_token_logins`
--

CREATE TABLE `auth_token_logins` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `id_type` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2020-12-28-223112', 'CodeIgniter\\Shield\\Database\\Migrations\\CreateAuthTables', 'default', 'CodeIgniter\\Shield', 1680768212, 1),
(2, '2021-07-04-041948', 'CodeIgniter\\Settings\\Database\\Migrations\\CreateSettingsTable', 'default', 'CodeIgniter\\Settings', 1680768212, 1),
(3, '2021-11-14-143905', 'CodeIgniter\\Settings\\Database\\Migrations\\AddContextColumn', 'default', 'CodeIgniter\\Settings', 1680768212, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mood`
--

CREATE TABLE `mood` (
  `moodid` int(11) NOT NULL,
  `datum` datetime NOT NULL DEFAULT current_timestamp(),
  `mood` enum('Blij','Boos','Verdrietig','Neutraal') NOT NULL,
  `plek` enum('huis','werk','school') NOT NULL,
  `beschrijving` text NOT NULL,
  `user` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mood`
--

INSERT INTO `mood` (`moodid`, `datum`, `mood`, `plek`, `beschrijving`, `user`) VALUES
(27, '2023-04-07 14:19:21', 'Blij', 'huis', '', 1),
(28, '2023-04-07 14:24:48', 'Verdrietig', 'huis', '', 1),
(29, '2023-04-07 14:47:20', 'Blij', 'huis', '', 1),
(30, '2023-04-07 14:47:27', 'Verdrietig', 'huis', '', 1),
(31, '2023-04-07 14:47:33', 'Neutraal', 'huis', '', 1),
(32, '2023-04-11 09:09:56', 'Neutraal', 'huis', '', 3),
(33, '2023-04-11 09:48:43', 'Neutraal', 'werk', 'ben deze opdracht aan het doen', 1),
(34, '2023-04-11 11:14:19', 'Neutraal', 'werk', 'test test', 1),
(35, '2023-04-11 11:14:38', 'Blij', 'huis', '', 1),
(36, '2023-04-11 11:22:24', 'Blij', 'huis', '', 1),
(37, '2023-04-11 12:41:55', 'Boos', 'school', 'de succes pagina testen', 1),
(38, '2023-04-11 13:11:22', 'Boos', 'school', 'de succes pagina testen', 1),
(39, '2023-04-11 13:13:29', 'Boos', 'school', 'de succes pagina testen', 1),
(40, '2023-04-11 13:14:22', 'Boos', 'school', 'de succes pagina testen', 1),
(41, '2023-04-11 13:16:05', 'Boos', 'school', 'de succes pagina testen', 1),
(42, '2023-04-11 13:17:20', 'Boos', 'school', 'de succes pagina testen', 1),
(43, '2023-04-11 13:17:35', 'Boos', 'school', 'de succes pagina testen', 1),
(44, '2023-04-11 13:18:06', 'Boos', 'school', 'de succes pagina testen', 1),
(45, '2023-04-11 13:18:19', 'Boos', 'school', 'de succes pagina testen', 1),
(46, '2023-04-11 13:20:17', 'Boos', 'school', 'de succes pagina testen', 1),
(47, '2023-04-11 13:20:45', 'Boos', 'school', 'de succes pagina testen', 1),
(48, '2023-04-11 13:22:03', 'Boos', 'school', 'de succes pagina testen', 1),
(49, '2023-04-11 13:23:05', 'Boos', 'school', 'de succes pagina testen', 1),
(50, '2023-04-11 13:23:31', 'Boos', 'school', 'de succes pagina testen', 1),
(51, '2023-04-11 13:23:47', 'Boos', 'school', 'de succes pagina testen', 1),
(52, '2023-04-11 13:24:03', 'Boos', 'school', 'de succes pagina testen', 1),
(53, '2023-04-11 13:24:28', 'Boos', 'school', 'de succes pagina testen', 1),
(54, '2023-04-11 13:24:38', 'Boos', 'school', 'de succes pagina testen', 1),
(55, '2023-04-11 13:24:50', 'Boos', 'school', 'de succes pagina testen', 1),
(56, '2023-04-11 13:25:22', 'Boos', 'school', 'de succes pagina testen', 1),
(57, '2023-04-11 13:26:22', 'Boos', 'school', 'de succes pagina testen', 1),
(58, '2023-04-11 13:26:44', 'Boos', 'school', 'de succes pagina testen', 1),
(59, '2023-04-11 13:27:01', 'Boos', 'school', 'de succes pagina testen', 1),
(60, '2023-04-11 13:27:16', 'Boos', 'school', 'de succes pagina testen', 1),
(61, '2023-04-11 13:27:38', 'Boos', 'school', 'de succes pagina testen', 1),
(62, '2023-04-11 13:28:05', 'Boos', 'school', 'de succes pagina testen', 1),
(63, '2023-04-11 13:28:14', 'Boos', 'school', 'de succes pagina testen', 1),
(64, '2023-04-11 13:28:23', 'Boos', 'school', 'de succes pagina testen', 1),
(65, '2023-04-11 13:28:32', 'Boos', 'school', 'de succes pagina testen', 1),
(66, '2023-04-11 13:31:17', 'Boos', 'school', 'de succes pagina testen', 1),
(67, '2023-04-11 13:31:33', 'Boos', 'school', 'de succes pagina testen', 1),
(68, '2023-04-11 13:32:01', 'Boos', 'school', 'de succes pagina testen', 1),
(69, '2023-04-11 13:59:28', 'Blij', 'werk', 'heb het af', 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(9) NOT NULL,
  `class` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `type` varchar(31) NOT NULL DEFAULT 'string',
  `context` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `last_active` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `status`, `status_message`, `active`, `last_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Tomas', NULL, NULL, 1, NULL, '2023-04-06 08:05:23', '2023-04-06 08:05:24', NULL),
(3, 'Boy', NULL, NULL, 1, NULL, '2023-04-11 07:08:25', '2023-04-11 07:08:26', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_groups_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `auth_identities`
--
ALTER TABLE `auth_identities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type_secret` (`type`,`secret`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_logins`
--
ALTER TABLE `auth_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_type_identifier` (`id_type`,`identifier`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_permissions_users`
--
ALTER TABLE `auth_permissions_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_permissions_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `auth_remember_tokens`
--
ALTER TABLE `auth_remember_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `selector` (`selector`),
  ADD KEY `auth_remember_tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `auth_token_logins`
--
ALTER TABLE `auth_token_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_type_identifier` (`id_type`,`identifier`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mood`
--
ALTER TABLE `mood`
  ADD PRIMARY KEY (`moodid`),
  ADD KEY `user` (`user`) USING BTREE;

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_identities`
--
ALTER TABLE `auth_identities`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_logins`
--
ALTER TABLE `auth_logins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `auth_permissions_users`
--
ALTER TABLE `auth_permissions_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_remember_tokens`
--
ALTER TABLE `auth_remember_tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_token_logins`
--
ALTER TABLE `auth_token_logins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mood`
--
ALTER TABLE `mood`
  MODIFY `moodid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_identities`
--
ALTER TABLE `auth_identities`
  ADD CONSTRAINT `auth_identities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_permissions_users`
--
ALTER TABLE `auth_permissions_users`
  ADD CONSTRAINT `auth_permissions_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_remember_tokens`
--
ALTER TABLE `auth_remember_tokens`
  ADD CONSTRAINT `auth_remember_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mood`
--
ALTER TABLE `mood`
  ADD CONSTRAINT `mood_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
