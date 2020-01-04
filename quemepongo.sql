-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: mna97msstjnkkp7h.cbetxkdyhwsb.us-east-1.rds.amazonaws.com    Database: xdnbowkup2bzy501
-- ------------------------------------------------------
-- Server version	5.7.23-log

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup
--

SET @@GLOBAL.GTID_PURGED='';

--
-- Table structure for table `atuendos`
--

DROP TABLE IF EXISTS `atuendos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atuendos` (
                            `atuendo_id` int(11) NOT NULL AUTO_INCREMENT,
                            `nombre` varchar(40) DEFAULT NULL,
                            `evento_id` int(11) DEFAULT NULL,
                            `accesorio_id` int(11) DEFAULT NULL,
                            `prenda_inferior_id` int(11) DEFAULT NULL,
                            `calzado_id` int(11) DEFAULT NULL,
                            `cuello_id` int(11) DEFAULT NULL,
                            `manos_id` int(11) DEFAULT NULL,
                            `estado` varchar(100) DEFAULT NULL,
                            `calificacion` int(10) DEFAULT NULL,
                            `fecha_actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                            PRIMARY KEY (`atuendo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80004 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atuendos`
--

LOCK TABLES `atuendos` WRITE;
/*!40000 ALTER TABLE `atuendos` DISABLE KEYS */;
INSERT INTO `atuendos` VALUES (79945,NULL,342,839,840,842,838,841,'RECHAZADO',NULL,'2019-12-17 04:26:04'),(79946,NULL,342,839,840,842,845,841,'CALIFICADO',4,'2019-12-19 02:57:19'),(79947,NULL,342,846,840,842,838,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79948,NULL,342,846,840,842,845,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79949,NULL,342,839,847,842,838,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79950,NULL,342,839,847,842,845,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79951,NULL,342,846,847,842,838,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79952,NULL,342,846,847,842,845,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79953,NULL,342,839,840,842,838,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79954,NULL,342,839,840,842,845,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79955,NULL,342,846,840,842,838,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79956,NULL,342,846,840,842,845,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79957,NULL,342,839,847,842,838,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79958,NULL,342,839,847,842,845,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79959,NULL,342,846,847,842,838,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79960,NULL,342,846,847,842,845,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79961,NULL,342,839,840,842,838,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79962,NULL,342,839,840,842,845,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79963,NULL,342,846,840,842,838,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79964,NULL,342,846,840,842,845,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79965,NULL,342,839,847,842,838,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79966,NULL,342,839,847,842,845,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79967,NULL,342,846,847,842,838,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79968,NULL,342,846,847,842,845,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79969,NULL,342,839,840,842,838,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79970,NULL,342,839,840,842,845,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79971,NULL,342,846,840,842,838,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79972,NULL,342,846,840,842,845,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79973,NULL,342,839,847,842,838,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79974,NULL,342,839,847,842,845,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79975,NULL,342,846,847,842,838,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79976,NULL,342,846,847,842,845,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79977,NULL,342,839,840,842,838,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79978,NULL,342,839,840,842,845,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79979,NULL,342,846,840,842,838,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79980,NULL,342,846,840,842,845,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79981,NULL,342,839,847,842,838,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79982,NULL,342,839,847,842,845,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79983,NULL,342,846,847,842,838,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79984,NULL,342,846,847,842,845,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79985,NULL,342,839,840,842,838,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79986,NULL,342,839,840,842,845,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79987,NULL,342,846,840,842,838,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79988,NULL,342,846,840,842,845,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79989,NULL,342,839,847,842,838,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79990,NULL,342,839,847,842,845,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79991,NULL,342,846,847,842,838,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79992,NULL,342,846,847,842,845,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79993,NULL,342,839,840,842,838,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79994,NULL,342,839,840,842,845,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79995,NULL,342,846,840,842,838,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79996,NULL,342,846,840,842,845,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79997,NULL,342,839,847,842,838,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79998,NULL,342,839,847,842,845,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(79999,NULL,342,846,847,842,838,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(80000,NULL,342,846,847,842,845,841,'NUEVO',NULL,'2019-12-17 02:31:42'),(80001,NULL,343,846,847,835,838,834,'NUEVO',NULL,'2019-12-19 02:53:32'),(80002,NULL,343,846,847,835,838,834,'NUEVO',NULL,'2019-12-19 02:53:25'),(80003,NULL,343,846,847,835,838,834,'NUEVO',NULL,'2019-12-19 02:48:23');
/*!40000 ALTER TABLE `atuendos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`rsb4nbe56bla5gor`@`%`*/ /*!50003 TRIGGER trigger_atuendos_estados
    AFTER UPDATE
    ON atuendos FOR EACH ROW
    insert into atuendos_estados(atuendo_id,estado,calificacion,fecha_actualizacion) values (OLD.atuendo_id,OLD.estado,OLD.calificacion,now()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=latin1;
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
-- Table structure for table `tipo_prendas`
--

DROP TABLE IF EXISTS `tipo_prendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
-- Table structure for table `materiales_tipos_prendas`
--

DROP TABLE IF EXISTS `materiales_tipos_prendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materiales_tipos_prendas` (
                                            `tipo_prenda_id` int(11) DEFAULT NULL,
                                            `material` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
-- Table structure for table `prendas_atuendos`
--

DROP TABLE IF EXISTS `prendas_atuendos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
-- Table structure for table `tipo_prenda_material`
--

DROP TABLE IF EXISTS `tipo_prenda_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_prenda_material` (
                                        `material_id` int(11) NOT NULL,
                                        `tipo_prenda_id` int(11) NOT NULL,
                                        PRIMARY KEY (`material_id`,`tipo_prenda_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_prenda_material`
--

LOCK TABLES `tipo_prenda_material` WRITE;
/*!40000 ALTER TABLE `tipo_prenda_material` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_prenda_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
-- Table structure for table `materiales`
--

DROP TABLE IF EXISTS `materiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materiales` (
                              `tipo_prenda_id` int(11) DEFAULT NULL,
                              `material_id` int(11) NOT NULL,
                              PRIMARY KEY (`material_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
-- Table structure for table `usuarios_guardarropas`
--

DROP TABLE IF EXISTS `usuarios_guardarropas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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

--
-- Table structure for table `guardarropas`
--

DROP TABLE IF EXISTS `guardarropas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
-- Table structure for table `atuendos_estados`
--

DROP TABLE IF EXISTS `atuendos_estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atuendos_estados` (
                                    `atuendo_id` int(11) NOT NULL,
                                    `estado` varchar(40) NOT NULL,
                                    `calificacion` int(11) DEFAULT NULL,
                                    `fecha_actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atuendos_estados`
--

LOCK TABLES `atuendos_estados` WRITE;
/*!40000 ALTER TABLE `atuendos_estados` DISABLE KEYS */;
INSERT INTO `atuendos_estados` VALUES (751,'NUEVO',NULL,'2019-12-17 02:57:28'),(751,'ALEXIS',NULL,'2019-12-17 02:58:06'),(79945,'NUEVO',NULL,'2019-12-17 02:31:42'),(79946,'NUEVO',NULL,'2019-12-17 02:31:42'),(79947,'NUEVO',NULL,'2019-12-17 02:31:42'),(79948,'NUEVO',NULL,'2019-12-17 02:31:42'),(79949,'NUEVO',NULL,'2019-12-17 02:31:42'),(79950,'NUEVO',NULL,'2019-12-17 02:31:42'),(79951,'NUEVO',NULL,'2019-12-17 02:31:42'),(79952,'NUEVO',NULL,'2019-12-17 02:31:42'),(79953,'NUEVO',NULL,'2019-12-17 02:31:42'),(79954,'NUEVO',NULL,'2019-12-17 02:31:42'),(79955,'NUEVO',NULL,'2019-12-17 02:31:42'),(79956,'NUEVO',NULL,'2019-12-17 02:31:42'),(79957,'NUEVO',NULL,'2019-12-17 02:31:42'),(79958,'NUEVO',NULL,'2019-12-17 02:31:42'),(79959,'NUEVO',NULL,'2019-12-17 02:31:42'),(79960,'NUEVO',NULL,'2019-12-17 02:31:42'),(79961,'NUEVO',NULL,'2019-12-17 02:31:42'),(79962,'NUEVO',NULL,'2019-12-17 02:31:42'),(79963,'NUEVO',NULL,'2019-12-17 02:31:42'),(79964,'NUEVO',NULL,'2019-12-17 02:31:42'),(79965,'NUEVO',NULL,'2019-12-17 02:31:42'),(79966,'NUEVO',NULL,'2019-12-17 02:31:42'),(79967,'NUEVO',NULL,'2019-12-17 02:31:42'),(79968,'NUEVO',NULL,'2019-12-17 02:31:42'),(79969,'NUEVO',NULL,'2019-12-17 02:31:42'),(79970,'NUEVO',NULL,'2019-12-17 02:31:42'),(79971,'NUEVO',NULL,'2019-12-17 02:31:42'),(79972,'NUEVO',NULL,'2019-12-17 02:31:42'),(79973,'NUEVO',NULL,'2019-12-17 02:31:42'),(79974,'NUEVO',NULL,'2019-12-17 02:31:42'),(79975,'NUEVO',NULL,'2019-12-17 02:31:42'),(79976,'NUEVO',NULL,'2019-12-17 02:31:42'),(79977,'NUEVO',NULL,'2019-12-17 02:31:42'),(79978,'NUEVO',NULL,'2019-12-17 02:31:42'),(79979,'NUEVO',NULL,'2019-12-17 02:31:42'),(79980,'NUEVO',NULL,'2019-12-17 02:31:42'),(79981,'NUEVO',NULL,'2019-12-17 02:31:42'),(79982,'NUEVO',NULL,'2019-12-17 02:31:42'),(79983,'NUEVO',NULL,'2019-12-17 02:31:42'),(79984,'NUEVO',NULL,'2019-12-17 02:31:42'),(79985,'NUEVO',NULL,'2019-12-17 02:31:42'),(79986,'NUEVO',NULL,'2019-12-17 02:31:42'),(79987,'NUEVO',NULL,'2019-12-17 02:31:42'),(79988,'NUEVO',NULL,'2019-12-17 02:31:42'),(79989,'NUEVO',NULL,'2019-12-17 02:31:42'),(79990,'NUEVO',NULL,'2019-12-17 02:31:42'),(79991,'NUEVO',NULL,'2019-12-17 02:31:42'),(79992,'NUEVO',NULL,'2019-12-17 02:31:42'),(79993,'NUEVO',NULL,'2019-12-17 02:31:42'),(79994,'NUEVO',NULL,'2019-12-17 02:31:42'),(79995,'NUEVO',NULL,'2019-12-17 02:31:42'),(79996,'NUEVO',NULL,'2019-12-17 02:31:42'),(79997,'NUEVO',NULL,'2019-12-17 02:31:42'),(79998,'NUEVO',NULL,'2019-12-17 02:31:42'),(79999,'NUEVO',NULL,'2019-12-17 02:31:42'),(80000,'NUEVO',NULL,'2019-12-17 02:31:42'),(79945,'NUEVO',NULL,'2019-12-17 02:34:30'),(79945,'RECHAZADO',NULL,'2019-12-17 02:34:43'),(79946,'NUEVO',NULL,'2019-12-17 02:34:43'),(79946,'ACEPTADO',NULL,'2019-12-17 02:39:08'),(80001,'NUEVO',NULL,'2019-12-17 02:49:42'),(80002,'NUEVO',NULL,'2019-12-17 02:49:42'),(80003,'NUEVO',NULL,'2019-12-17 02:49:42'),(80001,'NUEVO',NULL,'2019-12-17 02:56:20'),(80001,'RECHAZADO',NULL,'2019-12-17 02:57:17'),(80001,'NUEVO',NULL,'2019-12-17 02:57:41'),(80001,'RECHAZADO',NULL,'2019-12-17 02:57:49'),(80002,'NUEVO',NULL,'2019-12-17 02:57:50'),(80002,'RECHAZADO',NULL,'2019-12-17 02:57:58'),(80003,'NUEVO',NULL,'2019-12-17 02:57:58'),(79946,'CALIFICADO',5,'2019-12-17 04:21:12'),(79946,'CALIFICADO',2,'2019-12-17 04:22:31'),(79945,'NUEVO',NULL,'2019-12-17 04:26:04'),(79946,'CALIFICADO',4,'2019-12-17 04:26:05'),(79946,'CALIFICADO',5,'2019-12-19 01:53:50'),(79946,'CALIFICADO',4,'2019-12-19 02:09:33'),(80001,'NUEVO',NULL,'2019-12-19 02:43:01'),(80003,'RECHAZADO',NULL,'2019-12-19 02:48:23'),(80001,'RECHAZADO',NULL,'2019-12-19 02:50:14'),(80001,'NUEVO',NULL,'2019-12-19 02:52:36'),(80002,'NUEVO',NULL,'2019-12-19 02:52:36'),(80002,'RECHAZADO',NULL,'2019-12-19 02:53:25'),(80001,'RECHAZADO',NULL,'2019-12-19 02:53:32'),(79946,'CALIFICADO',3,'2019-12-19 02:57:19');
/*!40000 ALTER TABLE `atuendos_estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prendas`
--

DROP TABLE IF EXISTS `prendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
                           PRIMARY KEY (`prenda_id`)
) ENGINE=InnoDB AUTO_INCREMENT=855 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prendas`
--

LOCK TABLES `prendas` WRITE;
/*!40000 ALTER TABLE `prendas` DISABLE KEYS */;
INSERT INTO `prendas` VALUES (800,'Musculosa','ALGODON',703,'CUADROS',0,1,10,11,12,NULL,NULL,NULL,486),(801,'Short','JEAN',704,'LISA',0,1,10,11,12,NULL,NULL,NULL,486),(802,'ojotas havaianas','GOMA',705,'NINGUNO',1,1,10,86,88,82,16,88,486),(803,'Guantes de Cuero','CUERO',706,'LISA',0,1,10,11,12,NULL,NULL,NULL,486),(804,'Bufanda','LANA',707,'LISA',0,1,10,11,12,NULL,NULL,NULL,486),(805,'Anteojos','PLASTICO',708,'LISA',0,1,10,11,12,NULL,NULL,NULL,486),(806,'Remera lisa','ALGODON',709,'LISA',0,1,10,5,0,20,0,2,486),(808,'Gorra de sol','POLYESTER',711,'LISA',0,1,20,0,2,NULL,NULL,NULL,486),(810,'pantalon de jean','JEAN',713,'LISA',0,1,10,11,12,NULL,NULL,NULL,486),(813,'zapatillas','ALGODON',710,'LISA',1,1,10,11,12,NULL,NULL,NULL,486),(815,'BufandaRoja','LANA',715,'LISA',0,1,1,2,3,NULL,NULL,NULL,486),(816,'Guantes','CUERO',716,'LISA',0,1,1,2,3,NULL,NULL,NULL,486),(827,'nombre','NINGUNO',721,'LISA',0,1,1,1,1,NULL,NULL,NULL,486),(828,'nombre','ALGODON',722,'CUADROS',0,1,1,1,1,NULL,NULL,NULL,486),(829,'nombre','ALGODON',723,'LISA',0,1,1,1,1,NULL,NULL,NULL,486),(830,'nombre','ALGODON',724,'CUADROS',0,1,1,1,1,NULL,NULL,NULL,486),(831,'nombre','NINGUNO',725,'LISA',0,0,1,1,1,NULL,NULL,NULL,486),(832,'nombre','ALGODON',726,'LISA',0,1,1,1,1,NULL,NULL,NULL,486),(833,'nombre','ALGODON',727,'CUADROS',1,1,1,1,1,NULL,NULL,NULL,486),(834,'Otro sin accesorio en las manos','NINGUNO',728,'LISA',0,1,1,1,1,NULL,NULL,NULL,487),(835,'Converse','ALGODON',729,'CUADROS',0,1,1,1,1,NULL,NULL,NULL,487),(836,'nombre','ALGODON',730,'LISA',0,1,1,1,1,NULL,NULL,NULL,486),(837,'Sweater','ALGODON',731,'CUADROS',0,1,1,1,1,NULL,NULL,NULL,487),(838,'Otro sin accesorios en cuello','NINGUNO',732,'LISA',0,1,1,1,1,NULL,NULL,NULL,487),(839,'Bandana','ALGODON',733,'LISA',0,1,1,1,1,NULL,NULL,NULL,487),(840,'Jogging','ALGODON',734,'CUADROS',1,1,1,1,1,NULL,NULL,NULL,487),(841,'Sin accesorio en las manos','NINGUNO',735,'LISA',0,1,1,1,1,NULL,NULL,NULL,487),(842,'Zapatillas','ALGODON',736,'CUADROS',0,1,1,1,1,NULL,NULL,NULL,487),(843,'Musculosa','ALGODON',737,'LISA',0,1,1,1,1,NULL,NULL,NULL,487),(844,'Buzo','ALGODON',738,'CUADROS',0,1,1,1,1,NULL,NULL,NULL,487),(845,'Sin accesorios de cuello','NINGUNO',739,'LISA',0,0,1,1,1,NULL,NULL,NULL,487),(846,'Pañuelo','ALGODON',740,'LISA',0,1,1,1,1,NULL,NULL,NULL,487),(847,'Pantalón casual','ALGODON',741,'CUADROS',1,1,1,1,1,NULL,NULL,NULL,487);
/*!40000 ALTER TABLE `prendas` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-19  0:32:19