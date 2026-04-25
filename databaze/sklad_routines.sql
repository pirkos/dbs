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

-- Dump completed on 2026-04-25 11:41:24
