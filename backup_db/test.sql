-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: chocoarte
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(50) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Bombones'),(2,'Cajitas'),(3,'Figuras en Azucar'),(4,'Paletitas'),(5,'Flores'),(6,'Huevos'),(7,'Mensajes'),(8,'Ositos');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_compras`
--

DROP TABLE IF EXISTS `historial_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_compras` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_producto` int NOT NULL,
  `fecha_compra` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_compra`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `historial_compras_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `historial_compras_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_compras`
--

LOCK TABLES `historial_compras` WRITE;
/*!40000 ALTER TABLE `historial_compras` DISABLE KEYS */;
INSERT INTO `historial_compras` VALUES (1,1,1,'2024-06-30 16:43:23'),(2,1,2,'2024-06-30 16:43:23'),(3,2,5,'2024-06-30 16:43:23'),(4,3,10,'2024-06-30 16:43:23');
/*!40000 ALTER TABLE `historial_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `id_categoria` int NOT NULL,
  `id_stock` int NOT NULL,
  `producto` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `tiempo_de_subida` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_producto`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_stock` (`id_stock`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`id_stock`) REFERENCES `stock` (`id_stock`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,1,1,'Bombones',1100.00,'2024-06-30 16:43:23'),(2,1,1,'Bombones redondos',1200.00,'2024-06-30 16:43:23'),(3,1,1,'Bombones redondos 2',1300.00,'2024-06-30 16:43:23'),(4,1,1,'Bombones redondos 3',1400.00,'2024-06-30 16:43:23'),(5,1,1,'Bombones redondos 4',1500.00,'2024-06-30 16:43:23'),(6,2,2,'Cajitas animales',1000.00,'2024-06-30 16:43:23'),(7,2,2,'Cajitas among us',1000.00,'2024-06-30 16:43:23'),(8,2,2,'Cajitas ropas',1000.00,'2024-06-30 16:43:23'),(9,2,2,'Cajitas minions',1000.00,'2024-06-30 16:43:23'),(10,2,2,'Cajitas robots',1000.00,'2024-06-30 16:43:23'),(11,3,3,'Flores',1000.00,'2024-06-30 16:43:23'),(12,3,3,'Patitos',1000.00,'2024-06-30 16:43:23'),(13,3,3,'conejitos cara',1000.00,'2024-06-30 16:43:23'),(14,3,3,'Conejitos',1000.00,'2024-06-30 16:43:23'),(15,3,3,'Ositos',1000.00,'2024-06-30 16:43:23'),(16,4,4,'paleta conejo',1000.00,'2024-06-30 16:43:23'),(17,4,4,'paleta conejo grande',1000.00,'2024-06-30 16:43:23'),(18,4,4,'paleta unicornio',1000.00,'2024-06-30 16:43:23'),(19,4,4,'paletitas Among Us',1000.00,'2024-06-30 16:43:23'),(20,4,4,'paletitas Among Us y robot',1000.00,'2024-06-30 16:43:23'),(21,5,5,'flores triples',1000.00,'2024-06-30 16:43:23'),(22,5,5,'Flor simple',1000.00,'2024-06-30 16:43:23'),(23,5,5,'Rosas',1000.00,'2024-06-30 16:43:23'),(24,6,6,'Huevo decorado',1000.00,'2024-06-30 16:43:23'),(25,6,6,'Huevo corazon',1000.00,'2024-06-30 16:43:23'),(26,6,6,'Huevo colores',1000.00,'2024-06-30 16:43:23'),(27,6,6,'Huevo grande',1000.00,'2024-06-30 16:43:23'),(28,6,6,'Huevos Dinos',1000.00,'2024-06-30 16:43:23'),(29,7,7,'Feliz dia Mamá',1000.00,'2024-06-30 16:43:23'),(30,7,7,'Feliz dia Mamá 2',1000.00,'2024-06-30 16:43:23'),(31,7,7,'Feliz dia Mamá 3',1000.00,'2024-06-30 16:43:23'),(32,7,7,'Feliz dia Mamá cajita',1000.00,'2024-06-30 16:43:23'),(33,7,7,'Feliz dia Mamá 4',1000.00,'2024-06-30 16:43:23'),(34,8,8,'ositos cajitas triple',1000.00,'2024-06-30 16:43:23'),(35,8,8,'Ositos con bombones',1000.00,'2024-06-30 16:43:23'),(36,8,8,'Ositos',1000.00,'2024-06-30 16:43:23');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id_stock` int NOT NULL AUTO_INCREMENT,
  `stock` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_stock`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Juan','Pérez','juan@hotmail.com','password123'),(2,'María','García','maria@hotmail.com','password456'),(3,'Carlos','Martínez','carlos@hotmail.com','password789'),(26,'Fernando','Daniel','fernando@hotmail.com','scrypt:32768:8:1$59JyAToo0LF00sOy$aa4143ad8a460cae842be30051336421efa8896c7dfff158a42a59cbe784e9beb95663cccc817da4f379652e5a197d9d5ffe1cb9f2ea1753d3ac8a7e7b39c20c');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-01 11:37:54
