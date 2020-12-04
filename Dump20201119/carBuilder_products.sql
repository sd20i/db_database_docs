-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: carBuilder
-- ------------------------------------------------------
-- Server version	8.0.17
use CarBuilder;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-19 10:51:29
