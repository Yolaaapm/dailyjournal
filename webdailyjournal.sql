-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2025 at 08:59 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webdailyjournal`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `judul` text DEFAULT NULL,
  `isi` text DEFAULT NULL,
  `gambar` text DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `judul`, `isi`, `gambar`, `tanggal`, `username`) VALUES
(1, 'Eternal Love (Ten Miles of Peach Blossoms)', 'Genre: Fantasi, Romantis\r\n<br>Sinopsis: Mengisahkan cinta antara dewi dan manusia yang penuh rintangan, termasuk intrik dan pengorbanan. Drama ini dikenal dengan visual yang indah dan alur cerita yang emosional.', 'foto1.jpg', '2024-11-08 04:43:12', 'Fiola'),
(2, 'Nirvana in Fire', 'Genre: Sejarah, Thriller\r\n<br>Sinopsis: Menceritakan kisah balas dendam seorang jenius strategis yang menyamar untuk mengungkap kebenaran di balik kematian keluarganya, sekaligus berjuang dalam intrik politik kerajaan.', 'foto2.jpg', '2024-11-08 04:44:58', 'Fiola'),
(3, 'The Untamed', 'Genre: Fantasi, Aksi\r\n<br>Sinopsis: Diadaptasi dari novel populer, drama ini mengikuti petualangan dua pemuda di dunia martial arts yang penuh dengan konflik antara keluarga dan kekuatan jahat.', 'foto3.jpg', '2024-11-08 04:44:37', 'Fiola'),
(4, 'Put Your Head on My Shoulder', 'Genre: Romantis, Komedi\r\n<br>Sinopsis: Menceritakan kisah cinta antara seorang mahasiswi dan teman serumahnya yang terjadi secara tak terduga. Drama ini ringan dan penuh momen manis.', 'foto4.jpg', '2024-11-08 04:45:33', 'Fiola'),
(5, 'The King\'s Avatar', 'Genre: Aksi, Fantasi\r\n<br>Sinopsis: Berfokus pada dunia game online, drama ini mengikuti perjalanan seorang pro gamer yang mencoba bangkit kembali setelah dikhianati.', 'foto5.jpg', '2024-11-08 04:51:55', 'Fiola');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `foto`) VALUES
(1, 'Fiola', '75ae61f45cde2e6b28f05bbf8303726d', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
