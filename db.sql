-- MySQL dump 10.13  Distrib 5.6.47, for Linux (x86_64)
--
-- Host: localhost    Database: cricket
-- ------------------------------------------------------
-- Server version	5.6.47

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add bat_performance',7,'add_batperformance'),(26,'Can change bat_performance',7,'change_batperformance'),(27,'Can delete bat_performance',7,'delete_batperformance'),(28,'Can view bat_performance',7,'view_batperformance'),(29,'Can add bowl_performance',8,'add_bowlperformance'),(30,'Can change bowl_performance',8,'change_bowlperformance'),(31,'Can delete bowl_performance',8,'delete_bowlperformance'),(32,'Can view bowl_performance',8,'view_bowlperformance'),(33,'Can add competition',9,'add_competition'),(34,'Can change competition',9,'change_competition'),(35,'Can delete competition',9,'delete_competition'),(36,'Can view competition',9,'view_competition'),(37,'Can add league',10,'add_league'),(38,'Can change league',10,'change_league'),(39,'Can delete league',10,'delete_league'),(40,'Can view league',10,'view_league'),(41,'Can add match',11,'add_match'),(42,'Can change match',11,'change_match'),(43,'Can delete match',11,'delete_match'),(44,'Can view match',11,'view_match'),(45,'Can add performance',12,'add_performance'),(46,'Can change performance',12,'change_performance'),(47,'Can delete performance',12,'delete_performance'),(48,'Can view performance',12,'view_performance'),(49,'Can add player',13,'add_player'),(50,'Can change player',13,'change_player'),(51,'Can delete player',13,'delete_player'),(52,'Can view player',13,'view_player'),(53,'Can add point',14,'add_point'),(54,'Can change point',14,'change_point'),(55,'Can delete point',14,'delete_point'),(56,'Can view point',14,'view_point'),(57,'Can add team',15,'add_team'),(58,'Can change team',15,'change_team'),(59,'Can delete team',15,'delete_team'),(60,'Can view team',15,'view_team');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$STX7zratixxJ$ve4V/A6J7fNbI4YgzEK0re9pN5KMPdj/5o2OV5vlRmw=','2020-01-28 11:05:36.409605',1,'vijay','','','360.vijay.pal@gmail.com',1,1,'2020-01-28 11:05:11.180817');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bat_performances`
--

DROP TABLE IF EXISTS `bat_performances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bat_performances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bat` tinyint(1) NOT NULL,
  `bat_position` int(11) NOT NULL,
  `bat_runs` int(11) NOT NULL,
  `bat_par_score` int(11) NOT NULL,
  `bat_balls` int(11) NOT NULL,
  `bat_how_out` varchar(32) NOT NULL,
  `bat_inning_no` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `bat_out_bowler_id` int(11) DEFAULT NULL,
  `bat_out_fielder_id` int(11) DEFAULT NULL,
  `match_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bat_performances_bat_out_bowler_id_d04d4de5_fk_players_id` (`bat_out_bowler_id`),
  KEY `bat_performances_bat_out_fielder_id_6e6e7641_fk_players_id` (`bat_out_fielder_id`),
  KEY `bat_performances_match_id_8967bb39_fk_matches_id` (`match_id`),
  KEY `bat_performances_player_id_bc3d4637_fk_players_id` (`player_id`),
  CONSTRAINT `bat_performances_bat_out_bowler_id_d04d4de5_fk_players_id` FOREIGN KEY (`bat_out_bowler_id`) REFERENCES `players` (`id`),
  CONSTRAINT `bat_performances_bat_out_fielder_id_6e6e7641_fk_players_id` FOREIGN KEY (`bat_out_fielder_id`) REFERENCES `players` (`id`),
  CONSTRAINT `bat_performances_match_id_8967bb39_fk_matches_id` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`),
  CONSTRAINT `bat_performances_player_id_bc3d4637_fk_players_id` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bat_performances`
--

LOCK TABLES `bat_performances` WRITE;
/*!40000 ALTER TABLE `bat_performances` DISABLE KEYS */;
INSERT INTO `bat_performances` VALUES (1,1,3,60,0,70,'DNB',0,'2020-01-28 12:40:33.736932','2020-01-29 07:20:16.226228',NULL,NULL,1,1);
/*!40000 ALTER TABLE `bat_performances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bowl_performances`
--

DROP TABLE IF EXISTS `bowl_performances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bowl_performances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bowl` tinyint(1) NOT NULL,
  `bowl_overs` double NOT NULL,
  `bowl_runs` int(11) NOT NULL,
  `bowl_maidens` int(11) NOT NULL,
  `bowl_position` int(11) NOT NULL,
  `bowl_pareconomy` double NOT NULL,
  `bowl_wickets_lbw` int(11) NOT NULL,
  `bowl_wickets_bowled` int(11) NOT NULL,
  `bowl_wickets_stumped` int(11) NOT NULL,
  `bowl_wickets_caught` int(11) NOT NULL,
  `bowl_wickets_hit_wicket` int(11) NOT NULL,
  `bowl_wickets_total` int(11) NOT NULL,
  `bowl_inning_no` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `match_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bowl_performances_match_id_53ab6216_fk_matches_id` (`match_id`),
  KEY `bowl_performances_player_id_f1514fc2_fk_players_id` (`player_id`),
  CONSTRAINT `bowl_performances_match_id_53ab6216_fk_matches_id` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`),
  CONSTRAINT `bowl_performances_player_id_f1514fc2_fk_players_id` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bowl_performances`
--

LOCK TABLES `bowl_performances` WRITE;
/*!40000 ALTER TABLE `bowl_performances` DISABLE KEYS */;
/*!40000 ALTER TABLE `bowl_performances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competitions`
--

DROP TABLE IF EXISTS `competitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `competition_type` varchar(32) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `league_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `competitions_league_id_191c3b03_fk_leagues_id` (`league_id`),
  CONSTRAINT `competitions_league_id_191c3b03_fk_leagues_id` FOREIGN KEY (`league_id`) REFERENCES `leagues` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competitions`
