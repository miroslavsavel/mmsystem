-- MariaDB dump 10.19  Distrib 10.4.19-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: cms
-- ------------------------------------------------------
-- Server version	10.4.19-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `a01_wait_zamestnanci`
--

DROP TABLE IF EXISTS `a01_wait_zamestnanci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a01_wait_zamestnanci` (
  `a01_wait_zamestnanci_id` int(11) NOT NULL AUTO_INCREMENT,
  `a01_wait_vykazy_id` int(11) DEFAULT NULL,
  `a01_meno` varchar(50) DEFAULT NULL,
  `a01_priezvisko` varchar(50) DEFAULT NULL,
  `a01_fixna_odmena` int(11) DEFAULT NULL,
  `a01_fakturovana_suma` int(11) DEFAULT NULL,
  `a01_cas_od` datetime DEFAULT NULL,
  `a01_cas_do` datetime DEFAULT NULL,
  `a01_pocet_hodin` decimal(6,3) DEFAULT NULL,
  `a01_hod_noc` decimal(6,3) DEFAULT NULL,
  `a01_hod_sobota` decimal(6,3) DEFAULT NULL,
  `a01_hod_nedela` decimal(6,3) DEFAULT NULL,
  `a01_hod_sviatok` decimal(6,3) DEFAULT NULL,
  `a01_hod_sobota_noc` decimal(6,3) DEFAULT NULL,
  `a01_hod_nedela_noc` decimal(6,3) DEFAULT NULL,
  `a01_hod_sviatok_noc` decimal(6,3) DEFAULT NULL,
  `a01_hod_sobota_sviatok` decimal(6,3) DEFAULT NULL,
  `a01_hod_nedela_sviatok` decimal(6,3) DEFAULT NULL,
  `a01_hod_sobota_sviatok_noc` decimal(6,3) DEFAULT NULL,
  `a01_hod_nedela_sviatok_noc` decimal(6,3) DEFAULT NULL,
  `a01_who` varchar(50) DEFAULT NULL,
  `a01_dat_ins` datetime DEFAULT NULL,
  PRIMARY KEY (`a01_wait_zamestnanci_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a01_wait_zamestnanci`
--

LOCK TABLES `a01_wait_zamestnanci` WRITE;
/*!40000 ALTER TABLE `a01_wait_zamestnanci` DISABLE KEYS */;
INSERT INTO `a01_wait_zamestnanci` VALUES (17,64,'Alexander','Dubcek',0,0,'2021-08-29 10:00:00','2021-08-30 10:00:00',24.000,12.000,0.000,0.000,0.000,0.000,12.000,0.000,0.000,0.000,12.000,0.000,'root@localhost','2021-08-29 17:19:17'),(18,64,'Miro','Savel',0,0,'2021-08-29 10:00:00','2021-08-30 10:00:00',24.000,12.000,0.000,0.000,0.000,0.000,12.000,0.000,0.000,0.000,0.000,12.000,'root@localhost','2021-08-29 17:19:17'),(19,65,'Miro','Savel',0,0,'2021-09-01 10:00:00','2021-09-01 18:00:00',8.000,0.000,0.000,0.000,8.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,'root@localhost','2021-09-01 19:35:39'),(20,65,'Alexander','Dubcek',0,0,'2021-09-01 10:00:00','2021-09-01 18:00:00',0.000,0.000,0.000,0.000,8.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,'root@localhost','2021-09-01 19:35:39'),(21,66,'Miro','Savel',0,0,'2021-09-01 10:00:00','2021-09-01 18:00:00',8.000,0.000,0.000,0.000,8.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,'root@localhost','2021-09-01 19:40:41'),(22,67,'Alexander','Dubcek',0,0,'2021-09-01 10:00:00','2021-09-01 18:00:00',8.000,0.000,0.000,0.000,8.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,'root@localhost','2021-09-01 20:55:58'),(23,68,'Alexander','Dubcek',0,0,'2021-09-01 10:00:00','2021-09-01 18:00:00',8.000,0.000,0.000,0.000,8.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,'root@localhost','2021-09-01 21:04:52'),(24,69,'Alexander','Dubcek',0,0,'2021-09-01 10:00:00','2021-09-01 18:00:00',8.000,0.000,0.000,0.000,8.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,'root@localhost','2021-09-01 21:08:26');
/*!40000 ALTER TABLE `a01_wait_zamestnanci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'test','$2y$10$SfhYIDtn.iOuCW7zfoFLuuZHX6lja4lF4XA4JqNmpiH/.P3zB8JCa','test@test.com'),(2,'prvy','$2y$10$xR.PBOj.ZxZSP7CXtnlQ.uYICKTHMqS11brRxn1uah3DTpS2NvGYu','prvy@email.com');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fin_den_firmy`
--

DROP TABLE IF EXISTS `fin_den_firmy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_den_firmy` (
  `id_fin_den_firmy` int(11) NOT NULL AUTO_INCREMENT,
  `firmy_id` int(11) DEFAULT NULL,
  `schvalene_vykazy_id` int(11) DEFAULT NULL,
  `suma` decimal(6,3) DEFAULT NULL,
  `typ_zaznamu` enum('false','true') NOT NULL DEFAULT 'false',
  `dat_ins` datetime DEFAULT NULL,
  `pozn` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_fin_den_firmy`),
  KEY `firmy_id` (`firmy_id`),
  KEY `schvalene_vykazy_id` (`schvalene_vykazy_id`),
  CONSTRAINT `fin_den_firmy_ibfk_1` FOREIGN KEY (`firmy_id`) REFERENCES `firmy` (`firmy_id`),
  CONSTRAINT `fin_den_firmy_ibfk_2` FOREIGN KEY (`schvalene_vykazy_id`) REFERENCES `schvalene_vykazy` (`schvalene_vykazy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_den_firmy`
--

LOCK TABLES `fin_den_firmy` WRITE;
/*!40000 ALTER TABLE `fin_den_firmy` DISABLE KEYS */;
INSERT INTO `fin_den_firmy` VALUES (1,3,34,132.000,'false','2021-08-29 17:19:56','Vygenerované zo schváleného výkazu'),(2,3,34,144.000,'true','2021-08-29 17:19:56','Vygenerované zo schváleného výkazu'),(3,3,35,32.000,'false','2021-09-01 19:35:55','Vygenerované zo schváleného výkazu'),(4,3,35,24.000,'false','2021-09-01 19:35:55','Vygenerované zo schváleného výkazu'),(5,3,36,32.000,'false','2021-09-01 19:40:53','Vygenerované zo schváleného výkazu'),(6,3,37,32.000,'false','2021-09-01 20:59:18','Vygenerované zo schváleného výkazu'),(7,3,38,40.000,'false','2021-09-01 21:04:59','Vygenerované zo schváleného výkazu'),(8,3,39,40.000,'false','2021-09-01 21:08:34','Vygenerované zo schváleného výkazu');
/*!40000 ALTER TABLE `fin_den_firmy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fin_den_zam`
--

DROP TABLE IF EXISTS `fin_den_zam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_den_zam` (
  `id_fin_den_zam` int(11) NOT NULL AUTO_INCREMENT,
  `cislo_zamestnanca` int(11) DEFAULT NULL,
  `schvalene_vykazy_id` int(11) DEFAULT NULL,
  `meno` varchar(50) DEFAULT NULL,
  `priezvisko` varchar(50) DEFAULT NULL,
  `suma` decimal(6,3) DEFAULT NULL,
  `typ_zaznamu` enum('false','true') NOT NULL DEFAULT 'false',
  `dat_ins` datetime DEFAULT NULL,
  `pozn` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_fin_den_zam`),
  KEY `cislo_zamestnanca` (`cislo_zamestnanca`),
  KEY `schvalene_vykazy_id` (`schvalene_vykazy_id`),
  CONSTRAINT `fin_den_zam_ibfk_1` FOREIGN KEY (`cislo_zamestnanca`) REFERENCES `zamestnanci` (`cislo_zamestnanca`),
  CONSTRAINT `fin_den_zam_ibfk_2` FOREIGN KEY (`schvalene_vykazy_id`) REFERENCES `schvalene_vykazy` (`schvalene_vykazy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fin_den_zam`
--

LOCK TABLES `fin_den_zam` WRITE;
/*!40000 ALTER TABLE `fin_den_zam` DISABLE KEYS */;
INSERT INTO `fin_den_zam` VALUES (27,111,17,'miro','savel',31.500,'false','2020-10-29 21:32:37','Vygenerované zo schváleného výkazu'),(28,111,21,'Miro','Savel',15.000,'false','2021-08-24 21:02:29','Vygenerované zo schváleného výkazu'),(29,4,21,'Alexander','Dubcek',18.000,'false','2021-08-24 21:02:29','Vygenerované zo schváleného výkazu'),(30,111,22,'Miro','Savel',15.000,'false','2021-08-24 21:46:44','Vygenerované zo schváleného výkazu'),(31,4,22,'Alexander','Dubcek',18.000,'true','2021-08-24 21:46:44','Vygenerované zo schváleného výkazu'),(32,111,25,'Miro','Savel',15.000,'false','2021-08-24 22:00:57','Vygenerované zo schváleného výkazu'),(33,4,25,'Alexander','Dubcek',18.000,'false','2021-08-24 22:00:57','Vygenerované zo schváleného výkazu'),(36,111,31,'Miro','Savel',15.000,'false','2021-08-24 22:18:19','Vygenerované zo schváleného výkazu'),(37,4,31,'Alexander','Dubcek',18.000,'false','2021-08-24 22:19:56','Vygenerované zo schváleného výkazu'),(38,111,32,'miro','savel',19.380,'false','2021-08-24 22:33:14','Vygenerované zo schváleného výkazu'),(39,111,33,'Miro','Savel',15.000,'false','2021-08-25 22:33:39','Vygenerované zo schváleného výkazu'),(40,4,34,'Alexander','Dubcek',96.000,'false','2021-08-29 17:19:56','Vygenerované zo schváleného výkazu'),(41,111,34,'Miro','Savel',127.080,'false','2021-08-29 17:19:56','Vygenerované zo schváleného výkazu'),(42,111,35,'Miro','Savel',14.800,'false','2021-09-01 19:35:55','Vygenerované zo schváleného výkazu'),(43,4,35,'Alexander','Dubcek',-24.000,'false','2021-09-01 19:35:55','Vygenerované zo schváleného výkazu'),(44,111,36,'Miro','Savel',14.800,'false','2021-09-01 19:40:53','Vygenerované zo schváleného výkazu'),(45,4,37,'Alexander','Dubcek',8.000,'false','2021-09-01 20:59:18','Vygenerované zo schváleného výkazu'),(46,4,38,'Alexander','Dubcek',8.000,'false','2021-09-01 21:04:59','Vygenerované zo schváleného výkazu'),(47,4,39,'Alexander','Dubcek',40.000,'false','2021-09-01 21:08:34','Vygenerované zo schváleného výkazu');
/*!40000 ALTER TABLE `fin_den_zam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firmy`
--

DROP TABLE IF EXISTS `firmy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `firmy` (
  `firmy_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazov_firmy` varchar(200) DEFAULT NULL,
  `ico` varchar(50) DEFAULT NULL,
  `dic` varchar(50) DEFAULT NULL,
  `bezna_taxa` int(11) DEFAULT NULL,
  `priplatok_noc` int(11) DEFAULT NULL,
  `priplatok_sobota` int(11) DEFAULT NULL,
  `priplatok_nedela` int(11) DEFAULT NULL,
  `priplatok_sviatok` int(11) DEFAULT NULL,
  PRIMARY KEY (`firmy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firmy`
--

LOCK TABLES `firmy` WRITE;
/*!40000 ALTER TABLE `firmy` DISABLE KEYS */;
INSERT INTO `firmy` VALUES (1,'4sports media','123859','569878',7,2,3,2,5),(3,'Backline','564987','452565',1,1,2,3,4),(4,'5media','1265987','563287',7,3,2,9,2);
/*!40000 ALTER TABLE `firmy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schvalene_vykazy`
--

DROP TABLE IF EXISTS `schvalene_vykazy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schvalene_vykazy` (
  `schvalene_vykazy_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazov_akcie` varchar(100) DEFAULT NULL,
  `akcia_dat` date DEFAULT NULL,
  `firmy_id` int(11) NOT NULL,
  `ine_naklady` decimal(6,3) DEFAULT NULL,
  PRIMARY KEY (`schvalene_vykazy_id`),
  KEY `firmy_id` (`firmy_id`),
  CONSTRAINT `schvalene_vykazy_ibfk_1` FOREIGN KEY (`firmy_id`) REFERENCES `firmy` (`firmy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schvalene_vykazy`
--

LOCK TABLES `schvalene_vykazy` WRITE;
/*!40000 ALTER TABLE `schvalene_vykazy` DISABLE KEYS */;
INSERT INTO `schvalene_vykazy` VALUES (1,'zly_vstup','2020-08-01',4,0.000),(5,'pokus','2020-09-01',1,0.000),(6,'pokus2','2020-09-01',1,0.000),(7,'pokus3','2020-09-01',1,0.000),(12,'pokus','2020-09-01',1,0.000),(13,'pokus','2020-09-01',1,0.000),(16,'Magorina','2020-09-01',3,0.000),(17,'Magorina','2020-09-01',3,0.000),(21,'Velka praca','2021-07-01',1,0.000),(22,'Velka praca','2021-07-01',1,0.000),(25,'Velka praca','2021-07-01',1,0.000),(31,'Velka praca','2021-07-01',1,0.000),(32,'Magorina','2020-09-01',3,0.000),(33,'Nova Velka Akcia','2021-08-25',1,0.000),(34,'Test Fin Firmy','2021-08-29',3,0.000),(35,'Dalsia skuska fin den','2021-09-01',3,0.000),(36,'Den ustavy','2021-09-01',3,0.000),(37,'alexa','2021-09-01',3,0.000),(38,'alexa1','2021-09-01',3,0.000),(39,'alexa2','2021-09-01',3,0.000);
/*!40000 ALTER TABLE `schvalene_vykazy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schvalene_vykazy_zamestnanci`
--

DROP TABLE IF EXISTS `schvalene_vykazy_zamestnanci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schvalene_vykazy_zamestnanci` (
  `schvalene_vykazy_zamestnanci_id` int(11) NOT NULL AUTO_INCREMENT,
  `schvalene_vykazy_id` int(11) DEFAULT NULL,
  `meno` varchar(50) DEFAULT NULL,
  `priezvisko` varchar(50) DEFAULT NULL,
  `cislo_zamestnanca_id` int(11) DEFAULT NULL,
  `fixna_odmena` int(11) DEFAULT NULL,
  `fakturovana_suma` int(11) DEFAULT NULL,
  `cas_od` datetime DEFAULT NULL,
  `cas_do` datetime DEFAULT NULL,
  `pocet_hodin` decimal(6,3) DEFAULT NULL,
  `hod_noc` decimal(6,3) DEFAULT NULL,
  `hod_sobota` decimal(6,3) DEFAULT NULL,
  `hod_nedela` decimal(6,3) DEFAULT NULL,
  `hod_sviatok` decimal(6,3) DEFAULT NULL,
  `hod_sobota_noc` decimal(6,3) DEFAULT NULL,
  `hod_nedela_noc` decimal(6,3) DEFAULT NULL,
  `hod_sviatok_noc` decimal(6,3) DEFAULT NULL,
  `hod_sobota_sviatok` decimal(6,3) DEFAULT NULL,
  `hod_nedela_sviatok` decimal(6,3) DEFAULT NULL,
  `hod_sobota_sviatok_noc` decimal(6,3) DEFAULT NULL,
  `hod_nedela_sviatok_noc` decimal(6,3) DEFAULT NULL,
  PRIMARY KEY (`schvalene_vykazy_zamestnanci_id`),
  KEY `schvalene_vykazy_id` (`schvalene_vykazy_id`),
  KEY `cislo_zamestnanca_id` (`cislo_zamestnanca_id`),
  CONSTRAINT `schvalene_vykazy_zamestnanci_ibfk_1` FOREIGN KEY (`schvalene_vykazy_id`) REFERENCES `schvalene_vykazy` (`schvalene_vykazy_id`),
  CONSTRAINT `schvalene_vykazy_zamestnanci_ibfk_2` FOREIGN KEY (`cislo_zamestnanca_id`) REFERENCES `zamestnanci` (`cislo_zamestnanca`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schvalene_vykazy_zamestnanci`
--

LOCK TABLES `schvalene_vykazy_zamestnanci` WRITE;
/*!40000 ALTER TABLE `schvalene_vykazy_zamestnanci` DISABLE KEYS */;
INSERT INTO `schvalene_vykazy_zamestnanci` VALUES (2,5,'miro','savel',111,0,0,'2020-09-01 19:00:00','2020-09-02 04:00:00',9.000,6.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000),(3,6,'miro','savel',111,0,0,'2020-09-01 19:00:00','2020-09-02 04:00:00',9.000,6.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000),(4,7,'miro','savel',111,0,0,'2020-09-01 19:00:00','2020-09-02 04:00:00',9.000,6.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000),(9,12,'miro','savel',111,0,0,'2020-09-01 19:00:00','2020-09-02 04:00:00',9.000,6.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000),(10,13,'miro','savel',111,0,0,'2020-09-01 19:00:00','2020-09-02 04:00:00',9.000,6.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000),(12,16,'miro','savel',111,0,0,'2020-09-01 19:00:00','2020-09-02 04:00:00',9.000,6.000,3.000,0.000,0.000,3.000,0.000,0.000,0.000,0.000,0.000,0.000),(13,17,'miro','savel',111,0,0,'2020-09-01 19:00:00','2020-09-02 04:00:00',9.000,6.000,3.000,0.000,0.000,3.000,0.000,0.000,0.000,0.000,0.000,0.000),(14,17,'miro','savel',111,0,0,'2020-09-01 19:00:00','2020-09-02 04:00:00',9.000,6.000,3.000,0.000,0.000,3.000,0.000,0.000,0.000,0.000,0.000,0.000),(15,17,'miro','savel',111,0,0,'2020-09-01 19:00:00','2020-09-02 04:00:00',9.000,6.000,3.000,0.000,0.000,3.000,0.000,0.000,0.000,0.000,0.000,0.000),(16,17,'miro','savel',111,0,0,'2020-09-01 19:00:00','2020-09-02 04:00:00',9.000,6.000,3.000,0.000,0.000,3.000,0.000,0.000,0.000,0.000,0.000,0.000),(17,17,'miro','savel',111,0,0,'2020-09-01 19:00:00','2020-09-02 04:00:00',9.000,6.000,3.000,0.000,0.000,3.000,0.000,0.000,0.000,0.000,0.000,0.000),(18,17,'miro','savel',111,0,0,'2020-09-01 19:00:00','2020-09-02 04:00:00',9.000,6.000,3.000,0.000,0.000,3.000,0.000,0.000,0.000,0.000,0.000,0.000),(19,17,'miro','savel',111,0,0,'2020-09-01 19:00:00','2020-09-02 04:00:00',9.000,6.000,3.000,0.000,0.000,3.000,0.000,0.000,0.000,0.000,0.000,0.000),(20,17,'miro','savel',111,0,0,'2020-09-01 19:00:00','2020-09-02 04:00:00',9.000,6.000,3.000,0.000,0.000,3.000,0.000,0.000,0.000,0.000,0.000,0.000),(22,17,'miro','savel',111,0,0,'2020-09-01 19:00:00','2020-09-02 04:00:00',9.000,6.000,3.000,0.000,0.000,3.000,0.000,0.000,0.000,0.000,0.000,0.000),(24,17,'miro','savel',111,0,0,'2020-09-01 19:00:00','2020-09-02 04:00:00',9.000,6.000,3.000,0.000,0.000,3.000,0.000,0.000,0.000,0.000,0.000,0.000),(25,17,'miro','savel',111,0,0,'2020-09-01 19:00:00','2020-09-02 04:00:00',9.000,6.000,3.000,0.000,0.000,3.000,0.000,0.000,0.000,0.000,0.000,0.000),(26,17,'miro','savel',111,0,0,'2020-09-01 19:00:00','2020-09-02 04:00:00',9.000,6.000,3.000,0.000,0.000,3.000,0.000,0.000,0.000,0.000,0.000,0.000),(27,17,'miro','savel',111,0,0,'2020-09-01 19:00:00','2020-09-02 04:00:00',9.000,6.000,3.000,0.000,0.000,3.000,0.000,0.000,0.000,0.000,0.000,0.000),(28,17,'miro','savel',111,0,0,'2020-09-01 19:00:00','2020-09-02 04:00:00',9.000,6.000,3.000,0.000,0.000,3.000,0.000,0.000,0.000,0.000,0.000,0.000),(29,17,'miro','savel',111,0,0,'2020-09-01 19:00:00','2020-09-02 04:00:00',9.000,6.000,3.000,0.000,0.000,3.000,0.000,0.000,0.000,0.000,0.000,0.000),(30,17,'miro','savel',111,0,0,'2020-09-01 19:00:00','2020-09-02 04:00:00',9.000,6.000,3.000,0.000,0.000,3.000,0.000,0.000,0.000,0.000,0.000,0.000),(31,17,'miro','savel',111,0,0,'2020-09-01 19:00:00','2020-09-02 04:00:00',9.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000),(32,17,'miro','savel',111,0,0,'2020-09-01 19:00:00','2020-09-02 04:00:00',9.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000),(33,21,'Miro','Savel',111,0,0,'2021-07-01 18:00:00','2021-07-02 02:00:00',6.000,6.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000),(34,21,'Alexander','Dubcek',4,0,0,'2021-07-01 18:00:00','2021-07-02 02:00:00',6.000,6.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000),(35,22,'Miro','Savel',111,0,0,'2021-07-01 18:00:00','2021-07-02 02:00:00',6.000,6.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000),(36,22,'Alexander','Dubcek',4,0,0,'2021-07-01 18:00:00','2021-07-02 02:00:00',6.000,6.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000),(37,25,'Miro','Savel',111,0,0,'2021-07-01 18:00:00','2021-07-02 02:00:00',6.000,6.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000),(38,25,'Alexander','Dubcek',4,0,0,'2021-07-01 18:00:00','2021-07-02 02:00:00',6.000,6.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000),(41,31,'Miro','Savel',111,0,0,'2021-07-01 18:00:00','2021-07-02 02:00:00',6.000,6.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000),(42,31,'Alexander','Dubcek',4,0,0,'2021-07-01 18:00:00','2021-07-02 02:00:00',6.000,6.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000),(43,32,'miro','savel',111,0,0,'2020-09-01 19:00:00','2020-09-02 04:00:00',9.000,6.000,3.000,0.000,0.000,3.000,0.000,0.000,0.000,0.000,0.000,0.000),(44,33,'Miro','Savel',111,0,0,'2021-08-25 18:00:00','2021-08-26 00:00:00',6.000,6.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000),(45,34,'Alexander','Dubcek',4,0,0,'2021-08-29 10:00:00','2021-08-30 10:00:00',24.000,12.000,0.000,0.000,0.000,0.000,12.000,0.000,0.000,0.000,12.000,0.000),(46,34,'Miro','Savel',111,0,0,'2021-08-29 10:00:00','2021-08-30 10:00:00',24.000,12.000,0.000,0.000,0.000,0.000,12.000,0.000,0.000,0.000,0.000,12.000),(47,35,'Miro','Savel',111,0,0,'2021-09-01 10:00:00','2021-09-01 18:00:00',8.000,0.000,0.000,0.000,8.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000),(48,35,'Alexander','Dubcek',4,0,0,'2021-09-01 10:00:00','2021-09-01 18:00:00',0.000,0.000,0.000,0.000,8.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000),(49,36,'Miro','Savel',111,0,0,'2021-09-01 10:00:00','2021-09-01 18:00:00',8.000,0.000,0.000,0.000,8.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000),(50,37,'Alexander','Dubcek',4,0,0,'2021-09-01 10:00:00','2021-09-01 18:00:00',8.000,0.000,0.000,0.000,8.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000),(51,38,'Alexander','Dubcek',4,0,0,'2021-09-01 10:00:00','2021-09-01 18:00:00',8.000,0.000,0.000,0.000,8.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000),(52,39,'Alexander','Dubcek',4,0,0,'2021-09-01 10:00:00','2021-09-01 18:00:00',8.000,0.000,0.000,0.000,8.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000);
/*!40000 ALTER TABLE `schvalene_vykazy_zamestnanci` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER fin_den_zam_insert
AFTER INSERT
   ON schvalene_vykazy_zamestnanci FOR EACH ROW

BEGIN

    DECLARE koef_platu DECIMAL(6,3);
    DECLARE prip_sobota DECIMAL(6,3);
    DECLARE prip_nedela DECIMAL(6,3);
    DECLARE prip_noc DECIMAL(6,3);
    DECLARE prip_sviatok DECIMAL(6,3);
    DECLARE koef_km DECIMAL(6,3);
    DECLARE suma DECIMAL(6,3);
    DECLARE dat_ins DATETIME;
    DECLARE pozn VARCHAR(200);
    #--tu si zadefinujem premenne do ktorych vlozim INSERTOVANE hodnoty
    DECLARE pocet_std_hod DECIMAL(6,3);
    DECLARE suma_std_hod DECIMAL(6,3);
    DECLARE suma_prip_noc DECIMAL(6,3);
    DECLARE suma_prip_sobota DECIMAL(6,3);
    DECLARE suma_prip_nedela DECIMAL(6,3);
    DECLARE suma_prip_sviatok DECIMAL(6,3);
    DECLARE suma_prip_sobota_noc DECIMAL(6,3);
    DECLARE suma_prip_nedela_noc DECIMAL(6,3);
    DECLARE suma_prip_sviatok_noc DECIMAL(6,3);
    DECLARE suma_prip_sobota_sviatok DECIMAL(6,3);
    DECLARE suma_prip_nedela_sviatok DECIMAL(6,3);
    DECLARE suma_prip_sobota_sviatok_noc DECIMAL(6,3);
    DECLARE suma_prip_nedela_sviatok_noc DECIMAL(6,3);

    #--tu si vyberiem koeficienty pre daneho zamestnanca
    SELECT DISTINCT
        Z.koef_platu, Z.priplatok_sobota, Z.priplatok_nedela, Z.priplatok_noc, Z.priplatok_sviatok, Z.koef_km
    INTO 
        koef_platu, prip_sobota, prip_nedela, prip_noc, prip_sviatok, koef_km
    FROM 
        zamestnanci Z
    WHERE  
        Z.cislo_zamestnanca = NEW.cislo_zamestnanca_id;   #--tuto je chyba!!!!! ma problem s tymto nacitanim do obsahu premennych
        #--vyskusaj to s napevno zadanym 111 ako select
        

    #--test
    #--SET koef_platu := 3.000;
    #--SET prip_sobota := 1.000;
    #--SET prip_nedela := 2.000;
    #--SET prip_noc := 4.000;
    #--SET prip_sviatok := 5.000;

    SET suma := 0;
    #--tu si vypocitam aka suma ma byt pripasana na ucet zamestnancovi
    SET dat_ins := current_timestamp(); #--toto uklada iba date ale ja potrebujem datetime
    #--z poctu hodin najprv odratat priplatkove a dostanem hodiny ktore nasobim iba standardnou sadzbou
    SET pocet_std_hod := NEW.pocet_hodin - (NEW.hod_noc + NEW.hod_sobota + NEW.hod_nedela + NEW.hod_sviatok +
                                            NEW.hod_sobota_noc + NEW.hod_nedela_noc + NEW.hod_sviatok_noc +
                                            NEW.hod_sobota_sviatok + NEW.hod_nedela_sviatok + NEW.hod_sobota_sviatok_noc +
                                            NEW.hod_nedela_sviatok_noc);
    SET suma_std_hod := pocet_std_hod * koef_platu;
    #--hodiny ktore sa nasobia iba prip_noc
    SET suma_prip_noc := NEW.hod_noc * prip_noc;
    #--priplatok za pracu iba v sobot
    SET suma_prip_sobota :=  NEW.hod_sobota * prip_sobota;
    #--priplatok iba za pracu v nedelu
    SET suma_prip_nedela := NEW.hod_nedela * prip_nedela;
    #--priplatok iba za pracu v sviatok
    SET suma_prip_sviatok :=  NEW.hod_sviatok * prip_sviatok;
    #--priplatok za pracu v sobota + noc
    SET suma_prip_sobota_noc :=  NEW.hod_sobota_noc * (prip_sobota + prip_noc);
    #--priplatok za pracu v nedela + noc
    SET suma_prip_nedela_noc :=   NEW.hod_nedela_noc * (prip_nedela + prip_noc);
    #--priplatok za pracu v sviatok + noc
    SET suma_prip_sviatok_noc :=   NEW.hod_sviatok_noc * (prip_sviatok + prip_noc); 
    #--priplatok za pracu v sobota + sviatok 
    SET suma_prip_sobota_sviatok  := NEW.hod_sobota_sviatok * (prip_sobota + prip_sviatok);
    #--priplatok za pracu v nedela + sviatok
    SET suma_prip_nedela_sviatok  :=  NEW.hod_nedela_sviatok * (prip_nedela + prip_sviatok);
    #--priplatok za pracu v sobota + sviatok + noc
    SET suma_prip_sobota_sviatok_noc :=  NEW.hod_sobota_sviatok_noc * (prip_sobota + prip_sviatok + prip_noc);
    #--priplatok za pracu v nedela + sviatok + noc 
    SET suma_prip_nedela_sviatok_noc := NEW.hod_nedela_sviatok_noc * (prip_nedela + prip_sviatok + prip_noc);                            

    #--1.9.2021 pridane pocitanie koef * pocet hodin nakolko mi pri alexandrovi hadzalo kktinu ked robil sviatok 8 hod
    SET suma := NEW.pocet_hodin*koef_platu + suma_std_hod + suma_prip_noc + suma_prip_sobota + suma_prip_nedela + suma_prip_sviatok + 
                    suma_prip_sobota_noc + suma_prip_nedela_noc + suma_prip_sviatok_noc + suma_prip_sobota_sviatok +
                    suma_prip_nedela_sviatok + suma_prip_sobota_sviatok_noc + suma_prip_nedela_sviatok_noc;
    SET pozn := 'Vygenerované zo schváleného výkazu';
   


  INSERT INTO fin_den_zam
                (
                    id_fin_den_zam,
                    cislo_zamestnanca, 
                    schvalene_vykazy_id, 
                    meno, 
                    priezvisko, 
                    suma, 
                    typ_zaznamu,
                    dat_ins,
                     pozn
                     ) 
         VALUES 
                (
                    NULL,
                    NEW.cislo_zamestnanca_id, 
                    NEW.schvalene_vykazy_id, 
                    NEW.meno,
                    NEW.priezvisko,
                    suma,
                    true,
                    dat_ins, 
                    pozn
                    ); 

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER fin_den_firmy_insert
AFTER INSERT
   ON schvalene_vykazy_zamestnanci FOR EACH ROW

BEGIN

    DECLARE koef_taxa DECIMAL(6,3);
    DECLARE prip_sobota DECIMAL(6,3);
    DECLARE prip_nedela DECIMAL(6,3);
    DECLARE prip_noc DECIMAL(6,3);
    DECLARE prip_sviatok DECIMAL(6,3);
    DECLARE vybrane_id_firmy INT;

    DECLARE suma DECIMAL(6,3);
    DECLARE dat_ins DATETIME;
    DECLARE pozn VARCHAR(200);
    #--tu si zadefinujem premenne do ktorych vlozim INSERTOVANE hodnoty
    DECLARE pocet_std_hod DECIMAL(6,3);
    DECLARE suma_std_hod DECIMAL(6,3);
    DECLARE suma_prip_noc DECIMAL(6,3);
    DECLARE suma_prip_sobota DECIMAL(6,3);
    DECLARE suma_prip_nedela DECIMAL(6,3);
    DECLARE suma_prip_sviatok DECIMAL(6,3);
    DECLARE suma_prip_sobota_noc DECIMAL(6,3);
    DECLARE suma_prip_nedela_noc DECIMAL(6,3);
    DECLARE suma_prip_sviatok_noc DECIMAL(6,3);
    DECLARE suma_prip_sobota_sviatok DECIMAL(6,3);
    DECLARE suma_prip_nedela_sviatok DECIMAL(6,3);
    DECLARE suma_prip_sobota_sviatok_noc DECIMAL(6,3);
    DECLARE suma_prip_nedela_sviatok_noc DECIMAL(6,3);


    #--tu si vyberiem ID firmy zo schvalene_vykazi_zamestnanci
    #-- select DISTINCT firma from schvalene_vykazy where schvalene_vykazy_id == NEW.schvalene_vykazy_id
    SELECT DISTINCT
        firmy_id
    INTO
        vybrane_id_firmy
	FROM
		schvalene_vykazy
    WHERE
        schvalene_vykazy_id = NEW.schvalene_vykazy_id;

    #--tu si vyberiem koeficienty pre danu firmu
    SELECT DISTINCT
        F.bezna_taxa, F.priplatok_sobota, F.priplatok_nedela, F.priplatok_noc, F.priplatok_sviatok
    INTO 
        koef_taxa, prip_sobota, prip_nedela, prip_noc, prip_sviatok
    FROM 
        firmy F
    WHERE  
        F.firmy_id = vybrane_id_firmy;   #--tuto je chyba!!!!! ma problem s tymto nacitanim do obsahu premennych
        #--vyskusaj to s napevno zadanym 111 ako select
        

    #--test
    #--SET koef_platu := 3.000;
    #--SET prip_sobota := 1.000;
    #--SET prip_nedela := 2.000;
    #--SET prip_noc := 4.000;
    #--SET prip_sviatok := 5.000;

    SET suma := 0;
    #--tu si vypocitam aka suma ma byt pripasana na ucet zamestnancovi
    SET dat_ins := current_timestamp(); #--toto uklada iba date ale ja potrebujem datetime
    #--z poctu hodin najprv odratat priplatkove a dostanem hodiny ktore nasobim iba standardnou sadzbou
    SET pocet_std_hod := NEW.pocet_hodin - (NEW.hod_noc + NEW.hod_sobota + NEW.hod_nedela + NEW.hod_sviatok +
                                            NEW.hod_sobota_noc + NEW.hod_nedela_noc + NEW.hod_sviatok_noc +
                                            NEW.hod_sobota_sviatok + NEW.hod_nedela_sviatok + NEW.hod_sobota_sviatok_noc +
                                            NEW.hod_nedela_sviatok_noc);
    SET suma_std_hod := pocet_std_hod * koef_taxa;
    #--hodiny ktore sa nasobia iba prip_noc
    SET suma_prip_noc := NEW.hod_noc * prip_noc;
    #--priplatok za pracu iba v sobot
    SET suma_prip_sobota :=  NEW.hod_sobota * prip_sobota;
    #--priplatok iba za pracu v nedelu
    SET suma_prip_nedela := NEW.hod_nedela * prip_nedela;
    #--priplatok iba za pracu v sviatok
    SET suma_prip_sviatok :=  NEW.hod_sviatok * prip_sviatok;
    #--priplatok za pracu v sobota + noc
    SET suma_prip_sobota_noc :=  NEW.hod_sobota_noc * (prip_sobota + prip_noc);
    #--priplatok za pracu v nedela + noc
    SET suma_prip_nedela_noc :=   NEW.hod_nedela_noc * (prip_nedela + prip_noc);
    #--priplatok za pracu v sviatok + noc
    SET suma_prip_sviatok_noc :=   NEW.hod_sviatok_noc * (prip_sviatok + prip_noc); 
    #--priplatok za pracu v sobota + sviatok 
    SET suma_prip_sobota_sviatok  := NEW.hod_sobota_sviatok * (prip_sobota + prip_sviatok);
    #--priplatok za pracu v nedela + sviatok
    SET suma_prip_nedela_sviatok  :=  NEW.hod_nedela_sviatok * (prip_nedela + prip_sviatok);
    #--priplatok za pracu v sobota + sviatok + noc
    SET suma_prip_sobota_sviatok_noc :=  NEW.hod_sobota_sviatok_noc * (prip_sobota + prip_sviatok + prip_noc);
    #--priplatok za pracu v nedela + sviatok + noc 
    SET suma_prip_nedela_sviatok_noc := NEW.hod_nedela_sviatok_noc * (prip_nedela + prip_sviatok + prip_noc);                            

    #--doplneny o pocet_hod*koef
    SET suma := NEW.pocet_hodin*koef_taxa +
                    suma_std_hod + suma_prip_noc + suma_prip_sobota + suma_prip_nedela + suma_prip_sviatok + 
                    suma_prip_sobota_noc + suma_prip_nedela_noc + suma_prip_sviatok_noc + suma_prip_sobota_sviatok +
                    suma_prip_nedela_sviatok + suma_prip_sobota_sviatok_noc + suma_prip_nedela_sviatok_noc;
    SET pozn := 'Vygenerované zo schváleného výkazu';
   


  INSERT INTO fin_den_firmy
                (
                    id_fin_den_firmy,
                    firmy_id, 
                    schvalene_vykazy_id,  
                    suma, 
                    typ_zaznamu,
                    dat_ins,
                     pozn
                     ) 
         VALUES 
                (
                    NULL,
                    vybrane_id_firmy, 
                    NEW.schvalene_vykazy_id, 
                    suma,
                    true,
                    dat_ins, 
                    pozn
                    ); 

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `wait_vykazy`
--

DROP TABLE IF EXISTS `wait_vykazy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wait_vykazy` (
  `wait_vykazy_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazov_akcie` varchar(100) DEFAULT NULL,
  `akcia_dat` date DEFAULT NULL,
  `firmy_id` int(11) NOT NULL,
  `ine_naklady` int(11) DEFAULT NULL,
  PRIMARY KEY (`wait_vykazy_id`),
  KEY `firmy_id` (`firmy_id`),
  CONSTRAINT `wait_vykazy_ibfk_1` FOREIGN KEY (`firmy_id`) REFERENCES `firmy` (`firmy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wait_vykazy`
--

LOCK TABLES `wait_vykazy` WRITE;
/*!40000 ALTER TABLE `wait_vykazy` DISABLE KEYS */;
INSERT INTO `wait_vykazy` VALUES (31,'slopanica','2020-09-01',1,10),(33,'Vykladanie tovaru','2020-09-03',3,0),(56,'pokus','2020-09-01',1,0);
/*!40000 ALTER TABLE `wait_vykazy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wait_zamestnanci`
--

DROP TABLE IF EXISTS `wait_zamestnanci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wait_zamestnanci` (
  `wait_zamestnanci_id` int(11) NOT NULL AUTO_INCREMENT,
  `wait_vykazy_id` int(11) DEFAULT NULL,
  `meno` varchar(50) DEFAULT NULL,
  `priezvisko` varchar(50) DEFAULT NULL,
  `fixna_odmena` int(11) DEFAULT NULL,
  `fakturovana_suma` int(11) DEFAULT NULL,
  `cas_od` datetime DEFAULT NULL,
  `cas_do` datetime DEFAULT NULL,
  `pocet_hodin` decimal(6,3) DEFAULT NULL,
  `hod_noc` decimal(6,3) DEFAULT NULL,
  `hod_sobota` decimal(6,3) DEFAULT NULL,
  `hod_nedela` decimal(6,3) DEFAULT NULL,
  `hod_sviatok` decimal(6,3) DEFAULT NULL,
  `hod_sobota_noc` decimal(6,3) DEFAULT NULL,
  `hod_nedela_noc` decimal(6,3) DEFAULT NULL,
  `hod_sviatok_noc` decimal(6,3) DEFAULT NULL,
  `hod_sobota_sviatok` decimal(6,3) DEFAULT NULL,
  `hod_nedela_sviatok` decimal(6,3) DEFAULT NULL,
  `hod_sobota_sviatok_noc` decimal(6,3) DEFAULT NULL,
  `hod_nedela_sviatok_noc` decimal(6,3) DEFAULT NULL,
  PRIMARY KEY (`wait_zamestnanci_id`),
  KEY `wait_vykazy_id` (`wait_vykazy_id`),
  CONSTRAINT `wait_zamestnanci_ibfk_1` FOREIGN KEY (`wait_vykazy_id`) REFERENCES `wait_vykazy` (`wait_vykazy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wait_zamestnanci`
--

LOCK TABLES `wait_zamestnanci` WRITE;
/*!40000 ALTER TABLE `wait_zamestnanci` DISABLE KEYS */;
INSERT INTO `wait_zamestnanci` VALUES (7,56,'miro','savel',0,0,'2020-09-01 19:00:00','2020-09-02 04:00:00',9.000,6.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000);
/*!40000 ALTER TABLE `wait_zamestnanci` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`bytesabre`@`localhost`*/ /*!50003 TRIGGER `wait_zamestnanci_after_insert` AFTER INSERT ON `wait_zamestnanci` FOR EACH ROW BEGIN
    DECLARE vUser varchar(50);

   
   SELECT USER() INTO vUser;

   
   INSERT INTO a01_wait_zamestnanci
   ( a01_wait_zamestnanci_id,
     a01_wait_vykazy_id,
    a01_meno,
    a01_priezvisko,
    a01_fixna_odmena,
    a01_fakturovana_suma,
    a01_cas_od,
    a01_cas_do,
    a01_pocet_hodin,
    a01_hod_noc,
    a01_hod_sobota,
    a01_hod_nedela,
    a01_hod_sviatok,
    a01_hod_sobota_noc,
    a01_hod_nedela_noc,
    a01_hod_sviatok_noc,
    a01_hod_sobota_sviatok,
    a01_hod_nedela_sviatok,
    a01_hod_sobota_sviatok_noc,
    a01_hod_nedela_sviatok_noc,
     a01_dat_ins,
     a01_who)
   VALUES
   ( NEW.wait_zamestnanci_id,
     NEW.wait_vykazy_id,
    NEW.meno,
    NEW.priezvisko,
    NEW.fixna_odmena,
    NEW.fakturovana_suma,
    NEW.cas_od,
    NEW.cas_do,
    NEW.pocet_hodin,
    NEW.hod_noc,
    NEW.hod_sobota,
    NEW.hod_nedela,
    NEW.hod_sviatok,
    NEW.hod_sobota_noc,
    NEW.hod_nedela_noc,
    NEW.hod_sviatok_noc,
    NEW.hod_sobota_sviatok,
    NEW.hod_nedela_sviatok,
    NEW.hod_sobota_sviatok_noc,
    NEW.hod_nedela_sviatok_noc,
     SYSDATE(),
     vUser );

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `zamestnanci`
--

DROP TABLE IF EXISTS `zamestnanci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zamestnanci` (
  `cislo_zamestnanca` int(11) NOT NULL,
  `meno` varchar(100) DEFAULT NULL,
  `priezvisko` varchar(100) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `dat_narodenia` varchar(20) DEFAULT NULL,
  `adresa_tr_pobyt` varchar(250) DEFAULT NULL,
  `adresa_pr_pobyt` varchar(250) DEFAULT NULL,
  `koef_platu` decimal(6,3) DEFAULT NULL,
  `priplatok_sobota` decimal(6,3) DEFAULT NULL,
  `priplatok_nedela` decimal(6,3) DEFAULT NULL,
  `priplatok_noc` decimal(6,3) DEFAULT NULL,
  `priplatok_sviatok` decimal(6,3) DEFAULT NULL,
  `koef_km` decimal(6,3) DEFAULT NULL,
  `rodne_cislo` varchar(20) DEFAULT NULL,
  `cislo_op` varchar(20) DEFAULT NULL,
  `dat_ins` date DEFAULT NULL,
  `dat_upd` date DEFAULT NULL,
  PRIMARY KEY (`cislo_zamestnanca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zamestnanci`
--

LOCK TABLES `zamestnanci` WRITE;
/*!40000 ALTER TABLE `zamestnanci` DISABLE KEYS */;
INSERT INTO `zamestnanci` VALUES (4,'Alexander','Dubcek','87945632','alexander@dubcek.sk','22.11.2000','Bratislava','',4.000,2.000,0.000,3.000,1.000,0.000,'456987','456321',NULL,NULL),(111,'Miro','Savel','+421911653256','test@test.sk','20.1.2001','Jegeho 13, 82108 Bratislava','Jasikova 13, 82108 Bratislava',3.500,1.230,2.370,2.500,1.850,0.500,'gl15324698','hl456123',NULL,NULL),(112,'jozo','jomo','1254','jozo@jozo.sk','1.1.2011','niekde','tam',1.250,2.500,6.200,0.250,1.250,1.250,'646464','2123',NULL,NULL);
/*!40000 ALTER TABLE `zamestnanci` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-06 19:39:23
