-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2025 at 03:59 AM
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
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `bukus`
--

CREATE TABLE `bukus` (
  `Judul` varchar(50) NOT NULL,
  `Penulis` varchar(50) NOT NULL,
  `Penerbit` varchar(50) NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bukus`
--

INSERT INTO `bukus` (`Judul`, `Penulis`, `Penerbit`, `ID`) VALUES
('WInd Breaker ', 'Satoru Nii', 'Kodansha', 1),
('Naruto: The Last', 'Masashi Kishimoto', 'Shueisha', 2),
('Attack on Titan: Before the Fall', 'Ryo Suzukaze', 'Kodansha', 3),
('Your Name', 'Makoto Shinkai', 'Kadokawa Shoten', 4),
('Spirited Away: Art Book', 'Hayao Miyazaki', 'Tokuma Shoten', 5),
('Demon Slayer: Kimetsu no Yaiba', 'Koyoharu Gotouge', 'Shueisha', 6),
('One Piece: Strong World', 'Eiichiro Oda', 'Shueisha', 7),
('Death Note: Another Note', 'Nisio Isin', 'Shueisha', 8),
('Sword Art Online: Progressive', 'Reki Kawahara', 'ASCII Media Works', 9),
('Re:Zero - Starting Life in Another World', 'Tappei Nagatsuki', 'Media Factory', 10),
('No Game No Life', 'Yuu Kamiya', 'Media Factory', 11),
('BlueLock', 'Muneyuki Kaneshiro', 'Elex Media Komputindo', 12),
('Haikyu!!', 'Haruichi Furudate', 'Shueisha ', 13);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bukus`
--
ALTER TABLE `bukus`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bukus`
--
ALTER TABLE `bukus`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
