CREATE DATABASE /*!32312 IF NOT EXISTS*/ academy /*!40100 DEFAULT CHARACTER SET latin1 */;

USE academy;
SHOW databases;
SHOW TABLES;
CREATE TABLE `country` (
  `country_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `department` (
  `department_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `department` varchar(45) NOT NULL,
  `country_country_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`department_id`),
  KEY `department_country` (`country_country_id`),
  CONSTRAINT `department_country` FOREIGN KEY (`country_country_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `city` (
  `city_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(45) NOT NULL,
  `department_department_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`city_id`),
  KEY `city_department` (`department_department_id`),
  CONSTRAINT `cities_departaments` FOREIGN KEY (`department_department_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `address` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
   housing_number varchar(100) NOT NULL,
   street_name varchar(120) NOT NULL,
   type_street varchar(100) NOT NULL,
  `otherAddress` varchar(100) DEFAULT NULL,
  `city_city_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`address_id`),
  KEY `address_city` (`city_city_id`),
  CONSTRAINT `address_city` FOREIGN KEY (`city_city_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `service` (
  `service_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `home_service` (
  `home_service_id` int unsigned NOT NULL AUTO_INCREMENT,
  `service_service_id` int unsigned NOT NULL,
  `home_home_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`home_service_id`),
  KEY `fk_home_service_home` (`home_home_id`),
  KEY `fk_home_service_service` (`service_service_id`),
  CONSTRAINT `fk_home_service_home` FOREIGN KEY (`home_home_id`) REFERENCES `home` (`home_id`),
  CONSTRAINT `fk_home_service_service` FOREIGN KEY (`service_service_id`) REFERENCES `service` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `moviliary` (
  `moviliary_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `moviliary` varchar(100) NOT NULL,
   quantity_moviliary int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`moviliary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `home_moviliary` (
  `home_moviliary_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `moviliary_moviliary_id` int(10) unsigned NOT NULL,
  `home_home_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`home_moviliary_id`),
  KEY `fk_home_moviliary_home` (`home_home_id`),
  KEY `fk_home_moviliary_moviliary` (`moviliary_moviliary_id`),
  CONSTRAINT `fk_home_moviliary_home` FOREIGN KEY (`home_home_id`) REFERENCES `home` (`home_id`),
  CONSTRAINT `fk_homes_moviliary_moviliary` FOREIGN KEY (`moviliary_moviliary_id`) REFERENCES `moviliary` (`moviliary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `home` (
  `home_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantitatP` int(2) DEFAULT NULL,
   zone varchar(70) NOT NULL,
   type_floor enum('ceramics','land','brick','other') NOT NULL,
  `address_address_id` int(10) unsigned NOT NULL,
  `aspirant_aspirant_id` int(10) unsigned NOT NULL,
  `state` enum('Own','Rented','Mortgaged') NOT NULL,
  `structure` enum('Adobe','Block') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`home_id`),
  KEY `fk_home_address` (`address_address_id`),
  KEY `fk_home_aspirant` (`aspirant_aspirant_id`),
  CONSTRAINT `fk_home_address` FOREIGN KEY (`address_address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `fk_home_aspirant` FOREIGN KEY (`aspirant_aspirant_id`) REFERENCES `aspirant` (`aspirant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `home_family` (
  `home_family_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `home_home_id` int(10) unsigned NOT NULL,
  `family_family_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`home_family_id`),
  KEY `fk_home_family_home` (`home_home_id`),
  KEY `fk_home_family_family` (`family_family_id`),
  CONSTRAINT `fk_home_family_family` FOREIGN KEY (`family_family_id`) REFERENCES `family` (`family_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_home_family_home` FOREIGN KEY (`home_home_id`) REFERENCES `home` (`home_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `medicalRecord` (
  `medicalRecord_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `diseasess` varchar(170) DEFAULT NULL,
  `currentMedication` varchar(107) DEFAULT NULL,
  `chronicDisease` varchar(107) DEFAULT NULL,
  `surgicalHistory` varchar(90) DEFAULT NULL,
  `allergie` varchar(70) DEFAULT NULL,
  `aspirant_aspirant_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`medicalRecord_id`),
  KEY `fk_medicalRecord_aspirant` (`aspirant_aspirant_id`),
  CONSTRAINT `fk_medicalRecord_aspirant` FOREIGN KEY (`aspirant_aspirant_id`) REFERENCES `aspirant` (`aspirant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `aspirant` (
  `aspirant_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `secondName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) NOT NULL,
  `secondLastname` varchar(50) DEFAULT NULL,
  `gender` enum('Female','Male') NOT NULL,
  `birthdate` datetime NOT NULL,
  `DUI` varchar(45) DEFAULT NULL,
  `docIndetificationP` varchar(70) DEFAULT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `state_academy` enum('Inactivo','Activo') NOT NULL,
  `academyLevel` varchar(50) NOT NULL,
  `schedules` varchar(75),
  `caseFile_caseFile_id` int(10) unsigned NOT NULL,
  `studyCenter_studyCenter_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`aspirant_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `DUI` (`DUI`),
  UNIQUE KEY `docIndetificationP` (`docIndetificationP`),
  KEY `fk_aspirant_caseFile` (`caseFile_caseFile_id`),
  KEY `fk_aspirant_studyCenter` (`studyCenter_studyCenter_id`),
  CONSTRAINT `fk_aspirant_caseFile` FOREIGN KEY (`caseFile_caseFile_id`) REFERENCES `caseFile` (`caseFile_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_aspirant_studyCenter` FOREIGN KEY (`studyCenter_studyCenter_id`) REFERENCES `studyCenter` (`studyCenter_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `studyCenter` (
  `studyCenter_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(107) NOT NULL,
  `email` varchar(70) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`studyCenter_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `caseFile` (
  `caseFile_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `modality` enum('Full Kodigo','Butcamp') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`caseFile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `work` (
  `work_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  `type` enum('Personal','Enterprice') NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`work_id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `family_work` (
  `family_work_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `family_family_id` int(10) unsigned NOT NULL,
  `schedules` varchar(150) DEFAULT NULL,
  `salary` double(6,2) NOT NULL,
  `work_work_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`family_work_id`),
  KEY `fk_family_work_work` (`work_work_id`),
  KEY `fk_family_work_family` (`family_family_id`),
  CONSTRAINT `fk_family_work_family` FOREIGN KEY (`family_family_id`) REFERENCES `family` (`family_id`),
  CONSTRAINT `fk_family_work_work` FOREIGN KEY (`work_work_id`) REFERENCES `work` (`work_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `family` (
  `family_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) NOT NULL,
  `othername` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) NOT NULL,
  `otherlastname` varchar(30) DEFAULT NULL,
  `gender` enum('Female','Male') DEFAULT NULL,
  `representative` enum('false','true') DEFAULT NULL,
   lives_at_home enum('SI','NO') NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `parient` enum('Father','Mother','Sister','Brother','Grandmother','Grandfather','uncle','Aunt','Other') DEFAULT NULL,
   typeHelp_typeHelp_id int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`family_id`),
  UNIQUE KEY `phone` (`phone`),
  KEY `fk_family_typeHelp` (`typeHelp_typeHelp_id`),
  CONSTRAINT `fk_family_typeHelp` FOREIGN KEY (`typeHelp_typeHelp_id`) REFERENCES `typeHelp` (`typeHelp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE typeHelp (
 `typeHelp_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(70) NOT NULL,
  quantity double(6,2),
  PRIMARY KEY (`typeHelp_id`),
  UNIQUE KEY `name` (`name`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
