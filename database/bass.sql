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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_p_i1_users`
--

LOCK TABLES `a_p_i1_users` WRITE;
/*!40000 ALTER TABLE `a_p_i1_users` DISABLE KEYS */;
INSERT INTO `a_p_i1_users` VALUES (1,'johndoe1','John Doe','johndoe1@email.com','p4ssw0rd#@$'),(2,'janesmith2','Jane Smith','janesmith2@email.com','s3cur3P@$$'),(3,'mikeross3','Mike Ross','mikeross3@email.com','mik3R0ss!23'),(4,'emilyclark4','Emily Clark','emilyclark4@email.com','3m1lyC!@#'),(5,'chrisbrown5','Chris Brown','chrisbrown5@email.com','chrisBr0wn!$'),(6,'sarahconnor6','Sarah Connor','sarahconnor6@email.com','sarahC0nn0r%^'),(7,'davidmoore7','David Moore','davidmoore7@email.com','d@vidM00re&*'),(8,'laurasmith8','Laura Smith','laurasmith8@email.com','lauraS!mith@#'),(9,'jameswilson9','James Wilson','jameswilson9@email.com','jam3sW!lson$#'),(10,'lisawhite10','Lisa White','lisawhite10@email.com','l!saWhit3*('),(11,'markbrown11','Mark Brown','markbrown11@email.com','markBr0wn!*)('),(12,'emmagreen12','Emma Green','emmagreen12@email.com','emmaGr33n$#@!'),(13,'noahmiller13','Noah Miller','noahmiller13@email.com','no@hMill3r&*^'),(14,'oliviadavis14','Olivia Davis','oliviadavis14@email.com','0liviaD@v!$#'),(15,'williamjones15','William Jones','williamjones15@email.com','willi@mJ0nes^%'),(16,'avabrown16','Ava Brown','avabrown16@email.com','av@Br0wn!&*'),(17,'charlottemartin17','Charlotte Martin','charlottemartin17@email.com','charl0tteM@rt!n#'),(18,'masonlee18','Mason Lee','masonlee18@email.com','m@s0nL33!!'),(19,'sophiayoung19','Sophia Young','sophiayoung19@email.com','s0phiaY0ung$@'),(20,'ethanwright20','Ethan Wright','ethanwright20@email.com','eth@nWr!ght#*'),(21,'ameliajohnson21','Amelia Johnson','ameliajohnson21@email.com','am3liaJ0hns0n!'),(22,'johndoe','John Doe','johndoe1@email.com','aW2ywvf'),(23,'carlos11','Carlos Jeff','carlos1888@email.com','aW2y#11wvf'),(24,'Johnwack','John Wack','john1668@email.com','john123!');
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
-- Table structure for table `a_p_i3_comments`
--

DROP TABLE IF EXISTS `a_p_i3_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `a_p_i3_comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `postid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deviceid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `commenttext` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_p_i3_comments`
--

LOCK TABLES `a_p_i3_comments` WRITE;
/*!40000 ALTER TABLE `a_p_i3_comments` DISABLE KEYS */;
INSERT INTO `a_p_i3_comments` VALUES (1,'1','flag{api3_0bad677bfc504c75ff72}','45.5426274','-122.7944111','THIS POST IS SH***Y','baduser007');
/*!40000 ALTER TABLE `a_p_i3_comments` ENABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_p_i3_users`
--

LOCK TABLES `a_p_i3_users` WRITE;
/*!40000 ALTER TABLE `a_p_i3_users` DISABLE KEYS */;
INSERT INTO `a_p_i3_users` VALUES (1,'roottusk','Tushar K','&_tUO^{FKI9-');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_p_i5_users`
--

LOCK TABLES `a_p_i5_users` WRITE;
/*!40000 ALTER TABLE `a_p_i5_users` DISABLE KEYS */;
INSERT INTO `a_p_i5_users` VALUES (1,'admin','admin!@#$','Admin User','flag{BDO_BASS}','8080808080'),(2,'testuser2','test123','Test User','ABC','888888888'),(3,'testuqser2','testq123','Test Useqr','ABCD','888888888'),(4,'testuser2','test123','Test User','ABC','888888888'),(5,'testuser2','test123','Test User','ABC','888888888'),(6,'testuser2','test123','Test User','ABC','888888888');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_p_i6_users`
--

