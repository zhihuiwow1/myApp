/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost
 Source Database       : app

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : utf-8

 Date: 02/24/2018 19:25:59 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `DATABASECHANGELOG`
-- ----------------------------
DROP TABLE IF EXISTS `DATABASECHANGELOG`;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `DATABASECHANGELOG`
-- ----------------------------
BEGIN;
INSERT INTO `DATABASECHANGELOG` VALUES ('00000000000001', 'jhipster', 'config/liquibase/changelog/00000000000000_initial_schema.xml', '2018-02-23 19:41:50', '1', 'EXECUTED', '7:43e557851ab2b6fd02e74f54868dc67d', 'createTable tableName=jhi_user; createIndex indexName=idx_user_login, tableName=jhi_user; createIndex indexName=idx_user_email, tableName=jhi_user; createTable tableName=jhi_authority; createTable tableName=jhi_user_authority; addPrimaryKey tableN...', '', null, '3.5.3', null, null, '9386110245');
COMMIT;

-- ----------------------------
--  Table structure for `DATABASECHANGELOGLOCK`
-- ----------------------------
DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `DATABASECHANGELOGLOCK`
-- ----------------------------
BEGIN;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES ('1', b'1', '2018-02-24 15:36:44', '192.168.1.23 (192.168.1.23)');
COMMIT;

-- ----------------------------
--  Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `num` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `book`
-- ----------------------------
BEGIN;
INSERT INTO `book` VALUES ('2', 'b', '2'), ('3', 'bb', '1');
COMMIT;

-- ----------------------------
--  Table structure for `car`
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `car`
-- ----------------------------
BEGIN;
INSERT INTO `car` VALUES ('1', 'aaa', 'aa'), ('2', 'bbb', 'bbb'), ('3', 'ccc', '444');
COMMIT;

-- ----------------------------
--  Table structure for `jhi_authority`
-- ----------------------------
DROP TABLE IF EXISTS `jhi_authority`;
CREATE TABLE `jhi_authority` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `jhi_authority`
-- ----------------------------
BEGIN;
INSERT INTO `jhi_authority` VALUES ('ROLE_ADMIN'), ('ROLE_USER');
COMMIT;

