-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: localhost    Database: quemepongo
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `atuendo`
--

DROP TABLE IF EXISTS `atuendo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atuendo` (
  `atuendo_id` int(11) NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `prenda_inferior_id` int(11) NOT NULL,
  `calzado_id` int(11) NOT NULL,
  `accesorio_id` int(11) NOT NULL,
  `accesorio_manos_id` int(11) DEFAULT NULL,
  `accesorio_cuello_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`atuendo_id`),
  KEY `atuendo_FK` (`prenda_inferior_id`),
  KEY `atuendo_FK_1` (`calzado_id`),
  KEY `atuendo_FK_2` (`accesorio_id`),
  KEY `atuendo_FK_3` (`accesorio_manos_id`),
  KEY `accesorio_cuello_id` (`accesorio_cuello_id`),
  CONSTRAINT `accesorio_FK` FOREIGN KEY (`accesorio_id`) REFERENCES `prenda` (`prenda_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `accesorio_cuello_id` FOREIGN KEY (`accesorio_cuello_id`) REFERENCES `atuendo` (`atuendo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `accesorio_mano_FK` FOREIGN KEY (`accesorio_manos_id`) REFERENCES `prenda` (`prenda_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `calzado_FK` FOREIGN KEY (`calzado_id`) REFERENCES `prenda` (`prenda_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prenda_inferior_FK` FOREIGN KEY (`prenda_inferior_id`) REFERENCES `prenda` (`prenda_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atuendo`
--

LOCK TABLES `atuendo` WRITE;
/*!40000 ALTER TABLE `atuendo` DISABLE KEYS */;
/*!40000 ALTER TABLE `atuendo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atuendos`
--

DROP TABLE IF EXISTS `atuendos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atuendos` (
  `atuendo_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) DEFAULT NULL,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `evento_id` int(11) DEFAULT NULL,
  `accesorio_id` int(11) DEFAULT NULL,
  `prenda_inferior_id` int(11) DEFAULT NULL,
  `calzado_id` int(11) DEFAULT NULL,
  `cuello_id` int(11) DEFAULT NULL,
  `manos_id` int(11) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `calificacion` int(10) DEFAULT NULL,
  PRIMARY KEY (`atuendo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80004 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atuendos`
--

LOCK TABLES `atuendos` WRITE;
/*!40000 ALTER TABLE `atuendos` DISABLE KEYS */;
INSERT INTO `atuendos` VALUES (79945,NULL,'2019-12-17 02:34:43',342,839,840,842,838,841,'NUEVO',NULL),(79946,NULL,'2019-12-17 02:39:08',342,839,840,842,845,841,'CALIFICADO',1),(79947,NULL,'2019-12-17 02:31:42',342,846,840,842,838,841,'NUEVO',NULL),(79948,NULL,'2019-12-17 02:31:42',342,846,840,842,845,841,'NUEVO',NULL),(79949,NULL,'2019-12-17 02:31:42',342,839,847,842,838,841,'NUEVO',NULL),(79950,NULL,'2019-12-17 02:31:42',342,839,847,842,845,841,'NUEVO',NULL),(79951,NULL,'2019-12-17 02:31:42',342,846,847,842,838,841,'NUEVO',NULL),(79952,NULL,'2019-12-17 02:31:42',342,846,847,842,845,841,'NUEVO',NULL),(79953,NULL,'2019-12-17 02:31:42',342,839,840,842,838,841,'NUEVO',NULL),(79954,NULL,'2019-12-17 02:31:42',342,839,840,842,845,841,'NUEVO',NULL),(79955,NULL,'2019-12-17 02:31:42',342,846,840,842,838,841,'NUEVO',NULL),(79956,NULL,'2019-12-17 02:31:42',342,846,840,842,845,841,'NUEVO',NULL),(79957,NULL,'2019-12-17 02:31:42',342,839,847,842,838,841,'NUEVO',NULL),(79958,NULL,'2019-12-17 02:31:42',342,839,847,842,845,841,'NUEVO',NULL),(79959,NULL,'2019-12-17 02:31:42',342,846,847,842,838,841,'NUEVO',NULL),(79960,NULL,'2019-12-17 02:31:42',342,846,847,842,845,841,'NUEVO',NULL),(79961,NULL,'2019-12-17 02:31:42',342,839,840,842,838,841,'NUEVO',NULL),(79962,NULL,'2019-12-17 02:31:42',342,839,840,842,845,841,'NUEVO',NULL),(79963,NULL,'2019-12-17 02:31:42',342,846,840,842,838,841,'NUEVO',NULL),(79964,NULL,'2019-12-17 02:31:42',342,846,840,842,845,841,'NUEVO',NULL),(79965,NULL,'2019-12-17 02:31:42',342,839,847,842,838,841,'NUEVO',NULL),(79966,NULL,'2019-12-17 02:31:42',342,839,847,842,845,841,'NUEVO',NULL),(79967,NULL,'2019-12-17 02:31:42',342,846,847,842,838,841,'NUEVO',NULL),(79968,NULL,'2019-12-17 02:31:42',342,846,847,842,845,841,'NUEVO',NULL),(79969,NULL,'2019-12-17 02:31:42',342,839,840,842,838,841,'NUEVO',NULL),(79970,NULL,'2019-12-17 02:31:42',342,839,840,842,845,841,'NUEVO',NULL),(79971,NULL,'2019-12-17 02:31:42',342,846,840,842,838,841,'NUEVO',NULL),(79972,NULL,'2019-12-17 02:31:42',342,846,840,842,845,841,'NUEVO',NULL),(79973,NULL,'2019-12-17 02:31:42',342,839,847,842,838,841,'NUEVO',NULL),(79974,NULL,'2019-12-17 02:31:42',342,839,847,842,845,841,'NUEVO',NULL),(79975,NULL,'2019-12-17 02:31:42',342,846,847,842,838,841,'NUEVO',NULL),(79976,NULL,'2019-12-17 02:31:42',342,846,847,842,845,841,'NUEVO',NULL),(79977,NULL,'2019-12-17 02:31:42',342,839,840,842,838,841,'NUEVO',NULL),(79978,NULL,'2019-12-17 02:31:42',342,839,840,842,845,841,'NUEVO',NULL),(79979,NULL,'2019-12-17 02:31:42',342,846,840,842,838,841,'NUEVO',NULL),(79980,NULL,'2019-12-17 02:31:42',342,846,840,842,845,841,'NUEVO',NULL),(79981,NULL,'2019-12-17 02:31:42',342,839,847,842,838,841,'NUEVO',NULL),(79982,NULL,'2019-12-17 02:31:42',342,839,847,842,845,841,'NUEVO',NULL),(79983,NULL,'2019-12-17 02:31:42',342,846,847,842,838,841,'NUEVO',NULL),(79984,NULL,'2019-12-17 02:31:42',342,846,847,842,845,841,'NUEVO',NULL),(79985,NULL,'2019-12-17 02:31:42',342,839,840,842,838,841,'NUEVO',NULL),(79986,NULL,'2019-12-17 02:31:42',342,839,840,842,845,841,'NUEVO',NULL),(79987,NULL,'2019-12-17 02:31:42',342,846,840,842,838,841,'NUEVO',NULL),(79988,NULL,'2019-12-17 02:31:42',342,846,840,842,845,841,'NUEVO',NULL),(79989,NULL,'2019-12-17 02:31:42',342,839,847,842,838,841,'NUEVO',NULL),(79990,NULL,'2019-12-17 02:31:42',342,839,847,842,845,841,'NUEVO',NULL),(79991,NULL,'2019-12-17 02:31:42',342,846,847,842,838,841,'NUEVO',NULL),(79992,NULL,'2019-12-17 02:31:42',342,846,847,842,845,841,'NUEVO',NULL),(79993,NULL,'2019-12-17 02:31:42',342,839,840,842,838,841,'NUEVO',NULL),(79994,NULL,'2019-12-17 02:31:42',342,839,840,842,845,841,'NUEVO',NULL),(79995,NULL,'2019-12-17 02:31:42',342,846,840,842,838,841,'NUEVO',NULL),(79996,NULL,'2019-12-17 02:31:42',342,846,840,842,845,841,'NUEVO',NULL),(79997,NULL,'2019-12-17 02:31:42',342,839,847,842,838,841,'NUEVO',NULL),(79998,NULL,'2019-12-17 02:31:42',342,839,847,842,845,841,'NUEVO',NULL),(79999,NULL,'2019-12-17 02:31:42',342,846,847,842,838,841,'NUEVO',NULL),(80000,NULL,'2019-12-17 02:31:42',342,846,847,842,845,841,'NUEVO',NULL),(80001,NULL,'2019-12-17 02:57:49',343,846,847,835,838,834,'NUEVO',NULL),(80002,NULL,'2019-12-17 02:57:58',343,846,847,835,838,834,'NUEVO',NULL),(80003,NULL,'2019-12-17 02:57:58',343,846,847,835,838,834,'RECHAZADO',NULL);
/*!40000 ALTER TABLE `atuendos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atuendos_estados`
--

DROP TABLE IF EXISTS `atuendos_estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atuendos_estados` (
  `atuendo_id` int(11) NOT NULL,
  `estado` varchar(40) NOT NULL,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atuendos_estados`
--

LOCK TABLES `atuendos_estados` WRITE;
/*!40000 ALTER TABLE `atuendos_estados` DISABLE KEYS */;
INSERT INTO `atuendos_estados` VALUES (751,'NUEVO','2019-12-17 02:57:28'),(751,'ALEXIS','2019-12-17 02:58:06'),(79945,'NUEVO','2019-12-17 02:31:42'),(79946,'NUEVO','2019-12-17 02:31:42'),(79947,'NUEVO','2019-12-17 02:31:42'),(79948,'NUEVO','2019-12-17 02:31:42'),(79949,'NUEVO','2019-12-17 02:31:42'),(79950,'NUEVO','2019-12-17 02:31:42'),(79951,'NUEVO','2019-12-17 02:31:42'),(79952,'NUEVO','2019-12-17 02:31:42'),(79953,'NUEVO','2019-12-17 02:31:42'),(79954,'NUEVO','2019-12-17 02:31:42'),(79955,'NUEVO','2019-12-17 02:31:42'),(79956,'NUEVO','2019-12-17 02:31:42'),(79957,'NUEVO','2019-12-17 02:31:42'),(79958,'NUEVO','2019-12-17 02:31:42'),(79959,'NUEVO','2019-12-17 02:31:42'),(79960,'NUEVO','2019-12-17 02:31:42'),(79961,'NUEVO','2019-12-17 02:31:42'),(79962,'NUEVO','2019-12-17 02:31:42'),(79963,'NUEVO','2019-12-17 02:31:42'),(79964,'NUEVO','2019-12-17 02:31:42'),(79965,'NUEVO','2019-12-17 02:31:42'),(79966,'NUEVO','2019-12-17 02:31:42'),(79967,'NUEVO','2019-12-17 02:31:42'),(79968,'NUEVO','2019-12-17 02:31:42'),(79969,'NUEVO','2019-12-17 02:31:42'),(79970,'NUEVO','2019-12-17 02:31:42'),(79971,'NUEVO','2019-12-17 02:31:42'),(79972,'NUEVO','2019-12-17 02:31:42'),(79973,'NUEVO','2019-12-17 02:31:42'),(79974,'NUEVO','2019-12-17 02:31:42'),(79975,'NUEVO','2019-12-17 02:31:42'),(79976,'NUEVO','2019-12-17 02:31:42'),(79977,'NUEVO','2019-12-17 02:31:42'),(79978,'NUEVO','2019-12-17 02:31:42'),(79979,'NUEVO','2019-12-17 02:31:42'),(79980,'NUEVO','2019-12-17 02:31:42'),(79981,'NUEVO','2019-12-17 02:31:42'),(79982,'NUEVO','2019-12-17 02:31:42'),(79983,'NUEVO','2019-12-17 02:31:42'),(79984,'NUEVO','2019-12-17 02:31:42'),(79985,'NUEVO','2019-12-17 02:31:42'),(79986,'NUEVO','2019-12-17 02:31:42'),(79987,'NUEVO','2019-12-17 02:31:42'),(79988,'NUEVO','2019-12-17 02:31:42'),(79989,'NUEVO','2019-12-17 02:31:42'),(79990,'NUEVO','2019-12-17 02:31:42'),(79991,'NUEVO','2019-12-17 02:31:42'),(79992,'NUEVO','2019-12-17 02:31:42'),(79993,'NUEVO','2019-12-17 02:31:42'),(79994,'NUEVO','2019-12-17 02:31:42'),(79995,'NUEVO','2019-12-17 02:31:42'),(79996,'NUEVO','2019-12-17 02:31:42'),(79997,'NUEVO','2019-12-17 02:31:42'),(79998,'NUEVO','2019-12-17 02:31:42'),(79999,'NUEVO','2019-12-17 02:31:42'),(80000,'NUEVO','2019-12-17 02:31:42'),(79945,'NUEVO','2019-12-17 02:34:30'),(79945,'RECHAZADO','2019-12-17 02:34:43'),(79946,'NUEVO','2019-12-17 02:34:43'),(79946,'ACEPTADO','2019-12-17 02:39:08'),(80001,'NUEVO','2019-12-17 02:49:42'),(80002,'NUEVO','2019-12-17 02:49:42'),(80003,'NUEVO','2019-12-17 02:49:42'),(80001,'NUEVO','2019-12-17 02:56:20'),(80001,'RECHAZADO','2019-12-17 02:57:17'),(80001,'NUEVO','2019-12-17 02:57:41'),(80001,'RECHAZADO','2019-12-17 02:57:49'),(80002,'NUEVO','2019-12-17 02:57:50'),(80002,'RECHAZADO','2019-12-17 02:57:58'),(80003,'NUEVO','2019-12-17 02:57:58');
/*!40000 ALTER TABLE `atuendos_estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendario`
--

DROP TABLE IF EXISTS `calendario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendario` (
  `calendario_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`calendario_id`),
  KEY `usuario_FK` (`usuario_id`),
  CONSTRAINT `usuario_FK` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendario`
--

LOCK TABLES `calendario` WRITE;
/*!40000 ALTER TABLE `calendario` DISABLE KEYS */;
INSERT INTO `calendario` VALUES (1,'Daiu C',1);
/*!40000 ALTER TABLE `calendario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendario_evento`
--

DROP TABLE IF EXISTS `calendario_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendario_evento` (
  `calendario_id` int(11) NOT NULL,
  `evento_id` int(11) NOT NULL,
  PRIMARY KEY (`calendario_id`,`evento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendario_evento`
--

LOCK TABLES `calendario_evento` WRITE;
/*!40000 ALTER TABLE `calendario_evento` DISABLE KEYS */;
INSERT INTO `calendario_evento` VALUES (1,1),(1,13),(1,14),(1,15);
/*!40000 ALTER TABLE `calendario_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_atuendo`
--

DROP TABLE IF EXISTS `estado_atuendo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_atuendo` (
  `id` int(11) NOT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `atuendo_id` int(11) DEFAULT NULL,
  `calificacionActual` int(11) DEFAULT NULL,
  `calificacionAnterior` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_atuendo`
--

LOCK TABLES `estado_atuendo` WRITE;
/*!40000 ALTER TABLE `estado_atuendo` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_atuendo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento` (
  `evento_id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nombre` varchar(50) NOT NULL,
  `ubicacion` varchar(50) NOT NULL,
  `antelacion_horas` int(11) DEFAULT NULL,
  `periodo` varchar(8) NOT NULL,
  `tiene_sugerencia` tinyint(1) DEFAULT NULL,
  `calendario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`evento_id`),
  KEY `calendario_FK` (`calendario_id`),
  CONSTRAINT `calendario_FK` FOREIGN KEY (`calendario_id`) REFERENCES `calendario` (`calendario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,'2019-10-28 16:00:49','Parcial DDS','UTN',1,'DIARIO',0,1),(2,'2019-10-25 19:44:48','Merienda','Juan B Justo y San Martin',1,'DIARIO',0,1),(13,'2019-10-25 20:46:16','Fiesta de cumpleaños','La casa de Emilia',456,'ANUAL',0,NULL),(14,'2019-11-13 03:00:00','Festejo de River','Estado de Chile',456,'ANUAL',0,NULL),(15,'2019-10-26 01:47:17','asd','Lugano',456,'ANUAL',0,1);
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `evento_id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `ubicacion` varchar(50) NOT NULL,
  `antelacion_horas` int(11) DEFAULT NULL,
  `periodo` varchar(8) NOT NULL,
  `tiene_sugerencia` tinyint(1) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`evento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=344 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (338,'2019-11-25 20:05:58','Recital de la mona Jimenez','Luna Park',0,'NINGUNO',0,307,'2019-11-25 20:05:58'),(339,'2019-11-25 20:05:58','Partido Boca-River','La Boca',2,'NINGUNO',0,308,'2019-11-25 20:05:58'),(340,'2019-11-25 20:05:58','Pizzas a la parrilla','Carapachay',0,'MENSUAL',0,308,'2019-11-25 20:05:58'),(341,'2019-11-25 20:05:58','Casamiento','Pilar',1,'NINGUNO',0,309,'2019-11-25 20:05:58'),(342,'2019-12-18 02:05:58','Asado de domingo al mediodia!','Los talas del Entrerriano',1,'MENSUAL',0,310,'2019-12-17 02:30:07'),(343,'2019-12-18 02:05:58','Entrega TP DDS','Mi ksa',1,'MENSUAL',0,310,'2019-12-17 02:30:07');
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guardarropa`
--

DROP TABLE IF EXISTS `guardarropa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guardarropa` (
  `guardarropa_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_guardarropa` varchar(40) NOT NULL DEFAULT 'gg',
  `nombreGuardarropa` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`guardarropa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guardarropa`
--

LOCK TABLES `guardarropa` WRITE;
/*!40000 ALTER TABLE `guardarropa` DISABLE KEYS */;
INSERT INTO `guardarropa` VALUES (1,'',NULL),(3,'gg',NULL);
/*!40000 ALTER TABLE `guardarropa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guardarropas`
--

DROP TABLE IF EXISTS `guardarropas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guardarropas` (
  `guardarropa_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_guardarropa` varchar(100) DEFAULT NULL,
  `limite_prendas` int(11) DEFAULT NULL,
  PRIMARY KEY (`guardarropa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=490 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guardarropas`
--

LOCK TABLES `guardarropas` WRITE;
/*!40000 ALTER TABLE `guardarropas` DISABLE KEYS */;
INSERT INTO `guardarropas` VALUES (486,'guardarropa formal',0),(487,'Guardarropa de verano',100),(488,'Guardarropa de verano',100),(489,'Guardarropa de invierno',0);
/*!40000 ALTER TABLE `guardarropas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagenes`
--

DROP TABLE IF EXISTS `imagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagenes` (
  `imagen_id` int(11) NOT NULL AUTO_INCREMENT,
  `alto` int(11) NOT NULL,
  `ancho` int(11) NOT NULL,
  `archivo` tinyblob NOT NULL,
  `prenda_id` int(11) NOT NULL,
  PRIMARY KEY (`imagen_id`),
  KEY `imagenes_FK` (`prenda_id`),
  CONSTRAINT `imagenes_FK` FOREIGN KEY (`prenda_id`) REFERENCES `prendas` (`prenda_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenes`
--

LOCK TABLES `imagenes` WRITE;
/*!40000 ALTER TABLE `imagenes` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materiales`
--

DROP TABLE IF EXISTS `materiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materiales` (
  `tipo_prenda_id` int(11) DEFAULT NULL,
  `material_id` int(11) NOT NULL,
  PRIMARY KEY (`material_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materiales`
--

LOCK TABLES `materiales` WRITE;
/*!40000 ALTER TABLE `materiales` DISABLE KEYS */;
INSERT INTO `materiales` VALUES (1,1);
/*!40000 ALTER TABLE `materiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materiales_tipos_prendas`
--

DROP TABLE IF EXISTS `materiales_tipos_prendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materiales_tipos_prendas` (
  `tipo_prenda_id` int(11) DEFAULT NULL,
  `material` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materiales_tipos_prendas`
--

LOCK TABLES `materiales_tipos_prendas` WRITE;
/*!40000 ALTER TABLE `materiales_tipos_prendas` DISABLE KEYS */;
INSERT INTO `materiales_tipos_prendas` VALUES (1,'lana'),(709,'SEDA'),(719,'LANA'),(709,'ALGODON'),(710,'CUERO'),(711,'SEDA'),(711,'ALGODON'),(713,'JEAN'),(713,'ALGODON'),(712,'ALGODON'),(714,'POLYESTER'),(714,'ALGODON'),(715,'LANA'),(716,'LANA'),(717,'LANA'),(718,'LANA'),(719,'LANA'),(721,'NINGUNO'),(722,'POLYESTER'),(723,'ALGODON'),(724,'ALGODON'),(725,'NINGUNO'),(726,'ALGODON'),(727,'JEAN'),(727,'ALGODON'),(728,'NINGUNO'),(729,'POLYESTER'),(730,'ALGODON'),(731,'ALGODON'),(732,'NINGUNO'),(733,'ALGODON'),(734,'JEAN'),(734,'ALGODON'),(735,'NINGUNO'),(736,'POLYESTER'),(737,'ALGODON'),(738,'ALGODON'),(739,'NINGUNO'),(740,'ALGODON'),(741,'JEAN'),(741,'ALGODON');
/*!40000 ALTER TABLE `materiales_tipos_prendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prenda`
--

DROP TABLE IF EXISTS `prenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prenda` (
  `prenda_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `material` varchar(40) NOT NULL,
  `tipo_prenda_id` int(11) NOT NULL,
  `trama` varchar(50) DEFAULT NULL,
  `guardarropa_id` int(11) NOT NULL,
  `imagen` blob,
  `impermeable` tinyint(1) DEFAULT NULL,
  `disponibilidad` tinyint(1) DEFAULT NULL,
  `rojo` int(11) NOT NULL DEFAULT '1',
  `verde` int(11) NOT NULL DEFAULT '1',
  `azul` int(11) NOT NULL DEFAULT '1',
  `rojo_1` int(11) DEFAULT '1',
  `verde_1` int(11) DEFAULT '1',
  `azul_1` int(11) DEFAULT '1',
  `atuendo_id` int(11) DEFAULT NULL,
  `nombrePrenda` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`prenda_id`),
  KEY `atuendo_FK` (`atuendo_id`),
  CONSTRAINT `atuendo_FK` FOREIGN KEY (`atuendo_id`) REFERENCES `atuendo` (`atuendo_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prenda`
--

LOCK TABLES `prenda` WRITE;
/*!40000 ALTER TABLE `prenda` DISABLE KEYS */;
INSERT INTO `prenda` VALUES (1,'remera','ALGODON',2,'RAYADA',1,NULL,1,1,0,0,0,1,2,3,NULL,NULL),(2,'musculosa','ALGODON',7,'CUADROS',1,NULL,0,1,1,1,1,1,1,1,NULL,NULL),(3,'blusa','ALGODON',8,'CUADROS',1,NULL,0,1,1,1,1,1,1,1,NULL,NULL),(4,'zapato de cuero','CUERO',9,'LISA',1,NULL,1,1,1,1,1,1,1,1,NULL,NULL),(5,'short de jean','JEAN',10,'LISA',1,NULL,0,1,1,1,1,1,1,1,NULL,NULL),(6,'pollera','JEAN',11,'LISA',1,NULL,0,1,1,1,1,1,1,1,NULL,NULL),(7,'anteojos','PLASTICO',12,'LISA',1,NULL,0,1,1,1,1,1,1,1,NULL,NULL),(8,'bufanda','LANA',13,'LISA',1,NULL,0,1,1,1,1,1,1,1,NULL,NULL),(9,'guantes','CUERO',14,'LISA',1,NULL,0,1,1,1,1,1,1,1,NULL,NULL);
/*!40000 ALTER TABLE `prenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prendas`
--

DROP TABLE IF EXISTS `prendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prendas` (
  `prenda_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `material` varchar(40) NOT NULL,
  `tipo_prenda_id` int(11) DEFAULT NULL,
  `trama` varchar(50) DEFAULT NULL,
  `impermeable` tinyint(1) DEFAULT NULL,
  `disponibilidad` tinyint(1) DEFAULT NULL,
  `rojo_primario` int(11) DEFAULT NULL,
  `verde_primario` int(11) DEFAULT NULL,
  `azul_primario` int(11) DEFAULT NULL,
  `rojo_secundario` int(11) DEFAULT NULL,
  `verde_secundario` int(11) DEFAULT NULL,
  `azul_secundario` int(11) DEFAULT NULL,
  `guardarropa_id` int(11) DEFAULT NULL,
  `atuendo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`prenda_id`)
) ENGINE=InnoDB AUTO_INCREMENT=855 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prendas`
--

LOCK TABLES `prendas` WRITE;
/*!40000 ALTER TABLE `prendas` DISABLE KEYS */;
INSERT INTO `prendas` VALUES (800,'Musculosa','ALGODON',703,'CUADROS',0,1,10,11,12,NULL,NULL,NULL,486,543),(801,'Short','JEAN',704,'LISA',0,1,10,11,12,NULL,NULL,NULL,486,NULL),(802,'ojotas havaianas','GOMA',705,'NINGUNO',1,1,10,86,88,82,16,88,486,NULL),(803,'Guantes de Cuero','CUERO',706,'LISA',0,1,10,11,12,NULL,NULL,NULL,486,NULL),(804,'Bufanda','LANA',707,'LISA',0,1,10,11,12,NULL,NULL,NULL,486,NULL),(805,'Anteojos','PLASTICO',708,'LISA',0,1,10,11,12,NULL,NULL,NULL,486,NULL),(806,'Remera lisa','ALGODON',709,'LISA',0,1,10,5,0,20,0,2,486,NULL),(808,'Gorra de sol','POLYESTER',711,'LISA',0,1,20,0,2,NULL,NULL,NULL,486,NULL),(810,'pantalon de jean','JEAN',713,'LISA',0,1,10,11,12,NULL,NULL,NULL,486,NULL),(813,'zapatillas','ALGODON',710,'LISA',1,1,10,11,12,NULL,NULL,NULL,486,NULL),(815,'BufandaRoja','LANA',715,'LISA',0,1,1,2,3,NULL,NULL,NULL,486,NULL),(816,'Guantes','CUERO',716,'LISA',0,1,1,2,3,NULL,NULL,NULL,486,NULL),(827,'nombre','NINGUNO',721,'LISA',0,1,1,1,1,NULL,NULL,NULL,486,NULL),(828,'nombre','ALGODON',722,'CUADROS',0,1,1,1,1,NULL,NULL,NULL,486,NULL),(829,'nombre','ALGODON',723,'LISA',0,1,1,1,1,NULL,NULL,NULL,486,NULL),(830,'nombre','ALGODON',724,'CUADROS',0,1,1,1,1,NULL,NULL,NULL,486,NULL),(831,'nombre','NINGUNO',725,'LISA',0,0,1,1,1,NULL,NULL,NULL,486,NULL),(832,'nombre','ALGODON',726,'LISA',0,1,1,1,1,NULL,NULL,NULL,486,NULL),(833,'nombre','ALGODON',727,'CUADROS',1,1,1,1,1,NULL,NULL,NULL,486,NULL),(834,'nombre','NINGUNO',728,'LISA',0,1,1,1,1,NULL,NULL,NULL,487,NULL),(835,'nombre','ALGODON',729,'CUADROS',0,1,1,1,1,NULL,NULL,NULL,487,NULL),(836,'nombre','ALGODON',730,'LISA',0,1,1,1,1,NULL,NULL,NULL,486,NULL),(837,'nombre','ALGODON',731,'CUADROS',0,1,1,1,1,NULL,NULL,NULL,487,NULL),(838,'nombre','NINGUNO',732,'LISA',0,1,1,1,1,NULL,NULL,NULL,487,NULL),(839,'nombre','ALGODON',733,'LISA',0,0,1,1,1,NULL,NULL,NULL,487,NULL),(840,'nombre','ALGODON',734,'CUADROS',1,0,1,1,1,NULL,NULL,NULL,487,NULL),(841,'nombre','NINGUNO',735,'LISA',0,0,1,1,1,NULL,NULL,NULL,487,NULL),(842,'nombre','ALGODON',736,'CUADROS',0,0,1,1,1,NULL,NULL,NULL,487,NULL),(843,'nombre','ALGODON',737,'LISA',0,1,1,1,1,NULL,NULL,NULL,487,NULL),(844,'nombre','ALGODON',738,'CUADROS',0,0,1,1,1,NULL,NULL,NULL,487,NULL),(845,'nombre','NINGUNO',739,'LISA',0,0,1,1,1,NULL,NULL,NULL,487,NULL),(846,'nombre','ALGODON',740,'LISA',0,1,1,1,1,NULL,NULL,NULL,487,NULL),(847,'nombre','ALGODON',741,'CUADROS',1,1,1,1,1,NULL,NULL,NULL,487,NULL);
/*!40000 ALTER TABLE `prendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prendas_atuendos`
--

DROP TABLE IF EXISTS `prendas_atuendos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prendas_atuendos` (
  `prenda_id` int(11) NOT NULL,
  `atuendo_id` int(11) NOT NULL,
  PRIMARY KEY (`prenda_id`,`atuendo_id`),
  KEY `prendas_atuendos_FK` (`atuendo_id`),
  CONSTRAINT `prendas_atuendos_FK` FOREIGN KEY (`atuendo_id`) REFERENCES `atuendos` (`atuendo_id`) ON DELETE CASCADE,
  CONSTRAINT `prendas_atuendos_FK_1` FOREIGN KEY (`prenda_id`) REFERENCES `prendas` (`prenda_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prendas_atuendos`
--

LOCK TABLES `prendas_atuendos` WRITE;
/*!40000 ALTER TABLE `prendas_atuendos` DISABLE KEYS */;
INSERT INTO `prendas_atuendos` VALUES (844,79945),(844,79946),(844,79947),(844,79948),(844,79949),(844,79950),(844,79951),(844,79952),(837,79953),(844,79953),(837,79954),(844,79954),(837,79955),(844,79955),(837,79956),(844,79956),(837,79957),(844,79957),(837,79958),(844,79958),(837,79959),(844,79959),(837,79960),(844,79960),(837,79961),(843,79961),(844,79961),(837,79962),(843,79962),(844,79962),(837,79963),(843,79963),(844,79963),(837,79964),(843,79964),(844,79964),(837,79965),(843,79965),(844,79965),(837,79966),(843,79966),(844,79966),(837,79967),(843,79967),(844,79967),(837,79968),(843,79968),(844,79968),(843,79969),(843,79970),(843,79971),(843,79972),(843,79973),(843,79974),(843,79975),(843,79976),(837,79977),(843,79977),(837,79978),(843,79978),(837,79979),(843,79979),(837,79980),(843,79980),(837,79981),(843,79981),(837,79982),(843,79982),(837,79983),(843,79983),(837,79984),(843,79984),(837,79985),(837,79986),(837,79987),(837,79988),(837,79989),(837,79990),(837,79991),(837,79992),(843,79993),(844,79993),(843,79994),(844,79994),(843,79995),(844,79995),(843,79996),(844,79996),(843,79997),(844,79997),(843,79998),(844,79998),(843,79999),(844,79999),(843,80000),(844,80000),(837,80001),(843,80002),(837,80003),(843,80003);
/*!40000 ALTER TABLE `prendas_atuendos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_prenda`
--

DROP TABLE IF EXISTS `tipo_prenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_prenda` (
  `tipo_prenda_id` int(11) NOT NULL AUTO_INCREMENT,
  `temperatura_max` double NOT NULL,
  `temperatura_min` double NOT NULL,
  `categoria` varchar(40) DEFAULT NULL,
  `nombre_tipo_prenda` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tipo_prenda_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_prenda`
--

LOCK TABLES `tipo_prenda` WRITE;
/*!40000 ALTER TABLE `tipo_prenda` DISABLE KEYS */;
INSERT INTO `tipo_prenda` VALUES (1,40,18,'CALZADO','crocs y ojotas'),(2,30,10,'PARTE_SUPERIOR_ABAJO','remera'),(3,30,10,'PARTE_INFERIOR','pantalon'),(4,30,10,'ACCESORIO_MANOS','ninguno'),(5,30,10,'ACCESORIO_CUELLO',NULL),(7,30,20,'PARTE_SUPERIOR_ABAJO',NULL),(8,15,20,'PARTE_SUPERIOR_ABAJO',NULL),(9,35,-5,'CALZADO',NULL),(10,35,20,'PARTE_INFERIOR',NULL),(11,35,20,'PARTE_INFERIOR',NULL),(12,0,0,'ACCESORIO',NULL),(13,10,-10,'ACCESORIO_CUELLO',NULL),(14,10,-5,'ACCESORIO_MANOS',NULL);
/*!40000 ALTER TABLE `tipo_prenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_prenda_material`
--

DROP TABLE IF EXISTS `tipo_prenda_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_prenda_material` (
  `material_id` int(11) NOT NULL,
  `tipo_prenda_id` int(11) NOT NULL,
  PRIMARY KEY (`material_id`,`tipo_prenda_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_prenda_material`
--

LOCK TABLES `tipo_prenda_material` WRITE;
/*!40000 ALTER TABLE `tipo_prenda_material` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_prenda_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_prendas`
--

DROP TABLE IF EXISTS `tipo_prendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_prendas` (
  `tipo_prenda_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_prenda` varchar(100) DEFAULT NULL,
  `temperatura_max` double NOT NULL,
  `temperatura_min` double NOT NULL,
  `categoria` varchar(40) DEFAULT NULL,
  `material_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tipo_prenda_id`)
) ENGINE=InnoDB AUTO_INCREMENT=749 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_prendas`
--

LOCK TABLES `tipo_prendas` WRITE;
/*!40000 ALTER TABLE `tipo_prendas` DISABLE KEYS */;
INSERT INTO `tipo_prendas` VALUES (703,'Musculosa',30,20,'PARTE_SUPERIOR_ABAJO',NULL),(704,'Short',35,20,'PARTE_INFERIOR',NULL),(705,'Crocs',40,18,'CALZADO',NULL),(706,'Guantes',10,-5,'ACCESORIO_MANOS',NULL),(707,'Bufanda',10,-10,'ACCESORIO_CUELLO',NULL),(708,'Anteojos',0,0,'ACCESORIO',NULL),(709,'Remera',35,20,'PARTE_SUPERIOR_ABAJO',NULL),(710,'Zapato',35,-5,'CALZADO',NULL),(711,'Gorra',10,-10,'ACCESORIO',NULL),(712,'Remera manga larga',26,18,'PARTE_SUPERIOR_ABAJO',NULL),(713,'Pantalón de invierno',-5,18,'PARTE_INFERIOR',NULL),(714,'Campera',20,5,'PARTE_SUPERIOR_ARRIBA',NULL),(715,'Bufanda',10,-10,'ACCESORIO_CUELLO',NULL),(716,'Guantes',10,-5,'ACCESORIO_MANOS',NULL),(717,'Bufanda',10,-10,'ACCESORIO_CUELLO',NULL),(718,'Guantes',10,-5,'ACCESORIO_MANOS',NULL),(719,'Bufanda',10,-10,'ACCESORIO_CUELLO',NULL),(720,'Guantes',10,-5,'ACCESORIO_MANOS',NULL),(721,'Sin accesorios manos',0,-50,'ACCESORIO_MANOS',NULL),(722,'Zapatilals',30,0,'CALZADO',NULL),(723,'Musculosa',30,20,'PARTE_SUPERIOR_ABAJO',NULL),(724,'Buzo',28,0,'PARTE_SUPERIOR_MEDIO',NULL),(725,'Sin accesorios cuello',0,-50,'ACCESORIO_CUELLO',NULL),(726,'Pañuelo',0,0,'ACCESORIO',NULL),(727,'Pantalón casual',30,-17,'PARTE_INFERIOR',NULL),(728,'Sin accesorios manos',0,-50,'ACCESORIO_MANOS',NULL),(729,'Zapatilals',30,0,'CALZADO',NULL),(730,'Musculosa',30,20,'PARTE_SUPERIOR_ABAJO',NULL),(731,'Buzo',28,0,'PARTE_SUPERIOR_MEDIO',NULL),(732,'Sin accesorios cuello',0,-50,'ACCESORIO_CUELLO',NULL),(733,'Pañuelo',0,0,'ACCESORIO',NULL),(734,'Pantalón casual',30,-17,'PARTE_INFERIOR',NULL),(735,'Sin accesorios manos',0,-50,'ACCESORIO_MANOS',NULL),(736,'Zapatilals',30,0,'CALZADO',NULL),(737,'Musculosa',30,20,'PARTE_SUPERIOR_ABAJO',NULL),(738,'Buzo',28,0,'PARTE_SUPERIOR_MEDIO',NULL),(739,'Sin accesorios cuello',0,-50,'ACCESORIO_CUELLO',NULL),(740,'Pañuelo',0,0,'ACCESORIO',NULL),(741,'Pantalón casual',30,-17,'PARTE_INFERIOR',NULL);
/*!40000 ALTER TABLE `tipo_prendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(40) NOT NULL,
  `contrasenia` varchar(40) NOT NULL,
  `numero_celular` varchar(20) DEFAULT NULL,
  `tiempo_anticipacion` int(11) DEFAULT NULL,
  `calendario_id` int(11) NOT NULL,
  `contraseniaHash` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Daiu','123','123',333,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_guardarropa`
--

DROP TABLE IF EXISTS `usuario_guardarropa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_guardarropa` (
  `guardarropa_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`guardarropa_id`,`usuario_id`),
  KEY `usuario_guardarropa_FK_1` (`usuario_id`),
  CONSTRAINT `usuario_guardarropa_FK` FOREIGN KEY (`guardarropa_id`) REFERENCES `guardarropa` (`guardarropa_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuario_guardarropa_FK_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_guardarropa`
--

LOCK TABLES `usuario_guardarropa` WRITE;
/*!40000 ALTER TABLE `usuario_guardarropa` DISABLE KEYS */;
INSERT INTO `usuario_guardarropa` VALUES (1,1),(487,310);
/*!40000 ALTER TABLE `usuario_guardarropa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  `apellido` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contrasenia` varchar(40) NOT NULL,
  `numero_celular` varchar(20) DEFAULT NULL,
  `tiempo_anticipacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (307,'Alexis','Dona','alexis.dona@gmail.com','7110eda4d09e062aa5e4a390b0a572ac0d2c0220','+54911651651',0),(308,'Diego','Peccia','diegoignaciopeccia@gmail.com','d5f12e53a182c062b6bf30c1445153faff12269a','+54911687895',0),(309,'Marina','Posru','maruposru@gmail.com','ac05f5ed6c3c5c3f51a5911d33826a47434ea6ff','+5491131458855',0),(310,'Daiana','Szwimer','daiu.szwimer@gmail.com','7110eda4d09e062aa5e4a390b0a572ac0d2c0220','+5491154632210',0);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_guardarropas`
--

DROP TABLE IF EXISTS `usuarios_guardarropas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_guardarropas` (
  `guardarropa_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`guardarropa_id`,`usuario_id`),
  KEY `usuario_guardarropa_FK_1` (`usuario_id`),
  CONSTRAINT `usuario_guardarropa_FK1` FOREIGN KEY (`guardarropa_id`) REFERENCES `guardarropas` (`guardarropa_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuario_guardarropa_FK_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_guardarropas`
--

LOCK TABLES `usuarios_guardarropas` WRITE;
/*!40000 ALTER TABLE `usuarios_guardarropas` DISABLE KEYS */;
INSERT INTO `usuarios_guardarropas` VALUES (488,307),(488,308),(489,309),(487,310);
/*!40000 ALTER TABLE `usuarios_guardarropas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-17  0:01:41
