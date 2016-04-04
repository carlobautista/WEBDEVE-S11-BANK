CREATE DATABASE  IF NOT EXISTS `webdeve` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `webdeve`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: webdeve
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `idAccount` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `balance` int(11) NOT NULL,
  PRIMARY KEY (`idAccount`),
  KEY `idUser_idx` (`idUser`),
  CONSTRAINT `idUser_A` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (15,3,'Miguel Javiniar','savings',130000),(16,3,'hahaha','savings',55000),(17,3,'Onyok Javi','savings',30000);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `idTransaction` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `idAccount` int(11) NOT NULL,
  `accountName` varchar(45) NOT NULL,
  `postingDate` date NOT NULL,
  `description` varchar(45) NOT NULL,
  `amount` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  `runningBalance` varchar(45) NOT NULL,
  PRIMARY KEY (`idTransaction`),
  KEY `idUser_idx` (`idUser`),
  KEY `idAccount_idx` (`idAccount`),
  CONSTRAINT `idAccount_T` FOREIGN KEY (`idAccount`) REFERENCES `account` (`idAccount`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idUser_T` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(64) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `emailAddress` varchar(45) NOT NULL,
  `mobileNumber` varchar(11) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(45) NOT NULL DEFAULT 'Male',
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `emailAddress_UNIQUE` (`emailAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,'inigomanalac','9853001c97ea3e83240ffb4b150125ccd1e9839f4c458b31f19a5693c130b408','Miguel','Manalac','igiemanalac@gmail.com','09177011410',NULL,'male'),(9,'antonioluna','54f3ebc9d00ce107fbaa9e729f9996cda43dd4e75717187848828f8ddc540750','Antonio','Luna','antonio_luna@gmail.com','09123456789',NULL,'male'),(10,'dionisiabersosa','54f3ebc9d00ce107fbaa9e729f9996cda43dd4e75717187848828f8ddc540750','Dionisia','Bersosa','dionisia_bersosa@gmail.com','09123456789',NULL,'female');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-05  1:24:31
