-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: BudgetMeDev
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Category` (
  `CategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`CategoryId`),
  UNIQUE KEY `CategoryId_UNIQUE` (`CategoryId`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reoccuring`
--

DROP TABLE IF EXISTS `Reoccuring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reoccuring` (
  `ReoccuringId` int(11) NOT NULL AUTO_INCREMENT,
  `TransactionId` int(11) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`ReoccuringId`),
  UNIQUE KEY `ReoccuringId_UNIQUE` (`ReoccuringId`),
  KEY `FK_REOCCURING_TRANSACTION_ID_idx` (`TransactionId`),
  CONSTRAINT `FK_REOCCURING_TRANSACTION_ID` FOREIGN KEY (`TransactionId`) REFERENCES `transaction` (`TransactionId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reoccuring`
--

LOCK TABLES `Reoccuring` WRITE;
/*!40000 ALTER TABLE `Reoccuring` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reoccuring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transaction`
--

DROP TABLE IF EXISTS `Transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transaction` (
  `TransactionId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `TransactionType` enum('INCOME','EXPENSE') NOT NULL,
  `ReoccurenceType` enum('WEEKLY','BIWEEKLY','MONTHLY','BIMONTHLY','SEMIMONTHLY','ANNUALLY') NOT NULL,
  `Reoccuring` tinyint(4) NOT NULL,
  `DateOfTransaction` date NOT NULL,
  `CurrencyValue` double NOT NULL,
  PRIMARY KEY (`TransactionId`),
  UNIQUE KEY `BudgetId_UNIQUE` (`TransactionId`),
  KEY `CategoryId_idx` (`CategoryId`),
  KEY `UserId_idx` (`UserId`),
  CONSTRAINT `FK_TRANSACTION_CATEGORY_ID` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`CategoryId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TRANSACTION_USER_ID` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transaction`
--

LOCK TABLES `Transaction` WRITE;
/*!40000 ALTER TABLE `Transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `Transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `GoogleId` int(11) DEFAULT NULL COMMENT 'Used for O-Auth\n',
  `FacebookId` int(11) DEFAULT NULL COMMENT 'Used for O-Auth',
  `Avatar` varchar(45) DEFAULT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `DateOfBirth` date NOT NULL,
  `DateOfRegistration` date NOT NULL,
  `Premium` tinyint(4) NOT NULL,
  PRIMARY KEY (`UserId`),
  UNIQUE KEY `UserId_UNIQUE` (`UserId`),
  UNIQUE KEY `Username_UNIQUE` (`Username`),
  UNIQUE KEY `GoogleId_UNIQUE` (`GoogleId`),
  UNIQUE KEY `FacebookId_UNIQUE` (`FacebookId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-19 22:08:40
