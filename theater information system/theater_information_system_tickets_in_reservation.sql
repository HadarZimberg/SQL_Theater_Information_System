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
-- Table structure for table `tickets_in_reservation`
--

DROP TABLE IF EXISTS `tickets_in_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_in_reservation` (
  `ticket_ID` int NOT NULL,
  `reservation_ID` int NOT NULL,
  `seat_ID` int DEFAULT NULL,
  PRIMARY KEY (`ticket_ID`,`reservation_ID`),
  KEY `reservation_ID` (`reservation_ID`),
  KEY `seat_ID` (`seat_ID`),
  CONSTRAINT `tickets_in_reservation_ibfk_1` FOREIGN KEY (`reservation_ID`) REFERENCES `reservation` (`reservation_ID`),
  CONSTRAINT `tickets_in_reservation_ibfk_2` FOREIGN KEY (`seat_ID`) REFERENCES `seat` (`seat_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_in_reservation`
--

LOCK TABLES `tickets_in_reservation` WRITE;
/*!40000 ALTER TABLE `tickets_in_reservation` DISABLE KEYS */;
INSERT INTO `tickets_in_reservation` VALUES (601,501,201),(603,502,201),(602,501,202),(604,502,202),(605,502,203),(606,502,204),(607,503,205),(644,514,206),(645,514,207),(646,514,208),(647,514,209),(612,506,215),(627,510,215),(613,506,216),(628,510,216),(614,506,217),(629,510,217),(615,506,218),(616,506,219),(617,507,220),(618,507,221),(619,507,222),(620,507,223),(608,504,231),(609,504,232),(625,509,233),(626,509,234),(610,505,235),(611,505,236),(630,511,239),(621,508,240),(631,511,240),(622,508,241),(623,508,242),(624,508,243),(632,512,251),(633,512,252),(648,515,252),(634,512,253),(649,515,253),(635,512,254),(638,513,254),(650,515,254),(636,512,255),(639,513,255),(651,515,255),(637,512,256),(640,513,256),(652,515,256),(641,513,257),(642,513,258),(643,513,259);
/*!40000 ALTER TABLE `tickets_in_reservation` ENABLE KEYS */;
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
