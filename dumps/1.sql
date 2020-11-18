-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: our_twitch
-- ------------------------------------------------------
-- Server version	8.0.12

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
-- Table structure for table `ban`
--

DROP TABLE IF EXISTS `ban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ban` (
  `id` int(11) NOT NULL,
  `date_from` timestamp NULL DEFAULT NULL,
  `date_to` timestamp NULL DEFAULT NULL,
  `twitch_moderator_id` int(11) DEFAULT NULL,
  `channel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`channel_id`),
  KEY `twitch_moderator_id_idx` (`twitch_moderator_id`),
  KEY `fk_ban_chanel1_idx` (`channel_id`),
  CONSTRAINT `fk_ban_chanel1` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`id`),
  CONSTRAINT `twitch_moderator_id` FOREIGN KEY (`twitch_moderator_id`) REFERENCES `twitch_moderator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ban`
--

LOCK TABLES `ban` WRITE;
/*!40000 ALTER TABLE `ban` DISABLE KEYS */;
/*!40000 ALTER TABLE `ban` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bot`
--

DROP TABLE IF EXISTS `bot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `functions` tinytext,
  `channel_chat_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_bot_channel_chat1_idx` (`channel_chat_id`),
  CONSTRAINT `fk_bot_channel_chat1` FOREIGN KEY (`channel_chat_id`) REFERENCES `channel_chat` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bot`
--

LOCK TABLES `bot` WRITE;
/*!40000 ALTER TABLE `bot` DISABLE KEYS */;
/*!40000 ALTER TABLE `bot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `broadcast_recording`
--

DROP TABLE IF EXISTS `broadcast_recording`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `broadcast_recording` (
  `id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `title` varchar(20) NOT NULL,
  `view_number` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broadcast_recording`
--

LOCK TABLES `broadcast_recording` WRITE;
/*!40000 ALTER TABLE `broadcast_recording` DISABLE KEYS */;
/*!40000 ALTER TABLE `broadcast_recording` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` enum('Counter-Strike','dota2','Among us') NOT NULL,
  `image` mediumblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel`
--

LOCK TABLES `channel` WRITE;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
INSERT INTO `channel` VALUES (2,52,'distinctio'),(3,85,'quae'),(4,12,'repellendus'),(5,75,'minima'),(6,48,'rerum'),(7,55,'repudiandae'),(8,1,'architecto'),(9,5,'quia'),(10,23,'debitis'),(11,2,'aut'),(12,55,'quia'),(13,60,'qui'),(14,65,'earum'),(15,44,'est'),(16,37,'perspiciatis'),(17,19,'autem'),(18,78,'eaque'),(19,42,'quibusdam'),(20,38,'vel'),(21,37,'minima'),(22,79,'cum'),(23,81,'similique'),(24,25,'aut'),(25,67,'inventore'),(26,23,'ut'),(27,25,'eum'),(28,48,'est'),(29,69,'rerum'),(30,3,'sint'),(31,77,'ut'),(32,27,'nihil'),(33,97,'et'),(34,23,'quia'),(35,42,'accusamus'),(36,94,'dolorem'),(37,15,'eius'),(38,65,'dolor'),(39,15,'illum'),(40,50,'aperiam'),(41,87,'earum'),(42,100,'enim'),(43,74,'dicta'),(44,11,'excepturi'),(45,18,'sed'),(46,83,'quo'),(47,13,'id'),(48,58,'fugit'),(49,68,'nam'),(50,2,'enim'),(51,64,'distinctio'),(52,66,'ut'),(53,82,'excepturi'),(54,47,'in'),(55,68,'est'),(56,24,'sed'),(57,32,'pariatur'),(58,34,'ea'),(59,78,'consequatur'),(60,91,'nemo'),(61,94,'commodi'),(62,62,'et'),(63,28,'optio'),(64,89,'ut'),(65,38,'voluptas'),(66,16,'ad'),(67,92,'sunt'),(68,22,'doloribus'),(69,14,'pariatur'),(70,36,'est'),(71,68,'ut'),(72,33,'quia'),(73,8,'dolores'),(74,25,'officiis'),(75,99,'dolores'),(76,15,'quae'),(77,33,'quis'),(78,65,'aut'),(79,5,'iste'),(80,64,'provident'),(81,47,'consequatur'),(82,55,'tempora'),(83,13,'vel'),(84,20,'exercitationem'),(85,12,'consequatur'),(86,33,'repellendus'),(87,89,'et'),(88,31,'voluptates'),(89,4,'sit'),(90,18,'iste'),(91,58,'at'),(92,28,'voluptatibus'),(93,15,'dicta'),(94,73,'est'),(95,95,'velit'),(96,65,'consequatur'),(97,26,'quo'),(98,39,'qui'),(99,97,'omnis'),(100,68,'ratione');
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_chat`
--

DROP TABLE IF EXISTS `channel_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('followers','subscribers') NOT NULL,
  `delay_between_messages` int(11) DEFAULT '0',
  `channel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_channel_chat_channel1_idx` (`channel_id`),
  CONSTRAINT `fk_channel_chat_channel1` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_chat`
--

LOCK TABLES `channel_chat` WRITE;
/*!40000 ALTER TABLE `channel_chat` DISABLE KEYS */;
INSERT INTO `channel_chat` VALUES (1,'subscribers',0,16),(2,'subscribers',0,62),(3,'subscribers',0,40),(4,'followers',0,62),(5,'followers',0,67),(6,'subscribers',0,96),(7,'subscribers',0,96),(8,'subscribers',0,23),(9,'subscribers',0,86),(10,'subscribers',0,7),(11,'subscribers',0,11),(12,'followers',0,63),(13,'subscribers',0,52),(14,'followers',0,60),(15,'subscribers',0,10),(16,'followers',0,97),(17,'followers',0,20),(18,'subscribers',0,78),(19,'subscribers',0,26),(20,'followers',0,67),(21,'followers',0,68),(22,'subscribers',0,67),(23,'followers',0,73),(24,'subscribers',0,40),(25,'followers',0,71),(26,'followers',0,25),(27,'followers',0,73),(28,'subscribers',0,11),(29,'followers',0,100),(30,'followers',0,98),(31,'subscribers',0,25),(32,'followers',0,73),(33,'subscribers',0,6),(34,'followers',0,28),(35,'subscribers',0,56),(36,'subscribers',0,33),(37,'followers',0,37),(38,'followers',0,9),(39,'followers',0,35),(40,'followers',0,49),(41,'followers',0,51),(42,'subscribers',0,13),(43,'followers',0,16),(44,'subscribers',0,71),(45,'subscribers',0,97),(46,'followers',0,98),(47,'followers',0,33),(48,'subscribers',0,18),(49,'subscribers',0,3),(50,'subscribers',0,79),(51,'subscribers',0,83),(52,'subscribers',0,58),(53,'followers',0,57),(54,'subscribers',0,58),(55,'followers',0,77),(56,'subscribers',0,24),(57,'followers',0,52),(58,'subscribers',0,32),(59,'followers',0,79),(60,'followers',0,45),(61,'followers',0,95),(62,'subscribers',0,39),(63,'followers',0,14),(64,'subscribers',0,75),(65,'followers',0,64),(66,'subscribers',0,63),(67,'subscribers',0,44),(68,'subscribers',0,73),(69,'subscribers',0,61),(70,'subscribers',0,85),(71,'followers',0,10),(72,'followers',0,100),(73,'followers',0,60),(74,'followers',0,12),(75,'subscribers',0,51),(76,'subscribers',0,2),(77,'subscribers',0,78),(78,'followers',0,83),(79,'followers',0,50),(80,'followers',0,17),(81,'subscribers',0,60),(82,'subscribers',0,62),(83,'followers',0,20),(84,'subscribers',0,24),(85,'subscribers',0,49),(86,'followers',0,39),(87,'subscribers',0,15),(88,'subscribers',0,59),(89,'subscribers',0,64),(90,'followers',0,82),(91,'subscribers',0,62),(92,'followers',0,7),(93,'followers',0,88),(94,'subscribers',0,54),(95,'subscribers',0,71),(96,'followers',0,78),(97,'subscribers',0,15),(98,'followers',0,34),(99,'followers',0,53),(100,'followers',0,95);
/*!40000 ALTER TABLE `channel_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_chat_message`
--

DROP TABLE IF EXISTS `channel_chat_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_chat_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `channel_chat_id` int(11) NOT NULL,
  `participant_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_channel_chat_message_channel_chat1_idx` (`channel_chat_id`),
  KEY `fk_channel_chat_message_participant1_idx` (`participant_id`),
  CONSTRAINT `fk_channel_chat_message_channel_chat1` FOREIGN KEY (`channel_chat_id`) REFERENCES `channel_chat` (`id`),
  CONSTRAINT `fk_channel_chat_message_participant1` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_chat_message`
--

LOCK TABLES `channel_chat_message` WRITE;
/*!40000 ALTER TABLE `channel_chat_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `channel_chat_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_chat_message_emoticon`
--

DROP TABLE IF EXISTS `channel_chat_message_emoticon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_chat_message_emoticon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_chat_message_id` int(11) NOT NULL,
  `emoticon_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_channel_chat_message_emoticon_channel_chat_message_idx` (`channel_chat_message_id`),
  KEY `fk_channel_chat_message_emoticon_emoticon1_idx` (`emoticon_id`),
  CONSTRAINT `fk_channel_chat_message_emoticon_channel_chat_message` FOREIGN KEY (`channel_chat_message_id`) REFERENCES `channel_chat_message` (`id`),
  CONSTRAINT `fk_channel_chat_message_emoticon_emoticon1` FOREIGN KEY (`emoticon_id`) REFERENCES `emoticon` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_chat_message_emoticon`
--

LOCK TABLES `channel_chat_message_emoticon` WRITE;
/*!40000 ALTER TABLE `channel_chat_message_emoticon` DISABLE KEYS */;
/*!40000 ALTER TABLE `channel_chat_message_emoticon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_stream`
--

DROP TABLE IF EXISTS `channel_stream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_stream` (
  `id` int(11) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_channel_stream_stream1_idx` (`stream_id`),
  KEY `fk_channel_stream_channel1_idx` (`channel_id`),
  CONSTRAINT `fk_channel_stream_channel1` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`id`),
  CONSTRAINT `fk_channel_stream_stream1` FOREIGN KEY (`stream_id`) REFERENCES `stream` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_stream`
--

LOCK TABLES `channel_stream` WRITE;
/*!40000 ALTER TABLE `channel_stream` DISABLE KEYS */;
INSERT INTO `channel_stream` VALUES (1,60,59),(2,84,42),(3,79,95),(4,82,2),(5,44,51),(6,33,1),(7,84,57),(8,90,40),(9,29,31),(10,82,5),(11,12,95),(12,96,74),(13,76,63),(14,98,77),(15,36,42),(16,60,24),(17,14,43),(18,49,71),(19,48,29),(20,31,93),(21,74,51),(22,68,30),(23,15,51),(24,61,60),(25,31,72),(26,3,100),(27,84,46),(28,51,1),(29,1,10),(30,25,1),(31,91,96),(32,47,56),(33,42,53),(34,40,96),(35,23,50),(36,47,81),(37,8,11),(38,13,70),(39,20,94),(40,41,25),(41,17,11),(42,28,24),(43,66,65),(44,91,9),(45,13,93),(46,80,40),(47,43,77),(48,72,41),(49,44,70),(50,88,11),(51,66,83),(52,71,25),(53,79,11),(54,82,37),(55,99,35),(56,13,47),(57,12,31),(58,5,63),(59,96,91),(60,13,48),(61,84,52),(62,89,82),(63,81,84),(64,8,6),(65,12,52),(66,24,92),(67,45,81),(68,26,96),(69,97,54),(70,99,6),(71,39,41),(72,29,73),(73,13,93),(74,28,56),(75,36,41),(76,66,49),(77,68,93),(78,55,99),(79,93,4),(80,90,56),(81,1,15),(82,34,23),(83,17,57),(84,52,45),(85,12,14),(86,38,94),(87,65,87),(88,53,11),(89,10,84),(90,76,18),(91,59,48),(92,60,50),(93,16,8),(94,61,83),(95,68,1),(96,67,36),(97,27,8),(98,11,33),(99,5,6),(100,58,41);
/*!40000 ALTER TABLE `channel_stream` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_support`
--

DROP TABLE IF EXISTS `chat_support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_support` (
  `id` int(11) NOT NULL,
  `support_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_chat_support_user1_idx` (`user_id`),
  KEY `fk_chat_support_support1_idx` (`support_id`),
  CONSTRAINT `fk_chat_support_support1` FOREIGN KEY (`support_id`) REFERENCES `support` (`id`),
  CONSTRAINT `fk_chat_support_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_support`
--

LOCK TABLES `chat_support` WRITE;
/*!40000 ALTER TABLE `chat_support` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_user`
--

DROP TABLE IF EXISTS `chat_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_user` (
  `id` int(11) NOT NULL,
  `user_from_id` int(11) NOT NULL,
  `user_to_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_chat_user_user1_idx` (`user_from_id`),
  KEY `fk_chat_user_user2_idx` (`user_to_id`),
  CONSTRAINT `fk_chat_user_user1` FOREIGN KEY (`user_from_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_chat_user_user2` FOREIGN KEY (`user_to_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_user`
--

LOCK TABLES `chat_user` WRITE;
/*!40000 ALTER TABLE `chat_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clip`
--

DROP TABLE IF EXISTS `clip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clip` (
  `id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `title` varchar(20) NOT NULL,
  `views_number` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `participant_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_clip_participant1_idx` (`participant_id`),
  CONSTRAINT `fk_clip_participant1` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clip`
--

LOCK TABLES `clip` WRITE;
/*!40000 ALTER TABLE `clip` DISABLE KEYS */;
/*!40000 ALTER TABLE `clip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donate`
--

DROP TABLE IF EXISTS `donate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sum` decimal(10,2) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `text` tinytext,
  `stream_id` int(11) NOT NULL,
  `donate_content_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_donate_stream1_idx` (`stream_id`),
  KEY `fk_donate_donate_content1_idx` (`donate_content_id`),
  KEY `fk_donate_user1_idx` (`user_id`),
  CONSTRAINT `fk_donate_donate_content1` FOREIGN KEY (`donate_content_id`) REFERENCES `donate_content` (`id`),
  CONSTRAINT `fk_donate_stream1` FOREIGN KEY (`stream_id`) REFERENCES `stream` (`id`),
  CONSTRAINT `fk_donate_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donate`
--

LOCK TABLES `donate` WRITE;
/*!40000 ALTER TABLE `donate` DISABLE KEYS */;
/*!40000 ALTER TABLE `donate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donate_content`
--

DROP TABLE IF EXISTS `donate_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donate_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `music` mediumblob,
  `animation` mediumblob,
  `channel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_donate_content_channel1_idx` (`channel_id`),
  CONSTRAINT `fk_donate_content_channel1` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donate_content`
--

LOCK TABLES `donate_content` WRITE;
/*!40000 ALTER TABLE `donate_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `donate_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emoticon`
--

DROP TABLE IF EXISTS `emoticon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emoticon` (
  `id` int(11) NOT NULL,
  `picture` mediumblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emoticon`
--

LOCK TABLES `emoticon` WRITE;
/*!40000 ALTER TABLE `emoticon` DISABLE KEYS */;
/*!40000 ALTER TABLE `emoticon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flyway_schema_history`
--

DROP TABLE IF EXISTS `flyway_schema_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flyway_schema_history` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flyway_schema_history`
--

LOCK TABLES `flyway_schema_history` WRITE;
/*!40000 ALTER TABLE `flyway_schema_history` DISABLE KEYS */;
INSERT INTO `flyway_schema_history` VALUES (1,'1','create site setting','SQL','V1__create_site_setting.sql',190097265,'root','2020-11-16 16:36:58',56,1),(2,'2','create user','SQL','V2__create_user.sql',607799043,'root','2020-11-16 16:36:58',63,1),(3,'3','create friend','SQL','V3__create_friend.sql',-1983132570,'root','2020-11-16 16:36:58',44,1),(4,'4','create chat user','SQL','V4__create_chat_user.sql',-1000477449,'root','2020-11-16 16:36:58',42,1),(5,'5','create support','SQL','V5__create_support.sql',-1395315714,'root','2020-11-16 16:36:58',28,1),(6,'6','create chat support','SQL','V6__create_chat_support.sql',-1851488372,'root','2020-11-16 16:36:58',43,1),(7,'7','create message user','SQL','V7__create_message_user.sql',-852161559,'root','2020-11-16 16:36:59',48,1),(8,'8','create message support','SQL','V8__create_message_support.sql',-2139903544,'root','2020-11-16 16:36:59',46,1),(9,'9','create broadcast recording','SQL','V9__create_broadcast_recording.sql',-706685279,'root','2020-11-16 16:36:59',28,1),(10,'10','create clip','SQL','V10__create_clip.sql',-492265952,'root','2020-11-16 16:36:59',28,1),(11,'11','create video','SQL','V11__create_video.sql',-956626708,'root','2020-11-16 16:36:59',40,1),(12,'12','create channel','SQL','V12__create_channel.sql',-2047169357,'root','2020-11-16 16:36:59',34,1),(13,'13','create participant','SQL','V13__create_participant.sql',-1807434243,'root','2020-11-16 16:36:59',35,1),(14,'14','create follow','SQL','V14__create_follow.sql',1923619746,'root','2020-11-16 16:36:59',81,1),(15,'15','create twitch moderator','SQL','V15__create_twitch_moderator.sql',-710825510,'root','2020-11-16 16:36:59',44,1),(16,'16','create spectator','SQL','V16__create_spectator.sql',-543431854,'root','2020-11-16 16:36:59',54,1),(17,'17','create subscription','SQL','V17__create_subscription.sql',971975155,'root','2020-11-16 16:36:59',58,1),(18,'18','create emoticon','SQL','V18__create_emoticon.sql',1648659339,'root','2020-11-16 16:36:59',51,1),(19,'19','create subscription emoticon','SQL','V19__create_subscription_emoticon.sql',-42267702,'root','2020-11-16 16:37:00',62,1),(20,'20','create moderator','SQL','V20__create_moderator.sql',-1455301970,'root','2020-11-16 16:37:00',56,1),(21,'21','create ban','SQL','V21__create_ban.sql',-2063197520,'root','2020-11-16 16:37:00',62,1),(22,'22','type of limitation','SQL','V22__type_of_limitation.sql',323538679,'root','2020-11-16 16:37:00',51,1),(23,'23','create user limitation','SQL','V23__create_user_limitation.sql',-498371784,'root','2020-11-17 14:21:08',75,1),(24,'24','create channel chat','SQL','V24__create_channel_chat.sql',1426843225,'root','2020-11-17 14:21:08',21,1),(25,'25','create bot','SQL','V25__create_bot.sql',397095277,'root','2020-11-17 14:21:08',21,1),(26,'26','create category','SQL','V26__create_category.sql',1567089990,'root','2020-11-17 14:21:08',18,1),(27,'27','create channel chat message','SQL','V27__create_channel_chat_message.sql',1401129791,'root','2020-11-17 14:21:08',20,1),(29,'29','create stream configuration','SQL','V29__create_stream_configuration.sql',1803947250,'root','2020-11-17 14:21:08',21,1),(30,'30','create stream','SQL','V30__create_stream.sql',-1804286743,'root','2020-11-17 14:21:08',26,1),(31,'31','create channel stream','SQL','V31__create_channel_stream.sql',-814418158,'root','2020-11-17 14:21:08',18,1),(32,'32','create donate content','SQL','V32__create_donate_content.sql',711497700,'root','2020-11-17 14:21:08',16,1),(33,'33','create donate','SQL','V33__create_donate.sql',1308190550,'root','2020-11-17 14:21:08',23,1),(34,'34','create voting','SQL','V34__create_voting.sql',-1330121619,'root','2020-11-17 14:21:08',22,1),(35,'35','create option','SQL','V35__create_option.sql',1247956947,'root','2020-11-17 14:21:08',23,1),(36,'36','create report','SQL','V36__create_report.sql',-1740746088,'root','2020-11-17 14:21:08',24,1),(37,'37','alter table','SQL','V37__alter_table.sql',-1909912631,'root','2020-11-17 16:13:31',1342,1),(38,'28','create channel chat message emoticon','SQL','V28__create_channel_chat_message_emoticon.sql',-1568550202,'root','2020-11-17 17:36:39',130,1),(39,'38','insert into channel','SQL','V38__insert_into_channel.sql',-1263766045,'root','2020-11-18 21:35:24',334,1),(40,'39','insert into channel chat','SQL','V39__insert_into_channel_chat.sql',392591908,'root','2020-11-18 21:35:24',149,1),(41,'40','insert into stream','SQL','V40__insert_into_stream.sql',-22869629,'root','2020-11-18 21:35:24',130,1),(42,'41','insert into channel stream','SQL','V41__insert_into_channel_stream.sql',2073517100,'root','2020-11-18 21:35:24',107,1),(43,'42','insert into user','SQL','V42__insert_into_user.sql',-208130054,'root','2020-11-18 21:35:25',116,1),(44,'43','.insert into participant','SQL','V43__.insert_into_participant.sql',-1624462608,'root','2020-11-18 21:35:25',103,1);
/*!40000 ALTER TABLE `flyway_schema_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follow` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend`
--

DROP TABLE IF EXISTS `friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_friend_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_friend_user1_idx` (`user_id`),
  KEY `fk_friend_user2_idx` (`user_friend_id`),
  CONSTRAINT `fk_friend_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_friend_user2` FOREIGN KEY (`user_friend_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend`
--

LOCK TABLES `friend` WRITE;
/*!40000 ALTER TABLE `friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_support`
--

DROP TABLE IF EXISTS `message_support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_support` (
  `id` int(11) NOT NULL,
  `support_id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `date` datetime DEFAULT NULL,
  `chat_type` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_message_support_support1_idx` (`support_id`),
  KEY `fk_message_support_chat_support1_idx` (`chat_id`),
  CONSTRAINT `fk_message_support_chat_support1` FOREIGN KEY (`chat_id`) REFERENCES `chat_support` (`id`),
  CONSTRAINT `fk_message_support_support1` FOREIGN KEY (`support_id`) REFERENCES `support` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_support`
--

LOCK TABLES `message_support` WRITE;
/*!40000 ALTER TABLE `message_support` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_user`
--

DROP TABLE IF EXISTS `message_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `chat_type` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_message_user_user1_idx` (`user_id`),
  KEY `fk_message_user_chat_user1_idx` (`chat_id`),
  CONSTRAINT `fk_message_user_chat_support1` FOREIGN KEY (`chat_id`) REFERENCES `chat_support` (`id`),
  CONSTRAINT `fk_message_user_chat_user1` FOREIGN KEY (`chat_id`) REFERENCES `chat_user` (`id`),
  CONSTRAINT `fk_message_user_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_user`
--

LOCK TABLES `message_user` WRITE;
/*!40000 ALTER TABLE `message_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moderator`
--

DROP TABLE IF EXISTS `moderator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moderator` (
  `id` int(11) NOT NULL,
  `participant_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`participant_id`),
  KEY `fk_moderator_participant1_idx` (`participant_id`),
  CONSTRAINT `fk_moderator_participant1` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moderator`
--

LOCK TABLES `moderator` WRITE;
/*!40000 ALTER TABLE `moderator` DISABLE KEYS */;
/*!40000 ALTER TABLE `moderator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option`
--

DROP TABLE IF EXISTS `option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `voters_number` int(11) DEFAULT NULL,
  `voting_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_option_voting1_idx` (`voting_id`),
  CONSTRAINT `fk_option_voting1` FOREIGN KEY (`voting_id`) REFERENCES `voting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option`
--

LOCK TABLES `option` WRITE;
/*!40000 ALTER TABLE `option` DISABLE KEYS */;
/*!40000 ALTER TABLE `option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant`
--

DROP TABLE IF EXISTS `participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participant` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant`
--

LOCK TABLES `participant` WRITE;
/*!40000 ALTER TABLE `participant` DISABLE KEYS */;
INSERT INTO `participant` VALUES (1,70,5),(2,96,43),(3,26,6),(4,24,37),(5,70,51),(6,78,87),(7,13,84),(8,24,95),(9,75,57),(10,19,12),(11,71,65),(12,96,56),(13,2,21),(14,100,18),(15,28,67),(16,95,38),(17,63,19),(18,100,17),(19,5,9),(20,36,81),(21,15,87),(22,87,66),(23,98,99),(24,90,29),(25,74,45),(26,15,69),(27,1,29),(28,70,66),(29,56,86),(30,92,47),(31,6,16),(32,34,72),(33,56,94),(34,35,93),(35,80,13),(36,42,58),(37,4,97),(38,85,2),(39,7,26),(40,97,15),(41,4,13),(42,86,42),(43,9,86),(44,70,18),(45,89,42),(46,43,1),(47,100,91),(48,87,49),(49,38,47),(50,15,58),(51,2,27),(52,5,94),(53,24,44),(54,93,44),(55,53,44),(56,81,11),(57,77,8),(58,70,95),(59,97,56),(60,34,92),(61,85,28),(62,38,9),(63,73,55),(64,64,89),(65,1,74),(66,73,61),(67,31,96),(68,64,98),(69,34,81),(70,88,100),(71,57,69),(72,36,21),(73,8,76),(74,62,57),(75,61,94),(76,74,64),(77,28,68),(78,28,45),(79,61,55),(80,39,80),(81,43,60),(82,7,51),(83,7,65),(84,31,31),(85,46,21),(86,39,36),(87,43,47),(88,12,50),(89,95,90),(90,48,88),(91,85,64),(92,95,2),(93,38,40),(94,77,46),(95,38,67),(96,33,37),(97,86,70),(98,58,30),(99,45,57),(100,12,73);
/*!40000 ALTER TABLE `participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reason` enum('sexual content','racism') NOT NULL,
  `description` tinytext,
  `date` datetime DEFAULT NULL,
  `stream_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_report_stream1_idx` (`stream_id`),
  KEY `fk_report_video1_idx` (`video_id`),
  KEY `fk_report_user1_idx` (`user_id`),
  CONSTRAINT `fk_report_stream1` FOREIGN KEY (`stream_id`) REFERENCES `stream` (`id`),
  CONSTRAINT `fk_report_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_report_video1` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_setting`
--

DROP TABLE IF EXISTS `site_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_setting` (
  `id` int(11) NOT NULL,
  `theme` varchar(45) NOT NULL DEFAULT '1',
  `language` varchar(25) DEFAULT 'English',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_setting`
--

LOCK TABLES `site_setting` WRITE;
/*!40000 ALTER TABLE `site_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spectator`
--

DROP TABLE IF EXISTS `spectator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spectator` (
  `id` int(11) NOT NULL,
  `follow_id` int(11) NOT NULL,
  `participant_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`follow_id`,`participant_id`),
  KEY `fk_spectator_follow1_idx` (`follow_id`),
  KEY `fk_spectator_participant1_idx` (`participant_id`),
  CONSTRAINT `fk_spectator_follow1` FOREIGN KEY (`follow_id`) REFERENCES `follow` (`id`),
  CONSTRAINT `fk_spectator_participant1` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spectator`
--

LOCK TABLES `spectator` WRITE;
/*!40000 ALTER TABLE `spectator` DISABLE KEYS */;
/*!40000 ALTER TABLE `spectator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stream`
--

DROP TABLE IF EXISTS `stream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stream` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` tinytext,
  `stream_configuration_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_stream_stream_configuration_idx` (`stream_configuration_id`),
  KEY `fk_stream_category1_idx` (`category_id`),
  CONSTRAINT `fk_stream_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_stream_stream_configuration` FOREIGN KEY (`stream_configuration_id`) REFERENCES `stream_configuration` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stream`
--

LOCK TABLES `stream` WRITE;
/*!40000 ALTER TABLE `stream` DISABLE KEYS */;
INSERT INTO `stream` VALUES (1,'itaque','Nam harum et enim et impedit similique corrupti. Aperiam perspiciatis quaerat dolor praesentium aut eum. Dignissimos alias deleniti aut vel veniam officia. Incidunt quasi quasi recusandae sed quis aut eveniet.',97,70),(2,'ratione','Vitae sapiente ut vero cum. Quidem modi maiores rem ratione consequatur. Expedita iure tempora sunt consequatur ex odio vel.',61,47),(3,'at','Rerum nulla possimus beatae minus distinctio pariatur sed. Perspiciatis sed ut id consectetur eos. Quia id corrupti distinctio rerum magnam recusandae. Sint veniam vel quam dignissimos deleniti pariatur.',92,32),(4,'quis','Libero nobis nulla voluptatum corporis. Sit exercitationem in necessitatibus velit nostrum molestias. Modi voluptates vitae porro id nulla.',3,92),(5,'ut','Qui quidem et aut iure. Quibusdam totam earum nam nisi voluptas sunt. Nobis unde id et occaecati distinctio a. Ipsum quaerat omnis neque eligendi illum.',20,98),(6,'iusto','Reiciendis vero est accusantium totam voluptas dolor. Quis perspiciatis corrupti velit. Architecto eum perspiciatis nobis nemo occaecati error. Tempore labore dolores ipsum asperiores maxime cupiditate veniam.',63,93),(7,'aut','Aut eum iusto tenetur error. Officia excepturi rerum est laboriosam ut recusandae voluptas. Impedit laborum ipsa voluptatem possimus culpa.',13,33),(8,'dolores','Facere accusamus delectus natus deserunt et. Eos suscipit quibusdam sed aut et. Commodi in optio fugit cum voluptatum magnam aut.',33,90),(9,'molestiae','Unde qui enim accusamus corporis ab explicabo. Eos qui similique natus qui repudiandae non qui. Aut dolorem ratione voluptatem explicabo vero sed sint. Alias dolor quisquam nobis voluptatem.',49,58),(10,'dignissimos','A quam ipsam fuga est. Dolores placeat consequatur libero ipsum. Qui neque laborum saepe. Nemo temporibus repudiandae suscipit et velit.',94,32),(11,'quae','Corrupti doloribus maxime hic quis sapiente et. Et quis aperiam vel non dolorem soluta excepturi. Voluptatem mollitia maiores saepe. Quisquam voluptas omnis et qui impedit.',45,93),(12,'dolorem','Voluptatem mollitia eos sapiente dolores recusandae quia non voluptatem. Repellat harum voluptatem accusamus consequatur molestias. Vel est vel beatae ut laudantium voluptatem. Quidem animi eos soluta voluptas labore officia nesciunt.',53,84),(13,'eius','Placeat earum quae eaque in. Nihil mollitia aliquam dolorem. Repudiandae fugiat est soluta quibusdam. Minima et dolor in quia corporis perspiciatis.',41,29),(14,'qui','Magni similique ut numquam eos totam inventore. Eaque omnis et qui recusandae enim. Id unde modi assumenda quo sit fugit consectetur.',48,21),(15,'veniam','Quasi ut qui accusamus est ut blanditiis eius. Aspernatur dignissimos porro quas unde rerum omnis rerum dolore. Dicta atque sint hic sit eligendi. Consequuntur vel sunt dolores facere magni deserunt harum.',63,84),(16,'voluptatem','Provident iusto dolorem eligendi adipisci. Et facilis qui similique. Ipsam ut non eos.',7,30),(17,'dolor','At deleniti alias facere optio cum quasi. Id sunt quis ullam ipsum. Omnis odit voluptatem sint molestiae molestias reiciendis occaecati.',95,28),(18,'est','Rem est assumenda sit eum deleniti suscipit qui fuga. Consequatur molestiae nostrum officiis et quo quia eius. Consequatur voluptate saepe sed eligendi facere. Et aspernatur ab facilis sint cumque debitis distinctio modi.',87,20),(19,'aut','Unde velit ea ut accusantium sunt ut. Sed nihil laboriosam eos quae. Odio velit eum minima enim in aliquid.',12,19),(20,'sed','Quibusdam in eos aspernatur. Totam ratione cupiditate aut. Quia fugiat quisquam qui qui sed itaque. Ad illo iure et dolorem veritatis autem.',3,50),(21,'numquam','Voluptatem dolorem delectus nobis totam nisi non deleniti. Nulla beatae odit maiores. Quidem sint et aut non architecto.',16,26),(22,'et','Qui suscipit molestiae dignissimos vitae provident ut distinctio. Ut impedit doloremque deleniti vitae qui sapiente error. Rerum nesciunt et quia unde voluptate distinctio. Saepe alias consequatur ea. Et pariatur voluptatem ipsa repudiandae perspiciatis i',82,27),(23,'consequatur','Aliquid et omnis tempora earum ipsum. Repudiandae corrupti rem voluptas pariatur. Nam sed occaecati atque aspernatur quam. Ea sequi voluptatem odit aut voluptas. Facere exercitationem qui suscipit quaerat.',40,25),(24,'culpa','Est ullam corporis est quia earum numquam quasi. Incidunt et dolor beatae deleniti. Rerum eum dolores quasi et. Nulla omnis porro quibusdam velit corrupti.',32,65),(25,'rerum','Vel exercitationem distinctio id veritatis voluptatum necessitatibus. Nisi voluptatem excepturi velit et cumque ex distinctio id. Quam velit esse aut est. Molestiae nostrum quo ut autem eveniet eveniet. Delectus omnis sint hic dicta modi.',98,65),(26,'et','Qui et accusantium nesciunt. Consequatur velit sed similique aliquid minus perspiciatis laborum. Veritatis sed ea ipsa sed voluptas quas. Et officiis deleniti eveniet temporibus illo commodi dolor quae.',56,40),(27,'reiciendis','Consectetur aut placeat velit et eligendi quidem. Fugit laborum quia qui sequi repudiandae architecto vel. Ut omnis modi tempore et qui nemo soluta. Et eum molestiae minus consequuntur.',85,38),(28,'quasi','Minima consequuntur excepturi et facilis. Quas excepturi commodi nam aliquam architecto. Id provident sed enim ut quae deleniti.',94,76),(29,'qui','Molestiae rem qui quod rerum. Et qui ipsum ut voluptate enim odit non ducimus. Quisquam est sunt sit dolores quis. Consectetur ut magnam voluptate sint fugit.',36,23),(30,'cumque','Nulla ad similique commodi rerum quisquam totam voluptatem. Beatae voluptatem quo non perferendis eos quod est adipisci. Cumque in iure ut libero ratione et ullam.',97,22),(31,'reiciendis','Repellendus provident voluptas perspiciatis voluptas. Et placeat quam suscipit qui sed. Soluta modi numquam et quia.',64,36),(32,'eligendi','Quidem qui iusto dolorum ut reprehenderit. Dignissimos voluptate qui et minus delectus aut vero. Non consequatur impedit nesciunt et id soluta doloribus. Maxime aut sunt rem tempora nihil.',52,77),(33,'sint','Eos quo molestiae sed magni pariatur expedita ipsam. Sunt aliquid soluta autem voluptatem voluptatum.',54,23),(34,'quo','Qui sit illum aliquam et. Qui aut quibusdam amet tempore assumenda.',48,11),(35,'consequuntur','Impedit et perspiciatis id aut eveniet. Occaecati consequatur dignissimos quia minima quia aut aliquam ut. Facere quo perferendis quam doloribus animi dolor. Et molestias doloremque consequuntur mollitia velit.',16,81),(36,'rerum','Deleniti dolor et libero quia sint qui tempore. Necessitatibus et incidunt sapiente ut doloribus. Id velit ut laboriosam vero est eveniet. Est cupiditate consequuntur harum amet.',71,3),(37,'voluptatibus','Id ipsum vel nam. Iste possimus non itaque natus aperiam ipsa eligendi.',70,84),(38,'voluptatem','Est mollitia voluptatibus nemo. Perferendis nihil ex nemo officia. Ducimus voluptatum magni et laboriosam rerum debitis architecto.',91,36),(39,'qui','Modi saepe molestiae est asperiores consequatur. Qui quia et sed omnis.',74,92),(40,'aut','Delectus iusto sit in et. Quo iure nihil consequatur ad autem ut. Quam deleniti ex quae.',39,100),(41,'beatae','In ad dolorum repellat voluptatum sed quis ut. Voluptatem maiores in ut doloribus. Quis voluptatibus distinctio aut id iusto sequi dolor.',76,81),(42,'voluptatem','Necessitatibus error et laudantium rerum ab suscipit quo. Nesciunt suscipit necessitatibus cum aut dolor. Aut nemo voluptates quis est.',30,61),(43,'est','Vel reprehenderit corporis maiores libero est culpa velit. Natus iure voluptatum eum quia. Harum aut est laudantium dignissimos eveniet vel. Eius beatae dolores fugiat sint dignissimos dolores. Incidunt maxime magni sed.',74,4),(44,'consequatur','Voluptatem omnis veniam voluptatem dolorem adipisci dolores aut. Voluptates dolorem iusto deleniti quisquam. Delectus possimus enim officia placeat deleniti est.',28,66),(45,'non','Ipsa ut qui odit. Labore laborum architecto dolore non officia unde debitis. Ut in labore ut illo. Quaerat quaerat id aut aspernatur ea.',40,27),(46,'quas','Et iste qui laudantium est. Nam aliquam sit et.',67,20),(47,'sit','Dolores nulla fuga illo magnam omnis praesentium consequatur eius. Consequuntur a id ullam quo totam maiores rerum ipsum. Ut vel fuga delectus omnis ut.',91,69),(48,'et','Laudantium alias totam perferendis aut explicabo unde eos. Facere quisquam eos illum placeat. Quia voluptatem asperiores iusto ea magni.',93,78),(49,'sed','Qui nihil similique fugit modi consequatur. Tempore a illo dolorum culpa nulla accusantium. Voluptas ut et et aliquid est velit. Consequuntur voluptatem reiciendis labore ut culpa rerum et.',64,33),(50,'corrupti','Maxime quidem dolor delectus id ut illo. Qui voluptatem totam corrupti eos aperiam est omnis.',29,44),(51,'modi','Et repellendus quisquam expedita numquam. Consequatur ea libero dolore unde similique. Sapiente est commodi officia nobis. Voluptas veniam eius possimus optio ipsa.',26,44),(52,'aut','Ut nihil a cupiditate quaerat id. Aspernatur labore aut ratione omnis. Omnis voluptas sint ut nisi aut. Et modi nihil aliquam est laboriosam.',41,56),(53,'voluptatum','Quia porro et saepe expedita animi. A autem quia ea dolor qui dolore. Saepe neque dolore minima culpa eos dolorem doloribus.',98,73),(54,'harum','Quos ea beatae qui ut. Dolore sit incidunt ut quas voluptatum ut aut. Accusamus vero qui natus voluptas.',46,7),(55,'eius','Aut consectetur ipsum tempore fugit id accusamus. Qui repellat saepe voluptas ea. Quis qui deserunt eius maiores sit mollitia soluta.',69,57),(56,'ducimus','Impedit cum laborum omnis facere deleniti. Ut optio ut aperiam eum ab sit error quia. Voluptatibus corporis nisi aliquam non.',47,45),(57,'omnis','Nulla vel ut iure reiciendis consequatur earum dolorum. Sapiente odio et et. Architecto ea quibusdam amet aliquam.',13,88),(58,'facere','Est saepe iusto quos et dolorem quia. Et sunt qui eum magni. Voluptas voluptatibus aut laboriosam temporibus. Exercitationem debitis vitae repellat nobis officia nesciunt nisi.',23,55),(59,'est','Et ea ullam animi sit voluptatem. Rerum eos earum vero velit beatae consequatur ipsa quasi. Consequatur cumque tempora voluptatem et quas non amet.',21,31),(60,'sunt','Consequatur in illum voluptatem optio. Animi libero molestiae est eligendi labore.',6,22),(61,'omnis','Facilis est eos possimus et quia. Et est porro voluptas corporis laborum earum amet voluptates. Minima non quia ab iusto quos unde deleniti. Neque qui impedit facere maiores molestiae rerum necessitatibus. Corrupti dignissimos quam incidunt rerum molestia',100,53),(62,'et','Vero temporibus quia minus incidunt enim. Qui fugiat dolorem nulla nesciunt. Repudiandae consequuntur ut ex earum ut.',57,92),(63,'nihil','Ducimus accusamus aspernatur laboriosam in occaecati illo. Impedit pariatur consequatur veniam ut tenetur inventore consequuntur. Praesentium quos repellat aut reprehenderit explicabo. Distinctio est maxime odit fugit.',23,57),(64,'enim','Maxime temporibus nostrum dolorem id. Quia nihil deserunt culpa facere quis ducimus saepe. Ut est eum id vel quod rem minima.',66,38),(65,'in','Sapiente sit rerum perspiciatis occaecati recusandae odio suscipit alias. Rerum dolor ratione aut ut deserunt modi. Incidunt doloremque deserunt possimus sed corrupti quia. Iste atque cupiditate consequuntur sunt et perferendis. Perspiciatis voluptatem si',69,92),(66,'error','Beatae autem quia sit ut et deserunt aut nihil. Repellat omnis nemo ut similique.',44,31),(67,'ipsam','Perspiciatis eveniet rerum quis labore magnam reprehenderit magnam. Et illum consequuntur consequatur at delectus quam ut dolorem. Reprehenderit ut consequatur atque quasi omnis voluptatem mollitia.',18,58),(68,'officiis','Est in et dolorem voluptatem et. Similique expedita dolorum nisi minima quas vitae fugiat. Quae sed dolorum tempora reprehenderit incidunt error. Inventore molestias iure adipisci ut perferendis et qui beatae.',58,56),(69,'consequatur','Vel et quia quis cumque sint fugiat. Maiores aliquam commodi autem. Non eos praesentium qui reprehenderit officiis voluptatem velit. Tempora ullam doloribus qui corporis harum qui consequatur.',1,3),(70,'nostrum','Quaerat quasi et ut ullam enim. Modi dolore rerum veniam saepe commodi doloremque. Magni voluptas ipsum qui tenetur maxime sit.',41,93),(71,'et','Temporibus aut qui neque velit eaque. Ipsa quia optio voluptas quidem aut illum. Ipsam et delectus ducimus sapiente cumque nostrum. Ullam molestias et deserunt voluptatem voluptatem quia.',99,66),(72,'in','Neque qui iure voluptatem perspiciatis. Provident provident ipsam exercitationem quo cupiditate. Maxime perferendis aut dolorum architecto corporis in pariatur. Ex nisi dolorem sint et earum.',68,60),(73,'quae','Animi quis rerum et nihil maiores qui expedita. Iste numquam ab fuga iusto aperiam. Quis occaecati velit in molestias doloremque corporis.',45,50),(74,'illo','Eius et enim sit libero architecto. Est consequatur iure totam reiciendis minima. Quasi id sunt quia qui qui earum.',63,14),(75,'odio','Repellat debitis fuga quia architecto sed molestias. Tempore similique veniam corporis. Asperiores non ut non impedit soluta. Non ipsa et vel autem amet illo.',64,52),(76,'distinctio','Voluptates id dolorum esse libero delectus quia vitae. Facere possimus dolor fuga blanditiis.',16,81),(77,'cumque','Quis excepturi non eos at id et ducimus. Officiis cumque dolorem beatae at ut assumenda fugiat. Dolorum cum vero consequatur aliquid. Consequatur veniam omnis sit doloremque.',79,71),(78,'laudantium','Beatae impedit occaecati necessitatibus consectetur. Possimus consequatur amet voluptas. Eveniet veniam aut et ad.',74,17),(79,'voluptatem','Atque quos officiis nihil numquam explicabo. Ut sunt quae dolores dignissimos molestiae commodi ut. Ea sit consequatur dolores fugiat qui repellendus iusto.',44,100),(80,'officiis','Nostrum vero voluptas velit nobis ut placeat. Voluptatem numquam voluptatibus quia rem reiciendis non voluptatem nihil. Eos quia dolores repudiandae iure.',31,88),(81,'modi','Eius quia quis fugit velit. Vel sequi nihil facere cupiditate architecto harum. Voluptates impedit saepe ipsum a illo expedita reiciendis. Qui qui suscipit at magnam nostrum.',88,90),(82,'architecto','Ab repudiandae dignissimos quam exercitationem nulla. Asperiores voluptatum quae labore est. Fuga incidunt voluptate distinctio eaque nisi rerum sed. Rerum eius dignissimos est illo.',19,39),(83,'facilis','Occaecati ut eius voluptatem adipisci. Voluptatem velit aliquid autem facere aut aspernatur. Quasi aut repudiandae molestiae iste ab corporis. Voluptate officia ullam facere.',52,13),(84,'tempore','Quidem laborum officia pariatur velit repellat. Sit qui quibusdam qui non non ab. Sit odit harum est dignissimos cum. Placeat ab et cupiditate est eum cupiditate.',48,38),(85,'reprehenderit','Maiores dolorem ipsum ducimus ut et et. Nihil quis voluptas omnis a. Id qui tempora in autem occaecati.',9,43),(86,'et','Eveniet aut ipsa dolorem aut enim impedit. Sit aut enim enim quisquam dicta culpa molestiae. Rerum temporibus sed repellat debitis. Quaerat sapiente officia reprehenderit corporis.',44,52),(87,'ipsum','Necessitatibus sit enim consequatur. Harum voluptas amet et officia. Dolorum alias voluptate omnis. Dolor voluptate ipsa eum non natus.',4,45),(88,'quia','Accusantium aperiam sed quia est impedit ea non. Iusto esse ducimus aut necessitatibus. Architecto sint aperiam accusamus sed.',37,3),(89,'tempora','Qui assumenda omnis est qui quis quia laboriosam. Rerum eos odit non ipsa sed voluptas. Deleniti quo et sed sapiente quia. Quia quis aut nesciunt et.',43,86),(90,'harum','Et alias ea autem laudantium et. Quos laborum eligendi consequatur. Voluptatem est ipsa quam error qui sed ut optio. Beatae voluptatem sed eos possimus.',42,83),(91,'dolores','Quaerat enim voluptas molestias quisquam soluta eveniet suscipit. Rerum et quis autem quis nisi cupiditate aut. Aut quo necessitatibus repudiandae.',15,37),(92,'odio','Dolorem magnam soluta facere reiciendis qui eum. Maiores nam quis consequatur. Excepturi consequatur qui praesentium vel. Doloribus consequatur ut esse.',94,37),(93,'doloremque','Ad praesentium voluptatem placeat omnis. Reiciendis blanditiis nam inventore quo ipsum et et. Molestias magni corporis aut rerum saepe quia officiis.',27,82),(94,'et','Atque ut facere quas ut vel blanditiis qui. Ad nam omnis magni placeat natus iure dolorum sit. Enim quia similique ab voluptatem et incidunt eaque.',7,98),(95,'ut','Et officiis et consequatur adipisci. Cumque qui quae molestiae id nemo adipisci veritatis et. Perferendis sed vitae at rerum pariatur enim. Nemo aliquid nemo consequatur cum expedita sunt itaque.',35,70),(96,'soluta','Quo molestiae eius maiores sed placeat. Accusamus doloremque laborum magnam qui. Eveniet sed doloremque rerum repellat. Totam consequatur quod sed et sed qui praesentium.',4,41),(97,'quo','Aut vitae modi consequatur quae. Ipsam vero praesentium eum omnis sed. Cupiditate sed laboriosam non consectetur earum molestias magnam. A hic sint dolore provident perspiciatis omnis.',68,66),(98,'ducimus','Minus officiis repellat et facere quasi in. Non omnis quia optio nobis cum delectus recusandae. Sed adipisci magni et ab earum non necessitatibus. Ab eius eaque quis occaecati qui eum. Voluptatibus voluptatum quo officia laboriosam dolor veritatis.',94,95),(99,'atque','Voluptatem dolore in placeat quia. Distinctio totam officia et vero debitis cupiditate eveniet.',33,16),(100,'et','Ratione enim cum eos totam ea. Fuga voluptatem corporis delectus nemo id unde harum dolorem. Placeat dolor molestiae cumque ut voluptas suscipit.',74,7);
/*!40000 ALTER TABLE `stream` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stream_configuration`
--

DROP TABLE IF EXISTS `stream_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stream_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `max_quality` enum('360','480','720','1080','1440','ultraHD','4K') NOT NULL DEFAULT '720',
  `delay` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stream_configuration`
--

LOCK TABLES `stream_configuration` WRITE;
/*!40000 ALTER TABLE `stream_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `stream_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription` (
  `id` int(11) NOT NULL,
  `spectator_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`spectator_id`),
  KEY `fk_subscription_spectator1_idx` (`spectator_id`),
  CONSTRAINT `fk_subscription_spectator1` FOREIGN KEY (`spectator_id`) REFERENCES `spectator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_emoticon`
--

DROP TABLE IF EXISTS `subscription_emoticon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_emoticon` (
  `subscription_id` int(11) NOT NULL,
  `emoticon_id` int(11) NOT NULL,
  KEY `subcription_id_idx` (`subscription_id`),
  KEY `emoticon_id_idx` (`emoticon_id`),
  CONSTRAINT `emoticon_id` FOREIGN KEY (`emoticon_id`) REFERENCES `emoticon` (`id`),
  CONSTRAINT `subcription_id` FOREIGN KEY (`subscription_id`) REFERENCES `subscription` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_emoticon`
--

LOCK TABLES `subscription_emoticon` WRITE;
/*!40000 ALTER TABLE `subscription_emoticon` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_emoticon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support`
--

DROP TABLE IF EXISTS `support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support`
--

LOCK TABLES `support` WRITE;
/*!40000 ALTER TABLE `support` DISABLE KEYS */;
/*!40000 ALTER TABLE `support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twitch_moderator`
--

DROP TABLE IF EXISTS `twitch_moderator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twitch_moderator` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twitch_moderator`
--

LOCK TABLES `twitch_moderator` WRITE;
/*!40000 ALTER TABLE `twitch_moderator` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitch_moderator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_of_limitation`
--

DROP TABLE IF EXISTS `type_of_limitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_of_limitation` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_of_limitation`
--

LOCK TABLES `type_of_limitation` WRITE;
/*!40000 ALTER TABLE `type_of_limitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `type_of_limitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `info` varchar(45) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `status` enum('в сети','невидимый','Не беспокоить') DEFAULT 'в сети',
  `share` tinyint(4) DEFAULT '1',
  `image` varchar(255) NOT NULL DEFAULT 'default_image.jpg',
  `banner` varchar(255) DEFAULT 'default_banner.jpg',
  `site_setting_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_user_site_setting_idx` (`site_setting_id`),
  CONSTRAINT `fk_user_site_setting` FOREIGN KEY (`site_setting_id`) REFERENCES `site_setting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'denesik.phyllis','0bbc07e628436f7882ee195818f4caf1ddcbe278','k','1973-06-25 00:00:00','невидимый',1,'a','a',41),(2,'o\'keefe.delfina','3dea0fe125e8d6921e4a70df2dff651a33a7f8c2','e','1971-11-11 00:00:00','в сети',1,'b','b',39),(3,'dietrich.mozelle','039bc4f58908cdb68a776d0f4d2b9f606c7c987f','j','2017-03-02 00:00:00','Не беспокоить',1,'c','c',92),(4,'vstroman','2f74c3f6f07a6138e71d6561595c2af8c1f3390c','u','1974-06-28 00:00:00','Не беспокоить',0,'b','b',64),(5,'lora.olson','a4f8b5681a8c5b5422ae3599b899abf636125bbf','t','1975-07-13 00:00:00','в сети',0,'b','a',47),(6,'marian89','471394e7b6add7e8233f0c7082575afc61ca7d01','c','1990-12-21 00:00:00','невидимый',1,'c','a',10),(7,'river84','7c0d26c14fe27c9952f55dc0729791a0fa4588b8','p','2019-12-23 00:00:00','невидимый',0,'c','b',35),(8,'obergstrom','cc3822aff0187ea8795fbfa1c4fcbe62a65312e6','q','2010-11-17 00:00:00','в сети',0,'c','b',66),(9,'snitzsche','dc552006421cb90c3e9eb67f693cbe6c1698e5c7','x','1988-06-14 00:00:00','Не беспокоить',1,'c','c',1),(10,'demarcus17','b8600258821021d6cbbac1c957763d24c24f5494','s','2000-09-01 00:00:00','в сети',0,'c','a',61),(11,'leannon.providenci','7d75faa4a010c1b060e70144fd3507df5b943589','e','2001-11-19 00:00:00','в сети',0,'b','a',6),(12,'pwill','6ddce983037fdcdea3cf198f8797b05ce857c467','p','1975-02-17 00:00:00','невидимый',0,'c','a',67),(13,'brycen.rippin','920ccadd1803a1733955b0106912f7755822d69c','k','2007-12-09 00:00:00','невидимый',0,'a','b',50),(14,'krystal.bechtelar','03c229b1c1ed843f7338e5e17d14bb8fa9bfe42e','y','2013-07-08 00:00:00','невидимый',0,'b','a',22),(15,'leanne.runolfsdottir','b2c8d9764fe6f1b73aaf4473d61987ce26f26a98','x','1994-09-06 00:00:00','в сети',1,'a','a',32),(16,'beatty.marion','a506203e4b4ac175df0d9e081bf894591217b039','f','1997-01-29 00:00:00','Не беспокоить',1,'c','c',33),(17,'moses.wolf','4c1661909420401a2de1308a8d6f9c4b0f7c3fc3','g','1988-08-30 00:00:00','Не беспокоить',0,'c','b',88),(18,'schultz.eudora','262e03c3662c94ce0c81c88840cb3e0580000802','e','1976-12-01 00:00:00','Не беспокоить',0,'b','a',8),(19,'meghan60','bf8f59d02283b7971ee56c531a6a0e7fb352b4c1','b','1982-09-11 00:00:00','Не беспокоить',0,'a','b',7),(20,'myrna.hirthe','eebbdcc84933efb57a28e3e3871a99672adfe7a1','w','2013-12-01 00:00:00','Не беспокоить',0,'c','c',83),(21,'alessandro43','7bcd721c67d297f92739b086938141eda1060889','b','2016-01-19 00:00:00','Не беспокоить',1,'c','a',44),(22,'audra.prosacco','3212bb30ce3cb2969ea82a726ff939295037a271','m','1976-07-20 00:00:00','невидимый',1,'b','b',95),(23,'ucremin','45b4fd4c9abf07dfaec69008d8ab836fc13f6c59','b','2012-05-26 00:00:00','в сети',1,'a','a',60),(24,'irice','7939cf71397e36ae2781a349d393c4f34220e012','m','2012-04-07 00:00:00','невидимый',1,'c','a',43),(25,'kaela67','c8b38ac38c36c88df3cdcbba63ffb754500a7f6b','q','1980-11-04 00:00:00','в сети',0,'c','c',2),(26,'yasmin07','763fbf6450eafdaa98f131ec9fe76b24a3e8bab1','t','1979-04-05 00:00:00','Не беспокоить',0,'c','b',86),(27,'demond57','412415cc0992d01c928fd7b137b1f71cb6e7370b','k','2004-03-03 00:00:00','в сети',0,'b','c',36),(28,'catherine.feeney','c126a7b4f2b9c25c7b86a84f07d36f12028144fb','j','2006-09-19 00:00:00','Не беспокоить',1,'b','b',87),(29,'elisa.jenkins','88d5e956f52e8a23998777b9b81ec4edd221d1a0','p','1987-06-03 00:00:00','Не беспокоить',1,'c','b',91),(30,'brandyn.bogisich','bb3cd7f3d2a9edb0e58525df516916cf60a17a5b','a','1990-07-12 00:00:00','в сети',0,'b','c',23),(31,'alden75','96c9247ba0f4d9089298705727f7bebdd69d355c','d','1990-12-16 00:00:00','Не беспокоить',0,'c','b',15),(32,'orval.flatley','4f23cd80eb67c30d03518552f637abe6c2ba72c4','w','2012-07-16 00:00:00','Не беспокоить',0,'c','b',6),(33,'don77','7aa9ac21f19d3a42e5e985d9c0b47c094409256f','s','1997-02-17 00:00:00','невидимый',0,'c','c',100),(34,'elza03','ab6dfc3e9ceea0d32a8f87608657c0afb7177e4d','d','1972-06-06 00:00:00','Не беспокоить',0,'b','b',32),(35,'herzog.camryn','79c389dc366a1c4f3f21898226fdda41d4b60be5','n','1997-01-26 00:00:00','в сети',0,'a','b',10),(36,'lind.eusebio','9d4dace25b059af831121f65bd9de7aac79cef1b','u','2000-04-10 00:00:00','Не беспокоить',0,'b','b',87),(37,'mclaughlin.lauretta','56973d83076fd748da33c88af815802def44ac3b','a','1985-06-25 00:00:00','Не беспокоить',0,'a','a',100),(38,'abbigail.huel','4cef87ce12bd9f0319a16658468fa48513fca6c2','y','1994-04-02 00:00:00','в сети',1,'b','a',6),(39,'lehner.sheldon','e6e9ba0c1384a505f8a119d49b5ae13da5d1e67f','j','1981-12-06 00:00:00','Не беспокоить',1,'c','b',59),(40,'cummerata.alexa','3462908f0f6b3c951fe08d87c8eb5594f3b57e6e','q','2016-04-02 00:00:00','Не беспокоить',0,'b','a',22),(41,'santina44','02dcc1acf65bb27978567d642a68d871742007e8','s','1979-02-18 00:00:00','невидимый',1,'b','a',85),(42,'jovan.muller','58c208c05feb71311c127613e15ddc1e6fb01b4b','u','1971-02-09 00:00:00','Не беспокоить',1,'a','a',17),(43,'linnea02','98337e49fe7b272ae923ecdef25ffb587aff3cc4','b','1974-06-19 00:00:00','Не беспокоить',1,'c','b',74),(44,'cwilkinson','25c53722e977f4b2ada7bd2c2e7b6e24ac50eb5d','c','1977-08-18 00:00:00','в сети',1,'b','a',61),(45,'byundt','015ea4da3281ab258cbfd8f0c382c2bf7d87c8cf','j','1972-05-04 00:00:00','Не беспокоить',0,'b','a',21),(46,'qschinner','15edc0f0b2acf928d5244483c0223279db0fb731','x','1999-03-27 00:00:00','невидимый',0,'a','a',15),(47,'tromp.cara','67514f6bac6eeddd62c99668b6ea4f0a548a3961','f','2001-11-14 00:00:00','в сети',0,'b','c',63),(48,'rutherford.paul','f28bf8aeb6044b75ef76791ee4626625eae3515d','w','1997-06-16 00:00:00','в сети',0,'a','b',55),(49,'chris22','2ef468ad09ae8e1605b2d35d944f0cfbd053a739','y','1983-07-27 00:00:00','Не беспокоить',1,'a','a',51),(50,'xbode','3d735c2681174b22f0d6173e0950859bdc7e8f61','u','2007-02-03 00:00:00','в сети',1,'c','b',18),(51,'lrodriguez','30c8612e6971fbbbc0d7e9f29dcbf3a8588fd1e7','d','1977-03-30 00:00:00','в сети',0,'c','b',2),(52,'amelie.flatley','89f64da5c151645299c3945b2cc1836df8cd007b','z','2012-09-28 00:00:00','в сети',0,'b','c',52),(53,'loraine.dach','a870d3ba151f77b1eb15675d7dffa49aebe5218d','b','1990-10-23 00:00:00','Не беспокоить',0,'b','c',12),(54,'jhuels','0005680b5ad13e6a849893b8b11cef2182994e04','g','2016-11-01 00:00:00','Не беспокоить',1,'c','b',60),(55,'herman54','b50e3c74e90b7f6dd233d985b10cf7980f8f9e9f','d','1971-12-03 00:00:00','Не беспокоить',1,'b','a',41),(56,'antonette01','a686bd8f826cf4992bf88fa72e6182c72a9cfbeb','t','1978-12-22 00:00:00','в сети',0,'b','a',73),(57,'dickens.celine','aaad8b2e77b0bda23e219d8c801ea5824aaf4003','e','1977-12-22 00:00:00','Не беспокоить',1,'c','a',100),(58,'ysimonis','5ac3027e3ca41ed8af3552e6d81043d7c637c5b9','v','1982-06-07 00:00:00','невидимый',1,'a','b',60),(59,'schulist.marion','1cfab1ea78b7cbf2be0f2af89751f92c16e200a6','h','1985-08-08 00:00:00','Не беспокоить',1,'c','b',75),(60,'tito08','de9c73898bb3b46f29e133c6ce509178fdc53e8f','j','1989-06-30 00:00:00','в сети',0,'b','c',93),(61,'donna.krajcik','7c2f37ead2485d54809cb6e0e8f3c6f47e1a4e22','p','1991-03-17 00:00:00','Не беспокоить',1,'a','b',79),(62,'zkuphal','7ceec8f122cd7cf848d76a3bd67d0ea306c18293','c','1989-01-18 00:00:00','невидимый',1,'c','a',22),(63,'schuppe.catalina','16741097964541c3551adb5b89ae49f0437cbb54','p','1972-03-27 00:00:00','в сети',0,'c','b',88),(64,'lehner.dalton','d80be3b8e0d0691d26381a0b77f7602294803eec','l','1978-04-23 00:00:00','в сети',1,'c','c',84),(65,'kling.golden','90872451e717b77f205e3fd843055076344d9bf3','q','2011-07-29 00:00:00','в сети',0,'a','c',90),(66,'slebsack','31ed320fa3e90dd7a7e727dded08ad50a55e4f6b','p','1973-06-24 00:00:00','невидимый',0,'c','a',30),(67,'acrooks','90faf0fb9291cdd2400acb9b3e2a5a804074a2e6','y','2010-05-22 00:00:00','в сети',1,'c','a',80),(68,'sonny37','c97a7e6f056ab2c3bea6a3b09498921e3e16a477','g','1994-03-14 00:00:00','в сети',0,'b','a',41),(69,'abernathy.lawrence','52a1770e28300cf7bb9ea1cb277d453750978891','r','2011-12-22 00:00:00','Не беспокоить',0,'b','b',17),(70,'eddie.daugherty','e53afe64c222ad8e41756955ae028da7617c6f45','w','2013-05-09 00:00:00','в сети',1,'b','c',79),(71,'dnikolaus','aea1649836db8636564ce076e230361068572fd4','g','2008-07-27 00:00:00','Не беспокоить',1,'a','b',77),(72,'justyn.hamill','b7182e6c2cea26ccf6e4b212512615e478305a02','j','1979-10-26 00:00:00','невидимый',1,'a','a',38),(73,'grayson.schinner','19fb4955c34a9dc20825ff8c0893636047cd0097','j','2000-01-28 00:00:00','невидимый',0,'a','b',42),(74,'madisyn88','ddc8099c002bd825e3adf6ff2773eaaa99581a61','z','1977-08-09 00:00:00','в сети',0,'c','c',17),(75,'rory.hickle','0474d5e549e95aafc96511ba3ec052b81e1f6208','u','2009-11-21 00:00:00','Не беспокоить',1,'b','c',10),(76,'mann.amos','5edabcaa17fde5c4ece0d0be5c2a39fe1ba80c53','p','2000-02-18 00:00:00','невидимый',0,'b','a',97),(77,'leo.kemmer','319da7251e24722cd30e7745683b5fb94a21d7eb','m','1978-04-13 00:00:00','Не беспокоить',0,'a','a',93),(78,'wehner.edgar','b15378724fe41001af5e9c230575b7eee8b44ed0','o','1995-03-31 00:00:00','невидимый',1,'a','c',45),(79,'hosea49','f78f1dcc3bff10a73472e95628bafa42f5cdff2c','p','1993-11-05 00:00:00','в сети',0,'c','c',96),(80,'ortiz.taya','8c9347180e1ba4527586b88bedbee9d8ce6e4a56','l','2019-05-19 00:00:00','в сети',1,'b','c',71),(81,'boehm.ted','c3e5031f8f83e90d67b968d23122f0219e074b49','z','1998-02-28 00:00:00','в сети',1,'b','c',14),(82,'amina.weissnat','05b9d3f6d524578538654e8f340313df9f9de95a','h','2020-06-06 00:00:00','Не беспокоить',0,'a','a',69),(83,'mcclure.eleazar','b20662586752951fb94fcd2a8248da80c0ef20bf','z','1992-09-15 00:00:00','невидимый',0,'c','a',6),(84,'shields.samir','a8a8da23338a5dd520d1d9123fe8e8a7a8874e64','r','1987-10-26 00:00:00','Не беспокоить',1,'b','a',65),(85,'megane.upton','c72caf083b128eac1e0bc0eb5ff6202141d0486d','f','1975-04-04 00:00:00','в сети',1,'b','c',89),(86,'zpollich','1ac9d025f41c5bc8a27bfcb19fc0f236c478b039','d','1980-02-15 00:00:00','Не беспокоить',0,'a','c',33),(87,'alejandra.ratke','ea44de1ee09938dd44e5df8140e4e6230a590930','j','2003-07-01 00:00:00','в сети',1,'c','b',53),(88,'elnora.beier','ce16324aa833defe81da258c33a10d87e9feb8e6','j','1985-02-25 00:00:00','невидимый',1,'b','b',92),(89,'xbosco','d8396e5e7f98f70d21f8807209c06e782ad9bb2a','d','2017-05-05 00:00:00','в сети',1,'a','c',93),(90,'marcel71','b3c7f44f2e8c4f8eaa556f53c49b473bad78fb06','d','2020-09-02 00:00:00','невидимый',0,'b','c',75),(91,'nina02','a0abff29e5a31836d19409f5f8a68ca20f2dffa4','p','2003-10-17 00:00:00','Не беспокоить',1,'b','c',27),(92,'oren.stehr','4f3b70aae07464a540aca1c87bb02f005534df7a','x','1990-01-13 00:00:00','невидимый',1,'c','c',99),(93,'zboncak.rudolph','41bb4366615100bf971d0bd369b1467abf384011','p','2017-11-15 00:00:00','невидимый',0,'b','c',100),(94,'hank35','c83b2778e7d7bf679841f1bbb2bf6851e00acc8d','i','1984-07-10 00:00:00','Не беспокоить',1,'b','b',43),(95,'qwunsch','967d063717d7d572db198d1e80a4a7bd864e7b65','p','2019-12-09 00:00:00','Не беспокоить',0,'a','a',34),(96,'kihn.katlyn','bd4e35c16a8e15005521075af96ba5080a3d4fd5','a','1996-12-27 00:00:00','в сети',1,'b','a',15),(97,'jacinthe.harber','72160b39f434097d8b0d986577ab866de57f00b7','x','2014-04-10 00:00:00','в сети',1,'c','b',19),(98,'ervin.nolan','bb15bed1ce5a949bf72e163f020b0414f9fe177d','x','1978-06-02 00:00:00','невидимый',0,'c','b',58),(99,'arnulfo44','bff2837165431eb2a31688715c9be7e236f4c619','x','1991-04-06 00:00:00','Не беспокоить',0,'a','c',52),(100,'tortiz','2fef5eae35c80a2da518b1dc23fdfbd2624739d9','m','2007-04-11 00:00:00','невидимый',0,'b','b',56);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_limitation`
--

DROP TABLE IF EXISTS `user_limitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_limitation` (
  `type_id` int(11) NOT NULL,
  `spectator_id` int(11) DEFAULT NULL,
  `date_from` timestamp NULL DEFAULT NULL,
  `date_to` timestamp NULL DEFAULT NULL,
  KEY `spectator_id_idx` (`spectator_id`),
  KEY `type_id_idx` (`type_id`),
  CONSTRAINT `spectator_id` FOREIGN KEY (`spectator_id`) REFERENCES `spectator` (`id`),
  CONSTRAINT `type_id` FOREIGN KEY (`type_id`) REFERENCES `type_of_limitation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_limitation`
--

LOCK TABLES `user_limitation` WRITE;
/*!40000 ALTER TABLE `user_limitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_limitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_video_clip1_idx` (`video_id`),
  KEY `fk_video_channel1_idx` (`channel_id`),
  CONSTRAINT `fk_video_broadcast_recording1` FOREIGN KEY (`video_id`) REFERENCES `broadcast_recording` (`id`),
  CONSTRAINT `fk_video_channel1` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`id`),
  CONSTRAINT `fk_video_clip1` FOREIGN KEY (`video_id`) REFERENCES `clip` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voting`
--

DROP TABLE IF EXISTS `voting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `winning_option_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` enum('open','completed') NOT NULL,
  `channel_chat_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_voting_channel_chat1_idx` (`channel_chat_id`),
  CONSTRAINT `fk_voting_channel_chat1` FOREIGN KEY (`channel_chat_id`) REFERENCES `channel_chat` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voting`
--

LOCK TABLES `voting` WRITE;
/*!40000 ALTER TABLE `voting` DISABLE KEYS */;
/*!40000 ALTER TABLE `voting` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-19  0:55:45
