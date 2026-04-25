CREATE DATABASE  IF NOT EXISTS `sklad` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sklad`;
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
-- Table structure for table `dodavatel`
--

DROP TABLE IF EXISTS `dodavatel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dodavatel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nazev_firmy` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dodavatel`
--

LOCK TABLES `dodavatel` WRITE;
/*!40000 ALTER TABLE `dodavatel` DISABLE KEYS */;
INSERT INTO `dodavatel` VALUES (1,'Medika s.r.o.');
/*!40000 ALTER TABLE `dodavatel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dodavatel_zbozi`
--

DROP TABLE IF EXISTS `dodavatel_zbozi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dodavatel_zbozi` (
  `dodavatel_id` int NOT NULL,
  `polozka_id` int NOT NULL,
  `cena_od_dodavatele` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`dodavatel_id`,`polozka_id`),
  KEY `polozka_id` (`polozka_id`),
  CONSTRAINT `dodavatel_zbozi_ibfk_1` FOREIGN KEY (`dodavatel_id`) REFERENCES `dodavatel` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dodavatel_zbozi_ibfk_2` FOREIGN KEY (`polozka_id`) REFERENCES `skladova_polozka` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dodavatel_zbozi`
--

LOCK TABLES `dodavatel_zbozi` WRITE;
/*!40000 ALTER TABLE `dodavatel_zbozi` DISABLE KEYS */;
INSERT INTO `dodavatel_zbozi` VALUES (1,1,2.50);
/*!40000 ALTER TABLE `dodavatel_zbozi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategorie`
--

DROP TABLE IF EXISTS `kategorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategorie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nazev` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nazev` (`nazev`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategorie`
--

LOCK TABLES `kategorie` WRITE;
/*!40000 ALTER TABLE `kategorie` DISABLE KEYS */;
INSERT INTO `kategorie` VALUES (3,'Nářadí'),(2,'Spotřební zboží'),(1,'Zdravotnický materiál');
/*!40000 ALTER TABLE `kategorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obchodni_partner`
--

DROP TABLE IF EXISTS `obchodni_partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obchodni_partner` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nazev` varchar(100) NOT NULL,
  `typ` enum('Dodavatel','Odběratel') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obchodni_partner`
--

LOCK TABLES `obchodni_partner` WRITE;
/*!40000 ALTER TABLE `obchodni_partner` DISABLE KEYS */;
INSERT INTO `obchodni_partner` VALUES (1,'Medika s.r.o.','Dodavatel'),(2,'Lékárna U Zlatého lva','Odběratel'),(3,'Papírnictví Koh-i-noor','Dodavatel'),(4,'Nemocnice Na Homolce','Odběratel');
/*!40000 ALTER TABLE `obchodni_partner` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polozka_prijmu`
--

LOCK TABLES `polozka_prijmu` WRITE;
/*!40000 ALTER TABLE `polozka_prijmu` DISABLE KEYS */;
INSERT INTO `polozka_prijmu` VALUES (1,1,1,50.00),(2,1,2,10.50),(3,1,1,50.00),(4,1,2,10.50),(5,1,1,50.00),(6,1,2,10.50),(7,1,1,50.00),(8,1,2,10.50),(9,1,1,50.00),(10,1,2,10.50),(11,1,1,50.00),(12,1,2,10.50),(13,7,3,150.00),(14,1,1,50.00),(15,1,2,10.50),(16,9,3,10.00),(17,10,22,100.00),(18,11,2,50.00),(19,12,2,50.00),(20,13,23,1000.00);
/*!40000 ALTER TABLE `polozka_prijmu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polozka_vydeje`
--

DROP TABLE IF EXISTS `polozka_vydeje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `polozka_vydeje` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vydejka_id` int NOT NULL,
  `polozka_id` int NOT NULL,
  `vydane_mnozstvi` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vydejka_id` (`vydejka_id`),
  KEY `polozka_id` (`polozka_id`),
  CONSTRAINT `polozka_vydeje_ibfk_1` FOREIGN KEY (`vydejka_id`) REFERENCES `vydejka` (`id`) ON DELETE CASCADE,
  CONSTRAINT `polozka_vydeje_ibfk_2` FOREIGN KEY (`polozka_id`) REFERENCES `skladova_polozka` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `chk_vydej_mnozstvi` CHECK ((`vydane_mnozstvi` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polozka_vydeje`
--

LOCK TABLES `polozka_vydeje` WRITE;
/*!40000 ALTER TABLE `polozka_vydeje` DISABLE KEYS */;
INSERT INTO `polozka_vydeje` VALUES (1,1,1,10.00),(2,1,3,2.00),(3,1,1,10.00),(4,1,3,2.00),(5,1,1,10.00),(6,1,3,2.00),(7,1,1,10.00),(8,1,3,2.00),(9,1,1,10.00),(10,1,3,2.00),(11,1,1,10.00),(12,1,3,2.00),(14,8,3,40.00),(15,9,3,10.00),(16,1,1,10.00),(17,1,3,2.00),(18,11,2,35.00),(19,12,1,55.00);
/*!40000 ALTER TABLE `polozka_vydeje` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prijemka`
--

LOCK TABLES `prijemka` WRITE;
/*!40000 ALTER TABLE `prijemka` DISABLE KEYS */;
INSERT INTO `prijemka` VALUES (1,'2026-03-23 17:00:24',1,2),(2,'2026-03-23 17:00:26',1,2),(3,'2026-03-23 17:00:35',1,2),(4,'2026-03-23 17:00:36',1,2),(5,'2026-03-23 17:00:59',1,2),(6,'2026-03-26 13:14:38',1,2),(7,'2026-04-16 11:50:07',1,24),(8,'2026-04-16 12:44:41',1,2),(9,'2026-04-16 13:28:58',1,24),(10,'2026-04-24 13:29:07',1,43),(11,'2026-04-25 10:44:27',1,1),(12,'2026-04-25 10:44:40',1,1),(13,'2026-04-25 11:45:04',1,1);
/*!40000 ALTER TABLE `prijemka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nazev` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nazev` (`nazev`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Administrátor'),(2,'Skladník'),(12,'Specialista příjmu'),(13,'Specialista výdeje');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skladova_polozka`
--

LOCK TABLES `skladova_polozka` WRITE;
/*!40000 ALTER TABLE `skladova_polozka` DISABLE KEYS */;
INSERT INTO `skladova_polozka` VALUES (1,'Chirurgické roušky','Balení po 50 ks',95.00,1,1,'rouska.png','{\"barva\": \"modrá\", \"vrstvy\": 3, \"sterilni\": true}'),(2,'Dezinfekce na ruce 5L','Kanystr 5 litrů',115.00,1,3,'dezinfekce.png','{\"objem_litry\": 5, \"obsah_alkoholu_procenta\": 70}'),(3,'Kancelářský papír A4','Krabice 5x500 listů',110.00,2,2,'papir.png','{\"bila\": true, \"format\": \"A4\", \"gramaz\": 80}'),(22,'Kancelářský papír A4','papír',100.00,2,1,'papir.png',NULL),(23,'skalpel','chir ocel 5 cepeli',1000.00,3,1,'vychozi.png',NULL);
/*!40000 ALTER TABLE `skladova_polozka` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_kontrola_zaporneho_skladu` BEFORE UPDATE ON `skladova_polozka` FOR EACH ROW BEGIN
    IF NEW.aktualni_mnozstvi < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Databázový štít: Množství na skladě nesmí klesnout pod nulu!';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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

--
-- Temporary view structure for view `v_dochazejici_zbozi`
--

DROP TABLE IF EXISTS `v_dochazejici_zbozi`;
/*!50001 DROP VIEW IF EXISTS `v_dochazejici_zbozi`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_dochazejici_zbozi` AS SELECT 
 1 AS `nazev`,
 1 AS `aktualni_mnozstvi`,
 1 AS `obrazek`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_prehled_skladu`
--

DROP TABLE IF EXISTS `v_prehled_skladu`;
/*!50001 DROP VIEW IF EXISTS `v_prehled_skladu`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_prehled_skladu` AS SELECT 
 1 AS `katalogove_cislo`,
 1 AS `nazev`,
 1 AS `kategorie`,
 1 AS `umisteni`,
 1 AS `mnozstvi`,
 1 AS `stav_text`,
 1 AS `popis`,
 1 AS `obrazek`,
 1 AS `skryte_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_prehled_zamestnancu`
--

DROP TABLE IF EXISTS `v_prehled_zamestnancu`;
/*!50001 DROP VIEW IF EXISTS `v_prehled_zamestnancu`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_prehled_zamestnancu` AS SELECT 
 1 AS `id`,
 1 AS `jmeno`,
 1 AS `prijmeni`,
 1 AS `login`,
 1 AS `role`*/;
