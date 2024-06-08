-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Jan 2022 pada 06.17
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sembako`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jk` enum('Laki-laki','Perempuan') NOT NULL,
  `email` varchar(50) NOT NULL,
  `no_hp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`username`, `password`, `nama`, `jk`, `email`, `no_hp`) VALUES
('admin', 'admin', 'si mimin', 'Perempuan', 'adminmimin@gmail.com', '081212121212');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bahan_pokok`
--

CREATE TABLE `bahan_pokok` (
  `id_sembako` varchar(11) CHARACTER SET latin1 NOT NULL,
  `nama_sembako` varchar(50) CHARACTER SET latin1 NOT NULL,
  `harga` int(10) NOT NULL,
  `deskripsi` text CHARACTER SET latin1 NOT NULL,
  `gambar` varchar(25) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `bahan_pokok`
--

INSERT INTO `bahan_pokok` (`id_sembako`, `nama_sembako`, `harga`, `deskripsi`, `gambar`) VALUES
('121001', 'Beras', 10000, 'Harga Beras : \r\n\r\n- Rp. 10.000,00 / Kg', 'beras1.jpg'),
('121002', 'Gula Pasir', 13000, 'Harga Gula Pasir : \r\n\r\n- Rp. 13.000,00 / Kg', 'gula1.jpg'),
('121003', 'Garam', 5000, 'Harga Garam : \r\n\r\n- Rp. 5.000,00 / bungkus', 'garam1.jpg'),
('121004', 'Minyak Goreng', 20000, 'Harga Minyak Goreng : \r\n\r\n- Rp. 20.000,00 / Liter', 'minyak1.jpg'),
('121005', 'Mentega ', 6000, 'Harga Mentega : \r\n\r\n- Rp. 6.000,00 / pcs', 'mentega1.jpg'),
('121006', 'Daging Sapi', 120000, 'Harga Daging Sapi : \r\n\r\n- Rp. 120.000,00 / Kg', 'sapi1.jpg'),
('121007', 'Daging Ayam', 25000, 'Harga Daging Ayam : \r\n\r\n- Rp. 25.000,00 / Kg', 'ayam1.jpg'),
('121008', 'Telur Ayam', 30000, 'Harga Telur Ayam : \r\n\r\n- Rp. 30.000,00 / Kg', 'telur.jpg'),
('121009', 'Susu Sapi Segar', 15000, 'Harga Susu Sapi : \r\n\r\n- Rp. 15.000,00 / Liter', 'susu.jpg'),
('121010', 'Bawang Merah ', 20000, 'Harga Bawang Merah : \r\n\r\n- Rp. 20.000,00 / Kg', 'bawangmerah1.jpg'),
('121011', 'Bawang Putih', 25000, 'Harga Bawang Putih : \r\n\r\n- Rp. 25.000,00 / Kg', 'bawangputih1.jpg'),
('121012', 'Gas LPG - 3 Kg', 20000, 'Harga Isi Ulang Gas LPG - 3 Kg : \r\n\r\n- Rp. 20.000,00 / gas', 'gas.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jk` enum('Laki-laki','Perempuan') NOT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`username`, `password`, `nama`, `jk`, `email`, `alamat`, `no_hp`) VALUES
('farhan', '12345', 'Farhan Rizki M', 'Laki-laki', 'akuganteng@gmail.com', 'Bogor', '081222112221');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `id_sembako` varchar(11) NOT NULL,
  `nama_sembako` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan`
--

CREATE TABLE `laporan` (
  `id` int(11) NOT NULL,
  `id_beli` varchar(11) CHARACTER SET latin1 NOT NULL,
  `tgl_beli` varchar(11) CHARACTER SET latin1 NOT NULL,
  `nama` varchar(60) CHARACTER SET latin1 NOT NULL,
  `no_hp` varchar(13) CHARACTER SET latin1 NOT NULL,
  `alamat` text CHARACTER SET latin1 NOT NULL,
  `jasa_kirim` varchar(11) CHARACTER SET latin1 NOT NULL,
  `total_pesanan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int(11) NOT NULL,
  `id_beli` varchar(11) CHARACTER SET latin1 NOT NULL,
  `id_sembako` varchar(11) CHARACTER SET latin1 NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `bahan_pokok`
--
ALTER TABLE `bahan_pokok`
  ADD PRIMARY KEY (`id_sembako`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_sembako`);

--
-- Indeks untuk tabel `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `laporan`
--
ALTER TABLE `laporan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
