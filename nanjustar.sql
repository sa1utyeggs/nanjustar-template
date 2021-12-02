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

 Date: 02/12/2021 16:40:31
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
INSERT INTO `njs_consumer` VALUES (1, 'Nanjustar', '$2a$10$AJQdBnx6.M9lPNIyCEUj2.Mb2Atc6X9SUkBD5HE6BjW9T15CCDcLG', 'ᯤ⁸ᴳ⁺(超级管理员)', 'http://thirdqq.qlogo.cn/g?b=oidb&k=nRicWhbNHnibgvCyDbNljhJQ&s=100&t=1633014176', 'nanjustar@qq.com', '12345678980', -1, 1, '2021-11-15 21:04:50', '1.1.1.1', '河南南阳', 0, 0, '楠橘星', '2021-11-16 11:40:52', '楠橘星', '2021-11-15 21:04:50', '无');
INSERT INTO `njs_consumer` VALUES (2, 'admin', '$2a$10$AJQdBnx6.M9lPNIyCEUj2.Mb2Atc6X9SUkBD5HE6BjW9T15CCDcLG', '予希(管理员)', 'http://thirdqq.qlogo.cn/g?b=oidb&k=hvhPWld09XxGU20XFcTXJg&s=100&t=1633014230', 'nanjustar@qq.com', '12345678910', -1, 0, '2021-11-15 21:04:50', '1.1.1.1', '河南南阳', 0, 0, '楠橘星', '2021-11-15 21:04:50', '楠橘星', '2021-11-15 21:04:50', '无');
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
-- Table structure for njs_dict
-- ----------------------------
DROP TABLE IF EXISTS `njs_dict`;
CREATE TABLE `njs_dict` (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dict_name` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典名称',
  `dict_value` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '编码值',
  `dict_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典唯一编码',
  `parent_id` int(11) DEFAULT NULL COMMENT '字典父级 无父级则为 -1',
  `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新者',
  `gmt_update` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB AUTO_INCREMENT=459 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of njs_dict
-- ----------------------------
BEGIN;
INSERT INTO `njs_dict` VALUES (1, '性别', NULL, 'njs_gender', -1, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (2, '城市', NULL, 'njs_city', -1, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (3, '民族', NULL, 'njs_nation', -1, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (4, '图标', NULL, 'njs_icon', -1, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (5, '女', '0', 'woman', 1, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (6, '男', '1', 'man', 1, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (7, '未知', '-1', 'unknown', 1, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (8, '饿了吗', '', 'el-icon-platform-eleme', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (9, '饿了吗', NULL, 'el-icon-eleme', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (10, '删除', NULL, 'el-icon-delete-solid', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (11, '删除', NULL, 'el-icon-delete', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (12, '设置', NULL, 'el-icon-s-tools', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (13, '设置', NULL, 'el-icon-setting', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (14, '用户', NULL, 'el-icon-user-solid', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (15, '用户', NULL, 'el-icon-user', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (16, '电话', NULL, 'el-icon-phone', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (17, '电话', NULL, 'el-icon-phone-outline', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (18, '更多', NULL, 'el-icon-more', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (19, '星星', NULL, 'el-icon-star-on', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (20, '星星', NULL, 'el-icon-star-off', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (21, '购物', NULL, 'el-icon-s-goods', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (22, '购物', NULL, 'el-icon-goods', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (23, '警告', NULL, 'el-icon-warning', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (24, '感叹号', NULL, 'el-icon-warning-outline', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (25, '问号', NULL, 'el-icon-question\n', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (26, '信息', NULL, 'el-icon-info', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (27, '缩小', NULL, 'el-icon-remove\n', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (28, '放大', NULL, 'el-icon-circle-plus', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (29, '正确', NULL, 'el-icon-success', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (30, '错误', NULL, 'el-icon-error', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (31, '放大', NULL, 'el-icon-zoom-in', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (32, '缩小', NULL, 'el-icon-zoom-out', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (33, '删除', NULL, 'el-icon-remove-outline', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (34, '新增', NULL, 'el-icon-circle-plus-outline', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (35, '查看', NULL, 'el-icon-circle-check\n', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (36, '关闭', NULL, 'el-icon-circle-close', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (37, '帮助', NULL, 'el-icon-s-help', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (38, '帮助', NULL, 'el-icon-help', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (39, '减号', NULL, 'el-icon-minus', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (40, '加号', NULL, 'el-icon-plus', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (41, '对号', NULL, 'el-icon-check', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (42, '差号', NULL, 'el-icon-close', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (43, '图片', NULL, 'el-icon-picture', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (44, '图片', NULL, 'el-icon-picture-outline', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (45, '圆图片', NULL, 'el-icon-picture-outline-round', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (46, '上传', NULL, 'el-icon-upload', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (47, '上传', NULL, 'el-icon-upload2', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (48, '下载', NULL, 'el-icon-download', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (49, '照相机', NULL, 'el-icon-camera-solid', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (51, NULL, NULL, 'el-icon-video-camera-solid', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (52, NULL, NULL, 'el-icon-video-camera', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (53, NULL, NULL, 'el-icon-message-solid', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (54, NULL, NULL, 'el-icon-bell', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (55, NULL, NULL, 'el-icon-s-cooperation', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (56, NULL, NULL, 'el-icon-s-order', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (57, NULL, NULL, 'el-icon-s-platform', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (58, NULL, NULL, 'el-icon-s-fold', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (59, NULL, NULL, 'el-icon-s-unfold', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (60, NULL, NULL, 'el-icon-s-operation', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (61, NULL, NULL, 'el-icon-s-promotion', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (62, NULL, NULL, 'el-icon-s-home', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (63, NULL, NULL, 'el-icon-s-release', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (64, NULL, NULL, 'el-icon-s-ticket', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (65, NULL, NULL, 'el-icon-s-management', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (66, NULL, NULL, 'el-icon-s-open', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (67, NULL, NULL, 'el-icon-s-shop', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (68, NULL, NULL, 'el-icon-s-marketing', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (69, NULL, NULL, 'el-icon-s-flag', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (70, NULL, NULL, 'el-icon-s-comment', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (71, NULL, NULL, 'el-icon-s-finance', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (72, NULL, NULL, 'el-icon-s-claim', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (73, NULL, NULL, 'el-icon-s-custom', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (74, NULL, NULL, 'el-icon-s-opportunity', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (75, NULL, NULL, 'el-icon-s-data', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (76, NULL, NULL, 'el-icon-s-check', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (77, NULL, NULL, 'el-icon-s-grid', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (78, NULL, NULL, 'el-icon-menu', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (79, NULL, NULL, 'el-icon-share', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (80, NULL, NULL, 'el-icon-d-caret', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (81, NULL, NULL, 'el-icon-caret-left', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (82, NULL, NULL, 'el-icon-caret-right', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (83, NULL, NULL, 'el-icon-caret-bottom', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (84, NULL, NULL, 'el-icon-caret-top', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (85, NULL, NULL, 'el-icon-bottom-left', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (86, NULL, NULL, 'el-icon-bottom-right', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (87, NULL, NULL, 'el-icon-back', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (88, NULL, NULL, 'el-icon-right', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (89, NULL, NULL, 'el-icon-bottom', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (90, NULL, NULL, 'el-icon-top', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (91, NULL, NULL, 'el-icon-top-left', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (92, NULL, NULL, 'el-icon-top-right', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (93, NULL, NULL, 'el-icon-arrow-left', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (94, NULL, NULL, 'el-icon-arrow-right', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (95, NULL, NULL, 'el-icon-arrow-down', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (96, NULL, NULL, 'el-icon-arrow-up', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (97, NULL, NULL, 'el-icon-d-arrow-left', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (98, NULL, NULL, 'el-icon-d-arrow-right', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (99, NULL, NULL, 'el-icon-video-pause', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (100, NULL, NULL, 'el-icon-video-play', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (101, NULL, NULL, 'el-icon-refresh', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (102, NULL, NULL, 'el-icon-refresh-right', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (103, NULL, NULL, 'el-icon-refresh-left', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (104, NULL, NULL, 'el-icon-finished', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (105, NULL, NULL, 'el-icon-sort', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (106, NULL, NULL, 'el-icon-sort-up', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (107, NULL, NULL, 'el-icon-sort-down', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (108, NULL, NULL, 'el-icon-rank', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (109, NULL, NULL, 'el-icon-loading', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (110, NULL, NULL, 'el-icon-view', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (111, NULL, NULL, 'el-icon-c-scale-to-original', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (112, NULL, NULL, 'el-icon-date', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (113, NULL, NULL, 'el-icon-edit', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (114, NULL, NULL, 'el-icon-edit-outline', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (115, NULL, NULL, 'el-icon-folder', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (116, NULL, NULL, 'el-icon-folder-opened', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (117, NULL, NULL, 'el-icon-folder-add', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (118, NULL, NULL, 'el-icon-folder-remove', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (121, 'el-icon-folder-delete', NULL, 'el-icon-folder-delete', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (122, 'el-icon-folder-checked', NULL, 'el-icon-folder-checked', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (123, 'el-icon-tickets', NULL, 'el-icon-tickets', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (124, 'el-icon-document-remove', NULL, 'el-icon-document-remove', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (125, 'el-icon-document-delete', NULL, 'el-icon-document-delete', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (126, 'el-icon-document-copy', NULL, 'el-icon-document-copy', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (127, 'el-icon-document-checked', NULL, 'el-icon-document-checked', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (128, 'el-icon-document', NULL, 'el-icon-document', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (129, 'el-icon-document-add', NULL, 'el-icon-document-add', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (130, 'el-icon-printer', NULL, 'el-icon-printer', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (131, 'el-icon-paperclip', NULL, 'el-icon-paperclip', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (132, 'el-icon-takeaway-box', NULL, 'el-icon-takeaway-box', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (133, 'el-icon-search', NULL, 'el-icon-search', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (134, 'el-icon-monitor', NULL, 'el-icon-monitor', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (135, 'el-icon-attract', NULL, 'el-icon-attract', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (136, 'el-icon-mobile', NULL, 'el-icon-mobile', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (289, 'el-icon-folder-delete', NULL, 'el-icon-folder-delete', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (290, 'el-icon-folder-checked', NULL, 'el-icon-folder-checked', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (291, 'el-icon-tickets', NULL, 'el-icon-tickets', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (292, 'el-icon-document-remove', NULL, 'el-icon-document-remove', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (293, 'el-icon-document-delete', NULL, 'el-icon-document-delete', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (294, 'el-icon-document-copy', NULL, 'el-icon-document-copy', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (295, 'el-icon-document-checked', NULL, 'el-icon-document-checked', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (296, 'el-icon-document', NULL, 'el-icon-document', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (297, 'el-icon-document-add', NULL, 'el-icon-document-add', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (298, 'el-icon-printer', NULL, 'el-icon-printer', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (299, 'el-icon-paperclip', NULL, 'el-icon-paperclip', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (300, 'el-icon-takeaway-box', NULL, 'el-icon-takeaway-box', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (301, 'el-icon-search', NULL, 'el-icon-search', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (302, 'el-icon-monitor', NULL, 'el-icon-monitor', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (303, 'el-icon-attract', NULL, 'el-icon-attract', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (304, 'el-icon-mobile', NULL, 'el-icon-mobile', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (305, 'el-icon-scissors', NULL, 'el-icon-scissors', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (306, 'el-icon-umbrella', NULL, 'el-icon-umbrella', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (307, 'el-icon-headset', NULL, 'el-icon-headset', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (308, 'el-icon-brush', NULL, 'el-icon-brush', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (309, 'el-icon-mouse', NULL, 'el-icon-mouse', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (310, 'el-icon-coordinate', NULL, 'el-icon-coordinate', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (311, 'el-icon-magic-stick', NULL, 'el-icon-magic-stick', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (312, 'el-icon-reading', NULL, 'el-icon-reading', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (313, 'el-icon-data-line', NULL, 'el-icon-data-line', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (314, 'el-icon-data-board', NULL, 'el-icon-data-board', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (315, 'el-icon-pie-chart', NULL, 'el-icon-pie-chart', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (316, 'el-icon-data-analysis', NULL, 'el-icon-data-analysis', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (317, 'el-icon-collection-tag', NULL, 'el-icon-collection-tag', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (318, 'el-icon-film', NULL, 'el-icon-film', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (319, 'el-icon-suitcase', NULL, 'el-icon-suitcase', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (320, 'el-icon-suitcase-1', NULL, 'el-icon-suitcase-1', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (321, 'el-icon-receiving', NULL, 'el-icon-receiving', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (322, 'el-icon-collection', NULL, 'el-icon-collection', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (323, 'el-icon-files', NULL, 'el-icon-files', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (324, 'el-icon-notebook-1', NULL, 'el-icon-notebook-1', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (325, 'el-icon-notebook-2', NULL, 'el-icon-notebook-2', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (326, 'el-icon-toilet-paper', NULL, 'el-icon-toilet-paper', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (327, 'el-icon-office-building', NULL, 'el-icon-office-building', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (328, 'el-icon-school', NULL, 'el-icon-school', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (329, 'el-icon-table-lamp', NULL, 'el-icon-table-lamp', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (330, 'el-icon-house', NULL, 'el-icon-house', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (331, 'el-icon-no-smoking', NULL, 'el-icon-no-smoking', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (332, 'el-icon-smoking', NULL, 'el-icon-smoking', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (333, 'el-icon-shopping-cart-full', NULL, 'el-icon-shopping-cart-full', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (334, 'el-icon-shopping-cart-1', NULL, 'el-icon-shopping-cart-1', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (335, 'el-icon-shopping-cart-2', NULL, 'el-icon-shopping-cart-2', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (336, 'el-icon-shopping-bag-1', NULL, 'el-icon-shopping-bag-1', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (337, 'el-icon-shopping-bag-2', NULL, 'el-icon-shopping-bag-2', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (338, 'el-icon-sold-out', NULL, 'el-icon-sold-out', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (339, 'el-icon-sell', NULL, 'el-icon-sell', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (340, 'el-icon-present', NULL, 'el-icon-present', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (341, 'el-icon-box', NULL, 'el-icon-box', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (342, 'el-icon-bank-card', NULL, 'el-icon-bank-card', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (343, 'el-icon-money', NULL, 'el-icon-money', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (344, 'el-icon-coin', NULL, 'el-icon-coin', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (345, 'el-icon-wallet', NULL, 'el-icon-wallet', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (346, 'el-icon-discount', NULL, 'el-icon-discount', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (347, 'el-icon-price-tag', NULL, 'el-icon-price-tag', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (348, 'el-icon-news', NULL, 'el-icon-news', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (349, 'el-icon-guide', NULL, 'el-icon-guide', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (350, 'el-icon-male', NULL, 'el-icon-male', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (351, 'el-icon-female', NULL, 'el-icon-female', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (352, 'el-icon-thumb', NULL, 'el-icon-thumb', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (353, 'el-icon-cpu', NULL, 'el-icon-cpu', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (354, 'el-icon-link', NULL, 'el-icon-link', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (355, 'el-icon-connection', NULL, 'el-icon-connection', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (356, 'el-icon-open', NULL, 'el-icon-open', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (357, 'el-icon-turn-off', NULL, 'el-icon-turn-off', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (358, 'el-icon-set-up', NULL, 'el-icon-set-up', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (359, 'el-icon-chat-round', NULL, 'el-icon-chat-round', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (360, 'el-icon-chat-line-round', NULL, 'el-icon-chat-line-round', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (361, 'el-icon-chat-square', NULL, 'el-icon-chat-square', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (362, 'el-icon-chat-dot-round', NULL, 'el-icon-chat-dot-round', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (363, 'el-icon-chat-dot-square', NULL, 'el-icon-chat-dot-square', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (364, 'el-icon-chat-line-square', NULL, 'el-icon-chat-line-square', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (365, 'el-icon-message', NULL, 'el-icon-message', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (366, 'el-icon-postcard', NULL, 'el-icon-postcard', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (367, 'el-icon-position', NULL, 'el-icon-position', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (368, 'el-icon-turn-off-microphone', NULL, 'el-icon-turn-off-microphone', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (369, 'el-icon-microphone', NULL, 'el-icon-microphone', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (370, 'el-icon-close-notification', NULL, 'el-icon-close-notification', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (371, 'el-icon-bangzhu', NULL, 'el-icon-bangzhu', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (372, 'el-icon-time', NULL, 'el-icon-time', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (373, 'el-icon-odometer', NULL, 'el-icon-odometer', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (374, 'el-icon-crop', NULL, 'el-icon-crop', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (375, 'el-icon-aim', NULL, 'el-icon-aim', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (376, 'el-icon-switch-button', NULL, 'el-icon-switch-button', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (377, 'el-icon-full-screen', NULL, 'el-icon-full-screen', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (378, 'el-icon-copy-document', NULL, 'el-icon-copy-document', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (379, 'el-icon-mic', NULL, 'el-icon-mic', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (380, 'el-icon-stopwatch', NULL, 'el-icon-stopwatch', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (381, 'el-icon-medal-1', NULL, 'el-icon-medal-1', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (382, 'el-icon-medal', NULL, 'el-icon-medal', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (383, 'el-icon-trophy', NULL, 'el-icon-trophy', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (384, 'el-icon-trophy-1', NULL, 'el-icon-trophy-1', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (385, 'el-icon-first-aid-kit', NULL, 'el-icon-first-aid-kit', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (386, 'el-icon-discover', NULL, 'el-icon-discover', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (387, 'el-icon-place', NULL, 'el-icon-place', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (388, 'el-icon-location', NULL, 'el-icon-location', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (389, 'el-icon-location-outline', NULL, 'el-icon-location-outline', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (390, 'el-icon-location-information', NULL, 'el-icon-location-information', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (391, 'el-icon-add-location', NULL, 'el-icon-add-location', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (392, 'el-icon-delete-location', NULL, 'el-icon-delete-location', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (393, 'el-icon-map-location', NULL, 'el-icon-map-location', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (394, 'el-icon-alarm-clock', NULL, 'el-icon-alarm-clock', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (395, 'el-icon-timer', NULL, 'el-icon-timer', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (396, 'el-icon-watch-1', NULL, 'el-icon-watch-1', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (397, 'el-icon-watch', NULL, 'el-icon-watch', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (398, 'el-icon-lock', NULL, 'el-icon-lock', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (399, 'el-icon-unlock', NULL, 'el-icon-unlock', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (400, 'el-icon-key', NULL, 'el-icon-key', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (401, 'el-icon-service', NULL, 'el-icon-service', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (402, 'el-icon-mobile-phone', NULL, 'el-icon-mobile-phone', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (403, 'el-icon-bicycle', NULL, 'el-icon-bicycle', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (404, 'el-icon-truck', NULL, 'el-icon-truck', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (405, 'el-icon-ship', NULL, 'el-icon-ship', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (406, 'el-icon-basketball', NULL, 'el-icon-basketball', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (407, 'el-icon-football', NULL, 'el-icon-football', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (408, 'el-icon-soccer', NULL, 'el-icon-soccer', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (409, 'el-icon-baseball', NULL, 'el-icon-baseball', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (410, 'el-icon-wind-power', NULL, 'el-icon-wind-power', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (411, 'el-icon-light-rain', NULL, 'el-icon-light-rain', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (412, 'el-icon-lightning', NULL, 'el-icon-lightning', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (413, 'el-icon-heavy-rain', NULL, 'el-icon-heavy-rain', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (414, 'el-icon-sunrise', NULL, 'el-icon-sunrise', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (415, 'el-icon-sunrise-1', NULL, 'el-icon-sunrise-1', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (416, 'el-icon-sunset', NULL, 'el-icon-sunset', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (417, 'el-icon-sunny', NULL, 'el-icon-sunny', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (418, 'el-icon-cloudy', NULL, 'el-icon-cloudy', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (419, 'el-icon-partly-cloudy', NULL, 'el-icon-partly-cloudy', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (420, 'el-icon-cloudy-and-sunny', NULL, 'el-icon-cloudy-and-sunny', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (421, 'el-icon-moon', NULL, 'el-icon-moon', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (422, 'el-icon-moon-night', NULL, 'el-icon-moon-night', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (423, 'el-icon-dish', NULL, 'el-icon-dish', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (424, 'el-icon-dish-1', NULL, 'el-icon-dish-1', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (425, 'el-icon-food', NULL, 'el-icon-food', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (426, 'el-icon-chicken', NULL, 'el-icon-chicken', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (427, 'el-icon-fork-spoon', NULL, 'el-icon-fork-spoon', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (428, 'el-icon-knife-fork', NULL, 'el-icon-knife-fork', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (429, 'el-icon-burger', NULL, 'el-icon-burger', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (430, 'el-icon-tableware', NULL, 'el-icon-tableware', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (431, 'el-icon-sugar', NULL, 'el-icon-sugar', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (432, 'el-icon-dessert', NULL, 'el-icon-dessert', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (433, 'el-icon-ice-cream', NULL, 'el-icon-ice-cream', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (434, 'el-icon-hot-water', NULL, 'el-icon-hot-water', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (435, 'el-icon-water-cup', NULL, 'el-icon-water-cup', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (436, 'el-icon-coffee-cup', NULL, 'el-icon-coffee-cup', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (437, 'el-icon-cold-drink', NULL, 'el-icon-cold-drink', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (438, 'el-icon-goblet', NULL, 'el-icon-goblet', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (439, 'el-icon-goblet-full', NULL, 'el-icon-goblet-full', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (440, 'el-icon-goblet-square', NULL, 'el-icon-goblet-square', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (441, 'el-icon-goblet-square-full', NULL, 'el-icon-goblet-square-full', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (442, 'el-icon-refrigerator', NULL, 'el-icon-refrigerator', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (443, 'el-icon-grape', NULL, 'el-icon-grape', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (444, 'el-icon-watermelon', NULL, 'el-icon-watermelon', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (445, 'el-icon-cherry', NULL, 'el-icon-cherry', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (446, 'el-icon-apple', NULL, 'el-icon-apple', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (447, 'el-icon-pear', NULL, 'el-icon-pear', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (448, 'el-icon-orange', NULL, 'el-icon-orange', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (449, 'el-icon-coffee', NULL, 'el-icon-coffee', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (450, 'el-icon-ice-tea', NULL, 'el-icon-ice-tea', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (451, 'el-icon-ice-drink', NULL, 'el-icon-ice-drink', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (452, 'el-icon-milk-tea', NULL, 'el-icon-milk-tea', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (453, 'el-icon-potato-strips', NULL, 'el-icon-potato-strips', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (454, 'el-icon-lollipop', NULL, 'el-icon-lollipop', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (455, 'el-icon-ice-cream-square', NULL, 'el-icon-ice-cream-square', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
INSERT INTO `njs_dict` VALUES (456, 'el-icon-ice-cream-round', NULL, 'el-icon-ice-cream-round', 4, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:51:14');
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of njs_menu
-- ----------------------------
BEGIN;
INSERT INTO `njs_menu` VALUES (1, '首页', '/welcome', '/welcome/Welcome.vue', 'el-icon-s-home', 0, -1, 0, 0, 0, '楠橘星', '2021-11-13 20:46:44', '楠橘星', '2021-11-13 20:46:44', '首页系统');
INSERT INTO `njs_menu` VALUES (2, '权限管理', '/perm-submenu', 'Layout', 'el-icon-set-up', 1, -1, 0, 0, 0, '楠橘星', '2021-11-13 20:46:44', '楠橘星', '2021-11-30 11:18:26', '这是权限管理菜单');
INSERT INTO `njs_menu` VALUES (3, '系统管理', '/system-submenu', 'Layout', 'el-icon-s-tools', 2, -1, 0, 0, 0, '楠橘星', '2021-11-13 20:46:44', '楠橘星', '2021-11-13 20:46:44', '无');
INSERT INTO `njs_menu` VALUES (4, '日志管理', '/log-sunmenu', 'Layout', 'el-icon-document-copy', 3, -1, 0, 0, 0, '楠橘星', '2021-11-13 20:46:44', '楠橘星', '2021-11-13 20:46:44', '无');
INSERT INTO `njs_menu` VALUES (5, '角色管理', '/role', '/perm/role/Role.vue', 'el-icon-coordinate', 1, 2, 0, 0, 0, '楠橘星', '2021-11-13 20:46:44', '楠橘星', '2021-11-13 20:46:44', '无');
INSERT INTO `njs_menu` VALUES (6, '菜单管理', '/menu', '/perm/menu/Menu.vue', 'el-icon-menu', 2, 2, 0, 0, 0, '楠橘星', '2021-11-13 20:46:44', '楠橘星', '2021-11-13 20:46:44', '无');
INSERT INTO `njs_menu` VALUES (7, '接口管理', '/api', '/perm/api/Api.vue', 'el-icon-c-scale-to-original', 3, 2, 0, 0, 0, '楠橘星', '2021-11-13 20:46:44', '楠橘星', '2021-11-13 20:46:44', '无');
INSERT INTO `njs_menu` VALUES (8, '数据字典', '/dict', '/system/dict/Dict.vue', 'el-icon-s-marketing\n', 1, 3, 0, 0, 0, '楠橘星', '2021-11-13 20:46:44', '楠橘星', '2021-11-13 20:46:44', '无');
INSERT INTO `njs_menu` VALUES (9, '图标管理', '/icon', '/system/icon/Icon.vue', 'el-icon-s-comment\n', 2, 3, 0, 0, 0, '楠橘星', '2021-11-13 20:46:44', '楠橘星', '2021-11-13 20:46:44', '无');
INSERT INTO `njs_menu` VALUES (11, '个人中心', '/person', '/system/person/Person.vue', 'el-icon-user', 3, 3, 0, 0, 0, '楠橘星', '2021-11-13 20:46:44', '楠橘星', '2021-11-30 10:56:35', '个人中心');
INSERT INTO `njs_menu` VALUES (31, '操作日志', '/optlog', '/log/optlog/OptLog.vue', 'el-icon-mouse', 1, 4, 0, 0, 0, '楠橘星', '2021-11-30 11:22:58', '楠橘星', '2021-11-30 11:22:58', '操作日志菜单');
INSERT INTO `njs_menu` VALUES (32, '测试菜单', '/test', 'Layout', 'el-icon-rank', 4, -1, 0, 0, 1, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:05:40', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:29:48', '测试菜单');
INSERT INTO `njs_menu` VALUES (33, '测试目录', '/testc', '/test/test.vue', 'el-icon-turn-off', 19, -1, 0, 0, 1, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:06:29', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:06:29', '测试目录');
INSERT INTO `njs_menu` VALUES (34, '111', '111', 'Layout', 'el-icon-picture-outline-round', 2, -1, 0, 0, 1, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:09:40', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 09:09:40', '111');
INSERT INTO `njs_menu` VALUES (35, 'ddd', 'ddd', 'ddd', 'el-icon-zoom-in', 1, 32, 0, 0, 1, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 16:44:41', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 16:44:41', 'ddd');
INSERT INTO `njs_menu` VALUES (36, 'eee', 'eee', 'Layout', 'el-icon-s-goods', 1, -1, 0, 0, 1, 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 17:07:30', 'ᯤ⁸ᴳ⁺(超级管理员)', '2021-12-01 17:07:42', 'ddd');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
INSERT INTO `njs_menu_role` VALUES (24, 31, 1);
COMMIT;

-- ----------------------------
-- Table structure for njs_opt_log
-- ----------------------------
DROP TABLE IF EXISTS `njs_opt_log`;
CREATE TABLE `njs_opt_log` (
  `opt_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `title` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '模块标题',
  `business_type` tinyint(1) DEFAULT NULL COMMENT '业务类型（1 新增 2 修改 3 删除 ）',
  `method_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '方法名称',
  `method_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '方法路径',
  `request_type` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求方式',
  `opt_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作者',
  `opt_url` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求路径',
  `opt_ip` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作者ip',
  `opt_address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作者地址',
  `request_param` longtext COLLATE utf8mb4_general_ci COMMENT '请求参数',
  `response_data` longtext COLLATE utf8mb4_general_ci COMMENT '返回信息',
  `opt_time` datetime DEFAULT NULL COMMENT '操作日期',
  PRIMARY KEY (`opt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of njs_opt_log
-- ----------------------------
BEGIN;
INSERT INTO `njs_opt_log` VALUES (12, '菜单模块', 1, '新增菜单信息', 'com.nanjustar.web.controller.security.MenuController.saveMenu', 'POST', 'ᯤ⁸ᴳ⁺(超级管理员)', '/menu/saveMenu', '192.168.0.112', '本地局域网', '[{\"component\":\"Layout\",\"icon\":\"el-icon-rank\",\"isHidden\":false,\"menuId\":-1,\"menuName\":\"测试菜单\",\"orderNum\":4,\"parentId\":-1,\"path\":\"/test\",\"remark\":\"测试菜单\"}]', '{\"code\":20000,\"message\":\"菜单新增成功！\",\"status\":true}', '2021-12-01 09:05:40');
INSERT INTO `njs_opt_log` VALUES (13, '菜单模块', 1, '新增菜单信息', 'com.nanjustar.web.controller.security.MenuController.saveMenu', 'POST', 'ᯤ⁸ᴳ⁺(超级管理员)', '/menu/saveMenu', '192.168.0.112', '本地局域网', '[{\"component\":\"/test/test.vue\",\"icon\":\"el-icon-turn-off\",\"isHidden\":false,\"menuId\":-1,\"menuName\":\"测试目录\",\"orderNum\":19,\"parentId\":-1,\"path\":\"/testc\",\"remark\":\"测试目录\"}]', '{\"code\":20000,\"message\":\"菜单新增成功！\",\"status\":true}', '2021-12-01 09:06:30');
INSERT INTO `njs_opt_log` VALUES (14, '菜单模块', 1, '新增菜单信息', 'com.nanjustar.web.controller.security.MenuController.saveMenu', 'POST', 'ᯤ⁸ᴳ⁺(超级管理员)', '/menu/saveMenu', '192.168.0.112', '本地局域网', '[{\"component\":\"Layout\",\"icon\":\"el-icon-picture-outline-round\",\"isHidden\":false,\"menuId\":-1,\"menuName\":\"111\",\"orderNum\":2,\"parentId\":-1,\"path\":\"111\",\"remark\":\"111\"}]', '{\"code\":20000,\"message\":\"菜单新增成功！\",\"status\":true}', '2021-12-01 09:09:40');
INSERT INTO `njs_opt_log` VALUES (15, '菜单模块', 2, '修改菜单信息', 'com.nanjustar.web.controller.security.MenuController.updateMenu', 'PUT', 'ᯤ⁸ᴳ⁺(超级管理员)', '/menu/updateMenu', '192.168.0.112', '本地局域网', '[{\"component\":\"Layout\",\"icon\":\"el-icon-rank\",\"isHidden\":false,\"menuId\":32,\"menuName\":\"测试菜单\",\"orderNum\":4,\"path\":\"/test\",\"remark\":\"测试菜单\"}]', '{\"code\":20000,\"message\":\"菜单修改成功！\",\"status\":true}', '2021-12-01 09:29:48');
INSERT INTO `njs_opt_log` VALUES (16, '菜单模块', 1, '新增菜单信息', 'com.nanjustar.web.controller.security.MenuController.saveMenu', 'POST', 'ᯤ⁸ᴳ⁺(超级管理员)', '/menu/saveMenu', '192.168.43.195', '本地局域网', '[{\"component\":\"ddd\",\"icon\":\"el-icon-zoom-in\",\"isHidden\":false,\"menuId\":-1,\"menuName\":\"ddd\",\"orderNum\":1,\"parentId\":32,\"path\":\"ddd\",\"remark\":\"ddd\"}]', '{\"code\":20000,\"message\":\"菜单新增成功！\",\"status\":true}', '2021-12-01 16:44:42');
INSERT INTO `njs_opt_log` VALUES (17, '菜单模块', 3, '删除菜单信息', 'com.nanjustar.web.controller.security.MenuController.deleteMenu', 'DELETE', 'ᯤ⁸ᴳ⁺(超级管理员)', '/menu/deleteMenu/35', '192.168.43.195', '本地局域网', '[35]', '{\"code\":20000,\"message\":\"菜单删除成功！\",\"status\":true}', '2021-12-01 16:45:24');
INSERT INTO `njs_opt_log` VALUES (18, '菜单模块', 3, '删除菜单信息', 'com.nanjustar.web.controller.security.MenuController.deleteMenu', 'DELETE', 'ᯤ⁸ᴳ⁺(超级管理员)', '/menu/deleteMenu/32', '192.168.43.195', '本地局域网', '[32]', '{\"code\":20000,\"message\":\"菜单删除成功！\",\"status\":true}', '2021-12-01 16:57:33');
INSERT INTO `njs_opt_log` VALUES (19, '菜单模块', 1, '新增菜单信息', 'com.nanjustar.web.controller.security.MenuController.saveMenu', 'POST', 'ᯤ⁸ᴳ⁺(超级管理员)', '/menu/saveMenu', '192.168.43.195', '本地局域网', '[{\"component\":\"Layout\",\"icon\":\"el-icon-s-goods\",\"isHidden\":true,\"menuId\":-1,\"menuName\":\"eee\",\"orderNum\":1,\"parentId\":-1,\"path\":\"eee\",\"remark\":\"ddd\"}]', '{\"code\":20000,\"message\":\"菜单新增成功！\",\"status\":true}', '2021-12-01 17:07:31');
INSERT INTO `njs_opt_log` VALUES (20, '菜单模块', 2, '修改菜单信息', 'com.nanjustar.web.controller.security.MenuController.updateMenu', 'PUT', 'ᯤ⁸ᴳ⁺(超级管理员)', '/menu/updateMenu', '192.168.43.195', '本地局域网', '[{\"component\":\"Layout\",\"icon\":\"el-icon-s-goods\",\"isHidden\":false,\"menuId\":36,\"menuName\":\"eee\",\"orderNum\":1,\"path\":\"eee\",\"remark\":\"ddd\"}]', '{\"code\":20000,\"message\":\"菜单修改成功！\",\"status\":true}', '2021-12-01 17:07:43');
INSERT INTO `njs_opt_log` VALUES (21, '菜单模块', 3, '删除菜单信息', 'com.nanjustar.web.controller.security.MenuController.deleteMenu', 'DELETE', 'ᯤ⁸ᴳ⁺(超级管理员)', '/menu/deleteMenu/36', '192.168.43.195', '本地局域网', '[36]', '{\"code\":20000,\"message\":\"菜单删除成功！\",\"status\":true}', '2021-12-01 17:07:53');
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
