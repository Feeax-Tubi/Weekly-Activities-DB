CREATE DATABASE  IF NOT EXISTS `activitiesdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `activitiesdb`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: activitiesdb
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity` (
  `ActivityID` int NOT NULL AUTO_INCREMENT,
  `ActivityName` varchar(45) NOT NULL,
  `ActivityType` varchar(45) NOT NULL,
  `Participants` int NOT NULL,
  `Location_LocationID` int NOT NULL,
  `Time_TimeID` int NOT NULL,
  PRIMARY KEY (`ActivityID`,`Location_LocationID`,`Time_TimeID`),
  KEY `fk_Activity_Location1_idx` (`Location_LocationID`),
  KEY `fk_Activity_Time1_idx` (`Time_TimeID`),
  CONSTRAINT `fk_Activity_Location1` FOREIGN KEY (`Location_LocationID`) REFERENCES `location` (`LocationID`),
  CONSTRAINT `fk_Activity_Time1` FOREIGN KEY (`Time_TimeID`) REFERENCES `time` (`TimeID`),
  CONSTRAINT `activity_chk_1` CHECK (((`Participants` >= 5) or (`ActivityName` <> _utf8mb3'Hulahoop')))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (1,'Party','Indoor',30,1,1),(2,'Hiking','Outdoor',16,2,2),(3,'MountainClimb','Outdoor',6,3,3),(4,'SightSeeing','Outdoor',69,4,4),(5,'Cinema','Indoor',50,5,5),(6,'Picnic','Outdoor',10,6,6),(7,'Skiing','Outdoor',15,7,7),(8,'Swimming','Indoor',11,8,8),(9,'Shopping','Outdoor',8,9,9);
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_has_user`
--

DROP TABLE IF EXISTS `activity_has_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_has_user` (
  `Activity_ActivityID` int NOT NULL,
  `Activity_Location_LocationID` int NOT NULL,
  `Activity_Time_TimeID` int NOT NULL,
  `User_UserID` int NOT NULL,
  PRIMARY KEY (`Activity_ActivityID`,`Activity_Location_LocationID`,`Activity_Time_TimeID`,`User_UserID`),
  KEY `fk_Activity_has_User_User1_idx` (`User_UserID`),
  KEY `fk_Activity_has_User_Activity1_idx` (`Activity_ActivityID`,`Activity_Location_LocationID`,`Activity_Time_TimeID`),
  CONSTRAINT `fk_Activity_has_User_Activity1` FOREIGN KEY (`Activity_ActivityID`, `Activity_Location_LocationID`, `Activity_Time_TimeID`) REFERENCES `activity` (`ActivityID`, `Location_LocationID`, `Time_TimeID`),
  CONSTRAINT `fk_Activity_has_User_User1` FOREIGN KEY (`User_UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_has_user`
--

LOCK TABLES `activity_has_user` WRITE;
/*!40000 ALTER TABLE `activity_has_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_has_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `LocationID` int NOT NULL,
  `Adress` varchar(90) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Capacity` int NOT NULL,
  `Description` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`LocationID`),
  CONSTRAINT `location_chk_1` CHECK ((`Capacity` >= 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (0,'P-504, Sakha Republic, Rusya, 678715','Alyaska',40,'Comfy Cafe near the road'),(1,'1300 N 18th St, Quincy, IL 62301, Amerika Birleşik Devletleri','QU Baseball Stadium',50000,'Baseball Stadium'),(2,'1301 N 12th St, Quincy, IL 62301, Amerika Birleşik Devletleri','Uncle Bob\'s Bar',50,'Your Local Bar'),(3,'501 All American Park, Quincy, IL 62301, Amerika Birleşik Devletleri','Clat Adams Bicetennial Park',500,'Riverside park with a view'),(4,'1020 S 5th St, Quincy, IL 62301, Amerika Birleşik Devletleri','Woodland Cemetry',8,'Who knows what is here'),(5,'1500 S 5th St, Quincy, IL 62301, Amerika Birleşik Devletleri','Indian Mounds',200,'Pool'),(6,'2020 S 24th St, Quincy, IL 62301, Amerika Birleşik Devletleri','Trinity United Church-Christ',80,'May thine be blessed'),(7,'2815 Cheswick Rd, Quincy, IL 62301, Amerika Birleşik Devletleri','Kitchen & Bath Design Studio',1000,'Get your kitchen and baths here'),(8,'1401 Gardner Expy, Quincy, IL 62301, Amerika Birleşik Devletleri','Expressway Tire Inc.',100,'Get your tires here'),(9,'640 S Front St, Quincy, IL 62301, Amerika Birleşik Devletleri','South Side Boat Club',20,'Join the club with your own boat');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time`
--

DROP TABLE IF EXISTS `time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time` (
  `TimeID` int NOT NULL AUTO_INCREMENT,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `Length` int NOT NULL,
  PRIMARY KEY (`TimeID`),
  CONSTRAINT `time_chk_1` CHECK ((`Length` >= 45))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time`
--

LOCK TABLES `time` WRITE;
/*!40000 ALTER TABLE `time` DISABLE KEYS */;
INSERT INTO `time` VALUES (0,'2020-11-29','2020-12-01',52),(1,'2020-11-29','2020-12-01',53),(2,'2020-11-29','2020-12-01',49),(3,'2020-11-29','2020-12-01',60),(4,'2020-11-29','2020-12-01',59),(5,'2020-11-29','2020-12-01',55),(6,'2020-11-29','2020-12-01',56),(7,'2020-11-29','2020-12-01',57),(8,'2020-11-29','2020-12-01',54),(9,'2020-11-29','2020-12-01',50);
/*!40000 ALTER TABLE `time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `UserName` varchar(45) NOT NULL,
  `UserSurname` varchar(45) NOT NULL,
  `BirthDate` date NOT NULL,
  `UserPref` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Mehmet','Serici','1933-01-02',NULL),(2,'Ali','Topçu','1989-01-03',NULL),(3,'Veli','Tütüncü','1993-01-03',NULL),(4,'Can','Bonomo','1978-02-06',NULL),(5,'Atakan','Demir','1986-02-07',NULL),(6,'Fahri','Küçükosman','1997-03-06',NULL),(7,'Ekin','Duman','2000-03-20',NULL),(8,'Yiğit','Gökkaya','1994-05-12',NULL),(9,'Tuğberk','Göztepe','1999-04-23',NULL),(10,'Ahmet','Kaya','1961-01-01',NULL);
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

-- Dump completed on 2021-01-10 17:22:07
