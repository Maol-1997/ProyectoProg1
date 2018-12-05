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
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=latin1;

/*Data for the table `auditoria` */

insert  into `auditoria`(`auditoria_id`,`fecha_acceso`,`user`,`response_time`,`endpoint`) values (2,'2018-12-01 18:13:29','asd',0,'asd'),(3,'2018-12-01 22:52:20','',0,'asd'),(4,'2018-12-01 22:53:23','',0,'asd'),(5,'2018-12-01 18:56:24','',0,'asd'),(6,'2018-12-01 22:57:00','',0,'asd'),(7,'2018-12-01 22:57:38','maox',0,'asd'),(8,'2018-12-01 22:57:39','maox',0,'asd'),(9,'2018-12-01 22:57:40','maox',0,'asd'),(10,'2018-12-01 22:57:40','maox',0,'asd'),(11,'2018-12-01 22:57:41','maox',0,'asd'),(12,'2018-12-01 22:57:41','maox',0,'asd'),(13,'2018-12-01 22:58:00','maox',0,'asd'),(14,'2018-12-01 23:08:41','maol',0,'asd'),(15,'2018-12-01 23:11:10','maox',0,'asd'),(16,'2018-12-01 23:11:50','maox',0,'asd'),(17,'2018-12-01 23:11:51','maox',0,'asd'),(18,'2018-12-01 23:11:51','maox',0,'asd'),(19,'2018-12-01 23:13:11','maox',1,'asd'),(20,'2018-12-01 23:13:21','maox',1,'asd'),(21,'2018-12-01 23:13:22','maox',1,'asd'),(22,'2018-12-01 23:13:23','maox',1,'asd'),(23,'2018-12-01 23:14:40','maox',9,'asd'),(24,'2018-12-01 23:15:04','maox',8,'asd'),(25,'2018-12-01 23:15:15','maox',7,'asd'),(26,'2018-12-01 23:15:16','maox',8,'asd'),(27,'2018-12-01 23:15:16','maox',7,'asd'),(28,'2018-12-02 16:30:12','maol',0,'listarChofer'),(29,'2018-12-02 16:48:18','maol',0,'listarChofer'),(30,'2018-12-02 16:49:02','maol',1,'agregarChofer'),(31,'2018-12-02 16:49:18','maol',1,'agregarChofer'),(32,'2018-12-02 16:50:40','maol',1,'agregarSistemaTransporte'),(33,'2018-12-02 16:51:28','maol',0,'listarSistemaTransporte'),(34,'2018-12-02 22:09:54','maol',1,'listarChofer'),(35,'2018-12-03 21:10:14','maol',0,'listarChofer'),(36,'2018-12-03 21:10:18','maol',0,'listarChofer'),(37,'2018-12-03 21:13:16','HOLA',2,'agregarChofer'),(38,'2018-12-03 21:14:10','HOLA',1.29604,'agregarChofer'),(39,'2018-12-03 21:34:00','',0.654936,'generarToken'),(40,'2018-12-03 21:34:51','maol',0.31209,'generarToken'),(41,'2018-12-03 21:34:59','maol',0.232935,'generarToken'),(42,'2018-12-03 21:38:06','maol',1.66416,'generarToken'),(43,'2018-12-03 21:38:12','maol',1.90902,'generarToken'),(44,'2018-12-03 21:38:18','maol',2.51889,'generarToken'),(45,'2018-12-03 21:45:56','maol',1.77598,'generarToken'),(46,'2018-12-03 21:46:01','maol',1.67108,'generarToken'),(47,'2018-12-03 21:47:50','maol',1.72615,'generarToken'),(48,'2018-12-03 21:50:03','maol',1.7302,'generarToken'),(49,'2018-12-03 21:50:04','maol',1.59216,'generarToken'),(50,'2018-12-03 21:50:04','maol',4.565,'generarToken'),(51,'2018-12-03 22:00:44','asdd',0.164032,'generarToken'),(52,'2018-12-03 22:00:50','asd',1.44219,'generarToken'),(53,'2018-12-03 22:22:43','maol',1.29294,'editarChofer'),(54,'2018-12-03 22:22:54','maol',1.30105,'editarChofer'),(55,'2018-12-03 22:23:06','maol',1.25504,'editarChofer'),(56,'2018-12-03 22:23:12','maol',1.15991,'editarChofer'),(57,'2018-12-03 22:23:18','maol',1.302,'editarChofer'),(58,'2018-12-05 00:00:24','maol',0.617027,'listarChofer'),(59,'2018-12-05 00:32:22','maol',0.751972,'listarChofer'),(60,'2018-12-05 00:32:26','maol',0.113964,'listarChofer'),(61,'2018-12-05 00:32:56','maol',0.1719,'listarChofer'),(62,'2018-12-05 00:33:01','maol',0.127077,'listarChofer'),(63,'2018-12-05 00:33:30','maol',0.110865,'listarChofer'),(64,'2018-12-05 00:33:32','maol',0.149965,'listarChofer'),(65,'2018-12-05 00:33:46','maol',0.108957,'listarChofer'),(66,'2018-12-05 00:35:28','maol',0.129938,'listarChofer'),(67,'2018-12-05 00:37:07','maol',0.140905,'listarChofer'),(68,'2018-12-05 00:37:56','maol',0.126123,'listarChofer'),(69,'2018-12-05 00:38:37','maol',0.126839,'listarChofer'),(70,'2018-12-05 00:39:07','maol',0.95892,'listarChofer'),(71,'2018-12-05 00:39:44','maol',0.39506,'listarChofer'),(72,'2018-12-05 00:40:09','maol',0.172853,'listarChofer'),(73,'2018-12-05 00:40:19','maol',0.144005,'listarChofer'),(74,'2018-12-05 00:40:58','maol',0.159025,'listarChofer'),(75,'2018-12-05 00:41:06','maol',0.108004,'listarChofer'),(76,'2018-12-05 00:41:08','maol',0.160933,'listarChofer'),(77,'2018-12-05 00:41:13','maol',0.29707,'listarChofer'),(78,'2018-12-05 00:41:21','maol',0.190973,'listarChofer'),(79,'2018-12-05 00:41:47','maol',0.152111,'listarChofer'),(80,'2018-12-05 00:41:52','maol',0.194073,'listarChofer'),(81,'2018-12-05 00:46:06','maol',0.571012,'listarChofer'),(82,'2018-12-05 00:46:28','maol',0.320196,'listarChofer'),(83,'2018-12-05 00:46:31','maol',0.231028,'listarChofer'),(84,'2018-12-05 00:47:16','maol',0.237942,'listarChofer'),(85,'2018-12-05 00:47:45','maol',0.228882,'listarChofer'),(86,'2018-12-05 00:47:48','maol',0.26083,'listarChofer'),(87,'2018-12-05 00:47:49','maol',0.273943,'listarChofer'),(88,'2018-12-05 00:47:49','maol',0.313044,'listarChofer'),(89,'2018-12-05 00:47:50','maol',0.359058,'listarChofer'),(90,'2018-12-05 00:48:22','maol',0.270128,'listarChofer'),(91,'2018-12-05 00:48:27','maol',0.234127,'listarChofer'),(92,'2018-12-05 00:48:28','maol',0.299931,'listarChofer'),(93,'2018-12-05 00:49:13','maol',0.334024,'listarChofer'),(94,'2018-12-05 00:51:21','maol',0.248909,'listarChofer'),(95,'2018-12-05 00:52:31','maol',0.246048,'listarChofer'),(96,'2018-12-05 00:52:33','maol',0.257015,'listarChofer'),(97,'2018-12-05 00:52:46','maol',0.226021,'listarChofer'),(98,'2018-12-05 00:56:28','maol',0.273943,'listarChofer'),(99,'2018-12-05 00:56:51','maol',0.235796,'listarChofer'),(100,'2018-12-05 00:57:14','maol',0.265121,'listarChofer'),(101,'2018-12-05 00:57:38','maol',0.128031,'listarChofer'),(102,'2018-12-05 00:58:07','maol',1.20306,'listarChofer'),(103,'2018-12-05 01:03:07','maol',0.213146,'listarChofer'),(104,'2018-12-05 01:03:12','maol',0.230074,'listarChofer'),(105,'2018-12-05 01:03:15','maol',0.200987,'listarChofer'),(106,'2018-12-05 01:03:18','maol',0.262976,'listarChofer'),(107,'2018-12-05 01:03:21','maol',0.290155,'listarChofer'),(108,'2018-12-05 01:03:28','maol',0.215054,'listarChofer'),(109,'2018-12-05 01:03:42','maol',0.215054,'listarChofer'),(110,'2018-12-05 01:03:47','maol',0.199795,'listarChofer'),(111,'2018-12-05 01:08:47','maol',0.19598,'listarChofer'),(112,'2018-12-05 01:09:00','maol',0.134945,'listarChofer'),(113,'2018-12-05 01:09:13','maol',0.0832081,'listarSistemaTransporte'),(114,'2018-12-05 01:09:21','maol',0.0960827,'listarSistemaTransporte'),(115,'2018-12-05 01:18:24','',0.340939,'listarChofer'),(116,'2018-12-05 01:19:46','franco',0.213861,'listarChofer'),(117,'2018-12-05 01:19:55','franco',0.126123,'listarChofer'),(118,'2018-12-05 01:20:19','franco',0.121117,'listarChofer'),(119,'2018-12-05 01:23:45','luis',2.56896,'agregarChofer'),(120,'2018-12-05 01:24:12','luis',1.616,'agregarChofer'),(121,'2018-12-05 01:24:59','franco',0.124931,'listarChofer'),(122,'2018-12-05 01:25:43','luis',1.47009,'agregarChofer'),(123,'2018-12-05 01:26:02','luis',1.41096,'agregarChofer'),(124,'2018-12-05 01:27:06','luis',1.38092,'agregarChofer'),(125,'2018-12-05 01:27:31','luis',1.34015,'agregarChofer'),(126,'2018-12-05 01:27:33','luis',1.302,'agregarChofer'),(127,'2018-12-05 01:27:47','luis',1.46198,'agregarChofer'),(128,'2018-12-05 01:27:54','luis',1.48296,'agregarChofer'),(129,'2018-12-05 01:28:40','luis',1.37115,'agregarChofer'),(130,'2018-12-05 01:29:14','luis',1.26696,'agregarChofer'),(131,'2018-12-05 01:29:26','luis',1.27602,'agregarChofer'),(132,'2018-12-05 01:29:37','luis',1.22404,'editarChofer'),(133,'2018-12-05 01:30:25','luis',9.03296,'editarChofer'),(134,'2018-12-05 01:37:29','luis',8.23498,'editarChofer'),(135,'2018-12-05 01:39:27','luis',1.54996,'borrarChofer'),(136,'2018-12-05 01:40:34','luis',1.48487,'borrarSistemaTransporte'),(137,'2018-12-05 01:41:37','luis',0.413895,'agregarSistemaTransporte'),(138,'2018-12-05 01:41:54','luis',1.24788,'agregarSistemaTransporte'),(139,'2018-12-05 01:41:56','luis',1.32203,'agregarSistemaTransporte'),(140,'2018-12-05 01:42:00','luis',1.42097,'agregarSistemaTransporte'),(141,'2018-12-05 01:42:14','luis',1.17683,'agregarSistemaTransporte'),(142,'2018-12-05 01:42:33','luis',1.23215,'agregarSistemaTransporte'),(143,'2018-12-05 01:43:20','luis',1.20497,'agregarSistemaTransporte'),(144,'2018-12-05 01:44:02','luis',0.0741482,'editarSistemaTransporte'),(145,'2018-12-05 01:44:19','luis',0.0641346,'editarSistemaTransporte'),(146,'2018-12-05 01:44:27','luis',0.0629425,'editarSistemaTransporte'),(147,'2018-12-05 01:44:36','luis',0.190973,'editarSistemaTransporte'),(148,'2018-12-05 01:44:53','luis',0.0648499,'editarSistemaTransporte'),(149,'2018-12-05 01:45:12','luis',0.0758171,'editarSistemaTransporte'),(150,'2018-12-05 01:45:17','luis',0.0720024,'editarSistemaTransporte'),(151,'2018-12-05 01:46:08','luis',0.109911,'editarSistemaTransporte'),(152,'2018-12-05 01:46:14','luis',0.144958,'editarSistemaTransporte'),(153,'2018-12-05 01:47:27','luis',2.58899,'editarSistemaTransporte'),(154,'2018-12-05 01:47:47','luis',2.82407,'editarSistemaTransporte'),(155,'2018-12-05 01:48:25','franco',0.084877,'listarSistemaTransporte'),(156,'2018-12-05 01:48:34','franco',0.0879765,'listarSistemaTransporte'),(157,'2018-12-05 01:49:21','luis',1.4739,'agregarChofer'),(158,'2018-12-05 01:50:16','franco',0.108957,'listarSistemaTransporte');

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `chofer` */

insert  into `chofer`(`chofer_id`,`apellido`,`nombre`,`documento`,`email`,`vehiculo_id`,`sistema_id`) values (1,'ortiz','martin',123456,'asdad@gmail.com',1,2),(2,'ayala','franco',456123,'dsasd@gmail.com',2,2),(3,'3a','ola',0,'asdasd',1,1),(4,'3a','ola',123123,'asdasd',1,1),(5,'gonzalez','luisito',1234,'sadd@gmail.com',2,1),(6,'gonzalez','luisito',1234,'sadd@gmail.com',2,1),(17,'unapellido','unnombre',0,'unemail',1,1),(19,'unapellidoooxd','unnombre',1234,'unemail',1,1);

/*Table structure for table `sistema_transporte` */

DROP TABLE IF EXISTS `sistema_transporte`;

CREATE TABLE `sistema_transporte` (
  `sistema_id` int(4) NOT NULL AUTO_INCREMENT,
  `nombresistema` varchar(50) NOT NULL DEFAULT '',
  `pais_procedencia` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sistema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `sistema_transporte` */

insert  into `sistema_transporte`(`sistema_id`,`nombresistema`,`pais_procedencia`) values (1,'taxi','argentina'),(2,'uber','chile'),(9,'remis','brasil');

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
