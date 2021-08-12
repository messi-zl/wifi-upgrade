/*
 Navicat Premium Data Transfer

 Source Server         : 本地mysql
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:3306
 Source Schema         : fronttest

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 12/08/2021 17:30:08
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
) ENGINE = InnoDB AUTO_INCREMENT = 229 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户登录日志表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `login_logs` VALUES (188, 11, 1, '2021-08-05 09:16:53');
INSERT INTO `login_logs` VALUES (189, 11, 1, '2021-08-05 09:18:04');
INSERT INTO `login_logs` VALUES (190, 11, 1, '2021-08-05 09:21:29');
INSERT INTO `login_logs` VALUES (191, 11, 1, '2021-08-05 09:23:07');
INSERT INTO `login_logs` VALUES (192, 11, 1, '2021-08-05 18:08:56');
INSERT INTO `login_logs` VALUES (193, 11, 1, '2021-08-06 10:18:35');
INSERT INTO `login_logs` VALUES (194, 11, 1, '2021-08-06 10:44:53');
INSERT INTO `login_logs` VALUES (195, 11, 1, '2021-08-06 10:47:28');
INSERT INTO `login_logs` VALUES (196, 11, 1, '2021-08-06 10:48:18');
INSERT INTO `login_logs` VALUES (197, 11, 1, '2021-08-06 11:01:47');
INSERT INTO `login_logs` VALUES (198, 11, 1, '2021-08-06 11:02:55');
INSERT INTO `login_logs` VALUES (199, 11, 1, '2021-08-06 11:05:19');
INSERT INTO `login_logs` VALUES (200, 11, 1, '2021-08-06 11:11:16');
INSERT INTO `login_logs` VALUES (201, 11, 1, '2021-08-06 11:11:40');
INSERT INTO `login_logs` VALUES (202, 11, 1, '2021-08-06 11:16:34');
INSERT INTO `login_logs` VALUES (203, 11, 1, '2021-08-06 11:20:47');
INSERT INTO `login_logs` VALUES (204, 11, 1, '2021-08-06 11:22:07');
INSERT INTO `login_logs` VALUES (205, 11, 1, '2021-08-06 11:23:32');
INSERT INTO `login_logs` VALUES (206, 11, 1, '2021-08-06 11:24:15');
INSERT INTO `login_logs` VALUES (207, 11, 1, '2021-08-06 11:24:53');
INSERT INTO `login_logs` VALUES (208, 11, 1, '2021-08-06 11:27:18');
INSERT INTO `login_logs` VALUES (209, 11, 1, '2021-08-06 11:27:48');
INSERT INTO `login_logs` VALUES (210, 11, 1, '2021-08-06 11:31:07');
INSERT INTO `login_logs` VALUES (211, 11, 1, '2021-08-06 11:31:59');
INSERT INTO `login_logs` VALUES (212, 11, 1, '2021-08-06 11:35:28');
INSERT INTO `login_logs` VALUES (213, 11, 1, '2021-08-06 11:37:05');
INSERT INTO `login_logs` VALUES (214, 11, 1, '2021-08-06 11:41:15');
INSERT INTO `login_logs` VALUES (215, 11, 1, '2021-08-06 17:00:39');
INSERT INTO `login_logs` VALUES (216, 11, 1, '2021-08-06 17:01:23');
INSERT INTO `login_logs` VALUES (217, 11, 1, '2021-08-06 17:04:14');
INSERT INTO `login_logs` VALUES (218, 11, 1, '2021-08-06 17:17:06');
INSERT INTO `login_logs` VALUES (219, 11, 1, '2021-08-10 17:39:56');
INSERT INTO `login_logs` VALUES (220, 11, 1, '2021-08-10 17:56:51');
INSERT INTO `login_logs` VALUES (221, 11, 0, '2021-08-10 18:23:50');
INSERT INTO `login_logs` VALUES (222, 11, 0, '2021-08-10 18:23:56');
INSERT INTO `login_logs` VALUES (223, 11, 1, '2021-08-10 18:28:24');
INSERT INTO `login_logs` VALUES (224, 11, 1, '2021-08-11 15:57:32');
INSERT INTO `login_logs` VALUES (225, 11, 1, '2021-08-11 17:00:55');
INSERT INTO `login_logs` VALUES (226, 11, 1, '2021-08-11 17:01:27');
INSERT INTO `login_logs` VALUES (227, 11, 1, '2021-08-11 17:01:49');
INSERT INTO `login_logs` VALUES (228, 11, 1, '2021-08-11 17:02:02');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1989 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志信息表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `operation_logs` VALUES (864, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@671b4ea2', '192.168.2.134', NULL, '2021-08-05 09:15:53', 8888);
INSERT INTO `operation_logs` VALUES (865, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@34cb3d75', '192.168.2.134', NULL, '2021-08-05 09:16:10', 8888);
INSERT INTO `operation_logs` VALUES (866, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@34ce9f00', '192.168.2.134', 427, '2021-08-05 09:16:54', 8888);
INSERT INTO `operation_logs` VALUES (867, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', NULL, '2021-08-05 09:16:54', 8888);
INSERT INTO `operation_logs` VALUES (868, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@3249010f', '192.168.2.134', 65, '2021-08-05 09:18:04', 8888);
INSERT INTO `operation_logs` VALUES (869, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', NULL, '2021-08-05 09:18:04', 8888);
INSERT INTO `operation_logs` VALUES (870, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@fb5d7c', '192.168.2.134', 332, '2021-08-05 09:21:30', 8888);
INSERT INTO `operation_logs` VALUES (871, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', NULL, '2021-08-05 09:21:30', 8888);
INSERT INTO `operation_logs` VALUES (872, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@33222517', '192.168.2.134', 299, '2021-08-05 09:23:07', 8888);
INSERT INTO `operation_logs` VALUES (873, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 28, '2021-08-05 09:23:07', 8888);
INSERT INTO `operation_logs` VALUES (874, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '0:0:0:0:0:0:0:1', 2477, '2021-08-05 09:25:42', 8888);
INSERT INTO `operation_logs` VALUES (875, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '0:0:0:0:0:0:0:1', 14, '2021-08-05 09:30:02', 8888);
INSERT INTO `operation_logs` VALUES (876, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 13, '2021-08-05 09:30:14', 8888);
INSERT INTO `operation_logs` VALUES (877, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '0:0:0:0:0:0:0:1', 9, '2021-08-05 09:30:46', 8888);
INSERT INTO `operation_logs` VALUES (878, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 8, '2021-08-05 09:31:15', 8888);
INSERT INTO `operation_logs` VALUES (879, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=5}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 39, '2021-08-05 09:31:59', 8888);
INSERT INTO `operation_logs` VALUES (880, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=5}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 26, '2021-08-05 09:32:27', 8888);
INSERT INTO `operation_logs` VALUES (881, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 10, '2021-08-05 09:34:07', 8888);
INSERT INTO `operation_logs` VALUES (882, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 7, '2021-08-05 09:34:28', 8888);
INSERT INTO `operation_logs` VALUES (883, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 28, '2021-08-05 10:07:43', 8888);
INSERT INTO `operation_logs` VALUES (884, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 10, '2021-08-05 10:17:20', 8888);
INSERT INTO `operation_logs` VALUES (885, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 8, '2021-08-05 10:19:28', 8888);
INSERT INTO `operation_logs` VALUES (886, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 8, '2021-08-05 10:21:53', 8888);
INSERT INTO `operation_logs` VALUES (887, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-05 10:35:26', 8888);
INSERT INTO `operation_logs` VALUES (888, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 8, '2021-08-05 10:38:45', 8888);
INSERT INTO `operation_logs` VALUES (889, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 31, '2021-08-05 11:12:03', 8888);
INSERT INTO `operation_logs` VALUES (890, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 11, '2021-08-05 11:27:02', 8888);
INSERT INTO `operation_logs` VALUES (891, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 11, '2021-08-05 11:33:58', 8888);
INSERT INTO `operation_logs` VALUES (892, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 10, '2021-08-05 11:35:16', 8888);
INSERT INTO `operation_logs` VALUES (893, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-05 11:35:38', 8888);
INSERT INTO `operation_logs` VALUES (894, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 16, '2021-08-05 11:40:00', 8888);
INSERT INTO `operation_logs` VALUES (895, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-05 11:43:20', 8888);
INSERT INTO `operation_logs` VALUES (896, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 7, '2021-08-05 11:44:14', 8888);
INSERT INTO `operation_logs` VALUES (897, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 11, '2021-08-05 11:51:53', 8888);
INSERT INTO `operation_logs` VALUES (898, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 7, '2021-08-05 11:52:16', 8888);
INSERT INTO `operation_logs` VALUES (899, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 10, '2021-08-05 11:54:18', 8888);
INSERT INTO `operation_logs` VALUES (900, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 62, '2021-08-05 13:47:23', 8888);
INSERT INTO `operation_logs` VALUES (901, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 11, '2021-08-05 14:16:30', 8888);
INSERT INTO `operation_logs` VALUES (902, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-05 14:18:54', 8888);
INSERT INTO `operation_logs` VALUES (903, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 11, '2021-08-05 14:22:31', 8888);
INSERT INTO `operation_logs` VALUES (904, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 11, '2021-08-05 14:28:06', 8888);
INSERT INTO `operation_logs` VALUES (905, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 42, '2021-08-05 16:23:30', 8888);
INSERT INTO `operation_logs` VALUES (906, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=5}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 122, '2021-08-05 17:46:54', 8888);
INSERT INTO `operation_logs` VALUES (907, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=1}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 19, '2021-08-05 18:07:05', 8888);
INSERT INTO `operation_logs` VALUES (908, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@c9c730b', '192.168.2.134', 294, '2021-08-05 18:08:56', 8888);
INSERT INTO `operation_logs` VALUES (909, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 11, '2021-08-05 18:08:56', 8888);
INSERT INTO `operation_logs` VALUES (910, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 7, '2021-08-05 18:09:05', 8888);
INSERT INTO `operation_logs` VALUES (911, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 49, '2021-08-06 09:29:05', 8888);
INSERT INTO `operation_logs` VALUES (912, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 10, '2021-08-06 09:31:34', 8888);
INSERT INTO `operation_logs` VALUES (913, '修改登录密码', 'updatePassword', '/system/users/updatePassword', 'com.sim.wifi.authority.dto.UpdateUsersPasswordParam@52e43e85', '192.168.2.134', 10, '2021-08-06 09:43:54', 8888);
INSERT INTO `operation_logs` VALUES (914, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 13, '2021-08-06 09:58:47', 8888);
INSERT INTO `operation_logs` VALUES (915, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 12, '2021-08-06 10:01:05', 8888);
INSERT INTO `operation_logs` VALUES (916, '修改登录密码', 'updatePassword', '/system/users/updatePassword', 'com.sim.wifi.authority.dto.UpdateUsersPasswordParam@6dd76baf', '192.168.2.134', 6, '2021-08-06 10:09:12', 8888);
INSERT INTO `operation_logs` VALUES (917, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 15, '2021-08-06 10:16:15', 8888);
INSERT INTO `operation_logs` VALUES (918, '登出', 'logout', '/system/users/logout', '', '192.168.2.134', 0, '2021-08-06 10:18:26', 8888);
INSERT INTO `operation_logs` VALUES (919, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@5856c5cf', '192.168.2.134', 38, '2021-08-06 10:18:35', 8888);
INSERT INTO `operation_logs` VALUES (920, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 8, '2021-08-06 10:18:35', 8888);
INSERT INTO `operation_logs` VALUES (921, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 11, '2021-08-06 10:20:05', 8888);
INSERT INTO `operation_logs` VALUES (922, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 18, '2021-08-06 10:29:07', 8888);
INSERT INTO `operation_logs` VALUES (923, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-06 10:29:16', 8888);
INSERT INTO `operation_logs` VALUES (924, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 7, '2021-08-06 10:29:37', 8888);
INSERT INTO `operation_logs` VALUES (925, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 10, '2021-08-06 10:33:20', 8888);
INSERT INTO `operation_logs` VALUES (926, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-06 10:33:31', 8888);
INSERT INTO `operation_logs` VALUES (927, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 7, '2021-08-06 10:34:07', 8888);
INSERT INTO `operation_logs` VALUES (928, '修改登录密码', 'updatePassword', '/system/users/updatePassword', 'com.sim.wifi.authority.dto.UpdateUsersPasswordParam@5aa632db', '192.168.2.134', 51, '2021-08-06 10:38:48', 8888);
INSERT INTO `operation_logs` VALUES (929, '修改登录密码', 'updatePassword', '/system/users/updatePassword', 'com.sim.wifi.authority.dto.UpdateUsersPasswordParam@26b6ca51', '192.168.2.134', 8, '2021-08-06 10:40:51', 8888);
INSERT INTO `operation_logs` VALUES (930, '修改登录密码', 'updatePassword', '/system/users/updatePassword', 'com.sim.wifi.authority.dto.UpdateUsersPasswordParam@5adb0c6a', '192.168.2.134', 41, '2021-08-06 10:41:17', 8888);
INSERT INTO `operation_logs` VALUES (931, '修改登录密码', 'updatePassword', '/system/users/updatePassword', 'com.sim.wifi.authority.dto.UpdateUsersPasswordParam@534e0de6', '192.168.2.134', 7, '2021-08-06 10:42:27', 8888);
INSERT INTO `operation_logs` VALUES (932, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-06 10:44:39', 8888);
INSERT INTO `operation_logs` VALUES (933, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@2f0537b8', '192.168.2.134', 38, '2021-08-06 10:44:53', 8888);
INSERT INTO `operation_logs` VALUES (934, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-06 10:44:53', 8888);
INSERT INTO `operation_logs` VALUES (935, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@fdf31e8', '192.168.2.134', 85, '2021-08-06 10:47:28', 8888);
INSERT INTO `operation_logs` VALUES (936, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 8, '2021-08-06 10:47:28', 8888);
INSERT INTO `operation_logs` VALUES (937, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@64e47420', '192.168.2.134', 41, '2021-08-06 10:48:18', 8888);
INSERT INTO `operation_logs` VALUES (938, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-06 10:48:18', 8888);
INSERT INTO `operation_logs` VALUES (939, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 7, '2021-08-06 10:48:50', 8888);
INSERT INTO `operation_logs` VALUES (940, '修改登录密码', 'updatePassword', '/system/users/updatePassword', 'com.sim.wifi.authority.dto.UpdateUsersPasswordParam@2c1c1d31', '192.168.2.134', 4, '2021-08-06 10:49:19', 8888);
INSERT INTO `operation_logs` VALUES (941, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 10, '2021-08-06 10:52:59', 8888);
INSERT INTO `operation_logs` VALUES (942, '修改登录密码', 'updatePassword', '/system/users/updatePassword', 'com.sim.wifi.authority.dto.UpdateUsersPasswordParam@5f30664a', '192.168.2.134', 42, '2021-08-06 10:53:11', 8888);
INSERT INTO `operation_logs` VALUES (943, '修改登录密码', 'updatePassword', '/system/users/updatePassword', 'com.sim.wifi.authority.dto.UpdateUsersPasswordParam@2dc5a5a1', '192.168.2.134', 4, '2021-08-06 10:53:29', 8888);
INSERT INTO `operation_logs` VALUES (944, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 11, '2021-08-06 11:00:41', 8888);
INSERT INTO `operation_logs` VALUES (945, '修改登录密码', 'updatePassword', '/system/users/updatePassword', 'com.sim.wifi.authority.dto.UpdateUsersPasswordParam@1672b663', '192.168.2.134', 4, '2021-08-06 11:01:23', 8888);
INSERT INTO `operation_logs` VALUES (946, '修改登录密码', 'updatePassword', '/system/users/updatePassword', 'com.sim.wifi.authority.dto.UpdateUsersPasswordParam@12bdf7c6', '192.168.2.134', 45, '2021-08-06 11:01:37', 8888);
INSERT INTO `operation_logs` VALUES (947, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@67f5b7f8', '192.168.2.134', 43, '2021-08-06 11:01:47', 8888);
INSERT INTO `operation_logs` VALUES (948, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-06 11:01:47', 8888);
INSERT INTO `operation_logs` VALUES (949, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 10, '2021-08-06 11:02:47', 8888);
INSERT INTO `operation_logs` VALUES (950, '登出', 'logout', '/system/users/logout', '', '192.168.2.134', 0, '2021-08-06 11:02:49', 8888);
INSERT INTO `operation_logs` VALUES (951, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@129fc918', '192.168.2.134', 36, '2021-08-06 11:02:55', 8888);
INSERT INTO `operation_logs` VALUES (952, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-06 11:02:55', 8888);
INSERT INTO `operation_logs` VALUES (953, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 10, '2021-08-06 11:04:55', 8888);
INSERT INTO `operation_logs` VALUES (954, '登出', 'logout', '/system/users/logout', '', '192.168.2.134', 0, '2021-08-06 11:05:15', 8888);
INSERT INTO `operation_logs` VALUES (955, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@58a3f678', '192.168.2.134', 68, '2021-08-06 11:05:19', 8888);
INSERT INTO `operation_logs` VALUES (956, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-06 11:05:19', 8888);
INSERT INTO `operation_logs` VALUES (957, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-06 11:11:00', 8888);
INSERT INTO `operation_logs` VALUES (958, '登出', 'logout', '/system/users/logout', '', '192.168.2.134', 0, '2021-08-06 11:11:08', 8888);
INSERT INTO `operation_logs` VALUES (959, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@4915c42b', '192.168.2.134', 37, '2021-08-06 11:11:16', 8888);
INSERT INTO `operation_logs` VALUES (960, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-06 11:11:16', 8888);
INSERT INTO `operation_logs` VALUES (961, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-06 11:11:33', 8888);
INSERT INTO `operation_logs` VALUES (962, '登出', 'logout', '/system/users/logout', '', '192.168.2.134', 0, '2021-08-06 11:11:35', 8888);
INSERT INTO `operation_logs` VALUES (963, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@51f90d6c', '192.168.2.134', 35, '2021-08-06 11:11:40', 8888);
INSERT INTO `operation_logs` VALUES (964, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-06 11:11:40', 8888);
INSERT INTO `operation_logs` VALUES (965, '登出', 'logout', '/system/users/logout', '', '192.168.2.134', 0, '2021-08-06 11:16:28', 8888);
INSERT INTO `operation_logs` VALUES (966, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@29b102c', '192.168.2.134', 58, '2021-08-06 11:16:34', 8888);
INSERT INTO `operation_logs` VALUES (967, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 19, '2021-08-06 11:16:34', 8888);
INSERT INTO `operation_logs` VALUES (968, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 10, '2021-08-06 11:20:06', 8888);
INSERT INTO `operation_logs` VALUES (969, '登出', 'logout', '/system/users/logout', '', '192.168.2.134', 0, '2021-08-06 11:20:39', 8888);
INSERT INTO `operation_logs` VALUES (970, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@75252a24', '192.168.2.134', 38, '2021-08-06 11:20:47', 8888);
INSERT INTO `operation_logs` VALUES (971, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-06 11:21:28', 8888);
INSERT INTO `operation_logs` VALUES (972, '登出', 'logout', '/system/users/logout', '', '192.168.2.134', 0, '2021-08-06 11:21:45', 8888);
INSERT INTO `operation_logs` VALUES (973, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@15edc50', '192.168.2.134', 47, '2021-08-06 11:22:07', 8888);
INSERT INTO `operation_logs` VALUES (974, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 10, '2021-08-06 11:23:20', 8888);
INSERT INTO `operation_logs` VALUES (975, '登出', 'logout', '/system/users/logout', '', '192.168.2.134', 0, '2021-08-06 11:23:25', 8888);
INSERT INTO `operation_logs` VALUES (976, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@664e8940', '192.168.2.134', 36, '2021-08-06 11:23:32', 8888);
INSERT INTO `operation_logs` VALUES (977, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@c3a5f24', '192.168.2.134', 36, '2021-08-06 11:24:15', 8888);
INSERT INTO `operation_logs` VALUES (978, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-06 11:24:44', 8888);
INSERT INTO `operation_logs` VALUES (979, '登出', 'logout', '/system/users/logout', '', '192.168.2.134', 0, '2021-08-06 11:24:48', 8888);
INSERT INTO `operation_logs` VALUES (980, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@7e8a09ef', '192.168.2.134', 71, '2021-08-06 11:24:53', 8888);
INSERT INTO `operation_logs` VALUES (981, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 7, '2021-08-06 11:24:53', 8888);
INSERT INTO `operation_logs` VALUES (982, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-06 11:27:11', 8888);
INSERT INTO `operation_logs` VALUES (983, '登出', 'logout', '/system/users/logout', '', '192.168.2.134', 0, '2021-08-06 11:27:13', 8888);
INSERT INTO `operation_logs` VALUES (984, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@46dc5c1e', '192.168.2.134', 43, '2021-08-06 11:27:18', 8888);
INSERT INTO `operation_logs` VALUES (985, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-06 11:27:18', 8888);
INSERT INTO `operation_logs` VALUES (986, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-06 11:27:34', 8888);
INSERT INTO `operation_logs` VALUES (987, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-06 11:27:40', 8888);
INSERT INTO `operation_logs` VALUES (988, '登出', 'logout', '/system/users/logout', '', '192.168.2.134', 0, '2021-08-06 11:27:43', 8888);
INSERT INTO `operation_logs` VALUES (989, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@5530a74f', '192.168.2.134', 66, '2021-08-06 11:27:48', 8888);
INSERT INTO `operation_logs` VALUES (990, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-06 11:27:48', 8888);
INSERT INTO `operation_logs` VALUES (991, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 14, '2021-08-06 11:28:52', 8888);
INSERT INTO `operation_logs` VALUES (992, '登出', 'logout', '/system/users/logout', '', '192.168.2.134', 0, '2021-08-06 11:30:59', 8888);
INSERT INTO `operation_logs` VALUES (993, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@5e8799b7', '192.168.2.134', 34, '2021-08-06 11:31:07', 8888);
INSERT INTO `operation_logs` VALUES (994, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 8, '2021-08-06 11:31:07', 8888);
INSERT INTO `operation_logs` VALUES (995, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-06 11:31:22', 8888);
INSERT INTO `operation_logs` VALUES (996, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-06 11:31:39', 8888);
INSERT INTO `operation_logs` VALUES (997, '登出', 'logout', '/system/users/logout', '', '192.168.2.134', 0, '2021-08-06 11:31:46', 8888);
INSERT INTO `operation_logs` VALUES (998, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@243e1d9d', '192.168.2.134', 36, '2021-08-06 11:31:59', 8888);
INSERT INTO `operation_logs` VALUES (999, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-06 11:31:59', 8888);
INSERT INTO `operation_logs` VALUES (1000, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-06 11:32:06', 8888);
INSERT INTO `operation_logs` VALUES (1001, '登出', 'logout', '/system/users/logout', '', '192.168.2.134', 0, '2021-08-06 11:35:23', 8888);
INSERT INTO `operation_logs` VALUES (1002, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@30cd9f7f', '192.168.2.134', 37, '2021-08-06 11:35:28', 8888);
INSERT INTO `operation_logs` VALUES (1003, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-06 11:35:28', 8888);
INSERT INTO `operation_logs` VALUES (1004, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 10, '2021-08-06 11:36:58', 8888);
INSERT INTO `operation_logs` VALUES (1005, '登出', 'logout', '/system/users/logout', '', '192.168.2.134', 0, '2021-08-06 11:37:01', 8888);
INSERT INTO `operation_logs` VALUES (1006, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@6cf96f85', '192.168.2.134', 37, '2021-08-06 11:37:05', 8888);
INSERT INTO `operation_logs` VALUES (1007, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-06 11:37:05', 8888);
INSERT INTO `operation_logs` VALUES (1008, '登出', 'logout', '/system/users/logout', '', '192.168.2.134', 0, '2021-08-06 11:41:09', 8888);
INSERT INTO `operation_logs` VALUES (1009, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@6ca1b096', '192.168.2.134', 38, '2021-08-06 11:41:15', 8888);
INSERT INTO `operation_logs` VALUES (1010, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-06 11:41:15', 8888);
INSERT INTO `operation_logs` VALUES (1011, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=5}, {pageNum=1}]', '192.168.2.134', 9, '2021-08-06 11:44:52', 8888);
INSERT INTO `operation_logs` VALUES (1012, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 8, '2021-08-06 11:46:58', 8888);
INSERT INTO `operation_logs` VALUES (1013, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-06 11:47:03', 8888);
INSERT INTO `operation_logs` VALUES (1014, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-06 11:47:04', 8888);
INSERT INTO `operation_logs` VALUES (1015, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 9, '2021-08-06 11:51:23', 8888);
INSERT INTO `operation_logs` VALUES (1016, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 42, '2021-08-06 13:40:43', 8888);
INSERT INTO `operation_logs` VALUES (1017, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 15, '2021-08-06 13:41:04', 8888);
INSERT INTO `operation_logs` VALUES (1018, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-06 13:41:04', 8888);
INSERT INTO `operation_logs` VALUES (1019, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 10, '2021-08-06 13:43:16', 8888);
INSERT INTO `operation_logs` VALUES (1020, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-06 13:45:48', 8888);
INSERT INTO `operation_logs` VALUES (1021, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-06 13:45:48', 8888);
INSERT INTO `operation_logs` VALUES (1022, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-06 13:46:03', 8888);
INSERT INTO `operation_logs` VALUES (1023, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-06 13:46:10', 8888);
INSERT INTO `operation_logs` VALUES (1024, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-06 13:46:22', 8888);
INSERT INTO `operation_logs` VALUES (1025, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-06 13:46:28', 8888);
INSERT INTO `operation_logs` VALUES (1026, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 11, '2021-08-06 13:46:37', 8888);
INSERT INTO `operation_logs` VALUES (1027, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-06 13:48:24', 8888);
INSERT INTO `operation_logs` VALUES (1028, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-06 13:48:24', 8888);
INSERT INTO `operation_logs` VALUES (1029, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 8, '2021-08-06 13:52:52', 8888);
INSERT INTO `operation_logs` VALUES (1030, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 9, '2021-08-06 13:55:24', 8888);
INSERT INTO `operation_logs` VALUES (1031, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 8, '2021-08-06 13:55:53', 8888);
INSERT INTO `operation_logs` VALUES (1032, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-06 13:56:30', 8888);
INSERT INTO `operation_logs` VALUES (1033, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 9, '2021-08-06 13:58:08', 8888);
INSERT INTO `operation_logs` VALUES (1034, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-06 13:58:40', 8888);
INSERT INTO `operation_logs` VALUES (1035, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 9, '2021-08-06 14:01:04', 8888);
INSERT INTO `operation_logs` VALUES (1036, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-06 14:01:35', 8888);
INSERT INTO `operation_logs` VALUES (1037, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 11, '2021-08-06 14:10:14', 8888);
INSERT INTO `operation_logs` VALUES (1038, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 99, '2021-08-06 15:12:32', 8888);
INSERT INTO `operation_logs` VALUES (1039, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 7, '2021-08-06 15:12:40', 8888);
INSERT INTO `operation_logs` VALUES (1040, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-06 15:12:41', 8888);
INSERT INTO `operation_logs` VALUES (1041, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-06 15:13:32', 8888);
INSERT INTO `operation_logs` VALUES (1042, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-06 15:13:39', 8888);
INSERT INTO `operation_logs` VALUES (1043, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-06 15:13:40', 8888);
INSERT INTO `operation_logs` VALUES (1044, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 7, '2021-08-06 15:22:14', 8888);
INSERT INTO `operation_logs` VALUES (1045, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 7, '2021-08-06 15:23:52', 8888);
INSERT INTO `operation_logs` VALUES (1046, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 8, '2021-08-06 15:30:38', 8888);
INSERT INTO `operation_logs` VALUES (1047, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-06 15:31:26', 8888);
INSERT INTO `operation_logs` VALUES (1048, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 9, '2021-08-06 15:32:37', 8888);
INSERT INTO `operation_logs` VALUES (1049, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-06 15:35:42', 8888);
INSERT INTO `operation_logs` VALUES (1050, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 8, '2021-08-06 15:36:48', 8888);
INSERT INTO `operation_logs` VALUES (1051, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-06 15:36:50', 8888);
INSERT INTO `operation_logs` VALUES (1052, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 7, '2021-08-06 15:38:44', 8888);
INSERT INTO `operation_logs` VALUES (1053, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 8, '2021-08-06 15:41:17', 8888);
INSERT INTO `operation_logs` VALUES (1054, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-06 15:41:36', 8888);
INSERT INTO `operation_logs` VALUES (1055, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 8, '2021-08-06 15:51:02', 8888);
INSERT INTO `operation_logs` VALUES (1056, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 8, '2021-08-06 15:56:15', 8888);
INSERT INTO `operation_logs` VALUES (1057, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-06 15:56:49', 8888);
INSERT INTO `operation_logs` VALUES (1058, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-06 15:57:00', 8888);
INSERT INTO `operation_logs` VALUES (1059, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-06 15:57:27', 8888);
INSERT INTO `operation_logs` VALUES (1060, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 25, '2021-08-06 16:00:24', 8888);
INSERT INTO `operation_logs` VALUES (1061, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 10, '2021-08-06 16:04:38', 8888);
INSERT INTO `operation_logs` VALUES (1062, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-06 16:04:56', 8888);
INSERT INTO `operation_logs` VALUES (1063, '给用户分配权限', 'allocPermissionToUser', '/auth/userPermissionRelation/allocPermission', '[{userId=1}, {permissionIds=[1]}]', '192.168.2.134', NULL, '2021-08-06 16:08:28', 8888);
INSERT INTO `operation_logs` VALUES (1064, '给用户分配权限', 'allocPermissionToUser', '/auth/userPermissionRelation/allocPermission', '[{userId=1}, {permissionIds=[1, 2]}]', '192.168.2.134', NULL, '2021-08-06 16:08:38', 8888);
INSERT INTO `operation_logs` VALUES (1065, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 30, '2021-08-06 16:10:01', 8888);
INSERT INTO `operation_logs` VALUES (1066, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=1}, {limitIdMap={limitIdMap=1,2, userId=1}}]', '192.168.2.134', NULL, '2021-08-06 16:10:40', 8888);
INSERT INTO `operation_logs` VALUES (1067, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 9, '2021-08-06 16:28:56', 8888);
INSERT INTO `operation_logs` VALUES (1068, '根据UserId修改用户信息', 'update', '/system/users/update/12', 'Users(id=12, username=, password=null, employeeNo=, phone=, department=, name=操作人666, status=0, lockingTime=null, failLoginCount=0, createdOn=null, changedOn=2021-08-06 16:46:43, createdBy=0, changedBy=0)', '0:0:0:0:0:0:0:1', NULL, '2021-08-06 16:46:43', 8888);
INSERT INTO `operation_logs` VALUES (1069, '根据UserId修改用户信息', 'update', '/system/users/update/12', 'Users(id=12, username=, password=null, employeeNo=, phone=, department=, name=操作人666, status=0, lockingTime=null, failLoginCount=0, createdOn=null, changedOn=2021-08-06 16:47:37, createdBy=12, changedBy=12)', '0:0:0:0:0:0:0:1', 5808, '2021-08-06 16:47:37', 8888);
INSERT INTO `operation_logs` VALUES (1070, '根据UserId修改用户信息', 'update', '/system/users/update/11', 'Users(id=11, username=libai, password=null, employeeNo=0001, phone=17666143833, department=研发, name=操作人1, status=1, lockingTime=null, failLoginCount=0, createdOn=Mon Aug 02 17:50:54 CST 2021, changedOn=2021-08-06 16:47:55, createdBy=null, changedBy=null)', '192.168.2.134', 43, '2021-08-06 16:47:55', 8888);
INSERT INTO `operation_logs` VALUES (1071, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 43, '2021-08-06 16:47:55', 8888);
INSERT INTO `operation_logs` VALUES (1072, '由权限id修改权限', 'update', '/auth/permissions/update/11', 'Permissions(id=11, parentId=9, name=string, url=string, type=0, status=0, sort=0, createdOn=Fri Aug 06 16:50:00 CST 2021, changedOn=Fri Aug 06 16:50:00 CST 2021, createdBy=0, changedBy=0)', '192.168.2.134', NULL, '2021-08-06 16:50:45', 8888);
INSERT INTO `operation_logs` VALUES (1073, '由权限id修改权限', 'update', '/auth/permissions/update/11', 'Permissions(id=11, parentId=9, name=string, url=string, type=0, status=0, sort=0, createdOn=Fri Aug 06 16:50:00 CST 2021, changedOn=Fri Aug 06 16:50:00 CST 2021, createdBy=0, changedBy=0)', '192.168.2.134', NULL, '2021-08-06 16:52:11', 8888);
INSERT INTO `operation_logs` VALUES (1074, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 44, '2021-08-06 16:55:14', 8888);
INSERT INTO `operation_logs` VALUES (1075, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@7c7c5878', '192.168.2.134', 185, '2021-08-06 17:00:39', 8888);
INSERT INTO `operation_logs` VALUES (1076, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 8, '2021-08-06 17:00:39', 8888);
INSERT INTO `operation_logs` VALUES (1077, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@3e6a21ab', '192.168.2.134', 36, '2021-08-06 17:01:23', 8888);
INSERT INTO `operation_logs` VALUES (1078, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-06 17:01:23', 8888);
INSERT INTO `operation_logs` VALUES (1079, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 37, '2021-08-06 17:01:33', 8888);
INSERT INTO `operation_logs` VALUES (1080, '由权限id修改权限', 'update', '/auth/permissions/update/10', 'Permissions(id=10, parentId=9, name=, url=, type=null, status=null, sort=null, createdOn=null, changedOn=null, createdBy=null, changedBy=null)', '192.168.2.134', 37, '2021-08-06 17:01:46', 8888);
INSERT INTO `operation_logs` VALUES (1081, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-06 17:01:46', 8888);
INSERT INTO `operation_logs` VALUES (1082, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 7, '2021-08-06 17:02:00', 8888);
INSERT INTO `operation_logs` VALUES (1083, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-06 17:02:01', 8888);
INSERT INTO `operation_logs` VALUES (1084, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 13, '2021-08-06 17:03:23', 8888);
INSERT INTO `operation_logs` VALUES (1085, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@6affc773', '192.168.2.134', 36, '2021-08-06 17:04:14', 8888);
INSERT INTO `operation_logs` VALUES (1086, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 7, '2021-08-06 17:04:15', 8888);
INSERT INTO `operation_logs` VALUES (1087, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 10, '2021-08-06 17:05:25', 8888);
INSERT INTO `operation_logs` VALUES (1088, '由权限id修改权限', 'update', '/auth/permissions/update/10', 'Permissions(id=10, parentId=9, name=设备型号, url=, type=null, status=null, sort=null, createdOn=null, changedOn=null, createdBy=null, changedBy=null)', '192.168.2.134', 33, '2021-08-06 17:05:43', 8888);
INSERT INTO `operation_logs` VALUES (1089, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-06 17:05:43', 8888);
INSERT INTO `operation_logs` VALUES (1090, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-06 17:05:48', 8888);
INSERT INTO `operation_logs` VALUES (1091, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-06 17:05:49', 8888);
INSERT INTO `operation_logs` VALUES (1092, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-06 17:06:12', 8888);
INSERT INTO `operation_logs` VALUES (1093, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-06 17:06:12', 8888);
INSERT INTO `operation_logs` VALUES (1094, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 8, '2021-08-06 17:11:55', 8888);
INSERT INTO `operation_logs` VALUES (1095, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 13, '2021-08-06 17:11:55', 8888);
INSERT INTO `operation_logs` VALUES (1096, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-06 17:14:59', 8888);
INSERT INTO `operation_logs` VALUES (1097, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@77665fb2', '192.168.2.134', 43, '2021-08-06 17:17:06', 8888);
INSERT INTO `operation_logs` VALUES (1098, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 7, '2021-08-06 17:17:06', 8888);
INSERT INTO `operation_logs` VALUES (1099, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-06 17:17:10', 8888);
INSERT INTO `operation_logs` VALUES (1100, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-06 17:17:52', 8888);
INSERT INTO `operation_logs` VALUES (1101, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-06 17:17:52', 8888);
INSERT INTO `operation_logs` VALUES (1102, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-06 17:20:16', 8888);
INSERT INTO `operation_logs` VALUES (1103, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-06 17:20:17', 8888);
INSERT INTO `operation_logs` VALUES (1104, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-06 17:20:39', 8888);
INSERT INTO `operation_logs` VALUES (1105, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-06 17:20:40', 8888);
INSERT INTO `operation_logs` VALUES (1106, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 8, '2021-08-06 17:22:11', 8888);
INSERT INTO `operation_logs` VALUES (1107, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-06 17:22:11', 8888);
INSERT INTO `operation_logs` VALUES (1108, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-06 17:22:40', 8888);
INSERT INTO `operation_logs` VALUES (1109, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-06 17:22:41', 8888);
INSERT INTO `operation_logs` VALUES (1110, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 7, '2021-08-06 17:24:11', 8888);
INSERT INTO `operation_logs` VALUES (1111, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-06 17:24:11', 8888);
INSERT INTO `operation_logs` VALUES (1112, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-06 17:25:04', 8888);
INSERT INTO `operation_logs` VALUES (1113, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-06 17:25:04', 8888);
INSERT INTO `operation_logs` VALUES (1114, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 4, '2021-08-06 17:25:16', 8888);
INSERT INTO `operation_logs` VALUES (1115, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-06 17:25:17', 8888);
INSERT INTO `operation_logs` VALUES (1116, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 19, '2021-08-06 17:26:35', 8888);
INSERT INTO `operation_logs` VALUES (1117, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-06 17:26:36', 8888);
INSERT INTO `operation_logs` VALUES (1118, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 7, '2021-08-06 17:27:36', 8888);
INSERT INTO `operation_logs` VALUES (1119, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-06 17:27:37', 8888);
INSERT INTO `operation_logs` VALUES (1120, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-06 17:28:29', 8888);
INSERT INTO `operation_logs` VALUES (1121, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 3, '2021-08-06 17:28:29', 8888);
INSERT INTO `operation_logs` VALUES (1122, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-06 17:29:46', 8888);
INSERT INTO `operation_logs` VALUES (1123, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-06 17:29:47', 8888);
INSERT INTO `operation_logs` VALUES (1124, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-06 17:30:37', 8888);
INSERT INTO `operation_logs` VALUES (1125, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-06 17:30:37', 8888);
INSERT INTO `operation_logs` VALUES (1126, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-06 17:31:30', 8888);
INSERT INTO `operation_logs` VALUES (1127, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 3, '2021-08-06 17:31:31', 8888);
INSERT INTO `operation_logs` VALUES (1128, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-06 17:32:07', 8888);
INSERT INTO `operation_logs` VALUES (1129, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-06 17:32:07', 8888);
INSERT INTO `operation_logs` VALUES (1130, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-06 17:32:48', 8888);
INSERT INTO `operation_logs` VALUES (1131, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-06 17:32:49', 8888);
INSERT INTO `operation_logs` VALUES (1132, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 7, '2021-08-06 17:41:57', 8888);
INSERT INTO `operation_logs` VALUES (1133, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-06 17:41:58', 8888);
INSERT INTO `operation_logs` VALUES (1134, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 4, '2021-08-06 17:42:47', 8888);
INSERT INTO `operation_logs` VALUES (1135, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-06 17:42:47', 8888);
INSERT INTO `operation_logs` VALUES (1136, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-06 17:42:56', 8888);
INSERT INTO `operation_logs` VALUES (1137, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-06 17:42:56', 8888);
INSERT INTO `operation_logs` VALUES (1138, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-06 17:43:44', 8888);
INSERT INTO `operation_logs` VALUES (1139, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-06 17:43:44', 8888);
INSERT INTO `operation_logs` VALUES (1140, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-06 17:43:49', 8888);
INSERT INTO `operation_logs` VALUES (1141, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-06 17:43:50', 8888);
INSERT INTO `operation_logs` VALUES (1142, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 546, '2021-08-07 09:40:41', 8888);
INSERT INTO `operation_logs` VALUES (1143, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 12, '2021-08-07 09:40:42', 8888);
INSERT INTO `operation_logs` VALUES (1144, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 9, '2021-08-07 09:50:12', 8888);
INSERT INTO `operation_logs` VALUES (1145, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 11, '2021-08-07 09:56:16', 8888);
INSERT INTO `operation_logs` VALUES (1146, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-07 10:01:03', 8888);
INSERT INTO `operation_logs` VALUES (1147, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 7, '2021-08-07 10:01:40', 8888);
INSERT INTO `operation_logs` VALUES (1148, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-07 10:01:55', 8888);
INSERT INTO `operation_logs` VALUES (1149, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-07 10:03:05', 8888);
INSERT INTO `operation_logs` VALUES (1150, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 10, '2021-08-07 10:09:14', 8888);
INSERT INTO `operation_logs` VALUES (1151, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-07 10:09:36', 8888);
INSERT INTO `operation_logs` VALUES (1152, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-07 10:09:38', 8888);
INSERT INTO `operation_logs` VALUES (1153, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 8, '2021-08-07 10:24:58', 8888);
INSERT INTO `operation_logs` VALUES (1154, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 9, '2021-08-07 10:27:02', 8888);
INSERT INTO `operation_logs` VALUES (1155, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 9, '2021-08-07 10:33:42', 8888);
INSERT INTO `operation_logs` VALUES (1156, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-07 10:34:24', 8888);
INSERT INTO `operation_logs` VALUES (1157, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-07 10:34:24', 8888);
INSERT INTO `operation_logs` VALUES (1158, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-07 10:35:14', 8888);
INSERT INTO `operation_logs` VALUES (1159, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 10, '2021-08-07 10:38:14', 8888);
INSERT INTO `operation_logs` VALUES (1160, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-07 10:38:19', 8888);
INSERT INTO `operation_logs` VALUES (1161, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 10, '2021-08-07 10:55:59', 8888);
INSERT INTO `operation_logs` VALUES (1162, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-07 10:55:59', 8888);
INSERT INTO `operation_logs` VALUES (1163, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-07 10:56:28', 8888);
INSERT INTO `operation_logs` VALUES (1164, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-07 10:57:23', 8888);
INSERT INTO `operation_logs` VALUES (1165, '根据UserId修改用户信息', 'update', '/system/users/update/11', 'Users(id=11, username=libai, password=null, employeeNo=0001, phone=17666143833, department=研发, name=操作人1, status=1, lockingTime=null, failLoginCount=0, createdOn=Mon Aug 02 17:50:54 CST 2021, changedOn=2021-08-07 13:47:54, createdBy=null, changedBy=null)', '192.168.2.134', 55, '2021-08-07 13:47:54', 8888);
INSERT INTO `operation_logs` VALUES (1166, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-07 13:47:54', 8888);
INSERT INTO `operation_logs` VALUES (1167, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-07 13:49:40', 8888);
INSERT INTO `operation_logs` VALUES (1168, '根据UserId修改用户信息', 'update', '/system/users/update/11', 'Users(id=11, username=libai, password=null, employeeNo=0001, phone=17666143833, department=研发, name=操作人1, status=1, lockingTime=null, failLoginCount=0, createdOn=Mon Aug 02 17:50:54 CST 2021, changedOn=2021-08-07 13:51:08, createdBy=null, changedBy=null)', '192.168.2.134', 36, '2021-08-07 13:51:08', 8888);
INSERT INTO `operation_logs` VALUES (1169, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-07 13:51:09', 8888);
INSERT INTO `operation_logs` VALUES (1170, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=5}, {pageNum=1}]', '192.168.2.134', 14, '2021-08-07 14:56:55', 8888);
INSERT INTO `operation_logs` VALUES (1171, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {limitIdMap={limitIdMap=1, userId=11}}]', '192.168.2.134', NULL, '2021-08-07 15:00:34', 8888);
INSERT INTO `operation_logs` VALUES (1172, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 8, '2021-08-07 15:18:15', 8888);
INSERT INTO `operation_logs` VALUES (1173, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-07 15:19:05', 8888);
INSERT INTO `operation_logs` VALUES (1174, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-07 15:19:41', 8888);
INSERT INTO `operation_logs` VALUES (1175, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=5}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-07 15:20:05', 8888);
INSERT INTO `operation_logs` VALUES (1176, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 8, '2021-08-07 15:21:58', 8888);
INSERT INTO `operation_logs` VALUES (1177, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 4, '2021-08-07 15:22:54', 8888);
INSERT INTO `operation_logs` VALUES (1178, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 10, '2021-08-07 15:34:08', 8888);
INSERT INTO `operation_logs` VALUES (1179, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-07 15:34:11', 8888);
INSERT INTO `operation_logs` VALUES (1180, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 209, '2021-08-07 15:34:11', 8888);
INSERT INTO `operation_logs` VALUES (1181, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-07 15:34:46', 8888);
INSERT INTO `operation_logs` VALUES (1182, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-07 15:34:47', 8888);
INSERT INTO `operation_logs` VALUES (1183, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-07 15:34:56', 8888);
INSERT INTO `operation_logs` VALUES (1184, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-07 15:35:17', 8888);
INSERT INTO `operation_logs` VALUES (1185, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 10, '2021-08-07 15:37:27', 8888);
INSERT INTO `operation_logs` VALUES (1186, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-07 15:37:32', 8888);
INSERT INTO `operation_logs` VALUES (1187, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 9, '2021-08-07 15:51:19', 8888);
INSERT INTO `operation_logs` VALUES (1188, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 19, '2021-08-07 15:57:33', 8888);
INSERT INTO `operation_logs` VALUES (1189, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 27, '2021-08-09 09:23:33', 8888);
INSERT INTO `operation_logs` VALUES (1190, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-09 09:23:37', 8888);
INSERT INTO `operation_logs` VALUES (1191, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 15, '2021-08-09 09:24:33', 8888);
INSERT INTO `operation_logs` VALUES (1192, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 8, '2021-08-09 09:27:44', 8888);
INSERT INTO `operation_logs` VALUES (1193, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 09:27:53', 8888);
INSERT INTO `operation_logs` VALUES (1194, '根据资源的ID获取权限详情', 'getItem', '/auth/permissions/getInfo/1', '', '192.168.2.134', 7, '2021-08-09 09:50:16', 8888);
INSERT INTO `operation_logs` VALUES (1195, '根据ID删除后台权限', 'delete', '/auth/permissions/delete/1', '', '192.168.2.134', NULL, '2021-08-09 09:50:25', 8888);
INSERT INTO `operation_logs` VALUES (1196, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 9, '2021-08-09 09:53:28', 8888);
INSERT INTO `operation_logs` VALUES (1197, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-09 09:53:53', 8888);
INSERT INTO `operation_logs` VALUES (1198, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 13, '2021-08-09 09:56:24', 8888);
INSERT INTO `operation_logs` VALUES (1199, '根据资源的ID获取权限详情', 'getItem', '/auth/permissions/getInfo/1', '', '192.168.2.134', 3, '2021-08-09 09:57:04', 8888);
INSERT INTO `operation_logs` VALUES (1200, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 09:57:56', 8888);
INSERT INTO `operation_logs` VALUES (1201, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 09:57:59', 8888);
INSERT INTO `operation_logs` VALUES (1202, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 10, '2021-08-09 10:12:05', 8888);
INSERT INTO `operation_logs` VALUES (1203, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=1}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 10, '2021-08-09 10:14:33', 8888);
INSERT INTO `operation_logs` VALUES (1204, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '0:0:0:0:0:0:0:1', 8, '2021-08-09 10:14:52', 8888);
INSERT INTO `operation_logs` VALUES (1205, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=1}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 6, '2021-08-09 10:15:48', 8888);
INSERT INTO `operation_logs` VALUES (1206, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 10, '2021-08-09 10:23:56', 8888);
INSERT INTO `operation_logs` VALUES (1207, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 10:24:14', 8888);
INSERT INTO `operation_logs` VALUES (1208, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 13, '2021-08-09 10:24:14', 8888);
INSERT INTO `operation_logs` VALUES (1209, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 7, '2021-08-09 10:25:00', 8888);
INSERT INTO `operation_logs` VALUES (1210, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 7, '2021-08-09 10:25:00', 8888);
INSERT INTO `operation_logs` VALUES (1211, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 10:25:20', 8888);
INSERT INTO `operation_logs` VALUES (1212, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 7, '2021-08-09 10:25:21', 8888);
INSERT INTO `operation_logs` VALUES (1213, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 10, '2021-08-09 10:27:44', 8888);
INSERT INTO `operation_logs` VALUES (1214, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=5}, {pageNum=1}]', '192.168.2.134', 10, '2021-08-09 10:35:42', 8888);
INSERT INTO `operation_logs` VALUES (1215, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 10:36:20', 8888);
INSERT INTO `operation_logs` VALUES (1216, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 7, '2021-08-09 10:36:43', 8888);
INSERT INTO `operation_logs` VALUES (1217, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 10:36:57', 8888);
INSERT INTO `operation_logs` VALUES (1218, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 14, '2021-08-09 10:37:12', 8888);
INSERT INTO `operation_logs` VALUES (1219, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=5}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 10, '2021-08-09 10:38:38', 8888);
INSERT INTO `operation_logs` VALUES (1220, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-09 10:40:33', 8888);
INSERT INTO `operation_logs` VALUES (1221, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 10:40:33', 8888);
INSERT INTO `operation_logs` VALUES (1222, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-09 10:41:40', 8888);
INSERT INTO `operation_logs` VALUES (1223, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-09 10:42:44', 8888);
INSERT INTO `operation_logs` VALUES (1224, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 10:43:42', 8888);
INSERT INTO `operation_logs` VALUES (1225, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 10, '2021-08-09 10:44:48', 8888);
INSERT INTO `operation_logs` VALUES (1226, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-09 10:47:54', 8888);
INSERT INTO `operation_logs` VALUES (1227, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 10:48:01', 8888);
INSERT INTO `operation_logs` VALUES (1228, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 10:48:02', 8888);
INSERT INTO `operation_logs` VALUES (1229, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-09 10:49:47', 8888);
INSERT INTO `operation_logs` VALUES (1230, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-09 10:51:46', 8888);
INSERT INTO `operation_logs` VALUES (1231, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 10:51:53', 8888);
INSERT INTO `operation_logs` VALUES (1232, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-09 10:53:15', 8888);
INSERT INTO `operation_logs` VALUES (1233, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 10:53:18', 8888);
INSERT INTO `operation_logs` VALUES (1234, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 10:53:19', 8888);
INSERT INTO `operation_logs` VALUES (1235, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-09 10:56:20', 8888);
INSERT INTO `operation_logs` VALUES (1236, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 13, '2021-08-09 10:57:25', 8888);
INSERT INTO `operation_logs` VALUES (1237, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 10:57:30', 8888);
INSERT INTO `operation_logs` VALUES (1238, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 10:57:39', 8888);
INSERT INTO `operation_logs` VALUES (1239, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 10, '2021-08-09 10:59:07', 8888);
INSERT INTO `operation_logs` VALUES (1240, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-09 11:01:23', 8888);
INSERT INTO `operation_logs` VALUES (1241, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-09 11:01:44', 8888);
INSERT INTO `operation_logs` VALUES (1242, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 11:01:45', 8888);
INSERT INTO `operation_logs` VALUES (1243, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 11:02:04', 8888);
INSERT INTO `operation_logs` VALUES (1244, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 11:02:06', 8888);
INSERT INTO `operation_logs` VALUES (1245, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 11:02:07', 8888);
INSERT INTO `operation_logs` VALUES (1246, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 11:02:23', 8888);
INSERT INTO `operation_logs` VALUES (1247, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 11:02:28', 8888);
INSERT INTO `operation_logs` VALUES (1248, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 4, '2021-08-09 11:02:29', 8888);
INSERT INTO `operation_logs` VALUES (1249, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-09 11:04:02', 8888);
INSERT INTO `operation_logs` VALUES (1250, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-09 11:09:21', 8888);
INSERT INTO `operation_logs` VALUES (1251, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 645, '2021-08-09 11:13:17', 8888);
INSERT INTO `operation_logs` VALUES (1252, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 10, '2021-08-09 11:15:04', 8888);
INSERT INTO `operation_logs` VALUES (1253, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 11:15:11', 8888);
INSERT INTO `operation_logs` VALUES (1254, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 11:15:18', 8888);
INSERT INTO `operation_logs` VALUES (1255, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-09 11:16:42', 8888);
INSERT INTO `operation_logs` VALUES (1256, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 11:16:47', 8888);
INSERT INTO `operation_logs` VALUES (1257, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 11:16:48', 8888);
INSERT INTO `operation_logs` VALUES (1258, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 11:17:08', 8888);
INSERT INTO `operation_logs` VALUES (1259, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 4, '2021-08-09 11:17:11', 8888);
INSERT INTO `operation_logs` VALUES (1260, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 9, '2021-08-09 11:18:25', 8888);
INSERT INTO `operation_logs` VALUES (1261, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 11:18:30', 8888);
INSERT INTO `operation_logs` VALUES (1262, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-09 11:18:34', 8888);
INSERT INTO `operation_logs` VALUES (1263, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 11:18:37', 8888);
INSERT INTO `operation_logs` VALUES (1264, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=5}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 11:19:05', 8888);
INSERT INTO `operation_logs` VALUES (1265, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 11:19:39', 8888);
INSERT INTO `operation_logs` VALUES (1266, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 11:19:45', 8888);
INSERT INTO `operation_logs` VALUES (1267, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-09 11:20:44', 8888);
INSERT INTO `operation_logs` VALUES (1268, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 11:20:44', 8888);
INSERT INTO `operation_logs` VALUES (1269, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 8, '2021-08-09 11:23:55', 8888);
INSERT INTO `operation_logs` VALUES (1270, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 11:23:56', 8888);
INSERT INTO `operation_logs` VALUES (1271, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-09 11:26:52', 8888);
INSERT INTO `operation_logs` VALUES (1272, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 11:26:55', 8888);
INSERT INTO `operation_logs` VALUES (1273, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 11:26:55', 8888);
INSERT INTO `operation_logs` VALUES (1274, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 11:27:05', 8888);
INSERT INTO `operation_logs` VALUES (1275, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 11:27:05', 8888);
INSERT INTO `operation_logs` VALUES (1276, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 11:27:31', 8888);
INSERT INTO `operation_logs` VALUES (1277, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 11:27:37', 8888);
INSERT INTO `operation_logs` VALUES (1278, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 11:27:37', 8888);
INSERT INTO `operation_logs` VALUES (1279, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 4, '2021-08-09 11:28:04', 8888);
INSERT INTO `operation_logs` VALUES (1280, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 11:28:14', 8888);
INSERT INTO `operation_logs` VALUES (1281, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 11:28:17', 8888);
INSERT INTO `operation_logs` VALUES (1282, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-09 11:31:57', 8888);
INSERT INTO `operation_logs` VALUES (1283, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 10, '2021-08-09 11:37:51', 8888);
INSERT INTO `operation_logs` VALUES (1284, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-09 11:38:07', 8888);
INSERT INTO `operation_logs` VALUES (1285, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 11:38:20', 8888);
INSERT INTO `operation_logs` VALUES (1286, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 8, '2021-08-09 11:39:49', 8888);
INSERT INTO `operation_logs` VALUES (1287, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 11:39:54', 8888);
INSERT INTO `operation_logs` VALUES (1288, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 11:39:54', 8888);
INSERT INTO `operation_logs` VALUES (1289, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 8, '2021-08-09 11:41:28', 8888);
INSERT INTO `operation_logs` VALUES (1290, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 11:41:30', 8888);
INSERT INTO `operation_logs` VALUES (1291, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 11:41:31', 8888);
INSERT INTO `operation_logs` VALUES (1292, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-09 11:44:15', 8888);
INSERT INTO `operation_logs` VALUES (1293, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 11:44:17', 8888);
INSERT INTO `operation_logs` VALUES (1294, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 11:44:18', 8888);
INSERT INTO `operation_logs` VALUES (1295, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 4, '2021-08-09 11:44:36', 8888);
INSERT INTO `operation_logs` VALUES (1296, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 4, '2021-08-09 11:44:38', 8888);
INSERT INTO `operation_logs` VALUES (1297, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 11:44:38', 8888);
INSERT INTO `operation_logs` VALUES (1298, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 8, '2021-08-09 11:48:18', 8888);
INSERT INTO `operation_logs` VALUES (1299, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 11:48:23', 8888);
INSERT INTO `operation_logs` VALUES (1300, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 4, '2021-08-09 11:48:23', 8888);
INSERT INTO `operation_logs` VALUES (1301, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 7, '2021-08-09 11:52:08', 8888);
INSERT INTO `operation_logs` VALUES (1302, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 11:52:11', 8888);
INSERT INTO `operation_logs` VALUES (1303, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 11:52:12', 8888);
INSERT INTO `operation_logs` VALUES (1304, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 11:52:19', 8888);
INSERT INTO `operation_logs` VALUES (1305, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 84, '2021-08-09 13:35:18', 8888);
INSERT INTO `operation_logs` VALUES (1306, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 13:35:55', 8888);
INSERT INTO `operation_logs` VALUES (1307, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-09 13:36:01', 8888);
INSERT INTO `operation_logs` VALUES (1308, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 13:36:02', 8888);
INSERT INTO `operation_logs` VALUES (1309, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 12, '2021-08-09 13:37:52', 8888);
INSERT INTO `operation_logs` VALUES (1310, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 13:38:14', 8888);
INSERT INTO `operation_logs` VALUES (1311, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 13:38:37', 8888);
INSERT INTO `operation_logs` VALUES (1312, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-09 13:40:15', 8888);
INSERT INTO `operation_logs` VALUES (1313, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-09 13:41:50', 8888);
INSERT INTO `operation_logs` VALUES (1314, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-09 13:44:00', 8888);
INSERT INTO `operation_logs` VALUES (1315, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 13:44:21', 8888);
INSERT INTO `operation_logs` VALUES (1316, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-09 13:46:08', 8888);
INSERT INTO `operation_logs` VALUES (1317, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 13:46:34', 8888);
INSERT INTO `operation_logs` VALUES (1318, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {limitIdMap={limitIdMap=1, userId=11}}]', '192.168.2.134', NULL, '2021-08-09 13:47:12', 8888);
INSERT INTO `operation_logs` VALUES (1319, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 10, '2021-08-09 13:49:09', 8888);
INSERT INTO `operation_logs` VALUES (1320, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 13:49:15', 8888);
INSERT INTO `operation_logs` VALUES (1321, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 13:49:24', 8888);
INSERT INTO `operation_logs` VALUES (1322, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 13:49:52', 8888);
INSERT INTO `operation_logs` VALUES (1323, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {limitIdMap={userId=11}}]', '192.168.2.134', NULL, '2021-08-09 13:50:00', 8888);
INSERT INTO `operation_logs` VALUES (1324, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 12, '2021-08-09 13:53:09', 8888);
INSERT INTO `operation_logs` VALUES (1325, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 13:53:19', 8888);
INSERT INTO `operation_logs` VALUES (1326, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-09 13:56:08', 8888);
INSERT INTO `operation_logs` VALUES (1327, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=12}, {limitIdMap={userId=12}}]', '192.168.2.134', NULL, '2021-08-09 13:58:12', 8888);
INSERT INTO `operation_logs` VALUES (1328, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 10, '2021-08-09 14:01:45', 8888);
INSERT INTO `operation_logs` VALUES (1329, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 14:01:46', 8888);
INSERT INTO `operation_logs` VALUES (1330, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 14:01:50', 8888);
INSERT INTO `operation_logs` VALUES (1331, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 14:01:52', 8888);
INSERT INTO `operation_logs` VALUES (1332, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {limitIdMap={userId=11}}]', '192.168.2.134', NULL, '2021-08-09 14:03:32', 8888);
INSERT INTO `operation_logs` VALUES (1333, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 22, '2021-08-09 14:05:57', 8888);
INSERT INTO `operation_logs` VALUES (1334, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {limitIdMap={limitIdMap=1, userId=11}}]', '192.168.2.134', NULL, '2021-08-09 14:08:11', 8888);
INSERT INTO `operation_logs` VALUES (1335, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 104, '2021-08-09 14:15:35', 8888);
INSERT INTO `operation_logs` VALUES (1336, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 12, '2021-08-09 14:17:05', 8888);
INSERT INTO `operation_logs` VALUES (1337, '由权限id修改权限', 'update', '/auth/permissions/update/11', 'Permissions(id=11, parentId=0, name=string, url=string, type=0, status=0, sort=0, createdOn=Mon Aug 09 11:07:01 CST 2021, changedOn=Mon Aug 09 11:07:01 CST 2021, createdBy=0, changedBy=0)', '192.168.2.134', NULL, '2021-08-09 14:22:34', 8888);
INSERT INTO `operation_logs` VALUES (1338, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 42, '2021-08-09 14:23:58', 8888);
INSERT INTO `operation_logs` VALUES (1339, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {additionalProp1=[0], additionalProp2=[0], additionalProp3=[0]}]', '192.168.2.134', NULL, '2021-08-09 14:26:28', 8888);
INSERT INTO `operation_logs` VALUES (1340, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {additionalProp1=[1], additionalProp2=[2], additionalProp3=[3, 4]}]', '192.168.2.134', NULL, '2021-08-09 14:27:10', 8888);
INSERT INTO `operation_logs` VALUES (1341, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {additionalProp1=[0], additionalProp2=[0], additionalProp3=[0]}]', '192.168.2.134', NULL, '2021-08-09 14:27:32', 8888);
INSERT INTO `operation_logs` VALUES (1342, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {additionalProp1=[1], additionalProp2=[2], additionalProp3=[3]}]', '192.168.2.134', NULL, '2021-08-09 14:29:26', 8888);
INSERT INTO `operation_logs` VALUES (1343, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {modelIds=[1], permissionIds=[2]}]', '192.168.2.134', 112, '2021-08-09 14:30:18', 8888);
INSERT INTO `operation_logs` VALUES (1344, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 25, '2021-08-09 14:31:32', 8888);
INSERT INTO `operation_logs` VALUES (1345, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-09 14:32:56', 8888);
INSERT INTO `operation_logs` VALUES (1346, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {modelIds=[1], permissionIds=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]}]', '192.168.2.134', 92, '2021-08-09 14:33:23', 8888);
INSERT INTO `operation_logs` VALUES (1347, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-09 14:33:27', 8888);
INSERT INTO `operation_logs` VALUES (1348, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 8, '2021-08-09 14:33:30', 8888);
INSERT INTO `operation_logs` VALUES (1349, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 7, '2021-08-09 14:33:34', 8888);
INSERT INTO `operation_logs` VALUES (1350, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 3, 4, 5, 6, 7, 8, 11, 10, 12, 13, 14, 15], modelIds=[1]}]', '192.168.2.134', 71, '2021-08-09 14:33:37', 8888);
INSERT INTO `operation_logs` VALUES (1351, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 14:33:38', 8888);
INSERT INTO `operation_logs` VALUES (1352, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 14:34:03', 8888);
INSERT INTO `operation_logs` VALUES (1353, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 3, 4, 5, 6, 7, 8, 11, 10, 12, 13, 14, 15], modelIds=[1]}]', '192.168.2.134', 99, '2021-08-09 14:34:06', 8888);
INSERT INTO `operation_logs` VALUES (1354, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 14:34:06', 8888);
INSERT INTO `operation_logs` VALUES (1355, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 8, '2021-08-09 14:34:47', 8888);
INSERT INTO `operation_logs` VALUES (1356, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-09 14:36:32', 8888);
INSERT INTO `operation_logs` VALUES (1357, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 14:37:01', 8888);
INSERT INTO `operation_logs` VALUES (1358, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-09 14:51:09', 8888);
INSERT INTO `operation_logs` VALUES (1359, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-09 14:51:15', 8888);
INSERT INTO `operation_logs` VALUES (1360, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 14:51:15', 8888);
INSERT INTO `operation_logs` VALUES (1361, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 11, '2021-08-09 14:55:49', 8888);
INSERT INTO `operation_logs` VALUES (1362, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 14:55:54', 8888);
INSERT INTO `operation_logs` VALUES (1363, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 14:55:55', 8888);
INSERT INTO `operation_logs` VALUES (1364, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 14:56:39', 8888);
INSERT INTO `operation_logs` VALUES (1365, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-09 14:57:42', 8888);
INSERT INTO `operation_logs` VALUES (1366, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-09 14:58:29', 8888);
INSERT INTO `operation_logs` VALUES (1367, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 14:58:30', 8888);
INSERT INTO `operation_logs` VALUES (1368, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 10, '2021-08-09 15:00:09', 8888);
INSERT INTO `operation_logs` VALUES (1369, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 34, '2021-08-09 15:16:17', 8888);
INSERT INTO `operation_logs` VALUES (1370, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-09 15:16:31', 8888);
INSERT INTO `operation_logs` VALUES (1371, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 15:16:31', 8888);
INSERT INTO `operation_logs` VALUES (1372, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 3, 4, 5, 6, 7, 8, 11, 10, 12, 13, 14, 15], modelIds=[1]}]', '192.168.2.134', 107, '2021-08-09 15:17:09', 8888);
INSERT INTO `operation_logs` VALUES (1373, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 7, '2021-08-09 15:17:10', 8888);
INSERT INTO `operation_logs` VALUES (1374, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 11, '2021-08-09 15:18:39', 8888);
INSERT INTO `operation_logs` VALUES (1375, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 18, '2021-08-09 15:18:59', 8888);
INSERT INTO `operation_logs` VALUES (1376, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 31, '2021-08-09 15:25:49', 8888);
INSERT INTO `operation_logs` VALUES (1377, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 7, '2021-08-09 15:25:56', 8888);
INSERT INTO `operation_logs` VALUES (1378, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 11, '2021-08-09 15:27:46', 8888);
INSERT INTO `operation_logs` VALUES (1379, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-09 15:27:54', 8888);
INSERT INTO `operation_logs` VALUES (1380, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 15:27:54', 8888);
INSERT INTO `operation_logs` VALUES (1381, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 18, '2021-08-09 15:28:19', 8888);
INSERT INTO `operation_logs` VALUES (1382, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 18, '2021-08-09 15:28:27', 8888);
INSERT INTO `operation_logs` VALUES (1383, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 15:28:36', 8888);
INSERT INTO `operation_logs` VALUES (1384, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 15:29:35', 8888);
INSERT INTO `operation_logs` VALUES (1385, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 15:30:24', 8888);
INSERT INTO `operation_logs` VALUES (1386, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 15:30:40', 8888);
INSERT INTO `operation_logs` VALUES (1387, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-09 15:37:29', 8888);
INSERT INTO `operation_logs` VALUES (1388, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-09 15:38:41', 8888);
INSERT INTO `operation_logs` VALUES (1389, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 10, '2021-08-09 15:41:03', 8888);
INSERT INTO `operation_logs` VALUES (1390, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 9, 10, 3, 6, 7, 8, 12, 13, 14, 15], modelIds=[1]}]', '192.168.2.134', 106, '2021-08-09 15:41:17', 8888);
INSERT INTO `operation_logs` VALUES (1391, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 15:41:17', 8888);
INSERT INTO `operation_logs` VALUES (1392, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 18, '2021-08-09 15:41:22', 8888);
INSERT INTO `operation_logs` VALUES (1393, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 15:41:23', 8888);
INSERT INTO `operation_logs` VALUES (1394, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 15:41:30', 8888);
INSERT INTO `operation_logs` VALUES (1395, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 15:41:59', 8888);
INSERT INTO `operation_logs` VALUES (1396, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], modelIds=[1, 2, 5]}]', '192.168.2.134', 92, '2021-08-09 15:47:19', 8888);
INSERT INTO `operation_logs` VALUES (1397, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 15:47:19', 8888);
INSERT INTO `operation_logs` VALUES (1398, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 15:47:21', 8888);
INSERT INTO `operation_logs` VALUES (1399, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-09 15:47:30', 8888);
INSERT INTO `operation_logs` VALUES (1400, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 15:47:31', 8888);
INSERT INTO `operation_logs` VALUES (1401, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 15:47:36', 8888);
INSERT INTO `operation_logs` VALUES (1402, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=12}, {permissionIds=[1, 2, 3, 4, 5], modelIds=[5]}]', '192.168.2.134', 95, '2021-08-09 15:47:46', 8888);
INSERT INTO `operation_logs` VALUES (1403, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 15:47:46', 8888);
INSERT INTO `operation_logs` VALUES (1404, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 15:47:51', 8888);
INSERT INTO `operation_logs` VALUES (1405, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 8, '2021-08-09 15:54:13', 8888);
INSERT INTO `operation_logs` VALUES (1406, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 4, '2021-08-09 15:54:18', 8888);
INSERT INTO `operation_logs` VALUES (1407, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=12}, {permissionIds=[1, 6, 2, 3, 4, 5, 7], modelIds=[5, 2]}]', '192.168.2.134', 91, '2021-08-09 15:54:29', 8888);
INSERT INTO `operation_logs` VALUES (1408, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 15:54:29', 8888);
INSERT INTO `operation_logs` VALUES (1409, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 15:54:31', 8888);
INSERT INTO `operation_logs` VALUES (1410, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=12}, {permissionIds=[1, 6, 9, 10, 2, 3, 4, 5, 7, 11, 14], modelIds=[5, 2]}]', '192.168.2.134', 43, '2021-08-09 15:54:53', 8888);
INSERT INTO `operation_logs` VALUES (1411, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 15:54:53', 8888);
INSERT INTO `operation_logs` VALUES (1412, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 4, '2021-08-09 15:55:08', 8888);
INSERT INTO `operation_logs` VALUES (1413, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=12}, {permissionIds=[1, 6, 9, 10, 2, 3, 4, 5, 7, 11, 14], modelIds=[5, 2]}]', '192.168.2.134', 135, '2021-08-09 15:55:10', 8888);
INSERT INTO `operation_logs` VALUES (1414, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 15:55:10', 8888);
INSERT INTO `operation_logs` VALUES (1415, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 15:55:12', 8888);
INSERT INTO `operation_logs` VALUES (1416, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], modelIds=[1, 2, 5]}]', '192.168.2.134', 103, '2021-08-09 15:55:17', 8888);
INSERT INTO `operation_logs` VALUES (1417, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 15:55:18', 8888);
INSERT INTO `operation_logs` VALUES (1418, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 15:55:19', 8888);
INSERT INTO `operation_logs` VALUES (1419, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-09 15:55:30', 8888);
INSERT INTO `operation_logs` VALUES (1420, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 7, '2021-08-09 15:55:38', 8888);
INSERT INTO `operation_logs` VALUES (1421, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 15:55:40', 8888);
INSERT INTO `operation_logs` VALUES (1422, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 15:55:55', 8888);
INSERT INTO `operation_logs` VALUES (1423, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 15:55:56', 8888);
INSERT INTO `operation_logs` VALUES (1424, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 15:56:00', 8888);
INSERT INTO `operation_logs` VALUES (1425, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 15:56:08', 8888);
INSERT INTO `operation_logs` VALUES (1426, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 15:56:45', 8888);
INSERT INTO `operation_logs` VALUES (1427, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], modelIds=[1, 2, 5]}]', '192.168.2.134', 86, '2021-08-09 15:56:48', 8888);
INSERT INTO `operation_logs` VALUES (1428, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 15:56:49', 8888);
INSERT INTO `operation_logs` VALUES (1429, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-09 15:56:50', 8888);
INSERT INTO `operation_logs` VALUES (1430, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 8, '2021-08-09 16:00:09', 8888);
INSERT INTO `operation_logs` VALUES (1431, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 4, '2021-08-09 16:00:11', 8888);
INSERT INTO `operation_logs` VALUES (1432, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], modelIds=[1, 2, 5]}]', '192.168.2.134', 105, '2021-08-09 16:00:12', 8888);
INSERT INTO `operation_logs` VALUES (1433, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 16:00:13', 8888);
INSERT INTO `operation_logs` VALUES (1434, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 18, '2021-08-09 16:04:41', 8888);
INSERT INTO `operation_logs` VALUES (1435, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 9, 10, 3, 5, 6, 7, 8, 11, 12, 13, 14, 15], modelIds=[1, 2, 5]}]', '192.168.2.134', 88, '2021-08-09 16:04:47', 8888);
INSERT INTO `operation_logs` VALUES (1436, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 16:04:47', 8888);
INSERT INTO `operation_logs` VALUES (1437, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 16:05:26', 8888);
INSERT INTO `operation_logs` VALUES (1438, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 9, 10, 3, 5, 6, 7, 8, 11, 12, 13, 14, 15], modelIds=[1, 2, 5]}]', '192.168.2.134', 101, '2021-08-09 16:05:32', 8888);
INSERT INTO `operation_logs` VALUES (1439, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 16:05:32', 8888);
INSERT INTO `operation_logs` VALUES (1440, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 16:05:33', 8888);
INSERT INTO `operation_logs` VALUES (1441, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 16:05:50', 8888);
INSERT INTO `operation_logs` VALUES (1442, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 16:05:51', 8888);
INSERT INTO `operation_logs` VALUES (1443, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 16:05:53', 8888);
INSERT INTO `operation_logs` VALUES (1444, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 9, 10, 6, 7, 8, 11, 12, 13, 14, 15], modelIds=[1, 2, 5]}]', '192.168.2.134', 37, '2021-08-09 16:06:01', 8888);
INSERT INTO `operation_logs` VALUES (1445, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 16:06:01', 8888);
INSERT INTO `operation_logs` VALUES (1446, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 16:06:01', 8888);
INSERT INTO `operation_logs` VALUES (1447, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 7, '2021-08-09 16:06:05', 8888);
INSERT INTO `operation_logs` VALUES (1448, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], modelIds=[1, 2, 5]}]', '192.168.2.134', 35, '2021-08-09 16:06:11', 8888);
INSERT INTO `operation_logs` VALUES (1449, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 16:06:11', 8888);
INSERT INTO `operation_logs` VALUES (1450, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 16:06:11', 8888);
INSERT INTO `operation_logs` VALUES (1451, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 16:07:01', 8888);
INSERT INTO `operation_logs` VALUES (1452, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], modelIds=[1, 2, 5]}]', '192.168.2.134', 115, '2021-08-09 16:07:08', 8888);
INSERT INTO `operation_logs` VALUES (1453, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 16:07:08', 8888);
INSERT INTO `operation_logs` VALUES (1454, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 16:07:08', 8888);
INSERT INTO `operation_logs` VALUES (1455, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 16:07:35', 8888);
INSERT INTO `operation_logs` VALUES (1456, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 5, 6, 7, 8], modelIds=[1, 2, 5]}]', '192.168.2.134', 258, '2021-08-09 16:07:39', 8888);
INSERT INTO `operation_logs` VALUES (1457, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 16:07:39', 8888);
INSERT INTO `operation_logs` VALUES (1458, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-09 16:07:39', 8888);
INSERT INTO `operation_logs` VALUES (1459, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 16:07:43', 8888);
INSERT INTO `operation_logs` VALUES (1460, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], modelIds=[1, 2, 5]}]', '192.168.2.134', 49, '2021-08-09 16:07:45', 8888);
INSERT INTO `operation_logs` VALUES (1461, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 16:07:46', 8888);
INSERT INTO `operation_logs` VALUES (1462, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 16:07:46', 8888);
INSERT INTO `operation_logs` VALUES (1463, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 16:07:51', 8888);
INSERT INTO `operation_logs` VALUES (1464, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], modelIds=[1, 2, 5]}]', '192.168.2.134', 100, '2021-08-09 16:07:56', 8888);
INSERT INTO `operation_logs` VALUES (1465, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 16:07:56', 8888);
INSERT INTO `operation_logs` VALUES (1466, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 16:07:56', 8888);
INSERT INTO `operation_logs` VALUES (1467, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 16:07:59', 8888);
INSERT INTO `operation_logs` VALUES (1468, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], modelIds=[1, 2, 5]}]', '192.168.2.134', 123, '2021-08-09 16:08:04', 8888);
INSERT INTO `operation_logs` VALUES (1469, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 16:08:04', 8888);
INSERT INTO `operation_logs` VALUES (1470, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 16:08:05', 8888);
INSERT INTO `operation_logs` VALUES (1471, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 16:08:11', 8888);
INSERT INTO `operation_logs` VALUES (1472, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], modelIds=[1, 2, 5]}]', '192.168.2.134', 85, '2021-08-09 16:08:15', 8888);
INSERT INTO `operation_logs` VALUES (1473, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 16:08:15', 8888);
INSERT INTO `operation_logs` VALUES (1474, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 16:08:15', 8888);
INSERT INTO `operation_logs` VALUES (1475, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 16:08:17', 8888);
INSERT INTO `operation_logs` VALUES (1476, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], modelIds=[1, 2, 5]}]', '192.168.2.134', 175, '2021-08-09 16:08:20', 8888);
INSERT INTO `operation_logs` VALUES (1477, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-09 16:08:20', 8888);
INSERT INTO `operation_logs` VALUES (1478, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 16:08:21', 8888);
INSERT INTO `operation_logs` VALUES (1479, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 16:08:34', 8888);
INSERT INTO `operation_logs` VALUES (1480, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 9, 10, 5, 6, 7, 8, 12, 13, 14, 15, 16], modelIds=[1, 2, 5]}]', '192.168.2.134', 79, '2021-08-09 16:08:38', 8888);
INSERT INTO `operation_logs` VALUES (1481, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 16:08:38', 8888);
INSERT INTO `operation_logs` VALUES (1482, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 16:08:38', 8888);
INSERT INTO `operation_logs` VALUES (1483, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 16:08:44', 8888);
INSERT INTO `operation_logs` VALUES (1484, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 16:08:47', 8888);
INSERT INTO `operation_logs` VALUES (1485, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 9, 10, 5, 6, 7, 8, 12, 13, 15, 16], modelIds=[1, 2, 5]}]', '192.168.2.134', 78, '2021-08-09 16:08:53', 8888);
INSERT INTO `operation_logs` VALUES (1486, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 16:08:53', 8888);
INSERT INTO `operation_logs` VALUES (1487, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 16:08:53', 8888);
INSERT INTO `operation_logs` VALUES (1488, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 9, '2021-08-09 16:10:18', 8888);
INSERT INTO `operation_logs` VALUES (1489, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 16:10:20', 8888);
INSERT INTO `operation_logs` VALUES (1490, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 9, 10, 4, 5, 6, 7, 8, 11, 13, 14, 16], modelIds=[1, 2, 5]}]', '192.168.2.134', 88, '2021-08-09 16:10:34', 8888);
INSERT INTO `operation_logs` VALUES (1491, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 16:10:34', 8888);
INSERT INTO `operation_logs` VALUES (1492, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 16:10:34', 8888);
INSERT INTO `operation_logs` VALUES (1493, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 16:10:44', 8888);
INSERT INTO `operation_logs` VALUES (1494, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 17, '2021-08-09 16:10:45', 8888);
INSERT INTO `operation_logs` VALUES (1495, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 11, 13, 14, 16], modelIds=[1, 2, 5]}]', '192.168.2.134', 115, '2021-08-09 16:11:16', 8888);
INSERT INTO `operation_logs` VALUES (1496, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 14, '2021-08-09 16:11:16', 8888);
INSERT INTO `operation_logs` VALUES (1497, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 7, '2021-08-09 16:11:16', 8888);
INSERT INTO `operation_logs` VALUES (1498, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 16:12:09', 8888);
INSERT INTO `operation_logs` VALUES (1499, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 16:12:18', 8888);
INSERT INTO `operation_logs` VALUES (1500, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 16:12:19', 8888);
INSERT INTO `operation_logs` VALUES (1501, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], modelIds=[1, 2, 5]}]', '192.168.2.134', 89, '2021-08-09 16:12:29', 8888);
INSERT INTO `operation_logs` VALUES (1502, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 4, '2021-08-09 16:12:29', 8888);
INSERT INTO `operation_logs` VALUES (1503, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 16:12:30', 8888);
INSERT INTO `operation_logs` VALUES (1504, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 16:12:40', 8888);
INSERT INTO `operation_logs` VALUES (1505, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], modelIds=[1, 2, 5]}]', '192.168.2.134', 106, '2021-08-09 16:12:44', 8888);
INSERT INTO `operation_logs` VALUES (1506, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 16:12:44', 8888);
INSERT INTO `operation_logs` VALUES (1507, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 16:12:45', 8888);
INSERT INTO `operation_logs` VALUES (1508, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 11, '2021-08-09 16:27:16', 8888);
INSERT INTO `operation_logs` VALUES (1509, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 13, '2021-08-09 16:27:16', 8888);
INSERT INTO `operation_logs` VALUES (1510, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 15, '2021-08-09 16:29:31', 8888);
INSERT INTO `operation_logs` VALUES (1511, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 10, '2021-08-09 16:29:32', 8888);
INSERT INTO `operation_logs` VALUES (1512, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 16:29:37', 8888);
INSERT INTO `operation_logs` VALUES (1513, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], modelIds=[1, 2, 5]}]', '192.168.2.134', 105, '2021-08-09 16:29:43', 8888);
INSERT INTO `operation_logs` VALUES (1514, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 8, '2021-08-09 16:29:43', 8888);
INSERT INTO `operation_logs` VALUES (1515, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 16:29:44', 8888);
INSERT INTO `operation_logs` VALUES (1516, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 7, '2021-08-09 16:29:59', 8888);
INSERT INTO `operation_logs` VALUES (1517, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], modelIds=[1, 2, 5]}]', '192.168.2.134', 212, '2021-08-09 16:30:03', 8888);
INSERT INTO `operation_logs` VALUES (1518, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 4, '2021-08-09 16:30:03', 8888);
INSERT INTO `operation_logs` VALUES (1519, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 8, '2021-08-09 16:30:04', 8888);
INSERT INTO `operation_logs` VALUES (1520, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 16, '2021-08-09 16:31:36', 8888);
INSERT INTO `operation_logs` VALUES (1521, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 16:31:37', 8888);
INSERT INTO `operation_logs` VALUES (1522, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 16:31:41', 8888);
INSERT INTO `operation_logs` VALUES (1523, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], modelIds=[1, 2, 5]}]', '192.168.2.134', 113, '2021-08-09 16:31:46', 8888);
INSERT INTO `operation_logs` VALUES (1524, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 16:31:46', 8888);
INSERT INTO `operation_logs` VALUES (1525, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 10, '2021-08-09 16:31:46', 8888);
INSERT INTO `operation_logs` VALUES (1526, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 16:31:48', 8888);
INSERT INTO `operation_logs` VALUES (1527, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], modelIds=[1, 2, 5]}]', '192.168.2.134', 53, '2021-08-09 16:32:13', 8888);
INSERT INTO `operation_logs` VALUES (1528, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 16:32:13', 8888);
INSERT INTO `operation_logs` VALUES (1529, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 33, '2021-08-09 16:32:13', 8888);
INSERT INTO `operation_logs` VALUES (1530, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 17, '2021-08-09 16:32:19', 8888);
INSERT INTO `operation_logs` VALUES (1531, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], modelIds=[1, 2, 5]}]', '192.168.2.134', 105, '2021-08-09 16:32:24', 8888);
INSERT INTO `operation_logs` VALUES (1532, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 30, '2021-08-09 16:32:24', 8888);
INSERT INTO `operation_logs` VALUES (1533, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 14, '2021-08-09 16:32:25', 8888);
INSERT INTO `operation_logs` VALUES (1534, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 23, '2021-08-09 16:34:45', 8888);
INSERT INTO `operation_logs` VALUES (1535, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 16:34:45', 8888);
INSERT INTO `operation_logs` VALUES (1536, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-09 16:34:55', 8888);
INSERT INTO `operation_logs` VALUES (1537, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 16:34:56', 8888);
INSERT INTO `operation_logs` VALUES (1538, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 16:35:03', 8888);
INSERT INTO `operation_logs` VALUES (1539, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], modelIds=[1, 2, 5]}]', '192.168.2.134', 165, '2021-08-09 16:35:07', 8888);
INSERT INTO `operation_logs` VALUES (1540, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 17, '2021-08-09 16:35:07', 8888);
INSERT INTO `operation_logs` VALUES (1541, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 16:35:08', 8888);
INSERT INTO `operation_logs` VALUES (1542, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 16:35:20', 8888);
INSERT INTO `operation_logs` VALUES (1543, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 6, 7, 8], modelIds=[1, 2, 5]}]', '192.168.2.134', 85, '2021-08-09 16:35:24', 8888);
INSERT INTO `operation_logs` VALUES (1544, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 16:35:24', 8888);
INSERT INTO `operation_logs` VALUES (1545, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 16:35:24', 8888);
INSERT INTO `operation_logs` VALUES (1546, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 16:35:26', 8888);
INSERT INTO `operation_logs` VALUES (1547, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 9, 10, 6, 7, 8, 11], modelIds=[1, 2, 5]}]', '192.168.2.134', 125, '2021-08-09 16:35:33', 8888);
INSERT INTO `operation_logs` VALUES (1548, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 16:35:33', 8888);
INSERT INTO `operation_logs` VALUES (1549, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 16:35:33', 8888);
INSERT INTO `operation_logs` VALUES (1550, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 4, '2021-08-09 16:35:37', 8888);
INSERT INTO `operation_logs` VALUES (1551, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 11], modelIds=[1, 2, 5]}]', '192.168.2.134', 37, '2021-08-09 16:35:41', 8888);
INSERT INTO `operation_logs` VALUES (1552, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 16:35:41', 8888);
INSERT INTO `operation_logs` VALUES (1553, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 16:35:41', 8888);
INSERT INTO `operation_logs` VALUES (1554, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 16:36:40', 8888);
INSERT INTO `operation_logs` VALUES (1555, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 16:36:41', 8888);
INSERT INTO `operation_logs` VALUES (1556, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 4, '2021-08-09 16:36:52', 8888);
INSERT INTO `operation_logs` VALUES (1557, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 16:36:53', 8888);
INSERT INTO `operation_logs` VALUES (1558, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 16:36:56', 8888);
INSERT INTO `operation_logs` VALUES (1559, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 9, 10, 6, 7, 8, 11], modelIds=[1, 2, 5]}]', '192.168.2.134', 121, '2021-08-09 16:36:58', 8888);
INSERT INTO `operation_logs` VALUES (1560, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 16:36:58', 8888);
INSERT INTO `operation_logs` VALUES (1561, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 16:36:59', 8888);
INSERT INTO `operation_logs` VALUES (1562, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 16:37:02', 8888);
INSERT INTO `operation_logs` VALUES (1563, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 11], modelIds=[1, 2, 5]}]', '192.168.2.134', 43, '2021-08-09 16:37:05', 8888);
INSERT INTO `operation_logs` VALUES (1564, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 16:37:05', 8888);
INSERT INTO `operation_logs` VALUES (1565, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 16:37:06', 8888);
INSERT INTO `operation_logs` VALUES (1566, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 8, '2021-08-09 16:38:13', 8888);
INSERT INTO `operation_logs` VALUES (1567, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 11], modelIds=[1, 2, 5]}]', '192.168.2.134', 150, '2021-08-09 16:38:17', 8888);
INSERT INTO `operation_logs` VALUES (1568, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 4, '2021-08-09 16:38:17', 8888);
INSERT INTO `operation_logs` VALUES (1569, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 16:38:17', 8888);
INSERT INTO `operation_logs` VALUES (1570, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 10, '2021-08-09 16:39:58', 8888);
INSERT INTO `operation_logs` VALUES (1571, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 7, '2021-08-09 16:39:58', 8888);
INSERT INTO `operation_logs` VALUES (1572, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 16:40:10', 8888);
INSERT INTO `operation_logs` VALUES (1573, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 9, 10, 6, 7, 8, 11], modelIds=[1, 2, 5]}]', '192.168.2.134', 86, '2021-08-09 16:40:13', 8888);
INSERT INTO `operation_logs` VALUES (1574, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 16:40:13', 8888);
INSERT INTO `operation_logs` VALUES (1575, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 16:40:14', 8888);
INSERT INTO `operation_logs` VALUES (1576, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 16:40:17', 8888);
INSERT INTO `operation_logs` VALUES (1577, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 11], modelIds=[1, 2, 5]}]', '192.168.2.134', 45, '2021-08-09 16:40:20', 8888);
INSERT INTO `operation_logs` VALUES (1578, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 16:40:20', 8888);
INSERT INTO `operation_logs` VALUES (1579, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 16:40:20', 8888);
INSERT INTO `operation_logs` VALUES (1580, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-09 17:02:25', 8888);
INSERT INTO `operation_logs` VALUES (1581, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 17:02:25', 8888);
INSERT INTO `operation_logs` VALUES (1582, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 17:02:32', 8888);
INSERT INTO `operation_logs` VALUES (1583, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 9, 10, 6, 7, 8, 11], modelIds=[1, 2, 5]}]', '192.168.2.134', 173, '2021-08-09 17:02:35', 8888);
INSERT INTO `operation_logs` VALUES (1584, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 17:02:35', 8888);
INSERT INTO `operation_logs` VALUES (1585, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 17:02:36', 8888);
INSERT INTO `operation_logs` VALUES (1586, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 4, '2021-08-09 17:02:40', 8888);
INSERT INTO `operation_logs` VALUES (1587, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 11], modelIds=[1, 2, 5]}]', '192.168.2.134', 48, '2021-08-09 17:02:43', 8888);
INSERT INTO `operation_logs` VALUES (1588, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 4, '2021-08-09 17:02:43', 8888);
INSERT INTO `operation_logs` VALUES (1589, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-09 17:02:43', 8888);
INSERT INTO `operation_logs` VALUES (1590, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-09 17:10:19', 8888);
INSERT INTO `operation_logs` VALUES (1591, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-09 17:10:20', 8888);
INSERT INTO `operation_logs` VALUES (1592, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 4, '2021-08-09 17:10:25', 8888);
INSERT INTO `operation_logs` VALUES (1593, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 9, 10, 6, 7, 8, 11], modelIds=[1, 2, 5]}]', '192.168.2.134', 114, '2021-08-09 17:10:28', 8888);
INSERT INTO `operation_logs` VALUES (1594, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 4, '2021-08-09 17:10:28', 8888);
INSERT INTO `operation_logs` VALUES (1595, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 17:10:28', 8888);
INSERT INTO `operation_logs` VALUES (1596, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 10, '2021-08-09 17:17:23', 8888);
INSERT INTO `operation_logs` VALUES (1597, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 17:17:24', 8888);
INSERT INTO `operation_logs` VALUES (1598, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 10, '2021-08-09 17:19:55', 8888);
INSERT INTO `operation_logs` VALUES (1599, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 17:19:56', 8888);
INSERT INTO `operation_logs` VALUES (1600, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 17:19:59', 8888);
INSERT INTO `operation_logs` VALUES (1601, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 11], modelIds=[1, 2, 5]}]', '192.168.2.134', 102, '2021-08-09 17:20:02', 8888);
INSERT INTO `operation_logs` VALUES (1602, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 4, '2021-08-09 17:20:02', 8888);
INSERT INTO `operation_logs` VALUES (1603, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 17:20:03', 8888);
INSERT INTO `operation_logs` VALUES (1604, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 11, '2021-08-09 17:21:37', 8888);
INSERT INTO `operation_logs` VALUES (1605, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 17:21:39', 8888);
INSERT INTO `operation_logs` VALUES (1606, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 9, 10, 6, 7, 8, 11], modelIds=[1, 2, 5]}]', '192.168.2.134', 125, '2021-08-09 17:21:43', 8888);
INSERT INTO `operation_logs` VALUES (1607, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 4, '2021-08-09 17:21:43', 8888);
INSERT INTO `operation_logs` VALUES (1608, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 17:21:44', 8888);
INSERT INTO `operation_logs` VALUES (1609, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 17:22:08', 8888);
INSERT INTO `operation_logs` VALUES (1610, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 11], modelIds=[1, 2, 5]}]', '192.168.2.134', 53, '2021-08-09 17:22:11', 8888);
INSERT INTO `operation_logs` VALUES (1611, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 17:22:11', 8888);
INSERT INTO `operation_logs` VALUES (1612, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 17:22:11', 8888);
INSERT INTO `operation_logs` VALUES (1613, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 17:23:04', 8888);
INSERT INTO `operation_logs` VALUES (1614, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 17:23:12', 8888);
INSERT INTO `operation_logs` VALUES (1615, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 11], modelIds=[1, 2, 5]}]', '192.168.2.134', 100, '2021-08-09 17:23:15', 8888);
INSERT INTO `operation_logs` VALUES (1616, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 17:23:15', 8888);
INSERT INTO `operation_logs` VALUES (1617, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 17:23:16', 8888);
INSERT INTO `operation_logs` VALUES (1618, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-09 17:24:29', 8888);
INSERT INTO `operation_logs` VALUES (1619, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 7, '2021-08-09 17:24:30', 8888);
INSERT INTO `operation_logs` VALUES (1620, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 17:24:32', 8888);
INSERT INTO `operation_logs` VALUES (1621, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 9, 10, 6, 7, 8, 11], modelIds=[1, 2, 5]}]', '192.168.2.134', 108, '2021-08-09 17:24:35', 8888);
INSERT INTO `operation_logs` VALUES (1622, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 19, '2021-08-09 17:24:35', 8888);
INSERT INTO `operation_logs` VALUES (1623, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 16, '2021-08-09 17:24:35', 8888);
INSERT INTO `operation_logs` VALUES (1624, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-09 17:26:16', 8888);
INSERT INTO `operation_logs` VALUES (1625, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 17:26:17', 8888);
INSERT INTO `operation_logs` VALUES (1626, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-09 17:28:27', 8888);
INSERT INTO `operation_logs` VALUES (1627, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 11], modelIds=[1, 2, 5]}]', '192.168.2.134', 110, '2021-08-09 17:28:31', 8888);
INSERT INTO `operation_logs` VALUES (1628, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 15, '2021-08-09 17:28:31', 8888);
INSERT INTO `operation_logs` VALUES (1629, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 17:28:31', 8888);
INSERT INTO `operation_logs` VALUES (1630, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-09 17:29:18', 8888);
INSERT INTO `operation_logs` VALUES (1631, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 17:29:19', 8888);
INSERT INTO `operation_logs` VALUES (1632, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=5}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 10, '2021-08-09 17:30:58', 8888);
INSERT INTO `operation_logs` VALUES (1633, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 8, '2021-08-09 17:32:21', 8888);
INSERT INTO `operation_logs` VALUES (1634, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 17:32:22', 8888);
INSERT INTO `operation_logs` VALUES (1635, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 17:32:50', 8888);
INSERT INTO `operation_logs` VALUES (1636, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 9, 10, 6, 7, 8, 11], modelIds=[1, 2, 5]}]', '192.168.2.134', 102, '2021-08-09 17:32:53', 8888);
INSERT INTO `operation_logs` VALUES (1637, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-09 17:32:53', 8888);
INSERT INTO `operation_logs` VALUES (1638, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 17:32:54', 8888);
INSERT INTO `operation_logs` VALUES (1639, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 17:33:24', 8888);
INSERT INTO `operation_logs` VALUES (1640, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 11], modelIds=[1, 2, 5]}]', '192.168.2.134', 133, '2021-08-09 17:33:27', 8888);
INSERT INTO `operation_logs` VALUES (1641, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 17:33:27', 8888);
INSERT INTO `operation_logs` VALUES (1642, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 17:33:28', 8888);
INSERT INTO `operation_logs` VALUES (1643, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-09 17:38:07', 8888);
INSERT INTO `operation_logs` VALUES (1644, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 17:38:08', 8888);
INSERT INTO `operation_logs` VALUES (1645, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 17:38:10', 8888);
INSERT INTO `operation_logs` VALUES (1646, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 6, 7, 8], modelIds=[1, 2, 5]}]', '192.168.2.134', 105, '2021-08-09 17:38:19', 8888);
INSERT INTO `operation_logs` VALUES (1647, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 11, '2021-08-09 17:38:19', 8888);
INSERT INTO `operation_logs` VALUES (1648, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 17:38:19', 8888);
INSERT INTO `operation_logs` VALUES (1649, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 4, '2021-08-09 17:38:25', 8888);
INSERT INTO `operation_logs` VALUES (1650, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 3, 4, 5, 6, 7, 8], modelIds=[1, 2, 5]}]', '192.168.2.134', 81, '2021-08-09 17:38:30', 8888);
INSERT INTO `operation_logs` VALUES (1651, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 4, '2021-08-09 17:38:30', 8888);
INSERT INTO `operation_logs` VALUES (1652, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 17:38:30', 8888);
INSERT INTO `operation_logs` VALUES (1653, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-09 17:43:20', 8888);
INSERT INTO `operation_logs` VALUES (1654, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 17:43:21', 8888);
INSERT INTO `operation_logs` VALUES (1655, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 17:43:23', 8888);
INSERT INTO `operation_logs` VALUES (1656, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 6, 7, 8], modelIds=[1, 2, 5]}]', '192.168.2.134', 88, '2021-08-09 17:43:27', 8888);
INSERT INTO `operation_logs` VALUES (1657, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 17:43:27', 8888);
INSERT INTO `operation_logs` VALUES (1658, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 17:43:27', 8888);
INSERT INTO `operation_logs` VALUES (1659, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-09 17:46:27', 8888);
INSERT INTO `operation_logs` VALUES (1660, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 17:46:28', 8888);
INSERT INTO `operation_logs` VALUES (1661, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 17:46:45', 8888);
INSERT INTO `operation_logs` VALUES (1662, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 17:46:45', 8888);
INSERT INTO `operation_logs` VALUES (1663, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 17:47:25', 8888);
INSERT INTO `operation_logs` VALUES (1664, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 3, 4, 5, 6, 7, 8], modelIds=[1, 2, 5]}]', '192.168.2.134', 111, '2021-08-09 17:47:30', 8888);
INSERT INTO `operation_logs` VALUES (1665, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 17:47:30', 8888);
INSERT INTO `operation_logs` VALUES (1666, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 17:47:30', 8888);
INSERT INTO `operation_logs` VALUES (1667, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 17:48:23', 8888);
INSERT INTO `operation_logs` VALUES (1668, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 17:48:27', 8888);
INSERT INTO `operation_logs` VALUES (1669, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 4, '2021-08-09 17:48:39', 8888);
INSERT INTO `operation_logs` VALUES (1670, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 17:48:39', 8888);
INSERT INTO `operation_logs` VALUES (1671, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 17:49:25', 8888);
INSERT INTO `operation_logs` VALUES (1672, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 6, 7, 8], modelIds=[1, 2, 5]}]', '192.168.2.134', 81, '2021-08-09 17:49:29', 8888);
INSERT INTO `operation_logs` VALUES (1673, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 17:49:29', 8888);
INSERT INTO `operation_logs` VALUES (1674, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 17:49:29', 8888);
INSERT INTO `operation_logs` VALUES (1675, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 17:50:15', 8888);
INSERT INTO `operation_logs` VALUES (1676, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 3, 4, 5, 6, 7, 8], modelIds=[1, 2, 5]}]', '192.168.2.134', 91, '2021-08-09 17:50:18', 8888);
INSERT INTO `operation_logs` VALUES (1677, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 4, '2021-08-09 17:50:18', 8888);
INSERT INTO `operation_logs` VALUES (1678, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 16, '2021-08-09 17:50:19', 8888);
INSERT INTO `operation_logs` VALUES (1679, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 10, '2021-08-09 17:53:16', 8888);
INSERT INTO `operation_logs` VALUES (1680, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 17:53:17', 8888);
INSERT INTO `operation_logs` VALUES (1681, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 17:53:18', 8888);
INSERT INTO `operation_logs` VALUES (1682, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 17:53:19', 8888);
INSERT INTO `operation_logs` VALUES (1683, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 4, '2021-08-09 17:53:20', 8888);
INSERT INTO `operation_logs` VALUES (1684, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 17:53:21', 8888);
INSERT INTO `operation_logs` VALUES (1685, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 17:53:22', 8888);
INSERT INTO `operation_logs` VALUES (1686, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 17:53:23', 8888);
INSERT INTO `operation_logs` VALUES (1687, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 17:53:23', 8888);
INSERT INTO `operation_logs` VALUES (1688, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 17:53:24', 8888);
INSERT INTO `operation_logs` VALUES (1689, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 17:53:25', 8888);
INSERT INTO `operation_logs` VALUES (1690, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 4, '2021-08-09 17:53:26', 8888);
INSERT INTO `operation_logs` VALUES (1691, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 17:53:26', 8888);
INSERT INTO `operation_logs` VALUES (1692, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 17:53:27', 8888);
INSERT INTO `operation_logs` VALUES (1693, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 17:53:28', 8888);
INSERT INTO `operation_logs` VALUES (1694, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 15, '2021-08-09 17:53:29', 8888);
INSERT INTO `operation_logs` VALUES (1695, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 17:53:30', 8888);
INSERT INTO `operation_logs` VALUES (1696, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 17:53:31', 8888);
INSERT INTO `operation_logs` VALUES (1697, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 17:53:31', 8888);
INSERT INTO `operation_logs` VALUES (1698, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-09 17:54:43', 8888);
INSERT INTO `operation_logs` VALUES (1699, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 3, 4, 5, 6, 7, 8], modelIds=[1, 2, 5]}]', '192.168.2.134', 82, '2021-08-09 17:54:45', 8888);
INSERT INTO `operation_logs` VALUES (1700, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-09 17:54:45', 8888);
INSERT INTO `operation_logs` VALUES (1701, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 17:54:46', 8888);
INSERT INTO `operation_logs` VALUES (1702, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-09 17:54:47', 8888);
INSERT INTO `operation_logs` VALUES (1703, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 17:54:48', 8888);
INSERT INTO `operation_logs` VALUES (1704, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-09 17:54:49', 8888);
INSERT INTO `operation_logs` VALUES (1705, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 17:54:50', 8888);
INSERT INTO `operation_logs` VALUES (1706, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 17:54:51', 8888);
INSERT INTO `operation_logs` VALUES (1707, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 17:54:52', 8888);
INSERT INTO `operation_logs` VALUES (1708, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 17:55:08', 8888);
INSERT INTO `operation_logs` VALUES (1709, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 3, 4, 5, 6, 7, 8], modelIds=[1, 2, 5]}]', '192.168.2.134', 88, '2021-08-09 17:55:11', 8888);
INSERT INTO `operation_logs` VALUES (1710, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 17:55:11', 8888);
INSERT INTO `operation_logs` VALUES (1711, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 17:55:12', 8888);
INSERT INTO `operation_logs` VALUES (1712, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 17:55:15', 8888);
INSERT INTO `operation_logs` VALUES (1713, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 6, 7, 8], modelIds=[1, 2, 5]}]', '192.168.2.134', 43, '2021-08-09 17:55:17', 8888);
INSERT INTO `operation_logs` VALUES (1714, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 17:55:17', 8888);
INSERT INTO `operation_logs` VALUES (1715, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 17:55:18', 8888);
INSERT INTO `operation_logs` VALUES (1716, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 17:55:19', 8888);
INSERT INTO `operation_logs` VALUES (1717, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 3, 4, 5, 6, 7, 8], modelIds=[1, 2, 5]}]', '192.168.2.134', 100, '2021-08-09 17:55:21', 8888);
INSERT INTO `operation_logs` VALUES (1718, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 17:55:21', 8888);
INSERT INTO `operation_logs` VALUES (1719, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 17:55:22', 8888);
INSERT INTO `operation_logs` VALUES (1720, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 8, '2021-08-09 17:56:25', 8888);
INSERT INTO `operation_logs` VALUES (1721, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 3, 4, 5, 6, 7, 8], modelIds=[1, 2, 5]}]', '192.168.2.134', 82, '2021-08-09 17:56:29', 8888);
INSERT INTO `operation_logs` VALUES (1722, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 17:56:29', 8888);
INSERT INTO `operation_logs` VALUES (1723, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 17:56:29', 8888);
INSERT INTO `operation_logs` VALUES (1724, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 17:56:36', 8888);
INSERT INTO `operation_logs` VALUES (1725, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 17:56:40', 8888);
INSERT INTO `operation_logs` VALUES (1726, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 17:56:41', 8888);
INSERT INTO `operation_logs` VALUES (1727, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 6, 7, 8], modelIds=[1, 2, 5]}]', '192.168.2.134', 104, '2021-08-09 17:56:47', 8888);
INSERT INTO `operation_logs` VALUES (1728, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-09 17:56:47', 8888);
INSERT INTO `operation_logs` VALUES (1729, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 4, '2021-08-09 17:56:48', 8888);
INSERT INTO `operation_logs` VALUES (1730, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 17:56:49', 8888);
INSERT INTO `operation_logs` VALUES (1731, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 17:57:03', 8888);
INSERT INTO `operation_logs` VALUES (1732, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], modelIds=[1, 2, 5]}]', '192.168.2.134', 83, '2021-08-09 17:57:17', 8888);
INSERT INTO `operation_logs` VALUES (1733, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 17:57:17', 8888);
INSERT INTO `operation_logs` VALUES (1734, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 17:57:18', 8888);
INSERT INTO `operation_logs` VALUES (1735, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 17:58:06', 8888);
INSERT INTO `operation_logs` VALUES (1736, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 17:58:07', 8888);
INSERT INTO `operation_logs` VALUES (1737, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-09 17:59:56', 8888);
INSERT INTO `operation_logs` VALUES (1738, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 17:59:57', 8888);
INSERT INTO `operation_logs` VALUES (1739, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 18:00:02', 8888);
INSERT INTO `operation_logs` VALUES (1740, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], modelIds=[1, 2, 5]}]', '192.168.2.134', 125, '2021-08-09 18:00:04', 8888);
INSERT INTO `operation_logs` VALUES (1741, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 4, '2021-08-09 18:00:04', 8888);
INSERT INTO `operation_logs` VALUES (1742, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 18:00:05', 8888);
INSERT INTO `operation_logs` VALUES (1743, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-09 18:01:38', 8888);
INSERT INTO `operation_logs` VALUES (1744, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], modelIds=[1, 2, 5]}]', '192.168.2.134', 135, '2021-08-09 18:01:40', 8888);
INSERT INTO `operation_logs` VALUES (1745, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 18:01:41', 8888);
INSERT INTO `operation_logs` VALUES (1746, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 18:01:41', 8888);
INSERT INTO `operation_logs` VALUES (1747, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 18:02:33', 8888);
INSERT INTO `operation_logs` VALUES (1748, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 18:02:33', 8888);
INSERT INTO `operation_logs` VALUES (1749, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-09 18:02:58', 8888);
INSERT INTO `operation_logs` VALUES (1750, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 3, 4, 5, 6, 7, 8], modelIds=[1, 2, 5]}]', '192.168.2.134', 72, '2021-08-09 18:03:02', 8888);
INSERT INTO `operation_logs` VALUES (1751, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 18:03:02', 8888);
INSERT INTO `operation_logs` VALUES (1752, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 18:03:02', 8888);
INSERT INTO `operation_logs` VALUES (1753, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-09 18:05:25', 8888);
INSERT INTO `operation_logs` VALUES (1754, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 18:05:32', 8888);
INSERT INTO `operation_logs` VALUES (1755, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 18:05:36', 8888);
INSERT INTO `operation_logs` VALUES (1756, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-09 18:06:39', 8888);
INSERT INTO `operation_logs` VALUES (1757, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 18:07:05', 8888);
INSERT INTO `operation_logs` VALUES (1758, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-09 18:09:31', 8888);
INSERT INTO `operation_logs` VALUES (1759, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-09 18:10:39', 8888);
INSERT INTO `operation_logs` VALUES (1760, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 18:10:43', 8888);
INSERT INTO `operation_logs` VALUES (1761, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 4, '2021-08-09 18:11:07', 8888);
INSERT INTO `operation_logs` VALUES (1762, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 18:11:08', 8888);
INSERT INTO `operation_logs` VALUES (1763, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-09 18:12:34', 8888);
INSERT INTO `operation_logs` VALUES (1764, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 18:12:35', 8888);
INSERT INTO `operation_logs` VALUES (1765, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 18:12:39', 8888);
INSERT INTO `operation_logs` VALUES (1766, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 6, 7, 8], modelIds=[1, 2, 5]}]', '192.168.2.134', 100, '2021-08-09 18:12:42', 8888);
INSERT INTO `operation_logs` VALUES (1767, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 18:12:42', 8888);
INSERT INTO `operation_logs` VALUES (1768, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 18:12:42', 8888);
INSERT INTO `operation_logs` VALUES (1769, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 4, '2021-08-09 18:12:44', 8888);
INSERT INTO `operation_logs` VALUES (1770, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 3, 4, 5, 6, 7, 8], modelIds=[1, 2, 5]}]', '192.168.2.134', 37, '2021-08-09 18:12:46', 8888);
INSERT INTO `operation_logs` VALUES (1771, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 18:12:46', 8888);
INSERT INTO `operation_logs` VALUES (1772, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 18:12:47', 8888);
INSERT INTO `operation_logs` VALUES (1773, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 4, '2021-08-09 18:12:55', 8888);
INSERT INTO `operation_logs` VALUES (1774, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 18:12:56', 8888);
INSERT INTO `operation_logs` VALUES (1775, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 18:13:11', 8888);
INSERT INTO `operation_logs` VALUES (1776, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 18:13:12', 8888);
INSERT INTO `operation_logs` VALUES (1777, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 18:13:21', 8888);
INSERT INTO `operation_logs` VALUES (1778, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 6, 7, 8], modelIds=[1, 2, 5]}]', '192.168.2.134', 131, '2021-08-09 18:13:24', 8888);
INSERT INTO `operation_logs` VALUES (1779, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 18:13:24', 8888);
INSERT INTO `operation_logs` VALUES (1780, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 18:13:25', 8888);
INSERT INTO `operation_logs` VALUES (1781, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-09 18:14:36', 8888);
INSERT INTO `operation_logs` VALUES (1782, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 18:14:37', 8888);
INSERT INTO `operation_logs` VALUES (1783, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 18:14:40', 8888);
INSERT INTO `operation_logs` VALUES (1784, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 3, 4, 5, 6, 7, 8], modelIds=[1, 2, 5]}]', '192.168.2.134', 111, '2021-08-09 18:14:45', 8888);
INSERT INTO `operation_logs` VALUES (1785, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 18:14:45', 8888);
INSERT INTO `operation_logs` VALUES (1786, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 18:14:46', 8888);
INSERT INTO `operation_logs` VALUES (1787, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 18:14:48', 8888);
INSERT INTO `operation_logs` VALUES (1788, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 18:14:48', 8888);
INSERT INTO `operation_logs` VALUES (1789, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-09 18:15:07', 8888);
INSERT INTO `operation_logs` VALUES (1790, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 6, 7, 8], modelIds=[1, 2, 5]}]', '192.168.2.134', 41, '2021-08-09 18:15:09', 8888);
INSERT INTO `operation_logs` VALUES (1791, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 18:15:09', 8888);
INSERT INTO `operation_logs` VALUES (1792, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 18:15:10', 8888);
INSERT INTO `operation_logs` VALUES (1793, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 10, '2021-08-09 18:20:34', 8888);
INSERT INTO `operation_logs` VALUES (1794, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 10, '2021-08-09 18:22:21', 8888);
INSERT INTO `operation_logs` VALUES (1795, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 18:22:21', 8888);
INSERT INTO `operation_logs` VALUES (1796, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 18:22:43', 8888);
INSERT INTO `operation_logs` VALUES (1797, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 18:22:44', 8888);
INSERT INTO `operation_logs` VALUES (1798, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 18:23:05', 8888);
INSERT INTO `operation_logs` VALUES (1799, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 18:23:52', 8888);
INSERT INTO `operation_logs` VALUES (1800, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 18:23:53', 8888);
INSERT INTO `operation_logs` VALUES (1801, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-09 18:28:39', 8888);
INSERT INTO `operation_logs` VALUES (1802, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-09 18:28:39', 8888);
INSERT INTO `operation_logs` VALUES (1803, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 8, '2021-08-09 18:29:54', 8888);
INSERT INTO `operation_logs` VALUES (1804, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 18:30:45', 8888);
INSERT INTO `operation_logs` VALUES (1805, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 10, '2021-08-09 18:32:07', 8888);
INSERT INTO `operation_logs` VALUES (1806, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 8, '2021-08-09 18:33:15', 8888);
INSERT INTO `operation_logs` VALUES (1807, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-09 18:34:13', 8888);
INSERT INTO `operation_logs` VALUES (1808, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-09 18:36:11', 8888);
INSERT INTO `operation_logs` VALUES (1809, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 4, '2021-08-09 18:36:45', 8888);
INSERT INTO `operation_logs` VALUES (1810, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-09 18:36:45', 8888);
INSERT INTO `operation_logs` VALUES (1811, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 69, '2021-08-10 09:10:41', 8888);
INSERT INTO `operation_logs` VALUES (1812, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 8, '2021-08-10 09:10:42', 8888);
INSERT INTO `operation_logs` VALUES (1813, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 11, '2021-08-10 09:11:43', 8888);
INSERT INTO `operation_logs` VALUES (1814, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 3, 4, 5, 6, 7, 8], modelIds=[1, 2, 5]}]', '192.168.2.134', 103, '2021-08-10 09:11:46', 8888);
INSERT INTO `operation_logs` VALUES (1815, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 4, '2021-08-10 09:11:46', 8888);
INSERT INTO `operation_logs` VALUES (1816, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-10 09:11:46', 8888);
INSERT INTO `operation_logs` VALUES (1817, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 5, '2021-08-10 09:12:24', 8888);
INSERT INTO `operation_logs` VALUES (1818, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], modelIds=[1, 2, 5]}]', '192.168.2.134', 99, '2021-08-10 09:12:28', 8888);
INSERT INTO `operation_logs` VALUES (1819, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 4, '2021-08-10 09:12:28', 8888);
INSERT INTO `operation_logs` VALUES (1820, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-10 09:12:28', 8888);
INSERT INTO `operation_logs` VALUES (1821, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 78, '2021-08-10 10:04:13', 8888);
INSERT INTO `operation_logs` VALUES (1822, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 8, '2021-08-10 10:04:14', 8888);
INSERT INTO `operation_logs` VALUES (1823, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=5}, {pageNum=1}]', '0:0:0:0:0:0:0:1', 62, '2021-08-10 11:42:14', 8888);
INSERT INTO `operation_logs` VALUES (1824, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 46, '2021-08-10 13:40:22', 8888);
INSERT INTO `operation_logs` VALUES (1825, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 8, '2021-08-10 13:40:23', 8888);
INSERT INTO `operation_logs` VALUES (1826, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 122, '2021-08-10 15:41:31', 8888);
INSERT INTO `operation_logs` VALUES (1827, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 82, '2021-08-10 15:42:07', 8888);
INSERT INTO `operation_logs` VALUES (1828, '根据UserId修改用户信息', 'update', '/system/users/update/11', 'Users(id=11, username=libai, password=null, employeeNo=0001, phone=17666143833, department=研发, name=操作人1, status=1, lockingTime=null, failLoginCount=0, createdOn=Mon Aug 02 17:50:54 CST 2021, changedOn=2021-08-10 15:44:14, createdBy=null, changedBy=null)', '192.168.2.134', 74, '2021-08-10 15:44:14', 8888);
INSERT INTO `operation_logs` VALUES (1829, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-10 15:44:14', 8888);
INSERT INTO `operation_logs` VALUES (1830, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 22, '2021-08-10 15:44:43', 8888);
INSERT INTO `operation_logs` VALUES (1831, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-10 15:44:43', 8888);
INSERT INTO `operation_logs` VALUES (1832, '根据UserId修改用户信息', 'update', '/system/users/update/12', 'Users(id=12, username=dufu, password=ZZjSbTZ4B53jotqqdAgB9A, employeeNo=0002, phone=17685421233, department=yanfa, name=操作人666, status=0, lockingTime=null, failLoginCount=0, createdOn=Wed Aug 04 19:05:56 CST 2021, changedOn=2021-08-10 15:45:43, createdBy=12, changedBy=12)', '192.168.2.134', 49, '2021-08-10 15:45:43', 8888);
INSERT INTO `operation_logs` VALUES (1833, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-10 15:45:43', 8888);
INSERT INTO `operation_logs` VALUES (1834, '根据UserId修改用户信息', 'update', '/system/users/update/12', 'Users(id=12, username=dufu, password=YJ4AariB9NLjotqqdAgB9A, employeeNo=007, phone=17685421233, department=yanfa, name=操作人66, status=1, lockingTime=null, failLoginCount=0, createdOn=Wed Aug 04 19:05:56 CST 2021, changedOn=2021-08-10 15:46:06, createdBy=12, changedBy=12)', '192.168.2.134', 47, '2021-08-10 15:46:06', 8888);
INSERT INTO `operation_logs` VALUES (1835, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-10 15:46:06', 8888);
INSERT INTO `operation_logs` VALUES (1836, '用户注册', 'register', '/system/users/register', 'UsersParam{username=\'wang\', password=\'1111qqqq\', employeeNo=\'008\', name=\'han\', department=\'yanfa\', phone=\'17622124122\', status=1}', '192.168.2.134', 205, '2021-08-10 15:48:24', 8888);
INSERT INTO `operation_logs` VALUES (1837, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 36, '2021-08-10 15:48:24', 8888);
INSERT INTO `operation_logs` VALUES (1838, '用户注册', 'register', '/system/users/register', 'UsersParam{username=\'wang\', password=\'11111111\', employeeNo=\'009\', name=\'han1\', department=\'fff\', phone=\'17622142322\', status=1}', '192.168.2.134', 6, '2021-08-10 15:48:56', 8888);
INSERT INTO `operation_logs` VALUES (1839, '用户注册', 'register', '/system/users/register', 'UsersParam{username=\'wang\', password=\'11111111\', employeeNo=\'009\', name=\'han1\', department=\'fff\', phone=\'17622142322\', status=1}', '192.168.2.134', 5, '2021-08-10 15:49:07', 8888);
INSERT INTO `operation_logs` VALUES (1840, '根据UserId修改用户信息', 'update', '/system/users/update/12', 'Users(id=12, username=dufu, password=ZZjSbTZ4B53jotqqdAgB9A, employeeNo=007, phone=17685421233, department=yanfa, name=操作人66, status=1, lockingTime=null, failLoginCount=0, createdOn=Wed Aug 04 19:05:56 CST 2021, changedOn=2021-08-10 16:01:11, createdBy=12, changedBy=12)', '192.168.2.134', 104939, '2021-08-10 16:01:33', 8888);
INSERT INTO `operation_logs` VALUES (1841, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 30, '2021-08-10 16:01:42', 8888);
INSERT INTO `operation_logs` VALUES (1842, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 35, '2021-08-10 16:01:42', 8888);
INSERT INTO `operation_logs` VALUES (1843, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 8, '2021-08-10 16:01:46', 8888);
INSERT INTO `operation_logs` VALUES (1844, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-10 16:01:47', 8888);
INSERT INTO `operation_logs` VALUES (1845, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 8, '2021-08-10 16:01:54', 8888);
INSERT INTO `operation_logs` VALUES (1846, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-10 16:01:55', 8888);
INSERT INTO `operation_logs` VALUES (1847, '根据UserId修改用户信息', 'update', '/system/users/update/12', 'Users(id=12, username=dufu, password=qSQcLT5Wz4fjotqqdAgB9A, employeeNo=007, phone=17685421233, department=yanfa, name=操作人66, status=1, lockingTime=null, failLoginCount=0, createdOn=Wed Aug 04 19:05:56 CST 2021, changedOn=2021-08-10 16:02:55, createdBy=12, changedBy=12)', '192.168.2.134', 33511, '2021-08-10 16:03:09', 8888);
INSERT INTO `operation_logs` VALUES (1848, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 8, '2021-08-10 16:03:44', 8888);
INSERT INTO `operation_logs` VALUES (1849, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-10 16:03:44', 8888);
INSERT INTO `operation_logs` VALUES (1850, '根据UserId修改用户信息', 'update', '/system/users/update/11', 'Users(id=11, username=libai, password=null, employeeNo=0001, phone=17666143833, department=研发, name=操作人1, status=1, lockingTime=null, failLoginCount=0, createdOn=Mon Aug 02 17:50:54 CST 2021, changedOn=2021-08-10 16:23:35, createdBy=null, changedBy=null)', '192.168.2.134', 4538, '2021-08-10 16:23:35', 8888);
INSERT INTO `operation_logs` VALUES (1851, '根据UserId修改用户信息', 'update', '/system/users/update/11', 'Users(id=11, username=libai, password=null, employeeNo=0001, phone=17666143833, department=研发, name=操作人1, status=1, lockingTime=null, failLoginCount=0, createdOn=Mon Aug 02 17:50:54 CST 2021, changedOn=2021-08-10 16:23:35, createdBy=null, changedBy=null)', '192.168.2.134', 71, '2021-08-10 16:23:35', 8888);
INSERT INTO `operation_logs` VALUES (1852, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-10 16:23:35', 8888);
INSERT INTO `operation_logs` VALUES (1853, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-10 16:23:35', 8888);
INSERT INTO `operation_logs` VALUES (1854, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 7, '2021-08-10 16:23:45', 8888);
INSERT INTO `operation_logs` VALUES (1855, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-10 16:23:46', 8888);
INSERT INTO `operation_logs` VALUES (1856, '根据UserId修改用户信息', 'update', '/system/users/update/13', 'Users(id=13, username=wang, password=null, employeeNo=008, phone=17622124122, department=yanfa, name=han, status=0, lockingTime=null, failLoginCount=0, createdOn=Tue Aug 10 15:48:24 CST 2021, changedOn=2021-08-10 17:09:49, createdBy=null, changedBy=null)', '192.168.2.134', 261, '2021-08-10 17:09:49', 8888);
INSERT INTO `operation_logs` VALUES (1857, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 79, '2021-08-10 17:09:49', 8888);
INSERT INTO `operation_logs` VALUES (1858, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 27, '2021-08-10 17:10:25', 8888);
INSERT INTO `operation_logs` VALUES (1859, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 24, '2021-08-10 17:10:33', 8888);
INSERT INTO `operation_logs` VALUES (1860, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 49, '2021-08-10 17:31:21', 8888);
INSERT INTO `operation_logs` VALUES (1861, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 9, '2021-08-10 17:31:21', 8888);
INSERT INTO `operation_logs` VALUES (1862, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 9, '2021-08-10 17:31:47', 8888);
INSERT INTO `operation_logs` VALUES (1863, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 10, '2021-08-10 17:31:48', 8888);
INSERT INTO `operation_logs` VALUES (1864, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 13, '2021-08-10 17:33:14', 8888);
INSERT INTO `operation_logs` VALUES (1865, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 7, '2021-08-10 17:33:26', 8888);
INSERT INTO `operation_logs` VALUES (1866, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-10 17:33:44', 8888);
INSERT INTO `operation_logs` VALUES (1867, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 8, '2021-08-10 17:36:38', 8888);
INSERT INTO `operation_logs` VALUES (1868, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-10 17:36:57', 8888);
INSERT INTO `operation_logs` VALUES (1869, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-10 17:37:23', 8888);
INSERT INTO `operation_logs` VALUES (1870, '登出', 'logout', '/system/users/logout', '', '192.168.2.134', 0, '2021-08-10 17:39:49', 8888);
INSERT INTO `operation_logs` VALUES (1871, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@7709b716', '192.168.2.134', 419, '2021-08-10 17:39:56', 8888);
INSERT INTO `operation_logs` VALUES (1872, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 7, '2021-08-10 17:39:56', 8888);
INSERT INTO `operation_logs` VALUES (1873, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-10 17:40:42', 8888);
INSERT INTO `operation_logs` VALUES (1874, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 7, '2021-08-10 17:41:10', 8888);
INSERT INTO `operation_logs` VALUES (1875, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-10 17:41:11', 8888);
INSERT INTO `operation_logs` VALUES (1876, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 9, '2021-08-10 17:45:09', 8888);
INSERT INTO `operation_logs` VALUES (1877, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 7, '2021-08-10 17:45:39', 8888);
INSERT INTO `operation_logs` VALUES (1878, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 7, '2021-08-10 17:45:43', 8888);
INSERT INTO `operation_logs` VALUES (1879, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 11, '2021-08-10 17:47:29', 8888);
INSERT INTO `operation_logs` VALUES (1880, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 8, '2021-08-10 17:47:33', 8888);
INSERT INTO `operation_logs` VALUES (1881, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-10 17:47:34', 8888);
INSERT INTO `operation_logs` VALUES (1882, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 7, '2021-08-10 17:48:33', 8888);
INSERT INTO `operation_logs` VALUES (1883, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-10 17:48:34', 8888);
INSERT INTO `operation_logs` VALUES (1884, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 9, '2021-08-10 17:55:01', 8888);
INSERT INTO `operation_logs` VALUES (1885, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-10 17:55:04', 8888);
INSERT INTO `operation_logs` VALUES (1886, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-10 17:55:04', 8888);
INSERT INTO `operation_logs` VALUES (1887, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@1ce9a603', '192.168.2.134', 47, '2021-08-10 17:56:51', 8888);
INSERT INTO `operation_logs` VALUES (1888, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 7, '2021-08-10 17:56:51', 8888);
INSERT INTO `operation_logs` VALUES (1889, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-10 17:56:53', 8888);
INSERT INTO `operation_logs` VALUES (1890, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 12, '2021-08-10 17:58:51', 8888);
INSERT INTO `operation_logs` VALUES (1891, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 7, '2021-08-10 17:59:06', 8888);
INSERT INTO `operation_logs` VALUES (1892, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-10 17:59:10', 8888);
INSERT INTO `operation_logs` VALUES (1893, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 7, '2021-08-10 17:59:30', 8888);
INSERT INTO `operation_logs` VALUES (1894, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-10 18:00:01', 8888);
INSERT INTO `operation_logs` VALUES (1895, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 10, '2021-08-10 18:01:54', 8888);
INSERT INTO `operation_logs` VALUES (1896, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 7, '2021-08-10 18:02:46', 8888);
INSERT INTO `operation_logs` VALUES (1897, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 9, '2021-08-10 18:08:55', 8888);
INSERT INTO `operation_logs` VALUES (1898, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 11, '2021-08-10 18:18:37', 8888);
INSERT INTO `operation_logs` VALUES (1899, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 10, '2021-08-10 18:20:06', 8888);
INSERT INTO `operation_logs` VALUES (1900, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 20, '2021-08-10 18:20:13', 8888);
INSERT INTO `operation_logs` VALUES (1901, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 17, '2021-08-10 18:20:14', 8888);
INSERT INTO `operation_logs` VALUES (1902, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-10 18:20:59', 8888);
INSERT INTO `operation_logs` VALUES (1903, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@152365f8', '192.168.2.134', NULL, '2021-08-10 18:23:51', 8888);
INSERT INTO `operation_logs` VALUES (1904, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@96e1bc5', '192.168.2.134', NULL, '2021-08-10 18:23:56', 8888);
INSERT INTO `operation_logs` VALUES (1905, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@2d3c15b0', '192.168.2.134', 169, '2021-08-10 18:28:25', 8888);
INSERT INTO `operation_logs` VALUES (1906, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 13, '2021-08-10 18:28:25', 8888);
INSERT INTO `operation_logs` VALUES (1907, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 38, '2021-08-10 18:28:28', 8888);
INSERT INTO `operation_logs` VALUES (1908, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 8, '2021-08-10 18:29:47', 8888);
INSERT INTO `operation_logs` VALUES (1909, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 7, '2021-08-10 18:30:13', 8888);
INSERT INTO `operation_logs` VALUES (1910, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-10 18:30:45', 8888);
INSERT INTO `operation_logs` VALUES (1911, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-10 18:30:57', 8888);
INSERT INTO `operation_logs` VALUES (1912, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-10 18:31:22', 8888);
INSERT INTO `operation_logs` VALUES (1913, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-10 18:31:40', 8888);
INSERT INTO `operation_logs` VALUES (1914, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-10 18:32:27', 8888);
INSERT INTO `operation_logs` VALUES (1915, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 295, '2021-08-11 15:37:57', 8888);
INSERT INTO `operation_logs` VALUES (1916, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 37, '2021-08-11 15:37:57', 8888);
INSERT INTO `operation_logs` VALUES (1917, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-11 15:38:23', 8888);
INSERT INTO `operation_logs` VALUES (1918, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 12, '2021-08-11 15:42:40', 8888);
INSERT INTO `operation_logs` VALUES (1919, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-11 15:42:40', 8888);
INSERT INTO `operation_logs` VALUES (1920, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-11 15:43:13', 8888);
INSERT INTO `operation_logs` VALUES (1921, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 19, '2021-08-11 15:44:03', 8888);
INSERT INTO `operation_logs` VALUES (1922, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 7, '2021-08-11 15:44:04', 8888);
INSERT INTO `operation_logs` VALUES (1923, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 7, '2021-08-11 15:44:35', 8888);
INSERT INTO `operation_logs` VALUES (1924, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-11 15:44:36', 8888);
INSERT INTO `operation_logs` VALUES (1925, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 8, '2021-08-11 15:44:43', 8888);
INSERT INTO `operation_logs` VALUES (1926, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-11 15:44:44', 8888);
INSERT INTO `operation_logs` VALUES (1927, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-11 15:45:02', 8888);
INSERT INTO `operation_logs` VALUES (1928, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 3, '2021-08-11 15:45:02', 8888);
INSERT INTO `operation_logs` VALUES (1929, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 10, '2021-08-11 15:48:03', 8888);
INSERT INTO `operation_logs` VALUES (1930, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 7, '2021-08-11 15:48:12', 8888);
INSERT INTO `operation_logs` VALUES (1931, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-11 15:48:12', 8888);
INSERT INTO `operation_logs` VALUES (1932, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 13, '2021-08-11 15:57:09', 8888);
INSERT INTO `operation_logs` VALUES (1933, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-11 15:57:10', 8888);
INSERT INTO `operation_logs` VALUES (1934, '登出', 'logout', '/system/users/logout', '', '192.168.2.134', 0, '2021-08-11 15:57:26', 8888);
INSERT INTO `operation_logs` VALUES (1935, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@1669a65b', '192.168.2.134', 260, '2021-08-11 15:57:32', 8888);
INSERT INTO `operation_logs` VALUES (1936, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-11 15:57:32', 8888);
INSERT INTO `operation_logs` VALUES (1937, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 7, '2021-08-11 16:15:48', 8888);
INSERT INTO `operation_logs` VALUES (1938, '用户注册', 'register', '/system/users/register', 'UsersParam{username=\'王小二\', password=\'11111111\', employeeNo=\'100\', name=\'han\', department=\'研发\', phone=\'17666213255\', status=0}', '192.168.2.134', 45, '2021-08-11 16:16:46', 8888);
INSERT INTO `operation_logs` VALUES (1939, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 4, '2021-08-11 16:16:46', 8888);
INSERT INTO `operation_logs` VALUES (1940, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=2}]', '192.168.2.134', 5, '2021-08-11 16:17:20', 8888);
INSERT INTO `operation_logs` VALUES (1941, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 5, '2021-08-11 16:17:22', 8888);
INSERT INTO `operation_logs` VALUES (1942, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 9, '2021-08-11 16:19:58', 8888);
INSERT INTO `operation_logs` VALUES (1943, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 75, '2021-08-11 16:54:49', 8888);
INSERT INTO `operation_logs` VALUES (1944, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 20, '2021-08-11 16:58:07', 8888);
INSERT INTO `operation_logs` VALUES (1945, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-11 16:58:18', 8888);
INSERT INTO `operation_logs` VALUES (1946, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-11 16:58:25', 8888);
INSERT INTO `operation_logs` VALUES (1947, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 7, '2021-08-11 16:58:40', 8888);
INSERT INTO `operation_logs` VALUES (1948, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-11 16:58:52', 8888);
INSERT INTO `operation_logs` VALUES (1949, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-11 16:59:10', 8888);
INSERT INTO `operation_logs` VALUES (1950, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 17, '2021-08-11 16:59:11', 8888);
INSERT INTO `operation_logs` VALUES (1951, '登出', 'logout', '/system/users/logout', '', '192.168.2.134', 0, '2021-08-11 16:59:14', 8888);
INSERT INTO `operation_logs` VALUES (1952, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@1b0e606', '192.168.2.134', 64, '2021-08-11 17:00:55', 8888);
INSERT INTO `operation_logs` VALUES (1953, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-11 17:00:55', 8888);
INSERT INTO `operation_logs` VALUES (1954, '登出', 'logout', '/system/users/logout', '', '192.168.2.134', 0, '2021-08-11 17:00:59', 8888);
INSERT INTO `operation_logs` VALUES (1955, '登出', 'logout', '/system/users/logout', '', '192.168.2.134', 0, '2021-08-11 17:01:23', 8888);
INSERT INTO `operation_logs` VALUES (1956, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@153ba93f', '192.168.2.134', 42, '2021-08-11 17:01:27', 8888);
INSERT INTO `operation_logs` VALUES (1957, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-11 17:01:27', 8888);
INSERT INTO `operation_logs` VALUES (1958, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 7, '2021-08-11 17:01:30', 8888);
INSERT INTO `operation_logs` VALUES (1959, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 18, '2021-08-11 17:01:32', 8888);
INSERT INTO `operation_logs` VALUES (1960, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 3, 4, 5, 6, 7, 8], modelIds=[1, 2, 5]}]', '192.168.2.134', 120, '2021-08-11 17:01:42', 8888);
INSERT INTO `operation_logs` VALUES (1961, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 4, '2021-08-11 17:01:42', 8888);
INSERT INTO `operation_logs` VALUES (1962, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-11 17:01:43', 8888);
INSERT INTO `operation_logs` VALUES (1963, '登出', 'logout', '/system/users/logout', '', '192.168.2.134', 0, '2021-08-11 17:01:45', 8888);
INSERT INTO `operation_logs` VALUES (1964, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@4019e1', '192.168.2.134', 40, '2021-08-11 17:01:49', 8888);
INSERT INTO `operation_logs` VALUES (1965, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-11 17:01:49', 8888);
INSERT INTO `operation_logs` VALUES (1966, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-11 17:01:51', 8888);
INSERT INTO `operation_logs` VALUES (1967, '查询所有后台权限结构供前端树形展示', 'getAllStructure', '/auth/permissions/getAllStructure', '', '192.168.2.134', 6, '2021-08-11 17:01:53', 8888);
INSERT INTO `operation_logs` VALUES (1968, '给用户分配操作权限及型号权限', 'allocLimits', '/auth/userPermissionRelation/allocLimits', '[{userId=11}, {permissionIds=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], modelIds=[1, 2, 5]}]', '192.168.2.134', 109, '2021-08-11 17:01:57', 8888);
INSERT INTO `operation_logs` VALUES (1969, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-11 17:01:57', 8888);
INSERT INTO `operation_logs` VALUES (1970, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-11 17:01:57', 8888);
INSERT INTO `operation_logs` VALUES (1971, '登出', 'logout', '/system/users/logout', '', '192.168.2.134', 0, '2021-08-11 17:01:59', 8888);
INSERT INTO `operation_logs` VALUES (1972, '登录以后返回token', 'login', '/system/users/login', 'com.sim.wifi.authority.dto.UsersLoginParam@7fac71e6', '192.168.2.134', 40, '2021-08-11 17:02:02', 8888);
INSERT INTO `operation_logs` VALUES (1973, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 5, '2021-08-11 17:02:02', 8888);
INSERT INTO `operation_logs` VALUES (1974, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 10, '2021-08-11 17:07:26', 8888);
INSERT INTO `operation_logs` VALUES (1975, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 6, '2021-08-11 17:07:55', 8888);
INSERT INTO `operation_logs` VALUES (1976, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 10, '2021-08-11 17:10:30', 8888);
INSERT INTO `operation_logs` VALUES (1977, '分页显示所有用户列表', 'pageListUsers', '/system/users/pageListUsers', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 352, '2021-08-12 10:08:47', 8888);
INSERT INTO `operation_logs` VALUES (1978, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 41, '2021-08-12 10:08:49', 8888);
INSERT INTO `operation_logs` VALUES (1979, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 304, '2021-08-12 13:57:14', 8888);
INSERT INTO `operation_logs` VALUES (1980, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 7, '2021-08-12 13:57:14', 8888);
INSERT INTO `operation_logs` VALUES (1981, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 159, '2021-08-12 15:51:37', 8888);
INSERT INTO `operation_logs` VALUES (1982, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 16, '2021-08-12 15:51:37', 8888);
INSERT INTO `operation_logs` VALUES (1983, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 141, '2021-08-12 16:15:02', 8888);
INSERT INTO `operation_logs` VALUES (1984, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-12 16:15:02', 8888);
INSERT INTO `operation_logs` VALUES (1985, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 21, '2021-08-12 16:16:06', 8888);
INSERT INTO `operation_logs` VALUES (1986, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 6, '2021-08-12 16:16:06', 8888);
INSERT INTO `operation_logs` VALUES (1987, '获取当前登录用户的信息', 'getUserInfo', '/system/users/info', '', '192.168.2.134', 11, '2021-08-12 16:43:08', 8888);
INSERT INTO `operation_logs` VALUES (1988, '分页显示所有各用户对应的权限列表', 'pageAllUsersLimits', '/auth/permissions/pageAllUsersLimits', '[{pageSize=10}, {pageNum=1}]', '192.168.2.134', 15, '2021-08-12 16:43:09', 8888);

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
INSERT INTO `permissions` VALUES (10, 9, '设备型号', '', 1, 1, 1, NULL, NULL, NULL, NULL);
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
) ENGINE = InnoDB AUTO_INCREMENT = 232 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与型号对应关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_model_relation
-- ----------------------------
INSERT INTO `user_model_relation` VALUES (20, 12, 5, NULL, NULL, NULL, NULL);
INSERT INTO `user_model_relation` VALUES (21, 12, 2, NULL, NULL, NULL, NULL);
INSERT INTO `user_model_relation` VALUES (229, 11, 1, NULL, NULL, NULL, NULL);
INSERT INTO `user_model_relation` VALUES (230, 11, 2, NULL, NULL, NULL, NULL);
INSERT INTO `user_model_relation` VALUES (231, 11, 5, NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 861 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与权限对应表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_permission_relation
-- ----------------------------
INSERT INTO `user_permission_relation` VALUES (133, 12, 1, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (134, 12, 6, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (135, 12, 9, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (136, 12, 10, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (137, 12, 2, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (138, 12, 3, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (139, 12, 4, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (140, 12, 5, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (141, 12, 7, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (142, 12, 11, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (143, 12, 14, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (845, 11, 1, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (846, 11, 2, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (847, 11, 3, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (848, 11, 4, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (849, 11, 5, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (850, 11, 6, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (851, 11, 7, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (852, 11, 8, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (853, 11, 9, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (854, 11, 10, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (855, 11, 11, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (856, 11, 12, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (857, 11, 13, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (858, 11, 14, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (859, 11, 15, NULL, NULL, NULL, NULL);
INSERT INTO `user_permission_relation` VALUES (860, 11, 16, NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (11, 'libai', 'BV6/sWf9TNVzohxBfyrZeg==', '0001', '17666143833', '研发', '操作人1', 1, 0, NULL, '2021-08-02 17:50:54', '2021-08-10 16:23:35', NULL, NULL);
INSERT INTO `users` VALUES (12, 'dufu', '+0prQdsrn89zohxBfyrZeg==', '007', '17685421233', 'yanfa', '操作人66', 1, 0, NULL, '2021-08-04 19:05:56', '2021-08-10 16:02:55', 12, 12);
INSERT INTO `users` VALUES (13, 'wang', 'BV6/sWf9TNVzohxBfyrZeg==', '008', '17622124122', 'yanfa', 'han', 0, 0, NULL, '2021-08-10 15:48:24', '2021-08-10 17:09:49', NULL, NULL);
INSERT INTO `users` VALUES (14, '王小二', '+0prQdsrn89zohxBfyrZeg==', '100', '17666213255', '研发', 'han', 0, 0, NULL, '2021-08-11 16:16:46', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;


------------------------------------------------------------------device表，便于测试
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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备型号表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备类型和型号关系表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of device_types
-- ----------------------------
INSERT INTO `device_types` VALUES (1, '路由器', NULL, NULL, NULL, NULL);
INSERT INTO `device_types` VALUES (2, '摄像头', NULL, NULL, NULL, NULL);








