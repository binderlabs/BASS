-- MySQL dump 10.13  Distrib 8.2.0, for macos14.0 (x86_64)
--
-- Host: localhost    Database: bass
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `a_p_i10_users`
--

DROP TABLE IF EXISTS `a_p_i10_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `a_p_i10_users` (
  `id` int DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `authkey` char(32) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_p_i10_users`
--

LOCK TABLES `a_p_i10_users` WRITE;
/*!40000 ALTER TABLE `a_p_i10_users` DISABLE KEYS */;
INSERT INTO `a_p_i10_users` VALUES (1,'admin','Yo|-Uj_271V*','oWsZ8vWNuECjCAiZVJHOzsNsNH08zWRZ','flag{BDO_BASS}');
/*!40000 ALTER TABLE `a_p_i10_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_p_i1_users`
--

DROP TABLE IF EXISTS `a_p_i1_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `a_p_i1_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_p_i1_users`
--

LOCK TABLES `a_p_i1_users` WRITE;
/*!40000 ALTER TABLE `a_p_i1_users` DISABLE KEYS */;
INSERT INTO `a_p_i1_users` VALUES (1,'johndoe1','John Doe','johndoe1@email.com','p4ssw0rd#@$'),(2,'janesmith2','Jane Smith','janesmith2@email.com','s3cur3P@$$'),(3,'mikeross3','Mike Ross','mikeross3@email.com','mik3R0ss!23'),(4,'emilyclark4','Emily Clark','emilyclark4@email.com','3m1lyC!@#'),(5,'chrisbrown5','Chris Brown','chrisbrown5@email.com','chrisBr0wn!$'),(6,'sarahconnor6','Sarah Connor','sarahconnor6@email.com','sarahC0nn0r%^'),(7,'davidmoore7','David Moore','davidmoore7@email.com','d@vidM00re&*'),(8,'laurasmith8','Laura Smith','laurasmith8@email.com','lauraS!mith@#'),(9,'jameswilson9','James Wilson','jameswilson9@email.com','jam3sW!lson$#'),(10,'lisawhite10','Lisa White','lisawhite10@email.com','l!saWhit3*('),(11,'markbrown11','Mark Brown','markbrown11@email.com','markBr0wn!*)('),(12,'emmagreen12','Emma Green','emmagreen12@email.com','emmaGr33n$#@!'),(13,'noahmiller13','Noah Miller','noahmiller13@email.com','no@hMill3r&*^'),(14,'oliviadavis14','Olivia Davis','oliviadavis14@email.com','0liviaD@v!$#'),(15,'williamjones15','William Jones','williamjones15@email.com','willi@mJ0nes^%'),(16,'avabrown16','Ava Brown','avabrown16@email.com','av@Br0wn!&*'),(17,'charlottemartin17','Charlotte Martin','charlottemartin17@email.com','charl0tteM@rt!n#'),(18,'masonlee18','Mason Lee','masonlee18@email.com','m@s0nL33!!'),(19,'sophiayoung19','Sophia Young','sophiayoung19@email.com','s0phiaY0ung$@'),(20,'ethanwright20','Ethan Wright','ethanwright20@email.com','eth@nWr!ght#*'),(21,'ameliajohnson21','Amelia Johnson','ameliajohnson21@email.com','am3liaJ0hns0n!'),(22,'johndoe','John Doe','johndoe1@email.com','aW2ywvf'),(23,'carlos11','Carlos Jeff','carlos1888@email.com','aW2y#11wvf'),(24,'Johnwack','John Wack','john1668@email.com','john123!'),(25,'carlos112','Carlos Jeff','carlos1888@email.com','aW2y#11wvf');
/*!40000 ALTER TABLE `a_p_i1_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_p_i2_users`
--

DROP TABLE IF EXISTS `a_p_i2_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `a_p_i2_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_p_i2_users`
--

LOCK TABLES `a_p_i2_users` WRITE;
/*!40000 ALTER TABLE `a_p_i2_users` DISABLE KEYS */;
INSERT INTO `a_p_i2_users` VALUES (1,'carlos@gmail.com','fpRe7k$(','Carlos','Fp0r1mty_gxK9DRZ5IUw3sX2enQ6rau68M6YGyoqR3XoBG13wtSbvmdaK5CB','10th Downing','Newtownville','Dumiastan'),(2,'andrewgh@yahoo.com','M6tny_DU','Andrew','1Nkoz6quzJiis1SEonJeSxwkXTzSzcULofbL9O7KPz6_sKGkUcQDzoNfI5aA','flag{BDO_BASS}','Faketon','Mimicland'),(3,'jennery@hotmail.com','PY9]_Utu','Jennery','sLqs17RjmdlWoBP2ONdAPP8WtIVNwlyz_qzLwhmJGboWD_asFICYggcE3bPi','San Jose','Mockville','Placeholderia'),(4,'cathrine91@outlook.com','password1!','Cathrine','kA3r1f9RlT8XdQeZuBv2sWpYnZqCtOd5mEfGhIjKlMn4pQr6sT7uVwXyZ','456 Nonexistent Lane','Dummyville','Dummyland');
/*!40000 ALTER TABLE `a_p_i2_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_p_i3_users`
--

DROP TABLE IF EXISTS `a_p_i3_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `a_p_i3_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_p_i3_users`
--

LOCK TABLES `a_p_i3_users` WRITE;
/*!40000 ALTER TABLE `a_p_i3_users` DISABLE KEYS */;
INSERT INTO `a_p_i3_users` VALUES (1,'bassuser','John K','&_tUO^{FKI9-',0.00),(2,'herryjohnwack12','Herry John1','d1e111mo1131231',0.00),(3,'herryjohnwack12','Herry John1','d1e111mo1131231',0.00),(4,'herryjohnwack12','Herry John12','d1e111mo1131231',0.00),(5,'herryjohnwack12','John Doe 1','d1e111mo1131231',1.00),(6,'john1337','John Doe 12','demo',1000.00);
/*!40000 ALTER TABLE `a_p_i3_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_p_i4_users`
--

DROP TABLE IF EXISTS `a_p_i4_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `a_p_i4_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `apikey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_p_i4_users`
--

LOCK TABLES `a_p_i4_users` WRITE;
/*!40000 ALTER TABLE `a_p_i4_users` DISABLE KEYS */;
INSERT INTO `a_p_i4_users` VALUES (1,'FZvjaFlMgUfnpFJDhKx-92xeXx_sCr7Y','Valen','flag{BDO_BASS}');
/*!40000 ALTER TABLE `a_p_i4_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_p_i5_users`
--

DROP TABLE IF EXISTS `a_p_i5_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `a_p_i5_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobileno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_p_i5_users`
--

LOCK TABLES `a_p_i5_users` WRITE;
/*!40000 ALTER TABLE `a_p_i5_users` DISABLE KEYS */;
INSERT INTO `a_p_i5_users` VALUES (1,'admin','admin!@#$','Admin User','flag{BDO_BASS}','8080808080'),(2,'testuser2','test123','Test User','ABC','888888888'),(3,'testuqser2','testq123','Test Useqr','ABCD','888888888'),(4,'testuser2','test123','Test User','ABC','888888888'),(5,'testuser2','test123','Test User','ABC','888888888'),(6,'testuser2','test123','Test User','ABC','888888888'),(7,'hellojohn','test1337123','Test User2','ABCAAAA','888888888');
/*!40000 ALTER TABLE `a_p_i5_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_p_i6_users`
--

DROP TABLE IF EXISTS `a_p_i6_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `a_p_i6_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_p_i6_users`
--

LOCK TABLES `a_p_i6_users` WRITE;
/*!40000 ALTER TABLE `a_p_i6_users` DISABLE KEYS */;
INSERT INTO `a_p_i6_users` VALUES (1,'Johnwack','bassuser','asdvhSDSA&*65',50),(2,'Valentest','vsai','133737',0),(3,'Valentest','vsai','133737',100),(4,'Valentest1','vsai111','133737',100),(5,'Valentest12','vsai1112','133737',1001),(6,'eric','eric1','133737',1001),(7,'eric1','eric12','133737',0),(8,'valensai','valen1337','133737',0),(9,'valensai','valen1337','133737',1000),(10,'valensai1','valen13371','133737',1000),(11,'valensai11','valen131137','133737',1000),(12,'','','',0),(13,'valen','valen1111','111111',0),(14,'valen','valen1111','111111',0),(15,'valen11','valen11211','1112111',1000),(16,'valen1211','valen112111','1112111',0),(17,'BASSS','valen1112111','1112111',1110),(18,'test1111','test1111','1112111',NULL),(19,'test1111','test1111','1112111',1000),(20,'demo','demo','demo1',1000),(21,'demo','demo','demo1',1000),(22,'demo','demo','demo1',1000),(23,'demo','demo','demo1',NULL),(24,'demo','demo','demo1',NULL),(25,'demo test1','demo 111','demo113123',NULL),(26,'demo test1','demo 111','demo113123',1000),(27,'demo test1','demo 111','demo113123',1000),(28,'Hello','dhello123','de111mo113123',1000),(29,'Hello','dhello123','de111mo113123',NULL),(30,'Hello John','johnwack1','de111mo113123',NULL),(31,'Hello John1','johnwack12','de111mo1131231',NULL);
/*!40000 ALTER TABLE `a_p_i6_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_p_i8_users`
--

DROP TABLE IF EXISTS `a_p_i8_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `a_p_i8_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `authkey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_p_i8_users`
--

LOCK TABLES `a_p_i8_users` WRITE;
/*!40000 ALTER TABLE `a_p_i8_users` DISABLE KEYS */;
INSERT INTO `a_p_i8_users` VALUES (1,'admin','Kencing@001','8ba30b496fae88ec808d6dc74f85952d06e3739696fe689b228bc0d906d2999e'),(2,'','','b74a95481864f4ae732518cb28756918d95b5fffb1e0bea806aa33692405feed'),(3,'valen','valen','068908d6cc93222920ff34a3601205953afd73ecbc8c4c582204ebca85ba737b'),(4,'valen','valen','068908d6cc93222920ff34a3601205953afd73ecbc8c4c582204ebca85ba737b'),(5,'valen','valen','068908d6cc93222920ff34a3601205953afd73ecbc8c4c582204ebca85ba737b'),(6,'valen113','valen222','b747cad17445be993e7173d74a151af3b79fca7cdcb5b31e89bb0e0c80a24952'),(7,'valen','valen','068908d6cc93222920ff34a3601205953afd73ecbc8c4c582204ebca85ba737b'),(8,'johndoe176','dohn#@12','0194e532177a4008f38715751a348d9d2720fcc8756b513cc0e99b2c3328c476'),(9,'johndoe176','dohn#@12','0194e532177a4008f38715751a348d9d2720fcc8756b513cc0e99b2c3328c476');
/*!40000 ALTER TABLE `a_p_i8_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_p_i9_users`
--

DROP TABLE IF EXISTS `a_p_i9_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `a_p_i9_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `accbalance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_p_i9_users`
--

LOCK TABLES `a_p_i9_users` WRITE;
/*!40000 ALTER TABLE `a_p_i9_users` DISABLE KEYS */;
INSERT INTO `a_p_i9_users` VALUES (1,'carlosjeff','1655','flag{BDO_BASS}');
/*!40000 ALTER TABLE `a_p_i9_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Example Item 1',9993,99.99,NULL,'2024-03-21 00:52:02'),(2,'Example Item 2',9994,149.99,NULL,'2024-03-21 00:52:02'),(3,'Test Item',10014,50.00,NULL,NULL);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_item_id_foreign` (`item_id`),
  CONSTRAINT `transactions_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1,2,'2024-03-18 00:45:47','2024-03-18 00:45:47'),(2,2,3,'2024-03-18 00:45:47','2024-03-18 00:45:47'),(12,1,2,'2024-03-18 01:04:47','2024-03-18 01:04:47'),(13,2,1,'2024-03-18 01:04:47','2024-03-18 01:04:47'),(14,1,2,'2024-03-18 01:06:59','2024-03-18 01:06:59'),(15,2,1,'2024-03-18 01:06:59','2024-03-18 01:06:59'),(16,1,2,'2024-03-18 01:07:11','2024-03-18 01:07:11'),(17,2,1,'2024-03-18 01:07:11','2024-03-18 01:07:11'),(18,1,2,'2024-03-18 01:07:38','2024-03-18 01:07:38'),(19,2,1,'2024-03-18 01:07:38','2024-03-18 01:07:38'),(20,1,2,'2024-03-21 00:51:45','2024-03-21 00:51:45'),(21,2,1,'2024-03-21 00:51:45','2024-03-21 00:51:45'),(22,1,2,'2024-03-21 00:51:55','2024-03-21 00:51:55'),(23,2,1,'2024-03-21 00:51:55','2024-03-21 00:51:55'),(24,1,2,'2024-03-21 00:52:02','2024-03-21 00:52:02'),(25,2,1,'2024-03-21 00:52:02','2024-03-21 00:52:02');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-22  1:52:17
