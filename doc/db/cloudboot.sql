-- MySQL dump 10.13  Distrib 5.7.11, for osx10.11 (x86_64)
--
-- Host: localhost    Database: cloudboot
-- ------------------------------------------------------
-- Server version	5.7.11

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
-- Current Database: `cloudboot`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cloudboot` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `cloudboot`;

--
-- Table structure for table `device_histories`
--

DROP TABLE IF EXISTS `device_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_histories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `batch_number` varchar(255) NOT NULL,
  `sn` varchar(255) NOT NULL,
  `hostname` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `network_id` int(10) unsigned NOT NULL,
  `os_id` int(10) unsigned NOT NULL,
  `hardware_id` int(10) unsigned DEFAULT NULL,
  `system_id` int(10) unsigned NOT NULL,
  `location` varchar(255) NOT NULL,
  `location_id` int(11) NOT NULL,
  `asset_number` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `install_progress` decimal(11,4) DEFAULT '0.0000',
  `install_log` text,
  `is_support_vm` enum('Yes','No') DEFAULT 'Yes' COMMENT '是否支持安装虚拟机',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `manage_ip` varchar(32) DEFAULT NULL,
  `manage_network_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `batch_number` (`batch_number`),
  KEY `status` (`status`) USING BTREE,
  KEY `sn` (`sn`) USING BTREE,
  KEY `hostname` (`hostname`) USING BTREE,
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_histories`
--

