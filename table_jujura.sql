-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2023 at 06:09 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `table_jujura`
--

-- --------------------------------------------------------

--
-- Table structure for table `table_konsumen`
--

CREATE TABLE `table_konsumen` (
  `id_konsumen` int(11) NOT NULL,
  `nama_konsmen` varchar(50) NOT NULL,
  `alamat_konsumen` text NOT NULL,
  `tlpn` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `table_konsumen`
--

INSERT INTO `table_konsumen` (`id_konsumen`, `nama_konsmen`, `alamat_konsumen`, `tlpn`) VALUES
(1, 'konsumen1', 'makamhaji', '92882'),
(2, 'konsumen2', 'makamhaji', '892882');

-- --------------------------------------------------------

--
-- Table structure for table `table_produk`
--

CREATE TABLE `table_produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `id_satuan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `table_produk`
--

INSERT INTO `table_produk` (`id_produk`, `nama_produk`, `harga_produk`, `id_satuan`) VALUES
(1, 'produkA', 20000, 1),
(2, 'produkB', 6000, 2),
(3, 'produkC', 7000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `table_sales`
--

CREATE TABLE `table_sales` (
  `id_sales` int(11) NOT NULL,
  `nama_sales` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `tlpn` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `table_sales`
--

INSERT INTO `table_sales` (`id_sales`, `nama_sales`, `alamat`, `tlpn`) VALUES
(1, 'sales1', 'makamhaji', '0988827'),
(2, 'sales2', 'makamhaji', '0939298');

-- --------------------------------------------------------

--
-- Table structure for table `table_satuan`
--

CREATE TABLE `table_satuan` (
  `id_satuan` int(11) NOT NULL,
  `nama_satuan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `table_satuan`
--

INSERT INTO `table_satuan` (`id_satuan`, `nama_satuan`) VALUES
(1, 'pcs'),
(2, 'losin');

-- --------------------------------------------------------

--
-- Table structure for table `table_supply_produk`
--

CREATE TABLE `table_supply_produk` (
  `id_sales_produk` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_sales` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `table_supply_produk`
--

INSERT INTO `table_supply_produk` (`id_sales_produk`, `id_produk`, `id_sales`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `table_transaksi`
--

CREATE TABLE `table_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_konsumen` int(11) NOT NULL,
  `tanggal_transaksi` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `table_transaksi`
--

INSERT INTO `table_transaksi` (`id_transaksi`, `id_konsumen`, `tanggal_transaksi`) VALUES
(1, 1, '2023-02-09 04:21:56'),
(2, 2, '2023-02-09 04:21:56');

-- --------------------------------------------------------

--
-- Table structure for table `table_transaksi_produk`
--

CREATE TABLE `table_transaksi_produk` (
  `id_transaksi_produk` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `tanggal_transaksi` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_sales` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `table_transaksi_produk`
--

INSERT INTO `table_transaksi_produk` (`id_transaksi_produk`, `id_transaksi`, `id_produk`, `tanggal_transaksi`, `id_sales`) VALUES
(1, 1, 1, '2023-02-09 04:22:23', 1),
(2, 1, 2, '2023-02-09 04:22:23', 1);

-- --------------------------------------------------------

--
-- Table structure for table `table_user`
--

CREATE TABLE `table_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `table_user`
--

INSERT INTO `table_user` (`id_user`, `username`, `password`, `nama`) VALUES
(1, 'admin', '81dc9bdb52d04dc20036dbd8313ed055', 'admin');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_transaksi_produk`
-- (See below for the actual view)
--
CREATE TABLE `view_transaksi_produk` (
`id_transaksi_produk` int(11)
,`nama_produk` varchar(50)
,`harga_produk` int(11)
,`tanggal_transaksi` timestamp
,`nama_sales` varchar(50)
,`id_sales` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `view_transaksi_produk`
--
DROP TABLE IF EXISTS `view_transaksi_produk`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_transaksi_produk`  AS SELECT `a`.`id_transaksi_produk` AS `id_transaksi_produk`, `b`.`nama_produk` AS `nama_produk`, `b`.`harga_produk` AS `harga_produk`, `a`.`tanggal_transaksi` AS `tanggal_transaksi`, `s`.`nama_sales` AS `nama_sales`, `s`.`id_sales` AS `id_sales` FROM (((`table_transaksi_produk` `a` left join `table_produk` `b` on(`a`.`id_produk` = `b`.`id_produk`)) left join `table_transaksi` `t` on(`a`.`id_transaksi` = `t`.`id_transaksi`)) left join `table_sales` `s` on(`a`.`id_sales` = `s`.`id_sales`)) ORDER BY `a`.`tanggal_transaksi` AS `DESCdesc` ASC  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `table_konsumen`
--
ALTER TABLE `table_konsumen`
  ADD PRIMARY KEY (`id_konsumen`);

--
-- Indexes for table `table_produk`
--
ALTER TABLE `table_produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `table_sales`
--
ALTER TABLE `table_sales`
  ADD PRIMARY KEY (`id_sales`);

--
-- Indexes for table `table_satuan`
--
ALTER TABLE `table_satuan`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indexes for table `table_supply_produk`
--
ALTER TABLE `table_supply_produk`
  ADD PRIMARY KEY (`id_sales_produk`);

--
-- Indexes for table `table_transaksi`
--
ALTER TABLE `table_transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `table_transaksi_produk`
--
ALTER TABLE `table_transaksi_produk`
  ADD PRIMARY KEY (`id_transaksi_produk`);

--
-- Indexes for table `table_user`
--
ALTER TABLE `table_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `table_konsumen`
--
ALTER TABLE `table_konsumen`
  MODIFY `id_konsumen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `table_produk`
--
ALTER TABLE `table_produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `table_sales`
--
ALTER TABLE `table_sales`
  MODIFY `id_sales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `table_satuan`
--
ALTER TABLE `table_satuan`
  MODIFY `id_satuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `table_supply_produk`
--
ALTER TABLE `table_supply_produk`
  MODIFY `id_sales_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `table_transaksi`
--
ALTER TABLE `table_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `table_transaksi_produk`
--
ALTER TABLE `table_transaksi_produk`
  MODIFY `id_transaksi_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `table_user`
--
ALTER TABLE `table_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
