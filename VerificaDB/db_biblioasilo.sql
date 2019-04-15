CREATE DATABASE  IF NOT EXISTS `db_biblioasilo` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `db_biblioasilo`;
-- MySQL dump 10.16  Distrib 10.1.37-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db_biblioasilo
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
-- Table structure for table `t_bimbi`
--

DROP TABLE IF EXISTS `t_bimbi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_bimbi` (
  `id_bimbo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  `genitore` varchar(45) DEFAULT NULL,
  `tel` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id_bimbo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_bimbi`
--

LOCK TABLES `t_bimbi` WRITE;
/*!40000 ALTER TABLE `t_bimbi` DISABLE KEYS */;
INSERT INTO `t_bimbi` VALUES (1,'Giovanni','fagiolo','domenico fagiolo','335-5630962','d.fagiolo@gmail.com'),(2,'eleonora','scarpetta','ludovica nibbio','327-8837319','ludo.nibbio@gmail.com'),(3,'carlotta','cacace','orsola guelfo','345-2012831','orsolaguelfo@gmail.com'),(4,'mattia','pasquino','paolo pasquino','338-4552214','paolo.pasquino@gmail.com'),(5,'enrico','pasquino','giuseppe pasquino','329-4700223','pasquino@gmail.com'),(6,'federico','riccadonna','manuela rossi','333-9412728','manu.rossi@gmail.com');
/*!40000 ALTER TABLE `t_bimbi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_libri`
--

DROP TABLE IF EXISTS `t_libri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_libri` (
  `id_libro` int(11) NOT NULL AUTO_INCREMENT,
  `titolo` varchar(100) NOT NULL,
  `autore` varchar(45) NOT NULL,
  `genere` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_libro`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_libri`
--

LOCK TABLES `t_libri` WRITE;
/*!40000 ALTER TABLE `t_libri` DISABLE KEYS */;
INSERT INTO `t_libri` VALUES (1,'pinocchio','carlo collodi','5 anni'),(2,'pinocchio','carlo collodi','5 anni'),(3,'pippi calzelunghe','astrid lindgren','4 anni'),(4,'cagnolino come stai?','jo lodge','3 anni'),(5,'i colori delle emozioni','anna llenas','3 anni'),(6,'le sei storie delle paroline magiche','sara agostini','3 anni'),(7,'il gruffalo','julia donaldson','3 anni'),(8,'il lupo che voleva cambiare colore','eleonore thuillier','3 anni'),(9,'le fiabe della buona notte','stefania colnaghi','3 anni'),(10,'il pirata barbagrossa e il calzino puzzolente','bernhard lassahn','5 anni'),(11,'il gufo che aveva paura di parlare','jill tomlinson','5 anni'),(12,'l\'arcobalena','massimo sardi','4 anni'),(13,'la strega rossella','julia donaldson','4 anni'),(14,'la strega rossella','julia donaldson','4 anni'),(15,'Beniamino cagnolino','Saul Sonzogno','5 anni');
/*!40000 ALTER TABLE `t_libri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_prestiti`
--

DROP TABLE IF EXISTS `t_prestiti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_prestiti` (
  `id_prestito` int(11) NOT NULL AUTO_INCREMENT,
  `id_libro` int(11) NOT NULL,
  `id_bimbo` int(11) NOT NULL,
  `data_prestito` date DEFAULT NULL,
  `data_restituzione` date DEFAULT NULL,
  PRIMARY KEY (`id_prestito`),
  KEY `fk_t_prestiti_1_idx` (`id_bimbo`),
  KEY `fk_t_prestiti_2_idx` (`id_libro`),
  CONSTRAINT `fk_t_prestiti_1` FOREIGN KEY (`id_bimbo`) REFERENCES `t_bimbi` (`id_bimbo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_prestiti_2` FOREIGN KEY (`id_libro`) REFERENCES `t_libri` (`id_libro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_prestiti`
--

LOCK TABLES `t_prestiti` WRITE;
/*!40000 ALTER TABLE `t_prestiti` DISABLE KEYS */;
INSERT INTO `t_prestiti` VALUES (2,3,2,'2018-03-01','2018-03-29'),(3,4,3,'2018-03-14','2018-03-31'),(4,2,2,'2018-02-25','2018-03-12'),(6,5,4,'2018-03-22','2018-04-02'),(7,1,1,'2019-03-31','2019-04-04'),(8,5,5,'2018-05-10','0000-00-00'),(9,8,3,'2018-06-15','0000-00-00'),(10,6,1,'2018-10-11','0000-00-00');
/*!40000 ALTER TABLE `t_prestiti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_elencobimbi`
--

DROP TABLE IF EXISTS `v_elencobimbi`;
/*!50001 DROP VIEW IF EXISTS `v_elencobimbi`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_elencobimbi` (
  `id_bimbo` tinyint NOT NULL,
  `cognome` tinyint NOT NULL,
  `nome` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_elencolibri`
--

DROP TABLE IF EXISTS `v_elencolibri`;
/*!50001 DROP VIEW IF EXISTS `v_elencolibri`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_elencolibri` (
  `id_libro` tinyint NOT NULL,
  `titolo` tinyint NOT NULL,
  `autore` tinyint NOT NULL,
  `genere` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_elencoprestiti`
--

DROP TABLE IF EXISTS `v_elencoprestiti`;
/*!50001 DROP VIEW IF EXISTS `v_elencoprestiti`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_elencoprestiti` (
  `nome` tinyint NOT NULL,
  `cognome` tinyint NOT NULL,
  `titolo` tinyint NOT NULL,
  `autore` tinyint NOT NULL,
  `data_prestito` tinyint NOT NULL,
  `data_restituzione` tinyint NOT NULL,
  `id_bimbo` tinyint NOT NULL,
  `id_libro` tinyint NOT NULL,
  `id_prestito` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_elencoprestitifuori`
--

DROP TABLE IF EXISTS `v_elencoprestitifuori`;
/*!50001 DROP VIEW IF EXISTS `v_elencoprestitifuori`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_elencoprestitifuori` (
  `nome` tinyint NOT NULL,
  `cognome` tinyint NOT NULL,
  `titolo` tinyint NOT NULL,
  `autore` tinyint NOT NULL,
  `data_prestito` tinyint NOT NULL,
  `data_restituzione` tinyint NOT NULL,
  `id_bimbo` tinyint NOT NULL,
  `id_libro` tinyint NOT NULL,
  `id_prestito` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'db_biblioasilo'
--

--
-- Dumping routines for database 'db_biblioasilo'
--

--
-- Final view structure for view `v_elencobimbi`
--

/*!50001 DROP TABLE IF EXISTS `v_elencobimbi`*/;
/*!50001 DROP VIEW IF EXISTS `v_elencobimbi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_elencobimbi` AS select `t_bimbi`.`id_bimbo` AS `id_bimbo`,`t_bimbi`.`cognome` AS `cognome`,`t_bimbi`.`nome` AS `nome` from `t_bimbi` order by `t_bimbi`.`cognome`,`t_bimbi`.`nome` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_elencolibri`
--

/*!50001 DROP TABLE IF EXISTS `v_elencolibri`*/;
/*!50001 DROP VIEW IF EXISTS `v_elencolibri`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_elencolibri` AS select `t_libri`.`id_libro` AS `id_libro`,`t_libri`.`titolo` AS `titolo`,`t_libri`.`autore` AS `autore`,`t_libri`.`genere` AS `genere` from `t_libri` order by `t_libri`.`titolo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_elencoprestiti`
--

/*!50001 DROP TABLE IF EXISTS `v_elencoprestiti`*/;
/*!50001 DROP VIEW IF EXISTS `v_elencoprestiti`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_elencoprestiti` AS select `b`.`nome` AS `nome`,`b`.`cognome` AS `cognome`,`l`.`titolo` AS `titolo`,`l`.`autore` AS `autore`,`p`.`data_prestito` AS `data_prestito`,`p`.`data_restituzione` AS `data_restituzione`,`b`.`id_bimbo` AS `id_bimbo`,`l`.`id_libro` AS `id_libro`,`p`.`id_prestito` AS `id_prestito` from ((`t_bimbi` `b` join `t_prestiti` `p` on((`b`.`id_bimbo` = `p`.`id_bimbo`))) join `t_libri` `l` on((`p`.`id_libro` = `l`.`id_libro`))) order by `p`.`data_prestito` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_elencoprestitifuori`
--

/*!50001 DROP TABLE IF EXISTS `v_elencoprestitifuori`*/;
/*!50001 DROP VIEW IF EXISTS `v_elencoprestitifuori`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_elencoprestitifuori` AS select `b`.`nome` AS `nome`,`b`.`cognome` AS `cognome`,`l`.`titolo` AS `titolo`,`l`.`autore` AS `autore`,`p`.`data_prestito` AS `data_prestito`,`p`.`data_restituzione` AS `data_restituzione`,`b`.`id_bimbo` AS `id_bimbo`,`l`.`id_libro` AS `id_libro`,`p`.`id_prestito` AS `id_prestito` from ((`t_bimbi` `b` join `t_prestiti` `p` on((`b`.`id_bimbo` = `p`.`id_bimbo`))) join `t_libri` `l` on((`p`.`id_libro` = `l`.`id_libro`))) where (`p`.`data_restituzione` = '') order by `p`.`data_prestito` */;
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

-- Dump completed on 2019-04-04 15:51:02
