/*
SQLyog Community v13.1.9 (64 bit)
MySQL - 10.1.37-MariaDB : Database - dr_movil
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dr_movil` /*!40100 DEFAULT CHARACTER SET utf32 */;

USE `dr_movil`;

/*Table structure for table `antecedentes_gineco` */

DROP TABLE IF EXISTS `antecedentes_gineco`;

CREATE TABLE `antecedentes_gineco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gestas` int(11) DEFAULT NULL,
  `partos` int(11) DEFAULT NULL,
  `abortos` int(11) DEFAULT NULL,
  `hijos_vivos` int(11) DEFAULT NULL,
  `hijos_muertos` int(11) DEFAULT NULL,
  `fur` int(11) DEFAULT NULL,
  `cstp` int(11) DEFAULT NULL,
  `otros` varchar(255) DEFAULT NULL,
  `paciente_id` int(11) DEFAULT NULL,
  `registrado_por` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paciente_id` (`paciente_id`),
  KEY `registrado_por` (`registrado_por`),
  CONSTRAINT `antecedentes_gineco_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id`),
  CONSTRAINT `antecedentes_gineco_ibfk_2` FOREIGN KEY (`registrado_por`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `antecedentes_gineco` */

/*Table structure for table `antecedentes_paciente` */

DROP TABLE IF EXISTS `antecedentes_paciente`;

CREATE TABLE `antecedentes_paciente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medicos` varchar(255) DEFAULT NULL,
  `mentales` varchar(255) DEFAULT NULL,
  `quirurgicos` varchar(255) DEFAULT NULL,
  `traumaticos` varchar(255) DEFAULT NULL,
  `alergicos` varchar(255) DEFAULT NULL,
  `paciente_id` int(11) DEFAULT NULL,
  `registrado_por` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paciente_id` (`paciente_id`),
  KEY `registrado_por` (`registrado_por`),
  CONSTRAINT `antecedentes_paciente_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id`),
  CONSTRAINT `antecedentes_paciente_ibfk_2` FOREIGN KEY (`registrado_por`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `antecedentes_paciente` */

insert  into `antecedentes_paciente`(`id`,`medicos`,`mentales`,`quirurgicos`,`traumaticos`,`alergicos`,`paciente_id`,`registrado_por`,`created_at`,`updated_at`) values 
(6,'Registro médicos. ',NULL,NULL,NULL,NULL,21,5,NULL,NULL);

/*Table structure for table `clinica` */

DROP TABLE IF EXISTS `clinica`;

CREATE TABLE `clinica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `clinica` */

insert  into `clinica`(`id`,`nombre`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Dr Móvil 1',NULL,NULL,NULL);

/*Table structure for table `examen_fisico` */

DROP TABLE IF EXISTS `examen_fisico`;

CREATE TABLE `examen_fisico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `peso` int(11) DEFAULT NULL,
  `talla` int(11) DEFAULT NULL,
  `pulso` int(11) DEFAULT NULL,
  `p_a` int(11) DEFAULT NULL,
  `f_r` int(11) DEFAULT NULL,
  `t` int(11) DEFAULT NULL,
  `fcf` int(11) DEFAULT NULL,
  `examenes_realizados` varchar(4000) DEFAULT NULL,
  `impresion_clinica` varchar(4000) DEFAULT NULL,
  `motivo_referencia` varchar(4000) DEFAULT NULL,
  `tratamiento_y_manejo` varchar(4000) DEFAULT NULL,
  `paciente_id` int(11) DEFAULT NULL,
  `registrado_por` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paciente_id` (`paciente_id`),
  KEY `registrado_por` (`registrado_por`),
  CONSTRAINT `examen_fisico_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id`),
  CONSTRAINT `examen_fisico_ibfk_2` FOREIGN KEY (`registrado_por`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `examen_fisico` */

insert  into `examen_fisico`(`id`,`peso`,`talla`,`pulso`,`p_a`,`f_r`,`t`,`fcf`,`examenes_realizados`,`impresion_clinica`,`motivo_referencia`,`tratamiento_y_manejo`,`paciente_id`,`registrado_por`,`created_at`,`updated_at`) values 
(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Exámenes realizados. ',NULL,NULL,NULL,21,5,NULL,NULL),
(5,150,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,5,'2022-03-29 09:23:27','2022-03-29 09:23:27');

/*Table structure for table `ficha_paciente` */

DROP TABLE IF EXISTS `ficha_paciente`;

CREATE TABLE `ficha_paciente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `componente` varchar(255) DEFAULT NULL,
  `accion` varchar(255) DEFAULT NULL,
  `tabla` varchar(100) DEFAULT NULL,
  `store` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ficha_paciente` */

insert  into `ficha_paciente`(`id`,`nombre`,`orden`,`componente`,`accion`,`tabla`,`store`) values 
(1,'Datos Generales',1,'FormGeneral','save','paciente','patient'),
(2,'Antecedentes Médicos',2,'FormMedicalHistory','update','antecedentes_paciente','medical_history'),
(3,'Antecedentes Gineco-Obstétricos',3,'FormObstetric','update','antecedentes_gineco','obstetric'),
(4,'Examen Físico',4,'FormPhysicalExam','update','examen_fisico','physical_exam'),
(5,'Actualización',5,'FormReferral','update','ficha_referencia','reference_sheet');

/*Table structure for table `ficha_referencia` */

DROP TABLE IF EXISTS `ficha_referencia`;

CREATE TABLE `ficha_referencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resumen_evolucion` varchar(4000) DEFAULT NULL,
  `tratamiento` varchar(4000) DEFAULT NULL,
  `diagnostico` varchar(4000) DEFAULT NULL,
  `recomendaciones` varchar(4000) DEFAULT NULL,
  `paciente_id` int(11) DEFAULT NULL,
  `registrado_por` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32;

/*Data for the table `ficha_referencia` */

insert  into `ficha_referencia`(`id`,`resumen_evolucion`,`tratamiento`,`diagnostico`,`recomendaciones`,`paciente_id`,`registrado_por`,`created_at`,`updated_at`) values 
(1,'Resumen de la evolución.',NULL,NULL,NULL,21,5,'2022-03-29 14:12:04','2022-03-29 14:12:04');

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `url` varchar(20) DEFAULT NULL,
  `icono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `menu` */

insert  into `menu`(`id`,`nombre`,`url`,`icono`) values 
(1,'Pacientes','patients','mdi-clipboard'),
(2,'Referidos','referrals','mdi-account-group');

/*Table structure for table `menu_rol` */

DROP TABLE IF EXISTS `menu_rol`;

CREATE TABLE `menu_rol` (
  `rol_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  KEY `rol_id` (`rol_id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `menu_rol_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`),
  CONSTRAINT `menu_rol_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `menu_rol` */

insert  into `menu_rol`(`rol_id`,`menu_id`) values 
(1,1),
(2,2);

/*Table structure for table `paciente` */

DROP TABLE IF EXISTS `paciente`;

CREATE TABLE `paciente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `historia` varchar(255) DEFAULT NULL,
  `consulta_externa` varchar(1) DEFAULT NULL,
  `emergencia` varchar(1) DEFAULT NULL,
  `ubicacion_id` int(11) DEFAULT NULL,
  `referido_a` int(11) DEFAULT NULL,
  `registrado_por` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ubicacion_id` (`ubicacion_id`),
  KEY `referido_a` (`referido_a`),
  KEY `registrado_por` (`registrado_por`),
  CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicacion` (`id`),
  CONSTRAINT `paciente_ibfk_2` FOREIGN KEY (`referido_a`) REFERENCES `servicio_salud` (`id`),
  CONSTRAINT `paciente_ibfk_3` FOREIGN KEY (`registrado_por`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

/*Data for the table `paciente` */

insert  into `paciente`(`id`,`nombre`,`telefono`,`edad`,`sexo`,`direccion`,`historia`,`consulta_externa`,`emergencia`,`ubicacion_id`,`referido_a`,`registrado_por`,`created_at`,`updated_at`,`deleted_at`) values 
(21,'Herson Roely Chur Chinchilla','44522476',32,'M',NULL,NULL,'S','S',1,1,5,NULL,'2022-03-29 09:20:54',NULL),
(22,'Miguel Gonzalez',NULL,24,NULL,NULL,NULL,'S','S',1,2,5,'2022-03-29 09:21:53','2022-03-29 09:23:08',NULL),
(24,'Ana Pérez ',NULL,18,'F',NULL,NULL,NULL,'S',2,2,5,'2022-03-29 09:52:00','2022-03-29 09:54:03',NULL),
(25,'José Fernando Alvarado ',NULL,40,'M',NULL,NULL,'S',NULL,2,1,5,'2022-03-29 09:53:26','2022-03-29 09:54:11',NULL),
(26,'Ernesto Álvarez ',NULL,63,'M',NULL,NULL,'S',NULL,2,1,5,'2022-03-29 11:13:47','2022-03-29 11:13:58',NULL);

/*Table structure for table `rol` */

DROP TABLE IF EXISTS `rol`;

CREATE TABLE `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `rol` */

insert  into `rol`(`id`,`nombre`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Médico',NULL,NULL,NULL),
(2,'Centro de Salud',NULL,NULL,NULL);

/*Table structure for table `rol_ficha_paciente` */

DROP TABLE IF EXISTS `rol_ficha_paciente`;

CREATE TABLE `rol_ficha_paciente` (
  `ficha_paciente_id` int(11) DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `editable` varchar(1) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  KEY `ficha_paciente_id` (`ficha_paciente_id`),
  KEY `rol_id` (`rol_id`),
  CONSTRAINT `rol_ficha_paciente_ibfk_1` FOREIGN KEY (`ficha_paciente_id`) REFERENCES `ficha_paciente` (`id`),
  CONSTRAINT `rol_ficha_paciente_ibfk_2` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `rol_ficha_paciente` */

insert  into `rol_ficha_paciente`(`ficha_paciente_id`,`rol_id`,`editable`,`orden`) values 
(1,1,'S',1),
(2,1,'S',2),
(3,1,'S',3),
(4,1,'S',4),
(1,2,NULL,2),
(2,2,NULL,3),
(3,2,NULL,4),
(4,2,NULL,5),
(5,2,'S',1);

/*Table structure for table `servicio_salud` */

DROP TABLE IF EXISTS `servicio_salud`;

CREATE TABLE `servicio_salud` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `tipo_referencia_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo_referencia_id` (`tipo_referencia_id`),
  CONSTRAINT `servicio_salud_ibfk_1` FOREIGN KEY (`tipo_referencia_id`) REFERENCES `tipo_referencia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `servicio_salud` */

insert  into `servicio_salud`(`id`,`nombre`,`tipo_referencia_id`) values 
(1,'Clínica Periferica/Maternidad El Amparo Z. 7',1),
(2,'Dispensario Antituberculosos -DAC-',1);

/*Table structure for table `tipo_referencia` */

DROP TABLE IF EXISTS `tipo_referencia`;

CREATE TABLE `tipo_referencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tipo_referencia` */

insert  into `tipo_referencia`(`id`,`nombre`) values 
(1,'Rayos X');

/*Table structure for table `ubicacion` */

DROP TABLE IF EXISTS `ubicacion`;

CREATE TABLE `ubicacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clinica_id` int(11) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clinica_id` (`clinica_id`),
  CONSTRAINT `ubicacion_ibfk_1` FOREIGN KEY (`clinica_id`) REFERENCES `clinica` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ubicacion` */

insert  into `ubicacion`(`id`,`clinica_id`,`direccion`,`created_at`,`updated_at`,`deleted_at`) values 
(1,1,'14 Avenida 12-74 zona 17','2022-03-29 09:25:40','2022-03-29 09:25:43','2022-03-29 09:52:18'),
(2,1,'12 Calle 11-23 zona 7','2022-03-29 09:52:48','2022-03-29 09:52:50',NULL);

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(200) DEFAULT NULL,
  `apellidos` varchar(200) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `clinica_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `rol_id` (`rol_id`),
  KEY `clinica_id` (`clinica_id`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`),
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`clinica_id`) REFERENCES `clinica` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `usuario` */

