CREATE DATABASE  IF NOT EXISTS `schedulebd` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `schedulebd`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: schedulebd
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `load_unload_operations`
--

DROP TABLE IF EXISTS `load_unload_operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `load_unload_operations` (
  `id` int NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `load_unload_operations`
--

LOCK TABLES `load_unload_operations` WRITE;
/*!40000 ALTER TABLE `load_unload_operations` DISABLE KEYS */;
INSERT INTO `load_unload_operations` VALUES (1,'2025-11-01 08:30:00'),(2,'2025-11-02 09:00:00'),(3,'2025-11-03 10:15:00'),(4,'2025-11-04 07:50:00'),(5,'2025-11-05 13:20:00');
/*!40000 ALTER TABLE `load_unload_operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `load_time` time NOT NULL,
  `unload_time` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'Заказ 1','10:00:00','11:00:00'),(2,'Заказ 2','12:30:00','13:30:00'),(3,'Заказ 3','14:00:00','15:00:00'),(4,'Заказ 4','09:45:00','10:45:00'),(5,'Заказ 5','11:15:00','12:15:00');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_has_load_unload_opertations`
--

DROP TABLE IF EXISTS `orders_has_load_unload_opertations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_has_load_unload_opertations` (
  `Orders_id` int NOT NULL,
  `load_unload_opertations_id` int NOT NULL,
  PRIMARY KEY (`Orders_id`,`load_unload_opertations_id`),
  KEY `fk_Orders_has_load_unload_opertations_load_unload_opertatio_idx` (`load_unload_opertations_id`),
  KEY `fk_Orders_has_load_unload_opertations_Orders1_idx` (`Orders_id`),
  CONSTRAINT `fk_Orders_has_load_unload_opertations_load_unload_opertations1` FOREIGN KEY (`load_unload_opertations_id`) REFERENCES `load_unload_operations` (`id`),
  CONSTRAINT `fk_Orders_has_load_unload_opertations_Orders1` FOREIGN KEY (`Orders_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_has_load_unload_opertations`
--

LOCK TABLES `orders_has_load_unload_opertations` WRITE;
/*!40000 ALTER TABLE `orders_has_load_unload_opertations` DISABLE KEYS */;
INSERT INTO `orders_has_load_unload_opertations` VALUES (1,1),(2,1),(3,1);
/*!40000 ALTER TABLE `orders_has_load_unload_opertations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `kind` enum('Термоупаковка','Ящик тетра-крейт','Село Устьяны','Радостино') NOT NULL,
  `pieces_per_box` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Товар 1','Термоупаковка',10),(2,'Товар 2','Ящик тетра-крейт',5),(3,'Товар 3','Село Устьяны',12),(4,'Товар 4','Радостино',8),(5,'Товар 5','Термоупаковка',15);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_has_orders`
--

DROP TABLE IF EXISTS `products_has_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_has_orders` (
  `Products_id` int NOT NULL,
  `Orders_id` int NOT NULL,
  `amount` smallint NOT NULL,
  PRIMARY KEY (`Products_id`,`Orders_id`),
  KEY `fk_Products_has_Orders_Orders1_idx` (`Orders_id`),
  KEY `fk_Products_has_Orders_Products1_idx` (`Products_id`),
  CONSTRAINT `fk_Products_has_Orders_Orders1` FOREIGN KEY (`Orders_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_Products_has_Orders_Products1` FOREIGN KEY (`Products_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_has_orders`
--

LOCK TABLES `products_has_orders` WRITE;
/*!40000 ALTER TABLE `products_has_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_has_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Работник'),(2,'Менеджер'),(3,'Администратор');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workers`
--

DROP TABLE IF EXISTS `workers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `surname` varchar(60) NOT NULL,
  `first_name` varchar(60) NOT NULL,
  `patronymic` varchar(60) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `role_id` int NOT NULL,
  `password` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Workers_Roles_idx` (`role_id`),
  CONSTRAINT `fk_Workers_Roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workers`
--

LOCK TABLES `workers` WRITE;
/*!40000 ALTER TABLE `workers` DISABLE KEYS */;
INSERT INTO `workers` VALUES (1,'Артём','Артёмов','Артёмовоч','12345',3,'12345'),(2,'Tomas','Anderson','Vadimovich','54321',2,'54321');
/*!40000 ALTER TABLE `workers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-21  8:48:43
