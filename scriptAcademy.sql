-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: academy
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.16.04.1

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
-- Current Database: `academy`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `academy` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `academy`;

--
-- Table structure for table `addreses`
--

DROP TABLE IF EXISTS `addreses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addreses` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstAddress` varchar(100) NOT NULL,
  `otherAddress` varchar(100) DEFAULT NULL,
  `cities_city_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`),
  KEY `addreses_cities` (`cities_city_id`),
  CONSTRAINT `addreses_cities` FOREIGN KEY (`cities_city_id`) REFERENCES `cities` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addreses`
--

LOCK TABLES `addreses` WRITE;
/*!40000 ALTER TABLE `addreses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addreses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspirants`
--

DROP TABLE IF EXISTS `aspirants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspirants` (
  `aspirant_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `secondName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) NOT NULL,
  `secondLastname` varchar(50) DEFAULT NULL,
  `gender` enum('F','M') NOT NULL,
  `DUI` varchar(45) DEFAULT NULL,
  `docIndetificationP` varchar(70) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`aspirant_id`),
  UNIQUE KEY `DUI` (`DUI`),
  UNIQUE KEY `docIndetificationP` (`docIndetificationP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspirants`
--

LOCK TABLES `aspirants` WRITE;
/*!40000 ALTER TABLE `aspirants` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspirants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspirants_studiesCenters`
--

DROP TABLE IF EXISTS `aspirants_studiesCenters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspirants_studiesCenters` (
  `aspirant_studyCenter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aspirants_aspirant_id` int(10) unsigned NOT NULL,
  `studiesCenters_studyCenter_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`aspirant_studyCenter_id`),
  KEY `aspirants_studiesCenters_aspirants` (`aspirants_aspirant_id`),
  KEY `aspirants_studiesCenters_studiesCenters` (`studiesCenters_studyCenter_id`),
  CONSTRAINT `aspirants_studiesCenters_aspirants` FOREIGN KEY (`aspirants_aspirant_id`) REFERENCES `aspirants` (`aspirant_id`),
  CONSTRAINT `aspirants_studiesCenters_studiesCenters` FOREIGN KEY (`studiesCenters_studyCenter_id`) REFERENCES `studiesCenters` (`studyCenter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspirants_studiesCenters`
--

LOCK TABLES `aspirants_studiesCenters` WRITE;
/*!40000 ALTER TABLE `aspirants_studiesCenters` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspirants_studiesCenters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caseFiles`
--

DROP TABLE IF EXISTS `caseFiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caseFiles` (
  `caseFile_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `modality` enum('Full Kodigo','Butcamp') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`caseFile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caseFiles`
--

LOCK TABLES `caseFiles` WRITE;
/*!40000 ALTER TABLE `caseFiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `caseFiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `city_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `departaments_departament_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`city_id`),
  KEY `cities_departaments` (`departaments_departament_id`),
  CONSTRAINT `cities_departaments` FOREIGN KEY (`departaments_departament_id`) REFERENCES `departaments` (`departament_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `country_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departaments`
--

DROP TABLE IF EXISTS `departaments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departaments` (
  `departament_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `countries_country_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`departament_id`),
  KEY `departaments_countries` (`countries_country_id`),
  CONSTRAINT `departaments_countries` FOREIGN KEY (`countries_country_id`) REFERENCES `countries` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departaments`
--

LOCK TABLES `departaments` WRITE;
/*!40000 ALTER TABLE `departaments` DISABLE KEYS */;
/*!40000 ALTER TABLE `departaments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devices` (
  `device_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `medicalRecords_medicalRecord_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`device_id`),
  KEY `devices_medicalRecords` (`medicalRecords_medicalRecord_id`),
  CONSTRAINT `devices_medicalRecords` FOREIGN KEY (`medicalRecords_medicalRecord_id`) REFERENCES `medicalRecords` (`medicalRecord_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `families`
--

DROP TABLE IF EXISTS `families`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `families` (
  `family_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) NOT NULL,
  `othername` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) NOT NULL,
  `otherlastname` varchar(30) DEFAULT NULL,
  `gender` enum('M','F') NOT NULL,
  `representative` enum('No','Si') NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `parient` enum('Father','Mother','Sister','Brother','Grandmother','Grandfather','uncle','Aunt','Other') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`family_id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `families`
--

LOCK TABLES `families` WRITE;
/*!40000 ALTER TABLE `families` DISABLE KEYS */;
/*!40000 ALTER TABLE `families` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `families_works`
--

DROP TABLE IF EXISTS `families_works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `families_works` (
  `family_work_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `families_family_id` int(10) unsigned NOT NULL,
  `works_work_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`family_work_id`),
  KEY `families_works_works` (`works_work_id`),
  KEY `families_works_families` (`families_family_id`),
  CONSTRAINT `families_works_families` FOREIGN KEY (`families_family_id`) REFERENCES `families` (`family_id`),
  CONSTRAINT `families_works_works` FOREIGN KEY (`works_work_id`) REFERENCES `works` (`work_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `families_works`
--

LOCK TABLES `families_works` WRITE;
/*!40000 ALTER TABLE `families_works` DISABLE KEYS */;
/*!40000 ALTER TABLE `families_works` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homes`
--

DROP TABLE IF EXISTS `homes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homes` (
  `home_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantitatP` int(2) DEFAULT NULL,
  `addreses_address_id` int(10) unsigned NOT NULL,
  `caseFiles_caseFile_id` int(10) unsigned NOT NULL,
  `state` enum('Own','Rented','Mortgaged') NOT NULL,
  `structure` enum('Adobe','Block') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`home_id`),
  KEY `homes_addreses` (`addreses_address_id`),
  KEY `homes_caseFiles` (`caseFiles_caseFile_id`),
  CONSTRAINT `homes_addreses` FOREIGN KEY (`addreses_address_id`) REFERENCES `addreses` (`address_id`),
  CONSTRAINT `homes_caseFiles` FOREIGN KEY (`caseFiles_caseFile_id`) REFERENCES `caseFiles` (`caseFile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homes`
--

LOCK TABLES `homes` WRITE;
/*!40000 ALTER TABLE `homes` DISABLE KEYS */;
/*!40000 ALTER TABLE `homes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homes_families`
--

DROP TABLE IF EXISTS `homes_families`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homes_families` (
  `homes_families_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `homes_home_id` int(10) unsigned NOT NULL,
  `families_family_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`homes_families_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homes_families`
--

LOCK TABLES `homes_families` WRITE;
/*!40000 ALTER TABLE `homes_families` DISABLE KEYS */;
/*!40000 ALTER TABLE `homes_families` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homes_moviliaries`
--

DROP TABLE IF EXISTS `homes_moviliaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homes_moviliaries` (
  `home_moviliary_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `moviliaries_moviliary_id` int(10) unsigned NOT NULL,
  `homes_home_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`home_moviliary_id`),
  KEY `homes_moviliaries_homes` (`homes_home_id`),
  KEY `homes_moviliaries_moviliaries` (`moviliaries_moviliary_id`),
  CONSTRAINT `homes_moviliaries_homes` FOREIGN KEY (`homes_home_id`) REFERENCES `homes` (`home_id`),
  CONSTRAINT `homes_moviliaries_moviliaries` FOREIGN KEY (`moviliaries_moviliary_id`) REFERENCES `moviliaries` (`moviliary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homes_moviliaries`
--

LOCK TABLES `homes_moviliaries` WRITE;
/*!40000 ALTER TABLE `homes_moviliaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `homes_moviliaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homes_services`
--

DROP TABLE IF EXISTS `homes_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homes_services` (
  `home_service_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `services_service_id` int(10) unsigned NOT NULL,
  `homes_home_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`home_service_id`),
  KEY `homes_services_homes` (`homes_home_id`),
  KEY `homes_services_services` (`services_service_id`),
  CONSTRAINT `homes_services_homes` FOREIGN KEY (`homes_home_id`) REFERENCES `homes` (`home_id`),
  CONSTRAINT `homes_services_services` FOREIGN KEY (`services_service_id`) REFERENCES `services` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homes_services`
--

LOCK TABLES `homes_services` WRITE;
/*!40000 ALTER TABLE `homes_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `homes_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `implants`
--

DROP TABLE IF EXISTS `implants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `implants` (
  `implant_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `medicalRecords_medicalRecord_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`implant_id`),
  KEY `implants_medicalRecords` (`medicalRecords_medicalRecord_id`),
  CONSTRAINT `implants_medicalRecords` FOREIGN KEY (`medicalRecords_medicalRecord_id`) REFERENCES `medicalRecords` (`medicalRecord_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `implants`
--

LOCK TABLES `implants` WRITE;
/*!40000 ALTER TABLE `implants` DISABLE KEYS */;
/*!40000 ALTER TABLE `implants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicalRecords`
--

DROP TABLE IF EXISTS `medicalRecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicalRecords` (
  `medicalRecord_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `diseasess` varchar(170) DEFAULT NULL,
  `currentMedication` varchar(107) DEFAULT NULL,
  `chronicDisease` varchar(107) DEFAULT NULL,
  `surgicalHistory` varchar(90) DEFAULT NULL,
  `allergie` varchar(70) DEFAULT NULL,
  `aspirants_aspirant_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`medicalRecord_id`),
  KEY `medicalRecords_aspirants` (`aspirants_aspirant_id`),
  CONSTRAINT `medicalRecords_aspirants` FOREIGN KEY (`aspirants_aspirant_id`) REFERENCES `aspirants` (`aspirant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicalRecords`
--

LOCK TABLES `medicalRecords` WRITE;
/*!40000 ALTER TABLE `medicalRecords` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicalRecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moviliaries`
--

DROP TABLE IF EXISTS `moviliaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moviliaries` (
  `moviliary_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`moviliary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moviliaries`
--

LOCK TABLES `moviliaries` WRITE;
/*!40000 ALTER TABLE `moviliaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `moviliaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remesas`
--

DROP TABLE IF EXISTS `remesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remesas` (
  `remesa_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantity` double(6,2) DEFAULT NULL,
  `families_family_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`remesa_id`),
  KEY `remesas_families` (`families_family_id`),
  CONSTRAINT `remesas_families` FOREIGN KEY (`families_family_id`) REFERENCES `families` (`family_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remesas`
--

LOCK TABLES `remesas` WRITE;
/*!40000 ALTER TABLE `remesas` DISABLE KEYS */;
/*!40000 ALTER TABLE `remesas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `service_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studiesCenters`
--

DROP TABLE IF EXISTS `studiesCenters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studiesCenters` (
  `studyCenter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(107) NOT NULL,
  `mensuality` double(5,2) DEFAULT '0.00',
  `schedules` time(3) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `academyLevel` varchar(50) NOT NULL,
  `state` enum('Inactivo','Activo') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`studyCenter_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studiesCenters`
--

LOCK TABLES `studiesCenters` WRITE;
/*!40000 ALTER TABLE `studiesCenters` DISABLE KEYS */;
/*!40000 ALTER TABLE `studiesCenters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works`
--

DROP TABLE IF EXISTS `works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `works` (
  `work_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  `type` enum('Personal','Enterprice') NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `schedules` varchar(107) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `workingTime` varchar(107) DEFAULT NULL,
  `salary` double(6,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`work_id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works`
--

LOCK TABLES `works` WRITE;
/*!40000 ALTER TABLE `works` DISABLE KEYS */;
/*!40000 ALTER TABLE `works` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-11 23:59:09
