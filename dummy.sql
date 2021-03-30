-- MySQL dump 10.13  Distrib 8.0.23, for osx10.16 (x86_64)
--
-- Host: localhost    Database: dummy
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `detailed_address` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `request` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `default` tinyint(1) NOT NULL,
  `zipcode` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_user_id_d930d1dc_fk_users_id` (`user_id`),
  CONSTRAINT `addresses_user_id_d930d1dc_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_product_id_02913eac_fk_products_id` (`product_id`),
  KEY `carts_user_id_3a9d1785_fk_users_id` (`user_id`),
  CONSTRAINT `carts_product_id_02913eac_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `carts_user_id_3a9d1785_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (3,'리빙'),(5,'문구'),(9,'생활테크'),(11,'식품'),(8,'여행/레져'),(6,'의류'),(4,'잡화'),(1,'테마 기획전'),(2,'토이'),(7,'파자마'),(10,'폰 액세서리');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (11,'고냥이'),(12,'꾀돌이'),(13,'단무지'),(14,'두부'),(1,'아몬드'),(2,'자이제'),(4,'죠르디'),(3,'준식'),(5,'칸'),(6,'타이거'),(7,'토끼'),(8,'팬다어덜트'),(9,'프라다'),(10,'피치피치');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters_products`
--

DROP TABLE IF EXISTS `characters_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characters_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `character_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `characters_products_character_id_7530d752_fk_characters_id` (`character_id`),
  KEY `characters_products_product_id_d1884643_fk_products_id` (`product_id`),
  CONSTRAINT `characters_products_character_id_7530d752_fk_characters_id` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`),
  CONSTRAINT `characters_products_product_id_d1884643_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters_products`
--

LOCK TABLES `characters_products` WRITE;
/*!40000 ALTER TABLE `characters_products` DISABLE KEYS */;
INSERT INTO `characters_products` VALUES (2,10,1),(3,4,2),(4,1,3),(5,1,4),(6,5,5),(7,7,6),(8,3,7),(9,9,8),(10,11,9),(11,14,10),(12,8,11),(13,12,12),(14,13,13),(15,2,14),(16,5,15),(17,7,16),(18,1,17),(19,4,18),(20,9,19),(21,7,20),(22,6,21),(23,11,22),(24,13,23),(25,14,24),(26,9,25),(27,3,26),(28,1,27),(29,5,28),(30,10,29),(31,4,30),(32,11,31),(33,12,32),(34,7,33),(35,1,34),(36,13,35),(37,9,36),(38,14,37),(39,2,38),(40,3,39),(41,6,40),(42,8,41),(43,14,42),(44,9,43),(45,6,44),(46,1,45),(47,2,46),(48,8,47),(49,11,48),(50,12,49),(51,6,50),(52,13,51),(53,14,52),(54,1,53),(55,2,54),(56,3,55),(57,4,56),(58,5,57),(59,6,58),(60,7,59),(61,4,60),(62,10,61),(63,12,62),(64,8,63);
/*!40000 ALTER TABLE `characters_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_cards`
--

DROP TABLE IF EXISTS `credit_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_cards` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `card_number` varchar(2000) COLLATE utf8mb4_general_ci NOT NULL,
  `expiration` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `default` tinyint(1) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `credit_cards_user_id_c0ec35c3_fk_users_id` (`user_id`),
  CONSTRAINT `credit_cards_user_id_c0ec35c3_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_cards`
--

LOCK TABLES `credit_cards` WRITE;
/*!40000 ALTER TABLE `credit_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (3,'account','user'),(1,'contenttypes','contenttype'),(4,'feed','feed'),(9,'feed','feedimage'),(8,'feed','feedlike'),(7,'feed','recommendedproduct'),(5,'feed','reply'),(6,'feed','replylike'),(10,'product','category'),(11,'product','character'),(17,'product','characterproduct'),(12,'product','product'),(16,'product','productimage'),(13,'product','review'),(15,'product','reviewlike'),(14,'product','subcategory'),(18,'purchase','address'),(22,'purchase','cart'),(19,'purchase','creditcard'),(21,'purchase','purchasedproduct'),(23,'purchase','status'),(20,'purchase','transaction'),(2,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'account','0001_initial','2021-03-25 15:08:32.776860'),(2,'product','0001_initial','2021-03-25 15:08:32.964846'),(3,'purchase','0001_initial','2021-03-25 15:08:33.339553'),(4,'product','0002_character_product','2021-03-25 15:08:33.610236'),(5,'purchase','0002_transaction_product','2021-03-25 15:08:33.626191'),(6,'purchase','0003_auto_20210318_0547','2021-03-25 15:08:33.738618'),(7,'product','0003_product_updated_at','2021-03-25 15:08:33.788123'),(8,'product','0004_auto_20210318_0729','2021-03-25 15:08:33.811798'),(9,'purchase','0004_auto_20210318_0729','2021-03-25 15:08:33.945081'),(10,'feed','0001_initial','2021-03-25 15:08:34.123002'),(11,'feed','0002_feed_product','2021-03-25 15:08:34.445839'),(12,'feed','0003_auto_20210318_0729','2021-03-25 15:08:34.463869'),(13,'account','0002_auto_20210318_0530','2021-03-25 15:08:34.509770'),(14,'account','0003_user_liked_feed','2021-03-25 15:08:34.528305'),(15,'account','0004_auto_20210318_0729','2021-03-25 15:08:34.577303'),(16,'contenttypes','0001_initial','2021-03-25 15:08:34.609482'),(17,'contenttypes','0002_remove_content_type_name','2021-03-25 15:08:34.673397'),(18,'feed','0004_auto_20210321_0857','2021-03-25 15:08:34.711269'),(19,'feed','0004_auto_20210319_0058','2021-03-25 15:08:34.731133'),(20,'feed','0005_merge_20210325_1508','2021-03-25 15:08:34.734908'),(21,'product','0005_auto_20210324_1158','2021-03-25 15:08:34.866298'),(22,'purchase','0005_auto_20210318_0731','2021-03-25 15:08:34.873573'),(23,'sessions','0001_initial','2021-03-25 15:08:34.891952');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed_images`
--

DROP TABLE IF EXISTS `feed_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feed_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_url` varchar(2000) COLLATE utf8mb4_general_ci NOT NULL,
  `feed_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feed_images_feed_id_0a8dcad9_fk_feeds_id` (`feed_id`),
  CONSTRAINT `feed_images_feed_id_0a8dcad9_fk_feeds_id` FOREIGN KEY (`feed_id`) REFERENCES `feeds` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=306 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed_images`
--

