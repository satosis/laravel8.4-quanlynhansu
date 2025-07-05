-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 05, 2025 lúc 04:16 PM
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

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanluong`
--

CREATE TABLE `nhanluong` (
  `id` int(10) UNSIGNED NOT NULL,
  `nhanvien_id` int(10) UNSIGNED NOT NULL,
  `ngaycongchuan` int(11) NOT NULL,
  `ngaycong` int(11) NOT NULL,
  `thuclinh` bigint(20) NOT NULL,
  `thang` int(11) NOT NULL,
  `nam` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'Quản trị viên', 0, '2005-04-13', '', '', 'Việt Nam', 'Việt Nam', 1, NULL, '2025-04-22 17:07:57', '2025-04-22 17:07:57', NULL),
(2, 'Tổ trưởng', 0, '2005-04-13', '', '', 'Việt Nam', 'Việt Nam', 1, NULL, '2025-04-22 10:07:57', '2025-04-22 10:07:57', NULL),
(3, 'Nhân viên Test', 0, '2005-04-13', '', '', 'Việt Nam', 'Việt Nam', 1, NULL, '2025-04-22 10:07:57', '2025-04-22 10:07:57', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phan_hois`
--

CREATE TABLE `phan_hois` (
  `id` int(10) UNSIGNED NOT NULL,
  `nhanvien_id` int(10) UNSIGNED NOT NULL,
  `type_phan_hoi` int(10) DEFAULT NULL,
  `ghi_chu` text DEFAULT NULL,
  `giai_dap` text DEFAULT NULL,
  `is_giaiquyet` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
('IUoez30549JQ9uy9vdJq2V8rnSHrYjCaQHgIKDUc', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoidzZuRjJ2a0xJYVdUbGJ0bWV6NndMSDBqZHhvejZSYWJjVGdGZVFOWCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90aHVvbmdwaGF0LzEvY3JlYXRlIjt9fQ==', 1751723983);

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
(3, 3, 'nhanvien@email.com', '2025-04-22 17:07:58', '$2y$10$u9/ac55By.PaoEPUuLDc6.VMlfkXeo2o.8MhUZr6gVceSHLWCg9gu', 0, 'Gs3KNSjmpw', '2025-04-22 17:07:58', '2025-04-22 17:07:58', NULL);

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
  ADD UNIQUE KEY `fk_san_phams_danhmuc_id` (`danhmuc_id`),
  ADD KEY `fk_san_phams_nhanvien_id` (`nhanvien_id`),
  ADD KEY `fk_san_phams_users_id` (`nguoi_danh_gia_id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `nhanluong`
--
ALTER TABLE `nhanluong`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `phan_hois`
--
ALTER TABLE `phan_hois`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `thuongphat`
--
ALTER TABLE `thuongphat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
