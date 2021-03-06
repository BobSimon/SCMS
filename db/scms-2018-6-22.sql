/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : scms

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-06-22 12:11:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `qrtz_blob_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_calendars`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_cron_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_fired_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_job_details`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_locks`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_paused_trigger_grps`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_scheduler_state`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_simple_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_simprop_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_data`
-- ----------------------------
DROP TABLE IF EXISTS `sys_data`;
CREATE TABLE `sys_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL COMMENT '代码',
  `codeDesc` varchar(200) DEFAULT NULL COMMENT '代码描述',
  `type` varchar(20) DEFAULT NULL COMMENT '类型代码',
  `typeDesc` varchar(200) DEFAULT NULL COMMENT '类型描述',
  `status` varchar(2) DEFAULT NULL COMMENT '状态 0-未生效 1-已生效',
  `orderNo` varchar(255) DEFAULT NULL COMMENT '排序',
  `createDate` datetime DEFAULT NULL,
  `lastUpdAcct` varchar(20) DEFAULT NULL,
  `lastUpdTime` datetime DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_data
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_department`
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department` (
  `id` int(15) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) NOT NULL COMMENT '部门名称',
  `code` varchar(255) NOT NULL COMMENT '部门编码',
  `parentid` int(15) DEFAULT NULL COMMENT '父部门id',
  `parentname` varchar(255) DEFAULT NULL COMMENT '父部门名称',
  `creater` varchar(255) DEFAULT NULL COMMENT '创建者',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(255) DEFAULT NULL COMMENT '更新者',
  `lastupdatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `enable` varchar(1) DEFAULT '1' COMMENT '是否启用 1-启用 0-不启用',
  `LEAF` varchar(255) DEFAULT '0' COMMENT '叶子节点(0:树枝节点;1:叶子节点)',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '备注',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_department
-- ----------------------------
INSERT INTO `sys_department` VALUES ('1', '研发部', 'sc!rd', '2', '司晨信息科技', null, null, null, null, '0', '0', null, 'fa fa-user');
INSERT INTO `sys_department` VALUES ('2', '司晨信息科技', 'sc', '0', null, null, null, null, null, '0', '0', null, 'fa fa-user');
INSERT INTO `sys_department` VALUES ('3', '销售', 'sc!sa', '2', '司晨信息科技', null, null, null, null, '0', '0', null, 'fa fa-user');
INSERT INTO `sys_department` VALUES ('4', '嵌入式', 'sc!rd!fpga', '1', '嵌入式', null, null, null, null, '1', '0', null, 'fa fa-user');
INSERT INTO `sys_department` VALUES ('5', '硬件', 'sc!rd!fpga!hd', '4', '硬件', null, null, null, null, '1', '0', null, 'fa fa-user');
INSERT INTO `sys_department` VALUES ('6', '硬件1', 'sc!rd!fpga!hd!hd1', '5', '硬件', null, null, null, null, '1', '0', null, 'fa fa-user');
INSERT INTO `sys_department` VALUES ('7', '百度', 'bd', '0', '百度', null, null, null, null, '1', '0', null, 'fa fa-user');

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `browser` varchar(255) DEFAULT NULL COMMENT '浏览器',
  `operation` varchar(20) DEFAULT NULL COMMENT 'GET/POST',
  `from` varchar(255) DEFAULT NULL COMMENT '来源 url',
  `ip` varchar(200) DEFAULT NULL COMMENT 'ip地址',
  `url` varchar(255) DEFAULT NULL COMMENT '请求地址',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `status` varchar(2) DEFAULT '1' COMMENT '1-记录',
  `lastUpdAcct` varchar(20) DEFAULT NULL COMMENT '最近修改管理员',
  `lastUpdTime` datetime DEFAULT NULL COMMENT '最近修改时间',
  `note` varchar(200) DEFAULT NULL COMMENT '修改信息备注',
  PRIMARY KEY (`id`),
  KEY `FK_sys_EVENT` (`uid`) USING BTREE,
  CONSTRAINT `sys_log_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1683', null, 'Chrome', 'POST', null, '127.0.0.1', '/wxapi/app/test', '2018-03-07 23:24:17', '1', 'guest', '2018-03-07 23:24:17', '记录日志');
