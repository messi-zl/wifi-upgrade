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

 Date: 28/06/2021 20:26:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ab_permission
-- ----------------------------
DROP TABLE IF EXISTS `ab_permission`;
CREATE TABLE `ab_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ab_permission
-- ----------------------------
INSERT INTO `ab_permission` VALUES (3, 'can_add');
INSERT INTO `ab_permission` VALUES (15, 'can_chart');
INSERT INTO `ab_permission` VALUES (7, 'can_delete');
INSERT INTO `ab_permission` VALUES (6, 'can_download');
INSERT INTO `ab_permission` VALUES (4, 'can_edit');
INSERT INTO `ab_permission` VALUES (16, 'can_get');
INSERT INTO `ab_permission` VALUES (9, 'can_list');
INSERT INTO `ab_permission` VALUES (8, 'can_show');
INSERT INTO `ab_permission` VALUES (2, 'can_this_form_get');
INSERT INTO `ab_permission` VALUES (1, 'can_this_form_post');
INSERT INTO `ab_permission` VALUES (5, 'can_userinfo');
INSERT INTO `ab_permission` VALUES (14, 'copyrole');
INSERT INTO `ab_permission` VALUES (13, 'menu_access');
INSERT INTO `ab_permission` VALUES (10, 'resetmypassword');
INSERT INTO `ab_permission` VALUES (11, 'resetpasswords');
INSERT INTO `ab_permission` VALUES (12, 'userinfoedit');

-- ----------------------------
-- Table structure for ab_permission_view
-- ----------------------------
DROP TABLE IF EXISTS `ab_permission_view`;
CREATE TABLE `ab_permission_view`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NULL DEFAULT NULL,
  `view_menu_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `permission_id`(`permission_id`, `view_menu_id`) USING BTREE,
  INDEX `view_menu_id`(`view_menu_id`) USING BTREE,
  CONSTRAINT `ab_permission_view_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `ab_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ab_permission_view_ibfk_2` FOREIGN KEY (`view_menu_id`) REFERENCES `ab_view_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ab_permission_view
-- ----------------------------
INSERT INTO `ab_permission_view` VALUES (1, 1, 5);
INSERT INTO `ab_permission_view` VALUES (3, 1, 6);
INSERT INTO `ab_permission_view` VALUES (5, 1, 7);
INSERT INTO `ab_permission_view` VALUES (2, 2, 5);
INSERT INTO `ab_permission_view` VALUES (4, 2, 6);
INSERT INTO `ab_permission_view` VALUES (6, 2, 7);
INSERT INTO `ab_permission_view` VALUES (7, 3, 9);
INSERT INTO `ab_permission_view` VALUES (19, 3, 12);
INSERT INTO `ab_permission_view` VALUES (39, 3, 25);
INSERT INTO `ab_permission_view` VALUES (45, 3, 27);
INSERT INTO `ab_permission_view` VALUES (51, 3, 29);
INSERT INTO `ab_permission_view` VALUES (58, 3, 32);
INSERT INTO `ab_permission_view` VALUES (65, 3, 33);
INSERT INTO `ab_permission_view` VALUES (71, 3, 35);
INSERT INTO `ab_permission_view` VALUES (8, 4, 9);
INSERT INTO `ab_permission_view` VALUES (20, 4, 12);
INSERT INTO `ab_permission_view` VALUES (40, 4, 25);
INSERT INTO `ab_permission_view` VALUES (46, 4, 27);
INSERT INTO `ab_permission_view` VALUES (52, 4, 29);
INSERT INTO `ab_permission_view` VALUES (59, 4, 32);
INSERT INTO `ab_permission_view` VALUES (67, 4, 33);
INSERT INTO `ab_permission_view` VALUES (73, 4, 35);
INSERT INTO `ab_permission_view` VALUES (9, 5, 9);
INSERT INTO `ab_permission_view` VALUES (10, 6, 9);
INSERT INTO `ab_permission_view` VALUES (21, 6, 12);
INSERT INTO `ab_permission_view` VALUES (11, 7, 9);
INSERT INTO `ab_permission_view` VALUES (22, 7, 12);
INSERT INTO `ab_permission_view` VALUES (41, 7, 25);
INSERT INTO `ab_permission_view` VALUES (47, 7, 27);
INSERT INTO `ab_permission_view` VALUES (53, 7, 29);
INSERT INTO `ab_permission_view` VALUES (60, 7, 32);
INSERT INTO `ab_permission_view` VALUES (63, 7, 33);
INSERT INTO `ab_permission_view` VALUES (69, 7, 35);
INSERT INTO `ab_permission_view` VALUES (12, 8, 9);
INSERT INTO `ab_permission_view` VALUES (23, 8, 12);
INSERT INTO `ab_permission_view` VALUES (36, 8, 23);
INSERT INTO `ab_permission_view` VALUES (42, 8, 25);
INSERT INTO `ab_permission_view` VALUES (48, 8, 27);
INSERT INTO `ab_permission_view` VALUES (54, 8, 29);
INSERT INTO `ab_permission_view` VALUES (61, 8, 32);
INSERT INTO `ab_permission_view` VALUES (66, 8, 33);
INSERT INTO `ab_permission_view` VALUES (72, 8, 35);
INSERT INTO `ab_permission_view` VALUES (13, 9, 9);
INSERT INTO `ab_permission_view` VALUES (24, 9, 12);
INSERT INTO `ab_permission_view` VALUES (29, 9, 16);
INSERT INTO `ab_permission_view` VALUES (31, 9, 18);
INSERT INTO `ab_permission_view` VALUES (33, 9, 20);
INSERT INTO `ab_permission_view` VALUES (37, 9, 23);
INSERT INTO `ab_permission_view` VALUES (43, 9, 25);
INSERT INTO `ab_permission_view` VALUES (49, 9, 27);
INSERT INTO `ab_permission_view` VALUES (55, 9, 29);
INSERT INTO `ab_permission_view` VALUES (62, 9, 32);
INSERT INTO `ab_permission_view` VALUES (64, 9, 33);
INSERT INTO `ab_permission_view` VALUES (70, 9, 35);
INSERT INTO `ab_permission_view` VALUES (14, 10, 9);
INSERT INTO `ab_permission_view` VALUES (15, 11, 9);
INSERT INTO `ab_permission_view` VALUES (16, 12, 9);
INSERT INTO `ab_permission_view` VALUES (17, 13, 10);
INSERT INTO `ab_permission_view` VALUES (18, 13, 11);
INSERT INTO `ab_permission_view` VALUES (26, 13, 13);
INSERT INTO `ab_permission_view` VALUES (28, 13, 15);
INSERT INTO `ab_permission_view` VALUES (30, 13, 17);
INSERT INTO `ab_permission_view` VALUES (32, 13, 19);
INSERT INTO `ab_permission_view` VALUES (34, 13, 21);
INSERT INTO `ab_permission_view` VALUES (38, 13, 24);
INSERT INTO `ab_permission_view` VALUES (44, 13, 26);
INSERT INTO `ab_permission_view` VALUES (50, 13, 28);
INSERT INTO `ab_permission_view` VALUES (56, 13, 30);
INSERT INTO `ab_permission_view` VALUES (57, 13, 31);
INSERT INTO `ab_permission_view` VALUES (68, 13, 34);
INSERT INTO `ab_permission_view` VALUES (74, 13, 36);
INSERT INTO `ab_permission_view` VALUES (25, 14, 12);
INSERT INTO `ab_permission_view` VALUES (27, 15, 14);
INSERT INTO `ab_permission_view` VALUES (35, 16, 22);

