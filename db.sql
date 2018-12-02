/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.1.36-MariaDB : Database - transporte
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`transporte` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `transporte`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pass` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`id`,`pass`) values (1,'4e19e5bb768150be072e1a76050d7969acfa87890ec3f050384fb828595ce89b');

/*Table structure for table `auditoria` */

DROP TABLE IF EXISTS `auditoria`;

CREATE TABLE `auditoria` (
  `auditoria_id` int(4) NOT NULL AUTO_INCREMENT,
  `fecha_acceso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user` varchar(30) NOT NULL DEFAULT '',
  `response_time` int(4) NOT NULL DEFAULT '0' COMMENT 'tiempo en milisegundos',
  `endpoint` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`auditoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

/*Data for the table `auditoria` */

insert  into `auditoria`(`auditoria_id`,`fecha_acceso`,`user`,`response_time`,`endpoint`) values (2,'2018-12-01 18:13:29','asd',0,'asd'),(3,'2018-12-01 22:52:20','',0,'asd'),(4,'2018-12-01 22:53:23','',0,'asd'),(5,'2018-12-01 18:56:24','',0,'asd'),(6,'2018-12-01 22:57:00','',0,'asd'),(7,'2018-12-01 22:57:38','maox',0,'asd'),(8,'2018-12-01 22:57:39','maox',0,'asd'),(9,'2018-12-01 22:57:40','maox',0,'asd'),(10,'2018-12-01 22:57:40','maox',0,'asd'),(11,'2018-12-01 22:57:41','maox',0,'asd'),(12,'2018-12-01 22:57:41','maox',0,'asd'),(13,'2018-12-01 22:58:00','maox',0,'asd'),(14,'2018-12-01 23:08:41','maol',0,'asd'),(15,'2018-12-01 23:11:10','maox',0,'asd'),(16,'2018-12-01 23:11:50','maox',0,'asd'),(17,'2018-12-01 23:11:51','maox',0,'asd'),(18,'2018-12-01 23:11:51','maox',0,'asd'),(19,'2018-12-01 23:13:11','maox',1,'asd'),(20,'2018-12-01 23:13:21','maox',1,'asd'),(21,'2018-12-01 23:13:22','maox',1,'asd'),(22,'2018-12-01 23:13:23','maox',1,'asd'),(23,'2018-12-01 23:14:40','maox',9,'asd'),(24,'2018-12-01 23:15:04','maox',8,'asd'),(25,'2018-12-01 23:15:15','maox',7,'asd'),(26,'2018-12-01 23:15:16','maox',8,'asd'),(27,'2018-12-01 23:15:16','maox',7,'asd');

/*Table structure for table `chofer` */

DROP TABLE IF EXISTS `chofer`;

CREATE TABLE `chofer` (
  `chofer_id` int(4) NOT NULL AUTO_INCREMENT,
  `apellido` varchar(100) NOT NULL DEFAULT '',
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `documento` decimal(11,0) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `vehiculo_id` int(4) DEFAULT NULL,
  `sistema_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`chofer_id`),
  KEY `documento` (`documento`),
  KEY `vehiculo_id` (`vehiculo_id`),
  KEY `sistema_id` (`sistema_id`),
  CONSTRAINT `chofer_ibfk_1` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculo` (`vehiculo_id`),
  CONSTRAINT `chofer_ibfk_2` FOREIGN KEY (`sistema_id`) REFERENCES `sistema_transporte` (`sistema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `chofer` */

insert  into `chofer`(`chofer_id`,`apellido`,`nombre`,`documento`,`email`,`vehiculo_id`,`sistema_id`) values (1,'ortiz','martin',123456,'asdad@gmail.com',1,2),(2,'ayala','franco',456123,'dsasd@gmail.com',2,2);

/*Table structure for table `sistema_transporte` */

DROP TABLE IF EXISTS `sistema_transporte`;

CREATE TABLE `sistema_transporte` (
  `sistema_id` int(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '',
  `pais_procedencia` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sistema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `sistema_transporte` */

insert  into `sistema_transporte`(`sistema_id`,`nombre`,`pais_procedencia`) values (1,'taxi','argentina'),(2,'uber','chile');

/*Table structure for table `sistema_vehiculo` */

DROP TABLE IF EXISTS `sistema_vehiculo`;

CREATE TABLE `sistema_vehiculo` (
  `sistemavehiculo_id` int(4) NOT NULL AUTO_INCREMENT,
  `vehiculo_id` int(4) DEFAULT NULL,
  `sistema_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`sistemavehiculo_id`),
  UNIQUE KEY `vehiculo_id` (`vehiculo_id`,`sistema_id`),
  KEY `sistema_id` (`sistema_id`),
  CONSTRAINT `sistema_vehiculo_ibfk_1` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculo` (`vehiculo_id`),
  CONSTRAINT `sistema_vehiculo_ibfk_2` FOREIGN KEY (`sistema_id`) REFERENCES `sistema_transporte` (`sistema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `sistema_vehiculo` */

insert  into `sistema_vehiculo`(`sistemavehiculo_id`,`vehiculo_id`,`sistema_id`) values (1,1,1),(2,1,2),(3,2,2);

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(80) DEFAULT NULL,
  `clave` varchar(80) DEFAULT NULL,
  `token` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `usuario` */

insert  into `usuario`(`id`,`usuario`,`clave`,`token`) values (1,'maol','4725db75d8527f7956a5b5c8ac5ff280b90bd501efe0dbe97ea6f39e18578283','f7bbd1ca40a6a67983b3d0b99c6368b3eabaa140b5456450deda450dc4aca836');

/*Table structure for table `vehiculo` */

DROP TABLE IF EXISTS `vehiculo`;

CREATE TABLE `vehiculo` (
  `vehiculo_id` int(4) NOT NULL AUTO_INCREMENT,
  `patente` varchar(10) NOT NULL DEFAULT '',
  `anho_patente` smallint(2) NOT NULL DEFAULT '0',
  `anho_fabricacion` smallint(2) NOT NULL DEFAULT '0',
  `marca` varchar(100) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`vehiculo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `vehiculo` */

insert  into `vehiculo`(`vehiculo_id`,`patente`,`anho_patente`,`anho_fabricacion`,`marca`,`modelo`) values (1,'ab 123',1990,1990,'nose','cualquiera'),(2,'xd 456',2017,2005,'alguna','jaja23');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
