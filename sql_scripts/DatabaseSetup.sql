CREATE DATABASE  IF NOT EXISTS `carBuilder` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `carBuilder`;
-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: carBuilder
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customers` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(40) NOT NULL,
  `c_phone` varchar(15) NOT NULL,
  `c_email` varchar(150) NOT NULL,
  `c_number` int(3) NOT NULL,
  `c_floor` int(3) DEFAULT NULL,
  `c_street` varchar(100) NOT NULL,
  `c_city` varchar(50) NOT NULL,
  `c_country` varchar(50) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'John Doe','0045 239482712','john@email.com',23,3,'Strandvejen','2309','København','Denmark'),(2,'Lotte hansen','0045 993237482','lotte@hotmail.com',10,NULL,'valbylanggade','3302','København','Denmark'),(3,'Hanne hansen','0045 82736438','ha@hansen.com',1,19,'frederkisborgs vej','2200','København','Denmark');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `manufacturers` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(50) DEFAULT NULL,
  `m_country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturers`
--

LOCK TABLES `manufacturers` WRITE;
/*!40000 ALTER TABLE `manufacturers` DISABLE KEYS */;
INSERT INTO `manufacturers` VALUES (1,'Yamaha','Japan'),(2,'Universal','UK'),(3,'Nissan','Japan'),(4,'Goodyear','Us'),(5,'BBS','Us'),(6,'Michelin','France'),(7,'Volkswagen','Germany');
/*!40000 ALTER TABLE `manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderItems`
--

DROP TABLE IF EXISTS `orderItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orderItems` (
  `oi_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_fk` int(11) DEFAULT NULL,
  `product_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`oi_id`),
  KEY `order_fk` (`order_fk`),
  KEY `product_fk` (`product_fk`),
  CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`order_fk`) REFERENCES `orders` (`o_id`),
  CONSTRAINT `orderitems_ibfk_2` FOREIGN KEY (`product_fk`) REFERENCES `products` (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderItems`
--

LOCK TABLES `orderItems` WRITE;
/*!40000 ALTER TABLE `orderItems` DISABLE KEYS */;
INSERT INTO `orderItems` VALUES (1,1,1),(2,1,4),(3,1,8);
/*!40000 ALTER TABLE `orderItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `o_tracking_number` varchar(250) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `customer_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`o_id`),
  KEY `customer_fk` (`customer_fk`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_fk`) REFERENCES `customers` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'284nxcnd3iw','2020-11-18 12:06:22',1),(2,'84958ncHmMH034','2020-11-18 13:07:30',1),(3,'b39b8bb7-42c4-4b23-bd12-47824bd6eb1a','2020-11-18 13:14:25',1),(4,'4a4c786a-fa46-4c8f-a6a0-6ab7ccbc5a1a','2020-11-18 13:15:17',2);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_model_name` varchar(30) NOT NULL,
  `p_price` double NOT NULL,
  `p_description` text NOT NULL,
  `product_type_fk` int(11) DEFAULT NULL,
  `manufacturer_fk` int(11) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`p_id`),
  KEY `product_type_fk` (`product_type_fk`),
  KEY `manufacturer_fk` (`manufacturer_fk`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`product_type_fk`) REFERENCES `producttype` (`pt_id`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`manufacturer_fk`) REFERENCES `manufacturers` (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Rally',203.49,'bla',3,3,'rally.png'),(2,'All terrain',203.49,'bla',3,3,'allterrain.png'),(3,'Offroad',23.49,'bla',3,1,'offroad.png'),(4,'Sedan',23.49,'some description of this product',1,4,'sedan.png'),(5,'SUV',200.38,'suv description',1,3,'suv.png'),(6,'Performance',2032.28,'compact car',1,3,'performance.png'),(7,'Hatchback',19999,'wagon text',1,1,'hatchback.png'),(8,'Spoiler',3273.99,'brian type of equipment',4,2,'placeholder.png'),(9,'Vintage',123483,'creapy white van',1,5,'vintage.png'),(12,'V8',2000,'some engine',2,1,'gas.png'),(13,'Electric',1000,'some engine',2,6,'electric.png'),(14,'v6',1700,'yet another engine',2,1,'gas.png'),(15,'Clear',120,'Clear window',5,3,'placeholder.png'),(16,'Tinted',340,'Tinted brian windows',5,7,'placeholder.png');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productType`
--

DROP TABLE IF EXISTS `productType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `productType` (
  `pt_id` int(11) NOT NULL AUTO_INCREMENT,
  `pt_name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`pt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productType`
--

LOCK TABLES `productType` WRITE;
/*!40000 ALTER TABLE `productType` DISABLE KEYS */;
INSERT INTO `productType` VALUES (1,'Car body'),(2,'Engine'),(3,'Tires'),(4,'Spoiler'),(5,'Windows');
/*!40000 ALTER TABLE `productType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stock` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_size` varchar(20) DEFAULT NULL,
  `s_color_name` varchar(20) DEFAULT NULL,
  `s_color_hex` varchar(10) DEFAULT NULL,
  `product_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`s_id`),
  KEY `product_fk` (`product_fk`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`product_fk`) REFERENCES `products` (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,NULL,'Black','#000',1),(2,NULL,'White','#FFF',1),(3,NULL,'red','#F00',1),(4,NULL,'Black','#000',2),(5,NULL,'White','#FFF',2),(6,NULL,'red','#F00',2),(7,NULL,'Black','#000',3),(8,NULL,'White','#FFF',3),(9,NULL,'red','#F00',3),(10,NULL,'Black','#000',4),(11,NULL,'White','#FFF',4),(12,NULL,'red','#F00',4),(13,NULL,'Black','#000',6),(14,NULL,'White','#FFF',6),(15,NULL,'red','#F00',6),(16,NULL,'Black','#000',7),(17,NULL,'White','#FFF',7),(18,NULL,'red','#F00',7);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-19 11:23:43
