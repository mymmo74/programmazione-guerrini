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
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `t_biciclette`
--

LOCK TABLES `t_biciclette` WRITE;
/*!40000 ALTER TABLE `t_biciclette` DISABLE KEYS */;
INSERT INTO `t_biciclette` VALUES (2,'Bianchi','Rubino Stef 21v uomo',1,'2019-02-19',380.00),(3,'Bianchi','Rubino Stef 21v uomo',1,'2019-02-19',380.00),(4,'Scott','Aspect 950 uomo',2,'2019-02-19',499.00),(5,'Scott','Scale 980 unixsex',2,'2019-02-19',950.00),(6,'Bottecchia','Tonale 29r',2,'2019-02-19',600.00),(7,'Venom bikes','20inch BMX',3,'2019-02-19',195.00),(8,'Pinarello','Andromeda 9.9xt unisex',4,'2019-02-19',3080.00),(9,'Evourban','iWatMotio Moverace ',4,'2019-02-19',580.00),(10,'Evourban','iWatMotio Moverace ',4,'2019-02-19',580.00),(11,'Kavasaki','Krunch 16',5,'2019-02-19',140.00),(12,'Sport Specialist','Bimbo 14',5,'2019-02-19',110.00),(13,'Sport Specialist','Bimbo 14',5,'2019-02-19',110.00),(14,'Sport Specialist','Bimbo 14',5,'2019-02-19',110.00),(15,'Simmonsohn','Goteborg',6,'2019-02-19',420.00),(16,'Scott','Ruby SI4 donna',7,'2019-02-19',880.00),(17,'Cube','Attain Pro',7,'2019-02-19',880.00),(18,'Nilox','Doc X2',8,'2019-02-19',540.00),(19,'Atala','Blue Lake',8,'2019-02-19',230.00);
/*!40000 ALTER TABLE `t_biciclette` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t_clienti`
--

LOCK TABLES `t_clienti` WRITE;
/*!40000 ALTER TABLE `t_clienti` DISABLE KEYS */;
INSERT INTO `t_clienti` VALUES (1,'Mimmo','Garrone','AH365688','333-9190932',''),(2,'Filippo','Rossi','AJ469055','327-1913832',NULL),(3,'Giovanni','Severgnaghi','EF346790','391-1230987',NULL),(4,'Claudia','Materano','AT243546','338-1352244',NULL),(5,'Alessandro','Sdrucido','AH102938','347-1091827',NULL),(6,'Franco','Selvaggi','AS235690','335-1234567','selvaggi@gmail.com');
/*!40000 ALTER TABLE `t_clienti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t_noleggi`
--

LOCK TABLES `t_noleggi` WRITE;
/*!40000 ALTER TABLE `t_noleggi` DISABLE KEYS */;
INSERT INTO `t_noleggi` VALUES (2,2,1,'2019-02-02 09:00:00','2019-02-05 18:00:00',10.00,50.00,'0000-00-00 00:00:00',NULL),(3,10,2,'2019-02-12 09:00:00','2019-02-22 18:00:00',10.00,75.00,NULL,NULL),(4,2,1,'2019-02-25 09:00:00','2019-02-26 18:00:00',10.00,30.00,'0000-00-00 00:00:00',NULL),(6,5,1,'2019-02-19 09:00:00','2019-02-20 18:00:00',10.00,40.00,'0000-00-00 00:00:00',NULL),(7,2,2,'2019-02-12 09:00:00','2019-02-13 18:00:00',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_noleggi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t_tariffe`
--

LOCK TABLES `t_tariffe` WRITE;
/*!40000 ALTER TABLE `t_tariffe` DISABLE KEYS */;
INSERT INTO `t_tariffe` VALUES (1,'ora',5.00,1),(2,'mezza giornata',15.00,1),(3,'giornaliera',30.00,1),(4,'due giorni',50.00,1),(5,'tre giorni',70.00,1);
/*!40000 ALTER TABLE `t_tariffe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t_tipobici`
--

LOCK TABLES `t_tipobici` WRITE;
/*!40000 ALTER TABLE `t_tipobici` DISABLE KEYS */;
INSERT INTO `t_tipobici` VALUES (1,'city bike',NULL,0.00),(2,'mountain bike',NULL,0.00),(3,'bmx',NULL,0.00),(4,'elettrica',NULL,0.00),(5,'bambino',NULL,0.00),(6,'tandem',NULL,0.00),(7,'corsa',NULL,0.00),(8,'pieghevole',NULL,0.00);
/*!40000 ALTER TABLE `t_tipobici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'noleggio_bici'
--

--
-- Dumping routines for database 'noleggio_bici'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-19 17:02:55
