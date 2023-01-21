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
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `id` int NOT NULL,
  `budget` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `home_page` varchar(200) DEFAULT NULL,
  `out_of_stock` tinyint(1) NOT NULL DEFAULT '0',
  `overview` varchar(1000) DEFAULT NULL,
  `poster_path` varchar(200) DEFAULT NULL,
  `sold_qty` int DEFAULT NULL,
  `title` varchar(50) NOT NULL,
  `trailer_path` varchar(200) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `wish_list` int DEFAULT NULL,
  `category_id` int NOT NULL,
  `platform_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_b2i64cpcke4nrwphbye9noshb` (`title`),
  KEY `FKqfot8nih9aqqj3ql4ig0ei9ea` (`category_id`),
  KEY `FKqbkf2002dfk9drnxmwxiqix6h` (`platform_id`),
  CONSTRAINT `FKqbkf2002dfk9drnxmwxiqix6h` FOREIGN KEY (`platform_id`) REFERENCES `platform` (`id`),
  CONSTRAINT `FKqfot8nih9aqqj3ql4ig0ei9ea` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (2,110000,'2023-01-21 04:58:10',NULL,0,'Embark on a heartrending journey into a brutal, breathtaking world, and discover the cost of saving those you love in a desperate struggle for survival.','/media/jpg/1674253690_1.jpg',0,'A Plague Tale : Requiem','/media/mp4/1674253690_Comic.MP4',NULL,0,2,1),(4,62000,'2023-01-21 05:04:33',NULL,1,'Way of the Hunter provides a highly immersive, completely integrated experience amongst stunning wildlife with true to live animal group behavior.','/media/jpg/1674254072_2jpeg.jpeg',0,'Way of Hunter','/media/mp4/1674254072_Comic.MP4','2023-01-21 05:59:14',0,1,1),(5,155000,'2023-01-21 05:08:56',NULL,0,'Journey through dangerous and stunning landscapes while facing a wide variety of enemy creatures, monsters and Norse gods as Kratos and Atreus search for ...','/media/jpg/1674254335_3.jpg',0,'God of War : Ragnarok','/media/mp4/1674254335_Comic.MP4','2023-01-21 05:59:09',0,2,1),(6,155000,'2023-01-21 05:15:19',NULL,0,'In a ravaged civilization, where infected and hardened survivors run rampant, Joel, a weary protagonist, is hired to smuggle 14-year-old Ellie out of a military ...','/media/jpg/1674254718_5.jpg',0,'The Last of Us : Part 1','/media/mp4/1674254718_Comic.MP4',NULL,0,2,1),(7,90000,'2023-01-21 05:18:04',NULL,1,'When a violent event disrupts that peace, Ellie embarks on a relentless journey to carry out justice and find closure. As she hunts those responsible one by one ...','/media/jpg/1674254883_4.jpg',0,'The Last of Us : Part 2','/media/mp4/1674254883_Comic.MP4','2023-01-21 05:58:00',0,2,2),(8,110000,'2023-01-21 05:21:50',NULL,1,'Play as Nathan Drake and Chloe Frazer in their own standalone adventures as they confront their pasts and forge their own legacies.','/media/jpg/1674255110_6.jpg',0,'Uncharted : Collection','/media/mp4/1674255110_Comic.MP4','2023-01-21 05:58:51',0,2,1),(9,88000,'2023-01-21 05:24:38',NULL,0,'Awesome Game','/media/jpg/1674255278_7.jpg',0,'Uncharted 4','/media/mp4/1674255278_Comic.MP4','2023-01-21 05:58:56',0,2,2),(10,45000,'2023-01-21 05:27:54',NULL,0,'His vengeance against the Gods of Olympus years behind him, Kratos now lives as a man in the realm of Norse Gods and monsters. It is in this harsh, ...','/media/jpg/1674255473_8.jpg',0,'God of War','/media/mp4/1674255473_Comic.MP4',NULL,0,2,2),(11,62000,'2023-01-21 05:31:03',NULL,0,'Experience Rock star games\' critically acclaimed open world game, grand Theft Auto V. When a young Street hustler, a retired Bank robber and a terrifying ...','/media/jpg/1674255663_9.jpg',0,'GTA 5','/media/mp4/1674255663_Comic.MP4',NULL,0,1,2),(12,70000,'2023-01-21 05:35:25',NULL,0,'Developed by the creators of Grand Theft Auto V and Red Dead Redemption, Red Dead Redemption 2 is an epic tale of life in America\'s unforgiving heartland.','/media/jpg/1674255924_10.jpg',0,'Red Dead Redemption 2','/media/mp4/1674255924_Comic.MP4',NULL,0,1,2),(13,45000,'2023-01-21 05:39:23',NULL,1,'Experience an original story. The worlds of Peter Parker and Spider-Man collide in an original, action-packed tale. In this new Spider-Man universe, iconic ..','/media/jpg/1674256162_11.jpg',0,'Spiderman','/media/mp4/1674256162_Comic.MP4',NULL,0,2,2),(14,110000,'2023-01-21 05:41:28',NULL,1,'Experience the rise of Miles Morales as the new hero masters incredible, explosive new powers to become his own Spider-Man on PS5.','/media/jpg/1674256287_12.jpg',0,'Spiderman Miles Morales','/media/mp4/1674256287_Comic.MP4','2023-01-21 05:42:43',0,2,1),(15,115000,'2023-01-21 05:45:18',NULL,0,'EA SPORTS™ FIFA 23 brings The World\'s Game to the pitch, with next-gen HyperMotion2 Technology, women\'s club football, two FIFA World Cup™ tournaments, ...','/media/jpg/1674256518_13.jpg',0,'Fifa 23','/media/mp4/1674256518_Comic.MP4',NULL,0,4,1),(16,86000,'2023-01-21 05:47:57',NULL,0,'Lead breathtaking expeditions across the vibrant and ever-evolving open world landscapes of Mexico with limitless, fun driving action in hundreds of the world\'s ...','/media/jpg/1674256676_14.jpg',0,'Forza Horizon 5','/media/mp4/1674256676_Comic.MP4',NULL,0,10,3),(17,62000,'2023-01-21 05:51:15',NULL,0,'Lead breathtaking expeditions across the vibrant and ever-evolving open world landscapes of Mexico with limitless, fun driving action in hundreds of the world\'s ...','/media/jpg/1674256875_15.jpg',0,'Halo : Infinite','/media/mp4/1674256875_Comic.MP4',NULL,0,3,3),(18,130000,'2023-01-21 05:53:41',NULL,1,'Awesome Game','/media/jpg/1674257021_16.jpg',0,'Marvel Midnight Sun','/media/mp4/1674257021_Comic.MP4',NULL,0,7,3),(19,135000,'2023-01-21 05:56:35',NULL,0,'Pokémon Scarlet and Pokémon Violet are the first open-world RPGs in the Pokémon series. As you enjoy the hallmarks of the series—meeting, teaming up with, ...','/media/jpg/1674257194_17.jpg',0,'Pokemon Scarlet','/media/mp4/1674257194_Comic.MP4',NULL,0,3,4),(20,135000,'2023-01-21 05:57:07',NULL,1,'Pokémon Scarlet and Pokémon Violet are the first open-world RPGs in the Pokémon series. As you enjoy the hallmarks of the series—meeting, teaming up with, ...','/media/jpg/1674257226_18.jpg',0,'Pokemon Violet','/media/mp4/1674257226_Comic.MP4',NULL,0,3,4),(21,65000,'2023-01-21 06:02:31',NULL,0,'Dec 14, 2022 — New Revolution in Fighting Games! Guilty Gear -Strive- brings a number of new and innovative game play mechanics designed to allow players new ...','/media/jpg/1674257550_19.jpg',0,'Guilty Gear Strive','/media/mp4/1674257550_Comic.MP4',NULL,0,9,3),(22,70000,'2023-01-21 06:05:04',NULL,0,'Use Your Skills and Reflexes to Survive. Hollow Knight is a challenging 2D action-adventure. You\'ll explore twisting caverns, battle tainted creatures and ...','/media/jpg/1674257703_20.jpg',0,'Hollow Knight','/media/mp4/1674257703_Comic.MP4',NULL,0,11,4),(23,70000,'2023-01-21 06:06:46',NULL,1,'Cyberpunk 2077 is an open-world, action-adventure RPG set in the megalopolis of Night City, where you play as a cyberpunk mercenary wrapped-up in a do-or-die ...','/media/png/1674257806_Cyberpunk2077_SteamAvatars_Male-V.png',0,'Cyberpunk 2077','/media/mp4/1674257806_Comic.MP4',NULL,0,1,3),(24,17600,'2023-01-21 06:10:32',NULL,0,'From mastermind Shinji Mikami, The Evil Within 2 is the latest evolution of survival horror. Detective Sebastian Castellanos has lost it all.','/media/jpg/1674258032_21.jpg',0,'The Evil Within 2','/media/mp4/1674258032_Comic.MP4',NULL,0,8,2),(25,22000,'2023-01-21 06:13:10',NULL,0,'An unparalleled adrenaline rush, gripping storyline, and unimaginable horrors await you. Witness the return of Resident Evil 2. Game contains In-App ...','/media/jpg/1674258189_22.jpg',0,'Resident Evil 2','/media/mp4/1674258189_Comic.MP4',NULL,0,8,1),(26,112000,'2023-01-21 06:15:20',NULL,0,'Escape to a deserted island and create your own paradise as you explore, create, and customize in the Animal Crossing: New Horizons game.','/media/jpg/1674258319_23.jpg',0,'Animal Crossing','/media/mp4/1674258319_Comic.MP4',NULL,0,6,4);
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-21 11:54:45
