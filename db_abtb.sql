-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2023 at 12:34 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_abtb`
--

-- --------------------------------------------------------

--
-- Table structure for table `bis`
--

CREATE TABLE `bis` (
  `kode_bis` int(11) NOT NULL,
  `nama_bis` varchar(40) NOT NULL,
  `kursi` varchar(20) NOT NULL,
  `jam_berangkat` time NOT NULL,
  `kelas` enum('Premium','Reguler') NOT NULL,
  `harga` int(25) NOT NULL,
  `keterangan` text NOT NULL,
  `rute` text NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bis`
--

INSERT INTO `bis` (`kode_bis`, `nama_bis`, `kursi`, `jam_berangkat`, `kelas`, `harga`, `keterangan`, `rute`, `image`) VALUES
(10, 'TransJabodetabek Jakarta', '20', '09:00:00', 'Premium', 30000, 'Ac, Hiburan, Kursi Recliner, Hotspot\r\n\r\nRute\r\n\r\nBundaran HI - Summarecon Mall Bekasi \r\n', 'Jakarta - Bekasi', 'TJimage.jpg'),
(11, 'TransJabodetabek Jakarta', '20', '15:00:00', 'Reguler', 15000, 'Ac, Kursi Recliner\r\n\r\nRute\r\n\r\nBundaran HI - Summarecon Mall Bekasi', 'Jakarta - Bekasi', 'TJimage.jpg'),
(12, 'TransJabodetabek Jakarta', '20', '08:00:00', 'Premium', 30000, 'Ac, Hiburan, Kursi Recliner, Hotspot', 'Jakarta - Tangerang', 'TJimage.jpg'),
(13, 'TransJabodetabek Jakarta', '20', '15:00:00', 'Reguler', 15000, 'Ac, Kursi Recliner', 'Jakarta - Tangerang', 'TJimage.jpg'),
(14, 'TransJabodetabek Jakarta', '20', '09:00:00', 'Premium', 30000, 'Ac, Hiburan, Kursi Recliner, Hotspot', 'Jakarta - Depok', 'TJimage.jpg'),
(15, 'TransJabodetabek Jakarta', '20', '16:00:00', 'Reguler', 15000, 'Ac, Kursi Recliner', 'Jakarta - Depok', 'TJimage.jpg'),
(16, 'TransJabodetabek Jakarta', '20', '07:00:00', 'Premium', 30000, 'Ac, Hiburan, Kursi Recliner, Hotspot', 'Jakarta - Bogor', 'TJimage.jpg'),
(17, 'TransJabodetabek Jakarta', '20', '12:30:00', 'Reguler', 15000, 'Ac, Kursi Recliner', 'Jakarta - Bogor', 'TJimage.jpg'),
(18, 'TransJabodetabek Bekasi', '20', '06:40:00', 'Premium', 30000, 'Ac, Hiburan, Kursi Recliner, Hotspot\r\nRute\r\nSummarecon Mall Bekasi - Bundaran HI', 'Bekasi - Jakarta', 'TJimageBksi.jpg'),
(19, 'TransJabodetabek Bekasi', '20', '05:00:00', 'Reguler', 15000, 'Ac, Kursi Recliner\r\nRute\r\nSummarecon Mall Bekasi - Bundaran HI', 'Bekasi - Jakarta', 'TJimageBksi.jpg'),
(20, 'TransJabodetabek Bekasi', '20', '07:30:00', 'Premium', 30000, 'Ac, Hiburan, Kursi Recliner, Hotspot', 'Bekasi - Tangerang', 'TJimageBksi.jpg'),
(21, 'TransJabodetabek Bekasi', '20', '09:00:00', 'Reguler', 15000, 'Ac, Kursi Recliner', 'Bekasi - Tangerang', 'TJimageBksi.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pesan`
--

CREATE TABLE `detail_pesan` (
  `id_pesan` varchar(11) NOT NULL,
  `kode_bis` int(11) NOT NULL,
  `harga` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `detail_pesan`
--

INSERT INTO `detail_pesan` (`id_pesan`, `kode_bis`, `harga`) VALUES
('ABTB001', 10, 'Rp.30.000'),
('ABTB002', 11, 'Rp.25.000');

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id_pesan` varchar(11) NOT NULL,
  `email` varchar(35) NOT NULL,
  `kode_bis` int(11) NOT NULL,
  `rute` text NOT NULL,
  `harga` int(255) NOT NULL,
  `tgl_berangkat` date NOT NULL,
  `jam_berangkat` time NOT NULL,
  `kursi` enum('1','2','3','4') NOT NULL,
  `status` enum('sudah terbayar','menunggu pembayaran') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pemesanan`
--

INSERT INTO `pemesanan` (`id_pesan`, `email`, `kode_bis`, `rute`, `harga`, `tgl_berangkat`, `jam_berangkat`, `kursi`, `status`) VALUES
('ABTB008', 'muhammadbiben@gmail.com', 19, 'Bekasi - Jakarta', 15000, '2019-06-30', '05:00:00', '4', 'menunggu pembayaran'),
('ABTB009', 'sofyanarifin@gmail.com', 20, 'Bekasi - Tangerang', 30000, '2019-06-24', '07:30:00', '4', 'menunggu pembayaran'),
('ABTB011', 'awalnp@gmail.com', 16, 'Jakarta - Bogor', 30000, '2019-06-24', '07:00:00', '2', 'menunggu pembayaran'),
('ABTB012', 'awalnp@gmail.com', 17, 'Jakarta - Bogor', 15000, '2019-06-30', '12:30:00', '2', 'menunggu pembayaran'),
('ABTB013', 'muhammadilyas@gmail.com', 11, 'Jakarta - Bekasi', 15000, '2019-06-17', '15:00:00', '2', 'menunggu pembayaran'),
('ABTB015', 'muhammadilyas@gmail.com', 10, 'Jakarta - Bekasi', 30000, '2019-06-20', '09:00:00', '3', 'menunggu pembayaran'),
('ABTB018', 'miko@gmail.com', 10, 'Jakarta - Bekasi', 30000, '2023-11-17', '09:00:00', '3', 'menunggu pembayaran');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id_role` int(1) NOT NULL,
  `nama_role` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id_role`, `nama_role`) VALUES
(1, 'administrator'),
(2, 'penumpang');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_pesan` varchar(11) NOT NULL,
  `email` varchar(35) NOT NULL,
  `kode_bis` int(11) NOT NULL,
  `tgl_berangkat` date NOT NULL,
  `kursi` enum('1','2','3','4') NOT NULL,
  `status` enum('belum terbayar','sudah terbayar') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_pesan`, `email`, `kode_bis`, `tgl_berangkat`, `kursi`, `status`) VALUES
