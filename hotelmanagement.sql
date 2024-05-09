-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 09, 2024 at 02:42 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotelmanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `idAds` int(11) NOT NULL,
  `idRestaurant` int(11) NOT NULL,
  `videoUrl` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `idCart` int(11) NOT NULL,
  `idCustomer` int(11) NOT NULL,
  `isActive` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `idCartItems` int(11) NOT NULL,
  `idCart` int(11) NOT NULL,
  `idItem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `idCategory` int(11) NOT NULL,
  `idRestaurant` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` int(1) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`idCategory`, `idRestaurant`, `name`, `type`, `createdOn`) VALUES
(41, 1, 'Starter', 1, '2021-12-24 17:19:14'),
(42, 1, 'Soup', 1, '2021-12-24 17:19:14'),
(43, 1, 'Beverages ', 0, '2021-12-24 17:19:14'),
(44, 1, 'Rice', 1, '2021-12-24 17:19:14'),
(45, 1, 'Ice Cream', 1, '2021-12-24 17:19:14'),
(46, 1, 'STARTER', 0, '2021-12-25 01:29:44'),
(47, 1, 'SOUP', 0, '2021-12-26 03:24:18'),
(48, 1, 'RICE ', 0, '2022-01-03 01:53:23'),
(49, 1, 'Chinese ', 1, '2022-01-04 21:45:26'),
(50, 1, 'Chinese', 0, '2022-01-04 21:45:51');

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `idCoupon` int(11) NOT NULL,
  `idRestaurant` int(11) NOT NULL,
  `couponCode` varchar(1000) NOT NULL,
  `termsAndCondition` varchar(1000) NOT NULL,
  `description` varchar(150) NOT NULL,
  `validFrom` datetime NOT NULL,
  `validTo` datetime NOT NULL,
  `isActive` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isDeleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `idCustomer` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `idRestaurant` int(11) NOT NULL,
  `idTable` int(11) NOT NULL,
  `isActive` int(1) DEFAULT 1,
  `createdOn` datetime NOT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `billNo` int(11) DEFAULT NULL,
  `billDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`idCustomer`, `name`, `email`, `mobile`, `idRestaurant`, `idTable`, `isActive`, `createdOn`, `updatedOn`, `billNo`, `billDate`) VALUES
(70, 'Hotel New Uday Bhuvan', '', '9999999999', 1, 31, 0, '2021-12-20 15:45:11', NULL, 0, '0000-00-00 00:00:00'),
(71, 'Hotel New Uday Bhuvan', '', '9999999999', 1, 31, 0, '2021-12-20 15:54:47', NULL, 0, '0000-00-00 00:00:00'),
(72, 'Vinayak Revankar', 'vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2021-12-20 15:58:59', NULL, 0, '0000-00-00 00:00:00'),
(73, 'Vinayak Revankar', 'vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2021-12-20 15:58:59', NULL, 0, '0000-00-00 00:00:00'),
(74, 'Hotel New Uday Bhuvan', '', '9999999999', 1, 31, 0, '2021-12-22 05:58:33', NULL, 0, '0000-00-00 00:00:00'),
(75, 'Vinayak Revankar', 'Vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2021-12-22 10:35:55', NULL, 0, '0000-00-00 00:00:00'),
(76, 'Hotel New Uday Bhuvan', '', '9999999999', 1, 31, 0, '2021-12-22 14:19:13', NULL, 0, '0000-00-00 00:00:00'),
(77, 'Hotel New Uday Bhuvan', '', '9999999999', 1, 31, 0, '2021-12-23 04:07:26', NULL, 0, '0000-00-00 00:00:00'),
(78, 'Hotel New Uday Bhuvan', '', '9999999999', 1, 32, 0, '2021-12-23 05:18:26', NULL, 0, '0000-00-00 00:00:00'),
(79, 'Hotel New Uday Bhuvan', '', '9999999999', 1, 32, 0, '2021-12-23 05:18:27', NULL, 0, '0000-00-00 00:00:00'),
(80, 'Hotel New Uday Bhuvan', '', '9999999999', 1, 31, 0, '2021-12-23 05:19:04', NULL, 0, '0000-00-00 00:00:00'),
(81, 'Hotel New Uday Bhuvan', '', '9999999999', 1, 31, 0, '2021-12-23 05:19:55', NULL, 0, '0000-00-00 00:00:00'),
(82, 'Vinayak Revankar', 'Vinayakanrevankar@gmail.com', '9999999999', 1, 42, 0, '2021-12-23 05:24:34', NULL, 0, '0000-00-00 00:00:00'),
(83, 'Vinayak Revankar', 'vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2021-12-23 06:09:33', NULL, 0, '0000-00-00 00:00:00'),
(84, 'Vinayak Revankar', 'Vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2021-12-23 06:10:07', NULL, 0, '0000-00-00 00:00:00'),
(85, 'Vinayak Revankar', 'vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2021-12-23 18:12:34', NULL, 0, '0000-00-00 00:00:00'),
(86, 'Hotel New Uday Bhuvan', '', '9999999999', 1, 31, 0, '2021-12-24 05:43:06', NULL, 0, '0000-00-00 00:00:00'),
(87, 'Hotel New Uday Bhuvan', '', '9999999999', 1, 31, 0, '2021-12-24 06:42:22', NULL, 0, '0000-00-00 00:00:00'),
(88, 'Hotel New Uday Bhuvan', '', '9999999999', 1, 31, 0, '2021-12-24 06:43:06', NULL, 0, '0000-00-00 00:00:00'),
(89, 'Vinayak Revankar', 'vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2021-12-24 08:39:06', NULL, 0, '0000-00-00 00:00:00'),
(90, 'Vinayak Revankar', 'Vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2021-12-24 15:20:07', NULL, 0, '0000-00-00 00:00:00'),
(91, 'Hotel New Uday Bhuvan', '', '9999999999', 1, 31, 0, '2021-12-25 05:33:09', NULL, 0, '0000-00-00 00:00:00'),
(92, 'Hotel New Uday Bhuvan', '', '9999999999', 1, 31, 0, '2021-12-25 05:48:30', NULL, 0, '0000-00-00 00:00:00'),
(93, 'Vinayak Revankar', 'Vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2021-12-26 08:54:34', NULL, 0, '0000-00-00 00:00:00'),
(94, 'Hotel New Uday Bhuvan', '', '9999999999', 1, 38, 0, '2021-12-26 13:33:02', NULL, 0, '0000-00-00 00:00:00'),
(95, 'Maniky', 'test@gmail.com', '9999999999', 1, 33, 0, '2021-12-26 13:34:51', NULL, 0, '0000-00-00 00:00:00'),
(96, 'Hotel New Uday Bhuvan', '', '9999999999', 1, 31, 0, '2021-12-26 14:03:10', NULL, 0, '0000-00-00 00:00:00'),
(97, 'Vinayak Revankar', 'vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2021-12-28 13:52:45', NULL, 0, '0000-00-00 00:00:00'),
(98, 'Vinayak Revankar', 'vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2021-12-28 15:16:20', NULL, 0, '0000-00-00 00:00:00'),
(99, 'Vinayak Revankar', 'vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2021-12-28 16:43:33', NULL, 0, '0000-00-00 00:00:00'),
(100, 'Palace', '', '9999999999', 1, 37, 0, '2021-12-28 17:50:34', NULL, 0, '0000-00-00 00:00:00'),
(101, 'Vinayak Revankar', 'vinayakanrevankar@gmail.com', '9999999999', 1, 32, 0, '2021-12-29 04:56:15', NULL, 0, '0000-00-00 00:00:00'),
(102, 'Vinayak Revankar', 'vinayakanrevankar@gmail.com', '9999999999', 1, 32, 0, '2021-12-29 04:56:17', NULL, 0, '0000-00-00 00:00:00'),
(103, 'Vinayak Revankar', 'vinayakanrevankar@gmail.com', '9999999999', 1, 32, 0, '2021-12-29 04:56:17', NULL, 0, '0000-00-00 00:00:00'),
(104, 'Maniky', 'test@gmail.com', '9999999999', 1, 33, 0, '2021-12-29 04:59:33', NULL, 0, '0000-00-00 00:00:00'),
(105, 'Mayur Palace', '', '9999999999', 1, 31, 0, '2021-12-29 05:09:08', NULL, 0, '0000-00-00 00:00:00'),
(106, 'Vinayak Revankar', 'Vinayakanrevankar@gmail.com', '9999999999', 1, 39, 0, '2021-12-29 06:53:07', NULL, 0, '0000-00-00 00:00:00'),
(107, 'Vinayak Revankar', 'Vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2021-12-29 15:05:27', NULL, 0, '0000-00-00 00:00:00'),
(108, 'Vinayak Revankar', 'Vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2021-12-29 15:05:33', NULL, 0, '0000-00-00 00:00:00'),
(109, 'Vinayak Revankar', 'vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2022-01-03 05:56:07', NULL, 0, '0000-00-00 00:00:00'),
(110, 'Vinayak Revankar', 'vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2022-01-03 07:28:11', NULL, 0, '0000-00-00 00:00:00'),
(111, 'Mayur Palace', '', '9999999999', 1, 31, 0, '2022-01-04 03:49:43', NULL, 0, '0000-00-00 00:00:00'),
(112, 'Vinayak Revankar', 'Vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2022-01-04 06:23:36', NULL, 0, '0000-00-00 00:00:00'),
(113, 'Vinayak Revankar', 'vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2022-01-04 12:28:49', NULL, 0, '0000-00-00 00:00:00'),
(114, 'Aniket', 'shashikumar@gmail.com', '9999999999', 1, 31, 0, '2022-01-04 13:39:30', NULL, 0, '0000-00-00 00:00:00'),
(115, 'Aniket', 'shashikumar@gmail.com', '9999999999', 1, 31, 0, '2022-01-04 13:39:31', NULL, 0, '0000-00-00 00:00:00'),
(116, 'Vinayak Revankar', 'Vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2022-01-04 14:28:54', NULL, 0, '0000-00-00 00:00:00'),
(118, 'Vinayak Revankar', 'vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2022-01-06 03:27:46', NULL, 0, '0000-00-00 00:00:00'),
(119, 'Sagar', 'sagar39@gmail.com', '9999999999', 1, 33, 0, '2022-01-06 06:50:24', NULL, 0, '0000-00-00 00:00:00'),
(120, 'Vinayak Revankar', 'Vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2022-01-06 06:52:59', NULL, 0, '0000-00-00 00:00:00'),
(121, 'Sagar', 'sagar39@gmail.com', '9999999999', 1, 33, 0, '2022-01-06 06:56:38', NULL, 0, '0000-00-00 00:00:00'),
(122, 'Sagar', 'sagar39@gmail.com', '9999999999', 1, 33, 0, '2022-01-06 06:56:39', NULL, 0, '0000-00-00 00:00:00'),
(123, 'Vinayak Revankar', 'vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2022-01-06 07:01:08', NULL, 0, '0000-00-00 00:00:00'),
(124, 'Vinayak Revankar', 'vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2022-01-06 07:02:52', NULL, 0, '0000-00-00 00:00:00'),
(125, 'Vinayak Revankar', 'Vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2022-01-06 07:04:14', NULL, 0, '0000-00-00 00:00:00'),
(126, 'Vinayak Revankar', 'vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2022-01-06 07:20:00', NULL, 0, '0000-00-00 00:00:00'),
(127, 'Rohit', 'test@gmail.com', '9999999999', 1, 31, 0, '2022-01-06 07:46:51', NULL, 0, '0000-00-00 00:00:00'),
(128, 'Vinayak Revankar', 'Vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2022-01-06 10:07:28', NULL, 0, '0000-00-00 00:00:00'),
(129, 'Vinayak Revankar', 'vinayakanrevankar@gmail.com', '9999999999', 1, 33, 0, '2022-01-06 10:09:24', NULL, 0, '0000-00-00 00:00:00'),
(130, 'Vinayak Revankar', 'vinayakanrevankar@gmail.com', '9999999999', 1, 33, 1, '2022-01-06 10:09:25', NULL, 0, '0000-00-00 00:00:00'),
(131, 'Vinayak', 'vinayaksm55@gmail.com', '9999999999', 1, 31, 0, '2022-01-06 10:26:44', NULL, 0, '0000-00-00 00:00:00'),
(132, 'Vinayak', 'vinayaksm55@gmail.com', '9999999999', 1, 31, 0, '2022-01-06 10:26:48', NULL, 0, '0000-00-00 00:00:00'),
(133, 'Palace', '', '9999999999', 1, 34, 0, '2022-01-06 10:40:40', NULL, 0, '0000-00-00 00:00:00'),
(134, 'Palace', '', '9999999999', 1, 31, 0, '2022-01-06 12:42:31', NULL, 0, '0000-00-00 00:00:00'),
(135, 'Akash', 'akash@gmail.com', '9999999999', 1, 31, 0, '2022-01-06 12:45:25', NULL, 0, '0000-00-00 00:00:00'),
(136, 'Vinayak Revankar', 'vinayakanrevankar@gmail.com', '9999999999', 1, 44, 0, '2022-01-07 06:50:38', NULL, 0, '0000-00-00 00:00:00'),
(137, 'Amol', 'amol@gmail.com', '9999999999', 1, 41, 0, '2022-01-07 08:28:40', NULL, 0, '0000-00-00 00:00:00'),
(139, 'Vinayak Revankar', 'Vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2022-01-07 09:50:33', NULL, 0, '0000-00-00 00:00:00'),
(140, 'Anand Rao', 'Vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2022-01-07 09:50:33', NULL, 0, '0000-00-00 00:00:00'),
(141, 'Polo', 'Vinayakanrevankar@gmail.com', '9999999999', 1, 37, 0, '2022-01-07 10:28:08', NULL, 0, '0000-00-00 00:00:00'),
(143, 'Rishikesh', 'rishikesh.baikerikar@gmail.com', '9999999999', 1, 31, 0, '2022-01-07 14:46:29', NULL, 0, '0000-00-00 00:00:00'),
(145, 'Palace', '', '9999999999', 1, 31, 0, '2022-01-07 16:00:15', NULL, 0, '0000-00-00 00:00:00'),
(146, 'Vinayak Revankar', 'vinayakanrevankar@gmail.com', '9999999999', 1, 32, 0, '2022-01-07 18:20:19', NULL, 0, '0000-00-00 00:00:00'),
(147, 'Palace', '', '9999999999', 1, 31, 0, '2022-01-08 05:30:51', NULL, 0, '0000-00-00 00:00:00'),
(148, 'Palace', '', '9999999999', 1, 32, 0, '2022-01-08 05:32:57', NULL, 0, '0000-00-00 00:00:00'),
(149, 'Palace', '', '9999999999', 1, 37, 0, '2022-01-08 05:36:58', NULL, 0, '0000-00-00 00:00:00'),
(150, 'Palace', '', '9999999999', 1, 44, 0, '2022-01-08 05:38:06', NULL, 0, '0000-00-00 00:00:00'),
(151, 'Palace', '', '9999999999', 1, 31, 0, '2022-01-08 05:39:34', NULL, 0, '0000-00-00 00:00:00'),
(152, 'Palace', '', '9999999999', 1, 31, 0, '2022-01-08 08:34:36', NULL, 0, '0000-00-00 00:00:00'),
(153, 'Palace', '', '9999999999', 1, 31, 0, '2022-01-08 12:59:20', NULL, 0, '0000-00-00 00:00:00'),
(154, 'Palace', '', '9999999999', 1, 31, 0, '2022-01-08 14:24:54', NULL, 0, '0000-00-00 00:00:00'),
(155, 'Palace', '', '9999999999', 1, 31, 0, '2022-01-08 14:32:52', NULL, 0, '0000-00-00 00:00:00'),
(156, 'Husen', 'chnhijgyj@gbgh.com', '9999999999', 1, 31, 0, '2022-01-09 16:05:23', NULL, 0, '0000-00-00 00:00:00'),
(157, 'Palace', '', '9999999999', 1, 31, 0, '2022-01-10 04:24:05', NULL, 0, '0000-00-00 00:00:00'),
(158, 'Palace', '', '9999999999', 1, 31, 0, '2022-01-10 05:36:39', NULL, 0, '0000-00-00 00:00:00'),
(159, 'Palace', '', '9999999999', 1, 39, 0, '2022-01-10 05:42:42', NULL, 0, '0000-00-00 00:00:00'),
(160, 'Palace', '', '9999999999', 1, 35, 0, '2022-01-10 05:43:04', NULL, 0, '0000-00-00 00:00:00'),
(161, 'Palace', '', '9999999999', 1, 37, 0, '2022-01-10 05:43:40', NULL, 0, '0000-00-00 00:00:00'),
(162, 'Palace Testing', '', '9999999999', 1, 44, 0, '2022-01-10 05:48:26', NULL, 0, '0000-00-00 00:00:00'),
(163, 'Palace', '', '9999999999', 1, 32, 0, '2022-01-10 05:49:01', NULL, 0, '0000-00-00 00:00:00'),
(164, 'Vinayak Revankar', 'vinayakanrevankar@gmail.com', '9999999999', 1, 31, 0, '2022-01-10 08:26:24', '2022-01-12 05:23:43', 0, '0000-00-00 00:00:00'),
(165, 'Palace', '', '9999999999', 1, 38, 0, '2022-01-11 07:57:34', NULL, 0, '0000-00-00 00:00:00'),
(166, 'Rohit', 'test@gmail.com', '9999999999', 1, 34, 0, '2022-01-11 08:01:34', NULL, 0, '0000-00-00 00:00:00'),
(167, 'Vinayak Revankar', 'vinayakanrevankar@gmail.com', '9999999999', 1, 33, 1, '2022-01-12 05:28:49', NULL, 0, '0000-00-00 00:00:00'),
(168, 'Palace', '', '9999999999', 1, 31, 1, '2022-01-26 13:35:01', NULL, 0, '0000-00-00 00:00:00'),
(169, 'Palace', '', '9999999999', 1, 32, 1, '2022-02-05 13:39:55', NULL, 0, '0000-00-00 00:00:00'),
(170, 'Vinayak Revankar', 'vinayakanrevankar@gmail.com', '9880403018', 1, 44, 1, '2024-05-08 18:03:39', NULL, NULL, NULL),
(171, 'Vinayak Revankar', 'vinayakanrevankar@gmail.com', '9880403018', 1, 41, 1, '2024-05-08 20:30:32', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dealer`
--

