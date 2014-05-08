CREATE DATABASE  IF NOT EXISTS `encom` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `encom`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: encom
-- ------------------------------------------------------
-- Server version	5.6.17

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
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
  `ID_Materia` varchar(4) NOT NULL,
  `nombreMat` text NOT NULL,
  `semestre` int(11) NOT NULL,
  PRIMARY KEY (`ID_Materia`),
  UNIQUE KEY `ID_Materia_UNIQUE` (`ID_Materia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo_materias`
--

LOCK TABLES `catalogo_materias` WRITE;
/*!40000 ALTER TABLE `catalogo_materias` DISABLE KEYS */;
INSERT INTO `catalogo_materias` VALUES ('P309','Laboratorio de Proyectos 1',3),('P310','Administracion de Proyectos 1',3),('P321','Programacion Orientada a Objetos',3),('P367','Soporte de Software',6),('P409','Administracion de Proyectos 2',4),('P410','Tecnicas de Programacion Personal con Calidad',4),('P411','Software de Diseño Electronico',4),('P425','Programacion y Servicio Web',4),('P426','Base de Datos',4),('P427','Laboratorio de Proyectos 2',4),('P509','Laboratorio de Proyectos 3',5),('P510','Automatizacion de Pruebas',5),('P530','Introduccion a los Sistemas Distribuidos',5),('P531','Introduccion a la Ingenieria de Pruebas',5),('P532','Seguridad Web y Aplicaciones',5),('P609','Laboratorio de Proyectos 4',6),('P610','Proyecto Integrador',6),('P636','Metodos Agiles de Programacion',6),('P638','Ingenieria de Software Basica',6),('P701','Desarrollo de aplicaciones Direct3D',7);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='Tabla Eventos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (15,'inFamous Second Son','Keynote de ENCOM','2014-04-03','09:00:00',2,0),(16,'InFamous','Ya mero sale :3','2014-03-22','04:01:00',2,0),(17,'InFamous 2','Va a estar piolas','2014-03-14','01:01:00',1,0),(18,'InFamous Second Son 3','Keynote de ENCOM','2014-04-03','09:00:00',2,1),(19,'Gremlin','Holis','2014-12-31','12:59:00',1,1);
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horario` (
  `idhorario` int(11) NOT NULL AUTO_INCREMENT,
  `idProfesor` int(11) NOT NULL,
  `idMateria` varchar(45) NOT NULL,
  `Tag` varchar(45) NOT NULL,
  `LEntrada` time DEFAULT NULL,
  `LSalida` time DEFAULT NULL,
  `MEntrada` time DEFAULT NULL,
  `MSalida` time DEFAULT NULL,
  `MiEntrada` time DEFAULT NULL,
  `MiSalida` time DEFAULT NULL,
  `JEntrada` time DEFAULT NULL,
  `JSalida` time DEFAULT NULL,
  `VEntrada` time DEFAULT NULL,
  `VSalida` time DEFAULT NULL,
  PRIMARY KEY (`idhorario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` VALUES (8,2552,'P301','3IM7','07:00:00','08:00:00','00:00:00','00:00:00','07:00:00','08:00:00','00:00:00','00:00:00','00:00:00','00:00:00'),(9,2552,'P301','3IM8','07:00:00','08:00:00','00:00:00','00:00:00','07:00:00','08:00:00','00:00:00','00:00:00','00:00:00','00:00:00');
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidencias`
--

DROP TABLE IF EXISTS `incidencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incidencias` (
  `idProfesor1` int(11) DEFAULT NULL,
  `idMateria1` varchar(45) DEFAULT NULL,
  `idHorario1` int(11) DEFAULT NULL,
  `hEntrada` time DEFAULT NULL,
  `hSalida` time DEFAULT NULL,
  `falta` tinyint(4) DEFAULT NULL,
  `retardo` tinyint(4) DEFAULT NULL,
  `diaEco` tinyint(4) DEFAULT NULL,
  KEY `idProfesor_idx` (`idProfesor1`),
  KEY `idMateria_idx` (`idMateria1`),
  KEY `idHorario_idx` (`idHorario1`),
  CONSTRAINT `idHorario` FOREIGN KEY (`idHorario1`) REFERENCES `horario` (`idhorario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idMateria` FOREIGN KEY (`idMateria1`) REFERENCES `catalogo_materias` (`ID_Materia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idProfesor` FOREIGN KEY (`idProfesor1`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidencias`
--

LOCK TABLES `incidencias` WRITE;
/*!40000 ALTER TABLE `incidencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `incidencias` ENABLE KEYS */;
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

--
-- Dumping events for database 'encom'
--

--
-- Dumping routines for database 'encom'
--
/*!50003 DROP PROCEDURE IF EXISTS `Consul_Inci` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Consul_Inci`(Profes varchar(50))
BEGIN
select * from Incidencias where (idProfesor1=Profes);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Elimina_Inci` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Elimina_Inci`(Profes varchar(50))
begin
delete from Incidencias where (idProfesor1=Profes);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `New_Incidencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `New_Incidencia`(in idProfe INT, OUT registro BOOLEAN)
begin
DECLARE nullHour INT;
DECLARE ahora TIME;
DECLARE dia INT;
DECLARE horacomp time;
SET ahora=(SELECT curtime());
SET dia=(SELECT weekday(curdate()));
if (dia=0) then SET nullHour=(SELECT COUNT(*) from horario WHERE idProfesor=idProfe AND LEntrada='00:00:00');
if horacomp=nullHour then SET registro=false;
else

SET registro =false;
END if;
elseif (dia=1) THEN SET horacomp=nullHour;
else
SET horacomp=nullHour;
END if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrarAsistencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarAsistencia`(in id int, out confirmacion boolean)
BEGIN
	DECLARE dia INT;
	DECLARE entrada time;
	DECLARE salida time;
	SET dia=(SELECT weekday(curdate()));
	if dia=0 then
		SELECT DISTINCT LEntrada, LSalida FROM horario WHERE idProfesor=id AND LEntrada BETWEEN '07:00:00' AND (curtime());
	elseif dia=1 then
		SELECT DISTINCT MEntrada, MSalida FROM horario WHERE idProfesor=id AND LEntrada BETWEEN '07:00:00' AND (curtime());
	elseif dia=2 then
		SELECT DISTINCT MiEntrada, MiSalida FROM horario WHERE idProfesor=id AND LEntrada BETWEEN '07:00:00' AND (curtime());
	elseif dia=3 then
		SELECT DISTINCT JEntrada, JSalida FROM horario WHERE idProfesor=id AND LEntrada BETWEEN '07:00:00' AND (curtime());
	elseif dia=4 then
		SELECT DISTINCT VEntrada, VSalida FROM horario WHERE idProfesor=id AND LEntrada BETWEEN '07:00:00' AND (curtime());
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-23 10:31:19
