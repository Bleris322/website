-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 29, 2018 at 11:58 PM
-- Server version: 5.5.58-0+deb8u1
-- PHP Version: 5.6.30-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE IF NOT EXISTS `addresses` (
`id` int(11) NOT NULL,
  `street` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pc` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `_users` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `street`, `city`, `state`, `pc`, `_users`) VALUES
(23, '', '', '', '9222', 1),
(24, '', '', '', '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `domelements`
--

CREATE TABLE IF NOT EXISTS `domelements` (
`id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `innerHTML` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `_domelements` int(11) DEFAULT NULL,
  `_domelements_position` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `domelements`
--

INSERT INTO `domelements` (`id`, `name`, `innerHTML`, `_domelements`, `_domelements_position`) VALUES
(9, 'ctgbxtt', 'Shop', 60, 0),
(14, 'title', 'Log out', 63, 0),
(15, 'title', 'Log in', 64, 0),
(19, 'username', 'Guest', 64, 0),
(20, 'status', 'Not connected', 64, 0),
(23, 'status', 'Connected', 63, 0),
(25, 'crtbxtt', 'Shopping cart', 65, 0),
(27, 'ckouttt', 'Check out', 65, 0),
(32, 'license', '<a href="LICENSE.txt">License</a>', 61, 0),
(33, 'designed', 'Powered by <a href="https://sourceforge.net/projects/youronlineshop/">YourOnlineShop</a>', 61, 0),
(36, 'addcarttt', '+1 to the cart', 60, 0),
(38, 'lgintt', 'Insert you account details or create a new account.', 60, 0),
(41, 'headtitle', 'Shop Title', 59, 0),
(42, 'headsubtitle', 'This is my first shop', 59, 0),
(43, 'username', 'the user name', 63, 0),
(44, 'emptyvallabel', 'Not any value', 73, 0),
(58, 'root', '', NULL, 0),
(59, 'top', '', 71, 0),
(60, 'middle', '', 71, 0),
(61, 'bottom', '', 71, 0),
(62, 'logbox', '', 60, 0),
(63, 'logboxin', '', 62, 0),
(64, 'logboxout', '', 62, 0),
(65, 'cartbox', '', 60, 0),
(66, 'nav', '', 72, 0),
(71, 'labels', '', 58, 0),
(72, 'texts', '', 58, 0),
(73, 'not located', '', 71, 0),
(91, '', 'Hello', 66, 1),
(92, '', 'Hello!<br>This is the first page. You can edit this and the other elements by login from webadmin/webadmin.', 91, 1);

-- --------------------------------------------------------

--
-- Table structure for table `itemcategories`
--

CREATE TABLE IF NOT EXISTS `itemcategories` (
`id` int(11) NOT NULL,
  `cname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `_itemcategories` int(11) DEFAULT NULL,
  `_itemcategories_position` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `itemcategories`
--

INSERT INTO `itemcategories` (`id`, `cname`, `_itemcategories`, `_itemcategories_position`) VALUES
(1, 'root', NULL, 0),
(38, 'first cat', 1, 1),
(39, 'first subcat', 38, 1);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
`id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descriptionlarge` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `descriptionshort` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `_itemcategories` int(11) DEFAULT NULL,
  `_itemcategories_position` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `descriptionlarge`, `descriptionshort`, `image`, `price`, `_itemcategories`, `_itemcategories_position`) VALUES
(84, 'product p', '', 'p description<br>', '', 4.00, 39, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE IF NOT EXISTS `orderitems` (
`id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `_orders` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`id`, `name`, `price`, `quantity`, `_orders`) VALUES
(105, '', 0.00, 2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
`id` int(11) NOT NULL,
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificationdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) NOT NULL DEFAULT '0',
  `_users` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `creationdate`, `modificationdate`, `status`, `_users`) VALUES
