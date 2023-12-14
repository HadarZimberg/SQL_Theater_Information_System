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
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `performance_ID` int NOT NULL,
  `theater_ID` int NOT NULL,
  `show_ID` int NOT NULL,
  `date_and_time` datetime NOT NULL,
  `hall_ID` int NOT NULL,
  `num_of_tickets_sold` int NOT NULL,
  PRIMARY KEY (`performance_ID`),
  KEY `theater_ID` (`theater_ID`),
  KEY `show_ID` (`show_ID`),
  KEY `hall_ID` (`hall_ID`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`theater_ID`) REFERENCES `theater` (`theater_ID`),
  CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`show_ID`) REFERENCES `shows` (`show_ID`),
  CONSTRAINT `schedule_ibfk_3` FOREIGN KEY (`hall_ID`) REFERENCES `hall` (`hall_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (401,1,301,'2023-06-01 21:00:00',101,5),(402,1,308,'2023-06-01 20:30:00',102,0),(403,1,304,'2023-06-02 20:30:00',101,7),(404,1,305,'2023-06-02 20:30:00',103,0),(405,1,311,'2023-06-03 18:30:00',102,4),(406,1,310,'2023-06-03 21:30:00',102,2),(407,1,302,'2023-06-04 21:00:00',103,6),(408,1,307,'2023-06-05 13:30:00',101,0),(409,1,309,'2023-06-05 20:30:00',101,9),(410,1,303,'2023-06-05 21:30:00',103,0),(411,1,306,'2023-06-06 18:00:00',102,0),(412,1,309,'2023-06-06 20:30:00',102,4),(413,1,312,'2023-06-06 21:00:00',102,0),(414,1,312,'2023-06-07 20:30:00',103,0),(415,1,305,'2023-06-08 20:30:00',102,0),(416,1,308,'2023-06-08 20:30:00',101,0),(417,1,306,'2023-06-09 20:30:00',102,0),(418,1,311,'2023-06-10 19:00:00',101,0),(419,1,303,'2023-06-11 20:30:00',103,5),(420,1,302,'2023-06-11 20:00:00',102,2),(421,1,304,'2023-06-14 21:00:00',101,4),(422,1,301,'2023-06-16 20:30:00',103,6),(423,1,309,'2023-06-17 21:30:00',102,0);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
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
