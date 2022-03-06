-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2022 at 11:21 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `data_engineer_challenge_with_sql`
--

-- --------------------------------------------------------

--
-- Table structure for table `ms_pelanggan`
--

CREATE TABLE `ms_pelanggan` (
  `no_urut` int(11) NOT NULL,
  `kode_cabang` varchar(1000) NOT NULL,
  `kode_pelanggan` varchar(1000) NOT NULL,
  `nama_pelanggan` varchar(1000) NOT NULL,
  `alamat` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ms_pelanggan`
--

INSERT INTO `ms_pelanggan` (`no_urut`, `kode_cabang`, `kode_pelanggan`, `nama_pelanggan`, `alamat`) VALUES
(2, 'BPP', 'cust0002', 'Arif Ganang', 'Vila Mahesa, No. 21'),
(3, 'GRT', 'cust0003', 'Resa Ayu', 'Gunung Jati Village, No. 13'),
(4, 'PLB', 'cust0004', 'Tati Inggrid', 'Nurul Ilmi Residence, No. 58'),
(5, 'ACH', 'cust0005', 'Irma Salma', 'Bukit Menanjak, No. 16'),
(6, 'KKT', 'cust0006', 'Sandi Evan', 'Stay Village, No. 14'),
(7, 'SMR', 'cust0007', 'Tina Amalia', 'Vila Nugraha, No. 94'),
(8, 'TGR', 'cust0008', 'Hendri Utama', 'Ruko Western, No. 14'),
(9, 'TKP', 'cust0009', 'Ir. Nanang Utomo', 'Jalan Oto Iskandar Dinata, No. 14'),
(10, 'DMI', 'cust0010', 'Nanda Tessa, Drs.', 'Ruko Oasis, No. 12'),
(1, 'AMB', 'cust0001', 'Anita Tamara, S.H.', 'Ruko Kembang Indah, No. 11');

-- --------------------------------------------------------

--
-- Table structure for table `ms_produk`
--

CREATE TABLE `ms_produk` (
  `no_urut` int(11) NOT NULL,
  `kode_produk` varchar(10) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ms_produk`
--

INSERT INTO `ms_produk` (`no_urut`, `kode_produk`, `nama_produk`, `harga`) VALUES
(2, 'prod-02', 'Tas Ransel Eger', 200000),
(3, 'prod-03', 'Voucher Belanja 120rb', 120000),
(4, 'prod-04', 'Kotak Pensil Dion', 11000),
(5, 'prod-05', 'Voucher Belanja 300rb', 300000),
(6, 'prod-06', 'Sticky Notes Koki 500 sheets', 14000),
(7, 'prod-07', 'Pulpen 6 Warna Nahkoda', 16000),
(8, 'prod-08', 'Lampu Tumbler Warna-warni', 30000),
(9, 'prod-09', 'Dasi Navy ', 50000),
(10, 'prod-10', 'Buku Tulis Koki 10 pcs', 20000),
(1, 'prod-01', 'Ikat Pinggang Dion', 61000);

-- --------------------------------------------------------

--
-- Table structure for table `tr_penjualan`
--

CREATE TABLE `tr_penjualan` (
  `kode_transaksi` varchar(50) NOT NULL,
  `tanggal_transaksi` datetime NOT NULL,
  `kode_pelanggan` varchar(50) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `kode_produk` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tr_penjualan`
--

INSERT INTO `tr_penjualan` (`kode_transaksi`, `tanggal_transaksi`, `kode_pelanggan`, `no_urut`, `kode_produk`) VALUES
('tr-0001', '2021-08-01 19:08:01', 'cust0009', 2, 'prod-05'),
('tr-0001', '2021-08-01 19:08:01', 'cust0009', 3, 'prod-10'),
('tr-0002', '2021-08-02 13:16:02', 'cust0002', 1, 'prod-01'),
('tr-0002', '2021-08-02 13:16:02', 'cust0002', 2, 'prod-04'),
('tr-0002', '2021-08-02 13:16:02', 'cust0002', 3, 'prod-05'),
('tr-0003', '2021-08-03 13:12:09', 'cust0010', 1, 'prod-09'),
('tr-0004', '2021-08-04 12:13:05', 'cust0005', 1, 'prod-02'),
('tr-0004', '2021-08-04 12:13:05', 'cust0005', 2, 'prod-09'),
('tr-0004', '2021-08-04 12:13:05', 'cust0005', 3, 'prod-03'),
('tr-0004', '2021-08-04 12:13:05', 'cust0005', 4, 'prod-04'),
('tr-0005', '2021-08-05 11:01:13', 'cust0004', 1, 'prod-07'),
('tr-0006', '2021-08-05 11:19:05', 'cust0008', 1, 'prod-04'),
('tr-0001', '2021-08-01 19:18:01', 'cust0009', 1, 'prod-09');

-- --------------------------------------------------------

--
-- Table structure for table `tr_penjualan_detail`
--

CREATE TABLE `tr_penjualan_detail` (
  `kode_transaksi` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga_satuan` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tr_penjualan_detail`
--

INSERT INTO `tr_penjualan_detail` (`kode_transaksi`, `kode_produk`, `qty`, `harga_satuan`) VALUES
('tr-0001', 'prod-10', 2, 20000),
('tr-0002', 'prod-08', 4, 50000),
('tr-0003', 'prod-04', 4, 11000),
('tr-0003', 'prod-05', 1, 300000),
('tr-0004', 'prod-01', 5, 61000),
('tr-0005', 'prod-05', 1, 300000),
('tr-0005', 'prod-01', 2, 61000),
('tr-0006', 'prod-02', 4, 200000),
('tr-0007', 'prod-01', 5, 61000),
('tr-0008', 'prod-09', 2, 50000),
('tr-0008', 'prod-04', 5, 11000),
('tr-0009', 'prod-04', 2, 11000),
('tr-0009', 'prod-05', 4, 300000),
('tr-0010', 'prod-10', 4, 20000);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
