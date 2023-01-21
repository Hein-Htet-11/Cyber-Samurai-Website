-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: game_store
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record` (
  `id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `game_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5ic2ohoewcxeuaysnre2s7l4t` (`game_id`),
  KEY `FKeny3549xar8rnrcmdw3hl0la1` (`user_id`),
  CONSTRAINT `FK5ic2ohoewcxeuaysnre2s7l4t` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`),
  CONSTRAINT `FKeny3549xar8rnrcmdw3hl0la1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` VALUES (28,'2023-01-21 06:20:59',NULL,23,27),(30,'2023-01-21 06:21:06',NULL,13,27),(32,'2023-01-21 06:21:10',NULL,9,27),(34,'2023-01-21 06:21:14',NULL,4,27),(36,'2023-01-21 06:21:21',NULL,5,27),(38,'2023-01-21 06:21:23',NULL,6,27),(40,'2023-01-21 06:21:26',NULL,10,27),(42,'2023-01-21 06:21:32',NULL,22,27),(44,'2023-01-21 08:12:19',NULL,24,27),(46,'2023-01-21 08:12:24',NULL,8,27),(48,'2023-01-21 08:12:28',NULL,12,27),(50,'2023-01-21 08:12:36',NULL,16,27),(52,'2023-01-21 08:12:52',NULL,7,27),(54,'2023-01-21 08:12:57',NULL,11,27),(56,'2023-01-21 08:13:10',NULL,22,27),(58,'2023-01-21 08:27:41',NULL,2,27),(63,'2023-01-21 11:06:01',NULL,20,62);
/*!40000 ALTER TABLE `record` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-21 11:54:44