insert  into `usuario`(`id`,`nombres`,`apellidos`,`email`,`telefono`,`password`,`rol_id`,`clinica_id`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Claud','Mayert','franco_strosin14@gmail.com','209-796-2950 x83724','$2y$10$mT9qjxr9PpwH8uIO5oXj4u2ydLaIfWsC2CCpeXShbxC2PcYcnGxmi',1,1,'2022-03-28 21:57:03','2022-03-28 21:57:03',NULL),
(2,'Adele','Jacobi','glen_dibbert@gmail.com','1-862-632-6783 x3656','$2y$10$YOKKj5jEGs/1lLythR3WfOIWQ7WDxnp8hG/SvcNYBL2LxR8xf//E.',1,1,'2022-03-28 21:57:40','2022-03-28 21:57:40',NULL),
(3,'Keira','Hyatt','jayda_nitzsche39@gmail.com','973.278.0636','$2y$10$.4d8asl7z4fvQ2yemmPBU.Zjr/oKOHOP/WSxkRfwgI6r94Xt5NI0C',1,1,'2022-03-28 21:58:43','2022-03-28 21:58:43',NULL),
(4,'Anjali','Bins','clara50@hotmail.com','(823) 556-3671','$2y$10$64NPs1Vz1k8Mp62pfeRMCuWjDQUHAgYmXDfNT8H97pWNoVXk84OrK',1,1,'2022-03-28 21:59:09','2022-03-28 21:59:09',NULL),
(5,'Herson','Chur','gerson.roely@gmail.com','44522476','$2y$10$E5qOBBNH.FPKtbNeWANx8.tM5ZPN3nlHX0rppw5ZeVCgwcDgGgw3q',2,1,'2022-03-28 22:25:27','2022-03-28 22:25:27',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
