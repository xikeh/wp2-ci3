-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2023 at 08:53 AM
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
(10, 'KWA pariwisata', '20', '10:30:00', 'Premium', 1500000, 'Ac, Hiburan, Kursi Recliner, Hotspot', 'Jakarta - Bekasi', 'KWA.jpg'),
(11, 'Nagita Transport', '20', '15:00:00', 'Premium', 185000, 'Ac, Kursi Recliner, Wc', 'Jakarta - Salatiga', 'nagita_transport.jpg'),
(12, 'PO. Haryanto', '20', '08:00:00', 'Premium', 165000, 'Ac, Hiburan, Kursi Recliner, Hotspot', 'Bandung - Yogyakarta', 'Haryanto.jpg'),
(13, 'PO. Raya', '20', '17:00:00', 'Premium', 200000, 'Ac, Kursi Recliner, Wc', 'Jakarta - Tangerang', 'Raya.jpg'),
(14, 'Gunung Mulia', '20', '18:30:00', 'Premium', 175000, 'Ac, Hiburan, Kursi Recliner, Hotspot', 'Jakarta - Semarang', 'gunung_mulia.jpg'),
(16, 'Gunung Harta', '20', '07:00:00', 'Premium', 150000, 'Ac, Hiburan, Kursi Recliner, Hotspot', 'Jakarta - Klaten', 'Gunung-Harta.png'),
(17, 'PO. Pandawa', '20', '12:30:00', 'Reguler', 15000, 'Ac, Kursi Recliner', 'Bogor - Surakarta', 'Mercedes-Benz_O500RS____Jetbus_3+_Supe_High_Decker_-_Indonesia_buses.jpg'),
(19, 'PO. MilenialBus', '20', '01:38:00', 'Premium', 200000, 'Ac, Kursi Recliner', 'Bali - Papua', 'Jetbus_3_SDD.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id_pesan` varchar(255) NOT NULL,
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
('ABTB017', 'dimas@gmail.com', 10, 'Jakarta - Bekasi', 30000, '2023-11-25', '09:00:00', '1', 'menunggu pembayaran'),
('bus-ad271d3211', 'miko@gmail.com', 11, 'Jakarta - Salatiga', 185000, '2023-11-20', '15:00:00', '3', 'menunggu pembayaran');

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
  `id_pesan` varchar(255) NOT NULL,
  `email` varchar(35) NOT NULL,
  `kode_bis` int(11) NOT NULL,
  `rute` text NOT NULL,
  `harga` int(255) NOT NULL,
  `tgl_berangkat` date NOT NULL,
  `jam_berangkat` time NOT NULL,
  `kursi` enum('1','2','3','4') NOT NULL,
  `status` enum('belum terbayar','sudah terbayar') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_pesan`, `email`, `kode_bis`, `rute`, `harga`, `tgl_berangkat`, `jam_berangkat`, `kursi`, `status`) VALUES
('bus-07216c228028fc838a1411', 'miko@gmail.com', 11, 'Jakarta - Bekasi', 15000, '2023-11-16', '15:00:00', '1', 'sudah terbayar'),
('bus-1b9e9e6810', 'miko@gmail.com', 10, 'Jakarta - Bekasi', 30000, '2023-11-16', '10:30:00', '1', 'sudah terbayar'),
('bus-34a2c6cd12', 'miko@gmail.com', 12, 'Bandung - Yogyakarta', 165000, '2023-11-22', '08:00:00', '1', 'sudah terbayar'),
('bus-62a4d33111', 'miko@gmail.com', 11, 'Jakarta - Bekasi', 15000, '2023-11-21', '15:00:00', '1', 'sudah terbayar'),
('bus-6a83f12a10', 'miko@gmail.com', 10, 'Jakarta - Bekasi', 30000, '2023-11-10', '10:30:00', '1', 'sudah terbayar'),
('bus-9816b8e310', 'miko@gmail.com', 10, 'Jakarta - Bekasi', 1500000, '2023-11-28', '10:30:00', '1', 'sudah terbayar'),
('bus-a140f83910', 'miko@gmail.com', 10, 'Jakarta - Bekasi', 30000, '2023-11-16', '10:30:00', '3', 'sudah terbayar'),
('bus-ae37580e10', 'toper@gmail.com', 10, 'Jakarta - Bekasi', 1500000, '2023-11-23', '10:30:00', '4', 'sudah terbayar'),
('bus-b7bd138710', 'miko@gmail.com', 10, 'Jakarta - Bekasi', 30000, '2023-11-17', '10:30:00', '1', 'sudah terbayar'),
('bus-c5fd854b10', 'miko@gmail.com', 10, 'Jakarta - Bekasi', 1500000, '2023-11-17', '10:30:00', '3', 'sudah terbayar'),
('bus-dc3ba01510', 'andre@gmail.com', 10, 'Jakarta - Bekasi', 1500000, '2023-11-14', '10:30:00', '3', 'sudah terbayar');

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
(10, 'Yaya Arif Mustofa', '01238071298', 'yaya@gmail.com', '202cb962ac59075b964b07152d234b70', 1, 'default.jpg'),
(11, 'Miko Alfian', '0892331312', 'miko@gmail.com', '202cb962ac59075b964b07152d234b70', 2, 'default.jpg'),
(12, 'Dodi Alfayet', '123124', 'yayaarif4@gmail.com', '202cb962ac59075b964b07152d234b70', 2, 'default.jpg'),
(18, 'christoper', '0828916', 'toper@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 2, 'default.jpg');

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
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_pesan`);

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
  MODIFY `kode_bis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
