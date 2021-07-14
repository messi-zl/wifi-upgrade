-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: 172.28.1.24    Database: device_management
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.19-MariaDB

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
-- Table structure for table `device_instances`
--

DROP TABLE IF EXISTS `device_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_instances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `mac` varchar(64) DEFAULT NULL COMMENT 'MAC 地址',
  `sn` varchar(64) DEFAULT NULL COMMENT '序列号',
  `uuid` varchar(64) DEFAULT NULL COMMENT 'uuid',
  `created_on` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`),
  KEY `mac` (`mac`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='设备表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_instances`
--

LOCK TABLES `device_instances` WRITE;
/*!40000 ALTER TABLE `device_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_upgrade_logs`
--

DROP TABLE IF EXISTS `device_upgrade_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_upgrade_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) DEFAULT NULL,
  `auto_detection_flag` int(11) DEFAULT NULL COMMENT '自动检测:0->未自动检测;1->自动检测',
  `manual_detection_flag` int(11) DEFAULT NULL COMMENT 'web手动检测:0->未手动检测;1->手动检测',
  `local_upgrade_flag` int(11) DEFAULT NULL COMMENT '本地升级:0->非本地升级;1->本地升级',
  `created_on` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='设备检测与升级日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_upgrade_logs`
--

LOCK TABLES `device_upgrade_logs` WRITE;
/*!40000 ALTER TABLE `device_upgrade_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_upgrade_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_models`
--

DROP TABLE IF EXISTS `device_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL COMMENT '设备型号名称',
  `created_on` datetime DEFAULT NULL COMMENT '创建日期',
  `changed_on` datetime DEFAULT NULL COMMENT '更改日期',
  `created_by` int(11) DEFAULT NULL COMMENT '创建者',
  `changed_by` int(11) DEFAULT NULL COMMENT '更改者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `created_by` (`created_by`),
  KEY `changed_by` (`changed_by`),
  CONSTRAINT `device_models_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `device_models_ibfk_2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='设备型号表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_models`
--

LOCK TABLES `device_models` WRITE;
/*!40000 ALTER TABLE `device_models` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_running_logs`
--

DROP TABLE IF EXISTS `device_running_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_running_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '在线状态:0->离线;1->在线',
  `upgrade_method` int(11) DEFAULT NULL COMMENT '升级方式:0->自动;1->手动',
  `running_time` varchar(64) DEFAULT NULL COMMENT '运行时间',
  `created_on` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='设备运行日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_running_logs`
--

LOCK TABLES `device_running_logs` WRITE;
/*!40000 ALTER TABLE `device_running_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_running_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_device_version`
--

DROP TABLE IF EXISTS `stat_device_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_device_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) DEFAULT NULL,
  `version` varchar(64) DEFAULT NULL COMMENT '版本号',
  `version_update_on` datetime NOT NULL COMMENT '版本更新时间',
  `online_days` int(11) DEFAULT NULL COMMENT '累计在线天数',
  `last_online_on` datetime NOT NULL COMMENT '最后在线时间',
  `created_on` date DEFAULT NULL COMMENT '创建日期',
  `changed_on` datetime DEFAULT NULL COMMENT '更改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='设备版本运行统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_device_version`
--

LOCK TABLES `stat_device_version` WRITE;
/*!40000 ALTER TABLE `stat_device_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `stat_device_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_upgrade_attributes`
--

DROP TABLE IF EXISTS `device_upgrade_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_upgrade_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '升级状态:0->允许升级;1->禁止升级;2->禁止升级,只统计数据',
  `check_way` int(11) DEFAULT NULL COMMENT '检测方式:0->https;1->校验chk字段;2->必须https且校验chk字段',
  `check_period` int(11) DEFAULT NULL COMMENT '版本检测周期',
  `checked_period` int(11) DEFAULT NULL COMMENT '检测到新版本后检测周期',
  `forced_upgrade` int(11) DEFAULT NULL COMMENT '强制版本与更新的推荐版本:0->升级到强制版本后推荐最新版本;1->直接强制升级到当前最新版本',
  `auto_upgrade_start` varchar(32) DEFAULT NULL,
  `auto_upgrade_end` varchar(32) DEFAULT NULL,
  `auto_upgrade_condition` int(11) DEFAULT NULL COMMENT '自动升级条件:0->流量小于100k时执行;1->没有无线连接时执行',
  `created_on` datetime DEFAULT NULL COMMENT '创建日期',
  `changed_on` datetime DEFAULT NULL COMMENT '更改日期',
  `created_by` int(11) DEFAULT NULL COMMENT '创建者',
  `changed_by` int(11) DEFAULT NULL COMMENT '更改者',
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  KEY `model_id` (`model_id`),
  KEY `created_by` (`created_by`),
  KEY `changed_by` (`changed_by`),
  CONSTRAINT `device_upgrade_attributes_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `device_types` (`id`),
  CONSTRAINT `device_upgrade_attributes_ibfk_2` FOREIGN KEY (`model_id`) REFERENCES `device_models` (`id`),
  CONSTRAINT `device_upgrade_attributes_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `device_upgrade_attributes_ibfk_4` FOREIGN KEY (`changed_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='设备升级属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_upgrade_attributes`
--

LOCK TABLES `device_upgrade_attributes` WRITE;
/*!40000 ALTER TABLE `device_upgrade_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_upgrade_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_model_attributes`
--

DROP TABLE IF EXISTS `device_model_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_model_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) DEFAULT NULL,
  `show_in_statistics` int(11) DEFAULT NULL COMMENT '是否在全局统计中展示:0->展示;1->不展示',
  `operator_device` int(11) DEFAULT NULL COMMENT '是否为运营商设备:0->是;1->否',
  `sales_area` int(11) DEFAULT NULL COMMENT '设备发售范围:0->境内;1->境外',
  `created_on` datetime DEFAULT NULL COMMENT '创建日期',
  `changed_on` datetime DEFAULT NULL COMMENT '更改日期',
  `created_by` int(11) DEFAULT NULL COMMENT '创建者',
  `changed_by` int(11) DEFAULT NULL COMMENT '更改者',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`),
  KEY `created_by` (`created_by`),
  KEY `changed_by` (`changed_by`),
  CONSTRAINT `device_model_attributes_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `device_models` (`id`),
  CONSTRAINT `device_model_attributes_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `device_model_attributes_ibfk_3` FOREIGN KEY (`changed_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='设备型号属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_model_attributes`
--

LOCK TABLES `device_model_attributes` WRITE;
/*!40000 ALTER TABLE `device_model_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_model_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_types`
--

DROP TABLE IF EXISTS `device_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL COMMENT '设备类型名称',
  `created_on` datetime DEFAULT NULL COMMENT '创建日期',
  `changed_on` datetime DEFAULT NULL COMMENT '更改日期',
  `created_by` int(11) DEFAULT NULL COMMENT '创建者',
  `changed_by` int(11) DEFAULT NULL COMMENT '更改者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `created_by` (`created_by`),
  KEY `changed_by` (`changed_by`),
  CONSTRAINT `device_types_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `device_types_ibfk_2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='设备类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_types`
--

LOCK TABLES `device_types` WRITE;
/*!40000 ALTER TABLE `device_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_type_model_relation`
--

DROP TABLE IF EXISTS `device_type_model_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_type_model_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL COMMENT '创建日期',
  `changed_on` datetime DEFAULT NULL COMMENT '更改日期',
  `created_by` int(11) DEFAULT NULL COMMENT '创建者',
  `changed_by` int(11) DEFAULT NULL COMMENT '更改者',
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  KEY `model_id` (`model_id`),
  KEY `created_by` (`created_by`),
  KEY `changed_by` (`changed_by`),
  CONSTRAINT `device_type_model_relation_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `device_types` (`id`),
  CONSTRAINT `device_type_model_relation_ibfk_2` FOREIGN KEY (`model_id`) REFERENCES `device_models` (`id`),
  CONSTRAINT `device_type_model_relation_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `device_type_model_relation_ibfk_4` FOREIGN KEY (`changed_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='设备类型和型号关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_type_model_relation`
--

LOCK TABLES `device_type_model_relation` WRITE;
/*!40000 ALTER TABLE `device_type_model_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_type_model_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firmware_upgrade_regions`
--

DROP TABLE IF EXISTS `firmware_upgrade_regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `firmware_upgrade_regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firmware_id` int(11) DEFAULT NULL,
  `province` varchar(64) DEFAULT NULL COMMENT '省',
  `city` varchar(64) DEFAULT NULL COMMENT '市',
  `created_on` datetime DEFAULT NULL COMMENT '创建日期',
  `changed_on` datetime DEFAULT NULL COMMENT '更改日期',
  `created_by` int(11) DEFAULT NULL COMMENT '创建者',
  `changed_by` int(11) DEFAULT NULL COMMENT '更改者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='升级地区表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firmware_upgrade_regions`
--

LOCK TABLES `firmware_upgrade_regions` WRITE;
/*!40000 ALTER TABLE `firmware_upgrade_regions` DISABLE KEYS */;
/*!40000 ALTER TABLE `firmware_upgrade_regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firmwares`
--

DROP TABLE IF EXISTS `firmwares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `firmwares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) DEFAULT NULL,
  `real_version` varchar(64) DEFAULT NULL COMMENT '固件版本号',
  `show_version` varchar(64) DEFAULT NULL COMMENT '显示版本号',
  `update_description` text DEFAULT NULL COMMENT '更新说明',
  `status` int(11) DEFAULT NULL COMMENT '上线状态:0->下线;1->上线',
  `upgrade_type` int(11) DEFAULT NULL COMMENT '升级类型:0->推荐升级;1->强制升级',
  `effect_on` datetime NOT NULL COMMENT '生效时间',
  `upgrade_limit` int(11) NOT NULL COMMENT '升级总量;0->不限制',
  `day_auto_upgrade_limit` int(11) NOT NULL COMMENT '单日自动升级总量;0->不限制',
  `day_manual_upgrade_limit` int(11) NOT NULL COMMENT '单日手动升级总量;0->不限制',
  `lowest_version` varchar(64) DEFAULT NULL COMMENT '允许升级的最低版本',
  `highest_version` varchar(64) DEFAULT NULL COMMENT '允许升级的最高版本',
  `upgrade_region_blacklist_flag` int(11) DEFAULT NULL COMMENT '升级地区限定:0->禁止升级地区;1->允许升级地区',
  `mac_limit` text DEFAULT NULL COMMENT '限定允许升级的MAC(设备)',
  `upgrade_dno` varchar(64) DEFAULT NULL COMMENT '限定运营商升级:CHA(中国电信),CHL(中国移动),CHU(中国联通)',
  `upgrade_detection` varchar(64) DEFAULT NULL COMMENT '限定升级检测来源:AUTO(自动升级),WEB(手动升级)',
  `url` varchar(128) DEFAULT NULL COMMENT '固件升级文件',
  `md5` varchar(64) DEFAULT NULL COMMENT 'MD5值',
  `created_on` datetime DEFAULT NULL COMMENT '创建日期',
  `changed_on` datetime DEFAULT NULL COMMENT '更改日期',
  `created_by` int(11) DEFAULT NULL COMMENT '创建者',
  `changed_by` int(11) DEFAULT NULL COMMENT '更改者',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`),
  KEY `created_by` (`created_by`),
  KEY `changed_by` (`changed_by`),
  CONSTRAINT `firmwares_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `device_models` (`id`),
  CONSTRAINT `firmwares_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `firmwares_ibfk_3` FOREIGN KEY (`changed_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='固件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firmwares`
--

LOCK TABLES `firmwares` WRITE;
/*!40000 ALTER TABLE `firmwares` DISABLE KEYS */;
/*!40000 ALTER TABLE `firmwares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_device_online`
--

DROP TABLE IF EXISTS `stat_device_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_device_online` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) DEFAULT NULL,
  `recently_online_days` int(11) DEFAULT NULL COMMENT '最近连续在线天数',
  `online_days` int(11) DEFAULT NULL COMMENT '累计在线天数',
  `seven_day_online_days` int(11) DEFAULT NULL COMMENT '近7天连续在线天数',
  `thirty_day_online_days` int(11) DEFAULT NULL COMMENT '近30天连续在线天数',
  `created_on` date DEFAULT NULL COMMENT '创建日期',
  `changed_on` datetime DEFAULT NULL COMMENT '更改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='设备在线统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_device_online`
--

LOCK TABLES `stat_device_online` WRITE;
/*!40000 ALTER TABLE `stat_device_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `stat_device_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firmware_upgrade_activity`
--

DROP TABLE IF EXISTS `firmware_upgrade_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `firmware_upgrade_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firmware_id` int(11) DEFAULT NULL,
  `activity_limit_range` int(11) DEFAULT NULL COMMENT '活跃度限制适用范围:0->全部设备;1->仅适用于勾选自动升级设备;2->仅适用于未勾选自动升级设备',
  `activation_start_on` datetime NOT NULL COMMENT '激活起始时间',
  `activation_end_on` datetime NOT NULL COMMENT '激活结束时间',
  `online_days` int(11) DEFAULT NULL COMMENT '在线天数限制',
  `manual_detection_symbol` int(11) DEFAULT NULL COMMENT '手动检测次数符号:0->小于;1->大于',
  `manual_detection_times` int(11) DEFAULT NULL COMMENT '手动检测次数',
  `last_detection_on` datetime NOT NULL COMMENT '最近检测时间',
  `local_upgrade_symbol` int(11) DEFAULT NULL COMMENT '本地升级次数符号:0->小于;1->大于',
  `local_upgrade_times` int(11) DEFAULT NULL COMMENT '本地升级次数',
  `last_upgrade_on` datetime NOT NULL COMMENT '最近升级时间',
  `created_on` datetime DEFAULT NULL COMMENT '创建日期',
  `changed_on` datetime DEFAULT NULL COMMENT '更改日期',
  `created_by` int(11) DEFAULT NULL COMMENT '创建者',
  `changed_by` int(11) DEFAULT NULL COMMENT '更改者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='活跃度筛选表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firmware_upgrade_activity`
--

LOCK TABLES `firmware_upgrade_activity` WRITE;
/*!40000 ALTER TABLE `firmware_upgrade_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `firmware_upgrade_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_activate_logs`
--

DROP TABLE IF EXISTS `device_activate_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_activate_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) DEFAULT NULL,
  `activated_on` datetime NOT NULL COMMENT '激活时间',
  `activated_version` varchar(64) DEFAULT NULL COMMENT '激活版本',
  `activated_ip` varchar(64) DEFAULT NULL COMMENT '激活IP',
  `activated_dno` varchar(64) DEFAULT NULL COMMENT '激活地址与运营商',
  `created_on` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='设备激活日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_activate_logs`
--

LOCK TABLES `device_activate_logs` WRITE;
/*!40000 ALTER TABLE `device_activate_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_activate_logs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-08 10:50:45
