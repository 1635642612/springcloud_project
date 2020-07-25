/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50730
Source Host           : localhost:3306
Source Database       : apolloportaldb

Target Server Type    : MYSQL
Target Server Version : 50730
File Encoding         : 65001

Date: 2020-07-25 18:30:01
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
INSERT INTO `app` VALUES ('1', 'SampleApp', 'Sample App', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', '\0', 'default', '2020-07-02 22:17:54', '', '2020-07-02 22:17:54');
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
INSERT INTO `appnamespace` VALUES ('1', 'application', 'SampleApp', 'properties', '\0', 'default app namespace', '\0', '', '2020-07-02 22:17:54', '', '2020-07-02 22:17:54');
INSERT INTO `appnamespace` VALUES ('2', 'application', 'app-hx-zuul', 'properties', '\0', 'default app namespace', '\0', 'apollo', '2020-07-02 22:18:24', 'apollo', '2020-07-02 22:18:24');
INSERT INTO `appnamespace` VALUES ('3', 'application', 'app-hx-member', 'properties', '\0', 'default app namespace', '\0', 'apollo', '2020-07-02 23:06:44', 'apollo', '2020-07-02 23:06:44');
INSERT INTO `appnamespace` VALUES ('4', 'application', 'app-hx-weixin', 'properties', '\0', 'default app namespace', '\0', 'apollo', '2020-07-02 23:10:59', 'apollo', '2020-07-02 23:10:59');
INSERT INTO `appnamespace` VALUES ('5', 'hx-weixin', 'app-hx-weixin', 'properties', '\0', 'weixin配置文件', '\0', 'apollo', '2020-07-08 22:42:28', 'apollo', '2020-07-08 22:42:28');

-- ----------------------------
-- Table structure for authorities
-- ----------------------------
DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(50) NOT NULL,
  `Authority` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of authorities
-- ----------------------------
INSERT INTO `authorities` VALUES ('1', 'apollo', 'ROLE_user');

-- ----------------------------
-- Table structure for consumer
-- ----------------------------
DROP TABLE IF EXISTS `consumer`;
CREATE TABLE `consumer` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
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
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='开放API消费者';

-- ----------------------------
-- Records of consumer
-- ----------------------------

-- ----------------------------
-- Table structure for consumeraudit
-- ----------------------------
DROP TABLE IF EXISTS `consumeraudit`;
CREATE TABLE `consumeraudit` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) unsigned DEFAULT NULL COMMENT 'Consumer Id',
  `Uri` varchar(1024) NOT NULL DEFAULT '' COMMENT '访问的Uri',
  `Method` varchar(16) NOT NULL DEFAULT '' COMMENT '访问的Method',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_ConsumerId` (`ConsumerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='consumer审计表';

-- ----------------------------
-- Records of consumeraudit
-- ----------------------------

-- ----------------------------
-- Table structure for consumerrole
-- ----------------------------
DROP TABLE IF EXISTS `consumerrole`;
CREATE TABLE `consumerrole` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) unsigned DEFAULT NULL COMMENT 'Consumer Id',
  `RoleId` int(10) unsigned DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_RoleId` (`RoleId`),
  KEY `IX_ConsumerId_RoleId` (`ConsumerId`,`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='consumer和role的绑定表';

-- ----------------------------
-- Records of consumerrole
-- ----------------------------

