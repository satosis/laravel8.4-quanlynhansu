-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 05, 2025 lúc 06:57 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qlns`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chamcong`
--

CREATE TABLE `chamcong` (
  `id` int(10) UNSIGNED NOT NULL,
  `nhanvien_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chamcong`
--

INSERT INTO `chamcong` (`id`, `nhanvien_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '2025-07-05 16:41:34', '2025-07-05 16:41:34', NULL),
(2, 2, '2025-07-05 16:41:34', '2025-07-05 16:41:34', NULL),
(3, 3, '2025-07-05 16:41:34', '2025-07-05 16:41:34', NULL),
(4, 4, '2025-07-05 16:41:34', '2025-07-05 16:41:34', NULL),
(5, 5, '2025-07-05 16:41:34', '2025-07-05 16:41:34', NULL),
(6, 6, '2025-07-05 16:41:34', '2025-07-05 16:41:34', NULL),
(7, 7, '2025-07-05 16:41:34', '2025-07-05 16:41:34', NULL),
(8, 8, '2025-07-05 16:41:34', '2025-07-05 16:41:34', NULL),
(9, 9, '2025-07-05 16:41:34', '2025-07-05 16:41:34', NULL),
(10, 10, '2025-07-05 16:41:34', '2025-07-05 16:41:34', NULL),
(11, 11, '2025-07-05 16:41:34', '2025-07-05 16:41:34', NULL),
(12, 12, '2025-07-05 16:41:34', '2025-07-05 16:41:34', NULL),
(13, 13, '2025-07-05 16:41:34', '2025-07-05 16:41:34', NULL),
(14, 14, '2025-07-05 16:41:34', '2025-07-05 16:41:34', NULL),
(15, 15, '2025-07-05 16:41:34', '2025-07-05 16:41:34', NULL),
(16, 16, '2025-07-05 16:41:34', '2025-07-05 16:41:34', NULL),
(17, 17, '2025-07-05 16:41:34', '2025-07-05 16:41:34', NULL),
(18, 18, '2025-07-05 16:41:34', '2025-07-05 16:41:34', NULL),
(19, 19, '2025-07-05 16:41:34', '2025-07-05 16:41:34', NULL),
(20, 20, '2025-07-05 16:41:34', '2025-07-05 16:41:34', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tensanpham` text DEFAULT NULL,
  `gia_tien` float NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`id`, `tensanpham`, `gia_tien`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Quần jean', 7000, '2025-07-05 16:39:11', '2025-07-05 16:39:11', NULL),
(2, 'Áo may', 5000, '2025-07-05 16:39:11', '2025-07-05 16:39:11', NULL),
(3, 'Áo sơ mi', 8000, '2025-07-05 16:39:11', '2025-07-05 16:39:11', NULL),
(4, 'Quần tây', 9000, '2025-07-05 16:39:11', '2025-07-05 16:39:11', NULL),
(5, 'Áo khoác', 12000, '2025-07-05 16:39:11', '2025-07-05 16:39:11', NULL),
(6, 'Váy nữ', 15000, '2025-07-05 16:39:11', '2025-07-05 16:39:11', NULL),
(7, 'Áo thun', 6000, '2025-07-05 16:39:11', '2025-07-05 16:39:11', NULL),
(8, 'Quần short', 7000, '2025-07-05 16:39:11', '2025-07-05 16:39:11', NULL),
(9, 'Áo len', 11000, '2025-07-05 16:39:11', '2025-07-05 16:39:11', NULL),
(10, 'Áo vest', 20000, '2025-07-05 16:39:11', '2025-07-05 16:39:11', NULL),
(11, 'Quần kaki', 9500, '2025-07-05 16:39:11', '2025-07-05 16:39:11', NULL),
(12, 'Áo dài', 18000, '2025-07-05 16:39:11', '2025-07-05 16:39:11', NULL),
(13, 'Áo polo', 8500, '2025-07-05 16:39:11', '2025-07-05 16:39:11', NULL),
(14, 'Quần jogger', 10000, '2025-07-05 16:39:11', '2025-07-05 16:39:11', NULL),
(15, 'Áo hoodie', 17000, '2025-07-05 16:39:11', '2025-07-05 16:39:11', NULL),
(16, 'Áo ba lỗ', 4000, '2025-07-05 16:39:11', '2025-07-05 16:39:11', NULL),
(17, 'Quần legging', 10500, '2025-07-05 16:39:11', '2025-07-05 16:39:11', NULL),
(18, 'Áo croptop', 9500, '2025-07-05 16:39:11', '2025-07-05 16:39:11', NULL),
(19, 'Áo blazer', 21000, '2025-07-05 16:39:11', '2025-07-05 16:39:11', NULL),
(20, 'Quần baggy', 12000, '2025-07-05 16:39:11', '2025-07-05 16:39:11', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanluong`
--

CREATE TABLE `nhanluong` (
  `id` int(10) UNSIGNED NOT NULL,
  `nhanvien_id` int(10) UNSIGNED NOT NULL,
  `thuong` float DEFAULT NULL,
  `phat` float DEFAULT NULL,
  `tien_sp` float DEFAULT NULL,
  `thuclinh` bigint(20) NOT NULL,
  `thang` int(11) NOT NULL,
  `nam` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanluong`
--

INSERT INTO `nhanluong` (`id`, `nhanvien_id`, `thuong`, `phat`, `tien_sp`, `thuclinh`, `thang`, `nam`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1000, 200, 5000, 5800, 6, 2025, '2025-07-05 16:41:17', '2025-07-05 16:41:17', NULL),
(2, 2, 1200, 100, 6000, 7100, 6, 2025, '2025-07-05 16:41:17', '2025-07-05 16:41:17', NULL),
(3, 3, 1100, 150, 5500, 6450, 6, 2025, '2025-07-05 16:41:17', '2025-07-05 16:41:17', NULL),
(4, 4, 900, 100, 5200, 6000, 6, 2025, '2025-07-05 16:41:17', '2025-07-05 16:41:17', NULL),
(5, 5, 1300, 200, 7000, 8100, 6, 2025, '2025-07-05 16:41:17', '2025-07-05 16:41:17', NULL),
(6, 6, 1000, 100, 5000, 5900, 6, 2025, '2025-07-05 16:41:17', '2025-07-05 16:41:17', NULL),
(7, 7, 1200, 200, 6000, 7000, 6, 2025, '2025-07-05 16:41:17', '2025-07-05 16:41:17', NULL),
(8, 8, 1100, 150, 5500, 6450, 6, 2025, '2025-07-05 16:41:17', '2025-07-05 16:41:17', NULL),
(9, 9, 900, 100, 5200, 6000, 6, 2025, '2025-07-05 16:41:17', '2025-07-05 16:41:17', NULL),
(10, 10, 1300, 200, 7000, 8100, 6, 2025, '2025-07-05 16:41:17', '2025-07-05 16:41:17', NULL),
(11, 11, 1000, 100, 5000, 5900, 6, 2025, '2025-07-05 16:41:17', '2025-07-05 16:41:17', NULL),
(12, 12, 1200, 200, 6000, 7000, 6, 2025, '2025-07-05 16:41:17', '2025-07-05 16:41:17', NULL),
(13, 13, 1100, 150, 5500, 6450, 6, 2025, '2025-07-05 16:41:17', '2025-07-05 16:41:17', NULL),
(14, 14, 900, 100, 5200, 6000, 6, 2025, '2025-07-05 16:41:17', '2025-07-05 16:41:17', NULL),
(15, 15, 1300, 200, 7000, 8100, 6, 2025, '2025-07-05 16:41:17', '2025-07-05 16:41:17', NULL),
(16, 16, 1000, 100, 5000, 5900, 6, 2025, '2025-07-05 16:41:17', '2025-07-05 16:41:17', NULL),
(17, 17, 1200, 200, 6000, 7000, 6, 2025, '2025-07-05 16:41:17', '2025-07-05 16:41:17', NULL),
(18, 18, 1100, 150, 5500, 6450, 6, 2025, '2025-07-05 16:41:17', '2025-07-05 16:41:17', NULL),
(19, 19, 900, 100, 5200, 6000, 6, 2025, '2025-07-05 16:41:17', '2025-07-05 16:41:17', NULL),
(20, 20, 1300, 200, 7000, 8100, 6, 2025, '2025-07-05 16:41:17', '2025-07-05 16:41:17', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `id` int(10) UNSIGNED NOT NULL,
  `hovaten` varchar(100) NOT NULL,
  `gioitinh` tinyint(1) NOT NULL DEFAULT 0,
  `ngaysinh` date NOT NULL,
  `cmnd` varchar(50) NOT NULL,
  `sdt` varchar(15) NOT NULL,
  `diachi` varchar(255) DEFAULT NULL,
  `quequan` varchar(255) DEFAULT NULL,
  `trangthai` tinyint(1) NOT NULL DEFAULT 0,
  `photo_path` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`id`, `hovaten`, `gioitinh`, `ngaysinh`, `cmnd`, `sdt`, `diachi`, `quequan`, `trangthai`, `photo_path`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Quản trị viên', 0, '2005-04-13', '12323213', '12123213', 'Việt Nam', 'Việt Nam', 1, NULL, '2025-04-22 17:07:57', '2025-07-05 08:13:23', NULL),
(2, 'Tổ trưởng', 0, '2005-04-13', '', '', 'Việt Nam', 'Việt Nam', 1, NULL, '2025-04-22 10:07:57', '2025-04-22 10:07:57', NULL),
(3, 'Nhân viên Test', 0, '2005-04-13', '421421421421', '213214321', 'Việt Nam', 'Việt Nam', 1, NULL, '2025-04-22 10:07:57', '2025-07-05 08:14:34', NULL),
(4, 'Nguyen Van D', 1, '1993-04-04', '123456782', '0901000004', 'Hà Nội', 'Hà Nội', 1, NULL, '2025-07-05 16:39:56', '2025-07-05 16:39:56', NULL),
(5, 'Nguyen Van E', 1, '1994-05-05', '123456783', '0901000005', 'Hà Nội', 'Hà Nội', 0, NULL, '2025-07-05 16:39:56', '2025-07-05 16:39:56', NULL),
(6, 'Nguyen Van F', 1, '1995-06-06', '123456784', '0901000006', 'Hà Nội', 'Hà Nội', 1, NULL, '2025-07-05 16:39:56', '2025-07-05 16:39:56', NULL),
(7, 'Nguyen Van G', 1, '1996-07-07', '123456785', '0901000007', 'Hà Nội', 'Hà Nội', 0, NULL, '2025-07-05 16:39:56', '2025-07-05 16:39:56', NULL),
(8, 'Nguyen Van H', 1, '1997-08-08', '123456786', '0901000008', 'Hà Nội', 'Hà Nội', 1, NULL, '2025-07-05 16:39:56', '2025-07-05 16:39:56', NULL),
(9, 'Nguyen Van I', 1, '1998-09-09', '123456787', '0901000009', 'Hà Nội', 'Hà Nội', 0, NULL, '2025-07-05 16:39:56', '2025-07-05 16:39:56', NULL),
(10, 'Nguyen Van J', 1, '1999-10-10', '123456788', '0901000010', 'Hà Nội', 'Hà Nội', 1, NULL, '2025-07-05 16:39:56', '2025-07-05 16:39:56', NULL),
(11, 'Nguyen Van K', 1, '1990-11-11', '1234567891', '0901000011', 'Hà Nội', 'Hà Nội', 0, NULL, '2025-07-05 16:39:56', '2025-07-05 16:39:56', NULL),
(12, 'Nguyen Van L', 1, '1991-12-12', '1234567892', '0901000012', 'Hà Nội', 'Hà Nội', 1, NULL, '2025-07-05 16:39:56', '2025-07-05 16:39:56', NULL),
(13, 'Nguyen Van M', 1, '1992-01-13', '1234567893', '0901000013', 'Hà Nội', 'Hà Nội', 0, NULL, '2025-07-05 16:39:56', '2025-07-05 16:39:56', NULL),
(14, 'Nguyen Van N', 1, '1993-02-14', '1234567894', '0901000014', 'Hà Nội', 'Hà Nội', 1, NULL, '2025-07-05 16:39:56', '2025-07-05 16:39:56', NULL),
(15, 'Nguyen Van O', 1, '1994-03-15', '1234567895', '0901000015', 'Hà Nội', 'Hà Nội', 0, NULL, '2025-07-05 16:39:56', '2025-07-05 16:39:56', NULL),
(16, 'Nguyen Van P', 1, '1995-04-16', '1234567896', '0901000016', 'Hà Nội', 'Hà Nội', 1, NULL, '2025-07-05 16:39:56', '2025-07-05 16:39:56', NULL),
(17, 'Nguyen Van Q', 1, '1996-05-17', '1234567897', '0901000017', 'Hà Nội', 'Hà Nội', 0, NULL, '2025-07-05 16:39:56', '2025-07-05 16:39:56', NULL),
(18, 'Nguyen Van R', 1, '1997-06-18', '1234567898', '0901000018', 'Hà Nội', 'Hà Nội', 1, NULL, '2025-07-05 16:39:56', '2025-07-05 16:39:56', NULL),
(19, 'Nguyen Van S', 1, '1998-07-19', '1234567899', '0901000019', 'Hà Nội', 'Hà Nội', 0, NULL, '2025-07-05 16:39:56', '2025-07-05 16:39:56', NULL),
(20, 'Nguyen Van T', 1, '1999-08-20', '1234567800', '0901000020', 'Hà Nội', 'Hà Nội', 1, NULL, '2025-07-05 16:39:56', '2025-07-05 16:39:56', NULL),
(21, 'Nguyen Van A', 1, '1990-01-01', '123456789', '0901000001', 'Hà Nội', 'Hà Nội', 0, NULL, '2025-07-05 16:39:56', '2025-07-05 16:39:56', NULL),
(22, 'Nguyen Van B', 1, '1991-02-02', '123456780', '0901000002', 'Hà Nội', 'Hà Nội', 1, NULL, '2025-07-05 16:39:56', '2025-07-05 16:39:56', NULL),
(23, 'Nguyen Van C', 1, '1992-03-03', '123456781', '0901000003', 'Hà Nội', 'Hà Nội', 0, NULL, '2025-07-05 16:39:56', '2025-07-05 16:39:56', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phan_hois`
--

CREATE TABLE `phan_hois` (
  `id` int(10) UNSIGNED NOT NULL,
  `nhanvien_id` int(10) UNSIGNED NOT NULL,
  `type_phan_hoi` int(10) DEFAULT NULL,
  `noi_dung` text DEFAULT NULL,
  `giai_dap` text DEFAULT NULL,
  `is_giaiquyet` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phan_hois`
--

INSERT INTO `phan_hois` (`id`, `nhanvien_id`, `type_phan_hoi`, `noi_dung`, `giai_dap`, `is_giaiquyet`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'Góp ý 1', 'Đã giải đáp', 1, '2025-07-05 16:41:58', '2025-07-05 16:41:58', NULL),
(2, 2, 2, 'Góp ý 2', 'Đã giải đáp', 1, '2025-07-05 16:41:58', '2025-07-05 16:41:58', NULL),
(3, 3, 1, 'Góp ý 3', 'Đã giải đáp', 1, '2025-07-05 16:41:58', '2025-07-05 16:41:58', NULL),
(4, 4, 2, 'Góp ý 4', 'Đã giải đáp', 1, '2025-07-05 16:41:58', '2025-07-05 16:41:58', NULL),
(5, 5, 1, 'Góp ý 5', 'Đã giải đáp', 1, '2025-07-05 16:41:58', '2025-07-05 16:41:58', NULL),
(6, 6, 2, 'Góp ý 6', 'Đã giải đáp', 1, '2025-07-05 16:41:58', '2025-07-05 16:41:58', NULL),
(7, 7, 1, 'Góp ý 7', 'Đã giải đáp', 1, '2025-07-05 16:41:58', '2025-07-05 16:41:58', NULL),
(8, 8, 2, 'Góp ý 8', 'Đã giải đáp', 1, '2025-07-05 16:41:58', '2025-07-05 16:41:58', NULL),
(9, 9, 1, 'Góp ý 9', 'Đã giải đáp', 1, '2025-07-05 16:41:58', '2025-07-05 16:41:58', NULL),
(10, 10, 2, 'Góp ý 10', 'Đã giải đáp', 1, '2025-07-05 16:41:58', '2025-07-05 16:41:58', NULL),
(11, 11, 1, 'Góp ý 11', 'Đã giải đáp', 1, '2025-07-05 16:41:58', '2025-07-05 16:41:58', NULL),
(12, 12, 2, 'Góp ý 12', 'Đã giải đáp', 1, '2025-07-05 16:41:58', '2025-07-05 16:41:58', NULL),
(13, 13, 1, 'Góp ý 13', 'Đã giải đáp', 1, '2025-07-05 16:41:58', '2025-07-05 16:41:58', NULL),
(14, 14, 2, 'Góp ý 14', 'Đã giải đáp', 1, '2025-07-05 16:41:58', '2025-07-05 16:41:58', NULL),
(15, 15, 1, 'Góp ý 15', 'Đã giải đáp', 1, '2025-07-05 16:41:58', '2025-07-05 16:41:58', NULL),
(16, 16, 2, 'Góp ý 16', 'Đã giải đáp', 1, '2025-07-05 16:41:58', '2025-07-05 16:41:58', NULL),
(17, 17, 1, 'Góp ý 17', 'Đã giải đáp', 1, '2025-07-05 16:41:58', '2025-07-05 16:41:58', NULL),
(18, 18, 2, 'Góp ý 18', 'Đã giải đáp', 1, '2025-07-05 16:41:58', '2025-07-05 16:41:58', NULL),
(19, 19, 1, 'Góp ý 19', 'Đã giải đáp', 1, '2025-07-05 16:41:58', '2025-07-05 16:41:58', NULL),
(20, 20, 2, 'Góp ý 20', 'Đã giải đáp', 1, '2025-07-05 16:41:58', '2025-07-05 16:41:58', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `san_phams`
--

CREATE TABLE `san_phams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `danhmuc_id` bigint(20) UNSIGNED NOT NULL,
  `nhanvien_id` int(10) UNSIGNED NOT NULL,
  `ngay_san_xuat` date NOT NULL,
  `so_luong_dat` int(11) NOT NULL,
  `so_luong_khong_dat` int(11) NOT NULL,
  `ghi_chu` text DEFAULT NULL,
  `nguoi_danh_gia_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `san_phams`
--

INSERT INTO `san_phams` (`id`, `danhmuc_id`, `nhanvien_id`, `ngay_san_xuat`, `so_luong_dat`, `so_luong_khong_dat`, `ghi_chu`, `nguoi_danh_gia_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2025-06-01', 10, 2, 'Ghi chú 1', 2, '2025-07-05 16:40:52', '2025-07-05 16:40:52', NULL),
(2, 2, 2, '2025-06-02', 12, 1, 'Ghi chú 2', 3, '2025-07-05 16:40:52', '2025-07-05 16:40:52', NULL),
(3, 3, 3, '2025-06-03', 15, 0, 'Ghi chú 3', 4, '2025-07-05 16:40:52', '2025-07-05 16:40:52', NULL),
(4, 4, 4, '2025-06-04', 8, 3, 'Ghi chú 4', 5, '2025-07-05 16:40:52', '2025-07-05 16:40:52', NULL),
(5, 5, 5, '2025-06-05', 20, 2, 'Ghi chú 5', 6, '2025-07-05 16:40:52', '2025-07-05 16:40:52', NULL),
(6, 6, 6, '2025-06-06', 18, 1, 'Ghi chú 6', 7, '2025-07-05 16:40:52', '2025-07-05 16:40:52', NULL),
(7, 17, 7, '2025-06-07', 14, 2, 'Ghi chú 7', 8, '2025-07-05 16:40:52', '2025-07-05 16:40:52', NULL),
(8, 8, 8, '2025-06-08', 16, 0, 'Ghi chú 8', 9, '2025-07-05 16:40:52', '2025-07-05 16:40:52', NULL),
(9, 9, 9, '2025-06-09', 11, 1, 'Ghi chú 9', 10, '2025-07-05 16:40:52', '2025-07-05 16:40:52', NULL),
(10, 10, 10, '2025-06-10', 13, 2, 'Ghi chú 10', 11, '2025-07-05 16:40:52', '2025-07-05 16:40:52', NULL),
(11, 11, 11, '2025-06-11', 17, 0, 'Ghi chú 11', 12, '2025-07-05 16:40:52', '2025-07-05 16:40:52', NULL),
(12, 12, 12, '2025-06-12', 19, 1, 'Ghi chú 12', 13, '2025-07-05 16:40:52', '2025-07-05 16:40:52', NULL),
(13, 13, 13, '2025-06-13', 21, 2, 'Ghi chú 13', 14, '2025-07-05 16:40:52', '2025-07-05 16:40:52', NULL),
(14, 14, 14, '2025-06-14', 22, 0, 'Ghi chú 14', 15, '2025-07-05 16:40:52', '2025-07-05 16:40:52', NULL),
(15, 15, 15, '2025-06-15', 23, 1, 'Ghi chú 15', 16, '2025-07-05 16:40:52', '2025-07-05 16:40:52', NULL),
(16, 16, 16, '2025-06-16', 24, 2, 'Ghi chú 16', 17, '2025-07-05 16:40:52', '2025-07-05 16:40:52', NULL),
(17, 17, 17, '2025-06-17', 25, 0, 'Ghi chú 17', 18, '2025-07-05 16:40:52', '2025-07-05 16:40:52', NULL),
(18, 18, 18, '2025-06-18', 26, 1, 'Ghi chú 18', 19, '2025-07-05 16:40:52', '2025-07-05 16:40:52', NULL),
(19, 19, 19, '2025-06-19', 27, 2, 'Ghi chú 19', 20, '2025-07-05 16:40:52', '2025-07-05 16:40:52', NULL),
(20, 20, 20, '2025-06-20', 28, 0, 'Ghi chú 20', 1, '2025-07-05 16:40:52', '2025-07-05 16:40:52', NULL),
(21, 1, 1, '2025-07-01', 15, 2, 'Sản xuất Quần jean tháng 7', 2, '2025-07-05 16:55:43', '2025-07-05 16:55:43', NULL),
(22, 2, 2, '2025-07-02', 20, 1, 'Sản xuất Áo thun tháng 7', 3, '2025-07-05 16:55:43', '2025-07-05 16:55:43', NULL),
(23, 3, 3, '2025-07-03', 18, 0, 'Sản xuất Váy nữ tháng 7', 4, '2025-07-05 16:55:43', '2025-07-05 16:55:43', NULL),
(24, 14, 4, '2025-07-04', 12, 3, 'Sản xuất Áo sơ mi tháng 7', 5, '2025-07-05 16:55:43', '2025-07-05 16:55:43', NULL),
(25, 5, 5, '2025-07-05', 25, 2, 'Sản xuất Quần tây tháng 7', 6, '2025-07-05 16:55:43', '2025-07-05 16:55:43', NULL),
(26, 1, 6, '2025-07-06', 16, 1, 'Sản xuất Quần jean tháng 7', 7, '2025-07-05 16:55:43', '2025-07-05 16:55:43', NULL),
(27, 2, 7, '2025-07-07', 22, 0, 'Sản xuất Áo thun tháng 7', 8, '2025-07-05 16:55:43', '2025-07-05 16:55:43', NULL),
(28, 13, 8, '2025-07-08', 19, 2, 'Sản xuất Váy nữ tháng 7', 9, '2025-07-05 16:55:43', '2025-07-05 16:55:43', NULL),
(29, 4, 9, '2025-07-09', 14, 1, 'Sản xuất Áo sơ mi tháng 7', 10, '2025-07-05 16:55:43', '2025-07-05 16:55:43', NULL),
(30, 15, 10, '2025-07-10', 28, 3, 'Sản xuất Quần tây tháng 7', 1, '2025-07-05 16:55:43', '2025-07-05 16:55:43', NULL),
(31, 1, 1, '2025-07-11', 17, 0, 'Sản xuất Quần jean tháng 7', 2, '2025-07-05 16:55:43', '2025-07-05 16:55:43', NULL),
(32, 2, 2, '2025-07-12', 21, 1, 'Sản xuất Áo thun tháng 7', 3, '2025-07-05 16:55:43', '2025-07-05 16:55:43', NULL),
(33, 13, 3, '2025-07-13', 23, 2, 'Sản xuất Váy nữ tháng 7', 4, '2025-07-05 16:55:43', '2025-07-05 16:55:43', NULL),
(34, 4, 4, '2025-07-14', 13, 0, 'Sản xuất Áo sơ mi tháng 7', 5, '2025-07-05 16:55:43', '2025-07-05 16:55:43', NULL),
(35, 5, 5, '2025-07-15', 26, 1, 'Sản xuất Quần tây tháng 7', 6, '2025-07-05 16:55:43', '2025-07-05 16:55:43', NULL),
(36, 11, 6, '2025-07-16', 18, 2, 'Sản xuất Quần jean tháng 7', 7, '2025-07-05 16:55:43', '2025-07-05 16:55:43', NULL),
(37, 2, 7, '2025-07-17', 24, 0, 'Sản xuất Áo thun tháng 7', 8, '2025-07-05 16:55:43', '2025-07-05 16:55:43', NULL),
(38, 3, 8, '2025-07-18', 20, 1, 'Sản xuất Váy nữ tháng 7', 9, '2025-07-05 16:55:43', '2025-07-05 16:55:43', NULL),
(39, 14, 9, '2025-07-19', 15, 2, 'Sản xuất Áo sơ mi tháng 7', 10, '2025-07-05 16:55:43', '2025-07-05 16:55:43', NULL),
(40, 5, 10, '2025-07-20', 27, 1, 'Sản xuất Quần tây tháng 7', 1, '2025-07-05 16:55:43', '2025-07-05 16:55:43', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('IUoez30549JQ9uy9vdJq2V8rnSHrYjCaQHgIKDUc', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoidzZuRjJ2a0xJYVdUbGJ0bWV6NndMSDBqZHhvejZSYWJjVGdGZVFOWCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9uaGFubHVvbmcvMS9lZGl0Ijt9fQ==', 1751730438),
('mbjIOUOuLCIF1QbS26AutdoKFa5AlJVSzY49Vs5a', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZkQxNFdXdEpLSk51WXNhSkpMandZcFREa1Y2ZVVGRm5WOGlCRmo2byI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIxOiJodHRwOi8vbG9jYWxob3N0OjgwMDAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1751734615);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thuongphat`
--

CREATE TABLE `thuongphat` (
  `id` int(10) UNSIGNED NOT NULL,
  `nhanvien_id` int(10) UNSIGNED NOT NULL,
  `loai` tinyint(1) NOT NULL DEFAULT 0,
  `sotien` bigint(20) NOT NULL,
  `lydo` varchar(255) NOT NULL,
  `thang` int(11) NOT NULL,
  `nam` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `thuongphat`
--

INSERT INTO `thuongphat` (`id`, `nhanvien_id`, `loai`, `sotien`, `lydo`, `thang`, `nam`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 0, 500, 'Đi muộn', 6, 2025, '2025-07-05 16:41:48', '2025-07-05 16:41:48', NULL),
(2, 2, 1, 1000, 'Làm tốt', 6, 2025, '2025-07-05 16:41:48', '2025-07-05 16:41:48', NULL),
(3, 3, 0, 300, 'Nghỉ không phép', 6, 2025, '2025-07-05 16:41:48', '2025-07-05 16:41:48', NULL),
(4, 4, 1, 1200, 'Hoàn thành xuất sắc', 6, 2025, '2025-07-05 16:41:48', '2025-07-05 16:41:48', NULL),
(5, 5, 0, 400, 'Đi muộn', 6, 2025, '2025-07-05 16:41:48', '2025-07-05 16:41:48', NULL),
(6, 6, 1, 1100, 'Làm tốt', 6, 2025, '2025-07-05 16:41:48', '2025-07-05 16:41:48', NULL),
(7, 7, 0, 350, 'Nghỉ không phép', 6, 2025, '2025-07-05 16:41:48', '2025-07-05 16:41:48', NULL),
(8, 8, 1, 1300, 'Hoàn thành xuất sắc', 6, 2025, '2025-07-05 16:41:48', '2025-07-05 16:41:48', NULL),
(9, 9, 0, 450, 'Đi muộn', 6, 2025, '2025-07-05 16:41:48', '2025-07-05 16:41:48', NULL),
(10, 10, 1, 1400, 'Làm tốt', 6, 2025, '2025-07-05 16:41:48', '2025-07-05 16:41:48', NULL),
(11, 11, 0, 320, 'Nghỉ không phép', 6, 2025, '2025-07-05 16:41:48', '2025-07-05 16:41:48', NULL),
(12, 12, 1, 1250, 'Hoàn thành xuất sắc', 6, 2025, '2025-07-05 16:41:48', '2025-07-05 16:41:48', NULL),
(13, 13, 0, 410, 'Đi muộn', 6, 2025, '2025-07-05 16:41:48', '2025-07-05 16:41:48', NULL),
(14, 14, 1, 1350, 'Làm tốt', 6, 2025, '2025-07-05 16:41:48', '2025-07-05 16:41:48', NULL),
(15, 15, 0, 370, 'Nghỉ không phép', 6, 2025, '2025-07-05 16:41:48', '2025-07-05 16:41:48', NULL),
(16, 16, 1, 1150, 'Hoàn thành xuất sắc', 6, 2025, '2025-07-05 16:41:48', '2025-07-05 16:41:48', NULL),
(17, 17, 0, 430, 'Đi muộn', 6, 2025, '2025-07-05 16:41:48', '2025-07-05 16:41:48', NULL),
(18, 18, 1, 1450, 'Làm tốt', 6, 2025, '2025-07-05 16:41:48', '2025-07-05 16:41:48', NULL),
(19, 19, 0, 390, 'Nghỉ không phép', 6, 2025, '2025-07-05 16:41:48', '2025-07-05 16:41:48', NULL),
(20, 20, 1, 1500, 'Hoàn thành xuất sắc', 6, 2025, '2025-07-05 16:41:48', '2025-07-05 16:41:48', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `nhanvien_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(50) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `nhanvien_id`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'admin@email.com', '2025-04-22 17:07:57', '$2y$10$Trs9p//.lUGwDTkIPejkauGz.dMJkOEd9Qz9nEeAtrLZEWR4pKhJC', 2, 'ffIUpR2JHUkOgOweeyD7UruZHD2QjOZltXhv0G5XNQOwBVDLjN8HxT77CnUa', '2025-04-22 17:07:57', '2025-04-22 17:07:57', NULL),
(2, 2, 'quanly@email.com', '2025-04-22 17:07:57', '$2y$10$.YOlTZpZOOgG6av3GtYs/OPB5haseGHDZA1o4zvpTqfk/R4Nu4J/W', 1, '770mAsWfNZ', '2025-04-22 17:07:58', '2025-04-22 17:07:58', NULL),
(3, 3, 'nhanvien@email.com', '2025-04-22 17:07:58', '$2y$10$u9/ac55By.PaoEPUuLDc6.VMlfkXeo2o.8MhUZr6gVceSHLWCg9gu', 0, 'Gs3KNSjmpw', '2025-04-22 17:07:58', '2025-04-22 17:07:58', NULL),
(4, 4, 'user4@email.com', '2025-07-05 16:40:43', 'password', 0, NULL, '2025-07-05 16:40:43', '2025-07-05 16:40:43', NULL),
(5, 5, 'user5@email.com', '2025-07-05 16:40:43', 'password', 0, NULL, '2025-07-05 16:40:43', '2025-07-05 16:40:43', NULL),
(6, 6, 'user6@email.com', '2025-07-05 16:40:43', 'password', 0, NULL, '2025-07-05 16:40:43', '2025-07-05 16:40:43', NULL),
(7, 7, 'user7@email.com', '2025-07-05 16:40:43', 'password', 0, NULL, '2025-07-05 16:40:43', '2025-07-05 16:40:43', NULL),
(8, 8, 'user8@email.com', '2025-07-05 16:40:43', 'password', 0, NULL, '2025-07-05 16:40:43', '2025-07-05 16:40:43', NULL),
(9, 9, 'user9@email.com', '2025-07-05 16:40:43', 'password', 0, NULL, '2025-07-05 16:40:43', '2025-07-05 16:40:43', NULL),
(10, 10, 'user10@email.com', '2025-07-05 16:40:43', 'password', 0, NULL, '2025-07-05 16:40:43', '2025-07-05 16:40:43', NULL),
(11, 11, 'user11@email.com', '2025-07-05 16:40:43', 'password', 0, NULL, '2025-07-05 16:40:43', '2025-07-05 16:40:43', NULL),
(12, 12, 'user12@email.com', '2025-07-05 16:40:43', 'password', 0, NULL, '2025-07-05 16:40:43', '2025-07-05 16:40:43', NULL),
(13, 13, 'user13@email.com', '2025-07-05 16:40:43', 'password', 0, NULL, '2025-07-05 16:40:43', '2025-07-05 16:40:43', NULL),
(14, 14, 'user14@email.com', '2025-07-05 16:40:43', 'password', 0, NULL, '2025-07-05 16:40:43', '2025-07-05 16:40:43', NULL),
(15, 15, 'user15@email.com', '2025-07-05 16:40:43', 'password', 0, NULL, '2025-07-05 16:40:43', '2025-07-05 16:40:43', NULL),
(16, 16, 'user16@email.com', '2025-07-05 16:40:43', 'password', 0, NULL, '2025-07-05 16:40:43', '2025-07-05 16:40:43', NULL),
(17, 17, 'user17@email.com', '2025-07-05 16:40:43', 'password', 0, NULL, '2025-07-05 16:40:43', '2025-07-05 16:40:43', NULL),
(18, 18, 'user18@email.com', '2025-07-05 16:40:43', 'password', 0, NULL, '2025-07-05 16:40:43', '2025-07-05 16:40:43', NULL),
(19, 19, 'user19@email.com', '2025-07-05 16:40:43', 'password', 0, NULL, '2025-07-05 16:40:43', '2025-07-05 16:40:43', NULL),
(20, 20, 'user20@email.com', '2025-07-05 16:40:43', 'password', 0, NULL, '2025-07-05 16:40:43', '2025-07-05 16:40:43', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chamcong`
--
ALTER TABLE `chamcong`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_chamcong_nhanvien_id` (`nhanvien_id`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nhanluong`
--
ALTER TABLE `nhanluong`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_nhanluong_nhanvien_id` (`nhanvien_id`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `phan_hois`
--
ALTER TABLE `phan_hois`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_phan_hois_nhanvien_id` (`nhanvien_id`);

--
-- Chỉ mục cho bảng `san_phams`
--
ALTER TABLE `san_phams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_san_phams_nhanvien_id` (`nhanvien_id`),
  ADD KEY `fk_san_phams_users_id` (`nguoi_danh_gia_id`),
  ADD KEY `san_phams_ibfk_1` (`danhmuc_id`);

--
-- Chỉ mục cho bảng `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Chỉ mục cho bảng `thuongphat`
--
ALTER TABLE `thuongphat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_thuongphat_nhanvien_id` (`nhanvien_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_nhanvien_id_unique` (`nhanvien_id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chamcong`
--
ALTER TABLE `chamcong`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `nhanluong`
--
ALTER TABLE `nhanluong`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `phan_hois`
--
ALTER TABLE `phan_hois`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `san_phams`
--
ALTER TABLE `san_phams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `thuongphat`
--
ALTER TABLE `thuongphat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chamcong`
--
ALTER TABLE `chamcong`
  ADD CONSTRAINT `fk_chamcong_nhanvien_id` FOREIGN KEY (`nhanvien_id`) REFERENCES `nhanvien` (`id`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `nhanluong`
--
ALTER TABLE `nhanluong`
  ADD CONSTRAINT `fk_nhanluong_nhanvien_id` FOREIGN KEY (`nhanvien_id`) REFERENCES `nhanvien` (`id`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `phan_hois`
--
ALTER TABLE `phan_hois`
  ADD CONSTRAINT `fk_phan_hois_nhanvien_id` FOREIGN KEY (`nhanvien_id`) REFERENCES `nhanvien` (`id`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `san_phams`
--
ALTER TABLE `san_phams`
  ADD CONSTRAINT `fk_san_phams_nhanvien_id` FOREIGN KEY (`nhanvien_id`) REFERENCES `nhanvien` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_san_phams_users_id` FOREIGN KEY (`nguoi_danh_gia_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `san_phams_ibfk_1` FOREIGN KEY (`danhmuc_id`) REFERENCES `danhmuc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `thuongphat`
--
ALTER TABLE `thuongphat`
  ADD CONSTRAINT `fk_thuongphat_nhanvien_id` FOREIGN KEY (`nhanvien_id`) REFERENCES `nhanvien` (`id`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_nhanvien_id` FOREIGN KEY (`nhanvien_id`) REFERENCES `nhanvien` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