('ABTB000', 'sofyanarifin@gmail.com', 20, '2019-05-01', '2', 'sudah terbayar'),
('ABTB001', 'muhammadilyas@gmail.com', 12, '2019-06-23', '2', 'sudah terbayar'),
('ABTB002', 'awal.np@gmail.com', 16, '2019-06-01', '3', 'sudah terbayar'),
('ABTB003', 'muhammadbiben@gmail.com', 10, '2019-06-05', '2', 'sudah terbayar'),
('ABTB004', 'muhammadilyas@gmail.com', 17, '2019-06-01', '2', 'sudah terbayar');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(2) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(50) NOT NULL,
  `id_role` int(1) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `no_telp`, `email`, `password`, `id_role`, `image`) VALUES
(10, 'Yaya Arif Mustofa', '087888213', 'yaya@gmail.com', '25d55ad283aa400af464c76d713c07ad', 1, 'default.jpg'),
(11, 'Miko Alfian', '0892331312', 'miko@gmail.com', '25d55ad283aa400af464c76d713c07ad', 2, 'default.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bis`
--
ALTER TABLE `bis`
  ADD PRIMARY KEY (`kode_bis`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_role` (`id_role`);

--
-- Indexes for table `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bis`
--
ALTER TABLE `bis`
  MODIFY `kode_bis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
