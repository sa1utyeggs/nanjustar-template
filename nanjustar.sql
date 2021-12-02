/*
 Navicat Premium Data Transfer

 Source Server         : NanJuStar
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : www.database.nanjustar.top:3306
 Source Schema         : nanjustar

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 19/11/2021 23:23:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for njs_consumer
-- ----------------------------
DROP TABLE IF EXISTS `njs_consumer`;
CREATE TABLE `njs_consumer` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号（第三方token）',
  `password` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户密码',
  `nickname` varchar(16) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户头像',
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户邮箱',
  `phonenum` varchar(11) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户电话',
  `gender` tinyint(1) DEFAULT '-1' COMMENT '用户性别',
  `login_type` tinyint(1) DEFAULT NULL COMMENT '登陆类型（1 邮箱 2账号密码 3QQ）',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_ip` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '登陆ip',
  `login_address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '登陆地区',
  `is_disable` tinyint(1) DEFAULT '0' COMMENT '账号状态（0正常 1禁用）',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识（0正常 1删除）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改者',
  `gmt_update` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of njs_consumer
-- ----------------------------
BEGIN;
INSERT INTO `njs_consumer` VALUES (1, 'Nanjustar', '$2a$10$AJQdBnx6.M9lPNIyCEUj2.Mb2Atc6X9SUkBD5HE6BjW9T15CCDcLG', '楠橘星', 'https://nanjustar-blog.oss-cn-beijing.aliyuncs.com/article/2021/9/28/a15b9639-2a5c-4b68-a64e-8b61fdfb223c.png', 'nanjustar@qq.com', '12345678980', -1, 1, '2021-11-15 21:04:50', '1.1.1.1', '河南南阳', 0, 0, '楠橘星', '2021-11-16 11:40:52', '楠橘星', '2021-11-15 21:04:50', '无');
INSERT INTO `njs_consumer` VALUES (2, 'admin', '$2a$10$AJQdBnx6.M9lPNIyCEUj2.Mb2Atc6X9SUkBD5HE6BjW9T15CCDcLG', '管理员', 'https://nanjustar-blog.oss-cn-beijing.aliyuncs.com/consumer/S%255%28%5BEY1NYIE8%29Z15H8T%7ETK.png', 'admin@qq.com', '12345678910', -1, 0, '2021-11-15 21:04:50', '1.1.1.1', '河南南阳', 0, 0, '楠橘星', '2021-11-15 21:04:50', '楠橘星', '2021-11-15 21:04:50', '无');
INSERT INTO `njs_consumer` VALUES (3, 'user', '$2a$10$AJQdBnx6.M9lPNIyCEUj2.Mb2Atc6X9SUkBD5HE6BjW9T15CCDcLG', '用户', 'https://nanjustar-blog.oss-cn-beijing.aliyuncs.com/consumer/S%255%28%5BEY1NYIE8%29Z15H8T%7ETK.png', 'user@qq.com', '12345678900', -1, 2, '2021-11-15 21:04:50', '1.1.1.1', '河南南阳', 0, 0, '楠橘星', '2021-11-15 21:04:50', '楠橘星', '2021-11-15 21:04:50', '无');
COMMIT;

-- ----------------------------
-- Table structure for njs_consumer_role
-- ----------------------------
DROP TABLE IF EXISTS `njs_consumer_role`;
CREATE TABLE `njs_consumer_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关联表主键',
  `consumer_id` int(11) NOT NULL COMMENT '用户主键',
  `role_id` int(11) NOT NULL COMMENT '角色主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of njs_consumer_role
-- ----------------------------
BEGIN;
INSERT INTO `njs_consumer_role` VALUES (1, 1, 1);
INSERT INTO `njs_consumer_role` VALUES (2, 1, 2);
INSERT INTO `njs_consumer_role` VALUES (3, 1, 3);
INSERT INTO `njs_consumer_role` VALUES (4, 2, 2);
INSERT INTO `njs_consumer_role` VALUES (5, 2, 3);
INSERT INTO `njs_consumer_role` VALUES (6, 3, 3);
COMMIT;

-- ----------------------------
-- Table structure for njs_menu
-- ----------------------------
DROP TABLE IF EXISTS `njs_menu`;
CREATE TABLE `njs_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单主键',
  `menu_name` varchar(16) COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `path` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由地址',
  `component` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件名称',
  `icon` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单图标',
  `order_num` tinyint(3) DEFAULT '99' COMMENT '菜单排序',
  `parent_id` int(11) DEFAULT '-1' COMMENT '父级菜单id',
  `is_hidden` tinyint(1) DEFAULT '0' COMMENT '菜单显示状态（1正常 0隐藏）',
  `is_disable` tinyint(1) DEFAULT '0' COMMENT '菜单禁用状态（0正常 1禁用）',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识（0 正常。1 删除）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建日志',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改者',
  `gmt_update` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of njs_menu
-- ----------------------------
BEGIN;
INSERT INTO `njs_menu` VALUES (1, '首页', '/welcome', '/welcome/Welcome.vue', 'el-icon-s-home', 0, -1, 0, 0, 0, '楠橘星', '2021-11-13 20:46:44', '楠橘星', '2021-11-13 20:46:44', '无');
INSERT INTO `njs_menu` VALUES (2, '权限管理', '/perm-submenu', 'Layout', 'el-icon-set-up', 1, -1, 0, 0, 0, '楠橘星', '2021-11-13 20:46:44', '楠橘星', '2021-11-13 20:46:44', '无');
INSERT INTO `njs_menu` VALUES (3, '系统管理', '/system-submenu', 'Layout', 'el-icon-s-tools', 2, -1, 0, 0, 0, '楠橘星', '2021-11-13 20:46:44', '楠橘星', '2021-11-13 20:46:44', '无');
INSERT INTO `njs_menu` VALUES (4, '日志管理', '/log-sunmenu', 'Layout', 'el-icon-document-copy', 3, -1, 0, 0, 0, '楠橘星', '2021-11-13 20:46:44', '楠橘星', '2021-11-13 20:46:44', '无');
INSERT INTO `njs_menu` VALUES (5, '角色管理', '/role', '/perm/role/Role.vue', 'el-icon-coordinate', 1, 2, 0, 0, 0, '楠橘星', '2021-11-13 20:46:44', '楠橘星', '2021-11-13 20:46:44', '无');
INSERT INTO `njs_menu` VALUES (6, '菜单管理', '/menu', '/perm/menu/Menu.vue', 'el-icon-menu', 2, 2, 0, 0, 0, '楠橘星', '2021-11-13 20:46:44', '楠橘星', '2021-11-13 20:46:44', '无');
INSERT INTO `njs_menu` VALUES (7, '接口管理', '/api', '/perm/api/Api.vue', 'el-icon-c-scale-to-original', 3, 2, 0, 0, 0, '楠橘星', '2021-11-13 20:46:44', '楠橘星', '2021-11-13 20:46:44', '无');
INSERT INTO `njs_menu` VALUES (8, '数据字典', '/dict', '/system/dict/Dict.vue', 'el-icon-s-marketing\n', 1, 3, 0, 0, 0, '楠橘星', '2021-11-13 20:46:44', '楠橘星', '2021-11-13 20:46:44', '无');
INSERT INTO `njs_menu` VALUES (9, '通知公告', '/notify', '/system/notify/Notify.vue', 'el-icon-s-comment\n', 2, 3, 0, 0, 0, '楠橘星', '2021-11-13 20:46:44', '楠橘星', '2021-11-13 20:46:44', '无');
COMMIT;

-- ----------------------------
-- Table structure for njs_menu_role
-- ----------------------------
DROP TABLE IF EXISTS `njs_menu_role`;
CREATE TABLE `njs_menu_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menu_id` int(11) NOT NULL COMMENT '菜单id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of njs_menu_role
-- ----------------------------
BEGIN;
INSERT INTO `njs_menu_role` VALUES (1, 1, 1);
INSERT INTO `njs_menu_role` VALUES (2, 2, 1);
INSERT INTO `njs_menu_role` VALUES (3, 3, 1);
INSERT INTO `njs_menu_role` VALUES (4, 4, 1);
INSERT INTO `njs_menu_role` VALUES (5, 5, 1);
INSERT INTO `njs_menu_role` VALUES (6, 6, 1);
INSERT INTO `njs_menu_role` VALUES (7, 7, 1);
INSERT INTO `njs_menu_role` VALUES (8, 8, 1);
INSERT INTO `njs_menu_role` VALUES (9, 9, 1);
INSERT INTO `njs_menu_role` VALUES (10, 1, 2);
INSERT INTO `njs_menu_role` VALUES (11, 3, 2);
INSERT INTO `njs_menu_role` VALUES (12, 4, 2);
INSERT INTO `njs_menu_role` VALUES (13, 8, 2);
INSERT INTO `njs_menu_role` VALUES (14, 9, 2);
INSERT INTO `njs_menu_role` VALUES (15, 1, 3);
INSERT INTO `njs_menu_role` VALUES (16, 3, 3);
INSERT INTO `njs_menu_role` VALUES (17, 4, 3);
INSERT INTO `njs_menu_role` VALUES (18, 8, 3);
INSERT INTO `njs_menu_role` VALUES (19, 9, 3);
COMMIT;

-- ----------------------------
-- Table structure for njs_opt_log
-- ----------------------------
DROP TABLE IF EXISTS `njs_opt_log`;
CREATE TABLE `njs_opt_log` (
  `opt_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `title` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '模块标题',
  `business_type` tinyint(1) DEFAULT NULL COMMENT '业务类型（1 新增 2 修改 3 删除 ）',
  `method_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '方法路径',
  `request_type` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求方式',
  `opt_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作者',
  `opt_url` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求路径',
  `opt_ip` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作者ip',
  `opt_address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作者地址',
  `request_param` longtext COLLATE utf8mb4_general_ci COMMENT '请求参数',
  `response_data` longtext COLLATE utf8mb4_general_ci COMMENT '返回信息',
  `error_msg` longtext COLLATE utf8mb4_general_ci COMMENT '错误信息',
  `status` tinyint(1) DEFAULT '0' COMMENT '操作状态（0正常 1错误）',
  `opt_time` datetime DEFAULT NULL COMMENT '操作日期',
  PRIMARY KEY (`opt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of njs_opt_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for njs_role
-- ----------------------------
DROP TABLE IF EXISTS `njs_role`;
CREATE TABLE `njs_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色主键',
  `role_name` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色标识',
  `role_num` tinyint(3) DEFAULT '99' COMMENT '角色排序',
  `is_disable` tinyint(1) DEFAULT '0' COMMENT '角色状态 （0正常 1禁用）',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除状态（0正常 1删除）',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改者',
  `gmt_update` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of njs_role
-- ----------------------------
BEGIN;
INSERT INTO `njs_role` VALUES (1, '超级管理员', 'super_admin', 1, 0, 0, '楠橘星', '2021-11-15 21:04:50', '楠橘星', '2021-11-15 21:04:55', '无');
INSERT INTO `njs_role` VALUES (2, '管理员', 'admin', 2, 0, 0, '楠橘星', '2021-11-15 21:04:50', '楠橘星', '2021-11-15 21:04:50', '无');
INSERT INTO `njs_role` VALUES (3, '用户', 'consumer', 3, 0, 0, '楠橘星', '2021-11-15 21:04:50', '楠橘星', '2021-11-15 21:04:50', '无');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
