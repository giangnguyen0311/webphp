-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for dn_web
CREATE DATABASE IF NOT EXISTS `dn_web` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dn_web`;

-- Dumping structure for table dn_web.admins
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint NOT NULL DEFAULT '1',
  `fullname` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lever` tinyint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dn_web.admins: ~2 rows (approximately)
DELETE FROM `admins`;
INSERT INTO `admins` (`id`, `username`, `password`, `email`, `phone`, `gender`, `fullname`, `lever`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'giang', 'b63965ce559016a5e8cae60787d1f26e', 'giang@gmail.com', '0393949866', 1, 'giang', 1, 1, '2024-12-12 15:19:54', '2024-12-12 15:19:54'),
	(8, 'thoc', '1ecf85ef76aaf70c31f3379b27996bab', 'ht.ntg3@gmail.com', '0393949866', 1, 'thocmap', 0, 1, '2024-12-13 13:15:41', '2024-12-13 13:15:41');

-- Dumping structure for table dn_web.advertise
CREATE TABLE IF NOT EXISTS `advertise` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `photo` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rules` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `manufacturer_id` (`manufacturer_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dn_web.advertise: ~9 rows (approximately)
DELETE FROM `advertise`;
INSERT INTO `advertise` (`id`, `manufacturer_id`, `product_id`, `photo`, `rules`, `created_at`, `deleted_at`, `updated_at`) VALUES
	(6, 10, 8, '2.jpg', 1, NULL, NULL, '2024-12-12 13:48:12'),
	(7, 9, 15, '3.jpg', 1, NULL, NULL, '2024-12-12 13:48:12'),
	(8, 11, 7, '1.jpg', 1, NULL, NULL, '2024-12-12 13:48:12'),
	(9, 10, 8, '2.jpg', 1, NULL, NULL, '2024-12-12 13:48:12'),
	(16, 24, 0, '1.jpg', 3, NULL, NULL, '2024-12-12 13:48:12'),
	(17, 24, 0, '3.jpg', 3, NULL, NULL, '2024-12-12 13:48:12'),
	(18, 14, 0, '1.jpg', 2, NULL, NULL, '2024-12-12 13:48:12'),
	(19, 23, 0, '2.jpg', 2, NULL, NULL, '2024-12-12 13:48:12'),
	(20, 9, 0, '3.jpg', 2, '2024-12-12 13:48:12', NULL, '2024-12-12 13:48:12');

-- Dumping structure for table dn_web.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_lap_id` int NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  KEY `product_lap_id` (`product_lap_id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dn_web.comments: ~0 rows (approximately)
DELETE FROM `comments`;

-- Dumping structure for table dn_web.config_laptop
CREATE TABLE IF NOT EXISTS `config_laptop` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_detail` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dn_web.config_laptop: ~0 rows (approximately)
DELETE FROM `config_laptop`;

-- Dumping structure for table dn_web.config_product_laptop
CREATE TABLE IF NOT EXISTS `config_product_laptop` (
  `pro_laptop_id` int NOT NULL,
  `config_laptop_id` int NOT NULL,
  `values` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`config_laptop_id`,`pro_laptop_id`),
  KEY `pro_laptop_id` (`pro_laptop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dn_web.config_product_laptop: ~0 rows (approximately)
DELETE FROM `config_product_laptop`;

