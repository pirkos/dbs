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
-- Table structure for table `polozka_prijmu`
--

DROP TABLE IF EXISTS `polozka_prijmu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `polozka_prijmu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prijemka_id` int NOT NULL,
  `polozka_id` int NOT NULL,
  `prijate_mnozstvi` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prijemka_id` (`prijemka_id`),
  KEY `polozka_id` (`polozka_id`),
  CONSTRAINT `polozka_prijmu_ibfk_1` FOREIGN KEY (`prijemka_id`) REFERENCES `prijemka` (`id`) ON DELETE CASCADE,
  CONSTRAINT `polozka_prijmu_ibfk_2` FOREIGN KEY (`polozka_id`) REFERENCES `skladova_polozka` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `chk_prijem_mnozstvi` CHECK ((`prijate_mnozstvi` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polozka_prijmu`
--

LOCK TABLES `polozka_prijmu` WRITE;
/*!40000 ALTER TABLE `polozka_prijmu` DISABLE KEYS */;
INSERT INTO `polozka_prijmu` VALUES (1,1,1,50.00),(2,1,2,10.50),(3,1,1,50.00),(4,1,2,10.50),(5,1,1,50.00),(6,1,2,10.50),(7,1,1,50.00),(8,1,2,10.50),(9,1,1,50.00),(10,1,2,10.50),(11,1,1,50.00),(12,1,2,10.50),(13,7,3,150.00),(14,1,1,50.00),(15,1,2,10.50),(16,9,3,10.00),(17,10,22,100.00),(18,11,2,50.00),(19,12,2,50.00);
/*!40000 ALTER TABLE `polozka_prijmu` ENABLE KEYS */;
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
