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
-- Table structure for table `umisteni`
--

DROP TABLE IF EXISTS `umisteni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `umisteni` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cislo_haly` varchar(20) NOT NULL,
  `cast_skladu` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `umisteni`
--

LOCK TABLES `umisteni` WRITE;
/*!40000 ALTER TABLE `umisteni` DISABLE KEYS */;
INSERT INTO `umisteni` VALUES (1,'Hala A','Přízemí - Regál 1'),(2,'Hala A','Patro - Regál 2'),(3,'Hala B','Chlazený úsek'),(4,'Hala A','Přízemí - Regál 1'),(5,'Hala A','Patro - Regál 2'),(6,'Hala B','Chlazený úsek'),(7,'Hala A','Přízemí - Regál 1'),(8,'Hala A','Patro - Regál 2'),(9,'Hala B','Chlazený úsek'),(10,'Hala A','Přízemí - Regál 1'),(11,'Hala A','Patro - Regál 2'),(12,'Hala B','Chlazený úsek'),(13,'Hala A','Přízemí - Regál 1'),(14,'Hala A','Patro - Regál 2'),(15,'Hala B','Chlazený úsek'),(16,'Hala A','Přízemí - Regál 1'),(17,'Hala A','Patro - Regál 2'),(18,'Hala B','Chlazený úsek'),(19,'Hala A','Přízemí - Regál 1'),(20,'Hala A','Patro - Regál 2'),(21,'Hala B','Chlazený úsek');
/*!40000 ALTER TABLE `umisteni` ENABLE KEYS */;
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
