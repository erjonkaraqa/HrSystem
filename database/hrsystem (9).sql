-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2024 at 11:58 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hrsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `adress`
--

CREATE TABLE `adress` (
  `adress_id` int(11) NOT NULL,
  `address_type` varchar(200) DEFAULT NULL,
  `address_line_1` varchar(200) DEFAULT NULL,
  `address_line_2` varchar(200) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adress`
--

INSERT INTO `adress` (`adress_id`, `address_type`, `address_line_1`, `address_line_2`, `city`, `state`, `zip_code`, `country`, `user_id`) VALUES
(2, 'Work', 'Maxhunaj, Rr. Haxhi Nazifi Nr.20', 'Maxhunaj, Rr. Paqja Nr.30', 'Vushtrri', '02', 42000, 'Kosovo', 17),
(5, 'Visiting', 'Rr. Tringë Smajli Nr.55', '', 'Prishtina', '01', 51000, 'Kosovo', 17),
(16, 'Previous', 'Maxhunaj, Rr. Haxhi Nazifi', '', 'Vushtrri', '02', 42000, 'Kosovo', 17);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(200) NOT NULL,
  `emp_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `company_name`, `emp_num`) VALUES
(1, 'MetDaan', 100),
(2, 'StarLabs', 50);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL,
  `contact_type` varchar(200) NOT NULL,
  `details` varchar(100) NOT NULL,
  `primary_contact` tinyint(1) DEFAULT 0,
  `public` tinyint(1) DEFAULT 0,
  `emergency` tinyint(1) DEFAULT 0,
  `extra_info` varchar(500) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `contact_type`, `details`, `primary_contact`, `public`, `emergency`, `extra_info`, `user_id`) VALUES
(1, 'Email', 'mimoza@metdaan.com', 1, 1, 0, '', 1),
(2, 'Email', 'gezim@metdaan.com', 1, 1, 0, '', 4),
(3, 'Email', 'fatlind@metdaan.com', 1, 1, 0, '', 5),
(4, 'Email', 'arben@metdaan.com', 1, 1, 0, '', 8),
(5, 'Email', 'meriton@metdaan.com', 1, 1, 0, '', 9),
(6, 'Email', 'gazmend@metdaan.com', 1, 1, 0, '', 10),
(7, 'Email', 'granit@metdaan.com', 1, 1, 0, '', 11),
(8, 'Email', 'valmir@metdaan.com', 1, 1, 0, '', 12),
(9, 'Email', 'rinor@metdaan.com', 1, 1, 0, '', 15),
(10, 'Email', 'albin@metdaan.com', 1, 1, 0, '', 17),
(11, 'Email', 'arian@metdaan.com', 1, 1, 0, '', 19),
(12, 'Email', 'arbenita@metdaan.com', 1, 1, 0, '', 21),
(13, 'Email', 'elmedin@metdaan.com', 1, 1, 0, '', 26),
(30, 'Linkedin', 'https://www.linkedin.com/in/albin-smajli-534b92229/', 0, 0, 0, '', 17);

-- --------------------------------------------------------

--
-- Table structure for table `departament`
--

CREATE TABLE `departament` (
  `departament_id` int(11) NOT NULL,
  `departament_name` varchar(100) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departament`
--

INSERT INTO `departament` (`departament_id`, `departament_name`, `company_id`) VALUES
(1, 'Video Editing', 1),
(2, 'Publishing', 1),
(5, 'Management', 1),
(6, 'Business Development', 1),
(7, 'Researching', 1),
(8, 'E-commerce', 1),
(9, 'Finance', 1),
(12, 'BackEnd', 2);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `new_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `category` varchar(200) NOT NULL,
  `summary` varchar(200) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `publish_on` date NOT NULL,
  `until` date NOT NULL,
  `author` varchar(200) NOT NULL,
  `created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `position_id` int(11) NOT NULL,
  `position_name` varchar(100) NOT NULL,
  `Departament_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`position_id`, `position_name`, `Departament_ID`) VALUES
