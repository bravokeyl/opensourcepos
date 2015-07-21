-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.17 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.2.0.4947
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for ospos
CREATE DATABASE IF NOT EXISTS `ospos` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ospos`;


-- Dumping structure for table ospos.ospos_workorder
CREATE TABLE IF NOT EXISTS `ospos_workorder` (
  `description` varchar(30) DEFAULT NULL,
  `upc` varchar(30) DEFAULT NULL,
  `item_name` varchar(30) DEFAULT NULL,
  `category` varchar(30) DEFAULT NULL,
  `supplier` varchar(30) DEFAULT NULL,
  `cost_price` varchar(30) DEFAULT NULL,
  `retail_price` varchar(30) DEFAULT NULL,
  `tax1` varchar(30) DEFAULT NULL,
  `tax2` varchar(30) DEFAULT NULL,
  `quantity_stock` decimal(15,2) NOT NULL DEFAULT '0.00',
  `serialized` int(11) NOT NULL DEFAULT '0',
  `deleted` int(11) NOT NULL DEFAULT '0',
  `allow_alt_description` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_location` int(11) NOT NULL,
  `vehicle_no` varchar(45) DEFAULT NULL,
  `driver_no` varchar(45) DEFAULT NULL,
  `project` varchar(45) DEFAULT NULL,
  `weight` varchar(45) DEFAULT NULL,
  `item_date` varchar(50) DEFAULT NULL,
  `attachments` varchar(255) DEFAULT NULL,
  `reorder` varchar(255) DEFAULT NULL,
  `scrap` varchar(255) DEFAULT NULL,
  `vendor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Dumping data for table ospos.ospos_workorder: ~5 rows (approximately)
/*!40000 ALTER TABLE `ospos_workorder` DISABLE KEYS */;
INSERT IGNORE INTO `ospos_workorder` (`description`, `upc`, `item_name`, `category`, `supplier`, `cost_price`, `retail_price`, `tax1`, `tax2`, `quantity_stock`, `serialized`, `deleted`, `allow_alt_description`, `id`, `discount_percent`, `item_location`, `vehicle_no`, `driver_no`, `project`, `weight`, `item_date`, `attachments`, `reorder`, `scrap`, `vendor`) VALUES
	('', NULL, 'fghfg', 'fgh', NULL, '678', '6', NULL, NULL, 0.00, 0, 1, 1, 8, 0.00, 0, '0', '0', NULL, NULL, '07/21/2015 07:34:30', NULL, '0', '0', '0'),
	('fghf', NULL, 'fgh', 'gfhfg', NULL, '5', '5', NULL, NULL, 0.00, 0, 1, 1, 9, 0.00, 0, '0', '0', NULL, NULL, '07/21/2015 07:49:15', NULL, '0', '0', '0'),
	('fghf', NULL, 'fgh', 'gfhfg', NULL, '5', '5', NULL, NULL, 0.00, 0, 1, 1, 10, 0.00, 0, '0', '0', NULL, NULL, '07/21/2015 07:49:18', NULL, '0', '0', '0'),
	('', NULL, 'ere', 'ere', NULL, '4', '4', NULL, NULL, 4.00, 0, 1, 1, 12, 0.00, 0, '0', '0', NULL, NULL, '07/21/2015 08:00:33', NULL, '0', '0', '0'),
	('', NULL, 'ere', 'ere', NULL, '4', '4', NULL, NULL, 4.00, 0, 1, 1, 13, 0.00, 0, '0', '0', NULL, NULL, '07/21/2015 08:00:37', NULL, '0', '0', '0'),
	('', NULL, 'ere', 'ere', NULL, '4', '4', NULL, NULL, 4.00, 0, 1, 1, 14, 0.00, 0, '0', '0', NULL, NULL, '07/21/2015 08:01:56', NULL, '0', '0', '0');
/*!40000 ALTER TABLE `ospos_workorder` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
