-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: sklad
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `prijemka`
--

DROP TABLE IF EXISTS `prijemka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prijemka` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datum_prijmu` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `partner_id` int NOT NULL,
  `zamestnanec_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `partner_id` (`partner_id`),
  KEY `zamestnanec_id` (`zamestnanec_id`),
  CONSTRAINT `prijemka_ibfk_1` FOREIGN KEY (`partner_id`) REFERENCES `obchodni_partner` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `prijemka_ibfk_2` FOREIGN KEY (`zamestnanec_id`) REFERENCES `zamestnanec` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prijemka`
--

LOCK TABLES `prijemka` WRITE;
/*!40000 ALTER TABLE `prijemka` DISABLE KEYS */;
INSERT INTO `prijemka` VALUES (1,'2026-03-23 17:00:24',1,2),(2,'2026-03-23 17:00:26',1,2),(3,'2026-03-23 17:00:35',1,2),(4,'2026-03-23 17:00:36',1,2),(5,'2026-03-23 17:00:59',1,2),(6,'2026-03-26 13:14:38',1,2),(7,'2026-04-16 11:50:07',1,24),(8,'2026-04-16 12:44:41',1,2),(9,'2026-04-16 13:28:58',1,24),(10,'2026-04-24 13:29:07',1,43),(11,'2026-04-25 10:44:27',1,1),(12,'2026-04-25 10:44:40',1,1);
/*!40000 ALTER TABLE `prijemka` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-25 11:41:23