(1, 'CEO', 5),
(2, 'CFO', 5),
(5, 'Screenwriter/ Video researcher', 7),
(6, 'Video Editor', 1),
(9, 'Publisher', 2),
(13, 'Python dev', 12);

-- --------------------------------------------------------

--
-- Table structure for table `timeoff`
--

CREATE TABLE `timeoff` (
  `timeoff_id` int(11) NOT NULL,
  `annual_leave` double NOT NULL,
  `child_born` double NOT NULL,
  `death_of_family_member` double NOT NULL,
  `moving_day` double NOT NULL,
  `wedding_day` double NOT NULL,
  `sick_leave` double NOT NULL,
  `User_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `timeoff`
--

INSERT INTO `timeoff` (`timeoff_id`, `annual_leave`, `child_born`, `death_of_family_member`, `moving_day`, `wedding_day`, `sick_leave`, `User_ID`) VALUES
(3, 4, 0, 0, 0, 3, 17, 17),
(5, 10, 3, 3, 1, 3, 20, 12),
(7, 20, 3, 3, 1, 5, 20, 1),
(9, 20, 3, 3, 1, 5, 20, 4),
(10, 5, 3, 3, 1, 5, 20, 5),
(11, 20, 3, 3, 1, 5, 20, 8),
(12, 20, 3, 3, 1, 5, 20, 9),
(13, 20, 3, 3, 1, 5, 20, 10),
(14, 20, 3, 3, 1, 5, 20, 11),
(15, 20, 3, 3, 1, 5, 20, 15),
(16, 20, 3, 3, 1, 5, 20, 19),
(17, 20, 3, 3, 1, 5, 20, 21);

-- --------------------------------------------------------

--
-- Table structure for table `timeoffrequests`
--

CREATE TABLE `timeoffrequests` (
  `request_id` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Head_ID` int(11) NOT NULL,
  `leave_type` varchar(500) NOT NULL,
  `from` date NOT NULL,
  `to` date NOT NULL,
  `duration` int(11) NOT NULL,
  `short_description` varchar(500) NOT NULL,
  `reason` varchar(500) NOT NULL,
  `status` varchar(100) NOT NULL,
  `checkedby` int(11) DEFAULT NULL,
  `checkDate` date DEFAULT NULL,
  `created` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `timeoffrequests`
--

INSERT INTO `timeoffrequests` (`request_id`, `User_ID`, `Head_ID`, `leave_type`, `from`, `to`, `duration`, `short_description`, `reason`, `status`, `checkedby`, `checkDate`, `created`) VALUES
(8, 17, 21, 'Wedding Day', '2023-12-29', '2023-12-30', 2, '.', '.', 'Approved', 17, '2024-08-05', '2023-12-26'),
(14, 17, 21, 'Child Born', '2024-01-03', '2024-01-12', 9, '.', '.', 'Approved', 21, '2024-01-02', '2024-01-01'),
(15, 17, 21, 'Wedding Day', '2024-01-07', '2024-01-07', 1, '.', '.', 'Approved', 17, '2024-04-08', '2024-01-03'),
(19, 17, 21, 'annual_leave', '2024-01-17', '2024-01-30', 13, 'Leave', '.', 'Approved', 17, '2024-04-06', '2024-01-13'),
(20, 5, 17, 'annual_leave', '2024-01-10', '2024-01-19', 9, 'Leave', '.', 'Approved', 17, '2024-04-06', '2024-01-08'),
(21, 17, 21, 'Wedding Day', '2024-01-13', '2024-01-15', 2, 'Darsma', '.', 'Approved', 17, '2024-04-06', '2024-01-09'),
(22, 17, 21, 'Moving Day', '2024-01-16', '2024-01-17', 1, 'Zhvendosje ', 'Zhvendosje nga vendbanimi aktual', 'Approved', 17, '2024-04-06', '2023-01-14'),
(37, 17, 21, 'Annual Leave', '2024-04-02', '2024-04-03', 1, 'adasa', 'asdsadsa', 'Approved', 17, '2024-04-06', '2024-04-01'),
(38, 17, 21, 'Annual Leave', '2024-04-02', '2024-04-03', 1, 'test', 'test', 'Approved', 17, '2024-04-06', '2024-04-01'),
(39, 5, 17, 'Annual Leave', '2024-04-01', '2024-04-03', 2, 'sdasd', 'asdasda', 'Approved', 17, '2024-04-14', '2024-04-01'),
(57, 17, 21, 'Death of Family Member', '2024-04-06', '2024-04-09', 3, 'sda', 'asdsa', 'Approved', 17, '2024-04-06', '2024-04-06'),
(58, 17, 21, 'Child Born', '2024-04-06', '2024-04-09', 3, 'child', 'child', 'Approved', 17, '2024-04-06', '2024-04-06'),
(59, 17, 21, 'Sick Leave', '2024-04-06', '2024-04-25', 19, 'sick', 'sick', 'Approved', 17, '2024-04-06', '2024-04-06'),
(60, 17, 21, 'Moving Day', '2024-04-06', '2024-04-08', 2, 'as', 'as', 'Approved', 17, '2024-04-06', '2024-04-06'),
(61, 17, 21, 'Child Born', '2024-04-06', '2024-04-08', 2, 'child', 'child', 'Declined', 17, '2024-04-06', '2024-04-06'),
(62, 17, 21, 'Annual Leave', '2024-04-06', '2024-04-07', 1, 'asd', 'asd', 'Approved', 17, '2024-04-06', '2024-04-06'),
(63, 17, 21, 'Sick Leave', '2024-04-06', '2024-04-20', 14, 'as', 'as', 'Declined', 17, '2024-04-06', '2024-04-06'),
(64, 17, 21, 'Sick Leave', '2024-04-06', '2024-04-16', 10, 'as', 'as', 'Declined', 17, '2024-04-06', '2024-04-06'),
(65, 17, 21, 'Annual Leave', '2024-04-06', '2024-04-07', 1, 'as', 'as', 'Approved', 17, '2024-04-14', '2024-04-06'),
(66, 17, 21, 'Child Born', '2024-04-06', '2024-04-09', 3, 's', 's', 'Approved', 17, '2024-04-06', '2024-04-06'),
(67, 17, 21, 'Death of Family Member', '2024-04-06', '2024-04-09', 3, 'asa', 'asas', 'Approved', 17, '2024-04-06', '2024-04-06'),
(68, 17, 21, 'Moving Day', '2024-04-06', '2024-04-07', 1, 'asdasd', 'asdasa', 'Approved', 17, '2024-04-06', '2024-04-06'),
(69, 17, 21, 'Wedding Day', '2024-04-06', '2024-04-11', 5, 'dasma', 'dasma', 'Approved', 17, '2024-04-14', '2024-04-06'),
(70, 17, 21, 'Sick Leave', '2024-04-06', '2024-04-09', 3, 'Leave', 'sick', 'Declined', 17, '2024-04-14', '2024-04-06'),
(71, 17, 21, 'Annual Leave', '2024-04-11', '2024-04-15', 4, 'Pushime ', 'Pushime jasht vendit', 'Approved', 17, '2024-04-14', '2024-04-08'),
(72, 17, 21, 'Annual Leave', '2024-04-10', '2024-04-12', 2, 'as', 'as', 'Approved', 17, '2024-04-08', '2024-04-08'),
(73, 17, 21, 'Annual Leave', '2024-04-09', '2024-04-12', 3, 'pushim', 'Pushime jasht vendit', 'Approved', 17, '2024-04-09', '2024-04-09'),
(74, 17, 21, 'Annual Leave', '2024-04-24', '2024-04-27', 3, 'as', 'as', 'Approved', 17, '2024-04-09', '2024-04-09'),
(75, 17, 21, 'Annual Leave', '2024-04-25', '2024-04-29', 4, 'as', 'as', 'Approved', 17, '2024-04-09', '2024-04-09'),
(76, 17, 21, 'Annual Leave', '2024-05-13', '2024-05-16', 3, 'q', 'q', 'Approved', 17, '2024-08-05', '2024-05-13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(100) NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `surname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(500) NOT NULL,
  `Position_ID` int(11) NOT NULL,
  `Departament_ID` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `location` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `report_to` int(11) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `born` date DEFAULT NULL,
  `started` date DEFAULT NULL,
  `adress` int(11) DEFAULT NULL,
  `company` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `image`, `name`, `surname`, `email`, `password`, `Position_ID`, `Departament_ID`, `role`, `location`, `status`, `report_to`, `gender`, `born`, `started`, `adress`, `company`) VALUES
(1, NULL, 'Mimoza', 'Nuka', 'mimoza@metdaan.com', '$2y$10$biyuRS2zYJqR6AQhljHKm.leMoUZvs6DkCwkWbj9Xl7sq2vn8iCJW', 9, 1, 0, 'Main Office', 'Full Time', 1, 'Fmale', NULL, NULL, NULL, 1),
(4, NULL, 'Gezim', 'Berisha', 'gezim@metdaan.com', '$2y$10$Dpoy8PwyXVdz4p4xsMsoP./8fC9p8jcRx.kEMgdsT9IUpB5vsTTla', 1, 5, 0, 'Main Office', 'Full Time', 1, 'Male', NULL, NULL, NULL, 1),
(5, NULL, 'Fatlind', 'Rashica', 'fatlind@metdaan.com', '$2y$10$yIkR0ZKjZPbik1BDXS9/JOsE6C7PT0hJ4nDX0BNDez8X.vpECUUOO', 6, 1, 0, 'Main Office', 'Full Time', 17, 'Male', NULL, NULL, NULL, 1),
(8, NULL, 'Arben', 'Berisha', 'arben@metdaan.com', '$2y$10$aX4t7/Rb.8TNYHQO1hCLnu8qA1JKp6RvBuQdid4nMjrbmrC74bH.C', 2, 5, 0, 'Main Office', 'Full Time', 1, 'Male', NULL, NULL, NULL, 1),
(9, NULL, 'Meriton', 'Feka', 'meriton@metdaan.com', '$2y$10$t4RQUE7iXMbHSSYPj2iEm.bSMICn1us06nZ.DuBHz.YJKcAEvcTWm', 6, 1, 0, 'Main Office', 'Full Time', 1, 'Male', NULL, NULL, NULL, 1),
(10, NULL, 'Gazmend', 'Berisha', 'gazmend@metdaan.com', '$2y$10$3tEdolNwZUIdoPpZ8xReC.bt.f6dDyQQodDXNgG6Pt3gBvkV837QO', 9, 2, 0, 'Main Office', 'Full Time', 1, 'Male', NULL, NULL, NULL, 1),
(11, NULL, 'Granit', 'Gashi', 'granit@metdaan.com', '$2y$10$GuSEiN4Nlu6rewrEnpsTj.Xq9nsjklkqQSoFLaAShWdiVTzobmarS', 9, 2, 0, 'Main Office', 'Full Time', 1, 'Male', NULL, NULL, NULL, 1),
(12, NULL, 'Valmir', 'Leci', 'valmir@metdaan.com', '$2y$10$PlRdBusrrxqTvN1Dw2qjn.iEHeLFg1Qi99i69CuoZCqMGBjhe8fSC', 6, 1, 0, 'Main Office', 'Full Time', 17, 'Male', NULL, NULL, NULL, 1),
(15, NULL, ' Rinor', 'Berisha', 'rinor@metdaan.com', '$2y$10$PB6FHjvF3PbIsu/Lz9k1huXmA1Go2Dr/thStoa6ht9G0U1dLMWWbm', 1, 5, 0, 'Main Office', 'Full Time', 1, 'Male', NULL, NULL, NULL, 1),
(17, 'profil.jpg', 'Albin', 'Smajli', 'albin@metdaan.com', '$2y$10$bV9bJI.VRbsO98/wnSGvkOiTk3XCqFBN1PEwzqBvTI0Bb.ubZa49C', 5, 7, 1, 'Main Office', 'Full Time', 21, 'Male', '2002-11-27', '2023-03-01', NULL, 1),
(19, NULL, 'Arian', 'Mehmeti', 'arian@metdaan.com', '$2y$10$25BKuMIaT9R9UTN32iwLzOJPsDacreCFxYDW8Mn6o/icaDxP/Tu0u', 6, 1, 0, 'Main Office', 'Full Time', 1, 'Male', NULL, NULL, NULL, 1),
(21, NULL, 'Arbenita', 'Krasniqi', 'arbenita@metdaan.com', '$2y$10$yIkR0ZKjZPbik1BDXS9/JOsE6C7PT0hJ4nDX0BNDez8X.vpECUUOO', 1, 5, 0, 'Production', 'Full Time', 8, 'Fmale', NULL, NULL, NULL, 1),
(26, NULL, 'Elmedin', 'Smajli', 'elmedin@metdaan.com', '$2y$10$VXKGv7kvu/NN3bNENmBk8OcAxVlss1TyYYordncP.Ey2GAsczszFS', 6, 1, 0, 'Main Office', 'Full Time', 19, 'Fmale', '2008-09-29', '2024-05-15', NULL, 1),
(28, NULL, 'Endrit', 'Saiti', 'endrit@starlabs.com', '$2y$10$bV9bJI.VRbsO98/wnSGvkOiTk3XCqFBN1PEwzqBvTI0Bb.ubZa49C', 13, 12, 0, 'Main Office', 'Full Time', 28, NULL, NULL, NULL, NULL, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adress`
--
ALTER TABLE `adress`
  ADD PRIMARY KEY (`adress_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`),
  ADD KEY `contact` (`user_id`);

--
-- Indexes for table `departament`
--
ALTER TABLE `departament`
  ADD PRIMARY KEY (`departament_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`new_id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`position_id`),
  ADD KEY `Departament_ID` (`Departament_ID`);

--
-- Indexes for table `timeoff`
--
ALTER TABLE `timeoff`
  ADD PRIMARY KEY (`timeoff_id`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `timeoffrequests`
--
ALTER TABLE `timeoffrequests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `timeoffrequests_ibfk_1` (`Head_ID`),
  ADD KEY `timeoffrequests_ibfk_2` (`checkedby`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `report_to` (`report_to`),
  ADD KEY `adress` (`adress`),
  ADD KEY `company` (`company`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adress`
--
ALTER TABLE `adress`
  MODIFY `adress_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `departament`
--
ALTER TABLE `departament`
  MODIFY `departament_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `new_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `timeoff`
--
ALTER TABLE `timeoff`
  MODIFY `timeoff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `timeoffrequests`
--
ALTER TABLE `timeoffrequests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `departament`
--
ALTER TABLE `departament`
  ADD CONSTRAINT `company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `position`
--
ALTER TABLE `position`
  ADD CONSTRAINT `Departament_ID` FOREIGN KEY (`Departament_ID`) REFERENCES `departament` (`departament_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `timeoff`
--
ALTER TABLE `timeoff`
  ADD CONSTRAINT `timeoff_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `timeoffrequests`
--
ALTER TABLE `timeoffrequests`
  ADD CONSTRAINT `User_ID` FOREIGN KEY (`User_ID`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `timeoffrequests_ibfk_1` FOREIGN KEY (`Head_ID`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `timeoffrequests_ibfk_2` FOREIGN KEY (`checkedby`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `adress` FOREIGN KEY (`adress`) REFERENCES `adress` (`adress_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `company` FOREIGN KEY (`company`) REFERENCES `company` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `report_to` FOREIGN KEY (`report_to`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
