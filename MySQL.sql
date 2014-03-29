CREATE DATABASE  IF NOT EXISTS `encom` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `encom`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: encom
-- ------------------------------------------------------
-- Server version	5.6.16

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
-- Table structure for table `catalogo_grupo`
--

DROP TABLE IF EXISTS `catalogo_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogo_grupo` (
  `ID_Grupo` int(11) NOT NULL AUTO_INCREMENT,
  `Semestre` varchar(45) NOT NULL,
  `Numero` varchar(45) NOT NULL,
  `Matutino` tinyint(4) NOT NULL,
  `Tag` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_Grupo`),
  UNIQUE KEY `tag_UNIQUE` (`Tag`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo_grupo`
--

LOCK TABLES `catalogo_grupo` WRITE;
/*!40000 ALTER TABLE `catalogo_grupo` DISABLE KEYS */;
INSERT INTO `catalogo_grupo` VALUES (1,'3','6',1,'3IM6'),(2,'3','7',1,'3IM7'),(3,'3','8',1,'3IM8'),(4,'3','9',1,'3IM9'),(5,'4','6',1,'4IM6'),(6,'4','7',1,'4IM7'),(7,'4','8',1,'4IM8'),(8,'4','9',1,'4IM9'),(9,'5','6',1,'5IM6'),(10,'5','7',1,'5IM7'),(11,'5','8',1,'5IM8'),(12,'5','9',1,'5IM9'),(13,'6','6',1,'6IM6'),(14,'6','7',1,'6IM7'),(15,'6','8',1,'6IM8'),(16,'6','9',1,'6IM9');
/*!40000 ALTER TABLE `catalogo_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogo_materias`
--

DROP TABLE IF EXISTS `catalogo_materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogo_materias` (
  `ID_Materia` int(11) NOT NULL AUTO_INCREMENT,
  `nombreMat` varchar(45) NOT NULL,
  `semestre` int(11) NOT NULL,
  PRIMARY KEY (`ID_Materia`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo_materias`
--

LOCK TABLES `catalogo_materias` WRITE;
/*!40000 ALTER TABLE `catalogo_materias` DISABLE KEYS */;
INSERT INTO `catalogo_materias` VALUES (1,'Desarrollo Web',6);
/*!40000 ALTER TABLE `catalogo_materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventos` (
  `idEvento` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Evento` varchar(75) NOT NULL,
  `Descripcion` text NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `Duracion` int(11) NOT NULL,
  `Habilitado` tinyint(4) NOT NULL,
  PRIMARY KEY (`idEvento`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='Tabla Eventos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (15,'inFamous Second Son','Keynote de ENCOM','2014-04-03','09:00:00',2,0),(16,'InFamous','Ya mero sale :3','2014-03-22','04:01:00',2,0),(17,'InFamous 2','Va a estar piolas','2014-03-14','01:01:00',1,0),(18,'InFamous Second Son 3','Keynote de ENCOM','2014-04-03','09:00:00',2,1);
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `correo` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `direccion` text NOT NULL,
  `administrador` tinyint(4) NOT NULL,
  PRIMARY KEY (`correo`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('mmafarah225@gmail.com','Vocas225',2553,'Margarita','Tlahuac',0),('sslkeyregit@gmail.com','Paola',2552,'Santiago','Tlahuac',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-29  0:51:01