-- ----------------------------
-- Table structure for ab_permission_view_role
-- ----------------------------
DROP TABLE IF EXISTS `ab_permission_view_role`;
CREATE TABLE `ab_permission_view_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_view_id` int(11) NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `permission_view_id`(`permission_view_id`, `role_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `ab_permission_view_role_ibfk_1` FOREIGN KEY (`permission_view_id`) REFERENCES `ab_permission_view` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ab_permission_view_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `ab_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ab_permission_view_role
-- ----------------------------
INSERT INTO `ab_permission_view_role` VALUES (1, 1, 1);
INSERT INTO `ab_permission_view_role` VALUES (2, 2, 1);
INSERT INTO `ab_permission_view_role` VALUES (3, 3, 1);
INSERT INTO `ab_permission_view_role` VALUES (4, 4, 1);
INSERT INTO `ab_permission_view_role` VALUES (5, 5, 1);
INSERT INTO `ab_permission_view_role` VALUES (6, 6, 1);
INSERT INTO `ab_permission_view_role` VALUES (7, 7, 1);
INSERT INTO `ab_permission_view_role` VALUES (8, 8, 1);
INSERT INTO `ab_permission_view_role` VALUES (9, 9, 1);
INSERT INTO `ab_permission_view_role` VALUES (10, 10, 1);
INSERT INTO `ab_permission_view_role` VALUES (11, 11, 1);
INSERT INTO `ab_permission_view_role` VALUES (12, 12, 1);
INSERT INTO `ab_permission_view_role` VALUES (13, 13, 1);
INSERT INTO `ab_permission_view_role` VALUES (14, 14, 1);
INSERT INTO `ab_permission_view_role` VALUES (15, 15, 1);
INSERT INTO `ab_permission_view_role` VALUES (16, 16, 1);
INSERT INTO `ab_permission_view_role` VALUES (17, 17, 1);
INSERT INTO `ab_permission_view_role` VALUES (18, 18, 1);
INSERT INTO `ab_permission_view_role` VALUES (19, 19, 1);
INSERT INTO `ab_permission_view_role` VALUES (20, 20, 1);
INSERT INTO `ab_permission_view_role` VALUES (21, 21, 1);
INSERT INTO `ab_permission_view_role` VALUES (22, 22, 1);
INSERT INTO `ab_permission_view_role` VALUES (23, 23, 1);
INSERT INTO `ab_permission_view_role` VALUES (24, 24, 1);
INSERT INTO `ab_permission_view_role` VALUES (25, 25, 1);
INSERT INTO `ab_permission_view_role` VALUES (26, 26, 1);
INSERT INTO `ab_permission_view_role` VALUES (27, 27, 1);
INSERT INTO `ab_permission_view_role` VALUES (28, 28, 1);
INSERT INTO `ab_permission_view_role` VALUES (29, 29, 1);
INSERT INTO `ab_permission_view_role` VALUES (30, 30, 1);
INSERT INTO `ab_permission_view_role` VALUES (31, 31, 1);
INSERT INTO `ab_permission_view_role` VALUES (32, 32, 1);
INSERT INTO `ab_permission_view_role` VALUES (33, 33, 1);
INSERT INTO `ab_permission_view_role` VALUES (34, 34, 1);
INSERT INTO `ab_permission_view_role` VALUES (35, 35, 1);
INSERT INTO `ab_permission_view_role` VALUES (36, 36, 1);
INSERT INTO `ab_permission_view_role` VALUES (37, 37, 1);
INSERT INTO `ab_permission_view_role` VALUES (38, 38, 1);
INSERT INTO `ab_permission_view_role` VALUES (39, 39, 1);
INSERT INTO `ab_permission_view_role` VALUES (40, 40, 1);
INSERT INTO `ab_permission_view_role` VALUES (41, 41, 1);
INSERT INTO `ab_permission_view_role` VALUES (42, 42, 1);
INSERT INTO `ab_permission_view_role` VALUES (43, 43, 1);
INSERT INTO `ab_permission_view_role` VALUES (44, 44, 1);
INSERT INTO `ab_permission_view_role` VALUES (45, 45, 1);
INSERT INTO `ab_permission_view_role` VALUES (46, 46, 1);
INSERT INTO `ab_permission_view_role` VALUES (47, 47, 1);
INSERT INTO `ab_permission_view_role` VALUES (48, 48, 1);
INSERT INTO `ab_permission_view_role` VALUES (49, 49, 1);
INSERT INTO `ab_permission_view_role` VALUES (50, 50, 1);
INSERT INTO `ab_permission_view_role` VALUES (51, 51, 1);
INSERT INTO `ab_permission_view_role` VALUES (52, 52, 1);
INSERT INTO `ab_permission_view_role` VALUES (53, 53, 1);
INSERT INTO `ab_permission_view_role` VALUES (54, 54, 1);
INSERT INTO `ab_permission_view_role` VALUES (55, 55, 1);
INSERT INTO `ab_permission_view_role` VALUES (56, 56, 1);
INSERT INTO `ab_permission_view_role` VALUES (57, 57, 1);
INSERT INTO `ab_permission_view_role` VALUES (58, 58, 1);
INSERT INTO `ab_permission_view_role` VALUES (59, 59, 1);
INSERT INTO `ab_permission_view_role` VALUES (60, 60, 1);
INSERT INTO `ab_permission_view_role` VALUES (61, 61, 1);
INSERT INTO `ab_permission_view_role` VALUES (62, 62, 1);
INSERT INTO `ab_permission_view_role` VALUES (63, 63, 1);
INSERT INTO `ab_permission_view_role` VALUES (64, 64, 1);
INSERT INTO `ab_permission_view_role` VALUES (65, 65, 1);
INSERT INTO `ab_permission_view_role` VALUES (66, 66, 1);
INSERT INTO `ab_permission_view_role` VALUES (67, 67, 1);
INSERT INTO `ab_permission_view_role` VALUES (68, 68, 1);
INSERT INTO `ab_permission_view_role` VALUES (69, 69, 1);
INSERT INTO `ab_permission_view_role` VALUES (70, 70, 1);
INSERT INTO `ab_permission_view_role` VALUES (71, 71, 1);
INSERT INTO `ab_permission_view_role` VALUES (72, 72, 1);
INSERT INTO `ab_permission_view_role` VALUES (73, 73, 1);
INSERT INTO `ab_permission_view_role` VALUES (74, 74, 1);

-- ----------------------------
-- Table structure for ab_register_user
-- ----------------------------
DROP TABLE IF EXISTS `ab_register_user`;
CREATE TABLE `ab_register_user`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ab_register_user
-- ----------------------------

-- ----------------------------
-- Table structure for ab_resource
-- ----------------------------
DROP TABLE IF EXISTS `ab_resource`;
CREATE TABLE `ab_resource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源url',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ab_resource
-- ----------------------------

-- ----------------------------
-- Table structure for ab_role
-- ----------------------------
DROP TABLE IF EXISTS `ab_role`;
CREATE TABLE `ab_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ab_role
-- ----------------------------
INSERT INTO `ab_role` VALUES (8, 'lisi');

-- ----------------------------
-- Table structure for ab_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `ab_role_menu`;
CREATE TABLE `ab_role_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NULL DEFAULT NULL,
  `menu_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ab_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for ab_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `ab_role_resource`;
CREATE TABLE `ab_role_resource`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `role_id` int(20) NULL DEFAULT NULL COMMENT '角色id',
  `resource_id` int(20) NULL DEFAULT NULL COMMENT '资源id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ab_role_resource
-- ----------------------------

-- ----------------------------
-- Table structure for ab_user
-- ----------------------------
DROP TABLE IF EXISTS `ab_user`;
CREATE TABLE `ab_user`  (
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
  CONSTRAINT `ab_user_ibfk_1` FOREIGN KEY (`created_by_fk`) REFERENCES `ab_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ab_user_ibfk_2` FOREIGN KEY (`changed_by_fk`) REFERENCES `ab_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ab_user
-- ----------------------------
INSERT INTO `ab_user` VALUES (8, '四', '李', 'lisi', '$2a$10$TfaC8Q0QxTVwSi3/Gvs0re/9ETqHW/gnxQr7MxfNcGmwRwhtPb.Vi', 1, '888@qq.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for ab_user_role
-- ----------------------------
DROP TABLE IF EXISTS `ab_user_role`;
CREATE TABLE `ab_user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `role_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `ab_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `ab_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ab_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `ab_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ab_user_role
-- ----------------------------
INSERT INTO `ab_user_role` VALUES (8, 8, 8);

-- ----------------------------
-- Table structure for ab_view_menu
-- ----------------------------
DROP TABLE IF EXISTS `ab_view_menu`;
CREATE TABLE `ab_view_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ab_view_menu
-- ----------------------------
INSERT INTO `ab_view_menu` VALUES (8, 'AuthDBView');
INSERT INTO `ab_view_menu` VALUES (17, 'Base Permissions');
INSERT INTO `ab_view_menu` VALUES (34, 'Device Instance');
INSERT INTO `ab_view_menu` VALUES (30, 'Device Model');
INSERT INTO `ab_view_menu` VALUES (36, 'Device State');
INSERT INTO `ab_view_menu` VALUES (33, 'DeviceInstanceModelView');
INSERT INTO `ab_view_menu` VALUES (29, 'DeviceModelModelView');
INSERT INTO `ab_view_menu` VALUES (35, 'DeviceStateModelView');
INSERT INTO `ab_view_menu` VALUES (26, 'Dictionary');
INSERT INTO `ab_view_menu` VALUES (28, 'Dictionary Item');
INSERT INTO `ab_view_menu` VALUES (27, 'DictionaryItemModelView');
INSERT INTO `ab_view_menu` VALUES (25, 'DictionaryModelView');
INSERT INTO `ab_view_menu` VALUES (1, 'IndexView');
INSERT INTO `ab_view_menu` VALUES (13, 'List Roles');
INSERT INTO `ab_view_menu` VALUES (10, 'List Users');
INSERT INTO `ab_view_menu` VALUES (3, 'LocaleView');
INSERT INTO `ab_view_menu` VALUES (24, 'Log');
INSERT INTO `ab_view_menu` VALUES (23, 'LogModelView');
INSERT INTO `ab_view_menu` VALUES (31, 'Manage');
INSERT INTO `ab_view_menu` VALUES (22, 'MenuApi');
INSERT INTO `ab_view_menu` VALUES (21, 'Permission on Views/Menus');
INSERT INTO `ab_view_menu` VALUES (16, 'PermissionModelView');
INSERT INTO `ab_view_menu` VALUES (20, 'PermissionViewModelView');
INSERT INTO `ab_view_menu` VALUES (6, 'ResetMyPasswordView');
INSERT INTO `ab_view_menu` VALUES (5, 'ResetPasswordView');
INSERT INTO `ab_view_menu` VALUES (12, 'RoleModelView');
INSERT INTO `ab_view_menu` VALUES (32, 'RomSoftwareModelView');
INSERT INTO `ab_view_menu` VALUES (11, 'Security');
INSERT INTO `ab_view_menu` VALUES (4, 'SecurityApi');
INSERT INTO `ab_view_menu` VALUES (15, 'User\'s Statistics');
INSERT INTO `ab_view_menu` VALUES (9, 'UserDBModelView');
INSERT INTO `ab_view_menu` VALUES (7, 'UserInfoEditView');
INSERT INTO `ab_view_menu` VALUES (14, 'UserStatsChartView');
INSERT INTO `ab_view_menu` VALUES (2, 'UtilView');
INSERT INTO `ab_view_menu` VALUES (18, 'ViewMenuModelView');
INSERT INTO `ab_view_menu` VALUES (19, 'Views/Menus');

-- ----------------------------
-- Table structure for alembic_version
-- ----------------------------
DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version`  (
  `version_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`version_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  CONSTRAINT `device_instances_ibfk_1` FOREIGN KEY (`created_by_fk`) REFERENCES `ab_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `device_instances_ibfk_2` FOREIGN KEY (`changed_by_fk`) REFERENCES `ab_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of device_instances
-- ----------------------------
INSERT INTO `device_instances` VALUES ('2021-04-24 11:07:26', '2021-04-24 11:07:26', 1, 'SIMAX18T', 'fortest', 'fortest', 'fortest', NULL, NULL, 'V1.0', 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-04-25 07:04:04', '2021-04-25 07:12:21', 2, 'SIMAX1800T', 'up_param.lan_mac', '11223344AABB', '45678901234567890123', '', '1.0', '1.0.0.0', 100, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-07 09:39:06', '2021-05-07 09:41:01', 3, 'SIMAX1800T', '30:95:e3:42:b1:a', '30:95:e3:42:b1:a', '', '', '1.0', 'V1.0-202101131500', 29621, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-08 08:04:08', '2021-05-08 08:04:08', 4, 'SIMAX1800T', '11223344AABB', '11223344AABB', '', '', '1.0', 'V1.0-202101131500', 100, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-10 05:56:25', '2021-05-22 18:22:11', 5, 'SIMAX1800T', '3095E342B1A1', '3095E342B1A1', '45478801234567892358', '', '1.0', 'V1.0-202101131500', 61175, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-10 06:07:26', '2021-05-10 06:07:26', 6, 'SIMAX1800T', '3095E342B1A1', '3095E342B1A1', '3095E342B1A1', '', '1.0', 'V1.0-202101131500', 100, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-10 06:25:30', '2021-05-10 06:25:30', 7, 'SIMAX1800T', '3095E342B1A1', '3095E342B1A1', '3095E342B1A2', '', '1.0', '2.0-202101131500', 100, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-11 02:58:50', '2021-05-20 05:54:27', 8, 'SIMAX1800T', '182B3C4D5867', '182B3C4D5867', '45678901234567890124', '', '1.0', 'V1.0-202101131500', 35888, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-11 10:17:36', '2021-05-22 10:04:24', 9, 'SIMAX1800T', '3095E342AFC9', '3095E342AFC9', '', '', '1.0', 'V1.0-202101131500', 135277, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-12 08:44:09', '2021-05-20 06:45:05', 10, 'SIMAX1800T', '3095E342AFC9', '3095E342AFC9', '690797128135791', '', '1.0', 'V1.0-202101131500', 219937, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-13 03:10:28', '2021-05-20 07:55:48', 11, 'SIMAX1800T', 'D43A2EEA4657', 'D43A2EEA4657', '621101642158457', '', '1.0', 'V1.0-202101131500', 17116, 1, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-13 05:29:23', '2021-05-13 11:54:13', 12, 'SIMAX1800T', '2C37C5B0003E', '2C37C5B0003E', '', '', '1.0', 'V1.0-202101131500', 7927, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-13 09:40:47', '2021-05-18 10:38:43', 13, 'SIMAX1800T', '78D37AE4473F', '78D37AE4473F', '621101215478025', '', '1.0', 'V1.0-202101131500', 7570, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-13 15:37:15', '2021-05-14 01:43:30', 14, 'SIMAX1800T', '7C37C5B07A7D', '7C37C5B07A7D', '', '', '1.0', 'V1.0-202101131500', 22953, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-14 04:51:31', '2021-05-18 12:18:48', 15, 'SIMAX1800T', '2C37C5B00031', '2C37C5B00031', '', '', '1.0', 'V1.0-202101131500', 17305, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-14 04:57:07', '2021-05-22 09:36:39', 16, 'SIMAX1800T', '78D38DC383AB', '78D38DC383AB', '', '', '1.0', 'V1.0-202101131500', 56076, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-14 09:19:50', '2021-05-14 09:19:50', 17, 'SIMAX1800T', 'E4671E671868', 'E4671E671868', '', '', '1.0', 'V1.0-202101131500', 8832, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-17 05:20:04', '2021-05-20 20:17:22', 18, 'SIMAX1800T', '3095E3446912', '3095E3446912', '183557840000255', '', '1.0', 'V1.0-202101131500', 265119, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-17 06:28:01', '2021-05-20 00:45:40', 19, 'SIMAX1800T', '7C37C5B0867C', '7C37C5B0867C', '123456789088888', '', '1.0', 'V1.0-202101131500', 17207, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-17 09:23:27', '2021-05-20 17:40:28', 20, 'SIMAX1800T', '3095E34469DD', '3095E34469DD', '183557840000284', '', '1.0', 'V1.0-202101131500', 76644, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-17 13:41:46', '2021-05-19 06:53:49', 21, 'SIMAX1800T', '3095E3446403', '3095E3446403', '183557840000070', '', '1.0', 'V1.0-202101131500', 88881, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-17 14:01:06', '2021-05-19 10:18:22', 22, 'SIMAX1800T', '3095E344653E', '3095E344653E', '183557840000115', '', '1.0', 'V1.0-202101131500', 8204, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-17 19:02:10', '2021-05-18 02:14:25', 23, 'SIMAX1800T', '', '', '621101642158457', '', '1.0', 'V1.0-202105131200', 26097, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-17 19:28:08', '2021-05-17 23:42:26', 24, 'SIMAX1800T', '', '', '183557840000070', '', '1.0', 'V1.0-202105131200', 15384, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-17 19:29:07', '2021-05-24 06:27:33', 25, 'SIMAX1800T', '', '', '', '', '1.0', 'V1.0-202105131200', 8843, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-18 09:11:11', '2021-05-25 05:26:59', 26, 'SIMAX1800T', '182B3C4D5867', '182B3C4D5867', '98765436789098765432', '', '1.0', 'V1.0-202101131500', 40253, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-18 10:34:11', '2021-05-19 05:08:35', 27, 'SIMAX1800T', '7C37C5B0867C', '7C37C5B0867C', '88888123456789', '', '1.0', 'V1.0-202101131500', 7241, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-18 12:16:56', '2021-05-20 12:06:37', 28, 'SIMAX1800T', '5095E342B02C', '5095E342B02C', '183557849999909', '', '1.0', 'V1.0-202101131500', 38668, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-18 17:36:55', '2021-05-20 18:19:09', 29, 'SIMAX1800T', '3095E3446A00', '3095E3446A00', '183557840000289', '', '1.0', 'V1.0-202101131500', 167775, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-19 03:27:50', '2021-05-24 08:45:27', 30, 'SIMAX1800T', '78D37BE1243E', '78D37BE1243E', '', '', '1.0', 'V1.0-202101131500', 16398, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-19 04:21:58', '2021-05-24 00:47:52', 31, 'SIMAX1800T', '78D37AE4473F', '78D37AE4473F', '', '', '1.0', 'V1.0-202101131500', 106053, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-19 05:47:54', '2021-05-20 06:56:20', 32, 'SIMAX1800T', 'E4671E2DD6B5', 'E4671E2DD6B5', '', '', '1.0', 'V1.0-202101131500', 98064, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-19 08:50:29', '2021-05-20 06:20:59', 33, 'SIMAX1800T', '7C37C5B0867C', '7C37C5B0867C', '12345678900000', '', '1.0', 'V1.0-202101131500', 15687, 1, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-19 09:02:45', '2021-05-20 18:15:10', 34, 'SIMAX1800T', '3095E34469BA', '3095E34469BA', '183557840000279', '', '1.0', 'V1.0-202101131500', 89881, 1, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-19 10:48:36', '2021-05-25 05:48:59', 35, 'SIMAX1800T', 'E4671E2471CF', 'E4671E2471CF', '', '', '1.0', 'V1.0-202101131500', 56560, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-20 04:31:48', '2021-05-22 00:35:05', 36, 'SIMAX1800T', '78D37AE2456D', '78D37AE2456D', '', '', '1.0', 'V1.0-202101131500', 24130, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-20 06:15:14', '2021-05-20 06:15:14', 37, 'SIMAX1800T', '000C43264643', '000C43264643', '', '', '1.0', 'V1.0-202101131500', 8590, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-20 10:28:58', '2021-05-24 06:38:45', 38, 'SIMAX1800T', '7874B4B786A8', '7874B4B786A8', '12345678966666', '', '1.0', 'V1.0-202101131500', 8796, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-20 12:00:52', '2021-05-20 12:00:52', 39, 'SIMAX1800T', 'D43A2EEA4657', 'D43A2EEA4657', '', '', '1.0', 'V1.0-202101131500', 7706, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-20 15:44:34', '2021-05-21 00:12:01', 40, 'SIMAX1800T', 'E4671E031426', 'E4671E031426', '', '', '1.0', 'V1.0-202101131500', 25194, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-20 18:18:02', '2021-05-25 04:06:15', 41, 'SIMAX1800T', '3095E34469BA', '3095E34469BA', 'CNSAX18TZC110B1619000259', '', '1.0', 'V1.0-202105182000', 49375, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-20 18:22:06', '2021-05-25 04:56:40', 42, 'SIMAX1800T', '3095E3446A00', '3095E3446A00', 'CNSAX18TZC110B1619000269', '', '1.0', 'V1.0-202105182000', 383886, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-20 20:20:49', '2021-05-25 04:12:47', 43, 'SIMAX1800T', '3095E3446912', '3095E3446912', 'CNSAX18TZC110B1619000235', '', '1.0', 'V1.0-202105182000', 98477, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-22 05:23:54', '2021-05-25 05:43:44', 44, 'SIMAX1800T', '3095E3446943', '3095E3446943', 'CNSAX18TZC110B1619000242', '', '1.0', 'V1.0-202101131500', 17368, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-22 18:25:01', '2021-05-25 03:59:33', 45, 'SIMAX1800T', '3095E342B1A1', '3095E342B1A1', '', '', '1.0', 'V1.0-202105182000', 9663, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-23 03:36:37', '2021-05-24 11:40:27', 46, 'SIMAX1800T', '3095E34469DD', '3095E34469DD', 'CNSAX18TZC110B1619000264', '', '1.0', 'V1.0-202105182000', 123314, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-23 15:54:37', '2021-05-25 03:37:40', 47, 'SIMAX1800T', '3095E344654C', '3095E344654C', 'CNSAX18TZC110B1619000097', '', '1.0', 'V1.0-202101131500', 115395, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-24 03:33:01', '2021-05-25 05:48:49', 48, 'SIMAX1800T', '3095E3446633', '3095E3446633', 'CNSAX18TZC110B1619000130', '', '1.0', 'V1.0-202101131500', 17701, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-24 08:06:42', '2021-05-25 04:28:50', 49, 'SIMAX1800T', '3095E3446863', '3095E3446863', 'CNSAX18TZC110B1619000210', '', '1.0', 'V1.0-202101131500', 7858, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-24 09:06:09', '2021-05-25 05:15:00', 50, 'SIMAX1800T', '7C74B4B786A8', '7C74B4B786A8', '12345678966666', '', '1.0', 'V1.0-202101131500', 79828, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-24 10:34:20', '2021-05-25 05:39:49', 51, 'SIMAX1800T', 'E4671E2DDFB1', 'E4671E2DDFB1', '', '', '1.0', 'V1.0-202012081007', 41236, 0, 0, NULL, NULL);
INSERT INTO `device_instances` VALUES ('2021-05-25 04:34:32', '2021-05-25 04:34:32', 52, 'SIMAX1800T', '3095E3446393', '3095E3446393', 'CNSAX18TZC110B1619000034', '', '1.0', 'V1.0-202101131500', 7504, 0, 0, NULL, NULL);

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
  CONSTRAINT `device_models_ibfk_2` FOREIGN KEY (`created_by_fk`) REFERENCES `ab_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `device_models_ibfk_3` FOREIGN KEY (`changed_by_fk`) REFERENCES `ab_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of device_models
-- ----------------------------
INSERT INTO `device_models` VALUES ('2021-04-15 17:28:57', '2021-04-25 17:49:57', 1, 'SIMAX18T', 'https', 7200, 7200, 0, 0, NULL, '', '2021-04-15 17:28:37', 0, '', 1, 1);
INSERT INTO `device_models` VALUES ('2021-04-25 14:54:09', '2021-05-16 14:50:07', 2, 'SIMAX1800T', 'https', 7200, 1, 1, 0, 10000, '1', '0105f', 0, 'test 1', 1, 1);

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
  CONSTRAINT `device_states_ibfk_2` FOREIGN KEY (`created_by_fk`) REFERENCES `ab_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `device_states_ibfk_3` FOREIGN KEY (`changed_by_fk`) REFERENCES `ab_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1404 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of device_states
-- ----------------------------
INSERT INTO `device_states` VALUES ('2021-04-24 11:13:12', '2021-04-24 11:13:12', 1, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-24 11:15:34', '2021-04-24 11:15:34', 2, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-24 11:16:32', '2021-04-24 11:16:32', 3, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-24 11:24:19', '2021-04-24 11:24:19', 4, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-24 11:31:19', '2021-04-24 11:31:19', 5, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-24 11:31:36', '2021-04-24 11:31:36', 6, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-24 11:31:41', '2021-04-24 11:31:41', 7, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 05:23:04', '2021-04-25 05:23:04', 8, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 07:04:04', '2021-04-25 07:04:04', 9, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 07:04:24', '2021-04-25 07:04:24', 10, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 07:04:44', '2021-04-25 07:04:44', 11, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 07:05:04', '2021-04-25 07:05:04', 12, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 07:05:24', '2021-04-25 07:05:24', 13, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 07:05:44', '2021-04-25 07:05:44', 14, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 07:06:04', '2021-04-25 07:06:04', 15, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 07:06:24', '2021-04-25 07:06:24', 16, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 07:06:44', '2021-04-25 07:06:44', 17, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 07:07:04', '2021-04-25 07:07:04', 18, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 07:07:24', '2021-04-25 07:07:24', 19, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 07:07:44', '2021-04-25 07:07:44', 20, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 07:08:04', '2021-04-25 07:08:04', 21, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 07:08:24', '2021-04-25 07:08:24', 22, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 07:08:44', '2021-04-25 07:08:44', 23, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 07:09:04', '2021-04-25 07:09:04', 24, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 07:09:24', '2021-04-25 07:09:24', 25, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 07:09:45', '2021-04-25 07:09:45', 26, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 07:10:05', '2021-04-25 07:10:05', 27, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 07:10:25', '2021-04-25 07:10:25', 28, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 07:10:45', '2021-04-25 07:10:45', 29, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 07:11:05', '2021-04-25 07:11:05', 30, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 07:11:25', '2021-04-25 07:11:25', 31, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 07:11:45', '2021-04-25 07:11:45', 32, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 07:12:21', '2021-04-25 07:12:21', 33, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 08:45:04', '2021-04-25 08:45:04', 34, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 09:49:23', '2021-04-25 09:49:23', 35, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 09:51:11', '2021-04-25 09:51:11', 36, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 09:51:42', '2021-04-25 09:51:42', 37, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 09:58:55', '2021-04-25 09:58:55', 38, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 10:02:12', '2021-04-25 10:02:12', 39, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 10:08:00', '2021-04-25 10:08:00', 40, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 10:12:49', '2021-04-25 10:12:49', 41, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 10:15:23', '2021-04-25 10:15:23', 42, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 10:23:42', '2021-04-25 10:23:42', 43, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 10:25:45', '2021-04-25 10:25:45', 44, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 10:30:39', '2021-04-25 10:30:39', 45, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 12:12:34', '2021-04-25 12:12:34', 46, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 12:15:42', '2021-04-25 12:15:42', 47, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 12:15:58', '2021-04-25 12:15:58', 48, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 12:18:02', '2021-04-25 12:18:02', 49, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 12:23:40', '2021-04-25 12:23:40', 50, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 12:26:01', '2021-04-25 12:26:01', 51, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 12:29:25', '2021-04-25 12:29:25', 52, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 12:31:24', '2021-04-25 12:31:24', 53, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 12:32:25', '2021-04-25 12:32:25', 54, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 13:48:40', '2021-04-25 13:48:40', 55, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 13:55:43', '2021-04-25 13:55:43', 56, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 14:01:26', '2021-04-25 14:01:26', 57, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 14:03:23', '2021-04-25 14:03:23', 58, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 14:11:56', '2021-04-25 14:11:56', 59, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-25 14:17:36', '2021-04-25 14:17:36', 60, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-26 01:19:59', '2021-04-26 01:19:59', 61, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-26 03:36:22', '2021-04-26 03:36:22', 62, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-26 03:47:40', '2021-04-26 03:47:40', 63, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-26 03:48:33', '2021-04-26 03:48:33', 64, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-26 05:38:42', '2021-04-26 05:38:42', 65, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-26 06:16:04', '2021-04-26 06:16:04', 66, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 01:46:01', '2021-04-27 01:46:01', 67, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 01:47:02', '2021-04-27 01:47:02', 68, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 01:52:54', '2021-04-27 01:52:54', 69, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 02:01:38', '2021-04-27 02:01:38', 70, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 02:02:54', '2021-04-27 02:02:54', 71, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 02:06:51', '2021-04-27 02:06:51', 72, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 02:32:18', '2021-04-27 02:32:18', 73, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 02:32:43', '2021-04-27 02:32:43', 74, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 02:33:14', '2021-04-27 02:33:14', 75, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 02:35:08', '2021-04-27 02:35:08', 76, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 02:36:35', '2021-04-27 02:36:35', 77, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 02:37:08', '2021-04-27 02:37:08', 78, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 02:51:52', '2021-04-27 02:51:52', 79, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 02:52:24', '2021-04-27 02:52:24', 80, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 02:53:08', '2021-04-27 02:53:08', 81, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 02:54:40', '2021-04-27 02:54:40', 82, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 02:55:04', '2021-04-27 02:55:04', 83, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 02:56:22', '2021-04-27 02:56:22', 84, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 02:57:27', '2021-04-27 02:57:27', 85, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 02:57:35', '2021-04-27 02:57:35', 86, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 05:36:57', '2021-04-27 05:36:57', 87, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 05:56:20', '2021-04-27 05:56:20', 88, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 06:03:17', '2021-04-27 06:03:17', 89, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 06:04:20', '2021-04-27 06:04:20', 90, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 06:04:47', '2021-04-27 06:04:47', 91, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 06:06:14', '2021-04-27 06:06:14', 92, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 07:51:35', '2021-04-27 07:51:35', 93, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 07:52:38', '2021-04-27 07:52:38', 94, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 07:57:01', '2021-04-27 07:57:01', 95, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 07:59:48', '2021-04-27 07:59:48', 96, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 08:01:20', '2021-04-27 08:01:20', 97, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 08:11:33', '2021-04-27 08:11:33', 98, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 08:15:43', '2021-04-27 08:15:43', 99, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 08:15:47', '2021-04-27 08:15:47', 100, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 08:23:50', '2021-04-27 08:23:50', 101, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 08:24:35', '2021-04-27 08:24:35', 102, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 08:24:55', '2021-04-27 08:24:55', 103, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 08:26:17', '2021-04-27 08:26:17', 104, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 08:27:44', '2021-04-27 08:27:44', 105, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 08:28:28', '2021-04-27 08:28:28', 106, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 08:41:07', '2021-04-27 08:41:07', 107, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 09:16:49', '2021-04-27 09:16:49', 108, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 09:32:48', '2021-04-27 09:32:48', 109, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 09:42:29', '2021-04-27 09:42:29', 110, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 09:42:44', '2021-04-27 09:42:44', 111, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 09:42:59', '2021-04-27 09:42:59', 112, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 09:43:07', '2021-04-27 09:43:07', 113, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 09:43:11', '2021-04-27 09:43:11', 114, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 12:30:10', '2021-04-27 12:30:10', 115, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 12:44:08', '2021-04-27 12:44:08', 116, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-27 13:16:04', '2021-04-27 13:16:04', 117, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-28 01:30:38', '2021-04-28 01:30:38', 118, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-28 01:36:25', '2021-04-28 01:36:25', 119, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-28 01:55:07', '2021-04-28 01:55:07', 120, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-28 02:01:30', '2021-04-28 02:01:30', 121, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-28 02:06:01', '2021-04-28 02:06:01', 122, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-28 02:07:44', '2021-04-28 02:07:44', 123, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-28 02:11:22', '2021-04-28 02:11:22', 124, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-04-28 02:14:43', '2021-04-28 02:14:43', 125, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-07 09:39:06', '2021-05-07 09:39:06', 126, 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-07 09:40:00', '2021-05-07 09:40:00', 127, 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-07 09:40:24', '2021-05-07 09:40:24', 128, 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-07 09:41:01', '2021-05-07 09:41:01', 129, 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-07 09:53:04', '2021-05-07 09:53:04', 130, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-07 09:53:28', '2021-05-07 09:53:28', 131, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-07 09:54:16', '2021-05-07 09:54:16', 132, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-07 12:24:40', '2021-05-07 12:24:40', 133, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-07 12:25:14', '2021-05-07 12:25:14', 134, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-07 18:42:03', '2021-05-07 18:42:03', 135, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-07 18:42:13', '2021-05-07 18:42:13', 136, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-07 19:30:06', '2021-05-07 19:30:06', 137, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-07 19:57:08', '2021-05-07 19:57:08', 138, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-08 02:27:51', '2021-05-08 02:27:51', 139, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-08 07:25:21', '2021-05-08 07:25:21', 140, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-08 07:54:31', '2021-05-08 07:54:31', 141, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-08 07:54:48', '2021-05-08 07:54:48', 142, 1, 30, 50, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-08 08:04:08', '2021-05-08 08:04:08', 143, 4, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-08 08:06:09', '2021-05-08 08:06:09', 144, 4, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-08 08:35:52', '2021-05-08 08:35:52', 145, 4, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-08 08:43:03', '2021-05-08 08:43:03', 146, 4, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-08 08:49:41', '2021-05-08 08:49:41', 147, 4, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-08 14:15:01', '2021-05-08 14:15:01', 148, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 01:39:58', '2021-05-10 01:39:58', 149, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 05:56:25', '2021-05-10 05:56:25', 150, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 05:58:17', '2021-05-10 05:58:17', 151, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 05:59:21', '2021-05-10 05:59:21', 152, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 06:03:54', '2021-05-10 06:03:54', 153, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 06:07:26', '2021-05-10 06:07:26', 154, 6, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 06:07:39', '2021-05-10 06:07:39', 155, 4, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 06:12:00', '2021-05-10 06:12:00', 156, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 06:12:27', '2021-05-10 06:12:27', 157, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 06:14:50', '2021-05-10 06:14:50', 158, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 06:17:30', '2021-05-10 06:17:30', 159, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 06:19:47', '2021-05-10 06:19:47', 160, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 06:19:57', '2021-05-10 06:19:57', 161, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 06:24:55', '2021-05-10 06:24:55', 162, 6, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 06:24:57', '2021-05-10 06:24:57', 163, 6, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 06:25:30', '2021-05-10 06:25:30', 164, 7, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 06:29:26', '2021-05-10 06:29:26', 165, 7, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 06:29:33', '2021-05-10 06:29:33', 166, 7, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 06:34:25', '2021-05-10 06:34:25', 167, 7, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 06:35:10', '2021-05-10 06:35:10', 168, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 06:36:55', '2021-05-10 06:36:55', 169, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 07:06:03', '2021-05-10 07:06:03', 170, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 07:07:18', '2021-05-10 07:07:18', 171, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 07:13:48', '2021-05-10 07:13:48', 172, 7, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 07:13:53', '2021-05-10 07:13:53', 173, 7, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 07:20:42', '2021-05-10 07:20:42', 174, 7, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 07:21:00', '2021-05-10 07:21:00', 175, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 07:26:30', '2021-05-10 07:26:30', 176, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 07:27:54', '2021-05-10 07:27:54', 177, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 08:15:07', '2021-05-10 08:15:07', 178, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 08:15:33', '2021-05-10 08:15:33', 179, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 08:30:28', '2021-05-10 08:30:28', 180, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 08:38:54', '2021-05-10 08:38:54', 181, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 08:39:00', '2021-05-10 08:39:00', 182, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 08:42:30', '2021-05-10 08:42:30', 183, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 08:43:10', '2021-05-10 08:43:10', 184, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 08:48:59', '2021-05-10 08:48:59', 185, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 08:49:05', '2021-05-10 08:49:05', 186, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 08:50:26', '2021-05-10 08:50:26', 187, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 08:56:20', '2021-05-10 08:56:20', 188, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 08:56:42', '2021-05-10 08:56:42', 189, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 09:16:18', '2021-05-10 09:16:18', 190, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 09:16:43', '2021-05-10 09:16:43', 191, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 09:16:57', '2021-05-10 09:16:57', 192, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 09:16:59', '2021-05-10 09:16:59', 193, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 12:35:35', '2021-05-10 12:35:35', 194, 7, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 12:40:26', '2021-05-10 12:40:26', 195, 7, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 12:47:19', '2021-05-10 12:47:19', 196, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 12:49:34', '2021-05-10 12:49:34', 197, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 13:10:31', '2021-05-10 13:10:31', 198, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 13:10:31', '2021-05-10 13:10:31', 199, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 13:10:41', '2021-05-10 13:10:41', 200, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 13:23:47', '2021-05-10 13:23:47', 201, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 13:48:13', '2021-05-10 13:48:13', 202, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 15:58:01', '2021-05-10 15:58:01', 203, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-10 18:08:00', '2021-05-10 18:08:00', 204, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 02:58:50', '2021-05-11 02:58:50', 205, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 03:04:12', '2021-05-11 03:04:12', 206, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 03:04:49', '2021-05-11 03:04:49', 207, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 03:06:39', '2021-05-11 03:06:39', 208, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 03:09:50', '2021-05-11 03:09:50', 209, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 03:15:37', '2021-05-11 03:15:37', 210, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 05:33:49', '2021-05-11 05:33:49', 211, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 06:13:51', '2021-05-11 06:13:51', 212, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 07:06:55', '2021-05-11 07:06:55', 213, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 07:11:20', '2021-05-11 07:11:20', 214, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 07:11:59', '2021-05-11 07:11:59', 215, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 07:12:19', '2021-05-11 07:12:19', 216, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 07:23:06', '2021-05-11 07:23:06', 217, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 07:48:47', '2021-05-11 07:48:47', 218, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 07:52:54', '2021-05-11 07:52:54', 219, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 08:33:13', '2021-05-11 08:33:13', 220, 7, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 08:49:14', '2021-05-11 08:49:14', 221, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 10:00:50', '2021-05-11 10:00:50', 222, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 10:17:37', '2021-05-11 10:17:37', 223, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 12:03:57', '2021-05-11 12:03:57', 224, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 12:06:38', '2021-05-11 12:06:38', 225, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 12:45:01', '2021-05-11 12:45:01', 226, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 14:20:22', '2021-05-11 14:20:22', 227, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 14:24:50', '2021-05-11 14:24:50', 228, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 14:56:13', '2021-05-11 14:56:13', 229, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 16:29:21', '2021-05-11 16:29:21', 230, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 16:54:38', '2021-05-11 16:54:38', 231, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 16:57:25', '2021-05-11 16:57:25', 232, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 18:56:31', '2021-05-11 18:56:31', 233, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 19:00:36', '2021-05-11 19:00:36', 234, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 19:11:05', '2021-05-11 19:11:05', 235, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 20:28:01', '2021-05-11 20:28:01', 236, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 20:28:12', '2021-05-11 20:28:12', 237, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 21:08:34', '2021-05-11 21:08:34', 238, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-11 23:10:38', '2021-05-11 23:10:38', 239, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 01:09:23', '2021-05-12 01:09:23', 240, 7, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 01:13:45', '2021-05-12 01:13:45', 241, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 01:38:41', '2021-05-12 01:38:41', 242, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 01:39:49', '2021-05-12 01:39:49', 243, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 01:43:43', '2021-05-12 01:43:43', 244, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 02:00:57', '2021-05-12 02:00:57', 245, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 02:04:03', '2021-05-12 02:04:03', 246, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 02:10:35', '2021-05-12 02:10:35', 247, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 02:13:59', '2021-05-12 02:13:59', 248, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 02:17:17', '2021-05-12 02:17:17', 249, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 02:17:56', '2021-05-12 02:17:56', 250, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 03:20:12', '2021-05-12 03:20:12', 251, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 03:41:51', '2021-05-12 03:41:51', 252, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 03:50:30', '2021-05-12 03:50:30', 253, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 06:21:22', '2021-05-12 06:21:22', 254, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 06:22:11', '2021-05-12 06:22:11', 255, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 06:44:45', '2021-05-12 06:44:45', 256, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 07:08:18', '2021-05-12 07:08:18', 257, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 07:09:18', '2021-05-12 07:09:18', 258, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 08:44:09', '2021-05-12 08:44:09', 259, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:15:00', '2021-05-12 09:15:00', 260, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:15:03', '2021-05-12 09:15:03', 261, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:15:04', '2021-05-12 09:15:04', 262, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:15:05', '2021-05-12 09:15:05', 263, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:15:10', '2021-05-12 09:15:10', 264, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:15:11', '2021-05-12 09:15:11', 265, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:15:12', '2021-05-12 09:15:12', 266, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:15:14', '2021-05-12 09:15:14', 267, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:15:17', '2021-05-12 09:15:17', 268, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:15:18', '2021-05-12 09:15:18', 269, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:18:26', '2021-05-12 09:18:26', 270, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:19:04', '2021-05-12 09:19:04', 271, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:20:10', '2021-05-12 09:20:10', 272, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:33:30', '2021-05-12 09:33:30', 273, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:33:32', '2021-05-12 09:33:32', 274, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:33:33', '2021-05-12 09:33:33', 275, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:33:34', '2021-05-12 09:33:34', 276, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:33:34', '2021-05-12 09:33:34', 277, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:33:35', '2021-05-12 09:33:35', 278, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:33:36', '2021-05-12 09:33:36', 279, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:33:43', '2021-05-12 09:33:43', 280, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:33:44', '2021-05-12 09:33:44', 281, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:33:45', '2021-05-12 09:33:45', 282, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:33:46', '2021-05-12 09:33:46', 283, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:33:47', '2021-05-12 09:33:47', 284, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:33:48', '2021-05-12 09:33:48', 285, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:33:49', '2021-05-12 09:33:49', 286, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:33:50', '2021-05-12 09:33:50', 287, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:33:51', '2021-05-12 09:33:51', 288, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 09:33:52', '2021-05-12 09:33:52', 289, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 10:09:19', '2021-05-12 10:09:19', 290, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 10:14:22', '2021-05-12 10:14:22', 291, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 10:19:45', '2021-05-12 10:19:45', 292, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 10:19:58', '2021-05-12 10:19:58', 293, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 11:10:31', '2021-05-12 11:10:31', 294, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 11:11:50', '2021-05-12 11:11:50', 295, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 11:12:50', '2021-05-12 11:12:50', 296, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 11:37:14', '2021-05-12 11:37:14', 297, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 11:40:03', '2021-05-12 11:40:03', 298, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 11:55:25', '2021-05-12 11:55:25', 299, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 11:58:42', '2021-05-12 11:58:42', 300, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 12:03:21', '2021-05-12 12:03:21', 301, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 12:10:03', '2021-05-12 12:10:03', 302, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 12:14:52', '2021-05-12 12:14:52', 303, 7, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 12:17:08', '2021-05-12 12:17:08', 304, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 12:18:35', '2021-05-12 12:18:35', 305, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 12:34:07', '2021-05-12 12:34:07', 306, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 12:40:38', '2021-05-12 12:40:38', 307, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 13:02:11', '2021-05-12 13:02:11', 308, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 13:13:13', '2021-05-12 13:13:13', 309, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 13:21:04', '2021-05-12 13:21:04', 310, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 13:24:33', '2021-05-12 13:24:33', 311, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 13:27:41', '2021-05-12 13:27:41', 312, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 13:28:08', '2021-05-12 13:28:08', 313, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 13:28:18', '2021-05-12 13:28:18', 314, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 13:28:20', '2021-05-12 13:28:20', 315, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 13:28:21', '2021-05-12 13:28:21', 316, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 13:28:22', '2021-05-12 13:28:22', 317, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 13:28:23', '2021-05-12 13:28:23', 318, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 13:33:31', '2021-05-12 13:33:31', 319, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 13:46:40', '2021-05-12 13:46:40', 320, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 13:50:16', '2021-05-12 13:50:16', 321, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 16:03:07', '2021-05-12 16:03:07', 322, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 16:24:46', '2021-05-12 16:24:46', 323, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 18:18:05', '2021-05-12 18:18:05', 324, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 18:20:38', '2021-05-12 18:20:38', 325, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 18:25:35', '2021-05-12 18:25:35', 326, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 18:43:42', '2021-05-12 18:43:42', 327, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 18:52:10', '2021-05-12 18:52:10', 328, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 18:54:46', '2021-05-12 18:54:46', 329, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 18:56:47', '2021-05-12 18:56:47', 330, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 19:05:45', '2021-05-12 19:05:45', 331, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 19:13:20', '2021-05-12 19:13:20', 332, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 19:18:21', '2021-05-12 19:18:21', 333, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 19:24:48', '2021-05-12 19:24:48', 334, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 19:31:24', '2021-05-12 19:31:24', 335, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 19:41:27', '2021-05-12 19:41:27', 336, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 19:42:51', '2021-05-12 19:42:51', 337, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 19:48:59', '2021-05-12 19:48:59', 338, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 20:02:24', '2021-05-12 20:02:24', 339, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 20:18:05', '2021-05-12 20:18:05', 340, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 20:31:01', '2021-05-12 20:31:01', 341, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 20:35:39', '2021-05-12 20:35:39', 342, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 20:41:10', '2021-05-12 20:41:10', 343, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 20:45:42', '2021-05-12 20:45:42', 344, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 20:59:05', '2021-05-12 20:59:05', 345, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 21:05:36', '2021-05-12 21:05:36', 346, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 21:08:06', '2021-05-12 21:08:06', 347, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 21:10:47', '2021-05-12 21:10:47', 348, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 21:25:09', '2021-05-12 21:25:09', 349, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 21:29:09', '2021-05-12 21:29:09', 350, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 21:40:23', '2021-05-12 21:40:23', 351, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 21:51:15', '2021-05-12 21:51:15', 352, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 22:01:28', '2021-05-12 22:01:28', 353, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 22:06:17', '2021-05-12 22:06:17', 354, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 22:22:33', '2021-05-12 22:22:33', 355, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 22:23:50', '2021-05-12 22:23:50', 356, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 22:32:21', '2021-05-12 22:32:21', 357, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 22:40:37', '2021-05-12 22:40:37', 358, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 22:43:53', '2021-05-12 22:43:53', 359, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 23:02:56', '2021-05-12 23:02:56', 360, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 23:03:43', '2021-05-12 23:03:43', 361, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 23:04:26', '2021-05-12 23:04:26', 362, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 23:26:48', '2021-05-12 23:26:48', 363, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 23:34:19', '2021-05-12 23:34:19', 364, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 23:34:31', '2021-05-12 23:34:31', 365, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 23:42:32', '2021-05-12 23:42:32', 366, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 23:49:25', '2021-05-12 23:49:25', 367, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 23:54:26', '2021-05-12 23:54:26', 368, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 23:57:04', '2021-05-12 23:57:04', 369, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-12 23:58:57', '2021-05-12 23:58:57', 370, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 00:03:28', '2021-05-13 00:03:28', 371, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 00:05:06', '2021-05-13 00:05:06', 372, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 00:26:39', '2021-05-13 00:26:39', 373, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 00:30:39', '2021-05-13 00:30:39', 374, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 00:33:35', '2021-05-13 00:33:35', 375, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 00:41:41', '2021-05-13 00:41:41', 376, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 00:53:10', '2021-05-13 00:53:10', 377, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 00:53:13', '2021-05-13 00:53:13', 378, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 00:58:41', '2021-05-13 00:58:41', 379, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 01:00:14', '2021-05-13 01:00:14', 380, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 01:03:15', '2021-05-13 01:03:15', 381, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 01:06:13', '2021-05-13 01:06:13', 382, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 01:24:47', '2021-05-13 01:24:47', 383, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 01:24:48', '2021-05-13 01:24:48', 384, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 01:27:48', '2021-05-13 01:27:48', 385, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 01:39:38', '2021-05-13 01:39:38', 386, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 01:39:40', '2021-05-13 01:39:40', 387, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 01:39:42', '2021-05-13 01:39:42', 388, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 01:51:54', '2021-05-13 01:51:54', 389, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 01:55:47', '2021-05-13 01:55:47', 390, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 02:15:03', '2021-05-13 02:15:03', 391, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 02:15:15', '2021-05-13 02:15:15', 392, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 02:21:01', '2021-05-13 02:21:01', 393, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 02:26:34', '2021-05-13 02:26:34', 394, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 02:36:21', '2021-05-13 02:36:21', 395, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 02:41:56', '2021-05-13 02:41:56', 396, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 02:42:26', '2021-05-13 02:42:26', 397, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 02:47:07', '2021-05-13 02:47:07', 398, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 02:59:06', '2021-05-13 02:59:06', 399, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 02:59:10', '2021-05-13 02:59:10', 400, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 03:02:53', '2021-05-13 03:02:53', 401, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 03:07:33', '2021-05-13 03:07:33', 402, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 03:10:28', '2021-05-13 03:10:28', 403, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 03:12:58', '2021-05-13 03:12:58', 404, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 03:14:51', '2021-05-13 03:14:51', 405, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 03:16:47', '2021-05-13 03:16:47', 406, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 03:20:34', '2021-05-13 03:20:34', 407, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 03:23:25', '2021-05-13 03:23:25', 408, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 03:23:33', '2021-05-13 03:23:33', 409, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 03:26:04', '2021-05-13 03:26:04', 410, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 03:30:35', '2021-05-13 03:30:35', 411, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 03:43:17', '2021-05-13 03:43:17', 412, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 03:43:19', '2021-05-13 03:43:19', 413, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 03:43:21', '2021-05-13 03:43:21', 414, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 03:43:22', '2021-05-13 03:43:22', 415, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 03:43:40', '2021-05-13 03:43:40', 416, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 03:43:59', '2021-05-13 03:43:59', 417, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 03:55:29', '2021-05-13 03:55:29', 418, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 03:55:34', '2021-05-13 03:55:34', 419, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 04:01:27', '2021-05-13 04:01:27', 420, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 04:10:29', '2021-05-13 04:10:29', 421, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 04:16:11', '2021-05-13 04:16:11', 422, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 04:19:00', '2021-05-13 04:19:00', 423, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 04:27:47', '2021-05-13 04:27:47', 424, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 04:32:32', '2021-05-13 04:32:32', 425, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 04:34:32', '2021-05-13 04:34:32', 426, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 04:42:34', '2021-05-13 04:42:34', 427, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 04:58:36', '2021-05-13 04:58:36', 428, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 05:15:39', '2021-05-13 05:15:39', 429, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 05:29:23', '2021-05-13 05:29:23', 430, 12, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 05:35:03', '2021-05-13 05:35:03', 431, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 05:38:42', '2021-05-13 05:38:42', 432, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 06:15:18', '2021-05-13 06:15:18', 433, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 06:17:01', '2021-05-13 06:17:01', 434, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 06:17:48', '2021-05-13 06:17:48', 435, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 06:29:37', '2021-05-13 06:29:37', 436, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 06:35:57', '2021-05-13 06:35:57', 437, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 06:43:22', '2021-05-13 06:43:22', 438, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 07:45:26', '2021-05-13 07:45:26', 439, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 08:35:44', '2021-05-13 08:35:44', 440, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 08:44:25', '2021-05-13 08:44:25', 441, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 08:46:19', '2021-05-13 08:46:19', 442, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 08:46:30', '2021-05-13 08:46:30', 443, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 08:47:55', '2021-05-13 08:47:55', 444, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 08:54:41', '2021-05-13 08:54:41', 445, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 09:40:47', '2021-05-13 09:40:47', 446, 13, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 10:36:57', '2021-05-13 10:36:57', 447, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 11:02:29', '2021-05-13 11:02:29', 448, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 11:14:34', '2021-05-13 11:14:34', 449, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 11:50:20', '2021-05-13 11:50:20', 450, 13, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 11:54:13', '2021-05-13 11:54:13', 451, 12, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 13:26:24', '2021-05-13 13:26:24', 452, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 13:30:20', '2021-05-13 13:30:20', 453, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 13:55:55', '2021-05-13 13:55:55', 454, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 15:37:15', '2021-05-13 15:37:15', 455, 14, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 15:43:39', '2021-05-13 15:43:39', 456, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 15:44:14', '2021-05-13 15:44:14', 457, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 16:18:57', '2021-05-13 16:18:57', 458, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 17:29:31', '2021-05-13 17:29:31', 459, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 17:32:01', '2021-05-13 17:32:01', 460, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 17:48:46', '2021-05-13 17:48:46', 461, 14, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 18:12:30', '2021-05-13 18:12:30', 462, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 18:23:55', '2021-05-13 18:23:55', 463, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 18:47:01', '2021-05-13 18:47:01', 464, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 18:49:36', '2021-05-13 18:49:36', 465, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 19:20:09', '2021-05-13 19:20:09', 466, 14, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 19:22:37', '2021-05-13 19:22:37', 467, 14, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 19:30:11', '2021-05-13 19:30:11', 468, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 19:32:45', '2021-05-13 19:32:45', 469, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 19:52:21', '2021-05-13 19:52:21', 470, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 21:00:34', '2021-05-13 21:00:34', 471, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 21:29:34', '2021-05-13 21:29:34', 472, 14, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 21:49:02', '2021-05-13 21:49:02', 473, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 22:12:44', '2021-05-13 22:12:44', 474, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 23:11:34', '2021-05-13 23:11:34', 475, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-13 23:36:31', '2021-05-13 23:36:31', 476, 14, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 00:05:22', '2021-05-14 00:05:22', 477, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 00:33:04', '2021-05-14 00:33:04', 478, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 01:09:53', '2021-05-14 01:09:53', 479, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 01:22:32', '2021-05-14 01:22:32', 480, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 01:43:30', '2021-05-14 01:43:30', 481, 14, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 01:51:35', '2021-05-14 01:51:35', 482, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 02:21:42', '2021-05-14 02:21:42', 483, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 03:30:02', '2021-05-14 03:30:02', 484, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 04:51:31', '2021-05-14 04:51:31', 485, 15, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 04:57:07', '2021-05-14 04:57:07', 486, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 05:06:04', '2021-05-14 05:06:04', 487, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 05:14:23', '2021-05-14 05:14:23', 488, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 05:34:05', '2021-05-14 05:34:05', 489, 13, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 05:48:55', '2021-05-14 05:48:55', 490, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 07:03:36', '2021-05-14 07:03:36', 491, 15, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 07:04:25', '2021-05-14 07:04:25', 492, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 07:13:32', '2021-05-14 07:13:32', 493, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 07:58:14', '2021-05-14 07:58:14', 494, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 08:57:20', '2021-05-14 08:57:20', 495, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 09:19:50', '2021-05-14 09:19:50', 496, 17, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 09:30:02', '2021-05-14 09:30:02', 497, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 10:05:30', '2021-05-14 10:05:30', 498, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 10:08:39', '2021-05-14 10:08:39', 499, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 11:27:40', '2021-05-14 11:27:40', 500, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 11:31:14', '2021-05-14 11:31:14', 501, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 11:33:46', '2021-05-14 11:33:46', 502, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 12:04:11', '2021-05-14 12:04:11', 503, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 12:21:17', '2021-05-14 12:21:17', 504, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 12:47:51', '2021-05-14 12:47:51', 505, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 12:58:52', '2021-05-14 12:58:52', 506, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 13:26:33', '2021-05-14 13:26:33', 507, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 13:44:38', '2021-05-14 13:44:38', 508, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 13:52:28', '2021-05-14 13:52:28', 509, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 13:58:30', '2021-05-14 13:58:30', 510, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 14:01:11', '2021-05-14 14:01:11', 511, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 14:08:13', '2021-05-14 14:08:13', 512, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 14:37:19', '2021-05-14 14:37:19', 513, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 14:40:07', '2021-05-14 14:40:07', 514, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 15:55:30', '2021-05-14 15:55:30', 515, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 16:09:03', '2021-05-14 16:09:03', 516, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 16:56:06', '2021-05-14 16:56:06', 517, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 18:06:21', '2021-05-14 18:06:21', 518, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 18:16:54', '2021-05-14 18:16:54', 519, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 19:12:06', '2021-05-14 19:12:06', 520, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 20:17:11', '2021-05-14 20:17:11', 521, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 20:24:45', '2021-05-14 20:24:45', 522, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 21:28:05', '2021-05-14 21:28:05', 523, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 22:28:04', '2021-05-14 22:28:04', 524, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 22:32:36', '2021-05-14 22:32:36', 525, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-14 23:44:05', '2021-05-14 23:44:05', 526, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 00:38:55', '2021-05-15 00:38:55', 527, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 00:40:27', '2021-05-15 00:40:27', 528, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 02:00:05', '2021-05-15 02:00:05', 529, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 02:48:17', '2021-05-15 02:48:17', 530, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 02:49:46', '2021-05-15 02:49:46', 531, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 04:16:05', '2021-05-15 04:16:05', 532, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 04:56:08', '2021-05-15 04:56:08', 533, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 05:00:38', '2021-05-15 05:00:38', 534, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 06:32:05', '2021-05-15 06:32:05', 535, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 07:03:59', '2021-05-15 07:03:59', 536, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 07:11:31', '2021-05-15 07:11:31', 537, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 08:48:05', '2021-05-15 08:48:05', 538, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 09:11:50', '2021-05-15 09:11:50', 539, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 09:22:20', '2021-05-15 09:22:20', 540, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 10:22:00', '2021-05-15 10:22:00', 541, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 10:35:27', '2021-05-15 10:35:27', 542, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 11:04:05', '2021-05-15 11:04:05', 543, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 11:17:24', '2021-05-15 11:17:24', 544, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 11:19:40', '2021-05-15 11:19:40', 545, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 13:20:06', '2021-05-15 13:20:06', 546, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 13:27:31', '2021-05-15 13:27:31', 547, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 13:44:20', '2021-05-15 13:44:20', 548, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 15:35:22', '2021-05-15 15:35:22', 549, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 15:36:05', '2021-05-15 15:36:05', 550, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 16:01:42', '2021-05-15 16:01:42', 551, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 17:43:14', '2021-05-15 17:43:14', 552, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 17:52:04', '2021-05-15 17:52:04', 553, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 18:10:03', '2021-05-15 18:10:03', 554, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 19:51:04', '2021-05-15 19:51:04', 555, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 20:08:03', '2021-05-15 20:08:03', 556, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 21:58:55', '2021-05-15 21:58:55', 557, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-15 22:24:02', '2021-05-15 22:24:02', 558, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 00:06:45', '2021-05-16 00:06:45', 559, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 00:40:04', '2021-05-16 00:40:04', 560, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 01:57:27', '2021-05-16 01:57:27', 561, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 01:57:56', '2021-05-16 01:57:56', 562, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 01:59:26', '2021-05-16 01:59:26', 563, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 02:01:09', '2021-05-16 02:01:09', 564, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 02:02:38', '2021-05-16 02:02:38', 565, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 02:03:12', '2021-05-16 02:03:12', 566, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 02:07:33', '2021-05-16 02:07:33', 567, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 02:07:33', '2021-05-16 02:07:33', 568, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 02:10:52', '2021-05-16 02:10:52', 569, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 02:11:24', '2021-05-16 02:11:24', 570, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 02:11:30', '2021-05-16 02:11:30', 571, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 02:14:36', '2021-05-16 02:14:36', 572, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 02:16:15', '2021-05-16 02:16:15', 573, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 02:16:39', '2021-05-16 02:16:39', 574, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 02:17:04', '2021-05-16 02:17:04', 575, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 02:17:27', '2021-05-16 02:17:27', 576, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 02:30:36', '2021-05-16 02:30:36', 577, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 02:56:04', '2021-05-16 02:56:04', 578, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 02:58:22', '2021-05-16 02:58:22', 579, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 03:14:37', '2021-05-16 03:14:37', 580, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 03:30:51', '2021-05-16 03:30:51', 581, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 03:45:17', '2021-05-16 03:45:17', 582, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 04:14:03', '2021-05-16 04:14:03', 583, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 04:22:29', '2021-05-16 04:22:29', 584, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 04:38:06', '2021-05-16 04:38:06', 585, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 04:58:09', '2021-05-16 04:58:09', 586, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 05:12:04', '2021-05-16 05:12:04', 587, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 05:20:43', '2021-05-16 05:20:43', 588, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 05:23:43', '2021-05-16 05:23:43', 589, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 05:45:17', '2021-05-16 05:45:17', 590, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 06:02:19', '2021-05-16 06:02:19', 591, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 06:15:51', '2021-05-16 06:15:51', 592, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 06:30:20', '2021-05-16 06:30:20', 593, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 07:28:04', '2021-05-16 07:28:04', 594, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 08:38:11', '2021-05-16 08:38:11', 595, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 09:44:04', '2021-05-16 09:44:04', 596, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 10:46:02', '2021-05-16 10:46:02', 597, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 12:00:04', '2021-05-16 12:00:04', 598, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 12:53:53', '2021-05-16 12:53:53', 599, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 14:16:03', '2021-05-16 14:16:03', 600, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 15:01:43', '2021-05-16 15:01:43', 601, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 16:32:05', '2021-05-16 16:32:05', 602, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 17:09:34', '2021-05-16 17:09:34', 603, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 18:48:06', '2021-05-16 18:48:06', 604, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 19:17:26', '2021-05-16 19:17:26', 605, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 21:04:05', '2021-05-16 21:04:05', 606, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 21:25:16', '2021-05-16 21:25:16', 607, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 23:20:05', '2021-05-16 23:20:05', 608, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-16 23:33:07', '2021-05-16 23:33:07', 609, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 01:36:06', '2021-05-17 01:36:06', 610, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 01:44:16', '2021-05-17 01:44:16', 611, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 01:55:59', '2021-05-17 01:55:59', 612, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 03:52:06', '2021-05-17 03:52:06', 613, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 04:17:49', '2021-05-17 04:17:49', 614, 13, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 04:19:31', '2021-05-17 04:19:31', 615, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 05:20:04', '2021-05-17 05:20:04', 616, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 06:08:05', '2021-05-17 06:08:05', 617, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 06:23:47', '2021-05-17 06:23:47', 618, 13, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 06:24:00', '2021-05-17 06:24:00', 619, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 06:28:01', '2021-05-17 06:28:01', 620, 19, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 06:30:29', '2021-05-17 06:30:29', 621, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 08:47:53', '2021-05-17 08:47:53', 622, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 08:48:29', '2021-05-17 08:48:29', 623, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 09:23:27', '2021-05-17 09:23:27', 624, 20, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 09:45:10', '2021-05-17 09:45:10', 625, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 10:26:08', '2021-05-17 10:26:08', 626, 19, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 10:53:00', '2021-05-17 10:53:00', 627, 13, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 10:56:55', '2021-05-17 10:56:55', 628, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 11:06:01', '2021-05-17 11:06:01', 629, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 11:10:01', '2021-05-17 11:10:01', 630, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 11:56:15', '2021-05-17 11:56:15', 631, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 12:06:29', '2021-05-17 12:06:29', 632, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 13:01:33', '2021-05-17 13:01:33', 633, 13, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 13:02:24', '2021-05-17 13:02:24', 634, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 13:33:02', '2021-05-17 13:33:02', 635, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 13:41:46', '2021-05-17 13:41:46', 636, 21, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 13:57:47', '2021-05-17 13:57:47', 637, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 14:01:06', '2021-05-17 14:01:06', 638, 22, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 14:19:39', '2021-05-17 14:19:39', 639, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 14:23:51', '2021-05-17 14:23:51', 640, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 14:34:37', '2021-05-17 14:34:37', 641, 19, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 15:07:23', '2021-05-17 15:07:23', 642, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 16:01:34', '2021-05-17 16:01:34', 643, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 16:04:35', '2021-05-17 16:04:35', 644, 22, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 16:08:19', '2021-05-17 16:08:19', 645, 21, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 16:18:25', '2021-05-17 16:18:25', 646, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 16:36:31', '2021-05-17 16:36:31', 647, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 16:38:35', '2021-05-17 16:38:35', 648, 19, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 16:46:41', '2021-05-17 16:46:41', 649, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 17:17:54', '2021-05-17 17:17:54', 650, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 17:39:25', '2021-05-17 17:39:25', 651, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 17:42:01', '2021-05-17 17:42:01', 652, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 18:06:25', '2021-05-17 18:06:25', 653, 19, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 18:07:03', '2021-05-17 18:07:03', 654, 22, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 18:09:00', '2021-05-17 18:09:00', 655, 19, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 18:18:49', '2021-05-17 18:18:49', 656, 21, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 18:30:58', '2021-05-17 18:30:58', 657, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 18:38:30', '2021-05-17 18:38:30', 658, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 18:41:14', '2021-05-17 18:41:14', 659, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 18:52:52', '2021-05-17 18:52:52', 660, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 18:58:29', '2021-05-17 18:58:29', 661, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 19:02:10', '2021-05-17 19:02:10', 662, 23, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 19:25:05', '2021-05-17 19:25:05', 663, 21, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 19:26:28', '2021-05-17 19:26:28', 664, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 19:28:08', '2021-05-17 19:28:08', 665, 24, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 19:29:07', '2021-05-17 19:29:07', 666, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 19:32:24', '2021-05-17 19:32:24', 667, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 19:35:12', '2021-05-17 19:35:12', 668, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 20:08:32', '2021-05-17 20:08:32', 669, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 20:11:59', '2021-05-17 20:11:59', 670, 22, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 20:23:00', '2021-05-17 20:23:00', 671, 19, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 20:24:02', '2021-05-17 20:24:02', 672, 22, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 20:26:48', '2021-05-17 20:26:48', 673, 22, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 20:53:24', '2021-05-17 20:53:24', 674, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 21:26:17', '2021-05-17 21:26:17', 675, 23, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 21:29:59', '2021-05-17 21:29:59', 676, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 21:35:17', '2021-05-17 21:35:17', 677, 24, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 21:46:40', '2021-05-17 21:46:40', 678, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 22:35:06', '2021-05-17 22:35:06', 679, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 22:37:00', '2021-05-17 22:37:00', 680, 19, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 22:42:51', '2021-05-17 22:42:51', 681, 22, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 23:05:35', '2021-05-17 23:05:35', 682, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 23:30:53', '2021-05-17 23:30:53', 683, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 23:42:26', '2021-05-17 23:42:26', 684, 24, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 23:50:23', '2021-05-17 23:50:23', 685, 23, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-17 23:58:09', '2021-05-17 23:58:09', 686, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 00:51:01', '2021-05-18 00:51:01', 687, 19, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 01:01:37', '2021-05-18 01:01:37', 688, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 01:17:51', '2021-05-18 01:17:51', 689, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 01:31:47', '2021-05-18 01:31:47', 690, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 02:09:38', '2021-05-18 02:09:38', 691, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 02:14:25', '2021-05-18 02:14:25', 692, 23, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 03:18:42', '2021-05-18 03:18:42', 693, 15, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 03:28:07', '2021-05-18 03:28:07', 694, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 03:30:01', '2021-05-18 03:30:01', 695, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 03:41:52', '2021-05-18 03:41:52', 696, 21, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 04:39:08', '2021-05-18 04:39:08', 697, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 05:03:47', '2021-05-18 05:03:47', 698, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 05:04:42', '2021-05-18 05:04:42', 699, 19, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 05:42:11', '2021-05-18 05:42:11', 700, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 05:44:18', '2021-05-18 05:44:18', 701, 13, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 05:44:52', '2021-05-18 05:44:52', 702, 21, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 05:54:39', '2021-05-18 05:54:39', 703, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 06:03:51', '2021-05-18 06:03:51', 704, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 06:43:06', '2021-05-18 06:43:06', 705, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 06:51:49', '2021-05-18 06:51:49', 706, 15, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 07:31:37', '2021-05-18 07:31:37', 707, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 07:54:22', '2021-05-18 07:54:22', 708, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 08:21:11', '2021-05-18 08:21:11', 709, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 08:40:34', '2021-05-18 08:40:34', 710, 21, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 09:11:11', '2021-05-18 09:11:11', 711, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 09:51:05', '2021-05-18 09:51:05', 712, 15, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 09:54:57', '2021-05-18 09:54:57', 713, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 10:06:33', '2021-05-18 10:06:33', 714, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 10:34:11', '2021-05-18 10:34:11', 715, 27, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 10:38:43', '2021-05-18 10:38:43', 716, 13, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 10:47:42', '2021-05-18 10:47:42', 717, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 11:08:46', '2021-05-18 11:08:46', 718, 21, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 11:57:17', '2021-05-18 11:57:17', 719, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 12:16:56', '2021-05-18 12:16:56', 720, 28, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 12:18:43', '2021-05-18 12:18:43', 721, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 12:18:48', '2021-05-18 12:18:48', 722, 15, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 13:14:13', '2021-05-18 13:14:13', 723, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 13:36:53', '2021-05-18 13:36:53', 724, 21, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 14:05:36', '2021-05-18 14:05:36', 725, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 14:30:54', '2021-05-18 14:30:54', 726, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 15:06:28', '2021-05-18 15:06:28', 727, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 15:40:43', '2021-05-18 15:40:43', 728, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 16:05:02', '2021-05-18 16:05:02', 729, 21, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 16:07:23', '2021-05-18 16:07:23', 730, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 16:43:05', '2021-05-18 16:43:05', 731, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 17:11:03', '2021-05-18 17:11:03', 732, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 17:13:44', '2021-05-18 17:13:44', 733, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 17:21:28', '2021-05-18 17:21:28', 734, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 17:24:11', '2021-05-18 17:24:11', 735, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 17:36:55', '2021-05-18 17:36:55', 736, 29, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 18:07:14', '2021-05-18 18:07:14', 737, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 18:33:09', '2021-05-18 18:33:09', 738, 21, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 18:55:16', '2021-05-18 18:55:16', 739, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 19:18:02', '2021-05-18 19:18:02', 740, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 19:42:22', '2021-05-18 19:42:22', 741, 29, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 19:45:06', '2021-05-18 19:45:06', 742, 29, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 19:46:43', '2021-05-18 19:46:43', 743, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 20:33:45', '2021-05-18 20:33:45', 744, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 21:01:16', '2021-05-18 21:01:16', 745, 21, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 21:07:27', '2021-05-18 21:07:27', 746, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 21:22:23', '2021-05-18 21:22:23', 747, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 21:47:03', '2021-05-18 21:47:03', 748, 29, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 22:09:15', '2021-05-18 22:09:15', 749, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 23:00:17', '2021-05-18 23:00:17', 750, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 23:19:35', '2021-05-18 23:19:35', 751, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 23:26:42', '2021-05-18 23:26:42', 752, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 23:29:25', '2021-05-18 23:29:25', 753, 21, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-18 23:49:00', '2021-05-18 23:49:00', 754, 29, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 00:31:47', '2021-05-19 00:31:47', 755, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 01:26:49', '2021-05-19 01:26:49', 756, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 01:31:01', '2021-05-19 01:31:01', 757, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 01:31:46', '2021-05-19 01:31:46', 758, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 01:50:56', '2021-05-19 01:50:56', 759, 29, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 01:57:33', '2021-05-19 01:57:33', 760, 21, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 02:54:19', '2021-05-19 02:54:19', 761, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 03:27:50', '2021-05-19 03:27:50', 762, 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 03:35:21', '2021-05-19 03:35:21', 763, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 03:42:10', '2021-05-19 03:42:10', 764, 28, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 03:43:57', '2021-05-19 03:43:57', 765, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 03:52:53', '2021-05-19 03:52:53', 766, 29, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 03:53:20', '2021-05-19 03:53:20', 767, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 04:21:58', '2021-05-19 04:21:58', 768, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 04:25:41', '2021-05-19 04:25:41', 769, 21, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 05:08:35', '2021-05-19 05:08:35', 770, 27, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 05:16:52', '2021-05-19 05:16:52', 771, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 05:39:41', '2021-05-19 05:39:41', 772, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 05:47:54', '2021-05-19 05:47:54', 773, 32, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 05:54:50', '2021-05-19 05:54:50', 774, 29, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 05:56:06', '2021-05-19 05:56:06', 775, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 06:01:13', '2021-05-19 06:01:13', 776, 28, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 06:19:53', '2021-05-19 06:19:53', 777, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 06:53:49', '2021-05-19 06:53:49', 778, 21, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 07:01:02', '2021-05-19 07:01:02', 779, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 07:39:23', '2021-05-19 07:39:23', 780, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 07:44:01', '2021-05-19 07:44:01', 781, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 07:56:46', '2021-05-19 07:56:46', 782, 29, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 08:08:15', '2021-05-19 08:08:15', 783, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 08:17:16', '2021-05-19 08:17:16', 784, 28, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 08:46:24', '2021-05-19 08:46:24', 785, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 08:50:29', '2021-05-19 08:50:29', 786, 33, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 08:53:29', '2021-05-19 08:53:29', 787, 19, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 08:55:12', '2021-05-19 08:55:12', 788, 19, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 09:02:45', '2021-05-19 09:02:45', 789, 34, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 09:58:43', '2021-05-19 09:58:43', 790, 29, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 10:08:55', '2021-05-19 10:08:55', 791, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 10:12:51', '2021-05-19 10:12:51', 792, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 10:18:22', '2021-05-19 10:18:22', 793, 22, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 10:20:27', '2021-05-19 10:20:27', 794, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 10:42:23', '2021-05-19 10:42:23', 795, 28, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 10:48:36', '2021-05-19 10:48:36', 796, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 10:58:33', '2021-05-19 10:58:33', 797, 33, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 11:12:56', '2021-05-19 11:12:56', 798, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 11:30:17', '2021-05-19 11:30:17', 799, 34, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 12:00:39', '2021-05-19 12:00:39', 800, 29, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 12:20:04', '2021-05-19 12:20:04', 801, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 12:32:40', '2021-05-19 12:32:40', 802, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 13:09:42', '2021-05-19 13:09:42', 803, 20, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 13:15:11', '2021-05-19 13:15:11', 804, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 13:28:06', '2021-05-19 13:28:06', 805, 33, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 13:33:48', '2021-05-19 13:33:48', 806, 34, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 13:39:27', '2021-05-19 13:39:27', 807, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 13:46:55', '2021-05-19 13:46:55', 808, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 14:02:35', '2021-05-19 14:02:35', 809, 29, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 14:05:29', '2021-05-19 14:05:29', 810, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 14:44:50', '2021-05-19 14:44:50', 811, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 14:48:05', '2021-05-19 14:48:05', 812, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 15:22:20', '2021-05-19 15:22:20', 813, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 15:34:44', '2021-05-19 15:34:44', 814, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 15:35:15', '2021-05-19 15:35:15', 815, 20, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 15:45:50', '2021-05-19 15:45:50', 816, 34, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 15:51:40', '2021-05-19 15:51:40', 817, 33, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 16:04:31', '2021-05-19 16:04:31', 818, 29, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 16:05:58', '2021-05-19 16:05:58', 819, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 16:32:07', '2021-05-19 16:32:07', 820, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 16:57:01', '2021-05-19 16:57:01', 821, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 17:06:03', '2021-05-19 17:06:03', 822, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 17:09:47', '2021-05-19 17:09:47', 823, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 17:16:12', '2021-05-19 17:16:12', 824, 34, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 17:18:50', '2021-05-19 17:18:50', 825, 34, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 17:51:49', '2021-05-19 17:51:49', 826, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 17:54:53', '2021-05-19 17:54:53', 827, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 17:55:15', '2021-05-19 17:55:15', 828, 20, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 18:06:28', '2021-05-19 18:06:28', 829, 29, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 18:14:12', '2021-05-19 18:14:12', 830, 33, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 18:32:29', '2021-05-19 18:32:29', 831, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 18:32:29', '2021-05-19 18:32:29', 832, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 18:35:14', '2021-05-19 18:35:14', 833, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 18:43:05', '2021-05-19 18:43:05', 834, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 19:09:11', '2021-05-19 19:09:11', 835, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 19:14:42', '2021-05-19 19:14:42', 836, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 19:24:52', '2021-05-19 19:24:52', 837, 34, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 19:55:21', '2021-05-19 19:55:21', 838, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 19:56:11', '2021-05-19 19:56:11', 839, 20, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 19:58:05', '2021-05-19 19:58:05', 840, 33, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 19:58:13', '2021-05-19 19:58:13', 841, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 20:00:39', '2021-05-19 20:00:39', 842, 19, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 20:03:20', '2021-05-19 20:03:20', 843, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 20:08:24', '2021-05-19 20:08:24', 844, 29, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 20:22:18', '2021-05-19 20:22:18', 845, 20, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 20:25:06', '2021-05-19 20:25:06', 846, 20, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 20:31:29', '2021-05-19 20:31:29', 847, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 20:34:08', '2021-05-19 20:34:08', 848, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 20:41:44', '2021-05-19 20:41:44', 849, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 20:59:00', '2021-05-19 20:59:00', 850, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 21:19:37', '2021-05-19 21:19:37', 851, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 21:21:21', '2021-05-19 21:21:21', 852, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 21:30:53', '2021-05-19 21:30:53', 853, 34, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 22:10:20', '2021-05-19 22:10:20', 854, 29, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 22:23:10', '2021-05-19 22:23:10', 855, 19, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 22:27:16', '2021-05-19 22:27:16', 856, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 22:38:06', '2021-05-19 22:38:06', 857, 20, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 22:48:13', '2021-05-19 22:48:13', 858, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 23:03:00', '2021-05-19 23:03:00', 859, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 23:24:33', '2021-05-19 23:24:33', 860, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 23:25:31', '2021-05-19 23:25:31', 861, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 23:33:30', '2021-05-19 23:33:30', 862, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-19 23:36:53', '2021-05-19 23:36:53', 863, 34, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 00:12:16', '2021-05-20 00:12:16', 864, 29, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 00:45:40', '2021-05-20 00:45:40', 865, 19, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 00:51:09', '2021-05-20 00:51:09', 866, 20, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 00:54:43', '2021-05-20 00:54:43', 867, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 00:56:19', '2021-05-20 00:56:19', 868, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 01:29:29', '2021-05-20 01:29:29', 869, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 01:31:52', '2021-05-20 01:31:52', 870, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 01:42:54', '2021-05-20 01:42:54', 871, 34, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 01:45:40', '2021-05-20 01:45:40', 872, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 01:52:02', '2021-05-20 01:52:02', 873, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 01:55:37', '2021-05-20 01:55:37', 874, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 01:56:18', '2021-05-20 01:56:18', 875, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 01:58:07', '2021-05-20 01:58:07', 876, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 02:00:12', '2021-05-20 02:00:12', 877, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 02:00:38', '2021-05-20 02:00:38', 878, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 02:14:12', '2021-05-20 02:14:12', 879, 29, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 03:01:12', '2021-05-20 03:01:12', 880, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 03:04:22', '2021-05-20 03:04:22', 881, 20, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 03:25:23', '2021-05-20 03:25:23', 882, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 03:29:45', '2021-05-20 03:29:45', 883, 28, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 03:48:58', '2021-05-20 03:48:58', 884, 34, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 03:57:50', '2021-05-20 03:57:50', 885, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 04:05:56', '2021-05-20 04:05:56', 886, 33, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 04:11:41', '2021-05-20 04:11:41', 887, 32, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 04:16:09', '2021-05-20 04:16:09', 888, 29, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 04:18:34', '2021-05-20 04:18:34', 889, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 04:31:48', '2021-05-20 04:31:48', 890, 36, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 05:17:22', '2021-05-20 05:17:22', 891, 20, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 05:30:19', '2021-05-20 05:30:19', 892, 28, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 05:31:34', '2021-05-20 05:31:34', 893, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 05:54:27', '2021-05-20 05:54:27', 894, 8, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 05:55:02', '2021-05-20 05:55:02', 895, 34, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 05:58:50', '2021-05-20 05:58:50', 896, 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 05:59:19', '2021-05-20 05:59:19', 897, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 06:10:00', '2021-05-20 06:10:00', 898, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 06:15:14', '2021-05-20 06:15:14', 899, 37, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 06:18:04', '2021-05-20 06:18:04', 900, 29, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 06:20:59', '2021-05-20 06:20:59', 901, 33, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 06:45:05', '2021-05-20 06:45:05', 902, 10, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 06:49:38', '2021-05-20 06:49:38', 903, 36, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 06:56:20', '2021-05-20 06:56:20', 904, 32, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 07:30:25', '2021-05-20 07:30:25', 905, 20, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 07:32:22', '2021-05-20 07:32:22', 906, 28, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 07:38:22', '2021-05-20 07:38:22', 907, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 07:48:59', '2021-05-20 07:48:59', 908, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 07:55:48', '2021-05-20 07:55:48', 909, 11, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 08:01:06', '2021-05-20 08:01:06', 910, 34, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 08:20:00', '2021-05-20 08:20:00', 911, 29, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 08:22:10', '2021-05-20 08:22:10', 912, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 08:22:17', '2021-05-20 08:22:17', 913, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 08:25:29', '2021-05-20 08:25:29', 914, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 09:15:59', '2021-05-20 09:15:59', 915, 36, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 09:43:27', '2021-05-20 09:43:27', 916, 20, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 09:58:05', '2021-05-20 09:58:05', 917, 28, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 10:14:40', '2021-05-20 10:14:40', 918, 34, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 10:28:58', '2021-05-20 10:28:58', 919, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 10:34:38', '2021-05-20 10:34:38', 920, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 10:48:02', '2021-05-20 10:48:02', 921, 29, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 10:50:31', '2021-05-20 10:50:31', 922, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 10:52:17', '2021-05-20 10:52:17', 923, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 12:00:52', '2021-05-20 12:00:52', 924, 39, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 12:04:01', '2021-05-20 12:04:01', 925, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 12:05:12', '2021-05-20 12:05:12', 926, 20, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 12:06:37', '2021-05-20 12:06:37', 927, 28, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 12:22:13', '2021-05-20 12:22:13', 928, 34, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 12:34:29', '2021-05-20 12:34:29', 929, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 13:00:41', '2021-05-20 13:00:41', 930, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 13:07:31', '2021-05-20 13:07:31', 931, 29, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 13:17:50', '2021-05-20 13:17:50', 932, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 13:32:34', '2021-05-20 13:32:34', 933, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 13:32:53', '2021-05-20 13:32:53', 934, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 14:06:10', '2021-05-20 14:06:10', 935, 20, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 14:33:16', '2021-05-20 14:33:16', 936, 34, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 15:11:58', '2021-05-20 15:11:58', 937, 29, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 15:19:22', '2021-05-20 15:19:22', 938, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 15:38:01', '2021-05-20 15:38:01', 939, 36, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 15:44:34', '2021-05-20 15:44:34', 940, 40, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 15:46:23', '2021-05-20 15:46:23', 941, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 16:08:26', '2021-05-20 16:08:26', 942, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 16:17:44', '2021-05-20 16:17:44', 943, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 16:25:11', '2021-05-20 16:25:11', 944, 20, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 16:48:19', '2021-05-20 16:48:19', 945, 34, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 17:08:52', '2021-05-20 17:08:52', 946, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 17:11:20', '2021-05-20 17:11:20', 947, 40, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 17:14:05', '2021-05-20 17:14:05', 948, 40, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 17:26:30', '2021-05-20 17:26:30', 949, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 17:29:18', '2021-05-20 17:29:18', 950, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 17:29:28', '2021-05-20 17:29:28', 951, 29, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 17:40:28', '2021-05-20 17:40:28', 952, 20, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 17:43:50', '2021-05-20 17:43:50', 953, 36, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 17:45:07', '2021-05-20 17:45:07', 954, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 18:13:55', '2021-05-20 18:13:55', 955, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 18:15:10', '2021-05-20 18:15:10', 956, 34, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 18:18:02', '2021-05-20 18:18:02', 957, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 18:18:25', '2021-05-20 18:18:25', 958, 36, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 18:19:09', '2021-05-20 18:19:09', 959, 29, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 18:21:09', '2021-05-20 18:21:09', 960, 36, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 18:22:06', '2021-05-20 18:22:06', 961, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 18:36:07', '2021-05-20 18:36:07', 962, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 19:22:47', '2021-05-20 19:22:47', 963, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 19:42:56', '2021-05-20 19:42:56', 964, 40, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 19:46:26', '2021-05-20 19:46:26', 965, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 19:49:31', '2021-05-20 19:49:31', 966, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 19:50:15', '2021-05-20 19:50:15', 967, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 19:55:22', '2021-05-20 19:55:22', 968, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 19:59:23', '2021-05-20 19:59:23', 969, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 20:02:12', '2021-05-20 20:02:12', 970, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 20:14:51', '2021-05-20 20:14:51', 971, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 20:17:22', '2021-05-20 20:17:22', 972, 18, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 20:20:49', '2021-05-20 20:20:49', 973, 43, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 20:21:01', '2021-05-20 20:21:01', 974, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 20:29:24', '2021-05-20 20:29:24', 975, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 20:32:13', '2021-05-20 20:32:13', 976, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 20:32:34', '2021-05-20 20:32:34', 977, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 20:42:27', '2021-05-20 20:42:27', 978, 36, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 21:55:59', '2021-05-20 21:55:59', 979, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 22:03:45', '2021-05-20 22:03:45', 980, 40, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 22:15:24', '2021-05-20 22:15:24', 981, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 22:26:33', '2021-05-20 22:26:33', 982, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 22:30:30', '2021-05-20 22:30:30', 983, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 22:32:59', '2021-05-20 22:32:59', 984, 43, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 22:39:32', '2021-05-20 22:39:32', 985, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 22:43:42', '2021-05-20 22:43:42', 986, 36, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-20 22:59:44', '2021-05-20 22:59:44', 987, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 00:12:01', '2021-05-21 00:12:01', 988, 40, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 00:23:30', '2021-05-21 00:23:30', 989, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 00:29:21', '2021-05-21 00:29:21', 990, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 00:32:28', '2021-05-21 00:32:28', 991, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 00:35:08', '2021-05-21 00:35:08', 992, 43, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 00:43:27', '2021-05-21 00:43:27', 993, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 00:48:30', '2021-05-21 00:48:30', 994, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 00:57:00', '2021-05-21 00:57:00', 995, 36, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 01:22:03', '2021-05-21 01:22:03', 996, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 01:27:48', '2021-05-21 01:27:48', 997, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 02:39:29', '2021-05-21 02:39:29', 998, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 02:53:57', '2021-05-21 02:53:57', 999, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 02:57:23', '2021-05-21 02:57:23', 1000, 43, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 02:59:14', '2021-05-21 02:59:14', 1001, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 03:00:59', '2021-05-21 03:00:59', 1002, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 03:36:45', '2021-05-21 03:36:45', 1003, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 03:46:55', '2021-05-21 03:46:55', 1004, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 05:03:55', '2021-05-21 05:03:55', 1005, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 05:05:04', '2021-05-21 05:05:04', 1006, 43, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 05:25:32', '2021-05-21 05:25:32', 1007, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 05:35:21', '2021-05-21 05:35:21', 1008, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 05:42:41', '2021-05-21 05:42:41', 1009, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 05:50:03', '2021-05-21 05:50:03', 1010, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 07:09:08', '2021-05-21 07:09:08', 1011, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 07:17:55', '2021-05-21 07:17:55', 1012, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 07:28:18', '2021-05-21 07:28:18', 1013, 43, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 07:53:06', '2021-05-21 07:53:06', 1014, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 07:58:39', '2021-05-21 07:58:39', 1015, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 07:58:43', '2021-05-21 07:58:43', 1016, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 08:00:11', '2021-05-21 08:00:11', 1017, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 09:15:07', '2021-05-21 09:15:07', 1018, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 09:34:57', '2021-05-21 09:34:57', 1019, 43, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 09:43:57', '2021-05-21 09:43:57', 1020, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 10:02:10', '2021-05-21 10:02:10', 1021, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 10:07:35', '2021-05-21 10:07:35', 1022, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 10:17:49', '2021-05-21 10:17:49', 1023, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 11:49:54', '2021-05-21 11:49:54', 1024, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 11:50:12', '2021-05-21 11:50:12', 1025, 43, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 12:05:37', '2021-05-21 12:05:37', 1026, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 12:16:33', '2021-05-21 12:16:33', 1027, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 12:44:30', '2021-05-21 12:44:30', 1028, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 13:26:48', '2021-05-21 13:26:48', 1029, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 13:33:25', '2021-05-21 13:33:25', 1030, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 14:08:29', '2021-05-21 14:08:29', 1031, 36, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 14:09:55', '2021-05-21 14:09:55', 1032, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 14:31:39', '2021-05-21 14:31:39', 1033, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 14:39:07', '2021-05-21 14:39:07', 1034, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 14:45:01', '2021-05-21 14:45:01', 1035, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 15:50:44', '2021-05-21 15:50:44', 1036, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 15:59:02', '2021-05-21 15:59:02', 1037, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 16:13:47', '2021-05-21 16:13:47', 1038, 36, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 16:32:35', '2021-05-21 16:32:35', 1039, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 16:35:58', '2021-05-21 16:35:58', 1040, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 16:46:35', '2021-05-21 16:46:35', 1041, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 17:04:38', '2021-05-21 17:04:38', 1042, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 17:52:03', '2021-05-21 17:52:03', 1043, 36, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 17:54:39', '2021-05-21 17:54:39', 1044, 36, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 18:01:07', '2021-05-21 18:01:07', 1045, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 18:03:35', '2021-05-21 18:03:35', 1046, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 18:03:49', '2021-05-21 18:03:49', 1047, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 18:37:32', '2021-05-21 18:37:32', 1048, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 19:05:01', '2021-05-21 19:05:01', 1049, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 19:06:35', '2021-05-21 19:06:35', 1050, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 19:15:43', '2021-05-21 19:15:43', 1051, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 19:31:16', '2021-05-21 19:31:16', 1052, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 19:33:54', '2021-05-21 19:33:54', 1053, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 19:40:30', '2021-05-21 19:40:30', 1054, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 19:43:15', '2021-05-21 19:43:15', 1055, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 20:15:29', '2021-05-21 20:15:29', 1056, 36, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 20:19:40', '2021-05-21 20:19:40', 1057, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 21:02:03', '2021-05-21 21:02:03', 1058, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 21:11:32', '2021-05-21 21:11:32', 1059, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 21:24:01', '2021-05-21 21:24:01', 1060, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 21:40:54', '2021-05-21 21:40:54', 1061, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 21:49:15', '2021-05-21 21:49:15', 1062, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 22:16:46', '2021-05-21 22:16:46', 1063, 36, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 22:31:59', '2021-05-21 22:31:59', 1064, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 23:24:34', '2021-05-21 23:24:34', 1065, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 23:36:04', '2021-05-21 23:36:04', 1066, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-21 23:49:03', '2021-05-21 23:49:03', 1067, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 00:05:48', '2021-05-22 00:05:48', 1068, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 00:09:29', '2021-05-22 00:09:29', 1069, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 00:35:05', '2021-05-22 00:35:05', 1070, 36, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 00:35:15', '2021-05-22 00:35:15', 1071, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 01:29:32', '2021-05-22 01:29:32', 1072, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 01:56:35', '2021-05-22 01:56:35', 1073, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 02:08:04', '2021-05-22 02:08:04', 1074, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 02:27:34', '2021-05-22 02:27:34', 1075, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 02:29:08', '2021-05-22 02:29:08', 1076, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 02:29:14', '2021-05-22 02:29:14', 1077, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 03:12:23', '2021-05-22 03:12:23', 1078, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 03:36:31', '2021-05-22 03:36:31', 1079, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 04:03:33', '2021-05-22 04:03:33', 1080, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 04:25:35', '2021-05-22 04:25:35', 1081, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 04:35:53', '2021-05-22 04:35:53', 1082, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 04:48:53', '2021-05-22 04:48:53', 1083, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 04:49:38', '2021-05-22 04:49:38', 1084, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 05:23:54', '2021-05-22 05:23:54', 1085, 44, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 05:36:37', '2021-05-22 05:36:37', 1086, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 05:40:27', '2021-05-22 05:40:27', 1087, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 06:08:21', '2021-05-22 06:08:21', 1088, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 06:18:04', '2021-05-22 06:18:04', 1089, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 06:29:01', '2021-05-22 06:29:01', 1090, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 06:36:28', '2021-05-22 06:36:28', 1091, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 07:03:03', '2021-05-22 07:03:03', 1092, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 07:09:41', '2021-05-22 07:09:41', 1093, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 07:13:46', '2021-05-22 07:13:46', 1094, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 07:14:01', '2021-05-22 07:14:01', 1095, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 07:55:11', '2021-05-22 07:55:11', 1096, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 08:03:28', '2021-05-22 08:03:28', 1097, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 08:17:53', '2021-05-22 08:17:53', 1098, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 08:21:00', '2021-05-22 08:21:00', 1099, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 08:38:00', '2021-05-22 08:38:00', 1100, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 08:55:33', '2021-05-22 08:55:33', 1101, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 09:23:13', '2021-05-22 09:23:13', 1102, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 09:36:39', '2021-05-22 09:36:39', 1103, 16, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 10:04:24', '2021-05-22 10:04:24', 1104, 9, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 10:16:01', '2021-05-22 10:16:01', 1105, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 10:36:30', '2021-05-22 10:36:30', 1106, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 11:03:11', '2021-05-22 11:03:11', 1107, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 11:11:32', '2021-05-22 11:11:32', 1108, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 11:35:45', '2021-05-22 11:35:45', 1109, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 12:03:30', '2021-05-22 12:03:30', 1110, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 12:38:21', '2021-05-22 12:38:21', 1111, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 12:41:56', '2021-05-22 12:41:56', 1112, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 13:18:01', '2021-05-22 13:18:01', 1113, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 13:28:22', '2021-05-22 13:28:22', 1114, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 13:52:17', '2021-05-22 13:52:17', 1115, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 14:05:01', '2021-05-22 14:05:01', 1116, 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 14:13:41', '2021-05-22 14:13:41', 1117, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 14:44:09', '2021-05-22 14:44:09', 1118, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 14:44:55', '2021-05-22 14:44:55', 1119, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 15:10:30', '2021-05-22 15:10:30', 1120, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 15:33:48', '2021-05-22 15:33:48', 1121, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 15:45:34', '2021-05-22 15:45:34', 1122, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 15:55:16', '2021-05-22 15:55:16', 1123, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 15:55:33', '2021-05-22 15:55:33', 1124, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 16:05:36', '2021-05-22 16:05:36', 1125, 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 16:31:28', '2021-05-22 16:31:28', 1126, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 16:50:26', '2021-05-22 16:50:26', 1127, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 16:51:12', '2021-05-22 16:51:12', 1128, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 17:05:08', '2021-05-22 17:05:08', 1129, 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 17:07:41', '2021-05-22 17:07:41', 1130, 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 17:23:27', '2021-05-22 17:23:27', 1131, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 17:29:28', '2021-05-22 17:29:28', 1132, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 17:32:12', '2021-05-22 17:32:12', 1133, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 17:42:00', '2021-05-22 17:42:00', 1134, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 17:50:12', '2021-05-22 17:50:12', 1135, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 17:53:03', '2021-05-22 17:53:03', 1136, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 17:53:07', '2021-05-22 17:53:07', 1137, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 18:09:24', '2021-05-22 18:09:24', 1138, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 18:13:25', '2021-05-22 18:13:25', 1139, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 18:22:11', '2021-05-22 18:22:11', 1140, 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 18:23:19', '2021-05-22 18:23:19', 1141, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 18:25:01', '2021-05-22 18:25:01', 1142, 45, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 19:10:30', '2021-05-22 19:10:30', 1143, 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 19:19:23', '2021-05-22 19:19:23', 1144, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 19:22:06', '2021-05-22 19:22:06', 1145, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 19:46:59', '2021-05-22 19:46:59', 1146, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 19:59:14', '2021-05-22 19:59:14', 1147, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 20:01:02', '2021-05-22 20:01:02', 1148, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 20:20:09', '2021-05-22 20:20:09', 1149, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 20:29:23', '2021-05-22 20:29:23', 1150, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 20:35:20', '2021-05-22 20:35:20', 1151, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 21:18:50', '2021-05-22 21:18:50', 1152, 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 21:39:47', '2021-05-22 21:39:47', 1153, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 21:59:56', '2021-05-22 21:59:56', 1154, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 22:16:13', '2021-05-22 22:16:13', 1155, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 22:23:33', '2021-05-22 22:23:33', 1156, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 22:28:06', '2021-05-22 22:28:06', 1157, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 22:37:20', '2021-05-22 22:37:20', 1158, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 22:56:54', '2021-05-22 22:56:54', 1159, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-22 23:46:42', '2021-05-22 23:46:42', 1160, 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 00:02:29', '2021-05-23 00:02:29', 1161, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 00:12:23', '2021-05-23 00:12:23', 1162, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 00:34:43', '2021-05-23 00:34:43', 1163, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 00:39:33', '2021-05-23 00:39:33', 1164, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 00:49:53', '2021-05-23 00:49:53', 1165, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 00:58:10', '2021-05-23 00:58:10', 1166, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 01:04:51', '2021-05-23 01:04:51', 1167, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 01:54:31', '2021-05-23 01:54:31', 1168, 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 02:09:37', '2021-05-23 02:09:37', 1169, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 02:15:18', '2021-05-23 02:15:18', 1170, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 02:37:09', '2021-05-23 02:37:09', 1171, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 02:54:22', '2021-05-23 02:54:22', 1172, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 02:58:34', '2021-05-23 02:58:34', 1173, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 03:08:17', '2021-05-23 03:08:17', 1174, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 03:36:37', '2021-05-23 03:36:37', 1175, 46, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 03:59:19', '2021-05-23 03:59:19', 1176, 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 04:26:45', '2021-05-23 04:26:45', 1177, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 04:32:49', '2021-05-23 04:32:49', 1178, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 05:06:22', '2021-05-23 05:06:22', 1179, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 05:25:16', '2021-05-23 05:25:16', 1180, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 05:25:36', '2021-05-23 05:25:36', 1181, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 05:28:38', '2021-05-23 05:28:38', 1182, 44, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 05:37:37', '2021-05-23 05:37:37', 1183, 46, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 06:21:40', '2021-05-23 06:21:40', 1184, 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 06:39:28', '2021-05-23 06:39:28', 1185, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 06:48:14', '2021-05-23 06:48:14', 1186, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 07:09:00', '2021-05-23 07:09:00', 1187, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 07:13:51', '2021-05-23 07:13:51', 1188, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 07:16:53', '2021-05-23 07:16:53', 1189, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 07:29:34', '2021-05-23 07:29:34', 1190, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 07:53:49', '2021-05-23 07:53:49', 1191, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 07:55:09', '2021-05-23 07:55:09', 1192, 46, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 08:34:28', '2021-05-23 08:34:28', 1193, 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 09:08:14', '2021-05-23 09:08:14', 1194, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 09:09:42', '2021-05-23 09:09:42', 1195, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 09:14:05', '2021-05-23 09:14:05', 1196, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 09:28:04', '2021-05-23 09:28:04', 1197, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 09:30:56', '2021-05-23 09:30:56', 1198, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 09:51:06', '2021-05-23 09:51:06', 1199, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 10:15:10', '2021-05-23 10:15:10', 1200, 46, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 10:19:20', '2021-05-23 10:19:20', 1201, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 11:03:50', '2021-05-23 11:03:50', 1202, 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 11:18:11', '2021-05-23 11:18:11', 1203, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 11:22:52', '2021-05-23 11:22:52', 1204, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 11:30:14', '2021-05-23 11:30:14', 1205, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 11:42:48', '2021-05-23 11:42:48', 1206, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 11:49:59', '2021-05-23 11:49:59', 1207, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 11:54:03', '2021-05-23 11:54:03', 1208, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 12:34:49', '2021-05-23 12:34:49', 1209, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 12:39:12', '2021-05-23 12:39:12', 1210, 46, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 13:23:49', '2021-05-23 13:23:49', 1211, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 13:29:10', '2021-05-23 13:29:10', 1212, 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 13:31:30', '2021-05-23 13:31:30', 1213, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 13:48:12', '2021-05-23 13:48:12', 1214, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 13:49:58', '2021-05-23 13:49:58', 1215, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 14:08:31', '2021-05-23 14:08:31', 1216, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 14:18:05', '2021-05-23 14:18:05', 1217, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 14:56:49', '2021-05-23 14:56:49', 1218, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 15:06:15', '2021-05-23 15:06:15', 1219, 46, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 15:40:00', '2021-05-23 15:40:00', 1220, 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 15:40:32', '2021-05-23 15:40:32', 1221, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 15:54:37', '2021-05-23 15:54:37', 1222, 47, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 15:58:14', '2021-05-23 15:58:14', 1223, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 16:01:40', '2021-05-23 16:01:40', 1224, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 16:08:59', '2021-05-23 16:08:59', 1225, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 16:15:17', '2021-05-23 16:15:17', 1226, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 16:29:34', '2021-05-23 16:29:34', 1227, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 17:26:21', '2021-05-23 17:26:21', 1228, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 17:32:17', '2021-05-23 17:32:17', 1229, 46, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 17:45:18', '2021-05-23 17:45:18', 1230, 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 18:01:20', '2021-05-23 18:01:20', 1231, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 18:02:19', '2021-05-23 18:02:19', 1232, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 18:24:13', '2021-05-23 18:24:13', 1233, 47, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 18:27:11', '2021-05-23 18:27:11', 1234, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 18:34:03', '2021-05-23 18:34:03', 1235, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 18:36:03', '2021-05-23 18:36:03', 1236, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 18:38:56', '2021-05-23 18:38:56', 1237, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 18:50:05', '2021-05-23 18:50:05', 1238, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 19:27:46', '2021-05-23 19:27:46', 1239, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 19:33:29', '2021-05-23 19:33:29', 1240, 47, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 19:36:10', '2021-05-23 19:36:10', 1241, 47, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 19:39:46', '2021-05-23 19:39:46', 1242, 46, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 20:02:57', '2021-05-23 20:02:57', 1243, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 20:09:56', '2021-05-23 20:09:56', 1244, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 20:11:08', '2021-05-23 20:11:08', 1245, 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 20:21:02', '2021-05-23 20:21:02', 1246, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 20:23:45', '2021-05-23 20:23:45', 1247, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 20:38:39', '2021-05-23 20:38:39', 1248, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 20:53:27', '2021-05-23 20:53:27', 1249, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 21:03:37', '2021-05-23 21:03:37', 1250, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 21:10:36', '2021-05-23 21:10:36', 1251, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 21:42:46', '2021-05-23 21:42:46', 1252, 47, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 21:48:45', '2021-05-23 21:48:45', 1253, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 22:05:48', '2021-05-23 22:05:48', 1254, 46, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 22:19:08', '2021-05-23 22:19:08', 1255, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 22:28:58', '2021-05-23 22:28:58', 1256, 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 22:46:48', '2021-05-23 22:46:48', 1257, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 23:02:40', '2021-05-23 23:02:40', 1258, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 23:22:36', '2021-05-23 23:22:36', 1259, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 23:23:02', '2021-05-23 23:23:02', 1260, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 23:28:42', '2021-05-23 23:28:42', 1261, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-23 23:53:41', '2021-05-23 23:53:41', 1262, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 00:08:29', '2021-05-24 00:08:29', 1263, 47, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 00:09:16', '2021-05-24 00:09:16', 1264, 46, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 00:47:52', '2021-05-24 00:47:52', 1265, 31, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 00:51:49', '2021-05-24 00:51:49', 1266, 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 01:16:52', '2021-05-24 01:16:52', 1267, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 01:22:39', '2021-05-24 01:22:39', 1268, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 01:36:42', '2021-05-24 01:36:42', 1269, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 01:40:33', '2021-05-24 01:40:33', 1270, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 01:43:07', '2021-05-24 01:43:07', 1271, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 02:11:41', '2021-05-24 02:11:41', 1272, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 02:15:06', '2021-05-24 02:15:06', 1273, 47, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 02:29:47', '2021-05-24 02:29:47', 1274, 46, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 03:05:38', '2021-05-24 03:05:38', 1275, 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 03:12:04', '2021-05-24 03:12:04', 1276, 43, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 03:27:35', '2021-05-24 03:27:35', 1277, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 03:31:22', '2021-05-24 03:31:22', 1278, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 03:33:01', '2021-05-24 03:33:01', 1279, 48, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 03:36:01', '2021-05-24 03:36:01', 1280, 44, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 03:41:13', '2021-05-24 03:41:13', 1281, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 04:06:38', '2021-05-24 04:06:38', 1282, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 04:33:19', '2021-05-24 04:33:19', 1283, 47, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 04:43:48', '2021-05-24 04:43:48', 1284, 46, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 05:27:46', '2021-05-24 05:27:46', 1285, 43, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 05:42:16', '2021-05-24 05:42:16', 1286, 48, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 06:02:15', '2021-05-24 06:02:15', 1287, 44, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 06:05:57', '2021-05-24 06:05:57', 1288, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 06:06:49', '2021-05-24 06:06:49', 1289, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 06:15:07', '2021-05-24 06:15:07', 1290, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 06:20:00', '2021-05-24 06:20:00', 1291, 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 06:27:33', '2021-05-24 06:27:33', 1292, 25, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 06:38:45', '2021-05-24 06:38:45', 1293, 38, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 06:53:47', '2021-05-24 06:53:47', 1294, 46, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 07:01:34', '2021-05-24 07:01:34', 1295, 47, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 07:43:23', '2021-05-24 07:43:23', 1296, 43, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 08:00:08', '2021-05-24 08:00:08', 1297, 48, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 08:04:48', '2021-05-24 08:04:48', 1298, 44, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 08:06:42', '2021-05-24 08:06:42', 1299, 49, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 08:10:48', '2021-05-24 08:10:48', 1300, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 08:17:04', '2021-05-24 08:17:04', 1301, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 08:45:27', '2021-05-24 08:45:27', 1302, 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 09:06:09', '2021-05-24 09:06:09', 1303, 50, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 09:06:52', '2021-05-24 09:06:52', 1304, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 09:21:19', '2021-05-24 09:21:19', 1305, 46, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 09:22:20', '2021-05-24 09:22:20', 1306, 47, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 10:07:01', '2021-05-24 10:07:01', 1307, 43, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 10:18:48', '2021-05-24 10:18:48', 1308, 49, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 10:25:03', '2021-05-24 10:25:03', 1309, 48, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 10:30:22', '2021-05-24 10:30:22', 1310, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 10:32:33', '2021-05-24 10:32:33', 1311, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 10:34:20', '2021-05-24 10:34:20', 1312, 51, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 10:44:37', '2021-05-24 10:44:37', 1313, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 11:19:21', '2021-05-24 11:19:21', 1314, 50, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 11:40:27', '2021-05-24 11:40:27', 1315, 46, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 11:47:32', '2021-05-24 11:47:32', 1316, 47, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 12:28:38', '2021-05-24 12:28:38', 1317, 43, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 12:37:32', '2021-05-24 12:37:32', 1318, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 12:57:57', '2021-05-24 12:57:57', 1319, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 13:08:06', '2021-05-24 13:08:06', 1320, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 13:13:10', '2021-05-24 13:13:10', 1321, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 13:20:27', '2021-05-24 13:20:27', 1322, 50, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 13:51:09', '2021-05-24 13:51:09', 1323, 47, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 14:06:06', '2021-05-24 14:06:06', 1324, 45, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 14:36:12', '2021-05-24 14:36:12', 1325, 43, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 15:03:24', '2021-05-24 15:03:24', 1326, 51, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 15:25:44', '2021-05-24 15:25:44', 1327, 45, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 15:26:38', '2021-05-24 15:26:38', 1328, 50, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 15:31:10', '2021-05-24 15:31:10', 1329, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 15:44:35', '2021-05-24 15:44:35', 1330, 45, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 15:46:15', '2021-05-24 15:46:15', 1331, 45, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 15:53:16', '2021-05-24 15:53:16', 1332, 47, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 16:01:02', '2021-05-24 16:01:02', 1333, 45, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 16:01:19', '2021-05-24 16:01:19', 1334, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 16:08:10', '2021-05-24 16:08:10', 1335, 45, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 16:11:05', '2021-05-24 16:11:05', 1336, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 16:36:22', '2021-05-24 16:36:22', 1337, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 16:43:49', '2021-05-24 16:43:49', 1338, 45, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 16:46:55', '2021-05-24 16:46:55', 1339, 45, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 16:51:13', '2021-05-24 16:51:13', 1340, 45, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 16:51:18', '2021-05-24 16:51:18', 1341, 45, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 17:06:20', '2021-05-24 17:06:20', 1342, 43, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 17:12:23', '2021-05-24 17:12:23', 1343, 51, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 17:34:45', '2021-05-24 17:34:45', 1344, 50, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 17:53:42', '2021-05-24 17:53:42', 1345, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 18:13:00', '2021-05-24 18:13:00', 1346, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 18:15:00', '2021-05-24 18:15:00', 1347, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 18:17:54', '2021-05-24 18:17:54', 1348, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 18:18:59', '2021-05-24 18:18:59', 1349, 47, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 18:29:35', '2021-05-24 18:29:35', 1350, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 18:58:58', '2021-05-24 18:58:58', 1351, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 19:13:04', '2021-05-24 19:13:04', 1352, 45, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 19:20:56', '2021-05-24 19:20:56', 1353, 43, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 19:55:39', '2021-05-24 19:55:39', 1354, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 19:59:03', '2021-05-24 19:59:03', 1355, 50, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 20:22:54', '2021-05-24 20:22:54', 1356, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 20:24:22', '2021-05-24 20:24:22', 1357, 51, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 20:24:22', '2021-05-24 20:24:22', 1358, 51, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 20:48:12', '2021-05-24 20:48:12', 1359, 47, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 20:53:06', '2021-05-24 20:53:06', 1360, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 21:24:35', '2021-05-24 21:24:35', 1361, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 21:38:01', '2021-05-24 21:38:01', 1362, 43, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 22:20:42', '2021-05-24 22:20:42', 1363, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 22:23:50', '2021-05-24 22:23:50', 1364, 50, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 22:38:20', '2021-05-24 22:38:20', 1365, 51, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 22:48:00', '2021-05-24 22:48:00', 1366, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 22:59:50', '2021-05-24 22:59:50', 1367, 47, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 23:04:04', '2021-05-24 23:04:04', 1368, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 23:33:07', '2021-05-24 23:33:07', 1369, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-24 23:57:37', '2021-05-24 23:57:37', 1370, 43, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 00:24:40', '2021-05-25 00:24:40', 1371, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 00:36:31', '2021-05-25 00:36:31', 1372, 50, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 01:03:02', '2021-05-25 01:03:02', 1373, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 01:07:53', '2021-05-25 01:07:53', 1374, 51, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 01:15:31', '2021-05-25 01:15:31', 1375, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 01:25:32', '2021-05-25 01:25:32', 1376, 47, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 01:41:42', '2021-05-25 01:41:42', 1377, 45, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 01:41:58', '2021-05-25 01:41:58', 1378, 45, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 01:42:05', '2021-05-25 01:42:05', 1379, 45, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 01:57:22', '2021-05-25 01:57:22', 1380, 45, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 01:58:13', '2021-05-25 01:58:13', 1381, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 02:01:10', '2021-05-25 02:01:10', 1382, 43, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 02:53:13', '2021-05-25 02:53:13', 1383, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 03:02:14', '2021-05-25 03:02:14', 1384, 48, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 03:05:51', '2021-05-25 03:05:51', 1385, 50, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 03:21:21', '2021-05-25 03:21:21', 1386, 44, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 03:21:50', '2021-05-25 03:21:50', 1387, 51, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 03:25:37', '2021-05-25 03:25:37', 1388, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 03:37:40', '2021-05-25 03:37:40', 1389, 47, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 03:39:32', '2021-05-25 03:39:32', 1390, 35, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 03:59:33', '2021-05-25 03:59:33', 1391, 45, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 04:06:15', '2021-05-25 04:06:15', 1392, 41, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 04:12:47', '2021-05-25 04:12:47', 1393, 43, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 04:28:50', '2021-05-25 04:28:50', 1394, 49, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 04:34:32', '2021-05-25 04:34:32', 1395, 52, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 04:56:40', '2021-05-25 04:56:40', 1396, 42, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 05:15:00', '2021-05-25 05:15:00', 1397, 50, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 05:20:04', '2021-05-25 05:20:04', 1398, 48, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 05:26:59', '2021-05-25 05:26:59', 1399, 26, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 05:39:49', '2021-05-25 05:39:49', 1400, 51, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 05:43:44', '2021-05-25 05:43:44', 1401, 44, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 05:48:49', '2021-05-25 05:48:49', 1402, 48, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `device_states` VALUES ('2021-05-25 05:48:59', '2021-05-25 05:48:59', 1403, 35, NULL, NULL, NULL, NULL, NULL, NULL);

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
  CONSTRAINT `dictionary_items_ibfk_2` FOREIGN KEY (`created_by_fk`) REFERENCES `ab_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dictionary_items_ibfk_3` FOREIGN KEY (`changed_by_fk`) REFERENCES `ab_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dictionary_items
-- ----------------------------
INSERT INTO `dictionary_items` VALUES ('2021-04-15 17:28:33', '2021-04-15 17:28:33', 1, 1, 'https', 'https', '', NULL, '', 1, 1);

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
  CONSTRAINT `dictionarys_ibfk_1` FOREIGN KEY (`created_by_fk`) REFERENCES `ab_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dictionarys_ibfk_2` FOREIGN KEY (`changed_by_fk`) REFERENCES `ab_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dictionarys
-- ----------------------------
INSERT INTO `dictionarys` VALUES ('2021-04-15 17:28:10', '2021-04-15 17:28:10', 1, '设备型号升级检测方式', 'device_model_check_mode', '', 1, 1);

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
  CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `ab_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 637 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES (1, 'list', 1, NULL, NULL, '{}', '2021-04-15 16:48:17', 30, 'http://172.28.3.4:5000/permissions/list/', '/logmodelview/list/');
INSERT INTO `logs` VALUES (2, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:17:04', 41, 'http://172.28.3.4:5000/permissionviews/list/', '/dictionarymodelview/list/');
INSERT INTO `logs` VALUES (3, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:17:06', 41, 'http://172.28.3.4:5000/dictionarymodelview/list/', '/dictionaryitemmodelview/list/');
INSERT INTO `logs` VALUES (4, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:17:09', 48, 'http://172.28.3.4:5000/dictionaryitemmodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (5, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:17:13', 92, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (6, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:17:14', 39, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/dictionarymodelview/list/');
INSERT INTO `logs` VALUES (7, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:17:15', 43, 'http://172.28.3.4:5000/dictionarymodelview/list/', '/dictionaryitemmodelview/list/');
INSERT INTO `logs` VALUES (8, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:17:17', 41, 'http://172.28.3.4:5000/dictionaryitemmodelview/list/', '/dictionarymodelview/list/');
INSERT INTO `logs` VALUES (9, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:17:18', 41, 'http://172.28.3.4:5000/dictionarymodelview/list/', '/dictionaryitemmodelview/list/');
INSERT INTO `logs` VALUES (10, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:17:46', 32, 'http://172.28.3.4:5000/dictionaryitemmodelview/list/', '/logmodelview/list/');
INSERT INTO `logs` VALUES (11, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:18:37', 59, 'http://172.28.3.4:5000/logmodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (12, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:18:50', 37, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/dictionarymodelview/list/');
INSERT INTO `logs` VALUES (13, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:18:59', 42, 'http://172.28.3.4:5000/dictionarymodelview/list/', '/dictionaryitemmodelview/list/');
INSERT INTO `logs` VALUES (14, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:19:07', 37, 'http://172.28.3.4:5000/dictionaryitemmodelview/list/', '/dictionarymodelview/list/');
INSERT INTO `logs` VALUES (15, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:19:08', 39, 'http://172.28.3.4:5000/dictionarymodelview/list/', '/dictionaryitemmodelview/list/');
INSERT INTO `logs` VALUES (16, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:20:09', 119, 'http://172.28.3.4:5000/dictionarymodelview/list/', '/dictionaryitemmodelview/list/');
INSERT INTO `logs` VALUES (17, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:20:11', 34, 'http://172.28.3.4:5000/dictionaryitemmodelview/list/', '/dictionarymodelview/list/');
INSERT INTO `logs` VALUES (18, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:20:13', 46, 'http://172.28.3.4:5000/dictionarymodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (19, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:20:15', 44, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (20, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:20:16', 41, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/dictionarymodelview/list/');
INSERT INTO `logs` VALUES (21, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:20:18', 39, 'http://172.28.3.4:5000/dictionarymodelview/list/', '/dictionaryitemmodelview/list/');
INSERT INTO `logs` VALUES (22, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:21:08', 40, 'http://172.28.3.4:5000/dictionaryitemmodelview/list/', '/dictionarymodelview/list/');
INSERT INTO `logs` VALUES (23, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:22:42', 43, 'http://172.28.3.4:5000/dictionaryitemmodelview/list/', '/dictionarymodelview/list/');
INSERT INTO `logs` VALUES (24, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:22:45', 37, 'http://172.28.3.4:5000/dictionarymodelview/list/', '/dictionarymodelview/list/');
INSERT INTO `logs` VALUES (25, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:22:46', 39, 'http://172.28.3.4:5000/dictionarymodelview/list/', '/dictionaryitemmodelview/list/');
INSERT INTO `logs` VALUES (26, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:22:48', 59, 'http://172.28.3.4:5000/dictionaryitemmodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (27, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:22:50', 34, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/logmodelview/list/');
INSERT INTO `logs` VALUES (28, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:23:36', 43, 'http://172.28.3.4:5000/logmodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (29, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:24:47', 128, 'http://172.28.3.4:5000/logmodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (30, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:24:47', 59, 'http://172.28.3.4:5000/logmodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (31, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:24:50', 38, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/dictionarymodelview/list/');
INSERT INTO `logs` VALUES (32, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:24:51', 39, 'http://172.28.3.4:5000/dictionarymodelview/list/', '/dictionaryitemmodelview/list/');
INSERT INTO `logs` VALUES (33, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:24:58', 33, 'http://172.28.3.4:5000/userstatschartview/chart/', '/logmodelview/list/');
INSERT INTO `logs` VALUES (34, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:25:00', 46, 'http://172.28.3.4:5000/logmodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (35, 'add', 1, NULL, NULL, '{}', '2021-04-15 17:25:01', 51, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/add');
INSERT INTO `logs` VALUES (36, 'add', 1, NULL, NULL, '{\"csrf_token\": \"IjE3ZmIzNmJhODI2MTAyZGY1MTAxMWJhMzQ2YjYyYzBlNjJmYjJiODYi.YHgGbQ.LtlQp5D2cOjKaJ1wj_FN04k3BAQ\", \"name\": \"SIMAX18T\", \"check_period\": \"7200\", \"new_version_check_period\": \"\", \"allow_upgrade\": \"y\", \"check_piracy\": \"y\", \"upgrade_limit\": \"\", \"upgrade_mode\": \"y\", \"auto_upgrade_begin_time\": \"2021-04-15 17:25:01\", \"auto_upgrade_end_time\": \"2021-04-22 17:25:01\", \"low_flow_upgrade\": \"y\", \"wifi_clientless_upgrade\": \"y\", \"description\": \"\"}', '2021-04-15 17:27:12', 28, 'http://172.28.3.4:5000/devicemodelmodelview/add', '/devicemodelmodelview/add');
INSERT INTO `logs` VALUES (37, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:27:17', 39, 'http://172.28.3.4:5000/devicemodelmodelview/add', '/dictionarymodelview/list/');
INSERT INTO `logs` VALUES (38, 'add', 1, NULL, NULL, '{}', '2021-04-15 17:27:18', 24, 'http://172.28.3.4:5000/dictionarymodelview/list/', '/dictionarymodelview/add');
INSERT INTO `logs` VALUES (39, 'add', 1, NULL, NULL, '{\"csrf_token\": \"IjE3ZmIzNmJhODI2MTAyZGY1MTAxMWJhMzQ2YjYyYzBlNjJmYjJiODYi.YHgG9g.zIWlmzwa-LUi8gZhyGSaxStqux8\", \"name\": \"\\u8bbe\\u5907\\u578b\\u53f7\\u5347\\u7ea7\\u68c0\\u6d4b\\u65b9\\u5f0f\", \"code\": \"device_model_check_mode\", \"description\": \"\"}', '2021-04-15 17:28:10', 19, 'http://172.28.3.4:5000/dictionarymodelview/add', '/dictionarymodelview/add');
INSERT INTO `logs` VALUES (40, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:28:10', 38, 'http://172.28.3.4:5000/dictionarymodelview/add', '/dictionarymodelview/list/');
INSERT INTO `logs` VALUES (41, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:28:14', 39, 'http://172.28.3.4:5000/dictionarymodelview/list/', '/dictionaryitemmodelview/list/');
INSERT INTO `logs` VALUES (42, 'add', 1, NULL, NULL, '{}', '2021-04-15 17:28:15', 28, 'http://172.28.3.4:5000/dictionaryitemmodelview/list/', '/dictionaryitemmodelview/add');
INSERT INTO `logs` VALUES (43, 'add', 1, NULL, NULL, '{\"csrf_token\": \"IjE3ZmIzNmJhODI2MTAyZGY1MTAxMWJhMzQ2YjYyYzBlNjJmYjJiODYi.YHgHLw.Si_cguCJJbwwSLiNvugY1T1FzVs\", \"dictionary\": \"1\", \"name\": \"https\", \"code\": \"https\", \"value\": \"\", \"ranking\": \"\", \"description\": \"\"}', '2021-04-15 17:28:33', 18, 'http://172.28.3.4:5000/dictionaryitemmodelview/add', '/dictionaryitemmodelview/add');
INSERT INTO `logs` VALUES (44, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:28:33', 50, 'http://172.28.3.4:5000/dictionaryitemmodelview/add', '/dictionaryitemmodelview/list/');
INSERT INTO `logs` VALUES (45, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:28:36', 43, 'http://172.28.3.4:5000/dictionaryitemmodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (46, 'add', 1, NULL, NULL, '{}', '2021-04-15 17:28:37', 25, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/add');
INSERT INTO `logs` VALUES (47, 'add', 1, NULL, NULL, '{\"csrf_token\": \"IjE3ZmIzNmJhODI2MTAyZGY1MTAxMWJhMzQ2YjYyYzBlNjJmYjJiODYi.YHgHRQ.y-VMB6AcBKdpMdcPyiYq0fgFZug\", \"name\": \"SIMAX18T\", \"check_mode\": \"1\", \"check_period\": \"7200\", \"new_version_check_period\": \"\", \"allow_upgrade\": \"y\", \"check_piracy\": \"y\", \"upgrade_limit\": \"\", \"upgrade_mode\": \"y\", \"auto_upgrade_begin_time\": \"2021-04-15 17:28:37\", \"auto_upgrade_end_time\": \"2021-04-22 17:28:37\", \"description\": \"\"}', '2021-04-15 17:28:57', 17, 'http://172.28.3.4:5000/devicemodelmodelview/add', '/devicemodelmodelview/add');
INSERT INTO `logs` VALUES (48, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:28:57', 76, 'http://172.28.3.4:5000/devicemodelmodelview/add', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (49, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 17:29:02', 47, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (50, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\"}', '2021-04-15 17:29:37', 24, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (51, 'add', 1, NULL, NULL, '{\"csrf_token\": \"IjE3ZmIzNmJhODI2MTAyZGY1MTAxMWJhMzQ2YjYyYzBlNjJmYjJiODYi.YHgHgA.YfK1iFvcP_08ZDFT4VEWoauH2jw\", \"version\": \"V1.0\", \"display_version\": \"V1.0\", \"force_upgrade\": \"y\", \"start_dttm\": \"\", \"upgrade_limit\": \"\", \"daily_upgrade_limit\": \"\", \"version_upgrade_scope\": \"\", \"area_upgrade_scope\": \"\", \"file_md5\": \"efsfsd\", \"english_release_notes\": \"\", \"traditional_release_notes\": \"\", \"release_notes\": \"sdsadas\", \"_flt_0_device_model\": \"1\"}', '2021-04-15 17:30:31', 50, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=1', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (52, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 17:30:31', 34, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=1', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (53, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\"}', '2021-04-15 17:32:53', 37, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (54, 'add', 1, NULL, NULL, '{\"csrf_token\": \"IjE3ZmIzNmJhODI2MTAyZGY1MTAxMWJhMzQ2YjYyYzBlNjJmYjJiODYi.YHgIRA.gRbVpSYlRhRyC6mrfWS0Aq6ADeo\", \"version\": \"V1.0\", \"display_version\": \"V1.0\", \"force_upgrade\": \"y\", \"start_dttm\": \"\", \"upgrade_limit\": \"\", \"daily_upgrade_limit\": \"\", \"version_upgrade_scope\": \"\", \"area_upgrade_scope\": \"\", \"file_md5\": \"efsfsd\", \"english_release_notes\": \"\", \"traditional_release_notes\": \"\", \"release_notes\": \"sdsadas\", \"_flt_0_device_model\": \"1\"}', '2021-04-15 17:32:55', 5, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=1', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (55, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 17:32:55', 38, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=1', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (56, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\"}', '2021-04-15 17:33:37', 24, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (57, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:33:42', 45, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=1', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (58, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:33:46', 44, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (59, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 17:33:47', 35, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (60, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 17:34:24', 121, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (61, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\"}', '2021-04-15 17:34:30', 31, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (62, 'add', 1, NULL, NULL, '{\"csrf_token\": \"IjE3ZmIzNmJhODI2MTAyZGY1MTAxMWJhMzQ2YjYyYzBlNjJmYjJiODYi.YHgIpQ.--NMvvXYF_TjoCS0_lWacJSCsA0\", \"version\": \"V1.0\", \"display_version\": \"\", \"force_upgrade\": \"y\", \"start_dttm\": \"\", \"upgrade_limit\": \"\", \"daily_upgrade_limit\": \"\", \"version_upgrade_scope\": \"\", \"area_upgrade_scope\": \"\", \"file_md5\": \"efsfsd\", \"english_release_notes\": \"\", \"traditional_release_notes\": \"\", \"release_notes\": \"test\", \"_flt_0_device_model\": \"1\"}', '2021-04-15 17:34:50', 6, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=1', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (63, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 17:34:50', 43, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=1', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (64, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\"}', '2021-04-15 17:36:45', 95, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (65, 'add', 1, NULL, NULL, '{\"csrf_token\": \"IjE3ZmIzNmJhODI2MTAyZGY1MTAxMWJhMzQ2YjYyYzBlNjJmYjJiODYi.YHgJLA.9YBGzb-Aj26fjZ8T4_btzHktkVE\", \"version\": \"V1.0\", \"display_version\": \"\", \"force_upgrade\": \"y\", \"start_dttm\": \"\", \"upgrade_limit\": \"\", \"daily_upgrade_limit\": \"\", \"version_upgrade_scope\": \"\", \"area_upgrade_scope\": \"\", \"file_md5\": \"est\", \"english_release_notes\": \"\", \"traditional_release_notes\": \"\", \"release_notes\": \"test\", \"_flt_0_device_model\": \"1\"}', '2021-04-15 17:37:07', 7, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=1', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (66, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\"}', '2021-04-15 17:39:02', 25, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (67, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\"}', '2021-04-15 17:39:07', 25, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (68, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\"}', '2021-04-15 17:39:22', 24, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (69, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:41:26', 55, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=1', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (70, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 17:41:33', 44, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (71, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\"}', '2021-04-15 17:41:41', 25, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (72, 'add', 1, NULL, NULL, '{\"csrf_token\": \"IjE3ZmIzNmJhODI2MTAyZGY1MTAxMWJhMzQ2YjYyYzBlNjJmYjJiODYi.YHgKVA.mVreN2pBPTNgyBl8vQudvEcce3o\", \"version\": \"V1.0\", \"display_version\": \"\", \"force_upgrade\": \"y\", \"start_dttm\": \"\", \"upgrade_limit\": \"\", \"daily_upgrade_limit\": \"\", \"version_upgrade_scope\": \"\", \"area_upgrade_scope\": \"\", \"file_md5\": \"efsfsd\", \"english_release_notes\": \"\", \"traditional_release_notes\": \"\", \"release_notes\": \"test\", \"_flt_0_device_model\": \"1\"}', '2021-04-15 17:41:58', 5, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=1', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (73, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 17:41:59', 68, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=1', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (74, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\"}', '2021-04-15 17:43:56', 40, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (75, 'add', 1, NULL, NULL, '{\"csrf_token\": \"IjE3ZmIzNmJhODI2MTAyZGY1MTAxMWJhMzQ2YjYyYzBlNjJmYjJiODYi.YHgK3A.kArczClfF6QiN03QDDHARoXLifo\", \"version\": \"V1.0\", \"display_version\": \"\", \"force_upgrade\": \"y\", \"start_dttm\": \"\", \"upgrade_limit\": \"\", \"daily_upgrade_limit\": \"\", \"version_upgrade_scope\": \"\", \"area_upgrade_scope\": \"\", \"file_md5\": \"efsfsd\", \"english_release_notes\": \"\", \"traditional_release_notes\": \"\", \"release_notes\": \"test\", \"_flt_0_device_model\": \"1\"}', '2021-04-15 17:43:58', 5, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=1', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (76, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 17:43:58', 49, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=1', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (77, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 17:44:15', 121, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=1', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (78, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 17:44:16', 35, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (79, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\"}', '2021-04-15 17:44:17', 32, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (80, 'add', 1, NULL, NULL, '{\"csrf_token\": \"IjE3ZmIzNmJhODI2MTAyZGY1MTAxMWJhMzQ2YjYyYzBlNjJmYjJiODYi.YHgK8Q.-3G8_ubVCfaXwQ41kw9ruTyWD24\", \"version\": \"V1.0\", \"display_version\": \"\", \"force_upgrade\": \"y\", \"start_dttm\": \"\", \"upgrade_limit\": \"\", \"daily_upgrade_limit\": \"\", \"version_upgrade_scope\": \"\", \"area_upgrade_scope\": \"\", \"file_md5\": \"test\", \"english_release_notes\": \"\", \"traditional_release_notes\": \"\", \"release_notes\": \"test\", \"_flt_0_device_model\": \"1\"}', '2021-04-15 17:44:34', 21, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=1', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (81, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 17:44:34', 35, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=1', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (82, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\"}', '2021-04-15 17:44:40', 25, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (83, 'add', 1, NULL, NULL, '{\"csrf_token\": \"IjE3ZmIzNmJhODI2MTAyZGY1MTAxMWJhMzQ2YjYyYzBlNjJmYjJiODYi.YHgLBw.bai1p2-38Kt0NROzP-AzRdLBLls\", \"version\": \"V1.0\", \"display_version\": \"\", \"force_upgrade\": \"y\", \"start_dttm\": \"\", \"upgrade_limit\": \"\", \"daily_upgrade_limit\": \"\", \"version_upgrade_scope\": \"\", \"area_upgrade_scope\": \"\", \"file_md5\": \"test\", \"english_release_notes\": \"\", \"traditional_release_notes\": \"\", \"release_notes\": \"test\", \"_flt_0_device_model\": \"1\"}', '2021-04-15 17:47:29', 25, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=1', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (84, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 17:47:29', 122, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=1', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (85, 'show', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\", \"pk\": \"1\"}', '2021-04-15 17:47:45', 26, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/romsoftwaremodelview/show/1');
INSERT INTO `logs` VALUES (86, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 17:47:53', 39, 'http://172.28.3.4:5000/romsoftwaremodelview/show/1?_flt_0_device_model=1', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (87, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 17:54:31', 121, 'http://172.28.3.4:5000/romsoftwaremodelview/show/1?_flt_0_device_model=1', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (88, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 17:54:33', 41, 'http://172.28.3.4:5000/romsoftwaremodelview/show/1?_flt_0_device_model=1', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (89, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 17:54:56', 36, 'http://172.28.3.4:5000/romsoftwaremodelview/show/1?_flt_0_device_model=1', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (90, 'show', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\", \"pk\": \"1\"}', '2021-04-15 17:55:35', 27, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/romsoftwaremodelview/show/1');
INSERT INTO `logs` VALUES (91, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 17:57:02', 40, 'http://172.28.3.4:5000/romsoftwaremodelview/show/1?_flt_0_device_model=1', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (92, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\", \"pk\": \"1\"}', '2021-04-15 17:57:05', 36, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/romsoftwaremodelview/edit/1');
INSERT INTO `logs` VALUES (93, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 17:57:10', 39, 'http://172.28.3.4:5000/romsoftwaremodelview/edit/1?_flt_0_device_model=1', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (94, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:57:20', 46, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/dictionaryitemmodelview/list/');
INSERT INTO `logs` VALUES (95, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:57:23', 43, 'http://172.28.3.4:5000/dictionaryitemmodelview/list/', '/dictionarymodelview/list/');
INSERT INTO `logs` VALUES (96, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:57:24', 58, 'http://172.28.3.4:5000/dictionarymodelview/list/', '/dictionaryitemmodelview/list/');
INSERT INTO `logs` VALUES (97, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:57:26', 39, 'http://172.28.3.4:5000/dictionaryitemmodelview/list/', '/dictionarymodelview/list/');
INSERT INTO `logs` VALUES (98, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:57:29', 34, 'http://172.28.3.4:5000/dictionarymodelview/list/', '/logmodelview/list/');
INSERT INTO `logs` VALUES (99, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:57:31', 40, 'http://172.28.3.4:5000/logmodelview/list/', '/dictionaryitemmodelview/list/');
INSERT INTO `logs` VALUES (100, 'list', 1, NULL, NULL, '{}', '2021-04-15 17:58:16', 37, 'http://172.28.3.4:5000/dictionaryitemmodelview/list/', '/dictionarymodelview/list/');
INSERT INTO `logs` VALUES (101, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 17:58:28', 25, 'http://172.28.3.4:5000/dictionarymodelview/list/', '/dictionarymodelview/show/1');
INSERT INTO `logs` VALUES (102, 'list', 1, NULL, NULL, '{}', '2021-04-15 18:00:10', 44, 'http://172.28.3.4:5000/dictionarymodelview/show/1', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (103, 'edit', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 18:00:15', 36, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/edit/1');
INSERT INTO `logs` VALUES (104, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\", \"pk\": \"1\"}', '2021-04-15 18:00:20', 26, 'http://172.28.3.4:5000/devicemodelmodelview/edit/1', '/romsoftwaremodelview/edit/1');
INSERT INTO `logs` VALUES (105, 'edit', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 18:00:31', 38, 'http://172.28.3.4:5000/romsoftwaremodelview/edit/1?_flt_0_device_model=1', '/devicemodelmodelview/edit/1');
INSERT INTO `logs` VALUES (106, 'show', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\", \"pk\": \"1\"}', '2021-04-15 18:00:36', 27, 'http://172.28.3.4:5000/devicemodelmodelview/edit/1', '/romsoftwaremodelview/show/1');
INSERT INTO `logs` VALUES (107, 'edit', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 18:00:51', 41, 'http://172.28.3.4:5000/romsoftwaremodelview/show/1?_flt_0_device_model=1', '/devicemodelmodelview/edit/1');
INSERT INTO `logs` VALUES (108, 'edit', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 18:01:10', 36, 'http://172.28.3.4:5000/romsoftwaremodelview/show/1?_flt_0_device_model=1', '/devicemodelmodelview/edit/1');
INSERT INTO `logs` VALUES (109, 'show', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\", \"pk\": \"1\"}', '2021-04-15 18:01:14', 28, 'http://172.28.3.4:5000/devicemodelmodelview/edit/1', '/romsoftwaremodelview/show/1');
INSERT INTO `logs` VALUES (110, 'edit', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 18:01:17', 41, 'http://172.28.3.4:5000/romsoftwaremodelview/show/1?_flt_0_device_model=1', '/devicemodelmodelview/edit/1');
INSERT INTO `logs` VALUES (111, 'show', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\", \"pk\": \"1\"}', '2021-04-15 18:01:37', 101, 'http://172.28.3.4:5000/devicemodelmodelview/edit/1', '/romsoftwaremodelview/show/1');
INSERT INTO `logs` VALUES (112, 'show', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\", \"pk\": \"1\"}', '2021-04-15 18:01:40', 26, 'http://172.28.3.4:5000/devicemodelmodelview/edit/1', '/romsoftwaremodelview/show/1');
INSERT INTO `logs` VALUES (113, 'edit', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 18:01:45', 94, 'http://172.28.3.4:5000/romsoftwaremodelview/show/1?_flt_0_device_model=1', '/devicemodelmodelview/edit/1');
INSERT INTO `logs` VALUES (114, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\", \"pk\": \"1\"}', '2021-04-15 18:01:47', 28, 'http://172.28.3.4:5000/devicemodelmodelview/edit/1', '/romsoftwaremodelview/edit/1');
INSERT INTO `logs` VALUES (115, 'edit', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 18:02:02', 39, 'http://172.28.3.4:5000/romsoftwaremodelview/edit/1?_flt_0_device_model=1', '/devicemodelmodelview/edit/1');
INSERT INTO `logs` VALUES (116, 'list', 1, NULL, NULL, '{}', '2021-04-15 18:02:33', 91, 'http://172.28.3.4:5000/devicemodelmodelview/edit/1', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (117, 'list', 1, NULL, NULL, '{}', '2021-04-15 18:02:37', 38, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/dictionarymodelview/list/');
INSERT INTO `logs` VALUES (118, 'list', 1, NULL, NULL, '{}', '2021-04-15 18:02:39', 46, 'http://172.28.3.4:5000/dictionarymodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (119, 'list', 1, NULL, NULL, '{}', '2021-04-15 18:02:48', 89, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (120, 'edit', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 18:02:51', 53, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/edit/1');
INSERT INTO `logs` VALUES (121, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"IjE3ZmIzNmJhODI2MTAyZGY1MTAxMWJhMzQ2YjYyYzBlNjJmYjJiODYi.YHgPSw.ECxDRJox78u8IIz5XLBURYeKEAY\", \"name\": \"SIMAX18T\", \"check_mode\": \"1\", \"check_period\": \"7200\", \"new_version_check_period\": \"\", \"upgrade_limit\": \"\", \"auto_upgrade_begin_time\": \"2021-04-15 17:28:37\", \"auto_upgrade_end_time\": \"2021-04-22 17:28:37\", \"description\": \"\", \"pk\": \"1\"}', '2021-04-15 18:03:04', 28, 'http://172.28.3.4:5000/devicemodelmodelview/edit/1', '/devicemodelmodelview/edit/1');
INSERT INTO `logs` VALUES (122, 'list', 1, NULL, NULL, '{}', '2021-04-15 18:03:04', 68, 'http://172.28.3.4:5000/devicemodelmodelview/edit/1', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (123, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 18:04:50', 36, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (124, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 18:08:53', 37, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (125, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-15 18:09:48', 46, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (126, 'list', 1, NULL, NULL, '{}', '2021-04-24 17:47:08', 103, 'http://172.28.3.4:5000/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (127, 'list', 1, NULL, NULL, '{}', '2021-04-24 17:47:10', 45, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (128, 'list', 1, NULL, NULL, '{}', '2021-04-24 17:52:12', 125, 'http://172.28.3.4:5000/devicestatemodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (129, 'edit', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-24 17:55:57', 124, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/edit/1');
INSERT INTO `logs` VALUES (130, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\"}', '2021-04-24 17:56:03', 35, 'http://172.28.3.4:5000/devicemodelmodelview/edit/1', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (131, 'add', 1, NULL, NULL, '{\"csrf_token\": \"ImM2YzE5NDU4NmFlYTZmYzY1YzVkNjZjMDVmMWEzZGNkYjVhNDdlMjIi.YIPrMg.DMzTYdmkOJHRuR-e7FGAGIoIp6U\", \"version\": \"V1.0\", \"display_version\": \"\", \"upgrade_type\": \"\", \"status\": \"0\", \"start_datetime\": \"\", \"upgrade_limit\": \"\", \"daily_upgrade_limit\": \"\", \"version_range\": \"\", \"area_range\": \"\", \"file_md5\": \"test\", \"description\": \"test\", \"english_description\": \"\", \"traditional_description\": \"\", \"_flt_0_device_model\": \"1\"}', '2021-04-24 17:56:33', 6105, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=1', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (132, 'edit', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-24 17:56:33', 45, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=1', '/devicemodelmodelview/edit/1');
INSERT INTO `logs` VALUES (133, 'edit', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-24 17:58:41', 124, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=1', '/devicemodelmodelview/edit/1');
INSERT INTO `logs` VALUES (134, 'edit', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-24 17:58:52', 38, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=1', '/devicemodelmodelview/edit/1');
INSERT INTO `logs` VALUES (135, 'edit', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-25 13:24:04', 125, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=1', '/devicemodelmodelview/edit/1');
INSERT INTO `logs` VALUES (136, 'edit', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-25 13:24:22', 38, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=1', '/devicemodelmodelview/edit/1');
INSERT INTO `logs` VALUES (137, 'delete', 1, NULL, NULL, '{\"delete\": \"\", \"pk\": \"1\"}', '2021-04-25 13:24:26', 17, 'http://172.28.3.4:5000/devicemodelmodelview/edit/1', '/romsoftwaremodelview/delete/1');
INSERT INTO `logs` VALUES (138, 'edit', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-25 13:24:26', 49, 'http://172.28.3.4:5000/devicemodelmodelview/edit/1', '/devicemodelmodelview/edit/1');
INSERT INTO `logs` VALUES (139, 'list', 1, NULL, NULL, '{}', '2021-04-25 14:00:47', 50, 'http://172.28.3.4:5000/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (140, 'list', 1, NULL, NULL, '{}', '2021-04-25 14:01:19', 65, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (141, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-25 14:01:22', 89, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (142, 'list', 1, NULL, NULL, '{}', '2021-04-25 14:02:22', 51, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (143, 'add', 1, NULL, NULL, '{}', '2021-04-25 14:02:23', 30, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/add');
INSERT INTO `logs` VALUES (144, 'list', 1, NULL, NULL, '{}', '2021-04-25 14:02:34', 46, 'http://172.28.3.4:5000/devicemodelmodelview/add', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (145, 'edit', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-25 14:02:38', 39, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/edit/1');
INSERT INTO `logs` VALUES (146, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"ImM2YzE5NDU4NmFlYTZmYzY1YzVkNjZjMDVmMWEzZGNkYjVhNDdlMjIi.YIUF_g.X6Wacy3luutFJ5AYYJ1T3eAGWq0\", \"name\": \"SIMAX18T\", \"check_mode\": \"1\", \"check_period\": \"7200\", \"new_version_check_period\": \"\", \"upgrade_limit\": \"\", \"upgrade_type\": \"\", \"description\": \"\", \"pk\": \"1\"}', '2021-04-25 14:02:40', 12, 'http://172.28.3.4:5000/devicemodelmodelview/edit/1', '/devicemodelmodelview/edit/1');
INSERT INTO `logs` VALUES (147, 'list', 1, NULL, NULL, '{}', '2021-04-25 14:02:40', 44, 'http://172.28.3.4:5000/devicemodelmodelview/edit/1', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (148, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-25 14:02:47', 37, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (149, 'list', 1, NULL, NULL, '{}', '2021-04-25 14:02:50', 48, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (150, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-25 14:02:53', 37, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (151, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\"}', '2021-04-25 14:02:54', 31, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (152, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-25 14:03:34', 44, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=1', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (153, 'list', 1, NULL, NULL, '{}', '2021-04-25 14:03:37', 46, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (154, 'list', 1, NULL, NULL, '{}', '2021-04-25 14:06:39', 48, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (155, 'list', 1, NULL, NULL, '{}', '2021-04-25 14:07:20', 48, 'http://172.28.3.4:5000/devicestatemodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (156, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-25 14:07:35', 36, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (157, 'list', 1, NULL, NULL, '{}', '2021-04-25 14:07:45', 48, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (158, 'edit', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-25 14:07:46', 38, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/edit/1');
INSERT INTO `logs` VALUES (159, 'list', 1, NULL, NULL, '{}', '2021-04-25 14:08:39', 45, 'http://172.28.3.4:5000/devicemodelmodelview/edit/1', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (160, 'list', 1, NULL, NULL, '{}', '2021-04-25 14:28:09', 45, 'http://172.28.3.4:5000/devicestatemodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (161, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-25 14:28:11', 36, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (162, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\"}', '2021-04-25 14:28:13', 29, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (163, 'add', 1, NULL, NULL, '{\"csrf_token\": \"ImM2YzE5NDU4NmFlYTZmYzY1YzVkNjZjMDVmMWEzZGNkYjVhNDdlMjIi.YIUL_Q.2ADvb7g1XDknZOEpL_8os4wI3Iw\", \"version\": \"V2.1\", \"display_version\": \"V2.1\", \"upgrade_type\": \"\", \"status\": \"1\", \"start_datetime\": \"2021-04-25 14:28:13\", \"upgrade_limit\": \"\", \"daily_upgrade_limit\": \"\", \"version_range\": \"\", \"area_range\": \"\", \"file_md5\": \"test\", \"description\": \"test\", \"english_description\": \"\", \"traditional_description\": \"\", \"_flt_0_device_model\": \"1\"}', '2021-04-25 14:29:00', 23, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=1', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (164, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-25 14:29:00', 35, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=1', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (165, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\"}', '2021-04-25 14:47:18', 28, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (166, 'list', 1, NULL, NULL, '{}', '2021-04-25 14:47:22', 44, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=1', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (167, 'add', 1, NULL, NULL, '{}', '2021-04-25 14:48:07', 27, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/add');
INSERT INTO `logs` VALUES (168, 'list', 1, NULL, NULL, '{}', '2021-04-25 14:50:23', 46, 'http://172.28.3.4:5000/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (169, 'list', 1, NULL, NULL, '{}', '2021-04-25 14:50:27', 48, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (170, 'list', 1, NULL, NULL, '{}', '2021-04-25 14:50:29', 43, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (171, 'list', 1, NULL, NULL, '{}', '2021-04-25 14:50:44', 49, 'http://172.28.3.4:5000/devicestatemodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (172, 'list', 1, NULL, NULL, '{}', '2021-04-25 14:51:02', 46, 'http://172.28.3.4:5000/permissions/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (173, 'edit', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-25 14:51:18', 39, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/edit/1');
INSERT INTO `logs` VALUES (174, 'list', 1, NULL, NULL, '{}', '2021-04-25 14:51:47', 49, 'http://172.28.3.4:5000/permissions/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (175, 'add', 1, NULL, NULL, '{}', '2021-04-25 14:51:49', 28, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/add');
INSERT INTO `logs` VALUES (176, 'list', 1, NULL, NULL, '{}', '2021-04-25 14:51:52', 43, 'http://172.28.3.4:5000/permissions/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (177, 'add', 1, NULL, NULL, '{}', '2021-04-25 14:51:56', 28, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/add');
INSERT INTO `logs` VALUES (178, 'add', 1, NULL, NULL, '{\"csrf_token\": \"ImQyM2I3MmFkMmMzMDgzM2JiODgzZThkYWM2YWE4OGI4MmVlN2UxZjUi.YIURiw.cMGx3IPQ5PBwNF7JbRCX2T_e5uk\", \"name\": \"SIMAX1800T\", \"check_mode\": \"1\", \"check_period\": \"7200\", \"new_version_check_period\": \"7200\", \"allow_upgrade\": \"y\", \"upgrade_limit\": \"10000\", \"upgrade_type\": \"1\", \"description\": \"test 1\"}', '2021-04-25 14:54:09', 17, 'http://172.28.3.4:5000/devicemodelmodelview/add', '/devicemodelmodelview/add');
INSERT INTO `logs` VALUES (179, 'list', 1, NULL, NULL, '{}', '2021-04-25 14:54:09', 55, 'http://172.28.3.4:5000/devicemodelmodelview/add', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (180, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-04-25 14:54:15', 37, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (181, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\"}', '2021-04-25 14:54:20', 27, 'http://172.28.3.4:5000/devicemodelmodelview/show/2', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (182, 'add', 1, NULL, NULL, '{\"csrf_token\": \"ImQyM2I3MmFkMmMzMDgzM2JiODgzZThkYWM2YWE4OGI4MmVlN2UxZjUi.YIUSGw.3ueVHJzPt9Ctz-EqeDELeqUU0EI\", \"version\": \"1.1.1.2\", \"display_version\": \"1.1.1.2\", \"upgrade_type\": \"1\", \"status\": \"0\", \"start_datetime\": \"2021-04-25 14:54:18\", \"upgrade_limit\": \"10000\", \"daily_upgrade_limit\": \"10000\", \"version_range\": \"\", \"area_range\": \"\", \"file_md5\": \"2d36a033b9fc59cf567d12ff912e5048\", \"description\": \"version 1.1.1.2\", \"english_description\": \"version 1.1.1.2\", \"traditional_description\": \"version 1.1.1.2\", \"_flt_0_device_model\": \"2\"}', '2021-04-25 14:58:05', 16, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=2', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (183, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-04-25 14:58:05', 36, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=2', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (184, 'show', 1, NULL, NULL, '{\"_oc_RomSoftwareModelView\": \"status\", \"_od_RomSoftwareModelView\": \"asc\", \"pk\": \"2\"}', '2021-04-25 14:58:17', 38, 'http://172.28.3.4:5000/devicemodelmodelview/show/2', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (185, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-04-25 14:58:22', 38, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=2', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (186, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"3\"}', '2021-04-25 15:10:15', 29, 'http://172.28.3.4:5000/devicemodelmodelview/show/2', '/romsoftwaremodelview/edit/3');
INSERT INTO `logs` VALUES (187, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-04-25 15:10:34', 39, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=2', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (188, 'list', 1, NULL, NULL, '{}', '2021-04-25 15:14:26', 56, 'http://172.28.3.4:5000/devicemodelmodelview/add', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (189, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-04-25 15:14:35', 37, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (190, 'show', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"3\"}', '2021-04-25 15:14:38', 28, 'http://172.28.3.4:5000/devicemodelmodelview/show/2', '/romsoftwaremodelview/show/3');
INSERT INTO `logs` VALUES (191, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-04-25 15:15:17', 42, 'http://172.28.3.4:5000/romsoftwaremodelview/show/3?_flt_0_device_model=2', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (192, 'list', 1, NULL, NULL, '{}', '2021-04-25 17:49:44', 50, 'http://172.28.3.4:5000/devicemodelmodelview/show/2', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (193, 'edit', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-25 17:49:47', 39, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/edit/1');
INSERT INTO `logs` VALUES (194, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"ImM2YzE5NDU4NmFlYTZmYzY1YzVkNjZjMDVmMWEzZGNkYjVhNDdlMjIi.YIU7Ow.gt1vALCvmjRT92eG3PT2ORn-tZ0\", \"name\": \"SIMAX18T\", \"check_mode\": \"1\", \"check_period\": \"7200\", \"new_version_check_period\": \"7200\", \"upgrade_limit\": \"\", \"upgrade_type\": \"\", \"description\": \"\", \"pk\": \"1\"}', '2021-04-25 17:49:57', 27, 'http://172.28.3.4:5000/devicemodelmodelview/edit/1', '/devicemodelmodelview/edit/1');
INSERT INTO `logs` VALUES (195, 'list', 1, NULL, NULL, '{}', '2021-04-25 17:49:57', 67, 'http://172.28.3.4:5000/devicemodelmodelview/edit/1', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (196, 'edit', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-25 17:50:00', 38, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/edit/1');
INSERT INTO `logs` VALUES (197, 'list', 1, NULL, NULL, '{}', '2021-04-25 17:50:16', 79, 'http://172.28.3.4:5000/devicemodelmodelview/edit/1', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (198, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-04-25 17:50:18', 41, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (199, 'list', 1, NULL, NULL, '{}', '2021-04-25 17:50:25', 48, 'http://172.28.3.4:5000/devicemodelmodelview/edit/2', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (200, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-04-25 17:51:57', 77, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (201, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"3\"}', '2021-04-25 17:52:00', 28, 'http://172.28.3.4:5000/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/3');
INSERT INTO `logs` VALUES (202, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"3\"}', '2021-04-25 17:54:12', 104, 'http://172.28.3.4:5000/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/3');
INSERT INTO `logs` VALUES (203, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"ImM2YzE5NDU4NmFlYTZmYzY1YzVkNjZjMDVmMWEzZGNkYjVhNDdlMjIi.YIU8Qw.1s-RR3blr0ilBNtRaJe09sBnm2c\", \"version\": \"1.1.1.2\", \"display_version\": \"1.1.1.2\", \"upgrade_type\": \"1\", \"status\": \"0\", \"start_datetime\": \"2021-04-25 14:54:18\", \"upgrade_limit\": \"10000\", \"daily_upgrade_limit\": \"10000\", \"version_range\": \"\", \"area_range\": \"\", \"file_size\": \"0\", \"file_md5\": \"2d36a033b9fc59cf567d12ff912e5048\", \"description\": \"version 1.1.1.2\", \"english_description\": \"version 1.1.1.2\", \"traditional_description\": \"version 1.1.1.2\", \"_flt_0_device_model\": \"2\", \"pk\": \"3\"}', '2021-04-25 17:54:17', 36, 'http://172.28.3.4:5000/romsoftwaremodelview/edit/3?_flt_0_device_model=2', '/romsoftwaremodelview/edit/3');
INSERT INTO `logs` VALUES (204, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-04-25 17:54:25', 54, 'http://172.28.3.4:5000/romsoftwaremodelview/edit/3?_flt_0_device_model=2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (205, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"3\"}', '2021-04-25 17:54:28', 29, 'http://172.28.3.4:5000/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/3');
INSERT INTO `logs` VALUES (206, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-04-25 17:54:34', 42, 'http://172.28.3.4:5000/romsoftwaremodelview/edit/3?_flt_0_device_model=2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (207, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-04-25 17:54:46', 38, 'http://172.28.3.4:5000/romsoftwaremodelview/edit/3?_flt_0_device_model=2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (208, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-04-25 17:54:47', 56, 'http://172.28.3.4:5000/romsoftwaremodelview/edit/3?_flt_0_device_model=2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (209, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"3\"}', '2021-04-25 17:54:49', 29, 'http://172.28.3.4:5000/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/3');
INSERT INTO `logs` VALUES (210, 'list', 1, NULL, NULL, '{}', '2021-04-25 17:55:14', 50, 'http://172.28.3.4:5000/romsoftwaremodelview/edit/3?_flt_0_device_model=2', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (211, 'list', 1, NULL, NULL, '{}', '2021-04-25 17:55:15', 50, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (212, 'list', 1, NULL, NULL, '{}', '2021-04-25 17:55:17', 51, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (213, 'list', 1, NULL, NULL, '{}', '2021-04-25 17:55:21', 46, 'http://172.28.3.4:5000/devicestatemodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (214, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-04-25 17:55:22', 38, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (215, 'show', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"3\"}', '2021-04-25 17:55:25', 38, 'http://172.28.3.4:5000/devicemodelmodelview/edit/2', '/romsoftwaremodelview/show/3');
INSERT INTO `logs` VALUES (216, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-04-25 17:57:30', 42, 'http://172.28.3.4:5000/romsoftwaremodelview/show/3?_flt_0_device_model=2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (217, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"3\"}', '2021-04-25 17:57:32', 28, 'http://172.28.3.4:5000/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/3');
INSERT INTO `logs` VALUES (218, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-04-25 17:57:33', 46, 'http://172.28.3.4:5000/romsoftwaremodelview/edit/3?_flt_0_device_model=2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (219, 'list', 1, NULL, NULL, '{}', '2021-04-25 17:57:38', 46, 'http://172.28.3.4:5000/devicemodelmodelview/edit/2', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (220, 'list', 1, NULL, NULL, '{}', '2021-04-25 17:57:40', 47, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (221, 'list', 1, NULL, NULL, '{}', '2021-04-25 17:57:48', 46, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (222, 'list', 1, NULL, NULL, '{}', '2021-04-25 17:57:52', 45, 'http://172.28.3.4:5000/devicestatemodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (223, 'list', 1, NULL, NULL, '{}', '2021-04-25 17:57:55', 44, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (224, 'list', 1, NULL, NULL, '{}', '2021-04-25 17:58:35', 48, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (225, 'list', 1, NULL, NULL, '{}', '2021-04-25 17:58:42', 47, 'http://172.28.3.4:5000/devicestatemodelview/list/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (226, 'list', 1, NULL, NULL, '{}', '2021-04-25 17:58:45', 47, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (227, 'list', 1, NULL, NULL, '{}', '2021-04-25 17:58:46', 47, 'http://172.28.3.4:5000/devicestatemodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (228, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-25 17:58:50', 37, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (229, 'show', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\", \"pk\": \"2\"}', '2021-04-25 17:58:54', 30, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/romsoftwaremodelview/show/2');
INSERT INTO `logs` VALUES (230, 'list', 1, NULL, NULL, '{}', '2021-04-25 17:59:42', 45, 'http://172.28.3.4:5000/romsoftwaremodelview/show/2?_flt_0_device_model=1', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (231, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-25 17:59:46', 29, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/deviceinstancemodelview/show/1');
INSERT INTO `logs` VALUES (232, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-25 18:01:45', 103, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/deviceinstancemodelview/show/1');
INSERT INTO `logs` VALUES (233, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-25 18:01:47', 30, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/deviceinstancemodelview/show/1');
INSERT INTO `logs` VALUES (234, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-25 18:01:48', 29, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/deviceinstancemodelview/show/1');
INSERT INTO `logs` VALUES (235, 'list', 1, NULL, NULL, '{}', '2021-04-25 18:02:03', 56, 'http://172.28.3.4:5000/deviceinstancemodelview/show/1', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (236, 'list', 1, NULL, NULL, '{}', '2021-04-25 18:02:07', 45, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (237, 'list', 1, NULL, NULL, '{}', '2021-04-25 18:02:10', 43, 'http://172.28.3.4:5000/devicestatemodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (238, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-25 18:02:13', 54, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (239, 'show', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\", \"pk\": \"2\"}', '2021-04-25 18:02:17', 31, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/romsoftwaremodelview/show/2');
INSERT INTO `logs` VALUES (240, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-25 18:04:38', 41, 'http://172.28.3.4:5000/romsoftwaremodelview/show/2?_flt_0_device_model=1', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (241, 'list', 1, NULL, NULL, '{}', '2021-04-25 18:05:10', 49, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (242, 'list', 1, NULL, NULL, '{}', '2021-04-25 18:05:13', 51, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (243, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-25 18:05:18', 28, 'http://172.28.3.4:5000/devicestatemodelview/list/', '/devicestatemodelview/show/1');
INSERT INTO `logs` VALUES (244, 'list', 1, NULL, NULL, '{}', '2021-04-25 18:05:21', 48, 'http://172.28.3.4:5000/devicestatemodelview/show/1', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (245, 'show', 1, NULL, NULL, '{\"pk\": \"4\"}', '2021-04-25 18:05:24', 32, 'http://172.28.3.4:5000/devicestatemodelview/list/', '/devicestatemodelview/show/4');
INSERT INTO `logs` VALUES (246, 'list', 1, NULL, NULL, '{}', '2021-04-25 18:05:27', 52, 'http://172.28.3.4:5000/devicestatemodelview/show/4', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (247, 'list', 1, NULL, NULL, '{}', '2021-04-25 18:05:32', 49, 'http://172.28.3.4:5000/devicestatemodelview/list/', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (248, 'list', 1, NULL, NULL, '{}', '2021-04-25 18:05:34', 46, 'http://172.28.3.4:5000/devicestatemodelview/list/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (249, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-04-25 18:05:36', 30, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/deviceinstancemodelview/show/2');
INSERT INTO `logs` VALUES (250, 'list', 1, NULL, NULL, '{}', '2021-04-25 18:05:54', 47, 'http://172.28.3.4:5000/deviceinstancemodelview/show/2', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (251, 'list', 1, NULL, NULL, '{}', '2021-04-25 18:06:02', 51, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (252, 'list', 1, NULL, NULL, '{}', '2021-04-25 18:06:08', 45, 'http://172.28.3.4:5000/devicestatemodelview/list/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (253, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-04-25 18:06:42', 29, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/deviceinstancemodelview/show/1');
INSERT INTO `logs` VALUES (254, 'list', 1, NULL, NULL, '{}', '2021-04-25 18:06:50', 46, 'http://172.28.3.4:5000/deviceinstancemodelview/show/1', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (255, 'list', 1, NULL, NULL, '{}', '2021-04-25 18:08:03', 45, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (256, 'list', 1, NULL, NULL, '{}', '2021-04-25 18:08:07', 49, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (257, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-04-25 18:08:09', 28, 'http://172.28.3.4:5000/devicestatemodelview/list/', '/devicestatemodelview/show/2');
INSERT INTO `logs` VALUES (258, 'list', 1, NULL, NULL, '{}', '2021-04-25 18:08:27', 48, 'http://172.28.3.4:5000/devicestatemodelview/show/2', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (259, 'list', 1, NULL, NULL, '{}', '2021-04-25 18:15:16', 125, 'http://172.28.3.4:5000/devicestatemodelview/show/2', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (260, 'list', 1, NULL, NULL, '{}', '2021-04-25 18:15:19', 52, 'http://172.28.3.4:5000/devicestatemodelview/show/2', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (261, 'list', 1, NULL, NULL, '{}', '2021-04-25 18:15:32', 45, 'http://172.28.3.4:5000/devicestatemodelview/list/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (262, 'list', 1, NULL, NULL, '{}', '2021-04-25 18:15:38', 45, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (263, 'list', 1, NULL, NULL, '{}', '2021-04-25 18:15:47', 46, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (264, 'list', 1, NULL, NULL, '{}', '2021-04-25 18:15:50', 62, 'http://172.28.3.4:5000/devicestatemodelview/list/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (265, 'list', 1, NULL, NULL, '{}', '2021-04-25 18:15:51', 47, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (266, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-04-25 18:29:17', 50, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (267, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"ImM2YzE5NDU4NmFlYTZmYzY1YzVkNjZjMDVmMWEzZGNkYjVhNDdlMjIi.YIVEfQ.RSxvi8yjf2NBJsR9LDhT7kAYjjY\", \"name\": \"SIMAX1800T\", \"check_mode\": \"1\", \"check_period\": \"7200\", \"new_version_check_period\": \"7200\", \"allow_upgrade\": \"y\", \"upgrade_limit\": \"10000\", \"upgrade_type\": \"1\", \"upgrade_rules\": \"00-24-f\", \"description\": \"test 1\", \"pk\": \"2\"}', '2021-04-25 18:29:42', 11, 'http://172.28.3.4:5000/devicemodelmodelview/edit/2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (268, 'list', 1, NULL, NULL, '{}', '2021-04-25 18:29:42', 42, 'http://172.28.3.4:5000/devicemodelmodelview/edit/2', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (269, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-04-25 18:29:47', 47, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (270, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"3\"}', '2021-04-25 20:24:58', 29, 'http://172.28.3.4:5000/devicemodelmodelview/show/2', '/romsoftwaremodelview/edit/3');
INSERT INTO `logs` VALUES (271, 'list', 1, NULL, NULL, '{}', '2021-04-25 20:25:03', 45, 'http://172.28.3.4:5000/romsoftwaremodelview/edit/3?_flt_0_device_model=2', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (272, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-04-25 20:25:07', 41, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (273, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"ImQyM2I3MmFkMmMzMDgzM2JiODgzZThkYWM2YWE4OGI4MmVlN2UxZjUi.YIVfog.16ztLK3ahGgDpKe9M3A6vPKzJig\", \"name\": \"SIMAX1800T\", \"check_mode\": \"1\", \"check_period\": \"7200\", \"new_version_check_period\": \"7200\", \"allow_upgrade\": \"y\", \"upgrade_limit\": \"10000\", \"upgrade_type\": \"1\", \"upgrade_rules\": \"01-05-f\", \"description\": \"test 1\", \"pk\": \"2\"}', '2021-04-25 20:25:32', 22, 'http://172.28.3.4:5000/devicemodelmodelview/edit/2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (274, 'list', 1, NULL, NULL, '{}', '2021-04-25 20:25:32', 44, 'http://172.28.3.4:5000/devicemodelmodelview/edit/2', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (275, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-04-25 20:31:04', 38, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (276, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"ImQyM2I3MmFkMmMzMDgzM2JiODgzZThkYWM2YWE4OGI4MmVlN2UxZjUi.YIVhCA.VTQyq3c9yTbivA1ymHoMX3YoCkA\", \"name\": \"SIMAX1800T\", \"check_mode\": \"1\", \"check_period\": \"7200\", \"new_version_check_period\": \"7200\", \"allow_upgrade\": \"y\", \"upgrade_limit\": \"10000\", \"upgrade_type\": \"1\", \"upgrade_rules\": \"0105f\", \"description\": \"test 1\", \"pk\": \"2\"}', '2021-04-25 20:31:11', 18, 'http://172.28.3.4:5000/devicemodelmodelview/edit/2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (277, 'list', 1, NULL, NULL, '{}', '2021-04-25 20:31:11', 55, 'http://172.28.3.4:5000/devicemodelmodelview/edit/2', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (278, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-04-26 19:15:08', 41, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (279, 'list', 1, NULL, NULL, '{}', '2021-04-26 19:15:14', 41, 'http://172.28.3.4:5000/devicemodelmodelview/show/2', '/logmodelview/list/');
INSERT INTO `logs` VALUES (280, 'show', 1, NULL, NULL, '{\"pk\": \"278\"}', '2021-04-26 19:15:19', 27, 'http://172.28.3.4:5000/logmodelview/list/', '/logmodelview/show/278');
INSERT INTO `logs` VALUES (281, 'list', 1, NULL, NULL, '{}', '2021-04-26 19:15:24', 40, 'http://172.28.3.4:5000/devicemodelmodelview/show/2', '/logmodelview/list/');
INSERT INTO `logs` VALUES (282, 'list', 1, NULL, NULL, '{}', '2021-04-27 20:09:04', 50, 'http://172.28.3.4:5000/permissions/list/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (283, 'list', 1, NULL, NULL, '{}', '2021-04-27 20:09:08', 46, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (284, 'list', 1, NULL, NULL, '{}', '2021-04-27 20:09:14', 43, 'http://172.28.3.4:5000/devicestatemodelview/list/', '/dictionarymodelview/list/');
INSERT INTO `logs` VALUES (285, 'list', 1, NULL, NULL, '{}', '2021-04-27 20:09:16', 42, 'http://172.28.3.4:5000/dictionarymodelview/list/', '/dictionaryitemmodelview/list/');
INSERT INTO `logs` VALUES (286, 'list', 1, NULL, NULL, '{}', '2021-04-27 20:09:26', 38, 'http://172.28.3.4:5000/roles/list/', '/logmodelview/list/');
INSERT INTO `logs` VALUES (287, 'list', 1, NULL, NULL, '{}', '2021-04-27 20:11:14', 38, 'http://172.28.3.4:5000/roles/list/', '/logmodelview/list/');
INSERT INTO `logs` VALUES (288, 'list', 1, NULL, NULL, '{}', '2021-04-28 18:09:51', 40, 'http://172.28.3.4:5000/roles/list/', '/logmodelview/list/');
INSERT INTO `logs` VALUES (289, 'list', 1, NULL, NULL, '{}', '2021-05-07 09:07:37', 44, 'http://172.28.3.4:5000/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (290, 'list', 1, NULL, NULL, '{}', '2021-05-08 15:26:39', 132, 'http://172.28.3.4:5000/roles/list/', '/logmodelview/list/');
INSERT INTO `logs` VALUES (291, 'list', 1, NULL, NULL, '{}', '2021-05-08 15:49:39', 105, 'http://172.28.3.4:5000/logmodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (292, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-05-08 15:49:47', 58, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (293, 'list', 1, NULL, NULL, '{}', '2021-05-08 15:49:58', 50, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (294, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-08 15:50:00', 38, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (295, 'list', 1, NULL, NULL, '{}', '2021-05-08 15:56:18', 63, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (296, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-08 16:43:40', 39, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (297, 'show', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"3\"}', '2021-05-08 16:43:51', 31, 'http://172.28.3.4:5000/devicemodelmodelview/show/2', '/romsoftwaremodelview/show/3');
INSERT INTO `logs` VALUES (298, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-08 16:43:54', 43, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (299, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-09 09:10:06', 36, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (300, 'list', 1, NULL, NULL, '{}', '2021-05-10 09:46:21', 47, 'http://172.28.3.4:5000/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (301, 'list', 1, NULL, NULL, '{}', '2021-05-10 09:46:27', 51, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (302, 'list', 1, NULL, NULL, '{}', '2021-05-10 09:46:38', 47, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (303, 'list', 1, NULL, NULL, '{}', '2021-05-10 09:46:50', 52, 'http://172.28.3.4:5000/devicestatemodelview/list/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (304, 'list', 1, NULL, NULL, '{}', '2021-05-10 09:46:53', 49, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (305, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-10 09:47:00', 100, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (306, 'delete', 1, NULL, NULL, '{\"delete\": \"\", \"pk\": \"3\"}', '2021-05-10 09:47:32', 10, 'http://172.28.3.4:5000/devicemodelmodelview/edit/2', '/romsoftwaremodelview/delete/3');
INSERT INTO `logs` VALUES (307, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-10 09:47:32', 38, 'http://172.28.3.4:5000/devicemodelmodelview/edit/2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (308, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\"}', '2021-05-10 09:47:35', 39, 'http://172.28.3.4:5000/devicemodelmodelview/edit/2', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (309, 'add', 1, NULL, NULL, '{\"csrf_token\": \"IjNjZGNiZGUyNjQxMWE0M2E1YzBhOTJhNWUyZWMyYTA0NzU2YWMxYWIi.YJiQtg.JVWUPWAfw5Sd5KReSe10XeNOfJU\", \"version\": \"V1.0-202105101100\", \"display_version\": \"V1.0-202105101100\", \"upgrade_type\": \"1\", \"status\": \"0\", \"start_datetime\": \"2021-05-09 09:47:33\", \"upgrade_limit\": \"0\", \"daily_upgrade_limit\": \"0\", \"version_range\": \"\", \"area_range\": \"\", \"file_size\": \"19243120\", \"file_md5\": \"58C63E975608C6DC4FCB2E4CB89AD194\", \"description\": \"test 2\", \"english_description\": \"test 2\", \"traditional_description\": \"\", \"_flt_0_device_model\": \"2\"}', '2021-05-10 13:52:42', 30, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=2', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (310, 'add', 1, NULL, NULL, '{\"csrf_token\": \"IjNjZGNiZGUyNjQxMWE0M2E1YzBhOTJhNWUyZWMyYTA0NzU2YWMxYWIi.YJjKKQ.SuIMPllr0wc4h4xo3moBR6zQ26M\", \"version\": \"V1.0-202105101100\", \"display_version\": \"V1.0-202105101100\", \"upgrade_type\": \"1\", \"status\": \"0\", \"start_datetime\": \"2021-05-09 09:47:33\", \"upgrade_limit\": \"0\", \"daily_upgrade_limit\": \"0\", \"version_range\": \"\", \"area_range\": \"\", \"file_size\": \"19243120\", \"file_md5\": \"58C63E975608C6DC4FCB2E4CB89AD194\", \"description\": \"test 2\", \"english_description\": \"test 2\", \"traditional_description\": \"\", \"_flt_0_device_model\": \"2\"}', '2021-05-10 13:52:49', 46, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=2', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (311, 'add', 1, NULL, NULL, '{\"csrf_token\": \"IjNjZGNiZGUyNjQxMWE0M2E1YzBhOTJhNWUyZWMyYTA0NzU2YWMxYWIi.YJjKMQ.IEO9pxE6wnd_F0t5SGnlKYLBjVU\", \"version\": \"V1.0-202105101100\", \"display_version\": \"V1.0-202105101100\", \"upgrade_type\": \"1\", \"status\": \"0\", \"start_datetime\": \"2021-05-09 09:47:33\", \"upgrade_limit\": \"0\", \"daily_upgrade_limit\": \"0\", \"version_range\": \"\", \"area_range\": \"\", \"file_size\": \"19243120\", \"file_md5\": \"58C63E975608C6DC4FCB2E4CB89AD194\", \"description\": \"test 2\", \"english_description\": \"test 2\", \"traditional_description\": \"\", \"_flt_0_device_model\": \"2\"}', '2021-05-10 13:53:46', 123, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=2', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (312, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-10 13:53:46', 37, 'http://172.28.3.4:5000/romsoftwaremodelview/add?_flt_0_device_model=2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (313, 'list', 1, NULL, NULL, '{}', '2021-05-10 14:08:12', 45, 'http://172.28.3.4:5000/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (314, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-10 14:08:17', 39, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (315, 'list', 1, NULL, NULL, '{}', '2021-05-10 14:10:06', 44, 'http://172.28.3.4:5000/devicemodelmodelview/edit/2', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (316, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-10 14:10:12', 43, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (317, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"4\"}', '2021-05-10 14:10:16', 29, 'http://172.28.3.4:5000/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/4');
INSERT INTO `logs` VALUES (318, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-10 14:10:21', 40, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (319, 'list', 1, NULL, NULL, '{}', '2021-05-10 14:10:22', 44, 'http://172.28.3.4:5000/devicemodelmodelview/edit/2', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (320, 'list', 1, NULL, NULL, '{}', '2021-05-10 14:17:00', 41, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (321, 'list', 1, NULL, NULL, '{}', '2021-05-10 14:23:04', 47, 'http://172.28.3.4:5000/devicemodelmodelview/show/2', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (322, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-05-10 14:23:09', 28, 'http://172.28.3.4:5000/devicestatemodelview/list/', '/devicestatemodelview/show/1');
INSERT INTO `logs` VALUES (323, 'list', 1, NULL, NULL, '{}', '2021-05-10 14:23:15', 51, 'http://172.28.3.4:5000/devicestatemodelview/show/1', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (324, 'show', 1, NULL, NULL, '{\"pk\": \"25\"}', '2021-05-10 14:23:19', 27, 'http://172.28.3.4:5000/devicestatemodelview/list/', '/devicestatemodelview/show/25');
INSERT INTO `logs` VALUES (325, 'list', 1, NULL, NULL, '{}', '2021-05-10 14:23:21', 51, 'http://172.28.3.4:5000/devicestatemodelview/show/25', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (326, 'list', 1, NULL, NULL, '{}', '2021-05-10 14:23:25', 87, 'http://172.28.3.4:5000/devicestatemodelview/list/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (327, 'show', 1, NULL, NULL, '{\"pk\": \"6\"}', '2021-05-10 14:23:32', 29, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/deviceinstancemodelview/show/6');
INSERT INTO `logs` VALUES (328, 'list', 1, NULL, NULL, '{}', '2021-05-10 14:23:43', 52, 'http://172.28.3.4:5000/deviceinstancemodelview/show/6', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (329, 'show', 1, NULL, NULL, '{\"pk\": \"5\"}', '2021-05-10 14:23:45', 29, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/deviceinstancemodelview/show/5');
INSERT INTO `logs` VALUES (330, 'list', 1, NULL, NULL, '{}', '2021-05-10 14:23:53', 54, 'http://172.28.3.4:5000/deviceinstancemodelview/show/5', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (331, 'show', 1, NULL, NULL, '{\"pk\": \"4\"}', '2021-05-10 14:23:59', 30, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/deviceinstancemodelview/show/4');
INSERT INTO `logs` VALUES (332, 'list', 1, NULL, NULL, '{}', '2021-05-10 14:24:02', 53, 'http://172.28.3.4:5000/deviceinstancemodelview/show/4', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (333, 'list', 1, NULL, NULL, '{}', '2021-05-10 14:25:12', 47, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (334, 'list', 1, NULL, NULL, '{}', '2021-05-10 14:25:15', 53, 'http://172.28.3.4:5000/devicestatemodelview/list/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (335, 'list', 1, NULL, NULL, '{}', '2021-05-10 14:25:35', 56, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (336, 'list', 1, NULL, NULL, '{}', '2021-05-10 14:25:39', 47, 'http://172.28.3.4:5000/deviceinstancemodelview/list/', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (337, 'list', 1, NULL, NULL, '{}', '2021-05-10 14:25:42', 50, 'http://172.28.3.4:5000/devicestatemodelview/list/', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (338, 'show', 1, NULL, NULL, '{\"pk\": \"25\"}', '2021-05-10 14:25:45', 29, 'http://172.28.3.4:5000/devicestatemodelview/list/', '/devicestatemodelview/show/25');
INSERT INTO `logs` VALUES (339, 'list', 1, NULL, NULL, '{}', '2021-05-10 14:25:47', 45, 'http://172.28.3.4:5000/devicestatemodelview/show/25', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (340, 'show', 1, NULL, NULL, '{\"pk\": \"25\"}', '2021-05-10 14:25:51', 28, 'http://172.28.3.4:5000/devicestatemodelview/list/', '/devicestatemodelview/show/25');
INSERT INTO `logs` VALUES (341, 'list', 1, NULL, NULL, '{}', '2021-05-10 14:25:54', 50, 'http://172.28.3.4:5000/devicestatemodelview/show/25', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (342, 'list', 1, NULL, NULL, '{\"page_DeviceStateModelView\": \"6\"}', '2021-05-10 14:25:58', 50, 'http://172.28.3.4:5000/devicestatemodelview/list/', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (343, 'show', 1, NULL, NULL, '{\"pk\": \"164\"}', '2021-05-10 14:26:01', 28, 'http://172.28.3.4:5000/devicestatemodelview/list/?page_DeviceStateModelView=6', '/devicestatemodelview/show/164');
INSERT INTO `logs` VALUES (344, 'list', 1, NULL, NULL, '{\"page_DeviceStateModelView\": \"6\"}', '2021-05-10 14:26:18', 48, 'http://172.28.3.4:5000/devicestatemodelview/show/164', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (345, 'show', 1, NULL, NULL, '{\"pk\": \"163\"}', '2021-05-10 14:26:21', 27, 'http://172.28.3.4:5000/devicestatemodelview/list/?page_DeviceStateModelView=6', '/devicestatemodelview/show/163');
INSERT INTO `logs` VALUES (346, 'list', 1, NULL, NULL, '{\"page_DeviceStateModelView\": \"6\"}', '2021-05-10 14:26:23', 50, 'http://172.28.3.4:5000/devicestatemodelview/show/163', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (347, 'list', 1, NULL, NULL, '{}', '2021-05-10 14:29:02', 44, 'http://172.28.3.4:5000/devicestatemodelview/list/?page_DeviceStateModelView=6', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (348, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-10 14:29:07', 40, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (349, 'list', 1, NULL, NULL, '{}', '2021-05-10 14:29:23', 65, 'http://172.28.3.4:5000/devicemodelmodelview/show/2', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (350, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-10 14:29:47', 41, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (351, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"4\"}', '2021-05-10 14:29:57', 32, 'http://172.28.3.4:5000/devicemodelmodelview/show/2', '/romsoftwaremodelview/edit/4');
INSERT INTO `logs` VALUES (352, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-10 14:30:12', 38, 'http://172.28.3.4:5000/romsoftwaremodelview/edit/4?_flt_0_device_model=2', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (353, 'show', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"4\"}', '2021-05-10 14:30:21', 29, 'http://172.28.3.4:5000/devicemodelmodelview/show/2', '/romsoftwaremodelview/show/4');
INSERT INTO `logs` VALUES (354, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-10 14:30:33', 41, 'http://172.28.3.4:5000/romsoftwaremodelview/show/4?_flt_0_device_model=2', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (355, 'list', 1, NULL, NULL, '{}', '2021-05-10 14:30:36', 47, 'http://172.28.3.4:5000/devicemodelmodelview/show/2', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (356, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-05-10 14:30:38', 39, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (357, 'show', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\", \"pk\": \"2\"}', '2021-05-10 14:30:39', 30, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/romsoftwaremodelview/show/2');
INSERT INTO `logs` VALUES (358, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-05-10 14:31:30', 38, 'http://172.28.3.4:5000/romsoftwaremodelview/show/2?_flt_0_device_model=1', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (359, 'list', 1, NULL, NULL, '{}', '2021-05-10 14:31:34', 48, 'http://172.28.3.4:5000/devicemodelmodelview/show/1', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (360, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-10 14:31:36', 37, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (361, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"4\"}', '2021-05-10 14:31:42', 30, 'http://172.28.3.4:5000/devicemodelmodelview/show/2', '/romsoftwaremodelview/edit/4');
INSERT INTO `logs` VALUES (362, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-10 14:31:47', 44, 'http://172.28.3.4:5000/romsoftwaremodelview/edit/4?_flt_0_device_model=2', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (363, 'show', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"4\"}', '2021-05-10 14:31:48', 28, 'http://172.28.3.4:5000/devicemodelmodelview/show/2', '/romsoftwaremodelview/show/4');
INSERT INTO `logs` VALUES (364, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-10 14:46:30', 36, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (365, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"4\"}', '2021-05-10 16:09:24', 26, 'http://172.28.3.4:5000/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/4');
INSERT INTO `logs` VALUES (366, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"IjNjZGNiZGUyNjQxMWE0M2E1YzBhOTJhNWUyZWMyYTA0NzU2YWMxYWIi.YJjqMw.8mcPy_zTqiAK8CVY7MseXYWIhIc\", \"version\": \"V1.0-202105101100\", \"display_version\": \"V1.0-202105101100\", \"upgrade_type\": \"1\", \"status\": \"0\", \"start_datetime\": \"2021-05-09 09:47:33\", \"upgrade_limit\": \"0\", \"daily_upgrade_limit\": \"0\", \"version_range\": \"\", \"area_range\": \"\", \"file_size\": \"19243120\", \"file_md5\": \"58c63e975608c6dc4fcb2e4cb89ad194\", \"description\": \"test 2\", \"english_description\": \"test 2\", \"traditional_description\": \"\", \"_flt_0_device_model\": \"2\", \"pk\": \"4\"}', '2021-05-10 16:10:00', 34, 'http://172.28.3.4:5000/romsoftwaremodelview/edit/4?_flt_0_device_model=2', '/romsoftwaremodelview/edit/4');
INSERT INTO `logs` VALUES (367, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"4\"}', '2021-05-10 16:10:09', 31, 'http://172.28.3.4:5000/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/4');
INSERT INTO `logs` VALUES (368, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-10 16:10:13', 40, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (369, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"4\"}', '2021-05-10 16:10:18', 30, 'http://172.28.3.4:5000/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/4');
INSERT INTO `logs` VALUES (370, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"IjNjZGNiZGUyNjQxMWE0M2E1YzBhOTJhNWUyZWMyYTA0NzU2YWMxYWIi.YJjqaQ.Rxm1oKOzqq_u8gftxrmt68OIz8I\", \"version\": \"V1.0-202105101100\", \"display_version\": \"V1.0-202105101100\", \"upgrade_type\": \"1\", \"status\": \"0\", \"start_datetime\": \"2021-05-09 09:47:33\", \"upgrade_limit\": \"0\", \"daily_upgrade_limit\": \"0\", \"version_range\": \"\", \"area_range\": \"\", \"file_size\": \"19243120\", \"file_md5\": \"58c63e975608c6dc4fcb2e4cb89ad194\", \"description\": \"test 2\", \"english_description\": \"test 2\", \"traditional_description\": \"\", \"_flt_0_device_model\": \"2\", \"pk\": \"4\"}', '2021-05-10 16:10:34', 35, 'http://172.28.3.4:5000/romsoftwaremodelview/edit/4?_flt_0_device_model=2', '/romsoftwaremodelview/edit/4');
INSERT INTO `logs` VALUES (371, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"4\"}', '2021-05-10 16:10:59', 28, 'http://172.28.3.4:5000/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/4');
INSERT INTO `logs` VALUES (372, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-10 16:11:08', 41, 'http://172.28.3.4:5000/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (373, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"4\"}', '2021-05-10 16:11:10', 29, 'http://172.28.3.4:5000/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/4');
INSERT INTO `logs` VALUES (374, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"IjNjZGNiZGUyNjQxMWE0M2E1YzBhOTJhNWUyZWMyYTA0NzU2YWMxYWIi.YJjqng.ZvDLvlkSZamPIj1u6aMbiQfkS0c\", \"version\": \"V1.0-202105101100\", \"display_version\": \"V1.0-202105101100\", \"upgrade_type\": \"1\", \"status\": \"0\", \"start_datetime\": \"2021-05-09 09:47:33\", \"upgrade_limit\": \"0\", \"daily_upgrade_limit\": \"0\", \"version_range\": \"\", \"area_range\": \"\", \"file_size\": \"19243120\", \"file_md5\": \"58c63e975608c6dc4fcb2e4cb89ad194\", \"description\": \"test 2\", \"english_description\": \"test 2\", \"traditional_description\": \"\", \"_flt_0_device_model\": \"2\", \"pk\": \"4\"}', '2021-05-10 16:11:24', 32, 'http://172.28.3.4:5000/romsoftwaremodelview/edit/4?_flt_0_device_model=2', '/romsoftwaremodelview/edit/4');
INSERT INTO `logs` VALUES (375, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"IjNjZGNiZGUyNjQxMWE0M2E1YzBhOTJhNWUyZWMyYTA0NzU2YWMxYWIi.YJjqqw.uZyokdzvsm-C5xMMxpGg1bZYzAA\", \"version\": \"V1.0-202105101100\", \"display_version\": \"V1.0-202105101100\", \"upgrade_type\": \"1\", \"status\": \"0\", \"start_datetime\": \"2021-05-09 09:47:33\", \"upgrade_limit\": \"0\", \"daily_upgrade_limit\": \"0\", \"version_range\": \"\", \"area_range\": \"\", \"file_size\": \"19243120\", \"file_md5\": \"58c63e975608c6dc4fcb2e4cb89ad194\", \"description\": \"test 2\", \"english_description\": \"test 2\", \"traditional_description\": \"\", \"_flt_0_device_model\": \"2\", \"pk\": \"4\"}', '2021-05-10 16:12:28', 115, 'http://172.28.3.4:5000/romsoftwaremodelview/edit/4?_flt_0_device_model=2', '/romsoftwaremodelview/edit/4');
INSERT INTO `logs` VALUES (376, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-10 16:12:28', 73, 'http://172.28.3.4:5000/romsoftwaremodelview/edit/4?_flt_0_device_model=2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (377, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"4\"}', '2021-05-10 16:24:00', 29, 'http://172.28.3.4:5000/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/4');
INSERT INTO `logs` VALUES (378, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-10 16:24:10', 41, 'http://172.28.3.4:5000/romsoftwaremodelview/edit/4?_flt_0_device_model=2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (379, 'list', 1, NULL, NULL, '{}', '2021-05-11 10:27:05', 81, 'http://47.119.112.219:8888/users/userinfo/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (380, 'list', 1, NULL, NULL, '{}', '2021-05-11 10:27:07', 69, 'http://47.119.112.219:8888/devicemodelmodelview/list/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (381, 'show', 1, NULL, NULL, '{\"pk\": \"4\"}', '2021-05-11 10:27:34', 34, 'http://47.119.112.219:8888/deviceinstancemodelview/list/', '/deviceinstancemodelview/show/4');
INSERT INTO `logs` VALUES (382, 'list', 1, NULL, NULL, '{}', '2021-05-11 10:27:39', 66, 'http://47.119.112.219:8888/devicemodelmodelview/list/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (383, 'list', 1, NULL, NULL, '{}', '2021-05-11 11:13:29', 122, 'http://47.119.112.219:8888/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (384, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-05-11 11:13:31', 56, 'http://47.119.112.219:8888/devicemodelmodelview/list/', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (385, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-05-11 11:14:17', 43, 'http://47.119.112.219:8888/devicemodelmodelview/list/', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (386, 'list', 1, NULL, NULL, '{}', '2021-05-11 11:14:18', 58, 'http://47.119.112.219:8888/devicemodelmodelview/show/1', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (387, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-11 11:14:20', 42, 'http://47.119.112.219:8888/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (388, 'list', 1, NULL, NULL, '{}', '2021-05-11 15:50:22', 58, 'http://upgrade.wifi.sim.com:8888/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (389, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-11 15:50:24', 44, 'http://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (390, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"4\"}', '2021-05-11 15:50:27', 45, 'http://upgrade.wifi.sim.com:8888/devicemodelmodelview/show/2', '/romsoftwaremodelview/edit/4');
INSERT INTO `logs` VALUES (391, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-11 15:52:01', 44, 'http://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (392, 'show', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"4\"}', '2021-05-11 15:52:24', 33, 'http://upgrade.wifi.sim.com:8888/devicemodelmodelview/show/2', '/romsoftwaremodelview/show/4');
INSERT INTO `logs` VALUES (393, 'list', 1, NULL, NULL, '{}', '2021-05-11 16:07:08', 58, 'http://upgrade.wifi.sim.com:8888/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (394, 'list', 1, NULL, NULL, '{}', '2021-05-11 16:07:16', 60, 'http://upgrade.wifi.sim.com:8888/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (395, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-11 16:07:22', 44, 'http://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (396, 'list', 1, NULL, NULL, '{}', '2021-05-11 16:07:33', 60, 'http://upgrade.wifi.sim.com:8888/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (397, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-11 16:07:54', 43, 'http://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (398, 'list', 1, NULL, NULL, '{}', '2021-05-11 16:07:59', 57, 'http://upgrade.wifi.sim.com:8888/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (399, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-11 16:08:01', 43, 'http://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (400, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"4\"}', '2021-05-11 16:08:14', 34, 'http://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/4');
INSERT INTO `logs` VALUES (401, 'edit', NULL, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-11 16:08:38', 5, 'http://baidu.com/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (402, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-11 16:08:49', 46, 'http://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (403, 'list', NULL, NULL, NULL, '{}', '2021-05-11 16:09:37', 5, 'http://baidu.com/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (404, 'list', NULL, NULL, NULL, '{}', '2021-05-11 16:10:11', 5, NULL, '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (405, 'list', NULL, NULL, NULL, '{}', '2021-05-11 16:10:11', 5, 'http://baidu.com/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (406, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\"}', '2021-05-11 16:10:26', 32, 'http://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (407, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-11 16:11:53', 46, 'http://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (408, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\"}', '2021-05-11 16:11:55', 32, 'http://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (409, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\"}', '2021-05-11 16:17:04', 30, 'http://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (410, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-11 16:17:05', 43, 'http://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (411, 'list', 1, NULL, NULL, '{}', '2021-05-11 16:51:00', 59, 'http://upgrade.wifi.sim.com:8888/', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (412, 'list', 1, NULL, NULL, '{}', '2021-05-11 16:51:03', 58, 'http://upgrade.wifi.sim.com:8888/devicestatemodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (413, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-11 16:52:50', 46, 'http://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (414, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"4\"}', '2021-05-11 16:52:54', 32, 'http://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/4');
INSERT INTO `logs` VALUES (415, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-11 16:53:15', 43, 'http://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (416, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"ImNmYWE3NTU2ZTk5YmMxNzNjOTIwMzdjYzI2NWI2MjI2ZjEzODA1Yjgi.YJpF-g.1KLHZy_UrN9wzV0_tPnqADHTce8\", \"name\": \"SIMAX1800T\", \"check_mode\": \"1\", \"check_period\": \"7200\", \"new_version_check_period\": \"1\", \"allow_upgrade\": \"y\", \"upgrade_limit\": \"10000\", \"upgrade_type\": \"1\", \"upgrade_rules\": \"0105f\", \"description\": \"test 1\", \"pk\": \"2\"}', '2021-05-11 16:56:26', 13, 'http://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (417, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"4\"}', '2021-05-11 16:56:26', 32, 'http://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/4');
INSERT INTO `logs` VALUES (418, 'list', 1, NULL, NULL, '{}', '2021-05-11 20:21:47', 53, 'https://upgrade.wifi.sim.com:8888/roles/list/', '/dictionarymodelview/list/');
INSERT INTO `logs` VALUES (419, 'list', 1, NULL, NULL, '{}', '2021-05-11 20:21:49', 58, 'https://upgrade.wifi.sim.com:8888/dictionarymodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (420, 'list', 1, NULL, NULL, '{}', '2021-05-12 08:51:16', 60, 'https://upgrade.wifi.sim.com:8888/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (421, 'list', 1, NULL, NULL, '{}', '2021-05-12 11:29:17', 59, 'https://upgrade.wifi.sim.com:8888/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (422, 'list', 1, NULL, NULL, '{}', '2021-05-12 11:29:18', 67, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (423, 'list', 1, NULL, NULL, '{}', '2021-05-12 11:29:20', 61, 'https://upgrade.wifi.sim.com:8888/deviceinstancemodelview/list/', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (424, 'list', 1, NULL, NULL, '{}', '2021-05-12 11:31:41', 57, 'https://upgrade.wifi.sim.com:8888/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (425, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-12 11:31:44', 44, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (426, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\"}', '2021-05-12 11:31:56', 30, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (427, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-12 11:32:02', 43, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (428, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\"}', '2021-05-12 11:32:08', 29, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (429, 'add', 1, NULL, NULL, '{\"csrf_token\": \"ImNmYWE3NTU2ZTk5YmMxNzNjOTIwMzdjYzI2NWI2MjI2ZjEzODA1Yjgi.YJtMOA.kHDhAI4EyRSZ0D5rarizxW_pvsk\", \"version\": \"V1.0-202105111500\", \"display_version\": \"V1.0-202105111500\", \"upgrade_type\": \"critical\", \"status\": \"0\", \"start_datetime\": \"2021-05-09 09:47:33\", \"upgrade_limit\": \"0\", \"daily_upgrade_limit\": \"0\", \"version_range\": \"\", \"area_range\": \"\", \"file_size\": \"19718960\", \"file_md5\": \"05a73d44ea7b43df92c6c796a32f76b6\", \"description\": \"test 3\", \"english_description\": \"test 3\", \"traditional_description\": \"\", \"_flt_0_device_model\": \"2\"}', '2021-05-12 11:34:48', 255, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/add?_flt_0_device_model=2', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (430, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-12 11:34:48', 44, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/add?_flt_0_device_model=2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (431, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\"}', '2021-05-12 18:11:53', 31, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (432, 'add', 1, NULL, NULL, '{\"csrf_token\": \"ImNmYWE3NTU2ZTk5YmMxNzNjOTIwMzdjYzI2NWI2MjI2ZjEzODA1Yjgi.YJup6A.YM6U7UBtsnjcMcFBAadBbXOex8g\", \"version\": \"V1.0-202105121740\", \"display_version\": \"V1.0-202105121740\", \"upgrade_type\": \"critical\", \"status\": \"0\", \"start_datetime\": \"2021-05-09 09:47:33\", \"upgrade_limit\": \"0\", \"daily_upgrade_limit\": \"0\", \"version_range\": \"\", \"area_range\": \"\", \"file_size\": \"19726496\", \"file_md5\": \"4c387553544f5977f7a68a453cf9a481\", \"description\": \"test https\", \"english_description\": \"test https\", \"traditional_description\": \"test https\", \"_flt_0_device_model\": \"2\"}', '2021-05-12 18:14:02', 229, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/add?_flt_0_device_model=2', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (433, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-12 18:14:02', 44, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/add?_flt_0_device_model=2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (434, 'list', 1, NULL, NULL, '{}', '2021-05-12 18:21:56', 120, 'https://upgrade.wifi.sim.com:8888/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (435, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-12 18:21:59', 55, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (436, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-12 19:32:27', 82, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/add?_flt_0_device_model=2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (437, 'list', 1, NULL, NULL, '{}', '2021-05-12 19:33:05', 59, 'https://upgrade.wifi.sim.com:8888/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (438, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-12 19:33:08', 44, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (439, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\"}', '2021-05-12 19:33:11', 33, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (440, 'add', 1, NULL, NULL, '{\"csrf_token\": \"ImNmYWE3NTU2ZTk5YmMxNzNjOTIwMzdjYzI2NWI2MjI2ZjEzODA1Yjgi.YJu89g.fsglG9WEs4WFzxwCN5cYU505l58\", \"version\": \"V1.0-202105121900\", \"display_version\": \"V1.0-202105121900\", \"upgrade_type\": \"critical\", \"status\": \"0\", \"start_datetime\": \"2021-05-09 09:47:33\", \"upgrade_limit\": \"0\", \"daily_upgrade_limit\": \"0\", \"version_range\": \"\", \"area_range\": \"\", \"file_size\": \"19731920\", \"file_md5\": \"0d2a62c9595e29a6d30a34b047fd9f35\", \"description\": \"test https 0512\", \"english_description\": \"test https 0512\", \"traditional_description\": \"\", \"_flt_0_device_model\": \"2\"}', '2021-05-12 19:36:08', 231, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/add?_flt_0_device_model=2', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (441, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-12 19:36:08', 44, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/add?_flt_0_device_model=2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (442, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"ImNmYWE3NTU2ZTk5YmMxNzNjOTIwMzdjYzI2NWI2MjI2ZjEzODA1Yjgi.YJu9qA.SFElFl7ViwlAGSU_oJzthYuvAsE\", \"name\": \"SIMAX1800T\", \"check_mode\": \"1\", \"check_period\": \"7200\", \"new_version_check_period\": \"1\", \"allow_upgrade\": \"y\", \"upgrade_limit\": \"10000\", \"upgrade_type\": \"1\", \"upgrade_rules\": \"2021f\", \"description\": \"test 1\", \"pk\": \"2\"}', '2021-05-12 20:01:37', 13, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (443, 'list', 1, NULL, NULL, '{}', '2021-05-12 20:01:37', 57, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (444, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-12 20:01:44', 44, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (445, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"7\"}', '2021-05-12 20:01:49', 33, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/7');
INSERT INTO `logs` VALUES (446, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"ImNmYWE3NTU2ZTk5YmMxNzNjOTIwMzdjYzI2NWI2MjI2ZjEzODA1Yjgi.YJvDrA.X3mqLWFgv-OlGeaKRLwtEzCGPE8\", \"version\": \"V1.0-202105121900\", \"display_version\": \"V1.0-202105121900\", \"upgrade_type\": \"no\", \"status\": \"0\", \"start_datetime\": \"2021-05-09 09:47:33\", \"upgrade_limit\": \"0\", \"daily_upgrade_limit\": \"0\", \"version_range\": \"\", \"area_range\": \"\", \"file_size\": \"19731920\", \"file_md5\": \"0d2a62c9595e29a6d30a34b047fd9f35\", \"description\": \"test https 0512\", \"english_description\": \"test https 0512\", \"traditional_description\": \"\", \"_flt_0_device_model\": \"2\", \"pk\": \"7\"}', '2021-05-12 20:02:01', 45, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/edit/7?_flt_0_device_model=2', '/romsoftwaremodelview/edit/7');
INSERT INTO `logs` VALUES (447, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"7\"}', '2021-05-12 20:02:18', 32, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/7');
INSERT INTO `logs` VALUES (448, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-12 20:02:19', 45, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (449, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"7\"}', '2021-05-12 20:02:24', 32, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/7');
INSERT INTO `logs` VALUES (450, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"ImNmYWE3NTU2ZTk5YmMxNzNjOTIwMzdjYzI2NWI2MjI2ZjEzODA1Yjgi.YJvDzw.Ez79QJWKqUJo5Gs1FGI7ToBbRNI\", \"version\": \"V1.0-202105121900\", \"display_version\": \"V1.0-202105121900\", \"upgrade_type\": \"no\", \"status\": \"0\", \"start_datetime\": \"2021-05-09 09:47:33\", \"upgrade_limit\": \"0\", \"daily_upgrade_limit\": \"0\", \"version_range\": \"\", \"area_range\": \"\", \"file_size\": \"19731920\", \"file_md5\": \"0d2a62c9595e29a6d30a34b047fd9f35\", \"description\": \"test https 0512\", \"english_description\": \"test https 0512\", \"traditional_description\": \"\", \"_flt_0_device_model\": \"2\", \"pk\": \"7\"}', '2021-05-12 20:02:34', 44, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/edit/7?_flt_0_device_model=2', '/romsoftwaremodelview/edit/7');
INSERT INTO `logs` VALUES (451, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"ImNmYWE3NTU2ZTk5YmMxNzNjOTIwMzdjYzI2NWI2MjI2ZjEzODA1Yjgi.YJvD2Q.VL2d1UdQwstG869jXSrRjnE_DL0\", \"version\": \"V1.0-202105121900\", \"display_version\": \"V1.0-202105121900\", \"upgrade_type\": \"no\", \"status\": \"0\", \"start_datetime\": \"2021-05-09 09:47:33\", \"upgrade_limit\": \"0\", \"daily_upgrade_limit\": \"0\", \"version_range\": \"\", \"area_range\": \"\", \"file_size\": \"19731920\", \"file_md5\": \"0d2a62c9595e29a6d30a34b047fd9f35\", \"description\": \"test https 0512\", \"english_description\": \"test https 0512\", \"traditional_description\": \"\", \"_flt_0_device_model\": \"2\", \"pk\": \"7\"}', '2021-05-12 20:03:04', 201, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/edit/7?_flt_0_device_model=2', '/romsoftwaremodelview/edit/7');
INSERT INTO `logs` VALUES (452, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-12 20:03:04', 44, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/edit/7?_flt_0_device_model=2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (453, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"7\"}', '2021-05-12 20:07:08', 33, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/7');
INSERT INTO `logs` VALUES (454, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-12 20:07:13', 44, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/edit/7?_flt_0_device_model=2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (455, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"ImNmYWE3NTU2ZTk5YmMxNzNjOTIwMzdjYzI2NWI2MjI2ZjEzODA1Yjgi.YJvE8Q.2C4UFOy5TIu5JRnCxnf85WSXFYA\", \"name\": \"SIMAX1800T\", \"check_mode\": \"1\", \"check_period\": \"60\", \"new_version_check_period\": \"1\", \"allow_upgrade\": \"y\", \"upgrade_limit\": \"10000\", \"upgrade_type\": \"1\", \"upgrade_rules\": \"2021f\", \"description\": \"test 1\", \"pk\": \"2\"}', '2021-05-12 20:07:29', 13, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (456, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"7\"}', '2021-05-12 20:07:29', 32, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/7');
INSERT INTO `logs` VALUES (457, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-12 21:17:46', 44, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/edit/7?_flt_0_device_model=2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (458, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"7\"}', '2021-05-12 21:17:48', 33, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/7');
INSERT INTO `logs` VALUES (459, 'list', 1, NULL, NULL, '{}', '2021-05-12 21:17:52', 60, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/edit/7?_flt_0_device_model=2', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (460, 'list', 1, NULL, NULL, '{}', '2021-05-12 21:17:54', 71, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (461, 'list', 1, NULL, NULL, '{}', '2021-05-12 21:18:26', 62, 'https://upgrade.wifi.sim.com:8888/deviceinstancemodelview/list/', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (462, 'list', 1, NULL, NULL, '{}', '2021-05-12 21:18:36', 59, 'https://upgrade.wifi.sim.com:8888/devicestatemodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (463, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-12 21:18:41', 46, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (464, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"ImNmYWE3NTU2ZTk5YmMxNzNjOTIwMzdjYzI2NWI2MjI2ZjEzODA1Yjgi.YJvVsA.huS7Qt-zcQycHIJI2UlIEnhFCOg\", \"name\": \"SIMAX1800T\", \"check_mode\": \"1\", \"check_period\": \"7200\", \"new_version_check_period\": \"1\", \"allow_upgrade\": \"y\", \"upgrade_limit\": \"10000\", \"upgrade_type\": \"1\", \"upgrade_rules\": \"0105f\", \"description\": \"test 1\", \"pk\": \"2\"}', '2021-05-12 21:19:23', 12, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (465, 'list', 1, NULL, NULL, '{}', '2021-05-12 21:19:24', 58, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (466, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-12 21:19:27', 44, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (467, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"7\"}', '2021-05-12 21:19:45', 33, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/7');
INSERT INTO `logs` VALUES (468, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"ImNmYWE3NTU2ZTk5YmMxNzNjOTIwMzdjYzI2NWI2MjI2ZjEzODA1Yjgi.YJvV8A.bRArcuNrbe0YjBvvaRnsfY05KWw\", \"version\": \"V1.0-202105121900\", \"display_version\": \"V1.0-202105121900\", \"upgrade_type\": \"critical\", \"status\": \"0\", \"start_datetime\": \"2021-05-09 09:47:33\", \"upgrade_limit\": \"0\", \"daily_upgrade_limit\": \"0\", \"version_range\": \"\", \"area_range\": \"\", \"file_size\": \"19731920\", \"file_md5\": \"0d2a62c9595e29a6d30a34b047fd9f35\", \"description\": \"test https 0512\", \"english_description\": \"test https 0512\", \"traditional_description\": \"\", \"_flt_0_device_model\": \"2\", \"pk\": \"7\"}', '2021-05-12 21:20:02', 45, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/edit/7?_flt_0_device_model=2', '/romsoftwaremodelview/edit/7');
INSERT INTO `logs` VALUES (469, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"ImNmYWE3NTU2ZTk5YmMxNzNjOTIwMzdjYzI2NWI2MjI2ZjEzODA1Yjgi.YJvWAQ.w8TUF9qa22C4rx0XmHuB7A-_O3U\", \"version\": \"V1.0-202105121900\", \"display_version\": \"V1.0-202105121900\", \"upgrade_type\": \"critical\", \"status\": \"0\", \"start_datetime\": \"2021-05-09 09:47:33\", \"upgrade_limit\": \"0\", \"daily_upgrade_limit\": \"0\", \"version_range\": \"\", \"area_range\": \"\", \"file_size\": \"19731920\", \"file_md5\": \"0d2a62c9595e29a6d30a34b047fd9f35\", \"description\": \"test https 0512\", \"english_description\": \"test https 0512\", \"traditional_description\": \"\", \"_flt_0_device_model\": \"2\", \"pk\": \"7\"}', '2021-05-12 21:20:47', 212, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/edit/7?_flt_0_device_model=2', '/romsoftwaremodelview/edit/7');
INSERT INTO `logs` VALUES (470, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-12 21:20:47', 44, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/edit/7?_flt_0_device_model=2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (471, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"7\"}', '2021-05-12 21:20:50', 32, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/7');
INSERT INTO `logs` VALUES (472, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-12 21:20:55', 44, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/edit/7?_flt_0_device_model=2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (473, 'list', 1, NULL, NULL, '{}', '2021-05-13 14:28:33', 61, 'https://upgrade.wifi.sim.com:8888/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (474, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-13 14:28:48', 46, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (475, 'list', 1, NULL, NULL, '{}', '2021-05-13 14:28:50', 59, 'https://upgrade.wifi.sim.com:8888/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (476, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-13 14:28:56', 45, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (477, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"7\"}', '2021-05-13 14:31:59', 32, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/7');
INSERT INTO `logs` VALUES (478, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-13 14:32:02', 43, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (479, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\"}', '2021-05-13 14:32:07', 30, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (480, 'add', 1, NULL, NULL, '{\"csrf_token\": \"IjQwOTJiYjYyN2ZjZDQzNDM1YzE1ODk1MDNmZWUxNjI5MDhiMjY2MTUi.YJzH5w.fcgc3XZLmp2qx6AQDDIDBF3qqqU\", \"version\": \"V1.0-202105131200\", \"display_version\": \"V1.0-202105131200\", \"upgrade_type\": \"critical\", \"status\": \"0\", \"start_datetime\": \"2021-05-09 09:47:33\", \"upgrade_limit\": \"0\", \"daily_upgrade_limit\": \"0\", \"version_range\": \"\", \"area_range\": \"\", \"file_size\": \"19732688\", \"file_md5\": \"add6d24f74243db287733c543cf6f722\", \"description\": \"upgrade model init version\", \"english_description\": \"upgrade model init version\", \"traditional_description\": \"\", \"_flt_0_device_model\": \"2\"}', '2021-05-13 14:35:47', 264, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/add?_flt_0_device_model=2', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (481, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-13 14:35:47', 44, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/add?_flt_0_device_model=2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (482, 'list', 1, NULL, NULL, '{}', '2021-05-13 15:47:38', 56, 'https://upgrade.wifi.sim.com:8888/userstatschartview/chart/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (483, 'edit', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-05-13 15:47:45', 46, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/1');
INSERT INTO `logs` VALUES (484, 'list', NULL, NULL, NULL, '{}', '2021-05-13 15:48:42', 5, 'http://baidu.com/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (485, 'list', 1, NULL, NULL, '{}', '2021-05-13 15:48:43', 79, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/1', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (486, 'list', 1, NULL, NULL, '{\"_oc_DeviceInstanceModelView\": \"soft_version\", \"_od_DeviceInstanceModelView\": \"asc\"}', '2021-05-13 15:49:10', 79, 'https://upgrade.wifi.sim.com:8888/deviceinstancemodelview/list/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (487, 'list', 1, NULL, NULL, '{\"_oc_DeviceInstanceModelView\": \"soft_version\", \"_od_DeviceInstanceModelView\": \"desc\"}', '2021-05-13 15:49:12', 74, 'https://upgrade.wifi.sim.com:8888/deviceinstancemodelview/list/?_oc_DeviceInstanceModelView=soft_version&_od_DeviceInstanceModelView=asc', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (488, 'list', 1, NULL, NULL, '{\"_oc_DeviceInstanceModelView\": \"soft_version\", \"_od_DeviceInstanceModelView\": \"asc\"}', '2021-05-13 15:49:13', 85, 'https://upgrade.wifi.sim.com:8888/deviceinstancemodelview/list/?_oc_DeviceInstanceModelView=soft_version&_od_DeviceInstanceModelView=desc', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (489, 'list', 1, NULL, NULL, '{\"_oc_DeviceInstanceModelView\": \"soft_version\", \"_od_DeviceInstanceModelView\": \"desc\"}', '2021-05-13 15:49:15', 77, 'https://upgrade.wifi.sim.com:8888/deviceinstancemodelview/list/?_oc_DeviceInstanceModelView=soft_version&_od_DeviceInstanceModelView=asc', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (490, 'list', 1, NULL, NULL, '{}', '2021-05-13 15:52:32', 62, 'https://upgrade.wifi.sim.com:8888/deviceinstancemodelview/list/?_oc_DeviceInstanceModelView=soft_version&_od_DeviceInstanceModelView=desc', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (491, 'list', 1, NULL, NULL, '{}', '2021-05-13 15:54:06', 60, 'https://upgrade.wifi.sim.com:8888/devicestatemodelview/list/', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (492, 'list', 1, NULL, NULL, '{}', '2021-05-13 15:54:38', 62, 'https://upgrade.wifi.sim.com:8888/devicestatemodelview/list/?', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (493, 'list', 1, NULL, NULL, '{}', '2021-05-13 15:54:49', 61, 'https://upgrade.wifi.sim.com:8888/devicestatemodelview/list/?', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (494, 'list', 1, NULL, NULL, '{}', '2021-05-13 15:55:27', 78, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/show/2', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (495, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-05-13 15:55:29', 35, 'https://upgrade.wifi.sim.com:8888/deviceinstancemodelview/list/', '/deviceinstancemodelview/show/1');
INSERT INTO `logs` VALUES (496, 'list', 1, NULL, NULL, '{}', '2021-05-13 15:55:38', 77, 'https://upgrade.wifi.sim.com:8888/deviceinstancemodelview/show/1', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (497, 'list', 1, NULL, NULL, '{}', '2021-05-13 16:02:38', 51, 'https://upgrade.wifi.sim.com:8888/deviceinstancemodelview/list/', '/dictionarymodelview/list/');
INSERT INTO `logs` VALUES (498, 'list', 1, NULL, NULL, '{}', '2021-05-13 16:02:40', 60, 'https://upgrade.wifi.sim.com:8888/dictionarymodelview/list/', '/dictionaryitemmodelview/list/');
INSERT INTO `logs` VALUES (499, 'list', 1, NULL, NULL, '{}', '2021-05-13 16:02:47', 51, 'https://upgrade.wifi.sim.com:8888/dictionaryitemmodelview/list/', '/dictionarymodelview/list/');
INSERT INTO `logs` VALUES (500, 'list', 1, NULL, NULL, '{}', '2021-05-13 16:02:57', 54, 'https://upgrade.wifi.sim.com:8888/dictionarymodelview/list/', '/dictionaryitemmodelview/list/');
INSERT INTO `logs` VALUES (501, 'list', 1, NULL, NULL, '{}', '2021-05-13 16:02:59', 53, 'https://upgrade.wifi.sim.com:8888/dictionaryitemmodelview/list/', '/dictionarymodelview/list/');
INSERT INTO `logs` VALUES (502, 'list', 1, NULL, NULL, '{}', '2021-05-13 16:03:04', 48, 'https://upgrade.wifi.sim.com:8888/dictionarymodelview/list/', '/logmodelview/list/');
INSERT INTO `logs` VALUES (503, 'list', 1, NULL, NULL, '{}', '2021-05-13 16:05:11', 61, 'https://upgrade.wifi.sim.com:8888/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (504, 'list', 1, NULL, NULL, '{}', '2021-05-13 16:05:15', 77, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (505, 'list', 1, NULL, NULL, '{}', '2021-05-13 16:05:30', 60, 'https://upgrade.wifi.sim.com:8888/deviceinstancemodelview/list/', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (506, 'list', 1, NULL, NULL, '{\"page_DeviceStateModelView\": \"6\"}', '2021-05-13 16:05:55', 62, 'https://upgrade.wifi.sim.com:8888/devicestatemodelview/list/', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (507, 'list', 1, NULL, NULL, '{\"page_DeviceStateModelView\": \"8\"}', '2021-05-13 16:05:57', 61, 'https://upgrade.wifi.sim.com:8888/devicestatemodelview/list/?page_DeviceStateModelView=6', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (508, 'list', 1, NULL, NULL, '{\"page_DeviceStateModelView\": \"9\"}', '2021-05-13 16:05:58', 62, 'https://upgrade.wifi.sim.com:8888/devicestatemodelview/list/?page_DeviceStateModelView=8', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (509, 'list', 1, NULL, NULL, '{\"page_DeviceStateModelView\": \"8\"}', '2021-05-13 16:05:59', 61, 'https://upgrade.wifi.sim.com:8888/devicestatemodelview/list/?page_DeviceStateModelView=9', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (510, 'list', 1, NULL, NULL, '{\"page_DeviceStateModelView\": \"6\"}', '2021-05-13 16:05:59', 63, 'https://upgrade.wifi.sim.com:8888/devicestatemodelview/list/?page_DeviceStateModelView=8', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (511, 'list', 1, NULL, NULL, '{\"page_DeviceStateModelView\": \"3\"}', '2021-05-13 16:06:00', 60, 'https://upgrade.wifi.sim.com:8888/devicestatemodelview/list/?page_DeviceStateModelView=6', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (512, 'list', 1, NULL, NULL, '{}', '2021-05-13 16:06:04', 52, 'https://upgrade.wifi.sim.com:8888/devicestatemodelview/list/?page_DeviceStateModelView=3', '/dictionarymodelview/list/');
INSERT INTO `logs` VALUES (513, 'list', 1, NULL, NULL, '{}', '2021-05-13 16:06:08', 58, 'https://upgrade.wifi.sim.com:8888/dictionarymodelview/list/', '/dictionaryitemmodelview/list/');
INSERT INTO `logs` VALUES (514, 'list', 1, NULL, NULL, '{}', '2021-05-13 16:06:35', 58, 'https://upgrade.wifi.sim.com:8888/permissionviews/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (515, 'list', 1, NULL, NULL, '{\"_oc_DeviceModelModelView\": \"check_mode\", \"_od_DeviceModelModelView\": \"asc\"}', '2021-05-13 16:06:38', 62, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (516, 'list', 1, NULL, NULL, '{\"_oc_DeviceModelModelView\": \"check_mode\", \"_od_DeviceModelModelView\": \"desc\"}', '2021-05-13 16:06:39', 59, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/?_oc_DeviceModelModelView=check_mode&_od_DeviceModelModelView=asc', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (517, 'add', 1, NULL, NULL, '{}', '2021-05-13 16:06:42', 31, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/?_oc_DeviceModelModelView=check_mode&_od_DeviceModelModelView=desc', '/devicemodelmodelview/add');
INSERT INTO `logs` VALUES (518, 'list', 1, NULL, NULL, '{}', '2021-05-13 16:29:24', 60, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/add', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (519, 'list', 1, NULL, NULL, '{}', '2021-05-13 16:29:26', 82, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (520, 'list', 1, NULL, NULL, '{}', '2021-05-13 16:29:46', 57, 'https://upgrade.wifi.sim.com:8888/deviceinstancemodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (521, 'list', 1, NULL, NULL, '{}', '2021-05-13 16:29:48', 112, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (522, 'list', 1, NULL, NULL, '{}', '2021-05-13 16:29:50', 58, 'https://upgrade.wifi.sim.com:8888/deviceinstancemodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (523, 'list', 1, NULL, NULL, '{}', '2021-05-14 19:22:36', 61, 'https://upgrade.wifi.sim.com:8888/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (524, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-14 19:22:38', 45, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (525, 'list', 1, NULL, NULL, '{}', '2021-05-14 19:22:49', 57, 'https://upgrade.wifi.sim.com:8888/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (526, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-14 19:22:51', 45, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (527, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"IjQwOTJiYjYyN2ZjZDQzNDM1YzE1ODk1MDNmZWUxNjI5MDhiMjY2MTUi.YJ5diw.zyql-Mvpdf_ImNbvknaUKGFk_Kw\", \"name\": \"SIMAX1800T\", \"check_mode\": \"1\", \"check_period\": \"1800\", \"new_version_check_period\": \"1\", \"allow_upgrade\": \"y\", \"upgrade_limit\": \"10000\", \"upgrade_type\": \"1\", \"upgrade_rules\": \"0105f\", \"description\": \"test 1\", \"pk\": \"2\"}', '2021-05-14 19:23:01', 13, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (528, 'list', 1, NULL, NULL, '{}', '2021-05-14 19:23:01', 56, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (529, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-14 19:23:09', 45, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (530, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"8\"}', '2021-05-14 19:23:13', 32, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/8');
INSERT INTO `logs` VALUES (531, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-14 19:23:27', 44, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (532, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"IjQwOTJiYjYyN2ZjZDQzNDM1YzE1ODk1MDNmZWUxNjI5MDhiMjY2MTUi.YJ5drg.UHQw1ws27dYt1ryMO7DaFfI4b2M\", \"name\": \"SIMAX1800T\", \"check_mode\": \"1\", \"check_period\": \"1800\", \"new_version_check_period\": \"1\", \"allow_upgrade\": \"y\", \"upgrade_limit\": \"10000\", \"upgrade_type\": \"1\", \"upgrade_rules\": \"1923f\", \"description\": \"test 1\", \"pk\": \"2\"}', '2021-05-14 19:23:54', 12, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (533, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"8\"}', '2021-05-14 19:23:54', 32, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/8');
INSERT INTO `logs` VALUES (534, 'list', 1, NULL, NULL, '{}', '2021-05-15 18:36:44', 58, 'https://upgrade.wifi.sim.com:8888/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (535, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-15 18:36:46', 44, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (536, 'list', 1, NULL, NULL, '{}', '2021-05-15 18:36:48', 58, 'https://upgrade.wifi.sim.com:8888/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (537, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-15 18:36:50', 45, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (538, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"ImNiYTM1ZmQzNjE4ZTczNDI4ODMyMWM4NmMzZWI0NzkxNDc0MzNhZTQi.YJ-kQQ.fGDtn-oZ5ZWedsrAi0HqcprwpfU\", \"name\": \"SIMAX1800T\", \"check_mode\": \"1\", \"check_period\": \"7200\", \"new_version_check_period\": \"1\", \"allow_upgrade\": \"y\", \"upgrade_limit\": \"10000\", \"upgrade_type\": \"1\", \"upgrade_rules\": \"0105f\", \"description\": \"test 1\", \"pk\": \"2\"}', '2021-05-15 18:37:03', 13, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (539, 'list', 1, NULL, NULL, '{}', '2021-05-15 18:37:03', 60, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (540, 'show', NULL, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-15 18:41:01', 5, 'http://baidu.com/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (541, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-16 10:05:17', 43, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (542, 'list', 1, NULL, NULL, '{}', '2021-05-16 10:05:19', 59, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (543, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-16 10:05:20', 43, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (544, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"ImNiYTM1ZmQzNjE4ZTczNDI4ODMyMWM4NmMzZWI0NzkxNDc0MzNhZTQi.YKB93w.j720tyxS_bV4oR5A_T_bGleBk2g\", \"name\": \"SIMAX1800T\", \"check_mode\": \"1\", \"check_period\": \"30\", \"new_version_check_period\": \"1\", \"allow_upgrade\": \"y\", \"upgrade_limit\": \"10000\", \"upgrade_type\": \"1\", \"upgrade_rules\": \"0105f\", \"description\": \"test 1\", \"pk\": \"2\"}', '2021-05-16 10:05:32', 12, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (545, 'list', 1, NULL, NULL, '{}', '2021-05-16 10:05:32', 55, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (546, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-16 14:50:02', 47, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (547, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"ImNiYTM1ZmQzNjE4ZTczNDI4ODMyMWM4NmMzZWI0NzkxNDc0MzNhZTQi.YKDAmg.rognWPpG0s_M7ZiP2GTFPWiA2DU\", \"name\": \"SIMAX1800T\", \"check_mode\": \"1\", \"check_period\": \"7200\", \"new_version_check_period\": \"1\", \"allow_upgrade\": \"y\", \"upgrade_limit\": \"10000\", \"upgrade_type\": \"1\", \"upgrade_rules\": \"0105f\", \"description\": \"test 1\", \"pk\": \"2\"}', '2021-05-16 14:50:07', 13, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (548, 'list', 1, NULL, NULL, '{}', '2021-05-16 14:50:07', 62, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (549, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-16 14:50:14', 45, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (550, 'list', 1, NULL, NULL, '{}', '2021-05-20 15:34:16', 62, 'https://upgrade.wifi.sim.com:8888/', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (551, 'list', 1, NULL, NULL, '{}', '2021-05-20 15:34:18', 57, 'https://upgrade.wifi.sim.com:8888/devicestatemodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (552, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-20 15:34:20', 43, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (553, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"8\"}', '2021-05-20 15:34:33', 33, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/8');
INSERT INTO `logs` VALUES (554, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"ImI3MTFjOGQyMjgwMDJlN2I0ZTI2YWJhOGNiYWIxMzM0YWExYTQ3MmYi.YKYRCQ.YLd8oY6Di5Jl82Cavy4yBx8v1aM\", \"version\": \"V1.0-202105131200\", \"display_version\": \"V1.0-202105131200\", \"upgrade_type\": \"critical\", \"status\": \"0\", \"start_datetime\": \"2021-05-09 09:47:33\", \"upgrade_limit\": \"0\", \"daily_upgrade_limit\": \"0\", \"version_range\": \"\", \"area_range\": \"\", \"file_size\": \"19732688\", \"file_md5\": \"add6d24f74243db287733c543cf6f722\", \"description\": \"\\u6d4b\\u8bd5\\u5347\\u7ea7\\u6a21\\u5757\\u521d\\u59cb\\u7248\\u672c\", \"english_description\": \"upgrade model init version\", \"traditional_description\": \"\", \"_flt_0_device_model\": \"2\", \"pk\": \"8\"}', '2021-05-20 15:35:03', 39, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/edit/8?_flt_0_device_model=2', '/romsoftwaremodelview/edit/8');
INSERT INTO `logs` VALUES (555, 'list', 1, NULL, NULL, '{}', '2021-05-20 15:40:40', 58, 'https://upgrade.wifi.sim.com:8888/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (556, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-20 15:40:42', 47, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (557, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\"}', '2021-05-20 15:40:47', 30, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (558, 'add', 1, NULL, NULL, '{\"csrf_token\": \"ImI3MTFjOGQyMjgwMDJlN2I0ZTI2YWJhOGNiYWIxMzM0YWExYTQ3MmYi.YKYSfg.MhC3_pBAFc5bbBfMfNfTeIphKnk\", \"version\": \"V1.0-202105182000\", \"display_version\": \"V1.0-202105182000\", \"upgrade_type\": \"critical\", \"status\": \"0\", \"start_datetime\": \"2021-05-17 15:40:49\", \"upgrade_limit\": \"0\", \"daily_upgrade_limit\": \"0\", \"version_range\": \"\", \"area_range\": \"\", \"file_size\": \"19747440\", \"file_md5\": \"2573857e0ac5ff5e3e00256a0707bd19\", \"description\": \"\\u4f18\\u5316\\u529f\\u80fd\\uff0c\\u63d0\\u9ad8\\u7a33\\u5b9a\\u6027\\uff01\", \"english_description\": \"init version\", \"traditional_description\": \"init version\", \"_flt_0_device_model\": \"2\"}', '2021-05-20 15:46:30', 211, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/add?_flt_0_device_model=2', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (559, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-20 15:46:30', 46, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/add?_flt_0_device_model=2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (560, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"9\"}', '2021-05-20 15:50:15', 33, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/9');
INSERT INTO `logs` VALUES (561, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"ImI3MTFjOGQyMjgwMDJlN2I0ZTI2YWJhOGNiYWIxMzM0YWExYTQ3MmYi.YKYUtg.Pf7OkgSe8vDLtLCtiM2fW1dhqnQ\", \"version\": \"V1.0-202105182000\", \"display_version\": \"V1.0-202105182000\", \"upgrade_type\": \"critical\", \"status\": \"0\", \"start_datetime\": \"2021-05-17 15:40:49\", \"upgrade_limit\": \"0\", \"daily_upgrade_limit\": \"0\", \"version_range\": \"\", \"area_range\": \"\", \"file_size\": \"19747440\", \"file_md5\": \"2573857e0ac5ff5e3e00256a0707bd19\", \"description\": \"1\\u3001\\u4f18\\u5316\\u529f\\u80fd\\uff0c\\u63d0\\u9ad8\\u7a33\\u5b9a\\u6027\\r\\n2\\u3001\\u65b0\\u589e\\u9ad8\\u6027\\u80fd\\u6a21\\u5f0f\\r\\n3\\u3001\\u652f\\u6301Qos\\u529f\\u80fd\", \"english_description\": \"init version\", \"traditional_description\": \"init version\", \"_flt_0_device_model\": \"2\", \"pk\": \"9\"}', '2021-05-20 15:50:39', 47, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/edit/9?_flt_0_device_model=2', '/romsoftwaremodelview/edit/9');
INSERT INTO `logs` VALUES (562, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"ImI3MTFjOGQyMjgwMDJlN2I0ZTI2YWJhOGNiYWIxMzM0YWExYTQ3MmYi.YKYUzw.n6QiW1ir5r9rRk2OEAKhjSVejeA\", \"version\": \"V1.0-202105182000\", \"display_version\": \"V1.0-202105182000\", \"upgrade_type\": \"critical\", \"status\": \"0\", \"start_datetime\": \"2021-05-17 15:40:49\", \"upgrade_limit\": \"0\", \"daily_upgrade_limit\": \"0\", \"version_range\": \"\", \"area_range\": \"\", \"file_size\": \"19747440\", \"file_md5\": \"2573857e0ac5ff5e3e00256a0707bd19\", \"description\": \"1\\u3001\\u4f18\\u5316\\u529f\\u80fd\\uff0c\\u63d0\\u9ad8\\u7a33\\u5b9a\\u6027\\r\\n2\\u3001\\u65b0\\u589e\\u9ad8\\u6027\\u80fd\\u6a21\\u5f0f\\r\\n3\\u3001\\u652f\\u6301Qos\\u529f\\u80fd\", \"english_description\": \"init version\", \"traditional_description\": \"init version\", \"_flt_0_device_model\": \"2\", \"pk\": \"9\"}', '2021-05-20 15:50:59', 206, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/edit/9?_flt_0_device_model=2', '/romsoftwaremodelview/edit/9');
INSERT INTO `logs` VALUES (563, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-20 15:50:59', 45, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/edit/9?_flt_0_device_model=2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (564, 'list', 1, NULL, NULL, '{}', '2021-05-21 09:26:53', 114, 'https://upgrade.wifi.sim.com:8888/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (565, 'list', 1, NULL, NULL, '{}', '2021-05-21 09:26:58', 58, 'https://upgrade.wifi.sim.com:8888/deviceinstancemodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (566, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-05-21 09:27:03', 42, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (567, 'list', 1, NULL, NULL, '{}', '2021-05-21 09:32:29', 59, 'https://upgrade.wifi.sim.com:8888/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (568, 'list', 1, NULL, NULL, '{}', '2021-05-21 09:34:21', 60, 'https://upgrade.wifi.sim.com:8888/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (569, 'list', NULL, NULL, NULL, '{}', '2021-05-21 09:48:59', 5, 'http://baidu.com/', '/deviceinstancemodelview/list/');
INSERT INTO `logs` VALUES (570, 'list', 1, NULL, NULL, '{}', '2021-05-21 17:55:08', 59, NULL, '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (571, 'list', 1, NULL, NULL, '{}', '2021-05-24 10:57:59', 144, 'https://upgrade.wifi.sim.com:8888/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (572, 'edit', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-05-24 10:58:09', 57, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/1');
INSERT INTO `logs` VALUES (573, 'show', 1, NULL, NULL, '{\"_flt_0_device_model\": \"1\", \"pk\": \"2\"}', '2021-05-24 10:58:16', 43, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/1', '/romsoftwaremodelview/show/2');
INSERT INTO `logs` VALUES (574, 'edit', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-05-24 10:58:27', 46, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/1');
INSERT INTO `logs` VALUES (575, 'list', 1, NULL, NULL, '{}', '2021-05-24 10:58:29', 58, 'https://upgrade.wifi.sim.com:8888/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (576, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-24 10:58:35', 44, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (577, 'show', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"8\"}', '2021-05-24 10:58:49', 32, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/show/2', '/romsoftwaremodelview/show/8');
INSERT INTO `logs` VALUES (578, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-24 10:59:14', 43, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (579, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"8\"}', '2021-05-24 10:59:19', 33, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/show/2', '/romsoftwaremodelview/edit/8');
INSERT INTO `logs` VALUES (580, 'list', NULL, NULL, NULL, '{}', '2021-05-24 10:59:34', 5, 'http://baidu.com/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (581, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-24 11:00:49', 43, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (582, 'show', NULL, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-24 11:00:56', 5, 'http://baidu.com/', '/romsoftwaremodelview/show/2');
INSERT INTO `logs` VALUES (583, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\"}', '2021-05-24 11:01:01', 34, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/show/2', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (584, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-24 11:05:19', 44, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (585, 'show', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"8\"}', '2021-05-24 11:05:22', 31, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/show/2', '/romsoftwaremodelview/show/8');
INSERT INTO `logs` VALUES (586, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-24 11:06:57', 44, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (587, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"8\"}', '2021-05-24 11:06:59', 32, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/show/2', '/romsoftwaremodelview/edit/8');
INSERT INTO `logs` VALUES (588, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"IjhmZDI2MjUyNGE2NTQ2ZGJkYWQ5Y2MxNWIwYjU3YWVjNDNhMzRhZWQi.YKsYUw.uwpi4MsqMrG5UCtQR0cWp-qEfkE\", \"version\": \"V1.0-202105131200\", \"display_version\": \"V1.0-202105131200\", \"upgrade_type\": \"no\", \"status\": \"0\", \"start_datetime\": \"2021-05-09 09:47:33\", \"upgrade_limit\": \"0\", \"daily_upgrade_limit\": \"0\", \"version_range\": \"\", \"area_range\": \"\", \"file_size\": \"19732688\", \"file_md5\": \"add6d24f74243db287733c543cf6f722\", \"description\": \"upgrade model init version\", \"english_description\": \"upgrade model init version\", \"traditional_description\": \"\", \"_flt_0_device_model\": \"2\", \"pk\": \"8\"}', '2021-05-24 11:07:05', 43, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/edit/8?_flt_0_device_model=2', '/romsoftwaremodelview/edit/8');
INSERT INTO `logs` VALUES (589, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"8\"}', '2021-05-24 11:10:26', 32, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/show/2', '/romsoftwaremodelview/edit/8');
INSERT INTO `logs` VALUES (590, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-24 11:10:30', 44, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (591, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"8\"}', '2021-05-24 11:10:35', 32, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/show/2', '/romsoftwaremodelview/edit/8');
INSERT INTO `logs` VALUES (592, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"IjhmZDI2MjUyNGE2NTQ2ZGJkYWQ5Y2MxNWIwYjU3YWVjNDNhMzRhZWQi.YKsZKg.Ga_w1cQuuSkM9YRC8ekU80M653k\", \"version\": \"V1.0-202105131200\", \"display_version\": \"V1.0-202105131200\", \"upgrade_type\": \"no\", \"status\": \"0\", \"start_datetime\": \"2021-05-09 09:47:33\", \"upgrade_limit\": \"0\", \"daily_upgrade_limit\": \"0\", \"version_range\": \"\", \"area_range\": \"\", \"file_size\": \"19732688\", \"file_md5\": \"add6d24f74243db287733c543cf6f722\", \"description\": \"upgrade model init version\", \"english_description\": \"upgrade model init version\", \"traditional_description\": \"\", \"_flt_0_device_model\": \"2\", \"pk\": \"8\"}', '2021-05-24 11:10:42', 45, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/edit/8?_flt_0_device_model=2', '/romsoftwaremodelview/edit/8');
INSERT INTO `logs` VALUES (593, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"8\"}', '2021-05-24 11:16:45', 35, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/show/2', '/romsoftwaremodelview/edit/8');
INSERT INTO `logs` VALUES (594, 'list', 1, NULL, NULL, '{}', '2021-05-24 11:22:43', 66, 'https://upgrade.wifi.sim.com:8888/', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (595, 'list', 1, NULL, NULL, '{}', '2021-05-24 11:22:47', 63, 'https://upgrade.wifi.sim.com:8888/devicestatemodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (596, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-24 11:22:50', 45, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (597, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"9\"}', '2021-05-24 11:22:57', 32, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/9');
INSERT INTO `logs` VALUES (598, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-24 11:23:47', 43, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (599, 'add', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\"}', '2021-05-24 11:23:49', 31, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/show/2', '/romsoftwaremodelview/add');
INSERT INTO `logs` VALUES (600, 'edit', 1, NULL, NULL, '{\"csrf_token\": \"IjNhMWMwNjlhNmViM2RhNTYwYTRjYjA2MGY5NWUxYzA5MjdhMGZkNTIi.YKscEQ.yV5GbxLGgnC2H2YKmcLQXqUDTCs\", \"version\": \"V1.0-202105182000\", \"display_version\": \"V1.0-202105182000\", \"upgrade_type\": \"no\", \"status\": \"0\", \"start_datetime\": \"2021-05-17 15:40:49\", \"upgrade_limit\": \"0\", \"daily_upgrade_limit\": \"0\", \"version_range\": \"\", \"area_range\": \"\", \"file_size\": \"19747440\", \"file_md5\": \"2573857e0ac5ff5e3e00256a0707bd19\", \"description\": \"1\\u3001\\u4f18\\u5316\\u529f\\u80fd\\uff0c\\u63d0\\u9ad8\\u7a33\\u5b9a\\u6027\\r\\n2\\u3001\\u65b0\\u589e\\u9ad8\\u6027\\u80fd\\u6a21\\u5f0f\\r\\n3\\u3001\\u652f\\u6301Qos\\u529f\\u80fd\", \"english_description\": \"init version\", \"traditional_description\": \"init version\", \"_flt_0_device_model\": \"2\", \"pk\": \"9\"}', '2021-05-24 11:27:01', 281, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/edit/9?_flt_0_device_model=2', '/romsoftwaremodelview/edit/9');
INSERT INTO `logs` VALUES (601, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-24 11:27:01', 44, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/edit/9?_flt_0_device_model=2', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (602, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-24 11:40:44', 45, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/add?_flt_0_device_model=2', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (603, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-24 11:40:55', 45, NULL, '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (604, 'list', 1, NULL, NULL, '{}', '2021-05-25 11:12:22', 65, 'https://upgrade.wifi.sim.com:8888/', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (605, 'list', 1, NULL, NULL, '{}', '2021-05-25 11:12:35', 60, 'https://upgrade.wifi.sim.com:8888/devicestatemodelview/list/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (606, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-25 11:12:47', 44, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (607, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"9\"}', '2021-05-25 11:12:52', 32, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/9');
INSERT INTO `logs` VALUES (608, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-25 11:13:04', 45, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (609, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"9\"}', '2021-05-25 11:14:15', 33, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/9');
INSERT INTO `logs` VALUES (610, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-25 11:14:22', 46, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (611, 'list', 1, NULL, NULL, '{}', '2021-05-25 12:37:01', 59, 'https://upgrade.wifi.sim.com:8888/', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (612, 'edit', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-25 12:39:17', 45, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/edit/2');
INSERT INTO `logs` VALUES (613, 'edit', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"9\"}', '2021-05-25 12:39:36', 34, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/edit/2', '/romsoftwaremodelview/edit/9');
INSERT INTO `logs` VALUES (614, 'list', 1, NULL, NULL, '{}', '2021-05-25 12:40:42', 62, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/edit/9?_flt_0_device_model=2', '/devicestatemodelview/list/');
INSERT INTO `logs` VALUES (615, 'list', 1, NULL, NULL, '{}', '2021-05-25 12:40:49', 52, 'https://upgrade.wifi.sim.com:8888/devicestatemodelview/list/', '/dictionarymodelview/list/');
INSERT INTO `logs` VALUES (616, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-05-25 12:40:53', 30, 'https://upgrade.wifi.sim.com:8888/dictionarymodelview/list/', '/dictionarymodelview/show/1');
INSERT INTO `logs` VALUES (617, 'list', 1, NULL, NULL, '{}', '2021-05-25 12:40:56', 54, 'https://upgrade.wifi.sim.com:8888/devicestatemodelview/list/', '/dictionarymodelview/list/');
INSERT INTO `logs` VALUES (618, 'list', 1, NULL, NULL, '{}', '2021-05-25 12:40:58', 55, 'https://upgrade.wifi.sim.com:8888/dictionarymodelview/list/', '/dictionaryitemmodelview/list/');
INSERT INTO `logs` VALUES (619, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-05-25 12:41:00', 31, 'https://upgrade.wifi.sim.com:8888/dictionaryitemmodelview/list/', '/dictionaryitemmodelview/show/1');
INSERT INTO `logs` VALUES (620, 'list', 1, NULL, NULL, '{}', '2021-05-25 12:41:30', 52, 'https://upgrade.wifi.sim.com:8888/permissions/list/', '/dictionarymodelview/list/');
INSERT INTO `logs` VALUES (621, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-05-25 12:41:36', 31, 'https://upgrade.wifi.sim.com:8888/dictionarymodelview/list/', '/dictionarymodelview/show/1');
INSERT INTO `logs` VALUES (622, 'list', 1, NULL, NULL, '{}', '2021-05-25 12:45:00', 58, 'https://upgrade.wifi.sim.com:8888/dictionarymodelview/show/1', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (623, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-25 12:45:02', 44, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (624, 'show', 1, NULL, NULL, '{\"_flt_0_device_model\": \"2\", \"pk\": \"9\"}', '2021-05-25 12:45:13', 34, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/show/2', '/romsoftwaremodelview/show/9');
INSERT INTO `logs` VALUES (625, 'list', 1, NULL, NULL, '{}', '2021-05-25 12:45:45', 59, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/show/9?_flt_0_device_model=2', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (626, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-05-25 12:48:48', 44, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (627, 'list', 1, NULL, NULL, '{}', '2021-05-25 12:48:53', 61, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/show/9?_flt_0_device_model=2', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (628, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-25 12:48:55', 43, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');
INSERT INTO `logs` VALUES (629, 'list', 1, NULL, NULL, '{}', '2021-05-25 12:48:59', 61, 'https://upgrade.wifi.sim.com:8888/romsoftwaremodelview/show/9?_flt_0_device_model=2', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (630, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-05-25 12:49:17', 44, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (631, 'list', 1, NULL, NULL, '{}', '2021-05-25 12:52:07', 59, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/show/1', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (632, 'add', 1, NULL, NULL, '{}', '2021-05-25 12:52:14', 31, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/add');
INSERT INTO `logs` VALUES (633, 'list', 1, NULL, NULL, '{}', '2021-05-25 12:52:26', 58, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/show/1', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (634, 'show', 1, NULL, NULL, '{\"pk\": \"1\"}', '2021-05-25 12:52:30', 42, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/show/1');
INSERT INTO `logs` VALUES (635, 'list', 1, NULL, NULL, '{}', '2021-05-25 12:53:18', 59, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/show/1', '/devicemodelmodelview/list/');
INSERT INTO `logs` VALUES (636, 'show', 1, NULL, NULL, '{\"pk\": \"2\"}', '2021-05-25 12:53:35', 77, 'https://upgrade.wifi.sim.com:8888/devicemodelmodelview/list/', '/devicemodelmodelview/show/2');

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
  CONSTRAINT `rom_softwares_ibfk_2` FOREIGN KEY (`created_by_fk`) REFERENCES `ab_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rom_softwares_ibfk_3` FOREIGN KEY (`changed_by_fk`) REFERENCES `ab_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rom_softwares
-- ----------------------------
INSERT INTO `rom_softwares` VALUES ('2021-04-25 14:29:00', '2021-04-25 14:29:00', 2, 1, 'V2.1', 'V2.1', 'critical', 1, '2021-04-25 14:28:13', NULL, NULL, NULL, '', '850e179c-a58f-11eb-9098-697ca16882ad_sep_test.txt', 0, 'test', '', '', 'test', 1, 1, 'https://upgrade.wifi.sim.com/software', '/home/zhuojh/SoftwareAdmin/app/static/uploads');
INSERT INTO `rom_softwares` VALUES ('2021-05-10 13:53:46', '2021-05-10 16:12:28', 4, 2, 'V1.0-202105101100', 'V1.0-202105101100', 'critical', 0, '2021-05-09 09:47:33', 0, 0, '', '', '75e14710-b167-11eb-a55b-ff5514cba83a_sep_TB-WR1800K-MT7621-CPE-SIMAX1800T-V1.0-202105101100', 19243120, '58c63e975608c6dc4fcb2e4cb89ad194', 'test 2', '', 'test 2', 1, 1, 'https://upgrade.wifi.sim.com/software', '/home/zhuojh/SoftwareAdmin/app/static/uploads');
INSERT INTO `rom_softwares` VALUES ('2021-05-12 11:34:48', '2021-05-12 11:34:48', 5, 2, 'V1.0-202105111500', 'V1.0-202105111500', 'critical', 0, '2021-05-09 09:47:33', 0, 0, '', '', '00853400-b2d3-11eb-a249-07a34e7c09d5_sep_TB-WR1800K-MT7621-CPE-SIMAX1800T-V1.0-202105111500', 19718960, '05a73d44ea7b43df92c6c796a32f76b6', 'test 3', '', 'test 3', 1, 1, 'https://upgrade.wifi.sim.com/software', '/home/upgrade/software/admin/app/static/uploads');
INSERT INTO `rom_softwares` VALUES ('2021-05-12 18:14:02', '2021-05-12 18:14:02', 6, 2, 'V1.0-202105121740', 'V1.0-202105121740', 'critical', 0, '2021-05-09 09:47:33', 0, 0, '', '', 'c5c76760-b30a-11eb-a249-07a34e7c09d5_sep_TB-WR1800K-MT7621-CPE-SIMAX1800T-V1.0-202105121740', 19726496, '4c387553544f5977f7a68a453cf9a481', 'test https', 'test https', 'test https', 1, 1, 'https://upgrade.wifi.sim.com/software', '/home/upgrade/software/admin/app/static/uploads');
INSERT INTO `rom_softwares` VALUES ('2021-05-12 19:36:08', '2021-05-12 21:20:47', 7, 2, 'V1.0-202105121900', 'V1.0-202105121900', 'critical', 0, '2021-05-09 09:47:33', 0, 0, '', '', 'dcc5c8ca-b324-11eb-a249-07a34e7c09d5_sep_TB-WR1800K-MT7621-CPE-SIMAX1800T-V1.0-202105121900', 19731920, '0d2a62c9595e29a6d30a34b047fd9f35', 'test https 0512', '', 'test https 0512', 1, 1, 'https://upgrade.wifi.sim.com/software', '/home/upgrade/software/admin/app/static/uploads');
INSERT INTO `rom_softwares` VALUES ('2021-05-13 14:35:47', '2021-05-13 14:35:47', 8, 2, 'V1.0-202105131200', 'V1.0-202105131200', 'critical', 0, '2021-05-09 09:47:33', 0, 0, '', '', '72f6b814-b3b5-11eb-a249-07a34e7c09d5_sep_TB-WR1800K-MT7621-CPE-SIMAX1800T-V1.0-202105131200', 19732688, 'add6d24f74243db287733c543cf6f722', 'upgrade model init version', '', 'upgrade model init version', 1, 1, 'https://upgrade.wifi.sim.com/software', '/home/upgrade/software/admin/app/static/uploads');
INSERT INTO `rom_softwares` VALUES ('2021-05-20 15:46:30', '2021-05-24 11:27:01', 9, 2, 'V1.0-202105182000', 'V1.0-202105182000', 'no', 0, '2021-05-17 15:40:49', 0, 0, '', '', 'e6d9a4d4-bc3f-11eb-a249-07a34e7c09d5_sep_TB-WR1800K-MT7621-CPE-SIMAX1800T-V1.0-202105182000', 19747440, '2573857e0ac5ff5e3e00256a0707bd19', 'init version', 'init version', '1、优化功能，提高稳定性\r\n2、新增高性能模式\r\n3、支持Qos功能', 1, 1, 'https://upgrade.wifi.sim.com/software', '/home/upgrade/software/admin/app/static/uploads');

SET FOREIGN_KEY_CHECKS = 1;
