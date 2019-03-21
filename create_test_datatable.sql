-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 20, 2019 at 11:54 PM
-- Server version: 5.7.20
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartcampus`
--

-- --------------------------------------------------------

--
-- Table structure for table `glutton_reading`
--

CREATE TABLE `glutton_reading` (
  `dot_euid` text NOT NULL COMMENT 'The euid/address of the lora transmitter eg 00:80:00:00:ab:cd:ef:00',
  `time` datetime NOT NULL,
  `longtitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `fill` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `glutton_reading`
--

INSERT INTO `glutton_reading` (`dot_euid`, `time`, `longtitude`, `latitude`, `fill`) VALUES
('00:80:00:00:de:ad:be:ef', '2019-03-19 06:06:06', 153.012, -27.4982, 0),
('00:80:00:00:de:ad:be:ef', '2019-03-19 06:06:09', 153.012, -27.4982, 0),
('00:80:00:00:de:ad:be:ef', '2019-03-19 06:06:12', 153.012, -27.498, 0),
('00:80:00:00:de:ad:be:ef', '2019-03-19 06:06:15', 153.011, -27.4977, 0),
('00:80:00:00:de:ad:be:ef', '2019-03-19 06:06:18', 153.011, -27.4975, 0),
('00:80:00:00:de:ad:be:ef', '2019-03-19 06:06:21', 153.011, -27.4975, 0),
('00:80:00:00:de:ad:be:ef', '2019-03-19 06:06:24', 153.011, -27.4972, 0),
('00:80:00:00:de:ad:be:ef', '2019-03-19 06:06:27', 153.011, -27.4971, 0),
('00:80:00:00:de:ad:be:ef', '2019-03-19 06:06:30', 153.012, -27.497, 0),
('00:80:00:00:de:ad:be:ef', '2019-03-19 06:06:33', 153.012, -27.497, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
