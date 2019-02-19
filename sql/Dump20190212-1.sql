CREATE DATABASE  IF NOT EXISTS `talent_music` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `talent_music`;
-- MySQL dump 10.16  Distrib 10.1.37-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: talent_music
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
  `nome_alunno` varchar(50) NOT NULL,
  `cognome_alunno` varchar(50) NOT NULL,
  `data_nascita` date NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `indirizzo` varchar(100) NOT NULL,
  `comune` varchar(45) DEFAULT NULL,
  `note` blob,
  PRIMARY KEY (`id_alunno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_alunni`
--

LOCK TABLES `t_alunni` WRITE;
/*!40000 ALTER TABLE `t_alunni` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_alunni` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `t_aule`
--

LOCK TABLES `t_aule` WRITE;
/*!40000 ALTER TABLE `t_aule` DISABLE KEYS */;
INSERT INTO `t_aule` VALUES (1,'sala piano','aula con due pianoforti a coda'),(2,'sala rock','aula con mixer batteria amplificatore kit basso e tastiera'),(3,'sala canto','aula insonorizzata con mixer e microfoni'),(5,'sala piano 2','piano 2');
/*!40000 ALTER TABLE `t_aule` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`id_corso`),
  UNIQUE KEY `nomecorso_UNIQUE` (`nomecorso`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_corsi`
--

LOCK TABLES `t_corsi` WRITE;
/*!40000 ALTER TABLE `t_corsi` DISABLE KEYS */;
INSERT INTO `t_corsi` VALUES (1,'chitarra','corso per imparare a suonare la chitarra',200.00,30),(2,'pianoforte','corso per imparare a suonare il pianoforte',300.00,30),(3,'canto','corso per imparare a cantare',200.00,30);
/*!40000 ALTER TABLE `t_corsi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_docenti`
--

DROP TABLE IF EXISTS `t_docenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_docenti` (
  `id_docente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `note` blob,
  `id_tipo_contratto` int(11) NOT NULL DEFAULT '5',
  `costo_h` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_docente`),
  KEY `fk_t_docenti_1_idx` (`id_tipo_contratto`),
  CONSTRAINT `fk_t_docenti_1` FOREIGN KEY (`id_tipo_contratto`) REFERENCES `t_tipo_contratti` (`id_tipo_contratto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_docenti`
--

LOCK TABLES `t_docenti` WRITE;
/*!40000 ALTER TABLE `t_docenti` DISABLE KEYS */;
INSERT INTO `t_docenti` VALUES (1,'stefano','bollani','9876987','b@b.it',NULL,2,NULL),(2,'giorgia','giorgia','456456','g@g.it',NULL,1,NULL),(3,'luca lorenzo','guerrini','464647','g@g.it',NULL,5,NULL);
/*!40000 ALTER TABLE `t_docenti` ENABLE KEYS */;
UNLOCK TABLES;

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
  UNIQUE KEY `idx_doc_cor` (`id_docente`,`id_corso`),
  KEY `idx_doc` (`id_docente`),
  KEY `idx_corso` (`id_corso`),
  CONSTRAINT `fk_t_docenti_corsi_1` FOREIGN KEY (`id_docente`) REFERENCES `t_docenti` (`id_docente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_docenti_corsi_2` FOREIGN KEY (`id_corso`) REFERENCES `t_corsi` (`id_corso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_docenti_corsi`
--

LOCK TABLES `t_docenti_corsi` WRITE;
/*!40000 ALTER TABLE `t_docenti_corsi` DISABLE KEYS */;
INSERT INTO `t_docenti_corsi` VALUES (1,1,2,50.00),(2,2,3,50.00),(3,2,1,40.00),(4,1,3,30.00);
/*!40000 ALTER TABLE `t_docenti_corsi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_iscrizioni`
--

DROP TABLE IF EXISTS `t_iscrizioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_iscrizioni` (
  `id_iscrizione` int(11) NOT NULL AUTO_INCREMENT,
  `id_alunno` int(11) NOT NULL,
  `id_corso` int(11) NOT NULL,
  `data_iscrizione` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `costo_applicato` decimal(6,2) DEFAULT NULL,
  `pagato` decimal(6,2) DEFAULT '0.00',
  PRIMARY KEY (`id_iscrizione`),
  UNIQUE KEY `idx_cor_alu` (`id_alunno`,`id_corso`),
  KEY `idx_alu` (`id_alunno`),
  KEY `idx_cor` (`id_corso`),
  CONSTRAINT `fk_t_iscrizioni_1` FOREIGN KEY (`id_alunno`) REFERENCES `t_alunni` (`id_alunno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_iscrizioni_2` FOREIGN KEY (`id_corso`) REFERENCES `t_corsi` (`id_corso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_iscrizioni`
--

LOCK TABLES `t_iscrizioni` WRITE;
/*!40000 ALTER TABLE `t_iscrizioni` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_iscrizioni` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `t_tipo_contratti`
--

LOCK TABLES `t_tipo_contratti` WRITE;
/*!40000 ALTER TABLE `t_tipo_contratti` DISABLE KEYS */;
INSERT INTO `t_tipo_contratti` VALUES (1,'regime forfettario agevolato 15% no iva',15,'Reg. forf. 15%'),(2,'regime iva standard consulente',22,'iva std'),(3,'associazione artistica',10,'ass. art.'),(4,'dipendente statale regime inps',0,'dip. inps'),(5,'!!! in attesa di scelta',0,'!!! in attesa');
/*!40000 ALTER TABLE `t_tipo_contratti` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping events for database 'talent_music'
--

--
-- Dumping routines for database 'talent_music'
--

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-12 17:04:13