-- ----------------------------
-- Table structure for consumertoken
-- ----------------------------
DROP TABLE IF EXISTS `consumertoken`;
CREATE TABLE `consumertoken` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) unsigned DEFAULT NULL COMMENT 'ConsumerId',
  `Token` varchar(128) NOT NULL DEFAULT '' COMMENT 'token',
  `Expires` datetime NOT NULL DEFAULT '2099-01-01 00:00:00' COMMENT 'token失效时间',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_Token` (`Token`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='consumer token表';

-- ----------------------------
-- Records of consumertoken
-- ----------------------------

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `UserId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '收藏的用户',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Position` int(32) NOT NULL DEFAULT '10000' COMMENT '收藏顺序',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId` (`AppId`(191)),
  KEY `IX_UserId` (`UserId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='应用收藏表';

-- ----------------------------
-- Records of favorite
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `PermissionType` varchar(32) NOT NULL DEFAULT '' COMMENT '权限类型',
  `TargetId` varchar(256) NOT NULL DEFAULT '' COMMENT '权限对象类型',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_TargetId_PermissionType` (`TargetId`(191),`PermissionType`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COMMENT='permission表';

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'CreateCluster', 'SampleApp', '\0', '', '2020-07-02 22:17:54', '', '2020-07-02 22:17:54');
INSERT INTO `permission` VALUES ('2', 'CreateNamespace', 'SampleApp', '\0', '', '2020-07-02 22:17:54', '', '2020-07-02 22:17:54');
INSERT INTO `permission` VALUES ('3', 'AssignRole', 'SampleApp', '\0', '', '2020-07-02 22:17:54', '', '2020-07-02 22:17:54');
INSERT INTO `permission` VALUES ('4', 'ModifyNamespace', 'SampleApp+application', '\0', '', '2020-07-02 22:17:54', '', '2020-07-02 22:17:54');
INSERT INTO `permission` VALUES ('5', 'ReleaseNamespace', 'SampleApp+application', '\0', '', '2020-07-02 22:17:54', '', '2020-07-02 22:17:54');
INSERT INTO `permission` VALUES ('6', 'CreateCluster', 'app-hx-zuul', '\0', 'apollo', '2020-07-02 22:18:24', 'apollo', '2020-07-02 22:18:24');
INSERT INTO `permission` VALUES ('7', 'CreateNamespace', 'app-hx-zuul', '\0', 'apollo', '2020-07-02 22:18:24', 'apollo', '2020-07-02 22:18:24');
INSERT INTO `permission` VALUES ('8', 'AssignRole', 'app-hx-zuul', '\0', 'apollo', '2020-07-02 22:18:24', 'apollo', '2020-07-02 22:18:24');
INSERT INTO `permission` VALUES ('9', 'ModifyNamespace', 'app-hx-zuul+application', '\0', 'apollo', '2020-07-02 22:18:24', 'apollo', '2020-07-02 22:18:24');
INSERT INTO `permission` VALUES ('10', 'ReleaseNamespace', 'app-hx-zuul+application', '\0', 'apollo', '2020-07-02 22:18:24', 'apollo', '2020-07-02 22:18:24');
INSERT INTO `permission` VALUES ('11', 'ModifyNamespace', 'app-hx-zuul+application+DEV', '\0', 'apollo', '2020-07-02 22:18:24', 'apollo', '2020-07-02 22:18:24');
INSERT INTO `permission` VALUES ('12', 'ReleaseNamespace', 'app-hx-zuul+application+DEV', '\0', 'apollo', '2020-07-02 22:18:24', 'apollo', '2020-07-02 22:18:24');
INSERT INTO `permission` VALUES ('13', 'CreateCluster', 'app-hx-member', '\0', 'apollo', '2020-07-02 23:06:44', 'apollo', '2020-07-02 23:06:44');
INSERT INTO `permission` VALUES ('14', 'CreateNamespace', 'app-hx-member', '\0', 'apollo', '2020-07-02 23:06:44', 'apollo', '2020-07-02 23:06:44');
INSERT INTO `permission` VALUES ('15', 'AssignRole', 'app-hx-member', '\0', 'apollo', '2020-07-02 23:06:44', 'apollo', '2020-07-02 23:06:44');
INSERT INTO `permission` VALUES ('16', 'ModifyNamespace', 'app-hx-member+application', '\0', 'apollo', '2020-07-02 23:06:45', 'apollo', '2020-07-02 23:06:45');
INSERT INTO `permission` VALUES ('17', 'ReleaseNamespace', 'app-hx-member+application', '\0', 'apollo', '2020-07-02 23:06:45', 'apollo', '2020-07-02 23:06:45');
INSERT INTO `permission` VALUES ('18', 'ModifyNamespace', 'app-hx-member+application+DEV', '\0', 'apollo', '2020-07-02 23:06:45', 'apollo', '2020-07-02 23:06:45');
INSERT INTO `permission` VALUES ('19', 'ReleaseNamespace', 'app-hx-member+application+DEV', '\0', 'apollo', '2020-07-02 23:06:45', 'apollo', '2020-07-02 23:06:45');
INSERT INTO `permission` VALUES ('20', 'CreateCluster', 'app-hx-weixin', '\0', 'apollo', '2020-07-02 23:10:59', 'apollo', '2020-07-02 23:10:59');
INSERT INTO `permission` VALUES ('21', 'CreateNamespace', 'app-hx-weixin', '\0', 'apollo', '2020-07-02 23:10:59', 'apollo', '2020-07-02 23:10:59');
INSERT INTO `permission` VALUES ('22', 'AssignRole', 'app-hx-weixin', '\0', 'apollo', '2020-07-02 23:10:59', 'apollo', '2020-07-02 23:10:59');
INSERT INTO `permission` VALUES ('23', 'ModifyNamespace', 'app-hx-weixin+application', '\0', 'apollo', '2020-07-02 23:10:59', 'apollo', '2020-07-02 23:10:59');
INSERT INTO `permission` VALUES ('24', 'ReleaseNamespace', 'app-hx-weixin+application', '\0', 'apollo', '2020-07-02 23:10:59', 'apollo', '2020-07-02 23:10:59');
INSERT INTO `permission` VALUES ('25', 'ModifyNamespace', 'app-hx-weixin+application+DEV', '\0', 'apollo', '2020-07-02 23:10:59', 'apollo', '2020-07-02 23:10:59');
INSERT INTO `permission` VALUES ('26', 'ReleaseNamespace', 'app-hx-weixin+application+DEV', '\0', 'apollo', '2020-07-02 23:10:59', 'apollo', '2020-07-02 23:10:59');
INSERT INTO `permission` VALUES ('27', 'ModifyNamespace', 'app-hx-weixin+hx-weixin', '\0', 'apollo', '2020-07-08 22:42:29', 'apollo', '2020-07-08 22:42:29');
INSERT INTO `permission` VALUES ('28', 'ReleaseNamespace', 'app-hx-weixin+hx-weixin', '\0', 'apollo', '2020-07-08 22:42:29', 'apollo', '2020-07-08 22:42:29');
INSERT INTO `permission` VALUES ('29', 'ModifyNamespace', 'app-hx-weixin+hx-weixin+DEV', '\0', 'apollo', '2020-07-08 22:42:29', 'apollo', '2020-07-08 22:42:29');
INSERT INTO `permission` VALUES ('30', 'ReleaseNamespace', 'app-hx-weixin+hx-weixin+DEV', '\0', 'apollo', '2020-07-08 22:42:29', 'apollo', '2020-07-08 22:42:29');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleName` varchar(256) NOT NULL DEFAULT '' COMMENT 'Role name',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_RoleName` (`RoleName`(191)),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'Master+SampleApp', '\0', 'default', '2020-07-02 22:17:54', '', '2020-07-02 22:17:54');
INSERT INTO `role` VALUES ('2', 'ModifyNamespace+SampleApp+application', '\0', 'default', '2020-07-02 22:17:54', '', '2020-07-02 22:17:54');
INSERT INTO `role` VALUES ('3', 'ReleaseNamespace+SampleApp+application', '\0', 'default', '2020-07-02 22:17:54', '', '2020-07-02 22:17:54');
INSERT INTO `role` VALUES ('4', 'Master+app-hx-zuul', '\0', 'apollo', '2020-07-02 22:18:24', 'apollo', '2020-07-02 22:18:24');
INSERT INTO `role` VALUES ('5', 'ModifyNamespace+app-hx-zuul+application', '\0', 'apollo', '2020-07-02 22:18:24', 'apollo', '2020-07-02 22:18:24');
INSERT INTO `role` VALUES ('6', 'ReleaseNamespace+app-hx-zuul+application', '\0', 'apollo', '2020-07-02 22:18:24', 'apollo', '2020-07-02 22:18:24');
INSERT INTO `role` VALUES ('7', 'ModifyNamespace+app-hx-zuul+application+DEV', '\0', 'apollo', '2020-07-02 22:18:24', 'apollo', '2020-07-02 22:18:24');
INSERT INTO `role` VALUES ('8', 'ReleaseNamespace+app-hx-zuul+application+DEV', '\0', 'apollo', '2020-07-02 22:18:24', 'apollo', '2020-07-02 22:18:24');
INSERT INTO `role` VALUES ('9', 'Master+app-hx-member', '\0', 'apollo', '2020-07-02 23:06:44', 'apollo', '2020-07-02 23:06:44');
INSERT INTO `role` VALUES ('10', 'ModifyNamespace+app-hx-member+application', '\0', 'apollo', '2020-07-02 23:06:45', 'apollo', '2020-07-02 23:06:45');
INSERT INTO `role` VALUES ('11', 'ReleaseNamespace+app-hx-member+application', '\0', 'apollo', '2020-07-02 23:06:45', 'apollo', '2020-07-02 23:06:45');
INSERT INTO `role` VALUES ('12', 'ModifyNamespace+app-hx-member+application+DEV', '\0', 'apollo', '2020-07-02 23:06:45', 'apollo', '2020-07-02 23:06:45');
INSERT INTO `role` VALUES ('13', 'ReleaseNamespace+app-hx-member+application+DEV', '\0', 'apollo', '2020-07-02 23:06:45', 'apollo', '2020-07-02 23:06:45');
INSERT INTO `role` VALUES ('14', 'Master+app-hx-weixin', '\0', 'apollo', '2020-07-02 23:10:59', 'apollo', '2020-07-02 23:10:59');
INSERT INTO `role` VALUES ('15', 'ModifyNamespace+app-hx-weixin+application', '\0', 'apollo', '2020-07-02 23:10:59', 'apollo', '2020-07-02 23:10:59');
INSERT INTO `role` VALUES ('16', 'ReleaseNamespace+app-hx-weixin+application', '\0', 'apollo', '2020-07-02 23:10:59', 'apollo', '2020-07-02 23:10:59');
INSERT INTO `role` VALUES ('17', 'ModifyNamespace+app-hx-weixin+application+DEV', '\0', 'apollo', '2020-07-02 23:10:59', 'apollo', '2020-07-02 23:10:59');
INSERT INTO `role` VALUES ('18', 'ReleaseNamespace+app-hx-weixin+application+DEV', '\0', 'apollo', '2020-07-02 23:10:59', 'apollo', '2020-07-02 23:10:59');
INSERT INTO `role` VALUES ('19', 'ModifyNamespace+app-hx-weixin+hx-weixin', '\0', 'apollo', '2020-07-08 22:42:29', 'apollo', '2020-07-08 22:42:29');
INSERT INTO `role` VALUES ('20', 'ReleaseNamespace+app-hx-weixin+hx-weixin', '\0', 'apollo', '2020-07-08 22:42:29', 'apollo', '2020-07-08 22:42:29');
INSERT INTO `role` VALUES ('21', 'ModifyNamespace+app-hx-weixin+hx-weixin+DEV', '\0', 'apollo', '2020-07-08 22:42:29', 'apollo', '2020-07-08 22:42:29');
INSERT INTO `role` VALUES ('22', 'ReleaseNamespace+app-hx-weixin+hx-weixin+DEV', '\0', 'apollo', '2020-07-08 22:42:29', 'apollo', '2020-07-08 22:42:29');

