/*
 Navicat Premium Data Transfer

 Source Server         : 本地mysql
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:3306
 Source Schema         : wifi_upgrade

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 15/07/2021 20:03:06
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
-- Table structure for device_models
-- ----------------------------
DROP TABLE IF EXISTS `device_models`;
CREATE TABLE `device_models`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键ID',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备型号名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备型号表' ROW_FORMAT = DYNAMIC;

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
-- Table structure for login_logs
-- ----------------------------
DROP TABLE IF EXISTS `login_logs`;
CREATE TABLE `login_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键id',
  `use_id` int(11) NULL DEFAULT NULL COMMENT '关联用户id',
  `status` int(1) NULL DEFAULT NULL COMMENT '登录的状态(0:登录失败；1:登录成功)',
  `login_time` datetime NULL DEFAULT NULL COMMENT '登录的时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户登录日志表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 295 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键ID',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '关联父级权限id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '前端资源路径',
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与型号对应关系表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与权限对应表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
