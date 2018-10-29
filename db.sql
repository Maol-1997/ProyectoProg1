/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.1.36-MariaDB : Database - programacion1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`programacion1` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `programacion1`;

/*Table structure for table `choferes` */

DROP TABLE IF EXISTS `choferes`;

CREATE TABLE `choferes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `dni` int(20) DEFAULT NULL,
  `vehiculoid` int(11) DEFAULT NULL,
  `tipoid` int(11) DEFAULT NULL,
  KEY `id` (`id`),
  KEY `choferes_ibfk_1` (`vehiculoid`),
  KEY `tipoid` (`tipoid`),
  CONSTRAINT `choferes_ibfk_1` FOREIGN KEY (`vehiculoid`) REFERENCES `relchofvehi` (`id`),
  CONSTRAINT `choferes_ibfk_2` FOREIGN KEY (`tipoid`) REFERENCES `reltipochof` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `choferes` */

/*Table structure for table `relchofvehi` */

DROP TABLE IF EXISTS `relchofvehi`;

CREATE TABLE `relchofvehi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `choferid` int(11) DEFAULT NULL,
  `vehiid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `chofer` (`choferid`),
  KEY `vehiculo` (`vehiid`),
  CONSTRAINT `chofer` FOREIGN KEY (`choferid`) REFERENCES `choferes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `vehiculo` FOREIGN KEY (`vehiid`) REFERENCES `vehiculos` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `relchofvehi` */

/*Table structure for table `reltipochof` */

DROP TABLE IF EXISTS `reltipochof`;

CREATE TABLE `reltipochof` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `choferid` int(11) DEFAULT NULL,
  `tipoid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `choferid` (`choferid`),
  KEY `tipoid` (`tipoid`),
  CONSTRAINT `reltipochof_ibfk_1` FOREIGN KEY (`choferid`) REFERENCES `choferes` (`id`),
  CONSTRAINT `reltipochof_ibfk_2` FOREIGN KEY (`tipoid`) REFERENCES `tipodetransporte` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `reltipochof` */

/*Table structure for table `reltipovehi` */

DROP TABLE IF EXISTS `reltipovehi`;

CREATE TABLE `reltipovehi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipoid` int(11) DEFAULT NULL,
  `vehiid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipoid` (`tipoid`),
  KEY `vehiid` (`vehiid`),
  CONSTRAINT `reltipovehi_ibfk_1` FOREIGN KEY (`tipoid`) REFERENCES `tipodetransporte` (`id`),
  CONSTRAINT `reltipovehi_ibfk_2` FOREIGN KEY (`vehiid`) REFERENCES `vehiculos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `reltipovehi` */

/*Table structure for table `tipodetransporte` */

DROP TABLE IF EXISTS `tipodetransporte`;

CREATE TABLE `tipodetransporte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `pais` varchar(30) DEFAULT NULL,
  `vehiculosid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipodetransporte_ibfk_1` (`vehiculosid`),
  CONSTRAINT `tipodetransporte_ibfk_1` FOREIGN KEY (`vehiculosid`) REFERENCES `vehiculos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipodetransporte` */

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

insert  into `usuario`(`id`,`usuario`,`clave`,`token`) values (1,'maol','6b36a9dee5b4a258744c57a7047e915c572c44bffd8b9beb15d0273764ac96da','1fc5098c6105ff2ea71b974437cebad6d426df9d9083e7339169d5090b22d9ac');

/*Table structure for table `vehiculos` */

DROP TABLE IF EXISTS `vehiculos`;

CREATE TABLE `vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(30) DEFAULT NULL,
  `modelo` varchar(30) DEFAULT NULL,
  `año` int(11) DEFAULT NULL,
  `patente` varchar(10) DEFAULT NULL,
  `choferesid` int(11) DEFAULT NULL,
  `tiposid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `choferesid` (`choferesid`),
  KEY `tiposid` (`tiposid`),
  CONSTRAINT `vehiculos_ibfk_1` FOREIGN KEY (`choferesid`) REFERENCES `relchofvehi` (`id`),
  CONSTRAINT `vehiculos_ibfk_2` FOREIGN KEY (`tiposid`) REFERENCES `reltipovehi` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vehiculos` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