LOCK TABLES `feed_images` WRITE;
/*!40000 ALTER TABLE `feed_images` DISABLE KEYS */;
INSERT INTO `feed_images` VALUES (1,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201231213914.jpg',1),(2,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20201231213914.jpg',1),(3,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20201231213915.jpg',1),(4,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20201231213915.jpg',1),(5,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_0_20210311111702.jpg',2),(6,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210315113851.jpg',2),(7,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210315113851.jpg',2),(8,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210315113851.jpg',2),(9,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210315113851.jpg',2),(10,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210315113851.jpg',2),(11,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20210315113851.jpg',2),(12,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_6_20210315113851.jpg',2),(13,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210308175813.jpg',3),(14,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210308175948.jpg',3),(15,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210308175948.jpg',3),(16,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210308175948.jpg',3),(17,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210308175948.jpg',3),(18,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210308175948.jpg',3),(19,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20210308175949.jpg',3),(20,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_6_20210308175949.jpg',3),(21,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_7_20210308175949.jpg',3),(22,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210308152636.jpg',4),(23,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210308152636.jpg',4),(24,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210308152636.jpg',4),(25,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210218165255.jpg',5),(26,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210218165301.jpg',5),(27,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210218165301.jpg',5),(28,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210218165301.jpg',5),(29,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210218165301.jpg',5),(30,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210218165301.jpg',5),(31,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20210218165302.jpg',5),(32,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_6_20210218165302.jpg',5),(33,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_7_20210218165302.jpg',5),(34,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210315175259.jpg',6),(35,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210315175259.jpg',6),(36,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210315175259.jpg',6),(37,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210315175259.jpg',6),(38,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210315175259.jpg',6),(39,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20210315175300.jpg',6),(40,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_6_20210315175300.jpg',6),(41,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_7_20210315175300.jpg',6),(42,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210308185146.jpg',7),(43,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210308185146.jpg',7),(44,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210308185146.jpg',7),(45,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210308185146.jpg',7),(46,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210308185146.jpg',7),(47,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20210308185147.jpg',7),(48,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_6_20210308185147.jpg',7),(49,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_7_20210308185147.jpg',7),(50,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210308152918.jpg',8),(51,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210308152919.jpg',8),(52,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210308152919.jpg',8),(53,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210308152919.jpg',8),(54,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210308152919.jpg',8),(55,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20210308152919.jpg',8),(56,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_6_20210308152919.jpg',8),(57,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_7_20210308152919.jpg',8),(58,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210315175537.jpg',9),(59,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210315175537.jpg',9),(60,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210315175537.jpg',9),(61,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210315175537.jpg',9),(62,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210315175537.jpg',9),(63,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20210315175537.jpg',9),(64,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210209144126.jpg',10),(65,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210209144126.jpg',10),(66,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210209144126.jpg',10),(67,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210209144126.jpg',10),(68,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210209144126.jpg',10),(69,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20210209144126.jpg',10),(70,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210304094857.jpg',11),(71,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210304095039.jpg',11),(72,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210304095039.jpg',11),(73,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210304095039.jpg',11),(74,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210304095039.jpg',11),(75,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210304095039.jpg',11),(76,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210304095047.jpg',11),(77,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210304095047.jpg',11),(78,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210304095048.jpg',11),(79,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210304095048.jpg',11),(80,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210312132115.jpg',12),(81,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210312132115.jpg',12),(82,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210312132115.jpg',12),(83,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210312132115.jpg',12),(84,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210223095852.jpg',13),(85,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210223095915.jpg',13),(86,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210223095918.jpg',13),(87,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210223095920.jpg',13),(88,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210223095923.jpg',13),(89,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210205144838.jpg',14),(90,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210205144842.jpg',14),(91,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210205144842.jpg',14),(92,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210205144842.jpg',14),(93,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210205144842.jpg',14),(94,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210205144842.jpg',14),(95,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20210205144842.jpg',14),(96,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210310192444.jpg',15),(97,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210310192444.jpg',15),(98,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210310192444.jpg',15),(99,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210310192444.jpg',15),(100,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210310192444.jpg',15),(101,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20210310192444.jpg',15),(102,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_6_20210310192444.jpg',15),(103,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_7_20210310192444.jpg',15),(104,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_8_20210310192444.jpg',15),(105,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_9_20210310192445.jpg',15),(106,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210310143228.jpg',16),(107,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210310143231.jpg',16),(108,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210310143232.jpg',16),(109,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201210105805.jpg',17),(110,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201210105825.jpg',17),(111,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20201210105825.jpg',17),(112,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20201210105825.jpg',17),(113,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20201210105826.jpg',17),(114,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20201210105826.jpg',17),(115,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201217095707.jpg',18),(116,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20201217095707.jpg',18),(117,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20201217095707.jpg',18),(118,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20201217095707.jpg',18),(119,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201217095710.jpg',18),(120,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210129160044.jpg',19),(121,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_0_20210209083419.jpg',19),(122,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_1_20210209083419.jpg',19),(123,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_2_20210209083419.jpg',19),(124,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_3_20210209083420.jpg',19),(125,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_5_20210209083420.jpg',19),(126,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_6_20210209083420.jpg',19),(127,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_7_20210209083420.jpg',19),(128,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201229133336.jpg',20),(129,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20201229133353.jpg',20),(130,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20201229133353.jpg',20),(131,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20201229133353.jpg',20),(132,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20201229133353.jpg',20),(133,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210302145914.jpg',21),(134,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_0_20201123185847.jpg',22),(135,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210201102239.jpg',23),(136,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210223151142.jpg',24),(137,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210223151242.jpg',24),(138,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210223151242.jpg',24),(139,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210223151242.jpg',24),(140,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210223151242.jpg',24),(141,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210223151243.jpg',24),(142,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20210223151243.jpg',24),(143,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_6_20210223151243.jpg',24),(144,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_7_20210223151243.jpg',24),(145,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201214144245.jpg',25),(146,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20201214144246.jpg',25),(147,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201214145836.jpg',25),(148,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201214145839.jpg',25),(149,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201214145842.jpg',25),(150,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201214145845.jpg',25),(151,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201214145855.jpg',25),(152,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201130082416.jpg',26),(153,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20201130082416.jpg',26),(154,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20201130082416.jpg',26),(155,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20201130082416.jpg',26),(156,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20201130082416.jpg',26),(157,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210310182049.jpg',27),(158,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210226152322.jpg',28),(159,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210226152335.jpg',28),(160,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210226152335.jpg',28),(161,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210226152335.jpg',28),(162,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210226152335.jpg',28),(163,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210226152335.jpg',28),(164,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20210226152335.jpg',28),(165,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210119180310.jpg',29),(166,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210119180310.jpg',29),(167,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210119180310.jpg',29),(168,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210119180310.jpg',29),(169,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210119180310.jpg',29),(170,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210204175203.jpg',30),(171,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210204175415.jpg',30),(172,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210204175415.jpg',30),(173,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210204175415.jpg',30),(174,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210204175416.jpg',30),(175,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210204175423.jpg',30),(176,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210204175423.jpg',30),(177,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210204175423.jpg',30),(178,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210204175423.jpg',30),(179,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210204175423.jpg',30),(180,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210302145222.jpg',31),(181,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210112123819.jpg',32),(182,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210112123819.jpg',32),(183,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210115101335.jpg',32),(184,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210115101339.jpg',32),(185,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201216142443.jpg',33),(186,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20201216142443.jpg',33),(187,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201216142548.jpg',33),(188,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20201216142548.jpg',33),(189,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20201216142549.jpg',33),(190,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201216142552.jpg',33),(191,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210303114652.jpg',34),(192,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210303114652.jpg',34),(193,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210303114652.jpg',34),(194,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210303114652.jpg',34),(195,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210303114652.jpg',34),(196,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210219170810.jpg',35),(197,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210219170810.jpg',35),(198,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210219170810.jpg',35),(199,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210219170811.jpg',35),(200,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210114163611.jpg',36),(201,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210114163625.jpg',36),(202,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210114163625.jpg',36),(203,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210114163625.jpg',36),(204,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210114163625.jpg',36),(205,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_1_20210114140115.jpg',37),(206,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_2_20210114140116.jpg',37),(207,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_3_20210114140116.jpg',37),(208,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210108112239.jpg',38),(209,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210104151954.jpg',39),(210,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210104152009.jpg',39),(211,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210104152009.jpg',39),(212,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210104152014.jpg',39),(213,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210104152014.jpg',39),(214,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210126174747.jpg',40),(215,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210219153319.jpg',41),(216,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210208174024.jpg',42),(217,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210208174042.jpg',42),(218,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210208174042.jpg',42),(219,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210208174043.jpg',42),(220,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210208174043.jpg',42),(221,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210208174043.jpg',42),(222,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201222121548.jpg',43),(223,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201222121554.jpg',43),(224,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20201222121554.jpg',43),(225,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20201222121554.jpg',43),(226,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20201222121554.jpg',43),(227,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_0_20201119152102.jpg',44),(228,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_0_20201119152105.jpg',44),(229,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_0_20201119152107.jpg',44),(230,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201229114254.jpg',45),(231,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20201229114254.jpg',45),(232,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20201229114254.jpg',45),(233,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20201229114254.jpg',45),(234,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20201229114254.jpg',45),(235,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20201229114255.jpg',45),(236,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_1_20201119145817.jpg',46),(237,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_2_20201119145817.jpg',46),(238,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_3_20201119145817.jpg',46),(239,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_4_20201119145818.jpg',46),(240,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_5_20201119145818.jpg',46),(241,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_6_20201119145818.jpg',46),(242,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_7_20201119145818.jpg',46),(243,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210209141439.jpg',47),(244,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210209141439.jpg',47),(245,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210209141439.jpg',47),(246,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210209141439.jpg',47),(247,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210209141439.jpg',47),(248,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210129141102.jpg',48),(249,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210129141115.jpg',48),(250,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210129141119.jpg',48),(251,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210129141119.jpg',48),(252,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210129141119.jpg',48),(253,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210129141122.jpg',48),(254,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210129141122.jpg',48),(255,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210129141122.jpg',48),(256,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210202160736.jpg',49),(257,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210202174630.jpg',49),(258,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210202174630.jpg',49),(259,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210202174630.jpg',49),(260,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20210202174630.jpg',49),(261,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20210202174630.jpg',49),(262,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20210125085532.jpg',50),(263,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20210125085532.jpg',50),(264,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20210125085532.jpg',50),(265,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201221091151.jpg',51),(266,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201223093210.jpg',52),(267,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20201223093210.jpg',52),(268,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20201223093210.jpg',52),(269,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20201223093210.jpg',52),(270,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20201223093211.jpg',52),(271,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20201223093211.jpg',52),(272,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201202162648.jpg',53),(273,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201202162704.jpg',53),(274,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20201202162704.jpg',53),(275,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20201202162704.jpg',53),(276,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20201202162705.jpg',53),(277,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_4_20201202162705.jpg',53),(278,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_5_20201202162705.jpg',53),(279,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_6_20201202162706.jpg',53),(280,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201214083214.jpg',54),(281,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20201214083214.jpg',54),(282,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_2_20201214083214.jpg',54),(283,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_3_20201214083215.jpg',54),(284,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201214083223.jpg',54),(285,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201214083233.jpg',54),(286,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20201214083233.jpg',54),(287,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201214083242.jpg',54),(288,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_1_20201214083242.jpg',54),(289,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_0_20201123185505.jpg',55),(290,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_0_20201123185521.jpg',55),(291,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_1_20201123185521.jpg',55),(292,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_2_20201123185521.jpg',55),(293,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_3_20201123185521.jpg',55),(294,'https://t1.kakaocdn.net/friends/new_store/prod/main_tab/feed/media/media_4_20201123185521.jpg',55),(295,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201224121615.jpg',56),(296,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_0_20201119151746.jpg',57),(297,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_0_20201119151748.jpg',57),(298,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_0_20201119151755.jpg',57),(299,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_0_20201119151758.jpg',57),(300,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_0_20201119151801.jpg',57),(301,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_0_20201119151804.jpg',57),(302,'https://t1.kakaocdn.net/friends/prod/main_tab/feed/media/media_0_20201202145154.jpg',58),(303,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_0_20201119152348.jpg',59),(304,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_1_20201119152348.jpg',59),(305,'http://t1.kakaocdn.net/friends/test/main_tab/feed/media/media_2_20201119152348.jpg',59);
/*!40000 ALTER TABLE `feed_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed_likes`
--

DROP TABLE IF EXISTS `feed_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feed_likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `feed_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feed_likes_feed_id_f8552b3e_fk_feeds_id` (`feed_id`),
  KEY `feed_likes_user_id_ae0bf962_fk_users_id` (`user_id`),
  CONSTRAINT `feed_likes_feed_id_f8552b3e_fk_feeds_id` FOREIGN KEY (`feed_id`) REFERENCES `feeds` (`id`),
  CONSTRAINT `feed_likes_user_id_ae0bf962_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed_likes`
--

LOCK TABLES `feed_likes` WRITE;
/*!40000 ALTER TABLE `feed_likes` DISABLE KEYS */;
INSERT INTO `feed_likes` VALUES (33,48,21),(34,51,21),(35,49,21),(36,50,21),(37,43,21),(38,42,21),(39,41,21),(40,40,21);
/*!40000 ALTER TABLE `feed_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feeds`
--

DROP TABLE IF EXISTS `feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feeds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `reply_count` int NOT NULL,
  `like_count` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feeds_user_id_7f2e31f5_fk_users_id` (`user_id`),
  CONSTRAINT `feeds_user_id_7f2e31f5_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feeds`
--

LOCK TABLES `feeds` WRITE;
/*!40000 ALTER TABLE `feeds` DISABLE KEYS */;
INSERT INTO `feeds` VALUES (1,'1. 샤워하고 거울 볼 때 \"오 나 쫌 갠찮은데?\"(👇이어서 달아 주기)',0,0,'2021-03-25 17:46:55.855845','크으 내가 생각해도 내가 쫌 멋있는 순간!',1),(2,'우리와 함께라면 집도 카페처럼 💝',0,0,'2021-03-25 17:46:55.866732','집이야? 브런치 카페야?',2),(3,'어피치의 이뻐지기 프로젝트 어피치 X 에스더버니.',0,0,'2021-03-25 17:46:55.869807','피치피치 어피치! 핑크빛 만남 💖',3),(4,'일회용 컵 사용은 줄이고우리와 함께 시작해볼래?',0,0,'2021-03-25 17:46:55.873339','지구를 사랑하는 마음을텀블러로 표현해봐',4),(5,'라이언과 프릳츠 한잔 어때요?',0,0,'2021-03-25 17:46:55.875489','커피 한 잔 할래요 ☕️',5),(6,'숨겨왔던 스카피의 비-밀은? 🔍',0,0,'2021-03-25 17:46:55.877996','스카피는 집토끼니🐰 산토끼니? 🐇',6),(7,'🗣(웅성웅성) 3월 19일 죠르디 사원증이 출시된다구!👥',0,0,'2021-03-25 17:46:55.880502','나만의 멋진 사원증언젠간 꼭 걸고 말거죨 💚',7),(8,'이번주엔 뭐해? 가벼운 차림으로 나가볼까?',0,0,'2021-03-25 17:46:55.882685','점점 설레는 봄에코백 매고 나들이 떠나볼까?',8),(9,'나의 첫 번째 비밀을 말해줄게 🤫',0,0,'2021-03-25 17:46:55.884541','반가워, 내 이름은 꿈돌이 ⭐️',9),(10,'꿈년배들의 새로운 꿈, 꿈돌이가 응원할게 ✨',0,0,'2021-03-25 17:46:55.886703','꿈돌이 IS BACK',10),(11,'프렌즈와 함께 업무 효율 뿜뿜 올려봐요 🆙',0,0,'2021-03-25 17:46:55.888581','프로 재택러가 되고 싶다면?',11),(12,'빠냐 & 죠르디 진지하게 고민중 🤔',0,0,'2021-03-25 17:46:55.890249','맛있고 귀여운 도시락은 없을까?',12),(13,'동글동글 말랑말랑 포옥 껴안아줘요.',0,0,'2021-03-25 17:46:55.891650','폭신폭신 구름같은 편안함 ☁️',13),(14,'우리와 함께라면 스르르 잠들거예요 🌝',0,0,'2021-03-25 17:46:55.893048','잠 못드는 밤은 안녕 💤',14),(15,'나한테 정말 왜이러냐구우우우 😡',0,0,'2021-03-25 17:46:55.894366','오늘은 운수가 좋더라니 🍦',1),(16,'세계최고 귀여운 빵을 만들어볼까?',0,0,'2021-03-25 17:46:55.895803','많이 기다렸지?노릇노릇 라이언표 샌드위치',2),(17,'죠르디가 소독해주께~요기 딱 올려두기만 해',0,0,'2021-03-25 17:46:55.896958','삶아 빨수 없는 내 소중템! 살균 소독 비법 알려준다',3),(18,'베오베&스테디 셀러 라이언 오토손세정기에 이어 이젠 어피치가 접수할게!',0,0,'2021-03-25 17:46:55.898141','손대면 토-옥하고떨어지는 거품 그대',4),(19,'새해 의욕 상승엔 책상 꾸미기가 최고죨 💚',0,0,'2021-03-25 17:46:55.899470','죠-하, 내 최애 데스크템 한번 볼래?',5),(20,'어디서든 귀엽게 끓여줄게',0,0,'2021-03-25 17:46:55.900590','보글보글따듯한 물이 필요하니?',6),(21,'하루종일 편안한 파자마는 어때?',0,0,'2021-03-25 17:46:55.901849','뒹굴뒹굴 집콕러 모여라',7),(22,'소중한 사이일수록 서로 챙겨주기!!',0,0,'2021-03-25 17:46:55.903080','어때요, 우리 제법 잘 어울리나요?',8),(23,'한 개를 알려줘도 열을 아는 나만의 홈 스마트 홈! 구경할래?',0,0,'2021-03-25 17:46:55.904278','똑똑- 누구세요?',9),(24,'라이언 시계는 훨씬 더 콩닥콩닥 ⏰',0,0,'2021-03-25 17:46:55.905436','친구를 만나는 시간은 언제나 설레여 💓',10),(25,'몇번째 표정이 제일 마음에 들어?😋',0,0,'2021-03-25 17:46:55.906646','리치 리치 아엠어 표정 리치',11),(26,'왕 큰 빅 자이언트 소파 필요한 집돌 피플 지금 당장 클릭!',0,0,'2021-03-25 17:46:55.907834','집순/집돌 특)이런 쇼파 다들 한번쯤 상상해봄😘',12),(27,'3월의 배경화면이 도착했어요 🎁',0,0,'2021-03-25 17:46:55.909011','📱어느새 폰에도 봄이왔어 🌱',13),(28,'호호 ~ 손목아 아프지마 보호 인형 필요한 사람?',0,0,'2021-03-25 17:46:55.910401','어피치를 꼭 끌어안을래 🍑',14),(29,'라이언이 따뜻한 불빛을 비출게☺️ 오늘 하루 고생했다고, 자기전 스스로에게 꼭 말해주기!',0,0,'2021-03-25 17:46:55.911719','차가운 형광등 불빛 대신',1),(30,'책상 위, 신년 맞이 신상템 입양할 때!💞',0,0,'2021-03-25 17:46:55.912891','음 때가 됐다! 엣헴😛',2),(31,'상큼한 아이들을 득템해야 할 때야 🛒',0,0,'2021-03-25 17:46:55.916853','봄오니까 설레여 🍋',3),(32,'초록이 돋는 봄을 기다려🌱',0,0,'2021-03-25 17:46:55.918709','챡챡챡🌿 정원사 죠르디는 가드닝 중',4),(33,'집사들아 나 많이 기다렸지?',0,0,'2021-03-25 17:46:55.920997','애용~ 내 이름은 춘식이🐈',5),(34,'새 학기엔 역시 신상 문구템이지!',0,0,'2021-03-25 17:46:55.923535','공부는 역시 장비빨이지 📚',6),(35,'춘하 😺 새학기는 나와 열공해 📝',0,0,'2021-03-25 17:46:55.925871','(축) 춘식이 문구템 등장 👏🏻',7),(36,'핸드폰 충전하면서 우리 기분도 충전중..😍',0,0,'2021-03-25 17:46:55.928160','우왕...이거 빛이나 헤헤',8),(37,'제일 맘에 드는걸로 우리 같이 골라 볼까-',0,0,'2021-03-25 17:46:55.930059','오늘 새로 장만한 내 책상 뉴비 아이템! 어때?',9),(38,'무지&콘 베스트셀러 모음👇',0,0,'2021-03-25 17:46:55.932096','무지무지 무지&콘을 좋아하는 프렌즈들 요기 있는고 다 알앙',10),(39,'워머, 이건 꼭 사야해🌝 라이언&춘식 캔들워머로 매일 저녁 셀프 힐링🐾',0,0,'2021-03-25 17:46:55.934253','애용~ 좋은 향기에 은은한 불빛 좋다냥💫',11),(40,'1일 1사과는 죠르디의 하루 루틴💕 다들 무슨 과일 제일 좋아해?',0,1,'2021-03-25 17:46:55.936255','한 입 가-득 사과 냠냠🍎',12),(41,'라이언의 꿈 🦁 을 담은 콜라보레이션 ✍🏻',0,1,'2021-03-25 17:46:55.938403','냥냥 라이언 갈기가 생겼다 🎉',13),(42,'귀염뽀쨕 차량용품 신상 나가신다 길을비켜라 🚖',0,1,'2021-03-25 17:46:55.940821','왕초보운전자 필수템 🚨',14),(43,'체온 재는 습관으로 서로의 일상 지켜주기!',0,1,'2021-03-25 17:46:55.942515','오늘의 체온은 몇 도!? 라이언이랑 점검하기👌',1),(44,'라이언 웹캠과 함께라면 원격강의도, 재택근무도 문제 없을 무!',0,0,'2021-03-25 17:46:55.943882','라 전무가 보고 있다 👀',2),(45,'LED 스탠드 + 무선충전 + 펜꽂이 되는  만능템 말이야 ✌️😆',0,0,'2021-03-25 17:46:55.945292','네 책상에 이런거 있어? 😮?',3),(46,'세상을 빛내는 내 후광⚡ 스치기만 해도 깨끗해진다구!',0,0,'2021-03-25 17:46:55.946505','받아라 세균, 깨끗민둥빔!',4),(47,'세젤귀 맥세이프 케이스가 여기있다구 📱',0,0,'2021-03-25 17:46:55.947770','애플 매니아는 주목 🍏',5),(48,'이름하여 꿀잠 메가 바디 필로우🤟 어디 한번 내가 누워 볼까아?',0,1,'2021-03-25 17:46:55.948907','불면증이 뭐죠? 먹는건가요?😜 꿀잠 소환 치트키의 귀환',6),(49,'멀리 갈 수 없는 요즘 😷 우리와 함께 전주 한옥 마을로 GO GO',0,1,'2021-03-25 17:46:55.950172','전주로 랜선 여행 떠나볼까?',7),(50,'죨디 new 버즈 라이브 케이스 압도적 미모에  반했습니다🤗',0,1,'2021-03-25 17:46:55.951286','버즈인들 대동단결 시키는😍',8),(51,'상하이 상하이 트위스틀🎵추면서🎵',0,1,'2021-03-25 17:46:55.952616','상하이에서만 만날 수 있던 타이거 에디션을 데려왔지',9),(52,'이번 달 제 책상 위 주인공으로 모셨습니다 💕',0,0,'2021-03-25 17:46:55.954066','탐나는 LED 허브 + 케이블 🤭',10),(53,'러블리 어피치는 언제나 정답입니다.',0,0,'2021-03-25 17:46:55.955291','삐-삑!🚨 오늘도 사랑스러움 한도 초과💕',11),(54,'한 쪽 눈 그렇게 감아버리면 설레서 어떡행',0,0,'2021-03-25 17:46:55.956622','(빰)완전체로 돌아왔다(빰) 윙크 날려~뽀짝함 날려 힛',12),(55,'세상은 넓고 이어폰 케이스는 많으니까  혹시 고민된다면, 우리와 함께',0,0,'2021-03-25 17:46:55.957806','무선 이어폰 쓰는 사람 손 🙋‍♀',13),(56,'이것도 이쁘고, 저것도 맘에 드는데 오또켕',0,0,'2021-03-25 17:46:55.959005','Q. 집콕하면서 늘어난 것은?',14),(57,'나의 픽은 러버덕과 노는 라이언 욕조가습기? @넌?',0,0,'2021-03-25 17:46:55.960174','요즘 피부 상한거 같아서ㅠㅠ 가습기 분양했어(헷)',1),(58,'누가 나 씻는거 싫어한다 그랬오. 누구야 나와봐바.',0,0,'2021-03-25 17:46:55.961288','욕실에 힐링템 구비 완료!🤟',2),(59,'이 시국에 버킹엄궁 다녀온 프렌즈 사연 쫑긋👂',0,0,'2021-03-25 17:46:55.962438','이렇게 된 이상 올해는 랜선 여행으로 간다!',3);
/*!40000 ALTER TABLE `feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_url` varchar(2000) COLLATE utf8mb4_general_ci NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_28ebf5f0_fk_products_id` (`product_id`),
  CONSTRAINT `product_images_product_id_28ebf5f0_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `average_rating` decimal(2,1) NOT NULL,
  `review_count` int NOT NULL,
  `discount_rate` decimal(3,1) NOT NULL,
  `description` longtext COLLATE utf8mb4_general_ci,
  `created_at` datetime(6) NOT NULL,
  `sub_category_id` int DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL,
  `category_id` int DEFAULT NULL,
  `sell_count` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_sub_category_id_f08b7711_fk_sub_categories_id` (`sub_category_id`),
  KEY `products_category_id_a7a3a156_fk_categories_id` (`category_id`),
  CONSTRAINT `products_category_id_a7a3a156_fk_categories_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `products_sub_category_id_f08b7711_fk_sub_categories_id` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'피치피치 텀블러',20000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.883945',14,'2021-03-25 18:09:34.883890',3,0),(2,'죠르디 큰컵',10000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.886358',14,'2021-03-25 18:09:34.886315',3,0),(3,'아몬드 작은컵',5000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.888350',14,'2021-03-25 18:09:34.888288',3,0),(4,'아몬드 뜨거운 텀블러',15000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.890293',14,'2021-03-25 18:09:34.890257',3,0),(5,'칸 차가운 텀블러',15000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.892451',14,'2021-03-25 18:09:34.892407',3,0),(6,'토끼 티셔츠',35000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.894129',31,'2021-03-25 18:09:34.894092',6,0),(7,'준식 바지',60000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.895514',32,'2021-03-25 18:09:34.895481',6,0),(8,'프라다 구두',150000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.896772',19,'2021-03-25 18:09:34.896742',4,0),(9,'고냥이 양말',3000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.898119',31,'2021-03-25 18:09:34.898088',6,0),(10,'두부 점퍼',150000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.899554',32,'2021-03-25 18:09:34.899522',6,0),(11,'팬다어덜트 충전기',48000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.900984',45,'2021-03-25 18:09:34.900953',10,0),(12,'꾀돌이 노트북',1250000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.902367',40,'2021-03-25 18:09:34.902337',9,0),(13,'단무지 모니터',350000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.903579',40,'2021-03-25 18:09:34.903548',9,0),(14,'자이제 자',10000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.904736',25,'2021-03-25 18:09:34.904707',5,0),(15,'칸 볼펜',18000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.905821',25,'2021-03-25 18:09:34.905792',5,0),(16,'토끼 샤프',1000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.906996',25,'2021-03-25 18:09:34.906967',5,0),(17,'아몬드 서랍',80000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.908173',29,'2021-03-25 18:09:34.908144',5,0),(18,'죠르디 책상',320000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.909311',29,'2021-03-25 18:09:34.909282',5,0),(19,'프라다 휴지통',3000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.910394',17,'2021-03-25 18:09:34.910366',3,0),(20,'토끼 큰인형',200000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.911526',10,'2021-03-25 18:09:34.911495',2,0),(21,'타이거 작은인형',60000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.912678',8,'2021-03-25 18:09:34.912647',2,0),(22,'고냥이 쿠션',45000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.913972',8,'2021-03-25 18:09:34.913943',2,0),(23,'단무지 열쇠고리',12000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.915127',11,'2021-03-25 18:09:34.915097',2,0),(24,'두부 열쇠고리',13000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.916214',11,'2021-03-25 18:09:34.916185',2,0),(25,'프라다 키체인',150000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.917308',11,'2021-03-25 18:09:34.917279',2,0),(26,'준식 피규어',450000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.918402',12,'2021-03-25 18:09:34.918373',2,0),(27,'아몬드 피규어',320000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.919499',12,'2021-03-25 18:09:34.919470',2,0),(28,'칸 브릭',620000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.920580',12,'2021-03-25 18:09:34.920550',2,0),(29,'피치피치 방석',7800.00,0.0,0,0.0,'html','2021-03-25 18:09:34.921670',13,'2021-03-25 18:09:34.921641',3,0),(30,'죠르디 쿠션',18000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.922795',13,'2021-03-25 18:09:34.922766',3,0),(31,'고냥이 걸레',3000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.924181',15,'2021-03-25 18:09:34.924149',3,0),(32,'꾀돌이 수세미',2500.00,0.0,0,0.0,'html','2021-03-25 18:09:34.925476',15,'2021-03-25 18:09:34.925443',3,0),(33,'토끼 세제',4500.00,0.0,0,0.0,'html','2021-03-25 18:09:34.926679',15,'2021-03-25 18:09:34.926648',3,0),(34,'아몬드 식기세척기',780000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.927789',15,'2021-03-25 18:09:34.927759',3,0),(35,'단무지 냉장고',1850000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.929120',15,'2021-03-25 18:09:34.929089',3,0),(36,'프라다 커피머신',12000000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.930329',15,'2021-03-25 18:09:34.930298',3,0),(37,'두부 정수기',800000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.931463',15,'2021-03-25 18:09:34.931431',3,0),(38,'자이제 가글',4000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.932575',16,'2021-03-25 18:09:34.932544',3,0),(39,'준식 비누',7000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.933713',16,'2021-03-25 18:09:34.933681',3,0),(40,'타이거 치약',3000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.934981',16,'2021-03-25 18:09:34.934950',3,0),(41,'팬다어덜트 치약',5000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.936183',16,'2021-03-25 18:09:34.936153',3,0),(42,'두부 지갑',80000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.937352',20,'2021-03-25 18:09:34.937322',4,0),(43,'프라다 가방',4500000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.938511',20,'2021-03-25 18:09:34.938480',4,0),(44,'타이거 사원증 케이스',7000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.939634',21,'2021-03-25 18:09:34.939604',4,0),(45,'아몬드 시계',450000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.940765',21,'2021-03-25 18:09:34.940734',4,0),(46,'자이제 마스크',2000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.941878',23,'2021-03-25 18:09:34.941847',4,0),(47,'팬다어덜트 미니선풍기',12000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.942999',23,'2021-03-25 18:09:34.942969',4,0),(48,'고냥이 장갑',200.00,0.0,0,0.0,'html','2021-03-25 18:09:34.944099',23,'2021-03-25 18:09:34.944069',4,0),(49,'꾀돌이 미니우산',4000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.945204',22,'2021-03-25 18:09:34.945175',4,0),(50,'타이거 필통',7000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.946432',24,'2021-03-25 18:09:34.946402',5,0),(51,'단무지 노트',3000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.947546',26,'2021-03-25 18:09:34.947515',5,0),(52,'두부 종이',30.00,0.0,0,0.0,'html','2021-03-25 18:09:34.948917',26,'2021-03-25 18:09:34.948884',5,0),(53,'아몬드 투명화일',50.00,0.0,0,0.0,'html','2021-03-25 18:09:34.950196',27,'2021-03-25 18:09:34.950163',5,0),(54,'자이제 스티커',1200.00,0.0,0,0.0,'html','2021-03-25 18:09:34.951343',28,'2021-03-25 18:09:34.951312',5,0),(55,'준식 스티커',12000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.952535',28,'2021-03-25 18:09:34.952503',5,0),(56,'죠르디 마우스패드',35000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.953670',29,'2021-03-25 18:09:34.953638',5,0),(57,'칸 휴지통',7000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.954806',29,'2021-03-25 18:09:34.954775',5,0),(58,'타이거 커터칼',5000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.956037',29,'2021-03-25 18:09:34.956005',5,0),(59,'토끼 신년봉투',1500.00,0.0,0,0.0,'html','2021-03-25 18:09:34.957331',30,'2021-03-25 18:09:34.957301',5,0),(60,'죠르디 탈취제',10000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.958785',18,'2021-03-25 18:09:34.958754',3,0),(61,'피치피치 운동화',150000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.960046',19,'2021-03-25 18:09:34.960007',4,0),(62,'꾀돌이 슬리퍼',3000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.961398',19,'2021-03-25 18:09:34.961365',4,0),(63,'팬다어덜트 파우치',80000.00,0.0,0,0.0,'html','2021-03-25 18:09:34.962616',20,'2021-03-25 18:09:34.962584',4,0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchased_products`
--

DROP TABLE IF EXISTS `purchased_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchased_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `transaction_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchased_products_product_id_03998cfa_fk_products_id` (`product_id`),
  KEY `purchased_products_transaction_id_c0327239_fk_transactions_id` (`transaction_id`),
  CONSTRAINT `purchased_products_product_id_03998cfa_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `purchased_products_transaction_id_c0327239_fk_transactions_id` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchased_products`
--

LOCK TABLES `purchased_products` WRITE;
/*!40000 ALTER TABLE `purchased_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchased_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommended_products`
--

DROP TABLE IF EXISTS `recommended_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommended_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `feed_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `feed_recommendedproduct_feed_id_b8faab0a_fk_feeds_id` (`feed_id`),
  KEY `feed_recommendedproduct_product_id_6a9073bb_fk_products_id` (`product_id`),
  CONSTRAINT `feed_recommendedproduct_feed_id_b8faab0a_fk_feeds_id` FOREIGN KEY (`feed_id`) REFERENCES `feeds` (`id`),
  CONSTRAINT `feed_recommendedproduct_product_id_6a9073bb_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=481 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommended_products`
--

LOCK TABLES `recommended_products` WRITE;
/*!40000 ALTER TABLE `recommended_products` DISABLE KEYS */;
INSERT INTO `recommended_products` VALUES (1,1,13),(2,2,26),(3,3,63),(4,4,23),(5,5,44),(6,6,21),(7,7,52),(8,8,43),(9,9,50),(10,10,46),(11,11,4),(12,12,4),(13,13,28),(14,14,10),(15,15,35),(16,16,45),(17,17,7),(18,18,3),(19,19,29),(20,20,12),(21,21,61),(22,22,18),(23,23,50),(24,24,27),(25,25,4),(26,26,62),(27,27,8),(28,28,31),(29,29,21),(30,30,36),(31,31,2),(32,32,24),(33,33,54),(34,34,38),(35,35,41),(36,36,25),(37,37,61),(38,38,43),(39,39,10),(40,40,30),(41,41,59),(42,42,8),(43,43,13),(44,44,8),(45,45,19),(46,46,3),(47,47,8),(48,48,44),(49,49,57),(50,50,31),(51,51,47),(52,52,62),(53,53,30),(54,54,1),(55,55,53),(56,56,17),(57,57,5),(58,58,23),(59,59,57),(60,30,7),(61,1,11),(62,2,14),(63,3,17),(64,4,24),(65,5,17),(66,6,40),(67,7,58),(68,8,58),(69,9,53),(70,10,25),(71,11,63),(72,12,1),(73,13,26),(74,14,20),(75,15,22),(76,16,18),(77,17,50),(78,18,44),(79,19,24),(80,20,7),(81,21,26),(82,22,7),(83,23,50),(84,24,57),(85,25,6),(86,26,23),(87,27,47),(88,28,23),(89,29,58),(90,30,13),(91,31,1),(92,32,50),(93,33,12),(94,34,63),(95,35,42),(96,36,23),(97,37,63),(98,38,20),(99,39,39),(100,40,24),(101,41,7),(102,42,3),(103,43,13),(104,44,41),(105,45,51),(106,46,28),(107,47,44),(108,48,16),(109,49,9),(110,50,34),(111,51,1),(112,52,32),(113,53,56),(114,54,36),(115,55,27),(116,56,10),(117,57,34),(118,58,24),(119,59,14),(120,23,1),(121,1,19),(122,2,3),(123,3,19),(124,4,35),(125,5,30),(126,6,62),(127,7,34),(128,8,60),(129,9,58),(130,10,13),(131,11,32),(132,12,60),(133,13,25),(134,14,38),(135,15,44),(136,16,58),(137,17,34),(138,18,55),(139,19,33),(140,20,27),(141,21,41),(142,22,38),(143,23,43),(144,24,57),(145,25,27),(146,26,1),(147,27,44),(148,28,27),(149,29,31),(150,30,10),(151,31,18),(152,32,15),(153,33,32),(154,34,50),(155,35,19),(156,36,5),(157,37,49),(158,38,14),(159,39,28),(160,40,2),(161,41,41),(162,42,4),(163,43,35),(164,44,26),(165,45,21),(166,46,31),(167,47,50),(168,48,2),(169,49,13),(170,50,30),(171,51,58),(172,52,62),(173,53,44),(174,54,38),(175,55,40),(176,56,27),(177,57,26),(178,58,57),(179,59,63),(180,43,2),(181,1,29),(182,2,16),(183,3,33),(184,4,24),(185,5,23),(186,6,26),(187,7,48),(188,8,28),(189,9,36),(190,10,11),(191,11,11),(192,12,21),(193,13,58),(194,14,9),(195,15,8),(196,16,43),(197,17,38),(198,18,45),(199,19,34),(200,20,42),(201,21,46),(202,22,55),(203,23,34),(204,24,38),(205,25,58),(206,26,36),(207,27,34),(208,28,26),(209,29,38),(210,30,26),(211,31,11),(212,32,26),(213,33,7),(214,34,34),(215,35,17),(216,36,26),(217,37,50),(218,38,2),(219,39,49),(220,40,11),(221,41,6),(222,42,60),(223,43,29),(224,44,63),(225,45,8),(226,46,22),(227,47,21),(228,48,30),(229,49,40),(230,50,30),(231,51,48),(232,52,38),(233,53,27),(234,54,34),(235,55,62),(236,56,33),(237,57,4),(238,58,10),(239,59,35),(240,13,49),(241,1,41),(242,2,56),(243,3,59),(244,4,4),(245,5,39),(246,6,28),(247,7,4),(248,8,12),(249,9,61),(250,10,1),(251,11,12),(252,12,9),(253,13,44),(254,14,21),(255,15,48),(256,16,61),(257,17,56),(258,18,62),(259,19,37),(260,20,60),(261,21,50),(262,22,12),(263,23,1),(264,24,54),(265,25,47),(266,26,61),(267,27,16),(268,28,63),(269,29,48),(270,30,41),(271,31,15),(272,32,58),(273,33,3),(274,34,29),(275,35,55),(276,36,28),(277,37,25),(278,38,55),(279,39,13),(280,40,13),(281,41,10),(282,42,40),(283,43,52),(284,44,13),(285,45,26),(286,46,48),(287,47,30),(288,48,53),(289,49,62),(290,50,35),(291,51,62),(292,52,6),(293,53,62),(294,54,26),(295,55,10),(296,56,38),(297,57,11),(298,58,17),(299,59,39),(300,39,30),(301,1,36),(302,2,54),(303,3,11),(304,4,8),(305,5,10),(306,6,36),(307,7,22),(308,8,10),(309,9,22),(310,10,49),(311,11,43),(312,12,32),(313,13,4),(314,14,60),(315,15,2),(316,16,9),(317,17,48),(318,18,18),(319,19,51),(320,20,1),(321,21,23),(322,22,62),(323,23,23),(324,24,41),(325,25,35),(326,26,41),(327,27,56),(328,28,44),(329,29,42),(330,30,9),(331,31,15),(332,32,29),(333,33,51),(334,34,52),(335,35,47),(336,36,29),(337,37,18),(338,38,56),(339,39,24),(340,40,14),(341,41,16),(342,42,41),(343,43,47),(344,44,29),(345,45,39),(346,46,52),(347,47,34),(348,48,49),(349,49,62),(350,50,36),(351,51,40),(352,52,16),(353,53,34),(354,54,59),(355,55,4),(356,56,30),(357,57,32),(358,58,49),(359,59,48),(360,37,40),(361,1,10),(362,2,37),(363,3,31),(364,4,36),(365,5,58),(366,6,61),(367,7,49),(368,8,50),(369,9,6),(370,10,25),(371,11,3),(372,12,10),(373,13,14),(374,14,23),(375,15,9),(376,16,57),(377,17,41),(378,18,52),(379,19,59),(380,20,38),(381,21,46),(382,22,29),(383,23,28),(384,24,6),(385,25,23),(386,26,45),(387,27,30),(388,28,27),(389,29,13),(390,30,25),(391,31,36),(392,32,54),(393,33,35),(394,34,39),(395,35,40),(396,36,25),(397,37,33),(398,38,51),(399,39,15),(400,40,25),(401,41,50),(402,42,41),(403,43,35),(404,44,15),(405,45,9),(406,46,10),(407,47,57),(408,48,32),(409,49,30),(410,50,38),(411,51,18),(412,52,60),(413,53,19),(414,54,16),(415,55,54),(416,56,23),(417,57,30),(418,58,13),(419,59,45),(420,21,48);
/*!40000 ALTER TABLE `recommended_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replies`
--

DROP TABLE IF EXISTS `replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `like_count` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `feed_id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `replies_feed_id_9841cc2e_fk_feeds_id` (`feed_id`),
  KEY `replies_parent_id_68a8feeb_fk_replies_id` (`parent_id`),
  KEY `replies_user_id_69326151_fk_users_id` (`user_id`),
  CONSTRAINT `replies_feed_id_9841cc2e_fk_feeds_id` FOREIGN KEY (`feed_id`) REFERENCES `feeds` (`id`),
  CONSTRAINT `replies_parent_id_68a8feeb_fk_replies_id` FOREIGN KEY (`parent_id`) REFERENCES `replies` (`id`),
  CONSTRAINT `replies_user_id_69326151_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=692 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replies`
--

LOCK TABLES `replies` WRITE;
/*!40000 ALTER TABLE `replies` DISABLE KEYS */;
INSERT INTO `replies` VALUES (1,'공부 열심히 하자',0,'2021-03-25 18:20:02.035951',1,NULL,18),(2,'구독',0,'2021-03-25 18:20:02.039321',1,NULL,16),(3,'더 보고싶은데 ㅜㅜ',0,'2021-03-25 18:20:02.041463',1,NULL,16),(4,'벌써 끝이라니',0,'2021-03-25 18:20:02.043572',1,NULL,16),(5,'아니에요',0,'2021-03-25 18:20:02.046133',1,NULL,20),(6,'아앙',0,'2021-03-25 18:20:02.047918',1,NULL,18),(7,'알람설정',0,'2021-03-25 18:20:02.049450',1,NULL,16),(8,'앞으로 더욱 친하게 지내요',0,'2021-03-25 18:20:02.051086',1,NULL,20),(9,'잉?',0,'2021-03-25 18:20:02.052652',1,NULL,20),(10,'좋아요',0,'2021-03-25 18:20:02.054187',1,NULL,16),(11,'굳굳굳',0,'2021-03-25 18:20:02.055740',2,NULL,20),(12,'귀여워',0,'2021-03-25 18:20:02.057017',2,NULL,18),(13,'귀엽다',0,'2021-03-25 18:20:02.058491',2,NULL,16),(14,'냠냠',0,'2021-03-25 18:20:02.059860',2,NULL,20),(15,'네',0,'2021-03-25 18:20:02.060970',2,NULL,15),(16,'모샃ㅁ겠다',0,'2021-03-25 18:20:02.062165',2,NULL,18),(17,'브런치먹을사람?',0,'2021-03-25 18:20:02.063428',2,NULL,20),(18,'어피치',0,'2021-03-25 18:20:02.065470',2,NULL,18),(19,'우리와 같이살자',0,'2021-03-25 18:20:02.067712',2,NULL,15),(20,'좋네요',0,'2021-03-25 18:20:02.070103',2,NULL,18),(21,'같고싶다',0,'2021-03-25 18:20:02.072502',3,NULL,15),(22,'대박귀여워',0,'2021-03-25 18:20:02.074754',3,NULL,19),(23,'맛있겠다',0,'2021-03-25 18:20:02.076493',3,NULL,20),(24,'사고싶당',0,'2021-03-25 18:20:02.077963',3,NULL,18),(25,'사진찍어',0,'2021-03-25 18:20:02.079326',3,NULL,16),(26,'엄청 귀여워요',0,'2021-03-25 18:20:02.080540',3,NULL,16),(27,'오귀엽',0,'2021-03-25 18:20:02.081801',3,NULL,20),(28,'이거예뻐워',0,'2021-03-25 18:20:02.083104',3,NULL,19),(29,'이벤트해주세요',0,'2021-03-25 18:20:02.084352',3,NULL,16),(30,'핵귀',0,'2021-03-25 18:20:02.085711',3,NULL,20),(31,'공부 열심히 하자',0,'2021-03-25 18:20:02.086946',4,NULL,19),(32,'구독',0,'2021-03-25 18:20:02.088166',4,NULL,17),(33,'냠냠',0,'2021-03-25 18:20:02.089523',4,NULL,15),(34,'더 보고싶은데 ㅜㅜ',0,'2021-03-25 18:20:02.090735',4,NULL,17),(35,'벌써 끝이라니',0,'2021-03-25 18:20:02.092114',4,NULL,17),(36,'아앙',0,'2021-03-25 18:20:02.093249',4,NULL,19),(37,'알람설정',0,'2021-03-25 18:20:02.094391',4,NULL,17),(38,'오신기하다',0,'2021-03-25 18:20:02.095512',4,NULL,18),(39,'잉?',0,'2021-03-25 18:20:02.096634',4,NULL,15),(40,'좋아요',0,'2021-03-25 18:20:02.097748',4,NULL,17),(41,'굳굳굳',0,'2021-03-25 18:20:02.098871',5,NULL,15),(42,'귀여워',0,'2021-03-25 18:20:02.100018',5,NULL,19),(43,'귀엽다',0,'2021-03-25 18:20:02.101335',5,NULL,17),(44,'냠냠',0,'2021-03-25 18:20:02.102460',5,NULL,16),(45,'네',0,'2021-03-25 18:20:02.103568',5,NULL,16),(46,'맛있겠다',0,'2021-03-25 18:20:02.105201',5,NULL,15),(47,'모샃ㅁ겠다',0,'2021-03-25 18:20:02.106892',5,NULL,19),(48,'브런치먹을사람?',0,'2021-03-25 18:20:02.108749',5,NULL,15),(49,'아니에요',0,'2021-03-25 18:20:02.110683',5,NULL,15),(50,'앞으로 더욱 친하게 지내요',0,'2021-03-25 18:20:02.112284',5,NULL,15),(51,'어피치',0,'2021-03-25 18:20:02.114189',5,NULL,19),(52,'엄청 귀여워요',0,'2021-03-25 18:20:02.116315',5,NULL,17),(53,'우리와 같이살자',0,'2021-03-25 18:20:02.118432',5,NULL,16),(54,'좋네요',0,'2021-03-25 18:20:02.119976',5,NULL,19),(55,'같고싶다',0,'2021-03-25 18:20:02.121475',6,NULL,16),(56,'냠냠',0,'2021-03-25 18:20:02.122684',6,NULL,17),(57,'대박귀여워',0,'2021-03-25 18:20:02.123919',6,NULL,20),(58,'사고싶당',0,'2021-03-25 18:20:02.125265',6,NULL,19),(59,'사진찍어',0,'2021-03-25 18:20:02.126762',6,NULL,17),(60,'오귀엽',0,'2021-03-25 18:20:02.128031',6,NULL,15),(61,'오신기하다',0,'2021-03-25 18:20:02.129877',6,NULL,19),(62,'이거예뻐워',0,'2021-03-25 18:20:02.131673',6,NULL,20),(63,'이벤트해주세요',0,'2021-03-25 18:20:02.133604',6,NULL,17),(64,'좋아요',0,'2021-03-25 18:20:02.135781',6,NULL,18),(65,'핵귀',0,'2021-03-25 18:20:02.137892',6,NULL,15),(66,'공부 열심히 하자',0,'2021-03-25 18:20:02.139688',7,NULL,20),(67,'구독',0,'2021-03-25 18:20:02.141466',7,NULL,18),(68,'네',0,'2021-03-25 18:20:02.142977',7,NULL,17),(69,'더 보고싶은데 ㅜㅜ',0,'2021-03-25 18:20:02.144226',7,NULL,18),(70,'벌써 끝이라니',0,'2021-03-25 18:20:02.145427',7,NULL,18),(71,'아니에요',0,'2021-03-25 18:20:02.146649',7,NULL,16),(72,'아앙',0,'2021-03-25 18:20:02.147939',7,NULL,20),(73,'알람설정',0,'2021-03-25 18:20:02.149300',7,NULL,18),(74,'앞으로 더욱 친하게 지내요',0,'2021-03-25 18:20:02.150418',7,NULL,16),(75,'잉?',0,'2021-03-25 18:20:02.151887',7,NULL,16),(76,'굳굳굳',0,'2021-03-25 18:20:02.153120',8,NULL,16),(77,'귀여워',0,'2021-03-25 18:20:02.154303',8,NULL,20),(78,'귀엽다',0,'2021-03-25 18:20:02.155625',8,NULL,18),(79,'냠냠',0,'2021-03-25 18:20:02.157025',8,NULL,18),(80,'맛있겠다',0,'2021-03-25 18:20:02.158330',8,NULL,16),(81,'모샃ㅁ겠다',0,'2021-03-25 18:20:02.159649',8,NULL,20),(82,'브런치먹을사람?',0,'2021-03-25 18:20:02.161147',8,NULL,16),(83,'어피치',0,'2021-03-25 18:20:02.162580',8,NULL,20),(84,'엄청 귀여워요',0,'2021-03-25 18:20:02.163940',8,NULL,18),(85,'우리와 같이살자',0,'2021-03-25 18:20:02.165137',8,NULL,17),(86,'좋네요',0,'2021-03-25 18:20:02.166530',8,NULL,20),(87,'핵귀',0,'2021-03-25 18:20:02.167699',8,NULL,16),(88,'같고싶다',0,'2021-03-25 18:20:02.168978',9,NULL,17),(89,'냠냠',0,'2021-03-25 18:20:02.170264',9,NULL,19),(90,'대박귀여워',0,'2021-03-25 18:20:02.171574',9,NULL,15),(91,'사고싶당',0,'2021-03-25 18:20:02.172731',9,NULL,20),(92,'사진찍어',0,'2021-03-25 18:20:02.173899',9,NULL,18),(93,'알람설정',0,'2021-03-25 18:20:02.175062',9,NULL,19),(94,'오귀엽',0,'2021-03-25 18:20:02.176245',9,NULL,16),(95,'오신기하다',0,'2021-03-25 18:20:02.177404',9,NULL,20),(96,'이거예뻐워',0,'2021-03-25 18:20:02.178511',9,NULL,15),(97,'이벤트해주세요',0,'2021-03-25 18:20:02.179736',9,NULL,18),(98,'좋아요',0,'2021-03-25 18:20:02.180790',9,NULL,19),(99,'공부 열심히 하자',0,'2021-03-25 18:20:02.181804',10,NULL,15),(100,'구독',0,'2021-03-25 18:20:02.182952',10,NULL,19),(101,'냠냠',0,'2021-03-25 18:20:02.184039',10,NULL,20),(102,'네',0,'2021-03-25 18:20:02.185098',10,NULL,18),(103,'더 보고싶은데 ㅜㅜ',0,'2021-03-25 18:20:02.186202',10,NULL,19),(104,'벌써 끝이라니',0,'2021-03-25 18:20:02.187220',10,NULL,19),(105,'아니에요',0,'2021-03-25 18:20:02.188238',10,NULL,17),(106,'아앙',0,'2021-03-25 18:20:02.189258',10,NULL,15),(107,'앞으로 더욱 친하게 지내요',0,'2021-03-25 18:20:02.190278',10,NULL,17),(108,'우리와 같이살자',0,'2021-03-25 18:20:02.191323',10,NULL,18),(109,'잉?',0,'2021-03-25 18:20:02.192531',10,NULL,17),(110,'굳굳굳',0,'2021-03-25 18:20:02.193535',11,NULL,17),(111,'귀여워',0,'2021-03-25 18:20:02.194565',11,NULL,15),(112,'귀엽다',0,'2021-03-25 18:20:02.195582',11,NULL,19),(113,'맛있겠다',0,'2021-03-25 18:20:02.196636',11,NULL,17),(114,'모샃ㅁ겠다',0,'2021-03-25 18:20:02.197666',11,NULL,15),(115,'브런치먹을사람?',0,'2021-03-25 18:20:02.198887',11,NULL,17),(116,'사고싶당',0,'2021-03-25 18:20:02.199908',11,NULL,15),(117,'사진찍어',0,'2021-03-25 18:20:02.200958',11,NULL,19),(118,'어피치',0,'2021-03-25 18:20:02.201981',11,NULL,15),(119,'엄청 귀여워요',0,'2021-03-25 18:20:02.203248',11,NULL,19),(120,'오귀엽',0,'2021-03-25 18:20:02.204383',11,NULL,17),(121,'이벤트해주세요',0,'2021-03-25 18:20:02.205404',11,NULL,19),(122,'좋네요',0,'2021-03-25 18:20:02.206443',11,NULL,15),(123,'핵귀',0,'2021-03-25 18:20:02.207472',11,NULL,17),(124,'같고싶다',0,'2021-03-25 18:20:02.208485',12,NULL,18),(125,'공부 열심히 하자',0,'2021-03-25 18:20:02.209500',12,NULL,16),(126,'구독',0,'2021-03-25 18:20:02.210516',12,NULL,20),(127,'냠냠',0,'2021-03-25 18:20:02.211567',12,NULL,15),(128,'대박귀여워',0,'2021-03-25 18:20:02.212723',12,NULL,16),(129,'더 보고싶은데 ㅜㅜ',0,'2021-03-25 18:20:02.213776',12,NULL,20),(130,'벌써 끝이라니',0,'2021-03-25 18:20:02.214817',12,NULL,20),(131,'아앙',0,'2021-03-25 18:20:02.215835',12,NULL,16),(132,'알람설정',0,'2021-03-25 18:20:02.216867',12,NULL,20),(133,'앞으로 더욱 친하게 지내요',0,'2021-03-25 18:20:02.218000',12,NULL,18),(134,'오신기하다',0,'2021-03-25 18:20:02.219061',12,NULL,15),(135,'이거예뻐워',0,'2021-03-25 18:20:02.220157',12,NULL,16),(136,'잉?',0,'2021-03-25 18:20:02.221223',12,NULL,18),(137,'좋아요',0,'2021-03-25 18:20:02.222462',12,NULL,20),(138,'굳굳굳',0,'2021-03-25 18:20:02.223666',13,NULL,18),(139,'귀여워',0,'2021-03-25 18:20:02.224705',13,NULL,16),(140,'귀엽다',0,'2021-03-25 18:20:02.225716',13,NULL,20),(141,'냠냠',0,'2021-03-25 18:20:02.226731',13,NULL,16),(142,'네',0,'2021-03-25 18:20:02.227802',13,NULL,19),(143,'모샃ㅁ겠다',0,'2021-03-25 18:20:02.228891',13,NULL,16),(144,'브런치먹을사람?',0,'2021-03-25 18:20:02.229914',13,NULL,18),(145,'아니에요',0,'2021-03-25 18:20:02.230944',13,NULL,18),(146,'어피치',0,'2021-03-25 18:20:02.231965',13,NULL,16),(147,'엄청 귀여워요',0,'2021-03-25 18:20:02.233025',13,NULL,20),(148,'우리와 같이살자',0,'2021-03-25 18:20:02.234087',13,NULL,19),(149,'좋네요',0,'2021-03-25 18:20:02.235121',13,NULL,16),(150,'같고싶다',0,'2021-03-25 18:20:02.236146',14,NULL,19),(151,'대박귀여워',0,'2021-03-25 18:20:02.237176',14,NULL,17),(152,'맛있겠다',0,'2021-03-25 18:20:02.238205',14,NULL,18),(153,'사고싶당',0,'2021-03-25 18:20:02.239204',14,NULL,16),(154,'사진찍어',0,'2021-03-25 18:20:02.240397',14,NULL,20),(155,'오귀엽',0,'2021-03-25 18:20:02.241416',14,NULL,18),(156,'이거예뻐워',0,'2021-03-25 18:20:02.242418',14,NULL,17),(157,'이벤트해주세요',0,'2021-03-25 18:20:02.243594',14,NULL,20),(158,'핵귀',0,'2021-03-25 18:20:02.244615',14,NULL,18),(159,'공부 열심히 하자',0,'2021-03-25 18:20:02.245614',15,NULL,17),(160,'구독',0,'2021-03-25 18:20:02.246618',15,NULL,15),(161,'냠냠',0,'2021-03-25 18:20:02.247615',15,NULL,17),(162,'더 보고싶은데 ㅜㅜ',0,'2021-03-25 18:20:02.248791',15,NULL,15),(163,'벌써 끝이라니',0,'2021-03-25 18:20:02.249806',15,NULL,15),(164,'아앙',0,'2021-03-25 18:20:02.250899',15,NULL,17),(165,'알람설정',0,'2021-03-25 18:20:02.251985',15,NULL,15),(166,'오신기하다',0,'2021-03-25 18:20:02.253334',15,NULL,16),(167,'잉?',0,'2021-03-25 18:20:02.254436',15,NULL,19),(168,'좋아요',0,'2021-03-25 18:20:02.255465',15,NULL,15),(169,'굳굳굳',0,'2021-03-25 18:20:02.256569',16,NULL,19),(170,'귀여워',0,'2021-03-25 18:20:02.257609',16,NULL,17),(171,'귀엽다',0,'2021-03-25 18:20:02.258625',16,NULL,15),(172,'냠냠',0,'2021-03-25 18:20:02.259876',16,NULL,18),(173,'네',0,'2021-03-25 18:20:02.260945',16,NULL,20),(174,'모샃ㅁ겠다',0,'2021-03-25 18:20:02.263103',16,NULL,17),(175,'브런치먹을사람?',0,'2021-03-25 18:20:02.264477',16,NULL,19),(176,'아니에요',0,'2021-03-25 18:20:02.265877',16,NULL,19),(177,'앞으로 더욱 친하게 지내요',0,'2021-03-25 18:20:02.267217',16,NULL,19),(178,'어피치',0,'2021-03-25 18:20:02.268501',16,NULL,17),(179,'엄청 귀여워요',0,'2021-03-25 18:20:02.269679',16,NULL,15),(180,'우리와 같이살자',0,'2021-03-25 18:20:02.270795',16,NULL,20),(181,'좋네요',0,'2021-03-25 18:20:02.271950',16,NULL,17),(182,'공부 열심히 하자',0,'2021-03-25 18:20:02.273033',17,NULL,18),(183,'구독',0,'2021-03-25 18:20:02.274087',17,NULL,16),(184,'귀엽다',0,'2021-03-25 18:20:02.275169',17,NULL,16),(185,'냠냠',0,'2021-03-25 18:20:02.276364',17,NULL,20),(186,'네',0,'2021-03-25 18:20:02.277427',17,NULL,15),(187,'더 보고싶은데 ㅜㅜ',0,'2021-03-25 18:20:02.278500',17,NULL,16),(188,'벌써 끝이라니',0,'2021-03-25 18:20:02.279609',17,NULL,16),(189,'브런치먹을사람?',0,'2021-03-25 18:20:02.280675',17,NULL,20),(190,'아니에요',0,'2021-03-25 18:20:02.281779',17,NULL,20),(191,'아앙',0,'2021-03-25 18:20:02.282822',17,NULL,18),(192,'앞으로 더욱 친하게 지내요',0,'2021-03-25 18:20:02.283868',17,NULL,20),(193,'우리와 같이살자',0,'2021-03-25 18:20:02.284892',17,NULL,15),(194,'잉?',0,'2021-03-25 18:20:02.285996',17,NULL,20),(195,'같고싶다',0,'2021-03-25 18:20:02.287061',18,NULL,20),(196,'냠냠',0,'2021-03-25 18:20:02.288103',18,NULL,19),(197,'대박귀여워',0,'2021-03-25 18:20:02.289186',18,NULL,18),(198,'맛있겠다',0,'2021-03-25 18:20:02.290440',18,NULL,19),(199,'사고싶당',0,'2021-03-25 18:20:02.291478',18,NULL,17),(200,'사진찍어',0,'2021-03-25 18:20:02.292695',18,NULL,15),(201,'알람설정',0,'2021-03-25 18:20:02.293934',18,NULL,16),(202,'오귀엽',0,'2021-03-25 18:20:02.295473',18,NULL,19),(203,'오신기하다',0,'2021-03-25 18:20:02.297600',18,NULL,17),(204,'이거예뻐워',0,'2021-03-25 18:20:02.299814',18,NULL,18),(205,'이벤트해주세요',0,'2021-03-25 18:20:02.301562',18,NULL,15),(206,'좋아요',0,'2021-03-25 18:20:02.302713',18,NULL,16),(207,'핵귀',0,'2021-03-25 18:20:02.304002',18,NULL,19),(208,'굳굳굳',0,'2021-03-25 18:20:02.305163',19,NULL,20),(209,'귀여워',0,'2021-03-25 18:20:02.306332',19,NULL,18),(210,'대박귀여워',0,'2021-03-25 18:20:02.307790',19,NULL,19),(211,'맛있겠다',0,'2021-03-25 18:20:02.309225',19,NULL,20),(212,'모샃ㅁ겠다',0,'2021-03-25 18:20:02.310456',19,NULL,18),(213,'사고싶당',0,'2021-03-25 18:20:02.311674',19,NULL,18),(214,'사진찍어',0,'2021-03-25 18:20:02.313057',19,NULL,16),(215,'어피치',0,'2021-03-25 18:20:02.314319',19,NULL,18),(216,'엄청 귀여워요',0,'2021-03-25 18:20:02.315591',19,NULL,16),(217,'오귀엽',0,'2021-03-25 18:20:02.316822',19,NULL,20),(218,'이거예뻐워',0,'2021-03-25 18:20:02.318028',19,NULL,19),(219,'이벤트해주세요',0,'2021-03-25 18:20:02.319212',19,NULL,16),(220,'좋네요',0,'2021-03-25 18:20:02.320366',19,NULL,18),(221,'핵귀',0,'2021-03-25 18:20:02.321634',19,NULL,20),(222,'같고싶다',0,'2021-03-25 18:20:02.323033',20,NULL,15),(223,'공부 열심히 하자',0,'2021-03-25 18:20:02.324232',20,NULL,19),(224,'구독',0,'2021-03-25 18:20:02.325349',20,NULL,17),(225,'냠냠',0,'2021-03-25 18:20:02.326516',20,NULL,15),(226,'더 보고싶은데 ㅜㅜ',0,'2021-03-25 18:20:02.327579',20,NULL,17),(227,'벌써 끝이라니',0,'2021-03-25 18:20:02.328618',20,NULL,17),(228,'아니에요',0,'2021-03-25 18:20:02.329664',20,NULL,15),(229,'아앙',0,'2021-03-25 18:20:02.330698',20,NULL,19),(230,'알람설정',0,'2021-03-25 18:20:02.331812',20,NULL,17),(231,'앞으로 더욱 친하게 지내요',0,'2021-03-25 18:20:02.332878',20,NULL,15),(232,'오신기하다',0,'2021-03-25 18:20:02.333947',20,NULL,18),(233,'잉?',0,'2021-03-25 18:20:02.334994',20,NULL,15),(234,'좋아요',0,'2021-03-25 18:20:02.336030',20,NULL,17),(235,'굳굳굳',0,'2021-03-25 18:20:02.337050',21,NULL,15),(236,'귀여워',0,'2021-03-25 18:20:02.338085',21,NULL,19),(237,'귀엽다',0,'2021-03-25 18:20:02.339109',21,NULL,17),(238,'냠냠',0,'2021-03-25 18:20:02.340389',21,NULL,16),(239,'네',0,'2021-03-25 18:20:02.341451',21,NULL,16),(240,'맛있겠다',0,'2021-03-25 18:20:02.342512',21,NULL,15),(241,'모샃ㅁ겠다',0,'2021-03-25 18:20:02.343569',21,NULL,19),(242,'브런치먹을사람?',0,'2021-03-25 18:20:02.344768',21,NULL,15),(243,'사고싶당',0,'2021-03-25 18:20:02.345805',21,NULL,19),(244,'사진찍어',0,'2021-03-25 18:20:02.346831',21,NULL,17),(245,'어피치',0,'2021-03-25 18:20:02.347882',21,NULL,19),(246,'엄청 귀여워요',0,'2021-03-25 18:20:02.348928',21,NULL,17),(247,'우리와 같이살자',0,'2021-03-25 18:20:02.349951',21,NULL,16),(248,'이벤트해주세요',0,'2021-03-25 18:20:02.351003',21,NULL,17),(249,'좋네요',0,'2021-03-25 18:20:02.352084',21,NULL,19),(250,'핵귀',0,'2021-03-25 18:20:02.353145',21,NULL,15),(251,'같고싶다',0,'2021-03-25 18:20:02.354399',22,NULL,16),(252,'구독',0,'2021-03-25 18:20:02.355617',22,NULL,18),(253,'냠냠',0,'2021-03-25 18:20:02.356669',22,NULL,17),(254,'대박귀여워',0,'2021-03-25 18:20:02.357695',22,NULL,20),(255,'더 보고싶은데 ㅜㅜ',0,'2021-03-25 18:20:02.358754',22,NULL,18),(256,'벌써 끝이라니',0,'2021-03-25 18:20:02.359782',22,NULL,18),(257,'아앙',0,'2021-03-25 18:20:02.360808',22,NULL,20),(258,'알람설정',0,'2021-03-25 18:20:02.361811',22,NULL,18),(259,'오귀엽',0,'2021-03-25 18:20:02.362855',22,NULL,15),(260,'오신기하다',0,'2021-03-25 18:20:02.363882',22,NULL,19),(261,'이거예뻐워',0,'2021-03-25 18:20:02.365200',22,NULL,20),(262,'잉?',0,'2021-03-25 18:20:02.366314',22,NULL,16),(263,'좋아요',0,'2021-03-25 18:20:02.367360',22,NULL,18),(264,'공부 열심히 하자',0,'2021-03-25 18:20:02.368402',23,NULL,20),(265,'귀여워',0,'2021-03-25 18:20:02.369412',23,NULL,20),(266,'귀엽다',0,'2021-03-25 18:20:02.371284',23,NULL,18),(267,'냠냠',0,'2021-03-25 18:20:02.372424',23,NULL,18),(268,'네',0,'2021-03-25 18:20:02.373707',23,NULL,17),(269,'모샃ㅁ겠다',0,'2021-03-25 18:20:02.374746',23,NULL,20),(270,'브런치먹을사람?',0,'2021-03-25 18:20:02.375948',23,NULL,16),(271,'아니에요',0,'2021-03-25 18:20:02.376982',23,NULL,16),(272,'앞으로 더욱 친하게 지내요',0,'2021-03-25 18:20:02.378041',23,NULL,16),(273,'어피치',0,'2021-03-25 18:20:02.379065',23,NULL,20),(274,'우리와 같이살자',0,'2021-03-25 18:20:02.380107',23,NULL,17),(275,'좋네요',0,'2021-03-25 18:20:02.381136',23,NULL,20),(276,'같고싶다',0,'2021-03-25 18:20:02.382158',24,NULL,17),(277,'굳굳굳',0,'2021-03-25 18:20:02.383187',24,NULL,16),(278,'냠냠',0,'2021-03-25 18:20:02.384256',24,NULL,19),(279,'대박귀여워',0,'2021-03-25 18:20:02.385372',24,NULL,15),(280,'맛있겠다',0,'2021-03-25 18:20:02.386503',24,NULL,16),(281,'사고싶당',0,'2021-03-25 18:20:02.387557',24,NULL,20),(282,'사진찍어',0,'2021-03-25 18:20:02.388642',24,NULL,18),(283,'엄청 귀여워요',0,'2021-03-25 18:20:02.389723',24,NULL,18),(284,'오귀엽',0,'2021-03-25 18:20:02.390798',24,NULL,16),(285,'이거예뻐워',0,'2021-03-25 18:20:02.391871',24,NULL,15),(286,'이벤트해주세요',0,'2021-03-25 18:20:02.392948',24,NULL,18),(287,'핵귀',0,'2021-03-25 18:20:02.394035',24,NULL,16),(288,'공부 열심히 하자',0,'2021-03-25 18:20:02.395090',25,NULL,15),(289,'구독',0,'2021-03-25 18:20:02.396260',25,NULL,19),(290,'네',0,'2021-03-25 18:20:02.397299',25,NULL,18),(291,'더 보고싶은데 ㅜㅜ',0,'2021-03-25 18:20:02.398358',25,NULL,19),(292,'벌써 끝이라니',0,'2021-03-25 18:20:02.399376',25,NULL,19),(293,'아니에요',0,'2021-03-25 18:20:02.400426',25,NULL,17),(294,'아앙',0,'2021-03-25 18:20:02.401510',25,NULL,15),(295,'알람설정',0,'2021-03-25 18:20:02.402581',25,NULL,19),(296,'앞으로 더욱 친하게 지내요',0,'2021-03-25 18:20:02.403644',25,NULL,17),(297,'오신기하다',0,'2021-03-25 18:20:02.404720',25,NULL,20),(298,'우리와 같이살자',0,'2021-03-25 18:20:02.405858',25,NULL,18),(299,'잉?',0,'2021-03-25 18:20:02.406859',25,NULL,17),(300,'좋아요',0,'2021-03-25 18:20:02.407865',25,NULL,19),(301,'굳굳굳',0,'2021-03-25 18:20:02.408933',26,NULL,17),(302,'귀여워',0,'2021-03-25 18:20:02.409952',26,NULL,15),(303,'귀엽다',0,'2021-03-25 18:20:02.411139',26,NULL,19),(304,'냠냠',0,'2021-03-25 18:20:02.413013',26,NULL,20),(305,'맛있겠다',0,'2021-03-25 18:20:02.414693',26,NULL,17),(306,'모샃ㅁ겠다',0,'2021-03-25 18:20:02.416304',26,NULL,15),(307,'브런치먹을사람?',0,'2021-03-25 18:20:02.418348',26,NULL,17),(308,'사고싶당',0,'2021-03-25 18:20:02.420164',26,NULL,15),(309,'어피치',0,'2021-03-25 18:20:02.421922',26,NULL,15),(310,'엄청 귀여워요',0,'2021-03-25 18:20:02.423450',26,NULL,19),(311,'이벤트해주세요',0,'2021-03-25 18:20:02.425100',26,NULL,19),(312,'좋네요',0,'2021-03-25 18:20:02.426420',26,NULL,15),(313,'핵귀',0,'2021-03-25 18:20:02.435107',26,NULL,17),(314,'같고싶다',0,'2021-03-25 18:20:02.438884',27,NULL,18),(315,'구독',0,'2021-03-25 18:20:02.440816',27,NULL,20),(316,'냠냠',0,'2021-03-25 18:20:02.442977',27,NULL,15),(317,'대박귀여워',0,'2021-03-25 18:20:02.445287',27,NULL,16),(318,'더 보고싶은데 ㅜㅜ',0,'2021-03-25 18:20:02.446854',27,NULL,20),(319,'사진찍어',0,'2021-03-25 18:20:02.448312',27,NULL,19),(320,'아앙',0,'2021-03-25 18:20:02.449848',27,NULL,16),(321,'알람설정',0,'2021-03-25 18:20:02.451358',27,NULL,20),(322,'오귀엽',0,'2021-03-25 18:20:02.452985',27,NULL,17),(323,'오신기하다',0,'2021-03-25 18:20:02.454234',27,NULL,15),(324,'이거예뻐워',0,'2021-03-25 18:20:02.455881',27,NULL,16),(325,'잉?',0,'2021-03-25 18:20:02.457294',27,NULL,18),(326,'좋아요',0,'2021-03-25 18:20:02.458473',27,NULL,20),(327,'공부 열심히 하자',0,'2021-03-25 18:20:02.459809',28,NULL,16),(328,'귀여워',0,'2021-03-25 18:20:02.461125',28,NULL,16),(329,'귀엽다',0,'2021-03-25 18:20:02.462372',28,NULL,20),(330,'냠냠',0,'2021-03-25 18:20:02.463640',28,NULL,16),(331,'네',0,'2021-03-25 18:20:02.464771',28,NULL,19),(332,'모샃ㅁ겠다',0,'2021-03-25 18:20:02.465875',28,NULL,16),(333,'벌써 끝이라니',0,'2021-03-25 18:20:02.466951',28,NULL,20),(334,'브런치먹을사람?',0,'2021-03-25 18:20:02.468660',28,NULL,18),(335,'아니에요',0,'2021-03-25 18:20:02.475549',28,NULL,18),(336,'앞으로 더욱 친하게 지내요',0,'2021-03-25 18:20:02.478005',28,NULL,18),(337,'어피치',0,'2021-03-25 18:20:02.480268',28,NULL,16),(338,'우리와 같이살자',0,'2021-03-25 18:20:02.482621',28,NULL,19),(339,'좋네요',0,'2021-03-25 18:20:02.484428',28,NULL,16),(340,'같고싶다',0,'2021-03-25 18:20:02.486509',29,NULL,19),(341,'굳굳굳',0,'2021-03-25 18:20:02.488826',29,NULL,18),(342,'냠냠',0,'2021-03-25 18:20:02.490480',29,NULL,17),(343,'대박귀여워',0,'2021-03-25 18:20:02.491807',29,NULL,17),(344,'맛있겠다',0,'2021-03-25 18:20:02.493141',29,NULL,18),(345,'사고싶당',0,'2021-03-25 18:20:02.494420',29,NULL,16),(346,'사진찍어',0,'2021-03-25 18:20:02.495692',29,NULL,20),(347,'엄청 귀여워요',0,'2021-03-25 18:20:02.496924',29,NULL,20),(348,'오귀엽',0,'2021-03-25 18:20:02.498118',29,NULL,18),(349,'오신기하다',0,'2021-03-25 18:20:02.499297',29,NULL,16),(350,'이거예뻐워',0,'2021-03-25 18:20:02.500564',29,NULL,17),(351,'이벤트해주세요',0,'2021-03-25 18:20:02.501697',29,NULL,20),(352,'좋아요',0,'2021-03-25 18:20:02.503020',29,NULL,15),(353,'핵귀',0,'2021-03-25 18:20:02.504284',29,NULL,18),(354,'공부 열심히 하자',0,'2021-03-25 18:20:02.505529',30,NULL,17),(355,'구독',0,'2021-03-25 18:20:02.506760',30,NULL,15),(356,'귀엽다',0,'2021-03-25 18:20:02.507970',30,NULL,15),(357,'냠냠',0,'2021-03-25 18:20:02.509126',30,NULL,18),(358,'네',0,'2021-03-25 18:20:02.510260',30,NULL,20),(359,'더 보고싶은데 ㅜㅜ',0,'2021-03-25 18:20:02.511463',30,NULL,15),(360,'벌써 끝이라니',0,'2021-03-25 18:20:02.512629',30,NULL,15),(361,'브런치먹을사람?',0,'2021-03-25 18:20:02.513802',30,NULL,19),(362,'아니에요',0,'2021-03-25 18:20:02.514953',30,NULL,19),(363,'아앙',0,'2021-03-25 18:20:02.516069',30,NULL,17),(364,'알람설정',0,'2021-03-25 18:20:02.517170',30,NULL,15),(365,'앞으로 더욱 친하게 지내요',0,'2021-03-25 18:20:02.518456',30,NULL,19),(366,'우리와 같이살자',0,'2021-03-25 18:20:02.519687',30,NULL,20),(367,'잉?',0,'2021-03-25 18:20:02.520827',30,NULL,19),(368,'굳굳굳',0,'2021-03-25 18:20:02.522329',31,NULL,19),(369,'귀여워',0,'2021-03-25 18:20:02.523938',31,NULL,17),(370,'대박귀여워',0,'2021-03-25 18:20:02.525722',31,NULL,18),(371,'맛있겠다',0,'2021-03-25 18:20:02.527320',31,NULL,19),(372,'모샃ㅁ겠다',0,'2021-03-25 18:20:02.528755',31,NULL,17),(373,'사고싶당',0,'2021-03-25 18:20:02.529991',31,NULL,17),(374,'사진찍어',0,'2021-03-25 18:20:02.531166',31,NULL,15),(375,'어피치',0,'2021-03-25 18:20:02.532746',31,NULL,17),(376,'엄청 귀여워요',0,'2021-03-25 18:20:02.534313',31,NULL,15),(377,'오귀엽',0,'2021-03-25 18:20:02.535819',31,NULL,19),(378,'이거예뻐워',0,'2021-03-25 18:20:02.537078',31,NULL,18),(379,'이벤트해주세요',0,'2021-03-25 18:20:02.538302',31,NULL,15),(380,'좋네요',0,'2021-03-25 18:20:02.539614',31,NULL,17),(381,'핵귀',0,'2021-03-25 18:20:02.540768',31,NULL,19),(382,'같고싶다',0,'2021-03-25 18:20:02.541938',32,NULL,20),(383,'공부 열심히 하자',0,'2021-03-25 18:20:02.543158',32,NULL,18),(384,'구독',0,'2021-03-25 18:20:02.544317',32,NULL,16),(385,'냠냠',0,'2021-03-25 18:20:02.545469',32,NULL,19),(386,'네',0,'2021-03-25 18:20:02.546617',32,NULL,15),(387,'더 보고싶은데 ㅜㅜ',0,'2021-03-25 18:20:02.547668',32,NULL,16),(388,'벌써 끝이라니',0,'2021-03-25 18:20:02.548800',32,NULL,16),(389,'아니에요',0,'2021-03-25 18:20:02.550092',32,NULL,20),(390,'아앙',0,'2021-03-25 18:20:02.551192',32,NULL,18),(391,'알람설정',0,'2021-03-25 18:20:02.552267',32,NULL,16),(392,'앞으로 더욱 친하게 지내요',0,'2021-03-25 18:20:02.553356',32,NULL,20),(393,'오신기하다',0,'2021-03-25 18:20:02.554578',32,NULL,17),(394,'잉?',0,'2021-03-25 18:20:02.555666',32,NULL,20),(395,'좋아요',0,'2021-03-25 18:20:02.556720',32,NULL,16),(396,'굳굳굳',0,'2021-03-25 18:20:02.557981',33,NULL,20),(397,'귀여워',0,'2021-03-25 18:20:02.559074',33,NULL,18),(398,'귀엽다',0,'2021-03-25 18:20:02.560565',33,NULL,16),(399,'냠냠',0,'2021-03-25 18:20:02.561667',33,NULL,20),(400,'맛있겠다',0,'2021-03-25 18:20:02.562711',33,NULL,20),(401,'모샃ㅁ겠다',0,'2021-03-25 18:20:02.563778',33,NULL,18),(402,'브런치먹을사람?',0,'2021-03-25 18:20:02.565022',33,NULL,20),(403,'사고싶당',0,'2021-03-25 18:20:02.566102',33,NULL,18),(404,'어피치',0,'2021-03-25 18:20:02.567154',33,NULL,18),(405,'엄청 귀여워요',0,'2021-03-25 18:20:02.568221',33,NULL,16),(406,'우리와 같이살자',0,'2021-03-25 18:20:02.569274',33,NULL,15),(407,'이벤트해주세요',0,'2021-03-25 18:20:02.570311',33,NULL,16),(408,'좋네요',0,'2021-03-25 18:20:02.571326',33,NULL,18),(409,'핵귀',0,'2021-03-25 18:20:02.572470',33,NULL,20),(410,'같고싶다',0,'2021-03-25 18:20:02.573623',34,NULL,15),(411,'구독',0,'2021-03-25 18:20:02.574818',34,NULL,17),(412,'냠냠',0,'2021-03-25 18:20:02.575852',34,NULL,15),(413,'대박귀여워',0,'2021-03-25 18:20:02.576885',34,NULL,19),(414,'더 보고싶은데 ㅜㅜ',0,'2021-03-25 18:20:02.577916',34,NULL,17),(415,'사진찍어',0,'2021-03-25 18:20:02.578954',34,NULL,16),(416,'아앙',0,'2021-03-25 18:20:02.580003',34,NULL,19),(417,'알람설정',0,'2021-03-25 18:20:02.581054',34,NULL,17),(418,'오귀엽',0,'2021-03-25 18:20:02.582186',34,NULL,20),(419,'오신기하다',0,'2021-03-25 18:20:02.583274',34,NULL,18),(420,'이거예뻐워',0,'2021-03-25 18:20:02.584548',34,NULL,19),(421,'잉?',0,'2021-03-25 18:20:02.585742',34,NULL,15),(422,'좋아요',0,'2021-03-25 18:20:02.586782',34,NULL,17),(423,'공부 열심히 하자',0,'2021-03-25 18:20:02.587812',35,NULL,19),(424,'귀엽다',0,'2021-03-25 18:20:02.588908',35,NULL,17),(425,'냠냠',0,'2021-03-25 18:20:02.590001',35,NULL,16),(426,'네',0,'2021-03-25 18:20:02.591032',35,NULL,16),(427,'벌써 끝이라니',0,'2021-03-25 18:20:02.592104',35,NULL,17),(428,'브런치먹을사람?',0,'2021-03-25 18:20:02.593150',35,NULL,15),(429,'아니에요',0,'2021-03-25 18:20:02.594378',35,NULL,15),(430,'앞으로 더욱 친하게 지내요',0,'2021-03-25 18:20:02.595529',35,NULL,15),(431,'어피치',0,'2021-03-25 18:20:02.596522',35,NULL,19),(432,'우리와 같이살자',0,'2021-03-25 18:20:02.597556',35,NULL,16),(433,'굳굳굳',0,'2021-03-25 18:20:02.598589',36,NULL,15),(434,'귀여워',0,'2021-03-25 18:20:02.599637',36,NULL,19),(435,'대박귀여워',0,'2021-03-25 18:20:02.600712',36,NULL,20),(436,'맛있겠다',0,'2021-03-25 18:20:02.601753',36,NULL,15),(437,'모샃ㅁ겠다',0,'2021-03-25 18:20:02.602788',36,NULL,19),(438,'사고싶당',0,'2021-03-25 18:20:02.603781',36,NULL,19),(439,'사진찍어',0,'2021-03-25 18:20:02.605214',36,NULL,17),(440,'엄청 귀여워요',0,'2021-03-25 18:20:02.607102',36,NULL,17),(441,'오귀엽',0,'2021-03-25 18:20:02.609485',36,NULL,15),(442,'이벤트해주세요',0,'2021-03-25 18:20:02.611308',36,NULL,17),(443,'좋네요',0,'2021-03-25 18:20:02.613262',36,NULL,19),(444,'핵귀',0,'2021-03-25 18:20:02.615668',36,NULL,15),(445,'같고싶다',0,'2021-03-25 18:20:02.617547',37,NULL,16),(446,'구독',0,'2021-03-25 18:20:02.619509',37,NULL,18),(447,'냠냠',0,'2021-03-25 18:20:02.621407',37,NULL,17),(448,'더 보고싶은데 ㅜㅜ',0,'2021-03-25 18:20:02.622726',37,NULL,18),(449,'벌써 끝이라니',0,'2021-03-25 18:20:02.624294',37,NULL,18),(450,'아앙',0,'2021-03-25 18:20:02.626059',37,NULL,20),(451,'알람설정',0,'2021-03-25 18:20:02.627604',37,NULL,18),(452,'오신기하다',0,'2021-03-25 18:20:02.628820',37,NULL,19),(453,'이거예뻐워',0,'2021-03-25 18:20:02.630107',37,NULL,20),(454,'잉?',0,'2021-03-25 18:20:02.631237',37,NULL,16),(455,'좋아요',0,'2021-03-25 18:20:02.632616',37,NULL,18),(456,'공부 열심히 하자',0,'2021-03-25 18:20:02.633811',38,NULL,20),(457,'귀엽다',0,'2021-03-25 18:20:02.635078',38,NULL,18),(458,'냠냠',0,'2021-03-25 18:20:02.636333',38,NULL,18),(459,'네',0,'2021-03-25 18:20:02.637742',38,NULL,17),(460,'브런치먹을사람?',0,'2021-03-25 18:20:02.638987',38,NULL,16),(461,'아니에요',0,'2021-03-25 18:20:02.640155',38,NULL,16),(462,'앞으로 더욱 친하게 지내요',0,'2021-03-25 18:20:02.641372',38,NULL,16),(463,'어피치',0,'2021-03-25 18:20:02.642563',38,NULL,20),(464,'우리와 같이살자',0,'2021-03-25 18:20:02.643705',38,NULL,17),(465,'굳굳굳',0,'2021-03-25 18:20:02.644777',39,NULL,16),(466,'귀여워',0,'2021-03-25 18:20:02.645843',39,NULL,20),(467,'맛있겠다',0,'2021-03-25 18:20:02.647126',39,NULL,16),(468,'모샃ㅁ겠다',0,'2021-03-25 18:20:02.648290',39,NULL,20),(469,'사고싶당',0,'2021-03-25 18:20:02.649337',39,NULL,20),(470,'엄청 귀여워요',0,'2021-03-25 18:20:02.650388',39,NULL,18),(471,'이벤트해주세요',0,'2021-03-25 18:20:02.651439',39,NULL,18),(472,'좋네요',0,'2021-03-25 18:20:02.652467',39,NULL,20),(473,'핵귀',0,'2021-03-25 18:20:02.653498',39,NULL,16),(474,'같고싶다',0,'2021-03-25 18:20:02.654726',40,NULL,17),(475,'구독',0,'2021-03-25 18:20:02.655761',40,NULL,19),(476,'냠냠',0,'2021-03-25 18:20:02.656801',40,NULL,19),(477,'대박귀여워',0,'2021-03-25 18:20:02.657813',40,NULL,15),(478,'더 보고싶은데 ㅜㅜ',0,'2021-03-25 18:20:02.658965',40,NULL,19),(479,'사진찍어',0,'2021-03-25 18:20:02.660033',40,NULL,18),(480,'알람설정',0,'2021-03-25 18:20:02.661067',40,NULL,19),(481,'오귀엽',0,'2021-03-25 18:20:02.662097',40,NULL,16),(482,'오신기하다',0,'2021-03-25 18:20:02.663129',40,NULL,20),(483,'이거예뻐워',0,'2021-03-25 18:20:02.664110',40,NULL,15),(484,'잉?',0,'2021-03-25 18:20:02.665105',40,NULL,17),(485,'좋아요',0,'2021-03-25 18:20:02.666092',40,NULL,19),(486,'공부 열심히 하자',0,'2021-03-25 18:20:02.667056',41,NULL,15),(487,'귀여워',0,'2021-03-25 18:20:02.668212',41,NULL,15),(488,'귀엽다',0,'2021-03-25 18:20:02.669233',41,NULL,19),(489,'냠냠',0,'2021-03-25 18:20:02.670219',41,NULL,20),(490,'네',0,'2021-03-25 18:20:02.671260',41,NULL,18),(491,'모샃ㅁ겠다',0,'2021-03-25 18:20:02.672265',41,NULL,15),(492,'벌써 끝이라니',0,'2021-03-25 18:20:02.673229',41,NULL,19),(493,'브런치먹을사람?',0,'2021-03-25 18:20:02.674457',41,NULL,17),(494,'아니에요',0,'2021-03-25 18:20:02.675786',41,NULL,17),(495,'아앙',0,'2021-03-25 18:20:02.676990',41,NULL,15),(496,'앞으로 더욱 친하게 지내요',0,'2021-03-25 18:20:02.678010',41,NULL,17),(497,'어피치',0,'2021-03-25 18:20:02.679152',41,NULL,15),(498,'우리와 같이살자',0,'2021-03-25 18:20:02.680146',41,NULL,18),(499,'좋네요',0,'2021-03-25 18:20:02.681129',41,NULL,15),(500,'같고싶다',0,'2021-03-25 18:20:02.682140',42,NULL,18),(501,'굳굳굳',0,'2021-03-25 18:20:02.683173',42,NULL,17),(502,'냠냠',0,'2021-03-25 18:20:02.684198',42,NULL,15),(503,'대박귀여워',0,'2021-03-25 18:20:02.685207',42,NULL,16),(504,'맛있겠다',0,'2021-03-25 18:20:02.686379',42,NULL,17),(505,'사고싶당',0,'2021-03-25 18:20:02.687390',42,NULL,15),(506,'사진찍어',0,'2021-03-25 18:20:02.688452',42,NULL,19),(507,'엄청 귀여워요',0,'2021-03-25 18:20:02.689461',42,NULL,19),(508,'오귀엽',0,'2021-03-25 18:20:02.690479',42,NULL,17),(509,'오신기하다',0,'2021-03-25 18:20:02.691555',42,NULL,15),(510,'이거예뻐워',0,'2021-03-25 18:20:02.692581',42,NULL,16),(511,'이벤트해주세요',0,'2021-03-25 18:20:02.693598',42,NULL,19),(512,'핵귀',0,'2021-03-25 18:20:02.694633',42,NULL,17),(513,'공부 열심히 하자',0,'2021-03-25 18:20:02.695687',43,NULL,16),(514,'구독',0,'2021-03-25 18:20:02.696878',43,NULL,20),(515,'냠냠',0,'2021-03-25 18:20:02.698014',43,NULL,16),(516,'네',0,'2021-03-25 18:20:02.698994',43,NULL,19),(517,'더 보고싶은데 ㅜㅜ',0,'2021-03-25 18:20:02.699982',43,NULL,20),(518,'벌써 끝이라니',0,'2021-03-25 18:20:02.701013',43,NULL,20),(519,'아니에요',0,'2021-03-25 18:20:02.702005',43,NULL,18),(520,'아앙',0,'2021-03-25 18:20:02.703017',43,NULL,16),(521,'알람설정',0,'2021-03-25 18:20:02.704008',43,NULL,20),(522,'앞으로 더욱 친하게 지내요',0,'2021-03-25 18:20:02.705028',43,NULL,18),(523,'우리와 같이살자',0,'2021-03-25 18:20:02.706091',43,NULL,19),(524,'잉?',0,'2021-03-25 18:20:02.707108',43,NULL,18),(525,'좋아요',0,'2021-03-25 18:20:02.708290',43,NULL,20),(526,'굳굳굳',0,'2021-03-25 18:20:02.709519',44,NULL,18),(527,'귀여워',0,'2021-03-25 18:20:02.710523',44,NULL,16),(528,'귀엽다',0,'2021-03-25 18:20:02.711570',44,NULL,20),(529,'맛있겠다',0,'2021-03-25 18:20:02.712560',44,NULL,18),(530,'모샃ㅁ겠다',0,'2021-03-25 18:20:02.713573',44,NULL,16),(531,'브런치먹을사람?',0,'2021-03-25 18:20:02.714571',44,NULL,18),(532,'사고싶당',0,'2021-03-25 18:20:02.715591',44,NULL,16),(533,'사진찍어',0,'2021-03-25 18:20:02.716638',44,NULL,20),(534,'어피치',0,'2021-03-25 18:20:02.717793',44,NULL,16),(535,'엄청 귀여워요',0,'2021-03-25 18:20:02.718775',44,NULL,20),(536,'이벤트해주세요',0,'2021-03-25 18:20:02.719775',44,NULL,20),(537,'좋네요',0,'2021-03-25 18:20:02.721016',44,NULL,16),(538,'핵귀',0,'2021-03-25 18:20:02.722083',44,NULL,18),(539,'같고싶다',0,'2021-03-25 18:20:02.723098',45,NULL,19),(540,'구독',0,'2021-03-25 18:20:02.724119',45,NULL,15),(541,'냠냠',0,'2021-03-25 18:20:02.725137',45,NULL,17),(542,'대박귀여워',0,'2021-03-25 18:20:02.726132',45,NULL,17),(543,'더 보고싶은데 ㅜㅜ',0,'2021-03-25 18:20:02.727165',45,NULL,15),(544,'알람설정',0,'2021-03-25 18:20:02.728375',45,NULL,15),(545,'오귀엽',0,'2021-03-25 18:20:02.729394',45,NULL,18),(546,'오신기하다',0,'2021-03-25 18:20:02.730394',45,NULL,16),(547,'이거예뻐워',0,'2021-03-25 18:20:02.731392',45,NULL,17),(548,'잉?',0,'2021-03-25 18:20:02.732398',45,NULL,19),(549,'좋아요',0,'2021-03-25 18:20:02.733471',45,NULL,15),(550,'공부 열심히 하자',0,'2021-03-25 18:20:02.734530',46,NULL,17),(551,'귀엽다',0,'2021-03-25 18:20:02.735558',46,NULL,15),(552,'냠냠',0,'2021-03-25 18:20:02.736714',46,NULL,18),(553,'네',0,'2021-03-25 18:20:02.737782',46,NULL,20),(554,'모샃ㅁ겠다',0,'2021-03-25 18:20:02.738846',46,NULL,17),(555,'벌써 끝이라니',0,'2021-03-25 18:20:02.739863',46,NULL,15),(556,'브런치먹을사람?',0,'2021-03-25 18:20:02.740928',46,NULL,19),(557,'아니에요',0,'2021-03-25 18:20:02.742007',46,NULL,19),(558,'아앙',0,'2021-03-25 18:20:02.743118',46,NULL,17),(559,'앞으로 더욱 친하게 지내요',0,'2021-03-25 18:20:02.744197',46,NULL,19),(560,'어피치',0,'2021-03-25 18:20:02.745254',46,NULL,17),(561,'우리와 같이살자',0,'2021-03-25 18:20:02.746300',46,NULL,20),(562,'굳굳굳',0,'2021-03-25 18:20:02.747380',47,NULL,19),(563,'귀여워',0,'2021-03-25 18:20:02.748555',47,NULL,17),(564,'대박귀여워',0,'2021-03-25 18:20:02.749602',47,NULL,18),(565,'맛있겠다',0,'2021-03-25 18:20:02.750645',47,NULL,19),(566,'사고싶당',0,'2021-03-25 18:20:02.751714',47,NULL,17),(567,'사진찍어',0,'2021-03-25 18:20:02.752765',47,NULL,15),(568,'엄청 귀여워요',0,'2021-03-25 18:20:02.753788',47,NULL,15),(569,'오귀엽',0,'2021-03-25 18:20:02.754836',47,NULL,19),(570,'이벤트해주세요',0,'2021-03-25 18:20:02.755870',47,NULL,15),(571,'좋네요',0,'2021-03-25 18:20:02.756901',47,NULL,17),(572,'핵귀',0,'2021-03-25 18:20:02.758117',47,NULL,19),(573,'같고싶다',0,'2021-03-25 18:20:02.759162',48,NULL,20),(574,'구독',0,'2021-03-25 18:20:02.760245',48,NULL,16),(575,'냠냠',0,'2021-03-25 18:20:02.761299',48,NULL,19),(576,'더 보고싶은데 ㅜㅜ',0,'2021-03-25 18:20:02.762320',48,NULL,16),(577,'알람설정',0,'2021-03-25 18:20:02.763328',48,NULL,16),(578,'오신기하다',0,'2021-03-25 18:20:02.764492',48,NULL,17),(579,'이거예뻐워',0,'2021-03-25 18:20:02.765887',48,NULL,18),(580,'잉?',0,'2021-03-25 18:20:02.767000',48,NULL,20),(581,'좋아요',0,'2021-03-25 18:20:02.768046',48,NULL,16),(582,'공부 열심히 하자',0,'2021-03-25 18:20:02.769282',49,NULL,18),(583,'귀엽다',0,'2021-03-25 18:20:02.770377',49,NULL,16),(584,'냠냠',0,'2021-03-25 18:20:02.771748',49,NULL,20),(585,'네',0,'2021-03-25 18:20:02.773553',49,NULL,15),(586,'벌써 끝이라니',0,'2021-03-25 18:20:02.775117',49,NULL,16),(587,'브런치먹을사람?',0,'2021-03-25 18:20:02.776515',49,NULL,20),(588,'아니에요',0,'2021-03-25 18:20:02.777792',49,NULL,20),(589,'아앙',0,'2021-03-25 18:20:02.779022',49,NULL,18),(590,'앞으로 더욱 친하게 지내요',0,'2021-03-25 18:20:02.780731',49,NULL,20),(591,'우리와 같이살자',0,'2021-03-25 18:20:02.782799',49,NULL,15),(592,'굳굳굳',0,'2021-03-25 18:20:02.784826',50,NULL,20),(593,'귀여워',0,'2021-03-25 18:20:02.786606',50,NULL,18),(594,'맛있겠다',0,'2021-03-25 18:20:02.788086',50,NULL,20),(595,'모샃ㅁ겠다',0,'2021-03-25 18:20:02.789406',50,NULL,18),(596,'사고싶당',0,'2021-03-25 18:20:02.790721',50,NULL,18),(597,'어피치',0,'2021-03-25 18:20:02.792194',50,NULL,18),(598,'엄청 귀여워요',0,'2021-03-25 18:20:02.793425',50,NULL,16),(599,'이벤트해주세요',0,'2021-03-25 18:20:02.794632',50,NULL,16),(600,'좋네요',0,'2021-03-25 18:20:02.795906',50,NULL,18),(601,'핵귀',0,'2021-03-25 18:20:02.797058',50,NULL,20),(602,'같고싶다',0,'2021-03-25 18:20:02.798150',51,NULL,15),(603,'구독',0,'2021-03-25 18:20:02.799242',51,NULL,17),(604,'냠냠',0,'2021-03-25 18:20:02.800339',51,NULL,15),(605,'대박귀여워',0,'2021-03-25 18:20:02.801477',51,NULL,19),(606,'사진찍어',0,'2021-03-25 18:20:02.802565',51,NULL,16),(607,'알람설정',0,'2021-03-25 18:20:02.803653',51,NULL,17),(608,'오귀엽',0,'2021-03-25 18:20:02.804767',51,NULL,20),(609,'오신기하다',0,'2021-03-25 18:20:02.806098',51,NULL,18),(610,'이거예뻐워',0,'2021-03-25 18:20:02.807326',51,NULL,19),(611,'좋아요',0,'2021-03-25 18:20:02.808371',51,NULL,17),(612,'공부 열심히 하자',0,'2021-03-25 18:20:02.809429',52,NULL,19),(613,'네',0,'2021-03-25 18:20:02.810502',52,NULL,16),(614,'더 보고싶은데 ㅜㅜ',0,'2021-03-25 18:20:02.811560',52,NULL,17),(615,'벌써 끝이라니',0,'2021-03-25 18:20:02.812631',52,NULL,17),(616,'아니에요',0,'2021-03-25 18:20:02.813698',52,NULL,15),(617,'아앙',0,'2021-03-25 18:20:02.814770',52,NULL,19),(618,'앞으로 더욱 친하게 지내요',0,'2021-03-25 18:20:02.815850',52,NULL,15),(619,'잉?',0,'2021-03-25 18:20:02.816948',52,NULL,15),(620,'굳굳굳',0,'2021-03-25 18:20:02.817970',53,NULL,15),(621,'귀여워',0,'2021-03-25 18:20:02.818997',53,NULL,19),(622,'귀엽다',0,'2021-03-25 18:20:02.820030',53,NULL,17),(623,'냠냠',0,'2021-03-25 18:20:02.821159',53,NULL,16),(624,'모샃ㅁ겠다',0,'2021-03-25 18:20:02.822271',53,NULL,19),(625,'브런치먹을사람?',0,'2021-03-25 18:20:02.823321',53,NULL,15),(626,'어피치',0,'2021-03-25 18:20:02.824385',53,NULL,19),(627,'엄청 귀여워요',0,'2021-03-25 18:20:02.825394',53,NULL,17),(628,'우리와 같이살자',0,'2021-03-25 18:20:02.826450',53,NULL,16),(629,'좋네요',0,'2021-03-25 18:20:02.827610',53,NULL,19),(630,'같고싶다',0,'2021-03-25 18:20:02.828723',54,NULL,16),(631,'냠냠',0,'2021-03-25 18:20:02.829977',54,NULL,17),(632,'대박귀여워',0,'2021-03-25 18:20:02.831208',54,NULL,20),(633,'맛있겠다',0,'2021-03-25 18:20:02.832331',54,NULL,15),(634,'사고싶당',0,'2021-03-25 18:20:02.833434',54,NULL,19),(635,'사진찍어',0,'2021-03-25 18:20:02.834515',54,NULL,17),(636,'오귀엽',0,'2021-03-25 18:20:02.835719',54,NULL,15),(637,'이거예뻐워',0,'2021-03-25 18:20:02.836811',54,NULL,20),(638,'이벤트해주세요',0,'2021-03-25 18:20:02.838090',54,NULL,17),(639,'핵귀',0,'2021-03-25 18:20:02.839257',54,NULL,15),(640,'공부 열심히 하자',0,'2021-03-25 18:20:02.840337',55,NULL,20),(641,'구독',0,'2021-03-25 18:20:02.841647',55,NULL,18),(642,'더 보고싶은데 ㅜㅜ',0,'2021-03-25 18:20:02.843019',55,NULL,18),(643,'벌써 끝이라니',0,'2021-03-25 18:20:02.844121',55,NULL,18),(644,'아앙',0,'2021-03-25 18:20:02.845164',55,NULL,20),(645,'알람설정',0,'2021-03-25 18:20:02.846383',55,NULL,18),(646,'앞으로 더욱 친하게 지내요',0,'2021-03-25 18:20:02.847420',55,NULL,16),(647,'오신기하다',0,'2021-03-25 18:20:02.848463',55,NULL,19),(648,'잉?',0,'2021-03-25 18:20:02.849724',55,NULL,16),(649,'좋아요',0,'2021-03-25 18:20:02.850816',55,NULL,18),(650,'굳굳굳',0,'2021-03-25 18:20:02.851898',56,NULL,16),(651,'귀여워',0,'2021-03-25 18:20:02.852965',56,NULL,20),(652,'귀엽다',0,'2021-03-25 18:20:02.854087',56,NULL,18),(653,'냠냠',0,'2021-03-25 18:20:02.855201',56,NULL,18),(654,'네',0,'2021-03-25 18:20:02.856253',56,NULL,17),(655,'모샃ㅁ겠다',0,'2021-03-25 18:20:02.857304',56,NULL,20),(656,'브런치먹을사람?',0,'2021-03-25 18:20:02.858327',56,NULL,16),(657,'아니에요',0,'2021-03-25 18:20:02.859516',56,NULL,16),(658,'어피치',0,'2021-03-25 18:20:02.860540',56,NULL,20),(659,'우리와 같이살자',0,'2021-03-25 18:20:02.861555',56,NULL,17),(660,'좋네요',0,'2021-03-25 18:20:02.862646',56,NULL,20),(661,'같고싶다',0,'2021-03-25 18:20:02.863708',57,NULL,17),(662,'대박귀여워',0,'2021-03-25 18:20:02.865143',57,NULL,15),(663,'맛있겠다',0,'2021-03-25 18:20:02.866361',57,NULL,16),(664,'사고싶당',0,'2021-03-25 18:20:02.867498',57,NULL,20),(665,'사진찍어',0,'2021-03-25 18:20:02.868570',57,NULL,18),(666,'엄청 귀여워요',0,'2021-03-25 18:20:02.869846',57,NULL,18),(667,'오귀엽',0,'2021-03-25 18:20:02.870885',57,NULL,16),(668,'이거예뻐워',0,'2021-03-25 18:20:02.871974',57,NULL,15),(669,'이벤트해주세요',0,'2021-03-25 18:20:02.873055',57,NULL,18),(670,'핵귀',0,'2021-03-25 18:20:02.874163',57,NULL,16),(671,'공부 열심히 하자',0,'2021-03-25 18:20:02.875253',58,NULL,15),(672,'구독',0,'2021-03-25 18:20:02.876280',58,NULL,19),(673,'냠냠',0,'2021-03-25 18:20:02.877307',58,NULL,19),(674,'더 보고싶은데 ㅜㅜ',0,'2021-03-25 18:20:02.878309',58,NULL,19),(675,'벌써 끝이라니',0,'2021-03-25 18:20:02.879371',58,NULL,19),(676,'아앙',0,'2021-03-25 18:20:02.880536',58,NULL,15),(677,'알람설정',0,'2021-03-25 18:20:02.881571',58,NULL,19),(678,'오신기하다',0,'2021-03-25 18:20:02.882595',58,NULL,20),(679,'잉?',0,'2021-03-25 18:20:02.883666',58,NULL,17),(680,'좋아요',0,'2021-03-25 18:20:02.885325',58,NULL,19),(681,'귀여워',0,'2021-03-25 18:20:02.887238',59,NULL,15),(682,'귀엽다',0,'2021-03-25 18:20:02.889210',59,NULL,19),(683,'냠냠',0,'2021-03-25 18:20:02.890632',59,NULL,20),(684,'네',0,'2021-03-25 18:20:02.891847',59,NULL,18),(685,'모샃ㅁ겠다',0,'2021-03-25 18:20:02.893657',59,NULL,15),(686,'브런치먹을사람?',0,'2021-03-25 18:20:02.894791',59,NULL,17),(687,'아니에요',0,'2021-03-25 18:20:02.896008',59,NULL,17),(688,'앞으로 더욱 친하게 지내요',0,'2021-03-25 18:20:02.897148',59,NULL,17),(689,'어피치',0,'2021-03-25 18:20:02.898171',59,NULL,15),(690,'우리와 같이살자',0,'2021-03-25 18:20:02.899363',59,NULL,18);
/*!40000 ALTER TABLE `replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply_likes`
--

DROP TABLE IF EXISTS `reply_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply_likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reply_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reply_likes_reply_id_752d0176_fk_replies_id` (`reply_id`),
  KEY `reply_likes_user_id_cddae393_fk_users_id` (`user_id`),
  CONSTRAINT `reply_likes_reply_id_752d0176_fk_replies_id` FOREIGN KEY (`reply_id`) REFERENCES `replies` (`id`),
  CONSTRAINT `reply_likes_user_id_cddae393_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply_likes`
--

LOCK TABLES `reply_likes` WRITE;
/*!40000 ALTER TABLE `reply_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `reply_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_likes`
--

DROP TABLE IF EXISTS `review_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `review_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `review_likes_review_id_5eb31dcf_fk_reviews_id` (`review_id`),
  KEY `review_likes_user_id_fea3a517_fk_users_id` (`user_id`),
  CONSTRAINT `review_likes_review_id_5eb31dcf_fk_reviews_id` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`),
  CONSTRAINT `review_likes_user_id_fea3a517_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_likes`
--

LOCK TABLES `review_likes` WRITE;
/*!40000 ALTER TABLE `review_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rating` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `like_count` int NOT NULL,
  `content` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_product_id_d4b78cfe_fk_products_id` (`product_id`),
  KEY `reviews_user_id_c23b0903_fk_users_id` (`user_id`),
  CONSTRAINT `reviews_product_id_d4b78cfe_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `reviews_user_id_c23b0903_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,5,'2021-03-25 18:26:05.699465',0,'좋아요',1,15),(2,4,'2021-03-25 18:26:05.703272',0,'최고에요',1,16),(3,3,'2021-03-25 18:26:05.705302',0,'그저그래요',1,17),(4,5,'2021-03-25 18:26:05.707291',0,'짱이에요',1,18),(5,3,'2021-03-25 18:26:05.708952',0,'쏘쏘',1,19),(6,4,'2021-03-25 18:26:05.710324',0,'짱짱맨',1,20),(7,2,'2021-03-25 18:26:05.711580',0,'구려요',1,15),(8,4,'2021-03-25 18:26:05.712847',0,'나이스',1,16),(9,5,'2021-03-25 18:26:05.714118',0,'퍼펙트',1,17),(10,5,'2021-03-25 18:26:05.715250',0,'아주좋아요',1,18),(11,5,'2021-03-25 18:26:05.716511',0,'좋아요',1,19),(12,4,'2021-03-25 18:26:05.717601',0,'최고에요',1,20),(13,3,'2021-03-25 18:26:05.718831',0,'그저그래요',2,15),(14,5,'2021-03-25 18:26:05.720111',0,'짱이에요',2,16),(15,3,'2021-03-25 18:26:05.721337',0,'쏘쏘',2,17),(16,4,'2021-03-25 18:26:05.722476',0,'짱짱맨',2,18),(17,2,'2021-03-25 18:26:05.723590',0,'구려요',2,19),(18,4,'2021-03-25 18:26:05.724662',0,'나이스',2,20),(19,5,'2021-03-25 18:26:05.725678',0,'퍼펙트',2,15),(20,5,'2021-03-25 18:26:05.726828',0,'아주좋아요',2,16),(21,5,'2021-03-25 18:26:05.727983',0,'좋아요',2,17),(22,4,'2021-03-25 18:26:05.729060',0,'최고에요',2,18),(23,3,'2021-03-25 18:26:05.730155',0,'그저그래요',3,19),(24,5,'2021-03-25 18:26:05.731213',0,'짱이에요',3,20),(25,3,'2021-03-25 18:26:05.732202',0,'쏘쏘',3,15),(26,4,'2021-03-25 18:26:05.733228',0,'짱짱맨',3,16),(27,2,'2021-03-25 18:26:05.734275',0,'구려요',3,17),(28,4,'2021-03-25 18:26:05.735474',0,'나이스',3,18),(29,5,'2021-03-25 18:26:05.736556',0,'퍼펙트',3,19),(30,5,'2021-03-25 18:26:05.737685',0,'아주좋아요',3,20),(31,5,'2021-03-25 18:26:05.738695',0,'좋아요',4,15),(32,4,'2021-03-25 18:26:05.739688',0,'최고에요',4,16),(33,3,'2021-03-25 18:26:05.740676',0,'그저그래요',4,17),(34,5,'2021-03-25 18:26:05.741689',0,'짱이에요',4,18),(35,3,'2021-03-25 18:26:05.742729',0,'쏘쏘',4,19),(36,4,'2021-03-25 18:26:05.743733',0,'짱짱맨',4,20),(37,2,'2021-03-25 18:26:05.744793',0,'구려요',5,15),(38,4,'2021-03-25 18:26:05.745839',0,'나이스',5,16),(39,5,'2021-03-25 18:26:05.746879',0,'퍼펙트',5,17),(40,5,'2021-03-25 18:26:05.747895',0,'아주좋아요',5,18),(41,5,'2021-03-25 18:26:05.749075',0,'좋아요',5,19),(42,4,'2021-03-25 18:26:05.750507',0,'최고에요',6,20),(43,3,'2021-03-25 18:26:05.751645',0,'그저그래요',6,15),(44,5,'2021-03-25 18:26:05.752685',0,'짱이에요',6,16),(45,3,'2021-03-25 18:26:05.753699',0,'쏘쏘',6,17),(46,4,'2021-03-25 18:26:05.754687',0,'짱짱맨',6,18),(47,2,'2021-03-25 18:26:05.755677',0,'구려요',7,19),(48,4,'2021-03-25 18:26:05.756683',0,'나이스',7,20),(49,5,'2021-03-25 18:26:05.757672',0,'퍼펙트',7,15),(50,5,'2021-03-25 18:26:05.758643',0,'아주좋아요',7,16),(51,5,'2021-03-25 18:26:05.759850',0,'좋아요',7,17),(52,4,'2021-03-25 18:26:05.760854',0,'최고에요',8,18),(53,3,'2021-03-25 18:26:05.761865',0,'그저그래요',8,19),(54,5,'2021-03-25 18:26:05.762870',0,'짱이에요',8,20),(55,3,'2021-03-25 18:26:05.763870',0,'쏘쏘',8,15),(56,4,'2021-03-25 18:26:05.764902',0,'짱짱맨',8,16),(57,2,'2021-03-25 18:26:05.766179',0,'구려요',9,17),(58,4,'2021-03-25 18:26:05.767260',0,'나이스',9,18),(59,5,'2021-03-25 18:26:05.768286',0,'퍼펙트',9,19),(60,5,'2021-03-25 18:26:05.769295',0,'아주좋아요',9,20),(61,5,'2021-03-25 18:26:05.770484',0,'좋아요',9,15),(62,4,'2021-03-25 18:26:05.771565',0,'최고에요',10,16),(63,3,'2021-03-25 18:26:05.772897',0,'그저그래요',10,17),(64,5,'2021-03-25 18:26:05.773957',0,'짱이에요',11,18),(65,3,'2021-03-25 18:26:05.774995',0,'쏘쏘',11,19),(66,4,'2021-03-25 18:26:05.776065',0,'짱짱맨',11,20),(67,2,'2021-03-25 18:26:05.777076',0,'구려요',11,15),(68,4,'2021-03-25 18:26:05.778092',0,'나이스',11,16),(69,5,'2021-03-25 18:26:05.779108',0,'퍼펙트',12,17),(70,5,'2021-03-25 18:26:05.780175',0,'아주좋아요',12,18),(71,5,'2021-03-25 18:26:05.781340',0,'좋아요',12,19),(72,4,'2021-03-25 18:26:05.782386',0,'최고에요',12,20),(73,3,'2021-03-25 18:26:05.783388',0,'그저그래요',13,15),(74,5,'2021-03-25 18:26:05.784435',0,'짱이에요',13,16),(75,3,'2021-03-25 18:26:05.785493',0,'쏘쏘',13,17),(76,4,'2021-03-25 18:26:05.786711',0,'짱짱맨',13,18),(77,2,'2021-03-25 18:26:05.787787',0,'구려요',13,19),(78,4,'2021-03-25 18:26:05.788792',0,'나이스',14,20),(79,5,'2021-03-25 18:26:05.789794',0,'퍼펙트',14,15),(80,5,'2021-03-25 18:26:05.790810',0,'아주좋아요',14,16),(81,5,'2021-03-25 18:26:05.791960',0,'좋아요',14,17),(82,4,'2021-03-25 18:26:05.793000',0,'최고에요',15,18),(83,3,'2021-03-25 18:26:05.794004',0,'그저그래요',15,19),(84,5,'2021-03-25 18:26:05.795037',0,'짱이에요',15,20),(85,3,'2021-03-25 18:26:05.796042',0,'쏘쏘',16,15),(86,4,'2021-03-25 18:26:05.797086',0,'짱짱맨',16,16),(87,2,'2021-03-25 18:26:05.798102',0,'구려요',16,17),(88,4,'2021-03-25 18:26:05.799077',0,'나이스',16,18),(89,5,'2021-03-25 18:26:05.800112',0,'퍼펙트',17,19),(90,5,'2021-03-25 18:26:05.801181',0,'아주좋아요',17,20),(91,5,'2021-03-25 18:26:05.802194',0,'좋아요',17,15),(92,4,'2021-03-25 18:26:05.803184',0,'최고에요',17,16),(93,3,'2021-03-25 18:26:05.804425',0,'그저그래요',17,17),(94,5,'2021-03-25 18:26:05.805438',0,'짱이에요',17,18),(95,3,'2021-03-25 18:26:05.806445',0,'쏘쏘',18,19),(96,4,'2021-03-25 18:26:05.807457',0,'짱짱맨',18,20),(97,2,'2021-03-25 18:26:05.808444',0,'구려요',18,15),(98,4,'2021-03-25 18:26:05.809439',0,'나이스',18,16),(99,5,'2021-03-25 18:26:05.810416',0,'퍼펙트',19,17),(100,5,'2021-03-25 18:26:05.811454',0,'아주좋아요',19,18),(101,5,'2021-03-25 18:26:05.812602',0,'좋아요',20,19),(102,4,'2021-03-25 18:26:05.813617',0,'최고에요',20,20),(103,3,'2021-03-25 18:26:05.814634',0,'그저그래요',20,15),(104,5,'2021-03-25 18:26:05.815664',0,'짱이에요',21,16),(105,3,'2021-03-25 18:26:05.816690',0,'쏘쏘',21,17),(106,4,'2021-03-25 18:26:05.817727',0,'짱짱맨',21,18),(107,2,'2021-03-25 18:26:05.818703',0,'구려요',23,19),(108,4,'2021-03-25 18:26:05.819731',0,'나이스',23,20),(109,5,'2021-03-25 18:26:05.820767',0,'퍼펙트',23,15),(110,5,'2021-03-25 18:26:05.821903',0,'아주좋아요',23,16),(111,5,'2021-03-25 18:26:05.822990',0,'좋아요',23,17),(112,4,'2021-03-25 18:26:05.824165',0,'최고에요',24,18),(113,3,'2021-03-25 18:26:05.825219',0,'그저그래요',24,19),(114,5,'2021-03-25 18:26:05.826256',0,'짱이에요',24,20),(115,3,'2021-03-25 18:26:05.827304',0,'쏘쏘',24,15),(116,4,'2021-03-25 18:26:05.828367',0,'짱짱맨',25,16),(117,2,'2021-03-25 18:26:05.829407',0,'구려요',25,17),(118,4,'2021-03-25 18:26:05.830453',0,'나이스',25,18),(119,5,'2021-03-25 18:26:05.831487',0,'퍼펙트',26,19),(120,5,'2021-03-25 18:26:05.832490',0,'아주좋아요',26,20),(121,5,'2021-03-25 18:26:05.833571',0,'좋아요',26,15),(122,4,'2021-03-25 18:26:05.834771',0,'최고에요',27,16),(123,3,'2021-03-25 18:26:05.835826',0,'그저그래요',28,17),(124,5,'2021-03-25 18:26:05.836952',0,'짱이에요',28,18),(125,3,'2021-03-25 18:26:05.838030',0,'쏘쏘',28,19),(126,4,'2021-03-25 18:26:05.839054',0,'짱짱맨',28,20),(127,2,'2021-03-25 18:26:05.840098',0,'구려요',27,15),(128,4,'2021-03-25 18:26:05.841107',0,'나이스',29,16),(129,5,'2021-03-25 18:26:05.842097',0,'퍼펙트',29,17),(130,5,'2021-03-25 18:26:05.843085',0,'아주좋아요',29,18),(131,5,'2021-03-25 18:26:05.844111',0,'좋아요',30,19),(132,4,'2021-03-25 18:26:05.845292',0,'최고에요',30,20),(133,3,'2021-03-25 18:26:05.846533',0,'그저그래요',30,15),(134,5,'2021-03-25 18:26:05.847608',0,'짱이에요',30,16),(135,3,'2021-03-25 18:26:05.848650',0,'쏘쏘',31,17),(136,4,'2021-03-25 18:26:05.849795',0,'짱짱맨',31,18),(137,2,'2021-03-25 18:26:05.850848',0,'구려요',31,19),(138,4,'2021-03-25 18:26:05.851883',0,'나이스',32,20),(139,5,'2021-03-25 18:26:05.853014',0,'퍼펙트',32,15),(140,5,'2021-03-25 18:26:05.854149',0,'아주좋아요',32,16),(141,5,'2021-03-25 18:26:05.855247',0,'좋아요',33,17),(142,4,'2021-03-25 18:26:05.856457',0,'최고에요',33,18),(143,3,'2021-03-25 18:26:05.857482',0,'그저그래요',33,19),(144,5,'2021-03-25 18:26:05.858551',0,'짱이에요',33,20),(145,3,'2021-03-25 18:26:05.859636',0,'쏘쏘',33,15),(146,4,'2021-03-25 18:26:05.860707',0,'짱짱맨',33,16),(147,2,'2021-03-25 18:26:05.862067',0,'구려요',34,17),(148,4,'2021-03-25 18:26:05.863168',0,'나이스',34,18),(149,5,'2021-03-25 18:26:05.864173',0,'퍼펙트',34,19),(150,5,'2021-03-25 18:26:05.865245',0,'아주좋아요',35,20),(151,5,'2021-03-25 18:26:05.866303',0,'좋아요',35,15),(152,4,'2021-03-25 18:26:05.867418',0,'최고에요',35,16),(153,3,'2021-03-25 18:26:05.868476',0,'그저그래요',35,17),(154,5,'2021-03-25 18:26:05.869502',0,'짱이에요',36,18),(155,3,'2021-03-25 18:26:05.870521',0,'쏘쏘',36,19),(156,4,'2021-03-25 18:26:05.871548',0,'짱짱맨',36,20),(157,2,'2021-03-25 18:26:05.872576',0,'구려요',36,15),(158,4,'2021-03-25 18:26:05.873564',0,'나이스',36,16),(159,5,'2021-03-25 18:26:05.874523',0,'퍼펙트',37,17),(160,5,'2021-03-25 18:26:05.875570',0,'아주좋아요',37,18),(161,5,'2021-03-25 18:26:05.876608',0,'좋아요',37,19),(162,4,'2021-03-25 18:26:05.877759',0,'최고에요',37,20),(163,3,'2021-03-25 18:26:05.878738',0,'그저그래요',37,15),(164,5,'2021-03-25 18:26:05.879723',0,'짱이에요',38,16),(165,3,'2021-03-25 18:26:05.880708',0,'쏘쏘',38,17),(166,4,'2021-03-25 18:26:05.881722',0,'짱짱맨',38,18),(167,2,'2021-03-25 18:26:05.882719',0,'구려요',38,19),(168,4,'2021-03-25 18:26:05.883699',0,'나이스',38,20),(169,5,'2021-03-25 18:26:05.884688',0,'퍼펙트',38,15),(170,5,'2021-03-25 18:26:05.885689',0,'아주좋아요',38,16),(171,5,'2021-03-25 18:26:05.886738',0,'좋아요',39,17),(172,4,'2021-03-25 18:26:05.887860',0,'최고에요',39,18),(173,3,'2021-03-25 18:26:05.888823',0,'그저그래요',39,19),(174,5,'2021-03-25 18:26:05.889848',0,'짱이에요',39,20),(175,3,'2021-03-25 18:26:05.890895',0,'쏘쏘',40,15),(176,4,'2021-03-25 18:26:05.892154',0,'짱짱맨',40,16),(177,2,'2021-03-25 18:26:05.893190',0,'구려요',40,17),(178,4,'2021-03-25 18:26:05.894174',0,'나이스',41,18),(179,5,'2021-03-25 18:26:05.895222',0,'퍼펙트',41,19),(180,5,'2021-03-25 18:26:05.896267',0,'아주좋아요',41,20),(181,5,'2021-03-25 18:26:05.897491',0,'좋아요',41,15),(182,4,'2021-03-25 18:26:05.898472',0,'최고에요',42,16),(183,3,'2021-03-25 18:26:05.899627',0,'그저그래요',42,17),(184,5,'2021-03-25 18:26:05.900627',0,'짱이에요',42,18),(185,3,'2021-03-25 18:26:05.901667',0,'쏘쏘',42,19),(186,4,'2021-03-25 18:26:05.902655',0,'짱짱맨',43,20),(187,2,'2021-03-25 18:26:05.903657',0,'구려요',43,15),(188,4,'2021-03-25 18:26:05.904663',0,'나이스',43,16),(189,5,'2021-03-25 18:26:05.905645',0,'퍼펙트',43,17),(190,5,'2021-03-25 18:26:05.906602',0,'아주좋아요',44,18),(191,5,'2021-03-25 18:26:05.907559',0,'좋아요',44,19),(192,4,'2021-03-25 18:26:05.908563',0,'최고에요',44,20),(193,3,'2021-03-25 18:26:05.909704',0,'그저그래요',45,15),(194,5,'2021-03-25 18:26:05.910694',0,'짱이에요',45,16),(195,3,'2021-03-25 18:26:05.911720',0,'쏘쏘',46,17),(196,4,'2021-03-25 18:26:05.912724',0,'짱짱맨',46,18),(197,2,'2021-03-25 18:26:05.913671',0,'구려요',46,19),(198,4,'2021-03-25 18:26:05.914652',0,'나이스',47,20),(199,5,'2021-03-25 18:26:05.915746',0,'퍼펙트',47,15),(200,5,'2021-03-25 18:26:05.917033',0,'아주좋아요',47,16),(201,5,'2021-03-25 18:26:05.918055',0,'좋아요',47,17),(202,4,'2021-03-25 18:26:05.919094',0,'최고에요',48,18),(203,3,'2021-03-25 18:26:05.920249',0,'그저그래요',48,19),(204,5,'2021-03-25 18:26:05.921289',0,'짱이에요',48,20),(205,3,'2021-03-25 18:26:05.922297',0,'쏘쏘',48,15),(206,4,'2021-03-25 18:26:05.923309',0,'짱짱맨',49,16),(207,2,'2021-03-25 18:26:05.924334',0,'구려요',49,17),(208,4,'2021-03-25 18:26:05.925363',0,'나이스',49,18),(209,5,'2021-03-25 18:26:05.926614',0,'퍼펙트',50,19),(210,5,'2021-03-25 18:26:05.927606',0,'아주좋아요',50,20),(211,5,'2021-03-25 18:26:05.928663',0,'좋아요',50,15),(212,4,'2021-03-25 18:26:05.929708',0,'최고에요',51,16),(213,3,'2021-03-25 18:26:05.930834',0,'그저그래요',51,17),(214,5,'2021-03-25 18:26:05.931843',0,'짱이에요',51,18),(215,3,'2021-03-25 18:26:05.932856',0,'쏘쏘',52,19),(216,4,'2021-03-25 18:26:05.933820',0,'짱짱맨',52,20),(217,2,'2021-03-25 18:26:05.934823',0,'구려요',53,15),(218,4,'2021-03-25 18:26:05.935801',0,'나이스',53,16),(219,5,'2021-03-25 18:26:05.936829',0,'퍼펙트',53,17),(220,5,'2021-03-25 18:26:05.937774',0,'아주좋아요',54,18),(221,5,'2021-03-25 18:26:05.938737',0,'좋아요',54,19),(222,4,'2021-03-25 18:26:05.939752',0,'최고에요',55,20),(223,3,'2021-03-25 18:26:05.940895',0,'그저그래요',55,15),(224,5,'2021-03-25 18:26:05.941880',0,'짱이에요',55,16),(225,3,'2021-03-25 18:26:05.942882',0,'쏘쏘',55,17),(226,4,'2021-03-25 18:26:05.943859',0,'짱짱맨',56,18),(227,2,'2021-03-25 18:26:05.944871',0,'구려요',56,19),(228,4,'2021-03-25 18:26:05.945898',0,'나이스',56,20),(229,5,'2021-03-25 18:26:05.946936',0,'퍼펙트',57,15),(230,5,'2021-03-25 18:26:05.947948',0,'아주좋아요',57,16),(231,5,'2021-03-25 18:26:05.948953',0,'좋아요',57,17),(232,4,'2021-03-25 18:26:05.949973',0,'최고에요',57,18),(233,3,'2021-03-25 18:26:05.951094',0,'그저그래요',58,19),(234,5,'2021-03-25 18:26:05.952096',0,'짱이에요',58,20),(235,3,'2021-03-25 18:26:05.953052',0,'쏘쏘',58,15),(236,4,'2021-03-25 18:26:05.954002',0,'짱짱맨',58,16),(237,2,'2021-03-25 18:26:05.955000',0,'구려요',59,17),(238,4,'2021-03-25 18:26:05.955978',0,'나이스',59,18),(239,5,'2021-03-25 18:26:05.956978',0,'퍼펙트',59,19),(240,5,'2021-03-25 18:26:05.957947',0,'아주좋아요',59,20),(241,5,'2021-03-25 18:26:05.958966',0,'좋아요',60,15),(242,4,'2021-03-25 18:26:05.959973',0,'최고에요',60,16),(243,3,'2021-03-25 18:26:05.961141',0,'그저그래요',60,17),(244,5,'2021-03-25 18:26:05.962114',0,'짱이에요',61,18),(245,3,'2021-03-25 18:26:05.963134',0,'쏘쏘',61,19),(246,4,'2021-03-25 18:26:05.964149',0,'짱짱맨',61,20),(247,2,'2021-03-25 18:26:05.965175',0,'구려요',61,15),(248,4,'2021-03-25 18:26:05.966190',0,'나이스',61,16),(249,5,'2021-03-25 18:26:05.967160',0,'퍼펙트',62,17),(250,5,'2021-03-25 18:26:05.968136',0,'아주좋아요',62,18),(251,5,'2021-03-25 18:26:05.969126',0,'좋아요',62,19),(252,4,'2021-03-25 18:26:05.970168',0,'최고에요',62,20),(253,3,'2021-03-25 18:26:05.971291',0,'그저그래요',63,15),(254,5,'2021-03-25 18:26:05.972264',0,'짱이에요',63,16),(255,3,'2021-03-25 18:26:05.973235',0,'쏘쏘',63,17),(256,4,'2021-03-25 18:26:05.974203',0,'짱짱맨',63,18),(257,2,'2021-03-25 18:26:05.975164',0,'구려요',44,19),(258,4,'2021-03-25 18:26:05.976153',0,'나이스',47,20),(259,5,'2021-03-25 18:26:05.977092',0,'퍼펙트',27,15),(260,5,'2021-03-25 18:26:05.979857',0,'아주좋아요',27,16),(261,5,'2021-03-25 18:26:05.981010',0,'좋아요',29,17),(262,4,'2021-03-25 18:26:05.982035',0,'최고에요',25,18);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `condition` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `sub_categories_category_id_dc42080e_fk_categories_id` (`category_id`),
  CONSTRAINT `sub_categories_category_id_dc42080e_fk_categories_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categories`
--

LOCK TABLES `sub_categories` WRITE;
/*!40000 ALTER TABLE `sub_categories` DISABLE KEYS */;
INSERT INTO `sub_categories` VALUES (1,'피치피치X에스더버니',1),(2,'러블리 어피치',1),(3,'얌얌프렌즈',1),(4,'레몬테라스',1),(5,'베이비드리밍',1),(6,'해피위크',1),(7,'강다니엘 에디션',1),(8,'미니인형',2),(9,'중형인형',2),(10,'대형인형',2),(11,'키체인인형',2),(12,'피규어/브릭',2),(13,'쿠션/방석',3),(14,'컵/텀블러',3),(15,'주방용품',3),(16,'미용/욕실용품',3),(17,'생활소품/잡화',3),(18,'탈취/방향제',3),(19,'신발',4),(20,'파우치/지갑/가방',4),(21,'패션소품',4),(22,'우산',4),(23,'시즌잡화',4),(24,'필기구',5),(25,'필통/케이스',5),(26,'노트/메모',5),(27,'파일',5),(28,'스티커',5),(29,'데스크 소품',5),(30,'카드/엽서',5),(31,'여성복',6),(32,'남성복',6),(33,'양말',6),(34,'여성잠옷',7),(35,'남성잠옷',7),(36,'키즈',7),(37,'여행',8),(38,'레져',8),(39,'노트북 액세서리',9),(40,'소형 전자',9),(41,'에어팟 케이스',9),(42,'에어팟 액세서리',9),(43,'휴대폰 케이스',10),(44,'휴대폰 액세서리',10),(45,'충전기',10),(46,'스낵',11),(47,'음료',11);
/*!40000 ALTER TABLE `sub_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `status_id` int DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  `credit_card_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_address_id_00bad6fb_fk_addresses_id` (`address_id`),
  KEY `transactions_credit_card_id_a7763267_fk_credit_cards_id` (`credit_card_id`),
  KEY `transactions_user_id_766cc893_fk_users_id` (`user_id`),
  KEY `transactions_status_id_3cc9c580` (`status_id`),
  CONSTRAINT `transactions_address_id_00bad6fb_fk_addresses_id` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`),
  CONSTRAINT `transactions_credit_card_id_a7763267_fk_credit_cards_id` FOREIGN KEY (`credit_card_id`) REFERENCES `credit_cards` (`id`),
  CONSTRAINT `transactions_status_id_3cc9c580_fk_statuses_id` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `transactions_user_id_766cc893_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `profile_picture_url` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'아몬드','$2b$12$gIuaPRBLOepnKeT0/RpPrO10uC5tk7tGylKeQHra1pcJNdEG2645K',1,'https://i.imgur.com/g6EO7M8.jpeg','2021-03-25 17:45:03.498915','아몬드@gmail.com'),(2,'자이제','$2b$12$cdMKhXa3yfI5cmOBPIuWWOvo1rC1SAZnlU3qXr5mKCN6RM6YZ80oW',1,'https://i.imgur.com/SmnwZ5k.jpeg','2021-03-25 17:45:03.768617','자이제@gmail.com'),(3,'준식','$2b$12$EpIgpaKyABkbjDuUokHnz.C3ZGtlclP1G2rkO.k2wkwFFPa.2/bLy',1,'https://i.imgur.com/afE3B1w.jpeg','2021-03-25 17:45:04.035538','준식@gmail.com'),(4,'죠르디','$2b$12$jwg2p0jkZRJOZvIQDJ8pye6nvh72B0Ff6GkWOHV7yzGfjNbilsWT6',1,'https://i.imgur.com/0D7b1Gt.jpeg','2021-03-25 17:45:04.298328','죠르디@gmail.com'),(5,'칸','$2b$12$Murd/ahz7fXZbUCCbbsP/OOPHrWLXKBn8NyGqoqQK7aVmKZRmN7zO',1,'https://i.imgur.com/aBgta2g.jpeg','2021-03-25 17:45:04.562693','칸@gmail.com'),(6,'타이거','$2b$12$CXG6gzFDr/Hs61fjEe3rUOylgZeLStvLBPZPY/cwBkS7pO7F51RTK',1,'https://i.imgur.com/gS2qkRm.jpeg','2021-03-25 17:45:04.827523','타이거@gmail.com'),(7,'토끼','$2b$12$l2E0ZzRjqyWPSdEnf7gIkePB4K.eB8Pzx40unvjYLQjSUg3MBXY2G',1,'https://i.imgur.com/GUYCYz3.jpeg','2021-03-25 17:45:05.090104','토끼@gmail.com'),(8,'팬다어덜트','$2b$12$P/gyFEev9wCum782Llh3huygnAKssmOoGHDILQdP8Id5SfRrCZIY.',1,'https://i.imgur.com/TU1FnCc.jpeg','2021-03-25 17:45:05.354981','팬다어덜트@gmail.com'),(9,'프라다','$2b$12$AZiASkN8k.2BMK6N6h/EsuJVvryr35uZPCKW4QKYACBhmbfRpLPmu',1,'https://imgur.com/aVZRvOM.jpeg','2021-03-25 17:45:05.617633','프라다@gmail.com'),(10,'피치피치','$2b$12$oe1UW8yn5h8gtag9yvZP7u671qag2xeM0fQ84Tl0NBqybPoAcsdNa',1,'https://i.imgur.com/nWND0Ix.jpeg','2021-03-25 17:45:05.883231','피치피치@gmail.com'),(11,'고냥이','$2b$12$plKgn1LGPnxZ1Qo4ujEwruTDoYpuI5e4KLhfqIMA6evvrAlby.QhO',1,'https://i.imgur.com/Wp2Sekm.jpeg','2021-03-25 17:45:06.144771','고냥이@gmail.com'),(12,'꾀돌이','$2b$12$Gq99W82JRKe/6XtZOa6FyeLTf1mwipvXhPiI0KGX0m3c9SpkFP7Am',1,'https://i.imgur.com/zsRgvbU.jpeg','2021-03-25 17:45:06.412237','꾀돌이@gmail.com'),(13,'단무지','$2b$12$bAFmJ0qfM3UcA7M8EqyG1OSHv3Fnx5ZJwx.9UZF9QnRHG3bpkX.wq',1,'https://i.imgur.com/9b6bpMt.jpeg','2021-03-25 17:45:06.676770','단무지@gmail.com'),(14,'두부','$2b$12$FUDyERA9S/AlZ4JTmUqsPO7Jd7FvKfyr4paJJHERo6r.Z1hhVdalS',1,'https://i.imgur.com/Qn3dhMl.jpeg','2021-03-25 17:45:06.942363','두부@gmail.com'),(15,'이왕록','$2b$12$utJGdK6U0eS9yNCT5gqtOuB8lyURR63mpvTe825kFXwpyE5ogzk/e',0,'','2021-03-25 17:45:07.207154','wanglee@wemail.com'),(16,'허정원','$2b$12$6flCvX/yl2kO/UtjhuQ0j..UvLT6Q2T54TAgvlzwrW1D5QKY6k0mO',0,'','2021-03-25 17:45:07.478423','jungwon@wemail.com'),(17,'강준우','$2b$12$likn1Uj35TtWYUnW.srFiO4AFVybWg7.yMPnd2H31FbTl6MkTMxJ2',0,'','2021-03-25 17:45:07.741853','junwoo@wemail.com'),(18,'송나은','$2b$12$AHpfmi4FXEKDMl25GTUxGOgVToUKc6xRfDnre8RJTnHnQhE/DSh/6',0,'','2021-03-25 17:45:08.008772','naeun@wemail.com'),(19,'배성훈','$2b$12$kAhIykNW2CneYxFetYJZ7.aHaGxMR1Dus9oBQH4nHCh7e/p3NI/wK',0,'','2021-03-25 17:45:08.274094','seonghoon@wemail.com'),(20,'양지은','$2b$12$G2cMZsb8ArC5WmZUvvtafeylSSJYYoGNDR2hzO6Z3ILl19Im9BBL.',0,'','2021-03-25 17:45:08.540825','jieun@wemail.com'),(21,'test','$2b$12$EMV68Q7017OpoMRUDzmlv.JgON0K291CybS1umCD2YNx.QjNfU.e2',0,NULL,'2021-03-25 17:55:39.873466','kang@naver.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-26  3:47:48
