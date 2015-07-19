-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 19, 2015 at 10:11 PM
-- Server version: 5.5.43-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ospos`
--

-- --------------------------------------------------------

--
-- Table structure for table `ospos_app_config`
--

CREATE TABLE IF NOT EXISTS `ospos_app_config` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_app_config`
--

INSERT INTO `ospos_app_config` (`key`, `value`) VALUES
('address', '123 Nowhere street'),
('barcode_content', 'id'),
('barcode_first_row', 'category'),
('barcode_font', 'Arial'),
('barcode_font_size', '10'),
('barcode_height', '50'),
('barcode_num_in_row', '2'),
('barcode_page_cellspacing', '20'),
('barcode_page_width', '100'),
('barcode_quality', '100'),
('barcode_second_row', 'item_code'),
('barcode_third_row', 'cost_price'),
('barcode_type', 'id'),
('barcode_width', '250'),
('company', 'Open Source Point of Sale'),
('company_logo', ''),
('default_sales_discount', '0'),
('default_tax_rate', '8'),
('email', 'admin@pappastech.com'),
('fax', ''),
('invoice_default_comments', 'This is a default comment'),
('invoice_email_message', 'Dear $CU, In attachment the receipt for sale $INV'),
('lines_per_page', '25'),
('phone', '555-555-5555'),
('print_bottom_margin', '0'),
('print_footer', '0'),
('print_header', '0'),
('print_left_margin', '0'),
('print_right_margin', '0'),
('print_silently', '1'),
('print_top_margin', '0'),
('receipt_show_taxes', '0'),
('recv_invoice_format', '$CO'),
('return_policy', 'Test'),
('sales_invoice_format', '$CO'),
('show_total_discount', '1'),
('tax_included', '0'),
('timezone', 'America/New_York'),
('use_invoice_template', '1'),
('website', '');

-- --------------------------------------------------------

--
-- Table structure for table `ospos_customers`
--

