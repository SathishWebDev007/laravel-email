-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2025 at 09:46 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_email`
--

-- --------------------------------------------------------

--
-- Table structure for table `email_queue`
--

CREATE TABLE `email_queue` (
  `id` int(11) NOT NULL,
  `recipient_email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `status` enum('pending','success','failed') DEFAULT 'pending',
  `attempts` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `email_queue`
--

INSERT INTO `email_queue` (`id`, `recipient_email`, `subject`, `body`, `status`, `attempts`, `created_at`, `updated_at`) VALUES
(1, 'sathish.webdev55@gmail.com', 'Test Email', 'Hello! This is a test email from Laravel Job API.', 'pending', 1, '2025-10-23 01:31:50', '2025-10-23 07:01:52'),
(2, 'sathish.webdev55@gmail.com', 'Test Email', 'Hello! This is a test email from Laravel Job API.', 'pending', 1, '2025-10-23 01:42:33', '2025-10-23 07:13:45'),
(3, 'sathish.webdev55@gmail.com', 'Test Email', 'Hello! This is a test email from Laravel Job API.', 'pending', 1, '2025-10-23 01:44:14', '2025-10-23 07:14:15'),
(4, 'sathish.webdev55@gmail.com', 'Test Email', 'Hello! This is a test email from Laravel Job API.', 'pending', 1, '2025-10-23 01:44:19', '2025-10-23 07:14:22'),
(5, 'sathish.webdev55@gmail.com', 'Test Email', 'Hello! This is a test email from Laravel Job API.', 'pending', 1, '2025-10-23 01:50:12', '2025-10-23 07:20:14'),
(6, 'sathish.webdev55@gmail.com', 'Test Email', 'Hello! This is a test email from Laravel Job API.', 'success', 0, '2025-10-23 01:54:42', '2025-10-23 07:24:50'),
(7, 'sathish.webdev55@gmail.com', 'Test Email', 'Hello! This is a test email from Laravel Job API.', 'success', 0, '2025-10-23 01:54:56', '2025-10-23 07:24:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `email_queue`
--
ALTER TABLE `email_queue`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `email_queue`
--
ALTER TABLE `email_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
