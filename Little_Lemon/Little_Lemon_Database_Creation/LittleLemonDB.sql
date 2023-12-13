-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: littlelemondb
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `AddressID` int NOT NULL AUTO_INCREMENT,
  `Street` varchar(255) NOT NULL,
  `City` varchar(45) NOT NULL,
  `Postal_Code` int NOT NULL,
  `State` varchar(45) NOT NULL,
  PRIMARY KEY (`AddressID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'Moore Str.','Ikeja',102232,'Lagos'),(2,'Adebayo crescent','Osogbo',223423,'Osun'),(3,'Aarin Olofin Str.','Surulere',193313,'Lagos'),(4,'Faaji Close','Lekki',102131,'Lagos'),(5,'Choba Rd.','PHC',411343,'Rivers'),(6,'Oksun Str.','Ejigbo',102214,'Abuja'),(7,'Muri Rd.','Garki',341431,'Abuja');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `TableNo` int NOT NULL,
  `Date` date NOT NULL,
  `TimeSlot` time NOT NULL,
  `EmployeeID` int NOT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `employee_id_fk_idx` (`EmployeeID`),
  KEY `customer_id_fk_idx` (`CustomerID`),
  CONSTRAINT `customer_id_fk` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employee_id_fk` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,2,4,'2023-12-09','19:00:00',3),(2,1,12,'2023-12-09','15:00:00',4),(3,5,7,'2023-12-11','19:00:00',5),(4,4,9,'2023-12-11','15:00:00',3),(5,1,5,'2023-12-13','17:30:00',4),(6,5,6,'2023-12-13','18:30:00',4),(7,3,8,'2023-12-13','20:00:00',5);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `First_name` varchar(100) NOT NULL,
  `Last_name` varchar(100) NOT NULL,
  `Contact` varchar(45) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `AddressID` int NOT NULL,
  PRIMARY KEY (`CustomerID`),
  KEY `address_id_fk_idx` (`AddressID`),
  CONSTRAINT `address_id_fk` FOREIGN KEY (`AddressID`) REFERENCES `addresses` (`AddressID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Lois','Okoro','07034056765','l.okoro@gmail.com',1),(2,'Ndu','Okeke','09044232345','nduokeke@outlook.com',5),(3,'Mary','Williams','09023842311','williamsmay@gmail.com',4),(4,'Amoka','Olisa','07074353164','a.olisa@gmail.com',3),(5,'Elizabeth','Lukman','09042852435','lizzy232@gmail.com',5);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drinks`
--

DROP TABLE IF EXISTS `drinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drinks` (
  `DrinkID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Type` varchar(100) NOT NULL,
  `Price` decimal(10,0) NOT NULL,
  PRIMARY KEY (`DrinkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drinks`
--

LOCK TABLES `drinks` WRITE;
/*!40000 ALTER TABLE `drinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `drinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Contact` varchar(45) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Role` varchar(45) NOT NULL,
  `Annual_Salary` decimal(10,0) NOT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Anisa Okemuo','07042056765','a.oke@gmail.com','Manager',25000),(2,'Ede Okechi','09024232345','okechi@outlook.com','Chef',23500),(3,'Mary Kolade','09045842311','komay@gmail.com','Waiter',18000),(4,'Davis Otunba','07075253164','dotunba@gmail.com','Head Waiter',23000),(5,'Liz Kere','09043252435','lizstar@gmail.com','Waiter',18000);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `MenuID` int NOT NULL AUTO_INCREMENT,
  `MenuName` varchar(100) NOT NULL,
  `MenuItemsID` int DEFAULT NULL,
  `DrinksID` int DEFAULT NULL,
  `Cuisine` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MenuID`),
  KEY `menuitems_id_fk_idx` (`MenuItemsID`),
  KEY `drinks_id_fk_idx` (`DrinksID`),
  CONSTRAINT `drinks_id_fk` FOREIGN KEY (`DrinksID`) REFERENCES `drinks` (`DrinkID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `menuitems_id_fk` FOREIGN KEY (`MenuItemsID`) REFERENCES `menuitems` (`MenuItemsID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuitems`
--

DROP TABLE IF EXISTS `menuitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuitems` (
  `MenuItemsID` int NOT NULL AUTO_INCREMENT,
  `StarterName` varchar(100) DEFAULT NULL,
  `CourseName` varchar(255) DEFAULT NULL,
  `DessertName` varchar(45) DEFAULT NULL,
  `Price` decimal(10,0) NOT NULL,
  PRIMARY KEY (`MenuItemsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuitems`
--

LOCK TABLES `menuitems` WRITE;
/*!40000 ALTER TABLE `menuitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `menuitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_delivery`
--

DROP TABLE IF EXISTS `order_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_delivery` (
  `OrderID` int NOT NULL,
  `DeliveryDate` date NOT NULL,
  `DeliveryStatus` varchar(45) NOT NULL,
  PRIMARY KEY (`OrderID`),
  CONSTRAINT `order_id_fk` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_delivery`
--

LOCK TABLES `order_delivery` WRITE;
/*!40000 ALTER TABLE `order_delivery` DISABLE KEYS */;
INSERT INTO `order_delivery` VALUES (1,'2023-12-09','Served'),(2,'2023-12-09','Served'),(3,'2023-12-11','Served'),(4,'2023-12-13','In Queue'),(5,'2023-12-13','In Queue');
/*!40000 ALTER TABLE `order_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `order_qty_above_1`
--

DROP TABLE IF EXISTS `order_qty_above_1`;
/*!50001 DROP VIEW IF EXISTS `order_qty_above_1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `order_qty_above_1` AS SELECT 
 1 AS `OrderID`,
 1 AS `Quantity`,
 1 AS `TotalCost`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `OrderDate` date NOT NULL,
  `BookingID` int NOT NULL,
  `MenuID` int NOT NULL,
  `Quantity` int NOT NULL,
  `TotalCost` decimal(10,0) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `booking_id_fk_idx` (`BookingID`),
  CONSTRAINT `booking_id_fk` FOREIGN KEY (`BookingID`) REFERENCES `bookings` (`BookingID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2023-12-09',1,1,2,86),(2,'2023-12-09',2,1,1,37),(3,'2023-12-11',3,2,1,37),(4,'2023-12-13',4,2,1,40),(5,'2023-12-13',5,3,2,94);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `order_qty_above_1`
--

/*!50001 DROP VIEW IF EXISTS `order_qty_above_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`meta`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `order_qty_above_1` AS select `orders`.`OrderID` AS `OrderID`,`orders`.`Quantity` AS `Quantity`,`orders`.`TotalCost` AS `TotalCost` from `orders` where (`orders`.`Quantity` > 1) */;
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

-- Dump completed on 2023-12-12 13:49:25
