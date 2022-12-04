-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2022 at 10:31 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `oov_mis_dcu`
--

-- --------------------------------------------------------

--
-- Table structure for table `institusi_project`
--

CREATE TABLE `institusi_project` (
  `ID_InstitusiProject` bigint(20) NOT NULL,
  `Nama_InstitusiProject` varchar(255) DEFAULT NULL,
  `Alamat_InstitusiProject` varchar(500) DEFAULT NULL,
  `Kontak_InstitusiProject` varchar(255) DEFAULT NULL,
  `Website_InstitusiProject` varchar(255) DEFAULT NULL,
  `Email_InstitusiProject` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `ID_Item` bigint(20) NOT NULL,
  `Nama_Item` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `ID_Kategori` bigint(20) NOT NULL,
  `Nama_Kategori` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan`
--

CREATE TABLE `kegiatan` (
  `ID_Kegiatan` bigint(20) NOT NULL,
  `Nama_Kegiatan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kontraktor`
--

CREATE TABLE `kontraktor` (
  `ID_Kontraktor` bigint(20) NOT NULL,
  `Nama_Kontraktor` varchar(255) DEFAULT NULL,
  `Alamat_Kontraktor` varchar(500) DEFAULT NULL,
  `Kontak_Kontraktor` varchar(255) DEFAULT NULL,
  `Website_Kontraktor` varchar(255) DEFAULT NULL,
  `Email_Kontraktor` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kontrak_spk`
--

CREATE TABLE `kontrak_spk` (
  `ID_KontrakSPK` bigint(20) NOT NULL,
  `No_KontrakSPK` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_mingguan`
--

CREATE TABLE `laporan_mingguan` (
  `ID_LaporanMingguan` bigint(20) NOT NULL,
  `Nama_LaporanMingguan` varchar(255) DEFAULT NULL,
  `Volume_LinkWeek` varchar(255) DEFAULT NULL,
  `Bobot_LinkWeek` varchar(255) DEFAULT NULL,
  `Prestasi_LinkWeek` varchar(255) DEFAULT NULL,
  `ID_RAB` bigint(20) DEFAULT NULL,
  `ID_LinkKategori` bigint(20) DEFAULT NULL,
  `ID_Week` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `link_kategori`
--

CREATE TABLE `link_kategori` (
  `ID_LinkKategori` bigint(20) NOT NULL,
  `No_LinkKategori` int(11) NOT NULL,
  `Volume_LinkKategori` decimal(18,2) NOT NULL,
  `Bobot_LinkKategori` decimal(18,2) NOT NULL,
  `HargaSatuan_LinkKategori` decimal(18,2) NOT NULL,
  `ID_Item` bigint(20) NOT NULL,
  `ID_Kategori` bigint(20) NOT NULL,
  `ID_Satuan` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `link_user_kontraktor`
--

CREATE TABLE `link_user_kontraktor` (
  `ID_LinkUserKontraktor` bigint(20) NOT NULL,
  `NIP_LinkUserKontraktor` varchar(255) DEFAULT NULL,
  `Position_LinkUserKontraktor` varchar(255) DEFAULT NULL,
  `ID_Kontraktor` bigint(20) DEFAULT NULL,
  `ID_UserKontraktor` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `link_user_project`
--

CREATE TABLE `link_user_project` (
  `ID_LinkUserProject` bigint(20) NOT NULL,
  `NIP_LinkUserProject` varchar(255) DEFAULT NULL,
  `Position_LinkUserProject` varchar(255) DEFAULT NULL,
  `ID_Project` bigint(20) DEFAULT NULL,
  `ID_UserProject` bigint(20) DEFAULT NULL,
  `ID_InstitusiProject` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `lokasi`
--

CREATE TABLE `lokasi` (
  `ID_Lokasi` bigint(20) NOT NULL,
  `Nama_Lokasi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pekerjaan`
--

CREATE TABLE `pekerjaan` (
  `ID_Pekerjaan` bigint(20) NOT NULL,
  `Nama_Pekerjaan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `ID_Project` bigint(20) NOT NULL,
  `Nama_Project` varchar(255) DEFAULT NULL,
  `ID_Kegiatan` bigint(20) DEFAULT NULL,
  `ID_Pekerjaan` bigint(20) DEFAULT NULL,
  `ID_Lokasi` bigint(20) DEFAULT NULL,
  `ID_KontrakSPK` bigint(20) DEFAULT NULL,
  `ID_LinkUserKontraktor` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rab`
--

CREATE TABLE `rab` (
  `ID_RAB` bigint(20) NOT NULL,
  `Nama_RAB` varchar(255) DEFAULT NULL,
  `ID_Project` bigint(20) DEFAULT NULL,
  `ID_LinkKategori` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `ID_Satuan` bigint(20) NOT NULL,
  `Nama_Satuan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_kontraktor`
--

CREATE TABLE `user_kontraktor` (
  `ID_UserKontraktor` bigint(20) NOT NULL,
  `FirstName_UserKontraktor` varchar(255) DEFAULT NULL,
  `LastName_UserKontraktor` varchar(255) DEFAULT NULL,
  `NoHP_UserKontraktor` varchar(255) DEFAULT NULL,
  `Email_UserKontraktor` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_project`
--

CREATE TABLE `user_project` (
  `ID_UserProject` bigint(20) NOT NULL,
  `Nama_UserProject` varchar(255) DEFAULT NULL,
  `Alamat_UserProject` varchar(500) DEFAULT NULL,
  `Kontak_UserProject` varchar(255) DEFAULT NULL,
  `Website_UserProject` varchar(255) DEFAULT NULL,
  `Email_UserProject` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `week`
--

CREATE TABLE `week` (
  `ID_Week` bigint(20) NOT NULL,
  `No_Week` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `institusi_project`
--
ALTER TABLE `institusi_project`
  ADD PRIMARY KEY (`ID_InstitusiProject`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`ID_Item`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`ID_Kategori`);

--
-- Indexes for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`ID_Kegiatan`);

--
-- Indexes for table `kontraktor`
--
ALTER TABLE `kontraktor`
  ADD PRIMARY KEY (`ID_Kontraktor`);

--
-- Indexes for table `kontrak_spk`
--
ALTER TABLE `kontrak_spk`
  ADD PRIMARY KEY (`ID_KontrakSPK`);

--
-- Indexes for table `laporan_mingguan`
--
ALTER TABLE `laporan_mingguan`
  ADD PRIMARY KEY (`ID_LaporanMingguan`),
  ADD KEY `ID_RAB` (`ID_RAB`),
  ADD KEY `ID_LinkKategori` (`ID_LinkKategori`),
  ADD KEY `ID_Week` (`ID_Week`);

--
-- Indexes for table `link_kategori`
--
ALTER TABLE `link_kategori`
  ADD PRIMARY KEY (`ID_LinkKategori`),
  ADD KEY `FK_Item` (`ID_Item`),
  ADD KEY `FK_Satuan` (`ID_Satuan`),
  ADD KEY `FK_Kategori` (`ID_Kategori`);

--
-- Indexes for table `link_user_kontraktor`
--
ALTER TABLE `link_user_kontraktor`
  ADD PRIMARY KEY (`ID_LinkUserKontraktor`),
  ADD KEY `ID_Kontraktor` (`ID_Kontraktor`),
  ADD KEY `ID_UserKontraktor` (`ID_UserKontraktor`);

--
-- Indexes for table `link_user_project`
--
ALTER TABLE `link_user_project`
  ADD PRIMARY KEY (`ID_LinkUserProject`),
  ADD KEY `ID_Project` (`ID_Project`),
  ADD KEY `ID_UserProject` (`ID_UserProject`),
  ADD KEY `ID_InstitusiProject` (`ID_InstitusiProject`);

--
-- Indexes for table `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`ID_Lokasi`);

--
-- Indexes for table `pekerjaan`
--
ALTER TABLE `pekerjaan`
  ADD PRIMARY KEY (`ID_Pekerjaan`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`ID_Project`),
  ADD KEY `ID_Kegiatan` (`ID_Kegiatan`),
  ADD KEY `ID_Pekerjaan` (`ID_Pekerjaan`),
  ADD KEY `ID_Lokasi` (`ID_Lokasi`),
  ADD KEY `ID_KontrakSPK` (`ID_KontrakSPK`),
  ADD KEY `ID_LinkUserKontraktor` (`ID_LinkUserKontraktor`);

--
-- Indexes for table `rab`
--
ALTER TABLE `rab`
  ADD PRIMARY KEY (`ID_RAB`),
  ADD KEY `ID_Project` (`ID_Project`),
  ADD KEY `ID_LinkKategori` (`ID_LinkKategori`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`ID_Satuan`);

--
-- Indexes for table `user_kontraktor`
--
ALTER TABLE `user_kontraktor`
  ADD PRIMARY KEY (`ID_UserKontraktor`);

--
-- Indexes for table `user_project`
--
ALTER TABLE `user_project`
  ADD PRIMARY KEY (`ID_UserProject`);

--
-- Indexes for table `week`
--
ALTER TABLE `week`
  ADD PRIMARY KEY (`ID_Week`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `institusi_project`
--
ALTER TABLE `institusi_project`
  MODIFY `ID_InstitusiProject` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `ID_Item` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `ID_Kategori` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `ID_Kegiatan` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kontraktor`
--
ALTER TABLE `kontraktor`
  MODIFY `ID_Kontraktor` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kontrak_spk`
--
ALTER TABLE `kontrak_spk`
  MODIFY `ID_KontrakSPK` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `laporan_mingguan`
--
ALTER TABLE `laporan_mingguan`
  MODIFY `ID_LaporanMingguan` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `link_kategori`
--
ALTER TABLE `link_kategori`
  MODIFY `ID_LinkKategori` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `link_user_kontraktor`
--
ALTER TABLE `link_user_kontraktor`
  MODIFY `ID_LinkUserKontraktor` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `link_user_project`
--
ALTER TABLE `link_user_project`
  MODIFY `ID_LinkUserProject` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lokasi`
--
ALTER TABLE `lokasi`
  MODIFY `ID_Lokasi` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pekerjaan`
--
ALTER TABLE `pekerjaan`
  MODIFY `ID_Pekerjaan` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `ID_Project` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rab`
--
ALTER TABLE `rab`
  MODIFY `ID_RAB` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `ID_Satuan` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_kontraktor`
--
ALTER TABLE `user_kontraktor`
  MODIFY `ID_UserKontraktor` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_project`
--
ALTER TABLE `user_project`
  MODIFY `ID_UserProject` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `week`
--
ALTER TABLE `week`
  MODIFY `ID_Week` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `laporan_mingguan`
--
ALTER TABLE `laporan_mingguan`
  ADD CONSTRAINT `laporan_mingguan_ibfk_1` FOREIGN KEY (`ID_RAB`) REFERENCES `rab` (`ID_RAB`),
  ADD CONSTRAINT `laporan_mingguan_ibfk_2` FOREIGN KEY (`ID_LinkKategori`) REFERENCES `link_kategori` (`ID_LinkKategori`),
  ADD CONSTRAINT `laporan_mingguan_ibfk_3` FOREIGN KEY (`ID_Week`) REFERENCES `week` (`ID_Week`);

--
-- Constraints for table `link_kategori`
--
ALTER TABLE `link_kategori`
  ADD CONSTRAINT `FK_Item` FOREIGN KEY (`ID_Item`) REFERENCES `item` (`ID_Item`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Kategori` FOREIGN KEY (`ID_Kategori`) REFERENCES `kategori` (`ID_Kategori`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Satuan` FOREIGN KEY (`ID_Satuan`) REFERENCES `satuan` (`ID_Satuan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `link_user_kontraktor`
--
ALTER TABLE `link_user_kontraktor`
  ADD CONSTRAINT `link_user_kontraktor_ibfk_1` FOREIGN KEY (`ID_Kontraktor`) REFERENCES `kontraktor` (`ID_Kontraktor`),
  ADD CONSTRAINT `link_user_kontraktor_ibfk_2` FOREIGN KEY (`ID_UserKontraktor`) REFERENCES `user_kontraktor` (`ID_UserKontraktor`);

--
-- Constraints for table `link_user_project`
--
ALTER TABLE `link_user_project`
  ADD CONSTRAINT `link_user_project_ibfk_1` FOREIGN KEY (`ID_Project`) REFERENCES `project` (`ID_Project`),
  ADD CONSTRAINT `link_user_project_ibfk_2` FOREIGN KEY (`ID_UserProject`) REFERENCES `user_project` (`ID_UserProject`),
  ADD CONSTRAINT `link_user_project_ibfk_3` FOREIGN KEY (`ID_InstitusiProject`) REFERENCES `institusi_project` (`ID_InstitusiProject`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`ID_Kegiatan`) REFERENCES `kegiatan` (`ID_Kegiatan`),
  ADD CONSTRAINT `project_ibfk_2` FOREIGN KEY (`ID_Pekerjaan`) REFERENCES `pekerjaan` (`ID_Pekerjaan`),
  ADD CONSTRAINT `project_ibfk_3` FOREIGN KEY (`ID_Lokasi`) REFERENCES `lokasi` (`ID_Lokasi`),
  ADD CONSTRAINT `project_ibfk_4` FOREIGN KEY (`ID_KontrakSPK`) REFERENCES `kontrak_spk` (`ID_KontrakSPK`),
  ADD CONSTRAINT `project_ibfk_5` FOREIGN KEY (`ID_LinkUserKontraktor`) REFERENCES `link_user_kontraktor` (`ID_LinkUserKontraktor`);

--
-- Constraints for table `rab`
--
ALTER TABLE `rab`
  ADD CONSTRAINT `rab_ibfk_1` FOREIGN KEY (`ID_Project`) REFERENCES `project` (`ID_Project`),
  ADD CONSTRAINT `rab_ibfk_2` FOREIGN KEY (`ID_LinkKategori`) REFERENCES `link_kategori` (`ID_LinkKategori`);
COMMIT;