INSERT INTO `sys_log` VALUES ('1684', null, 'Chrome', 'GET', null, '127.0.0.1', '/wxapi/app/test/getJwt', '2018-03-07 23:24:48', '1', 'guest', '2018-03-07 23:24:48', '记录日志');
INSERT INTO `sys_log` VALUES ('1685', null, 'Chrome', 'GET', null, '127.0.0.1', '/wxapi/app/test/getJwt', '2018-03-07 23:25:30', '1', 'guest', '2018-03-07 23:25:30', '记录日志');
INSERT INTO `sys_log` VALUES ('1686', null, 'Chrome', 'GET', null, '127.0.0.1', '/wxapi/app/test/getJwt', '2018-03-07 23:25:32', '1', 'guest', '2018-03-07 23:25:32', '记录日志');
INSERT INTO `sys_log` VALUES ('1687', null, 'Chrome', 'GET', null, '127.0.0.1', '/wxapi/app/test/getJwt', '2018-03-07 23:25:32', '1', 'guest', '2018-03-07 23:25:32', '记录日志');
INSERT INTO `sys_log` VALUES ('1688', null, 'Chrome', 'GET', null, '127.0.0.1', '/wxapi/app/test/getJwt', '2018-03-07 23:25:33', '1', 'guest', '2018-03-07 23:25:33', '记录日志');
INSERT INTO `sys_log` VALUES ('1689', null, 'Chrome', 'POST', null, '127.0.0.1', '/wxapi/app/test', '2018-03-07 23:26:30', '1', 'guest', '2018-03-07 23:26:30', '记录日志');
INSERT INTO `sys_log` VALUES ('1690', null, 'Chrome', 'GET', null, '127.0.0.1', '/wxapi/app/test/getJwt', '2018-03-07 23:26:43', '1', 'guest', '2018-03-07 23:26:43', '记录日志');
INSERT INTO `sys_log` VALUES ('1691', null, 'Chrome', 'GET', null, '127.0.0.1', '/wxapi/app/test/getJwt', '2018-03-07 23:27:56', '1', 'guest', '2018-03-07 23:27:56', '记录日志');
INSERT INTO `sys_log` VALUES ('1692', null, 'Chrome', 'GET', null, '127.0.0.1', '/wxapi/app/test/getJwt', '2018-03-07 23:27:57', '1', 'guest', '2018-03-07 23:27:57', '记录日志');
INSERT INTO `sys_log` VALUES ('1693', null, 'Chrome', 'GET', null, '127.0.0.1', '/wxapi/app/test/getJwt', '2018-03-07 23:27:58', '1', 'guest', '2018-03-07 23:27:58', '记录日志');
INSERT INTO `sys_log` VALUES ('1694', null, 'Chrome', 'GET', null, '127.0.0.1', '/wxapi/app/test/getJwt', '2018-03-07 23:27:59', '1', 'guest', '2018-03-07 23:27:59', '记录日志');
INSERT INTO `sys_log` VALUES ('1695', null, 'Chrome', 'GET', null, '127.0.0.1', '/wxapi/app/test/getJwt', '2018-03-07 23:28:28', '1', 'guest', '2018-03-07 23:28:28', '记录日志');
INSERT INTO `sys_log` VALUES ('1696', null, 'Chrome', 'GET', null, '127.0.0.1', '/wxapi/app/test/getJwt', '2018-03-07 23:28:29', '1', 'guest', '2018-03-07 23:28:29', '记录日志');
INSERT INTO `sys_log` VALUES ('1697', null, 'Chrome', 'GET', null, '127.0.0.1', '/wxapi/app/test/getJwt', '2018-03-07 23:28:37', '1', 'guest', '2018-03-07 23:28:37', '记录日志');
INSERT INTO `sys_log` VALUES ('1698', null, 'Chrome', 'GET', null, '127.0.0.1', '/wxapi/app/test/getJwt', '2018-03-07 23:28:38', '1', 'guest', '2018-03-07 23:28:38', '记录日志');
INSERT INTO `sys_log` VALUES ('1699', null, 'Chrome', 'GET', null, '127.0.0.1', '/wxapi/app/test/getJwt', '2018-03-07 23:28:38', '1', 'guest', '2018-03-07 23:28:38', '记录日志');
INSERT INTO `sys_log` VALUES ('1700', null, 'Chrome', 'GET', null, '127.0.0.1', '/wxapi/app/test/getJwt', '2018-03-07 23:28:38', '1', 'guest', '2018-03-07 23:28:38', '记录日志');
INSERT INTO `sys_log` VALUES ('1701', null, 'Chrome', 'GET', null, '127.0.0.1', '/wxapi/app/test/getJwt', '2018-03-07 23:28:39', '1', 'guest', '2018-03-07 23:28:39', '记录日志');
INSERT INTO `sys_log` VALUES ('1702', null, 'Chrome', 'POST', null, '127.0.0.1', '/wxapi/app/test', '2018-03-08 10:27:11', '1', 'guest', '2018-03-08 10:27:11', '记录日志');
INSERT INTO `sys_log` VALUES ('1703', null, 'Unknown', 'GET', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/login', '2018-03-08 11:40:02', '1', 'guest', '2018-03-08 11:40:02', '记录日志');
INSERT INTO `sys_log` VALUES ('1704', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 14:31:18', '1', 'guest', '2018-03-08 14:31:18', '记录日志');
INSERT INTO `sys_log` VALUES ('1705', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 14:37:11', '1', 'guest', '2018-03-08 14:37:11', '记录日志');
INSERT INTO `sys_log` VALUES ('1706', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 14:43:13', '1', 'guest', '2018-03-08 14:43:13', '记录日志');
INSERT INTO `sys_log` VALUES ('1707', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 14:46:04', '1', 'guest', '2018-03-08 14:46:04', '记录日志');
INSERT INTO `sys_log` VALUES ('1708', null, 'Chrome', 'POST', null, '127.0.0.1', '/wxapi/runclock/login', '2018-03-08 14:52:13', '1', 'guest', '2018-03-08 14:52:13', '记录日志');
INSERT INTO `sys_log` VALUES ('1709', null, 'Chrome', 'POST', null, '127.0.0.1', '/wxapi/runclock/login', '2018-03-08 14:53:03', '1', 'guest', '2018-03-08 14:53:03', '记录日志');
INSERT INTO `sys_log` VALUES ('1710', null, 'Chrome', 'POST', null, '127.0.0.1', '/wxapi/runclock/login', '2018-03-08 14:54:24', '1', 'guest', '2018-03-08 14:54:24', '记录日志');
INSERT INTO `sys_log` VALUES ('1711', null, 'Chrome', 'POST', null, '127.0.0.1', '/wxapi/runclock/login', '2018-03-08 14:54:39', '1', 'guest', '2018-03-08 14:54:39', '记录日志');
INSERT INTO `sys_log` VALUES ('1712', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 14:59:04', '1', 'guest', '2018-03-08 14:59:04', '记录日志');
INSERT INTO `sys_log` VALUES ('1713', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 14:59:58', '1', 'guest', '2018-03-08 14:59:58', '记录日志');
INSERT INTO `sys_log` VALUES ('1714', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 15:23:47', '1', 'guest', '2018-03-08 15:23:47', '记录日志');
INSERT INTO `sys_log` VALUES ('1715', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 15:23:54', '1', 'guest', '2018-03-08 15:23:54', '记录日志');
INSERT INTO `sys_log` VALUES ('1716', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 15:24:14', '1', 'guest', '2018-03-08 15:24:14', '记录日志');
INSERT INTO `sys_log` VALUES ('1717', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 15:27:45', '1', 'guest', '2018-03-08 15:27:45', '记录日志');
INSERT INTO `sys_log` VALUES ('1718', null, 'Chrome', 'POST', null, '127.0.0.1', '/wxapi/runclock/login', '2018-03-08 15:30:18', '1', 'guest', '2018-03-08 15:30:18', '记录日志');
INSERT INTO `sys_log` VALUES ('1719', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 15:35:55', '1', 'guest', '2018-03-08 15:35:55', '记录日志');
INSERT INTO `sys_log` VALUES ('1720', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 15:36:41', '1', 'guest', '2018-03-08 15:36:41', '记录日志');
INSERT INTO `sys_log` VALUES ('1721', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 15:38:53', '1', 'guest', '2018-03-08 15:38:53', '记录日志');
INSERT INTO `sys_log` VALUES ('1722', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 15:44:50', '1', 'guest', '2018-03-08 15:44:50', '记录日志');
INSERT INTO `sys_log` VALUES ('1723', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 15:48:40', '1', 'guest', '2018-03-08 15:48:40', '记录日志');
INSERT INTO `sys_log` VALUES ('1724', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 15:53:55', '1', 'guest', '2018-03-08 15:53:55', '记录日志');
INSERT INTO `sys_log` VALUES ('1725', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 15:56:44', '1', 'guest', '2018-03-08 15:56:44', '记录日志');
INSERT INTO `sys_log` VALUES ('1726', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 15:58:25', '1', 'guest', '2018-03-08 15:58:25', '记录日志');
INSERT INTO `sys_log` VALUES ('1727', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 16:03:05', '1', 'guest', '2018-03-08 16:03:05', '记录日志');
INSERT INTO `sys_log` VALUES ('1728', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 16:03:47', '1', 'guest', '2018-03-08 16:03:47', '记录日志');
INSERT INTO `sys_log` VALUES ('1729', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 16:12:55', '1', 'guest', '2018-03-08 16:12:55', '记录日志');
INSERT INTO `sys_log` VALUES ('1730', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 16:21:02', '1', 'guest', '2018-03-08 16:21:02', '记录日志');
INSERT INTO `sys_log` VALUES ('1731', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 16:29:49', '1', 'guest', '2018-03-08 16:29:49', '记录日志');
INSERT INTO `sys_log` VALUES ('1732', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 16:30:28', '1', 'guest', '2018-03-08 16:30:28', '记录日志');
INSERT INTO `sys_log` VALUES ('1733', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 16:30:59', '1', 'guest', '2018-03-08 16:30:59', '记录日志');
INSERT INTO `sys_log` VALUES ('1734', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 17:08:45', '1', 'guest', '2018-03-08 17:08:45', '记录日志');
INSERT INTO `sys_log` VALUES ('1735', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 17:09:26', '1', 'guest', '2018-03-08 17:09:26', '记录日志');
INSERT INTO `sys_log` VALUES ('1736', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 17:11:24', '1', 'guest', '2018-03-08 17:11:24', '记录日志');
INSERT INTO `sys_log` VALUES ('1737', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 19:39:06', '1', 'guest', '2018-03-08 19:39:06', '记录日志');
INSERT INTO `sys_log` VALUES ('1738', null, 'Unknown', 'POST', 'https://servicewechat.com/wx338acd03dd310b15/devtools/page-frame.html', '0:0:0:0:0:0:0:1', '/wxapi/runclock/login', '2018-03-08 19:48:40', '1', 'guest', '2018-03-08 19:48:40', '记录日志');
INSERT INTO `sys_log` VALUES ('1739', null, 'Chrome', 'GET', 'http://127.0.0.1:8080/login', '127.0.0.1', '/login', '2018-03-13 21:23:51', '1', 'guest', '2018-03-13 21:23:51', '记录日志');
INSERT INTO `sys_log` VALUES ('1740', null, 'Chrome', 'POST', 'http://127.0.0.1:8080/login', '127.0.0.1', '/postLogin', '2018-03-13 21:23:53', '1', 'guest', '2018-03-13 21:23:53', '记录日志');
INSERT INTO `sys_log` VALUES ('1741', '1', 'Chrome', 'GET', 'http://127.0.0.1:8080/login', '127.0.0.1', '/', '2018-03-13 21:23:53', '1', 'admin', '2018-03-13 21:23:53', '记录日志');
INSERT INTO `sys_log` VALUES ('1742', '1', 'Chrome', 'GET', 'http://127.0.0.1:8080/login', '127.0.0.1', '/', '2018-03-13 21:24:53', '1', 'admin', '2018-03-13 21:24:53', '记录日志');
INSERT INTO `sys_log` VALUES ('1743', '1', 'Chrome', 'GET', 'http://127.0.0.1:8080/login', '127.0.0.1', '/', '2018-03-13 21:26:03', '1', 'admin', '2018-03-13 21:26:03', '记录日志');
INSERT INTO `sys_log` VALUES ('1744', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 10:06:48', '1', 'guest', '2018-04-24 10:06:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1745', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 10:06:56', '1', 'guest', '2018-04-24 10:06:56', '登陆');
INSERT INTO `sys_log` VALUES ('1746', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 10:06:58', '1', 'admin', '2018-04-24 10:06:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1747', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 10:06:58', '1', 'admin', '2018-04-24 10:06:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1748', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 10:06:59', '1', 'admin', '2018-04-24 10:06:59', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1749', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user', '2018-04-24 10:07:14', '1', 'admin', '2018-04-24 10:07:14', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1750', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-04-24 10:07:14', '1', 'admin', '2018-04-24 10:07:14', '获取用户列表');
INSERT INTO `sys_log` VALUES ('1751', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log/main', '2018-04-24 10:07:17', '1', 'admin', '2018-04-24 10:07:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1752', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log/main', '127.0.0.1', '/system/log/getLogList', '2018-04-24 10:07:18', '1', 'admin', '2018-04-24 10:07:18', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1753', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 10:08:21', '1', 'admin', '2018-04-24 10:08:21', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1754', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 10:08:21', '1', 'admin', '2018-04-24 10:08:21', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1755', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 10:08:21', '1', 'admin', '2018-04-24 10:08:21', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1756', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user', '2018-04-24 10:08:26', '1', 'admin', '2018-04-24 10:08:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1757', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-04-24 10:08:26', '1', 'admin', '2018-04-24 10:08:26', '获取用户列表');
INSERT INTO `sys_log` VALUES ('1758', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 10:10:25', '1', 'admin', '2018-04-24 10:10:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1759', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 10:10:25', '1', 'admin', '2018-04-24 10:10:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1760', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 10:10:25', '1', 'admin', '2018-04-24 10:10:25', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1761', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user', '2018-04-24 10:10:28', '1', 'admin', '2018-04-24 10:10:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1762', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-04-24 10:10:29', '1', 'admin', '2018-04-24 10:10:29', '获取用户列表');
INSERT INTO `sys_log` VALUES ('1763', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 10:11:24', '1', 'admin', '2018-04-24 10:11:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1764', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 10:11:24', '1', 'admin', '2018-04-24 10:11:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1765', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 10:11:24', '1', 'admin', '2018-04-24 10:11:24', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1766', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log/main', '2018-04-24 10:11:34', '1', 'admin', '2018-04-24 10:11:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1767', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log/main', '127.0.0.1', '/system/log/getLogList', '2018-04-24 10:11:34', '1', 'admin', '2018-04-24 10:11:34', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1768', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 10:12:18', '1', 'admin', '2018-04-24 10:12:18', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1769', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 10:47:26', '1', 'guest', '2018-04-24 10:47:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1770', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 10:47:27', '1', 'guest', '2018-04-24 10:47:27', '登陆');
INSERT INTO `sys_log` VALUES ('1771', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 10:47:28', '1', 'admin', '2018-04-24 10:47:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1772', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 10:47:28', '1', 'admin', '2018-04-24 10:47:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1773', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 10:47:28', '1', 'admin', '2018-04-24 10:47:28', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1774', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 10:48:44', '1', 'admin', '2018-04-24 10:48:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1775', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 11:31:46', '1', 'guest', '2018-04-24 11:31:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1776', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 11:31:47', '1', 'guest', '2018-04-24 11:31:47', '登陆');
INSERT INTO `sys_log` VALUES ('1777', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 11:31:47', '1', 'admin', '2018-04-24 11:31:47', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1778', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 11:31:48', '1', 'admin', '2018-04-24 11:31:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1779', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 11:31:48', '1', 'admin', '2018-04-24 11:31:48', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1780', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:31:51', '1', 'admin', '2018-04-24 11:31:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1781', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 11:31:59', '1', 'guest', '2018-04-24 11:31:59', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1782', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 11:32:00', '1', 'guest', '2018-04-24 11:32:00', '登陆');
INSERT INTO `sys_log` VALUES ('1783', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 11:32:00', '1', 'admin', '2018-04-24 11:32:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1784', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 11:32:00', '1', 'admin', '2018-04-24 11:32:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1785', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 11:32:01', '1', 'admin', '2018-04-24 11:32:01', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1786', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:32:04', '1', 'admin', '2018-04-24 11:32:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1787', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 11:32:54', '1', 'guest', '2018-04-24 11:32:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1788', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 11:32:56', '1', 'guest', '2018-04-24 11:32:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1789', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 11:32:57', '1', 'guest', '2018-04-24 11:32:57', '登陆');
INSERT INTO `sys_log` VALUES ('1790', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 11:32:58', '1', 'admin', '2018-04-24 11:32:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1791', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 11:32:58', '1', 'admin', '2018-04-24 11:32:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1792', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 11:32:59', '1', 'admin', '2018-04-24 11:32:59', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1793', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:33:02', '1', 'admin', '2018-04-24 11:33:02', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1794', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:39:23', '1', 'admin', '2018-04-24 11:39:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1795', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:39:25', '1', 'admin', '2018-04-24 11:39:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1796', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:39:26', '1', 'admin', '2018-04-24 11:39:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1797', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:39:44', '1', 'admin', '2018-04-24 11:39:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1798', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:39:46', '1', 'admin', '2018-04-24 11:39:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1799', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:41:25', '1', 'admin', '2018-04-24 11:41:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1800', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 11:42:02', '1', 'guest', '2018-04-24 11:42:02', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1801', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 11:42:04', '1', 'guest', '2018-04-24 11:42:04', '登陆');
INSERT INTO `sys_log` VALUES ('1802', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 11:42:05', '1', 'admin', '2018-04-24 11:42:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1803', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 11:42:05', '1', 'admin', '2018-04-24 11:42:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1804', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 11:42:05', '1', 'admin', '2018-04-24 11:42:05', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1805', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:42:06', '1', 'admin', '2018-04-24 11:42:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1806', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:42:09', '1', 'admin', '2018-04-24 11:42:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1807', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:42:10', '1', 'admin', '2018-04-24 11:42:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1808', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:45:34', '1', 'admin', '2018-04-24 11:45:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1809', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:45:35', '1', 'admin', '2018-04-24 11:45:35', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1810', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:45:36', '1', 'admin', '2018-04-24 11:45:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1811', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:45:36', '1', 'admin', '2018-04-24 11:45:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1812', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:45:37', '1', 'admin', '2018-04-24 11:45:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1813', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:45:54', '1', 'admin', '2018-04-24 11:45:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1814', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:45:56', '1', 'admin', '2018-04-24 11:45:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1815', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 11:48:35', '1', 'guest', '2018-04-24 11:48:35', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1816', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 11:48:37', '1', 'guest', '2018-04-24 11:48:37', '登陆');
INSERT INTO `sys_log` VALUES ('1817', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 11:48:37', '1', 'admin', '2018-04-24 11:48:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1818', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 11:48:38', '1', 'admin', '2018-04-24 11:48:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1819', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 11:48:38', '1', 'admin', '2018-04-24 11:48:38', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1820', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:48:41', '1', 'admin', '2018-04-24 11:48:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1821', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:50:51', '1', 'admin', '2018-04-24 11:50:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1822', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:50:53', '1', 'admin', '2018-04-24 11:50:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1823', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:50:53', '1', 'admin', '2018-04-24 11:50:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1824', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:50:55', '1', 'admin', '2018-04-24 11:50:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1825', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:51:11', '1', 'admin', '2018-04-24 11:51:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1826', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:51:31', '1', 'admin', '2018-04-24 11:51:31', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1827', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:51:32', '1', 'admin', '2018-04-24 11:51:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1828', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:51:33', '1', 'admin', '2018-04-24 11:51:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1829', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:51:33', '1', 'admin', '2018-04-24 11:51:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1830', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:52:16', '1', 'admin', '2018-04-24 11:52:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1831', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:52:17', '1', 'admin', '2018-04-24 11:52:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1832', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:53:02', '1', 'admin', '2018-04-24 11:53:02', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1833', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 11:53:03', '1', 'admin', '2018-04-24 11:53:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1834', null, 'Unknown', 'GET', null, '127.0.0.1', '/login', '2018-04-24 12:06:03', '1', 'guest', '2018-04-24 12:06:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1835', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 14:42:04', '1', 'guest', '2018-04-24 14:42:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1836', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 14:42:06', '1', 'guest', '2018-04-24 14:42:06', '登陆');
INSERT INTO `sys_log` VALUES ('1837', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 14:42:06', '1', 'admin', '2018-04-24 14:42:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1838', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 14:42:07', '1', 'admin', '2018-04-24 14:42:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1839', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 14:42:07', '1', 'admin', '2018-04-24 14:42:07', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1840', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 14:42:10', '1', 'admin', '2018-04-24 14:42:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1841', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 14:42:11', '1', 'admin', '2018-04-24 14:42:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1842', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 14:44:03', '1', 'admin', '2018-04-24 14:44:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1843', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 14:44:05', '1', 'admin', '2018-04-24 14:44:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1844', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 14:44:34', '1', 'admin', '2018-04-24 14:44:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1845', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 14:46:07', '1', 'admin', '2018-04-24 14:46:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1846', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 14:46:09', '1', 'admin', '2018-04-24 14:46:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1847', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 14:46:53', '1', 'admin', '2018-04-24 14:46:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1848', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 14:46:54', '1', 'admin', '2018-04-24 14:46:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1849', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 14:46:55', '1', 'admin', '2018-04-24 14:46:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1850', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 14:47:50', '1', 'guest', '2018-04-24 14:47:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1851', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 14:47:52', '1', 'guest', '2018-04-24 14:47:52', '登陆');
INSERT INTO `sys_log` VALUES ('1852', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 14:47:53', '1', 'admin', '2018-04-24 14:47:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1853', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 14:47:53', '1', 'admin', '2018-04-24 14:47:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1854', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 14:47:53', '1', 'admin', '2018-04-24 14:47:53', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1855', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 14:47:56', '1', 'admin', '2018-04-24 14:47:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1856', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 14:47:57', '1', 'admin', '2018-04-24 14:47:57', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1857', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 14:49:36', '1', 'admin', '2018-04-24 14:49:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1858', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 14:49:37', '1', 'admin', '2018-04-24 14:49:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1859', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 14:49:38', '1', 'admin', '2018-04-24 14:49:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1860', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 14:52:46', '1', 'guest', '2018-04-24 14:52:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1861', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 14:52:47', '1', 'guest', '2018-04-24 14:52:47', '登陆');
INSERT INTO `sys_log` VALUES ('1862', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 14:52:48', '1', 'admin', '2018-04-24 14:52:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1863', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 14:52:48', '1', 'admin', '2018-04-24 14:52:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1864', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 14:52:49', '1', 'admin', '2018-04-24 14:52:49', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1865', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 14:52:50', '1', 'admin', '2018-04-24 14:52:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1866', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 14:52:51', '1', 'admin', '2018-04-24 14:52:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1867', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 14:52:52', '1', 'admin', '2018-04-24 14:52:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1868', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 14:52:53', '1', 'admin', '2018-04-24 14:52:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1869', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 14:59:45', '1', 'guest', '2018-04-24 14:59:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1870', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 14:59:48', '1', 'guest', '2018-04-24 14:59:48', '登陆');
INSERT INTO `sys_log` VALUES ('1871', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 14:59:48', '1', 'admin', '2018-04-24 14:59:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1872', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 14:59:48', '1', 'admin', '2018-04-24 14:59:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1873', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 14:59:49', '1', 'admin', '2018-04-24 14:59:49', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1874', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 14:59:51', '1', 'admin', '2018-04-24 14:59:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1875', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 14:59:52', '1', 'admin', '2018-04-24 14:59:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1876', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 14:59:53', '1', 'admin', '2018-04-24 14:59:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1877', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 14:59:53', '1', 'admin', '2018-04-24 14:59:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1878', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 14:59:54', '1', 'admin', '2018-04-24 14:59:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1879', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 14:59:54', '1', 'admin', '2018-04-24 14:59:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1880', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-04-24 14:59:55', '1', 'admin', '2018-04-24 14:59:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1881', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 16:03:11', '1', 'guest', '2018-04-24 16:03:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1882', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 16:38:26', '1', 'guest', '2018-04-24 16:38:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1883', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 16:38:40', '1', 'guest', '2018-04-24 16:38:40', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1884', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 16:38:46', '1', 'guest', '2018-04-24 16:38:46', '登陆');
INSERT INTO `sys_log` VALUES ('1885', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 16:38:46', '1', 'admin', '2018-04-24 16:38:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1886', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 16:38:47', '1', 'admin', '2018-04-24 16:38:47', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1887', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 16:38:47', '1', 'admin', '2018-04-24 16:38:47', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1888', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 16:40:49', '1', 'guest', '2018-04-24 16:40:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1889', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 16:40:50', '1', 'guest', '2018-04-24 16:40:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1890', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 16:40:51', '1', 'guest', '2018-04-24 16:40:51', '登陆');
INSERT INTO `sys_log` VALUES ('1891', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 16:40:52', '1', 'admin', '2018-04-24 16:40:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1892', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 16:40:52', '1', 'admin', '2018-04-24 16:40:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1893', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 16:40:52', '1', 'admin', '2018-04-24 16:40:52', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1894', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 16:42:56', '1', 'guest', '2018-04-24 16:42:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1895', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 16:42:57', '1', 'guest', '2018-04-24 16:42:57', '登陆');
INSERT INTO `sys_log` VALUES ('1896', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 16:42:58', '1', 'admin', '2018-04-24 16:42:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1897', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 16:42:58', '1', 'admin', '2018-04-24 16:42:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1898', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 16:42:58', '1', 'admin', '2018-04-24 16:42:58', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1899', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 16:43:09', '1', 'admin', '2018-04-24 16:43:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1900', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 16:45:22', '1', 'guest', '2018-04-24 16:45:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1901', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 16:45:23', '1', 'guest', '2018-04-24 16:45:23', '登陆');
INSERT INTO `sys_log` VALUES ('1902', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 16:45:24', '1', 'admin', '2018-04-24 16:45:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1903', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 16:45:24', '1', 'admin', '2018-04-24 16:45:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1904', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 16:45:24', '1', 'admin', '2018-04-24 16:45:24', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1905', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 16:45:27', '1', 'admin', '2018-04-24 16:45:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1906', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 16:49:07', '1', 'guest', '2018-04-24 16:49:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1907', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 16:49:08', '1', 'guest', '2018-04-24 16:49:08', '登陆');
INSERT INTO `sys_log` VALUES ('1908', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 16:49:09', '1', 'admin', '2018-04-24 16:49:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1909', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 16:49:09', '1', 'admin', '2018-04-24 16:49:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1910', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 16:49:09', '1', 'admin', '2018-04-24 16:49:09', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1911', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 16:49:11', '1', 'admin', '2018-04-24 16:49:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1912', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 16:54:27', '1', 'guest', '2018-04-24 16:54:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1913', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 16:54:29', '1', 'guest', '2018-04-24 16:54:29', '登陆');
INSERT INTO `sys_log` VALUES ('1914', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 16:54:29', '1', 'admin', '2018-04-24 16:54:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1915', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 16:54:29', '1', 'admin', '2018-04-24 16:54:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1916', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 16:54:30', '1', 'admin', '2018-04-24 16:54:30', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1917', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 16:54:33', '1', 'admin', '2018-04-24 16:54:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1918', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 16:58:51', '1', 'admin', '2018-04-24 16:58:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1919', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 17:05:37', '1', 'guest', '2018-04-24 17:05:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1920', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 17:05:38', '1', 'guest', '2018-04-24 17:05:38', '登陆');
INSERT INTO `sys_log` VALUES ('1921', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 17:05:39', '1', 'admin', '2018-04-24 17:05:39', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1922', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 17:05:39', '1', 'admin', '2018-04-24 17:05:39', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1923', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 17:05:39', '1', 'admin', '2018-04-24 17:05:39', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1924', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 17:05:51', '1', 'admin', '2018-04-24 17:05:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1925', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 17:41:46', '1', 'guest', '2018-04-24 17:41:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1926', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 17:41:47', '1', 'guest', '2018-04-24 17:41:47', '登陆');
INSERT INTO `sys_log` VALUES ('1927', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 17:41:48', '1', 'admin', '2018-04-24 17:41:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1928', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 17:41:48', '1', 'admin', '2018-04-24 17:41:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1929', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 17:41:49', '1', 'admin', '2018-04-24 17:41:49', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1930', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 17:42:20', '1', 'admin', '2018-04-24 17:42:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1931', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 17:42:35', '1', 'admin', '2018-04-24 17:42:35', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1932', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 17:43:19', '1', 'guest', '2018-04-24 17:43:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1933', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 17:43:21', '1', 'guest', '2018-04-24 17:43:21', '登陆');
INSERT INTO `sys_log` VALUES ('1934', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 17:43:21', '1', 'admin', '2018-04-24 17:43:21', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1935', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 17:43:21', '1', 'admin', '2018-04-24 17:43:21', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1936', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 17:43:21', '1', 'admin', '2018-04-24 17:43:21', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1937', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 17:43:24', '1', 'admin', '2018-04-24 17:43:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1938', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 17:43:33', '1', 'admin', '2018-04-24 17:43:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1939', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 17:45:32', '1', 'guest', '2018-04-24 17:45:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1940', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 17:45:34', '1', 'guest', '2018-04-24 17:45:34', '登陆');
INSERT INTO `sys_log` VALUES ('1941', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 17:45:35', '1', 'admin', '2018-04-24 17:45:35', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1942', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 17:45:35', '1', 'admin', '2018-04-24 17:45:35', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1943', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 17:45:36', '1', 'admin', '2018-04-24 17:45:36', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1944', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 17:45:40', '1', 'admin', '2018-04-24 17:45:40', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1945', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/getDepartmentList', '2018-04-24 17:45:41', '1', 'admin', '2018-04-24 17:45:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1946', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 17:45:59', '1', 'admin', '2018-04-24 17:45:59', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1947', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/getDepartmentList', '2018-04-24 17:45:59', '1', 'admin', '2018-04-24 17:45:59', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1948', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 17:47:18', '1', 'admin', '2018-04-24 17:47:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1949', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/getDepartmentList', '2018-04-24 17:47:18', '1', 'admin', '2018-04-24 17:47:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1950', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 17:47:25', '1', 'admin', '2018-04-24 17:47:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1951', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/getDepartmentList', '2018-04-24 17:47:26', '1', 'admin', '2018-04-24 17:47:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1952', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 17:47:31', '1', 'admin', '2018-04-24 17:47:31', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1953', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/getDepartmentList', '2018-04-24 17:47:32', '1', 'admin', '2018-04-24 17:47:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1954', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 17:48:55', '1', 'guest', '2018-04-24 17:48:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1955', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 17:48:57', '1', 'guest', '2018-04-24 17:48:57', '登陆');
INSERT INTO `sys_log` VALUES ('1956', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 17:48:58', '1', 'admin', '2018-04-24 17:48:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1957', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 17:48:58', '1', 'admin', '2018-04-24 17:48:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1958', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 17:48:58', '1', 'admin', '2018-04-24 17:48:58', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1959', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 17:49:00', '1', 'admin', '2018-04-24 17:49:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1960', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 17:49:01', '1', 'admin', '2018-04-24 17:49:01', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1961', null, 'Chrome', 'GET', 'http://caibaojian.com/jquery-each-json.html', '127.0.0.1', '/login', '2018-04-24 17:51:07', '1', 'guest', '2018-04-24 17:51:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1962', null, 'Chrome', 'GET', 'http://caibaojian.com/wp-content/cache/autoptimize/css/autoptimize_e49d310d132f6cdc3c60a1d9bc76c7ad.css', '127.0.0.1', '/login', '2018-04-24 17:51:07', '1', 'guest', '2018-04-24 17:51:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1963', null, 'Chrome', 'GET', 'http://caibaojian.com/jquery-each-json.html', '127.0.0.1', '/login', '2018-04-24 17:51:30', '1', 'guest', '2018-04-24 17:51:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1964', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 17:58:26', '1', 'admin', '2018-04-24 17:58:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1965', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 17:58:26', '1', 'admin', '2018-04-24 17:58:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1966', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 17:59:44', '1', 'guest', '2018-04-24 17:59:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1967', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 17:59:46', '1', 'guest', '2018-04-24 17:59:46', '登陆');
INSERT INTO `sys_log` VALUES ('1968', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 17:59:46', '1', 'admin', '2018-04-24 17:59:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1969', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 17:59:47', '1', 'admin', '2018-04-24 17:59:47', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1970', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 17:59:47', '1', 'admin', '2018-04-24 17:59:47', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1971', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 17:59:50', '1', 'admin', '2018-04-24 17:59:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1972', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 17:59:51', '1', 'admin', '2018-04-24 17:59:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1973', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 18:01:10', '1', 'admin', '2018-04-24 18:01:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1974', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 18:01:11', '1', 'admin', '2018-04-24 18:01:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1975', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 18:01:52', '1', 'guest', '2018-04-24 18:01:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1976', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 18:01:54', '1', 'guest', '2018-04-24 18:01:54', '登陆');
INSERT INTO `sys_log` VALUES ('1977', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 18:01:54', '1', 'admin', '2018-04-24 18:01:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1978', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 18:01:55', '1', 'admin', '2018-04-24 18:01:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1979', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 18:01:55', '1', 'admin', '2018-04-24 18:01:55', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1980', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 18:01:59', '1', 'admin', '2018-04-24 18:01:59', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1981', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 18:02:00', '1', 'admin', '2018-04-24 18:02:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1982', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 18:02:45', '1', 'guest', '2018-04-24 18:02:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1983', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 18:02:46', '1', 'guest', '2018-04-24 18:02:46', '登陆');
INSERT INTO `sys_log` VALUES ('1984', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 18:02:46', '1', 'admin', '2018-04-24 18:02:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1985', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 18:02:46', '1', 'admin', '2018-04-24 18:02:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1986', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 18:02:47', '1', 'admin', '2018-04-24 18:02:47', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1987', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 18:02:50', '1', 'admin', '2018-04-24 18:02:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1988', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 18:02:50', '1', 'admin', '2018-04-24 18:02:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1989', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 18:05:03', '1', 'guest', '2018-04-24 18:05:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1990', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 18:05:04', '1', 'guest', '2018-04-24 18:05:04', '登陆');
INSERT INTO `sys_log` VALUES ('1991', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 18:05:04', '1', 'admin', '2018-04-24 18:05:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1992', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 18:05:05', '1', 'admin', '2018-04-24 18:05:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1993', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 18:05:05', '1', 'admin', '2018-04-24 18:05:05', '获取日志列表');
INSERT INTO `sys_log` VALUES ('1994', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 18:05:07', '1', 'admin', '2018-04-24 18:05:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1995', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 18:05:07', '1', 'admin', '2018-04-24 18:05:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1996', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 18:05:41', '1', 'guest', '2018-04-24 18:05:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1997', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 18:05:43', '1', 'guest', '2018-04-24 18:05:43', '登陆');
INSERT INTO `sys_log` VALUES ('1998', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 18:05:43', '1', 'admin', '2018-04-24 18:05:43', '方法没有描述');
INSERT INTO `sys_log` VALUES ('1999', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 18:05:43', '1', 'admin', '2018-04-24 18:05:43', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2000', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 18:05:43', '1', 'admin', '2018-04-24 18:05:43', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2001', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 18:05:46', '1', 'admin', '2018-04-24 18:05:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2002', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 18:05:52', '1', 'admin', '2018-04-24 18:05:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2003', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 18:05:52', '1', 'admin', '2018-04-24 18:05:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2004', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 18:08:15', '1', 'admin', '2018-04-24 18:08:15', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2005', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 18:08:15', '1', 'admin', '2018-04-24 18:08:15', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2006', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 18:09:11', '1', 'admin', '2018-04-24 18:09:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2007', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 18:09:11', '1', 'admin', '2018-04-24 18:09:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2008', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 18:12:00', '1', 'guest', '2018-04-24 18:12:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2009', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 18:12:02', '1', 'guest', '2018-04-24 18:12:02', '登陆');
INSERT INTO `sys_log` VALUES ('2010', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 18:12:02', '1', 'admin', '2018-04-24 18:12:02', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2011', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 18:12:03', '1', 'admin', '2018-04-24 18:12:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2012', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 18:12:03', '1', 'admin', '2018-04-24 18:12:03', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2013', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 18:12:04', '1', 'admin', '2018-04-24 18:12:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2014', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 18:12:05', '1', 'admin', '2018-04-24 18:12:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2015', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 18:16:15', '1', 'guest', '2018-04-24 18:16:15', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2016', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 18:16:16', '1', 'guest', '2018-04-24 18:16:16', '登陆');
INSERT INTO `sys_log` VALUES ('2017', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 18:16:16', '1', 'admin', '2018-04-24 18:16:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2018', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 18:16:17', '1', 'admin', '2018-04-24 18:16:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2019', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 18:16:17', '1', 'admin', '2018-04-24 18:16:17', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2020', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 18:16:19', '1', 'admin', '2018-04-24 18:16:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2021', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 18:16:19', '1', 'admin', '2018-04-24 18:16:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2022', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 18:16:20', '1', 'admin', '2018-04-24 18:16:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2023', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 18:16:21', '1', 'admin', '2018-04-24 18:16:21', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2024', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 18:16:21', '1', 'admin', '2018-04-24 18:16:21', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2025', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 18:16:22', '1', 'admin', '2018-04-24 18:16:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2026', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 18:16:22', '1', 'admin', '2018-04-24 18:16:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2027', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 18:16:22', '1', 'admin', '2018-04-24 18:16:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2028', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 18:16:23', '1', 'admin', '2018-04-24 18:16:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2029', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 18:16:23', '1', 'admin', '2018-04-24 18:16:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2030', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 18:19:33', '1', 'admin', '2018-04-24 18:19:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2031', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 18:19:33', '1', 'admin', '2018-04-24 18:19:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2032', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 21:25:12', '1', 'guest', '2018-04-24 21:25:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2033', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 21:25:14', '1', 'guest', '2018-04-24 21:25:14', '登陆');
INSERT INTO `sys_log` VALUES ('2034', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 21:25:14', '1', 'admin', '2018-04-24 21:25:14', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2035', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 21:25:14', '1', 'admin', '2018-04-24 21:25:14', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2036', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 21:25:15', '1', 'admin', '2018-04-24 21:25:15', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2037', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 21:25:15', '1', 'admin', '2018-04-24 21:25:15', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2038', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 21:25:16', '1', 'admin', '2018-04-24 21:25:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2039', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 21:25:51', '1', 'admin', '2018-04-24 21:25:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2040', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 21:25:51', '1', 'admin', '2018-04-24 21:25:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2041', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 21:26:15', '1', 'admin', '2018-04-24 21:26:15', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2042', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 21:26:15', '1', 'admin', '2018-04-24 21:26:15', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2043', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 21:30:06', '1', 'admin', '2018-04-24 21:30:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2044', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 21:30:07', '1', 'admin', '2018-04-24 21:30:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2045', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 21:30:27', '1', 'guest', '2018-04-24 21:30:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2046', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 21:30:28', '1', 'guest', '2018-04-24 21:30:28', '登陆');
INSERT INTO `sys_log` VALUES ('2047', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 21:30:29', '1', 'admin', '2018-04-24 21:30:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2048', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 21:30:29', '1', 'admin', '2018-04-24 21:30:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2049', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 21:30:30', '1', 'admin', '2018-04-24 21:30:30', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2050', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 21:30:36', '1', 'admin', '2018-04-24 21:30:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2051', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 21:30:36', '1', 'admin', '2018-04-24 21:30:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2052', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 21:30:37', '1', 'admin', '2018-04-24 21:30:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2053', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 21:30:38', '1', 'admin', '2018-04-24 21:30:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2054', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 21:30:38', '1', 'admin', '2018-04-24 21:30:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2055', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 21:30:39', '1', 'admin', '2018-04-24 21:30:39', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2056', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 21:31:56', '1', 'admin', '2018-04-24 21:31:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2057', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 21:31:56', '1', 'admin', '2018-04-24 21:31:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2058', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 21:31:57', '1', 'admin', '2018-04-24 21:31:57', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2059', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 21:31:57', '1', 'admin', '2018-04-24 21:31:57', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2060', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 21:36:53', '1', 'admin', '2018-04-24 21:36:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2061', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 21:36:53', '1', 'admin', '2018-04-24 21:36:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2062', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 21:48:33', '1', 'guest', '2018-04-24 21:48:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2063', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 21:48:38', '1', 'guest', '2018-04-24 21:48:38', '登陆');
INSERT INTO `sys_log` VALUES ('2064', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 21:48:38', '1', 'admin', '2018-04-24 21:48:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2065', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 21:48:38', '1', 'admin', '2018-04-24 21:48:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2066', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 21:48:39', '1', 'admin', '2018-04-24 21:48:39', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2067', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 21:48:40', '1', 'admin', '2018-04-24 21:48:40', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2068', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 21:48:40', '1', 'admin', '2018-04-24 21:48:40', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2069', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 21:48:41', '1', 'admin', '2018-04-24 21:48:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2070', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 21:48:42', '1', 'admin', '2018-04-24 21:48:42', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2071', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 21:48:50', '1', 'admin', '2018-04-24 21:48:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2072', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 21:48:51', '1', 'admin', '2018-04-24 21:48:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2073', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 21:55:29', '1', 'admin', '2018-04-24 21:55:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2074', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 21:55:29', '1', 'admin', '2018-04-24 21:55:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2075', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 21:56:12', '1', 'admin', '2018-04-24 21:56:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2076', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 21:56:13', '1', 'admin', '2018-04-24 21:56:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2077', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 22:07:40', '1', 'guest', '2018-04-24 22:07:40', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2078', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 22:07:41', '1', 'guest', '2018-04-24 22:07:41', '登陆');
INSERT INTO `sys_log` VALUES ('2079', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 22:07:42', '1', 'admin', '2018-04-24 22:07:42', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2080', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 22:07:42', '1', 'admin', '2018-04-24 22:07:42', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2081', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 22:07:42', '1', 'admin', '2018-04-24 22:07:42', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2082', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 22:07:43', '1', 'admin', '2018-04-24 22:07:43', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2083', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 22:07:43', '1', 'admin', '2018-04-24 22:07:43', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2084', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 22:07:45', '1', 'admin', '2018-04-24 22:07:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2085', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 22:07:45', '1', 'admin', '2018-04-24 22:07:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2086', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 22:07:46', '1', 'admin', '2018-04-24 22:07:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2087', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 22:07:46', '1', 'admin', '2018-04-24 22:07:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2088', null, 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/login', '2018-04-24 22:09:08', '1', 'guest', '2018-04-24 22:09:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2089', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 22:09:09', '1', 'guest', '2018-04-24 22:09:09', '登陆');
INSERT INTO `sys_log` VALUES ('2090', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 22:09:10', '1', 'admin', '2018-04-24 22:09:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2091', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 22:09:10', '1', 'admin', '2018-04-24 22:09:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2092', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 22:09:10', '1', 'admin', '2018-04-24 22:09:10', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2093', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 22:09:12', '1', 'admin', '2018-04-24 22:09:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2094', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 22:09:12', '1', 'admin', '2018-04-24 22:09:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2095', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 22:09:13', '1', 'admin', '2018-04-24 22:09:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2096', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 22:09:13', '1', 'admin', '2018-04-24 22:09:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2097', null, 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/login', '2018-04-24 22:10:52', '1', 'guest', '2018-04-24 22:10:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2098', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 22:10:53', '1', 'guest', '2018-04-24 22:10:53', '登陆');
INSERT INTO `sys_log` VALUES ('2099', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 22:10:53', '1', 'admin', '2018-04-24 22:10:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2100', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 22:10:54', '1', 'admin', '2018-04-24 22:10:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2101', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 22:10:54', '1', 'admin', '2018-04-24 22:10:54', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2102', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 22:10:55', '1', 'admin', '2018-04-24 22:10:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2103', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 22:10:55', '1', 'admin', '2018-04-24 22:10:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2104', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 22:10:57', '1', 'admin', '2018-04-24 22:10:57', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2105', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 22:10:57', '1', 'admin', '2018-04-24 22:10:57', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2106', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 22:11:44', '1', 'admin', '2018-04-24 22:11:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2107', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 22:11:44', '1', 'admin', '2018-04-24 22:11:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2108', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 22:12:17', '1', 'admin', '2018-04-24 22:12:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2109', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 22:12:17', '1', 'admin', '2018-04-24 22:12:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2110', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 22:12:18', '1', 'admin', '2018-04-24 22:12:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2111', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 22:12:18', '1', 'admin', '2018-04-24 22:12:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2112', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 22:12:19', '1', 'admin', '2018-04-24 22:12:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2113', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 22:12:19', '1', 'admin', '2018-04-24 22:12:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2114', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 22:12:19', '1', 'admin', '2018-04-24 22:12:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2115', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 22:12:19', '1', 'admin', '2018-04-24 22:12:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2116', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 22:22:31', '1', 'guest', '2018-04-24 22:22:31', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2117', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 22:22:33', '1', 'guest', '2018-04-24 22:22:33', '登陆');
INSERT INTO `sys_log` VALUES ('2118', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 22:22:33', '1', 'admin', '2018-04-24 22:22:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2119', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 22:22:33', '1', 'admin', '2018-04-24 22:22:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2120', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 22:22:33', '1', 'admin', '2018-04-24 22:22:33', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2121', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 22:22:34', '1', 'admin', '2018-04-24 22:22:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2122', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 22:22:35', '1', 'admin', '2018-04-24 22:22:35', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2123', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 22:22:36', '1', 'admin', '2018-04-24 22:22:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2124', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 22:22:36', '1', 'admin', '2018-04-24 22:22:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2125', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 22:34:32', '1', 'guest', '2018-04-24 22:34:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2126', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 22:34:34', '1', 'guest', '2018-04-24 22:34:34', '登陆');
INSERT INTO `sys_log` VALUES ('2127', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 22:34:34', '1', 'admin', '2018-04-24 22:34:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2128', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 22:34:34', '1', 'admin', '2018-04-24 22:34:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2129', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 22:34:35', '1', 'admin', '2018-04-24 22:34:35', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2130', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 22:34:36', '1', 'admin', '2018-04-24 22:34:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2131', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 22:34:36', '1', 'admin', '2018-04-24 22:34:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2132', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 22:34:37', '1', 'admin', '2018-04-24 22:34:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2133', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 22:34:37', '1', 'admin', '2018-04-24 22:34:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2134', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 22:35:30', '1', 'admin', '2018-04-24 22:35:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2135', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 22:35:30', '1', 'admin', '2018-04-24 22:35:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2136', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 22:35:44', '1', 'guest', '2018-04-24 22:35:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2137', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 22:35:45', '1', 'guest', '2018-04-24 22:35:45', '登陆');
INSERT INTO `sys_log` VALUES ('2138', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 22:35:45', '1', 'admin', '2018-04-24 22:35:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2139', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 22:35:46', '1', 'admin', '2018-04-24 22:35:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2140', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 22:35:46', '1', 'admin', '2018-04-24 22:35:46', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2141', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 22:35:48', '1', 'admin', '2018-04-24 22:35:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2142', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 22:35:48', '1', 'admin', '2018-04-24 22:35:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2143', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 22:35:49', '1', 'admin', '2018-04-24 22:35:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2144', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 22:35:49', '1', 'admin', '2018-04-24 22:35:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2145', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 22:36:16', '1', 'admin', '2018-04-24 22:36:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2146', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 22:36:16', '1', 'admin', '2018-04-24 22:36:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2147', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-24 22:36:45', '1', 'guest', '2018-04-24 22:36:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2148', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 22:36:47', '1', 'guest', '2018-04-24 22:36:47', '登陆');
INSERT INTO `sys_log` VALUES ('2149', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 22:36:47', '1', 'admin', '2018-04-24 22:36:47', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2150', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 22:36:47', '1', 'admin', '2018-04-24 22:36:47', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2151', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 22:36:48', '1', 'admin', '2018-04-24 22:36:48', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2152', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 22:36:49', '1', 'admin', '2018-04-24 22:36:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2153', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 22:36:49', '1', 'admin', '2018-04-24 22:36:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2154', null, 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/login', '2018-04-24 22:38:39', '1', 'guest', '2018-04-24 22:38:39', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2155', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-24 22:38:40', '1', 'guest', '2018-04-24 22:38:40', '登陆');
INSERT INTO `sys_log` VALUES ('2156', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-04-24 22:38:41', '1', 'admin', '2018-04-24 22:38:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2157', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-04-24 22:38:41', '1', 'admin', '2018-04-24 22:38:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2158', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-04-24 22:38:41', '1', 'admin', '2018-04-24 22:38:41', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2159', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/', '2018-04-24 22:38:42', '1', 'admin', '2018-04-24 22:38:42', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2160', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department/', '127.0.0.1', '/system/department/getDepartmentList', '2018-04-24 22:38:43', '1', 'admin', '2018-04-24 22:38:43', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2161', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-04-25 10:08:03', '1', 'guest', '2018-04-25 10:08:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2162', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-04-25 10:08:14', '1', 'guest', '2018-04-25 10:08:14', '登陆');
INSERT INTO `sys_log` VALUES ('2663', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log/main', '127.0.0.1', '/system/log/delete', '2018-06-20 17:53:24', '1', 'admin', '2018-06-20 17:53:24', '删除日志');
INSERT INTO `sys_log` VALUES ('2664', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log/main', '127.0.0.1', '/system/log/getLogList', '2018-06-20 17:53:27', '1', 'admin', '2018-06-20 17:53:27', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2665', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log/main', '127.0.0.1', '/system/log/getLogList', '2018-06-20 17:53:35', '1', 'admin', '2018-06-20 17:53:35', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2666', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log/main', '127.0.0.1', '/system/log/getLogList', '2018-06-20 17:54:20', '1', 'admin', '2018-06-20 17:54:20', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2667', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 17:59:27', '1', 'admin', '2018-06-20 17:59:27', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2668', '1', 'Chrome Mobile', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 18:20:47', '1', 'admin', '2018-06-20 18:20:47', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2669', '1', 'Chrome Mobile', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 18:20:47', '1', 'admin', '2018-06-20 18:20:47', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2670', '1', 'Chrome Mobile', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 18:20:48', '1', 'admin', '2018-06-20 18:20:48', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2671', '1', 'Chrome Mobile', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 18:25:31', '1', 'admin', '2018-06-20 18:25:31', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2672', '1', 'Chrome Mobile', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 18:25:31', '1', 'admin', '2018-06-20 18:25:31', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2673', '1', 'Chrome Mobile', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 18:25:31', '1', 'admin', '2018-06-20 18:25:31', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2674', '1', 'Chrome Mobile', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 18:25:34', '1', 'admin', '2018-06-20 18:25:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2675', '1', 'Chrome Mobile', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 18:25:34', '1', 'admin', '2018-06-20 18:25:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2676', '1', 'Chrome Mobile', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 18:25:35', '1', 'admin', '2018-06-20 18:25:35', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2677', '1', 'Chrome Mobile', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 18:25:53', '1', 'admin', '2018-06-20 18:25:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2678', '1', 'Chrome Mobile', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 18:25:53', '1', 'admin', '2018-06-20 18:25:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2679', '1', 'Chrome Mobile', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 18:25:53', '1', 'admin', '2018-06-20 18:25:53', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2680', '1', 'Chrome Mobile', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 18:32:57', '1', 'admin', '2018-06-20 18:32:57', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2681', '1', 'Chrome Mobile', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 18:39:24', '1', 'admin', '2018-06-20 18:39:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2682', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 18:40:18', '1', 'admin', '2018-06-20 18:40:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2683', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 18:40:18', '1', 'admin', '2018-06-20 18:40:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2684', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 18:40:19', '1', 'admin', '2018-06-20 18:40:19', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2685', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log/main', '2018-06-20 18:40:45', '1', 'admin', '2018-06-20 18:40:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2686', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log/main', '127.0.0.1', '/system/log/getLogList', '2018-06-20 18:40:45', '1', 'admin', '2018-06-20 18:40:45', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2687', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 18:45:08', '1', 'admin', '2018-06-20 18:45:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2688', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 18:45:08', '1', 'admin', '2018-06-20 18:45:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2689', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 18:45:08', '1', 'admin', '2018-06-20 18:45:08', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2690', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 18:45:30', '1', 'admin', '2018-06-20 18:45:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2691', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 18:45:30', '1', 'admin', '2018-06-20 18:45:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2692', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 18:45:36', '1', 'admin', '2018-06-20 18:45:36', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2693', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 18:46:08', '1', 'admin', '2018-06-20 18:46:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2694', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 18:46:08', '1', 'admin', '2018-06-20 18:46:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2695', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 18:46:21', '1', 'admin', '2018-06-20 18:46:21', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2696', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 18:46:30', '1', 'admin', '2018-06-20 18:46:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2697', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 18:46:30', '1', 'admin', '2018-06-20 18:46:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2698', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 18:46:32', '1', 'admin', '2018-06-20 18:46:32', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2699', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 18:47:09', '1', 'admin', '2018-06-20 18:47:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2700', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 18:47:09', '1', 'admin', '2018-06-20 18:47:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2701', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 18:47:10', '1', 'admin', '2018-06-20 18:47:10', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2702', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 18:47:11', '1', 'admin', '2018-06-20 18:47:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2703', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 18:47:12', '1', 'admin', '2018-06-20 18:47:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2704', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 18:47:12', '1', 'admin', '2018-06-20 18:47:12', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2705', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 18:47:14', '1', 'admin', '2018-06-20 18:47:14', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2706', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 18:47:14', '1', 'admin', '2018-06-20 18:47:14', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2707', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 18:47:14', '1', 'admin', '2018-06-20 18:47:14', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2708', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 18:51:05', '1', 'admin', '2018-06-20 18:51:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2709', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 18:51:05', '1', 'admin', '2018-06-20 18:51:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2710', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 18:51:06', '1', 'admin', '2018-06-20 18:51:06', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2711', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 18:51:34', '1', 'admin', '2018-06-20 18:51:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2712', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 18:51:34', '1', 'admin', '2018-06-20 18:51:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2713', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 18:51:35', '1', 'admin', '2018-06-20 18:51:35', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2714', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 18:51:37', '1', 'admin', '2018-06-20 18:51:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2715', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 18:51:38', '1', 'admin', '2018-06-20 18:51:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2716', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 18:51:38', '1', 'admin', '2018-06-20 18:51:38', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2717', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 18:51:55', '1', 'admin', '2018-06-20 18:51:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2718', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 18:51:56', '1', 'admin', '2018-06-20 18:51:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2719', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 18:52:25', '1', 'admin', '2018-06-20 18:52:25', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2720', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 18:52:37', '1', 'admin', '2018-06-20 18:52:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2721', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 18:52:38', '1', 'admin', '2018-06-20 18:52:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2722', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 18:53:37', '1', 'admin', '2018-06-20 18:53:37', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2723', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 18:54:02', '1', 'admin', '2018-06-20 18:54:02', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2724', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 18:54:02', '1', 'admin', '2018-06-20 18:54:02', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2725', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 18:54:07', '1', 'admin', '2018-06-20 18:54:07', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2726', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 18:56:06', '1', 'admin', '2018-06-20 18:56:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2727', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 18:56:06', '1', 'admin', '2018-06-20 18:56:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2728', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 18:56:06', '1', 'admin', '2018-06-20 18:56:06', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2729', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 18:56:54', '1', 'admin', '2018-06-20 18:56:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2730', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 18:56:54', '1', 'admin', '2018-06-20 18:56:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2731', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 18:56:55', '1', 'admin', '2018-06-20 18:56:55', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2732', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 18:56:59', '1', 'admin', '2018-06-20 18:56:59', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2733', null, 'Chrome', 'GET', null, '0:0:0:0:0:0:0:1', '/login', '2018-06-20 21:21:05', '1', 'guest', '2018-06-20 21:21:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2734', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-20 21:37:23', '1', 'guest', '2018-06-20 21:37:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2735', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-20 21:37:31', '1', 'guest', '2018-06-20 21:37:31', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2736', null, 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/login', '2018-06-20 21:42:39', '1', 'guest', '2018-06-20 21:42:39', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2737', null, 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/login', '2018-06-20 21:46:07', '1', 'guest', '2018-06-20 21:46:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2738', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-20 21:46:09', '1', 'guest', '2018-06-20 21:46:09', '登陆');
INSERT INTO `sys_log` VALUES ('2739', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 21:46:09', '1', 'admin', '2018-06-20 21:46:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2740', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 21:46:09', '1', 'admin', '2018-06-20 21:46:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2741', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 21:46:09', '1', 'admin', '2018-06-20 21:46:09', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2742', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 21:47:38', '1', 'admin', '2018-06-20 21:47:38', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2743', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 21:49:19', '1', 'admin', '2018-06-20 21:49:19', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2744', null, 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/login', '2018-06-20 22:24:29', '1', 'guest', '2018-06-20 22:24:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2745', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-20 22:30:42', '1', 'guest', '2018-06-20 22:30:42', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2746', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-20 22:30:49', '1', 'guest', '2018-06-20 22:30:49', '登陆');
INSERT INTO `sys_log` VALUES ('2747', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 22:30:49', '1', 'admin', '2018-06-20 22:30:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2748', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 22:30:49', '1', 'admin', '2018-06-20 22:30:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2749', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 22:30:49', '1', 'admin', '2018-06-20 22:30:49', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2750', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log/main', '2018-06-20 22:30:55', '1', 'admin', '2018-06-20 22:30:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2751', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log/main', '127.0.0.1', '/system/log/getLogList', '2018-06-20 22:30:55', '1', 'admin', '2018-06-20 22:30:55', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2752', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log/main', '127.0.0.1', '/system/log/getLogList', '2018-06-20 22:31:16', '1', 'admin', '2018-06-20 22:31:16', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2753', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 22:31:24', '1', 'admin', '2018-06-20 22:31:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2754', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 22:31:25', '1', 'admin', '2018-06-20 22:31:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2755', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 22:31:25', '1', 'admin', '2018-06-20 22:31:25', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2756', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 22:35:01', '1', 'admin', '2018-06-20 22:35:01', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2757', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:04:59', '1', 'admin', '2018-06-20 23:04:59', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2758', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:05:59', '1', 'admin', '2018-06-20 23:05:59', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2759', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:06:06', '1', 'admin', '2018-06-20 23:06:06', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2760', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:08:37', '1', 'admin', '2018-06-20 23:08:37', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2761', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:08:45', '1', 'admin', '2018-06-20 23:08:45', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2762', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:08:51', '1', 'admin', '2018-06-20 23:08:51', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2763', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:08:59', '1', 'admin', '2018-06-20 23:08:59', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2764', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:09:02', '1', 'admin', '2018-06-20 23:09:02', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2765', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:09:06', '1', 'admin', '2018-06-20 23:09:06', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2766', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user', '2018-06-20 23:10:53', '1', 'admin', '2018-06-20 23:10:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2767', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-20 23:10:53', '1', 'admin', '2018-06-20 23:10:53', '获取用户列表');
INSERT INTO `sys_log` VALUES ('2768', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log/main', '2018-06-20 23:10:57', '1', 'admin', '2018-06-20 23:10:57', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2769', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log/main', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:10:57', '1', 'admin', '2018-06-20 23:10:57', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2770', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 23:22:17', '1', 'admin', '2018-06-20 23:22:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2771', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 23:22:17', '1', 'admin', '2018-06-20 23:22:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2772', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:22:18', '1', 'admin', '2018-06-20 23:22:18', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2773', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 23:22:43', '1', 'admin', '2018-06-20 23:22:43', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2774', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 23:22:43', '1', 'admin', '2018-06-20 23:22:43', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2775', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:22:43', '1', 'admin', '2018-06-20 23:22:43', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2776', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:24:15', '1', 'admin', '2018-06-20 23:24:15', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2777', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:24:17', '1', 'admin', '2018-06-20 23:24:17', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2778', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 23:24:26', '1', 'admin', '2018-06-20 23:24:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2779', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 23:24:26', '1', 'admin', '2018-06-20 23:24:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2780', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:24:26', '1', 'admin', '2018-06-20 23:24:26', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2781', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-20 23:24:51', '1', 'guest', '2018-06-20 23:24:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2782', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-20 23:24:52', '1', 'guest', '2018-06-20 23:24:52', '登陆');
INSERT INTO `sys_log` VALUES ('2783', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 23:24:52', '1', 'admin', '2018-06-20 23:24:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2784', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 23:24:52', '1', 'admin', '2018-06-20 23:24:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2785', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:24:52', '1', 'admin', '2018-06-20 23:24:52', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2786', '1', 'Internet Explorer 8', 'GET', null, '127.0.0.1', '/', '2018-06-20 23:25:13', '1', 'admin', '2018-06-20 23:25:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2787', '1', 'Internet Explorer 8', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 23:25:13', '1', 'admin', '2018-06-20 23:25:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2788', '1', 'Chrome', 'GET', null, '127.0.0.1', '/', '2018-06-20 23:25:37', '1', 'admin', '2018-06-20 23:25:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2789', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 23:25:38', '1', 'admin', '2018-06-20 23:25:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2790', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:25:38', '1', 'admin', '2018-06-20 23:25:38', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2791', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 23:28:21', '1', 'admin', '2018-06-20 23:28:21', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2792', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 23:28:22', '1', 'admin', '2018-06-20 23:28:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2793', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:28:23', '1', 'admin', '2018-06-20 23:28:23', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2794', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 23:28:54', '1', 'admin', '2018-06-20 23:28:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2795', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 23:28:54', '1', 'admin', '2018-06-20 23:28:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2796', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:28:55', '1', 'admin', '2018-06-20 23:28:55', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2797', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log/main', '2018-06-20 23:29:26', '1', 'admin', '2018-06-20 23:29:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2798', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log/main', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:29:27', '1', 'admin', '2018-06-20 23:29:27', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2799', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log/main', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:29:29', '1', 'admin', '2018-06-20 23:29:29', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2800', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user', '2018-06-20 23:29:40', '1', 'admin', '2018-06-20 23:29:40', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2801', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-20 23:29:40', '1', 'admin', '2018-06-20 23:29:40', '获取用户列表');
INSERT INTO `sys_log` VALUES ('2802', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 23:31:00', '1', 'admin', '2018-06-20 23:31:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2803', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 23:31:00', '1', 'admin', '2018-06-20 23:31:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2804', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:31:00', '1', 'admin', '2018-06-20 23:31:00', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2805', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:31:27', '1', 'admin', '2018-06-20 23:31:27', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2806', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/department', '2018-06-20 23:31:37', '1', 'admin', '2018-06-20 23:31:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2807', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-20 23:31:37', '1', 'admin', '2018-06-20 23:31:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2808', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-20 23:31:41', '1', 'admin', '2018-06-20 23:31:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2809', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-20 23:31:42', '1', 'admin', '2018-06-20 23:31:42', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2810', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-20 23:31:43', '1', 'admin', '2018-06-20 23:31:43', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2811', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-20 23:31:44', '1', 'admin', '2018-06-20 23:31:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2812', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-20 23:31:45', '1', 'admin', '2018-06-20 23:31:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2813', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-20 23:31:47', '1', 'admin', '2018-06-20 23:31:47', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2814', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-20 23:31:48', '1', 'admin', '2018-06-20 23:31:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2815', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-20 23:31:49', '1', 'admin', '2018-06-20 23:31:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2816', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-20 23:31:49', '1', 'admin', '2018-06-20 23:31:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2817', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-20 23:31:53', '1', 'admin', '2018-06-20 23:31:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2818', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-20 23:31:55', '1', 'admin', '2018-06-20 23:31:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2819', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-20 23:31:56', '1', 'admin', '2018-06-20 23:31:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2820', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-20 23:31:59', '1', 'admin', '2018-06-20 23:31:59', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2821', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-20 23:32:02', '1', 'admin', '2018-06-20 23:32:02', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2822', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-20 23:32:04', '1', 'admin', '2018-06-20 23:32:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2823', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-20 23:32:09', '1', 'admin', '2018-06-20 23:32:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2824', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-20 23:32:13', '1', 'admin', '2018-06-20 23:32:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2825', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-20 23:32:14', '1', 'admin', '2018-06-20 23:32:14', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2826', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log/main', '2018-06-20 23:32:46', '1', 'admin', '2018-06-20 23:32:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2827', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log/main', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:32:46', '1', 'admin', '2018-06-20 23:32:46', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2828', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log/main', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:32:49', '1', 'admin', '2018-06-20 23:32:49', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2829', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 23:37:44', '1', 'admin', '2018-06-20 23:37:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2830', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 23:37:44', '1', 'admin', '2018-06-20 23:37:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2831', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:37:44', '1', 'admin', '2018-06-20 23:37:44', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2832', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 23:37:46', '1', 'admin', '2018-06-20 23:37:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2833', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 23:37:46', '1', 'admin', '2018-06-20 23:37:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2834', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:37:46', '1', 'admin', '2018-06-20 23:37:46', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2835', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 23:38:28', '1', 'admin', '2018-06-20 23:38:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2836', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 23:38:28', '1', 'admin', '2018-06-20 23:38:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2837', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:38:28', '1', 'admin', '2018-06-20 23:38:28', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2838', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-20 23:38:34', '1', 'admin', '2018-06-20 23:38:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2839', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 23:38:34', '1', 'admin', '2018-06-20 23:38:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2840', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:38:35', '1', 'admin', '2018-06-20 23:38:35', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2841', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/logout', '2018-06-20 23:38:54', '1', 'admin', '2018-06-20 23:38:54', '退出登陆');
INSERT INTO `sys_log` VALUES ('2842', null, 'Chrome', 'POST', 'http://127.0.0.1/logout', '127.0.0.1', '/postLogin', '2018-06-20 23:38:55', '1', 'guest', '2018-06-20 23:38:55', '登陆');
INSERT INTO `sys_log` VALUES ('2843', '1', 'Chrome', 'GET', 'http://127.0.0.1/logout', '127.0.0.1', '/', '2018-06-20 23:38:55', '1', 'admin', '2018-06-20 23:38:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2844', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 23:38:55', '1', 'admin', '2018-06-20 23:38:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2845', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:38:55', '1', 'admin', '2018-06-20 23:38:55', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2846', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/logout', '2018-06-20 23:39:03', '1', 'admin', '2018-06-20 23:39:03', '退出登陆');
INSERT INTO `sys_log` VALUES ('2847', null, 'Chrome', 'POST', 'http://127.0.0.1/logout', '127.0.0.1', '/postLogin', '2018-06-20 23:39:04', '1', 'guest', '2018-06-20 23:39:04', '登陆');
INSERT INTO `sys_log` VALUES ('2848', '1', 'Chrome', 'GET', 'http://127.0.0.1/logout', '127.0.0.1', '/', '2018-06-20 23:39:04', '1', 'admin', '2018-06-20 23:39:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2849', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 23:39:04', '1', 'admin', '2018-06-20 23:39:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2850', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:39:05', '1', 'admin', '2018-06-20 23:39:05', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2851', '1', 'Chrome', 'GET', 'http://127.0.0.1/logout', '127.0.0.1', '/', '2018-06-20 23:40:40', '1', 'admin', '2018-06-20 23:40:40', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2852', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 23:40:40', '1', 'admin', '2018-06-20 23:40:40', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2853', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:40:41', '1', 'admin', '2018-06-20 23:40:41', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2854', '1', 'Chrome', 'GET', 'http://127.0.0.1/logout', '127.0.0.1', '/', '2018-06-20 23:40:43', '1', 'admin', '2018-06-20 23:40:43', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2855', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 23:40:43', '1', 'admin', '2018-06-20 23:40:43', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2856', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:40:43', '1', 'admin', '2018-06-20 23:40:43', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2857', '1', 'Chrome', 'GET', 'http://127.0.0.1/logout', '127.0.0.1', '/', '2018-06-20 23:41:13', '1', 'admin', '2018-06-20 23:41:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2858', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 23:41:14', '1', 'admin', '2018-06-20 23:41:14', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2859', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:41:14', '1', 'admin', '2018-06-20 23:41:14', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2860', '1', 'Chrome', 'GET', 'http://127.0.0.1/logout', '127.0.0.1', '/', '2018-06-20 23:41:30', '1', 'admin', '2018-06-20 23:41:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2861', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 23:41:30', '1', 'admin', '2018-06-20 23:41:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2862', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:41:30', '1', 'admin', '2018-06-20 23:41:30', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2863', '1', 'Chrome', 'GET', 'http://127.0.0.1/logout', '127.0.0.1', '/', '2018-06-20 23:41:46', '1', 'admin', '2018-06-20 23:41:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2864', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-20 23:41:46', '1', 'admin', '2018-06-20 23:41:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2865', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-20 23:41:46', '1', 'admin', '2018-06-20 23:41:46', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2866', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 10:29:32', '1', 'guest', '2018-06-21 10:29:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2867', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 10:29:41', '1', 'guest', '2018-06-21 10:29:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2868', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-21 10:29:43', '1', 'guest', '2018-06-21 10:29:43', '登陆');
INSERT INTO `sys_log` VALUES ('2869', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-21 10:29:43', '1', 'admin', '2018-06-21 10:29:43', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2870', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-21 10:29:44', '1', 'admin', '2018-06-21 10:29:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2871', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-21 10:29:44', '1', 'admin', '2018-06-21 10:29:44', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2872', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-21 10:29:50', '1', 'admin', '2018-06-21 10:29:50', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2873', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-21 10:29:55', '1', 'admin', '2018-06-21 10:29:55', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2874', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-21 10:30:08', '1', 'admin', '2018-06-21 10:30:08', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2875', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-21 10:30:31', '1', 'admin', '2018-06-21 10:30:31', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2876', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-21 10:30:32', '1', 'admin', '2018-06-21 10:30:32', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2877', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-21 10:30:33', '1', 'admin', '2018-06-21 10:30:33', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2878', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-21 10:30:34', '1', 'admin', '2018-06-21 10:30:34', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2879', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-21 10:30:36', '1', 'admin', '2018-06-21 10:30:36', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2880', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/department', '2018-06-21 10:36:45', '1', 'admin', '2018-06-21 10:36:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2881', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-21 10:36:46', '1', 'admin', '2018-06-21 10:36:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2882', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-21 10:36:50', '1', 'admin', '2018-06-21 10:36:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2883', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-21 10:36:55', '1', 'admin', '2018-06-21 10:36:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2884', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-21 10:37:03', '1', 'admin', '2018-06-21 10:37:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2885', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-21 10:37:04', '1', 'admin', '2018-06-21 10:37:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2886', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-21 10:37:04', '1', 'admin', '2018-06-21 10:37:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2887', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-21 10:37:05', '1', 'admin', '2018-06-21 10:37:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2888', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-21 10:37:05', '1', 'admin', '2018-06-21 10:37:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2889', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-21 10:37:06', '1', 'admin', '2018-06-21 10:37:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2890', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-21 10:37:07', '1', 'admin', '2018-06-21 10:37:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2891', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-21 10:37:07', '1', 'admin', '2018-06-21 10:37:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2892', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-21 10:37:07', '1', 'admin', '2018-06-21 10:37:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2893', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-21 10:37:08', '1', 'admin', '2018-06-21 10:37:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2894', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-21 10:37:09', '1', 'admin', '2018-06-21 10:37:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2895', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-21 10:37:10', '1', 'admin', '2018-06-21 10:37:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2896', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-21 10:37:13', '1', 'admin', '2018-06-21 10:37:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2897', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-21 10:37:19', '1', 'admin', '2018-06-21 10:37:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2898', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-21 10:37:20', '1', 'admin', '2018-06-21 10:37:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2899', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-21 10:37:21', '1', 'admin', '2018-06-21 10:37:21', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2900', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-21 10:37:22', '1', 'admin', '2018-06-21 10:37:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2901', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-21 10:37:23', '1', 'admin', '2018-06-21 10:37:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2902', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-21 10:37:24', '1', 'admin', '2018-06-21 10:37:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2903', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-21 10:37:25', '1', 'admin', '2018-06-21 10:37:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2904', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-21 10:37:26', '1', 'admin', '2018-06-21 10:37:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2905', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-21 10:37:32', '1', 'admin', '2018-06-21 10:37:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2906', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-21 10:37:34', '1', 'admin', '2018-06-21 10:37:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2907', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user', '2018-06-21 10:38:10', '1', 'admin', '2018-06-21 10:38:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2908', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-21 10:38:10', '1', 'admin', '2018-06-21 10:38:10', '获取用户列表');
INSERT INTO `sys_log` VALUES ('2909', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/editNote', '2018-06-21 10:38:26', '1', 'admin', '2018-06-21 10:38:26', '用户表格更新备注');
INSERT INTO `sys_log` VALUES ('2910', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-21 10:38:30', '1', 'admin', '2018-06-21 10:38:30', '获取用户列表');
INSERT INTO `sys_log` VALUES ('2911', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-21 10:38:30', '1', 'admin', '2018-06-21 10:38:30', '获取用户列表');
INSERT INTO `sys_log` VALUES ('2912', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-21 10:38:31', '1', 'admin', '2018-06-21 10:38:31', '获取用户列表');
INSERT INTO `sys_log` VALUES ('2913', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-21 10:38:31', '1', 'admin', '2018-06-21 10:38:31', '获取用户列表');
INSERT INTO `sys_log` VALUES ('2914', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-21 10:38:31', '1', 'admin', '2018-06-21 10:38:31', '获取用户列表');
INSERT INTO `sys_log` VALUES ('2915', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-21 10:38:32', '1', 'admin', '2018-06-21 10:38:32', '获取用户列表');
INSERT INTO `sys_log` VALUES ('2916', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-21 10:38:32', '1', 'admin', '2018-06-21 10:38:32', '获取用户列表');
INSERT INTO `sys_log` VALUES ('2917', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-21 10:38:39', '1', 'admin', '2018-06-21 10:38:39', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2918', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-21 10:38:39', '1', 'admin', '2018-06-21 10:38:39', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('2919', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/department', '2018-06-21 10:39:20', '1', 'admin', '2018-06-21 10:39:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2920', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-21 10:39:20', '1', 'admin', '2018-06-21 10:39:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2921', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-21 10:45:11', '1', 'admin', '2018-06-21 10:45:11', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2922', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-21 10:45:30', '1', 'admin', '2018-06-21 10:45:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2923', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-21 10:45:30', '1', 'admin', '2018-06-21 10:45:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2924', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-21 10:45:30', '1', 'admin', '2018-06-21 10:45:30', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2925', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/logout', '2018-06-21 10:47:58', '1', 'admin', '2018-06-21 10:47:58', '退出登陆');
INSERT INTO `sys_log` VALUES ('2926', null, 'Chrome', 'POST', 'http://127.0.0.1/logout', '127.0.0.1', '/postLogin', '2018-06-21 10:49:49', '1', 'guest', '2018-06-21 10:49:49', '登陆');
INSERT INTO `sys_log` VALUES ('2927', '1', 'Chrome', 'GET', 'http://127.0.0.1/logout', '127.0.0.1', '/', '2018-06-21 10:49:49', '1', 'admin', '2018-06-21 10:49:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2928', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-21 10:49:49', '1', 'admin', '2018-06-21 10:49:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2929', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-21 10:49:49', '1', 'admin', '2018-06-21 10:49:49', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2930', null, 'Chrome', 'GET', 'http://127.0.0.1/logout', '127.0.0.1', '/login', '2018-06-21 16:31:25', '1', 'guest', '2018-06-21 16:31:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2931', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-21 16:31:27', '1', 'guest', '2018-06-21 16:31:27', '登陆');
INSERT INTO `sys_log` VALUES ('2932', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-21 16:31:27', '1', 'admin', '2018-06-21 16:31:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2933', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-21 16:31:27', '1', 'admin', '2018-06-21 16:31:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2934', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-21 16:31:27', '1', 'admin', '2018-06-21 16:31:27', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2935', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-21 16:31:50', '1', 'admin', '2018-06-21 16:31:50', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2936', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-21 16:31:51', '1', 'admin', '2018-06-21 16:31:51', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2937', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-21 16:31:51', '1', 'admin', '2018-06-21 16:31:51', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2938', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-21 16:31:52', '1', 'admin', '2018-06-21 16:31:52', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2939', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-21 16:31:53', '1', 'admin', '2018-06-21 16:31:53', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2940', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-21 16:31:53', '1', 'admin', '2018-06-21 16:31:53', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2941', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-21 16:31:54', '1', 'admin', '2018-06-21 16:31:54', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2942', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-21 16:31:55', '1', 'admin', '2018-06-21 16:31:55', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2943', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user', '2018-06-21 16:32:28', '1', 'admin', '2018-06-21 16:32:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2944', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-21 16:32:28', '1', 'admin', '2018-06-21 16:32:28', '获取用户列表');
INSERT INTO `sys_log` VALUES ('2945', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/department', '2018-06-21 16:56:42', '1', 'admin', '2018-06-21 16:56:42', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2946', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-21 16:56:43', '1', 'admin', '2018-06-21 16:56:43', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2947', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 18:31:42', '1', 'guest', '2018-06-21 18:31:42', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2948', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:48:36', '1', 'guest', '2018-06-21 19:48:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2949', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:49:56', '1', 'guest', '2018-06-21 19:49:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2950', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:49:57', '1', 'guest', '2018-06-21 19:49:57', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2951', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:51:38', '1', 'guest', '2018-06-21 19:51:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2952', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:51:57', '1', 'guest', '2018-06-21 19:51:57', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2953', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:51:59', '1', 'guest', '2018-06-21 19:51:59', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2954', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:52:18', '1', 'guest', '2018-06-21 19:52:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2955', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:52:20', '1', 'guest', '2018-06-21 19:52:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2956', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:52:21', '1', 'guest', '2018-06-21 19:52:21', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2957', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:52:38', '1', 'guest', '2018-06-21 19:52:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2958', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:53:08', '1', 'guest', '2018-06-21 19:53:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2959', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:53:47', '1', 'guest', '2018-06-21 19:53:47', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2960', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:53:51', '1', 'guest', '2018-06-21 19:53:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2961', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:54:16', '1', 'guest', '2018-06-21 19:54:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2962', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:54:31', '1', 'guest', '2018-06-21 19:54:31', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2963', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:54:57', '1', 'guest', '2018-06-21 19:54:57', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2964', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:55:06', '1', 'guest', '2018-06-21 19:55:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2965', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:55:08', '1', 'guest', '2018-06-21 19:55:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2966', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:55:14', '1', 'guest', '2018-06-21 19:55:14', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2967', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:55:14', '1', 'guest', '2018-06-21 19:55:14', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2968', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:55:23', '1', 'guest', '2018-06-21 19:55:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2969', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:55:25', '1', 'guest', '2018-06-21 19:55:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2970', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:55:26', '1', 'guest', '2018-06-21 19:55:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2971', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:55:27', '1', 'guest', '2018-06-21 19:55:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2972', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:55:27', '1', 'guest', '2018-06-21 19:55:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2973', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:55:27', '1', 'guest', '2018-06-21 19:55:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2974', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:56:25', '1', 'guest', '2018-06-21 19:56:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2975', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:56:26', '1', 'guest', '2018-06-21 19:56:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2976', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:56:27', '1', 'guest', '2018-06-21 19:56:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2977', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:56:28', '1', 'guest', '2018-06-21 19:56:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2978', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:56:28', '1', 'guest', '2018-06-21 19:56:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2979', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:56:52', '1', 'guest', '2018-06-21 19:56:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2980', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 19:56:59', '1', 'guest', '2018-06-21 19:56:59', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2981', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-21 20:03:16', '1', 'guest', '2018-06-21 20:03:16', '登陆');
INSERT INTO `sys_log` VALUES ('2982', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-21 20:03:17', '1', 'admin', '2018-06-21 20:03:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2983', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-21 20:03:17', '1', 'admin', '2018-06-21 20:03:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2984', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-21 20:03:17', '1', 'admin', '2018-06-21 20:03:17', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2985', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-21 20:12:07', '1', 'admin', '2018-06-21 20:12:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2986', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-21 20:12:07', '1', 'admin', '2018-06-21 20:12:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2987', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-21 20:12:08', '1', 'admin', '2018-06-21 20:12:08', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2988', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/department', '2018-06-21 20:12:32', '1', 'admin', '2018-06-21 20:12:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2989', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-21 20:12:32', '1', 'admin', '2018-06-21 20:12:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2990', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user', '2018-06-21 20:12:36', '1', 'admin', '2018-06-21 20:12:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2991', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-21 20:12:37', '1', 'admin', '2018-06-21 20:12:37', '获取用户列表');
INSERT INTO `sys_log` VALUES ('2992', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-21 20:12:41', '1', 'admin', '2018-06-21 20:12:41', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2993', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-21 20:12:46', '1', 'admin', '2018-06-21 20:12:46', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2994', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-21 20:20:47', '1', 'admin', '2018-06-21 20:20:47', '获取日志列表');
INSERT INTO `sys_log` VALUES ('2995', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/logout', '2018-06-21 20:21:37', '1', 'admin', '2018-06-21 20:21:37', '退出登陆');
INSERT INTO `sys_log` VALUES ('2996', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-21 20:30:29', '1', 'guest', '2018-06-21 20:30:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2997', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-21 20:30:44', '1', 'guest', '2018-06-21 20:30:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2998', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-21 20:32:20', '1', 'guest', '2018-06-21 20:32:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('2999', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-21 20:33:26', '1', 'guest', '2018-06-21 20:33:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3000', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 20:36:53', '1', 'guest', '2018-06-21 20:36:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3001', null, 'Internet Explorer 8', 'GET', null, '127.0.0.1', '/login', '2018-06-21 20:36:57', '1', 'guest', '2018-06-21 20:36:57', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3002', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 20:37:19', '1', 'guest', '2018-06-21 20:37:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3003', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-21 20:37:26', '1', 'guest', '2018-06-21 20:37:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3004', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-21 21:00:50', '1', 'guest', '2018-06-21 21:00:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3005', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-21 21:00:52', '1', 'guest', '2018-06-21 21:00:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3006', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-21 21:01:46', '1', 'guest', '2018-06-21 21:01:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3007', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-21 21:02:56', '1', 'guest', '2018-06-21 21:02:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3008', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-21 21:02:58', '1', 'guest', '2018-06-21 21:02:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3009', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-21 21:03:27', '1', 'guest', '2018-06-21 21:03:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3010', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-21 21:03:30', '1', 'guest', '2018-06-21 21:03:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3011', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-21 21:03:50', '1', 'guest', '2018-06-21 21:03:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3012', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-21 21:05:42', '1', 'guest', '2018-06-21 21:05:42', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3013', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-21 21:07:23', '1', 'guest', '2018-06-21 21:07:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3014', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-21 21:11:53', '1', 'guest', '2018-06-21 21:11:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3015', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-21 21:11:55', '1', 'guest', '2018-06-21 21:11:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3016', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-21 21:12:39', '1', 'guest', '2018-06-21 21:12:39', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3017', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-21 21:14:08', '1', 'guest', '2018-06-21 21:14:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3018', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-21 21:14:55', '1', 'guest', '2018-06-21 21:14:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3019', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-21 21:18:49', '1', 'guest', '2018-06-21 21:18:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3020', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-21 21:26:32', '1', 'guest', '2018-06-21 21:26:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3021', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-21 21:27:10', '1', 'guest', '2018-06-21 21:27:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3022', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-21 21:27:52', '1', 'guest', '2018-06-21 21:27:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3023', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 21:33:20', '1', 'guest', '2018-06-21 21:33:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3024', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-21 21:43:39', '1', 'guest', '2018-06-21 21:43:39', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3025', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 22:49:10', '1', 'guest', '2018-06-21 22:49:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3026', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 22:55:24', '1', 'guest', '2018-06-21 22:55:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3027', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 22:55:25', '1', 'guest', '2018-06-21 22:55:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3028', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 22:55:26', '1', 'guest', '2018-06-21 22:55:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3029', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 22:55:27', '1', 'guest', '2018-06-21 22:55:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3030', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 22:55:52', '1', 'guest', '2018-06-21 22:55:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3031', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 23:04:24', '1', 'guest', '2018-06-21 23:04:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3032', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 23:04:34', '1', 'guest', '2018-06-21 23:04:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3033', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 23:07:37', '1', 'guest', '2018-06-21 23:07:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3034', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 23:07:39', '1', 'guest', '2018-06-21 23:07:39', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3035', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 23:09:24', '1', 'guest', '2018-06-21 23:09:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3036', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 23:09:25', '1', 'guest', '2018-06-21 23:09:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3037', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 23:09:26', '1', 'guest', '2018-06-21 23:09:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3038', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 23:09:26', '1', 'guest', '2018-06-21 23:09:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3039', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 23:09:26', '1', 'guest', '2018-06-21 23:09:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3040', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 23:10:58', '1', 'guest', '2018-06-21 23:10:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3041', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 23:13:12', '1', 'guest', '2018-06-21 23:13:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3042', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 23:13:13', '1', 'guest', '2018-06-21 23:13:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3043', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 23:13:14', '1', 'guest', '2018-06-21 23:13:14', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3044', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 23:13:15', '1', 'guest', '2018-06-21 23:13:15', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3045', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 23:24:13', '1', 'guest', '2018-06-21 23:24:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3046', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 23:27:37', '1', 'guest', '2018-06-21 23:27:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3047', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 23:27:39', '1', 'guest', '2018-06-21 23:27:39', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3048', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 23:27:41', '1', 'guest', '2018-06-21 23:27:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3049', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-21 23:33:36', '1', 'guest', '2018-06-21 23:33:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3050', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-22 09:15:22', '1', 'guest', '2018-06-22 09:15:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3051', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-22 09:24:01', '1', 'guest', '2018-06-22 09:24:01', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3052', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-22 09:24:55', '1', 'guest', '2018-06-22 09:24:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3053', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-22 09:27:09', '1', 'guest', '2018-06-22 09:27:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3054', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-22 09:31:24', '1', 'guest', '2018-06-22 09:31:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3055', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-22 09:44:26', '1', 'guest', '2018-06-22 09:44:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3056', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-22 09:50:48', '1', 'guest', '2018-06-22 09:50:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3057', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-22 09:53:05', '1', 'guest', '2018-06-22 09:53:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3058', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-22 09:58:13', '1', 'guest', '2018-06-22 09:58:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3059', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-22 10:26:42', '1', 'guest', '2018-06-22 10:26:42', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3060', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-22 10:27:01', '1', 'guest', '2018-06-22 10:27:01', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3061', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-22 10:27:09', '1', 'guest', '2018-06-22 10:27:09', '登陆');
INSERT INTO `sys_log` VALUES ('3062', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-22 10:27:10', '1', 'admin', '2018-06-22 10:27:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3063', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-22 10:27:10', '1', 'admin', '2018-06-22 10:27:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3064', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 10:27:11', '1', 'admin', '2018-06-22 10:27:11', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3065', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/department', '2018-06-22 10:27:58', '1', 'admin', '2018-06-22 10:27:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3066', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-22 10:27:58', '1', 'admin', '2018-06-22 10:27:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3067', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-22 10:28:00', '1', 'admin', '2018-06-22 10:28:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3068', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-22 10:28:01', '1', 'admin', '2018-06-22 10:28:01', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3069', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-22 10:28:01', '1', 'admin', '2018-06-22 10:28:01', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3070', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-22 10:28:01', '1', 'admin', '2018-06-22 10:28:01', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3071', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-22 10:28:03', '1', 'admin', '2018-06-22 10:28:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3072', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-22 10:28:03', '1', 'admin', '2018-06-22 10:28:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3073', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-22 10:28:04', '1', 'admin', '2018-06-22 10:28:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3074', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-22 10:28:04', '1', 'admin', '2018-06-22 10:28:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3075', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-22 10:28:05', '1', 'admin', '2018-06-22 10:28:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3076', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-22 12:08:18', '1', 'guest', '2018-06-22 12:08:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3077', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-22 12:08:20', '1', 'guest', '2018-06-22 12:08:20', '登陆');
INSERT INTO `sys_log` VALUES ('3078', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-22 12:08:20', '1', 'admin', '2018-06-22 12:08:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3079', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-22 12:08:21', '1', 'admin', '2018-06-22 12:08:21', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3080', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 12:08:21', '1', 'admin', '2018-06-22 12:08:21', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3081', '1', 'Chrome', 'GET', null, '127.0.0.1', '/', '2018-06-22 12:08:24', '1', 'admin', '2018-06-22 12:08:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3082', null, 'Chrome', 'GET', null, '0:0:0:0:0:0:0:1', '/login', '2018-06-22 12:08:24', '1', 'guest', '2018-06-22 12:08:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3083', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-22 12:08:24', '1', 'admin', '2018-06-22 12:08:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3084', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 12:08:25', '1', 'admin', '2018-06-22 12:08:25', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3085', null, 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/login', '2018-06-22 12:08:36', '1', 'guest', '2018-06-22 12:08:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3086', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-22 12:08:37', '1', 'guest', '2018-06-22 12:08:37', '登陆');
INSERT INTO `sys_log` VALUES ('3087', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-22 12:08:37', '1', 'admin', '2018-06-22 12:08:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3088', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-22 12:08:38', '1', 'admin', '2018-06-22 12:08:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3089', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 12:08:38', '1', 'admin', '2018-06-22 12:08:38', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3090', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-22 12:08:50', '1', 'admin', '2018-06-22 12:08:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3091', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-22 12:08:51', '1', 'admin', '2018-06-22 12:08:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3092', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 12:08:51', '1', 'admin', '2018-06-22 12:08:51', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3093', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 12:08:57', '1', 'admin', '2018-06-22 12:08:57', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3094', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user', '2018-06-22 12:09:10', '1', 'admin', '2018-06-22 12:09:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3095', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 12:09:10', '1', 'admin', '2018-06-22 12:09:10', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3096', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log/main', '2018-06-22 12:09:14', '1', 'admin', '2018-06-22 12:09:14', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3097', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log/main', '127.0.0.1', '/system/log/getLogList', '2018-06-22 12:09:14', '1', 'admin', '2018-06-22 12:09:14', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3098', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user/profile', '2018-06-22 12:09:15', '1', 'admin', '2018-06-22 12:09:15', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3099', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/profile', '127.0.0.1', '/system/user/getUserList', '2018-06-22 12:09:15', '1', 'admin', '2018-06-22 12:09:15', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3100', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user/changepwd', '2018-06-22 12:09:16', '1', 'admin', '2018-06-22 12:09:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3101', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/changepwd', '127.0.0.1', '/system/user/getUserList', '2018-06-22 12:09:16', '1', 'admin', '2018-06-22 12:09:16', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3102', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/department', '2018-06-22 12:09:18', '1', 'admin', '2018-06-22 12:09:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3103', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-22 12:09:18', '1', 'admin', '2018-06-22 12:09:18', '方法没有描述');

-- ----------------------------
-- Table structure for `sys_msg`
-- ----------------------------
DROP TABLE IF EXISTS `sys_msg`;
CREATE TABLE `sys_msg` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type` varchar(1) DEFAULT NULL COMMENT '消息类型 0-系统消息 1-个人消息',
  `sender` varchar(255) DEFAULT NULL COMMENT '发送者',
  `receiver` varchar(255) DEFAULT NULL COMMENT '接收着',
  `context` blob COMMENT '消息内容',
  `sendtime` datetime DEFAULT NULL COMMENT '发送时间',
  `title` varchar(255) DEFAULT NULL COMMENT '消息标题',
  `isread` tinyint(1) DEFAULT NULL COMMENT '是否已读 0-未读 1-已读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_msg
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_quartz`
-- ----------------------------
DROP TABLE IF EXISTS `sys_quartz`;
CREATE TABLE `sys_quartz` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `jobType` char(1) NOT NULL,
  `jobName` varchar(255) NOT NULL DEFAULT '' COMMENT '任务名',
  `jobGroup` varchar(255) NOT NULL DEFAULT '' COMMENT '组名',
  `triggerName` varchar(255) NOT NULL DEFAULT '' COMMENT '触发器名',
  `triggerGroupName` varchar(255) NOT NULL DEFAULT '' COMMENT '触发器组名',
  `jobClass` varchar(255) NOT NULL DEFAULT '' COMMENT '类名',
  `cronExpr` varchar(255) DEFAULT '' COMMENT '定时表达式',
  `previousFireTime` datetime DEFAULT NULL COMMENT 'previousFireTime',
  `nextFireTime` datetime DEFAULT NULL COMMENT '下次执行时间',
  `jobStatus` char(1) NOT NULL DEFAULT '0' COMMENT '任务状态',
  `createTime` datetime DEFAULT NULL COMMENT '新建时间',
  `lastUpdTime` datetime DEFAULT NULL COMMENT '最后更新时间',
  `startTime` datetime DEFAULT NULL COMMENT '开始运行时间',
  `endTime` datetime DEFAULT NULL COMMENT '结束运行时间',
  `jobMemo` varchar(255) DEFAULT '' COMMENT '任务备忘',
  `jobMethod` varchar(255) DEFAULT NULL,
  `intervalInMilliseconds` bigint(20) DEFAULT NULL COMMENT '毫秒间隔',
  `intervalInSeconds` int(10) DEFAULT NULL COMMENT '秒间隔',
  `intervalInMinutes` int(10) DEFAULT NULL COMMENT '分钟间隔',
  `intervalInHours` int(10) DEFAULT NULL COMMENT '小时间隔',
  `count` int(10) DEFAULT NULL,
  `jobObject` varchar(255) DEFAULT NULL,
  `jobDataMap` blob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`jobName`,`jobGroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_quartz
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_res`
-- ----------------------------
DROP TABLE IF EXISTS `sys_res`;
CREATE TABLE `sys_res` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pid` bigint(20) DEFAULT NULL COMMENT '父菜单id',
  `name` varchar(111) DEFAULT NULL COMMENT '菜单名称',
  `des` varchar(255) DEFAULT NULL COMMENT '菜单描述',
  `url` varchar(255) DEFAULT NULL COMMENT '菜单url',
  `level` int(11) DEFAULT NULL COMMENT '菜单等级',
  `iconCls` varchar(255) DEFAULT 'am-icon-file' COMMENT '菜单ICON图标',
  `seq` bigint(20) DEFAULT '1' COMMENT '菜单排序',
  `type` varchar(2) DEFAULT '2' COMMENT '菜单类型 1 功能 2 页面',
  `status` varchar(2) DEFAULT '1' COMMENT '1-启用 0-未启用',
  `lastUpdAcct` varchar(20) DEFAULT NULL COMMENT '更新者',
  `lastUpdTime` datetime DEFAULT NULL COMMENT '更新时间',
  `note` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_res
-- ----------------------------
INSERT INTO `sys_res` VALUES ('2', '0', '系统管理', '系统管理', '#', '2', 'fa fa-forumbee', '1', '1', '1', 'admin', '2016-10-25 10:47:23', '修改资源');
INSERT INTO `sys_res` VALUES ('3', '2', '资源管理', '资源管理', '/system/res', '3', 'fa fa-forumbee', '1', '1', '1', 'admin', '2016-10-18 16:24:08', '添加资源');
INSERT INTO `sys_res` VALUES ('4', '2', '用户管理', '用户管理', '/system/user', '3', 'fa fa-forumbee', '3', '1', '1', '', '2017-10-13 11:26:19', '修改系统资源');
INSERT INTO `sys_res` VALUES ('5', '2', '部门管理', '部门管理', '/system/department', '3', 'fa fa-forumbee', '1', '2', '1', 'admin', '2018-01-23 12:03:03', '保存系统资源');
INSERT INTO `sys_res` VALUES ('8', '2', '数据管理', '数据管理', '/system/data', '3', 'fa fa-forumbee', '8', '1', '1', 'admin', '2016-10-20 21:29:24', '修改资源');
INSERT INTO `sys_res` VALUES ('9', '2', '日志管理', '日志管理', '/system/log/main', '3', 'fa fa-forumbee', '10', '1', '1', 'admin', '2016-10-18 19:31:47', '添加资源');
INSERT INTO `sys_res` VALUES ('10', '2', '角色管理', '角色管理', '/system/role', '3', 'fa fa-forumbee', '2', '1', '1', '', '2017-10-13 11:26:14', '修改系统资源');
INSERT INTO `sys_res` VALUES ('13', '2', '个人资料', '个人资料', '/system/user/profile', '3', 'fa fa-forumbee', '15', '1', '1', 'admin', '2016-10-25 16:16:00', '添加资源');
INSERT INTO `sys_res` VALUES ('14', '2', '修改密码', '修改密码', '/system/user/changepwd', '3', 'fa fa-forumbee', '20', '1', '1', 'admin', '2017-10-17 11:44:37', '启用系统资源');
INSERT INTO `sys_res` VALUES ('17', '2', '页面管理', '页面管理', '/system/page', '3', 'fa fa-forumbee', '7', '1', '1', 'admin', '2017-03-29 16:31:47', '添加资源');
INSERT INTO `sys_res` VALUES ('20', '3', '资源管理-添加', '资源管理-添加', '/system/res/add', '4', 'fa fa-forumbee', '1', '2', '1', 'admin', '2018-01-17 19:06:41', '启用系统资源');
INSERT INTO `sys_res` VALUES ('21', '3', '资源管理-编辑', '资源管理-编辑', '/system/res/update', '4', 'fa fa-forumbee', '2', '2', '1', 'admin', '2017-05-11 16:24:08', '添加资源');
INSERT INTO `sys_res` VALUES ('22', '3', '资源管理-删除', '资源管理-删除', '/system/res/delete', '4', 'fa fa-forumbee', '3', '2', '1', 'admin', '2017-05-11 16:24:46', '添加资源');
INSERT INTO `sys_res` VALUES ('23', '4', '用户管理-新增', '用户管理-新增', '/system/user/add', '4', 'fa fa-forumbee', '1', '2', '1', 'admin', '2017-05-11 16:35:50', '添加资源');
INSERT INTO `sys_res` VALUES ('24', '4', '用户管理-编辑', '用户管理-编辑', '/system/user/update', '4', 'fa fa-forumbee', '2', '2', '1', 'admin', '2017-05-11 16:36:21', '添加资源');
INSERT INTO `sys_res` VALUES ('25', '4', '用户管理-删除', '用户管理-删除', '/system/user/delete', '4', 'fa fa-forumbee', '3', '2', '1', 'admin', '2017-05-11 16:36:45', '添加资源');
INSERT INTO `sys_res` VALUES ('26', '10', '角色管理-新增', '角色管理-新增', '/system/role/add', '4', 'fa fa-forumbee', '1', '2', '1', 'admin', '2017-05-11 16:37:14', '添加资源');
INSERT INTO `sys_res` VALUES ('27', '10', '角色管理-编辑', '角色管理-编辑', '/system/role/update', '4', 'fa fa-forumbee', '1', '2', '1', 'admin', '2017-05-11 16:37:59', '修改资源');
INSERT INTO `sys_res` VALUES ('28', '10', '角色管理-删除', '角色管理-删除', '/system/role/delete', '4', 'fa fa-forumbee', '3', '2', '1', 'admin', '2017-05-11 16:38:28', '添加资源');
INSERT INTO `sys_res` VALUES ('46', '3', '资源管理-启用', '资源管理-启用', '/system/res/use', '4', 'fa fa-forumbee', '4', '2', '1', 'admin', '2017-10-17 16:38:34', '保存系统资源');
INSERT INTO `sys_res` VALUES ('47', '3', '资源管理-停用', '资源管理-停用', '/system/res/unuse', '4', 'fa fa-forumbee', '6', '2', '1', 'admin', '2017-10-17 16:39:03', '保存系统资源');
INSERT INTO `sys_res` VALUES ('48', '8', '数据管理-添加', '数据管理-添加', '/system/data/add', '4', 'fa fa-forumbee', '1', '2', '1', 'admin', '2017-10-17 17:11:10', '修改系统资源');
INSERT INTO `sys_res` VALUES ('49', '8', '数据管理-修改', '数据管理-修改', '/system/data/update', '4', 'fa fa-forumbee', '2', '2', '1', 'admin', '2017-10-17 17:11:17', '修改系统资源');
INSERT INTO `sys_res` VALUES ('50', '8', '数据管理-删除', '数据管理-删除', '/system/data/delete', '4', 'fa fa-forumbee', '3', '2', '1', 'admin', '2017-10-17 16:59:59', '保存系统资源');
INSERT INTO `sys_res` VALUES ('51', '8', '数据管理-启用', '数据管理-启用', '/system/data/use', '4', 'fa fa-forumbee', '4', '2', '1', 'admin', '2017-10-17 17:00:32', '保存系统资源');
INSERT INTO `sys_res` VALUES ('52', '8', '数据管理-停用', '数据管理-停用', '/system/data/unuse', '4', 'fa fa-forumbee', '5', '2', '1', 'admin', '2017-10-17 17:00:58', '保存系统资源');
INSERT INTO `sys_res` VALUES ('53', '10', '角色管理-权限', '角色管理-权限', '/system/role/auth', '4', 'fa fa-forumbee', '4', '2', '1', 'admin', '2017-10-19 11:36:33', '保存系统资源');
INSERT INTO `sys_res` VALUES ('54', '4', '用户管理-解锁', '用户管理-解锁', '/system/user/use', '4', 'fa fa-forumbee', '4', '2', '1', 'admin', '2017-10-19 11:43:39', '修改系统资源');
INSERT INTO `sys_res` VALUES ('55', '4', '用户管理-锁定', '用户管理-锁定', '/system/user/unuse', '4', 'fa fa-forumbee', '5', '2', '1', 'admin', '2018-01-03 16:23:21', '启用系统资源');
INSERT INTO `sys_res` VALUES ('56', '1', '监控管理', '监控管理', '#', '2', 'fa fa-forumbee', '2', '1', '1', 'admin', '2017-10-19 11:53:00', '保存系统资源');
INSERT INTO `sys_res` VALUES ('57', '56', '注册中心监控', '注册中心监控', 'http://127.0.0.1:8500', '3', 'fa fa-forumbee', '1', '1', '1', 'admin', '2018-01-11 13:23:09', '修改系统资源');
INSERT INTO `sys_res` VALUES ('58', '56', '服务监控', '服务监控', 'http://127.0.0.1:7010/hystrix', '3', 'fa fa-forumbee', '5', '1', '1', 'admin', '2018-01-11 13:23:23', '修改系统资源');
INSERT INTO `sys_res` VALUES ('59', '8', '数据管理-刷新缓存', '数据管理-刷新缓存', '/system/data/cache', '4', 'fa fa-forumbee', '6', '2', '1', 'admin', '2017-10-24 09:47:50', '修改系统资源');
INSERT INTO `sys_res` VALUES ('60', '2', '会话管理', '会话管理', '/system/session', '4', 'fa fa-forumbee', '4', '1', '1', 'admin', '2017-10-24 10:11:44', '保存系统资源');
INSERT INTO `sys_res` VALUES ('61', '56', '服务链路跟踪', '服务链路跟踪', 'http://127.0.0.1:9411', '3', 'fa fa-forumbee', '15', '1', '1', 'admin', '2018-01-11 13:23:30', '修改系统资源');
INSERT INTO `sys_res` VALUES ('62', '56', '服务治理', '服务治理', 'http://127.0.0.1:7001', '3', 'fa fa-forumbee', '4', '1', '1', 'admin', '2018-01-11 13:23:16', '修改系统资源');
INSERT INTO `sys_res` VALUES ('65', '0', '电商平台', '电商平台', '#', '1', 'fa fa-forumbee', '2', '1', '1', 'admin', '2018-01-23 12:01:46', '修改系统资源');
INSERT INTO `sys_res` VALUES ('93', '97', '商品管理-添加', '商品管理-添加', '/b2c/product/add', '4', 'fa fa-forumbee', '1', '2', '1', 'admin', '2018-01-23 11:59:34', '修改系统资源');
INSERT INTO `sys_res` VALUES ('94', '97', '商品管理-编辑', '商品管理-编辑', '/b2c/product/update', '4', 'fa fa-forumbee', '2', '2', '1', 'admin', '2018-01-23 11:53:55', '保存系统资源');
INSERT INTO `sys_res` VALUES ('95', '97', '商品管理-删除', '商品管理-删除', '/b2c/product/delete', '4', 'fa fa-forumbee', '3', '2', '1', 'admin', '2018-01-23 11:54:35', '保存系统资源');
INSERT INTO `sys_res` VALUES ('96', '65', '商品中心', '商品中心', '#', '2', 'fa fa-forumbee', '1', '1', '1', 'admin', '2018-01-23 12:02:27', '保存系统资源');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) DEFAULT NULL COMMENT '角色名称',
  `relotype` varchar(2) NOT NULL DEFAULT '0' COMMENT '角色类型',
  `des` varchar(55) DEFAULT NULL COMMENT '角色简介',
  `createdate` datetime DEFAULT NULL COMMENT '创建日期',
  `status` varchar(2) DEFAULT '1' COMMENT '1-启用 0-未启用',
  `lastUpdAcct` varchar(20) DEFAULT NULL COMMENT '最近修改管理员',
  `lastUpdTime` datetime DEFAULT NULL COMMENT '最近修改时间',
  `note` varchar(200) DEFAULT NULL COMMENT '修改信息',
  `iconcls` varchar(50) DEFAULT NULL COMMENT '节点图标CSS类名',
  `seq` bigint(20) DEFAULT '1' COMMENT '序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_role_res`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_res`;
CREATE TABLE `sys_role_res` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `res_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sys_ROLE_RES_RES_ID` (`res_id`) USING BTREE,
  KEY `FK_sys_ROLE_RES_ROLE_ID` (`role_id`) USING BTREE,
  CONSTRAINT `sys_role_res_ibfk_1` FOREIGN KEY (`res_id`) REFERENCES `sys_res` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sys_role_res_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_res
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(55) DEFAULT NULL COMMENT '真实姓名',
  `username` varchar(55) DEFAULT NULL COMMENT '用户名',
  `pwd` varchar(255) DEFAULT NULL COMMENT '密码（加密）',
  `salt2` varchar(55) DEFAULT NULL COMMENT '盐值',
  `status` varchar(2) DEFAULT '1' COMMENT '状态#1 正常 2.封号 ',
  `avatar` varchar(255) DEFAULT 'images/guest.jpg' COMMENT '用户头像',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `createdate` datetime DEFAULT NULL COMMENT '创建日期',
  `telphone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `onlineStatus` varchar(2) DEFAULT NULL COMMENT '在线状态  1-在线 0-离线',
  `companyid` char(32) DEFAULT NULL COMMENT '企业ID',
  `departmentid` char(32) DEFAULT NULL COMMENT '所属部门',
  `position` varchar(255) DEFAULT NULL COMMENT '职位',
  `credentialType` tinyint(2) DEFAULT '0' COMMENT '证件类型',
  `credentialNum` varchar(30) DEFAULT NULL COMMENT '证件号码',
  `gender` tinyint(2) DEFAULT '0' COMMENT '性别 1-男，0-女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `lastUpdAcct` varchar(20) DEFAULT NULL COMMENT '最近修改管理员',
  `lastUpdTime` datetime DEFAULT NULL COMMENT '最近修改时间',
  `note` varchar(200) DEFAULT NULL COMMENT '修改信息',
  `version` varchar(255) DEFAULT NULL COMMENT 'token版本',
  `type` int(1) DEFAULT '0' COMMENT '用户类型 0-普通用户 1-微信用户 2-其他用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', null, 'admin', '8b276c6430bc6cfec325a09dc6713167', '66432cd44c4abf25202aca49a5e14436', '1', 'images/admin.jpg', null, null, null, null, null, null, null, '0', null, '0', null, null, null, 'admin', null, null);

-- ----------------------------
-- Table structure for `sys_user_res`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_res`;
CREATE TABLE `sys_user_res` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `res_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_res
-- ----------------------------
INSERT INTO `sys_user_res` VALUES ('1', '1', '1');
INSERT INTO `sys_user_res` VALUES ('2', '1', '65');
INSERT INTO `sys_user_res` VALUES ('3', '1', '2');
INSERT INTO `sys_user_res` VALUES ('4', '1', '56');
INSERT INTO `sys_user_res` VALUES ('5', '1', '3');
INSERT INTO `sys_user_res` VALUES ('6', '1', '4');
INSERT INTO `sys_user_res` VALUES ('7', '1', '8');
INSERT INTO `sys_user_res` VALUES ('8', '1', '9');
INSERT INTO `sys_user_res` VALUES ('9', '1', '10');
INSERT INTO `sys_user_res` VALUES ('10', '1', '13');
INSERT INTO `sys_user_res` VALUES ('11', '1', '14');
INSERT INTO `sys_user_res` VALUES ('12', '1', '5');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_SYSTME_USER_ROLE_USER_ID` (`user_id`) USING BTREE,
  KEY `FK_SYSTME_USER_ROLE_ROLE_ID` (`role_id`) USING BTREE,
  CONSTRAINT `sys_user_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sys_user_role_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_weixin`
-- ----------------------------
DROP TABLE IF EXISTS `sys_weixin`;
CREATE TABLE `sys_weixin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `wxid` varchar(255) DEFAULT NULL COMMENT '微信ID',
  `wxname` varchar(255) DEFAULT NULL COMMENT '微信名称',
  `wxtype` varchar(255) DEFAULT NULL COMMENT '微信类型 0-订阅号 1-服务好 2-企业号',
  `wxtoken` varchar(255) DEFAULT NULL COMMENT '微信Token',
  `wxappid` varchar(255) DEFAULT NULL COMMENT '微信APPID',
  `wxappsecret` varchar(255) DEFAULT NULL COMMENT '微信APPSecret',
  `wxqr_url` varchar(255) DEFAULT NULL COMMENT '微信二维码',
  `wxheading_url` varchar(255) DEFAULT NULL COMMENT '微信头像',
  `wxmchid` varchar(255) DEFAULT NULL COMMENT '微信商户号',
  `wxpaykey` varchar(255) DEFAULT NULL COMMENT '微信商户密钥',
  `wxoauth_url` varchar(255) DEFAULT NULL COMMENT '网页2.0授权地址,需要加http',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_weixin
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_wxma_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_wxma_user`;
CREATE TABLE `sys_wxma_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `maid` varchar(255) DEFAULT NULL COMMENT '小程序id--非appid,多小程序使用',
  `openid` varchar(255) DEFAULT NULL COMMENT '用户在该小程序下的openid',
  `unionid` varchar(255) DEFAULT NULL COMMENT '用户unionid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_wxma_user
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_wxmp_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_wxmp_user`;
CREATE TABLE `sys_wxmp_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mpid` varchar(255) DEFAULT NULL COMMENT '公众号id',
  `openid` varchar(255) DEFAULT NULL COMMENT '用户公众号下的openid',
  `unionid` varchar(255) DEFAULT NULL COMMENT 'unionid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_wxmp_user
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_wxqy_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_wxqy_user`;
CREATE TABLE `sys_wxqy_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `qyid` varchar(255) DEFAULT NULL COMMENT '企业id--非appid,多企业使用',
  `openid` varchar(255) DEFAULT NULL COMMENT '该企业下的用户openid',
  `unionid` varchar(255) DEFAULT NULL COMMENT 'unionid',
  `userid` varchar(255) DEFAULT NULL COMMENT '企业内用户userid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_wxqy_user
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_wxuser`
-- ----------------------------
DROP TABLE IF EXISTS `sys_wxuser`;
CREATE TABLE `sys_wxuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `userid` bigint(20) DEFAULT NULL COMMENT '用户id-关联系统用户',
  `wxid` int(15) DEFAULT NULL COMMENT '公众号id--多公众号使用',
  `openid` varchar(255) DEFAULT NULL COMMENT '用户openid',
  `country` varchar(255) DEFAULT NULL COMMENT '国家',
  `province` varchar(255) DEFAULT NULL COMMENT '省份',
  `city` varchar(255) DEFAULT NULL COMMENT '城市',
  `heading_url` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `status` varchar(2) DEFAULT NULL COMMENT '用户状态',
  `qyuserid` varchar(255) DEFAULT NULL COMMENT '企业号UserId',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_wxuser
-- ----------------------------

-- ----------------------------
-- Function structure for `querySysRes`
-- ----------------------------
DROP FUNCTION IF EXISTS `querySysRes`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `querySysRes`(treeCode INT) RETURNS varchar(4000) CHARSET utf8
    DETERMINISTIC
BEGIN

      DECLARE sTemp VARCHAR(4000);
      DECLARE sTempChd VARCHAR(1000);
    
      SET sTemp = '$';
      
      select id  into sTempChd from sys_res t where t.id = treeCode;
    
      WHILE sTempChd is not null DO
				IF (sTempChd != treeCode) THEN
				SET sTemp = concat(sTemp,',',sTempChd);
				END IF;
        SELECT group_concat(id) INTO sTempChd FROM sys_res where FIND_IN_SET(pid,sTempChd)>0;
      END WHILE;
      RETURN sTemp;
    END
;;
DELIMITER ;
