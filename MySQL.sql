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
-- Table structure for table `asistencia`
--

DROP TABLE IF EXISTS `asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asistencia` (
  `idAsistencia` int(11) NOT NULL AUTO_INCREMENT,
  `idProfesor` int(11) DEFAULT NULL,
  `Dia` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `Asistencia` tinyint(4) DEFAULT '0',
  `Retardo` tinyint(4) DEFAULT '0',
  `Falta` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`idAsistencia`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencia`
--

LOCK TABLES `asistencia` WRITE;
/*!40000 ALTER TABLE `asistencia` DISABLE KEYS */;
INSERT INTO `asistencia` VALUES (4,2552,'2014-05-08','04:16:28',0,0,1);
/*!40000 ALTER TABLE `asistencia` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Table structure for table `contador_dias_economicos`
--

DROP TABLE IF EXISTS `contador_dias_economicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contador_dias_economicos` (
  `idContador` int(11) NOT NULL AUTO_INCREMENT,
  `idProfesor` int(11) DEFAULT NULL,
  `DiasSolicitados` int(11) DEFAULT '0',
  PRIMARY KEY (`idContador`),
  UNIQUE KEY `idProfesor_UNIQUE` (`idProfesor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contador_dias_economicos`
--

LOCK TABLES `contador_dias_economicos` WRITE;
/*!40000 ALTER TABLE `contador_dias_economicos` DISABLE KEYS */;
INSERT INTO `contador_dias_economicos` VALUES (1,2552,1);
/*!40000 ALTER TABLE `contador_dias_economicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dias_economicos`
--

DROP TABLE IF EXISTS `dias_economicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dias_economicos` (
  `iddias_economicos` int(11) NOT NULL AUTO_INCREMENT,
  `idProfesor` int(11) DEFAULT NULL,
  `Dia` date DEFAULT NULL,
  `Status_X` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddias_economicos`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dias_economicos`
--

LOCK TABLES `dias_economicos` WRITE;
/*!40000 ALTER TABLE `dias_economicos` DISABLE KEYS */;
INSERT INTO `dias_economicos` VALUES (1,2552,'2014-07-07','Approved');
/*!40000 ALTER TABLE `dias_economicos` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='Tabla Eventos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (15,'inFamous Second Son','Keynote de ENCOM','2014-04-03','09:00:00',2,0),(16,'InFamous','Ya mero sale :3','2014-03-22','04:01:00',2,0),(17,'InFamous 2','Va a estar piolas','2014-03-14','01:01:00',1,0),(18,'InFamous Second Son 3','Keynote de ENCOM','2014-04-03','09:00:00',2,1),(19,'Gremlin','Holis','2014-12-31','12:59:00',1,1),(20,'MurgaLol','Hola Mundo!','2014-07-05','09:00:00',1,1),(21,'MurgaLOL 2','Hola Murga','2014-09-07','09:00:00',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` VALUES (16,2552,'P301','3IM7','07:00:00','08:00:00','00:00:00','00:00:00','07:00:00','08:00:00','00:00:00','00:00:00','00:00:00','00:00:00'),(17,2552,'P301','3IM8','07:00:00','08:00:00','00:00:00','00:00:00','07:00:00','08:00:00','00:00:00','00:00:00','00:00:00','00:00:00');
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario_nxt`
--

DROP TABLE IF EXISTS `horario_nxt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horario_nxt` (
  `idProfesor` int(11) DEFAULT NULL,
  `idMateria` varchar(10) DEFAULT NULL,
  `Tag` varchar(45) DEFAULT NULL,
  `Dia` varchar(45) DEFAULT NULL,
  `Entrada` varchar(45) DEFAULT NULL,
  `Salida` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario_nxt`
--

LOCK TABLES `horario_nxt` WRITE;
/*!40000 ALTER TABLE `horario_nxt` DISABLE KEYS */;
INSERT INTO `horario_nxt` VALUES (2552,'P301','3IM7','0','07:00:00','08:00:00'),(2552,'P301','3IM7','1','00:00:00','00:00:00'),(2552,'P301','3IM7','2','07:00:00','08:00:00'),(2552,'P301','3IM7','3','00:00:00','00:00:00'),(2552,'P301','3IM7','4','00:00:00','00:00:00'),(2552,'P301','3IM8','0','07:00:00','08:00:00'),(2552,'P301','3IM8','1','00:00:00','00:00:00'),(2552,'P301','3IM8','2','07:00:00','08:00:00'),(2552,'P301','3IM8','3','00:00:00','00:00:00'),(2552,'P301','3IM8','4','00:00:00','00:00:00');
/*!40000 ALTER TABLE `horario_nxt` ENABLE KEYS */;
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
INSERT INTO `usuarios` VALUES ('caro.chomps@gato.com','chuchu',666,'CaroChomps','Ecatepec',0),('mmafarah225@gmail.com','Vocas225',2553,'Margarita','Tlahuac',0),('sslkeyregit@gmail.com','Paola',2552,'Santiago','Tlahuac',1);
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
/*!50003 DROP PROCEDURE IF EXISTS `Decision` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Decision`(in idProf int, in fecha date, in deci boolean, out mensaje nvarchar(4000))
BEGIN
	DECLARE contador INT;
	SELECT DiasSolicitados INTO contador FROM contador_dias_economicos WHERE idProfesor=idProf;
	IF deci = TRUE then
		UPDATE dias_economicos SET Status_X='Approved' WHERE idProfesor=idProf and Dia=fecha;
		SELECT CONCAT('El dia economico ha sido aceptado el dia ',fecha,' para el profesor con el ID ',idProf) INTO mensaje;
	ELSE
		UPDATE contador_dias_economicos SET DiasSolicitados=(SELECT contador-1) WHERE idProfesor=idProf;
		UPDATE dias_economicos SET Status_X='Declined' WHERE idProfesor=idProf and Dia=fecha;
		SELECT CONCAT('El dia economico para el profesor con el ID ',idProf, ' el dia ',fecha, 'ha sido declinado') INTO mensaje;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarHorario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarHorario`(in idProf int, in idMat int, in TagData nvarchar(20), out confirmacion boolean, out mensaje nvarchar(4000))
BEGIN
	DECLARE comprobar INT;
	SET comprobar=(SELECT COUNT(*) FROM horario_nxt WHERE idProfesor=idProf AND idMateria=idMat AND Tag=TagData);
	IF comprobar > 0 THEN
		DELETE FROM horario_nxt WHERE idProfesor=idProf AND idMateria=idMat AND Tag=TagData;
		SET confirmacion=TRUE;
		SET mensaje=(SELECT 'Se ha eliminado el horario con los datos proporcionados');
	ELSE
		SET confirmacion=FALSE;
		SET mensaje=(SELECT 'No se ha encontrado el horario con la informacion otorgada');
	END IF;
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
/*!50003 DROP PROCEDURE IF EXISTS `obtenerHorarioAsistencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerHorarioAsistencia`(in id int, out confirmacion boolean, out mensaje nvarchar(4000))
BEGIN
	DECLARE diaN INT;
	DECLARE comprobar INT;
	SET diaN=(SELECT weekday(curdate()));
		SET comprobar=(SELECT COUNT(*) FROM horario_nxt WHERE idProfesor=id AND Dia=diaN);
		IF comprobar=0 then
			set confirmacion=FALSE;
			SET mensaje=(SELECT concat('El profesor con el ID ', id, ' no tiene que trabajar hoy'));
		else
			SET comprobar=(SELECT count(*) FROM horario_nxt WHERE idProfesor=id AND Dia=diaN AND Entrada NOT BETWEEN '07:00:00' AND (SELECT CURTIME()) AND Entrada !='00:00:00' ORDER BY Entrada ASC);
			IF comprobar > 0 THEN
				set confirmacion=TRUE;
				set mensaje=NULL;
				SELECT Entrada, Salida FROM horario_nxt WHERE idProfesor=id AND Dia=diaN AND Entrada NOT BETWEEN '07:00:00' AND (SELECT CURTIME()) ORDER BY Entrada ASC;
			ELSE
				set confirmacion=FALSE;
				SET mensaje=(SELECT concat('El profesor con el ID ' ,id, ' no se presento en su horario establecido'));
				INSERT INTO asistencia(idProfesor, Dia,Hora, Falta) VALUES (id, (SELECT CURDATE()),(SELECT CURTIME()), TRUE);
			END IF;
		END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerIncidencias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerIncidencias`(in idProf int, out confirmar boolean)
BEGIN
	DECLARE comprobar INT;
	SET comprobar=(SELECT COUNT(*) FROM usuarios WHERE id=idProf);
	IF comprobar > 0 THEN
		SET confirmar=TRUE;
		SELECT * FROM asistencia WHERE idProfesor=idProf;
	ELSE
		SET confirmar=FALSE;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarAsistencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarAsistencia`(in id int, in Hora time, out mensaje NVARCHAR(4000))
BEGIN
	DECLARE horaEntrada TIME;
	DECLARE currentDia INT;
	SELECT weekday(curdate()) INTO currentDia;
	IF currentDia > 4 then
		SELECT CONCAT('El profesor con el ID ', id, ' no tenia que venir hoy') INTO mensaje;
	ELSE
		IF NOT exists(SELECT DISTINCT Entrada FROM horario_nxt WHERE idProfesor=id AND Entrada!='00:00:00' ORDER BY Entrada ASC LIMIT 1) THEN
			SELECT CONCAT('El profesor con el ID ', id, ' no tenia que venir hoy') INTO mensaje;
		else
			SELECT DISTINCT Entrada INTO horaEntrada FROM horario_nxt WHERE idProfesor=id AND Entrada!='00:00:00' ORDER BY Entrada ASC LIMIT 1;
			IF Hora between horaEntrada AND (SELECT ADDTIME(horaEntrada,'00:10:00')) THEN
				INSERT INTO asistencia(idProfesor,Dia,Hora, Asistencia) VALUES(id, (SELECT CURDATE()),(SELECT CURTIME()),TRUE);
				SELECT CONCAT('El profesor con el ID ', id, ' ha llegado a tiempo') INTO mensaje;
			ELSE
				INSERT INTO asistencia(idProfesor,Dia,Hora,Retardo) VALUES(id, (SELECT CURDATE()),(SELECT CURTIME()),TRUE);
				SELECT CONCAT('El profesor con el ID ', id, ' ha llegado con retraso') INTO mensaje;
			END IF;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SolicitarDiaE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SolicitarDiaE`(in idP int, in fecha date, out confirmacion boolean, out mensaje NVARCHAR(4000))
BEGIN
	DECLARE comprobar INT;
	SET comprobar=(SELECT COUNT(*) FROM usuarios where id=idP);
	IF comprobar > 0 then
		IF NOT exists (SELECT DiasSolicitados FROM contador_dias_economicos WHERE idProfesor=idP) then
			INSERT INTO contador_dias_economicos (idProfesor,DiasSolicitados) VALUES (idP,0);
		END IF;
		SET comprobar=(SELECT DiasSolicitados FROM contador_dias_economicos WHERE idProfesor=idP);
		IF comprobar < 10 THEN
			Update contador_dias_economicos SET DiasSolicitados=(SELECT comprobar+1) WHERE idProfesor=idP;
			INSERT INTO dias_economicos (idProfesor, Dia, Status_X) values(idP, fecha, "Waiting");
			SELECT TRUE into confirmacion;
			SELECT CONCAT('Se ha solicitado un dia economico el dia ',fecha, ' por el profesor con ID ', idP) INTO mensaje;
		ELSE
			SELECT FALSE into confirmacion;
			SELECT CONCAT('Se han agotado los dias economicos para el profesor con ID ', idP) INTO mensaje;
		END IF;
	ELSE
		SELECT TRUE into confirmacion;
			SELECT CONCAT('No se encontro profesor con ID ', idP) INTO mensaje;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VerificarAsistencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `VerificarAsistencia`(in idProf int, out confirmar boolean)
BEGIN
	DECLARE comprobar INT;
	SELECT COUNT(*) FROM asistencia WHERE Dia=(SELECT CURDATE()) INTO comprobar;
	IF comprobar > 0 THEN
		SELECT FALSE INTO confirmar;
	ELSE
		SELECT TRUE INTO confirmar;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VerificarHorario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `VerificarHorario`(in Entrada time, in Salida time, in dia int, out confirmacion boolean)
BEGIN
	DECLARE hora INT;
	IF dia=0 then
		SELECT COUNT(*) INTO hora FROM horario WHERE LEntrada between Entrada and Salida LIMIT 1;
	ELSEIF dia=1 then
		SELECT COUNT(*) INTO hora FROM horario WHERE MEntrada between Entrada and Salida LIMIT 1;
	ELSEIF dia=2 then
		SELECT COUNT(*) INTO hora FROM horario WHERE MiEntrada between Entrada and Salida LIMIT 1;
	ELSEIF dia=3 then
		SELECT COUNT(*) INTO hora FROM horario WHERE JEntrada between Entrada and Salida LIMIT 1;
	ELSEIF dia=4 then
		SELECT COUNT(*) INTO hora FROM horario WHERE VEntrada between Entrada and Salida LIMIT 1;
	ELSE
		SET hora=(SELECT 0);
	END IF;
	IF hora > 0 then
		SET confirmacion=FALSE;
	else
		SET confirmacion=TRUE;
	END IF;
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

-- Dump completed on 2014-05-10 16:49:08
