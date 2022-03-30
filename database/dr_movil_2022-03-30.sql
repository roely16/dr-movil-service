# ************************************************************
# Sequel Pro SQL dump
# Versión 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.4.21-MariaDB)
# Base de datos: dr_movil
# Tiempo de Generación: 2022-03-30 06:48:34 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Volcado de tabla antecedentes_gineco
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Volcado de tabla antecedentes_paciente
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `antecedentes_paciente` WRITE;
/*!40000 ALTER TABLE `antecedentes_paciente` DISABLE KEYS */;

INSERT INTO `antecedentes_paciente` (`id`, `medicos`, `mentales`, `quirurgicos`, `traumaticos`, `alergicos`, `paciente_id`, `registrado_por`, `created_at`, `updated_at`)
VALUES
	(6,'Registro médicos. ',NULL,NULL,NULL,NULL,21,5,NULL,NULL);

/*!40000 ALTER TABLE `antecedentes_paciente` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla clinica
# ------------------------------------------------------------

DROP TABLE IF EXISTS `clinica`;

CREATE TABLE `clinica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `clinica` WRITE;
/*!40000 ALTER TABLE `clinica` DISABLE KEYS */;

INSERT INTO `clinica` (`id`, `nombre`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'Dr Móvil 1',NULL,NULL,NULL);

/*!40000 ALTER TABLE `clinica` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla examen_fisico
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `examen_fisico` WRITE;
/*!40000 ALTER TABLE `examen_fisico` DISABLE KEYS */;