-- Dumping structure for table dn_web.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `gender` tinyint NOT NULL DEFAULT '1',
  `address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dn_web.customers: ~2 rows (approximately)
DELETE FROM `customers`;
INSERT INTO `customers` (`id`, `name`, `email`, `password`, `phone`, `status`, `gender`, `address`, `token`, `created_at`, `deleted_at`, `updated_at`) VALUES
	(42, 'chip', 'aaa@gmail.com', '4697e111e1554aa51afce1991db7458e', '0393949866', 1, 1, 'Đồng Nai', NULL, '2024-12-12 19:04:09', '2024-12-13 12:37:08', '2024-12-12 19:04:09'),
	(43, 'giang nguyễn', 'ht.ntg3@gmail.com', '8f3ba5fd2beac46774ceba7798b4e2c4', '0393949866', 1, 1, 'võ thị sáu', NULL, '2024-12-13 12:01:59', NULL, '2024-12-13 12:01:59');

-- Dumping structure for table dn_web.forgot_password
CREATE TABLE IF NOT EXISTS `forgot_password` (
  `customer_id` int NOT NULL,
  `token` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dn_web.forgot_password: ~0 rows (approximately)
DELETE FROM `forgot_password`;

-- Dumping structure for table dn_web.manufactures
CREATE TABLE IF NOT EXISTS `manufactures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` char(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rules` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dn_web.manufactures: ~5 rows (approximately)
DELETE FROM `manufactures`;
INSERT INTO `manufactures` (`id`, `name`, `address`, `phone`, `photo`, `rules`, `created_at`, `deleted_at`, `updated_at`) VALUES
	(6, 'Iphon15', 'Việt Nam', '+8912121212', '', 1, NULL, NULL, NULL),
	(9, 'Iphon14', 'Việt Nam', '3232323232', '', 1, NULL, NULL, NULL),
	(10, 'Iphon13', 'Việt Nam', '-980004448', '', 1, NULL, NULL, NULL),
	(11, 'Iphon12', 'Việt Nam', '00444111', '', 1, NULL, NULL, NULL),
	(14, 'Iphon 11', 'Việt Nam', '+999', '', 2, '2024-12-12 13:48:12', NULL, '2024-12-12 13:48:12');

-- Dumping structure for table dn_web.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `name_receiver` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_receiver` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_receiver` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `total_price` float NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `orders_ibfk_1` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dn_web.orders: ~15 rows (approximately)
DELETE FROM `orders`;
INSERT INTO `orders` (`id`, `customer_id`, `name_receiver`, `phone_receiver`, `address_receiver`, `status`, `total_price`, `created_at`, `deleted_at`, `updated_at`) VALUES
	(18, 37, 'giang', '0393949866', 'đồng nai', 0, 35300000, '2024-12-11 17:04:28', NULL, '2024-12-11 17:04:28'),
	(19, 37, 'giang', '0393949866', 'đồng nai', 0, 35300000, '2024-12-11 17:04:38', NULL, '2024-12-11 17:04:38'),
	(20, 37, 'giang', '0393949866', 'đồng nai', 0, 29150000, '2024-12-11 17:05:22', NULL, '2024-12-11 17:05:22'),
	(21, 38, 'chip', '0393949866', 'võ thị sáu', 0, 38290000, '2024-12-11 17:23:50', NULL, '2024-12-11 17:23:50'),
	(22, 42, 'chip', '0393949866', 'Đồng Nai', 2, 38290000, '2024-12-12 12:05:21', NULL, '2024-12-12 12:05:21'),
	(23, 42, 'chip', '0393949866', 'Đồng Nai', 1, 38290000, '2024-12-12 12:06:05', NULL, '2024-12-12 12:06:05'),
	(24, 42, 'chip', '0393949866', 'Đồng Nai', 1, 38290000, '2024-12-12 12:09:24', NULL, '2024-12-12 12:09:24'),
	(25, 42, 'chip', '0393949866', 'Đồng Nai', 1, 38290000, '2024-12-12 12:09:34', NULL, '2024-12-12 12:09:34'),
	(26, 42, 'chip', '0393949866', 'Đồng Nai', 1, 38290000, '2024-12-12 12:09:36', NULL, '2024-12-12 12:09:36'),
	(27, 43, 'giang nguyễn', '0393949866', 'võ thị sáu', 1, 30990000, '2024-12-13 05:02:11', NULL, '2024-12-13 05:02:11'),
	(28, 43, 'giang nguyễn', '0393949866', 'võ thị sáu', 1, 30990000, '2024-12-13 05:02:45', NULL, '2024-12-13 05:02:45'),
	(29, 43, 'giang nguyễn', '0393949866', 'võ thị sáu', 1, 30990000, '2024-12-13 05:04:50', NULL, '2024-12-13 05:04:50'),
	(30, 43, 'giang nguyễn', '0393949866', 'võ thị sáu', 1, 24990000, '2024-12-13 06:00:47', NULL, '2024-12-13 06:00:47'),
	(31, 43, 'giang nguyễn', '0393949866', 'võ thị sáu', 1, 9600000, '2024-12-13 06:46:38', NULL, '2024-12-13 06:46:38'),
	(32, 43, 'giang nguyễn', '0393949866', 'võ thị sáu', 1, 29150000, '2024-12-13 06:46:50', NULL, '2024-12-13 06:46:50');