CREATE TABLE IF NOT EXISTS `ospos_customers` (
  `person_id` int(10) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `taxable` int(1) NOT NULL DEFAULT '1',
  `deleted` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `account_number` (`account_number`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_employees`
--

CREATE TABLE IF NOT EXISTS `ospos_employees` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `username` (`username`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_employees`
--

INSERT INTO `ospos_employees` (`username`, `password`, `person_id`, `deleted`) VALUES
('admin', '439a6de57d475c1a0ba9bcb1c39f0af6', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_giftcards`
--

CREATE TABLE IF NOT EXISTS `ospos_giftcards` (
  `record_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `giftcard_id` int(11) NOT NULL AUTO_INCREMENT,
  `giftcard_number` int(10) NOT NULL,
  `value` decimal(15,2) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `person_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`giftcard_id`),
  UNIQUE KEY `giftcard_number` (`giftcard_number`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_grants`
--

CREATE TABLE IF NOT EXISTS `ospos_grants` (
  `permission_id` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  PRIMARY KEY (`permission_id`,`person_id`),
  KEY `ospos_grants_ibfk_2` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_grants`
--

INSERT INTO `ospos_grants` (`permission_id`, `person_id`) VALUES
('config', 1),
('customers', 1),
('employees', 1),
('giftcards', 1),
('items', 1),
('items_stock', 1),
('item_kits', 1),
('receivings', 1),
('receivings_stock', 1),
('reports', 1),
('reports_categories', 1),
('reports_customers', 1),
('reports_discounts', 1),
('reports_employees', 1),
('reports_inventory', 1),
('reports_items', 1),
('reports_payments', 1),
('reports_receivings', 1),
('reports_sales', 1),
('reports_suppliers', 1),
('reports_taxes', 1),
('sales', 1),
('sales_stock', 1),
('suppliers', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_inventory`
--

CREATE TABLE IF NOT EXISTS `ospos_inventory` (
  `trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_items` int(11) NOT NULL DEFAULT '0',
  `trans_user` int(11) NOT NULL DEFAULT '0',
  `trans_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trans_comment` text NOT NULL,
  `trans_location` int(11) NOT NULL,
  `trans_inventory` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`trans_id`),
  KEY `trans_items` (`trans_items`),
  KEY `trans_user` (`trans_user`),
  KEY `trans_location` (`trans_location`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=61 ;

--
-- Dumping data for table `ospos_inventory`
--

INSERT INTO `ospos_inventory` (`trans_id`, `trans_items`, `trans_user`, `trans_date`, `trans_comment`, `trans_location`, `trans_inventory`) VALUES
(1, 1, 1, '2015-07-16 06:05:51', 'Manual Edit of Quantity', 1, 100),
(2, 2, 1, '2015-07-17 01:01:29', 'Manual Edit of Quantity', 1, 5),
(3, 1, 1, '2015-07-17 01:14:00', 'RECV 1', 1, 4),
(4, 1, 1, '2015-07-17 01:14:42', 'RECV 2', 1, 4),
(5, 1, 1, '2015-07-17 01:17:09', 'RECV 3', 1, 4),
(6, 1, 1, '2015-07-17 01:18:11', 'RECV 4', 1, 4),
(7, 1, 1, '2015-07-17 01:19:49', 'RECV 5', 1, 1),
(8, 2, 1, '2015-07-17 01:19:49', 'RECV 5', 1, 1),
(9, 1, 1, '2015-07-17 01:25:29', 'RECV 6', 1, 1),
(10, 2, 1, '2015-07-17 01:25:29', 'RECV 6', 1, 1),
(11, 1, 1, '2015-07-17 01:26:02', 'RECV 7', 1, 1),
(12, 2, 1, '2015-07-17 01:26:02', 'RECV 7', 1, 1),
(13, 1, 1, '2015-07-17 01:26:11', 'RECV 8', 1, 1),
(14, 2, 1, '2015-07-17 01:26:11', 'RECV 8', 1, 1),
(15, 1, 1, '2015-07-17 01:26:18', 'RECV 9', 1, 1),
(16, 2, 1, '2015-07-17 01:26:18', 'RECV 9', 1, 1),
(17, 1, 1, '2015-07-17 01:26:23', 'RECV 10', 1, 1),
(18, 2, 1, '2015-07-17 01:26:23', 'RECV 10', 1, 1),
(19, 1, 1, '2015-07-17 01:28:41', 'RECV 11', 1, 1),
(20, 2, 1, '2015-07-17 01:28:41', 'RECV 11', 1, 1),
(21, 1, 1, '2015-07-17 01:28:58', 'RECV 12', 1, 1),
(22, 2, 1, '2015-07-17 01:28:58', 'RECV 12', 1, 1),
(23, 1, 1, '2015-07-17 01:29:08', 'RECV 13', 1, 1),
(24, 2, 1, '2015-07-17 01:29:08', 'RECV 13', 1, 1),
(25, 1, 1, '2015-07-17 01:33:32', 'RECV 14', 1, 1),
(26, 2, 1, '2015-07-17 01:33:32', 'RECV 14', 1, 1),
(27, 1, 1, '2015-07-17 01:36:13', 'RECV 15', 1, 1),
(28, 2, 1, '2015-07-17 01:36:13', 'RECV 15', 1, 1),
(29, 1, 1, '2015-07-17 01:36:45', 'RECV 16', 1, 1),
(30, 2, 1, '2015-07-17 01:36:45', 'RECV 16', 1, 1),
(31, 1, 1, '2015-07-17 01:37:00', 'RECV 17', 1, 1),
(32, 2, 1, '2015-07-17 01:37:00', 'RECV 17', 1, 1),
(33, 1, 1, '2015-07-17 01:37:06', 'RECV 18', 1, 1),
(34, 2, 1, '2015-07-17 01:37:06', 'RECV 18', 1, 1),
(35, 1, 1, '2015-07-17 01:37:10', 'RECV 19', 1, 1),
(36, 2, 1, '2015-07-17 01:37:10', 'RECV 19', 1, 1),
(37, 1, 1, '2015-07-17 01:37:15', 'RECV 20', 1, 1),
(38, 2, 1, '2015-07-17 01:37:15', 'RECV 20', 1, 1),
(39, 1, 1, '2015-07-17 01:37:24', 'RECV 21', 1, 1),
(40, 2, 1, '2015-07-17 01:37:24', 'RECV 21', 1, 1),
(41, 1, 1, '2015-07-17 01:48:43', 'RECV 22', 1, 1),
(42, 2, 1, '2015-07-17 01:48:43', 'RECV 22', 1, 1),
(43, 1, 1, '2015-07-17 01:49:54', 'RECV 23', 1, 1),
(44, 2, 1, '2015-07-17 01:49:54', 'RECV 23', 1, 1),
(45, 2, 1, '2015-07-17 02:08:13', 'RECV 24', 1, -1),
(46, 1, 1, '2015-07-17 02:08:13', 'RECV 24', 1, -1),
(47, 2, 1, '2015-07-17 02:09:09', 'RECV 25', 1, -1),
(48, 1, 1, '2015-07-18 06:30:32', 'RECV 26', 1, -1),
(49, 1, 1, '2015-07-18 06:30:58', 'RECV 27', 1, -1),
(50, 1, 1, '2015-07-18 06:31:35', 'RECV 28', 1, -1),
(51, 1, 1, '2015-07-18 06:32:24', 'RECV 29', 1, -1),
(52, 1, 1, '2015-07-18 15:20:44', 'RECV 30', 1, 1),
(53, 1, 1, '2015-07-18 18:37:21', 'RECV 31', 1, 1),
(54, 2, 1, '2015-07-18 18:37:21', 'RECV 31', 1, 1),
(55, 2, 1, '2015-07-18 18:42:42', 'RECV 32', 1, 1),
(56, 1, 1, '2015-07-18 18:42:42', 'RECV 32', 1, 2),
(57, 1, 1, '2015-07-19 02:04:03', 'RECV 33', 1, 1),
(58, 2, 1, '2015-07-19 02:04:03', 'RECV 33', 1, 2),
(59, 1, 1, '2015-07-19 02:06:31', 'RECV 34', 1, 1),
(60, 2, 1, '2015-07-19 02:06:31', 'RECV 34', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_items`
--

CREATE TABLE IF NOT EXISTS `ospos_items` (
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `item_number` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `cost_price` decimal(15,2) NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `reorder_level` decimal(15,2) NOT NULL DEFAULT '0.00',
  `receiving_quantity` int(11) NOT NULL DEFAULT '1',
  `item_id` int(10) NOT NULL AUTO_INCREMENT,
  `pic_id` int(10) DEFAULT NULL,
  `allow_alt_description` tinyint(1) NOT NULL,
  `is_serialized` tinyint(1) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `custom1` varchar(25) NOT NULL,
  `custom2` varchar(25) NOT NULL,
  `custom3` varchar(25) NOT NULL,
  `custom4` varchar(25) NOT NULL,
  `custom5` varchar(25) NOT NULL,
  `custom6` varchar(25) NOT NULL,
  `custom7` varchar(25) NOT NULL,
  `custom8` varchar(25) NOT NULL,
  `custom9` varchar(25) NOT NULL,
  `custom10` varchar(25) NOT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_number` (`item_number`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ospos_items`
--

INSERT INTO `ospos_items` (`name`, `category`, `supplier_id`, `item_number`, `description`, `cost_price`, `unit_price`, `reorder_level`, `receiving_quantity`, `item_id`, `pic_id`, `allow_alt_description`, `is_serialized`, `deleted`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES
('Apple iMac', 'Computer Accessories', NULL, '1', '', 800.00, 1000.00, 50.00, 0, 1, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('HP Pavilion', 'Computer Accessories', NULL, NULL, '', 120.00, 150.00, 20.00, 0, 2, NULL, 0, 0, 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `ospos_items_taxes`
--

CREATE TABLE IF NOT EXISTS `ospos_items_taxes` (
  `item_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,2) NOT NULL,
  PRIMARY KEY (`item_id`,`name`,`percent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_item_kits`
--

CREATE TABLE IF NOT EXISTS `ospos_item_kits` (
  `item_kit_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`item_kit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_item_kit_items`
--

CREATE TABLE IF NOT EXISTS `ospos_item_kit_items` (
  `item_kit_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` decimal(15,2) NOT NULL,
  PRIMARY KEY (`item_kit_id`,`item_id`,`quantity`),
  KEY `ospos_item_kit_items_ibfk_2` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_item_quantities`
--

CREATE TABLE IF NOT EXISTS `ospos_item_quantities` (
  `item_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`,`location_id`),
  KEY `item_id` (`item_id`),
  KEY `location_id` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_item_quantities`
--

INSERT INTO `ospos_item_quantities` (`item_id`, `location_id`, `quantity`) VALUES
(1, 1, 136),
(2, 1, 28);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_modules`
--

CREATE TABLE IF NOT EXISTS `ospos_modules` (
  `name_lang_key` varchar(255) NOT NULL,
  `desc_lang_key` varchar(255) NOT NULL,
  `sort` int(10) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `desc_lang_key` (`desc_lang_key`),
  UNIQUE KEY `name_lang_key` (`name_lang_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_modules`
--

INSERT INTO `ospos_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `module_id`) VALUES
('module_config', 'module_config_desc', 100, 'config'),
('module_customers', 'module_customers_desc', 10, 'customers'),
('module_employees', 'module_employees_desc', 80, 'employees'),
('module_giftcards', 'module_giftcards_desc', 90, 'giftcards'),
('module_items', 'module_items_desc', 20, 'items'),
('module_item_kits', 'module_item_kits_desc', 30, 'item_kits'),
('module_receivings', 'module_receivings_desc', 60, 'receivings'),
('module_reports', 'module_reports_desc', 50, 'reports'),
('module_sales', 'module_sales_desc', 70, 'sales'),
('module_suppliers', 'module_suppliers_desc', 40, 'suppliers');

-- --------------------------------------------------------

--
-- Table structure for table `ospos_people`
--

CREATE TABLE IF NOT EXISTS `ospos_people` (
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` int(1) DEFAULT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `comments` text NOT NULL,
  `person_id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ospos_people`
--

INSERT INTO `ospos_people` (`first_name`, `last_name`, `gender`, `phone_number`, `email`, `address_1`, `address_2`, `city`, `state`, `zip`, `country`, `comments`, `person_id`) VALUES
('John', 'Doe', NULL, '555-555-5555', 'admin@pappastech.com', 'Address 1', '', '', '', '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_permissions`
--

CREATE TABLE IF NOT EXISTS `ospos_permissions` (
  `permission_id` varchar(255) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `location_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `module_id` (`module_id`),
  KEY `ospos_permissions_ibfk_2` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_permissions`
--

INSERT INTO `ospos_permissions` (`permission_id`, `module_id`, `location_id`) VALUES
('config', 'config', NULL),
('customers', 'customers', NULL),
('employees', 'employees', NULL),
('giftcards', 'giftcards', NULL),
('items', 'items', NULL),
('items_stock', 'items', 1),
('item_kits', 'item_kits', NULL),
('receivings', 'receivings', NULL),
('receivings_stock', 'receivings', 1),
('reports', 'reports', NULL),
('reports_categories', 'reports', NULL),
('reports_customers', 'reports', NULL),
('reports_discounts', 'reports', NULL),
('reports_employees', 'reports', NULL),
('reports_inventory', 'reports', NULL),
('reports_items', 'reports', NULL),
('reports_payments', 'reports', NULL),
('reports_receivings', 'reports', NULL),
('reports_sales', 'reports', NULL),
('reports_suppliers', 'reports', NULL),
('reports_taxes', 'reports', NULL),
('sales', 'sales', NULL),
('sales_stock', 'sales', 1),
('suppliers', 'suppliers', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_receivings`
--

CREATE TABLE IF NOT EXISTS `ospos_receivings` (
  `receiving_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `receiving_id` int(10) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(20) DEFAULT NULL,
  `invoice_number` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`receiving_id`),
  UNIQUE KEY `invoice_number` (`invoice_number`),
  KEY `supplier_id` (`supplier_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `ospos_receivings`
--

INSERT INTO `ospos_receivings` (`receiving_time`, `supplier_id`, `employee_id`, `comment`, `receiving_id`, `payment_type`, `invoice_number`) VALUES
('2015-07-17 13:14:00', NULL, 1, 'Sample Receiving', 1, 'Cash', NULL),
('2015-07-17 13:14:42', NULL, 1, 'Sample Receiving', 2, 'Cash', NULL),
('2015-07-17 13:17:09', NULL, 1, 'Sample Receiving', 3, 'Cash', NULL),
('2015-07-17 13:18:11', NULL, 1, 'Sample Receiving', 4, 'Cash', NULL),
('2015-07-17 13:19:49', NULL, 1, '', 5, 'Cash', NULL),
('2015-07-17 13:25:29', NULL, 1, '', 6, 'Cash', NULL),
('2015-07-17 13:26:02', NULL, 1, '', 7, 'Cash', NULL),
('2015-07-17 13:26:11', NULL, 1, '', 8, 'Cash', NULL),
('2015-07-17 13:26:18', NULL, 1, '', 9, 'Cash', NULL),
('2015-07-17 13:26:23', NULL, 1, '', 10, 'Cash', NULL),
('2015-07-17 13:28:41', NULL, 1, '', 11, 'Cash', NULL),
('2015-07-17 13:28:58', NULL, 1, '', 12, 'Cash', NULL),
('2015-07-17 13:29:08', NULL, 1, '', 13, 'Cash', NULL),
('2015-07-17 13:33:32', NULL, 1, '', 14, 'Cash', NULL),
('2015-07-17 13:36:13', NULL, 1, '', 15, 'Cash', NULL),
('2015-07-17 13:36:45', NULL, 1, '', 16, 'Cash', NULL),
('2015-07-17 13:37:00', NULL, 1, '', 17, 'Cash', NULL),
('2015-07-17 13:37:06', NULL, 1, '', 18, 'Cash', NULL),
('2015-07-17 13:37:10', NULL, 1, '', 19, 'Cash', NULL),
('2015-07-17 13:37:15', NULL, 1, '', 20, 'Cash', NULL),
('2015-07-17 13:37:24', NULL, 1, '', 21, 'Cash', NULL),
('2015-07-17 13:48:43', NULL, 1, '', 22, 'Cash', NULL),
('2015-07-17 13:49:54', NULL, 1, '', 23, 'Cash', NULL),
('2015-07-17 14:08:13', NULL, 1, '', 24, 'Cash', NULL),
('2015-07-17 14:09:09', NULL, 1, '', 25, 'Cash', NULL),
('2015-07-18 18:30:32', NULL, 1, '', 26, 'Cash', NULL),
('2015-07-18 18:30:58', NULL, 1, '', 27, 'Cash', NULL),
('2015-07-18 18:31:35', NULL, 1, '', 28, 'Cash', NULL),
('2015-07-18 18:32:24', NULL, 1, '', 29, 'Cash', NULL),
('2015-07-19 03:20:44', NULL, 1, '', 30, 'Cash', NULL),
('2015-07-19 06:37:21', NULL, 1, '', 31, 'Cash', NULL),
('2015-07-19 06:42:42', NULL, 1, '', 32, 'Cash', NULL),
('2015-07-19 14:04:03', NULL, 1, '', 33, 'Cash', NULL),
('2015-07-19 14:06:31', NULL, 1, '', 34, 'Cash', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_receivings_items`
--

CREATE TABLE IF NOT EXISTS `ospos_receivings_items` (
  `receiving_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL,
  `quantity_purchased` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_location` int(11) NOT NULL,
  `receiving_quantity` int(11) NOT NULL DEFAULT '1',
  `vehicle_no` varchar(45) DEFAULT NULL,
  `driver_no` varchar(45) DEFAULT NULL,
  `project` varchar(45) DEFAULT NULL,
  `weight` varchar(45) DEFAULT NULL,
  `item_date` datetime DEFAULT NULL,
  `attachments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`receiving_id`,`item_id`,`line`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_receivings_items`
--

INSERT INTO `ospos_receivings_items` (`receiving_id`, `item_id`, `description`, `serialnumber`, `line`, `quantity_purchased`, `item_cost_price`, `item_unit_price`, `discount_percent`, `item_location`, `receiving_quantity`, `vehicle_no`, `driver_no`, `project`, `weight`, `item_date`, `attachments`) VALUES
(32, 1, '', '', 2, 2.00, 800.00, 800.00, 0.00, 1, 0, NULL, NULL, NULL, NULL, '2015-07-19 02:40:31', '71,72,73'),
(32, 2, '', '', 1, 1.00, 120.00, 120.00, 0.00, 1, 0, NULL, NULL, NULL, NULL, '2015-07-19 02:40:27', '77'),
(33, 1, '', '', 1, 1.00, 800.00, 800.00, 0.00, 1, 0, NULL, NULL, NULL, NULL, '2015-07-19 10:03:47', ''),
(33, 2, '', '', 2, 2.00, 120.00, 120.00, 0.00, 1, 0, NULL, NULL, NULL, NULL, '2015-07-19 10:03:51', ''),
(34, 1, '', '', 1, 1.00, 800.00, 800.00, 0.00, 1, 0, NULL, NULL, NULL, NULL, '2015-07-19 10:03:47', '81,82,83,84'),
(34, 2, '', '', 2, 2.00, 120.00, 120.00, 0.00, 1, 0, NULL, NULL, NULL, NULL, '2015-07-19 10:03:51', '79,80');

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales`
--

CREATE TABLE IF NOT EXISTS `ospos_sales` (
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `invoice_number` varchar(32) DEFAULT NULL,
  `sale_id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sale_id`),
  UNIQUE KEY `invoice_number` (`invoice_number`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`),
  KEY `sale_time` (`sale_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales_items`
--

CREATE TABLE IF NOT EXISTS `ospos_sales_items` (
  `sale_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `quantity_purchased` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_location` int(11) NOT NULL,
  PRIMARY KEY (`sale_id`,`item_id`,`line`),
  KEY `sale_id` (`sale_id`),
  KEY `item_id` (`item_id`),
  KEY `item_location` (`item_location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales_items_taxes`
--

CREATE TABLE IF NOT EXISTS `ospos_sales_items_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,2) NOT NULL,
  PRIMARY KEY (`sale_id`,`item_id`,`line`,`name`,`percent`),
  KEY `sale_id` (`sale_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales_payments`
--

CREATE TABLE IF NOT EXISTS `ospos_sales_payments` (
  `sale_id` int(10) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`sale_id`,`payment_type`),
  KEY `sale_id` (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales_suspended`
--

CREATE TABLE IF NOT EXISTS `ospos_sales_suspended` (
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `invoice_number` varchar(32) DEFAULT NULL,
  `sale_id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sale_id`),
  UNIQUE KEY `invoice_number` (`invoice_number`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales_suspended_items`
--

CREATE TABLE IF NOT EXISTS `ospos_sales_suspended_items` (
  `sale_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `quantity_purchased` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_location` int(11) NOT NULL,
  PRIMARY KEY (`sale_id`,`item_id`,`line`),
  KEY `sale_id` (`sale_id`),
  KEY `item_id` (`item_id`),
  KEY `ospos_sales_suspended_items_ibfk_3` (`item_location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales_suspended_items_taxes`
--

CREATE TABLE IF NOT EXISTS `ospos_sales_suspended_items_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,2) NOT NULL,
  PRIMARY KEY (`sale_id`,`item_id`,`line`,`name`,`percent`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sales_suspended_payments`
--

CREATE TABLE IF NOT EXISTS `ospos_sales_suspended_payments` (
  `sale_id` int(10) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`sale_id`,`payment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_sessions`
--

CREATE TABLE IF NOT EXISTS `ospos_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ospos_sessions`
--

INSERT INTO `ospos_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('52b8d5253fb3c8218eab49848f3165d5', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.125 Safari/537.36', 1437314863, 'a:8:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";s:13:"item_location";s:1:"1";s:9:"recv_mode";s:7:"receive";s:17:"recv_stock_source";s:1:"1";s:8:"cartRecv";a:2:{i:1;a:21:{s:7:"item_id";s:1:"1";s:13:"item_location";s:1:"1";s:10:"stock_name";s:5:"stock";s:4:"line";i:1;s:4:"name";s:10:"Apple iMac";s:11:"description";s:0:"";s:12:"serialnumber";s:0:"";s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";i:1;s:8:"discount";i:0;s:8:"in_stock";s:3:"134";s:5:"price";s:6:"800.00";s:18:"receiving_quantity";s:1:"0";s:5:"total";s:9:"800.00000";s:10:"vehicle_no";N;s:9:"driver_no";N;s:7:"project";N;s:6:"weight";N;s:9:"item_date";s:19:"07/19/2015 10:03:47";s:14:"attachment_ids";a:4:{i:0;i:81;i:1;i:82;i:2;i:83;i:3;i:84;}}i:2;a:21:{s:7:"item_id";s:1:"2";s:13:"item_location";s:1:"1";s:10:"stock_name";s:5:"stock";s:4:"line";i:2;s:4:"name";s:11:"HP Pavilion";s:11:"description";s:0:"";s:12:"serialnumber";s:0:"";s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";i:2;s:8:"discount";i:0;s:8:"in_stock";s:2:"24";s:5:"price";s:6:"120.00";s:18:"receiving_quantity";s:1:"0";s:5:"total";s:9:"120.00000";s:10:"vehicle_no";N;s:9:"driver_no";N;s:7:"project";N;s:6:"weight";N;s:9:"item_date";s:19:"07/19/2015 10:03:51";s:14:"attachment_ids";a:4:{i:0;i:79;i:1;i:80;i:2;i:85;i:3;i:86;}}}s:8:"supplier";i:-1;s:19:"recv_invoice_number";s:1:"0";}');

-- --------------------------------------------------------

--
-- Table structure for table `ospos_stock_locations`
--

CREATE TABLE IF NOT EXISTS `ospos_stock_locations` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ospos_stock_locations`
--

INSERT INTO `ospos_stock_locations` (`location_id`, `location_name`, `deleted`) VALUES
(1, 'stock', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ospos_suppliers`
--

CREATE TABLE IF NOT EXISTS `ospos_suppliers` (
  `person_id` int(10) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `account_number` (`account_number`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ospos_uploads`
--

CREATE TABLE IF NOT EXISTS `ospos_uploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `filename` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=87 ;

--
-- Dumping data for table `ospos_uploads`
--

INSERT INTO `ospos_uploads` (`id`, `name`, `type`, `filename`, `created_at`) VALUES
(7, '1433796056_config-language.png', 'image/png', 'uploads/receivings/8f14e45fceea167a5a36dedd4bea2543', NULL),
(8, '1433796079_config-language.png', 'image/png', 'uploads/receivings/c9f0f895fb98ab9159f51fd0297e236d', NULL),
(9, 'Best of Pedigree-logo.png', 'image/png', 'uploads/receivings/45c48cce2e2d7fbdea1afc51c7c6ad26', NULL),
(10, 'Best of Pedigree-logo (1).png', 'image/png', 'uploads/receivings/d3d9446802a44259755d38e6d163e820', NULL),
(11, 'Best of Pedigree-logo (2).png', 'image/png', 'uploads/receivings/6512bd43d9caa6e02c990b0a82652dca', NULL),
(12, 'angularappmockups.zip', 'application/zip', 'uploads/receivings/c20ad4d76fe97759aa27a0c99bff6710', NULL),
(13, '11090331_1548145332072795_4254765418898933578_n.jpg', 'image/jpeg', 'uploads/receivings/c51ce410c124a10e0db5e4b97fc2af39', NULL),
(14, '1433796056_config-language.png', 'image/png', 'uploads/receivings/aab3238922bcc25a6f606eb525ffdc56', NULL),
(15, '1433796079_config-language.png', 'image/png', 'uploads/receivings/9bf31c7ff062936a96d3c8bd1f8f2ff3', NULL),
(16, 'Best of Pedigree-logo.png', 'image/png', 'uploads/receivings/c74d97b01eae257e44aa9d5bade97baf', NULL),
(17, 'Best of Pedigree-logo (1).png', 'image/png', 'uploads/receivings/70efdf2ec9b086079795c442636b55fb', NULL),
(18, 'Best of Pedigree-logo (2).png', 'image/png', 'uploads/receivings/6f4922f45568161a8cdf4ad2299f6d23', NULL),
(19, '1434399067_t9dog1_trans.png', 'image/png', 'uploads/receivings/1f0e3dad99908345f7439f8ffabdffc4', NULL),
(27, 'Best of Pedigree-logo (1).png', 'image/png', 'uploads/receivings/02e74f10e0327ad868d138f2b4fdd6f0', NULL),
(30, 'A5tqWj1434380233.png', 'image/png', 'uploads/receivings/34173cb38f07f89ddbebc2ac9128303f', NULL),
(38, '1433796079_config-language.png', 'image/png', 'uploads/receivings/a5771bce93e200c36f7cd9dfd0e5deaa', NULL),
(47, '1433796079_config-language.png', 'image/png', 'uploads/receivings/67c6a1e7ce56d3d6fa748ab6d9af3fd7', NULL),
(48, '1434399067_t9dog1_trans.png', 'image/png', 'uploads/receivings/642e92efb79421734881b53e1e1b18b6', NULL),
(49, 'A5tqWj1434380233.png', 'image/png', 'uploads/receivings/f457c545a9ded88f18ecee47145a72c0', NULL),
(52, '1433796079_config-language.png', 'image/png', 'uploads/receivings/9a1158154dfa42caddbd0694a4e9bdc8', NULL),
(53, '1434399067_t9dog1_trans.png', 'image/png', 'uploads/receivings/d82c8d1619ad8176d665453cfb2e55f0', NULL),
(54, 'A5tqWj1434380233.png', 'image/png', 'uploads/receivings/a684eceee76fc522773286a895bc8436', NULL),
(55, 'Access - John.txt', 'text/plain', 'uploads/receivings/b53b3a3d6ab90ce0268229151c9bde11', NULL),
(61, '1433796056_config-language.png', 'image/png', 'uploads/receivings/7f39f8317fbdb1988ef4c628eba02591', NULL),
(63, 'Best of Pedigree-logo.png', 'image/png', 'uploads/receivings/03afdbd66e7929b125f8597834fa83a4', NULL),
(64, 'Best of Pedigree-logo (1).png', 'image/png', 'uploads/receivings/ea5d2f1c4608232e07d3aa3d998e5135', NULL),
(66, '1433796056_config-language.png', 'image/png', 'uploads/receivings/3295c76acbf4caaed33c36b1b5fc2cb1', NULL),
(67, '1433796079_config-language.png', 'image/png', 'uploads/receivings/735b90b4568125ed6c3f678819b6e058', NULL),
(68, '1434399067_t9dog1_trans.png', 'image/png', 'uploads/receivings/a3f390d88e4c41f2747bfa2f1b5f87db', NULL),
(69, '11090331_1548145332072795_4254765418898933578_n.jpg', 'image/jpeg', 'uploads/receivings/14bfa6bb14875e45bba028a21ed38046', NULL),
(70, '1433796056_config-language.png', 'image/png', 'uploads/receivings/7cbbc409ec990f19c78c75bd1e06f215', NULL),
(71, '11090331_1548145332072795_4254765418898933578_n.jpg', 'image/jpeg', 'uploads/receivings/e2c420d928d4bf8ce0ff2ec19b371514', NULL),
(72, '1433796056_config-language.png', 'image/png', 'uploads/receivings/32bb90e8976aab5298d5da10fe66f21d', NULL),
(73, '1433796079_config-language.png', 'image/png', 'uploads/receivings/d2ddea18f00665ce8623e36bd4e3c7c5', NULL),
(77, 'Access - John.txt', 'text/plain', 'uploads/receivings/28dd2c7955ce926456240b2ff0100bde', NULL),
(79, 'contacts (1).csv', 'text/csv', 'uploads/receivings/contacts (1).csv', '2015-07-19 10:05:22'),
(80, 'contacts (2).csv', 'text/csv', 'uploads/receivings/contacts (2).csv', '2015-07-19 10:05:22'),
(81, 'CV - Final.pdf', 'application/pdf', 'uploads/receivings/CV - Final.pdf', '2015-07-19 10:05:52'),
(82, 'LEAVE APPLICATION FORM - Form No 004-Final.pdf', 'application/pdf', 'uploads/receivings/LEAVE APPLICATION FORM - Form No 004-Final.pdf', '2015-07-19 10:05:52'),
(83, 'LEAVE APPLICATION FORM - Form No 004-Final (1).pdf', 'application/pdf', 'uploads/receivings/LEAVE APPLICATION FORM - Form No 004-Final (1).pdf', '2015-07-19 10:05:52'),
(84, 'LEAVE APPLICATION FORM - Form No 004-Final (2).pdf', 'application/pdf', 'uploads/receivings/LEAVE APPLICATION FORM - Form No 004-Final (2).pdf', '2015-07-19 10:05:52'),
(85, '647179contacts (1).csv', 'text/csv', 'uploads/receivings/647179contacts (1).csv', '2015-07-19 10:07:54'),
(86, '17868contacts (2).csv', 'text/csv', 'uploads/receivings/17868contacts (2).csv', '2015-07-19 10:07:54');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ospos_customers`
--
ALTER TABLE `ospos_customers`
  ADD CONSTRAINT `ospos_customers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`);

--
-- Constraints for table `ospos_employees`
--
ALTER TABLE `ospos_employees`
  ADD CONSTRAINT `ospos_employees_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`);

--
-- Constraints for table `ospos_giftcards`
--
ALTER TABLE `ospos_giftcards`
  ADD CONSTRAINT `ospos_giftcards_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`);

--
-- Constraints for table `ospos_grants`
--
ALTER TABLE `ospos_grants`
  ADD CONSTRAINT `ospos_grants_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `ospos_permissions` (`permission_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ospos_grants_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `ospos_employees` (`person_id`) ON DELETE CASCADE;

--
-- Constraints for table `ospos_inventory`
--
ALTER TABLE `ospos_inventory`
  ADD CONSTRAINT `ospos_inventory_ibfk_1` FOREIGN KEY (`trans_items`) REFERENCES `ospos_items` (`item_id`),
  ADD CONSTRAINT `ospos_inventory_ibfk_2` FOREIGN KEY (`trans_user`) REFERENCES `ospos_employees` (`person_id`),
  ADD CONSTRAINT `ospos_inventory_ibfk_3` FOREIGN KEY (`trans_location`) REFERENCES `ospos_stock_locations` (`location_id`);

--
-- Constraints for table `ospos_items`
--
ALTER TABLE `ospos_items`
  ADD CONSTRAINT `ospos_items_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `ospos_suppliers` (`person_id`);

--
-- Constraints for table `ospos_items_taxes`
--
ALTER TABLE `ospos_items_taxes`
  ADD CONSTRAINT `ospos_items_taxes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`) ON DELETE CASCADE;

--
-- Constraints for table `ospos_item_kit_items`
--
ALTER TABLE `ospos_item_kit_items`
  ADD CONSTRAINT `ospos_item_kit_items_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `ospos_item_kits` (`item_kit_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ospos_item_kit_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`) ON DELETE CASCADE;

--
-- Constraints for table `ospos_item_quantities`
--
ALTER TABLE `ospos_item_quantities`
  ADD CONSTRAINT `ospos_item_quantities_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  ADD CONSTRAINT `ospos_item_quantities_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `ospos_stock_locations` (`location_id`);

--
-- Constraints for table `ospos_permissions`
--
ALTER TABLE `ospos_permissions`
  ADD CONSTRAINT `ospos_permissions_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `ospos_modules` (`module_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ospos_permissions_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `ospos_stock_locations` (`location_id`) ON DELETE CASCADE;

--
-- Constraints for table `ospos_receivings`
--
ALTER TABLE `ospos_receivings`
  ADD CONSTRAINT `ospos_receivings_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  ADD CONSTRAINT `ospos_receivings_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `ospos_suppliers` (`person_id`);

--
-- Constraints for table `ospos_receivings_items`
--
ALTER TABLE `ospos_receivings_items`
  ADD CONSTRAINT `ospos_receivings_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  ADD CONSTRAINT `ospos_receivings_items_ibfk_2` FOREIGN KEY (`receiving_id`) REFERENCES `ospos_receivings` (`receiving_id`);

--
-- Constraints for table `ospos_sales`
--
ALTER TABLE `ospos_sales`
  ADD CONSTRAINT `ospos_sales_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  ADD CONSTRAINT `ospos_sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `ospos_customers` (`person_id`);

--
-- Constraints for table `ospos_sales_items`
--
ALTER TABLE `ospos_sales_items`
  ADD CONSTRAINT `ospos_sales_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  ADD CONSTRAINT `ospos_sales_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`),
  ADD CONSTRAINT `ospos_sales_items_ibfk_3` FOREIGN KEY (`item_location`) REFERENCES `ospos_stock_locations` (`location_id`);

--
-- Constraints for table `ospos_sales_items_taxes`
--
ALTER TABLE `ospos_sales_items_taxes`
  ADD CONSTRAINT `ospos_sales_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_items` (`sale_id`),
  ADD CONSTRAINT `ospos_sales_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`);

--
-- Constraints for table `ospos_sales_payments`
--
ALTER TABLE `ospos_sales_payments`
  ADD CONSTRAINT `ospos_sales_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`);

--
-- Constraints for table `ospos_sales_suspended`
--
ALTER TABLE `ospos_sales_suspended`
  ADD CONSTRAINT `ospos_sales_suspended_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  ADD CONSTRAINT `ospos_sales_suspended_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `ospos_customers` (`person_id`);

--
-- Constraints for table `ospos_sales_suspended_items`
--
ALTER TABLE `ospos_sales_suspended_items`
  ADD CONSTRAINT `ospos_sales_suspended_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  ADD CONSTRAINT `ospos_sales_suspended_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_suspended` (`sale_id`),
  ADD CONSTRAINT `ospos_sales_suspended_items_ibfk_3` FOREIGN KEY (`item_location`) REFERENCES `ospos_stock_locations` (`location_id`);

--
-- Constraints for table `ospos_sales_suspended_items_taxes`
--
ALTER TABLE `ospos_sales_suspended_items_taxes`
  ADD CONSTRAINT `ospos_sales_suspended_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_suspended_items` (`sale_id`),
  ADD CONSTRAINT `ospos_sales_suspended_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`);

--
-- Constraints for table `ospos_sales_suspended_payments`
--
ALTER TABLE `ospos_sales_suspended_payments`
  ADD CONSTRAINT `ospos_sales_suspended_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_suspended` (`sale_id`);

--
-- Constraints for table `ospos_suppliers`
--
ALTER TABLE `ospos_suppliers`
  ADD CONSTRAINT `ospos_suppliers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
