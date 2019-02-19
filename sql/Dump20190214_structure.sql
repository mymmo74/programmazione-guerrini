CREATE DATABASE  IF NOT EXISTS `talent_music_new` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `talent_music_new`;
-- MySQL dump 10.16  Distrib 10.1.37-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: talent_music_new
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
-- Table structure for table `t_alunni`
--

DROP TABLE IF EXISTS `t_alunni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_alunni` (
  `id_alunno` int(11) NOT NULL AUTO_INCREMENT,
  `cognome` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `tel` varchar(45) NOT NULL,
  `indirizzo` varchar(100) DEFAULT NULL,
  `comune` varchar(45) DEFAULT NULL,
  `pv` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id_alunno`),
  KEY `idx_cog` (`cognome`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_aule`
--

DROP TABLE IF EXISTS `t_aule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_aule` (
  `id_aula` int(11) NOT NULL AUTO_INCREMENT,
  `nome_aula` varchar(45) NOT NULL,
  `descrizione` varchar(555) DEFAULT NULL,
  PRIMARY KEY (`id_aula`),
  UNIQUE KEY `idx_nomeaula` (`nome_aula`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_config`
--

DROP TABLE IF EXISTS `t_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_config` (
  `id_config` int(11) NOT NULL AUTO_INCREMENT,
  `nome_scuola` varchar(100) NOT NULL,
  `sconto_pro` int(11) NOT NULL,
  PRIMARY KEY (`id_config`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_corsi`
--

DROP TABLE IF EXISTS `t_corsi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_corsi` (
  `id_corso` int(11) NOT NULL AUTO_INCREMENT,
  `nomecorso` varchar(60) NOT NULL,
  `descrizione` varchar(255) DEFAULT NULL,
  `costo` decimal(6,2) DEFAULT NULL,
  `durata_h` smallint(6) DEFAULT NULL,
  `tipologia_corso` varchar(60) DEFAULT 'NN',
  `data_inizio` date DEFAULT NULL,
  `data_fine` date DEFAULT NULL,
  PRIMARY KEY (`id_corso`),
  UNIQUE KEY `nomecorso_UNIQUE` (`nomecorso`),
  KEY `idx_tipo` (`tipologia_corso`),
  CONSTRAINT `fk_t_corsi_1` FOREIGN KEY (`tipologia_corso`) REFERENCES `t_tipologia_corso` (`tipologia_corso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_docenti`
--

DROP TABLE IF EXISTS `t_docenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_docenti` (
  `id_docente` int(11) NOT NULL AUTO_INCREMENT,
  `cognome` varchar(50) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `note` blob,
  `id_tipo_contratto` int(11) NOT NULL DEFAULT '5',
  `costo_h` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_docente`),
  KEY `fk_t_docenti_1_idx` (`id_tipo_contratto`),
  CONSTRAINT `fk_t_docenti_1` FOREIGN KEY (`id_tipo_contratto`) REFERENCES `t_tipo_contratti` (`id_tipo_contratto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_docenti_corsi`
--

DROP TABLE IF EXISTS `t_docenti_corsi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_docenti_corsi` (
  `id_docente_corso` int(11) NOT NULL AUTO_INCREMENT,
  `id_docente` int(11) NOT NULL,
  `id_corso` int(11) NOT NULL,
  `costo_orario_pattuito` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_docente_corso`),
  KEY `idx_doc` (`id_docente`),
  KEY `idx_corsi` (`id_corso`),
  CONSTRAINT `fk_t_docenti_corsi_1` FOREIGN KEY (`id_docente`) REFERENCES `t_docenti` (`id_docente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_docenti_corsi_2` FOREIGN KEY (`id_corso`) REFERENCES `t_corsi` (`id_corso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_iscrizioni`
--

DROP TABLE IF EXISTS `t_iscrizioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_iscrizioni` (
  `id_iscrizione` int(11) NOT NULL AUTO_INCREMENT,
  `id_corso` int(11) NOT NULL,
  `id_alunno` int(11) NOT NULL,
  `data_iscrizione` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `costo_applicato` decimal(6,2) DEFAULT NULL,
  `pagato` decimal(6,2) DEFAULT '0.00',
  PRIMARY KEY (`id_iscrizione`),
  UNIQUE KEY `idxUQ_corsi_alunni` (`id_corso`,`id_alunno`),
  KEY `fk_t_iscrizioni_1_idx` (`id_alunno`),
  KEY `fk_t_iscrizioni_2_idx` (`id_corso`),
  CONSTRAINT `fk_t_iscrizioni_1` FOREIGN KEY (`id_alunno`) REFERENCES `t_alunni` (`id_alunno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_iscrizioni_2` FOREIGN KEY (`id_corso`) REFERENCES `t_corsi` (`id_corso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_tipo_contratti`
--

DROP TABLE IF EXISTS `t_tipo_contratti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_tipo_contratti` (
  `id_tipo_contratto` int(11) NOT NULL AUTO_INCREMENT,
  `denominazione` varchar(500) NOT NULL,
  `iva` tinyint(2) NOT NULL,
  `nome_contratto` varchar(60) NOT NULL,
  PRIMARY KEY (`id_tipo_contratto`),
  UNIQUE KEY `nome_contratto_UNIQUE` (`nome_contratto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_tipologia_corso`
--

DROP TABLE IF EXISTS `t_tipologia_corso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_tipologia_corso` (
  `tipologia_corso` varchar(60) NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`tipologia_corso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `v_alunni_corsi`
--

DROP TABLE IF EXISTS `v_alunni_corsi`;
/*!50001 DROP VIEW IF EXISTS `v_alunni_corsi`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_alunni_corsi` (
  `id_alunno` tinyint NOT NULL,
  `id_corso` tinyint NOT NULL,
  `nome corso` tinyint NOT NULL,
  `cognome` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `durata in ore` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_alunni_corsi_v2`
--

DROP TABLE IF EXISTS `v_alunni_corsi_v2`;
/*!50001 DROP VIEW IF EXISTS `v_alunni_corsi_v2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_alunni_corsi_v2` (
  `id_corso` tinyint NOT NULL,
  `id_alunno` tinyint NOT NULL,
  `cognome` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `nomecorso` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_docenti_corsi_econ`
--

DROP TABLE IF EXISTS `v_docenti_corsi_econ`;
/*!50001 DROP VIEW IF EXISTS `v_docenti_corsi_econ`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_docenti_corsi_econ` (
  `id_corso` tinyint NOT NULL,
  `id_docente` tinyint NOT NULL,
  `nomecorso` tinyint NOT NULL,
  `nominativo` tinyint NOT NULL,
  `cognome` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `costo_orario_pattuito` tinyint NOT NULL,
  `durata_h` tinyint NOT NULL,
  `costo_totale` tinyint NOT NULL,
  `sconto_pro` tinyint NOT NULL,
  `tot_pro` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_docenti_corsi_simple`
--

DROP TABLE IF EXISTS `v_docenti_corsi_simple`;
/*!50001 DROP VIEW IF EXISTS `v_docenti_corsi_simple`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_docenti_corsi_simple` (
  `nomecorso` tinyint NOT NULL,
  `cognome` tinyint NOT NULL,
  `nome` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_fatturato_docenti`
--

DROP TABLE IF EXISTS `v_fatturato_docenti`;
/*!50001 DROP VIEW IF EXISTS `v_fatturato_docenti`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_fatturato_docenti` (
  `sum(costo_totale)` tinyint NOT NULL,
  `totalone` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_situazione_generale`
--

DROP TABLE IF EXISTS `v_situazione_generale`;
/*!50001 DROP VIEW IF EXISTS `v_situazione_generale`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_situazione_generale` (
  `id_alunno` tinyint NOT NULL,
  `id_corso` tinyint NOT NULL,
  `nome corso` tinyint NOT NULL,
  `cognome` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `durata in ore` tinyint NOT NULL,
  `id_docente` tinyint NOT NULL,
  `cognome_docente` tinyint NOT NULL,
  `nome_docente` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'talent_music_new'
--

--
-- Dumping routines for database 'talent_music_new'
--

--
-- Final view structure for view `v_alunni_corsi`
--

/*!50001 DROP TABLE IF EXISTS `v_alunni_corsi`*/;
/*!50001 DROP VIEW IF EXISTS `v_alunni_corsi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_alunni_corsi` AS select `t_alunni`.`id_alunno` AS `id_alunno`,`t_corsi`.`id_corso` AS `id_corso`,`t_corsi`.`nomecorso` AS `nome corso`,`t_alunni`.`cognome` AS `cognome`,`t_alunni`.`nome` AS `nome`,`t_corsi`.`durata_h` AS `durata in ore` from ((`t_alunni` join `t_iscrizioni` on((`t_alunni`.`id_alunno` = `t_iscrizioni`.`id_alunno`))) join `t_corsi` on((`t_corsi`.`id_corso` = `t_iscrizioni`.`id_corso`))) order by `t_corsi`.`nomecorso`,`t_alunni`.`cognome`,`t_alunni`.`nome` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_alunni_corsi_v2`
--

/*!50001 DROP TABLE IF EXISTS `v_alunni_corsi_v2`*/;
/*!50001 DROP VIEW IF EXISTS `v_alunni_corsi_v2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_alunni_corsi_v2` AS select `t_corsi`.`id_corso` AS `id_corso`,`t_alunni`.`id_alunno` AS `id_alunno`,`t_alunni`.`cognome` AS `cognome`,`t_alunni`.`nome` AS `nome`,`t_corsi`.`nomecorso` AS `nomecorso` from ((`t_alunni` join `t_corsi`) join `t_iscrizioni`) where ((`t_alunni`.`id_alunno` = `t_iscrizioni`.`id_alunno`) and (`t_iscrizioni`.`id_corso` = `t_corsi`.`id_corso`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_docenti_corsi_econ`
--

/*!50001 DROP TABLE IF EXISTS `v_docenti_corsi_econ`*/;
/*!50001 DROP VIEW IF EXISTS `v_docenti_corsi_econ`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_docenti_corsi_econ` AS select `t_corsi`.`id_corso` AS `id_corso`,`t_docenti`.`id_docente` AS `id_docente`,`t_corsi`.`nomecorso` AS `nomecorso`,concat(ucase(`t_docenti`.`cognome`),' ',lcase(`t_docenti`.`nome`)) AS `nominativo`,`t_docenti`.`cognome` AS `cognome`,`t_docenti`.`nome` AS `nome`,`t_docenti_corsi`.`costo_orario_pattuito` AS `costo_orario_pattuito`,`t_corsi`.`durata_h` AS `durata_h`,(`t_docenti_corsi`.`costo_orario_pattuito` * `t_corsi`.`durata_h`) AS `costo_totale`,`t_config`.`sconto_pro` AS `sconto_pro`,round(((`t_docenti_corsi`.`costo_orario_pattuito` * `t_corsi`.`durata_h`) + (((`t_docenti_corsi`.`costo_orario_pattuito` * `t_corsi`.`durata_h`) * `t_config`.`sconto_pro`) / 100)),0) AS `tot_pro` from (((`t_docenti` join `t_docenti_corsi` on((`t_docenti`.`id_docente` = `t_docenti_corsi`.`id_docente`))) join `t_corsi` on((`t_docenti_corsi`.`id_corso` = `t_corsi`.`id_corso`))) join `t_config`) order by `t_corsi`.`nomecorso`,`t_docenti`.`cognome` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_docenti_corsi_simple`
--

/*!50001 DROP TABLE IF EXISTS `v_docenti_corsi_simple`*/;
/*!50001 DROP VIEW IF EXISTS `v_docenti_corsi_simple`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_docenti_corsi_simple` AS select `t_corsi`.`nomecorso` AS `nomecorso`,`t_docenti`.`cognome` AS `cognome`,`t_docenti`.`nome` AS `nome` from ((`t_docenti` join `t_docenti_corsi` on((`t_docenti`.`id_docente` = `t_docenti_corsi`.`id_docente`))) join `t_corsi` on((`t_docenti_corsi`.`id_corso` = `t_corsi`.`id_corso`))) order by `t_corsi`.`nomecorso`,`t_docenti`.`cognome` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_fatturato_docenti`
--

/*!50001 DROP TABLE IF EXISTS `v_fatturato_docenti`*/;
/*!50001 DROP VIEW IF EXISTS `v_fatturato_docenti`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_fatturato_docenti` AS select sum(`v_docenti_corsi_econ`.`costo_totale`) AS `sum(costo_totale)`,`v_docenti_corsi_econ`.`nominativo` AS `totalone` from `v_docenti_corsi_econ` group by `v_docenti_corsi_econ`.`id_docente` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_situazione_generale`
--

/*!50001 DROP TABLE IF EXISTS `v_situazione_generale`*/;
/*!50001 DROP VIEW IF EXISTS `v_situazione_generale`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_situazione_generale` AS select `v_alunni_corsi`.`id_alunno` AS `id_alunno`,`v_alunni_corsi`.`id_corso` AS `id_corso`,`v_alunni_corsi`.`nome corso` AS `nome corso`,`v_alunni_corsi`.`cognome` AS `cognome`,`v_alunni_corsi`.`nome` AS `nome`,`v_alunni_corsi`.`durata in ore` AS `durata in ore`,`t_docenti`.`id_docente` AS `id_docente`,`t_docenti`.`cognome` AS `cognome_docente`,`t_docenti`.`nome` AS `nome_docente` from ((`v_alunni_corsi` join `t_docenti_corsi` on((`t_docenti_corsi`.`id_corso` = `v_alunni_corsi`.`id_corso`))) join `t_docenti` on((`t_docenti`.`id_docente` = `t_docenti_corsi`.`id_docente`))) */;
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

-- Dump completed on 2019-02-14 16:59:23