LOCK TABLES `a_p_i6_users` WRITE;
/*!40000 ALTER TABLE `a_p_i6_users` DISABLE KEYS */;
INSERT INTO `a_p_i6_users` VALUES (1,'Tushar','roottusk','asdvhSDSA&*65',50),(2,'Valentest','vsai','133737',0),(3,'Valentest','vsai','133737',100),(4,'Valentest1','vsai111','133737',100),(5,'Valentest12','vsai1112','133737',1001),(6,'eric','eric1','133737',1001),(7,'eric1','eric12','133737',0),(8,'valensai','valen1337','133737',0),(9,'valensai','valen1337','133737',1000),(10,'valensai1','valen13371','133737',1000),(11,'valensai11','valen131137','133737',1000),(12,'','','',0),(13,'valen','valen1111','111111',0),(14,'valen','valen1111','111111',0),(15,'valen11','valen11211','1112111',1000),(16,'valen1211','valen112111','1112111',0),(17,'BASSS','valen1112111','1112111',1110),(18,'test1111','test1111','1112111',NULL),(19,'test1111','test1111','1112111',1000),(20,'demo','demo','demo1',1000),(21,'demo','demo','demo1',1000),(22,'demo','demo','demo1',1000),(23,'demo','demo','demo1',NULL);
/*!40000 ALTER TABLE `a_p_i6_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_p_i7_users`
--

DROP TABLE IF EXISTS `a_p_i7_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `a_p_i7_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `authkey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_p_i7_users`
--

LOCK TABLES `a_p_i7_users` WRITE;
/*!40000 ALTER TABLE `a_p_i7_users` DISABLE KEYS */;
INSERT INTO `a_p_i7_users` VALUES (1,'admin','Kencing@001','8ba30b496fae88ec808d6dc74f85952d06e3739696fe689b228bc0d906d2999e'),(2,'','','b74a95481864f4ae732518cb28756918d95b5fffb1e0bea806aa33692405feed'),(3,'valen','valen','068908d6cc93222920ff34a3601205953afd73ecbc8c4c582204ebca85ba737b'),(4,'valen','valen','068908d6cc93222920ff34a3601205953afd73ecbc8c4c582204ebca85ba737b'),(5,'valen','valen','068908d6cc93222920ff34a3601205953afd73ecbc8c4c582204ebca85ba737b');
/*!40000 ALTER TABLE `a_p_i7_users` ENABLE KEYS */;
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
-- Table structure for table `api10_users`
--

DROP TABLE IF EXISTS `api10_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api10_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `authkey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api10_users`
--

LOCK TABLES `api10_users` WRITE;
/*!40000 ALTER TABLE `api10_users` DISABLE KEYS */;
INSERT INTO `api10_users` VALUES (1,'admin','Yo|-Uj_271V*','oWsZ8vWNuECjCAiZVJHOzsNsNH08zWRZ','flag{BDO_BASS}');
/*!40000 ALTER TABLE `api10_users` ENABLE KEYS */;
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
-- Table structure for table `flags`
--

DROP TABLE IF EXISTS `flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flags` (
  `challengeid` int unsigned NOT NULL AUTO_INCREMENT,
  `flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`challengeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flags`
--

LOCK TABLES `flags` WRITE;
/*!40000 ALTER TABLE `flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `flags` ENABLE KEYS */;
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
INSERT INTO `items` VALUES (1,'Example Item 1',9999,99.99,NULL,'2024-03-18 01:07:38'),(2,'Example Item 2',9997,149.99,NULL,'2024-03-18 01:07:38'),(3,'Test Item',10014,50.00,NULL,NULL);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (14,'2014_10_12_000000_create_users_table',1),(15,'2014_10_12_100000_create_password_resets_table',1),(16,'2019_08_19_000000_create_failed_jobs_table',1),(17,'2019_12_14_000001_create_personal_access_tokens_table',1),(18,'2021_08_29_101627_create_a_p_i1_users_table',1),(19,'2021_08_29_154028_create_a_p_i2_users_table',1),(20,'2021_08_30_111133_create_a_p_i3_users_table',1),(21,'2021_08_30_120950_create_a_p_i3_comments_table',1),(22,'2021_09_03_092221_create_a_p_i4_users_table',1),(23,'2021_09_04_091223_create_a_p_i5_users_table',1),(24,'2021_09_04_151228_create_a_p_i6_users_table',1),(25,'2021_09_07_130451_create_a_p_i7_users_table',1),(26,'2021_09_08_090801_create_a_p_i8_users_table',1),(27,'2021_09_08_102937_create_a_p_i9_users_table',2),(28,'2024_03_18_055229_create_items_table',3),(29,'2024_03_18_055337_create_transactions_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1,2,'2024-03-18 00:45:47','2024-03-18 00:45:47'),(2,2,3,'2024-03-18 00:45:47','2024-03-18 00:45:47'),(12,1,2,'2024-03-18 01:04:47','2024-03-18 01:04:47'),(13,2,1,'2024-03-18 01:04:47','2024-03-18 01:04:47'),(14,1,2,'2024-03-18 01:06:59','2024-03-18 01:06:59'),(15,2,1,'2024-03-18 01:06:59','2024-03-18 01:06:59'),(16,1,2,'2024-03-18 01:07:11','2024-03-18 01:07:11'),(17,2,1,'2024-03-18 01:07:11','2024-03-18 01:07:11'),(18,1,2,'2024-03-18 01:07:38','2024-03-18 01:07:38'),(19,2,1,'2024-03-18 01:07:38','2024-03-18 01:07:38');
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

-- Dump completed on 2024-03-21 15:08:09
