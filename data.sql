
DROP TABLE IF EXISTS `bangcap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bangcap` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tenbc` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bangcap`
--

/*!40000 ALTER TABLE `bangcap` DISABLE KEYS */;
INSERT INTO `bangcap` VALUES (1,'Tiến Sĩ','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(2,'Thạc Sĩ','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(3,'Cử Nhân','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(4,'Đại Học','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(5,'Cao Đẳng','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL);
/*!40000 ALTER TABLE `bangcap` ENABLE KEYS */;

--
-- Table structure for table `baohiem`
--

DROP TABLE IF EXISTS `baohiem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `baohiem` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nhanvien_id` int(10) unsigned NOT NULL,
  `loaibaohiem_id` int(10) unsigned NOT NULL,
  `maso` varchar(255) NOT NULL,
  `noicap` varchar(255) NOT NULL,
  `ngaycap` date NOT NULL,
  `ngayhethan` date NOT NULL,
  `mucdong` double(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_baohiem_nhanvien_id` (`nhanvien_id`),
  KEY `fk_baohiem_loaibaohiem_id` (`loaibaohiem_id`),
  CONSTRAINT `fk_baohiem_loaibaohiem_id` FOREIGN KEY (`loaibaohiem_id`) REFERENCES `loaibaohiem` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_baohiem_nhanvien_id` FOREIGN KEY (`nhanvien_id`) REFERENCES `nhanvien` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baohiem`
--

/*!40000 ALTER TABLE `baohiem` DISABLE KEYS */;
INSERT INTO `baohiem` VALUES (1,18,2,'BH31431','Manulife','2025-04-09','2025-05-02',2.00,'2025-04-23 00:23:06','2025-04-23 00:23:06',NULL);
/*!40000 ALTER TABLE `baohiem` ENABLE KEYS */;

--
-- Table structure for table `chamcong`
--

DROP TABLE IF EXISTS `chamcong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chamcong` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nhanvien_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_chamcong_nhanvien_id` (`nhanvien_id`),
  CONSTRAINT `fk_chamcong_nhanvien_id` FOREIGN KEY (`nhanvien_id`) REFERENCES `nhanvien` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chamcong`
--

/*!40000 ALTER TABLE `chamcong` DISABLE KEYS */;
INSERT INTO `chamcong` VALUES (1,22,'2025-04-22 17:00:00','2025-04-23 00:14:15',NULL),(2,17,'2025-04-22 17:00:00','2025-04-23 00:15:07',NULL);
/*!40000 ALTER TABLE `chamcong` ENABLE KEYS */;

--
-- Table structure for table `chucvu`
--

DROP TABLE IF EXISTS `chucvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chucvu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tencv` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chucvu`
--

/*!40000 ALTER TABLE `chucvu` DISABLE KEYS */;
INSERT INTO `chucvu` VALUES (1,'Trưởng Phòng','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(2,'Trưởng Phòng','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(3,'Phó Phòng','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(4,'Marketing','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(5,'Nhân Viên','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL);
/*!40000 ALTER TABLE `chucvu` ENABLE KEYS */;

--
-- Table structure for table `chuyenmon`
--

DROP TABLE IF EXISTS `chuyenmon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chuyenmon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tencm` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chuyenmon`
--

/*!40000 ALTER TABLE `chuyenmon` DISABLE KEYS */;
INSERT INTO `chuyenmon` VALUES (1,'Programmer','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(2,'Tester','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(3,'Front-end','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(4,'Back-end','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(5,'Full-Stack','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL);
/*!40000 ALTER TABLE `chuyenmon` ENABLE KEYS */;

--
-- Table structure for table `dantoc`
--

DROP TABLE IF EXISTS `dantoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dantoc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tendt` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dantoc`
--

/*!40000 ALTER TABLE `dantoc` DISABLE KEYS */;
INSERT INTO `dantoc` VALUES (1,'Kinh','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(2,'Thái','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(3,'Mường','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(4,'Khmer','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(5,'Hoa','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(6,'Nùng','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(7,'H Mông','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL);
/*!40000 ALTER TABLE `dantoc` ENABLE KEYS */;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

--
-- Table structure for table `heso`
--

DROP TABLE IF EXISTS `heso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `heso` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `luongcb` bigint(20) NOT NULL,
  `bac1` double(5,2) NOT NULL,
  `bac2` double(5,2) NOT NULL,
  `bac3` double(5,2) NOT NULL,
  `bac4` double(5,2) NOT NULL,
  `bac5` double(5,2) NOT NULL,
  `bac6` double(5,2) NOT NULL,
  `bac7` double(5,2) NOT NULL,
  `bac8` double(5,2) NOT NULL,
  `bac9` double(5,2) NOT NULL,
  `bac10` double(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heso`
--

/*!40000 ALTER TABLE `heso` DISABLE KEYS */;
INSERT INTO `heso` VALUES (1,1500000,1.00,1.20,1.40,1.60,1.80,1.90,2.00,2.20,2.40,2.60,'2025-04-23 00:07:57','2025-04-23 00:07:57',NULL);
/*!40000 ALTER TABLE `heso` ENABLE KEYS */;

--
-- Table structure for table `hopdong`
--

DROP TABLE IF EXISTS `hopdong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hopdong` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nhanvien_id` int(10) unsigned NOT NULL,
  `ngaybd` date NOT NULL,
  `ngaykt` date DEFAULT NULL,
  `loaihopdong` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hopdong_nhanvien_id` (`nhanvien_id`),
  CONSTRAINT `fk_hopdong_nhanvien_id` FOREIGN KEY (`nhanvien_id`) REFERENCES `nhanvien` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hopdong`
--

/*!40000 ALTER TABLE `hopdong` DISABLE KEYS */;
INSERT INTO `hopdong` VALUES (1,18,'2025-04-03','2026-10-23',1,'2025-04-23 00:24:23','2025-04-23 00:24:23',NULL);
/*!40000 ALTER TABLE `hopdong` ENABLE KEYS */;

--
-- Table structure for table `khautru`
--

DROP TABLE IF EXISTS `khautru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khautru` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nhanvien_id` int(10) unsigned NOT NULL,
  `loaibaohiem_id` int(10) unsigned NOT NULL,
  `mucdong` double(5,2) NOT NULL,
  `thang` int(11) NOT NULL,
  `nam` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_khautru_nhanvien_id` (`nhanvien_id`),
  KEY `fk_khautru_loaibaohiem_id` (`loaibaohiem_id`),
  CONSTRAINT `fk_khautru_loaibaohiem_id` FOREIGN KEY (`loaibaohiem_id`) REFERENCES `loaibaohiem` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_khautru_nhanvien_id` FOREIGN KEY (`nhanvien_id`) REFERENCES `nhanvien` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khautru`
--

/*!40000 ALTER TABLE `khautru` DISABLE KEYS */;
INSERT INTO `khautru` VALUES (1,18,2,2.00,4,2025,'2025-04-23 00:28:55','2025-04-23 00:28:55',NULL);
/*!40000 ALTER TABLE `khautru` ENABLE KEYS */;

--
-- Table structure for table `loaibaohiem`
--

DROP TABLE IF EXISTS `loaibaohiem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaibaohiem` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tenbh` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaibaohiem`
--

/*!40000 ALTER TABLE `loaibaohiem` DISABLE KEYS */;
INSERT INTO `loaibaohiem` VALUES (1,'Bảo Hiểm Xã Hội','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(2,'Bảo Hiểm Y Tế','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(3,'Bảo Hiểm Tai Nạn','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(4,'Bảo Hiểm Thất Nghiệp','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL);
/*!40000 ALTER TABLE `loaibaohiem` ENABLE KEYS */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2020_01_01_000001_create_password_resets_table',1),(2,'2020_01_01_000002_create_failed_jobs_table',1),(3,'2021_09_16_110111_create_sessions_table',1),(4,'2021_09_25_115514_create_chucvu_table',1),(5,'2021_09_25_115518_create_phongban_table',1),(6,'2021_09_25_115522_create_bangcap_table',1),(7,'2021_09_25_115526_create_chuyenmon_table',1),(8,'2021_09_25_125819_create_phucap_table',1),(9,'2021_09_25_135933_create_dantoc_table',1),(10,'2021_09_25_135933_create_tongiao_table',1),(11,'2021_09_25_135934_create_ngoaingu_table',1),(12,'2021_09_25_145217_create_nhanvien_table',1),(13,'2021_09_25_145218_create_users_table',1),(14,'2021_09_25_145248_create_thuongphat_table',1),(15,'2021_09_25_145259_create_chamcong_table',1),(16,'2021_09_25_154734_create_ungluong_table',1),(17,'2021_09_27_023923_create_hopdong_table',1),(18,'2021_10_03_040135_create_nghiviec_table',1),(19,'2021_10_07_122524_create_loaibaohiem_table',1),(20,'2021_10_07_122913_create_baohiem_table',1),(21,'2021_10_07_122932_create_nhanluong_table',1),(22,'2021_10_15_085345_create_khautru_table',1),(23,'2021_10_25_122809_create_heso_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

--
-- Table structure for table `nghiviec`
--

DROP TABLE IF EXISTS `nghiviec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nghiviec` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nhanvien_id` int(10) unsigned NOT NULL,
  `ngaybd` date NOT NULL,
  `ngaykt` date NOT NULL,
  `lydo` varchar(255) NOT NULL,
  `huongluong` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_nghiviec_nhanvien_id` (`nhanvien_id`),
  CONSTRAINT `fk_nghiviec_nhanvien_id` FOREIGN KEY (`nhanvien_id`) REFERENCES `nhanvien` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nghiviec`
--

/*!40000 ALTER TABLE `nghiviec` DISABLE KEYS */;
INSERT INTO `nghiviec` VALUES (1,17,'2025-04-04','2025-04-23','Hết hạn hợp đồng',1,'2025-04-23 00:21:10','2025-04-23 00:21:10',NULL);
/*!40000 ALTER TABLE `nghiviec` ENABLE KEYS */;

--
-- Table structure for table `ngoaingu`
--

DROP TABLE IF EXISTS `ngoaingu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ngoaingu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tenng` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ngoaingu`
--

/*!40000 ALTER TABLE `ngoaingu` DISABLE KEYS */;
INSERT INTO `ngoaingu` VALUES (1,'Sơ cấp - Bậc 1 (A1)','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(2,'Sơ cấp - Bậc 2 (A2)','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(3,'Trung cấp - Bậc 1 (B1)','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(4,'Trung cấp - Bậc 2 (B2)','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(5,'Cao cấp - Bậc 1 (C1)','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(6,'Cao cấp - Bậc 2 (C2)','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL);
/*!40000 ALTER TABLE `ngoaingu` ENABLE KEYS */;

--
-- Table structure for table `nhanluong`
--

DROP TABLE IF EXISTS `nhanluong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanluong` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nhanvien_id` int(10) unsigned NOT NULL,
  `heso` double(5,2) NOT NULL,
  `hsphucap` double(5,2) NOT NULL,
  `khautru` bigint(20) NOT NULL,
  `luongcb` bigint(20) NOT NULL,
  `mucluong` bigint(20) NOT NULL,
  `phucap` bigint(20) NOT NULL,
  `ngaycongchuan` int(11) NOT NULL,
  `ngaycong` int(11) NOT NULL,
  `nghihl` int(11) NOT NULL,
  `nghikhl` int(11) NOT NULL,
  `thuong` bigint(20) NOT NULL,
  `phat` bigint(20) NOT NULL,
  `tamung` bigint(20) NOT NULL,
  `thuclinh` bigint(20) NOT NULL,
  `thang` int(11) NOT NULL,
  `nam` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_nhanluong_nhanvien_id` (`nhanvien_id`),
  CONSTRAINT `fk_nhanluong_nhanvien_id` FOREIGN KEY (`nhanvien_id`) REFERENCES `nhanvien` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanluong`
--

/*!40000 ALTER TABLE `nhanluong` DISABLE KEYS */;
INSERT INTO `nhanluong` VALUES (1,22,1.20,2.00,0,1500000,1800000,36000,22,0,0,22,0,0,0,0,5,2025,'2025-04-23 00:26:42','2025-04-23 00:26:42',NULL),(2,22,1.20,2.00,0,1500000,1800000,36000,22,1,0,21,0,0,0,83454,4,2025,'2025-04-23 00:27:54','2025-04-23 00:27:54',NULL);
/*!40000 ALTER TABLE `nhanluong` ENABLE KEYS */;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phucap_id` int(10) unsigned NOT NULL,
  `bangcap_id` int(10) unsigned NOT NULL,
  `chuyenmon_id` int(10) unsigned NOT NULL,
  `ngoaingu_id` int(10) unsigned NOT NULL,
  `dantoc_id` int(10) unsigned NOT NULL,
  `tongiao_id` int(10) unsigned NOT NULL,
  `hovaten` varchar(100) NOT NULL,
  `gioitinh` tinyint(1) NOT NULL DEFAULT 0,
  `ngaysinh` date NOT NULL,
  `cmnd` varchar(50) NOT NULL,
  `sdt` varchar(15) NOT NULL,
  `diachi` varchar(255) DEFAULT NULL,
  `quequan` varchar(255) DEFAULT NULL,
  `trangthai` tinyint(1) NOT NULL DEFAULT 0,
  `ngaynghilam` date DEFAULT NULL,
  `bacluong` tinyint(4) NOT NULL,
  `hesoluong` double(5,2) NOT NULL,
  `photo_path` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_nhanvien_phucap_id` (`phucap_id`),
  KEY `fk_nhanvien_bangcap_id` (`bangcap_id`),
  KEY `fk_nhanvien_chuyenmon_id` (`chuyenmon_id`),
  KEY `fk_nhanvien_ngoaingu_id` (`ngoaingu_id`),
  KEY `fk_nhanvien_dantoc_id` (`dantoc_id`),
  KEY `fk_nhanvien_tongiao_id` (`tongiao_id`),
  CONSTRAINT `fk_nhanvien_bangcap_id` FOREIGN KEY (`bangcap_id`) REFERENCES `bangcap` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_nhanvien_chuyenmon_id` FOREIGN KEY (`chuyenmon_id`) REFERENCES `chuyenmon` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_nhanvien_dantoc_id` FOREIGN KEY (`dantoc_id`) REFERENCES `dantoc` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_nhanvien_ngoaingu_id` FOREIGN KEY (`ngoaingu_id`) REFERENCES `ngoaingu` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_nhanvien_phucap_id` FOREIGN KEY (`phucap_id`) REFERENCES `phucap` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_nhanvien_tongiao_id` FOREIGN KEY (`tongiao_id`) REFERENCES `tongiao` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES (1,2,1,1,4,6,3,'Admin',0,'1987-08-28','916738926','0944430146','62746 Alden Shoals Suite 350','West Cordiaberg',1,NULL,2,1.00,'users/f5OMyjbce5XPem6Wfzi4wYZtNbudBiCNMVPHvxKP.jpg','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(2,11,1,1,1,3,3,'Mai Tấn Lộc',0,'1993-05-25','240173790','0934343444','979 Hamill Mall Suite 496','Chrisside',1,NULL,4,1.00,'users/f5OMyjbce5XPem6Wfzi4wYZtNbudBiCNMVPHvxKP.jpg','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(3,4,3,1,5,4,5,'Lê Quang Vinh',0,'1993-08-27','623047091','09343430156','887 Corine Loop','New Kelly',1,NULL,8,1.00,'users/f5OMyjbce5XPem6Wfzi4wYZtNbudBiCNMVPHvxKP.jpg','2025-04-23 00:07:58','2025-04-23 00:07:58',NULL),(4,15,3,2,6,4,1,'Trần Thu Trang',1,'1987-02-28','331958915','1-888-289-7546','233 Henderson Port Suite 450','North Larueport',1,NULL,1,1.00,'users/f5OMyjbce5XPem6Wfzi4wYZtNbudBiCNMVPHvxKP.jpg','2025-04-23 00:07:58','2025-04-23 00:07:58',NULL),(5,11,1,1,5,7,4,'Nguyễn Thị Hà',0,'1988-07-29','155452226','800.561.8479','32424 Mante Corner','South Stuart',1,NULL,7,1.00,'users/f5OMyjbce5XPem6Wfzi4wYZtNbudBiCNMVPHvxKP.jpg','2025-04-23 00:07:58','2025-04-23 00:07:58',NULL),(6,10,3,5,6,5,4,'Nguyễn Văn Hoàng',1,'1991-09-23','187808893','1-888-703-2835','923 Murphy Walk','Johnathanshire',1,NULL,5,1.00,'users/f5OMyjbce5XPem6Wfzi4wYZtNbudBiCNMVPHvxKP.jpg','2025-04-23 00:07:58','2025-04-23 00:07:58',NULL),(7,5,4,2,5,3,3,'Phạm Khánh Linh',1,'1988-09-06','997612198','(844) 547-0168','95620 Torp Mall Suite 690','New Brendan',1,NULL,4,1.00,'users/f5OMyjbce5XPem6Wfzi4wYZtNbudBiCNMVPHvxKP.jpg','2025-04-23 00:07:58','2025-04-23 00:07:58',NULL),(8,9,2,5,4,7,1,'Valentine Berge',0,'1991-02-28','179679673','866-367-8961','38244 Mittie Avenue Suite 717','South Cayla',1,NULL,9,1.00,'users/f5OMyjbce5XPem6Wfzi4wYZtNbudBiCNMVPHvxKP.jpg','2025-04-23 00:07:58','2025-04-23 00:07:58',NULL),(9,3,4,3,3,7,6,'Alf Bogisich',0,'1991-09-18','796190611','888-853-2929','729 Hudson Land Suite 269','South Skylamouth',1,NULL,1,1.00,'users/f5OMyjbce5XPem6Wfzi4wYZtNbudBiCNMVPHvxKP.jpg','2025-04-23 00:07:58','2025-04-23 00:07:58',NULL),(10,11,1,3,6,5,3,'Bernadine Ward',0,'1985-05-28','885771013','(844) 859-6163','649 Cassin Branch','Elmerstad',1,NULL,9,1.00,'users/f5OMyjbce5XPem6Wfzi4wYZtNbudBiCNMVPHvxKP.jpg','2025-04-23 00:07:58','2025-04-23 00:07:58',NULL),(11,14,3,1,6,2,5,'Darien McGlynn',1,'1992-05-06','858945546','888.767.2675','7983 Giles River Apt. 342','West Miloville',1,NULL,8,1.00,'users/f5OMyjbce5XPem6Wfzi4wYZtNbudBiCNMVPHvxKP.jpg','2025-04-23 00:07:58','2025-04-23 00:07:58',NULL),(12,15,4,3,2,1,4,'Carissa Quitzon',0,'1985-10-20','882121966','855.510.8482','73353 Cecile Plaza','Lednerbury',1,NULL,1,1.00,'users/f5OMyjbce5XPem6Wfzi4wYZtNbudBiCNMVPHvxKP.jpg','2025-04-23 00:07:58','2025-04-23 00:07:58',NULL),(13,15,1,2,2,4,2,'Trần Minh Đức',1,'1991-06-24','815733066','800-963-0901','528 Bergstrom Avenue','North Reuben',1,NULL,8,1.00,'users/f5OMyjbce5XPem6Wfzi4wYZtNbudBiCNMVPHvxKP.jpg','2025-04-23 00:07:58','2025-04-23 00:07:58',NULL),(14,4,4,4,6,7,6,'Andres Mohr',1,'1986-07-08','182475516','877-246-0296','6954 Giuseppe Glen','Lake Wadeborough',1,NULL,6,1.00,'users/f5OMyjbce5XPem6Wfzi4wYZtNbudBiCNMVPHvxKP.jpg','2025-04-23 00:07:58','2025-04-23 00:07:58',NULL),(15,10,4,1,6,3,6,'Jaleel Kertzmann',0,'1993-01-10','480570981','855.467.7569','3487 Carlos Falls Apt. 952','Lake Russel',1,NULL,3,1.00,'users/f5OMyjbce5XPem6Wfzi4wYZtNbudBiCNMVPHvxKP.jpg','2025-04-23 00:07:58','2025-04-23 00:07:58',NULL),(16,14,3,2,4,2,3,'Adalberto Crist',1,'1990-02-07','958941661','844-828-4578','29822 Kaleb Junctions','East Jeremiechester',1,NULL,1,1.00,'users/f5OMyjbce5XPem6Wfzi4wYZtNbudBiCNMVPHvxKP.jpg','2025-04-23 00:07:58','2025-04-23 00:07:58',NULL),(17,7,1,2,4,7,1,'Rosetta Rogahn',1,'1989-04-10','189136354','1-844-212-4599','554 Alec Forks Suite 619','Lake Bertton',1,NULL,7,1.00,'users/f5OMyjbce5XPem6Wfzi4wYZtNbudBiCNMVPHvxKP.jpg','2025-04-23 00:07:59','2025-04-23 00:07:59',NULL),(18,13,5,5,5,4,1,'Kathryne Gleason',0,'1995-05-06','341968271','1-844-265-7673','27619 Gislason Stravenue','Milesshire',1,NULL,2,1.00,'users/f5OMyjbce5XPem6Wfzi4wYZtNbudBiCNMVPHvxKP.jpg','2025-04-23 00:07:59','2025-04-23 00:23:54',NULL),(19,14,3,4,5,5,3,'Abbie Dooley',1,'1986-01-03','747338865','877-233-0743','73389 Gibson Plain Apt. 856','Filomenaside',1,NULL,5,1.00,'users/f5OMyjbce5XPem6Wfzi4wYZtNbudBiCNMVPHvxKP.jpg','2025-04-23 00:07:59','2025-04-23 00:07:59',NULL),(20,18,5,4,6,2,4,'Anibal Rath',1,'1990-05-29','242952125','(877) 953-9435','4747 Kathryne Court','Lake Elyse',1,NULL,9,1.00,'users/f5OMyjbce5XPem6Wfzi4wYZtNbudBiCNMVPHvxKP.jpg','2025-04-23 00:07:59','2025-04-23 00:07:59',NULL),(21,14,1,4,5,1,6,'Shaniya Jakubowski',1,'1986-04-09','943247628','1-844-521-1094','30034 Alena Radial','East Liliane',1,NULL,6,1.00,'users/f5OMyjbce5XPem6Wfzi4wYZtNbudBiCNMVPHvxKP.jpg','2025-04-23 00:07:59','2025-04-23 00:07:59',NULL),(22,3,4,3,3,7,1,'Verona Auer',0,'1990-11-04','371394974','1-844-910-1124','361 Wunsch Views','Mitchellberg',1,NULL,4,1.00,'users/f5OMyjbce5XPem6Wfzi4wYZtNbudBiCNMVPHvxKP.jpg','2025-04-23 00:07:59','2025-04-23 00:07:59',NULL),(23,1,3,3,1,3,5,'Chadrick Powlowski',1,'1989-02-09','388288585','1-844-870-0523','83296 Nitzsche Harbors Suite 728','South Jenafurt',1,NULL,6,1.00,'users/f5OMyjbce5XPem6Wfzi4wYZtNbudBiCNMVPHvxKP.jpg','2025-04-23 00:07:59','2025-04-23 00:07:59',NULL);
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

--
-- Table structure for table `phongban`
--

DROP TABLE IF EXISTS `phongban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phongban` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tenpb` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phongban`
--

/*!40000 ALTER TABLE `phongban` DISABLE KEYS */;
INSERT INTO `phongban` VALUES (1,'Ban Giám Đốc','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(2,'Phòng Kinh Doanh','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(3,'Phòng Phân Tích','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(4,'Phòng Thiết Kế','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(5,'Phòng Lập Trình','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(6,'Phòng Hành Chính','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL);
/*!40000 ALTER TABLE `phongban` ENABLE KEYS */;

--
-- Table structure for table `phucap`
--

DROP TABLE IF EXISTS `phucap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phucap` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phongban_id` int(10) unsigned NOT NULL,
  `chucvu_id` int(10) unsigned NOT NULL,
  `hsphucap` double(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_phucap_phongban_id` (`phongban_id`),
  KEY `fk_phucap_chucvu_id` (`chucvu_id`),
  CONSTRAINT `fk_phucap_chucvu_id` FOREIGN KEY (`chucvu_id`) REFERENCES `chucvu` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_phucap_phongban_id` FOREIGN KEY (`phongban_id`) REFERENCES `phongban` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phucap`
--

/*!40000 ALTER TABLE `phucap` DISABLE KEYS */;
INSERT INTO `phucap` VALUES (1,1,2,2.50,'2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(2,1,3,2.00,'2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(3,2,2,1.50,'2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(4,2,3,1.20,'2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(5,2,4,1.00,'2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(6,2,5,1.00,'2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(7,3,2,1.50,'2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(8,3,3,1.20,'2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(9,3,5,1.00,'2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(10,4,2,1.50,'2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(11,4,3,1.20,'2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(12,4,5,1.00,'2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(13,5,2,1.50,'2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(14,5,3,1.20,'2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(15,5,5,1.00,'2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(16,6,2,1.50,'2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(17,6,3,1.20,'2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(18,6,5,1.00,'2025-04-23 00:07:57','2025-04-23 00:07:57',NULL);
/*!40000 ALTER TABLE `phucap` ENABLE KEYS */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('gSo3WREYy8g4u0S3nqzvYlzHi2hyXUXuVaAVZ2sO',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUhCakdEQUFHNkJicm1mV3h6WUtyM1RkZFdCMDhHSmN2TDQ2UnVpNiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9fQ==',1745394584);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

--
-- Table structure for table `thuongphat`
--

DROP TABLE IF EXISTS `thuongphat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thuongphat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nhanvien_id` int(10) unsigned NOT NULL,
  `loai` tinyint(1) NOT NULL DEFAULT 0,
  `sotien` bigint(20) NOT NULL,
  `lydo` varchar(255) NOT NULL,
  `thang` int(11) NOT NULL,
  `nam` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_thuongphat_nhanvien_id` (`nhanvien_id`),
  CONSTRAINT `fk_thuongphat_nhanvien_id` FOREIGN KEY (`nhanvien_id`) REFERENCES `nhanvien` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thuongphat`
--

/*!40000 ALTER TABLE `thuongphat` DISABLE KEYS */;
INSERT INTO `thuongphat` VALUES (1,17,0,100000,'Làm ẩu',7,2025,'2025-04-23 00:19:38','2025-04-23 00:19:38',NULL);
/*!40000 ALTER TABLE `thuongphat` ENABLE KEYS */;

--
-- Table structure for table `tongiao`
--

DROP TABLE IF EXISTS `tongiao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tongiao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tentg` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tongiao`
--

/*!40000 ALTER TABLE `tongiao` DISABLE KEYS */;
INSERT INTO `tongiao` VALUES (1,'Phật giáo','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(2,'Công giáo','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(3,'Tin Lành','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(4,'Hồi giáo','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(5,'Cao Đài','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(6,'Hoà Hảo','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL);
/*!40000 ALTER TABLE `tongiao` ENABLE KEYS */;

--
-- Table structure for table `ungluong`
--

DROP TABLE IF EXISTS `ungluong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ungluong` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nhanvien_id` int(10) unsigned NOT NULL,
  `sotien` bigint(20) NOT NULL,
  `lydo` varchar(255) NOT NULL,
  `thang` int(11) NOT NULL,
  `nam` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ungluong_nhanvien_id` (`nhanvien_id`),
  CONSTRAINT `fk_ungluong_nhanvien_id` FOREIGN KEY (`nhanvien_id`) REFERENCES `nhanvien` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ungluong`
--

/*!40000 ALTER TABLE `ungluong` DISABLE KEYS */;
INSERT INTO `ungluong` VALUES (1,18,5000000,'Ứng tiền công tác',3,2025,'2025-04-23 00:21:49','2025-04-23 00:21:49',NULL);
/*!40000 ALTER TABLE `ungluong` ENABLE KEYS */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nhanvien_id` int(10) unsigned NOT NULL,
  `email` varchar(50) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_nhanvien_id_unique` (`nhanvien_id`),
  UNIQUE KEY `users_email_unique` (`email`),
  CONSTRAINT `fk_users_nhanvien_id` FOREIGN KEY (`nhanvien_id`) REFERENCES `nhanvien` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

INSERT INTO `users` VALUES (1,1,'admin@email.com','2025-04-23 00:07:57','$2y$10$Trs9p//.lUGwDTkIPejkauGz.dMJkOEd9Qz9nEeAtrLZEWR4pKhJC',2,'MN7XToxdqQnVN5xg3ecgAATJtsCwwsv0eKwR1V31Ag6U4gLstyV2tMD6Opee','2025-04-23 00:07:57','2025-04-23 00:07:57',NULL),(2,2,'quanly@email.com','2025-04-23 00:07:57','$2y$10$.YOlTZpZOOgG6av3GtYs/OPB5haseGHDZA1o4zvpTqfk/R4Nu4J/W',1,'770mAsWfNZ','2025-04-23 00:07:58','2025-04-23 00:07:58',NULL),(3,3,'nhanvien@email.com','2025-04-23 00:07:58','$2y$10$u9/ac55By.PaoEPUuLDc6.VMlfkXeo2o.8MhUZr6gVceSHLWCg9gu',0,'Gs3KNSjmpw','2025-04-23 00:07:58','2025-04-23 00:07:58',NULL),(4,4,'alyson84@example.com','2025-04-23 00:07:58','$2y$10$1M8W5OKUEs6FkGv/F1WCbeJF.9WbF9PQSO/05mYL4KjkMBOTia5Ra',0,'fKHKUGlh9n','2025-04-23 00:07:58','2025-04-23 00:07:58',NULL),(5,5,'hagenes.delores@example.net','2025-04-23 00:07:58','$2y$10$cBtEK58ggZHn74OcDmTQ/eGKtWQvnSVWO1Uy7B5n9W3qjkWLJzc9e',0,'quwJ3ATssk','2025-04-23 00:07:58','2025-04-23 00:07:58',NULL),(6,6,'joy.johnson@example.net','2025-04-23 00:07:58','$2y$10$Qof9q8HVv2oDzPAhmsWeKOdlPugsw4.2GQm8bqosOSFLaKqRNXf2y',0,'0DiKB0MiXD','2025-04-23 00:07:58','2025-04-23 00:07:58',NULL),(7,7,'uschneider@example.com','2025-04-23 00:07:58','$2y$10$ga4l5UVIod5QH3EHgbg2Bep7qaQ1GCNf8QqAJg7HpgX5sbX9qjHMe',0,'46iIZaoc8G','2025-04-23 00:07:58','2025-04-23 00:07:58',NULL),(8,8,'rempel.pietro@example.net','2025-04-23 00:07:58','$2y$10$axc30kGn/vQunp3dwCDY/eFcvgo187lmKsb7zHP96rZLRq4Vjcpru',0,'pMeGHuXOh3','2025-04-23 00:07:58','2025-04-23 00:07:58',NULL),(9,9,'mayert.pearl@example.com','2025-04-23 00:07:58','$2y$10$hJ/8SkZTH32z1nyfayDUjOPAKw3Im8ee4fJo4kBCv9/M6ffCIerma',0,'VZXZIXvQa1','2025-04-23 00:07:58','2025-04-23 00:07:58',NULL),(10,10,'miles71@example.net','2025-04-23 00:07:58','$2y$10$6fNyQaA1SGqTuYknikE6A.F4J0/Sl2.Ams.uaH2um9bvZ.CjavOpm',0,'dSFBwHUchm','2025-04-23 00:07:58','2025-04-23 00:07:58',NULL),(11,11,'chyna69@example.org','2025-04-23 00:07:58','$2y$10$OGEjkq5LGlHfqSyj4SssIO2dY2eXh8D4UiD0E/n3ioRzdd3/eiSx6',0,'TbZME73LMA','2025-04-23 00:07:58','2025-04-23 00:07:58',NULL),(12,12,'lynch.lemuel@example.org','2025-04-23 00:07:58','$2y$10$KQ11OUdsb6wDfq1oPt7aB.YzYW1XhRj0S4tMG2223YpWuwytBmuOO',0,'676QSzNqNc','2025-04-23 00:07:58','2025-04-23 00:07:58',NULL),(13,13,'prudence.dare@example.com','2025-04-23 00:07:58','$2y$10$ZrzmzCxT7SNt1gOmKAJJweIrfEDRk5kKkEwMpIq7CIUbo2f8xCIw.',0,'Czg3fJ2UAI','2025-04-23 00:07:58','2025-04-23 00:07:58',NULL),(14,14,'bettie.beer@example.org','2025-04-23 00:07:58','$2y$10$i7YnfBnt3WS6jq0hIBARqegTEoeeZLzsw7GHUIDBOg/rweRU1Kh9O',0,'ZS46nMl6sn','2025-04-23 00:07:58','2025-04-23 00:07:58',NULL),(15,15,'roscoe.witting@example.net','2025-04-23 00:07:58','$2y$10$RIQXONup7tOx4vbl1FfMeeyBohiGOQHWV6QnDU7RWz8Vq6uTM9qLW',0,'eBYVGlIzTo','2025-04-23 00:07:58','2025-04-23 00:07:58',NULL),(16,16,'ella35@example.org','2025-04-23 00:07:58','$2y$10$Vf6rigFS0kLL01BQLRW1Xumv3xV6R0BsMAMS.HI1hrJ0i4VzQE1Lq',0,'DxULJr8Q0S','2025-04-23 00:07:59','2025-04-23 00:07:59',NULL),(17,17,'nicolas.luther@example.com','2025-04-23 00:07:59','$2y$10$Uy0.Ie8MgdG99hmmeDnLFeTl6OkHFNCTJ8MnDPFO0/FT5PSyC0dIG',0,'khNl53CQPIMl66QvDXuEmrjvVEHepccAovjeQgtybVHmRwXwU9L6I8Rwzu1H','2025-04-23 00:07:59','2025-04-23 00:07:59',NULL),(18,18,'lily18@example.com','2025-04-23 00:07:59','$2y$10$/kXsTlDjQ8H7fnyJrF.NcukXYkwd5cqV0fRzgmFL4vlIsciADqdcy',0,'m4qdzKi6qB','2025-04-23 00:07:59','2025-04-23 00:07:59',NULL),(19,19,'vhill@example.org','2025-04-23 00:07:59','$2y$10$JnbvLMVljdgz8yYbA1c8Pu1rzH1RgG6L8vab8bDVbBr7LPCXeWsN6',0,'9myms8wNYy','2025-04-23 00:07:59','2025-04-23 00:07:59',NULL),(20,20,'iwelch@example.org','2025-04-23 00:07:59','$2y$10$Yp7ojPQ147c9hSIFmii1peG97jvjNGcOvP9lC2Y18JXW/fOl5aFma',0,'fmzTeBH2ZD','2025-04-23 00:07:59','2025-04-23 00:07:59',NULL),(21,21,'iheidenreich@example.com','2025-04-23 00:07:59','$2y$10$KJP3u0ecn/lR0QMVfDpE0.AzaC5Yqr6PlAjHFaW3k4jfcntOpakn.',0,'uUdpFhNsj2','2025-04-23 00:07:59','2025-04-23 00:07:59',NULL),(22,22,'jeromy.oconner@example.net','2025-04-23 00:07:59','$2y$10$Art3hQwdauGM6Fr7sNUZ3.41aXmOuNx/0.qFkR7RbZzf2zQ6SH3WK',0,'1ftALoJ404bhUXloDLIQf93cvzIP71DpVI2XY81LumlLyeQdVmcPYj9gjoX3','2025-04-23 00:07:59','2025-04-23 00:07:59',NULL),(23,23,'sauer.chaz@example.com','2025-04-23 00:07:59','$2y$10$zgJ8CzMb4dKj6u4rpctrJ.K0KAbBvCPfkn0QEHX2r3qMH9zhs/POC',0,'P7LcyKOMZr','2025-04-23 00:07:59','2025-04-23 00:07:59',NULL);