INSERT INTO `examen_fisico` (`id`, `peso`, `talla`, `pulso`, `p_a`, `f_r`, `t`, `fcf`, `examenes_realizados`, `impresion_clinica`, `motivo_referencia`, `tratamiento_y_manejo`, `paciente_id`, `registrado_por`, `created_at`, `updated_at`)
VALUES
	(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Exámenes realizados. ',NULL,NULL,NULL,21,5,NULL,NULL),
	(5,150,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,5,'2022-03-29 09:23:27','2022-03-29 09:23:27');

/*!40000 ALTER TABLE `examen_fisico` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla ficha_paciente
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `ficha_paciente` WRITE;
/*!40000 ALTER TABLE `ficha_paciente` DISABLE KEYS */;

INSERT INTO `ficha_paciente` (`id`, `nombre`, `orden`, `componente`, `accion`, `tabla`, `store`)
VALUES
	(1,'Datos Generales',1,'FormGeneral','save','paciente','patient'),
	(2,'Antecedentes Médicos',2,'FormMedicalHistory','update','antecedentes_paciente','medical_history'),
	(3,'Antecedentes Gineco-Obstétricos',3,'FormObstetric','update','antecedentes_gineco','obstetric'),
	(4,'Examen Físico',4,'FormPhysicalExam','update','examen_fisico','physical_exam'),
	(5,'Actualización',5,'FormReferral','update','ficha_referencia','reference_sheet');

/*!40000 ALTER TABLE `ficha_paciente` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla ficha_referencia
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

LOCK TABLES `ficha_referencia` WRITE;
/*!40000 ALTER TABLE `ficha_referencia` DISABLE KEYS */;

INSERT INTO `ficha_referencia` (`id`, `resumen_evolucion`, `tratamiento`, `diagnostico`, `recomendaciones`, `paciente_id`, `registrado_por`, `created_at`, `updated_at`)
VALUES
	(1,'Resumen de la evolución.','Tratamiento brindado.','Diagnóstico','Recomendaciones.',21,6,'2022-03-29 14:12:04','2022-03-30 06:42:33');

/*!40000 ALTER TABLE `ficha_referencia` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `url` varchar(20) DEFAULT NULL,
  `icono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;

INSERT INTO `menu` (`id`, `nombre`, `url`, `icono`)
VALUES
	(1,'Pacientes','patients','mdi-clipboard'),
	(2,'Referidos','referrals','mdi-account-group');

/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla menu_rol
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu_rol`;

CREATE TABLE `menu_rol` (
  `rol_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  KEY `rol_id` (`rol_id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `menu_rol_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`),
  CONSTRAINT `menu_rol_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `menu_rol` WRITE;
/*!40000 ALTER TABLE `menu_rol` DISABLE KEYS */;

INSERT INTO `menu_rol` (`rol_id`, `menu_id`)
VALUES
	(2,1),
	(1,1),
	(3,2);

/*!40000 ALTER TABLE `menu_rol` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla paciente
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;

INSERT INTO `paciente` (`id`, `nombre`, `telefono`, `edad`, `sexo`, `direccion`, `historia`, `consulta_externa`, `emergencia`, `ubicacion_id`, `referido_a`, `registrado_por`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(21,'Herson Roely Chur Chinchilla','44522476',32,'M',NULL,NULL,'S','S',1,1,5,NULL,'2022-03-29 09:20:54',NULL),
	(22,'Miguel Gonzalez',NULL,24,NULL,NULL,NULL,'S','S',1,2,5,'2022-03-29 09:21:53','2022-03-29 09:23:08',NULL),
	(24,'Ana Pérez ',NULL,18,'F',NULL,NULL,NULL,'S',2,2,5,'2022-03-29 09:52:00','2022-03-29 09:54:03',NULL),
	(25,'José Fernando Alvarado ',NULL,40,'M',NULL,NULL,'S',NULL,2,1,5,'2022-03-29 09:53:26','2022-03-29 09:54:11',NULL),
	(26,'Ernesto Álvarez ',NULL,63,'M',NULL,NULL,'S',NULL,2,1,5,'2022-03-29 11:13:47','2022-03-29 11:13:58',NULL);

/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla rol
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rol`;

CREATE TABLE `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `tipo_usuario_id` int(11) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo_usuario_id` (`tipo_usuario_id`),
  CONSTRAINT `rol_ibfk_1` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `tipo_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;

INSERT INTO `rol` (`id`, `nombre`, `tipo_usuario_id`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'Médico',2,NULL,NULL,NULL),
	(2,'Digitador',2,NULL,NULL,NULL),
	(3,'Encargado',1,NULL,NULL,NULL);

/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla rol_ficha_paciente
# ------------------------------------------------------------

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

LOCK TABLES `rol_ficha_paciente` WRITE;
/*!40000 ALTER TABLE `rol_ficha_paciente` DISABLE KEYS */;

INSERT INTO `rol_ficha_paciente` (`ficha_paciente_id`, `rol_id`, `editable`, `orden`)
VALUES
	(1,1,'',1),
	(2,1,'S',2),
	(3,1,'S',3),
	(4,1,'S',4),
	(1,2,'S',2),
	(2,2,'S',3),
	(3,2,'S',4),
	(4,2,'S',5),
	(5,3,'S',1),
	(1,3,NULL,2),
	(2,3,NULL,3),
	(3,3,NULL,4),
	(4,3,NULL,5);

/*!40000 ALTER TABLE `rol_ficha_paciente` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla servicio_salud
# ------------------------------------------------------------

DROP TABLE IF EXISTS `servicio_salud`;

CREATE TABLE `servicio_salud` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `tipo_referencia_id` int(11) DEFAULT NULL,
  `tipo_usuario_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo_referencia_id` (`tipo_referencia_id`),
  KEY `tipo_usuario_id` (`tipo_usuario_id`),
  CONSTRAINT `servicio_salud_ibfk_1` FOREIGN KEY (`tipo_referencia_id`) REFERENCES `tipo_referencia` (`id`),
  CONSTRAINT `servicio_salud_ibfk_2` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `tipo_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `servicio_salud` WRITE;
/*!40000 ALTER TABLE `servicio_salud` DISABLE KEYS */;

INSERT INTO `servicio_salud` (`id`, `nombre`, `tipo_referencia_id`, `tipo_usuario_id`)
VALUES
	(1,'Clínica Periferica/Maternidad El Amparo Z. 7',1,1),
	(2,'Dispensario Antituberculosos -DAC-',1,1);

/*!40000 ALTER TABLE `servicio_salud` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla tipo_referencia
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tipo_referencia`;

CREATE TABLE `tipo_referencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `tipo_referencia` WRITE;
/*!40000 ALTER TABLE `tipo_referencia` DISABLE KEYS */;

INSERT INTO `tipo_referencia` (`id`, `nombre`)
VALUES
	(1,'Rayos X');

/*!40000 ALTER TABLE `tipo_referencia` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla tipo_usuario
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tipo_usuario`;

CREATE TABLE `tipo_usuario` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `icono` varchar(100) DEFAULT NULL,
  `clinica` varchar(1) DEFAULT NULL,
  `servicio_salud` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;

INSERT INTO `tipo_usuario` (`id`, `nombre`, `icono`, `clinica`, `servicio_salud`)
VALUES
	(1,'Centro de Salud','hospital.png',NULL,'S'),
	(2,'Dr. Móvil','logo_dr_movil.png','S',NULL);

/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla ubicacion
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `ubicacion` WRITE;
/*!40000 ALTER TABLE `ubicacion` DISABLE KEYS */;

INSERT INTO `ubicacion` (`id`, `clinica_id`, `direccion`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,1,'14 Avenida 12-74 zona 17','2022-03-29 09:25:40','2022-03-29 09:25:43','2022-03-29 09:52:18'),
	(2,1,'12 Calle 11-23 zona 7','2022-03-29 09:52:48','2022-03-29 09:52:50',NULL);

/*!40000 ALTER TABLE `ubicacion` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla usuario
# ------------------------------------------------------------

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
  `servicio_salud_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `rol_id` (`rol_id`),
  KEY `clinica_id` (`clinica_id`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`),
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`clinica_id`) REFERENCES `clinica` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;

INSERT INTO `usuario` (`id`, `nombres`, `apellidos`, `email`, `telefono`, `password`, `rol_id`, `clinica_id`, `servicio_salud_id`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'Claud','Mayert','franco_strosin14@gmail.com','209-796-2950 x83724','$2y$10$mT9qjxr9PpwH8uIO5oXj4u2ydLaIfWsC2CCpeXShbxC2PcYcnGxmi',1,1,NULL,'2022-03-28 21:57:03','2022-03-28 21:57:03',NULL),
	(2,'Adele','Jacobi','glen_dibbert@gmail.com','1-862-632-6783 x3656','$2y$10$YOKKj5jEGs/1lLythR3WfOIWQ7WDxnp8hG/SvcNYBL2LxR8xf//E.',1,1,NULL,'2022-03-28 21:57:40','2022-03-28 21:57:40',NULL),
	(3,'Keira','Hyatt','jayda_nitzsche39@gmail.com','973.278.0636','$2y$10$.4d8asl7z4fvQ2yemmPBU.Zjr/oKOHOP/WSxkRfwgI6r94Xt5NI0C',1,1,NULL,'2022-03-28 21:58:43','2022-03-28 21:58:43',NULL),
	(4,'Anjali','Bins','clara50@hotmail.com','(823) 556-3671','$2y$10$64NPs1Vz1k8Mp62pfeRMCuWjDQUHAgYmXDfNT8H97pWNoVXk84OrK',1,1,NULL,'2022-03-28 21:59:09','2022-03-28 21:59:09',NULL),
	(5,'Herson','Chur','gerson.roely@gmail.com','44522476','$2y$10$E5qOBBNH.FPKtbNeWANx8.tM5ZPN3nlHX0rppw5ZeVCgwcDgGgw3q',2,1,NULL,'2022-03-28 22:25:27','2022-03-28 22:25:27',NULL),
	(6,'Juan','Gomez','juan.gomez@gmail.com','44522476','$2y$10$g4mZzIVVWj595dXoCEAC7OxnlZg6HzFptH9QZzf1pkljAobSl8/0a',3,NULL,1,'2022-03-30 06:16:39','2022-03-30 06:16:39',NULL);

/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