(6, '2018-05-28 20:34:35', '0000-00-00 00:00:00', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `relationships`
--

CREATE TABLE IF NOT EXISTS `relationships` (
`id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parenttablename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parentunique` tinyint(1) NOT NULL DEFAULT '1',
  `childtablename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `childunique` tinyint(1) NOT NULL DEFAULT '0',
  `childtablelocked` int(11) NOT NULL DEFAULT '0',
  `parenttablelocked` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `relationships`
--

INSERT INTO `relationships` (`id`, `name`, `parenttablename`, `parentunique`, `childtablename`, `childunique`, `childtablelocked`, `parenttablelocked`, `sort_order`) VALUES
(1, 'users', 'TABLE_USERSTYPES', 1, 'TABLE_USERS', 0, 1, 1, 0),
(2, 'usersdata', 'TABLE_USERS', 1, 'TABLE_USERSDATA', 1, 0, 0, 0),
(3, 'itemcategories', 'TABLE_ITEMCATEGORIES', 1, 'TABLE_ITEMCATEGORIES', 0, 0, 0, 1),
(4, 'items', 'TABLE_ITEMCATEGORIES', 1, 'TABLE_ITEMS', 0, 0, 0, 1),
(5, 'domelements', 'TABLE_DOMELEMENTS', 1, 'TABLE_DOMELEMENTS', 0, 0, 0, 1),
(6, 'orders', 'TABLE_USERS', 1, 'TABLE_ORDERS', 0, 0, 0, 0),
(7, 'orderitems', 'TABLE_ORDERS', 1, 'TABLE_ORDERITEMS', 0, 0, 0, 0),
(8, 'addresses', 'TABLE_USERS', 1, 'TABLE_ADDRESSES', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pwd` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `_userstypes` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `pwd`, `_userstypes`) VALUES
(1, 'webadmin', 'webadmin', 7),
(2, 'ordersadmin', 'ordersadmin', 3);

-- --------------------------------------------------------

--
-- Table structure for table `usersdata`
--

CREATE TABLE IF NOT EXISTS `usersdata` (
`id` int(11) NOT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phonenumber` int(11) NOT NULL,
  `_users` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usersdata`
--

INSERT INTO `usersdata` (`id`, `name`, `surname`, `email`, `phonenumber`, `_users`) VALUES
(1, '', '', '', 0, 1),
(2, '', '', '', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `userstypes`
--

CREATE TABLE IF NOT EXISTS `userstypes` (
`id` int(11) NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `userstypes`
--

INSERT INTO `userstypes` (`id`, `type`) VALUES
(3, 'orders administrator'),
(7, 'web administrator');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
 ADD PRIMARY KEY (`id`), ADD KEY `_users` (`_users`);

--
-- Indexes for table `domelements`
--
ALTER TABLE `domelements`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itemcategories`
--
ALTER TABLE `itemcategories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
 ADD PRIMARY KEY (`id`), ADD KEY `_itemcategories` (`_itemcategories`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`), ADD KEY `_orders` (`_orders`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
 ADD PRIMARY KEY (`id`), ADD KEY `_users` (`_users`);

--
-- Indexes for table `relationships`
--
ALTER TABLE `relationships`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD KEY `_userstypes` (`_userstypes`);

--
-- Indexes for table `usersdata`
--
ALTER TABLE `usersdata`
 ADD PRIMARY KEY (`id`), ADD KEY `_users` (`_users`);

--
-- Indexes for table `userstypes`
--
ALTER TABLE `userstypes`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `domelements`
--
ALTER TABLE `domelements`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `itemcategories`
--
ALTER TABLE `itemcategories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `relationships`
--
ALTER TABLE `relationships`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `usersdata`
--
ALTER TABLE `usersdata`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `userstypes`
--
ALTER TABLE `userstypes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
ADD CONSTRAINT `addresses_users` FOREIGN KEY (`_users`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
ADD CONSTRAINT `items_itemcategories` FOREIGN KEY (`_itemcategories`) REFERENCES `itemcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orderitems`
--
ALTER TABLE `orderitems`
ADD CONSTRAINT `orderitems_orders` FOREIGN KEY (`_orders`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
ADD CONSTRAINT `orders_users` FOREIGN KEY (`_users`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
ADD CONSTRAINT `users_userstypes` FOREIGN KEY (`_userstypes`) REFERENCES `userstypes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `usersdata`
--
ALTER TABLE `usersdata`
ADD CONSTRAINT `usersdata_users` FOREIGN KEY (`_users`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