-- ----------------------------
--  Table structure for `jhi_persistent_audit_event`
-- ----------------------------
DROP TABLE IF EXISTS `jhi_persistent_audit_event`;
CREATE TABLE `jhi_persistent_audit_event` (
  `event_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `principal` varchar(50) NOT NULL,
  `event_date` timestamp NULL DEFAULT NULL,
  `event_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `idx_persistent_audit_event` (`principal`,`event_date`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `jhi_persistent_audit_event`
-- ----------------------------
BEGIN;
INSERT INTO `jhi_persistent_audit_event` VALUES ('1', 'admin', '2018-02-23 19:42:57', 'AUTHENTICATION_SUCCESS'), ('2', 'admin', '2018-02-24 09:30:20', 'AUTHENTICATION_SUCCESS'), ('3', 'admin', '2018-02-24 14:03:19', 'AUTHENTICATION_SUCCESS'), ('4', 'zzh', '2018-02-24 14:16:28', 'AUTHENTICATION_SUCCESS'), ('5', 'zzh', '2018-02-24 15:21:52', 'AUTHENTICATION_SUCCESS'), ('6', 'zzh', '2018-02-24 15:50:17', 'AUTHENTICATION_SUCCESS'), ('7', 'zzh', '2018-02-24 16:56:54', 'AUTHENTICATION_SUCCESS'), ('8', 'zzh', '2018-02-24 17:19:03', 'AUTHENTICATION_SUCCESS'), ('9', 'zzh', '2018-02-24 17:31:49', 'AUTHENTICATION_SUCCESS'), ('10', 'zzh', '2018-02-24 17:56:42', 'AUTHENTICATION_FAILURE'), ('11', 'zzh', '2018-02-24 17:56:46', 'AUTHENTICATION_SUCCESS'), ('12', 'zzh', '2018-02-24 17:59:37', 'AUTHENTICATION_SUCCESS');
COMMIT;

-- ----------------------------
--  Table structure for `jhi_persistent_audit_evt_data`
-- ----------------------------
DROP TABLE IF EXISTS `jhi_persistent_audit_evt_data`;
CREATE TABLE `jhi_persistent_audit_evt_data` (
  `event_id` bigint(20) NOT NULL,
  `name` varchar(150) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_id`,`name`),
  KEY `idx_persistent_audit_evt_data` (`event_id`),
  CONSTRAINT `fk_evt_pers_audit_evt_data` FOREIGN KEY (`event_id`) REFERENCES `jhi_persistent_audit_event` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `jhi_persistent_audit_evt_data`
-- ----------------------------
BEGIN;
INSERT INTO `jhi_persistent_audit_evt_data` VALUES ('1', 'remoteAddress', '0:0:0:0:0:0:0:1'), ('2', 'remoteAddress', '0:0:0:0:0:0:0:1'), ('3', 'remoteAddress', '0:0:0:0:0:0:0:1'), ('4', 'remoteAddress', '127.0.0.1'), ('5', 'remoteAddress', '127.0.0.1'), ('6', 'remoteAddress', '127.0.0.1'), ('7', 'remoteAddress', '127.0.0.1'), ('8', 'remoteAddress', '127.0.0.1'), ('9', 'remoteAddress', '127.0.0.1'), ('10', 'message', 'Bad credentials'), ('10', 'remoteAddress', '127.0.0.1'), ('10', 'type', 'org.springframework.security.authentication.BadCredentialsException'), ('11', 'remoteAddress', '127.0.0.1'), ('12', 'remoteAddress', '127.0.0.1');
COMMIT;

-- ----------------------------
--  Table structure for `jhi_persistent_token`
-- ----------------------------
DROP TABLE IF EXISTS `jhi_persistent_token`;
CREATE TABLE `jhi_persistent_token` (
  `series` varchar(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `token_value` varchar(20) NOT NULL,
  `token_date` date DEFAULT NULL,
  `ip_address` varchar(39) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`series`),
  KEY `fk_user_persistent_token` (`user_id`),
  CONSTRAINT `fk_user_persistent_token` FOREIGN KEY (`user_id`) REFERENCES `jhi_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `jhi_user`
-- ----------------------------
DROP TABLE IF EXISTS `jhi_user`;
CREATE TABLE `jhi_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `password_hash` varchar(60) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `image_url` varchar(256) DEFAULT NULL,
  `activated` bit(1) NOT NULL,
  `lang_key` varchar(6) DEFAULT NULL,
  `activation_key` varchar(20) DEFAULT NULL,
  `reset_key` varchar(20) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL,
  `reset_date` timestamp NULL DEFAULT NULL,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_user_login` (`login`),
  UNIQUE KEY `idx_user_login` (`login`),
  UNIQUE KEY `ux_user_email` (`email`),
  UNIQUE KEY `idx_user_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `jhi_user`
-- ----------------------------
BEGIN;
INSERT INTO `jhi_user` VALUES ('1', 'system', '$2a$10$mE.qmcV0mFU5NcKh73TZx.z4ueI/.bDWbj0T1BYyqP481kGGarKLG', 'System', 'System', 'system@localhost', '', b'1', 'zh-cn', null, null, 'system', '2018-02-23 19:41:50', null, 'system', null), ('2', 'anonymoususer', '$2a$10$j8S5d7Sr7.8VTOYNviDPOeWX8KcYILUVJBsYV83Y5NtECayypx9lO', 'Anonymous', 'User', 'anonymous@localhost', '', b'1', 'zh-cn', null, null, 'system', '2018-02-23 19:41:50', null, 'system', null), ('3', 'admin', '$2a$10$gSAhZrxMllrbgj/kkK9UceBPpChGWJA7SYIb1Mqo.n5aNLq1/oRrC', 'Administrator', 'Administrator', 'admin@localhost', '', b'1', 'zh-cn', null, null, 'system', '2018-02-23 19:41:50', null, 'system', null), ('4', 'user', '$2a$10$VEjxo0jq2YG9Rbk2HmX9S.k1uZBGYUHdUcid3g/vfiEl7lwWgOH/K', 'User', 'User', 'user@localhost', '', b'1', 'zh-cn', null, null, 'system', '2018-02-23 19:41:50', null, 'system', null), ('5', 'zzh', '$2a$10$gSAhZrxMllrbgj/kkK9UceBPpChGWJA7SYIb1Mqo.n5aNLq1/oRrC', 'Administrator', 'Administrator', 'admin@qq', '', b'1', 'zh-cn', null, '03482168760472631869', 'admin', '2018-02-24 14:14:21', '2018-02-24 14:14:21', 'admin', '2018-02-24 14:14:21');
COMMIT;

-- ----------------------------
--  Table structure for `jhi_user_authority`
-- ----------------------------
DROP TABLE IF EXISTS `jhi_user_authority`;
CREATE TABLE `jhi_user_authority` (
  `user_id` bigint(20) NOT NULL,
  `authority_name` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`,`authority_name`),
  KEY `fk_authority_name` (`authority_name`),
  CONSTRAINT `fk_authority_name` FOREIGN KEY (`authority_name`) REFERENCES `jhi_authority` (`name`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `jhi_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `jhi_user_authority`
-- ----------------------------
BEGIN;
INSERT INTO `jhi_user_authority` VALUES ('1', 'ROLE_ADMIN'), ('3', 'ROLE_ADMIN'), ('5', 'ROLE_ADMIN'), ('1', 'ROLE_USER'), ('3', 'ROLE_USER'), ('4', 'ROLE_USER'), ('5', 'ROLE_USER');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
