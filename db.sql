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
  `response_time` float NOT NULL DEFAULT '0' COMMENT 'tiempo en milisegundos',
  `endpoint` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`auditoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

/*Data for the table `auditoria` */

insert  into `auditoria`(`auditoria_id`,`fecha_acceso`,`user`,`response_time`,`endpoint`) values (2,'2018-12-01 18:13:29','asd',0,'asd'),(3,'2018-12-01 22:52:20','',0,'asd'),(4,'2018-12-01 22:53:23','',0,'asd'),(5,'2018-12-01 18:56:24','',0,'asd'),(6,'2018-12-01 22:57:00','',0,'asd'),(7,'2018-12-01 22:57:38','maox',0,'asd'),(8,'2018-12-01 22:57:39','maox',0,'asd'),(9,'2018-12-01 22:57:40','maox',0,'asd'),(10,'2018-12-01 22:57:40','maox',0,'asd'),(11,'2018-12-01 22:57:41','maox',0,'asd'),(12,'2018-12-01 22:57:41','maox',0,'asd'),(13,'2018-12-01 22:58:00','maox',0,'asd'),(14,'2018-12-01 23:08:41','maol',0,'asd'),(15,'2018-12-01 23:11:10','maox',0,'asd'),(16,'2018-12-01 23:11:50','maox',0,'asd'),(17,'2018-12-01 23:11:51','maox',0,'asd'),(18,'2018-12-01 23:11:51','maox',0,'asd'),(19,'2018-12-01 23:13:11','maox',1,'asd'),(20,'2018-12-01 23:13:21','maox',1,'asd'),(21,'2018-12-01 23:13:22','maox',1,'asd'),(22,'2018-12-01 23:13:23','maox',1,'asd'),(23,'2018-12-01 23:14:40','maox',9,'asd'),(24,'2018-12-01 23:15:04','maox',8,'asd'),(25,'2018-12-01 23:15:15','maox',7,'asd'),(26,'2018-12-01 23:15:16','maox',8,'asd'),(27,'2018-12-01 23:15:16','maox',7,'asd'),(28,'2018-12-02 16:30:12','maol',0,'listarChofer'),(29,'2018-12-02 16:48:18','maol',0,'listarChofer'),(30,'2018-12-02 16:49:02','maol',1,'agregarChofer'),(31,'2018-12-02 16:49:18','maol',1,'agregarChofer'),(32,'2018-12-02 16:50:40','maol',1,'agregarSistemaTransporte'),(33,'2018-12-02 16:51:28','maol',0,'listarSistemaTransporte'),(34,'2018-12-02 22:09:54','maol',1,'listarChofer'),(35,'2018-12-03 21:10:14','maol',0,'listarChofer'),(36,'2018-12-03 21:10:18','maol',0,'listarChofer'),(37,'2018-12-03 21:13:16','HOLA',2,'agregarChofer'),(38,'2018-12-03 21:14:10','HOLA',1.29604,'agregarChofer'),(39,'2018-12-03 21:34:00','',0.654936,'generarToken'),(40,'2018-12-03 21:34:51','maol',0.31209,'generarToken'),(41,'2018-12-03 21:34:59','maol',0.232935,'generarToken'),(42,'2018-12-03 21:38:06','maol',1.66416,'generarToken'),(43,'2018-12-03 21:38:12','maol',1.90902,'generarToken'),(44,'2018-12-03 21:38:18','maol',2.51889,'generarToken'),(45,'2018-12-03 21:45:56','maol',1.77598,'generarToken'),(46,'2018-12-03 21:46:01','maol',1.67108,'generarToken'),(47,'2018-12-03 21:47:50','maol',1.72615,'generarToken'),(48,'2018-12-03 21:50:03','maol',1.7302,'generarToken'),(49,'2018-12-03 21:50:04','maol',1.59216,'generarToken'),(50,'2018-12-03 21:50:04','maol',4.565,'generarToken'),(51,'2018-12-03 22:00:44','asdd',0.164032,'generarToken'),(52,'2018-12-03 22:00:50','asd',1.44219,'generarToken');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `chofer` */

insert  into `chofer`(`chofer_id`,`apellido`,`nombre`,`documento`,`email`,`vehiculo_id`,`sistema_id`) values (1,'ortiz','martin',123456,'asdad@gmail.com',1,2),(2,'ayala','franco',456123,'dsasd@gmail.com',2,2),(3,'3a','ola',0,'asdasd',1,1),(4,'3a','ola',123123,'asdasd',1,1),(5,'gonzalez','luisito',1234,'sadd@gmail.com',2,1),(6,'gonzalez','luisito',1234,'sadd@gmail.com',2,1);

/*Table structure for table `sistema_transporte` */

DROP TABLE IF EXISTS `sistema_transporte`;

CREATE TABLE `sistema_transporte` (
  `sistema_id` int(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '',
  `pais_procedencia` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sistema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `sistema_transporte` */

insert  into `sistema_transporte`(`sistema_id`,`nombre`,`pais_procedencia`) values (1,'taxi','argentina'),(2,'uber','chile'),(3,'yo','ola');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `usuario` */

insert  into `usuario`(`id`,`usuario`,`clave`,`token`) values (1,'maol','4725db75d8527f7956a5b5c8ac5ff280b90bd501efe0dbe97ea6f39e18578283','1675e416e5388d79e02c6b725bba1da031ef7c7b8e74e824c5ed50ce62a64071'),(2,'franco','44bfa124887d298aeab349f1e280f74b696e81658861ed98efe768631949025e','d68d8190c8639fb135c59401dd57209d6ebd6dff61f49e5a0677a889ea809ef4'),(3,'luis','f456fe1db0ead5ce5102c1920513017b26386f3c6e90cbd224067726ce9f1869','fedd0a9b34cc40e85618338795410b100dc2265cf3b1a30ffd86ef17127be0fb'),(4,'asd','85135f3c6bfe9df1735f8806f045ae73cece7219f7840d8e7e9297a7f846b48a','fa85d303c6cb687dfb4d59fff06587726867522b8260dfff17afdc9ca8bfe760');

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
