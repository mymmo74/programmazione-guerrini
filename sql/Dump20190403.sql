CREATE DATABASE  IF NOT EXISTS `db_tssfriends` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `db_tssfriends`;
-- MySQL dump 10.16  Distrib 10.1.37-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db_tssfriends
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
-- Table structure for table `t_anagrafiche`
--

DROP TABLE IF EXISTS `t_anagrafiche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_anagrafiche` (
  `id_anagrafica` int(11) NOT NULL AUTO_INCREMENT,
  `cognome` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `usr` varchar(45) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `ruolo` varchar(2) NOT NULL DEFAULT 'u',
  `citta` varchar(50) DEFAULT NULL,
  `data_nascita` date DEFAULT NULL,
  `indirizzo` varchar(45) DEFAULT NULL,
  `tel` varchar(45) DEFAULT NULL,
  `note` varchar(2000) DEFAULT NULL,
  `filefoto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_anagrafica`),
  KEY `idx_cog` (`cognome`),
  KEY `idx_citta` (`citta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_anagrafiche`
--

LOCK TABLES `t_anagrafiche` WRITE;
/*!40000 ALTER TABLE `t_anagrafiche` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_anagrafiche` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_anagrafiche_corsi`
--

DROP TABLE IF EXISTS `t_anagrafiche_corsi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_anagrafiche_corsi` (
  `id_anagrafica_corso` int(11) NOT NULL AUTO_INCREMENT,
  `id_anagrafica` int(11) NOT NULL,
  `id_corso` int(11) NOT NULL,
  PRIMARY KEY (`id_anagrafica_corso`),
  UNIQUE KEY `idx_unico` (`id_corso`,`id_anagrafica`),
  KEY `idx_cor` (`id_corso`),
  KEY `idx_anag` (`id_anagrafica`),
  CONSTRAINT `fk_t_anagrafiche_corsi_1` FOREIGN KEY (`id_corso`) REFERENCES `t_corsi` (`id_corso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_anagrafiche_corsi_2` FOREIGN KEY (`id_anagrafica`) REFERENCES `t_anagrafiche` (`id_anagrafica`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_anagrafiche_corsi`
--

LOCK TABLES `t_anagrafiche_corsi` WRITE;
/*!40000 ALTER TABLE `t_anagrafiche_corsi` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_anagrafiche_corsi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_corsi`
--

DROP TABLE IF EXISTS `t_corsi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_corsi` (
  `id_corso` int(11) NOT NULL AUTO_INCREMENT,
  `nome_corso` varchar(100) NOT NULL,
  `id_sede` int(11) NOT NULL,
  `edizione` varchar(45) DEFAULT NULL,
  `data_inizio` date NOT NULL,
  `data_fine` date NOT NULL,
  `note_corso` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id_corso`),
  KEY `idx_corso` (`nome_corso`),
  KEY `idx_sede` (`id_sede`),
  CONSTRAINT `fk_t_corsi_1` FOREIGN KEY (`id_sede`) REFERENCES `t_sedi` (`id_sede`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_corsi`
--

LOCK TABLES `t_corsi` WRITE;
/*!40000 ALTER TABLE `t_corsi` DISABLE KEYS */;
INSERT INTO `t_corsi` VALUES (2,'Media Marketing',1,'2019','2018-12-23','2019-06-20','Corso di social marketing'),(4,'TSS',1,'2019','2018-12-01','2019-07-10','Corso di social marketing'),(5,'Database',1,'2019','2019-01-15','2019-05-01','Corso di database SQL'),(8,'Cucina base',2,'2019','2019-01-15','2019-04-15','Corso cucina base'),(9,'Media Marketing',3,'2019','2018-12-23','2019-06-20','Corso di social marketing');
/*!40000 ALTER TABLE `t_corsi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_esperienze`
--

DROP TABLE IF EXISTS `t_esperienze`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_esperienze` (
  `id_esperienza` int(11) NOT NULL AUTO_INCREMENT,
  `id_anagrafica` varchar(45) DEFAULT NULL,
  `esperienza` varchar(100) NOT NULL,
  `note_esperienza` varchar(5000) DEFAULT NULL,
  `luogo` varchar(100) DEFAULT NULL,
  `stato` varchar(45) DEFAULT NULL,
  `dato_inizia_esperienza` date NOT NULL,
  `dato_fine_esperienza` date DEFAULT NULL,
  PRIMARY KEY (`id_esperienza`,`dato_inizia_esperienza`),
  KEY `idxd_anagr` (`id_anagrafica`),
  KEY `idx_data` (`dato_inizia_esperienza`),
  CONSTRAINT `fk_t_esperienze_1` FOREIGN KEY (`id_anagrafica`) REFERENCES `t_anagrafiche` (`cognome`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_esperienze`
--

LOCK TABLES `t_esperienze` WRITE;
/*!40000 ALTER TABLE `t_esperienze` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_esperienze` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sedi`
--

DROP TABLE IF EXISTS `t_sedi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_sedi` (
  `id_sede` int(11) NOT NULL AUTO_INCREMENT,
  `sede` varchar(100) NOT NULL,
  `indirizzo_sede` varchar(100) NOT NULL,
  `tel_sede` varchar(45) NOT NULL,
  `citta_sede` varchar(50) NOT NULL,
  `mail_sede` varchar(60) DEFAULT NULL,
  `note_sede` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id_sede`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sedi`
--

LOCK TABLES `t_sedi` WRITE;
/*!40000 ALTER TABLE `t_sedi` DISABLE KEYS */;
INSERT INTO `t_sedi` VALUES (1,'Carlo Ghiglieno','Via Sant’Arborio Varmondo, 3','+39 0125 642934','Ivrea','ghiglieno@ciacformazione.it','Erede di una tradizione formativa di eccellenza nel campo dell’Information Technology'),(2,'Ferdinando Prat','Via Sant’Arborio Varmondo, 5','+39 0125 1865420','Ivrea','prat@ciacformazione.it','sede operativa'),(3,'Davide Negro','Via Battitore, 82','+39 011 9214534','Ciriè','negro@ciacformazione.it','La Sede Operativa “Davide Negro” è il centro di riferimento sul territorio del Ciriacese e delle Valli di Lanzo.'),(4,'Pietro Cinotto','Via Mazzini, 80','+39 0124 616298','Valperga','cinotto@ciacformazione.it','Centro di riferimento in Altocanavese per le attività formative per l’assolvimento dell’obbligo scolastico e per la formazione continua nell’ambito delle tecnologie industriali.'),(5,'Adriano Sada','Corso Re Arduino, 50','+39 0124 425064','Rivarolo C.se','sada@ciacformazione.it','La Sede Centrale ospita la Direzione Generale dell’Ente e le funzioni: Amministrazione, Ricerca e Sviluppo, Qualità.'),(6,'Mimmo Garrone','Corso Re Arduino, 50','+39 0124 425064','Maglione','garrone@ciacformazione.it','La Sede Centrale ospita la Direzione Generale dell’Ente e le funzioni: Amministrazione, Ricerca e Sviluppo, Qualità.'),(7,'Alessio Garrone','Corso Re Arduino, 50','+39 0124 425064','Maglione','garrone@ciacformazione.it','La Sede Centrale ospita la Direzione Generale dell’Ente e le funzioni: Amministrazione, Ricerca e Sviluppo, Qualità.');
/*!40000 ALTER TABLE `t_sedi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tags`
--

DROP TABLE IF EXISTS `t_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_tags` (
  `id_tag` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tag`),
  UNIQUE KEY `id_tag` (`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tags`
--

LOCK TABLES `t_tags` WRITE;
/*!40000 ALTER TABLE `t_tags` DISABLE KEYS */;
INSERT INTO `t_tags` VALUES (1,'informatica','informatica'),(4,'HTML','Informatica'),(5,'sql','Informatica'),(6,'sql language','Informatica'),(9,'cinese','lingue'),(10,'russo','langu'),(12,'fr','ftyu'),(13,'feer','ftyu'),(14,'prrr','fff');
/*!40000 ALTER TABLE `t_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tags_corsi`
--

DROP TABLE IF EXISTS `t_tags_corsi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_tags_corsi` (
  `id_tag_corso` int(11) NOT NULL AUTO_INCREMENT,
  `id_tag` int(11) NOT NULL,
  `id_corso` int(11) NOT NULL,
  PRIMARY KEY (`id_tag_corso`),
  KEY `idx_tag` (`id_tag`),
  KEY `idx_cor` (`id_corso`),
  CONSTRAINT `fk_t_tags_corsi_1` FOREIGN KEY (`id_corso`) REFERENCES `t_corsi` (`id_corso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_tags_corsi_2` FOREIGN KEY (`id_tag`) REFERENCES `t_tags` (`id_tag`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tags_corsi`
--

LOCK TABLES `t_tags_corsi` WRITE;
/*!40000 ALTER TABLE `t_tags_corsi` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_tags_corsi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tags_esperienze`
--

DROP TABLE IF EXISTS `t_tags_esperienze`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_tags_esperienze` (
  `id_tag_esperienza` int(11) NOT NULL AUTO_INCREMENT,
  `id_tag` int(11) NOT NULL,
  `id_esperienza` int(11) NOT NULL,
  PRIMARY KEY (`id_tag_esperienza`),
  UNIQUE KEY `idx_tag_exp` (`id_tag`,`id_esperienza`),
  KEY `idx_exp` (`id_esperienza`),
  KEY `idx_tag` (`id_tag`),
  CONSTRAINT `fk_t_tags_esperienze_1` FOREIGN KEY (`id_esperienza`) REFERENCES `t_esperienze` (`id_esperienza`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_tags_esperienze_2` FOREIGN KEY (`id_tag`) REFERENCES `t_tags` (`id_tag`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tags_esperienze`
--

LOCK TABLES `t_tags_esperienze` WRITE;
/*!40000 ALTER TABLE `t_tags_esperienze` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_tags_esperienze` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_tssfriends'
--

--
-- Dumping routines for database 'db_tssfriends'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-03 10:38:37
