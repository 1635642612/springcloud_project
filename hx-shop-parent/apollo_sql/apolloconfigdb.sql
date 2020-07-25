/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50730
Source Host           : localhost:3306
Source Database       : apolloconfigdb

Target Server Type    : MYSQL
Target Server Version : 50730
File Encoding         : 65001

Date: 2020-07-25 18:29:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for app
-- ----------------------------
DROP TABLE IF EXISTS `app`;
CREATE TABLE `app` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Name` varchar(500) NOT NULL DEFAULT 'default' COMMENT '应用名',
  `OrgId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '部门Id',
  `OrgName` varchar(64) NOT NULL DEFAULT 'default' COMMENT '部门名字',
  `OwnerName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerName',
  `OwnerEmail` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId` (`AppId`(191)),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Name` (`Name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='应用表';

-- ----------------------------
-- Records of app
-- ----------------------------
INSERT INTO `app` VALUES ('1', 'SampleApp', 'Sample App', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', '\0', 'default', '2020-07-02 22:17:24', '', '2020-07-02 22:17:24');
INSERT INTO `app` VALUES ('2', 'app-hx-zuul', 'app-hx-zuul', 'TEST2', '样例部门2', 'apollo', 'apollo@acme.com', '\0', 'apollo', '2020-07-02 22:18:23', 'apollo', '2020-07-02 22:18:23');
INSERT INTO `app` VALUES ('3', 'app-hx-member', 'app-hx-member', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', '\0', 'apollo', '2020-07-02 23:06:44', 'apollo', '2020-07-02 23:06:44');
INSERT INTO `app` VALUES ('4', 'app-hx-weixin', 'app-hx-weixin', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', '\0', 'apollo', '2020-07-02 23:10:59', 'apollo', '2020-07-02 23:10:59');

-- ----------------------------
-- Table structure for appnamespace
-- ----------------------------
DROP TABLE IF EXISTS `appnamespace`;
CREATE TABLE `appnamespace` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT 'namespace名字，注意，需要全局唯一',
  `AppId` varchar(32) NOT NULL DEFAULT '' COMMENT 'app id',
  `Format` varchar(32) NOT NULL DEFAULT 'properties' COMMENT 'namespace的format类型',
  `IsPublic` bit(1) NOT NULL DEFAULT b'0' COMMENT 'namespace是否为公共',
  `Comment` varchar(64) NOT NULL DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_AppId` (`AppId`),
  KEY `Name_AppId` (`Name`,`AppId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='应用namespace定义';

-- ----------------------------
-- Records of appnamespace
-- ----------------------------
INSERT INTO `appnamespace` VALUES ('1', 'application', 'SampleApp', 'properties', '\0', 'default app namespace', '\0', '', '2020-07-02 22:17:24', '', '2020-07-02 22:17:24');
INSERT INTO `appnamespace` VALUES ('2', 'application', 'app-hx-zuul', 'properties', '\0', 'default app namespace', '\0', 'apollo', '2020-07-02 22:18:24', 'apollo', '2020-07-02 22:18:24');
INSERT INTO `appnamespace` VALUES ('3', 'application', 'app-hx-member', 'properties', '\0', 'default app namespace', '\0', 'apollo', '2020-07-02 23:06:45', 'apollo', '2020-07-02 23:06:45');
INSERT INTO `appnamespace` VALUES ('4', 'application', 'app-hx-weixin', 'properties', '\0', 'default app namespace', '\0', 'apollo', '2020-07-02 23:10:59', 'apollo', '2020-07-02 23:10:59');
INSERT INTO `appnamespace` VALUES ('5', 'hx-weixin', 'app-hx-weixin', 'properties', '\0', 'weixin配置文件', '\0', 'apollo', '2020-07-08 22:42:28', 'apollo', '2020-07-08 22:42:28');

-- ----------------------------
-- Table structure for audit
-- ----------------------------
DROP TABLE IF EXISTS `audit`;
CREATE TABLE `audit` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `EntityName` varchar(50) NOT NULL DEFAULT 'default' COMMENT '表名',
  `EntityId` int(10) unsigned DEFAULT NULL COMMENT '记录ID',
  `OpName` varchar(50) NOT NULL DEFAULT 'default' COMMENT '操作类型',
  `Comment` varchar(500) DEFAULT NULL COMMENT '备注',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COMMENT='日志审计表';

-- ----------------------------
-- Records of audit
-- ----------------------------
INSERT INTO `audit` VALUES ('1', 'App', '2', 'INSERT', null, '\0', 'apollo', '2020-07-02 22:18:24', null, '2020-07-02 22:18:24');
INSERT INTO `audit` VALUES ('2', 'AppNamespace', '2', 'INSERT', null, '\0', 'apollo', '2020-07-02 22:18:24', null, '2020-07-02 22:18:24');
INSERT INTO `audit` VALUES ('3', 'Cluster', '2', 'INSERT', null, '\0', 'apollo', '2020-07-02 22:18:24', null, '2020-07-02 22:18:24');
INSERT INTO `audit` VALUES ('4', 'Namespace', '2', 'INSERT', null, '\0', 'apollo', '2020-07-02 22:18:24', null, '2020-07-02 22:18:24');
INSERT INTO `audit` VALUES ('5', 'Item', '2', 'INSERT', null, '\0', 'apollo', '2020-07-02 22:47:08', null, '2020-07-02 22:47:08');
INSERT INTO `audit` VALUES ('6', 'Item', '3', 'INSERT', null, '\0', 'apollo', '2020-07-02 22:47:08', null, '2020-07-02 22:47:08');
INSERT INTO `audit` VALUES ('7', 'Item', '4', 'INSERT', null, '\0', 'apollo', '2020-07-02 22:47:08', null, '2020-07-02 22:47:08');
INSERT INTO `audit` VALUES ('8', 'Item', '5', 'INSERT', null, '\0', 'apollo', '2020-07-02 22:47:08', null, '2020-07-02 22:47:08');
INSERT INTO `audit` VALUES ('9', 'Item', '6', 'INSERT', null, '\0', 'apollo', '2020-07-02 22:47:08', null, '2020-07-02 22:47:08');
INSERT INTO `audit` VALUES ('10', 'Item', '7', 'INSERT', null, '\0', 'apollo', '2020-07-02 22:47:08', null, '2020-07-02 22:47:08');
INSERT INTO `audit` VALUES ('11', 'Item', '8', 'INSERT', null, '\0', 'apollo', '2020-07-02 22:47:08', null, '2020-07-02 22:47:08');
INSERT INTO `audit` VALUES ('12', 'ItemSet', null, 'INSERT', null, '\0', 'apollo', '2020-07-02 22:47:08', null, '2020-07-02 22:47:08');
INSERT INTO `audit` VALUES ('13', 'Release', '2', 'INSERT', null, '\0', 'apollo', '2020-07-02 22:48:21', null, '2020-07-02 22:48:21');
INSERT INTO `audit` VALUES ('14', 'ReleaseHistory', '2', 'INSERT', null, '\0', 'apollo', '2020-07-02 22:48:21', null, '2020-07-02 22:48:21');
INSERT INTO `audit` VALUES ('15', 'Item', '9', 'INSERT', null, '\0', 'apollo', '2020-07-02 22:55:00', null, '2020-07-02 22:55:00');
INSERT INTO `audit` VALUES ('16', 'Release', '3', 'INSERT', null, '\0', 'apollo', '2020-07-02 22:55:48', null, '2020-07-02 22:55:48');
INSERT INTO `audit` VALUES ('17', 'ReleaseHistory', '3', 'INSERT', null, '\0', 'apollo', '2020-07-02 22:55:48', null, '2020-07-02 22:55:48');
INSERT INTO `audit` VALUES ('18', 'Item', '3', 'UPDATE', null, '\0', 'apollo', '2020-07-02 22:59:23', null, '2020-07-02 22:59:23');
INSERT INTO `audit` VALUES ('19', 'Item', '6', 'UPDATE', null, '\0', 'apollo', '2020-07-02 22:59:23', null, '2020-07-02 22:59:23');
INSERT INTO `audit` VALUES ('20', 'Item', '8', 'UPDATE', null, '\0', 'apollo', '2020-07-02 22:59:23', null, '2020-07-02 22:59:23');
INSERT INTO `audit` VALUES ('21', 'Item', '9', 'UPDATE', null, '\0', 'apollo', '2020-07-02 22:59:23', null, '2020-07-02 22:59:23');
INSERT INTO `audit` VALUES ('22', 'ItemSet', null, 'UPDATE', null, '\0', 'apollo', '2020-07-02 22:59:23', null, '2020-07-02 22:59:23');
INSERT INTO `audit` VALUES ('23', 'Release', '4', 'INSERT', null, '\0', 'apollo', '2020-07-02 22:59:28', null, '2020-07-02 22:59:28');
INSERT INTO `audit` VALUES ('24', 'ReleaseHistory', '4', 'INSERT', null, '\0', 'apollo', '2020-07-02 22:59:28', null, '2020-07-02 22:59:28');
INSERT INTO `audit` VALUES ('25', 'Release', '5', 'INSERT', null, '\0', 'apollo', '2020-07-02 22:59:34', null, '2020-07-02 22:59:34');
INSERT INTO `audit` VALUES ('26', 'ReleaseHistory', '5', 'INSERT', null, '\0', 'apollo', '2020-07-02 22:59:34', null, '2020-07-02 22:59:34');
INSERT INTO `audit` VALUES ('27', 'App', '3', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:06:45', null, '2020-07-02 23:06:45');
INSERT INTO `audit` VALUES ('28', 'AppNamespace', '3', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:06:45', null, '2020-07-02 23:06:45');
INSERT INTO `audit` VALUES ('29', 'Cluster', '3', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:06:45', null, '2020-07-02 23:06:45');
INSERT INTO `audit` VALUES ('30', 'Namespace', '3', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:06:45', null, '2020-07-02 23:06:45');
INSERT INTO `audit` VALUES ('31', 'Item', '10', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:07:25', null, '2020-07-02 23:07:25');
INSERT INTO `audit` VALUES ('32', 'Item', '11', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:07:25', null, '2020-07-02 23:07:25');
INSERT INTO `audit` VALUES ('33', 'Item', '12', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:07:25', null, '2020-07-02 23:07:25');
INSERT INTO `audit` VALUES ('34', 'Item', '13', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:07:25', null, '2020-07-02 23:07:25');
INSERT INTO `audit` VALUES ('35', 'Item', '14', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:07:25', null, '2020-07-02 23:07:25');
INSERT INTO `audit` VALUES ('36', 'Item', '15', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:07:25', null, '2020-07-02 23:07:25');
INSERT INTO `audit` VALUES ('37', 'Item', '16', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:07:25', null, '2020-07-02 23:07:25');
INSERT INTO `audit` VALUES ('38', 'Item', '17', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:07:25', null, '2020-07-02 23:07:25');
INSERT INTO `audit` VALUES ('39', 'Item', '18', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:07:25', null, '2020-07-02 23:07:25');
INSERT INTO `audit` VALUES ('40', 'Item', '19', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:07:25', null, '2020-07-02 23:07:25');
INSERT INTO `audit` VALUES ('41', 'ItemSet', null, 'INSERT', null, '\0', 'apollo', '2020-07-02 23:07:26', null, '2020-07-02 23:07:26');
INSERT INTO `audit` VALUES ('42', 'Release', '6', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:07:33', null, '2020-07-02 23:07:33');
INSERT INTO `audit` VALUES ('43', 'ReleaseHistory', '6', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:07:33', null, '2020-07-02 23:07:33');
INSERT INTO `audit` VALUES ('44', 'App', '4', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:10:59', null, '2020-07-02 23:10:59');
INSERT INTO `audit` VALUES ('45', 'AppNamespace', '4', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:10:59', null, '2020-07-02 23:10:59');
INSERT INTO `audit` VALUES ('46', 'Cluster', '4', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:10:59', null, '2020-07-02 23:10:59');
INSERT INTO `audit` VALUES ('47', 'Namespace', '4', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:10:59', null, '2020-07-02 23:10:59');
INSERT INTO `audit` VALUES ('48', 'Item', '20', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:11:15', null, '2020-07-02 23:11:15');
INSERT INTO `audit` VALUES ('49', 'Item', '21', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:11:15', null, '2020-07-02 23:11:15');
INSERT INTO `audit` VALUES ('50', 'Item', '22', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:11:15', null, '2020-07-02 23:11:15');
INSERT INTO `audit` VALUES ('51', 'Item', '23', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:11:15', null, '2020-07-02 23:11:15');
INSERT INTO `audit` VALUES ('52', 'Item', '24', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:11:15', null, '2020-07-02 23:11:15');
INSERT INTO `audit` VALUES ('53', 'Item', '25', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:11:15', null, '2020-07-02 23:11:15');
INSERT INTO `audit` VALUES ('54', 'Item', '26', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:11:15', null, '2020-07-02 23:11:15');
INSERT INTO `audit` VALUES ('55', 'Item', '27', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:11:15', null, '2020-07-02 23:11:15');
INSERT INTO `audit` VALUES ('56', 'Item', '28', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:11:15', null, '2020-07-02 23:11:15');
INSERT INTO `audit` VALUES ('57', 'Item', '29', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:11:15', null, '2020-07-02 23:11:15');
INSERT INTO `audit` VALUES ('58', 'ItemSet', null, 'INSERT', null, '\0', 'apollo', '2020-07-02 23:11:15', null, '2020-07-02 23:11:15');
INSERT INTO `audit` VALUES ('59', 'Release', '7', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:11:21', null, '2020-07-02 23:11:21');
INSERT INTO `audit` VALUES ('60', 'ReleaseHistory', '7', 'INSERT', null, '\0', 'apollo', '2020-07-02 23:11:21', null, '2020-07-02 23:11:21');
INSERT INTO `audit` VALUES ('61', 'Item', '25', 'DELETE', null, '\0', 'apollo', '2020-07-02 23:59:59', null, '2020-07-02 23:59:59');
INSERT INTO `audit` VALUES ('62', 'Item', '28', 'DELETE', null, '\0', 'apollo', '2020-07-02 23:59:59', null, '2020-07-02 23:59:59');
INSERT INTO `audit` VALUES ('63', 'Item', '29', 'DELETE', null, '\0', 'apollo', '2020-07-02 23:59:59', null, '2020-07-02 23:59:59');
INSERT INTO `audit` VALUES ('64', 'Item', '27', 'DELETE', null, '\0', 'apollo', '2020-07-02 23:59:59', null, '2020-07-02 23:59:59');
INSERT INTO `audit` VALUES ('65', 'Item', '23', 'DELETE', null, '\0', 'apollo', '2020-07-02 23:59:59', null, '2020-07-02 23:59:59');
INSERT INTO `audit` VALUES ('66', 'Item', '24', 'DELETE', null, '\0', 'apollo', '2020-07-02 23:59:59', null, '2020-07-02 23:59:59');
INSERT INTO `audit` VALUES ('67', 'Item', '26', 'DELETE', null, '\0', 'apollo', '2020-07-02 23:59:59', null, '2020-07-02 23:59:59');
INSERT INTO `audit` VALUES ('68', 'ItemSet', null, 'DELETE', null, '\0', 'apollo', '2020-07-02 23:59:59', null, '2020-07-02 23:59:59');
INSERT INTO `audit` VALUES ('69', 'Release', '8', 'INSERT', null, '\0', 'apollo', '2020-07-03 00:00:08', null, '2020-07-03 00:00:08');
INSERT INTO `audit` VALUES ('70', 'ReleaseHistory', '8', 'INSERT', null, '\0', 'apollo', '2020-07-03 00:00:08', null, '2020-07-03 00:00:08');
INSERT INTO `audit` VALUES ('71', 'Item', '15', 'DELETE', null, '\0', 'apollo', '2020-07-03 00:00:24', null, '2020-07-03 00:00:24');
INSERT INTO `audit` VALUES ('72', 'Item', '18', 'DELETE', null, '\0', 'apollo', '2020-07-03 00:00:24', null, '2020-07-03 00:00:24');
INSERT INTO `audit` VALUES ('73', 'Item', '19', 'DELETE', null, '\0', 'apollo', '2020-07-03 00:00:24', null, '2020-07-03 00:00:24');
INSERT INTO `audit` VALUES ('74', 'Item', '17', 'DELETE', null, '\0', 'apollo', '2020-07-03 00:00:24', null, '2020-07-03 00:00:24');
INSERT INTO `audit` VALUES ('75', 'Item', '13', 'DELETE', null, '\0', 'apollo', '2020-07-03 00:00:24', null, '2020-07-03 00:00:24');
INSERT INTO `audit` VALUES ('76', 'Item', '14', 'DELETE', null, '\0', 'apollo', '2020-07-03 00:00:24', null, '2020-07-03 00:00:24');
INSERT INTO `audit` VALUES ('77', 'Item', '16', 'DELETE', null, '\0', 'apollo', '2020-07-03 00:00:24', null, '2020-07-03 00:00:24');
INSERT INTO `audit` VALUES ('78', 'ItemSet', null, 'DELETE', null, '\0', 'apollo', '2020-07-03 00:00:24', null, '2020-07-03 00:00:24');
INSERT INTO `audit` VALUES ('79', 'Release', '9', 'INSERT', null, '\0', 'apollo', '2020-07-03 00:00:28', null, '2020-07-03 00:00:28');
INSERT INTO `audit` VALUES ('80', 'ReleaseHistory', '9', 'INSERT', null, '\0', 'apollo', '2020-07-03 00:00:28', null, '2020-07-03 00:00:28');
INSERT INTO `audit` VALUES ('81', 'Namespace', '5', 'INSERT', null, '\0', 'apollo', '2020-07-08 22:42:30', null, '2020-07-08 22:42:30');
INSERT INTO `audit` VALUES ('82', 'AppNamespace', '5', 'INSERT', null, '\0', 'apollo', '2020-07-08 22:42:30', null, '2020-07-08 22:42:30');
INSERT INTO `audit` VALUES ('83', 'Item', '30', 'INSERT', null, '\0', 'apollo', '2020-07-08 22:44:03', null, '2020-07-08 22:44:03');
INSERT INTO `audit` VALUES ('84', 'Item', '31', 'INSERT', null, '\0', 'apollo', '2020-07-08 22:44:03', null, '2020-07-08 22:44:03');
INSERT INTO `audit` VALUES ('85', 'Item', '32', 'INSERT', null, '\0', 'apollo', '2020-07-08 22:44:03', null, '2020-07-08 22:44:03');
INSERT INTO `audit` VALUES ('86', 'Item', '33', 'INSERT', null, '\0', 'apollo', '2020-07-08 22:44:03', null, '2020-07-08 22:44:03');
INSERT INTO `audit` VALUES ('87', 'Item', '34', 'INSERT', null, '\0', 'apollo', '2020-07-08 22:44:03', null, '2020-07-08 22:44:03');
INSERT INTO `audit` VALUES ('88', 'Item', '35', 'INSERT', null, '\0', 'apollo', '2020-07-08 22:44:03', null, '2020-07-08 22:44:03');
INSERT INTO `audit` VALUES ('89', 'Item', '36', 'INSERT', null, '\0', 'apollo', '2020-07-08 22:44:03', null, '2020-07-08 22:44:03');
INSERT INTO `audit` VALUES ('90', 'Item', '37', 'INSERT', null, '\0', 'apollo', '2020-07-08 22:44:03', null, '2020-07-08 22:44:03');
INSERT INTO `audit` VALUES ('91', 'Item', '38', 'INSERT', null, '\0', 'apollo', '2020-07-08 22:44:03', null, '2020-07-08 22:44:03');
INSERT INTO `audit` VALUES ('92', 'Item', '39', 'INSERT', null, '\0', 'apollo', '2020-07-08 22:44:03', null, '2020-07-08 22:44:03');
INSERT INTO `audit` VALUES ('93', 'Item', '40', 'INSERT', null, '\0', 'apollo', '2020-07-08 22:44:03', null, '2020-07-08 22:44:03');
INSERT INTO `audit` VALUES ('94', 'Item', '41', 'INSERT', null, '\0', 'apollo', '2020-07-08 22:44:03', null, '2020-07-08 22:44:03');
INSERT INTO `audit` VALUES ('95', 'Item', '42', 'INSERT', null, '\0', 'apollo', '2020-07-08 22:44:03', null, '2020-07-08 22:44:03');
INSERT INTO `audit` VALUES ('96', 'Item', '43', 'INSERT', null, '\0', 'apollo', '2020-07-08 22:44:03', null, '2020-07-08 22:44:03');
INSERT INTO `audit` VALUES ('97', 'Item', '44', 'INSERT', null, '\0', 'apollo', '2020-07-08 22:44:03', null, '2020-07-08 22:44:03');
INSERT INTO `audit` VALUES ('98', 'Item', '45', 'INSERT', null, '\0', 'apollo', '2020-07-08 22:44:03', null, '2020-07-08 22:44:03');
INSERT INTO `audit` VALUES ('99', 'Item', '46', 'INSERT', null, '\0', 'apollo', '2020-07-08 22:44:03', null, '2020-07-08 22:44:03');
INSERT INTO `audit` VALUES ('100', 'Item', '47', 'INSERT', null, '\0', 'apollo', '2020-07-08 22:44:03', null, '2020-07-08 22:44:03');
INSERT INTO `audit` VALUES ('101', 'Item', '48', 'INSERT', null, '\0', 'apollo', '2020-07-08 22:44:03', null, '2020-07-08 22:44:03');
INSERT INTO `audit` VALUES ('102', 'ItemSet', null, 'INSERT', null, '\0', 'apollo', '2020-07-08 22:44:03', null, '2020-07-08 22:44:03');

-- ----------------------------
-- Table structure for cluster
-- ----------------------------
DROP TABLE IF EXISTS `cluster`;
CREATE TABLE `cluster` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT '集群名字',
  `AppId` varchar(32) NOT NULL DEFAULT '' COMMENT 'App id',
  `ParentClusterId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父cluster',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_AppId_Name` (`AppId`,`Name`),
  KEY `IX_ParentClusterId` (`ParentClusterId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='集群';

-- ----------------------------
-- Records of cluster
-- ----------------------------
INSERT INTO `cluster` VALUES ('1', 'default', 'SampleApp', '0', '\0', '', '2020-07-02 22:17:24', '', '2020-07-02 22:17:24');
INSERT INTO `cluster` VALUES ('2', 'default', 'app-hx-zuul', '0', '\0', 'apollo', '2020-07-02 22:18:24', 'apollo', '2020-07-02 22:18:24');
INSERT INTO `cluster` VALUES ('3', 'default', 'app-hx-member', '0', '\0', 'apollo', '2020-07-02 23:06:45', 'apollo', '2020-07-02 23:06:45');
INSERT INTO `cluster` VALUES ('4', 'default', 'app-hx-weixin', '0', '\0', 'apollo', '2020-07-02 23:10:59', 'apollo', '2020-07-02 23:10:59');

-- ----------------------------
-- Table structure for commit
-- ----------------------------
DROP TABLE IF EXISTS `commit`;
CREATE TABLE `commit` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ChangeSets` longtext NOT NULL COMMENT '修改变更集',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `Comment` varchar(500) DEFAULT NULL COMMENT '备注',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `AppId` (`AppId`(191)),
  KEY `ClusterName` (`ClusterName`(191)),
  KEY `NamespaceName` (`NamespaceName`(191))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='commit 历史表';

-- ----------------------------
-- Records of commit
-- ----------------------------
INSERT INTO `commit` VALUES ('1', '{\"createItems\":[{\"namespaceId\":2,\"key\":\"server.port\",\"value\":\"80\",\"comment\":\"\",\"lineNum\":1,\"id\":2,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 22:47:07\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 22:47:07\"},{\"namespaceId\":2,\"key\":\"spring.application.name\",\"value\":\"app-mayikt-zuul\",\"comment\":\"\",\"lineNum\":2,\"id\":3,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 22:47:07\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 22:47:07\"},{\"namespaceId\":2,\"key\":\"eureka.client.service-url.defaultZone\",\"value\":\"http://localhost:8100/eureka\",\"comment\":\"\",\"lineNum\":3,\"id\":4,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 22:47:07\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 22:47:07\"},{\"namespaceId\":2,\"key\":\"zuul.routes.api-a.path\",\"value\":\"/api-weixin/**\",\"comment\":\"\",\"lineNum\":4,\"id\":5,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 22:47:07\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 22:47:07\"},{\"namespaceId\":2,\"key\":\"zuul.routes.api-a.serviceId\",\"value\":\"app-mayikt-weixin\",\"comment\":\"\",\"lineNum\":5,\"id\":6,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 22:47:07\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 22:47:07\"},{\"namespaceId\":2,\"key\":\"zuul.routes.api-b.path\",\"value\":\"/api-member/**\",\"comment\":\"\",\"lineNum\":6,\"id\":7,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 22:47:07\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 22:47:07\"},{\"namespaceId\":2,\"key\":\"zuul.routes.api-b.serviceId\",\"value\":\"app-mayikt-member\",\"comment\":\"\",\"lineNum\":7,\"id\":8,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 22:47:07\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 22:47:07\"}],\"updateItems\":[],\"deleteItems\":[]}', 'app-hx-zuul', 'default', 'application', null, '\0', 'apollo', '2020-07-02 22:47:08', 'apollo', '2020-07-02 22:47:08');
INSERT INTO `commit` VALUES ('2', '{\"createItems\":[{\"namespaceId\":2,\"key\":\"hx.zuul.swagger.document\",\"value\":\"[\\n    {\\n        \\\"name\\\": \\\"app-mayikt-member\\\",\\n        \\\"location\\\": \\\"/app-mayikt-member/v2/api-docs\\\",\\n        \\\"version\\\": \\\"2.0\\\"\\n    },\\n    {\\n        \\\"name\\\": \\\"app-mayikt-weixin\\\",\\n        \\\"location\\\": \\\"/app-mayikt-weixin/v2/api-docs\\\",\\n        \\\"version\\\": \\\"2.0\\\"\\n    }\\n]\",\"comment\":\"整合swagger\",\"lineNum\":8,\"id\":9,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 22:54:59\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 22:54:59\"}],\"updateItems\":[],\"deleteItems\":[]}', 'app-hx-zuul', 'default', 'application', null, '\0', 'apollo', '2020-07-02 22:55:00', 'apollo', '2020-07-02 22:55:00');
INSERT INTO `commit` VALUES ('3', '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":2,\"key\":\"spring.application.name\",\"value\":\"app-mayikt-zuul\",\"comment\":\"\",\"lineNum\":2,\"id\":3,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 22:47:08\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 22:47:08\"},\"newItem\":{\"namespaceId\":2,\"key\":\"spring.application.name\",\"value\":\"app-hx-zuul\",\"comment\":\"\",\"lineNum\":2,\"id\":3,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 22:47:08\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 22:59:22\"}},{\"oldItem\":{\"namespaceId\":2,\"key\":\"zuul.routes.api-a.serviceId\",\"value\":\"app-mayikt-weixin\",\"comment\":\"\",\"lineNum\":5,\"id\":6,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 22:47:08\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 22:47:08\"},\"newItem\":{\"namespaceId\":2,\"key\":\"zuul.routes.api-a.serviceId\",\"value\":\"app-hx-weixin\",\"comment\":\"\",\"lineNum\":5,\"id\":6,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 22:47:08\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 22:59:22\"}},{\"oldItem\":{\"namespaceId\":2,\"key\":\"zuul.routes.api-b.serviceId\",\"value\":\"app-mayikt-member\",\"comment\":\"\",\"lineNum\":7,\"id\":8,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 22:47:08\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 22:47:08\"},\"newItem\":{\"namespaceId\":2,\"key\":\"zuul.routes.api-b.serviceId\",\"value\":\"app-hx-member\",\"comment\":\"\",\"lineNum\":7,\"id\":8,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 22:47:08\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 22:59:22\"}},{\"oldItem\":{\"namespaceId\":2,\"key\":\"hx.zuul.swagger.document\",\"value\":\"[\\n    {\\n        \\\"name\\\": \\\"app-mayikt-member\\\",\\n        \\\"location\\\": \\\"/app-mayikt-member/v2/api-docs\\\",\\n        \\\"version\\\": \\\"2.0\\\"\\n    },\\n    {\\n        \\\"name\\\": \\\"app-mayikt-weixin\\\",\\n        \\\"location\\\": \\\"/app-mayikt-weixin/v2/api-docs\\\",\\n        \\\"version\\\": \\\"2.0\\\"\\n    }\\n]\",\"comment\":\"整合swagger\",\"lineNum\":8,\"id\":9,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 22:55:00\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 22:55:00\"},\"newItem\":{\"namespaceId\":2,\"key\":\"hx.zuul.swagger.document\",\"value\":\"[\\n    {\\n        \\\"name\\\": \\\"app-hx-member\\\",\\n        \\\"location\\\": \\\"/app-hx-member/v2/api-docs\\\",\\n        \\\"version\\\": \\\"2.0\\\"\\n    },\\n    {\\n        \\\"name\\\": \\\"app-hx-weixin\\\",\\n        \\\"location\\\": \\\"/app-hx-weixin/v2/api-docs\\\",\\n        \\\"version\\\": \\\"2.0\\\"\\n    }\\n]\",\"comment\":\"整合swagger\",\"lineNum\":8,\"id\":9,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 22:55:00\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 22:59:22\"}}],\"deleteItems\":[]}', 'app-hx-zuul', 'default', 'application', null, '\0', 'apollo', '2020-07-02 22:59:23', 'apollo', '2020-07-02 22:59:23');
INSERT INTO `commit` VALUES ('4', '{\"createItems\":[{\"namespaceId\":3,\"key\":\"server.port\",\"value\":\"8300\",\"comment\":\"\",\"lineNum\":1,\"id\":10,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:07:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 23:07:25\"},{\"namespaceId\":3,\"key\":\"spring.application.name\",\"value\":\"app-hx-member\",\"comment\":\"\",\"lineNum\":2,\"id\":11,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:07:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 23:07:25\"},{\"namespaceId\":3,\"key\":\"eureka.client.service-url.defaultZone\",\"value\":\"http://localhost:8100/eureka\",\"comment\":\"\",\"lineNum\":3,\"id\":12,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:07:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 23:07:25\"},{\"namespaceId\":3,\"key\":\"swagger.base-package\",\"value\":\"com.hx.member.service\",\"comment\":\"\",\"lineNum\":4,\"id\":13,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:07:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 23:07:25\"},{\"namespaceId\":3,\"key\":\"swagger.title\",\"value\":\"SpringCloud2.x构建微服务电商项目-会员服务接口\",\"comment\":\"\",\"lineNum\":5,\"id\":14,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:07:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 23:07:25\"},{\"namespaceId\":3,\"key\":\"swagger.description\",\"value\":\"“基于SpringCloud2.x构建微服务电商项目”\",\"comment\":\"\",\"lineNum\":6,\"id\":15,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:07:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 23:07:25\"},{\"namespaceId\":3,\"key\":\"swagger.version\",\"value\":\"1.1\",\"comment\":\"\",\"lineNum\":7,\"id\":16,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:07:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 23:07:25\"},{\"namespaceId\":3,\"key\":\"swagger.terms-of-service-url\",\"value\":\"www.hx.com\",\"comment\":\"\",\"lineNum\":8,\"id\":17,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:07:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 23:07:25\"},{\"namespaceId\":3,\"key\":\"swagger.contact.name\",\"value\":\"hx\",\"comment\":\"\",\"lineNum\":9,\"id\":18,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:07:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 23:07:25\"},{\"namespaceId\":3,\"key\":\"swagger.contact.email\",\"value\":\"1635642612@qq.com\",\"comment\":\"\",\"lineNum\":10,\"id\":19,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:07:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 23:07:25\"}],\"updateItems\":[],\"deleteItems\":[]}', 'app-hx-member', 'default', 'application', null, '\0', 'apollo', '2020-07-02 23:07:26', 'apollo', '2020-07-02 23:07:26');
INSERT INTO `commit` VALUES ('5', '{\"createItems\":[{\"namespaceId\":4,\"key\":\"server.port\",\"value\":\"8200\",\"comment\":\"\",\"lineNum\":1,\"id\":20,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:11:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 23:11:14\"},{\"namespaceId\":4,\"key\":\"spring.application.name\",\"value\":\"app-hx-weixin\",\"comment\":\"\",\"lineNum\":2,\"id\":21,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:11:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 23:11:14\"},{\"namespaceId\":4,\"key\":\"eureka.client.service-url.defaultZone\",\"value\":\"http://localhost:8100/eureka\",\"comment\":\"\",\"lineNum\":3,\"id\":22,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:11:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 23:11:14\"},{\"namespaceId\":4,\"key\":\"swagger.base-package\",\"value\":\"com.hx.weixin.service\",\"comment\":\"\",\"lineNum\":4,\"id\":23,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:11:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 23:11:14\"},{\"namespaceId\":4,\"key\":\"swagger.title\",\"value\":\"SpringCloud2.x构建微服务电商项目-微信服务接口\",\"comment\":\"\",\"lineNum\":5,\"id\":24,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:11:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 23:11:14\"},{\"namespaceId\":4,\"key\":\"swagger.description\",\"value\":\"“基于SpringCloud2.x构建微服务电商项目”\",\"comment\":\"\",\"lineNum\":6,\"id\":25,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:11:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 23:11:14\"},{\"namespaceId\":4,\"key\":\"swagger.version\",\"value\":\"1.1\",\"comment\":\"\",\"lineNum\":7,\"id\":26,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:11:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 23:11:14\"},{\"namespaceId\":4,\"key\":\"swagger.terms-of-service-url\",\"value\":\"www.hx.com\",\"comment\":\"\",\"lineNum\":8,\"id\":27,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:11:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 23:11:14\"},{\"namespaceId\":4,\"key\":\"swagger.contact.name\",\"value\":\"hx\",\"comment\":\"\",\"lineNum\":9,\"id\":28,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:11:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 23:11:14\"},{\"namespaceId\":4,\"key\":\"swagger.contact.email\",\"value\":\"1635642612@qq.com\",\"comment\":\"\",\"lineNum\":10,\"id\":29,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:11:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 23:11:14\"}],\"updateItems\":[],\"deleteItems\":[]}', 'app-hx-weixin', 'default', 'application', null, '\0', 'apollo', '2020-07-02 23:11:15', 'apollo', '2020-07-02 23:11:15');
INSERT INTO `commit` VALUES ('6', '{\"createItems\":[],\"updateItems\":[],\"deleteItems\":[{\"namespaceId\":4,\"key\":\"swagger.description\",\"value\":\"“基于SpringCloud2.x构建微服务电商项目”\",\"comment\":\"\",\"lineNum\":6,\"id\":25,\"isDeleted\":true,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:11:15\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 23:59:58\"},{\"namespaceId\":4,\"key\":\"swagger.contact.name\",\"value\":\"hx\",\"comment\":\"\",\"lineNum\":9,\"id\":28,\"isDeleted\":true,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:11:15\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 23:59:58\"},{\"namespaceId\":4,\"key\":\"swagger.contact.email\",\"value\":\"1635642612@qq.com\",\"comment\":\"\",\"lineNum\":10,\"id\":29,\"isDeleted\":true,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:11:15\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 23:59:58\"},{\"namespaceId\":4,\"key\":\"swagger.terms-of-service-url\",\"value\":\"www.hx.com\",\"comment\":\"\",\"lineNum\":8,\"id\":27,\"isDeleted\":true,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:11:15\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 23:59:58\"},{\"namespaceId\":4,\"key\":\"swagger.base-package\",\"value\":\"com.hx.weixin.service\",\"comment\":\"\",\"lineNum\":4,\"id\":23,\"isDeleted\":true,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:11:15\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 23:59:58\"},{\"namespaceId\":4,\"key\":\"swagger.title\",\"value\":\"SpringCloud2.x构建微服务电商项目-微信服务接口\",\"comment\":\"\",\"lineNum\":5,\"id\":24,\"isDeleted\":true,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:11:15\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 23:59:58\"},{\"namespaceId\":4,\"key\":\"swagger.version\",\"value\":\"1.1\",\"comment\":\"\",\"lineNum\":7,\"id\":26,\"isDeleted\":true,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:11:15\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-02 23:59:58\"}]}', 'app-hx-weixin', 'default', 'application', null, '\0', 'apollo', '2020-07-02 23:59:59', 'apollo', '2020-07-02 23:59:59');
INSERT INTO `commit` VALUES ('7', '{\"createItems\":[],\"updateItems\":[],\"deleteItems\":[{\"namespaceId\":3,\"key\":\"swagger.description\",\"value\":\"“基于SpringCloud2.x构建微服务电商项目”\",\"comment\":\"\",\"lineNum\":6,\"id\":15,\"isDeleted\":true,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:07:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-03 00:00:23\"},{\"namespaceId\":3,\"key\":\"swagger.contact.name\",\"value\":\"hx\",\"comment\":\"\",\"lineNum\":9,\"id\":18,\"isDeleted\":true,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:07:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-03 00:00:23\"},{\"namespaceId\":3,\"key\":\"swagger.contact.email\",\"value\":\"1635642612@qq.com\",\"comment\":\"\",\"lineNum\":10,\"id\":19,\"isDeleted\":true,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:07:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-03 00:00:23\"},{\"namespaceId\":3,\"key\":\"swagger.terms-of-service-url\",\"value\":\"www.hx.com\",\"comment\":\"\",\"lineNum\":8,\"id\":17,\"isDeleted\":true,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:07:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-03 00:00:23\"},{\"namespaceId\":3,\"key\":\"swagger.base-package\",\"value\":\"com.hx.member.service\",\"comment\":\"\",\"lineNum\":4,\"id\":13,\"isDeleted\":true,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:07:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-03 00:00:23\"},{\"namespaceId\":3,\"key\":\"swagger.title\",\"value\":\"SpringCloud2.x构建微服务电商项目-会员服务接口\",\"comment\":\"\",\"lineNum\":5,\"id\":14,\"isDeleted\":true,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:07:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-03 00:00:23\"},{\"namespaceId\":3,\"key\":\"swagger.version\",\"value\":\"1.1\",\"comment\":\"\",\"lineNum\":7,\"id\":16,\"isDeleted\":true,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-02 23:07:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-03 00:00:23\"}]}', 'app-hx-member', 'default', 'application', null, '\0', 'apollo', '2020-07-03 00:00:24', 'apollo', '2020-07-03 00:00:24');
INSERT INTO `commit` VALUES ('8', '{\"createItems\":[{\"namespaceId\":5,\"key\":\"logging.level.org.springframework.web\",\"value\":\"INFO\",\"comment\":\"\",\"lineNum\":1,\"id\":30,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-08 22:44:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-08 22:44:02\"},{\"namespaceId\":5,\"key\":\"logging.level.com.github.binarywang.demo.wx.mp\",\"value\":\"DEBUG\",\"comment\":\"\",\"lineNum\":2,\"id\":31,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-08 22:44:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-08 22:44:02\"},{\"namespaceId\":5,\"key\":\"logging.level.me.chanjar.weixin\",\"value\":\"DEBUG\",\"comment\":\"\",\"lineNum\":3,\"id\":32,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-08 22:44:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-08 22:44:02\"},{\"namespaceId\":5,\"key\":\"wx.mp.configs[0].appId\",\"value\":\"wx5c43fde3c9733d9e\",\"comment\":\"\",\"lineNum\":4,\"id\":33,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-08 22:44:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-08 22:44:02\"},{\"namespaceId\":5,\"key\":\"wx.mp.configs[0].secret\",\"value\":\"b8b217126c33a5fb7074927d5e72a81a\",\"comment\":\"\",\"lineNum\":5,\"id\":34,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-08 22:44:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-08 22:44:02\"},{\"namespaceId\":5,\"key\":\"wx.mp.configs[0].token\",\"value\":\"hxapp\",\"comment\":\"\",\"lineNum\":6,\"id\":35,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-08 22:44:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-08 22:44:02\"},{\"namespaceId\":5,\"key\":\"mayikt.weixin.registration.code.message\",\"value\":\"您的注册码为:%s，期待你的加入，感谢！\",\"comment\":\"\",\"lineNum\":7,\"id\":36,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-08 22:44:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-08 22:44:02\"},{\"namespaceId\":5,\"key\":\"mayikt.weixin.default.registration.code.message\",\"value\":\"您的消息，我们已经收到,会及时回复给您的!\",\"comment\":\"\",\"lineNum\":8,\"id\":37,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-08 22:44:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-08 22:44:02\"},{\"namespaceId\":5,\"key\":\"spring.redis.host\",\"value\":\"112.74.182.160\",\"comment\":\"\",\"lineNum\":9,\"id\":38,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-08 22:44:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-08 22:44:02\"},{\"namespaceId\":5,\"key\":\"spring.redis.password\",\"value\":\"123456\",\"comment\":\"\",\"lineNum\":10,\"id\":39,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-08 22:44:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-08 22:44:02\"},{\"namespaceId\":5,\"key\":\"spring.redis.port\",\"value\":\"6379\",\"comment\":\"\",\"lineNum\":11,\"id\":40,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-08 22:44:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-08 22:44:02\"},{\"namespaceId\":5,\"key\":\"spring.redis.pool.max-idle\",\"value\":\"100\",\"comment\":\"\",\"lineNum\":12,\"id\":41,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-08 22:44:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-08 22:44:02\"},{\"namespaceId\":5,\"key\":\"spring.redis.pool.min-idle\",\"value\":\"1\",\"comment\":\"\",\"lineNum\":13,\"id\":42,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-08 22:44:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-08 22:44:02\"},{\"namespaceId\":5,\"key\":\"spring.redis.pool.max-active\",\"value\":\"1000\",\"comment\":\"\",\"lineNum\":14,\"id\":43,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-08 22:44:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-08 22:44:02\"},{\"namespaceId\":5,\"key\":\"spring.redis.pool.max-wait\",\"value\":\"-1\",\"comment\":\"\",\"lineNum\":15,\"id\":44,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-08 22:44:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-08 22:44:02\"},{\"namespaceId\":5,\"key\":\"spring.datasource.username\",\"value\":\"root\",\"comment\":\"\",\"lineNum\":16,\"id\":45,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-08 22:44:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-08 22:44:02\"},{\"namespaceId\":5,\"key\":\"spring.datasource.password\",\"value\":\"root\",\"comment\":\"\",\"lineNum\":17,\"id\":46,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-08 22:44:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-08 22:44:02\"},{\"namespaceId\":5,\"key\":\"spring.datasource.driver-class-name\",\"value\":\"com.mysql.jdbc.Driver\",\"comment\":\"\",\"lineNum\":18,\"id\":47,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-08 22:44:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-08 22:44:02\"},{\"namespaceId\":5,\"key\":\"spring.datasource.url\",\"value\":\"jdbc:mysql://127.0.0.1:3306/hx_weixin\",\"comment\":\"\",\"lineNum\":19,\"id\":48,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-08 22:44:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-08 22:44:02\"}],\"updateItems\":[],\"deleteItems\":[]}', 'app-hx-weixin', 'default', 'hx-weixin', null, '\0', 'apollo', '2020-07-08 22:44:03', 'apollo', '2020-07-08 22:44:03');

-- ----------------------------
-- Table structure for grayreleaserule
-- ----------------------------
DROP TABLE IF EXISTS `grayreleaserule`;
CREATE TABLE `grayreleaserule` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AppId` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Cluster Name',
  `NamespaceName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Namespace Name',
  `BranchName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'branch name',
  `Rules` varchar(16000) DEFAULT '[]' COMMENT '灰度规则',
  `ReleaseId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '灰度对应的release',
  `BranchStatus` tinyint(2) DEFAULT '1' COMMENT '灰度分支状态: 0:删除分支,1:正在使用的规则 2：全量发布',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Namespace` (`AppId`,`ClusterName`,`NamespaceName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='灰度规则表';

-- ----------------------------
-- Records of grayreleaserule
-- ----------------------------

-- ----------------------------
-- Table structure for instance
-- ----------------------------
DROP TABLE IF EXISTS `instance`;
CREATE TABLE `instance` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `DataCenter` varchar(64) NOT NULL DEFAULT 'default' COMMENT 'Data Center Name',
  `Ip` varchar(32) NOT NULL DEFAULT '' COMMENT 'instance ip',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_UNIQUE_KEY` (`AppId`,`ClusterName`,`Ip`,`DataCenter`),
  KEY `IX_IP` (`Ip`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='使用配置的应用实例';

-- ----------------------------
-- Records of instance
-- ----------------------------
INSERT INTO `instance` VALUES ('1', 'app-hx-zuul', 'default', '', '192.168.1.3', '2020-07-02 22:56:37', '2020-07-02 22:56:37');
INSERT INTO `instance` VALUES ('2', 'app-hx-member', 'default', '', '192.168.1.3', '2020-07-02 23:13:03', '2020-07-02 23:13:03');
INSERT INTO `instance` VALUES ('3', 'app-hx-weixin', 'default', '', '192.168.1.3', '2020-07-02 23:18:19', '2020-07-02 23:18:19');
INSERT INTO `instance` VALUES ('4', 'app-hx-zuul', 'default', '', '192.168.1.5', '2020-07-07 06:27:27', '2020-07-07 06:27:27');
INSERT INTO `instance` VALUES ('5', 'app-hx-weixin', 'default', '', '192.168.1.5', '2020-07-07 06:29:04', '2020-07-07 06:29:04');
INSERT INTO `instance` VALUES ('6', 'app-hx-member', 'default', '', '192.168.1.5', '2020-07-07 06:31:55', '2020-07-07 06:31:55');

-- ----------------------------
-- Table structure for instanceconfig
-- ----------------------------
DROP TABLE IF EXISTS `instanceconfig`;
CREATE TABLE `instanceconfig` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `InstanceId` int(11) unsigned DEFAULT NULL COMMENT 'Instance Id',
  `ConfigAppId` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Config App Id',
  `ConfigClusterName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Config Cluster Name',
  `ConfigNamespaceName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Config Namespace Name',
  `ReleaseKey` varchar(64) NOT NULL DEFAULT '' COMMENT '发布的Key',
  `ReleaseDeliveryTime` timestamp NULL DEFAULT NULL COMMENT '配置获取时间',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_UNIQUE_KEY` (`InstanceId`,`ConfigAppId`,`ConfigNamespaceName`),
  KEY `IX_ReleaseKey` (`ReleaseKey`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Valid_Namespace` (`ConfigAppId`,`ConfigClusterName`,`ConfigNamespaceName`,`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='应用实例的配置信息';

-- ----------------------------
-- Records of instanceconfig
-- ----------------------------
INSERT INTO `instanceconfig` VALUES ('1', '1', 'app-hx-zuul', 'default', 'application', '20200702225933-9cd13f3241ed377e', '2020-07-02 22:59:35', '2020-07-02 22:56:36', '2020-07-02 22:59:35');
INSERT INTO `instanceconfig` VALUES ('2', '2', 'app-hx-member', 'default', 'application', '20200703000028-42193f3241ed3782', '2020-07-03 00:04:18', '2020-07-02 23:13:02', '2020-07-03 00:04:19');
INSERT INTO `instanceconfig` VALUES ('3', '3', 'app-hx-weixin', 'default', 'application', '20200703000008-67e13f3241ed3781', '2020-07-03 00:00:08', '2020-07-02 23:18:19', '2020-07-03 00:00:09');
INSERT INTO `instanceconfig` VALUES ('4', '4', 'app-hx-zuul', 'default', 'application', '20200702225933-9cd13f3241ed377e', '2020-07-07 06:27:27', '2020-07-07 06:27:27', '2020-07-07 06:27:27');
INSERT INTO `instanceconfig` VALUES ('5', '5', 'app-hx-weixin', 'default', 'application', '20200703000008-67e13f3241ed3781', '2020-07-07 06:29:04', '2020-07-07 06:29:04', '2020-07-07 06:29:04');
INSERT INTO `instanceconfig` VALUES ('6', '6', 'app-hx-member', 'default', 'application', '20200703000028-42193f3241ed3782', '2020-07-07 06:31:54', '2020-07-07 06:31:54', '2020-07-07 06:31:54');

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `NamespaceId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '集群NamespaceId',
  `Key` varchar(128) NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Value` longtext NOT NULL COMMENT '配置项值',
  `Comment` varchar(1024) DEFAULT '' COMMENT '注释',
  `LineNum` int(10) unsigned DEFAULT '0' COMMENT '行号',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_GroupId` (`NamespaceId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COMMENT='配置项目';

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('1', '1', 'timeout', '100', 'sample timeout配置', '1', '\0', 'default', '2020-07-02 22:17:24', '', '2020-07-02 22:17:24');
INSERT INTO `item` VALUES ('2', '2', 'server.port', '80', '', '1', '\0', 'apollo', '2020-07-02 22:47:08', 'apollo', '2020-07-02 22:47:08');
INSERT INTO `item` VALUES ('3', '2', 'spring.application.name', 'app-hx-zuul', '', '2', '\0', 'apollo', '2020-07-02 22:47:08', 'apollo', '2020-07-02 22:59:23');
INSERT INTO `item` VALUES ('4', '2', 'eureka.client.service-url.defaultZone', 'http://localhost:8100/eureka', '', '3', '\0', 'apollo', '2020-07-02 22:47:08', 'apollo', '2020-07-02 22:47:08');
INSERT INTO `item` VALUES ('5', '2', 'zuul.routes.api-a.path', '/api-weixin/**', '', '4', '\0', 'apollo', '2020-07-02 22:47:08', 'apollo', '2020-07-02 22:47:08');
INSERT INTO `item` VALUES ('6', '2', 'zuul.routes.api-a.serviceId', 'app-hx-weixin', '', '5', '\0', 'apollo', '2020-07-02 22:47:08', 'apollo', '2020-07-02 22:59:23');
INSERT INTO `item` VALUES ('7', '2', 'zuul.routes.api-b.path', '/api-member/**', '', '6', '\0', 'apollo', '2020-07-02 22:47:08', 'apollo', '2020-07-02 22:47:08');
INSERT INTO `item` VALUES ('8', '2', 'zuul.routes.api-b.serviceId', 'app-hx-member', '', '7', '\0', 'apollo', '2020-07-02 22:47:08', 'apollo', '2020-07-02 22:59:23');
INSERT INTO `item` VALUES ('9', '2', 'hx.zuul.swagger.document', '[\n    {\n        \"name\": \"app-hx-member\",\n        \"location\": \"/app-hx-member/v2/api-docs\",\n        \"version\": \"2.0\"\n    },\n    {\n        \"name\": \"app-hx-weixin\",\n        \"location\": \"/app-hx-weixin/v2/api-docs\",\n        \"version\": \"2.0\"\n    }\n]', '整合swagger', '8', '\0', 'apollo', '2020-07-02 22:55:00', 'apollo', '2020-07-02 22:59:23');
INSERT INTO `item` VALUES ('10', '3', 'server.port', '8300', '', '1', '\0', 'apollo', '2020-07-02 23:07:25', 'apollo', '2020-07-02 23:07:25');
INSERT INTO `item` VALUES ('11', '3', 'spring.application.name', 'app-hx-member', '', '2', '\0', 'apollo', '2020-07-02 23:07:25', 'apollo', '2020-07-02 23:07:25');
INSERT INTO `item` VALUES ('12', '3', 'eureka.client.service-url.defaultZone', 'http://localhost:8100/eureka', '', '3', '\0', 'apollo', '2020-07-02 23:07:25', 'apollo', '2020-07-02 23:07:25');
INSERT INTO `item` VALUES ('13', '3', 'swagger.base-package', 'com.hx.member.service', '', '4', '', 'apollo', '2020-07-02 23:07:25', 'apollo', '2020-07-03 00:00:24');
INSERT INTO `item` VALUES ('14', '3', 'swagger.title', 'SpringCloud2.x构建微服务电商项目-会员服务接口', '', '5', '', 'apollo', '2020-07-02 23:07:25', 'apollo', '2020-07-03 00:00:24');
INSERT INTO `item` VALUES ('15', '3', 'swagger.description', '“基于SpringCloud2.x构建微服务电商项目”', '', '6', '', 'apollo', '2020-07-02 23:07:25', 'apollo', '2020-07-03 00:00:24');
INSERT INTO `item` VALUES ('16', '3', 'swagger.version', '1.1', '', '7', '', 'apollo', '2020-07-02 23:07:25', 'apollo', '2020-07-03 00:00:24');
INSERT INTO `item` VALUES ('17', '3', 'swagger.terms-of-service-url', 'www.hx.com', '', '8', '', 'apollo', '2020-07-02 23:07:25', 'apollo', '2020-07-03 00:00:24');
INSERT INTO `item` VALUES ('18', '3', 'swagger.contact.name', 'hx', '', '9', '', 'apollo', '2020-07-02 23:07:25', 'apollo', '2020-07-03 00:00:24');
INSERT INTO `item` VALUES ('19', '3', 'swagger.contact.email', '1635642612@qq.com', '', '10', '', 'apollo', '2020-07-02 23:07:25', 'apollo', '2020-07-03 00:00:24');
INSERT INTO `item` VALUES ('20', '4', 'server.port', '8200', '', '1', '\0', 'apollo', '2020-07-02 23:11:15', 'apollo', '2020-07-02 23:11:15');
INSERT INTO `item` VALUES ('21', '4', 'spring.application.name', 'app-hx-weixin', '', '2', '\0', 'apollo', '2020-07-02 23:11:15', 'apollo', '2020-07-02 23:11:15');
INSERT INTO `item` VALUES ('22', '4', 'eureka.client.service-url.defaultZone', 'http://localhost:8100/eureka', '', '3', '\0', 'apollo', '2020-07-02 23:11:15', 'apollo', '2020-07-02 23:11:15');
INSERT INTO `item` VALUES ('23', '4', 'swagger.base-package', 'com.hx.weixin.service', '', '4', '', 'apollo', '2020-07-02 23:11:15', 'apollo', '2020-07-02 23:59:59');
INSERT INTO `item` VALUES ('24', '4', 'swagger.title', 'SpringCloud2.x构建微服务电商项目-微信服务接口', '', '5', '', 'apollo', '2020-07-02 23:11:15', 'apollo', '2020-07-02 23:59:59');
INSERT INTO `item` VALUES ('25', '4', 'swagger.description', '“基于SpringCloud2.x构建微服务电商项目”', '', '6', '', 'apollo', '2020-07-02 23:11:15', 'apollo', '2020-07-02 23:59:59');
INSERT INTO `item` VALUES ('26', '4', 'swagger.version', '1.1', '', '7', '', 'apollo', '2020-07-02 23:11:15', 'apollo', '2020-07-02 23:59:59');
INSERT INTO `item` VALUES ('27', '4', 'swagger.terms-of-service-url', 'www.hx.com', '', '8', '', 'apollo', '2020-07-02 23:11:15', 'apollo', '2020-07-02 23:59:59');
INSERT INTO `item` VALUES ('28', '4', 'swagger.contact.name', 'hx', '', '9', '', 'apollo', '2020-07-02 23:11:15', 'apollo', '2020-07-02 23:59:59');
INSERT INTO `item` VALUES ('29', '4', 'swagger.contact.email', '1635642612@qq.com', '', '10', '', 'apollo', '2020-07-02 23:11:15', 'apollo', '2020-07-02 23:59:59');
INSERT INTO `item` VALUES ('30', '5', 'logging.level.org.springframework.web', 'INFO', '', '1', '\0', 'apollo', '2020-07-08 22:44:03', 'apollo', '2020-07-08 22:44:03');
INSERT INTO `item` VALUES ('31', '5', 'logging.level.com.github.binarywang.demo.wx.mp', 'DEBUG', '', '2', '\0', 'apollo', '2020-07-08 22:44:03', 'apollo', '2020-07-08 22:44:03');
INSERT INTO `item` VALUES ('32', '5', 'logging.level.me.chanjar.weixin', 'DEBUG', '', '3', '\0', 'apollo', '2020-07-08 22:44:03', 'apollo', '2020-07-08 22:44:03');
INSERT INTO `item` VALUES ('33', '5', 'wx.mp.configs[0].appId', 'wx5c43fde3c9733d9e', '', '4', '\0', 'apollo', '2020-07-08 22:44:03', 'apollo', '2020-07-08 22:44:03');
INSERT INTO `item` VALUES ('34', '5', 'wx.mp.configs[0].secret', 'b8b217126c33a5fb7074927d5e72a81a', '', '5', '\0', 'apollo', '2020-07-08 22:44:03', 'apollo', '2020-07-08 22:44:03');
INSERT INTO `item` VALUES ('35', '5', 'wx.mp.configs[0].token', 'hxapp', '', '6', '\0', 'apollo', '2020-07-08 22:44:03', 'apollo', '2020-07-08 22:44:03');
INSERT INTO `item` VALUES ('36', '5', 'mayikt.weixin.registration.code.message', '您的注册码为:%s，期待你的加入，感谢！', '', '7', '\0', 'apollo', '2020-07-08 22:44:03', 'apollo', '2020-07-08 22:44:03');
INSERT INTO `item` VALUES ('37', '5', 'mayikt.weixin.default.registration.code.message', '您的消息，我们已经收到,会及时回复给您的!', '', '8', '\0', 'apollo', '2020-07-08 22:44:03', 'apollo', '2020-07-08 22:44:03');
INSERT INTO `item` VALUES ('38', '5', 'spring.redis.host', '112.74.182.160', '', '9', '\0', 'apollo', '2020-07-08 22:44:03', 'apollo', '2020-07-08 22:44:03');
INSERT INTO `item` VALUES ('39', '5', 'spring.redis.password', '123456', '', '10', '\0', 'apollo', '2020-07-08 22:44:03', 'apollo', '2020-07-08 22:44:03');
INSERT INTO `item` VALUES ('40', '5', 'spring.redis.port', '6379', '', '11', '\0', 'apollo', '2020-07-08 22:44:03', 'apollo', '2020-07-08 22:44:03');
INSERT INTO `item` VALUES ('41', '5', 'spring.redis.pool.max-idle', '100', '', '12', '\0', 'apollo', '2020-07-08 22:44:03', 'apollo', '2020-07-08 22:44:03');
INSERT INTO `item` VALUES ('42', '5', 'spring.redis.pool.min-idle', '1', '', '13', '\0', 'apollo', '2020-07-08 22:44:03', 'apollo', '2020-07-08 22:44:03');
INSERT INTO `item` VALUES ('43', '5', 'spring.redis.pool.max-active', '1000', '', '14', '\0', 'apollo', '2020-07-08 22:44:03', 'apollo', '2020-07-08 22:44:03');
INSERT INTO `item` VALUES ('44', '5', 'spring.redis.pool.max-wait', '-1', '', '15', '\0', 'apollo', '2020-07-08 22:44:03', 'apollo', '2020-07-08 22:44:03');
INSERT INTO `item` VALUES ('45', '5', 'spring.datasource.username', 'root', '', '16', '\0', 'apollo', '2020-07-08 22:44:03', 'apollo', '2020-07-08 22:44:03');
INSERT INTO `item` VALUES ('46', '5', 'spring.datasource.password', 'root', '', '17', '\0', 'apollo', '2020-07-08 22:44:03', 'apollo', '2020-07-08 22:44:03');
INSERT INTO `item` VALUES ('47', '5', 'spring.datasource.driver-class-name', 'com.mysql.jdbc.Driver', '', '18', '\0', 'apollo', '2020-07-08 22:44:03', 'apollo', '2020-07-08 22:44:03');
INSERT INTO `item` VALUES ('48', '5', 'spring.datasource.url', 'jdbc:mysql://127.0.0.1:3306/hx_weixin', '', '19', '\0', 'apollo', '2020-07-08 22:44:03', 'apollo', '2020-07-08 22:44:03');

-- ----------------------------
-- Table structure for namespace
-- ----------------------------
DROP TABLE IF EXISTS `namespace`;
CREATE TABLE `namespace` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'Cluster Name',
  `NamespaceName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'Namespace Name',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId_ClusterName_NamespaceName` (`AppId`(191),`ClusterName`(191),`NamespaceName`(191)),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_NamespaceName` (`NamespaceName`(191))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='命名空间';

-- ----------------------------
-- Records of namespace
-- ----------------------------
INSERT INTO `namespace` VALUES ('1', 'SampleApp', 'default', 'application', '\0', 'default', '2020-07-02 22:17:24', '', '2020-07-02 22:17:24');
INSERT INTO `namespace` VALUES ('2', 'app-hx-zuul', 'default', 'application', '\0', 'apollo', '2020-07-02 22:18:24', 'apollo', '2020-07-02 22:18:24');
INSERT INTO `namespace` VALUES ('3', 'app-hx-member', 'default', 'application', '\0', 'apollo', '2020-07-02 23:06:45', 'apollo', '2020-07-02 23:06:45');
INSERT INTO `namespace` VALUES ('4', 'app-hx-weixin', 'default', 'application', '\0', 'apollo', '2020-07-02 23:10:59', 'apollo', '2020-07-02 23:10:59');
INSERT INTO `namespace` VALUES ('5', 'app-hx-weixin', 'default', 'hx-weixin', '\0', 'apollo', '2020-07-08 22:42:30', 'apollo', '2020-07-08 22:42:30');

-- ----------------------------
-- Table structure for namespacelock
-- ----------------------------
DROP TABLE IF EXISTS `namespacelock`;
CREATE TABLE `namespacelock` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `NamespaceId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '集群NamespaceId',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT 'default' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `IsDeleted` bit(1) DEFAULT b'0' COMMENT '软删除',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_NamespaceId` (`NamespaceId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='namespace的编辑锁';

-- ----------------------------
-- Records of namespacelock
-- ----------------------------

-- ----------------------------
-- Table structure for release
-- ----------------------------
DROP TABLE IF EXISTS `release`;
CREATE TABLE `release` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `ReleaseKey` varchar(64) NOT NULL DEFAULT '' COMMENT '发布的Key',
  `Name` varchar(64) NOT NULL DEFAULT 'default' COMMENT '发布名字',
  `Comment` varchar(256) DEFAULT NULL COMMENT '发布说明',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `Configurations` longtext NOT NULL COMMENT '发布配置',
  `IsAbandoned` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否废弃',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId_ClusterName_GroupName` (`AppId`(191),`ClusterName`(191),`NamespaceName`(191)),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_ReleaseKey` (`ReleaseKey`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='发布';

-- ----------------------------
-- Records of release
-- ----------------------------
INSERT INTO `release` VALUES ('1', '20161009155425-d3a0749c6e20bc15', '20161009155424-release', 'Sample发布', 'SampleApp', 'default', 'application', '{\"timeout\":\"100\"}', '\0', '\0', 'default', '2020-07-02 22:17:24', '', '2020-07-02 22:17:24');
INSERT INTO `release` VALUES ('2', '20200702224821-9cd13f3241ed377b', '20200702224810-release', '', 'app-hx-zuul', 'default', 'application', '{\"eureka.client.service-url.defaultZone\":\"http://localhost:8100/eureka\",\"zuul.routes.api-a.path\":\"/api-weixin/**\",\"spring.application.name\":\"app-mayikt-zuul\",\"server.port\":\"80\",\"zuul.routes.api-a.serviceId\":\"app-mayikt-weixin\",\"zuul.routes.api-b.path\":\"/api-member/**\",\"zuul.routes.api-b.serviceId\":\"app-mayikt-member\"}', '\0', '\0', 'apollo', '2020-07-02 22:48:21', 'apollo', '2020-07-02 22:48:21');
INSERT INTO `release` VALUES ('3', '20200702225548-9cd13f3241ed377c', '20200702225544-release', '', 'app-hx-zuul', 'default', 'application', '{\"hx.zuul.swagger.document\":\"[\\n    {\\n        \\\"name\\\": \\\"app-mayikt-member\\\",\\n        \\\"location\\\": \\\"/app-mayikt-member/v2/api-docs\\\",\\n        \\\"version\\\": \\\"2.0\\\"\\n    },\\n    {\\n        \\\"name\\\": \\\"app-mayikt-weixin\\\",\\n        \\\"location\\\": \\\"/app-mayikt-weixin/v2/api-docs\\\",\\n        \\\"version\\\": \\\"2.0\\\"\\n    }\\n]\",\"eureka.client.service-url.defaultZone\":\"http://localhost:8100/eureka\",\"zuul.routes.api-a.path\":\"/api-weixin/**\",\"spring.application.name\":\"app-mayikt-zuul\",\"server.port\":\"80\",\"zuul.routes.api-a.serviceId\":\"app-mayikt-weixin\",\"zuul.routes.api-b.path\":\"/api-member/**\",\"zuul.routes.api-b.serviceId\":\"app-mayikt-member\"}', '\0', '\0', 'apollo', '2020-07-02 22:55:48', 'apollo', '2020-07-02 22:55:48');
INSERT INTO `release` VALUES ('4', '20200702225928-9cd13f3241ed377d', '20200702225925-release', '', 'app-hx-zuul', 'default', 'application', '{\"hx.zuul.swagger.document\":\"[\\n    {\\n        \\\"name\\\": \\\"app-hx-member\\\",\\n        \\\"location\\\": \\\"/app-hx-member/v2/api-docs\\\",\\n        \\\"version\\\": \\\"2.0\\\"\\n    },\\n    {\\n        \\\"name\\\": \\\"app-hx-weixin\\\",\\n        \\\"location\\\": \\\"/app-hx-weixin/v2/api-docs\\\",\\n        \\\"version\\\": \\\"2.0\\\"\\n    }\\n]\",\"eureka.client.service-url.defaultZone\":\"http://localhost:8100/eureka\",\"zuul.routes.api-a.path\":\"/api-weixin/**\",\"spring.application.name\":\"app-hx-zuul\",\"server.port\":\"80\",\"zuul.routes.api-a.serviceId\":\"app-hx-weixin\",\"zuul.routes.api-b.path\":\"/api-member/**\",\"zuul.routes.api-b.serviceId\":\"app-hx-member\"}', '\0', '\0', 'apollo', '2020-07-02 22:59:28', 'apollo', '2020-07-02 22:59:28');
INSERT INTO `release` VALUES ('5', '20200702225933-9cd13f3241ed377e', '20200702225930-release', '', 'app-hx-zuul', 'default', 'application', '{\"hx.zuul.swagger.document\":\"[\\n    {\\n        \\\"name\\\": \\\"app-hx-member\\\",\\n        \\\"location\\\": \\\"/app-hx-member/v2/api-docs\\\",\\n        \\\"version\\\": \\\"2.0\\\"\\n    },\\n    {\\n        \\\"name\\\": \\\"app-hx-weixin\\\",\\n        \\\"location\\\": \\\"/app-hx-weixin/v2/api-docs\\\",\\n        \\\"version\\\": \\\"2.0\\\"\\n    }\\n]\",\"eureka.client.service-url.defaultZone\":\"http://localhost:8100/eureka\",\"zuul.routes.api-a.path\":\"/api-weixin/**\",\"spring.application.name\":\"app-hx-zuul\",\"server.port\":\"80\",\"zuul.routes.api-a.serviceId\":\"app-hx-weixin\",\"zuul.routes.api-b.path\":\"/api-member/**\",\"zuul.routes.api-b.serviceId\":\"app-hx-member\"}', '\0', '\0', 'apollo', '2020-07-02 22:59:34', 'apollo', '2020-07-02 22:59:34');
INSERT INTO `release` VALUES ('6', '20200702230732-42193f3241ed377f', '20200702230730-release', '', 'app-hx-member', 'default', 'application', '{\"swagger.description\":\"“基于SpringCloud2.x构建微服务电商项目”\",\"swagger.contact.name\":\"hx\",\"swagger.contact.email\":\"1635642612@qq.com\",\"eureka.client.service-url.defaultZone\":\"http://localhost:8100/eureka\",\"swagger.terms-of-service-url\":\"www.hx.com\",\"spring.application.name\":\"app-hx-member\",\"server.port\":\"8300\",\"swagger.base-package\":\"com.hx.member.service\",\"swagger.title\":\"SpringCloud2.x构建微服务电商项目-会员服务接口\",\"swagger.version\":\"1.1\"}', '\0', '\0', 'apollo', '2020-07-02 23:07:33', 'apollo', '2020-07-02 23:07:33');
INSERT INTO `release` VALUES ('7', '20200702231121-67e13f3241ed3780', '20200702231119-release', '', 'app-hx-weixin', 'default', 'application', '{\"swagger.description\":\"“基于SpringCloud2.x构建微服务电商项目”\",\"swagger.contact.name\":\"hx\",\"swagger.contact.email\":\"1635642612@qq.com\",\"eureka.client.service-url.defaultZone\":\"http://localhost:8100/eureka\",\"swagger.terms-of-service-url\":\"www.hx.com\",\"spring.application.name\":\"app-hx-weixin\",\"server.port\":\"8200\",\"swagger.base-package\":\"com.hx.weixin.service\",\"swagger.title\":\"SpringCloud2.x构建微服务电商项目-微信服务接口\",\"swagger.version\":\"1.1\"}', '\0', '\0', 'apollo', '2020-07-02 23:11:21', 'apollo', '2020-07-02 23:11:21');
INSERT INTO `release` VALUES ('8', '20200703000008-67e13f3241ed3781', '20200703000004-release', '', 'app-hx-weixin', 'default', 'application', '{\"eureka.client.service-url.defaultZone\":\"http://localhost:8100/eureka\",\"spring.application.name\":\"app-hx-weixin\",\"server.port\":\"8200\"}', '\0', '\0', 'apollo', '2020-07-03 00:00:08', 'apollo', '2020-07-03 00:00:08');
INSERT INTO `release` VALUES ('9', '20200703000028-42193f3241ed3782', '20200703000025-release', '', 'app-hx-member', 'default', 'application', '{\"eureka.client.service-url.defaultZone\":\"http://localhost:8100/eureka\",\"spring.application.name\":\"app-hx-member\",\"server.port\":\"8300\"}', '\0', '\0', 'apollo', '2020-07-03 00:00:28', 'apollo', '2020-07-03 00:00:28');

-- ----------------------------
-- Table structure for releasehistory
-- ----------------------------
DROP TABLE IF EXISTS `releasehistory`;
CREATE TABLE `releasehistory` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `BranchName` varchar(32) NOT NULL DEFAULT 'default' COMMENT '发布分支名',
  `ReleaseId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联的Release Id',
  `PreviousReleaseId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '前一次发布的ReleaseId',
  `Operation` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布类型，0: 普通发布，1: 回滚，2: 灰度发布，3: 灰度规则更新，4: 灰度合并回主分支发布，5: 主分支发布灰度自动发布，6: 主分支回滚灰度自动发布，7: 放弃灰度',
  `OperationContext` longtext NOT NULL COMMENT '发布上下文信息',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_Namespace` (`AppId`,`ClusterName`,`NamespaceName`,`BranchName`),
  KEY `IX_ReleaseId` (`ReleaseId`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='发布历史';

-- ----------------------------
-- Records of releasehistory
-- ----------------------------
INSERT INTO `releasehistory` VALUES ('1', 'SampleApp', 'default', 'application', 'default', '1', '0', '0', '{}', '\0', 'apollo', '2020-07-02 22:17:24', 'apollo', '2020-07-02 22:17:24');
INSERT INTO `releasehistory` VALUES ('2', 'app-hx-zuul', 'default', 'application', 'default', '2', '0', '0', '{\"isEmergencyPublish\":false}', '\0', 'apollo', '2020-07-02 22:48:21', 'apollo', '2020-07-02 22:48:21');
INSERT INTO `releasehistory` VALUES ('3', 'app-hx-zuul', 'default', 'application', 'default', '3', '2', '0', '{\"isEmergencyPublish\":false}', '\0', 'apollo', '2020-07-02 22:55:48', 'apollo', '2020-07-02 22:55:48');
INSERT INTO `releasehistory` VALUES ('4', 'app-hx-zuul', 'default', 'application', 'default', '4', '3', '0', '{\"isEmergencyPublish\":false}', '\0', 'apollo', '2020-07-02 22:59:28', 'apollo', '2020-07-02 22:59:28');
INSERT INTO `releasehistory` VALUES ('5', 'app-hx-zuul', 'default', 'application', 'default', '5', '4', '0', '{\"isEmergencyPublish\":false}', '\0', 'apollo', '2020-07-02 22:59:34', 'apollo', '2020-07-02 22:59:34');
INSERT INTO `releasehistory` VALUES ('6', 'app-hx-member', 'default', 'application', 'default', '6', '0', '0', '{\"isEmergencyPublish\":false}', '\0', 'apollo', '2020-07-02 23:07:33', 'apollo', '2020-07-02 23:07:33');
INSERT INTO `releasehistory` VALUES ('7', 'app-hx-weixin', 'default', 'application', 'default', '7', '0', '0', '{\"isEmergencyPublish\":false}', '\0', 'apollo', '2020-07-02 23:11:21', 'apollo', '2020-07-02 23:11:21');
INSERT INTO `releasehistory` VALUES ('8', 'app-hx-weixin', 'default', 'application', 'default', '8', '7', '0', '{\"isEmergencyPublish\":false}', '\0', 'apollo', '2020-07-03 00:00:08', 'apollo', '2020-07-03 00:00:08');
INSERT INTO `releasehistory` VALUES ('9', 'app-hx-member', 'default', 'application', 'default', '9', '6', '0', '{\"isEmergencyPublish\":false}', '\0', 'apollo', '2020-07-03 00:00:28', 'apollo', '2020-07-03 00:00:28');

-- ----------------------------
-- Table structure for releasemessage
-- ----------------------------
DROP TABLE IF EXISTS `releasemessage`;
CREATE TABLE `releasemessage` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Message` varchar(1024) NOT NULL DEFAULT '' COMMENT '发布的消息内容',
  `DataChange_LastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Message` (`Message`(191))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='发布消息';

-- ----------------------------
-- Records of releasemessage
-- ----------------------------
INSERT INTO `releasemessage` VALUES ('4', 'app-hx-zuul+default+application', '2020-07-02 22:59:34');
INSERT INTO `releasemessage` VALUES ('7', 'app-hx-weixin+default+application', '2020-07-03 00:00:08');
INSERT INTO `releasemessage` VALUES ('8', 'app-hx-member+default+application', '2020-07-03 00:00:28');

-- ----------------------------
-- Table structure for serverconfig
-- ----------------------------
DROP TABLE IF EXISTS `serverconfig`;
CREATE TABLE `serverconfig` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Key` varchar(64) NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Cluster` varchar(32) NOT NULL DEFAULT 'default' COMMENT '配置对应的集群，default为不针对特定的集群',
  `Value` varchar(2048) NOT NULL DEFAULT 'default' COMMENT '配置项值',
  `Comment` varchar(1024) DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_Key` (`Key`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='配置服务自身配置';

-- ----------------------------
-- Records of serverconfig
-- ----------------------------
INSERT INTO `serverconfig` VALUES ('1', 'eureka.service.url', 'default', 'http://localhost:8080/eureka/', 'Eureka服务Url，多个service以英文逗号分隔', '\0', 'default', '2020-07-02 22:17:24', '', '2020-07-02 22:17:24');
INSERT INTO `serverconfig` VALUES ('2', 'namespace.lock.switch', 'default', 'false', '一次发布只能有一个人修改开关', '\0', 'default', '2020-07-02 22:17:24', '', '2020-07-02 22:17:24');
INSERT INTO `serverconfig` VALUES ('3', 'item.value.length.limit', 'default', '20000', 'item value最大长度限制', '\0', 'default', '2020-07-02 22:17:24', '', '2020-07-02 22:17:24');
INSERT INTO `serverconfig` VALUES ('4', 'config-service.cache.enabled', 'default', 'false', 'ConfigService是否开启缓存，开启后能提高性能，但是会增大内存消耗！', '\0', 'default', '2020-07-02 22:17:24', '', '2020-07-02 22:17:24');
INSERT INTO `serverconfig` VALUES ('5', 'item.key.length.limit', 'default', '128', 'item key 最大长度限制', '\0', 'default', '2020-07-02 22:17:24', '', '2020-07-02 22:17:24');
