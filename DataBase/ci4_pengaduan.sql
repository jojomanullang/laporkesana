-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Jun 2022 pada 06.59
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci4_pengaduan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_bukti`
--

CREATE TABLE `tbl_bukti` (
  `id` int(11) NOT NULL,
  `pengaduan_id` int(11) NOT NULL,
  `img_satu` varchar(255) DEFAULT NULL,
  `img_dua` varchar(255) DEFAULT NULL,
  `img_tiga` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `row_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_bukti`
--

INSERT INTO `tbl_bukti` (`id`, `pengaduan_id`, `img_satu`, `img_dua`, `img_tiga`, `created_at`, `updated_at`, `deleted_at`, `row_status`) VALUES
(17, 46, '1654880860_ca20e2a96288c2589ae9.jpeg', NULL, NULL, '2022-06-10 12:07:40', '2022-06-10 12:07:40', NULL, 1),
(18, 47, '1655568994_229c840bcea5ae299da7.png', NULL, NULL, '2022-06-18 11:16:34', '2022-06-18 11:16:34', NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pengaduan`
--

CREATE TABLE `tbl_pengaduan` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama_pengadu` varchar(128) NOT NULL DEFAULT 'Anonym',
  `judul_pengaduan` varchar(255) NOT NULL,
  `isi_pengaduan` text NOT NULL,
  `status_pengaduan` int(11) NOT NULL DEFAULT 1 COMMENT '1 = default, 2 = diproses, 3 = selesai.',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `row_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_pengaduan`
--

INSERT INTO `tbl_pengaduan` (`id`, `user_id`, `nama_pengadu`, `judul_pengaduan`, `isi_pengaduan`, `status_pengaduan`, `created_at`, `updated_at`, `deleted_at`, `row_status`) VALUES
(46, 10, 'anonym', 'PENCURIAN', 'MNAFAFEFNAJKDFJAJDFMADFJEBFJAEFJAIF', 3, '2022-06-10 12:07:40', '2022-06-10 12:10:11', NULL, 1),
(47, 11, 'anonym', 'Pencurian', 'pencurian di sekolah smk plus pelita ', 3, '2022-06-18 11:16:34', '2022-06-18 11:17:58', NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `username` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_image` varchar(255) NOT NULL DEFAULT 'default.svg',
  `user_ktp` varchar(255) NOT NULL,
  `user_level` int(11) NOT NULL DEFAULT 3,
  `is_active` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `row_status` int(11) NOT NULL DEFAULT 1 COMMENT '0: deleted, 1: active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `nama`, `username`, `email`, `password`, `user_image`, `user_ktp`, `user_level`, `is_active`, `created_at`, `updated_at`, `deleted_at`, `row_status`) VALUES
(1, 'Admin', 'admin123', 'admin@example.com', '$2y$10$r2Zl.avNMwfFNAalniQxr.KXzseHcT5UoviUGhHCBDCgYy71KfI7G', 'default.svg', '', 1, 1, '2021-03-01 23:24:20', '2021-05-02 13:04:18', NULL, 1),
(9, 'user123', 'user123', 'anndrzq32@gmail.com', '$2y$10$kzlSZi8eV7qYwUCmLm8P1eQJCKqCvzXqzjnSVPe.rehWFXR0taDSi', 'default.svg', '1654879714_3c1f50449756ab9a62fa.jpeg', 3, 1, '2022-06-10 11:48:34', '2022-06-10 11:50:09', NULL, 1),
(10, 'uji123', 'uji123', 'ujicoba@gmail.com', '$2y$10$0NqeOv1/L6uDH35pG1YNC.Wfz4QvzSBtCADrUAgkLBd8n/HRDmesa', 'default.svg', '1654880688_917404b8ad5c088aba7f.jpeg', 3, 1, '2022-06-10 12:04:48', '2022-06-10 12:05:47', NULL, 1),
(11, 'Ananda ', 'Rizq', 'rzq32@gmail.com', '$2y$10$J3Lt5r8kQbFEft9C9VqoEugY9xLTpsJ7/I7rBWf5HmF0s.cK3ufJS', 'default.svg', '1655568756_cf18ccab9dc1976876f1.png', 3, 1, '2022-06-18 11:12:36', '2022-06-18 11:13:22', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_bukti`
--
ALTER TABLE `tbl_bukti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengaduan_id` (`pengaduan_id`);

--
-- Indeks untuk tabel `tbl_pengaduan`
--
ALTER TABLE `tbl_pengaduan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_bukti`
--
ALTER TABLE `tbl_bukti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `tbl_pengaduan`
--
ALTER TABLE `tbl_pengaduan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_bukti`
--
ALTER TABLE `tbl_bukti`
  ADD CONSTRAINT `tbl_bukti_ibfk_1` FOREIGN KEY (`pengaduan_id`) REFERENCES `tbl_pengaduan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