--

LOCK TABLES `competitions` WRITE;
/*!40000 ALTER TABLE `competitions` DISABLE KEYS */;
INSERT INTO `competitions` VALUES (1,'walk out','20-20','2020-01-28 12:34:23.192026','2020-01-28 12:34:23.192173',1);
/*!40000 ALTER TABLE `competitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-01-28 11:10:12.736448','1','SC Ganguly',1,'[{\"added\": {}}]',13,1),(2,'2020-01-28 11:31:08.538528','1','Kolkata Knight Riders',1,'[{\"added\": {}}]',15,1),(3,'2020-01-28 11:32:02.239168','2','Royal Challengers Bangalore',1,'[{\"added\": {}}]',15,1),(4,'2020-01-28 11:32:50.634488','3','Chennai Super Kings',1,'[{\"added\": {}}]',15,1),(5,'2020-01-28 11:33:04.610844','4','Kings XI Punjab',1,'[{\"added\": {}}]',15,1),(6,'2020-01-28 11:33:15.342807','5','Rajasthan Royals',1,'[{\"added\": {}}]',15,1),(7,'2020-01-28 11:33:31.320653','6','Delhi Daredevils',1,'[{\"added\": {}}]',15,1),(8,'2020-01-28 11:33:56.540032','7','Mumbai Indians',1,'[{\"added\": {}}]',15,1),(9,'2020-01-28 11:34:22.540588','8','Deccan Chargers',1,'[{\"added\": {}}]',15,1),(10,'2020-01-28 11:34:44.595182','9','Kochi Tuskers Kerala',1,'[{\"added\": {}}]',15,1),(11,'2020-01-28 11:35:17.284789','10','Pune Warriors',1,'[{\"added\": {}}]',15,1),(12,'2020-01-28 11:35:35.547411','11','Sunrisers Hyderabad',1,'[{\"added\": {}}]',15,1),(13,'2020-01-28 11:36:05.390899','12','Rising Pune Supergiants',1,'[{\"added\": {}}]',15,1),(14,'2020-01-28 11:36:21.834065','13','Gujarat Lions',1,'[{\"added\": {}}]',15,1),(15,'2020-01-28 11:53:49.806756','2','BB McCullum',1,'[{\"added\": {}}]',13,1),(16,'2020-01-28 11:54:13.594841','3','RT Ponting',1,'[{\"added\": {}}]',13,1),(17,'2020-01-28 11:54:39.594599','4','DJ Hussey',1,'[{\"added\": {}}]',13,1),(18,'2020-01-28 11:54:59.489931','5','Mohammad Hafeez',1,'[{\"added\": {}}]',13,1),(19,'2020-01-28 11:55:19.100983','6','R Dravid',1,'[{\"added\": {}}]',13,1),(20,'2020-01-28 11:55:35.289206','7','W Jaffer',1,'[{\"added\": {}}]',13,1),(21,'2020-01-28 11:55:50.763023','8','V Kohli',1,'[{\"added\": {}}]',13,1),(22,'2020-01-28 12:23:14.626623','8','V Kohli',2,'[{\"changed\": {\"fields\": [\"image_uri\", \"team\"]}}]',13,1),(23,'2020-01-28 12:33:12.577189','1','IPL',1,'[{\"added\": {}}]',10,1),(24,'2020-01-28 12:34:23.193174','1','walk out',1,'[{\"added\": {}}]',9,1),(25,'2020-01-28 12:35:42.275320','1','Match object (1)',1,'[{\"added\": {}}]',11,1),(26,'2020-01-28 12:36:32.650227','1','Match object (1)',2,'[{\"changed\": {\"fields\": [\"is_result\", \"win_type\", \"won_by\", \"match_winner_team\", \"man_of_the_match\", \"city_name\", \"host_country\"]}}]',11,1),(27,'2020-01-28 12:39:10.061044','1','SC Ganguly: 2020-01-10 12:00:00+00:00 | M Chinnaswamy Stadium | Bangalore',1,'[{\"added\": {}}]',12,1),(28,'2020-01-28 12:39:16.429907','2','BB McCullum: 2020-01-10 12:00:00+00:00 | M Chinnaswamy Stadium | Bangalore',1,'[{\"added\": {}}]',12,1),(29,'2020-01-28 12:39:32.830579','3','RT Ponting: 2020-01-10 12:00:00+00:00 | M Chinnaswamy Stadium | Bangalore',1,'[{\"added\": {}}]',12,1),(30,'2020-01-28 12:40:33.739104','1','SC Ganguly: 2020-01-10 12:00:00+00:00 | M Chinnaswamy Stadium | Bangalore',1,'[{\"added\": {}}]',7,1),(31,'2020-01-29 07:07:11.730440','1','SC Ganguly',2,'[{\"changed\": {\"fields\": [\"team\"]}}]',13,1),(32,'2020-01-29 07:20:16.242517','1','SC Ganguly: 2020-01-10 12:00:00+00:00 | M Chinnaswamy Stadium | Bangalore',2,'[]',7,1),(33,'2020-01-29 17:11:02.187197','2','2020-01-31 12:00:00 | M Chinnaswamy Stadium | None',1,'[{\"added\": {}}]',11,1),(34,'2020-01-30 12:21:44.971170','2','2020-01-31 12:00:00 | M Chinnaswamy Stadium | None',2,'[{\"changed\": {\"fields\": [\"toss_winner_team\", \"toss_decision\", \"is_result\", \"win_type\", \"won_by\", \"match_winner_team\", \"man_of_the_match\"]}}]',11,1),(35,'2020-01-30 12:22:05.195458','1','2.0',1,'[{\"added\": {}}]',14,1),(36,'2020-01-30 12:22:13.311144','2','0.0',1,'[{\"added\": {}}]',14,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'crt','batperformance'),(8,'crt','bowlperformance'),(9,'crt','competition'),(10,'crt','league'),(11,'crt','match'),(12,'crt','performance'),(13,'crt','player'),(14,'crt','point'),(15,'crt','team'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-01-28 11:04:45.772686'),(2,'auth','0001_initial','2020-01-28 11:04:46.473211'),(3,'admin','0001_initial','2020-01-28 11:04:46.640265'),(4,'admin','0002_logentry_remove_auto_add','2020-01-28 11:04:46.669677'),(5,'admin','0003_logentry_add_action_flag_choices','2020-01-28 11:04:46.686830'),(6,'contenttypes','0002_remove_content_type_name','2020-01-28 11:04:46.802243'),(7,'auth','0002_alter_permission_name_max_length','2020-01-28 11:04:46.853148'),(8,'auth','0003_alter_user_email_max_length','2020-01-28 11:04:46.935140'),(9,'auth','0004_alter_user_username_opts','2020-01-28 11:04:46.943615'),(10,'auth','0005_alter_user_last_login_null','2020-01-28 11:04:46.982778'),(11,'auth','0006_require_contenttypes_0002','2020-01-28 11:04:46.986409'),(12,'auth','0007_alter_validators_add_error_messages','2020-01-28 11:04:46.994825'),(13,'auth','0008_alter_user_username_max_length','2020-01-28 11:04:47.044420'),(14,'auth','0009_alter_user_last_name_max_length','2020-01-28 11:04:47.093937'),(15,'crt','0001_initial','2020-01-28 11:04:48.780917'),(16,'sessions','0001_initial','2020-01-28 11:04:48.818379'),(17,'crt','0002_auto_20200128_1110','2020-01-28 11:10:05.405901'),(18,'crt','0003_auto_20200128_1112','2020-01-28 11:12:33.468060'),(19,'crt','0004_auto_20200128_1113','2020-01-28 11:13:50.355571'),(20,'crt','0005_auto_20200128_1115','2020-01-28 11:15:09.121724'),(21,'crt','0006_auto_20200128_1116','2020-01-28 11:16:42.483391'),(22,'crt','0007_auto_20200128_1117','2020-01-28 11:17:59.292456'),(23,'crt','0008_point_league','2020-01-30 12:01:02.447725');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('nz81scmy5tmlm66ol8989kz2bhkcgo3c','YWI3ODc4ODczNDViOGU4ZGFiMDdiN2NiMDhhOTU0MGMxODY4NGM2Mjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMzdjZjY3NWRhMDYzZDk2ODU4OGQzNTRkMDRjMWRkNWFlYWE1MDQ2In0=','2020-02-11 11:05:36.413272');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leagues`
--

DROP TABLE IF EXISTS `leagues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leagues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leagues`
--

LOCK TABLES `leagues` WRITE;
/*!40000 ALTER TABLE `leagues` DISABLE KEYS */;
INSERT INTO `leagues` VALUES (1,'IPL','2020-01-28 12:33:12.576556','2020-01-28 12:33:12.576616');
/*!40000 ALTER TABLE `leagues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `venue_name` varchar(50) NOT NULL,
  `toss_decision` smallint(5) unsigned NOT NULL,
  `last_updated` datetime(6) NOT NULL,
  `is_super_over` tinyint(1) NOT NULL,
  `is_result` tinyint(1) NOT NULL,
  `is_duck_worth_lewis` tinyint(1) NOT NULL,
  `win_type` smallint(5) unsigned NOT NULL,
  `won_by` int(10) unsigned NOT NULL,
  `city_name` varchar(50) DEFAULT NULL,
  `host_country` varchar(50) DEFAULT NULL,
  `match_notes` longtext,
  `number_of_players` int(11) NOT NULL,
  `processing_issue` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `competition_id` int(11) NOT NULL,
  `first_umpire_id_id` int(11) DEFAULT NULL,
  `man_of_the_match_id` int(11) DEFAULT NULL,
  `match_winner_team_id` int(11) DEFAULT NULL,
  `second_umpire_id_id` int(11) DEFAULT NULL,
  `team_1_id` int(11) NOT NULL,
  `team_2_id` int(11) NOT NULL,
  `toss_winner_team_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `matches_competition_id_bcb09a15_fk_competitions_id` (`competition_id`),
  KEY `matches_first_umpire_id_id_91312755_fk_players_id` (`first_umpire_id_id`),
  KEY `matches_man_of_the_match_id_f7df9456_fk_players_id` (`man_of_the_match_id`),
  KEY `matches_match_winner_team_id_81b3d791_fk_teams_id` (`match_winner_team_id`),
  KEY `matches_second_umpire_id_id_1e22fc83_fk_players_id` (`second_umpire_id_id`),
  KEY `matches_toss_winner_team_id_1a35a604_fk_teams_id` (`toss_winner_team_id`),
  KEY `matches_team_1_id_e70b09b6_fk_teams_id` (`team_1_id`),
  KEY `matches_team_2_id_8b138619_fk_teams_id` (`team_2_id`),
  CONSTRAINT `matches_competition_id_bcb09a15_fk_competitions_id` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`),
  CONSTRAINT `matches_first_umpire_id_id_91312755_fk_players_id` FOREIGN KEY (`first_umpire_id_id`) REFERENCES `players` (`id`),
  CONSTRAINT `matches_man_of_the_match_id_f7df9456_fk_players_id` FOREIGN KEY (`man_of_the_match_id`) REFERENCES `players` (`id`),
  CONSTRAINT `matches_match_winner_team_id_81b3d791_fk_teams_id` FOREIGN KEY (`match_winner_team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `matches_second_umpire_id_id_1e22fc83_fk_players_id` FOREIGN KEY (`second_umpire_id_id`) REFERENCES `players` (`id`),
  CONSTRAINT `matches_team_1_id_e70b09b6_fk_teams_id` FOREIGN KEY (`team_1_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `matches_team_2_id_8b138619_fk_teams_id` FOREIGN KEY (`team_2_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `matches_toss_winner_team_id_1a35a604_fk_teams_id` FOREIGN KEY (`toss_winner_team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (1,'2020-01-10 12:00:00.000000','M Chinnaswamy Stadium',1,'2020-01-28 12:36:32.648339',0,1,0,1,15,'Bangalore','India','',24,0,'2020-01-28 12:35:42.274375','2020-01-28 12:36:32.648365',1,NULL,2,1,NULL,1,2,1),(2,'2020-01-31 12:00:00.000000','M Chinnaswamy Stadium',1,'2020-01-30 12:21:44.967843',0,1,0,1,100,NULL,NULL,'',0,0,'2020-01-29 17:11:02.175515','2020-01-30 12:21:44.967858',1,NULL,1,1,NULL,1,1,1);
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performances`
--

DROP TABLE IF EXISTS `performances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `performances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `captain` tinyint(1) NOT NULL,
  `vice_captain` tinyint(1) NOT NULL,
  `wicket_keeper` tinyint(1) NOT NULL,
  `is_umpire` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `match_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `performances_match_id_b8484e6d_fk_matches_id` (`match_id`),
  KEY `performances_player_id_d23ec98c_fk_players_id` (`player_id`),
  CONSTRAINT `performances_match_id_b8484e6d_fk_matches_id` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`),
  CONSTRAINT `performances_player_id_d23ec98c_fk_players_id` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performances`
--

LOCK TABLES `performances` WRITE;
/*!40000 ALTER TABLE `performances` DISABLE KEYS */;
INSERT INTO `performances` VALUES (1,1,0,0,0,'2020-01-28 12:39:10.059904','2020-01-28 12:39:10.059995',1,1),(2,0,0,0,0,'2020-01-28 12:39:16.428857','2020-01-28 12:39:16.428930',1,2),(3,0,0,0,0,'2020-01-28 12:39:32.829986','2020-01-28 12:39:32.830035',1,3);
/*!40000 ALTER TABLE `performances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `image_uri` varchar(100) DEFAULT NULL,
  `jersey_number` int(10) unsigned NOT NULL,
  `dob` date DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `team_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `players_team_id_8b821f35_fk_teams_id` (`team_id`),
  CONSTRAINT `players_team_id_8b821f35_fk_teams_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'SC','Ganguly','',50,NULL,'India','2020-01-28 11:10:12.732913','2020-01-29 07:07:11.719632',1),(2,'BB','McCullum','',0,NULL,'New Zealand','2020-01-28 11:53:49.806022','2020-01-28 11:53:49.806056',1),(3,'RT','Ponting','',0,NULL,'Australia','2020-01-28 11:54:13.594257','2020-01-28 11:54:13.594335',1),(4,'DJ','Hussey','',0,NULL,'Australia','2020-01-28 11:54:39.593213','2020-01-28 11:54:39.593293',1),(5,'Mohammad','Hafeez','',0,NULL,'Pakistan','2020-01-28 11:54:59.488594','2020-01-28 11:54:59.488699',1),(6,'R','Dravid','',0,NULL,'India','2020-01-28 11:55:19.099779','2020-01-28 11:55:19.099865',1),(7,'W','Jaffer','',0,NULL,'India','2020-01-28 11:55:35.288232','2020-01-28 11:55:35.288304',NULL),(8,'V','Kohli','player/team_img_1580214194621.0327.jpg',0,NULL,'India','2020-01-28 11:55:50.761982','2020-01-28 12:23:14.622743',1);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `points`
--

DROP TABLE IF EXISTS `points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `points` double NOT NULL,
  `team_id` int(11) NOT NULL,
  `league_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `points_team_id_64f390b8_fk_teams_id` (`team_id`),
  KEY `points_league_id_f6c85f51_fk_leagues_id` (`league_id`),
  CONSTRAINT `points_league_id_f6c85f51_fk_leagues_id` FOREIGN KEY (`league_id`) REFERENCES `leagues` (`id`),
  CONSTRAINT `points_team_id_64f390b8_fk_teams_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `points`
--

LOCK TABLES `points` WRITE;
/*!40000 ALTER TABLE `points` DISABLE KEYS */;
INSERT INTO `points` VALUES (1,2,1,1),(2,0,2,1);
/*!40000 ALTER TABLE `points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `logo_uri` varchar(100) DEFAULT NULL,
  `club_state` varchar(40) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Kolkata Knight Riders','','West Bengal','2020-01-28 11:31:08.537695','2020-01-28 11:31:08.537745'),(2,'Royal Challengers Bangalore','','Karnataka','2020-01-28 11:32:02.236918','2020-01-28 11:32:02.237096'),(3,'Chennai Super Kings','','Tamil Nadu','2020-01-28 11:32:50.632574','2020-01-28 11:32:50.632731'),(4,'Kings XI Punjab','','Punjab','2020-01-28 11:33:04.610194','2020-01-28 11:33:04.610250'),(5,'Rajasthan Royals','','Rajasthan','2020-01-28 11:33:15.341237','2020-01-28 11:33:15.341517'),(6,'Delhi Daredevils','','Delhi','2020-01-28 11:33:31.319624','2020-01-28 11:33:31.319761'),(7,'Mumbai Indians','','Maharashtra','2020-01-28 11:33:56.537996','2020-01-28 11:33:56.538150'),(8,'Deccan Chargers','','Telangana','2020-01-28 11:34:22.538343','2020-01-28 11:34:22.538549'),(9,'Kochi Tuskers Kerala','','Kerala','2020-01-28 11:34:44.592993','2020-01-28 11:34:44.593331'),(10,'Pune Warriors','','Maharashtra','2020-01-28 11:35:17.282349','2020-01-28 11:35:17.282555'),(11,'Sunrisers Hyderabad','','Telengana','2020-01-28 11:35:35.544994','2020-01-28 11:35:35.545046'),(12,'Rising Pune Supergiants','','Maharashtra','2020-01-28 11:36:05.389910','2020-01-28 11:36:05.390001'),(13,'Gujarat Lions','','Gujarat','2020-01-28 11:36:21.833156','2020-01-28 11:36:21.833243');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-30 15:35:26
