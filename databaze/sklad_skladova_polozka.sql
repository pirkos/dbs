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
-- Table structure for table `skladova_polozka`
--

DROP TABLE IF EXISTS `skladova_polozka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skladova_polozka` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nazev` varchar(150) NOT NULL,
  `popis` text,
  `aktualni_mnozstvi` decimal(10,2) DEFAULT '0.00',
  `kategorie_id` int NOT NULL,
  `umisteni_id` int NOT NULL,
  `obrazek` varchar(255) DEFAULT 'vychozi.png',
  `specifikace` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kategorie_id` (`kategorie_id`),
  KEY `umisteni_id` (`umisteni_id`),
  KEY `idx_nazev_zbozi` (`nazev`),
  CONSTRAINT `skladova_polozka_ibfk_1` FOREIGN KEY (`kategorie_id`) REFERENCES `kategorie` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `skladova_polozka_ibfk_2` FOREIGN KEY (`umisteni_id`) REFERENCES `umisteni` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `chk_mnozstvi_kladne` CHECK ((`aktualni_mnozstvi` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skladova_polozka`
--

LOCK TABLES `skladova_polozka` WRITE;
/*!40000 ALTER TABLE `skladova_polozka` DISABLE KEYS */;
INSERT INTO `skladova_polozka` VALUES (1,'Chirurgické roušky','Balení po 50 ks',150.00,1,1,'rouska.png','{\"barva\": \"modrá\", \"vrstvy\": 3, \"sterilni\": true}'),(2,'Dezinfekce na ruce 5L','Kanystr 5 litrů',115.00,1,3,'dezinfekce.png','{\"objem_litry\": 5, \"obsah_alkoholu_procenta\": 70}'),(3,'Kancelářský papír A4','Krabice 5x500 listů',110.00,2,2,'papir.png','{\"bila\": true, \"format\": \"A4\", \"gramaz\": 80}'),(22,'Kancelářský papír A4','papír',100.00,2,1,'papir.png',NULL);
/*!40000 ALTER TABLE `skladova_polozka` ENABLE KEYS */;
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
