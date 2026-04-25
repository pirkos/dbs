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
-- Table structure for table `vydejka`
--

DROP TABLE IF EXISTS `vydejka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vydejka` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datum_vydeje` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `partner_id` int NOT NULL,
  `zamestnanec_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `partner_id` (`partner_id`),
  KEY `zamestnanec_id` (`zamestnanec_id`),
  CONSTRAINT `vydejka_ibfk_1` FOREIGN KEY (`partner_id`) REFERENCES `obchodni_partner` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `vydejka_ibfk_2` FOREIGN KEY (`zamestnanec_id`) REFERENCES `zamestnanec` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vydejka`
--

LOCK TABLES `vydejka` WRITE;
/*!40000 ALTER TABLE `vydejka` DISABLE KEYS */;
INSERT INTO `vydejka` VALUES (1,'2026-03-23 17:00:24',2,2),(2,'2026-03-23 17:00:26',2,2),(3,'2026-03-23 17:00:35',2,2),(4,'2026-03-23 17:00:36',2,2),(5,'2026-03-23 17:00:59',2,2),(6,'2026-03-26 13:14:38',2,2),(7,'2026-04-16 11:16:12',2,1),(8,'2026-04-16 11:18:13',2,1),(9,'2026-04-16 11:18:41',2,1),(10,'2026-04-16 12:44:41',2,2),(11,'2026-04-25 10:31:29',1,1);
/*!40000 ALTER TABLE `vydejka` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-25 11:41:22
