CREATE DATABASE  IF NOT EXISTS `webdeve` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `webdeve`;
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.6 (i386)
--
-- Host: 127.0.0.1    Database: webdeve
-- ------------------------------------------------------
-- Server version	5.7.11

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (16,3,'hahaha','savings',50000),(17,3,'Onyok Javi','savings',15950),(22,15,'MangoGraham','savings',100),(23,17,'Meralco','biller',700),(24,17,'PLDT','biller',350),(25,15,'carlomigelb','savings',900);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otp`
--

DROP TABLE IF EXISTS `otp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `otp` (
  `otp_id` int(11) NOT NULL AUTO_INCREMENT,
  `otp` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `date_created` datetime NOT NULL,
  `expiry_date` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`otp_id`,`username`),
  UNIQUE KEY `otp_id_UNIQUE` (`otp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp`
--

LOCK TABLES `otp` WRITE;
/*!40000 ALTER TABLE `otp` DISABLE KEYS */;
INSERT INTO `otp` VALUES (1,'58110854','inigomanalac','2016-04-12 20:32:45','2016-04-12 20:32:45',0),(3,'95713041','inigomanalac','2016-04-12 20:42:15','2016-04-12 20:47:15',0),(4,'88839733','inigomanalac','2016-04-12 20:44:46','2016-04-12 20:49:46',0),(5,'54548241','inigomanalac','2016-04-12 20:46:56','2016-04-12 20:51:56',0),(6,'60499937','inigomanalac','2016-04-12 20:56:08','2016-04-12 21:01:08',0),(7,'13992535','inigomanalac','2016-04-12 20:56:22','2016-04-12 21:01:22',0),(8,'82388553','inigomanalac','2016-04-12 20:57:48','2016-04-12 21:02:48',0),(11,'73108276','carlomij','2016-04-13 06:22:57','2016-04-13 06:27:57',0),(12,'16349888','carlomij','2016-04-13 11:21:59','2016-04-13 11:26:59',0),(13,'26319999','carlomij','2016-04-13 11:37:32','2016-04-13 11:42:32',0),(14,'60919220','carlomij','2016-04-13 11:37:42','2016-04-13 11:42:42',0),(15,'84208459','carlomij','2016-04-13 11:40:46','2016-04-13 11:45:46',0),(16,'32171743','carlomij','2016-04-13 11:42:56','2016-04-13 11:47:56',0),(17,'57003620','carlomij','2016-04-13 12:06:29','2016-04-13 12:11:29',0),(18,'25530853','carlomij','2016-04-13 12:06:40','2016-04-13 12:11:40',0),(19,'82614698','carlomij','2016-04-13 12:10:28','2016-04-13 12:15:28',0),(20,'42116208','carlomij','2016-04-13 12:14:28','2016-04-13 12:19:28',0),(21,'74925547','carlomij','2016-04-13 12:17:42','2016-04-13 12:22:42',0),(22,'53814484','carlomij','2016-04-13 12:18:21','2016-04-13 12:23:21',0),(23,'67165312','carlomij','2016-04-13 12:27:10','2016-04-13 12:32:10',0),(24,'66723713','carlomij','2016-04-13 12:27:28','2016-04-13 12:32:28',0),(25,'25033177','carlomij','2016-04-13 12:41:55','2016-04-13 12:46:55',0),(26,'54518096','carlomij','2016-04-13 13:01:36','2016-04-13 13:06:36',0),(27,'86871866','carlomij','2016-04-13 13:02:18','2016-04-13 13:07:18',0),(28,'48028603','carlomij','2016-04-13 13:02:45','2016-04-13 13:07:45',0),(29,'36181894','carlomij','2016-04-13 13:03:28','2016-04-13 13:08:28',0),(30,'11896289','carlomij','2016-04-13 13:05:35','2016-04-13 13:10:35',0),(31,'93955995','carlomij','2016-04-13 13:06:09','2016-04-13 13:11:09',0),(32,'39974760','carlomij','2016-04-13 13:42:34','2016-04-13 13:47:34',0),(33,'75745183','carlomij','2016-04-13 14:02:37','2016-04-13 14:07:37',0),(34,'36085764','carlomij','2016-04-13 14:09:03','2016-04-13 14:14:03',0),(35,'52748373','carlomij','2016-04-13 14:10:50','2016-04-13 14:15:50',0),(36,'26108213','carlomij','2016-04-13 14:42:44','2016-04-13 14:47:44',0),(37,'59502652','carlomij','2016-04-13 14:52:23','2016-04-13 14:57:23',0),(38,'81935344','carlomij','2016-04-13 15:01:45','2016-04-13 15:06:45',0),(39,'61083287','carlomij','2016-04-13 15:14:13','2016-04-13 15:19:13',0),(40,'15161689','carlomij','2016-04-13 15:22:20','2016-04-13 15:27:20',0),(41,'49768689','carlomij','2016-04-13 16:34:43','2016-04-13 16:39:43',0),(42,'71880094','carlomij','2016-04-13 16:48:31','2016-04-13 16:53:31',0),(43,'71640749','admin','2016-04-13 18:09:17','2016-04-13 18:14:17',0),(44,'62864928','carlomij','2016-04-13 18:09:49','2016-04-13 18:14:49',0),(45,'14738741','admin','2016-04-13 18:24:19','2016-04-13 18:29:19',0),(46,'87142857','admin','2016-04-13 18:30:07','2016-04-13 18:35:07',0),(47,'96647998','admin','2016-04-13 19:11:52','2016-04-13 19:16:52',0),(48,'81013005','carlomij','2016-04-13 19:22:51','2016-04-13 19:27:51',0),(49,'14524222','carlomij','2016-04-13 19:58:06','2016-04-13 20:03:06',0),(50,'52171748','carlomij','2016-04-13 23:00:20','2016-04-13 23:05:20',0),(51,'34730942','carlomij','2016-04-13 23:06:03','2016-04-13 23:11:03',0),(52,'70344764','carlomij','2016-04-13 23:45:29','2016-04-13 23:50:29',0),(53,'14903664','carlomij','2016-04-14 01:09:01','2016-04-14 01:14:01',1),(54,'62054104','carlomij','2016-04-14 01:09:45','2016-04-14 01:14:45',1),(55,'13054779','carlomij','2016-04-14 02:08:21','2016-04-14 02:13:21',1),(56,'87516944','carlomij','2016-04-14 02:21:42','2016-04-14 02:26:42',0),(57,'25173065','carlomij','2016-04-14 02:27:27','2016-04-14 02:32:27',1),(58,'93157680','carlomij','2016-04-14 02:28:02','2016-04-14 02:33:02',0),(59,'28161614','carlomij','2016-04-14 02:34:44','2016-04-14 02:39:44',1),(60,'11159460','carlomij','2016-04-14 02:44:42','2016-04-14 02:49:42',1),(61,'65453795','carlomij','2016-04-14 02:48:00','2016-04-14 02:53:00',1);
/*!40000 ALTER TABLE `otp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `idTransaction` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `idAccount` int(11) NOT NULL,
  `accountName` varchar(45) NOT NULL,
  `postingDate` date NOT NULL,
  `description` longtext NOT NULL,
  `amount` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  `runningBalance` int(11) NOT NULL,
  PRIMARY KEY (`idTransaction`),
  KEY `idUser_idx` (`idUser`),
  KEY `idAccount_idx` (`idAccount`),
  CONSTRAINT `idUser_T` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (7,15,22,'MangoGraham','2016-04-14','You have sent PHP300 from [MangoGraham] to [carlomigelb]',300,'Credit',400),(8,15,22,'MangoGraham','2016-04-14','You have payed your bills to Meralco with a total amount of PHP300 from [MangoGraham]',300,'Credit',100),(9,15,25,'carlomigelb','2016-04-14','You have sent PHP200 from [carlomigelb] to [Onyok Javi]',200,'Credit',1050),(10,15,25,'carlomigelb','2016-04-14','You have sent PHP50 from [carlomigelb] to [Onyok Javi]',50,'Credit',1000),(11,15,25,'carlomigelb','2016-04-14','You have sent PHP100 from [carlomigelb] to [Onyok Javi]',100,'Credit',900);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,'inigomanalac','9853001c97ea3e83240ffb4b150125ccd1e9839f4c458b31f19a5693c130b408','Miguel','Manalac','igiemanalac@gmail.com','09177011410',NULL,'male'),(9,'antonioluna','54f3ebc9d00ce107fbaa9e729f9996cda43dd4e75717187848828f8ddc540750','Antonio','Luna','antonio_luna@gmail.com','09123456789',NULL,'male'),(10,'dionisiabersosa','54f3ebc9d00ce107fbaa9e729f9996cda43dd4e75717187848828f8ddc540750','Dionisia','Bersosa','dionisia_bersosa@gmail.com','09123456789',NULL,'female'),(11,'bawbaw','54f3ebc9d00ce107fbaa9e729f9996cda43dd4e75717187848828f8ddc540750','Baw','Tista','bawbaw@gmail.com','09123456789',NULL,'male'),(15,'carlomij','a36d22c73d208f6f041e15bb2959ab6f834b5ccf632bbf6a4ad8fffbadba9386','Carlo Migel','Bautista','carlomigelb@gmail.com','09271506875',NULL,'male'),(17,'admin','3b612c75a7b5048a435fb6ec81e52ff92d6d795a8b5a9c17070f6a63c97a53b2','Peso','Admin','carlomij@gmail.com','09283748593',NULL,'male');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'webdeve'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-14  2:51:03
