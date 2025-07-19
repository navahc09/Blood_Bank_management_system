-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: blood_bank_system
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_logs` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `activity_type` enum('login','donation','request','approval','expiry','inventory_update','user_management') NOT NULL,
  `description` text NOT NULL,
  `details` json DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_logs`
--

LOCK TABLES `activity_logs` WRITE;
/*!40000 ALTER TABLE `activity_logs` DISABLE KEYS */;
INSERT INTO `activity_logs` VALUES (160,1,'user_management','New donor added: Ashmit B','{\"name\": \"Ashmit B\", \"donor_id\": 35, \"blood_group\": \"B+\"}',NULL,'2025-04-19 12:43:40'),(161,1,'donation','New donation: 1 units of B+ from Ashmit B','{\"units\": 1, \"bank_id\": 1, \"donor_id\": 35, \"bank_name\": \"LIFESTREAM+ Blood Bank\", \"donor_name\": \"Ashmit B\", \"blood_group\": \"B+\", \"donation_id\": 29}',NULL,'2025-04-19 12:43:40'),(162,1,'inventory_update','Manual inventory add: 1 units of B+ at LIFESTREAM+ Blood Bank','{\"units\": 1, \"bank_id\": 1, \"bank_name\": \"LIFESTREAM+ Blood Bank\", \"operation\": \"add\", \"blood_group\": \"B+\"}',NULL,'2025-04-19 12:43:40'),(163,23,'request','New blood request: 3 units of A+ from Bharti Hospital','{\"bank_id\": 1, \"purpose\": \"Scheduled Surgery\", \"bank_name\": \"LIFESTREAM+ Blood Bank\", \"request_id\": 39, \"blood_group\": \"A+\", \"recipient_id\": 11, \"recipient_name\": \"Bharti Hospital\", \"units_requested\": 3}',NULL,'2025-04-19 12:52:00'),(164,1,'user_management','New donor added: Kaushal C','{\"name\": \"Kaushal C\", \"donor_id\": 36, \"blood_group\": \"A+\"}',NULL,'2025-04-19 12:53:11'),(165,1,'donation','New donation: 3 units of A+ from Kaushal C','{\"units\": 3, \"bank_id\": 1, \"donor_id\": 36, \"bank_name\": \"LIFESTREAM+ Blood Bank\", \"donor_name\": \"Kaushal C\", \"blood_group\": \"A+\", \"donation_id\": 30}',NULL,'2025-04-19 12:53:11'),(166,1,'inventory_update','Manual inventory add: 3 units of A+ at LIFESTREAM+ Blood Bank','{\"units\": 3, \"bank_id\": 1, \"bank_name\": \"LIFESTREAM+ Blood Bank\", \"operation\": \"add\", \"blood_group\": \"A+\"}',NULL,'2025-04-19 12:53:11'),(167,1,'approval','Blood request approved: A+ (3.00 units)','{\"units\": \"3.00\", \"status\": \"approved\", \"bank_id\": 1, \"bank_name\": \"LIFESTREAM+ Blood Bank\", \"new_status\": \"approved\", \"old_status\": \"pending\", \"request_id\": 39, \"blood_group\": \"A+\", \"recipient_id\": 11, \"recipient_name\": \"Bharti Hospital\"}',NULL,'2025-04-19 12:53:28');
/*!40000 ALTER TABLE `activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blood_banks`
--

DROP TABLE IF EXISTS `blood_banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blood_banks` (
  `bank_id` int NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(100) NOT NULL,
  `location` text NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `capacity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_banks`
--

LOCK TABLES `blood_banks` WRITE;
/*!40000 ALTER TABLE `blood_banks` DISABLE KEYS */;
INSERT INTO `blood_banks` VALUES (1,'LIFESTREAM+ Blood Bank','Main St, City Center','123-456-7890','contact@lifestream.com',1000,'2025-04-13 18:09:45','2025-04-13 18:09:45');
/*!40000 ALTER TABLE `blood_banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blood_inventory`
--

DROP TABLE IF EXISTS `blood_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blood_inventory` (
  `inventory_id` int NOT NULL AUTO_INCREMENT,
  `bank_id` int NOT NULL,
  `blood_group` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') NOT NULL,
  `available_units` decimal(5,2) DEFAULT '0.00',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`inventory_id`),
  UNIQUE KEY `bank_blood_group` (`bank_id`,`blood_group`),
  CONSTRAINT `blood_inventory_ibfk_1` FOREIGN KEY (`bank_id`) REFERENCES `blood_banks` (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_inventory`
--

LOCK TABLES `blood_inventory` WRITE;
/*!40000 ALTER TABLE `blood_inventory` DISABLE KEYS */;
INSERT INTO `blood_inventory` VALUES (1,1,'A+',10.00,'2025-04-19 12:53:28'),(2,1,'B+',10.00,'2025-04-19 12:43:40'),(3,1,'AB+',10.00,'2025-04-19 12:39:34'),(4,1,'O+',10.00,'2025-04-19 12:39:34'),(5,1,'A-',10.00,'2025-04-19 12:39:34'),(6,1,'B-',10.00,'2025-04-19 12:39:34'),(7,1,'AB-',10.00,'2025-04-19 12:39:34'),(8,1,'O-',10.00,'2025-04-19 12:39:34');
/*!40000 ALTER TABLE `blood_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blood_requests`
--

DROP TABLE IF EXISTS `blood_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blood_requests` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `recipient_id` int NOT NULL,
  `bank_id` int NOT NULL,
  `blood_group` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') NOT NULL,
  `units_requested` decimal(5,2) NOT NULL,
  `request_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `required_by` date NOT NULL,
  `purpose` text NOT NULL,
  `status` enum('pending','approved','rejected','fulfilled') DEFAULT 'pending',
  `approved_by` int DEFAULT NULL,
  `fulfillment_date` date DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`request_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `bank_id` (`bank_id`),
  CONSTRAINT `blood_requests_ibfk_1` FOREIGN KEY (`recipient_id`) REFERENCES `recipients` (`recipient_id`),
  CONSTRAINT `blood_requests_ibfk_2` FOREIGN KEY (`bank_id`) REFERENCES `blood_banks` (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_requests`
--

LOCK TABLES `blood_requests` WRITE;
/*!40000 ALTER TABLE `blood_requests` DISABLE KEYS */;
INSERT INTO `blood_requests` VALUES (39,11,1,'A+',3.00,'2025-04-19 12:52:00','2025-04-30','Scheduled Surgery','approved',1,NULL,'Patient: Steve Harvey, Age: 55\n\nRequest approved by admin');
/*!40000 ALTER TABLE `blood_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donations`
--

DROP TABLE IF EXISTS `donations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donations` (
  `donation_id` int NOT NULL AUTO_INCREMENT,
  `donor_id` int NOT NULL,
  `bank_id` int NOT NULL,
  `blood_group` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') NOT NULL,
  `units` decimal(5,2) NOT NULL,
  `donation_date` date NOT NULL,
  `expiry_date` date GENERATED ALWAYS AS ((`donation_date` + interval 41 day)) STORED,
  `status` enum('valid','expired','used') DEFAULT 'valid',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`donation_id`),
  KEY `donor_id` (`donor_id`),
  KEY `bank_id` (`bank_id`),
  CONSTRAINT `donations_ibfk_1` FOREIGN KEY (`donor_id`) REFERENCES `donors` (`donor_id`),
  CONSTRAINT `donations_ibfk_2` FOREIGN KEY (`bank_id`) REFERENCES `blood_banks` (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donations`
--

LOCK TABLES `donations` WRITE;
/*!40000 ALTER TABLE `donations` DISABLE KEYS */;
INSERT INTO `donations` (`donation_id`, `donor_id`, `bank_id`, `blood_group`, `units`, `donation_date`, `status`, `created_at`, `updated_at`) VALUES (29,35,1,'B+',1.00,'2025-04-19','valid','2025-04-19 12:43:40','2025-04-19 12:43:40'),(30,36,1,'A+',3.00,'2025-04-19','valid','2025-04-19 12:53:11','2025-04-19 12:53:11');
/*!40000 ALTER TABLE `donations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donors`
--

DROP TABLE IF EXISTS `donors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donors` (
  `donor_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `age` int DEFAULT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `blood_group` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `health_status` enum('Eligible','Not Eligible') DEFAULT 'Eligible',
  `medical_history` text,
  `last_donation_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`donor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donors`
--

LOCK TABLES `donors` WRITE;
/*!40000 ALTER TABLE `donors` DISABLE KEYS */;
INSERT INTO `donors` VALUES (35,'Ashmit B','2005-03-03',20,'Male','B+','9673034534','ashmit33@gmail.com','Baramati','Eligible','No','2025-04-19','2025-04-19 12:43:40','2025-04-19 12:43:40'),(36,'Kaushal C','2007-04-12',18,'Male','A+','4363436353','kaushal33@gmail.com','Nashik','Eligible','Leg Operation ','2025-04-19','2025-04-19 12:53:11','2025-04-19 12:53:11');
/*!40000 ALTER TABLE `donors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipients`
--

DROP TABLE IF EXISTS `recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipients` (
  `recipient_id` int NOT NULL AUTO_INCREMENT,
  `organization_name` varchar(100) NOT NULL,
  `type` enum('Hospital','Research','EMS','Other') NOT NULL,
  `contact_person` varchar(100) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`recipient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipients`
--

LOCK TABLES `recipients` WRITE;
/*!40000 ALTER TABLE `recipients` DISABLE KEYS */;
INSERT INTO `recipients` VALUES (11,'Bharti Hospital','Hospital','Bharti Hospital','2354536534','bharti33@gmail.com','Dhankavdi,Pune','active','2025-04-19 12:51:35','2025-04-19 12:51:35');
/*!40000 ALTER TABLE `recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','recipient') NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@lifestream.com','$2b$10$LSEfK898G1HE2F.8MQfNceEHZ7Tls0rb5UsuwRfEWWm.rAMZ/onIG','admin','active','2025-04-14 08:39:57','2025-04-13 16:51:15','2025-04-14 08:39:57'),(14,'Administrator','lifestream@gmail.com','.RfgJUleO9EBsQtWdMsNjs0hfI7E19TLZPnO8Ea','admin','active',NULL,'2025-04-16 07:59:39','2025-04-16 07:59:39'),(23,'Bharti Hospital','bharti33@gmail.com','$2b$10$vdxF8jqBTDQ9D.iDyOh4A.JhS7cS2V78ISOz1f0Z5ZwbxHqdlGH/m','recipient','active',NULL,'2025-04-19 12:51:35','2025-04-19 12:51:35');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-19 18:33:13
