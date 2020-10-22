-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: edufund
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.14-MariaDB

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
  `acc_id` int(4) NOT NULL AUTO_INCREMENT,
  `password` varchar(999) NOT NULL,
  `email` varchar(55) NOT NULL,
  `phone_number` varchar(55) NOT NULL,
  `status` varchar(55) NOT NULL,
  PRIMARY KEY (`acc_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'angela123','angela@gmail.com','89743232','Active'),(2,'jacky123','jacky@gmail.com','89632332','Active'),(5,'33b2c413c2db862b456d183bc1af81d79be6a693013dc5aef66e5e9','cloud@gmail.com','124','Active'),(6,'59a0851423c3bed7438fe2c10f2a126a6c95c8ba600ceba6a16d443','jovita.sutanto97@gmail.com','215451677','Active'),(76,'admin123','squall93@gmail.com','12345','Disactive'),(77,'admin123','tidus93@gmail.com','12345','Disactive'),(84,'admin123','love21@gmail.com','12345877','Disactive'),(85,'admin123','love22@gmail.com','123458727','Disactive'),(86,'admin123','love223@gmail.com','1234587277','Disactive'),(91,'9a365b0597e198ceac41966db1d6f47de66a86bb99e3e5a811c3030','franky.sutanto93@gmail.com','1242','Active'),(92,'e4671fcdc5509e8bf837bb19bb0eb77044aeaca9418fa9e49cf2376','jovitasutanto98@gmail.com','0895333940620','Active');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `Address_ID` int(10) NOT NULL AUTO_INCREMENT,
  `Profile_ID` int(11) NOT NULL,
  `Village_ID` int(11) NOT NULL,
  `Province_ID` int(11) NOT NULL,
  `Street` varchar(55) NOT NULL,
  `Number` int(10) NOT NULL,
  `RT` int(10) NOT NULL,
  `RW` int(10) NOT NULL,
  `City` varchar(55) NOT NULL,
  `SubDistrict` varchar(55) NOT NULL,
  `PostalCode` int(20) NOT NULL,
  `ResidentialStatus` varchar(55) NOT NULL,
  `Duration` int(10) NOT NULL,
  `ProofOfResidence` varchar(55) NOT NULL,
  PRIMARY KEY (`Address_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,0,0,0,'Jl Asoka Raya ',5,7,12,'Jakarta Barat','Kalideres',11880,'Pribadi',3,'sertifikat rumah'),(8,10,1,1,'Jakarta Barat',123456789,11850,11082,'Jakarta','test',11850,'Active',20,'Test'),(11,11,3,1,'Jalan dharma griya v',79,7,12,'Jakarta Barat','Semanan',11850,'Active',20,'House');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emergencycontact`
--

DROP TABLE IF EXISTS `emergencycontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emergencycontact` (
  `ID_EmergencyContact` int(10) NOT NULL AUTO_INCREMENT,
  `Profile_ID` int(11) NOT NULL,
  `Name` varchar(55) NOT NULL,
  `Phone` varchar(55) NOT NULL,
  `Relationship` varchar(55) NOT NULL,
  `Status` varchar(55) NOT NULL,
  `CreatedAt` date DEFAULT NULL,
  `CreatedBy` varchar(55) DEFAULT NULL,
  `UpdatedAt` date DEFAULT NULL,
  `UpdatedBy` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`ID_EmergencyContact`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emergencycontact`
--

