CREATE DATABASE  IF NOT EXISTS `noleggio_bici` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `noleggio_bici`;
-- MySQL dump 10.16  Distrib 10.1.37-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: noleggio_bici
-- ------------------------------------------------------
-- Server version	10.1.37-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_biciclette`
--

DROP TABLE IF EXISTS `t_biciclette`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_biciclette` (
  `id_bicicletta` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(45) NOT NULL,
  `modello` varchar(45) NOT NULL,
  `id_tipobici` int(11) NOT NULL,
  `data_acquisto` date NOT NULL,
  `prezzo_acquisto` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id_bicicletta`),
  KEY `idxtipo` (`id_tipobici`),
  CONSTRAINT `fk_t_biciclette_1` FOREIGN KEY (`id_tipobici`) REFERENCES `t_tipobici` (`id_tipobici`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_clienti`
--

DROP TABLE IF EXISTS `t_clienti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_clienti` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  `doc_ident` varchar(45) NOT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_noleggi`
--

DROP TABLE IF EXISTS `t_noleggi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_noleggi` (
  `id_noleggio` int(11) NOT NULL AUTO_INCREMENT,
  `id_bicicletta` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `data_inizio` datetime NOT NULL,
  `data_fine` datetime NOT NULL,
  `cauzione` decimal(5,2) DEFAULT NULL,
  `costo_pattuito` decimal(5,2) DEFAULT NULL,
  `data_restituzione` datetime DEFAULT NULL,
  `costo_pagato` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_noleggio`),
  KEY `idxbike` (`id_bicicletta`),
  KEY `idxclienti` (`id_cliente`),
  CONSTRAINT `fk_t_noleggi_bike` FOREIGN KEY (`id_bicicletta`) REFERENCES `t_biciclette` (`id_bicicletta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_noleggi_cli` FOREIGN KEY (`id_cliente`) REFERENCES `t_clienti` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_tariffe`
--

DROP TABLE IF EXISTS `t_tariffe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_tariffe` (
  `id_tariffa` int(11) NOT NULL AUTO_INCREMENT,
  `nome_tariffa` varchar(45) NOT NULL,
  `costo_tariffa` decimal(5,2) NOT NULL,
  `id_tipobici` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_tariffa`),
  UNIQUE KEY `nome_tariffa_UNIQUE` (`nome_tariffa`),
  KEY `fk_t_tariffe_1_idx` (`id_tipobici`),
  CONSTRAINT `fk_t_tariffe_1` FOREIGN KEY (`id_tipobici`) REFERENCES `t_tipobici` (`id_tipobici`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_tipobici`
--

DROP TABLE IF EXISTS `t_tipobici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_tipobici` (
  `id_tipobici` int(11) NOT NULL AUTO_INCREMENT,
  `denominazione` varchar(45) NOT NULL,
  `descrizione` varchar(200) DEFAULT NULL,
  `costo_day` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id_tipobici`),
  UNIQUE KEY `denominazione_UNIQUE` (`denominazione`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `v_esempio_like`
--

DROP TABLE IF EXISTS `v_esempio_like`;
/*!50001 DROP VIEW IF EXISTS `v_esempio_like`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_esempio_like` (
  `id_bicicletta` tinyint NOT NULL,
  `marca` tinyint NOT NULL,
  `modello` tinyint NOT NULL,
  `id_tipobici` tinyint NOT NULL,
  `data_acquisto` tinyint NOT NULL,
  `prezzo_acquisto` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_noleggi_base`
--

DROP TABLE IF EXISTS `v_noleggi_base`;
/*!50001 DROP VIEW IF EXISTS `v_noleggi_base`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_noleggi_base` (
  `cognome` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `data_inizio` tinyint NOT NULL,
  `data_fine` tinyint NOT NULL,
  `marca` tinyint NOT NULL,
  `modello` tinyint NOT NULL,
  `denominazione` tinyint NOT NULL,
  `costo_day` tinyint NOT NULL,
  `giorni` tinyint NOT NULL,
  `id_tipobici` tinyint NOT NULL,
  `id_bicicletta` tinyint NOT NULL,
  `id_cliente` tinyint NOT NULL,
  `id_noleggio` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_noleggio`
--

DROP TABLE IF EXISTS `v_noleggio`;
/*!50001 DROP VIEW IF EXISTS `v_noleggio`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_noleggio` (
  `nome` tinyint NOT NULL,
  `cognome` tinyint NOT NULL,
  `data_inizio` tinyint NOT NULL,
  `data_fine` tinyint NOT NULL,
  `marca` tinyint NOT NULL,
  `modello` tinyint NOT NULL,
  `denominazione` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_not_in_example`
--

DROP TABLE IF EXISTS `v_not_in_example`;
/*!50001 DROP VIEW IF EXISTS `v_not_in_example`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_not_in_example` (
  `id_bicicletta` tinyint NOT NULL,
  `marca` tinyint NOT NULL,
  `modello` tinyint NOT NULL,
  `id_tipobici` tinyint NOT NULL,
  `data_acquisto` tinyint NOT NULL,
  `prezzo_acquisto` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_tutto`
--

DROP TABLE IF EXISTS `v_tutto`;
/*!50001 DROP VIEW IF EXISTS `v_tutto`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_tutto` (
  `cognome` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `data_inizio` tinyint NOT NULL,
  `data_fine` tinyint NOT NULL,
  `marca` tinyint NOT NULL,
  `modello` tinyint NOT NULL,
  `denominazione` tinyint NOT NULL,
  `costo_day` tinyint NOT NULL,
  `giorni` tinyint NOT NULL,
  `id_tipobici` tinyint NOT NULL,
  `id_bicicletta` tinyint NOT NULL,
  `id_cliente` tinyint NOT NULL,
  `id_noleggio` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'noleggio_bici'
--

--
-- Dumping routines for database 'noleggio_bici'
--

--
-- Final view structure for view `v_esempio_like`
--

/*!50001 DROP TABLE IF EXISTS `v_esempio_like`*/;
/*!50001 DROP VIEW IF EXISTS `v_esempio_like`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_esempio_like` AS select `t_biciclette`.`id_bicicletta` AS `id_bicicletta`,`t_biciclette`.`marca` AS `marca`,`t_biciclette`.`modello` AS `modello`,`t_biciclette`.`id_tipobici` AS `id_tipobici`,`t_biciclette`.`data_acquisto` AS `data_acquisto`,`t_biciclette`.`prezzo_acquisto` AS `prezzo_acquisto` from `t_biciclette` where (`t_biciclette`.`modello` like '%Rubino%') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_noleggi_base`
--

/*!50001 DROP TABLE IF EXISTS `v_noleggi_base`*/;
/*!50001 DROP VIEW IF EXISTS `v_noleggi_base`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_noleggi_base` AS select `t_clienti`.`cognome` AS `cognome`,`t_clienti`.`nome` AS `nome`,`t_noleggi`.`data_inizio` AS `data_inizio`,`t_noleggi`.`data_fine` AS `data_fine`,`t_biciclette`.`marca` AS `marca`,`t_biciclette`.`modello` AS `modello`,`t_tipobici`.`denominazione` AS `denominazione`,`t_tipobici`.`costo_day` AS `costo_day`,((to_days(`t_noleggi`.`data_fine`) - to_days(`t_noleggi`.`data_inizio`)) + 1) AS `giorni`,`t_tipobici`.`id_tipobici` AS `id_tipobici`,`t_biciclette`.`id_bicicletta` AS `id_bicicletta`,`t_noleggi`.`id_cliente` AS `id_cliente`,`t_noleggi`.`id_noleggio` AS `id_noleggio` from (((`t_clienti` join `t_noleggi` on((`t_clienti`.`id_cliente` = `t_noleggi`.`id_cliente`))) join `t_biciclette` on((`t_noleggi`.`id_bicicletta` = `t_biciclette`.`id_bicicletta`))) join `t_tipobici` on((`t_biciclette`.`id_tipobici` = `t_tipobici`.`id_tipobici`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_noleggio`
--

/*!50001 DROP TABLE IF EXISTS `v_noleggio`*/;
/*!50001 DROP VIEW IF EXISTS `v_noleggio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_noleggio` AS select `t_clienti`.`nome` AS `nome`,`t_clienti`.`cognome` AS `cognome`,`t_noleggi`.`data_inizio` AS `data_inizio`,`t_noleggi`.`data_fine` AS `data_fine`,`t_biciclette`.`marca` AS `marca`,`t_biciclette`.`modello` AS `modello`,`t_tipobici`.`denominazione` AS `denominazione` from (((`t_clienti` join `t_noleggi` on((`t_noleggi`.`id_cliente` = `t_clienti`.`id_cliente`))) join `t_biciclette` on((`t_biciclette`.`id_bicicletta` = `t_noleggi`.`id_bicicletta`))) join `t_tipobici` on((`t_tipobici`.`id_tipobici` = `t_biciclette`.`id_tipobici`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_not_in_example`
--

/*!50001 DROP TABLE IF EXISTS `v_not_in_example`*/;
/*!50001 DROP VIEW IF EXISTS `v_not_in_example`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_not_in_example` AS select `t_biciclette`.`id_bicicletta` AS `id_bicicletta`,`t_biciclette`.`marca` AS `marca`,`t_biciclette`.`modello` AS `modello`,`t_biciclette`.`id_tipobici` AS `id_tipobici`,`t_biciclette`.`data_acquisto` AS `data_acquisto`,`t_biciclette`.`prezzo_acquisto` AS `prezzo_acquisto` from `t_biciclette` where (`t_biciclette`.`id_bicicletta` not in (1,2,3,4,5,6)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_tutto`
--

/*!50001 DROP TABLE IF EXISTS `v_tutto`*/;
/*!50001 DROP VIEW IF EXISTS `v_tutto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_tutto` AS select `t_clienti`.`cognome` AS `cognome`,`t_clienti`.`nome` AS `nome`,`t_noleggi`.`data_inizio` AS `data_inizio`,`t_noleggi`.`data_fine` AS `data_fine`,`t_biciclette`.`marca` AS `marca`,`t_biciclette`.`modello` AS `modello`,`t_tipobici`.`denominazione` AS `denominazione`,`t_tipobici`.`costo_day` AS `costo_day`,(to_days(`t_noleggi`.`data_fine`) - to_days(`t_noleggi`.`data_inizio`)) AS `giorni`,`t_tipobici`.`id_tipobici` AS `id_tipobici`,`t_biciclette`.`id_bicicletta` AS `id_bicicletta`,`t_noleggi`.`id_cliente` AS `id_cliente`,`t_noleggi`.`id_noleggio` AS `id_noleggio` from (((`t_clienti` join `t_noleggi` on((`t_clienti`.`id_cliente` = `t_noleggi`.`id_cliente`))) join `t_biciclette` on((`t_noleggi`.`id_bicicletta` = `t_biciclette`.`id_bicicletta`))) join `t_tipobici` on((`t_biciclette`.`id_tipobici` = `t_tipobici`.`id_tipobici`))) */;
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

-- Dump completed on 2019-02-19 17:02:20
