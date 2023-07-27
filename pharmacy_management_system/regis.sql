SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `cart_qty` int(11) NOT NULL,
  `cart_stock_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cart_uniqid` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `expired` (
  `exp_id` int(11) NOT NULL,
  `exp_itemName` varchar(50) NOT NULL,
  `exp_itemPrice` float NOT NULL,
  `exp_itemQty` int(11) NOT NULL,
  `exp_expiredDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `expired` (`exp_id`, `exp_itemName`, `exp_itemPrice`, `exp_itemQty`, `exp_expiredDate`) VALUES
(1, 'dolo', 50, 7, '2023-08-18'),
(2, 'crocin', 40, 12, '2023-03-23'),
(3, 'sipons', 35, 3, '2023-03-31'),
(4, 'brutacross', 55, 34, '2023-04-14'),
(5, 'cefix', 45, 13, '2023-04-21'),
(6, 'betamine', 95, 23, '2023-04-12'),
(7, 'calapure', 80, 25, '2023-04-08'),
(8, 'fendrop', 120, 30, '2023-04-08'),
(9, 'trofenyl', 110, 23, '2023-05-04'),
(10, 'Ascoril-D', 40, 3, '2024-06-23');

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `item_price` double NOT NULL,
  `item_type_id` int(11) NOT NULL,
  `item_code` varchar(35) NOT NULL,
  `item_brand` varchar(50) NOT NULL,
  `item_grams` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `item` (`item_id`, `item_name`, `item_price`, `item_type_id`, `item_code`, `item_brand`, `item_grams`) VALUES
(1, 'sipons', 35, 1, '1001', 'Brand Ni Siya', '500gm'),
(2, 'Ascoril-D', 40, 2, '1002', 'Dharma Medical', '500ml'),
(3, 'tyrophyl', 85, 1, '1003', 'Rakso Medical', '250gm'),
(4, 'Nyrofil-F', 70, 2, '1004', 'Cipla Medical', '500ml');


CREATE TABLE `item_type` (
  `item_type_id` int(11) NOT NULL,
  `item_type_desc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `item_type` (`item_type_id`, `item_type_desc`) VALUES
(1, 'Tablet'),
(2, 'Syrup'),
(3, 'Test');

CREATE TABLE `sales` (
  `sales_id` int(11) NOT NULL,
  `item_code` varchar(35) NOT NULL,
  `generic_name` varchar(35) NOT NULL,
  `brand` varchar(35) NOT NULL,
  `gram` varchar(35) NOT NULL,
  `type` varchar(35) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL,
  `date_sold` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `sales` (`sales_id`, `item_code`, `generic_name`, `brand`, `gram`, `type`, `qty`, `price`, `date_sold`) VALUES
(1, '1001', 'sipons', 'Brand Ni Siya', '500gm', 'Tablet', 4, 35, '2022-10-16 10:30:52'),
(2, '1002', 'Ascoril-D', 'Cipla Medical', '500gm', 'Syrup', 2, 60, '2022-10-16 10:44:32'),
(3, '1005', 'Acyclovir', 'Brand Ni Siya', '500gm', 'Tablet', 3, 50, '2022-10-16 10:30:25'),
(4, '1054', 'Ganguard', 'Brand Ni Siya', '500gm', 'Tablet', 1, 90, '2022-10-16 10:55:25'),
(5, '1076', 'Honitus', 'Ayurved Essentials Ltd', '500ml', 'Syrup', 2, 150, '2022-10-16 10:53:44'),
(6, '1034', 'Verofil', 'Cipla Medical', '500ml', 'Syrup', 1, 100, '2022-10-16 10:56:35'),
(7, '1100', 'Feranyl-O', 'Rakso Medical', '500ml', 'Syrup', 1, 70, '2022-10-16 10:57:28'),
(8, '1021', 'Telaprvir', 'Brand Ni Siya', '500gm', 'Tablet', 1, 70, '2022-10-16 10:47:47'),
(9, '1009', 'Nicardipine', 'Brand Ni Siya', '500gm', 'Tablet', 2, 55, '2022-10-16 10:46:33'),
(10, '1034', 'Hyosonyl-P', 'Rakso Medical', '500ml', 'Syrup', 1, 100, '2022-10-16 10:52:32'),
(11, '1004', 'Nyrofil-F', 'Cipla Medical', '500ml', 'Syrup', 1, 15, '2022-03-28 07:04:50'),
(12, '1010', 'Hyoscine', 'Pharma Ltd', '500gm', 'Tablet', 2, 65, '2022-10-16 10:42:55');

-- --------------------------------------------------------
CREATE TABLE `stock` (
  `stock_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `stock_qty` int(11) NOT NULL,
  `stock_expiry` date NOT NULL,
  `stock_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `stock_manufactured` date NOT NULL,
  `stock_purchased` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `stock` (`stock_id`, `item_id`, `stock_qty`, `stock_expiry`, `stock_added`, `stock_manufactured`, `stock_purchased`) VALUES
(7, 3, 21, '2023-04-22', '2021-04-18 03:11:15', '2020-04-20', '2022-04-14');

-- --------------------------------------------------------
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_account` varchar(50) NOT NULL,
  `user_pass` varchar(35) NOT NULL,
  `user_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `user` (`user_id`, `user_account`, `user_pass`, `user_type`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1),
(2, 'admin2', '21232f297a57a5a743894a0e4a801fc3', 1);

ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `user_id` (`user_id`);


ALTER TABLE `expired`
  ADD PRIMARY KEY (`exp_id`);


ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `item_type_id` (`item_type_id`);


ALTER TABLE `item_type`
  ADD PRIMARY KEY (`item_type_id`);


ALTER TABLE `sales`
  ADD PRIMARY KEY (`sales_id`);

ALTER TABLE `stock`
  ADD PRIMARY KEY (`stock_id`),
  ADD KEY `item_id` (`item_id`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `expired`
  MODIFY `exp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `item_type`
  MODIFY `item_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `sales`
  MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

ALTER TABLE `stock`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`item_type_id`) REFERENCES `item_type` (`item_type_id`);

ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