LOCK TABLES `emergencycontact` WRITE;
/*!40000 ALTER TABLE `emergencycontact` DISABLE KEYS */;
INSERT INTO `emergencycontact` VALUES (10,10,'Jovita','0812123','No','Active','2020-10-05','10','2020-10-05','10'),(13,11,'Jess','485859','Cousin','Active','2020-10-10','11','2020-10-10','11');
/*!40000 ALTER TABLE `emergencycontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `invoice_id` int(10) NOT NULL AUTO_INCREMENT,
  `Loan_id` int(100) NOT NULL,
  `InstallmentNumber` int(100) NOT NULL,
  `Amount` decimal(18,2) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `DueDate` date NOT NULL,
  `CreatedAt` date NOT NULL,
  `CreatedBy` varchar(55) NOT NULL,
  `UpdatedAt` date DEFAULT NULL,
  `UpdatedBy` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (13,86,1,983333.33,'Not Paid','2020-11-22','2020-10-22','91',NULL,NULL),(14,86,2,983333.33,'Not Paid','2020-12-22','2020-10-22','91',NULL,NULL),(15,86,3,983333.33,'Not Paid','2021-01-22','2020-10-22','91',NULL,NULL),(16,86,4,983333.33,'Not Paid','2021-02-22','2020-10-22','91',NULL,NULL),(17,86,5,983333.33,'Not Paid','2021-03-22','2020-10-22','91',NULL,NULL),(18,86,6,983333.33,'Not Paid','2021-04-22','2020-10-22','91',NULL,NULL),(19,86,7,983333.33,'Not Paid','2021-05-22','2020-10-22','91',NULL,NULL),(20,86,8,983333.33,'Not Paid','2021-06-22','2020-10-22','91',NULL,NULL),(21,86,9,983333.33,'Not Paid','2021-07-22','2020-10-22','91',NULL,NULL),(22,86,10,983333.33,'Not Paid','2021-08-22','2020-10-22','91',NULL,NULL),(23,86,11,983333.33,'Not Paid','2021-09-22','2020-10-22','91',NULL,NULL),(24,86,12,983333.33,'Not Paid','2021-10-22','2020-10-22','91',NULL,NULL);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan` (
  `Loan_id` int(10) NOT NULL AUTO_INCREMENT,
  `acc_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `loan_status_id` int(11) DEFAULT NULL,
  `AgreementDate` date DEFAULT NULL,
  `DisbursementDate` date DEFAULT NULL,
  `periodtime` int(10) DEFAULT NULL,
  `Interest` decimal(18,1) DEFAULT NULL,
  `amount_without_interest` decimal(18,2) DEFAULT NULL,
  `totalamount` decimal(18,2) DEFAULT NULL,
  `DueAmount` int(20) DEFAULT NULL,
  `DateAmount` date DEFAULT NULL,
  `DueDateAmount` date DEFAULT NULL,
  `LoanQuality` varchar(25) DEFAULT NULL,
  `LoanStatus` varchar(25) DEFAULT NULL,
  `Reason` varchar(55) DEFAULT NULL,
  `CreatedAt` date DEFAULT NULL,
  `CreatedBy` varchar(55) DEFAULT NULL,
  `UpdatedAt` date DEFAULT NULL,
  `UpdatedBy` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`Loan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (83,92,1,1,'2020-10-10','2020-10-10',12,1.5,5200000.00,6136000.00,5200000,'2020-10-18','2021-10-18','Good','Done','ingin bayar uang pangkal','2020-10-18','jovitasutanto98@gmail.com',NULL,NULL),(84,92,1,1,'2020-10-10','2020-10-10',12,1.5,5200000.00,6136000.00,5200000,'2020-10-18','2021-10-18','Good','Done','ingin bayar uang pangkal','2020-10-18','jovitasutanto98@gmail.com',NULL,NULL),(85,92,1,1,'2020-10-10','2020-10-10',12,1.5,5200000.00,6136000.00,5200000,'2020-10-18','2021-10-18','Good','Done','ingin bayar uang pangkal','2020-10-18','jovitasutanto98@gmail.com',NULL,NULL),(86,91,1,1,'2020-10-19','2020-10-19',12,1.5,10000000.00,11800000.00,10000000,'2020-10-22','2021-10-22','Good','Approved','Ingin bayar uang pangkal kuliah','2020-10-22','franky.sutanto93@gmail.com',NULL,NULL);
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loanstatus`
--

DROP TABLE IF EXISTS `loanstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loanstatus` (
  `LoanStatusID` int(10) NOT NULL AUTO_INCREMENT,
  `StatusName` varchar(55) NOT NULL,
  `Status` varchar(55) NOT NULL,
  `CreatedAt` date NOT NULL,
  `CreatedBy` varchar(55) NOT NULL,
  `UpdatedAt` date NOT NULL,
  `UpdatedBy` varchar(55) NOT NULL,
  PRIMARY KEY (`LoanStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loanstatus`
--

LOCK TABLES `loanstatus` WRITE;
/*!40000 ALTER TABLE `loanstatus` DISABLE KEYS */;
INSERT INTO `loanstatus` VALUES (1,'In Process','Active','2020-09-20','SYSTEM','0000-00-00','');
/*!40000 ALTER TABLE `loanstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `product_id` int(10) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `CreatedAt` date NOT NULL,
  `CreatedBy` varchar(50) NOT NULL,
  `UpdatedAt` date NOT NULL,
  `UpdatedBy` varchar(50) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'collage','active','2020-09-19','SYSTEM','0000-00-00','');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `profile_id` int(10) NOT NULL AUTO_INCREMENT,
  `acc_id` int(11) NOT NULL,
  `idcardnumber` varchar(16) NOT NULL,
  `placeofbirth` varchar(50) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `Gender` enum('L','P') DEFAULT NULL,
  `Religion` enum('Kristen','Katolik','Islam','Hindu','Buddha') DEFAULT NULL,
  `ImageKTP` varchar(55) DEFAULT NULL,
  `ImageSelfie` varchar(55) DEFAULT NULL,
  `StatusMarriage` enum('Married','Not Married') DEFAULT NULL,
  `Education` enum('D3','S1','S2','S3') DEFAULT NULL,
  `TaxID` tinyint(11) DEFAULT NULL,
  `ImageFamilyMemberCard` varchar(55) DEFAULT NULL,
  `Occupation` varchar(55) DEFAULT NULL,
  `Fields` varchar(20) DEFAULT NULL,
  `Position` varchar(25) DEFAULT NULL,
  `StatusOfEmployment` varchar(55) DEFAULT NULL,
  `ProofOfEmployment` varchar(55) DEFAULT NULL,
  `ProofOfIncome` varchar(55) DEFAULT NULL,
  `ProofOfBusiness` varchar(55) DEFAULT NULL,
  `ProofOfBusinessIncome` varchar(55) DEFAULT NULL,
  `Type` varchar(20) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `CreatedAt` date NOT NULL,
  `CreatedBy` varchar(55) NOT NULL,
  `UpdatedAt` date DEFAULT NULL,
  `UpdatedBy` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (3,83,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-01','admin',NULL,NULL),(4,85,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-01','admin',NULL,NULL),(5,86,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-27','love223@gmail.com',NULL,NULL),(6,87,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-10-02','franky.sutanto93@gmail.',NULL,NULL),(7,88,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-10-02','franky.sutanto93@gmail.',NULL,NULL),(8,89,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-10-03','franky.sutanto93@gmail.com',NULL,NULL),(9,90,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-10-03','frankys.sutanto93@gmail.com',NULL,NULL),(10,91,'12344556','Jakarta','1993-08-16','L','Kristen','','','Not Married','S1',1,'','Indonesia','test','IT','Active','test','test','test','test','Data','Active','2020-10-03','franky.sutanto93@gmail.com','2020-10-05','10'),(11,92,'3173044410970002','Jakarta','1997-10-04','P','Kristen','...','...','Not Married','S1',1,'...','Indonesia','WNI','Technology','Intern','Internship','1000000','Store','1000000','Data','Active','2020-10-10','jovitasutanto98@gmail.com','2020-10-10','11');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province` (
  `Province_ID` int(10) NOT NULL AUTO_INCREMENT,
  `Province_Name` varchar(55) NOT NULL,
  `CreatedAt` date NOT NULL,
  `CreatedBy` varchar(55) NOT NULL,
  `UpdatedAt` date NOT NULL,
  `UpdatedBy` varchar(55) NOT NULL,
  PRIMARY KEY (`Province_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (1,'DKI Jakarta','2020-08-19','SYSTEM','0000-00-00',''),(2,'Jawa Barat','2020-08-19','SYSTEM','0000-00-00',''),(3,'Jawa Tengah','2020-10-14','SYSTEM','0000-00-00',''),(4,'Jawa Timur','2020-10-14','SYSTEM','0000-00-00','');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simulation_helper`
--

DROP TABLE IF EXISTS `simulation_helper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simulation_helper` (
  `simulation_id` int(11) NOT NULL,
  `acc_id` int(4) DEFAULT NULL,
  `balance` decimal(18,2) DEFAULT NULL,
  `principal` decimal(18,2) DEFAULT NULL,
  `interest` decimal(18,2) DEFAULT NULL,
  `installments` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`simulation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simulation_helper`
--

LOCK TABLES `simulation_helper` WRITE;
/*!40000 ALTER TABLE `simulation_helper` DISABLE KEYS */;
/*!40000 ALTER TABLE `simulation_helper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `village`
--

DROP TABLE IF EXISTS `village`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `village` (
  `Village_ID` int(10) NOT NULL AUTO_INCREMENT,
  `Village_Name` varchar(55) NOT NULL,
  `CreatedAt` date NOT NULL,
  `CreatedBy` varchar(55) NOT NULL,
  `UpdatedAt` date NOT NULL,
  `UpdatedBy` varchar(55) NOT NULL,
  PRIMARY KEY (`Village_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `village`
--

LOCK TABLES `village` WRITE;
/*!40000 ALTER TABLE `village` DISABLE KEYS */;
INSERT INTO `village` VALUES (1,'Grogol','2020-09-19','SYSTEM','0000-00-00',''),(2,'Taman Sari','2020-09-19','SYSTEM','0000-00-00',''),(3,'Cengkareng','2020-09-19','SYSTEM','0000-00-00','');
/*!40000 ALTER TABLE `village` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'edufund'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetDataAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDataAccount`(IN `email` VARCHAR(55), IN `password` VARCHAR(55))
BEGIN

	SELECT email, password, acc_id 
 	FROM account
	WHERE account.email = email and account.password = password
    and account.status = 'Active';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDataAllLoanStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDataAllLoanStatus`()
BEGIN
	SELECT LoanStatusID, StatusName
    FROM loanstatus
    WHERE loanstatus.Status = 'Active';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDataAllProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDataAllProduct`()
BEGIN
	SELECT product_id, product_name, status from product;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDataAllProvince` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDataAllProvince`()
BEGIN
	SELECT Province_ID, Province_Name FROM province;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDataAllVillage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDataAllVillage`()
BEGIN
	SELECT Village_ID, Village_Name FROM village;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetProfileAccountByEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetProfileAccountByEmail`(IN `email` VARCHAR(55))
BEGIN
	DECLARE AccountId INT DEFAULT 0;
	DECLARE ProfileId INT DEFAULT 0;
    
    SELECT acc_id into AccountId
    FROM account
	WHERE account.email = email;

    SELECT profile_id into ProfileId
    FROM profile
	WHERE profile.acc_id = AccountId;

	SELECT `profile`.`profile_id`,`profile`.`acc_id`,`profile`.`idcardnumber`,`profile`.`placeofbirth`,`profile`.`dateofbirth`,
    `profile`.`Gender`,`profile`.`Religion`,`profile`.`ImageKTP`,`profile`.`ImageSelfie`,`profile`.`StatusMarriage`,`profile`.`Education`,
    `profile`.`TaxID`,`profile`.`ImageFamilyMemberCard`,`profile`.`Occupation`,`profile`.`Fields`,`profile`.`Position`,`profile`.`StatusOfEmployment`,`profile`.`ProofOfEmployment`,
    `profile`.`ProofOfIncome`,`profile`.`ProofOfBusiness`,`profile`.`ProofOfBusinessIncome`,`profile`.`Type`,
    `profile`.`Status`,`profile`.`CreatedAt`,`profile`.`CreatedBy`,`profile`.`UpdatedAt`,`profile`.`UpdatedBy`,
	
	`address`.`Address_ID`,`address`.`Profile_ID`,`address`.`Village_ID`,
    `address`.`Province_ID`,`address`.`Street`,`address`.`Number`,`address`.`RT`,`address`.`RW`,
    `address`.`City`,`address`.`SubDistrict`,`address`.`PostalCode`,`address`.`ResidentialStatus`,
    `address`.`Duration`,`address`.`ProofOfResidence`,
     
	`emergencycontact`.`ID_EmergencyContact`,`emergencycontact`.`Profile_ID`,
    `emergencycontact`.`Name`,`emergencycontact`.`Phone`,`emergencycontact`.`Relationship`

	FROM `edufund`.`profile`
    LEFT JOIN `edufund`.`address` ON `edufund`.`profile`.`profile_id` = `edufund`.`address`.`Profile_ID`
    LEFT JOIN `edufund`.`emergencycontact` ON `edufund`.`profile`.`profile_id` = `edufund`.`emergencycontact`.`Profile_ID`
	WHERE `edufund`.`profile`.`profile_id` = ProfileId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertInvoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertInvoice`(in Loan_id int, in acc_id int, in InstallmentNumber int, in Amount decimal(18,2), in Status varchar(45), in DueDate DATE)
BEGIN

INSERT INTO `edufund`.`invoice`
(`Loan_id`,`InstallmentNumber`, `Amount`,`Status`,`DueDate`,`CreatedAt`,`CreatedBy`)
VALUES
(Loan_id, InstallmentNumber, Amount, Status, DueDate, CURDATE(), acc_id);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertLoan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertLoan`(in `email` varchar(55), in product_id int, in loan_status_id int, in AgreementDate DATE, in DisbursementDate DATE,
in periodtime int, in interest decimal(18,1), in amount_without_interest decimal(18,2), in totalamount decimal(18,2), in DueAmount decimal(18,2), in DateAmount DATE,
in DueDateAmount DATE, in LoanQuality VARCHAR(25), in LoanStatus VARCHAR(25),
in Reason varchar(55))
BEGIN
    DECLARE AccountId INT DEFAULT 0;
    DECLARE TotalLoanProcess INT DEFAULT 0;

    SELECT acc_id into AccountId
    FROM account
	WHERE account.email = email;

    SELECT COUNT(*) into TotalLoanProcess
	FROM loan
	WHERE loan.LoanStatus = 'In Process' || loan.LoanStatus = 'Approved';
    
	IF(TotalLoanProcess = 0) THEN
		insert into loan(`acc_id`,`product_id`,`loan_status_id`,
		`AgreementDate`,`DisbursementDate`,`periodtime`,`Interest`,`amount_without_interest`,
		`totalamount`,`DueAmount`,`DateAmount`,`DueDateAmount`,`LoanQuality`,`LoanStatus`,`Reason`,
		`CreatedAt`,`CreatedBy`) 
		values (AccountId, product_id, loan_status_id, AgreementDate, DisbursementDate, periodtime, interest, amount_without_interest, totalamount, 
		DueAmount, DateAmount, DueDateAmount, LoanQuality, LoanStatus,
		Reason, CURDATE(), email);

		IF(ROW_COUNT() > 0) THEN
			SELECT loan.Loan_Id, loan.acc_id, loan.DueDateAmount FROM loan
			WHERE loan.acc_id = AccountId
			ORDER BY loan.Loan_Id DESC
			LIMIT 1;
		END IF;
	END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertSimulationHelper` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertSimulationHelper`(IN `acc_id` INT, IN `balance` DECIMAL(18,2), 
IN `principal` DECIMAL(18,2), IN `interest` DECIMAL(18,2), IN `installments` DECIMAL(18,2))
BEGIN
	DELETE FROM simulation_helper WHERE simulation_helper.acc_id = acc_id;
	INSERT INTO simulation_helper(acc_id, balance, principal, interest, installments)
    VALUES(acc_id, balance, principal, interest, installments);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LoanHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LoanHistory`(in email varchar(55))
BEGIN
Declare AccountId int default 0;
Declare LoanId int default 0;

SELECT acc_id into AccountId
FROM account
WHERE account.email = email;

select loan_id into LoanId
from loan
where loan.acc_id = AccountId;


select InstallmentNumber as Monthly, Amount, DueDate, Status 
from invoice
inner join loan
on invoice.Loan_id = loan.Loan_id
where loan.Loan_id = LoanId
and loan.LoanStatus = 'Approved';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LoanReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LoanReport`(in email varchar(55), in startdate date, in enddate date)
BEGIN

Declare AccountId int default 0;


	SELECT acc_id into AccountId
    FROM account
	WHERE account.email = email;
  
    
SELECT email, loan_id, AgreementDate, periodtime, amount_without_interest, totalamount, LoanStatus
     FROM loan
WHERE
(acc_id = AccountId) and LoanStatus = 'Done'
AND CreatedAt between `startdate` and `enddate`
ORDER BY loan_id DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ResetPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ResetPassword`(IN `email` VARCHAR(55), IN `password` VARCHAR(55))
BEGIN
	DECLARE AccountId INT DEFAULT 0;
    
    SELECT acc_id into AccountId
    FROM account
	WHERE account.email = email;
    
	UPDATE account
	SET account.password = password,
    account.Status = 'Active'
	WHERE account.acc_id = AccountId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SignUpAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SignUpAccount`(IN `email` VARCHAR(55), IN `password` VARCHAR(55), IN `phone_number` VARCHAR(55))
BEGIN
		DECLARE AccountId INT DEFAULT 0;
        INSERT INTO account (email, password, phone_number, status)
		SELECT * FROM (SELECT email, password, phone_number, 'Disactive') AS tmp
		WHERE NOT EXISTS (
			SELECT account.email FROM account 
            WHERE account.email = email 
            OR account.phone_number = phone_number
		) LIMIT 1;
        IF(ROW_COUNT() > 0) THEN
        	SELECT acc_id into AccountId
			FROM account
			WHERE account.email = email;
            
			INSERT INTO profile (acc_id, CreatedAt, CreatedBy) VALUES (AccountId, CURDATE(), email);
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateProfileAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateProfileAccount`(IN `email` VARCHAR(55), 
IN `idcardnumber` INT(16), 
IN `placeofbirth` VARCHAR(50),
IN `dateofbirth` DATE,
IN `Gender` ENUM('L','P'),
IN `Religion` ENUM('Kristen','Katolik','Islam','Hindu','Buddha'),
IN `ImageKTP` VARCHAR(55),
IN `ImageSelfie` VARCHAR(55),
IN `StatusMarriage` ENUM('Married','Not Married'),
IN `Education` ENUM('D3','S1','S2','S3'),
IN `TaxID` TINYINT(11), 
IN `ImageFamilyMemberCard` VARCHAR(55),
IN `Occupation` VARCHAR(50),
IN `Fields` VARCHAR(20),
IN `Position` VARCHAR(25),
IN `StatusOfEmployment` VARCHAR(55),
IN `ProofOfEmployment` VARCHAR(55),
IN `ProofOfIncome` VARCHAR(55),
IN `ProofOfBusiness` VARCHAR(55),
IN `ProofOfBusinessIncome` VARCHAR(55),
IN `Type` VARCHAR(20),
IN `Status` VARCHAR(20),
IN `Village_ID` INT,
IN `Province_ID` INT,
IN `Street` VARCHAR(55),
IN `Number` INT(10),
IN `RT` INT(10),
IN `RW` INT(10),
IN `City` VARCHAR(55),
IN `SubDistrict` VARCHAR(55),
IN `PostalCode` INT(20),
IN `ResidentialStatus` VARCHAR(55),
IN `Duration` INT(10),
IN `ProofOfResidence` VARCHAR(55),
IN `Name` VARCHAR(55),
IN `Phone` VARCHAR(55),
IN `Relationship` VARCHAR(55)
)
BEGIN

	DECLARE AccountId INT DEFAULT 0;
	DECLARE ProfileId INT DEFAULT 0;
    DECLARE AddressId INT DEFAULT 0;
    DECLARE IDEmergencyContact INT DEFAULT 0;

    
    SELECT acc_id into AccountId
    FROM account
	WHERE account.email = email;

    SELECT profile_id into ProfileId
    FROM profile
	WHERE profile.acc_id = AccountId;
    
	UPDATE profile
	SET profile.idcardnumber = idcardnumber,
    profile.placeofbirth = placeofbirth,
    profile.dateofbirth =  dateofbirth,
    profile.Gender = gender,
    profile.Religion = Religion,
    profile.ImageKTP = ImageKTP,
    profile.ImageSelfie = ImageSelfie,
	profile.StatusMarriage = StatusMarriage,
	profile.Education = Education,
    profile.TaxID = TaxID,
    profile.ImageFamilyMemberCard = ImageFamilyMemberCard,
    profile.Occupation = Occupation,
    profile.Fields = Fields,
    profile.Position = Position,
    profile.StatusOfEmployment = StatusOfEmployment,
    profile.ProofOfEmployment = ProofOfEmployment,
    profile.ProofOfIncome = ProofOfIncome,
    profile.ProofOfBusiness = ProofOfBusiness,
    profile.ProofOfBusinessIncome = ProofOfBusinessIncome,
    profile.Type = Type,
    profile.Status = Status,
    profile.UpdatedAt = CURDATE(),
    profile.UpdatedBy = ProfileId
	WHERE profile.profile_id = ProfileId;



IF(ProfileId != 0) THEN
	SELECT Address_ID into AddressId
	FROM address
	WHERE address.Profile_ID = ProfileId;

	DELETE FROM address WHERE address.Address_ID = AddressId;
	INSERT INTO address (Profile_ID, Village_ID, Province_ID, Street, Number, RT, RW, City, SubDistrict, PostalCode, ResidentialStatus, Duration, ProofOfResidence) 
	VALUES (ProfileId, Village_ID, Province_ID, Street, Number, RT, RW, City, SubDistrict, PostalCode, ResidentialStatus, Duration, ProofOfResidence);

	SELECT ID_EmergencyContact into IDEmergencyContact
	FROM emergencycontact
	WHERE emergencycontact.Profile_ID = ProfileId;
	
	DELETE FROM emergencycontact WHERE emergencycontact.ID_EmergencyContact = IDEmergencyContact;
	INSERT INTO emergencycontact (Profile_ID, Name, Phone, Relationship, Status, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy) 
	VALUES (ProfileId, Name, Phone, Relationship, 'Active', CURDATE(), ProfileId, CURDATE(), ProfileId);

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateStatusAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateStatusAccount`(IN `email` VARCHAR(55), IN `Status` VARCHAR(55))
BEGIN

	DECLARE AccountId INT DEFAULT 0;
    
    SELECT acc_id into AccountId
    FROM account
	WHERE account.email = email;
    
	UPDATE account
	SET
    account.Status = 'Active'
	WHERE account.acc_id = AccountId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-22 18:24:18
