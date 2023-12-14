-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: theater_information_system
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `seat_ID` int NOT NULL,
  `seat_number` int NOT NULL,
  `row_num` int NOT NULL,
  `section` varchar(20) NOT NULL,
  `hall_ID` int NOT NULL,
  PRIMARY KEY (`seat_ID`),
  KEY `hall_ID` (`hall_ID`),
  CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`hall_ID`) REFERENCES `hall` (`hall_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (201,1,1,'hall',101),(202,2,1,'hall',101),(203,3,1,'hall',101),(204,4,1,'hall',101),(205,5,1,'hall',101),(206,6,1,'hall',101),(207,7,1,'hall',101),(208,8,1,'hall',101),(209,9,1,'hall',101),(210,10,1,'hall',101),(211,1,2,'hall',101),(212,2,2,'hall',101),(213,3,2,'hall',101),(214,4,2,'hall',101),(215,5,2,'hall',101),(216,6,2,'hall',101),(217,7,2,'hall',101),(218,8,2,'hall',101),(219,9,2,'hall',101),(220,10,2,'hall',101),(221,1,3,'balcony',101),(222,2,3,'balcony',101),(223,3,3,'balcony',101),(224,4,3,'balcony',101),(225,5,3,'balcony',101),(226,6,3,'balcony',101),(227,7,3,'balcony',101),(228,8,3,'balcony',101),(229,9,3,'balcony',101),(230,10,3,'balcony',101),(231,1,1,'hall',102),(232,2,1,'hall',102),(233,3,1,'hall',102),(234,4,1,'hall',102),(235,5,1,'hall',102),(236,1,2,'hall',102),(237,2,2,'hall',102),(238,3,2,'hall',102),(239,4,2,'hall',102),(240,5,2,'hall',102),(241,1,3,'balcony',102),(242,2,3,'balcony',102),(243,3,3,'balcony',102),(244,4,3,'balcony',102),(245,5,3,'balcony',102),(246,1,4,'balcony',102),(247,2,4,'balcony',102),(248,3,4,'balcony',102),(249,4,4,'balcony',102),(250,5,4,'balcony',102),(251,1,1,'hall',103),(252,2,1,'hall',103),(253,3,1,'hall',103),(254,4,1,'hall',103),(255,5,1,'hall',103),(256,1,2,'balcony',103),(257,2,2,'balcony',103),(258,3,2,'balcony',103),(259,4,2,'balcony',103),(260,5,2,'balcony',103);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-31 17:30:40
