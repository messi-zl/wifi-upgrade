/*
 Navicat Premium Data Transfer

 Source Server         : 本地mysql
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:3306
 Source Schema         : software

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 29/06/2021 18:53:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for alembic_version
-- ----------------------------
DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version`  (
  `version_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`version_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of alembic_version
-- ----------------------------

-- ----------------------------
-- Table structure for device_instances
-- ----------------------------
DROP TABLE IF EXISTS `device_instances`;
CREATE TABLE `device_instances`  (
  `created_on` datetime NOT NULL,
  `changed_on` datetime NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `call_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mac` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uuid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hard_version` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `soft_version` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `run` int(11) NULL DEFAULT NULL,
  `manual` int(11) NULL DEFAULT NULL,
  `doing` int(11) NULL DEFAULT NULL,
  `created_by_fk` int(11) NULL DEFAULT NULL,
  `changed_by_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `device_instances_ibfk_1`(`created_by_fk`) USING BTREE,
  INDEX `device_instances_ibfk_2`(`changed_by_fk`) USING BTREE,
  CONSTRAINT `device_instances_ibfk_1` FOREIGN KEY (`created_by_fk`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `device_instances_ibfk_2` FOREIGN KEY (`changed_by_fk`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of device_instances
-- ----------------------------

-- ----------------------------
-- Table structure for device_models
-- ----------------------------
DROP TABLE IF EXISTS `device_models`;
CREATE TABLE `device_models`  (
  `created_on` datetime NOT NULL,
  `changed_on` datetime NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `check_mode` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `check_period` int(11) NOT NULL,
  `new_version_check_period` int(11) NULL DEFAULT NULL,
  `allow_upgrade` tinyint(1) NOT NULL,
  `check_piracy` tinyint(1) NOT NULL,
  `upgrade_limit` int(11) NULL DEFAULT NULL,
  `upgrade_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upgrade_rules` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `global_statistics` tinyint(4) NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_by_fk` int(11) NOT NULL,
  `changed_by_fk` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `created_by_fk`(`created_by_fk`) USING BTREE,
  INDEX `changed_by_fk`(`changed_by_fk`) USING BTREE,
  CONSTRAINT `device_models_ibfk_2` FOREIGN KEY (`created_by_fk`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `device_models_ibfk_3` FOREIGN KEY (`changed_by_fk`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of device_models
-- ----------------------------

-- ----------------------------
-- Table structure for device_states
-- ----------------------------
DROP TABLE IF EXISTS `device_states`;
CREATE TABLE `device_states`  (
  `created_on` datetime NOT NULL,
  `changed_on` datetime NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_instance_id` int(11) NOT NULL,
  `cpu_used` int(11) NULL DEFAULT NULL,
  `mem_used` int(11) NULL DEFAULT NULL,
  `wifi_state` int(11) NULL DEFAULT NULL,
  `wan_lan_state` int(11) NULL DEFAULT NULL,
  `created_by_fk` int(11) NULL DEFAULT NULL,
  `changed_by_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `device_instance_id`(`device_instance_id`) USING BTREE,
  INDEX `device_states_ibfk_2`(`created_by_fk`) USING BTREE,
  INDEX `device_states_ibfk_3`(`changed_by_fk`) USING BTREE,
  CONSTRAINT `device_states_ibfk_1` FOREIGN KEY (`device_instance_id`) REFERENCES `device_instances` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `device_states_ibfk_2` FOREIGN KEY (`created_by_fk`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `device_states_ibfk_3` FOREIGN KEY (`changed_by_fk`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1404 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of device_states
-- ----------------------------

-- ----------------------------
-- Table structure for dictionary_items
-- ----------------------------
DROP TABLE IF EXISTS `dictionary_items`;
CREATE TABLE `dictionary_items`  (
  `created_on` datetime NOT NULL,
  `changed_on` datetime NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dictionary_id` int(11) NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ranking` int(11) NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_by_fk` int(11) NOT NULL,
  `changed_by_fk` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dictionary_id`(`dictionary_id`) USING BTREE,
  INDEX `created_by_fk`(`created_by_fk`) USING BTREE,
  INDEX `changed_by_fk`(`changed_by_fk`) USING BTREE,
  CONSTRAINT `dictionary_items_ibfk_1` FOREIGN KEY (`dictionary_id`) REFERENCES `dictionarys` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dictionary_items_ibfk_2` FOREIGN KEY (`created_by_fk`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dictionary_items_ibfk_3` FOREIGN KEY (`changed_by_fk`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dictionary_items
-- ----------------------------

-- ----------------------------
-- Table structure for dictionarys
-- ----------------------------
DROP TABLE IF EXISTS `dictionarys`;
CREATE TABLE `dictionarys`  (
  `created_on` datetime NOT NULL,
  `changed_on` datetime NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_by_fk` int(11) NOT NULL,
  `changed_by_fk` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE,
  INDEX `created_by_fk`(`created_by_fk`) USING BTREE,
  INDEX `changed_by_fk`(`changed_by_fk`) USING BTREE,
  CONSTRAINT `dictionarys_ibfk_1` FOREIGN KEY (`created_by_fk`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dictionarys_ibfk_2` FOREIGN KEY (`changed_by_fk`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dictionarys
-- ----------------------------

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `dashboard_id` int(11) NULL DEFAULT NULL,
  `slice_id` int(11) NULL DEFAULT NULL,
  `json` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `dttm` datetime NULL DEFAULT NULL,
  `duration_ms` int(11) NULL DEFAULT NULL,
  `referrer` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `request_path` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 637 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of logs
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permission
-- ----------------------------

-- ----------------------------
-- Table structure for permission_view
-- ----------------------------
DROP TABLE IF EXISTS `permission_view`;
CREATE TABLE `permission_view`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NULL DEFAULT NULL,
  `view_menu_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `permission_id`(`permission_id`, `view_menu_id`) USING BTREE,
  INDEX `view_menu_id`(`view_menu_id`) USING BTREE,
  CONSTRAINT `permission_view_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `permission_view_ibfk_2` FOREIGN KEY (`view_menu_id`) REFERENCES `view_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permission_view
-- ----------------------------

-- ----------------------------
-- Table structure for permission_view_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_view_role`;
CREATE TABLE `permission_view_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_view_id` int(11) NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `permission_view_id`(`permission_view_id`, `role_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `permission_view_role_ibfk_1` FOREIGN KEY (`permission_view_id`) REFERENCES `permission_view` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `permission_view_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permission_view_role
-- ----------------------------

-- ----------------------------
-- Table structure for register_user
-- ----------------------------
DROP TABLE IF EXISTS `register_user`;
CREATE TABLE `register_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `registration_date` datetime NULL DEFAULT NULL,
  `registration_hash` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of register_user
-- ----------------------------

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源url',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES (2, '查询后台所有菜单', '/viewMenu/listAll', '查询后台所有菜单');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (11, 'wangwu');
INSERT INTO `role` VALUES (12, 'zhaoliu');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NULL DEFAULT NULL,
  `menu_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (4, 12, 41);
INSERT INTO `role_menu` VALUES (5, 11, 40);

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `role_id` int(20) NULL DEFAULT NULL COMMENT '角色id',
  `resource_id` int(20) NULL DEFAULT NULL COMMENT '资源id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES (2, 11, 2);

-- ----------------------------
-- Table structure for rom_softwares
-- ----------------------------
DROP TABLE IF EXISTS `rom_softwares`;
CREATE TABLE `rom_softwares`  (
  `created_on` datetime NOT NULL,
  `changed_on` datetime NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_model_id` int(11) NOT NULL,
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `display_version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upgrade_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `start_datetime` datetime NULL DEFAULT NULL,
  `upgrade_limit` int(11) NULL DEFAULT NULL,
  `daily_upgrade_limit` int(11) NULL DEFAULT NULL,
  `version_range` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `area_range` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `file` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file_size` int(11) NULL DEFAULT NULL,
  `file_md5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `english_description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `traditional_description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_by_fk` int(11) NOT NULL,
  `changed_by_fk` int(11) NOT NULL,
  `download_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_dir` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `device_model_id`(`device_model_id`) USING BTREE,
  INDEX `created_by_fk`(`created_by_fk`) USING BTREE,
  INDEX `changed_by_fk`(`changed_by_fk`) USING BTREE,
  CONSTRAINT `rom_softwares_ibfk_1` FOREIGN KEY (`device_model_id`) REFERENCES `device_models` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rom_softwares_ibfk_2` FOREIGN KEY (`created_by_fk`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rom_softwares_ibfk_3` FOREIGN KEY (`changed_by_fk`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rom_softwares
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名',
  `last_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓',
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `active` tinyint(1) NULL DEFAULT NULL COMMENT '是否激活(true:激活;false:未激活)',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `last_login` datetime NULL DEFAULT NULL COMMENT '上一次登录',
  `login_count` int(11) NULL DEFAULT NULL COMMENT '登录次数',
  `fail_login_count` int(11) NULL DEFAULT NULL COMMENT '失败的登录次数',
  `created_on` datetime NULL DEFAULT NULL COMMENT '创建于',
  `changed_on` datetime NULL DEFAULT NULL COMMENT '修改于',
  `created_by_fk` int(11) NULL DEFAULT NULL,
  `changed_by_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  INDEX `created_by_fk`(`created_by_fk`) USING BTREE,
  INDEX `changed_by_fk`(`changed_by_fk`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`created_by_fk`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`changed_by_fk`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (11, '王', '五', 'wangwu', '$2a$10$U6Zy8XZd8GM6XUatFXh4keJU3Bkpl/keifojgsAP95TiF9RAeOHle', 1, '12345678@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (12, '赵', '六', 'zhaoliu', '$2a$10$uPaAaztJwEWH/AXdfgmQBueR.Xmd2Il2sC3l32pxw6082MNW56YTa', 1, '987654321@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `role_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (11, 11, 11);
INSERT INTO `user_role` VALUES (12, 12, 12);

-- ----------------------------
-- Table structure for view_menu
-- ----------------------------
DROP TABLE IF EXISTS `view_menu`;
CREATE TABLE `view_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of view_menu
-- ----------------------------
INSERT INTO `view_menu` VALUES (40, '菜单1');
INSERT INTO `view_menu` VALUES (41, '菜单2');

SET FOREIGN_KEY_CHECKS = 1;