-- ----------------------------
-- Table structure for rolepermission
-- ----------------------------
DROP TABLE IF EXISTS `rolepermission`;
CREATE TABLE `rolepermission` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleId` int(10) unsigned DEFAULT NULL COMMENT 'Role Id',
  `PermissionId` int(10) unsigned DEFAULT NULL COMMENT 'Permission Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_RoleId` (`RoleId`),
  KEY `IX_PermissionId` (`PermissionId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COMMENT='角色和权限的绑定表';

-- ----------------------------
-- Records of rolepermission
-- ----------------------------
INSERT INTO `rolepermission` VALUES ('1', '1', '1', '\0', '', '2020-07-02 22:17:54', '', '2020-07-02 22:17:54');
INSERT INTO `rolepermission` VALUES ('2', '1', '2', '\0', '', '2020-07-02 22:17:54', '', '2020-07-02 22:17:54');
INSERT INTO `rolepermission` VALUES ('3', '1', '3', '\0', '', '2020-07-02 22:17:54', '', '2020-07-02 22:17:54');
INSERT INTO `rolepermission` VALUES ('4', '2', '4', '\0', '', '2020-07-02 22:17:54', '', '2020-07-02 22:17:54');
INSERT INTO `rolepermission` VALUES ('5', '3', '5', '\0', '', '2020-07-02 22:17:54', '', '2020-07-02 22:17:54');
INSERT INTO `rolepermission` VALUES ('6', '4', '6', '\0', 'apollo', '2020-07-02 22:18:24', 'apollo', '2020-07-02 22:18:24');
INSERT INTO `rolepermission` VALUES ('7', '4', '7', '\0', 'apollo', '2020-07-02 22:18:24', 'apollo', '2020-07-02 22:18:24');
INSERT INTO `rolepermission` VALUES ('8', '4', '8', '\0', 'apollo', '2020-07-02 22:18:24', 'apollo', '2020-07-02 22:18:24');
INSERT INTO `rolepermission` VALUES ('9', '5', '9', '\0', 'apollo', '2020-07-02 22:18:24', 'apollo', '2020-07-02 22:18:24');
INSERT INTO `rolepermission` VALUES ('10', '6', '10', '\0', 'apollo', '2020-07-02 22:18:24', 'apollo', '2020-07-02 22:18:24');
INSERT INTO `rolepermission` VALUES ('11', '7', '11', '\0', 'apollo', '2020-07-02 22:18:24', 'apollo', '2020-07-02 22:18:24');
INSERT INTO `rolepermission` VALUES ('12', '8', '12', '\0', 'apollo', '2020-07-02 22:18:24', 'apollo', '2020-07-02 22:18:24');
INSERT INTO `rolepermission` VALUES ('13', '9', '13', '\0', 'apollo', '2020-07-02 23:06:44', 'apollo', '2020-07-02 23:06:44');
INSERT INTO `rolepermission` VALUES ('14', '9', '14', '\0', 'apollo', '2020-07-02 23:06:45', 'apollo', '2020-07-02 23:06:45');
INSERT INTO `rolepermission` VALUES ('15', '9', '15', '\0', 'apollo', '2020-07-02 23:06:45', 'apollo', '2020-07-02 23:06:45');
INSERT INTO `rolepermission` VALUES ('16', '10', '16', '\0', 'apollo', '2020-07-02 23:06:45', 'apollo', '2020-07-02 23:06:45');
INSERT INTO `rolepermission` VALUES ('17', '11', '17', '\0', 'apollo', '2020-07-02 23:06:45', 'apollo', '2020-07-02 23:06:45');
INSERT INTO `rolepermission` VALUES ('18', '12', '18', '\0', 'apollo', '2020-07-02 23:06:45', 'apollo', '2020-07-02 23:06:45');
INSERT INTO `rolepermission` VALUES ('19', '13', '19', '\0', 'apollo', '2020-07-02 23:06:45', 'apollo', '2020-07-02 23:06:45');
INSERT INTO `rolepermission` VALUES ('20', '14', '20', '\0', 'apollo', '2020-07-02 23:10:59', 'apollo', '2020-07-02 23:10:59');
INSERT INTO `rolepermission` VALUES ('21', '14', '21', '\0', 'apollo', '2020-07-02 23:10:59', 'apollo', '2020-07-02 23:10:59');
INSERT INTO `rolepermission` VALUES ('22', '14', '22', '\0', 'apollo', '2020-07-02 23:10:59', 'apollo', '2020-07-02 23:10:59');
INSERT INTO `rolepermission` VALUES ('23', '15', '23', '\0', 'apollo', '2020-07-02 23:10:59', 'apollo', '2020-07-02 23:10:59');
INSERT INTO `rolepermission` VALUES ('24', '16', '24', '\0', 'apollo', '2020-07-02 23:10:59', 'apollo', '2020-07-02 23:10:59');
INSERT INTO `rolepermission` VALUES ('25', '17', '25', '\0', 'apollo', '2020-07-02 23:10:59', 'apollo', '2020-07-02 23:10:59');
INSERT INTO `rolepermission` VALUES ('26', '18', '26', '\0', 'apollo', '2020-07-02 23:10:59', 'apollo', '2020-07-02 23:10:59');
INSERT INTO `rolepermission` VALUES ('27', '19', '27', '\0', 'apollo', '2020-07-08 22:42:29', 'apollo', '2020-07-08 22:42:29');
INSERT INTO `rolepermission` VALUES ('28', '20', '28', '\0', 'apollo', '2020-07-08 22:42:29', 'apollo', '2020-07-08 22:42:29');
INSERT INTO `rolepermission` VALUES ('29', '21', '29', '\0', 'apollo', '2020-07-08 22:42:29', 'apollo', '2020-07-08 22:42:29');
INSERT INTO `rolepermission` VALUES ('30', '22', '30', '\0', 'apollo', '2020-07-08 22:42:29', 'apollo', '2020-07-08 22:42:29');

-- ----------------------------
-- Table structure for serverconfig
-- ----------------------------
DROP TABLE IF EXISTS `serverconfig`;
CREATE TABLE `serverconfig` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Key` varchar(64) NOT NULL DEFAULT 'default' COMMENT '配置项Key',
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='配置服务自身配置';

-- ----------------------------
-- Records of serverconfig
-- ----------------------------
INSERT INTO `serverconfig` VALUES ('1', 'apollo.portal.envs', 'dev', '可支持的环境列表', '\0', 'default', '2020-07-02 22:17:53', '', '2020-07-02 22:17:53');
INSERT INTO `serverconfig` VALUES ('2', 'organizations', '[{\"orgId\":\"TEST1\",\"orgName\":\"样例部门1\"},{\"orgId\":\"TEST2\",\"orgName\":\"样例部门2\"}]', '部门列表', '\0', 'default', '2020-07-02 22:17:53', '', '2020-07-02 22:17:53');
INSERT INTO `serverconfig` VALUES ('3', 'superAdmin', 'apollo', 'Portal超级管理员', '\0', 'default', '2020-07-02 22:17:53', '', '2020-07-02 22:17:53');
INSERT INTO `serverconfig` VALUES ('4', 'api.readTimeout', '10000', 'http接口read timeout', '\0', 'default', '2020-07-02 22:17:53', '', '2020-07-02 22:17:53');
INSERT INTO `serverconfig` VALUES ('5', 'consumer.token.salt', 'someSalt', 'consumer token salt', '\0', 'default', '2020-07-02 22:17:53', '', '2020-07-02 22:17:53');
INSERT INTO `serverconfig` VALUES ('6', 'admin.createPrivateNamespace.switch', 'true', '是否允许项目管理员创建私有namespace', '\0', 'default', '2020-07-02 22:17:53', '', '2020-07-02 22:17:53');

-- ----------------------------
-- Table structure for userrole
-- ----------------------------
DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `UserId` varchar(128) DEFAULT '' COMMENT '用户身份标识',
  `RoleId` int(10) unsigned DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_RoleId` (`RoleId`),
  KEY `IX_UserId_RoleId` (`UserId`,`RoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='用户和role的绑定表';

-- ----------------------------
-- Records of userrole
-- ----------------------------
INSERT INTO `userrole` VALUES ('1', 'apollo', '1', '\0', '', '2020-07-02 22:17:54', '', '2020-07-02 22:17:54');
INSERT INTO `userrole` VALUES ('2', 'apollo', '2', '\0', '', '2020-07-02 22:17:54', '', '2020-07-02 22:17:54');
INSERT INTO `userrole` VALUES ('3', 'apollo', '3', '\0', '', '2020-07-02 22:17:54', '', '2020-07-02 22:17:54');
INSERT INTO `userrole` VALUES ('4', 'apollo', '4', '\0', 'apollo', '2020-07-02 22:18:24', 'apollo', '2020-07-02 22:18:24');
INSERT INTO `userrole` VALUES ('5', 'apollo', '5', '\0', 'apollo', '2020-07-02 22:18:24', 'apollo', '2020-07-02 22:18:24');
INSERT INTO `userrole` VALUES ('6', 'apollo', '6', '\0', 'apollo', '2020-07-02 22:18:24', 'apollo', '2020-07-02 22:18:24');
INSERT INTO `userrole` VALUES ('7', 'apollo', '9', '\0', 'apollo', '2020-07-02 23:06:45', 'apollo', '2020-07-02 23:06:45');
INSERT INTO `userrole` VALUES ('8', 'apollo', '10', '\0', 'apollo', '2020-07-02 23:06:45', 'apollo', '2020-07-02 23:06:45');
INSERT INTO `userrole` VALUES ('9', 'apollo', '11', '\0', 'apollo', '2020-07-02 23:06:45', 'apollo', '2020-07-02 23:06:45');
INSERT INTO `userrole` VALUES ('10', 'apollo', '14', '\0', 'apollo', '2020-07-02 23:10:59', 'apollo', '2020-07-02 23:10:59');
INSERT INTO `userrole` VALUES ('11', 'apollo', '15', '\0', 'apollo', '2020-07-02 23:10:59', 'apollo', '2020-07-02 23:10:59');
INSERT INTO `userrole` VALUES ('12', 'apollo', '16', '\0', 'apollo', '2020-07-02 23:10:59', 'apollo', '2020-07-02 23:10:59');
INSERT INTO `userrole` VALUES ('13', 'apollo', '19', '\0', 'apollo', '2020-07-08 22:42:29', 'apollo', '2020-07-08 22:42:29');
INSERT INTO `userrole` VALUES ('14', 'apollo', '20', '\0', 'apollo', '2020-07-08 22:42:30', 'apollo', '2020-07-08 22:42:30');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(64) NOT NULL DEFAULT 'default' COMMENT '用户名',
  `Password` varchar(64) NOT NULL DEFAULT 'default' COMMENT '密码',
  `Email` varchar(64) NOT NULL DEFAULT 'default' COMMENT '邮箱地址',
  `Enabled` tinyint(4) DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'apollo', '$2a$10$7r20uS.BQ9uBpf3Baj3uQOZvMVvB1RN3PYoKE94gtz2.WAOuiiwXS', 'apollo@acme.com', '1');
