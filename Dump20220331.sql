-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: iitgn_coviddata
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `covid`
--

DROP TABLE IF EXISTS `covid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `covid` (
  `patient_id` int NOT NULL,
  `user_id` int NOT NULL,
  UNIQUE KEY `patient_id_UNIQUE` (`patient_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `patient_id` FOREIGN KEY (`patient_id`) REFERENCES `covid_data` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `covid`
--

LOCK TABLES `covid` WRITE;
/*!40000 ALTER TABLE `covid` DISABLE KEYS */;
INSERT INTO `covid` VALUES (1,1),(5,1),(2,2),(3,3),(4,4),(8,5),(6,9),(7,10);
/*!40000 ALTER TABLE `covid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `covid_data`
--

DROP TABLE IF EXISTS `covid_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `covid_data` (
  `patient_id` int NOT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  UNIQUE KEY `patient_id_UNIQUE` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `covid_data`
--

LOCK TABLES `covid_data` WRITE;
/*!40000 ALTER TABLE `covid_data` DISABLE KEYS */;
INSERT INTO `covid_data` VALUES (1,'2020-10-10'),(2,'2021-05-01'),(3,'2021-04-21'),(4,'2021-12-11'),(5,'2022-08-24'),(6,'2021-07-23'),(7,'2022-04-17'),(8,'2020-05-16'),(9,'2021-06-18'),(10,'2021-11-22'),(11,'2021-11-23'),(12,'2021-07-18'),(13,'2022-08-19');
/*!40000 ALTER TABLE `covid_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease`
--

DROP TABLE IF EXISTS `disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease` (
  `disease_id` int NOT NULL,
  `disease_name` varchar(45) NOT NULL,
  PRIMARY KEY (`disease_id`),
  UNIQUE KEY `disease_id_UNIQUE` (`disease_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease`
--

LOCK TABLES `disease` WRITE;
/*!40000 ALTER TABLE `disease` DISABLE KEYS */;
INSERT INTO `disease` VALUES (1,'Dengue'),(2,'Cancer'),(3,'CVD'),(4,'Asthma'),(5,'Hypertension'),(6,'Thyroid'),(7,'Food Allergy'),(8,'Malaria');
/*!40000 ALTER TABLE `disease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entry_exit`
--

DROP TABLE IF EXISTS `entry_exit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entry_exit` (
  `qr_id` int NOT NULL,
  `roll_no` int NOT NULL,
  UNIQUE KEY `qr_id_UNIQUE` (`qr_id`),
  KEY `roll_no_idx` (`roll_no`),
  CONSTRAINT `qr_id` FOREIGN KEY (`qr_id`) REFERENCES `qr` (`qr_id`),
  CONSTRAINT `roll_no` FOREIGN KEY (`roll_no`) REFERENCES `students` (`roll_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entry_exit`
--

LOCK TABLES `entry_exit` WRITE;
/*!40000 ALTER TABLE `entry_exit` DISABLE KEYS */;
INSERT INTO `entry_exit` VALUES (1,18110001),(3,18110021),(2,18110172),(4,19110015),(5,20110023);
/*!40000 ALTER TABLE `entry_exit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `emp_id` int NOT NULL,
  `discipline` varchar(45) DEFAULT NULL,
  `housing_block` int DEFAULT NULL,
  `house_number` int DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `emp_id_UNIQUE` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (111000,'Physics',42,144),(111011,'Chemistry',20,233),(111057,'Civil Engineering',40,121),(112001,'Chemistry',41,132),(112015,'Computer Science Engineering',14,432),(112022,'Civil Engineering',44,214);
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty_user`
--

DROP TABLE IF EXISTS `faculty_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty_user` (
  `user` int NOT NULL,
  `emp_id` int NOT NULL,
  UNIQUE KEY `userid_UNIQUE` (`user`),
  UNIQUE KEY `emp_code_UNIQUE` (`emp_id`),
  CONSTRAINT `emp_id1` FOREIGN KEY (`emp_id`) REFERENCES `faculty` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user1` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty_user`
--

LOCK TABLES `faculty_user` WRITE;
/*!40000 ALTER TABLE `faculty_user` DISABLE KEYS */;
INSERT INTO `faculty_user` VALUES (9,111000),(4,111057),(6,112022);
/*!40000 ALTER TABLE `faculty_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_history`
--

DROP TABLE IF EXISTS `medical_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_history` (
  `disease_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`disease_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_history`
--

LOCK TABLES `medical_history` WRITE;
/*!40000 ALTER TABLE `medical_history` DISABLE KEYS */;
INSERT INTO `medical_history` VALUES (1,1),(1,2),(1,3),(3,4),(3,5),(2,7),(2,9);
/*!40000 ALTER TABLE `medical_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qr`
--

DROP TABLE IF EXISTS `qr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qr` (
  `qr_id` int NOT NULL,
  `last_exit_time` datetime DEFAULT NULL,
  `last_entry_time` datetime DEFAULT NULL,
  PRIMARY KEY (`qr_id`),
  UNIQUE KEY `qr_id_UNIQUE` (`qr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qr`
--

LOCK TABLES `qr` WRITE;
/*!40000 ALTER TABLE `qr` DISABLE KEYS */;
INSERT INTO `qr` VALUES (1,'2022-01-05 14:15:10','2022-01-05 18:30:31'),(2,'2022-01-06 06:18:19','2022-01-06 10:32:15'),(3,'2022-01-06 11:26:55','2022-01-06 16:01:00'),(4,'2022-01-06 13:54:10',NULL),(5,NULL,NULL),(6,NULL,'2022-01-07 22:01:01'),(7,'2022-01-07 15:55:00','2022-01-07 17:01:58'),(8,'2022-01-07 19:41:05','2022-01-07 23:59:57'),(9,'2022-02-12 23:20:09','2022-02-12 23:50:01'),(10,'2022-02-13 01:19:04','2022-02-13 06:00:00'),(11,'2022-02-14 12:39:46',NULL);
/*!40000 ALTER TABLE `qr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qr_user`
--

DROP TABLE IF EXISTS `qr_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qr_user` (
  `QR_id` int NOT NULL,
  `Roll_no` int NOT NULL,
  UNIQUE KEY `QR_id_UNIQUE` (`QR_id`),
  KEY `rollno_idx` (`Roll_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qr_user`
--

LOCK TABLES `qr_user` WRITE;
/*!40000 ALTER TABLE `qr_user` DISABLE KEYS */;
INSERT INTO `qr_user` VALUES (2,1),(1,5),(3,7),(4,10);
/*!40000 ALTER TABLE `qr_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `emp_id` int NOT NULL,
  `resident` varchar(45) DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `emp_id_UNIQUE` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (122001,'yes','electrical','hb 4/110'),(122007,'no','academics','Sector 11, Gandhinagar'),(122011,'yes','campus development','hb 4/210'),(122047,'yes','house keeping','hb 4/120'),(122048,'yes','student Affairs','hb 1/110'),(122055,'yes','IWD','hb 4/310'),(122069,'no','IWD','Sector 21, Gandhinagar');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_user`
--

DROP TABLE IF EXISTS `staff_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_user` (
  `user` int NOT NULL,
  `emp_id` int NOT NULL,
  UNIQUE KEY `user_UNIQUE` (`user`),
  UNIQUE KEY `emp_id_UNIQUE` (`emp_id`),
  CONSTRAINT `emp_id2` FOREIGN KEY (`emp_id`) REFERENCES `staff` (`emp_id`),
  CONSTRAINT `user_id2` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_user`
--

LOCK TABLES `staff_user` WRITE;
/*!40000 ALTER TABLE `staff_user` DISABLE KEYS */;
INSERT INTO `staff_user` VALUES (2,122011),(3,122055);
/*!40000 ALTER TABLE `staff_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_user`
--

DROP TABLE IF EXISTS `student_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_user` (
  `user_id` int NOT NULL,
  `Rollno` int DEFAULT NULL,
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  KEY `rollno_idx` (`Rollno`),
  CONSTRAINT `rollno` FOREIGN KEY (`Rollno`) REFERENCES `students` (`roll_no`),
  CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_user`
--

LOCK TABLES `student_user` WRITE;
/*!40000 ALTER TABLE `student_user` DISABLE KEYS */;
INSERT INTO `student_user` VALUES (5,18110021),(1,18110172),(7,19110015),(10,20110023);
/*!40000 ALTER TABLE `student_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `roll_no` int NOT NULL,
  `hostel` varchar(45) DEFAULT NULL,
  `room_no` int DEFAULT NULL,
  `Discipline` varchar(45) DEFAULT NULL,
  `Home_contact_no` bigint DEFAULT NULL,
  PRIMARY KEY (`roll_no`),
  UNIQUE KEY `roll_no_UNIQUE` (`roll_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (18110001,'Emiet',317,'Chemical Engineering',9876543200),(18110021,'Jurqia',414,'Chemistry',9987543210),(18110172,'Jurqia',420,'Mathematics',9876541410),(19110015,'Hiqom',221,'COmputer Science Engineering',9976543210),(20110023,'Hiqom',314,'Physics',9876541110);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `home_no` varchar(45) DEFAULT NULL,
  `street_name` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `pincode` bigint DEFAULT NULL,
  `Contact_no` bigint DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Tanmay','tanmay@iitgn.com','1999-10-21','male',22,'15','Mall Road','Gwalior','Madhya Pradesh',474001,9752103275),(2,'Atul','atul@iitgn.com','1999-08-15','male',22,'1','Jump Street','Gandhinagar','Gujarat',382355,9876543210),(3,'Amish','amish@iitgn.com','1999-10-01','male',22,'5','new Street','Ahmedabad','Gujarat',382356,9874561230),(4,'Anas','anas@iitgn.com','1999-11-23','male',22,'44','mg road','Jhansi','Uttar Pradesh',541256,7894561230),(5,'Jaydeep','jaydeep@iitgn.com','1999-07-07','male',22,'74','city centre road','Chandigarh',NULL,145203,898956562323),(6,'Dhruvin','dhruvin@iitgn.com','2001-02-14','male',21,'32','avengers road','Delhi','Delhi',111000,8998775222),(7,'Harsh','harsh@iitgn.com','1999-02-23','male',23,'74','sector 22','Bangaluru','Karnataka',165984,7890222111),(8,'Kartik','kartik@iitgn.com','1999-03-15','male',23,'8','main street','Chennai','Tamil Nadu',561774,8888999922),(9,'Harish','harish@iitgn.com','1999-09-08','male',22,'274','main road','Jaipur','Rajasthan',784521,8006578955),(10,'Bhavya','bhavya@iitgn.com','2000-01-15','male',22,'34','big road','Jodhpur','Rajasthan',232231,9009154474),(11,'Shivanshu','shivanshu@iitgn.com','1999-02-23','male',23,'44','small Road','Mumbai','Maharashtra',414141,9009456564),(12,'Arpit','arpit@iitgn.com','1999-11-05','male',22,'17','long Road','Pune','Maharashtra',545465,93009896652),(13,'Rahul','rahul@iitgn.com','2000-12-03','male',21,'29','road no. 55','Hyderabad','Telangana',142536,7894566540);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vaccine`
--

DROP TABLE IF EXISTS `vaccine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vaccine` (
  `vaccine_id` int NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `first_dose` date DEFAULT NULL,
  `second_dose` date DEFAULT NULL,
  `booster_dose` date DEFAULT NULL,
  `total_doses_no` int DEFAULT NULL,
  PRIMARY KEY (`vaccine_id`),
  UNIQUE KEY `vaccine_id_UNIQUE` (`vaccine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaccine`
--

LOCK TABLES `vaccine` WRITE;
/*!40000 ALTER TABLE `vaccine` DISABLE KEYS */;
INSERT INTO `vaccine` VALUES (1,'COVAXIN','2022-01-05','2022-03-25',NULL,2),(2,'COVISHIELD','2021-04-04','2021-10-21','2022-01-16',3),(3,'COVISHIELD','2022-03-20',NULL,NULL,1),(4,'COVISHIELD','2021-09-12','2021-12-25','2022-02-20',3),(5,'COVAXIN','2021-05-07','2021-12-13',NULL,2),(6,'COVAXIN','2021-04-04','2021-08-07',NULL,2),(7,'SPUTNIK','2021-04-04','2021-08-16','2022-02-28',3),(8,'COVAXIN','2021-04-04','2021-12-01','2022-01-20',3),(9,'COVISHIELD','2021-07-04','2021-09-11',NULL,2),(10,'COVISHIELD','2021-07-04','2021-09-12','2022-03-20',3),(11,'COVISHIELD','2021-07-04','2021-12-01',NULL,2),(12,'COVAXIN','2021-11-04','2022-01-31',NULL,2);
/*!40000 ALTER TABLE `vaccine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vaccine_relation`
--

DROP TABLE IF EXISTS `vaccine_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vaccine_relation` (
  `user_id` int NOT NULL,
  `vaccine_id` int NOT NULL,
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `vaccine_id_UNIQUE` (`vaccine_id`),
  CONSTRAINT `userid` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vacc_id` FOREIGN KEY (`vaccine_id`) REFERENCES `vaccine` (`vaccine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaccine_relation`
--

LOCK TABLES `vaccine_relation` WRITE;
/*!40000 ALTER TABLE `vaccine_relation` DISABLE KEYS */;
INSERT INTO `vaccine_relation` VALUES (1,1),(2,2),(3,3),(4,4),(6,5),(5,6);
/*!40000 ALTER TABLE `vaccine_relation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-31 18:02:06