-- Dumping structure for table dn_web.order_detail
CREATE TABLE IF NOT EXISTS `order_detail` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_lp_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`,`order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dn_web.order_detail: ~4 rows (approximately)
DELETE FROM `order_detail`;
INSERT INTO `order_detail` (`order_id`, `product_id`, `product_lp_id`, `quantity`, `created_at`, `deleted_at`, `updated_at`) VALUES
	(31, 0, 1, 1, '2024-12-13 13:46:38', NULL, '2024-12-13 13:46:38'),
	(29, 8, NULL, 1, '2024-12-13 12:04:50', NULL, '2024-12-13 12:04:50'),
	(32, 15, NULL, 1, '2024-12-13 13:46:50', NULL, '2024-12-13 13:46:50'),
	(30, 17, NULL, 1, '2024-12-13 13:00:47', NULL, '2024-12-13 13:00:47');

-- Dumping structure for table dn_web.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` float NOT NULL,
  `descriptions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manufacturer_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `products_ibfk_1` (`manufacturer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dn_web.products: ~8 rows (approximately)
DELETE FROM `products`;
INSERT INTO `products` (`id`, `name`, `photo`, `price`, `descriptions`, `slug`, `manufacturer_id`, `created_at`, `deleted_at`, `updated_at`) VALUES
	(7, 'Iphon 12', '12.jpg', 10490000, 'Cấu hình mạnh \r\n', '', 11, NULL, NULL, NULL),
	(8, 'Iphon 13', '13.jpg', 30990000, 'Chụp hình đẹp', '', 10, NULL, NULL, NULL),
	(9, 'Iphon 14 pro', '14pro.jpg', 38290000, 'Nhỏ gọn\r\n', '', 9, NULL, NULL, NULL),
	(10, 'Iphon 16', '16.jpg', 35300000, 'Phong cách', '', 5, NULL, NULL, NULL),
	(14, 'Iphon 14 pro max', '14prom.jpg', 12490000, 'Camera sắc nét', '', 9, NULL, NULL, NULL),
	(15, 'Iphon 14', '14.jpg', 29150000, 'Màu sắc đẹp\r\n', '', 9, NULL, NULL, NULL),
	(17, 'Iphon 15', '15.jpg', 24990000, 'Cấu hình mạnh mẽ', '', 6, NULL, NULL, NULL),
	(19, 'iphon 11', '1734071597.jpg', 9500000, 'đẹp đẽ', '64 gb', 14, '2024-12-13 13:33:17', NULL, '2024-12-13 13:33:17');

-- Dumping structure for table dn_web.product_laptop
CREATE TABLE IF NOT EXISTS `product_laptop` (
  `id` int NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` float NOT NULL,
  `descriptions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `manufacturer_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_laptop_ibfk_1` (`manufacturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dn_web.product_laptop: ~3 rows (approximately)
DELETE FROM `product_laptop`;
INSERT INTO `product_laptop` (`id`, `name`, `photo`, `price`, `descriptions`, `manufacturer_id`, `created_at`, `deleted_at`, `updated_at`) VALUES
	(1, 'Iphon 11', '11.jpg', 9600000, 'cấu hình mạnh mẽ', 14, '2024-12-13 13:43:03', NULL, '2024-12-13 13:42:45'),
	(2, 'Iphon 11 pro', '11pro.jpg', 10500000, 'nhỏ gọn', 14, '2024-12-13 13:45:04', NULL, '2024-12-13 13:45:08'),
	(3, 'Iphon 11 pro max', '11prm.jpg', 12000000, 'chụp hình đẹp', 14, '2024-12-13 13:45:55', NULL, '2024-12-13 13:45:55');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
