-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: tienda_master
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.37-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Pantalones');
INSERT INTO `categorias` VALUES (2,'Vestidos');
INSERT INTO `categorias` VALUES (3,'Blusas');
INSERT INTO `categorias` VALUES (4,'Chaquetas');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineas_pedidos`
--

DROP TABLE IF EXISTS `lineas_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lineas_pedidos` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(255) NOT NULL,
  `producto_id` int(255) NOT NULL,
  `unidades` int(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_linea_pedido` (`pedido_id`),
  KEY `fk_linea_producto` (`producto_id`),
  CONSTRAINT `fk_linea_pedido` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  CONSTRAINT `fk_linea_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineas_pedidos`
--

LOCK TABLES `lineas_pedidos` WRITE;
/*!40000 ALTER TABLE `lineas_pedidos` DISABLE KEYS */;
INSERT INTO `lineas_pedidos` VALUES (1,1,3,1);
INSERT INTO `lineas_pedidos` VALUES (2,1,5,1);
INSERT INTO `lineas_pedidos` VALUES (3,1,7,1);
INSERT INTO `lineas_pedidos` VALUES (4,1,12,1);
INSERT INTO `lineas_pedidos` VALUES (5,2,6,1);
INSERT INTO `lineas_pedidos` VALUES (6,2,10,1);
INSERT INTO `lineas_pedidos` VALUES (7,2,2,1);
/*!40000 ALTER TABLE `lineas_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(255) NOT NULL,
  `region` varchar(100) NOT NULL,
  `comuna` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `coste` float(200,2) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pedido_usuario` (`usuario_id`),
  CONSTRAINT `fk_pedido_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,2,'s','s','s',147950.00,'confirm','2024-04-07','12:30:04');
INSERT INTO `pedidos` VALUES (2,3,'Santiago','santiago','casa',81950.00,'confirm','2024-04-07','20:59:40');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(255) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `precio` int(11) NOT NULL,
  `stock` int(255) NOT NULL,
  `oferta` varchar(2) DEFAULT NULL,
  `fecha` date NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_producto_categoria` (`categoria_id`),
  CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,4,'Continental','Usa esta casaca trucker con algún peto o polera blanca para lograr un look relajado. Descubre toda nuestra colección de petos y poleras de mujer.',32000,5,'A','2024-10-10','chaqueta1.png');
INSERT INTO `productos` VALUES (2,4,'Continental','Usa esta casaca trucker con algún peto o polera blanca para lograr un look relajado. Descubre toda nuestra colección de petos y poleras de mujer.',35000,8,'A','2024-10-10','chaqueta2.png');
INSERT INTO `productos` VALUES (3,4,'Continental','Usa esta casaca trucker con algún peto o polera blanca para lograr un look relajado. Descubre toda nuestra colección de petos y poleras de mujer.',41000,10,'A','2024-10-10','chaqueta3.png');
INSERT INTO `productos` VALUES (4,3,'Continental','Usa esta casaca trucker con algún peto o polera blanca para lograr un look relajado. Descubre toda nuestra colección de petos y poleras de mujer.',25000,10,'A','2024-10-10','blusa3.png');
INSERT INTO `productos` VALUES (5,3,'Continental','Usa esta casaca trucker con algún peto o polera blanca para lograr un look relajado. Descubre toda nuestra colección de petos y poleras de mujer.',22000,10,'A','2024-10-10','blusa2.png');
INSERT INTO `productos` VALUES (6,3,'Continental','Usa esta casaca trucker con algún peto o polera blanca para lograr un look relajado. Descubre toda nuestra colección de petos y poleras de mujer.',18000,10,'A','2024-10-10','blusa1.png');
INSERT INTO `productos` VALUES (7,2,'Continental','Usa esta casaca trucker con algún peto o polera blanca para lograr un look relajado. Descubre toda nuestra colección de petos y poleras de mujer.',45000,3,'A','2024-10-10','vestido1.png');
INSERT INTO `productos` VALUES (8,2,'Continental','Usa esta casaca trucker con algún peto o polera blanca para lograr un look relajado. Descubre toda nuestra colección de petos y poleras de mujer.',42500,8,'A','2024-10-10','vestido3.png');
INSERT INTO `productos` VALUES (9,2,'Continental','Usa esta casaca trucker con algún peto o polera blanca para lograr un look relajado. Descubre toda nuestra colección de petos y poleras de mujer.',35990,5,'A','2024-10-10','vestido2.png');
INSERT INTO `productos` VALUES (10,1,'Continental','Usa esta casaca trucker con algún peto o polera blanca para lograr un look relajado. Descubre toda nuestra colección de petos y poleras de mujer.',28950,5,'A','2024-10-10','pantalon1.png');
INSERT INTO `productos` VALUES (11,1,'Continental','Usa esta casaca trucker con algún peto o polera blanca para lograr un look relajado. Descubre toda nuestra colección de petos y poleras de mujer.',33650,5,'A','2024-10-10','pantalon2.png');
INSERT INTO `productos` VALUES (12,1,'Continental','Usa esta casaca trucker con algún peto o polera blanca para lograr un look relajado. Descubre toda nuestra colección de petos y poleras de mujer.',39950,5,'A','2024-10-10','pantalon3.png');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(20) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Admin','Admin','admin@admin.com','contraseÃ±a','admin',NULL);
INSERT INTO `usuarios` VALUES (2,'barbara','galvez','barbara@gmail.com','$2y$04$TWkSdh8pXqyc.xbVhF3S1uWSebFCf0Ze0Bi4/ktnpQivMaEHg/5VO','user',NULL);
INSERT INTO `usuarios` VALUES (3,'michelle','jara','jaja@jara.cl','$2y$04$Py4gNVV/zLSOCk8MS/jt6Ovr5tAAM1MONg4g6xoHtsX4OxSHBxSdy','user',NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'tienda_master'
--

--
-- Dumping routines for database 'tienda_master'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-15 20:01:15
