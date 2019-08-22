-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2016 at 03:32 PM
-- Server version: 10.0.17-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_surat`
--

-- --------------------------------------------------------

--
-- Table structure for table `phpmu_biaya`
--

CREATE TABLE `phpmu_biaya` (
  `id_biaya` int(5) NOT NULL,
  `id_kegiatan` int(5) NOT NULL,
  `rincian_biaya` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phpmu_biaya`
--

INSERT INTO `phpmu_biaya` (`id_biaya`, `id_kegiatan`, `rincian_biaya`, `jumlah`, `keterangan`) VALUES
(1, 1, 'Uang Harian (11 Hari x Rp 800.000)', 8800000, ''),
(2, 1, 'Uang Transport', 0, ''),
(3, 1, 'Uang Penginapan (10 Hari x Rp 700.000)', 7000000, ''),
(4, 1, 'Uang Untuk Makan (10 Hari x 100000)', 1000000, 'Semua anggota 5 Orang.'),
(5, 2, 'Biaya Perjalanan (5 Orang x 120000)', 600000, ''),
(6, 2, 'Biaya Makan 3 kali sehari (5 Orang x 30000)', 450000, '');

-- --------------------------------------------------------

--
-- Table structure for table `phpmu_dasar`
--

CREATE TABLE `phpmu_dasar` (
  `id_dasar` int(5) NOT NULL,
  `id_kegiatan` int(5) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phpmu_dasar`
--

INSERT INTO `phpmu_dasar` (`id_dasar`, `id_kegiatan`, `keterangan`) VALUES
(1, 1, 'Surat Kepala Kesehatan Jatim No 669/JT/2012 Tanggal 22 Oktober 2015 Perihal Rencana Pembelajaran Kesehatan'),
(2, 1, 'SKPD UPTD Kesehatan Tahun Anggaran 2015'),
(4, 11, 'Berdasarkan SK Mentri Kesehatan Tahun 2016 yang menjelaskan tentang penanggulangan Demam Berdarah.'),
(5, 2, 'Berdasarkan SK Mentri Pendidikan dan Kesehatan tentang Hidup Sehat'),
(6, 2, 'Peraturan Pemerintah Pada Tahun 2016.');

-- --------------------------------------------------------

--
-- Table structure for table `phpmu_golongan`
--

CREATE TABLE `phpmu_golongan` (
  `id_golongan` int(5) NOT NULL,
  `golongan` varchar(10) NOT NULL,
  `nama_golongan` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phpmu_golongan`
--

INSERT INTO `phpmu_golongan` (`id_golongan`, `golongan`, `nama_golongan`) VALUES
(1, 'III/a', 'Pranata 1'),
(2, 'III/c', 'Pranata 2'),
(3, 'III/b', 'Pranata 3'),
(4, 'III/d', 'Staf'),
(5, 'I/c', 'Staf Muda'),
(6, 'II/c', 'Staf Junior');

-- --------------------------------------------------------

--
-- Table structure for table `phpmu_karyawan`
--

CREATE TABLE `phpmu_karyawan` (
  `id_karyawan` int(10) UNSIGNED NOT NULL,
  `id_golongan` int(5) NOT NULL,
  `nip_karyawan` varchar(45) NOT NULL,
  `nama_karyawan` varchar(255) NOT NULL DEFAULT '-',
  `jabatan_karyawan` varchar(255) NOT NULL DEFAULT '-',
  `kota_karyawan` varchar(45) NOT NULL DEFAULT '-'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phpmu_karyawan`
--

INSERT INTO `phpmu_karyawan` (`id_karyawan`, `id_golongan`, `nip_karyawan`, `nama_karyawan`, `jabatan_karyawan`, `kota_karyawan`) VALUES
(1, 1, '198404042010122003', 'Yuli Yolanda', 'Staf subbag TU KKP Kelas II Cilacap', 'Cilacap'),
(3, 2, '198805272009122001', 'Ria Rosmawardini', 'Staf Bag TU KKP Kelas I Soekarno Hatta', 'Jakarta'),
(4, 3, '197806092005011003', 'Putri Garnaditia', 'Operator SAKPA KKP Kelas III jambi', 'Bandung'),
(5, 3, '198704072010122002', 'Meylani Titi Sukma Dewi', 'Staf Subbag TU KKP Cilacap 1', 'Cilacap'),
(7, 2, '197001261990011001', 'Tommy Utama', 'Staf Subbag TU KKP Padang 1', 'Jakarta'),
(8, 1, '198107042003121003', 'Willy Fernando', 'Staf Subbag TU KKP Payakumbuh 1', 'Jakarta'),
(14, 2, '198312022010122002', 'Siti Daniati', 'Operator SAKPA KKP Kelas III jambi', 'Jambi'),
(15, 5, '198404042010122113', 'Ani Sarapudin', 'Operator Tingkat 1', 'Padang'),
(16, 4, '198404042010122011', 'Bona Jaya', 'Staff Senior Tingkat 1', 'Payakumbuh');

-- --------------------------------------------------------

--
-- Table structure for table `phpmu_kegiatan`
--

CREATE TABLE `phpmu_kegiatan` (
  `id_kegiatan` int(10) UNSIGNED NOT NULL,
  `no_kegiatan` varchar(45) NOT NULL,
  `mata_anggaran` varchar(45) NOT NULL DEFAULT '-',
  `no_bukti` varchar(100) NOT NULL,
  `tahun_anggaran` varchar(45) NOT NULL DEFAULT '-',
  `nama_kegiatan` text NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_akhir` date NOT NULL,
  `tempat_kegiatan` varchar(255) NOT NULL DEFAULT '-',
  `biaya` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phpmu_kegiatan`
--

INSERT INTO `phpmu_kegiatan` (`id_kegiatan`, `no_kegiatan`, `mata_anggaran`, `no_bukti`, `tahun_anggaran`, `nama_kegiatan`, `tgl_mulai`, `tgl_akhir`, `tempat_kegiatan`, `biaya`) VALUES
(1, '001.022125.0122/15155/01', '0176.0225.00215', '23423/3453', '2016', 'PENYUSUNAN LAPORAN KEUANGAN UAPP E-1 PP', '2013-07-26', '2013-07-31', 'Bandung', 'SKPD UPTD  Kesehatan Tahun Anggaran 2015'),
(2, '002.031041.0122541/1501', '2063.050.524219', '', '2013', 'PENYELENGGARAAN KEDINASAN PIMPINAN', '2013-06-30', '2013-07-06', 'India', ''),
(11, '001.022125.0122/15155/23', '0176.0225.00216', '', '2016', 'KEGIATAN PENANGGULANGAN  DEMAM BERDARAH', '2016-11-26', '2016-02-29', 'Padang', 'SKPD UPTD Kesehatan Tahun Anggaran 2016');

-- --------------------------------------------------------

--
-- Table structure for table `phpmu_pelaksana`
--

CREATE TABLE `phpmu_pelaksana` (
  `id_pelaksana` int(10) UNSIGNED NOT NULL,
  `id_karyawan` int(10) UNSIGNED NOT NULL,
  `id_kegiatan` int(3) NOT NULL,
  `ket_pelaksana` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phpmu_pelaksana`
--

INSERT INTO `phpmu_pelaksana` (`id_pelaksana`, `id_karyawan`, `id_kegiatan`, `ket_pelaksana`) VALUES
(8, 2, 2, ''),
(9, 1, 2, ''),
(10, 5, 1, ''),
(11, 2, 1, ''),
(12, 4, 2, ''),
(13, 7, 1, ''),
(20, 15, 1, ''),
(15, 3, 1, ''),
(21, 16, 1, ''),
(17, 3, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `phpmu_pengikut`
--

CREATE TABLE `phpmu_pengikut` (
  `id_pengikut` int(5) NOT NULL,
  `id_pelaksana` int(5) NOT NULL,
  `id_karyawan` int(5) NOT NULL,
  `nama_pengikut` varchar(100) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phpmu_pengikut`
--

INSERT INTO `phpmu_pengikut` (`id_pengikut`, `id_pelaksana`, `id_karyawan`, `nama_pengikut`, `keterangan`) VALUES
(4, 13, 0, 'Amaik Sapihi', 'Orang Tua Laki-laki'),
(2, 10, 0, 'Udin Sedunia', 'Keponakan'),
(3, 13, 14, '', ''),
(5, 9, 8, '', ''),
(6, 12, 0, 'Dewi Safitri', 'Keponakan Tertua'),
(7, 12, 7, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `phpmu_user`
--

CREATE TABLE `phpmu_user` (
  `id_user` int(5) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(150) NOT NULL,
  `nama_lengkap` varchar(150) NOT NULL,
  `alamat_email` varchar(150) NOT NULL,
  `no_telpon` varchar(15) NOT NULL,
  `alamat_lengkap` text NOT NULL,
  `level` varchar(20) NOT NULL DEFAULT 'biasa',
  `status` enum('Y','N') NOT NULL DEFAULT 'N',
  `waktu_daftar` datetime NOT NULL,
  `unit_kerja` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phpmu_user`
--

INSERT INTO `phpmu_user` (`id_user`, `username`, `password`, `nama_lengkap`, `alamat_email`, `no_telpon`, `alamat_lengkap`, `level`, `status`, `waktu_daftar`, `unit_kerja`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', 'robby.prihandaya@gmail.com', '081267771344', 'Tunggul Hitam, Padang, Sumtara Barat', 'user_admin', 'Y', '2015-06-03 00:00:00', '0'),
(2, 'robby', '8d05dd2f03981f86b56c23951f3f34d7', 'Robby Prihandaya', 'robby.prihandaya@gmail.com', '081267771344', 'Linggar Jati, Padang, Sumatera Barat', 'user_input', 'Y', '2015-06-03 00:00:00', 'F'),
(3, 'dewi', 'ed1d859c50262701d92e5cbf39652792', 'Dewi Safitri', 'dewi.safitri@gmail.com', '087305450112', 'Linggar Jati, Padang, Sumatera Barat', 'user_biasa', 'Y', '2015-06-03 00:00:00', 'B'),
(4, 'udin', '6bec9c852847242e384a4d5ac0962ba0', 'Udin Sedunia', 'udin.sedunia@gmail.com', '081267771390', 'Ulak Karang, Padang, Sumatera Barat', 'user_biasa', 'Y', '2015-06-04 08:03:18', 'C'),
(5, 'amel', 'da0e22de18e3fbe1e96bdc882b912ea4', 'Amel Amelia', 'amel.amelia@gmail.com', '081289701234', 'Lubuk Begalung, Padang, Sumatera Barat', 'user_input', 'Y', '0000-00-00 00:00:00', 'D');

-- --------------------------------------------------------

--
-- Table structure for table `tanda_tangan`
--

CREATE TABLE `tanda_tangan` (
  `id_tanda_tangan` int(5) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `keterangan` varchar(150) NOT NULL,
  `nip` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tanda_tangan`
--

INSERT INTO `tanda_tangan` (`id_tanda_tangan`, `jabatan`, `nama_lengkap`, `keterangan`, `nip`) VALUES
(1, 'KEPALA DINAS KESEHATAN', 'Robby Prihandaya, M.Kom', 'Pembina Utama Madya', '4553 23 22232 1 2111'),
(2, 'SEKRETARIS', 'Dewiit Safitri, S.H', 'Sekretaris 1 Madya', '3553 23 22232 1 2122'),
(3, 'BENDAHARA', 'Tommy Speed, M.H', 'Bendahara 2 Madya', '2243 23 22232 1 2344');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `phpmu_biaya`
--
ALTER TABLE `phpmu_biaya`
  ADD PRIMARY KEY (`id_biaya`);

--
-- Indexes for table `phpmu_dasar`
--
ALTER TABLE `phpmu_dasar`
  ADD PRIMARY KEY (`id_dasar`);

--
-- Indexes for table `phpmu_golongan`
--
ALTER TABLE `phpmu_golongan`
  ADD PRIMARY KEY (`id_golongan`);

--
-- Indexes for table `phpmu_karyawan`
--
ALTER TABLE `phpmu_karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indexes for table `phpmu_kegiatan`
--
ALTER TABLE `phpmu_kegiatan`
  ADD PRIMARY KEY (`id_kegiatan`);

--
-- Indexes for table `phpmu_pelaksana`
--
ALTER TABLE `phpmu_pelaksana`
  ADD PRIMARY KEY (`id_pelaksana`);

--
-- Indexes for table `phpmu_pengikut`
--
ALTER TABLE `phpmu_pengikut`
  ADD PRIMARY KEY (`id_pengikut`);

--
-- Indexes for table `phpmu_user`
--
ALTER TABLE `phpmu_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `tanda_tangan`
--
ALTER TABLE `tanda_tangan`
  ADD PRIMARY KEY (`id_tanda_tangan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `phpmu_biaya`
--
ALTER TABLE `phpmu_biaya`
  MODIFY `id_biaya` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `phpmu_dasar`
--
ALTER TABLE `phpmu_dasar`
  MODIFY `id_dasar` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `phpmu_golongan`
--
ALTER TABLE `phpmu_golongan`
  MODIFY `id_golongan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `phpmu_karyawan`
--
ALTER TABLE `phpmu_karyawan`
  MODIFY `id_karyawan` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `phpmu_kegiatan`
--
ALTER TABLE `phpmu_kegiatan`
  MODIFY `id_kegiatan` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `phpmu_pelaksana`
--
ALTER TABLE `phpmu_pelaksana`
  MODIFY `id_pelaksana` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `phpmu_pengikut`
--
ALTER TABLE `phpmu_pengikut`
  MODIFY `id_pengikut` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `phpmu_user`
--
ALTER TABLE `phpmu_user`
  MODIFY `id_user` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tanda_tangan`
--
ALTER TABLE `tanda_tangan`
  MODIFY `id_tanda_tangan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