LOCK TABLES `device_histories` WRITE;
/*!40000 ALTER TABLE `device_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_install_callbacks`
--

DROP TABLE IF EXISTS `device_install_callbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_install_callbacks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `device_id` int(11) NOT NULL,
  `callback_type` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `run_time` varchar(255) DEFAULT NULL,
  `run_result` text,
  `run_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `device_id` (`device_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_install_callbacks`
--

LOCK TABLES `device_install_callbacks` WRITE;
/*!40000 ALTER TABLE `device_install_callbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_install_callbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_install_reports`
--

DROP TABLE IF EXISTS `device_install_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_install_reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `sn` varchar(255) NOT NULL,
  `os_name` varchar(255) DEFAULT NULL,
  `hardware_name` varchar(255) DEFAULT NULL,
  `system_name` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_install_reports`
--

LOCK TABLES `device_install_reports` WRITE;
/*!40000 ALTER TABLE `device_install_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_install_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_logs`
--

DROP TABLE IF EXISTS `device_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `device_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `content` longtext,
  PRIMARY KEY (`id`),
  KEY `device_id` (`device_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_logs`
--

LOCK TABLES `device_logs` WRITE;
/*!40000 ALTER TABLE `device_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `batch_number` varchar(255) NOT NULL,
  `sn` varchar(255) NOT NULL,
  `hostname` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `network_id` int(10) unsigned NOT NULL,
  `os_id` int(10) unsigned NOT NULL,
  `hardware_id` int(10) unsigned DEFAULT NULL,
  `system_id` int(10) unsigned NOT NULL,
  `location` varchar(255) NOT NULL,
  `location_id` int(11) NOT NULL,
  `asset_number` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `install_progress` decimal(11,4) DEFAULT '0.0000',
  `install_log` text,
  `is_support_vm` enum('Yes','No') DEFAULT 'No' COMMENT '是否支持安装虚拟机',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `manage_ip` varchar(32) DEFAULT NULL,
  `manage_network_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  UNIQUE KEY `ip` (`ip`),
  KEY `batch_number` (`batch_number`),
  KEY `status` (`status`) USING BTREE,
  KEY `user_id` (`user_id`),
  KEY `manage_ip` (`manage_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dhcp_subnets`
--

DROP TABLE IF EXISTS `dhcp_subnets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dhcp_subnets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `start_ip` varchar(255) NOT NULL,
  `end_ip` varchar(255) NOT NULL,
  `gateway` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dhcp_subnets`
--

LOCK TABLES `dhcp_subnets` WRITE;
/*!40000 ALTER TABLE `dhcp_subnets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dhcp_subnets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hardwares`
--

DROP TABLE IF EXISTS `hardwares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hardwares` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `company` varchar(255) NOT NULL,
  `product` varchar(255) DEFAULT '',
  `model_name` varchar(255) NOT NULL,
  `raid` text,
  `oob` text,
  `bios` text,
  `is_system_add` enum('Yes','No') NOT NULL DEFAULT 'Yes' COMMENT '是否是系统添加的配置',
  `tpl` longtext,
  `data` longtext,
  `source` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `status` enum('Pending','Success','Failure') DEFAULT 'Success',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hardwares`
--

LOCK TABLES `hardwares` WRITE;
/*!40000 ALTER TABLE `hardwares` DISABLE KEYS */;
INSERT INTO `hardwares` VALUES (1,'2015-11-20 11:41:50','2017-01-17 09:38:29',NULL,'Dell','','通用型号','','','','No','[{\"name\":\"RAID\",\"data\":[{\"name\":\"RAID 1\",\"type\":\"select\",\"data\":[{\"name\":\"前两块盘 RAID 1\",\"value\":\"/opt/yunji/osinstall/dell/raid.sh -c -r 1 -d 0,1\"}],\"tpl\":\"\",\"input\":\"\",\"default\":\"/opt/yunji/osinstall/dell/raid.sh -c -r 1 -d 0,1\"},{\"name\":\"RAID 5\",\"type\":\"select\",\"data\":[{\"name\":\"剩下的盘 RAID 5\",\"value\":\"/opt/yunji/osinstall/dell/raid.sh -r 5 -d 2- -i\"}],\"tpl\":\"/opt/yunji/osinstall/dell/raid.sh -r 10 -d 2-\",\"input\":\"\",\"default\":\"/opt/yunji/osinstall/dell/raid.sh -r 5 -d 2- -i\"}]},{\"name\":\"OOB\",\"data\":[{\"name\":\"网络类型\",\"type\":\"select\",\"data\":[{\"name\":\"DHCP\",\"value\":\"/opt/yunji/osinstall/dell/oob.sh -n dhcp\",\"checked\":false},{\"name\":\"静态IP\",\"value\":\"/opt/yunji/osinstall/dell/oob.sh -n static -i <{manage_ip}> -m <{manage_netmask}> -g <{manage_gateway}> \",\"checked\":true}],\"default\":\"/opt/yunji/osinstall/dell/oob.sh -n static -i <{manage_ip}> -m <{manage_netmask}> -g <{manage_gateway}> \"},{\"name\":\"用户名\",\"type\":\"input\",\"tpl\":\"/opt/yunji/osinstall/dell/oob.sh -u <{##}>\",\"default\":\"/opt/yunji/osinstall/dell/oob.sh -u root\",\"input\":\"root\",\"value\":\"/opt/yunji/osinstall/dell/oob.sh -u root\"},{\"name\":\"密码\",\"type\":\"input\",\"tpl\":\"/opt/yunji/osinstall/dell/oob.sh -p <{##}>\",\"default\":\"/opt/yunji/osinstall/dell/oob.sh -u root -p calvin\",\"input\":\"calvin\"}]}]','[{\"Name\":\"RAID\",\"Data\":[{\"Name\":\"RAID 1\",\"Value\":\"/opt/yunji/osinstall/dell/raid.sh -c -r 1 -d 0,1\"},{\"Name\":\"RAID 5\",\"Value\":\"/opt/yunji/osinstall/dell/raid.sh -r 5 -d 2- -i\"}]},{\"Name\":\"OOB\",\"Data\":[{\"Name\":\"网络类型\",\"Value\":\"/opt/yunji/osinstall/dell/oob.sh -n static -i <{manage_ip}> -m <{manage_netmask}> -g <{manage_gateway}> \"},{\"Name\":\"密码\",\"Value\":\"/opt/yunji/osinstall/dell/oob.sh -u root -p calvin\"}]}]','','v1.4','Success'),(2,'2017-01-17 06:43:30','2017-01-17 09:38:32',NULL,'惠普','','通用型号','','','','No','[{\"name\":\"RAID\",\"data\":[{\"name\":\"RAID 1\",\"type\":\"select\",\"data\":[{\"name\":\"前两块盘 RAID 1\",\"value\":\"/opt/yunji/osinstall/hp/raid.sh -c -r 1 -d 0,1\"}],\"tpl\":\"\",\"input\":\"\",\"default\":\"/opt/yunji/osinstall/hp/raid.sh -c -r 1 -d 0,1\"},{\"name\":\"RAID 5\",\"type\":\"select\",\"data\":[{\"name\":\"剩下的盘 RAID 5\",\"value\":\"/opt/yunji/osinstall/hp/raid.sh -r 5 -d 2- -i\"}],\"tpl\":\"/opt/yunji/osinstall/dell/raid.sh -r 10 -d 2-\",\"input\":\"\",\"default\":\"/opt/yunji/osinstall/hp/raid.sh -r 5 -d 2- -i\"}]},{\"name\":\"OOB\",\"data\":[{\"name\":\"网络类型\",\"type\":\"select\",\"data\":[{\"name\":\"DHCP\",\"value\":\"/opt/yunji/osinstall/hp/oob.sh -n dhcp\",\"checked\":false},{\"name\":\"静态IP\",\"value\":\"/opt/yunji/osinstall/hp/oob.sh -n static -i <{manage_ip}> -m <{manage_netmask}> -g <{manage_gateway}> \",\"checked\":true}],\"default\":\"/opt/yunji/osinstall/hp/oob.sh -n static -i <{manage_ip}> -m <{manage_netmask}> -g <{manage_gateway}> \"},{\"name\":\"用户名\",\"type\":\"input\",\"tpl\":\"/opt/yunji/osinstall/hp/oob.sh -u <{##}>\",\"default\":\"/opt/yunji/osinstall/hp/oob.sh -u administrator\",\"input\":\"administrator\",\"value\":\"/opt/yunji/osinstall/hp/oob.sh -u administrator\"},{\"name\":\"密码\",\"type\":\"input\",\"tpl\":\"/opt/yunji/osinstall/hp/oob.sh -p <{##}>\",\"default\":\"/opt/yunji/osinstall/hp/oob.sh -u administrator -p calvin\",\"input\":\"calvin\"}]}]','[{\"Name\":\"RAID\",\"Data\":[{\"Name\":\"RAID 1\",\"Value\":\"/opt/yunji/osinstall/hp/raid.sh -c -r 1 -d 0,1\"},{\"Name\":\"RAID 5\",\"Value\":\"/opt/yunji/osinstall/hp/raid.sh -r 5 -d 2- -i\"}]},{\"Name\":\"OOB\",\"Data\":[{\"Name\":\"网络类型\",\"Value\":\"/opt/yunji/osinstall/hp/oob.sh -n static -i <{manage_ip}> -m <{manage_netmask}> -g <{manage_gateway}> \"},{\"Name\":\"密码\",\"Value\":\"/opt/yunji/osinstall/hp/oob.sh -u administrator -p calvin\"}]}]','','v1.4','Success'),(3,'2017-01-17 06:44:13','2017-01-17 09:38:34',NULL,'华为','','通用型号','','','','No','[{\"name\":\"RAID\",\"data\":[{\"name\":\"RAID 1\",\"type\":\"select\",\"data\":[{\"name\":\"前两块盘 RAID 1\",\"value\":\"/opt/yunji/osinstall/huawei/raid.sh -c -r 1 -d 0,1\"}],\"tpl\":\"\",\"input\":\"\",\"default\":\"/opt/yunji/osinstall/huawei/raid.sh -c -r 1 -d 0,1\"},{\"name\":\"RAID 5\",\"type\":\"select\",\"data\":[{\"name\":\"剩下的盘 RAID 5\",\"value\":\"/opt/yunji/osinstall/huawei/raid.sh -r 5 -d 2- -i\"}],\"tpl\":\"/opt/yunji/osinstall/dell/raid.sh -r 10 -d 2-\",\"input\":\"\",\"default\":\"/opt/yunji/osinstall/huawei/raid.sh -r 5 -d 2- -i\"}]},{\"name\":\"OOB\",\"data\":[{\"name\":\"网络类型\",\"type\":\"select\",\"data\":[{\"name\":\"DHCP\",\"value\":\"/opt/yunji/osinstall/huawei/oob.sh -n dhcp\",\"checked\":false},{\"name\":\"静态IP\",\"value\":\"/opt/yunji/osinstall/huawei/oob.sh -n static -i <{manage_ip}> -m <{manage_netmask}> -g <{manage_gateway}> \",\"checked\":true}],\"default\":\"/opt/yunji/osinstall/huawei/oob.sh -n static -i <{manage_ip}> -m <{manage_netmask}> -g <{manage_gateway}> \"},{\"name\":\"用户名\",\"type\":\"input\",\"tpl\":\"/opt/yunji/osinstall/huawei/oob.sh -u <{##}>\",\"default\":\"/opt/yunji/osinstall/huawei/oob.sh -u root\",\"input\":\"root\",\"value\":\"/opt/yunji/osinstall/huawei/oob.sh -u root\"},{\"name\":\"密码\",\"type\":\"input\",\"tpl\":\"/opt/yunji/osinstall/huawei/oob.sh -p <{##}>\",\"default\":\"/opt/yunji/osinstall/huawei/oob.sh -u root -p calvin\",\"input\":\"calvin\"}]}]','[{\"Name\":\"RAID\",\"Data\":[{\"Name\":\"RAID 1\",\"Value\":\"/opt/yunji/osinstall/huawei/raid.sh -c -r 1 -d 0,1\"},{\"Name\":\"RAID 5\",\"Value\":\"/opt/yunji/osinstall/huawei/raid.sh -r 5 -d 2- -i\"}]},{\"Name\":\"OOB\",\"Data\":[{\"Name\":\"网络类型\",\"Value\":\"/opt/yunji/osinstall/huawei/oob.sh -n static -i <{manage_ip}> -m <{manage_netmask}> -g <{manage_gateway}> \"},{\"Name\":\"密码\",\"Value\":\"/opt/yunji/osinstall/huawei/oob.sh -u root -p calvin\"}]}]','','v1.4','Success'),(4,'2017-01-17 06:44:54','2017-01-17 09:38:37',NULL,'浪潮','','通用型号','','','','No','[{\"name\":\"RAID\",\"data\":[{\"name\":\"RAID 1\",\"type\":\"select\",\"data\":[{\"name\":\"前两块盘 RAID 1\",\"value\":\"/opt/yunji/osinstall/inspur/raid.sh -c -r 1 -d 0,1\"}],\"tpl\":\"\",\"input\":\"\",\"default\":\"/opt/yunji/osinstall/inspur/raid.sh -c -r 1 -d 0,1\"},{\"name\":\"RAID 5\",\"type\":\"select\",\"data\":[{\"name\":\"剩下的盘 RAID 5\",\"value\":\"/opt/yunji/osinstall/inspur/raid.sh -r 5 -d 2- -i\"}],\"tpl\":\"/opt/yunji/osinstall/dell/raid.sh -r 10 -d 2-\",\"input\":\"\",\"default\":\"/opt/yunji/osinstall/inspur/raid.sh -r 5 -d 2- -i\"}]},{\"name\":\"OOB\",\"data\":[{\"name\":\"网络类型\",\"type\":\"select\",\"data\":[{\"name\":\"DHCP\",\"value\":\"/opt/yunji/osinstall/inspur/oob.sh -n dhcp\",\"checked\":false},{\"name\":\"静态IP\",\"value\":\"/opt/yunji/osinstall/inspur/oob.sh -n static -i <{manage_ip}> -m <{manage_netmask}> -g <{manage_gateway}> \",\"checked\":true}],\"default\":\"/opt/yunji/osinstall/inspur/oob.sh -n static -i <{manage_ip}> -m <{manage_netmask}> -g <{manage_gateway}> \"},{\"name\":\"用户名\",\"type\":\"input\",\"tpl\":\"/opt/yunji/osinstall/inspur/oob.sh -u <{##}>\",\"default\":\"/opt/yunji/osinstall/inspur/oob.sh -u root\",\"input\":\"root\",\"value\":\"/opt/yunji/osinstall/inspur/oob.sh -u root\"},{\"name\":\"密码\",\"type\":\"input\",\"tpl\":\"/opt/yunji/osinstall/inspur/oob.sh -p <{##}>\",\"default\":\"/opt/yunji/osinstall/inspur/oob.sh -u root -p calvin\",\"input\":\"calvin\"}]}]','[{\"Name\":\"RAID\",\"Data\":[{\"Name\":\"RAID 1\",\"Value\":\"/opt/yunji/osinstall/inspur/raid.sh -c -r 1 -d 0,1\"},{\"Name\":\"RAID 5\",\"Value\":\"/opt/yunji/osinstall/inspur/raid.sh -r 5 -d 2- -i\"}]},{\"Name\":\"OOB\",\"Data\":[{\"Name\":\"网络类型\",\"Value\":\"/opt/yunji/osinstall/inspur/oob.sh -n static -i <{manage_ip}> -m <{manage_netmask}> -g <{manage_gateway}> \"},{\"Name\":\"密码\",\"Value\":\"/opt/yunji/osinstall/inspur/oob.sh -u root -p calvin\"}]}]','','v1.4','Success'),(5,'2017-01-17 06:45:43','2017-01-17 09:38:39',NULL,'联想','','通用型号','','','','No','[{\"name\":\"RAID\",\"data\":[{\"name\":\"RAID 1\",\"type\":\"select\",\"data\":[{\"name\":\"前两块盘 RAID 1\",\"value\":\"/opt/yunji/osinstall/lenovo/raid.sh -c -r 1 -d 0,1\"}],\"tpl\":\"\",\"input\":\"\",\"default\":\"/opt/yunji/osinstall/lenovo/raid.sh -c -r 1 -d 0,1\"},{\"name\":\"RAID 5\",\"type\":\"select\",\"data\":[{\"name\":\"剩下的盘 RAID 5\",\"value\":\"/opt/yunji/osinstall/lenovo/raid.sh -r 5 -d 2- -i\"}],\"tpl\":\"/opt/yunji/osinstall/dell/raid.sh -r 10 -d 2-\",\"input\":\"\",\"default\":\"/opt/yunji/osinstall/lenovo/raid.sh -r 5 -d 2- -i\"}]},{\"name\":\"OOB\",\"data\":[{\"name\":\"网络类型\",\"type\":\"select\",\"data\":[{\"name\":\"DHCP\",\"value\":\"/opt/yunji/osinstall/lenovo/oob.sh -n dhcp\",\"checked\":false},{\"name\":\"静态IP\",\"value\":\"/opt/yunji/osinstall/lenovo/oob.sh -n static -i <{manage_ip}> -m <{manage_netmask}> -g <{manage_gateway}> \",\"checked\":true}],\"default\":\"/opt/yunji/osinstall/lenovo/oob.sh -n static -i <{manage_ip}> -m <{manage_netmask}> -g <{manage_gateway}> \"},{\"name\":\"用户名\",\"type\":\"input\",\"tpl\":\"/opt/yunji/osinstall/lenovo/oob.sh -u <{##}>\",\"default\":\"/opt/yunji/osinstall/lenovo/oob.sh -u root\",\"input\":\"root\",\"value\":\"/opt/yunji/osinstall/lenovo/oob.sh -u root\"},{\"name\":\"密码\",\"type\":\"input\",\"tpl\":\"/opt/yunji/osinstall/lenovo/oob.sh -p <{##}>\",\"default\":\"/opt/yunji/osinstall/lenovo/oob.sh -u root -p calvin\",\"input\":\"calvin\"}]}]','[{\"Name\":\"RAID\",\"Data\":[{\"Name\":\"RAID 1\",\"Value\":\"/opt/yunji/osinstall/lenovo/raid.sh -c -r 1 -d 0,1\"},{\"Name\":\"RAID 5\",\"Value\":\"/opt/yunji/osinstall/lenovo/raid.sh -r 5 -d 2- -i\"}]},{\"Name\":\"OOB\",\"Data\":[{\"Name\":\"网络类型\",\"Value\":\"/opt/yunji/osinstall/lenovo/oob.sh -n static -i <{manage_ip}> -m <{manage_netmask}> -g <{manage_gateway}> \"},{\"Name\":\"密码\",\"Value\":\"/opt/yunji/osinstall/lenovo/oob.sh -u root -p calvin\"}]}]','','v1.4','Success');
/*!40000 ALTER TABLE `hardwares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ips`
--

DROP TABLE IF EXISTS `ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ips` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `network_id` int(10) unsigned NOT NULL,
  `ip` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `network_id_ip` (`network_id`,`ip`),
  KEY `network_id` (`network_id`) USING BTREE,
  KEY `ip` (`ip`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ips`
--

LOCK TABLES `ips` WRITE;
/*!40000 ALTER TABLE `ips` DISABLE KEYS */;
/*!40000 ALTER TABLE `ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `pid` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `macs`
--

DROP TABLE IF EXISTS `macs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `macs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `device_id` int(11) unsigned NOT NULL,
  `mac` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mac` (`mac`),
  KEY `device_id` (`device_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `macs`
--

LOCK TABLES `macs` WRITE;
/*!40000 ALTER TABLE `macs` DISABLE KEYS */;
/*!40000 ALTER TABLE `macs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manage_ips`
--

DROP TABLE IF EXISTS `manage_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manage_ips` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `network_id` int(10) unsigned NOT NULL,
  `ip` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `network_id_ip` (`network_id`,`ip`),
  KEY `network_id` (`network_id`) USING BTREE,
  KEY `ip` (`ip`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manage_ips`
--

LOCK TABLES `manage_ips` WRITE;
/*!40000 ALTER TABLE `manage_ips` DISABLE KEYS */;
/*!40000 ALTER TABLE `manage_ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manage_networks`
--

DROP TABLE IF EXISTS `manage_networks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manage_networks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `network` varchar(255) NOT NULL,
  `netmask` varchar(255) NOT NULL,
  `gateway` varchar(255) NOT NULL,
  `vlan` varchar(255) DEFAULT NULL,
  `trunk` varchar(255) DEFAULT NULL,
  `bonding` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `network` (`network`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manage_networks`
--

LOCK TABLES `manage_networks` WRITE;
/*!40000 ALTER TABLE `manage_networks` DISABLE KEYS */;
/*!40000 ALTER TABLE `manage_networks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `device_id` int(11) unsigned NOT NULL,
  `company` varchar(255) NOT NULL,
  `product` varchar(255) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL COMMENT '序列号',
  `ip` varchar(255) DEFAULT NULL,
  `mac` varchar(255) DEFAULT NULL COMMENT 'mac地址',
  `nic` longtext,
  `cpu` longtext,
  `memory` longtext,
  `disk` longtext,
  `cpu_sum` int(11) DEFAULT '0' COMMENT 'CPU总核数',
  `memory_sum` int(11) DEFAULT '0' COMMENT '内存总容量',
  `disk_sum` int(11) DEFAULT '0' COMMENT '硬盘总容量',
  `motherboard` longtext,
  `raid` longtext,
  `oob` longtext,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `is_vm` enum('Yes','No') NOT NULL DEFAULT 'No',
  `is_show_in_scan_list` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `nic_device` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `device_id` (`device_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturers`
--

LOCK TABLES `manufacturers` WRITE;
/*!40000 ALTER TABLE `manufacturers` DISABLE KEYS */;
/*!40000 ALTER TABLE `manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `networks`
--

DROP TABLE IF EXISTS `networks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `networks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `network` varchar(255) NOT NULL,
  `netmask` varchar(255) NOT NULL,
  `gateway` varchar(255) NOT NULL,
  `vlan` varchar(255) DEFAULT NULL,
  `trunk` varchar(255) DEFAULT NULL,
  `bonding` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `network` (`network`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `networks`
--

LOCK TABLES `networks` WRITE;
/*!40000 ALTER TABLE `networks` DISABLE KEYS */;
/*!40000 ALTER TABLE `networks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `os_configs`
--

DROP TABLE IF EXISTS `os_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `os_configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `pxe` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os_configs`
--

LOCK TABLES `os_configs` WRITE;
/*!40000 ALTER TABLE `os_configs` DISABLE KEYS */;
INSERT INTO `os_configs` VALUES (1,'2015-11-24 16:00:44','2015-12-10 11:09:07',NULL,'centos6u7-x86_64','DEFAULT centos6.7\nLABEL centos6.7\nKERNEL http://osinstall.idcos.com/centos/6.7/os/x86_64/images/pxeboot/vmlinuz\nAPPEND initrd=http://osinstall.idcos.com/centos/6.7/os/x86_64/images/pxeboot/initrd.img ksdevice=bootif ks=http://osinstall.idcos.com/api/osinstall/v1/device/getSystemBySn?sn={sn} console=tty0 selinux=0 biosdevname=0\nIPAPPEND 2'),(2,'2015-12-08 17:41:50','2015-12-10 11:10:24',NULL,'sles11sp4-x86_64','DEFAULT sles11sp4\nLABEL sles11sp4\nKERNEL http://osinstall.idcos.com/sles/11sp4/os/x86_64/boot/x86_64/loader/linux\nAPPEND initrd=http://osinstall.idcos.com/sles/11sp4/os/x86_64/boot/x86_64/loader/initrd netdevice=bootif install=http://osinstall.idcos.com/sles/11sp4/os/x86_64/ autoyast=http://osinstall.idcos.com/api/osinstall/v1/device/getSystemBySn?sn={sn} console=tty0 selinux=0 biosdevname=0 textmode=1\nIPAPPEND 2'),(3,'2015-12-09 15:37:03','2015-12-10 11:11:13',NULL,'rhel7u2-x86_64','DEFAULT rhel7.2\nLABEL rhel7.2\nKERNEL http://osinstall.idcos.com/rhel/7.2/os/x86_64/images/pxeboot/vmlinuz\nAPPEND initrd=http://osinstall.idcos.com/rhel/7.2/os/x86_64/images/pxeboot/initrd.img ksdevice=bootif ks=http://osinstall.idcos.com/api/osinstall/v1/device/getSystemBySn?sn={sn} console=tty0 selinux=0 net.ifnames=0 biosdevname=0\nIPAPPEND 2'),(4,'2016-02-01 11:35:40','2016-02-01 11:45:49',NULL,'esxi6.0u1-x86_64','DEFAULT esxi\nLABEL esxi\nMENU LABEL ^ESXi 6.0U1\nKERNEL http://osinstall.idcos.com/esxi/6.0u1/mboot.c32\nAPPEND -c http://osinstall.idcos.com/esxi/6.0u1/boot.cfg ks=http://osinstall.idcos.com/api/osinstall/v1/device/getSystemBySn?sn={sn}'),(5,'2016-02-17 12:08:14','2016-02-29 16:16:01',NULL,'win2008r2-x86_64','DEFAULT winpe\nLABEL winpe\nMENU LABEL ^WinPE\nKERNEL memdisk\nAPPEND initrd=http://osinstall.idcos.com/winpe/winpe.iso iso raw'),(6,'2016-02-29 11:04:57','2016-02-29 16:16:07',NULL,'win2012r2-x86_64','DEFAULT winpe\nLABEL winpe\nMENU LABEL ^WinPE\nKERNEL memdisk\nAPPEND initrd=http://osinstall.idcos.com/winpe/winpe.iso iso raw'),(7,'2016-03-29 08:40:22','2016-03-29 08:40:22',NULL,'ubuntu1404-x86_64','DEFAULT ubuntu14.04\nLABEL ubuntu14.04\nKERNEL http://osinstall.idcos.com/ubuntu/14.04/os/x86_64/install/netboot/ubuntu-installer/amd64/linux\nAPPEND initrd=http://osinstall.idcos.com/ubuntu/14.04/os/x86_64/install/netboot/ubuntu-installer/amd64/initrd.gz auto=true priority=critical net.ifnames=1 biosdevname=0 netcfg/choose_interface=auto preseed/url=http://osinstall.idcos.com/api/osinstall/v1/device/getSystemBySn?sn={sn} --'),(8,'2016-06-19 21:56:09','2016-06-19 21:56:09',NULL,'xenserver6.5-x86_64','DEFAULT xenserver\nLABEL xenserver\nMENU LABEL ^XenServer 6.5\nKERNEL http://osinstall.idcos.com/xenserver/6.5/boot/pxelinux/mboot.c32\nAPPEND http://osinstall.idcos.com/xenserver/6.5/boot/xen.gz dom0_max_vcpus=1-2 dom0_mem=752M,max:752M com1=115200,8n1 console=com1,vga --- http://osinstall.idcos.com/xenserver/6.5/boot/vmlinuz xencons=hvc console=hvc0 console=tty0 answerfile=http://osinstall.idcos.com/api/osinstall/v1/device/getSystemBySn?sn={sn} install --- http://osinstall.idcos.com/xenserver/6.5/install.img');
/*!40000 ALTER TABLE `os_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platform_configs`
--

DROP TABLE IF EXISTS `platform_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platform_configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `content` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform_configs`
--

LOCK TABLES `platform_configs` WRITE;
/*!40000 ALTER TABLE `platform_configs` DISABLE KEYS */;
INSERT INTO `platform_configs` VALUES (1,'2016-05-30 09:32:47','2016-05-30 09:32:47',NULL,'IsShowVmFunction',''),(2,'2016-05-30 09:32:47','2016-05-30 09:32:47',NULL,'Version','v1.3.1');
/*!40000 ALTER TABLE `platform_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_configs`
--

DROP TABLE IF EXISTS `system_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `content` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_configs`
--

LOCK TABLES `system_configs` WRITE;
/*!40000 ALTER TABLE `system_configs` DISABLE KEYS */;
INSERT INTO `system_configs` VALUES (1,'2015-11-25 10:24:10','2016-06-30 08:45:30',NULL,'centos6.7','install\nurl --url=http://osinstall.idcos.com/centos/6.7/os/x86_64/\nlang en_US.UTF-8\nkeyboard us\nnetwork --onboot yes --device bootif --bootproto dhcp --noipv6\nrootpw  --iscrypted $6$eAdCfx9hZjVMqyS6$BYIbEu4zeKp0KLnz8rLMdU7sQ5o4hQRv55o151iLX7s2kSq.5RVsteGWJlpPMqIRJ8.WUcbZC3duqX0Rt3unK/\nfirewall --disabled\nauthconfig --enableshadow --passalgo=sha512\nselinux --disabled\ntimezone Asia/Shanghai\ntext\nreboot\nzerombr\nbootloader --location=mbr --append=\"console=tty0 biosdevname=0 audit=0 selinux=0\"\nclearpart --all --initlabel\npart /boot --fstype=ext4 --size=256\npart swap --size=2048\npart / --fstype=ext4 --size=100 --grow\n\n%packages --ignoremissing\n@base\n@core\n@development\n\n%pre\nif dmidecode | grep -qEi \'VMware|VirtualBox|KVM|Xen|Parallels\'; then\n    _sn=$(sed q /sys/class/net/*/address)\nelse\n    _sn=$(dmidecode -s system-serial-number 2>/dev/null | awk \'/^[^#]/ { print $1 }\')\nfi\n\ncurl -H \"Content-Type: application/json\" -X POST -d \"{\\\"Sn\\\":\\\"$_sn\\\",\\\"Title\\\":\\\"启动OS安装程序\\\",\\\"InstallProgress\\\":0.6,\\\"InstallLog\\\":\\\"SW5zdGFsbCBPUwo=\\\"}\" http://osinstall.idcos.com/api/osinstall/v1/report/deviceInstallInfo\ncurl -H \"Content-Type: application/json\" -X POST -d \"{\\\"Sn\\\":\\\"$_sn\\\",\\\"Title\\\":\\\"分区并安装软件包\\\",\\\"InstallProgress\\\":0.7,\\\"InstallLog\\\":\\\"SW5zdGFsbCBPUwo=\\\"}\" http://osinstall.idcos.com/api/osinstall/v1/report/deviceInstallInfo\n\n%post\nprogress() {\n    curl -H \"Content-Type: application/json\" -X POST -d \"{\\\"Sn\\\":\\\"$_sn\\\",\\\"Title\\\":\\\"$1\\\",\\\"InstallProgress\\\":$2,\\\"InstallLog\\\":\\\"$3\\\"}\" http://osinstall.idcos.com/api/osinstall/v1/report/deviceInstallInfo\n}\n\nif dmidecode | grep -qEi \'VMware|VirtualBox|KVM|Xen|Parallels\'; then\n    _sn=$(sed q /sys/class/net/*/address)\nelse\n    _sn=$(dmidecode -s system-serial-number 2>/dev/null | awk \'/^[^#]/ { print $1 }\')\nfi\n\nprogress \"配置主机名和网络\" 0.8 \"Y29uZmlnIG5ldHdvcmsK\"\n\n# config network\ncurl -o /tmp/networkinfo \"http://osinstall.idcos.com/api/osinstall/v1/device/getNetworkBySn?sn=${_sn}&type=raw\"\nsource /tmp/networkinfo\n\ncat > /etc/sysconfig/network <<EOF\nNETWORKING=yes\nHOSTNAME=$HOSTNAME\nGATEWAY=$GATEWAY\nNOZEROCONF=yes\nNETWORKING_IPV6=no\nIPV6INIT=no\nPEERNTP=no\nEOF\n\ncat > /etc/sysconfig/network-scripts/ifcfg-eth0 <<EOF\nDEVICE=eth0\nBOOTPROTO=static\nIPADDR=$IPADDR\nNETMASK=$NETMASK\nONBOOT=yes\nTYPE=Ethernet\nNM_CONTROLLED=no\nEOF\n\nprogress \"添加用户\" 0.85 \"YWRkIHVzZXIgeXVuamkK\"\n#useradd admin\n\nprogress \"配置系统服务\" 0.9 \"Y29uZmlnIHN5c3RlbSBzZXJ2aWNlCg==\"\n\n# config service\nservice=(crond network ntpd rsyslog sshd sysstat)\nchkconfig --list | awk \'{ print $1 }\' | xargs -n1 -I@ chkconfig @ off\necho ${service[@]} | xargs -n1 | xargs -I@ chkconfig @ on\n\nprogress \"调整系统参数\" 0.95 \"Y29uZmlnIGJhc2ggcHJvbXB0Cg==\"\n\n# custom bash prompt\ncat >> /etc/profile <<\'EOF\'\n\nexport LANG=en_US.UTF8\nexport PS1=\'\\n\\e[1;37m[\\e[m\\e[1;32m\\u\\e[m\\e[1;33m@\\e[m\\e[1;35m\\H\\e[m:\\e[4m`pwd`\\e[m\\e[1;37m]\\e[m\\e[1;36m\\e[m\\n\\$ \'\nexport HISTTIMEFORMAT=\'[%F %T] \'\nEOF\n\nprogress \"安装完成\" 1 \"aW5zdGFsbCBmaW5pc2hlZAo=\"'),(2,'2015-12-08 17:45:45','2016-03-29 09:25:11',NULL,'sles11sp4','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<!DOCTYPE profile>\n\n<profile xmlns=\"http://www.suse.com/1.0/yast2ns\" xmlns:config=\"http://www.suse.com/1.0/configns\">  \n  <add-on/>  \n  <bootloader> \n    <device_map config:type=\"list\"> \n      <device_map_entry> \n        <firmware>hd0</firmware>  \n        <linux>/dev/sda</linux> \n      </device_map_entry> \n    </device_map>  \n    <global> \n      <activate>true</activate>  \n      <default>SUSE Linux Enterprise Server 11 SP4 - 3.0.101-63</default>  \n      <generic_mbr>true</generic_mbr>  \n      <gfxmenu>(hd0,0)/message</gfxmenu>  \n      <lines_cache_id>2</lines_cache_id>  \n      <timeout config:type=\"integer\">8</timeout> \n    </global>  \n    <initrd_modules config:type=\"list\"> \n      <initrd_module> \n        <module>megaraid_sas</module> \n      </initrd_module> \n    </initrd_modules>  \n    <loader_type>grub</loader_type>  \n    <sections config:type=\"list\"> \n      <section> \n        <append>console=tty0 selinux=0 biosdevname=0 resume=/dev/sda2 splash=silent showopts</append>  \n        <image>(hd0,0)/vmlinuz-3.0.101-63-default</image>  \n        <initial>1</initial>  \n        <initrd>(hd0,0)/initrd-3.0.101-63-default</initrd>  \n        <lines_cache_id>0</lines_cache_id>  \n        <name>SUSE Linux Enterprise Server 11 SP4 - 3.0.101-63</name>  \n        <original_name>linux</original_name>  \n        <root>/dev/sda3</root>  \n        <type>image</type> \n      </section>  \n      <section> \n        <append>showopts ide=nodma apm=off noresume edd=off powersaved=off nohz=off highres=off processor.max_cstate=1 nomodeset x11failsafe</append>  \n        <image>(hd0,0)/vmlinuz-3.0.101-63-default</image>  \n        <initrd>(hd0,0)/initrd-3.0.101-63-default</initrd>  \n        <lines_cache_id>1</lines_cache_id>  \n        <name>Failsafe -- SUSE Linux Enterprise Server 11 SP4 - 3.0.101-63</name>  \n        <original_name>failsafe</original_name>  \n        <root>/dev/sda3</root>  \n        <type>image</type> \n      </section> \n    </sections> \n  </bootloader>  \n  <deploy_image> \n    <image_installation config:type=\"boolean\">false</image_installation> \n  </deploy_image>  \n  <firewall> \n    <enable_firewall config:type=\"boolean\">false</enable_firewall> \n  </firewall>  \n  <general> \n    <ask-list config:type=\"list\"/>  \n    <mode> \n      <confirm config:type=\"boolean\">false</confirm> \n    </mode>  \n    <mouse> \n      <id>none</id> \n    </mouse>  \n    <proposals config:type=\"list\"/>  \n    <storage/> \n  </general>  \n  <groups config:type=\"list\"/>  \n  <group> \n    <encrypted config:type=\"boolean\">true</encrypted>  \n    <gid>0</gid>  \n    <group_password>x</group_password>  \n    <groupname>root</groupname>  \n    <userlist/> \n  </group>  \n  <host> \n    <hosts config:type=\"list\">\n      <hosts_entry>\n        <host_address>127.0.0.1</host_address>  \n        <names config:type=\"list\">\n          <name>localhost</name> \n        </names> \n      </hosts_entry> \n    </hosts> \n  </host>  \n  <kdump> \n    <add_crash_kernel config:type=\"boolean\">false</add_crash_kernel> \n  </kdump>  \n  <keyboard> \n    <keymap>english-us</keymap> \n  </keyboard>  \n  <language> \n    <language>en_US</language>  \n    <languages>en_US</languages> \n  </language>  \n  <login_settings/>  \n  <networking>\n    <dhcp_options>\n      <dhclient_client_id></dhclient_client_id>\n      <dhclient_hostname_option>AUTO</dhclient_hostname_option>\n    </dhcp_options>\n    <dns>\n      <dhcp_hostname config:type=\"boolean\">true</dhcp_hostname>\n      <domain>localdomain</domain>\n      <hostname>localhost</hostname>\n      <resolv_conf_policy>auto</resolv_conf_policy>\n      <write_hostname config:type=\"boolean\">false</write_hostname>\n    </dns>\n    <interfaces config:type=\"list\"> \n      <interface> \n        <bootproto>dhcp4</bootproto>  \n        <device>eth0</device>  \n        <startmode>auto</startmode> \n      </interface>  \n      <interface> \n        <aliases> \n          <alias> \n            <IPADDR>127.0.0.2</IPADDR>  \n            <NETMASK>255.0.0.0</NETMASK>  \n            <PREFIXLEN>8</PREFIXLEN> \n          </alias> \n        </aliases>  \n        <broadcast>127.255.255.255</broadcast>  \n        <device>lo</device>  \n        <firewall>no</firewall>  \n        <ipaddr>127.0.0.1</ipaddr>  \n        <netmask>255.0.0.0</netmask>  \n        <network>127.0.0.0</network>  \n        <prefixlen>8</prefixlen>  \n        <startmode>auto</startmode>  \n        <usercontrol>no</usercontrol> \n      </interface> \n    </interfaces>  \n    <ipv6 config:type=\"boolean\">false</ipv6>  \n    <managed config:type=\"boolean\">false</managed>  \n    <routing> \n      <ip_forward config:type=\"boolean\">false</ip_forward> \n    </routing> \n  </networking>  \n  <nis> \n    <netconfig_policy>auto</netconfig_policy>  \n  </nis>  \n  <partitioning config:type=\"list\"> \n    <drive> \n      <device>/dev/sda</device>  \n      <initialize config:type=\"boolean\">true</initialize>  \n      <partitions config:type=\"list\"> \n        <partition> \n          <create config:type=\"boolean\">true</create>  \n          <crypt_fs config:type=\"boolean\">false</crypt_fs>  \n          <filesystem config:type=\"symbol\">ext3</filesystem>  \n          <format config:type=\"boolean\">true</format>  \n          <fstopt>acl,user_xattr</fstopt>  \n          <loop_fs config:type=\"boolean\">false</loop_fs>  \n          <mount>/boot</mount>  \n          <mountby config:type=\"symbol\">id</mountby>  \n          <partition_id config:type=\"integer\">131</partition_id>  \n          <partition_nr config:type=\"integer\">1</partition_nr>  \n          <resize config:type=\"boolean\">false</resize>  \n          <size>256M</size> \n        </partition>  \n        <partition> \n          <create config:type=\"boolean\">true</create>  \n          <crypt_fs config:type=\"boolean\">false</crypt_fs>  \n          <filesystem config:type=\"symbol\">swap</filesystem>  \n          <format config:type=\"boolean\">true</format>  \n          <fstopt>defaults</fstopt>  \n          <loop_fs config:type=\"boolean\">false</loop_fs>  \n          <mount>swap</mount>  \n          <mountby config:type=\"symbol\">id</mountby>  \n          <partition_id config:type=\"integer\">130</partition_id>  \n          <partition_nr config:type=\"integer\">2</partition_nr>  \n          <resize config:type=\"boolean\">false</resize>  \n          <size>2G</size> \n        </partition>  \n        <partition> \n          <create config:type=\"boolean\">true</create>  \n          <crypt_fs config:type=\"boolean\">false</crypt_fs>  \n          <filesystem config:type=\"symbol\">ext3</filesystem>  \n          <format config:type=\"boolean\">true</format>  \n          <fstopt>acl,user_xattr</fstopt>  \n          <loop_fs config:type=\"boolean\">false</loop_fs>  \n          <mount>/</mount>  \n          <mountby config:type=\"symbol\">id</mountby>  \n          <partition_id config:type=\"integer\">131</partition_id>  \n          <partition_nr config:type=\"integer\">3</partition_nr>  \n          <resize config:type=\"boolean\">false</resize>  \n          <size>100%</size> \n        </partition> \n      </partitions>  \n      <pesize/>  \n      <type config:type=\"symbol\">CT_DISK</type>  \n      <use>all</use> \n    </drive> \n  </partitioning>  \n  <proxy> \n    <enabled config:type=\"boolean\">false</enabled> \n  </proxy>  \n  <runlevel> \n    <default>3</default> \n  </runlevel>  \n  <software> \n    <patterns config:type=\"list\"> \n      <pattern>Basis-Devel</pattern>  \n      <pattern>base</pattern>  \n      <pattern>Minimal</pattern> \n    </patterns> \n  </software>  \n  <timezone> \n    <hwclock>localtime</hwclock>  \n    <timezone>Asia/Shanghai</timezone> \n  </timezone>  \n  <user_defaults> \n    <group>100</group>  \n    <groups>video,dialout</groups>  \n    <home>/home</home>  \n    <inactive>-1</inactive>  \n    <shell>/bin/bash</shell>  \n    <skel>/etc/skel</skel>  \n    <umask>022</umask> \n  </user_defaults>  \n  <users config:type=\"list\"/>  \n  <user> \n    <encrypted config:type=\"boolean\">true</encrypted>  \n    <fullname>root</fullname>  \n    <gid>0</gid>  \n    <home>/root</home>  \n    <password_settings> \n      <expire/>  \n      <flag/>  \n      <inact/>  \n      <max/>  \n      <min/>  \n      <warn/> \n    </password_settings>  \n    <shell>/bin/bash</shell>  \n    <uid>0</uid>  \n    <user_password>$2y$05$P58A74K8q3STIFopY0zj/eaq9Uk.K1khj8yeuJJDq4LinaEOf1Uy.</user_password>  \n    <username>root</username> \n  </user>  \n  <scripts> \n    <pre-scripts config:type=\"list\"> \n      <script> \n        <interpreter>shell</interpreter>  \n        <source> <![CDATA[\n#!/bin/bash\n_sn=$(dmidecode -s system-serial-number 2>/dev/null | awk \'/^[^#]/ { print $1 }\')\ncurl -H \"Content-Type: application/json\" -X POST -d \"{\\\"Sn\\\":\\\"$_sn\\\",\\\"Title\\\":\\\"启动OS安装程序\\\",\\\"InstallProgress\\\":0.6,\\\"InstallLog\\\":\\\"SW5zdGFsbCBPUwo=\\\"}\" http://osinstall.idcos.com/api/osinstall/v1/report/deviceInstallInfo\ncurl -H \"Content-Type: application/json\" -X POST -d \"{\\\"Sn\\\":\\\"$_sn\\\",\\\"Title\\\":\\\"分区并安装软件包\\\",\\\"InstallProgress\\\":0.7,\\\"InstallLog\\\":\\\"SW5zdGFsbCBPUwo=\\\"}\" http://osinstall.idcos.com/api/osinstall/v1/report/deviceInstallInfo\n]]> </source> \n      </script> \n    </pre-scripts>  \n    <post-scripts config:type=\"list\"> \n      <script> \n        <interpreter>shell</interpreter>  \n        <source> <![CDATA[\n#!/bin/bash\nprogress() {\n    curl -H \"Content-Type: application/json\" -X POST -d \"{\\\"Sn\\\":\\\"$_sn\\\",\\\"Title\\\":\\\"$1\\\",\\\"InstallProgress\\\":$2,\\\"InstallLog\\\":\\\"$3\\\"}\" http://osinstall.idcos.com/api/osinstall/v1/report/deviceInstallInfo\n}\n\n_sn=$(dmidecode -s system-serial-number 2>/dev/null | awk \'/^[^#]/ { print $1 }\')\n\nprogress \"配置主机名和网络\" 0.8 \"Y29uZmlnIG5ldHdvcmsK\"\n\n# config network\ncurl -o /tmp/networkinfo \"http://osinstall.idcos.com/api/osinstall/v1/device/getNetworkBySn?sn=${_sn}&type=raw\"\nsource /tmp/networkinfo\n\nhostname $HOSTNAME\ncat > /etc/HOSTNAME <<EOF\n$HOSTNAME\nEOF\n\ncat > /etc/sysconfig/network/ifcfg-eth0 <<EOF\nBOOTPROTO=\'static\'\nSTARTMODE=\'auto\'\nNAME=\'eth0\'\nBROADCAST=\'\'\nETHTOOL_OPTIONS=\'\'\nIPADDR=$IPADDR\nNETMASK=$NETMASK\nMTU=\'\'\nNETWORK=\'\'\nREMOTE_IPADDR=\'\'\nUSERCONTROL=\'no\'\nEOF\n\ncat > /etc/sysconfig/network/routes <<EOF\ndefault $GATEWAY - -\nEOF\n\nprogress \"添加用户\" 0.85 \"YWRkIHVzZXIgeXVuamkK\"\necho \'root:yunjikeji\' | chpasswd\n\nprogress \"配置系统服务\" 0.9 \"Y29uZmlnIHN5c3RlbSBzZXJ2aWNlCg==\"\n\n# config service\n\nprogress \"调整系统参数\" 0.95 \"Y29uZmlnIGJhc2ggcHJvbXB0Cg==\"\n\n# custom bash prompt\ncat >> /etc/profile <<\'EOF\'\n\nexport LANG=en_US.UTF8\nexport PS1=\'\\n\\e[1;37m[\\e[m\\e[1;32m\\u\\e[m\\e[1;33m@\\e[m\\e[1;35m\\H\\e[m:\\e[4m`pwd`\\e[m\\e[1;37m]\\e[m\\e[1;36m\\e[m\\n\\$ \'\nexport HISTTIMEFORMAT=\'[%F %T] \'\nEOF\n\nprogress \"安装完成\" 1 \"aW5zdGFsbCBmaW5pc2hlZAo=\"\n]]> </source> \n      </script> \n    </post-scripts> \n  </scripts> \n</profile>'),(3,'2015-12-09 15:39:28','2016-06-30 08:45:30',NULL,'rhel7.2','install\nurl --url=http://osinstall.idcos.com/rhel/7.2/os/x86_64/\nlang en_US.UTF-8\nkeyboard --vckeymap=us --xlayouts=\'us\'\nnetwork --bootproto=dhcp --device=eth0 --noipv6 --activate\nrootpw --iscrypted $6$hrKVIh4.DTVDR2Fp$Q.ho5bHXzIoKmaXGJCSbBnC5PaXNe5wbrcbe70mMlZON20aX.BGySazXrfs0ePnTDrCF8JRzDmH8815CbaAVn.\nfirewall --disabled\nauth --enableshadow --passalgo=sha512\nselinux --disabled\ntimezone Asia/Shanghai --isUtc\ntext\nreboot\nzerombr\nbootloader --location=mbr --append=\"console=tty0 net.ifnames=0 biosdevname=0 audit=0 selinux=0\"\nclearpart --all --initlabel\npart /boot --fstype=ext4 --size=256\npart swap --size=2048\npart / --fstype=ext4 --size=100 --grow\n\n%packages --ignoremissing\n@base\n@core\n@development\n%end\n\n%pre\nif dmidecode | grep -qEi \'VMware|VirtualBox|KVM|Xen|Parallels\'; then\n    _sn=$(sed q /sys/class/net/*/address)\nelse\n    _sn=$(dmidecode -s system-serial-number 2>/dev/null | awk \'/^[^#]/ { print $1 }\')\nfi\n\ncurl -H \"Content-Type: application/json\" -X POST -d \"{\\\"Sn\\\":\\\"$_sn\\\",\\\"Title\\\":\\\"启动OS安装程序\\\",\\\"InstallProgress\\\":0.6,\\\"InstallLog\\\":\\\"SW5zdGFsbCBPUwo=\\\"}\" http://osinstall.idcos.com/api/osinstall/v1/report/deviceInstallInfo\ncurl -H \"Content-Type: application/json\" -X POST -d \"{\\\"Sn\\\":\\\"$_sn\\\",\\\"Title\\\":\\\"分区并安装软件包\\\",\\\"InstallProgress\\\":0.7,\\\"InstallLog\\\":\\\"SW5zdGFsbCBPUwo=\\\"}\" http://osinstall.idcos.com/api/osinstall/v1/report/deviceInstallInfo\n%end\n\n%post\nprogress() {\n    curl -H \"Content-Type: application/json\" -X POST -d \"{\\\"Sn\\\":\\\"$_sn\\\",\\\"Title\\\":\\\"$1\\\",\\\"InstallProgress\\\":$2,\\\"InstallLog\\\":\\\"$3\\\"}\" http://osinstall.idcos.com/api/osinstall/v1/report/deviceInstallInfo\n}\n\nif dmidecode | grep -qEi \'VMware|VirtualBox|KVM|Xen|Parallels\'; then\n    _sn=$(sed q /sys/class/net/*/address)\nelse\n    _sn=$(dmidecode -s system-serial-number 2>/dev/null | awk \'/^[^#]/ { print $1 }\')\nfi\n\nprogress \"配置主机名和网络\" 0.8 \"Y29uZmlnIG5ldHdvcmsK\"\n\n# config network\ncurl -o /tmp/networkinfo \"http://osinstall.idcos.com/api/osinstall/v1/device/getNetworkBySn?sn=${_sn}&type=raw\"\nsource /tmp/networkinfo\n\necho \"$HOSTNAME\" > /etc/hostname\n\ncat > /etc/sysconfig/network <<EOF\nNETWORKING=yes\nGATEWAY=$GATEWAY\nNOZEROCONF=yes\nNETWORKING_IPV6=no\nIPV6INIT=no\nPEERNTP=no\nEOF\n\ncat > /etc/sysconfig/network-scripts/ifcfg-eth0 <<EOF\nDEVICE=eth0\nBOOTPROTO=static\nIPADDR=$IPADDR\nNETMASK=$NETMASK\nONBOOT=yes\nTYPE=Ethernet\nNM_CONTROLLED=no\nEOF\n\nprogress \"添加用户\" 0.85 \"YWRkIHVzZXIgeXVuamkK\"\n#useradd admin\n\nprogress \"配置系统服务\" 0.9 \"Y29uZmlnIHN5c3RlbSBzZXJ2aWNlCg==\"\n\n# config service\nservice=(crond network ntpd rsyslog sshd sysstat)\nchkconfig --list | awk \'{ print $1 }\' | xargs -n1 -I@ chkconfig @ off\necho ${service[@]} | xargs -n1 | xargs -I@ chkconfig @ on\n\nprogress \"调整系统参数\" 0.95 \"Y29uZmlnIGJhc2ggcHJvbXB0Cg==\"\n\n# custom bash prompt\ncat >> /etc/profile <<\'EOF\'\n\nexport LANG=en_US.UTF8\nexport PS1=\'\\n\\e[1;37m[\\e[m\\e[1;32m\\u\\e[m\\e[1;33m@\\e[m\\e[1;35m\\H\\e[m:\\e[4m`pwd`\\e[m\\e[1;37m]\\e[m\\e[1;36m\\e[m\\n\\$ \'\nexport HISTTIMEFORMAT=\'[%F %T] \'\nEOF\n\nprogress \"安装完成\" 1 \"aW5zdGFsbCBmaW5pc2hlZAo=\"\n%end'),(4,'2016-02-01 11:45:16','2016-06-30 08:45:30',NULL,'esxi6.0','vmaccepteula\r\nrootpw yunjikeji\r\ninstall --firstdisk --overwritevmfs\r\nreboot\r\n\r\n%include /tmp/network.ks\r\n\r\n%pre --interpreter=busybox\r\n_sn=$(localcli hardware platform get | awk \'/Serial Number/ { print $NF }\')\r\n_dns=$(awk \'/^nameserver/ { print $NF; exit }\' /etc/resolv.conf)\r\nwget -qO /tmp/networkinfo \"http://osinstall.idcos.com/api/osinstall/v1/device/getNetworkBySn?sn=${_sn}&type=raw\"\r\nsource /tmp/networkinfo\r\necho \"network --bootproto=static --device=vmnic0 --ip=$IPADDR --netmask=$NETMASK --gateway=$GATEWAY --nameserver=$_dns --hostname=$HOSTNAME\" > /tmp/network.ks\r\n\r\ncat > /tmp/progress.py <<\'EOF\'\r\n#!/usr/bin/env python\r\nimport sys\r\nimport traceback\r\nimport json\r\nimport urllib2\r\nimport urllib\r\n\r\nURL = \"http://osinstall.idcos.com/api/osinstall/v1/report/deviceInstallInfo\"\r\n\r\ndef process_api(sn, title, process, content):\r\n\r\n    params = {\r\n        \"Sn\": sn,\r\n        \"Title\": title,\r\n        \"InstallProgress\": round(float(process), 2),\r\n        \"InstallLog\": content\r\n    }\r\n    data = json.dumps(params)\r\n    req = urllib2.Request(URL,data=data)\r\n    req.add_header(\"Content-Type\", \"application/json\")\r\n    return urllib2.urlopen(req).read()\r\n\r\n\r\nif __name__ == \"__main__\":\r\n    try:\r\n        print process_api(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4])\r\n    except:\r\n        print \"error when request URL: \", URL\r\n        print traceback.print_exc()\r\nEOF\r\nchmod 755 /tmp/progress.py\r\n\r\n/tmp/progress.py $_sn \"启动OS安装程序\" 0.6 \"SW5zdGFsbCBPUwo=\"\r\n\r\n%firstboot --interpreter=busybox\r\ncat > /tmp/progress.py <<\'EOF\'\r\n#!/usr/bin/env python\r\nimport sys\r\nimport traceback\r\nimport json\r\nimport urllib2\r\nimport urllib\r\n\r\nURL = \"http://osinstall.idcos.com/api/osinstall/v1/report/deviceInstallInfo\"\r\n\r\ndef process_api(sn, title, process, content):\r\n\r\n    params = {\r\n        \"Sn\": sn,\r\n        \"Title\": title,\r\n        \"InstallProgress\": round(float(process), 2),\r\n        \"InstallLog\": content\r\n    }\r\n    data = json.dumps(params)\r\n    req = urllib2.Request(URL,data=data)\r\n    req.add_header(\"Content-Type\", \"application/json\")\r\n    return urllib2.urlopen(req).read()\r\n\r\n\r\nif __name__ == \"__main__\":\r\n    try:\r\n        print process_api(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4])\r\n    except:\r\n        print \"error when request URL: \", URL\r\n        print traceback.print_exc()\r\nEOF\r\nchmod 755 /tmp/progress.py\r\n\r\n_sn=$(localcli hardware platform get | awk \'/Serial Number/ { print $NF }\')\r\n\r\n/tmp/progress.py $_sn \"调整系统参数\" 0.8 \"ZW5hYmxlIHNoZWxsIGFuZCBzc2gK\"\r\n\r\nvim-cmd hostsvc/enable_ssh\r\nvim-cmd hostsvc/start_ssh\r\n\r\nvim-cmd hostsvc/enable_esx_shell\r\nvim-cmd hostsvc/start_esx_shell\r\n\r\n/tmp/progress.py $_sn \"安装完成\" 1 \"aW5zdGFsbCBmaW5pc2hlZAo=\"'),(5,'2016-02-17 12:01:00','2017-01-17 06:06:54',NULL,'win2008r2','<?xml version=\"1.0\" encoding=\"utf-8\"?>\r<unattend xmlns=\"urn:schemas-microsoft-com:unattend\">\r    <settings pass=\"generalize\">\r        <component name=\"Microsoft-Windows-OutOfBoxExperience\" processorArchitecture=\"amd64\" publicKeyToken=\"31bf3856ad364e35\" language=\"neutral\" versionScope=\"nonSxS\" xmlns:wcm=\"http://schemas.microsoft.com/WMIConfig/2002/State\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\r            <DoNotOpenInitialConfigurationTasksAtLogon>true</DoNotOpenInitialConfigurationTasksAtLogon>\r        </component>\r        <component name=\"Microsoft-Windows-ServerManager-SvrMgrNc\" processorArchitecture=\"amd64\" publicKeyToken=\"31bf3856ad364e35\" language=\"neutral\" versionScope=\"nonSxS\" xmlns:wcm=\"http://schemas.microsoft.com/WMIConfig/2002/State\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\r            <DoNotOpenServerManagerAtLogon>true</DoNotOpenServerManagerAtLogon>\r        </component>\r    </settings>\r    <settings pass=\"specialize\">\r        <component name=\"Microsoft-Windows-Shell-Setup\" processorArchitecture=\"amd64\" publicKeyToken=\"31bf3856ad364e35\" language=\"neutral\" versionScope=\"nonSxS\" xmlns:wcm=\"http://schemas.microsoft.com/WMIConfig/2002/State\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\r            <ProductKey>489J6-VHDMP-X63PK-3K798-CPX3Y</ProductKey>\r            <ShowWindowsLive>false</ShowWindowsLive>\r            <DisableAutoDaylightTimeSet>false</DisableAutoDaylightTimeSet>\r            <TimeZone>China Standard Time</TimeZone>\r            <RegisteredOwner />\r            <RegisteredOrganization />\r        </component>\r        <component name=\"Microsoft-Windows-TerminalServices-LocalSessionManager\" processorArchitecture=\"amd64\" publicKeyToken=\"31bf3856ad364e35\" language=\"neutral\" versionScope=\"nonSxS\" xmlns:wcm=\"http://schemas.microsoft.com/WMIConfig/2002/State\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\r            <fDenyTSConnections>false</fDenyTSConnections>\r        </component>\r        <component name=\"Networking-MPSSVC-Svc\" processorArchitecture=\"amd64\" publicKeyToken=\"31bf3856ad364e35\" language=\"neutral\" versionScope=\"nonSxS\" xmlns:wcm=\"http://schemas.microsoft.com/WMIConfig/2002/State\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\r            <FirewallGroups>\r                <FirewallGroup wcm:action=\"add\" wcm:keyValue=\"1\">\r                    <Active>true</Active>\r                    <Group>远程桌面</Group>\r                    <Profile>all</Profile>\r                </FirewallGroup>\r            </FirewallGroups>\r        </component>\r    </settings>\r    <settings pass=\"oobeSystem\">\r        <component name=\"Microsoft-Windows-Shell-Setup\" processorArchitecture=\"amd64\" publicKeyToken=\"31bf3856ad364e35\" language=\"neutral\" versionScope=\"nonSxS\" xmlns:wcm=\"http://schemas.microsoft.com/WMIConfig/2002/State\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\r            <AutoLogon>\r                <Password>\r                    <Value>eQB1AG4AagBpAGsAZQBqAGkAUABhAHMAcwB3AG8AcgBkAA==</Value>\r                    <PlainText>false</PlainText>\r                </Password>\r                <Enabled>true</Enabled>\r                <LogonCount>1</LogonCount>\r                <Username>Administrator</Username>\r            </AutoLogon>\r            <OOBE>\r                <HideEULAPage>true</HideEULAPage>\r            </OOBE>\r            <UserAccounts>\r                <AdministratorPassword>\r                    <PlainText>false</PlainText>\r                    <Value>eQB1AG4AagBpAGsAZQBqAGkAQQBkAG0AaQBuAGkAcwB0AHIAYQB0AG8AcgBQAGEAcwBzAHcAbwByAGQA</Value>\r                </AdministratorPassword>\r            </UserAccounts>\r            <FirstLogonCommands>\r                <SynchronousCommand wcm:action=\"add\">\r                    <Order>1</Order>\r                    <CommandLine>C:\\firstboot\\winconfig.exe</CommandLine>\r                    <Description></Description>\r                    <RequiresUserInput>false</RequiresUserInput>\r                </SynchronousCommand>\r            </FirstLogonCommands>\r            <RegisteredOrganization />\r            <RegisteredOwner />\r        </component>\r        <component name=\"Microsoft-Windows-International-Core\" processorArchitecture=\"amd64\" publicKeyToken=\"31bf3856ad364e35\" language=\"neutral\" versionScope=\"nonSxS\" xmlns:wcm=\"http://schemas.microsoft.com/WMIConfig/2002/State\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\r            <SystemLocale>zh-CN</SystemLocale>\r            <UILanguage>zh-CN</UILanguage>\r            <UILanguageFallback>zh-CN</UILanguageFallback>\r            <UserLocale>zh-CN</UserLocale>\r            <InputLocale>zh-CN</InputLocale>\r        </component>\r    </settings>\r    <settings pass=\"windowsPE\">\r        <component name=\"Microsoft-Windows-Setup\" processorArchitecture=\"amd64\" publicKeyToken=\"31bf3856ad364e35\" language=\"neutral\" versionScope=\"nonSxS\" xmlns:wcm=\"http://schemas.microsoft.com/WMIConfig/2002/State\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\r            <ImageInstall>\r                <OSImage>\r                    <InstallFrom>\r                        <Path>Z:\\windows\\2008r2\\sources\\install.wim</Path>\r                        <MetaData wcm:action=\"add\">\r                            <Key>/IMAGE/NAME</Key>\r                            <Value>Windows Server 2008 R2 SERVERENTERPRISE</Value>\r                        </MetaData>\r                    </InstallFrom>\r                    <InstallTo>\r                        <DiskID>0</DiskID>\r                        <PartitionID>1</PartitionID>\r                    </InstallTo>\r                    <WillShowUI>OnError</WillShowUI>\r                </OSImage>\r            </ImageInstall>\r            <UserData>\r                <ProductKey>\r                    <WillShowUI>OnError</WillShowUI>\r                    <Key>489J6-VHDMP-X63PK-3K798-CPX3Y</Key>\r                </ProductKey>\r                <AcceptEula>true</AcceptEula>\r            </UserData>\r            <EnableFirewall>true</EnableFirewall>\r            <EnableNetwork>true</EnableNetwork>\r            <DiskConfiguration>\r                <Disk wcm:action=\"add\">\r                    <CreatePartitions>\r                        <CreatePartition wcm:action=\"add\">\r                            <Type>Primary</Type>\r                            <Order>1</Order>\r                            <Size>51200</Size>\r                        </CreatePartition>\r                    </CreatePartitions>\r                    <ModifyPartitions>\r                        <ModifyPartition wcm:action=\"add\">\r                            <Active>true</Active>\r                            <Extend>false</Extend>\r                            <Format>NTFS</Format>\r                            <Order>1</Order>\r                            <Label>System</Label>\r                            <PartitionID>1</PartitionID>\r                        </ModifyPartition>\r                    </ModifyPartitions>\r                    <DiskID>0</DiskID>\r                    <WillWipeDisk>true</WillWipeDisk>\r                </Disk>\r                <WillShowUI>OnError</WillShowUI>\r            </DiskConfiguration>\r        </component>\r        <component name=\"Microsoft-Windows-International-Core-WinPE\" processorArchitecture=\"amd64\" publicKeyToken=\"31bf3856ad364e35\" language=\"neutral\" versionScope=\"nonSxS\" xmlns:wcm=\"http://schemas.microsoft.com/WMIConfig/2002/State\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\r            <SetupUILanguage>\r                <UILanguage>zh-CN</UILanguage>\r            </SetupUILanguage>\r            <InputLocale>zh-CN</InputLocale>\r            <SystemLocale>zh-CN</SystemLocale>\r            <UILanguage>zh-CN</UILanguage>\r            <UserLocale>zh-CN</UserLocale>\r            <UILanguageFallback>zh-CN</UILanguageFallback>\r        </component>\r        <component name=\"Microsoft-Windows-PnpCustomizationsWinPE\" processorArchitecture=\"amd64\" publicKeyToken=\"31bf3856ad364e35\" language=\"neutral\" versionScope=\"nonSxS\" xmlns:wcm=\"http://schemas.microsoft.com/WMIConfig/2002/State\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\r            <DriverPaths>\r                <PathAndCredentials wcm:action=\"add\" wcm:keyValue=\"1\">\r                    <Path>Z:\\windows\\drivers\\2008r2</Path>\r                </PathAndCredentials>\r            </DriverPaths>\r        </component>\r    </settings>\r    <settings pass=\"offlineServicing\">\r        <component name=\"Microsoft-Windows-PnpCustomizationsNonWinPE\" processorArchitecture=\"amd64\" publicKeyToken=\"31bf3856ad364e35\" language=\"neutral\" versionScope=\"nonSxS\" xmlns:wcm=\"http://schemas.microsoft.com/WMIConfig/2002/State\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\r            <DriverPaths>\r                <PathAndCredentials wcm:action=\"add\" wcm:keyValue=\"1\">\r                    <Path>Z:\\windows\\drivers\\2008r2</Path>\r                </PathAndCredentials>\r            </DriverPaths>\r        </component>\r        <component name=\"Microsoft-Windows-LUA-Settings\" processorArchitecture=\"amd64\" publicKeyToken=\"31bf3856ad364e35\" language=\"neutral\" versionScope=\"nonSxS\" xmlns:wcm=\"http://schemas.microsoft.com/WMIConfig/2002/State\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\r            <EnableLUA>false</EnableLUA>\r        </component>\r    </settings>\r    <cpi:offlineImage cpi:source=\"catalog://osinstall/image/windows/clg/install_windows server 2008 r2 serverenterprise.clg\" xmlns:cpi=\"urn:schemas-microsoft-com:cpi\" />\r</unattend>'),(7,'2016-02-29 11:05:41','2017-01-17 06:06:44',NULL,'win2012r2','<?xml version=\"1.0\" encoding=\"utf-8\"?>\r<unattend xmlns=\"urn:schemas-microsoft-com:unattend\">\r    <settings pass=\"generalize\">\r        <component name=\"Microsoft-Windows-OutOfBoxExperience\" processorArchitecture=\"amd64\" publicKeyToken=\"31bf3856ad364e35\" language=\"neutral\" versionScope=\"nonSxS\" xmlns:wcm=\"http://schemas.microsoft.com/WMIConfig/2002/State\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\r            <DoNotOpenInitialConfigurationTasksAtLogon>true</DoNotOpenInitialConfigurationTasksAtLogon>\r        </component>\r        <component name=\"Microsoft-Windows-ServerManager-SvrMgrNc\" processorArchitecture=\"amd64\" publicKeyToken=\"31bf3856ad364e35\" language=\"neutral\" versionScope=\"nonSxS\" xmlns:wcm=\"http://schemas.microsoft.com/WMIConfig/2002/State\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\r            <DoNotOpenServerManagerAtLogon>true</DoNotOpenServerManagerAtLogon>\r        </component>\r    </settings>\r    <settings pass=\"specialize\">\r        <component name=\"Microsoft-Windows-Shell-Setup\" processorArchitecture=\"amd64\" publicKeyToken=\"31bf3856ad364e35\" language=\"neutral\" versionScope=\"nonSxS\" xmlns:wcm=\"http://schemas.microsoft.com/WMIConfig/2002/State\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\r            <ProductKey>W3GGN-FT8W3-Y4M27-J84CP-Q3VJ9</ProductKey>\r            <ShowWindowsLive>false</ShowWindowsLive>\r            <DisableAutoDaylightTimeSet>false</DisableAutoDaylightTimeSet>\r            <TimeZone>China Standard Time</TimeZone>\r            <RegisteredOwner />\r            <RegisteredOrganization />\r        </component>\r        <component name=\"Microsoft-Windows-TerminalServices-LocalSessionManager\" processorArchitecture=\"amd64\" publicKeyToken=\"31bf3856ad364e35\" language=\"neutral\" versionScope=\"nonSxS\" xmlns:wcm=\"http://schemas.microsoft.com/WMIConfig/2002/State\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\r            <fDenyTSConnections>false</fDenyTSConnections>\r        </component>\r        <component name=\"Networking-MPSSVC-Svc\" processorArchitecture=\"amd64\" publicKeyToken=\"31bf3856ad364e35\" language=\"neutral\" versionScope=\"nonSxS\" xmlns:wcm=\"http://schemas.microsoft.com/WMIConfig/2002/State\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\r            <FirewallGroups>\r                <FirewallGroup wcm:action=\"add\" wcm:keyValue=\"1\">\r                    <Active>true</Active>\r                    <Group>远程桌面</Group>\r                    <Profile>all</Profile>\r                </FirewallGroup>\r            </FirewallGroups>\r        </component>\r    </settings>\r    <settings pass=\"oobeSystem\">\r        <component name=\"Microsoft-Windows-Shell-Setup\" processorArchitecture=\"amd64\" publicKeyToken=\"31bf3856ad364e35\" language=\"neutral\" versionScope=\"nonSxS\" xmlns:wcm=\"http://schemas.microsoft.com/WMIConfig/2002/State\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\r            <AutoLogon>\r                <Password>\r                    <Value>eQB1AG4AagBpAGsAZQBqAGkAUABhAHMAcwB3AG8AcgBkAA==</Value>\r                    <PlainText>false</PlainText>\r                </Password>\r                <Enabled>true</Enabled>\r                <LogonCount>1</LogonCount>\r                <Username>Administrator</Username>\r            </AutoLogon>\r            <OOBE>\r                <HideEULAPage>true</HideEULAPage>\r            </OOBE>\r            <UserAccounts>\r                <AdministratorPassword>\r                    <PlainText>false</PlainText>\r                    <Value>eQB1AG4AagBpAGsAZQBqAGkAQQBkAG0AaQBuAGkAcwB0AHIAYQB0AG8AcgBQAGEAcwBzAHcAbwByAGQA</Value>\r                </AdministratorPassword>\r            </UserAccounts>\r            <FirstLogonCommands>\r                <SynchronousCommand wcm:action=\"add\">\r                    <Order>1</Order>\r                    <CommandLine>C:\\firstboot\\winconfig.exe</CommandLine>\r                    <Description></Description>\r                    <RequiresUserInput>false</RequiresUserInput>\r                </SynchronousCommand>\r            </FirstLogonCommands>\r            <RegisteredOrganization />\r            <RegisteredOwner />\r        </component>\r        <component name=\"Microsoft-Windows-International-Core\" processorArchitecture=\"amd64\" publicKeyToken=\"31bf3856ad364e35\" language=\"neutral\" versionScope=\"nonSxS\" xmlns:wcm=\"http://schemas.microsoft.com/WMIConfig/2002/State\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\r            <SystemLocale>zh-CN</SystemLocale>\r            <UILanguage>zh-CN</UILanguage>\r            <UILanguageFallback>zh-CN</UILanguageFallback>\r            <UserLocale>zh-CN</UserLocale>\r            <InputLocale>zh-CN</InputLocale>\r        </component>\r    </settings>\r    <settings pass=\"windowsPE\">\r        <component name=\"Microsoft-Windows-Setup\" processorArchitecture=\"amd64\" publicKeyToken=\"31bf3856ad364e35\" language=\"neutral\" versionScope=\"nonSxS\" xmlns:wcm=\"http://schemas.microsoft.com/WMIConfig/2002/State\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\r            <ImageInstall>\r                <OSImage>\r                    <InstallFrom>\r                        <Path>Z:\\windows\\2012r2\\sources\\install.wim</Path>\r                        <MetaData wcm:action=\"add\">\r                            <Key>/IMAGE/NAME</Key>\r                            <Value>Windows Server 2012 R2 SERVERDATACENTER</Value>\r                        </MetaData>\r                    </InstallFrom>\r                    <InstallTo>\r                        <DiskID>0</DiskID>\r                        <PartitionID>1</PartitionID>\r                    </InstallTo>\r                    <WillShowUI>OnError</WillShowUI>\r                </OSImage>\r            </ImageInstall>\r            <UserData>\r                <ProductKey>\r                    <WillShowUI>OnError</WillShowUI>\r                    <Key>W3GGN-FT8W3-Y4M27-J84CP-Q3VJ9</Key>\r                </ProductKey>\r                <AcceptEula>true</AcceptEula>\r            </UserData>\r            <EnableFirewall>true</EnableFirewall>\r            <EnableNetwork>true</EnableNetwork>\r            <DiskConfiguration>\r                <Disk wcm:action=\"add\">\r                    <CreatePartitions>\r                        <CreatePartition wcm:action=\"add\">\r                            <Type>Primary</Type>\r                            <Order>1</Order>\r                            <Size>51200</Size>\r                        </CreatePartition>\r                    </CreatePartitions>\r                    <ModifyPartitions>\r                        <ModifyPartition wcm:action=\"add\">\r                            <Active>true</Active>\r                            <Extend>false</Extend>\r                            <Format>NTFS</Format>\r                            <Order>1</Order>\r                            <Label>System</Label>\r                            <PartitionID>1</PartitionID>\r                        </ModifyPartition>\r                    </ModifyPartitions>\r                    <DiskID>0</DiskID>\r                    <WillWipeDisk>true</WillWipeDisk>\r                </Disk>\r                <WillShowUI>OnError</WillShowUI>\r            </DiskConfiguration>\r        </component>\r        <component name=\"Microsoft-Windows-International-Core-WinPE\" processorArchitecture=\"amd64\" publicKeyToken=\"31bf3856ad364e35\" language=\"neutral\" versionScope=\"nonSxS\" xmlns:wcm=\"http://schemas.microsoft.com/WMIConfig/2002/State\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\r            <SetupUILanguage>\r                <UILanguage>zh-CN</UILanguage>\r            </SetupUILanguage>\r            <InputLocale>zh-CN</InputLocale>\r            <SystemLocale>zh-CN</SystemLocale>\r            <UILanguage>zh-CN</UILanguage>\r            <UserLocale>zh-CN</UserLocale>\r            <UILanguageFallback>zh-CN</UILanguageFallback>\r        </component>\r        <component name=\"Microsoft-Windows-PnpCustomizationsWinPE\" processorArchitecture=\"amd64\" publicKeyToken=\"31bf3856ad364e35\" language=\"neutral\" versionScope=\"nonSxS\" xmlns:wcm=\"http://schemas.microsoft.com/WMIConfig/2002/State\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\r            <DriverPaths>\r                <PathAndCredentials wcm:action=\"add\" wcm:keyValue=\"1\">\r                    <Path>Z:\\windows\\drivers\\2012r2</Path>\r                </PathAndCredentials>\r            </DriverPaths>\r        </component>\r    </settings>\r    <settings pass=\"offlineServicing\">\r        <component name=\"Microsoft-Windows-PnpCustomizationsNonWinPE\" processorArchitecture=\"amd64\" publicKeyToken=\"31bf3856ad364e35\" language=\"neutral\" versionScope=\"nonSxS\" xmlns:wcm=\"http://schemas.microsoft.com/WMIConfig/2002/State\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\r            <DriverPaths>\r                <PathAndCredentials wcm:action=\"add\" wcm:keyValue=\"1\">\r                    <Path>Z:\\windows\\drivers\\2012r2</Path>\r                </PathAndCredentials>\r            </DriverPaths>\r        </component>\r        <component name=\"Microsoft-Windows-LUA-Settings\" processorArchitecture=\"amd64\" publicKeyToken=\"31bf3856ad364e35\" language=\"neutral\" versionScope=\"nonSxS\" xmlns:wcm=\"http://schemas.microsoft.com/WMIConfig/2002/State\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\r            <EnableLUA>false</EnableLUA>\r        </component>\r    </settings>\r    <cpi:offlineImage cpi:source=\"catalog://osinstall/image/windows/clg/install_windows server 2012 r2 serverdatacenter.clg\" xmlns:cpi=\"urn:schemas-microsoft-com:cpi\" />\r</unattend>'),(9,'2016-03-29 08:41:04','2016-06-30 08:45:30',NULL,'ubuntu14.04','d-i debian-installer/locale string en_US.UTF-8\nd-i console-setup/ask_detect boolean false\nd-i keyboard-configuration/layoutcode string us\nd-i netcfg/choose_interface select auto\nd-i netcfg/target_network_config select ifupdown\nd-i mirror/country string manual\nd-i mirror/http/hostname string osinstall\nd-i mirror/http/directory string /ubuntu/14.04/os/x86_64\nd-i mirror/http/proxy string\nd-i live-installer/net-image string http://osinstall.idcos.com/ubuntu/14.04/os/x86_64/install/filesystem.squashfs\nd-i clock-setup/utc boolean false\nd-i time/zone string Asia/Shanghai\nd-i clock-setup/ntp boolean true\n#d-i partman-auto/disk string /dev/sda\nd-i partman-auto/method string regular\nd-i partman-lvm/device_remove_lvm boolean true\nd-i partman-md/device_remove_md boolean true\nd-i partman-lvm/confirm boolean true\nd-i partman-auto/choose_recipe select atomic\nd-i partman/default_filesystem string ext4\nd-i partman/mount_style select uuid\nd-i partman/unmount_active boolean true\nd-i partman-partitioning/confirm_write_new_label boolean true\nd-i partman/choose_partition select finish\nd-i partman/confirm boolean true\nd-i partman/confirm_nooverwrite boolean true\nd-i passwd/root-login boolean true\nd-i passwd/make-user boolean false\nd-i passwd/root-password-crypted password $1$AxPsi$GDSXEkYCIL2xfRuimCMiX1\nd-i user-setup/encrypt-home boolean false\ntasksel tasksel/first multiselect standard\nd-i pkgsel/include string openssh-server build-essential ntp vim dmidecode curl\nd-i pkgsel/update-policy select none\nd-i grub-installer/only_debian boolean true\nd-i grub-installer/with_other_os boolean true\nd-i finish-install/reboot_in_progress note\nd-i debian-installer/exit/reboot boolean true\nd-i preseed/early_command string umount /media || true\nd-i preseed/late_command string \\\nexport LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/target/usr/lib/x86_64-linux-gnu:/target/lib/x86_64-linux-gnu ; \\\n/target/usr/sbin/dmidecode | grep -qEi \'VMware|VirtualBox|KVM|Xen|Parallels\' && _sn=$(sed q /sys/class/net/*/address) || _sn=$(/target/usr/sbin/dmidecode -s system-serial-number 2>/dev/null | awk \'/^[^#]/ { print $1 }\'); \\\n/target/usr/bin/curl -H \"Content-Type: application/json\" -X POST -d \"{\\\"Sn\\\":\\\"$_sn\\\",\\\"Title\\\":\\\"配置主机名和网络\\\",\\\"InstallProgress\\\":0.8,\\\"InstallLog\\\":\\\"Y29uZmlnIG5ldHdvcmsK\\\"}\" http://osinstall.idcos.com/api/osinstall/v1/report/deviceInstallInfo ; \\\n/target/usr/bin/curl -o /tmp/networkinfo \"http://osinstall.idcos.com/api/osinstall/v1/device/getNetworkBySn?sn=$_sn&type=raw\" ; \\\n. /tmp/networkinfo ; \\\necho -e \"auto lo\\niface lo inet loopback\\nauto eth0\\niface eth0 inet static\\naddress $IPADDR\\nnetmask $NETMASK\\ngateway $GATEWAY\" > /etc/network/interfaces ; \\\ncp /etc/network/interfaces /target/etc/network/interfaces ; \\\necho \"$HOSTNAME\" > /target/etc/hostname ; \\\n/target/usr/bin/curl -H \"Content-Type: application/json\" -X POST -d \"{\\\"Sn\\\":\\\"$_sn\\\",\\\"Title\\\":\\\"安装完成\\\",\\\"InstallProgress\\\":1,\\\"InstallLog\\\":\\\"aW5zdGFsbCBmaW5pc2hlZAo=\\\"}\" http://osinstall.idcos.com/api/osinstall/v1/report/deviceInstallInfo'),(10,'2016-06-15 22:46:19','2016-06-19 21:55:13',NULL,'xenserver6.5','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<installation srtype=\"ext\">\n   <primary-disk>sda</primary-disk>\n   <keymap>us</keymap>\n   <root-password>yunjikeji</root-password>\n   <source type=\"url\">http://osinstall.idcos.com/xenserver/6.5/</source>\n   <script stage=\"filesystem-populated\" type=\"url\">http://osinstall.idcos.com/scripts/xenserver.sh</script>\n   <admin-interface name=\"eth0\" proto=\"dhcp\" />\n   <timezone>Asia/Shanghai</timezone>\n</installation>'),(11,'2016-06-19 21:53:16','2016-06-22 20:39:11',NULL,'centos6.7-kvmserver','install\nurl --url=http://osinstall.idcos.com/centos/6.7/os/x86_64/\nlang en_US.UTF-8\nkeyboard us\nnetwork --onboot yes --device bootif --bootproto dhcp --noipv6\nrootpw  --iscrypted $6$eAdCfx9hZjVMqyS6$BYIbEu4zeKp0KLnz8rLMdU7sQ5o4hQRv55o151iLX7s2kSq.5RVsteGWJlpPMqIRJ8.WUcbZC3duqX0Rt3unK/\nfirewall --disabled\nauthconfig --enableshadow --passalgo=sha512\nselinux --disabled\ntimezone Asia/Shanghai\ntext\nreboot\nzerombr\nbootloader --location=mbr --append=\"console=tty0 biosdevname=0 audit=0 selinux=0\"\nclearpart --all --initlabel\npart /boot --fstype=ext4 --size=256 --ondisk=sda\npart swap --size=2048 --ondisk=sda\npart / --fstype=ext4 --size=51200 --ondisk=sda\npart pv.01 --size 100 --grow\nvolgroup VolGroup0 pv.01\n\n%packages --ignoremissing\n@base\n@core\n@development\n@virtualization\n@virtualization-platform\n\n%pre\n_sn=$(dmidecode -s system-serial-number 2>/dev/null | awk \'/^[^#]/ { print $1 }\')\ncurl -H \"Content-Type: application/json\" -X POST -d \"{\\\"Sn\\\":\\\"$_sn\\\",\\\"Title\\\":\\\"启动OS安装程序\\\",\\\"InstallProgress\\\":0.6,\\\"InstallLog\\\":\\\"SW5zdGFsbCBPUwo=\\\"}\" http://osinstall.idcos.com/api/osinstall/v1/report/deviceInstallInfo\ncurl -H \"Content-Type: application/json\" -X POST -d \"{\\\"Sn\\\":\\\"$_sn\\\",\\\"Title\\\":\\\"分区并安装软件包\\\",\\\"InstallProgress\\\":0.7,\\\"InstallLog\\\":\\\"SW5zdGFsbCBPUwo=\\\"}\" http://osinstall.idcos.com/api/osinstall/v1/report/deviceInstallInfo\n\n%post\nprogress() {\n    curl -H \"Content-Type: application/json\" -X POST -d \"{\\\"Sn\\\":\\\"$_sn\\\",\\\"Title\\\":\\\"$1\\\",\\\"InstallProgress\\\":$2,\\\"InstallLog\\\":\\\"$3\\\"}\" http://osinstall.idcos.com/api/osinstall/v1/report/deviceInstallInfo\n}\n\n_sn=$(dmidecode -s system-serial-number 2>/dev/null | awk \'/^[^#]/ { print $1 }\')\n\nprogress \"配置主机名和网络\" 0.8 \"Y29uZmlnIG5ldHdvcmsK\"\n\n# config network\ncurl -o /tmp/networkinfo \"http://osinstall.idcos.com/api/osinstall/v1/device/getNetworkBySn?sn=${_sn}&type=raw\"\nsource /tmp/networkinfo\n\ncat > /etc/sysconfig/network <<EOF\nNETWORKING=yes\nHOSTNAME=$HOSTNAME\nGATEWAY=$GATEWAY\nNOZEROCONF=yes\nNETWORKING_IPV6=no\nIPV6INIT=no\nPEERNTP=no\nEOF\n\ncat > /etc/sysconfig/network-scripts/ifcfg-br0 <<EOF\nDEVICE=br0\nBOOTPROTO=none\nIPADDR=$IPADDR\nNETMASK=$NETMASK\nONBOOT=yes\nTYPE=Ethernet\nNM_CONTROLLED=no\nTYPE=Bridge\nDELAY=0\nEOF\n\ncat > /etc/sysconfig/network-scripts/ifcfg-eth0 <<EOF\nDEVICE=eth0\nBOOTPROTO=none\nONBOOT=yes\nTYPE=Ethernet\nNM_CONTROLLED=no\nTYPE=Ethernet\nBRIDGE=br0\nEOF\n\nprogress \"添加用户\" 0.85 \"YWRkIHVzZXIgeXVuamkK\"\n#useradd admin\n\nprogress \"配置系统服务\" 0.9 \"Y29uZmlnIHN5c3RlbSBzZXJ2aWNlCg==\"\n\n# config service\nservice=(crond irqbalance libvirtd network ntpd rsyslog sshd sysstat)\nchkconfig --list | awk \'{ print $1 }\' | xargs -n1 -I@ chkconfig @ off\necho ${service[@]} | xargs -n1 | xargs -I@ chkconfig @ on\n\nprogress \"调整系统参数\" 0.95 \"Y29uZmlnIGJhc2ggcHJvbXB0Cg==\"\n\n# custom bash prompt\ncat >> /etc/profile <<\'EOF\'\n\nexport LANG=en_US.UTF8\nexport PS1=\'\\n\\e[1;37m[\\e[m\\e[1;32m\\u\\e[m\\e[1;33m@\\e[m\\e[1;35m\\H\\e[m:\\e[4m`pwd`\\e[m\\e[1;37m]\\e[m\\e[1;36m\\e[m\\n\\$ \'\nexport HISTTIMEFORMAT=\'[%F %T] \'\nEOF\n\ncat >> /etc/sysctl.conf <<\'EOF\'\n\nnet.ipv6.conf.all.disable_ipv6 = 1\nnet.ipv6.conf.default.disable_ipv6 = 1\nnet.ipv6.conf.lo.disable_ipv6 = 1\nnet.bridge.bridge-nf-call-arptables = 0\nnet.bridge.bridge-nf-call-ip6tables = 0\nnet.bridge.bridge-nf-call-iptables = 0\nEOF\n\nservice libvirtd start\nvirsh pool-define-as guest_images_lvm logical - - - VolGroup0 /dev/VolGroup0\nvirsh pool-autostart guest_images_lvm\n\nprogress \"安装完成\" 1 \"aW5zdGFsbCBmaW5pc2hlZAo=\"');
/*!40000 ALTER TABLE `system_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_access_tokens`
--

DROP TABLE IF EXISTS `user_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_access_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  `access_token` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token` (`access_token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_access_tokens`
--

LOCK TABLES `user_access_tokens` WRITE;
/*!40000 ALTER TABLE `user_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(32) DEFAULT NULL COMMENT '手机号',
  `permission` text COMMENT '权限',
  `status` enum('Enable','Disable') NOT NULL DEFAULT 'Enable',
  `role` enum('Administrator','User') DEFAULT 'User',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2016-03-01 08:01:32','2016-03-01 08:01:32',NULL,'admin','21232f297a57a5a743894a0e4a801fc3','超级管理员',NULL,NULL,'Enable','Administrator'),(2,'2016-03-01 08:25:41','2016-03-01 08:25:41',NULL,'test','098f6bcd4621d373cade4e832627b4f6','测试用户','','','Enable','User');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vm_device_logs`
--

DROP TABLE IF EXISTS `vm_device_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vm_device_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `device_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `content` longtext,
  PRIMARY KEY (`id`),
  KEY `device_id` (`device_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vm_device_logs`
--

LOCK TABLES `vm_device_logs` WRITE;
/*!40000 ALTER TABLE `vm_device_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `vm_device_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vm_devices`
--

DROP TABLE IF EXISTS `vm_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vm_devices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `device_id` int(10) NOT NULL,
  `hostname` varchar(255) NOT NULL,
  `mac` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `network_id` int(10) NOT NULL,
  `os_id` int(10) NOT NULL,
  `cpu_cores_number` int(10) NOT NULL,
  `cpu_hot_plug` enum('Yes','No') NOT NULL DEFAULT 'No',
  `cpu_passthrough` enum('Yes','No') NOT NULL DEFAULT 'No',
  `cpu_top_sockets` int(10) DEFAULT '0',
  `cpu_top_cores` int(10) DEFAULT '0',
  `cpu_top_threads` int(10) DEFAULT '0',
  `cpu_pinning` text,
  `memory_current` int(10) DEFAULT '0',
  `memory_max` int(10) DEFAULT '0',
  `memory_ksm` enum('Yes','No') NOT NULL DEFAULT 'No',
  `disk_type` varchar(255) NOT NULL,
  `disk_size` int(10) DEFAULT '0',
  `disk_bus_type` varchar(255) DEFAULT NULL,
  `disk_cache_mode` varchar(255) DEFAULT NULL,
  `disk_io_mode` varchar(255) DEFAULT NULL,
  `network_type` varchar(255) NOT NULL,
  `network_device_type` varchar(255) NOT NULL,
  `display_type` varchar(255) NOT NULL,
  `display_password` varchar(255) DEFAULT NULL,
  `display_update_password` enum('Yes','No') NOT NULL DEFAULT 'No',
  `status` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `system_id` int(11) NOT NULL DEFAULT '0' COMMENT '系统安装模板ID',
  `install_progress` decimal(11,4) NOT NULL DEFAULT '0.0000' COMMENT '安装进度',
  `vnc_port` varchar(256) DEFAULT NULL COMMENT 'VNC端口',
  `run_status` varchar(256) DEFAULT NULL COMMENT '运行状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostname` (`hostname`),
  UNIQUE KEY `ip` (`ip`),
  UNIQUE KEY `mac` (`mac`),
  KEY `status` (`status`) USING BTREE,
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vm_devices`
--

LOCK TABLES `vm_devices` WRITE;
/*!40000 ALTER TABLE `vm_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `vm_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vm_hosts`
--

DROP TABLE IF EXISTS `vm_hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vm_hosts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL COMMENT '序列号',
  `cpu_sum` int(11) DEFAULT '0' COMMENT 'CPU总核数',
  `cpu_used` int(11) DEFAULT '0' COMMENT '已用CPU核数',
  `cpu_available` int(11) DEFAULT '0' COMMENT '可用CPU核数',
  `memory_sum` int(11) DEFAULT '0' COMMENT '内存总容量',
  `memory_used` int(11) DEFAULT '0' COMMENT '已用内存',
  `memory_available` int(11) DEFAULT '0' COMMENT '可用内存',
  `disk_sum` int(11) DEFAULT '0' COMMENT '磁盘总容量',
  `disk_used` int(11) DEFAULT '0' COMMENT '已用磁盘空间',
  `disk_available` int(11) DEFAULT '0' COMMENT '可用磁盘空间',
  `vm_num` int(11) DEFAULT '0' COMMENT '虚拟机数量',
  `is_available` enum('Yes','No') DEFAULT 'Yes' COMMENT '是否可用',
  `remark` text COMMENT '备注(不可用的原因，等等)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vm_hosts`
--

LOCK TABLES `vm_hosts` WRITE;
/*!40000 ALTER TABLE `vm_hosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `vm_hosts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-14 19:40:23
