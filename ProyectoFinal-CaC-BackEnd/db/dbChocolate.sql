-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: chocolates
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

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
-- Table structure for table `imagenes`
--

DROP TABLE IF EXISTS `imagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagenes` (
  `idImagenes` int(11) NOT NULL AUTO_INCREMENT,
  `imagenes` longblob NOT NULL,
  `idProducto` int(11) NOT NULL,
  PRIMARY KEY (`idImagenes`),
  KEY `fk_idProducto` (`idProducto`),
  CONSTRAINT `fk_idProducto` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenes`
--

LOCK TABLES `imagenes` WRITE;
/*!40000 ALTER TABLE `imagenes` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presentaciones`
--

DROP TABLE IF EXISTS `presentaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presentaciones` (
  `idpresentacion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  `precio` decimal(6,2) DEFAULT 0.00,
  `idProducto` int(11) NOT NULL,
  PRIMARY KEY (`idpresentacion`),
  KEY `idproducto_idx` (`idProducto`),
  CONSTRAINT `idproducto` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presentaciones`
--

LOCK TABLES `presentaciones` WRITE;
/*!40000 ALTER TABLE `presentaciones` DISABLE KEYS */;
INSERT INTO `presentaciones` VALUES (1,'Bombones redondos',1100.00,1),(2,'Bombones redondos 2',1200.00,1),(3,'Bombones redondos 3',1300.00,1),(4,'Bombones redondos 4',1400.00,1),(5,'Bombones redondos 5',1500.00,1),(6,'Cajitas animales',1000.00,2),(7,'Cajitas among us',1000.00,2),(8,'Cajitas ropas',1000.00,2),(9,'Cajitas minions',1000.00,2),(10,'Cajitas robots',1000.00,2),(11,'Flores ',1000.00,3),(12,'Patitos',1000.00,3),(13,'Conejitos cara',1000.00,3),(14,'Conejitos',1000.00,3),(15,'Ositos',1000.00,3),(16,'Flores triples',1000.00,4),(17,'Flores simples',1000.00,4),(18,'Rosas',1000.00,4),(19,'Huevo decorado',1000.00,5),(20,'Huevo corazon',1000.00,5),(21,'Huevo colores',1000.00,5),(22,'Huevo grande',1000.00,5),(23,'Huevos dinos',1000.00,5),(24,'Feliz dia Mamá',1000.00,6),(25,'Feliz dia Mamá 2',1000.00,6),(26,'Feliz dia Mamá 3',1000.00,6),(27,'Feliz dia Mamá 3',1000.00,6),(28,'Feliz dia Mamá Cajita',1000.00,6),(29,'Feliz dia Mamá 4',1000.00,6),(30,'Ositos cajitas triple',1000.00,7),(31,'Ositos con bombones',1000.00,7),(32,'Ositos',1000.00,7),(33,'Paleta conejo',1000.00,8),(34,'Paleta conejo grande',1000.00,8),(35,'Paleta unicornio',1000.00,8),(36,'Paletitas Among Us',1000.00,8),(37,'Paletitas among Us y robots',1000.00,8);
/*!40000 ALTER TABLE `presentaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Bombones'),(2,'Cajitas'),(3,'Figuras en azucar'),(4,'Figuras en chocolate'),(5,'Flores'),(6,'Huevos'),(7,'Mensajes'),(8,'Ositos'),(9,'Paletitas');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-30 18:30:02
ALTER TABLE `chocolates`.`imagenes` 
CHANGE COLUMN `idImagenes` `idImagen` INT(11) NOT NULL ,
CHANGE COLUMN `imagenes` `imagen` LONGBLOB NOT NULL ;