SET character_set_client = @saved_cs_client;

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vydejka`
--

LOCK TABLES `vydejka` WRITE;
/*!40000 ALTER TABLE `vydejka` DISABLE KEYS */;
INSERT INTO `vydejka` VALUES (1,'2026-03-23 17:00:24',2,2),(2,'2026-03-23 17:00:26',2,2),(3,'2026-03-23 17:00:35',2,2),(4,'2026-03-23 17:00:36',2,2),(5,'2026-03-23 17:00:59',2,2),(6,'2026-03-26 13:14:38',2,2),(7,'2026-04-16 11:16:12',2,1),(8,'2026-04-16 11:18:13',2,1),(9,'2026-04-16 11:18:41',2,1),(10,'2026-04-16 12:44:41',2,2),(11,'2026-04-25 10:31:29',1,1),(12,'2026-04-25 16:18:49',2,25);
/*!40000 ALTER TABLE `vydejka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zamestnanec`
--

DROP TABLE IF EXISTS `zamestnanec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zamestnanec` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jmeno` varchar(50) NOT NULL,
  `prijmeni` varchar(50) NOT NULL,
  `login` varchar(50) NOT NULL,
  `heslo` varchar(255) NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `zamestnanec_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zamestnanec`
--

LOCK TABLES `zamestnanec` WRITE;
/*!40000 ALTER TABLE `zamestnanec` DISABLE KEYS */;
INSERT INTO `zamestnanec` VALUES (1,'Jan','Novák','admin','heslo123',1),(2,'Petr','Svoboda','skladnik1','sklad123',2),(24,'Karel','Příjemný','prijem','heslo123',12),(25,'Eva','Výdejná','vydej','heslo123',13),(43,'Pepa','Skladac','sklad','heslo123',2);
/*!40000 ALTER TABLE `zamestnanec` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_archivace_zamestnance` BEFORE DELETE ON `zamestnanec` FOR EACH ROW BEGIN
    INSERT INTO zamestnanec_archiv (id, jmeno, prijmeni, login)
    VALUES (OLD.id, OLD.jmeno, OLD.prijmeni, OLD.login);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `zamestnanec_archiv`
--

DROP TABLE IF EXISTS `zamestnanec_archiv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zamestnanec_archiv` (
  `id` int DEFAULT NULL,
  `jmeno` varchar(100) DEFAULT NULL,
  `prijmeni` varchar(100) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `smazano_kdy` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zamestnanec_archiv`
--

LOCK TABLES `zamestnanec_archiv` WRITE;
/*!40000 ALTER TABLE `zamestnanec_archiv` DISABLE KEYS */;
/*!40000 ALTER TABLE `zamestnanec_archiv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sklad'
--

--
-- Dumping routines for database 'sklad'
--
/*!50003 DROP FUNCTION IF EXISTS `f_celkem_v_kategorii` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_celkem_v_kategorii`(p_kat_id INT) RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
    DECLARE v_celkem DECIMAL(10,2);
    
    SELECT SUM(aktualni_mnozstvi) INTO v_celkem 
    FROM skladova_polozka 
    WHERE kategorie_id = p_kat_id;
    
    -- Kdyby byla kategorie prázdná, vrátíme 0 místo chyby "NULL"
    RETURN IFNULL(v_celkem, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_katalogove_cislo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_katalogove_cislo`(p_kat_id INT, p_polozka_id INT) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    -- Slepí text dohromady, výsledek bude např. "KAT-2-POL-15"
    RETURN CONCAT('KAT-', p_kat_id, '-POL-', p_polozka_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_stav_zasob_text` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_stav_zasob_text`(p_mnozstvi DECIMAL(10,2)) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    IF p_mnozstvi <= 0 THEN 
        RETURN '[X] Vyprodáno';
    ELSEIF p_mnozstvi < 20 THEN 
        RETURN '[!] Kritický stav';
    ELSEIF p_mnozstvi < 100 THEN 
        RETURN '[-] Nízký stav';
    ELSE 
        RETURN '[OK] Dostatek';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_prijem_zbozi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_prijem_zbozi`(
    IN p_polozka_id INT,
    IN p_mnozstvi DECIMAL(10,2),
    IN p_zamestnanec_id INT,
    IN p_partner_id INT  -- <--- ZDE JE TEN 4. ÚDAJ
)
BEGIN
    DECLARE v_prijemka_id INT;

    INSERT INTO prijemka (partner_id, zamestnanec_id) VALUES (p_partner_id, p_zamestnanec_id);
    SET v_prijemka_id = LAST_INSERT_ID();

    INSERT INTO polozka_prijmu (prijemka_id, polozka_id, prijate_mnozstvi) 
    VALUES (v_prijemka_id, p_polozka_id, p_mnozstvi);

    UPDATE skladova_polozka 
    SET aktualni_mnozstvi = aktualni_mnozstvi + p_mnozstvi 
    WHERE id = p_polozka_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_vydej_zbozi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_vydej_zbozi`(
    IN p_polozka_id INT,
    IN p_mnozstvi DECIMAL(10,2),
    IN p_zamestnanec_id INT,
    IN p_partner_id INT  -- <--- ZDE JE TEN 4. ÚDAJ
)
BEGIN
    DECLARE v_aktualni DECIMAL(10,2);
    DECLARE v_vydejka_id INT;

    SELECT aktualni_mnozstvi INTO v_aktualni FROM skladova_polozka WHERE id = p_polozka_id;

    IF v_aktualni < p_mnozstvi THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nedostatečné množství na skladě!';
    ELSE
        INSERT INTO vydejka (partner_id, zamestnanec_id) VALUES (p_partner_id, p_zamestnanec_id);
        SET v_vydejka_id = LAST_INSERT_ID();

        INSERT INTO polozka_vydeje (vydejka_id, polozka_id, vydane_mnozstvi) 
        VALUES (v_vydejka_id, p_polozka_id, p_mnozstvi);

        UPDATE skladova_polozka 
        SET aktualni_mnozstvi = aktualni_mnozstvi - p_mnozstvi 
        WHERE id = p_polozka_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `p_zalozeni_karty_zbozi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_zalozeni_karty_zbozi`(
    IN p_nazev VARCHAR(150),
    IN p_kat_id INT,
    IN p_um_id INT,
    IN p_mnozstvi DECIMAL(10,2),
    IN p_popis TEXT,
    IN p_obrazek_navrh VARCHAR(255),
    IN p_zamestnanec_id INT
)
BEGIN
    DECLARE v_obrazek_final VARCHAR(255);
    DECLARE v_polozka_id INT;
    DECLARE v_prijemka_id INT;

    -- Zjistíme, jestli zboží už známe a vezmeme jeho obrázek
    SELECT obrazek INTO v_obrazek_final 
    FROM skladova_polozka 
    WHERE nazev = p_nazev LIMIT 1;

    IF v_obrazek_final IS NULL THEN
        SET v_obrazek_final = IFNULL(p_obrazek_navrh, 'vychozi.png');
    END IF;

    -- Vložení do katalogu
    INSERT INTO skladova_polozka (nazev, kategorie_id, umisteni_id, aktualni_mnozstvi, popis, obrazek)
    VALUES (p_nazev, p_kat_id, p_um_id, p_mnozstvi, p_popis, v_obrazek_final);
    
    SET v_polozka_id = LAST_INSERT_ID();

    -- Automatické vytvoření logu o naskladnění (příjemka)
    INSERT INTO prijemka (partner_id, zamestnanec_id) VALUES (1, p_zamestnanec_id);
    SET v_prijemka_id = LAST_INSERT_ID();
    
    INSERT INTO polozka_prijmu (prijemka_id, polozka_id, prijate_mnozstvi) 
    VALUES (v_prijemka_id, v_polozka_id, p_mnozstvi);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_dochazejici_zbozi`
--

/*!50001 DROP VIEW IF EXISTS `v_dochazejici_zbozi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_dochazejici_zbozi` AS select `skladova_polozka`.`nazev` AS `nazev`,`skladova_polozka`.`aktualni_mnozstvi` AS `aktualni_mnozstvi`,`skladova_polozka`.`obrazek` AS `obrazek` from `skladova_polozka` where (`skladova_polozka`.`aktualni_mnozstvi` < 20) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_prehled_skladu`
--

/*!50001 DROP VIEW IF EXISTS `v_prehled_skladu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_prehled_skladu` AS select `f_katalogove_cislo`(`s`.`kategorie_id`,`s`.`id`) AS `katalogove_cislo`,`s`.`nazev` AS `nazev`,`k`.`nazev` AS `kategorie`,`u`.`cislo_haly` AS `umisteni`,`s`.`aktualni_mnozstvi` AS `mnozstvi`,`f_stav_zasob_text`(`s`.`aktualni_mnozstvi`) AS `stav_text`,`s`.`popis` AS `popis`,`s`.`obrazek` AS `obrazek`,`s`.`id` AS `skryte_id` from ((`skladova_polozka` `s` join `kategorie` `k` on((`s`.`kategorie_id` = `k`.`id`))) join `umisteni` `u` on((`s`.`umisteni_id` = `u`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_prehled_zamestnancu`
--

/*!50001 DROP VIEW IF EXISTS `v_prehled_zamestnancu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_prehled_zamestnancu` AS select `z`.`id` AS `id`,`z`.`jmeno` AS `jmeno`,`z`.`prijmeni` AS `prijmeni`,`z`.`login` AS `login`,`r`.`nazev` AS `role` from (`zamestnanec` `z` join `role` `r` on((`z`.`role_id` = `r`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-25 17:30:11
