-- MariaDB dump 10.19-11.3.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: board
-- ------------------------------------------------------
-- Server version	11.3.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `age` tinyint(3) unsigned DEFAULT NULL,
  `profile_image` longblob DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `birth_day` date DEFAULT NULL,
  `create_time` datetime DEFAULT current_timestamp(),
  `post_count` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES
(1,'abc','adc@test.com',NULL,NULL,24,NULL,'user',NULL,NULL,0),
(3,'세호3','seho3@naver.com','1234','서울',9,NULL,'user',NULL,NULL,0),
(6,NULL,'seho@naver.com',NULL,NULL,125,NULL,'user',NULL,NULL,0),
(10,NULL,'acs@naver.com',NULL,NULL,30,NULL,'admin',NULL,NULL,0),
(11,NULL,'asd@naver.com',NULL,NULL,7,NULL,'user','1998-07-08',NULL,0),
(13,NULL,'abe@naver.com',NULL,NULL,36,NULL,'user',NULL,'2024-05-17 12:32:31',0),
(14,NULL,'ads@naver.com',NULL,NULL,27,NULL,'user',NULL,'2024-05-17 16:16:22',0),
(51,'kim','kim@naver.com',NULL,NULL,41,NULL,'user',NULL,'2024-05-20 15:38:46',0);
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `contents` varchar(3000) DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `price` decimal(10,3) DEFAULT NULL,
  `create_time` datetime DEFAULT current_timestamp(),
  `user_id` char(36) DEFAULT uuid(),
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `post_author_fk` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES
(1,'세호','샤브샤브',1,3000.000,NULL,'45ff4204-141f-11ef-b6bb-f4b301d31c4b'),
(3,'세호2','샤브샤브3',NULL,2000.000,NULL,'45ff43ff-141f-11ef-b6bb-f4b301d31c4b'),
(5,'세호5','샤브샤브5',NULL,7000.000,NULL,'45ff4429-141f-11ef-b6bb-f4b301d31c4b'),
(6,'세호6','샤브샤브6',6,1000.000,NULL,'45ff44a2-141f-11ef-b6bb-f4b301d31c4b'),
(7,'hello java',NULL,NULL,1234.100,NULL,'45ff44dd-141f-11ef-b6bb-f4b301d31c4b'),
(8,'샤브',NULL,NULL,8000.000,'2024-05-17 16:15:01','45ff4501-141f-11ef-b6bb-f4b301d31c4b'),
(16,'hello world java',NULL,1,5000.000,'2024-05-20 15:13:36','14d1f34f-1670-11ef-b6bb-f4b301d31c4b');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-22 16:27:33
