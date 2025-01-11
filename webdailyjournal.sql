-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2025 at 03:51 PM
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
(1, 'Eternal Love (Ten Miles of Peach Blossoms)', 'Genre: Fantasi, Romantis\r\n<br>Sinopsis: Mengisahkan cinta antara dewi dan manusia yang penuh rintangan, termasuk intrik dan pengorbanan. Drama ini dikenal dengan visual yang indah dan alur cerita yang emosional.', 'foto1.jpg', '2024-11-08 04:43:12', 'admin'),
(2, 'Nirvana in Fire', 'Genre: Sejarah, Thriller\r\n<br>Sinopsis: Menceritakan kisah balas dendam seorang jenius strategis yang menyamar untuk mengungkap kebenaran di balik kematian keluarganya, sekaligus berjuang dalam intrik politik kerajaan.', 'foto2.jpg', '2024-11-08 04:44:58', 'admin'),
(3, 'The Untamed', 'Genre: Fantasi, Aksi\r\n<br>Sinopsis: Diadaptasi dari novel populer, drama ini mengikuti petualangan dua pemuda di dunia martial arts yang penuh dengan konflik antara keluarga dan kekuatan jahat.', 'foto3.jpg', '2024-11-08 04:44:37', 'admin'),
(4, 'Put Your Head on My Shoulder', 'Genre: Romantis, Komedi\r\n<br>Sinopsis: Menceritakan kisah cinta antara seorang mahasiswi dan teman serumahnya yang terjadi secara tak terduga. Drama ini ringan dan penuh momen manis.', 'foto4.jpg', '2024-11-08 04:45:33', 'admin'),
(5, 'The King\'s Avatar', 'Genre: Aksi, Fantasi\r\n<br>Sinopsis: Berfokus pada dunia game online, drama ini mengikuti perjalanan seorang pro gamer yang mencoba bangkit kembali setelah dikhianati.', 'foto5.jpg', '2024-11-08 04:51:55', 'admin'),
(6, 'Hidden Love', 'Genre: Romantis, Komedi, Kehidupan\r\n<br>Sinopsis: Diadaptasi dari web novel karya Zhu Yi, Hidden Love mengisahkan Sang Zhi, perempuan yang jatuh cinta kepada teman kakaknya. Dahulu, Jia Xu sering datang ke rumah Sang Zhi untuk bermain di kamar kakaknya.\r\nNamun, mereka hilang kontak karena suatu alasan. Kini, Sang Zhi yang telah lulus SMA akhirnya masuk ke universitas di kota tempat Jia Xu berada. Mereka pun bertemu kembali dan akhirnya menyadari perasaan satu sama lain.', 'foto6.jpg', '2025-01-08 12:23:59', 'admin'),
(7, 'Only For Love', 'Genre: Bisnis, Komedi, Romantis\r\n<br>Sinopsis: Only For Love mengisahkan kerja sama antara reporter dengan pengusaha kaya yang berubah menjadi cinta. Shu Yi adalah reporter di sebuah penerbitan koran besar. Agar beritanya muncul di halaman depan, ia bertekad untuk mewawancara CEO perusahaan yang sedang ramai diperbincangkan.<br>\r\nShi Yan adalah pengusaha yang ingin membantu perusahaan-perusahaan start-up untuk berkembang. Ia merasa tawaran kerja sama yang diberikan Shu Yi dapat membantunya mewujudkan hal tersebut. Mereka awalnya bertemu hanya untuk urusan pekerjaan, hingga', 'foto7.jpg', '2025-01-08 12:23:27', 'admin'),
(8, 'Go Go Squid', 'Genre: Komedi, Romantis, Olahraga\r\n<br>Sinopsis: Drama ini mengisahkan seorang pria bernama Shang Yan yang berkecimpung di dunia e-sports. Ia membangun perusahaan e-sports sendiri untuk melatih para atlet profesional muda.<br>\r\nSementara Tong Nian adalah perempuan jenius di bidang ilmu komputer dan merupakan penyanyi online paruh waktu. Saat sedang membantu sepupunya di kafe, ia bertemu dengan Shang Yan dan jatuh cinta seketika.', 'foto8.jpg', '2025-01-08 16:23:52', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp(),
  `username` varchar(50) DEFAULT NULL,
  `gambar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `tanggal`, `username`, `gambar`) VALUES
(1, '2025-01-08 19:08:18', 'admin', 'foto1.jpg'),
(2, '2025-01-08 19:31:07', 'admin', 'foto2.jpg'),
(3, '2025-01-08 19:33:49', 'admin', 'foto3.jpg'),
(4, '2025-01-08 19:34:16', 'admin', 'foto4.jpg'),
(5, '2025-01-08 19:34:53', 'admin', 'foto5.jpg'),
(6, '2025-01-08 19:35:20', 'admin', 'foto6.jpg'),
(7, '2025-01-08 19:36:13', 'admin', 'foto7.jpg');

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
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'banner.jpg'),
(2, 'Fiola', '75ae61f45cde2e6b28f05bbf8303726d', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
