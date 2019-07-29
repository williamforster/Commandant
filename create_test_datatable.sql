-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 29, 2019 at 12:08 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

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
-- Table structure for table `glutton_deleted`
--

CREATE TABLE `glutton_deleted` (
  `dot_euid` text NOT NULL COMMENT 'The euid/address of the lora transmitter eg 00:80:00:00:ab:cd:ef:00',
  `time` datetime NOT NULL,
  `longtitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `altitude` double DEFAULT NULL COMMENT 'meters above sea level',
  `fill` double DEFAULT NULL,
  `rssi` int(11) DEFAULT NULL,
  `snr` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `glutton_reading`
--

CREATE TABLE `glutton_reading` (
  `dot_euid` text NOT NULL COMMENT 'The euid/address of the lora transmitter eg 00:80:00:00:ab:cd:ef:00',
  `time` datetime NOT NULL,
  `longtitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `altitude` double DEFAULT NULL COMMENT 'meters above sea level',
  `fill` double DEFAULT NULL,
  `rssi` int(11) DEFAULT NULL,
  `snr` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `glutton_reading`
--

INSERT INTO `glutton_reading` (`dot_euid`, `time`, `longtitude`, `latitude`, `altitude`, `fill`, `rssi`, `snr`) VALUES
('00:80:00:00:de:ad:be:ef', '2019-03-19 06:06:24', 153.0118333, -27.4969329, 5, 0.0205, -50, 0),
('00:80:00:00:de:ad:be:ef', '2019-03-19 06:06:27', 153.0121566, -27.49687, 5, 0.021, -50, 0),
('00:80:00:00:de:ad:be:ef', '2019-03-19 06:06:21', 153.0116088, -27.4969778, 5, 0.03, -50, 0),
('00:80:00:00:de:ad:be:ef', '2019-03-19 06:06:06', 153.0116343, -27.498109, 5, 0.02, -50, 0),
('00:80:00:00:de:ad:be:ef', '2019-03-19 06:06:09', 153.0115189, -27.4979117, 5, 0.02, -50, 0),
('00:80:00:00:de:ad:be:ef', '2019-03-19 06:06:12', 153.0113112, -27.4977321, 5, 0.0201, -50, 0),
('00:80:00:00:de:ad:be:ef', '2019-03-19 06:06:15', 153.0114201, -27.4974986, 5, 0.0201, -50, 0),
('00:80:00:00:de:ad:be:ef', '2019-03-19 06:06:30', 153.0123901, -27.4967892, 5, 0.02102, -50, 0),
('00:80:00:00:de:ad:be:ef', '2019-03-19 06:06:33', 153.0126864, -27.4967263, 5, 0.02102, -50, 0),
('00:80:00:00:de:ad:be:ef', '2019-03-19 06:06:18', 153.011492, -27.4972381, 5, 0.0205, -50, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
