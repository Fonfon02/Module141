-- MySQL dump 10.17  Distrib 10.3.23-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db104_1
-- ------------------------------------------------------
-- Server version	10.3.23-MariaDB-0+deb10u1

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

-- Recreate
DROP DATABASE IF EXISTS db104_1;
CREATE DATABASE IF NOT EXISTS db104_1;

--
-- Table structure for table `t_associer`
--

DROP TABLE IF EXISTS `t_associer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_associer` (
  `id_associer` int(11) NOT NULL AUTO_INCREMENT,
  `fk_fonction` int(11) NOT NULL,
  `fk_sonde` int(11) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`id_associer`),
  KEY `fk_fonction` (`fk_fonction`),
  KEY `fk_fonction_2` (`fk_fonction`,`fk_sonde`),
  KEY `fk_sonde` (`fk_sonde`),
  CONSTRAINT `t_associer_ibfk_1` FOREIGN KEY (`fk_fonction`) REFERENCES `t_fonction` (`id_fonction`),
  CONSTRAINT `t_associer_ibfk_2` FOREIGN KEY (`fk_sonde`) REFERENCES `t_sonde` (`id_sonde`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_associer`
--

LOCK TABLES `t_associer` WRITE;
/*!40000 ALTER TABLE `t_associer` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_associer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_choix_fonct`
--

DROP TABLE IF EXISTS `t_choix_fonct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_choix_fonct` (
  `id_choix_fonct` int(11) NOT NULL AUTO_INCREMENT,
  `fk_client` int(11) NOT NULL,
  `fk_fonction` int(11) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`id_choix_fonct`),
  KEY `fk_client` (`fk_client`,`fk_fonction`),
  KEY `fk_fonction` (`fk_fonction`),
  CONSTRAINT `t_choix_fonct_ibfk_1` FOREIGN KEY (`fk_client`) REFERENCES `t_client` (`id_client`),
  CONSTRAINT `t_choix_fonct_ibfk_2` FOREIGN KEY (`fk_fonction`) REFERENCES `t_fonction` (`id_fonction`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_choix_fonct`
--

LOCK TABLES `t_choix_fonct` WRITE;
/*!40000 ALTER TABLE `t_choix_fonct` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_choix_fonct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_client`
--

DROP TABLE IF EXISTS `t_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_client` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  `Prénom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_client`
--

LOCK TABLES `t_client` WRITE;
/*!40000 ALTER TABLE `t_client` DISABLE KEYS */;
INSERT INTO `t_client` VALUES (3,'Thierry','Leblanc'),(10,'Jean','Naimarre');
/*!40000 ALTER TABLE `t_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_desassocier`
--

DROP TABLE IF EXISTS `t_desassocier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_desassocier` (
  `id_desassocier` int(11) NOT NULL AUTO_INCREMENT,
  `fk_fonction` int(11) NOT NULL,
  `fk_sonde` int(11) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`id_desassocier`),
  KEY `fk_fonction` (`fk_fonction`,`fk_sonde`),
  KEY `fk_sonde` (`fk_sonde`),
  CONSTRAINT `t_desassocier_ibfk_1` FOREIGN KEY (`fk_fonction`) REFERENCES `t_fonction` (`id_fonction`),
  CONSTRAINT `t_desassocier_ibfk_2` FOREIGN KEY (`fk_sonde`) REFERENCES `t_sonde` (`id_sonde`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_desassocier`
--

LOCK TABLES `t_desassocier` WRITE;
/*!40000 ALTER TABLE `t_desassocier` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_desassocier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_entreprise`
--

DROP TABLE IF EXISTS `t_entreprise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_entreprise` (
  `id_entreprise` int(11) NOT NULL AUTO_INCREMENT,
  `Entreprise` varchar(35) NOT NULL,
  PRIMARY KEY (`id_entreprise`),
  UNIQUE KEY `Entreprise` (`Entreprise`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_entreprise`
--

LOCK TABLES `t_entreprise` WRITE;
/*!40000 ALTER TABLE `t_entreprise` DISABLE KEYS */;
INSERT INTO `t_entreprise` VALUES (18,'AutreEntreprise'),(15,'Entreprise');
/*!40000 ALTER TABLE `t_entreprise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_faire_partie`
--

DROP TABLE IF EXISTS `t_faire_partie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_faire_partie` (
  `id_faire_partie` int(11) NOT NULL AUTO_INCREMENT,
  `fk_client` int(11) NOT NULL,
  `fk_entreprise` int(11) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`id_faire_partie`),
  KEY `fk_client` (`fk_client`,`fk_entreprise`),
  KEY `fk_entreprise` (`fk_entreprise`),
  CONSTRAINT `t_faire_partie_ibfk_1` FOREIGN KEY (`fk_client`) REFERENCES `t_client` (`id_client`),
  CONSTRAINT `t_faire_partie_ibfk_2` FOREIGN KEY (`fk_entreprise`) REFERENCES `t_entreprise` (`id_entreprise`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_faire_partie`
--

LOCK TABLES `t_faire_partie` WRITE;
/*!40000 ALTER TABLE `t_faire_partie` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_faire_partie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_fonction`
--

DROP TABLE IF EXISTS `t_fonction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_fonction` (
  `id_fonction` int(11) NOT NULL AUTO_INCREMENT,
  `Fonction` varchar(20) NOT NULL,
  PRIMARY KEY (`id_fonction`),
  UNIQUE KEY `Fonction` (`Fonction`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_fonction`
--

LOCK TABLES `t_fonction` WRITE;
/*!40000 ALTER TABLE `t_fonction` DISABLE KEYS */;
INSERT INTO `t_fonction` VALUES (7,'Air Pressure'),(5,'Air Temperature'),(9,'AMS 2000'),(6,'Dew Point'),(11,'GFS 3000 - Direct'),(10,'GFS 3000 - LON'),(13,'Heater / Pump'),(1,'Precipitation KNI'),(2,'Precipitation WMO'),(12,'RCM500NT'),(4,'Relative Humidity'),(3,'Visibility'),(8,'Wind (Optional)');
/*!40000 ALTER TABLE `t_fonction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sonde`
--

DROP TABLE IF EXISTS `t_sonde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_sonde` (
  `id_sonde` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(20) NOT NULL,
  `NrItem` double NOT NULL,
  `Prix` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id_sonde`),
  UNIQUE KEY `Nom` (`Nom`),
  UNIQUE KEY `NrItem` (`NrItem`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sonde`
--

LOCK TABLES `t_sonde` WRITE;
/*!40000 ALTER TABLE `t_sonde` DISABLE KEYS */;
INSERT INTO `t_sonde` VALUES (1,'NI/SH 3000 ',5100004805,700),(2,'NI/SH 3000 LON',5100004815,650),(3,'NI/SH 2000 ',5100004810,550),(4,'PV',5100004825,250),(7,'RH',5100004830,650),(8,'PV-AP',5100004850,700),(9,'PV-RH',5100004855,820),(10,'PV-RH-AP',5100004860,860),(11,'P',5100004905,450),(12,'P-AP',5100004925,350),(13,'P-RH',5100004930,470),(14,'P-RH-AP',5100004935,510),(15,'RH-AP',5100005025,480);
/*!40000 ALTER TABLE `t_sonde` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-09 20:27:02