CREATE TABLE `dealer` (
  `idDealer` int(11) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `alternateNumber` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `idState` int(11) NOT NULL,
  `city` varchar(20) NOT NULL,
  `address` varchar(500) NOT NULL,
  `aadharIdProofPath` varchar(1000) NOT NULL,
  `pancardIdProofPath` varchar(1000) NOT NULL,
  `createdOn` datetime NOT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `isActive` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dealer`
--

INSERT INTO `dealer` (`idDealer`, `firstName`, `lastName`, `mobile`, `alternateNumber`, `email`, `idState`, `city`, `address`, `aadharIdProofPath`, `pancardIdProofPath`, `createdOn`, `updatedOn`, `isActive`) VALUES
(14, 'Uttam', 'A', '9898989898', '9898989898', 'a@gmail.com', 12, 'Bangalore', '10th cross s.s.a road  hebbal Bangalore', 'uploads\\34afcdae-a348-4019-a243-aa5f0e99cf3f.JPEG', 'uploads\\e75d192a-e3c1-4b8c-9f97-7e899c1a3e5d.JPEG', '2022-01-05 03:25:50', NULL, 0),
(15, 'Rahul', 'A', '9898989898', '9898989898', 'r@gmail.com', 12, 'Bangalore', '10th cross s.s.a road  hebbal Bangalore', 'uploads\\34afcdae-a348-4019-a243-aa5f0e99cf3f.JPEG', 'uploads\\e75d192a-e3c1-4b8c-9f97-7e899c1a3e5d.JPEG', '2022-01-05 03:25:50', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `idItem` int(11) NOT NULL,
  `idCategory` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` varchar(10) NOT NULL,
  `photoURL` varchar(5000) NOT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `isUnavailable` int(1) NOT NULL DEFAULT 0,
  `createdOn` datetime NOT NULL,
  `updatedOn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`idItem`, `idCategory`, `name`, `description`, `price`, `photoURL`, `keywords`, `isUnavailable`, `createdOn`, `updatedOn`) VALUES
(38, 41, 'French Fries ', 'Taste with Sauce ', '70', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnxxUusAXU7nl1ysYNRMMl2z4euDJDvAHhUQ&usqp=CAU', NULL, 0, '2021-12-20 15:22:42', '2022-01-03 05:50:01'),
(39, 42, 'Tomato Soup', '', '50', 'https://veganhuggs.com/wp-content/uploads/2020/10/Roasted-tomato-soup-square.jpg', NULL, 0, '2021-12-20 15:41:38', '2022-01-03 05:50:57'),
(41, 45, 'butter scotch ', '', '150', 'https://www.sidechef.com/recipe/a3b228d7-975f-4fda-a718-d20e6db3936a.jpeg?d=1408x1120', NULL, 0, '2021-12-20 15:43:47', '2022-01-03 05:52:50'),
(42, 41, 'Hara Bhara Kabab', 'Taste with Pudina Chuteny and Sauce', '70 ', 'https://www.vegrecipesofindia.com/wp-content/uploads/2013/01/hara-bhara-kabab-recipe-1-500x500.jpg', NULL, 0, '2021-12-24 09:37:36', '2022-01-03 05:53:27'),
(43, 41, 'Crispy Corn Chat', 'Spicy with Salty', '70', 'https://www.cookclickndevour.com/wp-content/uploads/2017/08/crispy-corn-recipe-c-683x1024.jpg', NULL, 0, '2021-12-24 09:42:15', '2022-01-03 05:54:24'),
(44, 41, 'Gobi Manchurian', 'Taste with Sauce', '90', 'https://www.hookedonheat.com/wp-content/uploads/2006/03/Gobi-Manchurian-HOHV-500x375.jpg', NULL, 0, '2021-12-24 09:45:19', '2022-01-03 05:54:56'),
(45, 41, 'Hakka Noodles ', 'Taste with Sauce', '95', 'https://www.whiskaffair.com/wp-content/uploads/2020/03/Hakka-Noodles-2-3.jpg', NULL, 0, '2021-12-24 09:46:29', '2022-01-03 05:55:27'),
(49, 48, 'Chicken Biryani', 'Taste with Sprite', '150', 'https://www.cubesnjuliennes.com/wp-content/uploads/2020/07/Chicken-Biryani-Recipe-500x500.jpg', NULL, 0, '2022-01-04 11:52:05', NULL),
(50, 49, 'Baby Corn Manchuari', 'Taste with Sauce', '70', 'https://southindianfoods.in/recipe_picture_enlarge/corn-manchurian.jpg', NULL, 0, '2022-01-05 03:20:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kot`
--

CREATE TABLE `kot` (
  `idKot` int(11) NOT NULL,
  `idRestaurant` int(11) NOT NULL,
  `idCustomer` int(11) NOT NULL,
  `sequence` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kot`
--

INSERT INTO `kot` (`idKot`, `idRestaurant`, `idCustomer`, `sequence`) VALUES
(1, 1, 61, 1),
(2, 1, 157, 1),
(3, 1, 157, 2),
(4, 1, 158, 1),
(5, 1, 158, 2),
(6, 1, 158, 3),
(7, 1, 159, 1),
(8, 1, 160, 1),
(9, 1, 163, 1),
(10, 1, 162, 1),
(11, 1, 164, 1),
(12, 1, 164, 2),
(13, 1, 164, 3),
(14, 1, 165, 1),
(15, 1, 165, 2),
(16, 1, 166, 1),
(17, 1, 166, 2),
(18, 1, 167, 1),
(19, 1, 167, 2),
(20, 1, 167, 3),
(21, 1, 167, 4),
(22, 1, 167, 5),
(23, 1, 167, 6),
(24, 1, 168, 1);

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `idModule` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`idModule`, `name`) VALUES
(1, 'Common'),
(2, 'UserType');

-- --------------------------------------------------------

--
-- Table structure for table `ordered_item`
--

CREATE TABLE `ordered_item` (
  `idOrder` int(11) NOT NULL,
  `IdReference` varchar(100) NOT NULL,
  `idTable` int(11) NOT NULL,
  `idCustomer` int(11) NOT NULL,
  `idItem` int(11) NOT NULL,
  `price` varchar(100) NOT NULL,
  `createdOn` datetime NOT NULL,
  `isCancelled` int(1) DEFAULT 0,
  `status` int(11) NOT NULL,
  `isNotified` int(1) NOT NULL DEFAULT 1,
  `isConfirmed` int(1) NOT NULL DEFAULT 0,
  `idKot` int(11) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ordered_item`
--

INSERT INTO `ordered_item` (`idOrder`, `IdReference`, `idTable`, `idCustomer`, `idItem`, `price`, `createdOn`, `isCancelled`, `status`, `isNotified`, `isConfirmed`, `idKot`, `updatedOn`) VALUES
(124, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 70, 38, '70', '2021-12-20 15:45:16', 0, 0, 1, 1, NULL, NULL),
(125, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 70, 40, '250', '2021-12-20 15:48:12', 0, 0, 1, 1, NULL, NULL),
(126, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 71, 40, '250', '2021-12-20 15:55:00', 0, 0, 1, 1, NULL, NULL),
(127, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 71, 40, '250', '2021-12-20 15:55:10', 0, 0, 1, 1, NULL, NULL),
(128, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 71, 39, '50', '2021-12-20 15:55:18', 0, 0, 1, 1, NULL, NULL),
(129, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 72, 39, '50', '2021-12-20 16:01:13', 0, 0, 1, 1, NULL, NULL),
(130, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 72, 38, '70', '2021-12-20 16:01:13', 0, 0, 1, 1, NULL, NULL),
(131, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 72, 38, '70', '2021-12-20 16:01:13', 0, 0, 1, 1, NULL, NULL),
(132, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 72, 39, '50', '2021-12-20 16:02:36', 0, 0, 1, 1, NULL, NULL),
(133, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 72, 40, '250', '2021-12-20 16:02:36', 0, 0, 1, 1, NULL, NULL),
(134, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 72, 40, '250', '2021-12-20 16:02:36', 0, 0, 1, 1, NULL, NULL),
(135, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 72, 39, '50', '2021-12-20 16:02:36', 0, 0, 1, 1, NULL, NULL),
(136, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 72, 39, '50', '2021-12-20 16:03:30', 0, 0, 1, 1, NULL, NULL),
(137, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 72, 38, '70', '2021-12-20 16:03:30', 0, 0, 1, 1, NULL, NULL),
(138, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 73, 38, '70', '2021-12-22 05:58:43', 0, 0, 1, 0, NULL, NULL),
(139, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 74, 38, '70', '2021-12-22 10:36:06', 0, 0, 1, 0, NULL, NULL),
(140, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 75, 39, '50', '2021-12-22 10:36:26', 0, 0, 1, 1, NULL, NULL),
(141, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 76, 38, '70', '2021-12-22 14:19:21', 0, 0, 1, 0, NULL, NULL),
(142, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 77, 38, '70', '2021-12-23 04:07:35', 0, 0, 1, 1, NULL, NULL),
(143, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 77, 38, '70', '2021-12-23 04:07:35', 0, 0, 1, 1, NULL, NULL),
(144, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 81, 38, '70', '2021-12-23 05:20:02', 0, 0, 1, 1, NULL, NULL),
(145, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 81, 39, '50', '2021-12-23 05:20:10', 0, 0, 1, 1, NULL, NULL),
(146, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 81, 38, '70', '2021-12-23 05:20:20', 1, 0, 1, 1, NULL, NULL),
(147, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 81, 38, '70', '2021-12-23 05:20:20', 1, 0, 1, 1, NULL, NULL),
(148, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 81, 38, '70', '2021-12-23 05:20:20', 0, 0, 1, 1, NULL, NULL),
(149, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 81, 38, '70', '2021-12-23 05:20:20', 0, 0, 1, 1, NULL, NULL),
(150, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 81, 38, '70', '2021-12-23 05:20:20', 0, 0, 1, 1, NULL, NULL),
(151, 'cdaea8e9-8581-4de1-a8c3-aac438001194', 42, 82, 38, '70', '2021-12-23 05:24:59', 0, 0, 1, 1, NULL, NULL),
(152, 'cdaea8e9-8581-4de1-a8c3-aac438001194', 42, 82, 38, '70', '2021-12-23 05:24:59', 0, 0, 1, 1, NULL, NULL),
(153, 'cdaea8e9-8581-4de1-a8c3-aac438001194', 42, 82, 38, '70', '2021-12-23 05:24:59', 0, 0, 1, 1, NULL, NULL),
(154, 'cdaea8e9-8581-4de1-a8c3-aac438001194', 42, 82, 39, '50', '2021-12-23 05:25:02', 0, 0, 1, 1, NULL, NULL),
(155, 'cdaea8e9-8581-4de1-a8c3-aac438001194', 42, 82, 39, '50', '2021-12-23 05:25:02', 0, 0, 1, 1, NULL, NULL),
(156, 'cdaea8e9-8581-4de1-a8c3-aac438001194', 42, 82, 40, '250', '2021-12-23 05:25:04', 1, 0, 1, 1, NULL, NULL),
(157, 'cdaea8e9-8581-4de1-a8c3-aac438001194', 42, 82, 40, '250', '2021-12-23 05:25:04', 0, 0, 1, 1, NULL, NULL),
(158, 'cdaea8e9-8581-4de1-a8c3-aac438001194', 42, 82, 40, '250', '2021-12-23 05:25:04', 0, 0, 1, 1, NULL, NULL),
(159, 'cdaea8e9-8581-4de1-a8c3-aac438001194', 42, 82, 40, '250', '2021-12-23 05:25:04', 0, 0, 1, 1, NULL, NULL),
(160, 'cdaea8e9-8581-4de1-a8c3-aac438001194', 42, 82, 40, '250', '2021-12-23 05:25:04', 0, 0, 1, 1, NULL, NULL),
(161, 'cdaea8e9-8581-4de1-a8c3-aac438001194', 42, 82, 41, '150', '2021-12-23 05:25:06', 1, 0, 1, 1, NULL, NULL),
(162, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 78, 41, '150', '2021-12-23 06:08:23', 0, 0, 1, 1, NULL, NULL),
(163, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 78, 39, '50', '2021-12-23 06:08:40', 0, 0, 1, 1, NULL, NULL),
(164, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 78, 39, '50', '2021-12-23 06:08:40', 0, 0, 1, 1, NULL, NULL),
(165, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 78, 39, '50', '2021-12-23 06:08:40', 0, 0, 1, 1, NULL, NULL),
(166, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 78, 40, '250', '2021-12-23 06:08:43', 0, 0, 1, 1, NULL, NULL),
(167, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 78, 40, '250', '2021-12-23 06:08:43', 0, 0, 1, 1, NULL, NULL),
(168, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 78, 40, '250', '2021-12-23 06:08:43', 0, 0, 1, 1, NULL, NULL),
(169, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 78, 40, '250', '2021-12-23 06:08:43', 0, 0, 1, 1, NULL, NULL),
(170, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 78, 40, '250', '2021-12-23 06:08:43', 0, 0, 1, 1, NULL, NULL),
(171, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 83, 40, '250', '2021-12-23 06:10:22', 0, 0, 1, 1, NULL, NULL),
(172, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 83, 41, '150', '2021-12-23 06:10:22', 1, 0, 1, 1, NULL, NULL),
(173, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 83, 39, '50', '2021-12-23 06:10:22', 0, 0, 1, 1, NULL, NULL),
(174, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 83, 40, '250', '2021-12-23 06:10:22', 0, 0, 1, 1, NULL, NULL),
(175, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 83, 39, '50', '2021-12-23 06:10:22', 0, 0, 1, 1, NULL, NULL),
(176, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 83, 38, '70', '2021-12-23 06:11:04', 0, 0, 1, 1, NULL, NULL),
(177, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 83, 41, '150', '2021-12-23 06:11:04', 1, 0, 1, 1, NULL, NULL),
(178, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 83, 41, '150', '2021-12-23 06:11:04', 1, 0, 1, 1, NULL, NULL),
(179, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 83, 41, '150', '2021-12-23 06:11:04', 1, 0, 1, 1, NULL, NULL),
(180, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 83, 41, '150', '2021-12-23 06:11:04', 1, 0, 1, 1, NULL, NULL),
(181, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 83, 40, '250', '2021-12-23 06:11:04', 0, 0, 1, 1, NULL, NULL),
(182, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 83, 40, '250', '2021-12-23 06:11:04', 0, 0, 1, 1, NULL, NULL),
(183, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 83, 39, '50', '2021-12-23 06:11:04', 0, 0, 1, 1, NULL, NULL),
(184, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 83, 39, '50', '2021-12-23 06:11:04', 0, 0, 1, 1, NULL, NULL),
(185, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 83, 38, '70', '2021-12-23 06:11:04', 0, 0, 1, 1, NULL, NULL),
(186, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 83, 41, '150', '2021-12-23 06:11:04', 0, 0, 1, 1, NULL, NULL),
(187, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 83, 40, '250', '2021-12-23 06:11:04', 1, 0, 1, 1, NULL, NULL),
(188, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 83, 39, '50', '2021-12-23 06:11:04', 0, 0, 1, 1, NULL, NULL),
(189, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 78, 38, '70', '2021-12-23 06:16:40', 0, 0, 1, 1, NULL, NULL),
(190, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 85, 41, '150', '2021-12-23 18:12:52', 0, 0, 1, 0, NULL, NULL),
(191, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 85, 40, '250', '2021-12-23 18:12:52', 0, 0, 1, 0, NULL, NULL),
(192, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 85, 39, '50', '2021-12-23 18:12:52', 0, 0, 1, 0, NULL, NULL),
(193, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 85, 38, '70', '2021-12-23 18:12:52', 0, 0, 1, 0, NULL, NULL),
(194, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 85, 40, '250', '2021-12-23 18:12:52', 0, 0, 1, 0, NULL, NULL),
(195, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 85, 39, '50', '2021-12-23 18:12:52', 0, 0, 1, 0, NULL, NULL),
(196, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 85, 38, '70', '2021-12-24 05:40:45', 0, 0, 1, 0, NULL, NULL),
(197, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 86, 39, '50', '2021-12-24 05:43:14', 0, 0, 1, 1, NULL, NULL),
(198, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 86, 39, '50', '2021-12-24 05:43:14', 0, 0, 1, 1, NULL, NULL),
(199, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 86, 39, '50', '2021-12-24 05:43:14', 0, 0, 1, 1, NULL, NULL),
(200, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 86, 39, '50', '2021-12-24 05:43:14', 0, 0, 1, 1, NULL, NULL),
(201, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 86, 39, '50', '2021-12-24 05:43:14', 0, 0, 1, 1, NULL, NULL),
(202, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 86, 38, '70', '2021-12-24 05:43:21', 0, 0, 1, 1, NULL, NULL),
(203, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 86, 38, '70', '2021-12-24 05:43:21', 0, 0, 1, 1, NULL, NULL),
(204, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 79, 40, '250', '2021-12-24 05:44:15', 0, 0, 1, 1, NULL, NULL),
(205, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 79, 38, '70', '2021-12-24 05:44:19', 0, 0, 1, 1, NULL, NULL),
(206, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 79, 39, '50', '2021-12-24 05:44:24', 0, 0, 1, 1, NULL, NULL),
(207, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 87, 39, '50', '2021-12-24 06:42:31', 0, 0, 1, 1, NULL, NULL),
(208, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 87, 39, '50', '2021-12-24 06:42:31', 0, 0, 1, 1, NULL, NULL),
(209, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 87, 39, '50', '2021-12-24 06:42:31', 0, 0, 1, 1, NULL, NULL),
(210, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 87, 39, '50', '2021-12-24 06:42:31', 0, 0, 1, 1, NULL, NULL),
(211, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 87, 39, '50', '2021-12-24 06:42:31', 0, 0, 1, 1, NULL, NULL),
(212, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 87, 38, '70', '2021-12-24 06:42:34', 0, 0, 1, 1, NULL, NULL),
(213, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 89, 40, '250', '2021-12-24 08:39:29', 0, 0, 1, 1, NULL, NULL),
(214, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 89, 41, '150', '2021-12-24 08:39:29', 0, 0, 1, 1, NULL, NULL),
(215, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 89, 40, '250', '2021-12-24 08:39:29', 0, 0, 1, 1, NULL, NULL),
(216, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 89, 41, '150', '2021-12-24 08:39:29', 0, 0, 1, 1, NULL, NULL),
(217, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 89, 41, '150', '2021-12-24 08:39:29', 0, 0, 1, 1, NULL, NULL),
(218, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 89, 40, '250', '2021-12-24 15:16:02', 0, 0, 1, 1, NULL, NULL),
(219, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 89, 43, '70', '2021-12-24 15:16:02', 0, 0, 1, 1, NULL, NULL),
(220, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 89, 42, '70', '2021-12-24 15:16:02', 0, 0, 1, 1, NULL, NULL),
(221, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 89, 38, '70', '2021-12-24 15:16:02', 0, 0, 1, 1, NULL, NULL),
(222, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 90, 38, '70', '2021-12-24 15:20:26', 0, 0, 1, 1, NULL, NULL),
(223, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 90, 38, '70', '2021-12-24 15:20:26', 0, 0, 1, 1, NULL, NULL),
(224, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 90, 39, '50', '2021-12-24 15:20:28', 0, 0, 1, 1, NULL, NULL),
(225, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 90, 39, '50', '2021-12-24 15:20:28', 0, 0, 1, 1, NULL, NULL),
(226, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 90, 40, '250', '2021-12-24 15:20:30', 0, 0, 1, 1, NULL, NULL),
(227, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 90, 41, '150', '2021-12-24 15:20:33', 0, 0, 1, 1, NULL, NULL),
(228, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 91, 38, '70', '2021-12-25 05:41:02', 0, 0, 1, 1, NULL, NULL),
(229, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 91, 38, '70', '2021-12-25 05:41:02', 0, 0, 1, 1, NULL, NULL),
(230, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 91, 38, '70', '2021-12-25 05:41:02', 0, 0, 1, 1, NULL, NULL),
(231, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 92, 42, '70', '2021-12-25 15:30:13', 0, 0, 1, 1, NULL, NULL),
(232, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 92, 38, '70', '2021-12-25 15:30:13', 0, 0, 1, 1, NULL, NULL),
(233, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 93, 44, '90', '2021-12-26 08:59:31', 0, 0, 1, 1, NULL, NULL),
(234, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 93, 42, '70', '2021-12-26 08:59:31', 0, 0, 1, 1, NULL, NULL),
(235, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 93, 42, '70', '2021-12-26 08:59:31', 0, 0, 1, 1, NULL, NULL),
(236, '70185e5f-e828-4c96-8838-31d77afe5114', 38, 94, 38, '70', '2021-12-26 13:33:21', 0, 0, 1, 1, NULL, NULL),
(237, '70185e5f-e828-4c96-8838-31d77afe5114', 38, 94, 38, '70', '2021-12-26 13:33:21', 0, 0, 1, 1, NULL, NULL),
(238, '70185e5f-e828-4c96-8838-31d77afe5114', 38, 94, 38, '70', '2021-12-26 13:33:21', 0, 0, 1, 1, NULL, NULL),
(239, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 96, 39, '50', '2021-12-26 14:03:19', 0, 0, 1, 0, NULL, NULL),
(240, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 79, 40, '250', '2021-12-27 12:36:06', 0, 0, 1, 1, NULL, NULL),
(241, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 97, 3, '189', '2021-12-28 14:08:52', 0, 0, 1, 0, NULL, NULL),
(242, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 98, 38, '70', '2021-12-28 15:16:35', 0, 0, 1, 1, NULL, NULL),
(243, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 98, 42, '70', '2021-12-28 16:29:03', 0, 0, 1, 1, NULL, NULL),
(244, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 98, 42, '70', '2021-12-28 16:29:03', 0, 0, 1, 1, NULL, NULL),
(245, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 98, 38, '70', '2021-12-28 16:29:03', 0, 0, 1, 1, NULL, NULL),
(246, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 98, 41, '150', '2021-12-28 16:33:54', 0, 0, 1, 1, NULL, NULL),
(247, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 98, 43, '70', '2021-12-28 16:33:54', 0, 0, 1, 1, NULL, NULL),
(248, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 98, 42, '70', '2021-12-28 16:33:54', 0, 0, 1, 1, NULL, NULL),
(249, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 98, 44, '90', '2021-12-28 16:33:54', 0, 0, 1, 1, NULL, NULL),
(250, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 98, 42, '70', '2021-12-28 16:33:54', 0, 0, 1, 1, NULL, NULL),
(251, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 98, 41, '150', '2021-12-28 16:33:54', 0, 0, 1, 1, NULL, NULL),
(252, 'fc3d1936-683f-4cf9-bea5-85dd198dd496', 37, 100, 38, '70', '2021-12-28 17:50:57', 0, 0, 1, 1, NULL, NULL),
(253, 'fc3d1936-683f-4cf9-bea5-85dd198dd496', 37, 100, 43, '70', '2021-12-28 17:52:34', 0, 0, 1, 1, NULL, NULL),
(254, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 105, 38, '70', '2021-12-29 05:25:15', 0, 0, 1, 1, NULL, NULL),
(255, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 102, 38, '70', '2021-12-29 06:45:45', 0, 0, 1, 1, NULL, NULL),
(256, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 102, 39, '50', '2021-12-29 06:47:41', 0, 0, 1, 1, NULL, NULL),
(257, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 105, 39, '50', '2021-12-29 07:08:34', 0, 0, 1, 1, NULL, NULL),
(258, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 105, 40, '250', '2021-12-29 07:09:08', 0, 0, 1, 1, NULL, NULL),
(259, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 105, 38, '70', '2021-12-29 07:09:10', 0, 0, 1, 1, NULL, NULL),
(260, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 102, 40, '250', '2021-12-29 14:33:38', 0, 0, 1, 1, NULL, NULL),
(261, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 102, 40, '250', '2021-12-29 14:33:38', 0, 0, 1, 1, NULL, NULL),
(262, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 102, 38, '70', '2021-12-29 14:33:47', 0, 0, 1, 1, NULL, NULL),
(263, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 102, 41, '1500', '2021-12-29 14:33:56', 0, 0, 1, 1, NULL, NULL),
(264, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 107, 38, '70', '2021-12-29 15:05:41', 0, 0, 1, 1, NULL, NULL),
(265, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 107, 39, '50', '2021-12-29 15:05:43', 0, 0, 1, 1, NULL, NULL),
(266, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 107, 40, '250', '2021-12-29 15:05:48', 0, 0, 1, 1, NULL, NULL),
(267, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 107, 39, '50', '2021-12-29 15:05:50', 0, 0, 1, 1, NULL, NULL),
(268, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 107, 40, '250', '2021-12-29 15:05:51', 0, 0, 1, 1, NULL, NULL),
(269, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 107, 41, '1500', '2021-12-29 15:06:26', 0, 0, 1, 1, NULL, NULL),
(270, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 107, 39, '50', '2021-12-29 15:07:16', 0, 0, 1, 1, NULL, NULL),
(271, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 107, 38, '70', '2021-12-29 15:07:25', 0, 0, 1, 1, NULL, NULL),
(272, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 102, 38, '70', '2022-01-01 14:02:20', 0, 0, 1, 1, NULL, NULL),
(273, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 102, 38, '70', '2022-01-01 14:03:31', 0, 0, 1, 1, NULL, NULL),
(274, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 102, 38, '70', '2022-01-01 14:07:44', 0, 0, 1, 1, NULL, NULL),
(275, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 102, 38, '70', '2022-01-01 14:07:57', 0, 0, 1, 1, NULL, NULL),
(276, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 102, 38, '70', '2022-01-01 14:11:04', 0, 0, 1, 1, NULL, NULL),
(277, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 102, 38, '70', '2022-01-01 14:12:29', 0, 0, 1, 1, NULL, NULL),
(278, '416e37e1-8422-4a73-9933-515571a71a50', 39, 106, 38, '70', '2022-01-01 21:26:59', 0, 0, 1, 1, NULL, NULL),
(279, '416e37e1-8422-4a73-9933-515571a71a50', 39, 106, 38, '70', '2022-01-01 21:26:59', 0, 0, 1, 1, NULL, NULL),
(280, '416e37e1-8422-4a73-9933-515571a71a50', 39, 106, 38, '70', '2022-01-01 21:26:59', 0, 0, 1, 1, NULL, NULL),
(281, '416e37e1-8422-4a73-9933-515571a71a50', 39, 106, 38, '70', '2022-01-01 21:26:59', 0, 0, 1, 1, NULL, NULL),
(282, '416e37e1-8422-4a73-9933-515571a71a50', 39, 106, 38, '70', '2022-01-01 21:26:59', 0, 0, 1, 1, NULL, NULL),
(283, '416e37e1-8422-4a73-9933-515571a71a50', 39, 106, 38, '70', '2022-01-01 21:26:59', 0, 0, 1, 1, NULL, NULL),
(284, '416e37e1-8422-4a73-9933-515571a71a50', 39, 106, 38, '70', '2022-01-01 21:26:59', 0, 0, 1, 1, NULL, NULL),
(285, '416e37e1-8422-4a73-9933-515571a71a50', 39, 106, 40, '250', '2022-01-01 21:27:19', 0, 0, 1, 1, NULL, NULL),
(286, '416e37e1-8422-4a73-9933-515571a71a50', 39, 106, 40, '250', '2022-01-01 21:27:19', 0, 0, 1, 1, NULL, NULL),
(287, '416e37e1-8422-4a73-9933-515571a71a50', 39, 106, 40, '250', '2022-01-01 21:27:19', 0, 0, 1, 1, NULL, NULL),
(288, '416e37e1-8422-4a73-9933-515571a71a50', 39, 106, 40, '250', '2022-01-01 21:27:19', 0, 0, 1, 1, NULL, NULL),
(289, '416e37e1-8422-4a73-9933-515571a71a50', 39, 106, 40, '250', '2022-01-01 21:27:19', 0, 0, 1, 1, NULL, NULL),
(290, '416e37e1-8422-4a73-9933-515571a71a50', 39, 106, 40, '250', '2022-01-01 21:27:19', 0, 0, 1, 1, NULL, NULL),
(291, '416e37e1-8422-4a73-9933-515571a71a50', 39, 106, 40, '250', '2022-01-01 21:27:19', 0, 0, 1, 1, NULL, NULL),
(292, '416e37e1-8422-4a73-9933-515571a71a50', 39, 106, 40, '250', '2022-01-01 21:27:19', 0, 0, 1, 1, NULL, NULL),
(293, '416e37e1-8422-4a73-9933-515571a71a50', 39, 106, 40, '250', '2022-01-01 21:27:19', 0, 0, 1, 1, NULL, NULL),
(294, '416e37e1-8422-4a73-9933-515571a71a50', 39, 106, 40, '250', '2022-01-01 21:27:19', 0, 0, 1, 1, NULL, NULL),
(295, '416e37e1-8422-4a73-9933-515571a71a50', 39, 106, 40, '250', '2022-01-01 21:27:19', 0, 0, 1, 1, NULL, NULL),
(296, '416e37e1-8422-4a73-9933-515571a71a50', 39, 106, 42, '70 / 100', '2022-01-02 06:26:28', 0, 0, 1, 1, NULL, NULL),
(297, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 108, 38, '70', '2022-01-02 15:42:52', 0, 0, 1, 1, NULL, NULL),
(298, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 108, 42, '70 ', '2022-01-03 05:56:53', 1, 0, 1, 1, NULL, NULL),
(299, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 108, 42, '70 ', '2022-01-03 05:56:53', 0, 0, 1, 1, NULL, NULL),
(300, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 109, 41, '150', '2022-01-03 05:59:31', 0, 0, 1, 1, NULL, NULL),
(301, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 109, 44, '90', '2022-01-03 07:21:37', 0, 0, 1, 1, NULL, NULL),
(302, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 109, 44, '90', '2022-01-03 07:21:37', 1, 0, 1, 1, NULL, NULL),
(303, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 110, 40, '250', '2022-01-03 07:28:52', 0, 0, 1, 1, NULL, NULL),
(304, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 110, 41, '150', '2022-01-03 07:28:52', 0, 0, 1, 1, NULL, NULL),
(305, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 110, 41, '150', '2022-01-03 07:28:52', 0, 0, 1, 1, NULL, NULL),
(306, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 102, 38, '70', '2022-01-04 03:45:31', 0, 0, 1, 1, NULL, NULL),
(307, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 111, 39, '50', '2022-01-04 03:49:49', 0, 0, 1, 1, NULL, NULL),
(308, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 111, 39, '50', '2022-01-04 03:49:51', 0, 0, 1, 1, NULL, NULL),
(309, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 111, 41, '150', '2022-01-04 03:49:54', 0, 0, 1, 1, NULL, NULL),
(310, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 111, 38, '70', '2022-01-04 03:50:07', 0, 0, 1, 1, NULL, NULL),
(311, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 112, 43, '70', '2022-01-04 06:24:04', 0, 0, 1, 1, NULL, NULL),
(312, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 112, 42, '70 ', '2022-01-04 06:24:04', 0, 0, 1, 1, NULL, NULL),
(313, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 112, 38, '70', '2022-01-04 06:24:04', 0, 0, 1, 1, NULL, NULL),
(314, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 112, 38, '70', '2022-01-04 06:24:04', 0, 0, 1, 1, NULL, NULL),
(315, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 112, 43, '70', '2022-01-04 08:45:44', 0, 0, 1, 1, NULL, NULL),
(316, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 112, 42, '70 ', '2022-01-04 08:45:44', 0, 0, 1, 1, NULL, NULL),
(317, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 112, 42, '70 ', '2022-01-04 08:45:44', 0, 0, 1, 1, NULL, NULL),
(318, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 113, 41, '150', '2022-01-04 12:29:18', 0, 0, 1, 1, NULL, NULL),
(319, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 113, 39, '50', '2022-01-04 12:29:18', 0, 0, 1, 1, NULL, NULL),
(320, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 113, 49, '150', '2022-01-04 12:29:18', 1, 0, 1, 1, NULL, NULL),
(321, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 113, 41, '150', '2022-01-04 12:29:18', 0, 0, 1, 1, NULL, NULL),
(322, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 113, 49, '150', '2022-01-04 12:29:18', 0, 0, 1, 1, NULL, NULL),
(323, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 114, 43, '70', '2022-01-04 13:41:25', 0, 0, 1, 1, NULL, NULL),
(324, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 114, 42, '70 ', '2022-01-04 13:41:25', 0, 0, 1, 1, NULL, NULL),
(325, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 114, 38, '70', '2022-01-04 13:41:25', 0, 0, 1, 1, NULL, NULL),
(326, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 115, 43, '70', '2022-01-04 14:29:08', 1, 0, 1, 1, NULL, NULL),
(327, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 115, 42, '70 ', '2022-01-04 14:29:08', 0, 0, 1, 1, NULL, NULL),
(328, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 115, 38, '70', '2022-01-04 14:29:08', 0, 0, 1, 1, NULL, NULL),
(329, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 115, 41, '150', '2022-01-05 03:13:20', 0, 0, 1, 1, NULL, NULL),
(330, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 115, 39, '50', '2022-01-05 03:13:39', 0, 0, 1, 1, NULL, NULL),
(331, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 115, 39, '50', '2022-01-05 03:13:39', 0, 0, 1, 1, NULL, NULL),
(332, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 115, 39, '50', '2022-01-05 03:13:39', 0, 0, 1, 1, NULL, NULL),
(333, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 115, 39, '50', '2022-01-05 03:13:39', 0, 0, 1, 1, NULL, NULL),
(334, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 116, 44, '90', '2022-01-05 11:41:21', 0, 0, 1, 1, NULL, NULL),
(335, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 116, 44, '90', '2022-01-05 11:41:23', 0, 0, 1, 1, NULL, NULL),
(336, 'faa03210-9600-485b-b1bf-2b726165cb70', 33, 117, 41, '150', '2022-01-06 03:27:35', 0, 0, 1, 1, NULL, NULL),
(337, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 123, 43, '70', '2022-01-06 07:02:20', 0, 0, 1, 0, NULL, NULL),
(338, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 123, 42, '70 ', '2022-01-06 07:02:20', 0, 0, 1, 0, NULL, NULL),
(339, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 123, 38, '70', '2022-01-06 07:02:20', 0, 0, 1, 0, NULL, NULL),
(340, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 123, 43, '70', '2022-01-06 07:02:20', 0, 0, 1, 0, NULL, NULL),
(341, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 123, 42, '70 ', '2022-01-06 07:02:20', 0, 0, 1, 0, NULL, NULL),
(342, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 125, 42, '70 ', '2022-01-06 07:04:25', 1, 0, 1, 1, NULL, NULL),
(343, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 125, 38, '70', '2022-01-06 07:04:25', 0, 0, 1, 1, NULL, NULL),
(344, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 127, 42, '70 ', '2022-01-06 07:47:26', 0, 0, 1, 1, NULL, NULL),
(345, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 127, 38, '70', '2022-01-06 07:47:26', 0, 0, 1, 1, NULL, NULL),
(346, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 127, 39, '50', '2022-01-06 07:48:29', 0, 0, 1, 1, NULL, NULL),
(347, 'faa03210-9600-485b-b1bf-2b726165cb70', 33, 122, 44, '90', '2022-01-06 10:09:55', 0, 0, 1, 1, NULL, NULL),
(348, 'faa03210-9600-485b-b1bf-2b726165cb70', 33, 122, 42, '70 ', '2022-01-06 10:09:55', 0, 0, 1, 1, NULL, NULL),
(349, 'faa03210-9600-485b-b1bf-2b726165cb70', 33, 122, 38, '70', '2022-01-06 10:09:55', 0, 0, 1, 1, NULL, NULL),
(350, 'faa03210-9600-485b-b1bf-2b726165cb70', 33, 122, 42, '70 ', '2022-01-06 10:09:55', 0, 0, 1, 1, NULL, NULL),
(351, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 131, 45, '95', '2022-01-06 10:27:43', 0, 0, 1, 1, NULL, NULL),
(352, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 131, 41, '150', '2022-01-06 10:27:43', 1, 0, 1, 1, NULL, NULL),
(353, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 131, 49, '150', '2022-01-06 10:27:43', 0, 0, 1, 1, NULL, NULL),
(354, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 131, 44, '90', '2022-01-06 10:27:43', 0, 0, 1, 1, NULL, NULL),
(355, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 131, 49, '150', '2022-01-06 10:27:43', 0, 0, 1, 1, NULL, NULL),
(356, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 131, 41, '150', '2022-01-06 10:27:43', 0, 0, 1, 1, NULL, NULL),
(357, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 131, 40, '250', '2022-01-06 10:31:32', 0, 0, 1, 1, NULL, NULL),
(358, '6383c720-ffad-45dd-9bae-efd50b403540', 34, 133, 38, '70', '2022-01-06 10:41:42', 0, 0, 1, 1, NULL, NULL),
(359, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 132, 41, '150', '2022-01-06 12:42:39', 0, 0, 1, 1, NULL, NULL),
(360, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 132, 42, '70 ', '2022-01-06 12:42:40', 0, 0, 1, 1, NULL, NULL),
(361, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 134, 43, '70', '2022-01-06 12:45:55', 0, 0, 1, 1, NULL, NULL),
(362, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 134, 42, '70 ', '2022-01-06 12:45:55', 0, 0, 1, 1, NULL, NULL),
(363, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 134, 38, '70', '2022-01-06 12:45:55', 0, 0, 1, 1, NULL, NULL),
(364, 'cbc5d088-27b8-48f2-ba24-402f1c47824d', 44, 136, 42, '70 ', '2022-01-07 06:51:06', 0, 0, 1, 0, NULL, NULL),
(365, 'cbc5d088-27b8-48f2-ba24-402f1c47824d', 44, 136, 38, '70', '2022-01-07 06:59:04', 0, 0, 1, 0, NULL, NULL),
(366, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 103, 38, '70', '2022-01-07 08:23:32', 1, 0, 1, 1, NULL, NULL),
(367, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 103, 39, '50', '2022-01-07 08:23:34', 0, 0, 1, 1, NULL, NULL),
(368, '5eea1b60-cbd1-4a7f-b8c7-8effb33d7759', 41, 137, 42, '70 ', '2022-01-07 08:29:18', 0, 0, 1, 1, NULL, NULL),
(369, '5eea1b60-cbd1-4a7f-b8c7-8effb33d7759', 41, 137, 43, '70', '2022-01-07 08:29:18', 0, 0, 1, 1, NULL, NULL),
(370, '5eea1b60-cbd1-4a7f-b8c7-8effb33d7759', 41, 137, 40, '250', '2022-01-07 08:29:18', 0, 0, 1, 1, NULL, NULL),
(371, '5eea1b60-cbd1-4a7f-b8c7-8effb33d7759', 41, 137, 50, '70', '2022-01-07 08:29:18', 0, 0, 1, 1, NULL, NULL),
(372, '5eea1b60-cbd1-4a7f-b8c7-8effb33d7759', 41, 137, 42, '70 ', '2022-01-07 08:29:18', 0, 0, 1, 1, NULL, NULL),
(373, '5eea1b60-cbd1-4a7f-b8c7-8effb33d7759', 41, 137, 43, '70', '2022-01-07 08:29:18', 0, 0, 1, 1, NULL, NULL),
(374, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 135, 38, '70', '2022-01-07 08:51:56', 0, 0, 1, 1, NULL, NULL),
(375, 'aff34bd5-89fb-40af-918b-7f251cb793e4', 40, 138, 43, '70', '2022-01-07 09:46:17', 0, 0, 1, 1, NULL, NULL),
(376, 'aff34bd5-89fb-40af-918b-7f251cb793e4', 40, 138, 43, '70', '2022-01-07 09:46:17', 0, 0, 1, 1, NULL, NULL),
(377, 'aff34bd5-89fb-40af-918b-7f251cb793e4', 40, 138, 43, '70', '2022-01-07 09:46:17', 0, 0, 1, 1, NULL, NULL),
(378, 'aff34bd5-89fb-40af-918b-7f251cb793e4', 40, 138, 43, '70', '2022-01-07 09:46:17', 0, 0, 1, 1, NULL, NULL),
(379, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 139, 43, '70', '2022-01-07 09:50:51', 0, 0, 1, 1, NULL, NULL),
(380, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 139, 42, '70 ', '2022-01-07 09:50:51', 0, 0, 1, 1, NULL, NULL),
(381, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 139, 43, '70', '2022-01-07 09:50:51', 0, 0, 1, 1, NULL, NULL),
(382, 'fc3d1936-683f-4cf9-bea5-85dd198dd496', 37, 141, 44, '90', '2022-01-07 10:28:32', 0, 0, 1, 1, NULL, NULL),
(383, 'fc3d1936-683f-4cf9-bea5-85dd198dd496', 37, 141, 43, '70', '2022-01-07 10:28:32', 0, 0, 1, 1, NULL, NULL),
(384, 'fc3d1936-683f-4cf9-bea5-85dd198dd496', 37, 141, 44, '90', '2022-01-07 10:28:32', 0, 0, 1, 1, NULL, NULL),
(385, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 140, 40, '250', '2022-01-07 14:47:23', 0, 0, 1, 1, NULL, NULL),
(386, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 140, 49, '150', '2022-01-07 14:47:23', 0, 0, 1, 1, NULL, NULL),
(387, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 140, 38, '70', '2022-01-07 14:48:35', 0, 0, 1, 1, NULL, NULL),
(388, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 140, 38, '70', '2022-01-07 14:48:35', 0, 0, 1, 1, NULL, NULL),
(389, '416e37e1-8422-4a73-9933-515571a71a50', 39, 144, 38, '70', '2022-01-07 14:50:22', 0, 0, 1, 1, NULL, NULL),
(390, '416e37e1-8422-4a73-9933-515571a71a50', 39, 144, 39, '50', '2022-01-07 14:50:57', 0, 0, 1, 1, NULL, NULL),
(391, '416e37e1-8422-4a73-9933-515571a71a50', 39, 144, 39, '50', '2022-01-07 14:50:57', 0, 0, 1, 1, NULL, NULL),
(392, '416e37e1-8422-4a73-9933-515571a71a50', 39, 144, 39, '50', '2022-01-07 14:50:57', 0, 0, 1, 1, NULL, NULL),
(393, '416e37e1-8422-4a73-9933-515571a71a50', 39, 144, 39, '50', '2022-01-07 14:50:57', 0, 0, 1, 1, NULL, NULL),
(394, '416e37e1-8422-4a73-9933-515571a71a50', 39, 144, 39, '50', '2022-01-07 14:50:57', 0, 0, 1, 1, NULL, NULL),
(395, '416e37e1-8422-4a73-9933-515571a71a50', 39, 144, 39, '50', '2022-01-07 14:51:29', 0, 0, 1, 1, NULL, NULL),
(396, '416e37e1-8422-4a73-9933-515571a71a50', 39, 144, 39, '50', '2022-01-07 14:51:29', 0, 0, 1, 1, NULL, NULL),
(397, '416e37e1-8422-4a73-9933-515571a71a50', 39, 144, 39, '50', '2022-01-07 14:51:29', 0, 0, 1, 1, NULL, NULL),
(398, '416e37e1-8422-4a73-9933-515571a71a50', 39, 144, 39, '50', '2022-01-07 14:51:29', 0, 0, 1, 1, NULL, NULL),
(399, '416e37e1-8422-4a73-9933-515571a71a50', 39, 144, 39, '50', '2022-01-07 14:51:29', 0, 0, 1, 1, NULL, NULL),
(400, '416e37e1-8422-4a73-9933-515571a71a50', 39, 144, 39, '50', '2022-01-07 14:51:29', 0, 0, 1, 1, NULL, NULL),
(401, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 145, 40, '250', '2022-01-07 16:00:21', 0, 0, 1, 1, NULL, NULL),
(402, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 145, 39, '50', '2022-01-07 16:00:21', 0, 0, 1, 1, NULL, NULL),
(403, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 145, 40, '250', '2022-01-07 16:00:22', 0, 0, 1, 1, NULL, NULL),
(404, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 145, 39, '50', '2022-01-07 16:00:23', 0, 0, 1, 1, NULL, NULL),
(405, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 145, 41, '150', '2022-01-07 16:00:32', 0, 0, 1, 1, NULL, NULL),
(406, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 145, 41, '150', '2022-01-07 16:00:40', 0, 0, 1, 1, NULL, NULL),
(407, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 145, 38, '70', '2022-01-07 16:11:28', 0, 0, 1, 1, NULL, NULL),
(408, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 145, 38, '70', '2022-01-07 16:11:35', 0, 0, 1, 1, NULL, NULL),
(409, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 145, 38, '70', '2022-01-07 16:11:37', 0, 0, 1, 1, NULL, NULL),
(410, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 145, 39, '50', '2022-01-07 16:11:39', 0, 0, 1, 1, NULL, NULL),
(411, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 145, 39, '50', '2022-01-07 16:11:43', 0, 0, 1, 1, NULL, NULL),
(412, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 145, 39, '50', '2022-01-07 16:11:52', 0, 0, 1, 1, NULL, NULL),
(413, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 146, 38, '70', '2022-01-07 18:20:26', 0, 0, 1, 1, NULL, NULL),
(414, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 146, 38, '70', '2022-01-08 05:20:40', 0, 0, 1, 1, NULL, NULL),
(415, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 146, 40, '250', '2022-01-08 05:20:45', 0, 0, 1, 1, NULL, NULL),
(416, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 146, 41, '150', '2022-01-08 05:20:48', 0, 0, 1, 1, NULL, NULL),
(417, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 146, 41, '150', '2022-01-08 05:20:50', 0, 0, 1, 1, NULL, NULL),
(418, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 146, 39, '50', '2022-01-08 05:20:54', 0, 0, 1, 1, NULL, NULL),
(419, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 146, 39, '50', '2022-01-08 05:20:54', 0, 0, 1, 1, NULL, NULL),
(420, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 146, 38, '70', '2022-01-08 05:20:55', 0, 0, 1, 1, NULL, NULL),
(421, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 146, 38, '70', '2022-01-08 05:20:56', 0, 0, 1, 1, NULL, NULL),
(422, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 146, 39, '50', '2022-01-08 05:20:57', 0, 0, 1, 1, NULL, NULL),
(423, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 146, 39, '50', '2022-01-08 05:20:59', 0, 0, 1, 1, NULL, NULL),
(424, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 146, 39, '50', '2022-01-08 05:21:02', 0, 0, 1, 1, NULL, NULL),
(425, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 146, 38, '70', '2022-01-08 05:21:07', 0, 0, 1, 1, NULL, NULL),
(426, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 146, 38, '70', '2022-01-08 05:21:08', 0, 0, 1, 1, NULL, NULL),
(427, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 146, 38, '70', '2022-01-08 05:21:11', 0, 0, 1, 1, NULL, NULL),
(428, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 146, 39, '50', '2022-01-08 05:21:13', 0, 0, 1, 1, NULL, NULL),
(429, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 147, 38, '70', '2022-01-08 05:31:01', 0, 0, 1, 1, NULL, NULL),
(430, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 147, 38, '70', '2022-01-08 05:31:01', 0, 0, 1, 1, NULL, NULL),
(431, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 147, 38, '70', '2022-01-08 05:31:01', 0, 0, 1, 1, NULL, NULL),
(432, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 147, 38, '70', '2022-01-08 05:31:01', 0, 0, 1, 1, NULL, NULL),
(433, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 147, 38, '70', '2022-01-08 05:31:13', 0, 0, 1, 1, NULL, NULL),
(434, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 147, 38, '70', '2022-01-08 05:31:13', 0, 0, 1, 1, NULL, NULL),
(435, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 147, 38, '70', '2022-01-08 05:31:13', 0, 0, 1, 1, NULL, NULL),
(436, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 147, 38, '70', '2022-01-08 05:31:13', 0, 0, 1, 1, NULL, NULL),
(437, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 147, 40, '250', '2022-01-08 05:31:20', 0, 0, 1, 1, NULL, NULL),
(438, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 147, 41, '150', '2022-01-08 05:31:22', 0, 0, 1, 1, NULL, NULL),
(439, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 147, 40, '250', '2022-01-08 05:31:26', 0, 0, 1, 1, NULL, NULL),
(440, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 148, 40, '250', '2022-01-08 05:33:06', 0, 0, 1, 1, NULL, NULL),
(441, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 148, 40, '250', '2022-01-08 05:33:09', 0, 0, 1, 1, NULL, NULL),
(442, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 148, 42, '70 ', '2022-01-08 05:33:13', 0, 0, 1, 1, NULL, NULL),
(443, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 148, 41, '150', '2022-01-08 05:33:23', 0, 0, 1, 1, NULL, NULL),
(444, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 148, 43, '70', '2022-01-08 05:33:24', 0, 0, 1, 1, NULL, NULL),
(445, 'fc3d1936-683f-4cf9-bea5-85dd198dd496', 37, 149, 38, '70', '2022-01-08 05:37:03', 0, 0, 1, 1, NULL, NULL),
(446, 'fc3d1936-683f-4cf9-bea5-85dd198dd496', 37, 149, 41, '150', '2022-01-08 05:37:06', 0, 0, 1, 1, NULL, NULL),
(447, 'fc3d1936-683f-4cf9-bea5-85dd198dd496', 37, 149, 43, '70', '2022-01-08 05:37:07', 0, 0, 1, 1, NULL, NULL),
(448, 'cbc5d088-27b8-48f2-ba24-402f1c47824d', 44, 150, 49, '150', '2022-01-08 05:38:12', 0, 0, 1, 1, NULL, NULL),
(449, 'cbc5d088-27b8-48f2-ba24-402f1c47824d', 44, 150, 44, '90', '2022-01-08 05:38:13', 0, 0, 1, 1, NULL, NULL),
(450, 'cbc5d088-27b8-48f2-ba24-402f1c47824d', 44, 150, 42, '70 ', '2022-01-08 05:38:14', 0, 0, 1, 1, NULL, NULL),
(451, 'cbc5d088-27b8-48f2-ba24-402f1c47824d', 44, 150, 40, '250', '2022-01-08 05:38:15', 0, 0, 1, 1, NULL, NULL),
(452, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 151, 38, '70', '2022-01-08 05:39:39', 0, 0, 1, 1, NULL, NULL),
(453, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 151, 39, '50', '2022-01-08 05:39:39', 0, 0, 1, 1, NULL, NULL),
(454, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 151, 40, '250', '2022-01-08 05:39:40', 0, 0, 1, 1, NULL, NULL),
(455, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 151, 41, '150', '2022-01-08 05:39:41', 0, 0, 1, 1, NULL, NULL),
(456, 'faa03210-9600-485b-b1bf-2b726165cb70', 33, 129, 39, '50', '2022-01-08 05:41:15', 0, 0, 1, 1, NULL, NULL),
(457, 'faa03210-9600-485b-b1bf-2b726165cb70', 33, 129, 40, '250', '2022-01-08 05:41:15', 0, 0, 1, 1, NULL, NULL),
(458, 'faa03210-9600-485b-b1bf-2b726165cb70', 33, 129, 39, '50', '2022-01-08 05:42:50', 0, 0, 1, 1, NULL, NULL),
(459, 'faa03210-9600-485b-b1bf-2b726165cb70', 33, 129, 40, '250', '2022-01-08 05:42:50', 0, 0, 1, 1, NULL, NULL),
(460, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 152, 38, '70', '2022-01-08 08:34:43', 0, 0, 1, 1, NULL, NULL),
(461, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 152, 39, '50', '2022-01-08 08:34:45', 0, 0, 1, 1, NULL, NULL),
(462, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 153, 38, '70', '2022-01-08 12:59:25', 0, 0, 1, 1, NULL, NULL),
(463, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 153, 39, '50', '2022-01-08 12:59:25', 0, 0, 1, 1, NULL, NULL),
(464, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 154, 38, '70', '2022-01-08 14:25:00', 0, 0, 1, 1, NULL, NULL),
(465, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 154, 38, '70', '2022-01-08 14:31:13', 0, 0, 1, 1, NULL, NULL),
(466, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 154, 39, '50', '2022-01-08 14:31:13', 0, 0, 1, 1, NULL, NULL),
(467, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 154, 40, '250', '2022-01-08 14:31:15', 0, 0, 1, 1, NULL, NULL),
(468, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 154, 39, '50', '2022-01-08 14:31:16', 0, 0, 1, 1, NULL, NULL),
(469, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 154, 44, '90', '2022-01-08 14:31:19', 0, 0, 1, 1, NULL, NULL),
(470, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 154, 43, '70', '2022-01-08 14:31:20', 0, 0, 1, 1, NULL, NULL),
(471, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 154, 49, '150', '2022-01-08 14:31:22', 0, 0, 1, 1, NULL, NULL),
(472, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 154, 50, '70', '2022-01-08 14:31:26', 0, 0, 1, 1, NULL, NULL),
(473, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 156, 38, '70', '2022-01-09 16:05:33', 0, 0, 1, 1, NULL, NULL),
(474, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 157, 38, '70', '2022-01-10 04:24:43', 0, 0, 1, 1, 2, NULL),
(475, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 157, 39, '50', '2022-01-10 04:24:47', 0, 0, 1, 1, 2, NULL),
(476, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 157, 41, '150', '2022-01-10 04:24:49', 0, 0, 1, 1, 2, NULL),
(477, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 157, 41, '150', '2022-01-10 04:25:08', 0, 0, 1, 1, 3, NULL),
(478, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 157, 42, '70 ', '2022-01-10 04:25:09', 0, 0, 1, 1, 3, NULL),
(479, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 157, 40, '250', '2022-01-10 04:25:09', 0, 0, 1, 1, 3, NULL),
(480, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 157, 39, '50', '2022-01-10 04:25:10', 0, 0, 1, 1, 3, NULL),
(481, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 158, 41, '150', '2022-01-10 05:36:47', 0, 0, 1, 1, 4, NULL),
(482, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 158, 38, '70', '2022-01-10 05:36:47', 0, 0, 1, 1, 4, NULL),
(483, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 158, 40, '250', '2022-01-10 05:36:48', 0, 0, 1, 1, 4, NULL),
(484, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 158, 42, '70 ', '2022-01-10 05:36:48', 0, 0, 1, 1, 4, NULL),
(485, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 158, 38, '70', '2022-01-10 05:38:34', 0, 0, 1, 1, 5, NULL),
(486, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 158, 41, '150', '2022-01-10 05:38:34', 0, 0, 1, 1, 5, NULL),
(487, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 158, 39, '50', '2022-01-10 05:38:35', 0, 0, 1, 1, 5, NULL),
(488, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 158, 42, '70 ', '2022-01-10 05:38:35', 0, 0, 1, 1, 5, NULL),
(489, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 158, 42, '70 ', '2022-01-10 05:38:36', 0, 0, 1, 1, 5, NULL),
(490, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 158, 42, '70 ', '2022-01-10 05:38:37', 0, 0, 1, 1, 5, NULL),
(491, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 158, 39, '50', '2022-01-10 05:41:01', 0, 0, 1, 1, 6, NULL),
(492, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 158, 38, '70', '2022-01-10 05:41:01', 0, 0, 1, 1, 6, NULL),
(493, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 158, 40, '250', '2022-01-10 05:41:03', 0, 0, 1, 1, 6, NULL),
(494, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 158, 40, '250', '2022-01-10 05:41:03', 0, 0, 1, 1, 6, NULL),
(495, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 158, 40, '250', '2022-01-10 05:41:04', 0, 0, 1, 1, 6, NULL),
(496, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 158, 40, '250', '2022-01-10 05:41:05', 0, 0, 1, 1, 6, NULL),
(497, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 158, 40, '250', '2022-01-10 05:41:05', 0, 0, 1, 1, 6, NULL),
(498, '416e37e1-8422-4a73-9933-515571a71a50', 39, 159, 41, '150', '2022-01-10 05:42:46', 1, 0, 1, 1, 7, NULL),
(499, '416e37e1-8422-4a73-9933-515571a71a50', 39, 159, 39, '50', '2022-01-10 05:42:46', 0, 0, 1, 1, 7, NULL),
(500, '416e37e1-8422-4a73-9933-515571a71a50', 39, 159, 38, '70', '2022-01-10 05:42:46', 0, 0, 1, 1, 7, NULL),
(501, '36903e4d-3e0e-477f-be9a-462e38dd1975', 35, 160, 42, '70 ', '2022-01-10 05:43:12', 0, 0, 1, 1, 8, NULL),
(502, '36903e4d-3e0e-477f-be9a-462e38dd1975', 35, 160, 42, '70 ', '2022-01-10 05:43:12', 0, 0, 1, 1, 8, NULL),
(503, '36903e4d-3e0e-477f-be9a-462e38dd1975', 35, 160, 42, '70 ', '2022-01-10 05:43:13', 0, 0, 1, 1, 8, NULL),
(504, '36903e4d-3e0e-477f-be9a-462e38dd1975', 35, 160, 42, '70 ', '2022-01-10 05:43:13', 0, 0, 1, 1, 8, NULL),
(505, '36903e4d-3e0e-477f-be9a-462e38dd1975', 35, 160, 42, '70 ', '2022-01-10 05:43:13', 0, 0, 1, 1, 8, NULL),
(506, '36903e4d-3e0e-477f-be9a-462e38dd1975', 35, 160, 42, '70 ', '2022-01-10 05:43:14', 0, 0, 1, 1, 8, NULL),
(507, 'fc3d1936-683f-4cf9-bea5-85dd198dd496', 37, 161, 39, '50', '2022-01-10 05:43:46', 0, 0, 1, 0, NULL, NULL),
(508, 'fc3d1936-683f-4cf9-bea5-85dd198dd496', 37, 161, 41, '150', '2022-01-10 05:43:46', 0, 0, 1, 0, NULL, NULL),
(509, 'fc3d1936-683f-4cf9-bea5-85dd198dd496', 37, 161, 40, '250', '2022-01-10 05:43:46', 0, 0, 1, 0, NULL, NULL),
(510, 'fc3d1936-683f-4cf9-bea5-85dd198dd496', 37, 161, 38, '70', '2022-01-10 05:43:48', 0, 0, 1, 0, NULL, NULL),
(511, 'fc3d1936-683f-4cf9-bea5-85dd198dd496', 37, 161, 38, '70', '2022-01-10 05:43:48', 0, 0, 1, 0, NULL, NULL),
(512, 'cbc5d088-27b8-48f2-ba24-402f1c47824d', 44, 162, 50, '70', '2022-01-10 05:48:42', 1, 0, 1, 1, 10, NULL),
(513, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 163, 40, '250', '2022-01-10 05:49:13', 0, 0, 1, 1, 9, NULL),
(514, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 163, 39, '50', '2022-01-10 05:49:13', 1, 0, 1, 1, 9, NULL),
(515, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 32, 163, 41, '150', '2022-01-10 05:49:13', 0, 0, 1, 1, 9, NULL),
(516, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 164, 49, '150', '2022-01-10 08:26:58', 0, 0, 1, 1, 11, NULL),
(517, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 164, 42, '70 ', '2022-01-10 08:26:58', 0, 0, 1, 1, 11, NULL),
(518, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 164, 43, '70', '2022-01-10 08:26:58', 0, 0, 1, 1, 11, NULL),
(519, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 164, 42, '70 ', '2022-01-10 08:26:58', 1, 0, 1, 1, 11, NULL),
(520, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 164, 39, '50', '2022-01-10 08:27:25', 0, 0, 1, 1, 11, NULL),
(521, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 164, 40, '250', '2022-01-10 08:28:43', 0, 0, 1, 1, 12, NULL),
(522, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 164, 40, '250', '2022-01-10 08:28:45', 0, 0, 1, 1, 12, NULL),
(523, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 164, 40, '250', '2022-01-10 08:29:15', 0, 0, 1, 1, 13, NULL),
(524, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 164, 49, '150', '2022-01-10 08:29:15', 0, 0, 1, 1, 13, NULL),
(525, '70185e5f-e828-4c96-8838-31d77afe5114', 38, 165, 39, '50', '2022-01-11 07:57:50', 0, 0, 1, 1, 14, NULL),
(526, '70185e5f-e828-4c96-8838-31d77afe5114', 38, 165, 39, '50', '2022-01-11 07:57:55', 0, 0, 1, 1, 14, NULL),
(527, '70185e5f-e828-4c96-8838-31d77afe5114', 38, 165, 39, '50', '2022-01-11 07:57:55', 1, 0, 1, 1, 14, NULL),
(528, '70185e5f-e828-4c96-8838-31d77afe5114', 38, 165, 39, '50', '2022-01-11 07:57:55', 0, 0, 1, 1, 14, NULL),
(529, '70185e5f-e828-4c96-8838-31d77afe5114', 38, 165, 39, '50', '2022-01-11 07:57:56', 0, 0, 1, 1, 14, NULL),
(530, '70185e5f-e828-4c96-8838-31d77afe5114', 38, 165, 39, '50', '2022-01-11 07:57:56', 0, 0, 1, 1, 14, NULL),
(531, '70185e5f-e828-4c96-8838-31d77afe5114', 38, 165, 39, '50', '2022-01-11 07:57:56', 0, 0, 1, 1, 14, NULL),
(532, '70185e5f-e828-4c96-8838-31d77afe5114', 38, 165, 39, '50', '2022-01-11 07:57:56', 0, 0, 1, 1, 14, NULL),
(533, '70185e5f-e828-4c96-8838-31d77afe5114', 38, 165, 39, '50', '2022-01-11 07:57:56', 0, 0, 1, 1, 14, NULL),
(534, '70185e5f-e828-4c96-8838-31d77afe5114', 38, 165, 39, '50', '2022-01-11 07:57:56', 0, 0, 1, 1, 14, NULL),
(535, '70185e5f-e828-4c96-8838-31d77afe5114', 38, 165, 39, '50', '2022-01-11 07:58:11', 0, 0, 1, 1, 14, NULL),
(536, '70185e5f-e828-4c96-8838-31d77afe5114', 38, 165, 39, '50', '2022-01-11 07:58:49', 0, 0, 1, 1, 15, NULL),
(537, '70185e5f-e828-4c96-8838-31d77afe5114', 38, 165, 40, '250', '2022-01-11 07:58:50', 0, 0, 1, 1, 15, NULL),
(538, '70185e5f-e828-4c96-8838-31d77afe5114', 38, 165, 39, '50', '2022-01-11 07:58:51', 0, 0, 1, 1, 15, NULL),
(539, '6383c720-ffad-45dd-9bae-efd50b403540', 34, 166, 41, '150', '2022-01-11 08:02:14', 0, 0, 1, 1, 16, NULL),
(540, '6383c720-ffad-45dd-9bae-efd50b403540', 34, 166, 39, '50', '2022-01-11 08:02:14', 0, 0, 1, 1, 16, NULL),
(541, '6383c720-ffad-45dd-9bae-efd50b403540', 34, 166, 42, '70 ', '2022-01-11 08:02:14', 0, 0, 1, 1, 16, NULL),
(542, '6383c720-ffad-45dd-9bae-efd50b403540', 34, 166, 39, '50', '2022-01-11 08:02:14', 0, 0, 1, 1, 16, NULL),
(543, '6383c720-ffad-45dd-9bae-efd50b403540', 34, 166, 39, '50', '2022-01-11 08:04:03', 0, 0, 1, 1, 17, NULL),
(544, 'faa03210-9600-485b-b1bf-2b726165cb70', 33, 130, 45, '95', '2022-01-12 05:29:14', 0, 1, 1, 1, 18, NULL),
(545, 'faa03210-9600-485b-b1bf-2b726165cb70', 33, 130, 43, '70', '2022-01-12 05:29:14', 0, 1, 1, 1, 18, NULL),
(546, 'faa03210-9600-485b-b1bf-2b726165cb70', 33, 130, 38, '70', '2022-01-12 05:29:14', 1, 1, 1, 1, 18, NULL),
(547, 'faa03210-9600-485b-b1bf-2b726165cb70', 33, 130, 43, '70', '2022-01-12 05:29:14', 0, 1, 1, 1, 18, NULL),
(548, 'faa03210-9600-485b-b1bf-2b726165cb70', 33, 130, 38, '70', '2022-01-22 22:41:59', 0, 1, 1, 1, 19, NULL),
(549, 'faa03210-9600-485b-b1bf-2b726165cb70', 33, 130, 39, '50', '2022-01-22 23:13:49', 0, 1, 1, 1, 19, NULL),
(550, 'faa03210-9600-485b-b1bf-2b726165cb70', 33, 130, 38, '70', '2022-01-23 19:27:12', 0, 1, 1, 1, 19, NULL),
(551, 'faa03210-9600-485b-b1bf-2b726165cb70', 33, 130, 38, '70', '2022-01-23 20:43:35', 0, 1, 1, 1, 20, NULL),
(552, 'faa03210-9600-485b-b1bf-2b726165cb70', 33, 130, 39, '50', '2022-01-23 20:59:44', 0, 1, 1, 1, 21, NULL),
(553, 'faa03210-9600-485b-b1bf-2b726165cb70', 33, 130, 41, '150', '2022-01-23 21:00:45', 0, 1, 1, 1, 22, NULL),
(554, 'faa03210-9600-485b-b1bf-2b726165cb70', 33, 130, 38, '70', '2022-01-25 21:16:32', 1, 1, 1, 1, 23, NULL),
(555, 'faa03210-9600-485b-b1bf-2b726165cb70', 33, 130, 49, '150', '2022-01-26 13:04:26', 1, 1, 1, 0, NULL, NULL),
(556, 'faa03210-9600-485b-b1bf-2b726165cb70', 33, 130, 49, '150', '2022-01-26 13:18:05', 1, 1, 1, 0, NULL, NULL),
(557, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 31, 168, 38, '70', '2022-01-26 13:35:07', 0, 1, 1, 1, 24, NULL),
(558, 'cbc5d088-27b8-48f2-ba24-402f1c47824d', 44, 170, 38, '70', '2024-05-08 18:05:16', 0, 1, 1, 0, NULL, NULL),
(559, 'cbc5d088-27b8-48f2-ba24-402f1c47824d', 44, 170, 38, '70', '2024-05-08 18:06:26', 0, 1, 1, 0, NULL, NULL),
(560, 'cbc5d088-27b8-48f2-ba24-402f1c47824d', 44, 170, 38, '70', '2024-05-08 18:07:36', 0, 1, 1, 0, NULL, NULL),
(561, 'cbc5d088-27b8-48f2-ba24-402f1c47824d', 44, 170, 38, '70', '2024-05-08 18:09:37', 0, 1, 1, 0, NULL, NULL),
(562, 'cbc5d088-27b8-48f2-ba24-402f1c47824d', 44, 170, 38, '70', '2024-05-08 18:09:53', 0, 1, 1, 0, NULL, NULL),
(563, 'cbc5d088-27b8-48f2-ba24-402f1c47824d', 44, 170, 41, '150', '2024-05-08 18:10:48', 0, 1, 1, 0, NULL, NULL),
(564, 'cbc5d088-27b8-48f2-ba24-402f1c47824d', 44, 170, 41, '150', '2024-05-08 18:10:48', 0, 1, 1, 0, NULL, NULL),
(565, 'cbc5d088-27b8-48f2-ba24-402f1c47824d', 44, 170, 41, '150', '2024-05-08 18:10:48', 0, 1, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `idRestaurant` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `restaurantNumber` varchar(70) NOT NULL,
  `gst` varchar(50) DEFAULT NULL,
  `description` varchar(2000) NOT NULL,
  `state` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `contactPersonName` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(60) DEFAULT NULL,
  `idDealer` int(11) DEFAULT NULL,
  `businessType` varchar(15) NOT NULL DEFAULT '76',
  `latitude` decimal(12,9) DEFAULT NULL,
  `longitude` decimal(12,9) DEFAULT NULL,
  `radius` int(11) DEFAULT NULL,
  `restaurantLogo` varchar(1000) DEFAULT NULL,
  `isActive` int(1) DEFAULT 0,
  `createdOn` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `updateBy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`idRestaurant`, `name`, `address`, `restaurantNumber`, `gst`, `description`, `state`, `city`, `contactPersonName`, `mobile`, `email`, `password`, `idDealer`, `businessType`, `latitude`, `longitude`, `radius`, `restaurantLogo`, `isActive`, `createdOn`, `createdBy`, `updatedOn`, `updateBy`) VALUES
(1, 'Palace', 'Belagavi, Karnataka 590006', '08312483711', '', 'It is one of the most iconic and well-recognizable fast food restaurants out there which offers really amazing food and drinks.', '', '', 'Vinayak', '9880403018', 'Vinayakanrevankar@gmail.com', '12345', 13, '76', 15.839319000, 74.523296000, 0, 'uploads\\idRestaurant-107f01c3f-b453-443c-818d-3159b7f5c400.png', 1, '2021-11-06 00:00:00', NULL, '0000-00-00 00:00:00', NULL),
(5, 'Bsnsb', 'Bsbsb', '809545', '', 'Vahsb', '11', 'Vsbsb', 'Babsb', '80494', 'bsbsb@gmail.com', NULL, NULL, '76', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_payment`
--

CREATE TABLE `restaurant_payment` (
  `idRestaurantPayment` int(11) NOT NULL,
  `idRestaurant` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `contractFrom` datetime NOT NULL,
  `contractTo` datetime NOT NULL,
  `createdOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurant_payment`
--

INSERT INTO `restaurant_payment` (`idRestaurantPayment`, `idRestaurant`, `amount`, `contractFrom`, `contractTo`, `createdOn`) VALUES
(1, 1, 2000, '2021-11-01 00:00:00', '2031-12-31 00:00:00', '2021-11-06 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_table`
--

CREATE TABLE `restaurant_table` (
  `idTable` int(11) NOT NULL,
  `idRestaurant` int(11) NOT NULL,
  `idReference` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `createdOn` datetime NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `occupied` int(1) NOT NULL DEFAULT 0,
  `version` int(11) DEFAULT NULL,
  `isActive` int(11) NOT NULL DEFAULT 1,
  `isDeleted` int(1) NOT NULL DEFAULT 0,
  `token` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurant_table`
--

INSERT INTO `restaurant_table` (`idTable`, `idRestaurant`, `idReference`, `name`, `createdOn`, `createdBy`, `updatedOn`, `updatedBy`, `occupied`, `version`, `isActive`, `isDeleted`, `token`) VALUES
(31, 1, 'd27d9f9c-ad65-402b-8e5d-c6da3be17d00', 'Parcel 1', '2021-12-20 15:44:58', NULL, NULL, NULL, 1, NULL, 1, 0, NULL),
(32, 1, 'fb56424d-e09b-4715-b7fb-3baee202b5b5', 'Parcel 2', '2021-12-20 16:04:11', NULL, NULL, NULL, 1, NULL, 1, 0, NULL),
(33, 1, 'faa03210-9600-485b-b1bf-2b726165cb70', 'Parcel 3', '2021-12-20 16:04:17', NULL, NULL, NULL, 1, NULL, 1, 0, NULL),
(34, 1, '6383c720-ffad-45dd-9bae-efd50b403540', 'Parcel 4', '2021-12-20 16:04:24', NULL, NULL, NULL, 0, NULL, 1, 0, NULL),
(35, 1, '36903e4d-3e0e-477f-be9a-462e38dd1975', 'Parcel 5', '2021-12-20 16:04:31', NULL, NULL, NULL, 0, NULL, 1, 0, NULL),
(36, 1, '8239e0ca-0069-4240-abd6-e39c94c0265b', 'Parcel 6', '2021-12-20 16:04:42', NULL, NULL, NULL, 0, NULL, 1, 0, NULL),
(37, 1, 'fc3d1936-683f-4cf9-bea5-85dd198dd496', 'Table 1', '2021-12-20 16:05:09', NULL, NULL, NULL, 0, NULL, 1, 0, NULL),
(38, 1, '70185e5f-e828-4c96-8838-31d77afe5114', 'Table 2', '2021-12-20 16:05:15', NULL, NULL, NULL, 0, NULL, 1, 0, NULL),
(39, 1, '416e37e1-8422-4a73-9933-515571a71a50', 'Table 3', '2021-12-20 16:05:20', NULL, NULL, NULL, 0, NULL, 1, 0, NULL),
(40, 1, 'aff34bd5-89fb-40af-918b-7f251cb793e4', 'TABLE 4', '2021-12-21 13:32:44', NULL, NULL, NULL, 0, NULL, 1, 0, NULL),
(41, 1, '5eea1b60-cbd1-4a7f-b8c7-8effb33d7759', 'TABLE 5', '2021-12-21 13:32:51', NULL, NULL, NULL, 1, NULL, 1, 0, NULL),
(42, 1, 'cdaea8e9-8581-4de1-a8c3-aac438001194', 'Table 56', '2021-12-23 05:24:12', NULL, NULL, NULL, 0, NULL, 1, 0, NULL),
(43, 1, '76a7c4f8-df60-42d5-b40f-eae89d1d661b', 'Table 7', '2021-12-25 05:32:54', NULL, NULL, NULL, 0, NULL, 1, 0, NULL),
(44, 1, 'cbc5d088-27b8-48f2-ba24-402f1c47824d', 'TABLE POOL SIDE', '2021-12-25 06:55:10', NULL, NULL, NULL, 1, NULL, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_attribute`
--

CREATE TABLE `system_attribute` (
  `idSystemAttribute` int(11) NOT NULL,
  `value` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `idModule` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_attribute`
--

INSERT INTO `system_attribute` (`idSystemAttribute`, `value`, `type`, `description`, `idModule`) VALUES
(38, 'Andhra Pradesh', 'State', NULL, 1),
(39, 'Arunachal Pradesh', 'State', NULL, 1),
(40, 'Assam', 'State', NULL, 1),
(41, 'Bihar', 'State', NULL, 1),
(42, 'Chandigarh (UT)', 'State', NULL, 1),
(43, 'Chhattisgarh', 'State', NULL, 1),
(44, 'Dadra and Nagar Haveli (UT)', 'State', NULL, 1),
(45, 'Daman and Diu (UT)', 'State', NULL, 1),
(46, 'Delhi (NCT)', 'State', NULL, 1),
(47, 'Goa', 'State', NULL, 1),
(48, 'Gujarat', 'State', NULL, 1),
(49, 'Haryana', 'State', NULL, 1),
(50, 'Himachal Pradesh', 'State', NULL, 1),
(51, 'Jammu and Kashmir', 'State', NULL, 1),
(52, 'Jharkhand', 'State', NULL, 1),
(53, 'Karnataka', 'State', NULL, 1),
(54, 'Kerala', 'State', NULL, 1),
(55, 'Lakshadweep (UT)', 'State', NULL, 1),
(56, 'Madhya Pradesh', 'State', NULL, 1),
(57, 'Maharashtra', 'State', NULL, 1),
(58, 'Manipur', 'State', NULL, 1),
(59, 'Meghalaya', 'State', NULL, 1),
(60, 'Mizoram', 'State', NULL, 1),
(61, 'Nagaland', 'State', NULL, 1),
(62, 'Odisha', 'State', NULL, 1),
(63, 'Puducherry (UT)', 'State', NULL, 1),
(64, 'Punjab', 'State', NULL, 1),
(65, 'Rajasthan', 'State', NULL, 1),
(66, 'Sikkim', 'State', NULL, 1),
(67, 'Tamil Nadu', 'State', NULL, 1),
(68, 'Telangana', 'State', NULL, 1),
(69, 'Tripura', 'State', NULL, 1),
(70, 'Uttarakhand', 'State', NULL, 1),
(71, 'Uttar Pradesh', 'State', NULL, 1),
(72, 'West Bengal', 'State', NULL, 1),
(73, 'Super Admin', 'SuperAdmin', NULL, 2),
(74, 'Admin', 'Admin', NULL, 2),
(75, 'Restaurant', 'businessType', NULL, 1),
(76, 'Hotel', 'businessType', NULL, 1),
(77, 'Grocery', 'businessType', NULL, 1),
(78, 'Parlour', 'businessType', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sys_user`
--

CREATE TABLE `sys_user` (
  `idUser` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `isActive` int(1) DEFAULT 1,
  `idSystemAttribute` int(11) NOT NULL,
  `idRestaurant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sys_user`
--

INSERT INTO `sys_user` (`idUser`, `name`, `mobile`, `email`, `password`, `isActive`, `idSystemAttribute`, `idRestaurant`) VALUES
(1, 'SuperAdmin', '9880403018', 'superAdmin@gmail.com', '12345', 1, 73, 0),
(2, 'Admin', '9880403018', 'admin@gmail.com', '12345', 1, 74, 1);

-- --------------------------------------------------------

--
-- Table structure for table `usercoupon`
--

CREATE TABLE `usercoupon` (
  `idUserCoupon` varchar(100) NOT NULL,
  `idCoupon` int(11) NOT NULL,
  `idCustomer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`idCart`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`idCartItems`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`idCategory`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`idCoupon`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`idCustomer`);

--
-- Indexes for table `dealer`
--
ALTER TABLE `dealer`
  ADD PRIMARY KEY (`idDealer`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`idItem`);

--
-- Indexes for table `kot`
--
ALTER TABLE `kot`
  ADD KEY `idKot` (`idKot`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`idModule`);

--
-- Indexes for table `ordered_item`
--
ALTER TABLE `ordered_item`
  ADD PRIMARY KEY (`idOrder`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`idRestaurant`);

--
-- Indexes for table `restaurant_payment`
--
ALTER TABLE `restaurant_payment`
  ADD PRIMARY KEY (`idRestaurantPayment`);

--
-- Indexes for table `restaurant_table`
--
ALTER TABLE `restaurant_table`
  ADD PRIMARY KEY (`idTable`);

--
-- Indexes for table `system_attribute`
--
ALTER TABLE `system_attribute`
  ADD PRIMARY KEY (`idSystemAttribute`);

--
-- Indexes for table `sys_user`
--
ALTER TABLE `sys_user`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `idCart` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `idCartItems` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `idCategory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `idCoupon` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `idCustomer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT for table `dealer`
--
ALTER TABLE `dealer`
  MODIFY `idDealer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `idItem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `kot`
--
ALTER TABLE `kot`
  MODIFY `idKot` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `idModule` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ordered_item`
--
ALTER TABLE `ordered_item`
  MODIFY `idOrder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=566;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `idRestaurant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `restaurant_payment`
--
ALTER TABLE `restaurant_payment`
  MODIFY `idRestaurantPayment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `restaurant_table`
--
ALTER TABLE `restaurant_table`
  MODIFY `idTable` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `system_attribute`
--
ALTER TABLE `system_attribute`
  MODIFY `idSystemAttribute` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `sys_user`
--
ALTER TABLE `sys_user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
