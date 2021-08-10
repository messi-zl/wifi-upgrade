/*
 Navicat Premium Data Transfer

 Source Server         : 本地mysql
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:3306
 Source Schema         : auth_zl

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 10/08/2021 10:26:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for areas
-- ----------------------------
DROP TABLE IF EXISTS `areas`;
CREATE TABLE `areas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键ID',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '关联上级ID',
  `code` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域编码',
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域名称',
  `created_on` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `changed_on` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `created_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `changed_by` int(11) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `areas_ibfk_1`(`created_by`) USING BTREE,
  INDEX `areas_ibfk_2`(`changed_by`) USING BTREE,
  CONSTRAINT `areas_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `areas_ibfk_2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '地区表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of areas
-- ----------------------------

-- ----------------------------
-- Table structure for device_models
-- ----------------------------
DROP TABLE IF EXISTS `device_models`;
CREATE TABLE `device_models`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '设备型号id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备型号名称',
  `created_on` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `changed_on` datetime NULL DEFAULT NULL COMMENT '更改日期',
  `created_by` int(11) NULL DEFAULT NULL COMMENT '创建者',
  `changed_by` int(11) NULL DEFAULT NULL COMMENT '更改者',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `created_by`(`created_by`) USING BTREE,
  INDEX `changed_by`(`changed_by`) USING BTREE,
  CONSTRAINT `device_models_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `device_models_ibfk_2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备型号表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of device_models
-- ----------------------------
INSERT INTO `device_models` VALUES (1, 'SIMRouter-1', NULL, NULL, NULL, NULL);
INSERT INTO `device_models` VALUES (2, 'SIMRouter-2', NULL, NULL, NULL, NULL);
INSERT INTO `device_models` VALUES (3, 'SIMRouter-3', NULL, NULL, NULL, NULL);
INSERT INTO `device_models` VALUES (4, 'SIMCamera-1', NULL, NULL, NULL, NULL);
INSERT INTO `device_models` VALUES (5, 'SIMCamera-2', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for device_type_model_relation
-- ----------------------------
DROP TABLE IF EXISTS `device_type_model_relation`;
CREATE TABLE `device_type_model_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '设备类型id',
  `model_id` int(11) NULL DEFAULT NULL COMMENT '设备型号id',
  `created_on` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `changed_on` datetime NULL DEFAULT NULL COMMENT '更改日期',
  `created_by` int(11) NULL DEFAULT NULL COMMENT '创建者',
  `changed_by` int(11) NULL DEFAULT NULL COMMENT '更改者',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE,
  INDEX `model_id`(`model_id`) USING BTREE,
  INDEX `created_by`(`created_by`) USING BTREE,
  INDEX `changed_by`(`changed_by`) USING BTREE,
  CONSTRAINT `device_type_model_relation_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `device_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `device_type_model_relation_ibfk_2` FOREIGN KEY (`model_id`) REFERENCES `device_models` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `device_type_model_relation_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `device_type_model_relation_ibfk_4` FOREIGN KEY (`changed_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备类型和型号关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of device_type_model_relation
-- ----------------------------
INSERT INTO `device_type_model_relation` VALUES (1, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `device_type_model_relation` VALUES (2, 1, 2, NULL, NULL, NULL, NULL);
INSERT INTO `device_type_model_relation` VALUES (3, 1, 3, NULL, NULL, NULL, NULL);
INSERT INTO `device_type_model_relation` VALUES (4, 2, 4, NULL, NULL, NULL, NULL);
INSERT INTO `device_type_model_relation` VALUES (5, 2, 5, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for device_types
-- ----------------------------
DROP TABLE IF EXISTS `device_types`;
CREATE TABLE `device_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '设备类型id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备类型名称',
  `created_on` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `changed_on` datetime NULL DEFAULT NULL COMMENT '更改日期',
  `created_by` int(11) NULL DEFAULT NULL COMMENT '创建者',
  `changed_by` int(11) NULL DEFAULT NULL COMMENT '更改者',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `created_by`(`created_by`) USING BTREE,
  INDEX `changed_by`(`changed_by`) USING BTREE,
  CONSTRAINT `device_types_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `device_types_ibfk_2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of device_types
-- ----------------------------
INSERT INTO `device_types` VALUES (1, '路由器', NULL, NULL, NULL, NULL);
INSERT INTO `device_types` VALUES (2, '摄像头', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for dictionary_items
-- ----------------------------
DROP TABLE IF EXISTS `dictionary_items`;
CREATE TABLE `dictionary_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键ID',
  `dictionary_id` int(11) NOT NULL COMMENT '关联数据字典id',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典条目编码',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典条目名称',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典条目值',
  `sort` int(6) NOT NULL COMMENT '排名',
  `created_on` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `changed_on` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `created_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `changed_by` int(11) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dictionary_items_ibfk_1`(`dictionary_id`) USING BTREE,
  INDEX `dictionary_items_ibfk_2`(`created_by`) USING BTREE,
  INDEX `dictionary_items_ibfk_3`(`changed_by`) USING BTREE,
  CONSTRAINT `dictionary_items_ibfk_1` FOREIGN KEY (`dictionary_id`) REFERENCES `dictionarys` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dictionary_items_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dictionary_items_ibfk_3` FOREIGN KEY (`changed_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典条目表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dictionary_items
-- ----------------------------

-- ----------------------------
-- Table structure for dictionarys
-- ----------------------------
DROP TABLE IF EXISTS `dictionarys`;
CREATE TABLE `dictionarys`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键ID',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据字典编码',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据字典名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `created_on` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `changed_on` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `created_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `changed_by` int(11) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dictionarys_ibfk_1`(`created_by`) USING BTREE,
  INDEX `dictionarys_ibfk_2`(`changed_by`) USING BTREE,
  CONSTRAINT `dictionarys_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `dictionarys_ibfk_2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据字典表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dictionarys
-- ----------------------------

-- ----------------------------
-- Table structure for login_logs
-- ----------------------------
DROP TABLE IF EXISTS `login_logs`;
CREATE TABLE `login_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id',
  `use_id` int(11) NULL DEFAULT NULL COMMENT '关联用户id',
  `status` int(1) NULL DEFAULT NULL COMMENT '登录的状态(0:登录失败；1:登录成功)',
  `login_time` datetime NULL DEFAULT NULL COMMENT '登录的时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 188 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户登录日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of login_logs
-- ----------------------------
INSERT INTO `login_logs` VALUES (171, 11, 0, '2021-08-02 17:52:30');
INSERT INTO `login_logs` VALUES (172, 11, 0, '2021-08-02 17:52:51');
INSERT INTO `login_logs` VALUES (173, 11, 0, '2021-08-02 17:57:26');
INSERT INTO `login_logs` VALUES (174, 11, 0, '2021-08-02 18:00:58');
INSERT INTO `login_logs` VALUES (175, 11, 1, '2021-08-02 18:01:57');
INSERT INTO `login_logs` VALUES (176, 11, 1, '2021-08-02 18:18:33');
INSERT INTO `login_logs` VALUES (177, 11, 1, '2021-08-02 19:26:57');
INSERT INTO `login_logs` VALUES (178, 11, 1, '2021-08-03 09:37:32');
INSERT INTO `login_logs` VALUES (179, 11, 1, '2021-08-03 10:45:13');
INSERT INTO `login_logs` VALUES (180, 11, 1, '2021-08-03 10:57:52');
INSERT INTO `login_logs` VALUES (181, 11, 1, '2021-08-03 16:01:57');
INSERT INTO `login_logs` VALUES (182, 11, 0, '2021-08-03 16:57:05');
INSERT INTO `login_logs` VALUES (183, 11, 0, '2021-08-03 16:57:09');
INSERT INTO `login_logs` VALUES (184, 11, 0, '2021-08-03 16:57:10');
INSERT INTO `login_logs` VALUES (185, 11, 0, '2021-08-03 16:57:10');
INSERT INTO `login_logs` VALUES (186, 11, 0, '2021-08-03 16:57:11');
INSERT INTO `login_logs` VALUES (187, 11, 0, '2021-08-03 17:09:32');

-- ----------------------------
-- Table structure for operation_logs
-- ----------------------------
DROP TABLE IF EXISTS `operation_logs`;
CREATE TABLE `operation_logs`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增主键ID',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '具体日志描述',
  `action` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '动作',
  `request_path` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求路径',
  `json` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请求json参数',
  `ip_addr` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'IP地址',
  `duration_ms` int(11) NULL DEFAULT NULL COMMENT '持续时间(毫秒)',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `created_by` int(11) UNSIGNED NOT NULL COMMENT '操作人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 912 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of operation_logs
-- ----------------------------
INSERT INTO `operation_logs` VALUES (772, '登录以后返回token', 'login', '/permission/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@50edfd87', '192.168.2.143', NULL, '2021-08-02 17:46:38', 8888);
INSERT INTO `operation_logs` VALUES (773, '登录以后返回token', 'login', '/permission/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@1e9aecb4', '192.168.2.143', NULL, '2021-08-02 17:47:00', 8888);
INSERT INTO `operation_logs` VALUES (774, '登录以后返回token', 'login', '/permission/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@76817b09', '192.168.2.143', NULL, '2021-08-02 17:47:19', 8888);
INSERT INTO `operation_logs` VALUES (775, '用户注册', 'register', '/permission/users/register', 'UsersParam{username=\'libai\', password=\'123\', employeeNo=\'0001\'}', '192.168.2.143', 55, '2021-08-02 17:50:54', 8888);
INSERT INTO `operation_logs` VALUES (776, '用户注册', 'register', '/permission/users/register', 'UsersParam{username=\'libai\', password=\'1232\', employeeNo=\'0001\'}', '192.168.2.143', 9, '2021-08-02 17:52:04', 8888);
INSERT INTO `operation_logs` VALUES (777, '登录以后返回token', 'login', '/permission/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@620ea30', '192.168.2.143', NULL, '2021-08-02 17:52:23', 8888);
INSERT INTO `operation_logs` VALUES (778, '登录以后返回token', 'login', '/permission/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@3f22d799', '192.168.2.143', NULL, '2021-08-02 17:52:30', 8888);
INSERT INTO `operation_logs` VALUES (779, '登录以后返回token', 'login', '/permission/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@31a748a4', '192.168.2.143', NULL, '2021-08-02 17:52:51', 8888);
INSERT INTO `operation_logs` VALUES (780, '登录以后返回token', 'login', '/permission/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@70ef8e68', '192.168.2.143', NULL, '2021-08-02 17:57:51', 8888);
INSERT INTO `operation_logs` VALUES (781, '登录以后返回token', 'login', '/permission/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@26ef81eb', '192.168.2.143', NULL, '2021-08-02 18:01:16', 8888);
INSERT INTO `operation_logs` VALUES (782, '登录以后返回token', 'login', '/permission/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@5163a20', '192.168.2.143', 2945, '2021-08-02 18:01:58', 8888);
INSERT INTO `operation_logs` VALUES (783, '登录以后返回token', 'login', '/permission/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@2b695079', '192.168.2.143', 307, '2021-08-02 18:18:33', 8888);
INSERT INTO `operation_logs` VALUES (784, '判断用户对某请求是否具有权限', 'judgePermission', '/permission/test/judgePermission', '[{username=libai}, {url=/permission/users/info}]', '192.168.2.143', 12, '2021-08-02 18:19:41', 8888);
INSERT INTO `operation_logs` VALUES (785, '获取当前登录用户的信息', 'getUserInfo', '/permission/users/info', '', '192.168.2.143', NULL, '2021-08-02 18:19:41', 8888);
INSERT INTO `operation_logs` VALUES (786, '判断用户对某请求是否具有权限', 'judgePermission', '/permission/test/judgePermission', '[{username=libai}, {url=/permission/users/info}]', '192.168.2.143', 21659, '2021-08-02 18:20:32', 8888);
INSERT INTO `operation_logs` VALUES (787, '获取当前登录用户的信息', 'getUserInfo', '/permission/users/info', '', '192.168.2.143', NULL, '2021-08-02 18:22:35', 8888);
INSERT INTO `operation_logs` VALUES (788, '判断用户对某请求是否具有权限', 'judgePermission', '/permission/test/judgePermission', '[{username=libai}, {url=/permission/users/info}]', '192.168.2.143', 6483, '2021-08-02 18:24:13', 8888);
INSERT INTO `operation_logs` VALUES (789, '获取当前登录用户的信息', 'getUserInfo', '/permission/users/info', '', '192.168.2.143', NULL, '2021-08-02 18:26:13', 8888);
INSERT INTO `operation_logs` VALUES (790, '判断用户对某请求是否具有权限', 'judgePermission', '/permission/test/judgePermission', '[{username=libai}, {url=/permission/users/info}]', '192.168.2.143', 5051, '2021-08-02 18:27:12', 8888);
INSERT INTO `operation_logs` VALUES (791, '获取当前登录用户的信息', 'getUserInfo', '/permission/users/info', '', '192.168.2.143', NULL, '2021-08-02 18:27:42', 8888);
INSERT INTO `operation_logs` VALUES (792, '判断用户对某请求是否具有权限', 'judgePermission', '/permission/test/judgePermission', '[{username=libai}, {url=/permission/users/info}]', '192.168.2.143', 96, '2021-08-02 18:33:19', 8888);
INSERT INTO `operation_logs` VALUES (793, '获取当前登录用户的信息', 'getUserInfo', '/permission/users/info', '', '192.168.2.143', NULL, '2021-08-02 18:33:20', 8888);
INSERT INTO `operation_logs` VALUES (794, '判断用户对某请求是否具有权限', 'judgePermission', '/permission/test/judgePermission', '[{username=libai}, {url=/permission/users/info}]', '192.168.2.143', 4116, '2021-08-02 18:33:35', 8888);
INSERT INTO `operation_logs` VALUES (795, '获取当前登录用户的信息', 'getUserInfo', '/permission/users/info', '', '192.168.2.143', NULL, '2021-08-02 18:35:27', 8888);
INSERT INTO `operation_logs` VALUES (796, '判断用户对某请求是否具有权限', 'judgePermission', '/permission/test/judgePermission', '[{username=libai}, {url=/permission/users/info}]', '192.168.2.143', 3768, '2021-08-02 18:36:30', 8888);
INSERT INTO `operation_logs` VALUES (797, '获取当前登录用户的信息', 'getUserInfo', '/permission/users/info', '', '192.168.2.143', NULL, '2021-08-02 18:36:31', 8888);
INSERT INTO `operation_logs` VALUES (798, '判断用户对某请求是否具有权限', 'judgePermission', '/permission/test/judgePermission', '[{username=libai}, {url=/permission/users/info}]', '192.168.2.143', 12010, '2021-08-02 18:36:50', 8888);
INSERT INTO `operation_logs` VALUES (799, '获取当前登录用户的信息', 'getUserInfo', '/permission/users/info', '', '192.168.2.143', NULL, '2021-08-02 18:37:57', 8888);
INSERT INTO `operation_logs` VALUES (800, '判断用户对某请求是否具有权限', 'judgePermission', '/permission/test/judgePermission', '[{username=libai}, {url=/permission/users/info}]', '192.168.2.143', 3634, '2021-08-02 18:40:08', 8888);
INSERT INTO `operation_logs` VALUES (801, '获取当前登录用户的信息', 'getUserInfo', '/permission/users/info', '', '192.168.2.143', NULL, '2021-08-02 18:40:14', 8888);
INSERT INTO `operation_logs` VALUES (802, '判断用户对某请求是否具有权限', 'judgePermission', '/permission/test/judgePermission', '[{username=libai}, {url=/permission/users/info}]', '192.168.2.143', 5866, '2021-08-02 18:45:02', 8888);
INSERT INTO `operation_logs` VALUES (803, '获取当前登录用户的信息', 'getUserInfo', '/permission/users/info', '', '192.168.2.143', 7222, '2021-08-02 18:45:10', 8888);
INSERT INTO `operation_logs` VALUES (804, '判断用户对某请求是否具有权限', 'judgePermission', '/permission/test/judgePermission', '[{username=libai}, {url=/permission/users/info}]', '192.168.2.143', 4, '2021-08-02 18:45:58', 8888);
INSERT INTO `operation_logs` VALUES (805, '获取当前登录用户的信息', 'getUserInfo', '/permission/users/info', '', '192.168.2.143', 5, '2021-08-02 18:45:58', 8888);
INSERT INTO `operation_logs` VALUES (806, '判断用户对某请求是否具有权限', 'judgePermission', '/permission/test/judgePermission', '[{username=libai}, {url=/permission/users/info}]', '192.168.2.143', 7, '2021-08-02 18:50:24', 8888);
INSERT INTO `operation_logs` VALUES (807, '获取当前登录用户的信息', 'getUserInfo', '/permission/users/info', '', '192.168.2.143', 7, '2021-08-02 18:50:24', 8888);
INSERT INTO `operation_logs` VALUES (808, '登出', 'logout', '/permission/users/logout', '', '192.168.2.143', 0, '2021-08-02 18:51:29', 8888);
INSERT INTO `operation_logs` VALUES (809, '登录以后返回token', 'login', '/permission/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@8fdde57', '192.168.2.143', 273, '2021-08-02 19:26:57', 8888);
INSERT INTO `operation_logs` VALUES (810, '判断用户对某请求是否具有权限', 'judgePermission', '/permission/test/judgePermission', '[{username=libai}, {url=/permission/users/info}]', '192.168.2.143', 11, '2021-08-02 19:27:01', 8888);
INSERT INTO `operation_logs` VALUES (811, '获取当前登录用户的信息', 'getUserInfo', '/permission/users/info', '', '192.168.2.143', 49, '2021-08-02 19:27:01', 8888);
INSERT INTO `operation_logs` VALUES (812, '判断用户对某请求是否具有权限', 'judgePermission', '/permission/test/judgePermission', '[{username=libai}, {url=/permission/users/info}]', '192.168.2.143', 7, '2021-08-02 19:38:03', 8888);
INSERT INTO `operation_logs` VALUES (813, '获取当前登录用户的信息', 'getUserInfo', '/permission/users/info', '', '192.168.2.143', 9, '2021-08-02 19:38:03', 8888);
INSERT INTO `operation_logs` VALUES (814, '判断用户对某请求是否具有权限', 'judgePermission', '/permission/test/judgePermission', '[{username=libai}, {url=/permission/users/info1}]', '192.168.2.143', 2, '2021-08-02 19:38:08', 8888);
INSERT INTO `operation_logs` VALUES (815, '登录以后返回token', 'login', '/permission/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@41bef83b', '192.168.2.143', 3986, '2021-08-03 09:37:32', 8888);
INSERT INTO `operation_logs` VALUES (816, '测试fegin调起', 'feginTest', '/permission/test/feginTest', '', '192.168.2.143', 3505, '2021-08-03 10:34:29', 8888);
INSERT INTO `operation_logs` VALUES (817, '登录以后返回token', 'login', '/permission/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@7b6485f2', '192.168.2.143', 309, '2021-08-03 10:45:13', 8888);
INSERT INTO `operation_logs` VALUES (818, '判断用户对某请求是否具有权限', 'judgePermission', '/permission/permissions/judgePermission', '[{username=libai}, {url=/permission/users/info1}]', '192.168.2.143', 9, '2021-08-03 10:45:33', 8888);
INSERT INTO `operation_logs` VALUES (819, '判断用户对某请求是否具有权限', 'judgePermission', '/permission/permissions/judgePermission', '[{username=libai}, {url=/permission/users/info}]', '192.168.2.143', 4, '2021-08-03 10:45:37', 8888);
INSERT INTO `operation_logs` VALUES (820, '获取当前登录用户的信息', 'getUserInfo', '/permission/users/info', '', '192.168.2.143', 8, '2021-08-03 10:45:37', 8888);
INSERT INTO `operation_logs` VALUES (821, '登出', 'logout', '/permission/users/logout', '', '192.168.2.143', 0, '2021-08-03 10:45:41', 8888);
INSERT INTO `operation_logs` VALUES (822, '登出', 'logout', '/permission/users/logout', '', '192.168.2.143', 3, '2021-08-03 10:57:49', 8888);
INSERT INTO `operation_logs` VALUES (823, '登录以后返回token', 'login', '/permission/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@6a34867d', '192.168.2.143', 224, '2021-08-03 10:57:52', 8888);
INSERT INTO `operation_logs` VALUES (824, '判断用户对某请求是否具有权限', 'judgePermission', '/permission/permissions/judgePermission', '[{username=libai}, {url=/permission/users/info}]', '192.168.2.143', 10, '2021-08-03 10:57:55', 8888);
INSERT INTO `operation_logs` VALUES (825, '获取当前登录用户的信息', 'getUserInfo', '/permission/users/info', '', '192.168.2.143', 7, '2021-08-03 10:57:55', 8888);
INSERT INTO `operation_logs` VALUES (826, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@7c379167', '192.168.2.143', 308, '2021-08-03 16:01:57', 8888);
INSERT INTO `operation_logs` VALUES (827, '判断用户对某请求是否具有权限', 'judgePermission', '/auth/permissions/judgePermission', '[{username=libai}, {url=/system/users/info}]', '192.168.2.143', 11, '2021-08-03 16:02:01', 8888);
INSERT INTO `operation_logs` VALUES (828, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.143', 7, '2021-08-03 16:02:01', 8888);
INSERT INTO `operation_logs` VALUES (829, '登出', 'logout', '/system/users/logout', '', '192.168.2.143', 0, '2021-08-03 16:02:04', 8888);
INSERT INTO `operation_logs` VALUES (830, '判断用户对某请求是否具有权限', 'judgePermission', '/auth/permissions/judgePermission', '[{username=libai}, {url=/system/users/info}]', '192.168.2.143', 14417, '2021-08-03 16:05:41', 8888);
INSERT INTO `operation_logs` VALUES (831, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.143', 1502, '2021-08-03 16:05:42', 8888);
INSERT INTO `operation_logs` VALUES (832, '判断用户对某请求是否具有权限', 'judgePermission', '/auth/permissions/judgePermission', '[{username=libai}, {url=/auth/permissions/listAll}]', '192.168.2.143', 7989, '2021-08-03 16:07:01', 8888);
INSERT INTO `operation_logs` VALUES (833, '查询所有后台树形权限', 'listAll', '/auth/permissions/listAll', '', '192.168.2.143', 31, '2021-08-03 16:07:01', 8888);
INSERT INTO `operation_logs` VALUES (834, '判断用户对某请求是否具有权限', 'judgePermission', '/auth/permissions/judgePermission', '[{username=libai}, {url=/auth/permissions/listAll}]', '192.168.2.143', 3004, '2021-08-03 16:07:18', 8888);
INSERT INTO `operation_logs` VALUES (835, '查询所有后台树形权限', 'listAll', '/auth/permissions/listAll', '', '192.168.2.143', 3077, '2021-08-03 16:07:22', 8888);
INSERT INTO `operation_logs` VALUES (836, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@508744c0', '192.168.2.143', NULL, '2021-08-03 16:57:05', 8888);
INSERT INTO `operation_logs` VALUES (837, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@68d244d7', '192.168.2.143', NULL, '2021-08-03 16:57:09', 8888);
INSERT INTO `operation_logs` VALUES (838, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@3232ec47', '192.168.2.143', NULL, '2021-08-03 16:57:10', 8888);
INSERT INTO `operation_logs` VALUES (839, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@1648e56b', '192.168.2.143', NULL, '2021-08-03 16:57:10', 8888);
INSERT INTO `operation_logs` VALUES (840, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@3b9617f0', '192.168.2.143', NULL, '2021-08-03 16:57:11', 8888);
INSERT INTO `operation_logs` VALUES (841, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@59a4f067', '192.168.2.143', NULL, '2021-08-03 16:57:11', 8888);
INSERT INTO `operation_logs` VALUES (842, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@5a7fbfd0', '192.168.2.143', NULL, '2021-08-03 17:09:32', 8888);
INSERT INTO `operation_logs` VALUES (843, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@26bd0206', '192.168.2.143', NULL, '2021-08-03 17:09:46', 8888);
INSERT INTO `operation_logs` VALUES (844, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=5}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 207, '2021-08-04 10:07:17', 8888);
INSERT INTO `operation_logs` VALUES (845, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=5}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 124, '2021-08-04 19:04:59', 8888);
INSERT INTO `operation_logs` VALUES (846, '用户注册', 'register', '/system/users/register', 'UsersParam{username=\'dufu\', password=\'123\', employeeNo=\'0002\'}', '0:0:0:0:0:0:0:1', 92, '2021-08-04 19:05:56', 8888);
INSERT INTO `operation_logs` VALUES (847, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=5}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 7, '2021-08-04 19:06:05', 8888);
INSERT INTO `operation_logs` VALUES (848, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=5}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 26, '2021-08-04 19:07:20', 8888);
INSERT INTO `operation_logs` VALUES (849, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '0:0:0:0:0:0:0:1', 12, '2021-08-04 19:09:50', 8888);
INSERT INTO `operation_logs` VALUES (850, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=5}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 877646, '2021-08-04 19:25:28', 8888);
INSERT INTO `operation_logs` VALUES (851, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=5}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 7521, '2021-08-04 19:29:16', 8888);
INSERT INTO `operation_logs` VALUES (852, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=5}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 14114, '2021-08-04 19:30:36', 8888);
INSERT INTO `operation_logs` VALUES (853, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=5}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 4604, '2021-08-04 19:37:20', 8888);
INSERT INTO `operation_logs` VALUES (854, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=null}, {pageNum=null}]', '0:0:0:0:0:0:0:1', NULL, '2021-08-04 19:43:10', 8888);
INSERT INTO `operation_logs` VALUES (855, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '0:0:0:0:0:0:0:1', 93, '2021-08-04 19:48:12', 8888);
INSERT INTO `operation_logs` VALUES (856, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '0:0:0:0:0:0:0:1', 93, '2021-08-04 19:49:20', 8888);
INSERT INTO `operation_logs` VALUES (857, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '0:0:0:0:0:0:0:1', 4100, '2021-08-04 19:57:13', 8888);
INSERT INTO `operation_logs` VALUES (858, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '{jj=111}', '0:0:0:0:0:0:0:1', 11787, '2021-08-04 19:59:06', 8888);
INSERT INTO `operation_logs` VALUES (859, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=5}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 5631, '2021-08-04 20:03:30', 8888);
INSERT INTO `operation_logs` VALUES (860, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=100}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 5418, '2021-08-04 20:03:52', 8888);
INSERT INTO `operation_logs` VALUES (861, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=100}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 3974, '2021-08-04 20:05:56', 8888);
INSERT INTO `operation_logs` VALUES (862, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=100}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 12421, '2021-08-04 20:10:48', 8888);
INSERT INTO `operation_logs` VALUES (863, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=100}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 3213, '2021-08-04 20:16:39', 8888);
INSERT INTO `operation_logs` VALUES (864, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=5}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 134, '2021-08-05 10:46:42', 8888);
INSERT INTO `operation_logs` VALUES (865, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=100}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 105222, '2021-08-05 10:52:30', 8888);
INSERT INTO `operation_logs` VALUES (866, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '0:0:0:0:0:0:0:1', 4126, '2021-08-05 10:52:40', 8888);
INSERT INTO `operation_logs` VALUES (867, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '0:0:0:0:0:0:0:1', 3973, '2021-08-05 14:26:54', 8888);
INSERT INTO `operation_logs` VALUES (868, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=100}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 88428, '2021-08-05 15:05:46', 8888);
INSERT INTO `operation_logs` VALUES (869, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=100}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 16, '2021-08-05 15:07:59', 8888);
INSERT INTO `operation_logs` VALUES (870, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=1}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 12, '2021-08-05 15:15:35', 8888);
INSERT INTO `operation_logs` VALUES (871, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=1}, {pageNum=2}]', '0:0:0:0:0:0:0:1', 9, '2021-08-05 15:15:51', 8888);
INSERT INTO `operation_logs` VALUES (872, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '0:0:0:0:0:0:0:1', 24, '2021-08-05 15:16:59', 8888);
INSERT INTO `operation_logs` VALUES (873, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=5}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 31, '2021-08-05 15:17:07', 8888);
INSERT INTO `operation_logs` VALUES (874, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=5}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 6, '2021-08-05 15:17:48', 8888);
INSERT INTO `operation_logs` VALUES (875, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=1}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 6, '2021-08-05 15:18:24', 8888);
INSERT INTO `operation_logs` VALUES (876, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=1}, {pageNum=2}]', '0:0:0:0:0:0:0:1', 5, '2021-08-05 15:18:39', 8888);
INSERT INTO `operation_logs` VALUES (877, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=1}, {pageNum=3}]', '0:0:0:0:0:0:0:1', 4, '2021-08-05 15:18:45', 8888);
INSERT INTO `operation_logs` VALUES (878, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=1}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 105, '2021-08-05 15:20:24', 8888);
INSERT INTO `operation_logs` VALUES (879, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=1}, {pageNum=2}]', '0:0:0:0:0:0:0:1', 8, '2021-08-05 15:21:17', 8888);
INSERT INTO `operation_logs` VALUES (880, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=1}, {pageNum=3}]', '0:0:0:0:0:0:0:1', 8, '2021-08-05 15:21:30', 8888);
INSERT INTO `operation_logs` VALUES (881, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=1}, {pageNum=3}]', '0:0:0:0:0:0:0:1', 110, '2021-08-05 15:46:58', 8888);
INSERT INTO `operation_logs` VALUES (882, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=1}, {pageNum=3}]', '0:0:0:0:0:0:0:1', 121, '2021-08-05 15:55:03', 8888);
INSERT INTO `operation_logs` VALUES (883, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=1}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 9, '2021-08-05 15:55:13', 8888);
INSERT INTO `operation_logs` VALUES (884, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=1}, {pageNum=2}]', '0:0:0:0:0:0:0:1', 11, '2021-08-05 15:55:56', 8888);
INSERT INTO `operation_logs` VALUES (885, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=1}, {pageNum=3}]', '0:0:0:0:0:0:0:1', 10, '2021-08-05 15:56:05', 8888);
INSERT INTO `operation_logs` VALUES (886, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=1}, {pageNum=4}]', '0:0:0:0:0:0:0:1', 9, '2021-08-05 15:56:10', 8888);
INSERT INTO `operation_logs` VALUES (887, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=1}, {pageNum=2}]', '0:0:0:0:0:0:0:1', 9, '2021-08-05 15:56:24', 8888);
INSERT INTO `operation_logs` VALUES (888, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=1}, {pageNum=2}]', '0:0:0:0:0:0:0:1', 105, '2021-08-05 15:58:49', 8888);
INSERT INTO `operation_logs` VALUES (889, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=1}, {pageNum=2}]', '0:0:0:0:0:0:0:1', 13, '2021-08-05 15:58:53', 8888);
INSERT INTO `operation_logs` VALUES (890, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=1}, {pageNum=2}]', '0:0:0:0:0:0:0:1', 19, '2021-08-05 15:58:55', 8888);
INSERT INTO `operation_logs` VALUES (891, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=1}, {pageNum=2}]', '0:0:0:0:0:0:0:1', 9, '2021-08-05 15:58:56', 8888);
INSERT INTO `operation_logs` VALUES (892, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=1}, {pageNum=2}]', '0:0:0:0:0:0:0:1', 8, '2021-08-05 15:58:56', 8888);
INSERT INTO `operation_logs` VALUES (893, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=1}, {pageNum=2}]', '0:0:0:0:0:0:0:1', 8, '2021-08-05 15:58:57', 8888);
INSERT INTO `operation_logs` VALUES (894, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=1}, {pageNum=2}]', '0:0:0:0:0:0:0:1', 107, '2021-08-05 16:05:33', 8888);
INSERT INTO `operation_logs` VALUES (895, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=1}, {pageNum=2}]', '0:0:0:0:0:0:0:1', 15, '2021-08-05 16:06:15', 8888);
INSERT INTO `operation_logs` VALUES (896, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=1}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 10, '2021-08-05 16:06:23', 8888);
INSERT INTO `operation_logs` VALUES (897, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=5}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 118, '2021-08-05 16:21:19', 8888);
INSERT INTO `operation_logs` VALUES (898, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=1}, {pageNum=2}]', '0:0:0:0:0:0:0:1', 6, '2021-08-05 16:21:32', 8888);
INSERT INTO `operation_logs` VALUES (899, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=1}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 15, '2021-08-05 16:21:40', 8888);
INSERT INTO `operation_logs` VALUES (900, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '0:0:0:0:0:0:0:1', 21, '2021-08-05 16:21:56', 8888);
INSERT INTO `operation_logs` VALUES (901, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=1}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 8, '2021-08-05 16:22:41', 8888);
INSERT INTO `operation_logs` VALUES (902, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=1}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 107, '2021-08-05 16:28:01', 8888);
INSERT INTO `operation_logs` VALUES (903, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '0:0:0:0:0:0:0:1', 21, '2021-08-05 16:28:27', 8888);
INSERT INTO `operation_logs` VALUES (904, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=1}, {pageNum=2}]', '0:0:0:0:0:0:0:1', 29, '2021-08-05 16:28:31', 8888);
INSERT INTO `operation_logs` VALUES (905, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=1}, {pageNum=2}]', '0:0:0:0:0:0:0:1', 116, '2021-08-05 17:06:05', 8888);
INSERT INTO `operation_logs` VALUES (906, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=1}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 16, '2021-08-05 17:06:08', 8888);
INSERT INTO `operation_logs` VALUES (907, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '0:0:0:0:0:0:0:1', 19, '2021-08-05 17:06:11', 8888);
INSERT INTO `operation_logs` VALUES (908, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=5}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 122, '2021-08-05 17:46:06', 8888);
INSERT INTO `operation_logs` VALUES (909, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=1}, {pageNum=2}]', '0:0:0:0:0:0:0:1', 143, '2021-08-06 10:08:04', 8888);
INSERT INTO `operation_logs` VALUES (910, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=1}, {pageNum=2}]', '0:0:0:0:0:0:0:1', 5, '2021-08-06 10:08:08', 8888);
INSERT INTO `operation_logs` VALUES (911, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=1}, {pageNum=2}]', '0:0:0:0:0:0:0:1', 6, '2021-08-06 10:08:31', 8888);

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键ID',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '关联父级权限id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端资源路径',
  `type` int(1) NOT NULL COMMENT '权限类型：0->目录；1->菜单；2->按钮（接口绑定权限）',
  `status` int(1) NOT NULL COMMENT '启用状态；0->禁用；1->启用',
  `sort` int(6) NULL DEFAULT NULL COMMENT '排序',
  `created_on` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `changed_on` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `created_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `changed_by` int(11) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `permissions_ibfk_1`(`created_by`) USING BTREE,
  INDEX `permissions_ibfk_2`(`changed_by`) USING BTREE,
  CONSTRAINT `permissions_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `permissions_ibfk_2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, NULL, '系统管理', '', 0, 1, 3, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (2, 1, '用户管理', '', 1, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (3, 2, '新增用户', '/system/users/register', 2, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (4, 2, '编辑用户', '/system/users/update/**', 2, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (5, 2, '用户列表', '/system/users/pageListUsers', 2, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (6, 1, '权限管理', '', 1, 1, 2, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (7, 6, '权限列表', 'auth/permissions/pageAllUsersLimits', 2, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (8, 6, '编辑权限', '/auth/userPermissionRelation/allocLimits', 2, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (9, NULL, '设备管理', '', 0, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (10, 9, '型号管理', '', 1, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (11, 10, '型号列表', 'todo', 2, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (12, 10, '新增型号', 'todo', 2, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (13, 10, '编辑型号', 'todo', 2, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (14, 10, '版本列表', 'todo', 2, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (15, 10, '新增版本', 'todo', 2, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (16, 10, '编辑版本', 'todo', 2, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (17, 9, '设备分组', '', 1, 0, 2, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (18, 17, '设备列表', 'todo', 2, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `permissions` VALUES (19, 17, '设备筛选', 'todo', 2, 0, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_model_relation
-- ----------------------------
DROP TABLE IF EXISTS `user_model_relation`;
CREATE TABLE `user_model_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '关联用户id',
  `model_id` int(11) NULL DEFAULT NULL COMMENT '对应的型号id',
  `created_on` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `changed_on` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `created_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `changed_by` int(11) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_model_ibfk_1`(`user_id`) USING BTREE,
  INDEX `user_model_ibfk_2`(`model_id`) USING BTREE,
  INDEX `user_model_relation_ibfk_3`(`created_by`) USING BTREE,
  INDEX `user_model_relation_ibfk_4`(`changed_by`) USING BTREE,
  CONSTRAINT `user_model_relation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_model_relation_ibfk_2` FOREIGN KEY (`model_id`) REFERENCES `device_models` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_model_relation_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_model_relation_ibfk_4` FOREIGN KEY (`changed_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与型号对应关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_model_relation
-- ----------------------------
INSERT INTO `user_model_relation` VALUES (1, 11, 1, NULL, NULL, NULL, NULL);
INSERT INTO `user_model_relation` VALUES (2, 11, 2, NULL, NULL, NULL, NULL);
INSERT INTO `user_model_relation` VALUES (3, 11, 3, NULL, NULL, NULL, NULL);
INSERT INTO `user_model_relation` VALUES (4, 11, 4, NULL, NULL, NULL, NULL);
INSERT INTO `user_model_relation` VALUES (5, 11, 5, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `user_permission_relation`;
CREATE TABLE `user_permission_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '关联用户id',
  `permission_id` int(11) NULL DEFAULT NULL COMMENT '对应的权限资源id',
  `created_on` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `changed_on` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `created_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `changed_by` int(11) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_resource_ibfk_1`(`user_id`) USING BTREE,
  INDEX `user_permission_relation_ibfk_2`(`permission_id`) USING BTREE,
  INDEX `user_permission_relation_ibfk_3`(`created_by`) USING BTREE,
  INDEX `user_permission_relation_ibfk_4`(`changed_by`) USING BTREE,
  CONSTRAINT `user_permission_relation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_permission_relation_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_permission_relation_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_permission_relation_ibfk_4` FOREIGN KEY (`changed_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与权限对应表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_permission_relation
-- ----------------------------
INSERT INTO `user_permission_relation` VALUES (1, 11, 1, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (2, 11, 2, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (3, 11, 3, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (4, 11, 4, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (5, 11, 5, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (6, 11, 6, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (7, 11, 7, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (8, 11, 8, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (9, 11, 9, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (10, 11, 10, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (11, 11, 11, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (12, 11, 12, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (13, 11, 13, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (14, 11, 14, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (15, 11, 15, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (16, 11, 16, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `employee_no` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工号',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `department` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属部门',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人姓名',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态(0:禁用；1:启用)',
  `fail_login_count` int(1) NULL DEFAULT NULL COMMENT '登录失败次数',
  `locking_time` datetime NULL DEFAULT NULL COMMENT '锁定截止时间',
  `created_on` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `changed_on` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `created_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `changed_by` int(11) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `users_ibfk_1`(`created_by`) USING BTREE,
  INDEX `users_ibfk_2`(`changed_by`) USING BTREE,
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`changed_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (11, 'libai', 'QqlSHbxWGYs', '0001', NULL, NULL, '操作人1', 1, 1, NULL, '2021-08-02 17:50:54', NULL, NULL, NULL);
INSERT INTO `users` VALUES (12, 'dufu', 'QqlSHbxWGYs', '0002', NULL, NULL, '操作人2', 1, 0, NULL, '2021-08-04 19:05:56', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
