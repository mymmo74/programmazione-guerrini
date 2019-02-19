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
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `t_alunni`
--

LOCK TABLES `t_alunni` WRITE;
/*!40000 ALTER TABLE `t_alunni` DISABLE KEYS */;
INSERT INTO `t_alunni` VALUES (1,'rossi','mario','wer','345',NULL,NULL,NULL),(2,'bianchi','maria','qwe','123',NULL,NULL,NULL),(3,'verdi','giuseppe','iuy','876',NULL,NULL,NULL),(4,'rossini','gioachino','jhg','765',NULL,NULL,NULL),(5,'puccini','giacomo','uyt','654','','',''),(6,'chopin','frederik','gfd','765765','',NULL,NULL);
/*!40000 ALTER TABLE `t_alunni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t_aule`
--

LOCK TABLES `t_aule` WRITE;
/*!40000 ALTER TABLE `t_aule` DISABLE KEYS */;
INSERT INTO `t_aule` VALUES (1,'sala piano','aula con due pianoforti a coda'),(2,'sala rock','aula con mixer batteria ampli chitarra basso e tastiera'),(3,'sala canto','aula insonorizzata con mixer  e microfoni'),(5,'sala piano 2','piano 2');
/*!40000 ALTER TABLE `t_aule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t_config`
--

LOCK TABLES `t_config` WRITE;
/*!40000 ALTER TABLE `t_config` DISABLE KEYS */;
INSERT INTO `t_config` VALUES (1,'tss talent',20);
/*!40000 ALTER TABLE `t_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t_corsi`
--

LOCK TABLES `t_corsi` WRITE;
/*!40000 ALTER TABLE `t_corsi` DISABLE KEYS */;
INSERT INTO `t_corsi` VALUES (1,'corso di chitarra principianti di gruppo','corso principianti di gruppo per musica di insieme',200.00,30,'chitarra classica principianti ','2019-05-10','2019-08-15'),(2,'Corso di pianoforte per bambini','corso preserale in fascia doposcuola adatto per bambini di eta\' inferiore ai 12 anni',300.00,30,'pianoforte base','2018-10-10','2019-05-05'),(3,'canto','corso per imparare a cantare',200.00,30,'NN',NULL,NULL),(7,'corso di pianoforte per adulti base','corso preserale adatto per adulti dai primi rudimenti fino alla esecuzione di semplici brani classici',350.00,40,'pianoforte base','2018-11-11','2019-06-06'),(8,'corso di chitarra principiante lezione individuale ','corso di chitarra principiante con lezioni individuali ',400.00,20,'chitarra classica principianti ','2018-10-05','2019-05-05'),(11,'master canto pop con Giorgia','due giorni di lezioni con una delle voci piu\' belle del panorama italiano Max posti 12',120.00,8,'canto base pop ','2019-10-01','2019-11-01');
/*!40000 ALTER TABLE `t_corsi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t_docenti`
--

LOCK TABLES `t_docenti` WRITE;
/*!40000 ALTER TABLE `t_docenti` DISABLE KEYS */;
INSERT INTO `t_docenti` VALUES (1,'bollani','stefano','b@b.it','654654',NULL,2,100.00),(2,'giorgia','giorgia','g@g.it','987987',NULL,1,80.00),(3,'guerrini','luca lorenzo','gg@gg.it','98798999',NULL,5,50.00);
/*!40000 ALTER TABLE `t_docenti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t_docenti_corsi`
--

LOCK TABLES `t_docenti_corsi` WRITE;
/*!40000 ALTER TABLE `t_docenti_corsi` DISABLE KEYS */;
INSERT INTO `t_docenti_corsi` VALUES (1,1,2,50.00),(2,2,3,40.00),(3,2,1,50.00),(4,1,3,30.00),(5,2,11,100.00),(6,3,7,30.00),(7,3,8,30.00);
/*!40000 ALTER TABLE `t_docenti_corsi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t_iscrizioni`
--

LOCK TABLES `t_iscrizioni` WRITE;
/*!40000 ALTER TABLE `t_iscrizioni` DISABLE KEYS */;
INSERT INTO `t_iscrizioni` VALUES (6,3,1,'2019-02-12 15:02:10',NULL,0.00),(7,2,1,'2019-02-12 15:02:10',NULL,0.00),(8,11,2,'2019-02-14 10:42:05',NULL,0.00),(9,11,3,'2019-02-14 10:42:05',NULL,0.00),(10,11,4,'2019-02-14 10:42:05',NULL,0.00),(11,11,5,'2019-02-14 10:42:05',NULL,0.00);
/*!40000 ALTER TABLE `t_iscrizioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t_tipo_contratti`
--

LOCK TABLES `t_tipo_contratti` WRITE;
/*!40000 ALTER TABLE `t_tipo_contratti` DISABLE KEYS */;
INSERT INTO `t_tipo_contratti` VALUES (1,'regime forfettario agevolato 15% no iva',0,'reg. forf. 15%'),(2,'regime Iva standard consulente',22,'iva std'),(3,'associazione artistica',10,'ass. art.'),(4,'dipendente statale regime inps',0,'dip. inps'),(5,'!!! in attesa di scelta',0,'!!! in attesa');
/*!40000 ALTER TABLE `t_tipo_contratti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t_tipologia_corso`
--

LOCK TABLES `t_tipologia_corso` WRITE;
/*!40000 ALTER TABLE `t_tipologia_corso` DISABLE KEYS */;
INSERT INTO `t_tipologia_corso` VALUES ('canto base pop',NULL),('canto intermedio pop',NULL),('chitarra classica principianti',NULL),('NN',NULL),('pianoforte avanzato',NULL),('pianoforte base',NULL),('pianoforte intermedio',NULL);
/*!40000 ALTER TABLE `t_tipologia_corso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'talent_music_new'
--

--
-- Dumping routines for database 'talent_music_new'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-14 17:00:08
