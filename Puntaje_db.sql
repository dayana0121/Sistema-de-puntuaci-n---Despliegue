-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: puntaje_db
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `activities_activity`
--

DROP TABLE IF EXISTS `activities_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities_activity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `evidence` varchar(255) DEFAULT NULL,
  `note` longtext,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  `activity_type_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activities_activity_user_id_233a83a7_fk_users_user_id` (`user_id`),
  KEY `activities_activity_activity_type_id_13add042_fk_activitie` (`activity_type_id`),
  CONSTRAINT `activities_activity_activity_type_id_13add042_fk_activitie` FOREIGN KEY (`activity_type_id`) REFERENCES `activities_activitytype` (`id`),
  CONSTRAINT `activities_activity_user_id_233a83a7_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities_activity`
--

LOCK TABLES `activities_activity` WRITE;
/*!40000 ALTER TABLE `activities_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `activities_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activities_activitytype`
--

DROP TABLE IF EXISTS `activities_activitytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities_activitytype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `points` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities_activitytype`
--

LOCK TABLES `activities_activitytype` WRITE;
/*!40000 ALTER TABLE `activities_activitytype` DISABLE KEYS */;
INSERT INTO `activities_activitytype` VALUES (1,'Commit válido',4),(2,'Presentar en Sprint Review',4),(3,'Llegar temprano',1),(4,'Completar sistema',16);
/*!40000 ALTER TABLE `activities_activitytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add team',6,'add_team'),(22,'Can change team',6,'change_team'),(23,'Can delete team',6,'delete_team'),(24,'Can view team',6,'view_team'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add user profile',8,'add_userprofile'),(30,'Can change user profile',8,'change_userprofile'),(31,'Can delete user profile',8,'delete_userprofile'),(32,'Can view user profile',8,'view_userprofile'),(33,'Can add activity',9,'add_activity'),(34,'Can change activity',9,'change_activity'),(35,'Can delete activity',9,'delete_activity'),(36,'Can view activity',9,'view_activity'),(37,'Can add activity type',10,'add_activitytype'),(38,'Can change activity type',10,'change_activitytype'),(39,'Can delete activity type',10,'delete_activitytype'),(40,'Can view activity type',10,'view_activitytype'),(41,'Can add period',11,'add_period'),(42,'Can change period',11,'change_period'),(43,'Can delete period',11,'delete_period'),(44,'Can view period',11,'view_period'),(45,'Can add ranking',12,'add_ranking'),(46,'Can change ranking',12,'change_ranking'),(47,'Can delete ranking',12,'delete_ranking'),(48,'Can view ranking',12,'view_ranking');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (9,'activities','activity'),(10,'activities','activitytype'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(11,'reports','period'),(12,'reports','ranking'),(5,'sessions','session'),(6,'teams','team'),(7,'users','user'),(8,'users','userprofile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'teams','0001_initial','2025-09-29 13:09:40.440466'),(2,'contenttypes','0001_initial','2025-09-29 13:09:40.503723'),(3,'contenttypes','0002_remove_content_type_name','2025-09-29 13:09:40.634695'),(4,'auth','0001_initial','2025-09-29 13:09:41.064607'),(5,'auth','0002_alter_permission_name_max_length','2025-09-29 13:09:41.176790'),(6,'auth','0003_alter_user_email_max_length','2025-09-29 13:09:41.187562'),(7,'auth','0004_alter_user_username_opts','2025-09-29 13:09:41.200487'),(8,'auth','0005_alter_user_last_login_null','2025-09-29 13:09:41.214699'),(9,'auth','0006_require_contenttypes_0002','2025-09-29 13:09:41.221194'),(10,'auth','0007_alter_validators_add_error_messages','2025-09-29 13:09:41.235703'),(11,'auth','0008_alter_user_username_max_length','2025-09-29 13:09:41.243286'),(12,'auth','0009_alter_user_last_name_max_length','2025-09-29 13:09:41.254532'),(13,'auth','0010_alter_group_name_max_length','2025-09-29 13:09:41.277505'),(14,'auth','0011_update_proxy_permissions','2025-09-29 13:09:41.295186'),(15,'auth','0012_alter_user_first_name_max_length','2025-09-29 13:09:41.305481'),(16,'users','0001_initial','2025-09-29 13:09:41.850333'),(17,'activities','0001_initial','2025-09-29 13:09:41.893226'),(18,'activities','0002_initial','2025-09-29 13:09:42.057503'),(19,'activities','0003_cargar_datos_iniciales','2025-09-29 13:09:42.071620'),(20,'admin','0001_initial','2025-09-29 13:09:42.238722'),(21,'admin','0002_logentry_remove_auto_add','2025-09-29 13:09:42.251802'),(22,'admin','0003_logentry_add_action_flag_choices','2025-09-29 13:09:42.262592'),(23,'reports','0001_initial','2025-09-29 13:09:42.376543'),(24,'reports','0002_initial','2025-09-29 13:09:42.529447'),(25,'sessions','0001_initial','2025-09-29 13:09:42.594187');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4fcmkd3c9s9q015q809gnm5b8i710264','.eJxVjEEOwiAQRe_C2hCYIkNcuvcMZIYBqRqalHbVeHdt0oVu_3vvbyrSutS49jzHUdRFWXX63ZjSM7cdyIPafdJpass8st4VfdCub5Pk1_Vw_w4q9fqtCziRcwjOGhwYB0gATMAJPYIXBDsUQO-Mychc0FhPgTgYIevAWfX-AMMoNvM:1v3Dfs:YF8vhGoMiXGvs-AEOjK_rUEBqcvJr-N3PJ_1ZqVWR4I','2025-10-13 13:12:16.176375');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_period`
--

DROP TABLE IF EXISTS `reports_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports_period` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `is_closed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_period`
--

LOCK TABLES `reports_period` WRITE;
/*!40000 ALTER TABLE `reports_period` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports_period` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_ranking`
--

DROP TABLE IF EXISTS `reports_ranking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports_ranking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `position` int NOT NULL,
  `total_points` int NOT NULL,
  `total_activities` int NOT NULL,
  `period_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reports_ranking_period_id_user_id_9d440ade_uniq` (`period_id`,`user_id`),
  KEY `reports_ranking_user_id_42a67d4d_fk_users_user_id` (`user_id`),
  CONSTRAINT `reports_ranking_period_id_93b423ee_fk_reports_period_id` FOREIGN KEY (`period_id`) REFERENCES `reports_period` (`id`),
  CONSTRAINT `reports_ranking_user_id_42a67d4d_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_ranking`
--

LOCK TABLES `reports_ranking` WRITE;
/*!40000 ALTER TABLE `reports_ranking` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports_ranking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_team`
--

DROP TABLE IF EXISTS `teams_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams_team` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext,
  `total_points` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_team`
--

LOCK TABLES `teams_team` WRITE;
/*!40000 ALTER TABLE `teams_team` DISABLE KEYS */;
INSERT INTO `teams_team` VALUES (1,'Team 2','Segundo equipo de prueba',25,'2025-09-20 16:00:00.000000','2025-09-20 16:00:00.000000');
/*!40000 ALTER TABLE `teams_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user`
--

DROP TABLE IF EXISTS `users_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `name` varchar(100) NOT NULL,
  `rol` varchar(10) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `team_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `users_user_team_id_9b7def40_fk_teams_team_id` (`team_id`),
  CONSTRAINT `users_user_team_id_9b7def40_fk_teams_team_id` FOREIGN KEY (`team_id`) REFERENCES `teams_team` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user`
--

LOCK TABLES `users_user` WRITE;
/*!40000 ALTER TABLE `users_user` DISABLE KEYS */;
INSERT INTO `users_user` VALUES (1,'pbkdf2_sha256$1000000$RWNMGnez6rtC7gczMX06Po$eVBNrKnaqXlryreOZFlCr674W5NiOXDk03ZRkqA1VI8=','2025-09-29 13:12:16.171402',1,1,'2025-09-29 13:11:11.026763','admin@gmail.com','admin','admin',1,'2025-09-29 13:11:11.546565','2025-09-29 13:11:11.546576',NULL),(2,'pbkdf2_sha256$260000$SL2ISXexXmky$OqsQ41+K9DXMfQh/3n0SgpkkcQKwnt7ykRnxwkt59yw=',NULL,0,0,'2025-09-20 15:32:55.481998','user3@mail.com','user3','user',1,'2025-08-08 12:45:00.000000','2025-09-20 15:17:33.507248',NULL),(3,'pbkdf2_sha256$1000000$Ymf7V8SmdFA6XwzztDDigB$JxkI47FEyK/GU9q2hH1wo8qBdJRYEfJMA/wJOnxlOQc=',NULL,0,0,'2025-09-29 13:16:58.316512','user1@gmail.com','user1','user',1,'2025-09-29 13:16:59.635334','2025-09-29 13:16:59.635364',1),(4,'pbkdf2_sha256$1000000$SnivwQTU8LsTfOR0r9RUcH$MW0mkp+i6zHtV8WlHU8MGJ3eay80sx96S3pkCzDjfHY=',NULL,0,0,'2025-09-29 13:18:16.336805','user2@gmail.com','user2','user',1,'2025-09-29 13:18:17.445926','2025-09-29 13:18:17.445944',1);
/*!40000 ALTER TABLE `users_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_groups`
--

DROP TABLE IF EXISTS `users_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_groups_user_id_group_id_b88eab82_uniq` (`user_id`,`group_id`),
  KEY `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `users_user_groups_user_id_5f6f5a90_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_groups`
--

LOCK TABLES `users_user_groups` WRITE;
/*!40000 ALTER TABLE `users_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_user_permissions`
--

DROP TABLE IF EXISTS `users_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_user_permissions_user_id_permission_id_43338c45_uniq` (`user_id`,`permission_id`),
  KEY `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_user_user_permissions_user_id_20aca447_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_user_permissions`
--

LOCK TABLES `users_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile`
--

DROP TABLE IF EXISTS `users_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_userprofile` (
  `user_id` bigint NOT NULL,
  `image_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `users_userprofile_user_id_87251ef1_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile`
--

LOCK TABLES `users_userprofile` WRITE;
/*!40000 ALTER TABLE `users_userprofile` DISABLE KEYS */;
INSERT INTO `users_userprofile` VALUES (1,'profile_images/default.jpeg'),(3,'profile_images/default.jpeg'),(4,'profile_images/default.jpeg');
/*!40000 ALTER TABLE `users_userprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-29  9:02:40
