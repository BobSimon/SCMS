/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : scms

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-06-30 22:37:07
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
  `longnumber` varchar(50) DEFAULT NULL COMMENT '长编码，后台自动生成，用于描述层级关系',
  `parentid` int(15) DEFAULT NULL COMMENT '父部门id',
  `parentname` varchar(255) DEFAULT NULL COMMENT '父部门名称',
  `creater` varchar(255) DEFAULT NULL COMMENT '创建者',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(255) DEFAULT NULL COMMENT '更新者',
  `lastupdatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `enable` varchar(1) DEFAULT '1' COMMENT '是否启用 1-启用 0-不启用',
  `LEAF` varchar(1) DEFAULT '0' COMMENT '叶子节点(0:树枝节点;1:叶子节点)',
  `desc` varchar(255) DEFAULT NULL COMMENT '备注',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_department
-- ----------------------------
INSERT INTO `sys_department` VALUES ('1', '研发部1', 'sc!rd', '00010001', '2', '司晨信息科技1', '11111', null, null, null, '1', '0', '11111', 'fa fa-user');
INSERT INTO `sys_department` VALUES ('2', '司晨信息科技1', 'sc', '0001', '0', null, null, null, null, null, '1', '0', null, 'fa fa-user');
INSERT INTO `sys_department` VALUES ('3', '销售2', 'sc!sa', '000100010002', '1', '司晨信息科技', null, null, null, null, '1', '0', '11111', 'fa fa-user');
INSERT INTO `sys_department` VALUES ('4', '嵌入式1', 'sc!rd!fpga', '000100010001', '1', '嵌入式', null, null, null, null, '1', '0', '11111', 'fa fa-user');
INSERT INTO `sys_department` VALUES ('5', '硬件11', 'sc!rd!fpga!hd', '00010001000100010001', '4', '硬件', null, null, null, null, '1', '0', null, 'fa fa-user');
INSERT INTO `sys_department` VALUES ('6', '硬件1', 'sc!rd!fpga!hd!hd1', '000100010001000100010001', '5', '硬件', null, null, null, null, '1', '0', null, 'fa fa-user');

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
) ENGINE=InnoDB AUTO_INCREMENT=4843 DEFAULT CHARSET=utf8;

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
INSERT INTO `sys_log` VALUES ('3104', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/logout', '2018-06-22 12:23:34', '1', 'admin', '2018-06-22 12:23:34', '退出登陆');
INSERT INTO `sys_log` VALUES ('3105', null, 'Chrome', 'POST', 'http://127.0.0.1/logout', '127.0.0.1', '/postLogin', '2018-06-22 12:27:58', '1', 'guest', '2018-06-22 12:27:58', '登陆');
INSERT INTO `sys_log` VALUES ('3106', '1', 'Chrome', 'GET', 'http://127.0.0.1/logout', '127.0.0.1', '/', '2018-06-22 12:27:58', '1', 'admin', '2018-06-22 12:27:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3107', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-22 12:27:59', '1', 'admin', '2018-06-22 12:27:59', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3108', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 12:27:59', '1', 'admin', '2018-06-22 12:27:59', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3109', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/department', '2018-06-22 12:29:17', '1', 'admin', '2018-06-22 12:29:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3110', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-22 12:29:17', '1', 'admin', '2018-06-22 12:29:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3111', '1', 'Chrome', 'GET', null, '127.0.0.1', '//swaggerui', '2018-06-22 12:32:32', '1', 'admin', '2018-06-22 12:32:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3112', '1', 'Chrome', 'GET', null, '127.0.0.1', '/', '2018-06-22 12:34:11', '1', 'admin', '2018-06-22 12:34:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3113', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-22 12:34:11', '1', 'admin', '2018-06-22 12:34:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3114', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 12:34:11', '1', 'admin', '2018-06-22 12:34:11', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3115', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-22 12:57:55', '1', 'guest', '2018-06-22 12:57:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3116', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-22 12:58:15', '1', 'guest', '2018-06-22 12:58:15', '登陆');
INSERT INTO `sys_log` VALUES ('3117', null, 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/login', '2018-06-22 12:58:15', '1', 'guest', '2018-06-22 12:58:15', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3118', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-22 12:58:23', '1', 'guest', '2018-06-22 12:58:23', '登陆');
INSERT INTO `sys_log` VALUES ('3119', null, 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/login', '2018-06-22 12:58:23', '1', 'guest', '2018-06-22 12:58:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3120', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-22 12:58:58', '1', 'guest', '2018-06-22 12:58:58', '登陆');
INSERT INTO `sys_log` VALUES ('3121', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-22 12:58:58', '1', 'admin', '2018-06-22 12:58:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3122', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-22 12:58:58', '1', 'admin', '2018-06-22 12:58:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3123', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 12:58:58', '1', 'admin', '2018-06-22 12:58:58', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3124', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-22 13:29:40', '1', 'guest', '2018-06-22 13:29:40', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3125', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-22 13:29:41', '1', 'guest', '2018-06-22 13:29:41', '登陆');
INSERT INTO `sys_log` VALUES ('3126', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-22 13:29:41', '1', 'admin', '2018-06-22 13:29:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3127', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-22 13:29:41', '1', 'admin', '2018-06-22 13:29:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3128', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 13:29:42', '1', 'admin', '2018-06-22 13:29:42', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3129', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 13:51:39', '1', 'admin', '2018-06-22 13:51:39', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3130', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 13:51:40', '1', 'admin', '2018-06-22 13:51:40', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3131', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 13:51:44', '1', 'admin', '2018-06-22 13:51:44', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3132', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 13:51:45', '1', 'admin', '2018-06-22 13:51:45', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3133', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 13:51:45', '1', 'admin', '2018-06-22 13:51:45', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3134', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 13:51:45', '1', 'admin', '2018-06-22 13:51:45', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3135', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 13:51:46', '1', 'admin', '2018-06-22 13:51:46', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3136', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 13:51:46', '1', 'admin', '2018-06-22 13:51:46', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3137', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 13:51:46', '1', 'admin', '2018-06-22 13:51:46', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3138', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 13:51:47', '1', 'admin', '2018-06-22 13:51:47', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3139', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 13:51:47', '1', 'admin', '2018-06-22 13:51:47', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3140', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 13:54:15', '1', 'admin', '2018-06-22 13:54:15', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3141', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 13:54:15', '1', 'admin', '2018-06-22 13:54:15', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3142', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 13:54:17', '1', 'admin', '2018-06-22 13:54:17', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3143', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/logout', '2018-06-22 13:54:35', '1', 'admin', '2018-06-22 13:54:35', '退出登陆');
INSERT INTO `sys_log` VALUES ('3144', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-22 14:00:19', '1', 'guest', '2018-06-22 14:00:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3145', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-22 14:01:23', '1', 'guest', '2018-06-22 14:01:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3146', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-22 14:03:07', '1', 'guest', '2018-06-22 14:03:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3147', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-22 14:04:38', '1', 'guest', '2018-06-22 14:04:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3148', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-22 14:04:39', '1', 'guest', '2018-06-22 14:04:39', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3149', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-22 14:04:50', '1', 'guest', '2018-06-22 14:04:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3150', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-22 14:05:44', '1', 'guest', '2018-06-22 14:05:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3151', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-22 14:06:42', '1', 'guest', '2018-06-22 14:06:42', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3152', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-22 14:06:44', '1', 'guest', '2018-06-22 14:06:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3153', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-22 14:06:45', '1', 'guest', '2018-06-22 14:06:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3154', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-22 14:20:16', '1', 'guest', '2018-06-22 14:20:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3155', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-22 14:20:18', '1', 'guest', '2018-06-22 14:20:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3156', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-22 14:20:20', '1', 'guest', '2018-06-22 14:20:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3157', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-22 14:20:21', '1', 'guest', '2018-06-22 14:20:21', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3158', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-22 14:20:22', '1', 'guest', '2018-06-22 14:20:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3159', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-22 14:20:22', '1', 'guest', '2018-06-22 14:20:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3160', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-22 14:20:22', '1', 'guest', '2018-06-22 14:20:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3161', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-22 14:20:23', '1', 'guest', '2018-06-22 14:20:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3162', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-22 14:21:05', '1', 'guest', '2018-06-22 14:21:05', '登陆');
INSERT INTO `sys_log` VALUES ('3163', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-22 14:21:05', '1', 'admin', '2018-06-22 14:21:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3164', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-22 14:21:05', '1', 'admin', '2018-06-22 14:21:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3165', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 14:21:05', '1', 'admin', '2018-06-22 14:21:05', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3166', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/department', '2018-06-22 14:22:45', '1', 'admin', '2018-06-22 14:22:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3167', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-22 14:22:45', '1', 'admin', '2018-06-22 14:22:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3168', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user', '2018-06-22 14:30:31', '1', 'admin', '2018-06-22 14:30:31', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3169', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 14:30:31', '1', 'admin', '2018-06-22 14:30:31', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3170', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-22 14:37:48', '1', 'admin', '2018-06-22 14:37:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3171', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-22 14:37:48', '1', 'admin', '2018-06-22 14:37:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3172', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 14:37:48', '1', 'admin', '2018-06-22 14:37:48', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3173', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-22 14:39:04', '1', 'admin', '2018-06-22 14:39:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3174', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-22 14:39:04', '1', 'admin', '2018-06-22 14:39:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3175', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 14:39:04', '1', 'admin', '2018-06-22 14:39:04', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3176', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user', '2018-06-22 14:39:10', '1', 'admin', '2018-06-22 14:39:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3177', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 14:39:10', '1', 'admin', '2018-06-22 14:39:10', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3178', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-22 14:39:39', '1', 'admin', '2018-06-22 14:39:39', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3179', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-22 14:39:39', '1', 'admin', '2018-06-22 14:39:39', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3180', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 14:39:39', '1', 'admin', '2018-06-22 14:39:39', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3181', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/logout', '2018-06-22 14:39:59', '1', 'admin', '2018-06-22 14:39:59', '退出登陆');
INSERT INTO `sys_log` VALUES ('3182', null, 'Chrome', 'POST', 'http://127.0.0.1/logout', '127.0.0.1', '/postLogin', '2018-06-22 14:40:01', '1', 'guest', '2018-06-22 14:40:01', '登陆');
INSERT INTO `sys_log` VALUES ('3183', '1', 'Chrome', 'GET', 'http://127.0.0.1/logout', '127.0.0.1', '/', '2018-06-22 14:40:01', '1', 'admin', '2018-06-22 14:40:01', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3184', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-22 14:40:02', '1', 'admin', '2018-06-22 14:40:02', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3185', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 14:40:02', '1', 'admin', '2018-06-22 14:40:02', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3186', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/logout', '2018-06-22 14:40:05', '1', 'admin', '2018-06-22 14:40:05', '退出登陆');
INSERT INTO `sys_log` VALUES ('3187', null, 'Chrome', 'POST', 'http://127.0.0.1/logout', '127.0.0.1', '/postLogin', '2018-06-22 14:40:11', '1', 'guest', '2018-06-22 14:40:11', '登陆');
INSERT INTO `sys_log` VALUES ('3188', '1', 'Chrome', 'GET', 'http://127.0.0.1/logout', '127.0.0.1', '/', '2018-06-22 14:40:11', '1', 'admin', '2018-06-22 14:40:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3189', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-22 14:40:11', '1', 'admin', '2018-06-22 14:40:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3190', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 14:40:11', '1', 'admin', '2018-06-22 14:40:11', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3191', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user', '2018-06-22 14:40:18', '1', 'admin', '2018-06-22 14:40:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3192', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 14:40:18', '1', 'admin', '2018-06-22 14:40:18', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3193', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-22 14:41:13', '1', 'guest', '2018-06-22 14:41:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3194', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-22 14:41:14', '1', 'guest', '2018-06-22 14:41:14', '登陆');
INSERT INTO `sys_log` VALUES ('3195', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-22 14:41:15', '1', 'admin', '2018-06-22 14:41:15', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3196', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-22 14:41:15', '1', 'admin', '2018-06-22 14:41:15', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3197', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 14:41:16', '1', 'admin', '2018-06-22 14:41:16', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3198', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-22 14:46:45', '1', 'admin', '2018-06-22 14:46:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3199', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-22 14:46:58', '1', 'admin', '2018-06-22 14:46:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3200', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 14:46:59', '1', 'admin', '2018-06-22 14:46:59', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3201', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-22 14:53:37', '1', 'admin', '2018-06-22 14:53:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3202', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-22 14:53:51', '1', 'admin', '2018-06-22 14:53:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3203', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 14:53:53', '1', 'admin', '2018-06-22 14:53:53', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3204', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/department', '2018-06-22 14:56:17', '1', 'admin', '2018-06-22 14:56:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3205', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-22 14:56:25', '1', 'admin', '2018-06-22 14:56:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3206', null, 'Chrome', 'GET', 'http://127.0.0.1/logout', '127.0.0.1', '/login', '2018-06-22 15:35:56', '1', 'guest', '2018-06-22 15:35:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3207', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-22 15:36:13', '1', 'guest', '2018-06-22 15:36:13', '登陆');
INSERT INTO `sys_log` VALUES ('3208', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-22 15:36:13', '1', 'admin', '2018-06-22 15:36:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3209', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-22 15:36:13', '1', 'admin', '2018-06-22 15:36:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3210', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 15:36:13', '1', 'admin', '2018-06-22 15:36:13', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3211', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user', '2018-06-22 15:36:54', '1', 'admin', '2018-06-22 15:36:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3212', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 15:36:54', '1', 'admin', '2018-06-22 15:36:54', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3213', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 15:36:56', '1', 'admin', '2018-06-22 15:36:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3214', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 15:36:57', '1', 'admin', '2018-06-22 15:36:57', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3215', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 15:37:00', '1', 'admin', '2018-06-22 15:37:00', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3216', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/postAdd', '2018-06-22 15:37:54', '1', 'admin', '2018-06-22 15:37:54', '新增用户');
INSERT INTO `sys_log` VALUES ('3217', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user', '2018-06-22 15:37:55', '1', 'admin', '2018-06-22 15:37:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3218', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 15:37:55', '1', 'admin', '2018-06-22 15:37:55', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3219', null, 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/login', '2018-06-22 15:38:03', '1', 'guest', '2018-06-22 15:38:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3220', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-22 15:38:08', '1', 'guest', '2018-06-22 15:38:08', '登陆');
INSERT INTO `sys_log` VALUES ('3221', '2', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-22 15:38:08', '1', 'admin1', '2018-06-22 15:38:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3222', '2', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-22 15:38:08', '1', 'admin1', '2018-06-22 15:38:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3223', '2', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 15:38:08', '1', 'admin1', '2018-06-22 15:38:08', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3224', '2', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 15:38:20', '1', 'admin1', '2018-06-22 15:38:20', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3225', '2', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 15:38:21', '1', 'admin1', '2018-06-22 15:38:21', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3226', '2', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 15:38:22', '1', 'admin1', '2018-06-22 15:38:22', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3227', '2', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 15:38:22', '1', 'admin1', '2018-06-22 15:38:22', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3228', '2', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 15:38:23', '1', 'admin1', '2018-06-22 15:38:23', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3229', '2', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 15:38:24', '1', 'admin1', '2018-06-22 15:38:24', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3230', '2', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 15:38:25', '1', 'admin1', '2018-06-22 15:38:25', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3231', '2', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 15:38:26', '1', 'admin1', '2018-06-22 15:38:26', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3232', '2', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 15:38:27', '1', 'admin1', '2018-06-22 15:38:27', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3233', '2', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/logout', '2018-06-22 15:38:59', '1', 'admin1', '2018-06-22 15:38:59', '退出登陆');
INSERT INTO `sys_log` VALUES ('3234', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-22 15:39:06', '1', 'guest', '2018-06-22 15:39:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3235', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-22 15:39:08', '1', 'guest', '2018-06-22 15:39:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3236', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-22 15:39:09', '1', 'guest', '2018-06-22 15:39:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3237', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-22 15:39:10', '1', 'guest', '2018-06-22 15:39:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3238', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-22 15:39:10', '1', 'guest', '2018-06-22 15:39:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3239', null, 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/login', '2018-06-22 15:39:12', '1', 'guest', '2018-06-22 15:39:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3240', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 15:39:30', '1', 'admin', '2018-06-22 15:39:30', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3241', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/delete', '2018-06-22 15:43:38', '1', 'admin', '2018-06-22 15:43:38', '删除用户');
INSERT INTO `sys_log` VALUES ('3242', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 15:44:09', '1', 'admin', '2018-06-22 15:44:09', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3243', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 15:44:10', '1', 'admin', '2018-06-22 15:44:10', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3244', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 15:44:10', '1', 'admin', '2018-06-22 15:44:10', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3245', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 15:44:11', '1', 'admin', '2018-06-22 15:44:11', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3246', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 15:44:11', '1', 'admin', '2018-06-22 15:44:11', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3247', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 15:44:11', '1', 'admin', '2018-06-22 15:44:11', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3248', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 15:44:11', '1', 'admin', '2018-06-22 15:44:11', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3249', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 15:54:00', '1', 'admin', '2018-06-22 15:54:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3250', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 15:54:01', '1', 'admin', '2018-06-22 15:54:01', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3251', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 15:54:07', '1', 'admin', '2018-06-22 15:54:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3252', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 15:54:07', '1', 'admin', '2018-06-22 15:54:07', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3253', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 15:55:12', '1', 'admin', '2018-06-22 15:55:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3254', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 15:55:27', '1', 'admin', '2018-06-22 15:55:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3255', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user', '2018-06-22 15:55:39', '1', 'admin', '2018-06-22 15:55:39', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3256', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 15:55:39', '1', 'admin', '2018-06-22 15:55:39', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3257', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 15:56:04', '1', 'admin', '2018-06-22 15:56:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3258', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 15:57:40', '1', 'admin', '2018-06-22 15:57:40', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3259', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 15:57:43', '1', 'admin', '2018-06-22 15:57:43', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3260', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 15:57:55', '1', 'admin', '2018-06-22 15:57:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3261', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 15:57:56', '1', 'admin', '2018-06-22 15:57:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3262', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 15:58:07', '1', 'admin', '2018-06-22 15:58:07', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3263', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 15:58:40', '1', 'admin', '2018-06-22 15:58:40', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3264', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 15:58:41', '1', 'admin', '2018-06-22 15:58:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3265', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 15:58:44', '1', 'admin', '2018-06-22 15:58:44', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3266', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 16:01:17', '1', 'admin', '2018-06-22 16:01:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3267', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 16:01:19', '1', 'admin', '2018-06-22 16:01:19', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3268', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 16:03:28', '1', 'admin', '2018-06-22 16:03:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3269', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 16:03:29', '1', 'admin', '2018-06-22 16:03:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3270', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 16:03:33', '1', 'admin', '2018-06-22 16:03:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3271', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 16:04:10', '1', 'admin', '2018-06-22 16:04:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3272', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-22 16:04:21', '1', 'admin', '2018-06-22 16:04:21', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3273', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-22 16:04:21', '1', 'admin', '2018-06-22 16:04:21', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3274', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 16:04:22', '1', 'admin', '2018-06-22 16:04:22', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3275', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user', '2018-06-22 16:04:25', '1', 'admin', '2018-06-22 16:04:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3276', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 16:04:25', '1', 'admin', '2018-06-22 16:04:25', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3277', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 16:04:26', '1', 'admin', '2018-06-22 16:04:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3278', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:04:34', '1', 'admin', '2018-06-22 16:04:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3279', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:05:18', '1', 'admin', '2018-06-22 16:05:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3280', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 16:05:19', '1', 'admin', '2018-06-22 16:05:19', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3281', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 16:05:27', '1', 'admin', '2018-06-22 16:05:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3282', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 16:05:27', '1', 'admin', '2018-06-22 16:05:27', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3283', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:08:04', '1', 'admin', '2018-06-22 16:08:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3284', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:08:04', '1', 'admin', '2018-06-22 16:08:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3285', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 16:08:07', '1', 'admin', '2018-06-22 16:08:07', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3286', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:10:01', '1', 'admin', '2018-06-22 16:10:01', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3287', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:10:02', '1', 'admin', '2018-06-22 16:10:02', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3288', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:10:03', '1', 'admin', '2018-06-22 16:10:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3289', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 16:12:12', '1', 'admin', '2018-06-22 16:12:12', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3290', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-22 16:12:13', '1', 'admin', '2018-06-22 16:12:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3291', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-22 16:12:13', '1', 'admin', '2018-06-22 16:12:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3292', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 16:12:14', '1', 'admin', '2018-06-22 16:12:14', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3293', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user', '2018-06-22 16:12:16', '1', 'admin', '2018-06-22 16:12:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3294', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 16:12:17', '1', 'admin', '2018-06-22 16:12:17', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3295', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:17:54', '1', 'admin', '2018-06-22 16:17:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3296', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:17:56', '1', 'admin', '2018-06-22 16:17:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3297', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:17:56', '1', 'admin', '2018-06-22 16:17:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3298', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 16:17:59', '1', 'admin', '2018-06-22 16:17:59', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3299', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:18:20', '1', 'admin', '2018-06-22 16:18:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3300', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:18:21', '1', 'admin', '2018-06-22 16:18:21', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3301', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:18:22', '1', 'admin', '2018-06-22 16:18:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3302', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 16:18:24', '1', 'admin', '2018-06-22 16:18:24', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3303', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:19:17', '1', 'admin', '2018-06-22 16:19:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3304', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:19:18', '1', 'admin', '2018-06-22 16:19:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3305', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:19:19', '1', 'admin', '2018-06-22 16:19:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3306', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 16:19:28', '1', 'admin', '2018-06-22 16:19:28', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3307', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:23:26', '1', 'admin', '2018-06-22 16:23:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3308', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:23:27', '1', 'admin', '2018-06-22 16:23:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3309', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:23:27', '1', 'admin', '2018-06-22 16:23:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3310', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 16:23:29', '1', 'admin', '2018-06-22 16:23:29', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3311', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-22 16:24:13', '1', 'admin', '2018-06-22 16:24:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3312', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-22 16:24:13', '1', 'admin', '2018-06-22 16:24:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3313', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 16:24:14', '1', 'admin', '2018-06-22 16:24:14', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3314', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user', '2018-06-22 16:24:17', '1', 'admin', '2018-06-22 16:24:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3315', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 16:24:17', '1', 'admin', '2018-06-22 16:24:17', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3316', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 16:24:20', '1', 'admin', '2018-06-22 16:24:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3317', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 16:24:20', '1', 'admin', '2018-06-22 16:24:20', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3318', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:24:32', '1', 'admin', '2018-06-22 16:24:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3319', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 16:24:39', '1', 'admin', '2018-06-22 16:24:39', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3320', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:26:10', '1', 'admin', '2018-06-22 16:26:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3321', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:26:12', '1', 'admin', '2018-06-22 16:26:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3322', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:26:12', '1', 'admin', '2018-06-22 16:26:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3323', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:27:19', '1', 'admin', '2018-06-22 16:27:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3324', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:27:20', '1', 'admin', '2018-06-22 16:27:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3325', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:27:21', '1', 'admin', '2018-06-22 16:27:21', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3326', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:28:03', '1', 'admin', '2018-06-22 16:28:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3327', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:28:05', '1', 'admin', '2018-06-22 16:28:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3328', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:28:12', '1', 'admin', '2018-06-22 16:28:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3329', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:28:13', '1', 'admin', '2018-06-22 16:28:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3330', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 16:28:18', '1', 'admin', '2018-06-22 16:28:18', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3331', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:28:36', '1', 'admin', '2018-06-22 16:28:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3332', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:28:37', '1', 'admin', '2018-06-22 16:28:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3333', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 16:28:40', '1', 'admin', '2018-06-22 16:28:40', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3334', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:28:57', '1', 'admin', '2018-06-22 16:28:57', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3335', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 16:29:09', '1', 'admin', '2018-06-22 16:29:09', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3336', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:29:10', '1', 'admin', '2018-06-22 16:29:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3337', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:29:12', '1', 'admin', '2018-06-22 16:29:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3338', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 16:29:26', '1', 'admin', '2018-06-22 16:29:26', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3339', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:29:27', '1', 'admin', '2018-06-22 16:29:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3340', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:29:28', '1', 'admin', '2018-06-22 16:29:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3341', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:29:28', '1', 'admin', '2018-06-22 16:29:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3342', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 16:30:09', '1', 'admin', '2018-06-22 16:30:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3343', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 16:30:09', '1', 'admin', '2018-06-22 16:30:09', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3344', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-22 16:30:19', '1', 'admin', '2018-06-22 16:30:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3345', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-22 16:30:20', '1', 'admin', '2018-06-22 16:30:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3346', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 16:30:20', '1', 'admin', '2018-06-22 16:30:20', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3347', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user', '2018-06-22 16:30:24', '1', 'admin', '2018-06-22 16:30:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3348', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 16:30:24', '1', 'admin', '2018-06-22 16:30:24', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3349', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 16:30:25', '1', 'admin', '2018-06-22 16:30:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3350', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 16:30:25', '1', 'admin', '2018-06-22 16:30:25', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3351', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:32:23', '1', 'admin', '2018-06-22 16:32:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3352', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 16:32:25', '1', 'admin', '2018-06-22 16:32:25', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3353', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:32:50', '1', 'admin', '2018-06-22 16:32:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3354', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:34:03', '1', 'admin', '2018-06-22 16:34:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3355', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:35:00', '1', 'admin', '2018-06-22 16:35:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3356', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:35:01', '1', 'admin', '2018-06-22 16:35:01', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3357', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:36:02', '1', 'admin', '2018-06-22 16:36:02', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3358', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:36:03', '1', 'admin', '2018-06-22 16:36:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3359', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:36:26', '1', 'admin', '2018-06-22 16:36:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3360', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:36:28', '1', 'admin', '2018-06-22 16:36:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3361', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:36:28', '1', 'admin', '2018-06-22 16:36:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3362', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:38:22', '1', 'admin', '2018-06-22 16:38:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3363', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 16:38:24', '1', 'admin', '2018-06-22 16:38:24', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3364', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 16:39:20', '1', 'admin', '2018-06-22 16:39:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3365', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 16:39:22', '1', 'admin', '2018-06-22 16:39:22', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3366', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 16:39:28', '1', 'admin', '2018-06-22 16:39:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3367', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 16:39:28', '1', 'admin', '2018-06-22 16:39:28', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3368', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 16:39:31', '1', 'admin', '2018-06-22 16:39:31', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3369', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 16:39:31', '1', 'admin', '2018-06-22 16:39:31', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3370', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user', '2018-06-22 16:45:24', '1', 'admin', '2018-06-22 16:45:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3371', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 16:45:24', '1', 'admin', '2018-06-22 16:45:24', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3372', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user', '2018-06-22 16:45:43', '1', 'admin', '2018-06-22 16:45:43', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3373', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 16:45:43', '1', 'admin', '2018-06-22 16:45:43', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3374', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user', '2018-06-22 16:47:00', '1', 'admin', '2018-06-22 16:47:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3375', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 16:47:01', '1', 'admin', '2018-06-22 16:47:01', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3376', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 16:47:40', '1', 'admin', '2018-06-22 16:47:40', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3377', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 16:47:41', '1', 'admin', '2018-06-22 16:47:41', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3378', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 16:47:41', '1', 'admin', '2018-06-22 16:47:41', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3379', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 16:47:41', '1', 'admin', '2018-06-22 16:47:41', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3380', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 16:47:42', '1', 'admin', '2018-06-22 16:47:42', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3381', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 16:47:42', '1', 'admin', '2018-06-22 16:47:42', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3382', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user', '2018-06-22 16:47:50', '1', 'admin', '2018-06-22 16:47:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3383', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 16:47:50', '1', 'admin', '2018-06-22 16:47:50', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3384', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user', '2018-06-22 16:47:56', '1', 'admin', '2018-06-22 16:47:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3385', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 16:47:56', '1', 'admin', '2018-06-22 16:47:56', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3386', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user', '2018-06-22 16:48:32', '1', 'admin', '2018-06-22 16:48:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3387', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 16:48:33', '1', 'admin', '2018-06-22 16:48:33', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3388', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user', '2018-06-22 17:17:24', '1', 'admin', '2018-06-22 17:17:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3389', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 17:17:25', '1', 'admin', '2018-06-22 17:17:25', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3390', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser&id=1', '2018-06-22 17:17:26', '1', 'admin', '2018-06-22 17:17:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3391', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/getUserList', '2018-06-22 17:17:26', '1', 'admin', '2018-06-22 17:17:26', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3392', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/addUser&id=1', '2018-06-22 17:17:29', '1', 'admin', '2018-06-22 17:17:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3393', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/getUserList', '2018-06-22 17:17:29', '1', 'admin', '2018-06-22 17:17:29', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3394', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/addUser&id=1', '2018-06-22 17:17:30', '1', 'admin', '2018-06-22 17:17:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3395', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/getUserList', '2018-06-22 17:17:30', '1', 'admin', '2018-06-22 17:17:30', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3396', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/addUser&id=1', '2018-06-22 17:17:32', '1', 'admin', '2018-06-22 17:17:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3397', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/getUserList', '2018-06-22 17:17:32', '1', 'admin', '2018-06-22 17:17:32', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3398', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/addUser&id=1', '2018-06-22 17:18:07', '1', 'admin', '2018-06-22 17:18:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3399', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/getUserList', '2018-06-22 17:18:07', '1', 'admin', '2018-06-22 17:18:07', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3400', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 17:19:08', '1', 'admin', '2018-06-22 17:19:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3401', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser/id=1', '2018-06-22 17:19:15', '1', 'admin', '2018-06-22 17:19:15', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3402', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 17:20:15', '1', 'admin', '2018-06-22 17:20:15', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3403', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/addUser&id=1', '2018-06-22 17:20:34', '1', 'admin', '2018-06-22 17:20:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3404', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/getUserList', '2018-06-22 17:20:34', '1', 'admin', '2018-06-22 17:20:34', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3405', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user', '2018-06-22 17:20:38', '1', 'admin', '2018-06-22 17:20:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3406', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 17:20:38', '1', 'admin', '2018-06-22 17:20:38', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3407', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser&id=1', '2018-06-22 17:20:40', '1', 'admin', '2018-06-22 17:20:40', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3408', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/getUserList', '2018-06-22 17:20:40', '1', 'admin', '2018-06-22 17:20:40', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3409', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser&id=1', '2018-06-22 17:20:43', '1', 'admin', '2018-06-22 17:20:43', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3410', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/getUserList', '2018-06-22 17:20:44', '1', 'admin', '2018-06-22 17:20:44', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3411', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/addUser&id=1', '2018-06-22 17:20:45', '1', 'admin', '2018-06-22 17:20:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3412', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/getUserList', '2018-06-22 17:20:45', '1', 'admin', '2018-06-22 17:20:45', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3413', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/addUser&id=1', '2018-06-22 17:20:46', '1', 'admin', '2018-06-22 17:20:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3414', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/getUserList', '2018-06-22 17:20:46', '1', 'admin', '2018-06-22 17:20:46', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3415', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/addUser&id=1', '2018-06-22 17:20:46', '1', 'admin', '2018-06-22 17:20:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3416', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/getUserList', '2018-06-22 17:20:46', '1', 'admin', '2018-06-22 17:20:46', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3417', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/addUser&id=1', '2018-06-22 17:21:22', '1', 'admin', '2018-06-22 17:21:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3418', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/getUserList', '2018-06-22 17:21:22', '1', 'admin', '2018-06-22 17:21:22', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3419', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/addUser&id=1', '2018-06-22 17:21:52', '1', 'admin', '2018-06-22 17:21:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3420', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/getUserList', '2018-06-22 17:21:52', '1', 'admin', '2018-06-22 17:21:52', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3421', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/addUser&id=1', '2018-06-22 17:21:53', '1', 'admin', '2018-06-22 17:21:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3422', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/getUserList', '2018-06-22 17:21:53', '1', 'admin', '2018-06-22 17:21:53', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3423', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/addUser&id=1', '2018-06-22 17:21:54', '1', 'admin', '2018-06-22 17:21:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3424', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/getUserList', '2018-06-22 17:21:54', '1', 'admin', '2018-06-22 17:21:54', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3425', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/addUser&id=1', '2018-06-22 17:21:59', '1', 'admin', '2018-06-22 17:21:59', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3426', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/getUserList', '2018-06-22 17:22:00', '1', 'admin', '2018-06-22 17:22:00', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3427', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/addUser&id=1', '2018-06-22 17:22:01', '1', 'admin', '2018-06-22 17:22:01', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3428', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/getUserList', '2018-06-22 17:22:01', '1', 'admin', '2018-06-22 17:22:01', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3429', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/addUser&id=1', '2018-06-22 17:22:01', '1', 'admin', '2018-06-22 17:22:01', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3430', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/system/user/getUserList', '2018-06-22 17:22:02', '1', 'admin', '2018-06-22 17:22:02', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3431', null, 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser&id=1', '127.0.0.1', '/login', '2018-06-22 17:41:22', '1', 'guest', '2018-06-22 17:41:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3432', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-22 17:41:23', '1', 'guest', '2018-06-22 17:41:23', '登陆');
INSERT INTO `sys_log` VALUES ('3433', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-22 17:41:24', '1', 'admin', '2018-06-22 17:41:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3434', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-22 17:41:24', '1', 'admin', '2018-06-22 17:41:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3435', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 17:41:24', '1', 'admin', '2018-06-22 17:41:24', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3436', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user', '2018-06-22 17:41:29', '1', 'admin', '2018-06-22 17:41:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3437', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 17:41:29', '1', 'admin', '2018-06-22 17:41:29', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3438', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 17:41:33', '1', 'admin', '2018-06-22 17:41:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3439', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-22 17:41:33', '1', 'admin', '2018-06-22 17:41:33', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3440', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 17:41:53', '1', 'admin', '2018-06-22 17:41:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3441', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-22 17:41:54', '1', 'admin', '2018-06-22 17:41:54', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3442', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 17:42:53', '1', 'admin', '2018-06-22 17:42:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3443', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=2', '127.0.0.1', '/system/user/getUser', '2018-06-22 17:42:53', '1', 'admin', '2018-06-22 17:42:53', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3444', null, 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/login', '2018-06-22 18:10:54', '1', 'guest', '2018-06-22 18:10:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3445', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-22 18:10:55', '1', 'guest', '2018-06-22 18:10:55', '登陆');
INSERT INTO `sys_log` VALUES ('3446', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-22 18:10:56', '1', 'admin', '2018-06-22 18:10:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3447', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-22 18:10:56', '1', 'admin', '2018-06-22 18:10:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3448', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 18:10:57', '1', 'admin', '2018-06-22 18:10:57', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3449', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user', '2018-06-22 18:11:01', '1', 'admin', '2018-06-22 18:11:01', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3450', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 18:11:01', '1', 'admin', '2018-06-22 18:11:01', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3451', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:11:03', '1', 'admin', '2018-06-22 18:11:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3452', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=2', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:11:03', '1', 'admin', '2018-06-22 18:11:03', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3453', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:11:47', '1', 'admin', '2018-06-22 18:11:47', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3454', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=2', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:11:47', '1', 'admin', '2018-06-22 18:11:47', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3455', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:12:15', '1', 'admin', '2018-06-22 18:12:15', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3456', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 18:12:15', '1', 'admin', '2018-06-22 18:12:15', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3457', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 18:12:19', '1', 'admin', '2018-06-22 18:12:19', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3458', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/postAdd', '2018-06-22 18:12:40', '1', 'admin', '2018-06-22 18:12:40', '新增用户');
INSERT INTO `sys_log` VALUES ('3459', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:24:12', '1', 'admin', '2018-06-22 18:24:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3460', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 18:24:20', '1', 'admin', '2018-06-22 18:24:20', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3461', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/postAdd', '2018-06-22 18:24:48', '1', 'admin', '2018-06-22 18:24:48', '新增用户');
INSERT INTO `sys_log` VALUES ('3462', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 18:25:41', '1', 'admin', '2018-06-22 18:25:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3463', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 18:25:43', '1', 'admin', '2018-06-22 18:25:43', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3464', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 18:25:47', '1', 'admin', '2018-06-22 18:25:47', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3465', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 18:25:51', '1', 'admin', '2018-06-22 18:25:51', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3466', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 18:25:51', '1', 'admin', '2018-06-22 18:25:51', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3467', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/postAdd', '2018-06-22 18:26:09', '1', 'admin', '2018-06-22 18:26:09', '新增用户');
INSERT INTO `sys_log` VALUES ('3468', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user', '2018-06-22 18:26:11', '1', 'admin', '2018-06-22 18:26:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3469', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 18:26:11', '1', 'admin', '2018-06-22 18:26:11', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3470', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:26:21', '1', 'admin', '2018-06-22 18:26:21', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3471', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=4', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:26:21', '1', 'admin', '2018-06-22 18:26:21', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3472', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:26:30', '1', 'admin', '2018-06-22 18:26:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3473', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=5', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:26:30', '1', 'admin', '2018-06-22 18:26:30', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3474', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:26:54', '1', 'admin', '2018-06-22 18:26:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3475', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=5', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:26:54', '1', 'admin', '2018-06-22 18:26:54', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3476', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 18:27:23', '1', 'admin', '2018-06-22 18:27:23', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3477', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log/main', '2018-06-22 18:27:27', '1', 'admin', '2018-06-22 18:27:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3478', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log/main', '127.0.0.1', '/system/log/getLogList', '2018-06-22 18:27:27', '1', 'admin', '2018-06-22 18:27:27', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3479', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user', '2018-06-22 18:27:28', '1', 'admin', '2018-06-22 18:27:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3480', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 18:27:28', '1', 'admin', '2018-06-22 18:27:28', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3481', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:27:32', '1', 'admin', '2018-06-22 18:27:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3482', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=4', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:27:33', '1', 'admin', '2018-06-22 18:27:33', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3483', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:29:35', '1', 'admin', '2018-06-22 18:29:35', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3484', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:29:35', '1', 'admin', '2018-06-22 18:29:35', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3485', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 18:29:42', '1', 'admin', '2018-06-22 18:29:42', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3486', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:29:42', '1', 'admin', '2018-06-22 18:29:42', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3487', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:30:25', '1', 'admin', '2018-06-22 18:30:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3488', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 18:30:25', '1', 'admin', '2018-06-22 18:30:25', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3489', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 18:30:28', '1', 'admin', '2018-06-22 18:30:28', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3490', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/postAdd', '2018-06-22 18:30:49', '1', 'admin', '2018-06-22 18:30:49', '新增用户');
INSERT INTO `sys_log` VALUES ('3491', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user', '2018-06-22 18:30:52', '1', 'admin', '2018-06-22 18:30:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3492', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 18:30:52', '1', 'admin', '2018-06-22 18:30:52', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3493', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:30:55', '1', 'admin', '2018-06-22 18:30:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3494', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=6', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:30:55', '1', 'admin', '2018-06-22 18:30:55', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3495', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:31:14', '1', 'admin', '2018-06-22 18:31:14', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3496', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=3', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:31:14', '1', 'admin', '2018-06-22 18:31:14', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3497', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:31:19', '1', 'admin', '2018-06-22 18:31:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3498', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=2', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:31:19', '1', 'admin', '2018-06-22 18:31:19', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3499', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:33:14', '1', 'admin', '2018-06-22 18:33:14', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3500', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 18:34:07', '1', 'admin', '2018-06-22 18:34:07', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3501', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/postAdd', '2018-06-22 18:34:22', '1', 'admin', '2018-06-22 18:34:22', '新增用户');
INSERT INTO `sys_log` VALUES ('3502', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user', '2018-06-22 18:36:35', '1', 'admin', '2018-06-22 18:36:35', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3503', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 18:36:35', '1', 'admin', '2018-06-22 18:36:35', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3504', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:36:41', '1', 'admin', '2018-06-22 18:36:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3505', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=2', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:36:41', '1', 'admin', '2018-06-22 18:36:41', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3506', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:36:57', '1', 'admin', '2018-06-22 18:36:57', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3507', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=4', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:36:57', '1', 'admin', '2018-06-22 18:36:57', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3508', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:37:02', '1', 'admin', '2018-06-22 18:37:02', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3509', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=5', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:37:02', '1', 'admin', '2018-06-22 18:37:02', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3510', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser?id=5', '127.0.0.1', '/system/user/postAdd', '2018-06-22 18:40:53', '1', 'admin', '2018-06-22 18:40:53', '新增用户');
INSERT INTO `sys_log` VALUES ('3511', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:41:34', '1', 'admin', '2018-06-22 18:41:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3512', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=6', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:41:34', '1', 'admin', '2018-06-22 18:41:34', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3513', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user', '2018-06-22 18:42:03', '1', 'admin', '2018-06-22 18:42:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3514', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 18:42:03', '1', 'admin', '2018-06-22 18:42:03', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3515', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:42:05', '1', 'admin', '2018-06-22 18:42:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3516', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=3', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:42:05', '1', 'admin', '2018-06-22 18:42:05', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3517', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 18:43:29', '1', 'admin', '2018-06-22 18:43:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3518', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:43:29', '1', 'admin', '2018-06-22 18:43:29', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3519', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/postAdd', '2018-06-22 18:43:38', '1', 'admin', '2018-06-22 18:43:38', '新增用户');
INSERT INTO `sys_log` VALUES ('3520', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user', '2018-06-22 18:43:41', '1', 'admin', '2018-06-22 18:43:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3521', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 18:43:41', '1', 'admin', '2018-06-22 18:43:41', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3522', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:44:06', '1', 'admin', '2018-06-22 18:44:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3523', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=9', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:44:06', '1', 'admin', '2018-06-22 18:44:06', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3524', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:47:20', '1', 'admin', '2018-06-22 18:47:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3525', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=9', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:47:20', '1', 'admin', '2018-06-22 18:47:20', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3526', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:47:21', '1', 'admin', '2018-06-22 18:47:21', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3527', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=9', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:47:21', '1', 'admin', '2018-06-22 18:47:21', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3528', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:49:11', '1', 'admin', '2018-06-22 18:49:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3529', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=9', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:49:11', '1', 'admin', '2018-06-22 18:49:11', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3530', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser?id=9', '127.0.0.1', '/system/user/postAdd', '2018-06-22 18:49:16', '1', 'admin', '2018-06-22 18:49:16', '新增用户');
INSERT INTO `sys_log` VALUES ('3531', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=9', '127.0.0.1', '/system/user', '2018-06-22 18:49:18', '1', 'admin', '2018-06-22 18:49:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3532', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 18:49:18', '1', 'admin', '2018-06-22 18:49:18', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3533', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:49:20', '1', 'admin', '2018-06-22 18:49:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3534', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=2', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:49:20', '1', 'admin', '2018-06-22 18:49:20', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3535', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:53:43', '1', 'admin', '2018-06-22 18:53:43', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3536', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=2', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:53:43', '1', 'admin', '2018-06-22 18:53:43', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3537', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:54:39', '1', 'admin', '2018-06-22 18:54:39', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3538', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=2', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:54:39', '1', 'admin', '2018-06-22 18:54:39', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3539', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:55:01', '1', 'admin', '2018-06-22 18:55:01', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3540', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=2', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:55:01', '1', 'admin', '2018-06-22 18:55:01', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3541', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:55:10', '1', 'admin', '2018-06-22 18:55:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3542', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=6', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:55:11', '1', 'admin', '2018-06-22 18:55:11', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3543', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:55:25', '1', 'admin', '2018-06-22 18:55:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3544', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=4', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:55:25', '1', 'admin', '2018-06-22 18:55:25', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3545', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-22 18:56:08', '1', 'admin', '2018-06-22 18:56:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3546', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-22 18:56:08', '1', 'admin', '2018-06-22 18:56:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3547', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-22 18:56:08', '1', 'admin', '2018-06-22 18:56:08', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3548', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user', '2018-06-22 18:56:11', '1', 'admin', '2018-06-22 18:56:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3549', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 18:56:11', '1', 'admin', '2018-06-22 18:56:11', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3550', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:56:12', '1', 'admin', '2018-06-22 18:56:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3551', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=2', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:56:12', '1', 'admin', '2018-06-22 18:56:12', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3552', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 18:56:38', '1', 'admin', '2018-06-22 18:56:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3553', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=2', '127.0.0.1', '/system/user/getUser', '2018-06-22 18:56:38', '1', 'admin', '2018-06-22 18:56:38', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3554', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 19:00:12', '1', 'admin', '2018-06-22 19:00:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3555', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=2', '127.0.0.1', '/system/user/getUser', '2018-06-22 19:00:13', '1', 'admin', '2018-06-22 19:00:13', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3556', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 19:02:39', '1', 'admin', '2018-06-22 19:02:39', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3557', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=2', '127.0.0.1', '/system/user/getUser', '2018-06-22 19:02:40', '1', 'admin', '2018-06-22 19:02:40', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3558', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 19:22:41', '1', 'admin', '2018-06-22 19:22:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3559', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=2', '127.0.0.1', '/system/user/getUser', '2018-06-22 19:22:41', '1', 'admin', '2018-06-22 19:22:41', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3560', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 19:22:51', '1', 'admin', '2018-06-22 19:22:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3561', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=6', '127.0.0.1', '/system/user/getUser', '2018-06-22 19:22:52', '1', 'admin', '2018-06-22 19:22:52', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3562', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-22 19:22:57', '1', 'admin', '2018-06-22 19:22:57', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3563', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=6', '127.0.0.1', '/system/user/getUser', '2018-06-22 19:22:57', '1', 'admin', '2018-06-22 19:22:57', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3564', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 19:23:19', '1', 'admin', '2018-06-22 19:23:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3565', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 19:23:20', '1', 'admin', '2018-06-22 19:23:20', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3566', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 19:23:23', '1', 'admin', '2018-06-22 19:23:23', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3567', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 19:23:23', '1', 'admin', '2018-06-22 19:23:23', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3568', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 19:23:23', '1', 'admin', '2018-06-22 19:23:23', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3569', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/postAdd', '2018-06-22 19:23:45', '1', 'admin', '2018-06-22 19:23:45', '新增用户');
INSERT INTO `sys_log` VALUES ('3570', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 19:24:44', '1', 'admin', '2018-06-22 19:24:44', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3571', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 19:24:47', '1', 'admin', '2018-06-22 19:24:47', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3572', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=11', '127.0.0.1', '/system/user/getUser', '2018-06-22 19:24:48', '1', 'admin', '2018-06-22 19:24:48', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3573', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 19:25:05', '1', 'admin', '2018-06-22 19:25:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3574', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=11', '127.0.0.1', '/system/user/getUser', '2018-06-22 19:25:05', '1', 'admin', '2018-06-22 19:25:05', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3575', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 19:26:00', '1', 'admin', '2018-06-22 19:26:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3576', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 19:26:03', '1', 'admin', '2018-06-22 19:26:03', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3577', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 19:26:03', '1', 'admin', '2018-06-22 19:26:03', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3578', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 19:26:03', '1', 'admin', '2018-06-22 19:26:03', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3579', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 19:26:04', '1', 'admin', '2018-06-22 19:26:04', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3580', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 19:26:04', '1', 'admin', '2018-06-22 19:26:04', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3581', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 19:26:04', '1', 'admin', '2018-06-22 19:26:04', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3582', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 19:26:46', '1', 'admin', '2018-06-22 19:26:46', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3583', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 19:26:47', '1', 'admin', '2018-06-22 19:26:47', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3584', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 19:26:47', '1', 'admin', '2018-06-22 19:26:47', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3585', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 19:26:48', '1', 'admin', '2018-06-22 19:26:48', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3586', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 19:26:48', '1', 'admin', '2018-06-22 19:26:48', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3587', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 19:26:48', '1', 'admin', '2018-06-22 19:26:48', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3588', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 19:26:48', '1', 'admin', '2018-06-22 19:26:48', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3589', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 19:26:49', '1', 'admin', '2018-06-22 19:26:49', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3590', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 19:26:49', '1', 'admin', '2018-06-22 19:26:49', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3591', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 19:26:49', '1', 'admin', '2018-06-22 19:26:49', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3592', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-22 19:26:50', '1', 'admin', '2018-06-22 19:26:50', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3593', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/delete', '2018-06-22 19:27:05', '1', 'admin', '2018-06-22 19:27:05', '删除用户');
INSERT INTO `sys_log` VALUES ('3594', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-22 19:27:26', '1', 'admin', '2018-06-22 19:27:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3595', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 19:27:31', '1', 'admin', '2018-06-22 19:27:31', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3596', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 19:27:35', '1', 'admin', '2018-06-22 19:27:35', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3597', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-22 19:27:35', '1', 'admin', '2018-06-22 19:27:35', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3598', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/postAdd', '2018-06-22 19:27:55', '1', 'admin', '2018-06-22 19:27:55', '新增用户');
INSERT INTO `sys_log` VALUES ('3599', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-24 21:00:53', '1', 'guest', '2018-06-24 21:00:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3600', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-24 21:00:55', '1', 'guest', '2018-06-24 21:00:55', '登陆');
INSERT INTO `sys_log` VALUES ('3601', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-24 21:00:56', '1', 'admin', '2018-06-24 21:00:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3602', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-24 21:00:56', '1', 'admin', '2018-06-24 21:00:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3603', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-24 21:00:56', '1', 'admin', '2018-06-24 21:00:56', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3604', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/department', '2018-06-24 21:01:11', '1', 'admin', '2018-06-24 21:01:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3605', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-24 21:01:12', '1', 'admin', '2018-06-24 21:01:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3606', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user', '2018-06-24 21:01:14', '1', 'admin', '2018-06-24 21:01:14', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3607', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-24 21:01:14', '1', 'admin', '2018-06-24 21:01:14', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3608', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-24 21:01:19', '1', 'admin', '2018-06-24 21:01:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3609', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=2', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:01:19', '1', 'admin', '2018-06-24 21:01:19', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3610', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/logout', '2018-06-24 21:04:13', '1', 'admin', '2018-06-24 21:04:13', '退出登陆');
INSERT INTO `sys_log` VALUES ('3611', null, 'Chrome', 'POST', 'http://127.0.0.1/logout', '127.0.0.1', '/postLogin', '2018-06-24 21:04:14', '1', 'guest', '2018-06-24 21:04:14', '登陆');
INSERT INTO `sys_log` VALUES ('3612', '1', 'Chrome', 'GET', 'http://127.0.0.1/logout', '127.0.0.1', '/', '2018-06-24 21:05:02', '1', 'admin', '2018-06-24 21:05:02', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3613', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-24 21:05:02', '1', 'admin', '2018-06-24 21:05:02', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3614', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-24 21:05:02', '1', 'admin', '2018-06-24 21:05:02', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3615', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user', '2018-06-24 21:05:40', '1', 'admin', '2018-06-24 21:05:40', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3616', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-24 21:05:40', '1', 'admin', '2018-06-24 21:05:40', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3617', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/department', '2018-06-24 21:09:36', '1', 'admin', '2018-06-24 21:09:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3618', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-24 21:09:36', '1', 'admin', '2018-06-24 21:09:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3619', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 21:09:38', '1', 'admin', '2018-06-24 21:09:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3620', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 21:09:41', '1', 'admin', '2018-06-24 21:09:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3621', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 21:09:43', '1', 'admin', '2018-06-24 21:09:43', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3622', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 21:09:45', '1', 'admin', '2018-06-24 21:09:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3623', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 21:09:47', '1', 'admin', '2018-06-24 21:09:47', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3624', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-24 21:10:03', '1', 'admin', '2018-06-24 21:10:03', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3625', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-24 21:12:56', '1', 'admin', '2018-06-24 21:12:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3626', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:12:56', '1', 'admin', '2018-06-24 21:12:56', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3627', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-24 21:13:31', '1', 'admin', '2018-06-24 21:13:31', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3628', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:13:32', '1', 'admin', '2018-06-24 21:13:32', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3629', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-24 21:14:32', '1', 'admin', '2018-06-24 21:14:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3630', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:14:32', '1', 'admin', '2018-06-24 21:14:32', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3631', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-24 21:14:37', '1', 'admin', '2018-06-24 21:14:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3632', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:14:38', '1', 'admin', '2018-06-24 21:14:38', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3633', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-24 21:16:25', '1', 'guest', '2018-06-24 21:16:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3634', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-24 21:16:26', '1', 'guest', '2018-06-24 21:16:26', '登陆');
INSERT INTO `sys_log` VALUES ('3635', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-24 21:16:28', '1', 'admin', '2018-06-24 21:16:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3636', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-24 21:16:28', '1', 'admin', '2018-06-24 21:16:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3637', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-24 21:16:29', '1', 'admin', '2018-06-24 21:16:29', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3638', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user', '2018-06-24 21:16:33', '1', 'admin', '2018-06-24 21:16:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3639', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-24 21:16:33', '1', 'admin', '2018-06-24 21:16:33', '获取用户列表');
INSERT INTO `sys_log` VALUES ('3640', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-24 21:16:34', '1', 'admin', '2018-06-24 21:16:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3641', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:16:34', '1', 'admin', '2018-06-24 21:16:34', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3642', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/department', '2018-06-24 21:19:23', '1', 'admin', '2018-06-24 21:19:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3643', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-24 21:19:23', '1', 'admin', '2018-06-24 21:19:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3644', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 21:21:23', '1', 'admin', '2018-06-24 21:21:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3645', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:21:24', '1', 'admin', '2018-06-24 21:21:24', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3646', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 21:23:10', '1', 'admin', '2018-06-24 21:23:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3647', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:23:10', '1', 'admin', '2018-06-24 21:23:10', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3648', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 21:25:47', '1', 'admin', '2018-06-24 21:25:47', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3649', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:25:47', '1', 'admin', '2018-06-24 21:25:47', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3650', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 21:26:00', '1', 'admin', '2018-06-24 21:26:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3651', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:26:00', '1', 'admin', '2018-06-24 21:26:00', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3652', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 21:27:38', '1', 'admin', '2018-06-24 21:27:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3653', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:27:39', '1', 'admin', '2018-06-24 21:27:39', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3654', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 21:27:47', '1', 'admin', '2018-06-24 21:27:47', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3655', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:27:47', '1', 'admin', '2018-06-24 21:27:47', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3656', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-24 21:30:59', '1', 'admin', '2018-06-24 21:30:59', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3657', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/user/addUser', '127.0.0.1', '/system/user/checkUsername', '2018-06-24 21:30:59', '1', 'admin', '2018-06-24 21:30:59', '校验用户名是否重名');
INSERT INTO `sys_log` VALUES ('3658', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 21:31:56', '1', 'admin', '2018-06-24 21:31:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3659', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:31:56', '1', 'admin', '2018-06-24 21:31:56', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3660', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 21:33:24', '1', 'admin', '2018-06-24 21:33:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3661', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:33:24', '1', 'admin', '2018-06-24 21:33:24', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3662', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 21:34:14', '1', 'admin', '2018-06-24 21:34:14', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3663', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:34:14', '1', 'admin', '2018-06-24 21:34:14', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3664', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 21:35:26', '1', 'admin', '2018-06-24 21:35:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3665', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:35:26', '1', 'admin', '2018-06-24 21:35:26', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3666', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 21:35:38', '1', 'admin', '2018-06-24 21:35:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3667', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:35:38', '1', 'admin', '2018-06-24 21:35:38', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3668', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 21:38:23', '1', 'admin', '2018-06-24 21:38:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3669', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:38:23', '1', 'admin', '2018-06-24 21:38:23', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3670', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 21:41:38', '1', 'admin', '2018-06-24 21:41:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3671', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:41:39', '1', 'admin', '2018-06-24 21:41:39', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3672', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 21:42:04', '1', 'admin', '2018-06-24 21:42:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3673', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:42:04', '1', 'admin', '2018-06-24 21:42:04', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3674', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 21:42:39', '1', 'admin', '2018-06-24 21:42:39', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3675', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:42:40', '1', 'admin', '2018-06-24 21:42:40', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3676', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 21:42:49', '1', 'admin', '2018-06-24 21:42:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3677', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:42:49', '1', 'admin', '2018-06-24 21:42:49', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3678', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 21:43:18', '1', 'admin', '2018-06-24 21:43:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3679', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:43:19', '1', 'admin', '2018-06-24 21:43:19', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3680', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 21:43:19', '1', 'admin', '2018-06-24 21:43:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3681', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:43:20', '1', 'admin', '2018-06-24 21:43:20', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3682', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 21:43:33', '1', 'admin', '2018-06-24 21:43:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3683', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:43:33', '1', 'admin', '2018-06-24 21:43:33', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3684', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 21:44:26', '1', 'admin', '2018-06-24 21:44:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3685', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:44:26', '1', 'admin', '2018-06-24 21:44:26', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3686', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 21:45:09', '1', 'admin', '2018-06-24 21:45:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3687', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:45:09', '1', 'admin', '2018-06-24 21:45:09', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3688', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 21:45:32', '1', 'admin', '2018-06-24 21:45:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3689', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:45:33', '1', 'admin', '2018-06-24 21:45:33', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3690', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 21:46:48', '1', 'admin', '2018-06-24 21:46:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3691', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:46:49', '1', 'admin', '2018-06-24 21:46:49', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3692', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 21:47:07', '1', 'admin', '2018-06-24 21:47:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3693', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:47:08', '1', 'admin', '2018-06-24 21:47:08', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3694', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 21:47:25', '1', 'admin', '2018-06-24 21:47:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3695', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 21:47:25', '1', 'admin', '2018-06-24 21:47:25', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3696', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 21:52:28', '1', 'admin', '2018-06-24 21:52:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3697', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 21:52:30', '1', 'admin', '2018-06-24 21:52:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3698', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-24 21:54:46', '1', 'admin', '2018-06-24 21:54:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3699', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 21:54:48', '1', 'admin', '2018-06-24 21:54:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3700', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-24 21:54:51', '1', 'admin', '2018-06-24 21:54:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3701', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 21:54:52', '1', 'admin', '2018-06-24 21:54:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3702', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-24 21:54:54', '1', 'admin', '2018-06-24 21:54:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3703', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-24 21:54:58', '1', 'admin', '2018-06-24 21:54:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3704', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-24 21:54:58', '1', 'admin', '2018-06-24 21:54:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3705', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-24 21:54:59', '1', 'admin', '2018-06-24 21:54:59', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3706', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-24 21:54:59', '1', 'admin', '2018-06-24 21:54:59', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3707', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-24 21:55:00', '1', 'admin', '2018-06-24 21:55:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3708', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-24 21:55:01', '1', 'admin', '2018-06-24 21:55:01', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3709', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-24 21:55:01', '1', 'admin', '2018-06-24 21:55:01', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3710', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-24 21:55:01', '1', 'admin', '2018-06-24 21:55:01', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3711', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:13:14', '1', 'admin', '2018-06-24 22:13:14', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3712', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:15:03', '1', 'admin', '2018-06-24 22:15:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3713', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:15:04', '1', 'admin', '2018-06-24 22:15:04', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3714', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:16:32', '1', 'admin', '2018-06-24 22:16:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3715', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:16:32', '1', 'admin', '2018-06-24 22:16:32', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3716', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:16:33', '1', 'admin', '2018-06-24 22:16:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3717', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:16:33', '1', 'admin', '2018-06-24 22:16:33', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3718', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:17:08', '1', 'admin', '2018-06-24 22:17:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3719', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:17:10', '1', 'admin', '2018-06-24 22:17:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3720', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:17:10', '1', 'admin', '2018-06-24 22:17:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3721', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:17:50', '1', 'admin', '2018-06-24 22:17:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3722', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:17:51', '1', 'admin', '2018-06-24 22:17:51', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3723', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:17:52', '1', 'admin', '2018-06-24 22:17:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3724', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:17:53', '1', 'admin', '2018-06-24 22:17:53', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3725', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:17:53', '1', 'admin', '2018-06-24 22:17:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3726', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:17:53', '1', 'admin', '2018-06-24 22:17:53', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3727', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:17:54', '1', 'admin', '2018-06-24 22:17:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3728', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:17:54', '1', 'admin', '2018-06-24 22:17:54', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3729', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:19:25', '1', 'admin', '2018-06-24 22:19:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3730', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:19:25', '1', 'admin', '2018-06-24 22:19:25', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3731', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:19:26', '1', 'admin', '2018-06-24 22:19:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3732', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:19:26', '1', 'admin', '2018-06-24 22:19:26', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3733', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:20:37', '1', 'admin', '2018-06-24 22:20:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3734', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:20:38', '1', 'admin', '2018-06-24 22:20:38', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3735', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:20:39', '1', 'admin', '2018-06-24 22:20:39', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3736', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:20:39', '1', 'admin', '2018-06-24 22:20:39', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3737', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:21:52', '1', 'admin', '2018-06-24 22:21:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3738', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:21:52', '1', 'admin', '2018-06-24 22:21:52', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3739', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:21:54', '1', 'admin', '2018-06-24 22:21:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3740', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:21:54', '1', 'admin', '2018-06-24 22:21:54', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3741', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:24:31', '1', 'admin', '2018-06-24 22:24:31', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3742', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:24:32', '1', 'admin', '2018-06-24 22:24:32', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3743', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:25:15', '1', 'admin', '2018-06-24 22:25:15', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3744', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:25:15', '1', 'admin', '2018-06-24 22:25:15', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3745', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:26:36', '1', 'admin', '2018-06-24 22:26:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3746', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:26:36', '1', 'admin', '2018-06-24 22:26:36', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3747', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:27:59', '1', 'admin', '2018-06-24 22:27:59', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3748', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:28:00', '1', 'admin', '2018-06-24 22:28:00', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3749', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:28:06', '1', 'admin', '2018-06-24 22:28:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3750', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:35:10', '1', 'admin', '2018-06-24 22:35:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3751', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:35:11', '1', 'admin', '2018-06-24 22:35:11', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3752', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:35:12', '1', 'admin', '2018-06-24 22:35:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3753', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:36:24', '1', 'admin', '2018-06-24 22:36:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3754', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:36:25', '1', 'admin', '2018-06-24 22:36:25', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3755', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:36:30', '1', 'admin', '2018-06-24 22:36:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3756', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:37:33', '1', 'admin', '2018-06-24 22:37:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3757', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:37:33', '1', 'admin', '2018-06-24 22:37:33', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3758', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:37:35', '1', 'admin', '2018-06-24 22:37:35', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3759', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:40:13', '1', 'admin', '2018-06-24 22:40:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3760', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:40:13', '1', 'admin', '2018-06-24 22:40:13', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3761', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:40:15', '1', 'admin', '2018-06-24 22:40:15', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3762', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:43:17', '1', 'admin', '2018-06-24 22:43:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3763', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:43:18', '1', 'admin', '2018-06-24 22:43:18', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3764', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:43:21', '1', 'admin', '2018-06-24 22:43:21', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3765', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:44:38', '1', 'admin', '2018-06-24 22:44:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3766', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:44:39', '1', 'admin', '2018-06-24 22:44:39', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3767', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:44:39', '1', 'admin', '2018-06-24 22:44:39', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3768', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:45:58', '1', 'admin', '2018-06-24 22:45:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3769', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:45:59', '1', 'admin', '2018-06-24 22:45:59', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3770', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:45:59', '1', 'admin', '2018-06-24 22:45:59', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3771', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:48:54', '1', 'admin', '2018-06-24 22:48:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3772', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:48:54', '1', 'admin', '2018-06-24 22:48:54', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3773', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:48:54', '1', 'admin', '2018-06-24 22:48:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3774', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:49:03', '1', 'admin', '2018-06-24 22:49:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3775', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:49:03', '1', 'admin', '2018-06-24 22:49:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3776', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:49:03', '1', 'admin', '2018-06-24 22:49:03', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3777', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:49:24', '1', 'admin', '2018-06-24 22:49:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3778', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:49:24', '1', 'admin', '2018-06-24 22:49:24', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3779', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:49:24', '1', 'admin', '2018-06-24 22:49:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3780', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:50:23', '1', 'admin', '2018-06-24 22:50:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3781', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:50:23', '1', 'admin', '2018-06-24 22:50:23', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3782', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:50:23', '1', 'admin', '2018-06-24 22:50:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3783', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:50:36', '1', 'admin', '2018-06-24 22:50:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3784', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:50:36', '1', 'admin', '2018-06-24 22:50:36', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3785', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:50:36', '1', 'admin', '2018-06-24 22:50:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3786', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:50:41', '1', 'admin', '2018-06-24 22:50:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3787', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:50:41', '1', 'admin', '2018-06-24 22:50:41', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3788', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:50:41', '1', 'admin', '2018-06-24 22:50:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3789', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:51:11', '1', 'admin', '2018-06-24 22:51:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3790', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:51:11', '1', 'admin', '2018-06-24 22:51:11', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3791', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:51:11', '1', 'admin', '2018-06-24 22:51:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3792', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:51:52', '1', 'admin', '2018-06-24 22:51:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3793', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:51:53', '1', 'admin', '2018-06-24 22:51:53', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3794', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:51:53', '1', 'admin', '2018-06-24 22:51:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3795', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:52:48', '1', 'admin', '2018-06-24 22:52:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3796', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:52:48', '1', 'admin', '2018-06-24 22:52:48', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3797', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:52:48', '1', 'admin', '2018-06-24 22:52:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3798', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:52:57', '1', 'admin', '2018-06-24 22:52:57', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3799', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:52:57', '1', 'admin', '2018-06-24 22:52:57', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3800', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:52:57', '1', 'admin', '2018-06-24 22:52:57', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3801', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:53:06', '1', 'admin', '2018-06-24 22:53:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3802', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:53:07', '1', 'admin', '2018-06-24 22:53:07', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3803', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:53:07', '1', 'admin', '2018-06-24 22:53:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3804', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:53:08', '1', 'admin', '2018-06-24 22:53:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3805', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:53:08', '1', 'admin', '2018-06-24 22:53:08', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3806', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:53:08', '1', 'admin', '2018-06-24 22:53:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3807', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:53:08', '1', 'admin', '2018-06-24 22:53:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3808', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:53:08', '1', 'admin', '2018-06-24 22:53:08', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3809', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:53:08', '1', 'admin', '2018-06-24 22:53:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3810', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:53:30', '1', 'admin', '2018-06-24 22:53:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3811', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:53:31', '1', 'admin', '2018-06-24 22:53:31', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3812', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:53:31', '1', 'admin', '2018-06-24 22:53:31', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3813', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:53:33', '1', 'admin', '2018-06-24 22:53:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3814', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:53:33', '1', 'admin', '2018-06-24 22:53:33', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3815', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:53:33', '1', 'admin', '2018-06-24 22:53:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3816', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:54:00', '1', 'admin', '2018-06-24 22:54:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3817', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:54:00', '1', 'admin', '2018-06-24 22:54:00', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3818', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:54:00', '1', 'admin', '2018-06-24 22:54:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3819', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:55:24', '1', 'admin', '2018-06-24 22:55:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3820', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:55:25', '1', 'admin', '2018-06-24 22:55:25', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3821', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:55:25', '1', 'admin', '2018-06-24 22:55:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3822', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:55:26', '1', 'admin', '2018-06-24 22:55:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3823', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:55:26', '1', 'admin', '2018-06-24 22:55:26', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3824', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:55:26', '1', 'admin', '2018-06-24 22:55:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3825', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:55:26', '1', 'admin', '2018-06-24 22:55:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3826', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:55:27', '1', 'admin', '2018-06-24 22:55:27', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3827', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:55:27', '1', 'admin', '2018-06-24 22:55:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3828', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:56:12', '1', 'admin', '2018-06-24 22:56:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3829', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:56:12', '1', 'admin', '2018-06-24 22:56:12', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3830', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:56:12', '1', 'admin', '2018-06-24 22:56:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3831', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:56:13', '1', 'admin', '2018-06-24 22:56:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3832', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:56:13', '1', 'admin', '2018-06-24 22:56:13', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3833', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:56:13', '1', 'admin', '2018-06-24 22:56:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3834', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:56:20', '1', 'admin', '2018-06-24 22:56:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3835', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:56:20', '1', 'admin', '2018-06-24 22:56:20', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3836', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:56:20', '1', 'admin', '2018-06-24 22:56:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3837', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:57:16', '1', 'admin', '2018-06-24 22:57:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3838', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:57:16', '1', 'admin', '2018-06-24 22:57:16', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3839', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:57:16', '1', 'admin', '2018-06-24 22:57:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3840', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:57:17', '1', 'admin', '2018-06-24 22:57:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3841', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:57:18', '1', 'admin', '2018-06-24 22:57:18', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3842', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:57:18', '1', 'admin', '2018-06-24 22:57:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3843', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:57:34', '1', 'admin', '2018-06-24 22:57:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3844', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:57:34', '1', 'admin', '2018-06-24 22:57:34', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3845', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:57:34', '1', 'admin', '2018-06-24 22:57:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3846', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:57:53', '1', 'admin', '2018-06-24 22:57:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3847', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:57:53', '1', 'admin', '2018-06-24 22:57:53', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3848', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:57:53', '1', 'admin', '2018-06-24 22:57:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3849', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:58:22', '1', 'admin', '2018-06-24 22:58:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3850', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:58:22', '1', 'admin', '2018-06-24 22:58:22', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3851', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:58:22', '1', 'admin', '2018-06-24 22:58:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3852', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:58:42', '1', 'admin', '2018-06-24 22:58:42', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3853', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:58:42', '1', 'admin', '2018-06-24 22:58:42', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3854', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:58:51', '1', 'admin', '2018-06-24 22:58:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3855', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 22:59:37', '1', 'admin', '2018-06-24 22:59:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3856', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 22:59:37', '1', 'admin', '2018-06-24 22:59:37', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3857', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 22:59:39', '1', 'admin', '2018-06-24 22:59:39', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3858', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 23:00:29', '1', 'admin', '2018-06-24 23:00:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3859', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 23:00:29', '1', 'admin', '2018-06-24 23:00:29', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3860', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 23:00:32', '1', 'admin', '2018-06-24 23:00:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3861', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 23:01:37', '1', 'admin', '2018-06-24 23:01:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3862', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 23:01:38', '1', 'admin', '2018-06-24 23:01:38', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3863', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 23:01:39', '1', 'admin', '2018-06-24 23:01:39', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3864', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 23:02:08', '1', 'admin', '2018-06-24 23:02:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3865', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 23:02:08', '1', 'admin', '2018-06-24 23:02:08', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3866', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 23:02:11', '1', 'admin', '2018-06-24 23:02:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3867', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 23:02:29', '1', 'admin', '2018-06-24 23:02:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3868', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 23:02:41', '1', 'admin', '2018-06-24 23:02:41', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3869', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 23:02:41', '1', 'admin', '2018-06-24 23:02:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3870', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 23:03:02', '1', 'admin', '2018-06-24 23:03:02', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3871', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 23:03:04', '1', 'admin', '2018-06-24 23:03:04', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3872', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 23:03:04', '1', 'admin', '2018-06-24 23:03:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3873', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 23:04:03', '1', 'admin', '2018-06-24 23:04:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3874', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 23:04:05', '1', 'admin', '2018-06-24 23:04:05', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3875', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 23:04:05', '1', 'admin', '2018-06-24 23:04:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3876', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 23:05:11', '1', 'admin', '2018-06-24 23:05:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3877', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 23:05:14', '1', 'admin', '2018-06-24 23:05:14', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3878', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 23:05:43', '1', 'admin', '2018-06-24 23:05:43', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3879', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 23:06:08', '1', 'admin', '2018-06-24 23:06:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3880', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 23:06:13', '1', 'admin', '2018-06-24 23:06:13', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3881', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 23:06:38', '1', 'admin', '2018-06-24 23:06:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3882', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 23:07:14', '1', 'admin', '2018-06-24 23:07:14', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3883', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 23:07:17', '1', 'admin', '2018-06-24 23:07:17', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3884', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 23:07:19', '1', 'admin', '2018-06-24 23:07:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3885', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 23:08:14', '1', 'admin', '2018-06-24 23:08:14', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3886', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 23:08:16', '1', 'admin', '2018-06-24 23:08:16', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3887', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 23:08:18', '1', 'admin', '2018-06-24 23:08:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3888', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 23:08:39', '1', 'admin', '2018-06-24 23:08:39', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3889', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 23:08:43', '1', 'admin', '2018-06-24 23:08:43', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3890', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 23:08:46', '1', 'admin', '2018-06-24 23:08:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3891', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 23:09:27', '1', 'admin', '2018-06-24 23:09:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3892', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 23:09:27', '1', 'admin', '2018-06-24 23:09:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3893', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 23:09:27', '1', 'admin', '2018-06-24 23:09:27', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3894', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 23:17:59', '1', 'admin', '2018-06-24 23:17:59', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3895', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 23:18:00', '1', 'admin', '2018-06-24 23:18:00', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3896', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 23:18:00', '1', 'admin', '2018-06-24 23:18:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3897', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 23:19:00', '1', 'admin', '2018-06-24 23:19:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3898', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 23:19:00', '1', 'admin', '2018-06-24 23:19:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3899', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 23:19:00', '1', 'admin', '2018-06-24 23:19:00', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3900', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/user/addUser', '2018-06-24 23:21:09', '1', 'admin', '2018-06-24 23:21:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3901', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 23:21:10', '1', 'admin', '2018-06-24 23:21:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3902', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-24 23:21:10', '1', 'admin', '2018-06-24 23:21:10', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('3903', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-24 23:24:27', '1', 'admin', '2018-06-24 23:24:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3904', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-24 23:24:27', '1', 'admin', '2018-06-24 23:24:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3905', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-24 23:24:28', '1', 'admin', '2018-06-24 23:24:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3906', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-24 23:24:28', '1', 'admin', '2018-06-24 23:24:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3907', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-24 23:24:29', '1', 'admin', '2018-06-24 23:24:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3908', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-24 23:24:29', '1', 'admin', '2018-06-24 23:24:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3909', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-24 23:24:30', '1', 'admin', '2018-06-24 23:24:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3910', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-24 23:24:30', '1', 'admin', '2018-06-24 23:24:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3911', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 23:24:31', '1', 'admin', '2018-06-24 23:24:31', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3912', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 23:24:36', '1', 'admin', '2018-06-24 23:24:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3913', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 23:24:40', '1', 'admin', '2018-06-24 23:24:40', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3914', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-24 23:24:43', '1', 'admin', '2018-06-24 23:24:43', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3915', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-25 14:14:02', '1', 'guest', '2018-06-25 14:14:02', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3916', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-25 14:14:03', '1', 'guest', '2018-06-25 14:14:03', '登陆');
INSERT INTO `sys_log` VALUES ('3917', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-25 14:14:04', '1', 'admin', '2018-06-25 14:14:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3918', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-25 14:14:05', '1', 'admin', '2018-06-25 14:14:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3919', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-25 14:14:05', '1', 'admin', '2018-06-25 14:14:05', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3920', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/department', '2018-06-25 14:14:08', '1', 'admin', '2018-06-25 14:14:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3921', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 14:14:08', '1', 'admin', '2018-06-25 14:14:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3922', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-25 14:14:24', '1', 'guest', '2018-06-25 14:14:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3923', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-25 14:14:26', '1', 'guest', '2018-06-25 14:14:26', '登陆');
INSERT INTO `sys_log` VALUES ('3924', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-25 14:14:26', '1', 'admin', '2018-06-25 14:14:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3925', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-25 14:14:26', '1', 'admin', '2018-06-25 14:14:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3926', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-25 14:14:26', '1', 'admin', '2018-06-25 14:14:26', '获取日志列表');
INSERT INTO `sys_log` VALUES ('3927', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/department', '2018-06-25 14:14:36', '1', 'admin', '2018-06-25 14:14:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3928', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 14:14:36', '1', 'admin', '2018-06-25 14:14:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3929', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 14:14:39', '1', 'admin', '2018-06-25 14:14:39', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3930', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 14:14:39', '1', 'admin', '2018-06-25 14:14:39', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3931', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 14:15:28', '1', 'admin', '2018-06-25 14:15:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3932', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 14:15:29', '1', 'admin', '2018-06-25 14:15:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3933', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 14:15:30', '1', 'admin', '2018-06-25 14:15:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3934', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 14:15:31', '1', 'admin', '2018-06-25 14:15:31', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3935', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 14:15:34', '1', 'admin', '2018-06-25 14:15:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3936', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 14:15:35', '1', 'admin', '2018-06-25 14:15:35', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3937', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 14:16:32', '1', 'admin', '2018-06-25 14:16:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3938', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 14:16:32', '1', 'admin', '2018-06-25 14:16:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3939', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 14:16:32', '1', 'admin', '2018-06-25 14:16:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3940', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 14:16:36', '1', 'admin', '2018-06-25 14:16:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3941', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 14:16:36', '1', 'admin', '2018-06-25 14:16:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3942', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 14:16:36', '1', 'admin', '2018-06-25 14:16:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3943', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 14:19:05', '1', 'admin', '2018-06-25 14:19:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3944', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 14:19:06', '1', 'admin', '2018-06-25 14:19:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3945', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 14:19:06', '1', 'admin', '2018-06-25 14:19:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3946', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 14:22:42', '1', 'admin', '2018-06-25 14:22:42', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3947', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 14:22:42', '1', 'admin', '2018-06-25 14:22:42', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3948', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 14:22:43', '1', 'admin', '2018-06-25 14:22:43', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3949', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 14:22:44', '1', 'admin', '2018-06-25 14:22:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3950', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 14:22:44', '1', 'admin', '2018-06-25 14:22:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3951', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 14:22:44', '1', 'admin', '2018-06-25 14:22:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3952', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 14:23:00', '1', 'admin', '2018-06-25 14:23:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3953', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 14:23:00', '1', 'admin', '2018-06-25 14:23:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3954', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 14:23:00', '1', 'admin', '2018-06-25 14:23:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3955', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 14:27:10', '1', 'admin', '2018-06-25 14:27:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3956', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 14:27:10', '1', 'admin', '2018-06-25 14:27:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3957', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 14:27:11', '1', 'admin', '2018-06-25 14:27:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3958', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 14:27:18', '1', 'admin', '2018-06-25 14:27:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3959', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 14:27:18', '1', 'admin', '2018-06-25 14:27:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3960', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 14:27:18', '1', 'admin', '2018-06-25 14:27:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3961', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 14:27:36', '1', 'admin', '2018-06-25 14:27:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3962', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 14:28:57', '1', 'admin', '2018-06-25 14:28:57', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3963', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 14:29:07', '1', 'admin', '2018-06-25 14:29:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3964', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 14:30:34', '1', 'admin', '2018-06-25 14:30:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3965', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 14:30:35', '1', 'admin', '2018-06-25 14:30:35', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3966', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 14:30:35', '1', 'admin', '2018-06-25 14:30:35', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3967', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 14:32:17', '1', 'admin', '2018-06-25 14:32:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3968', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 14:32:17', '1', 'admin', '2018-06-25 14:32:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3969', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 14:32:17', '1', 'admin', '2018-06-25 14:32:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3970', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 14:32:18', '1', 'admin', '2018-06-25 14:32:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3971', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 14:32:18', '1', 'admin', '2018-06-25 14:32:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3972', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 14:32:18', '1', 'admin', '2018-06-25 14:32:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3973', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 14:35:03', '1', 'admin', '2018-06-25 14:35:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3974', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 14:35:03', '1', 'admin', '2018-06-25 14:35:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3975', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 14:35:03', '1', 'admin', '2018-06-25 14:35:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3976', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 14:35:05', '1', 'admin', '2018-06-25 14:35:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3977', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 14:35:05', '1', 'admin', '2018-06-25 14:35:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3978', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 14:35:05', '1', 'admin', '2018-06-25 14:35:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3979', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 14:35:09', '1', 'admin', '2018-06-25 14:35:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3980', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 14:35:10', '1', 'admin', '2018-06-25 14:35:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3981', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 14:35:10', '1', 'admin', '2018-06-25 14:35:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3982', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 14:35:12', '1', 'admin', '2018-06-25 14:35:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3983', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 14:35:12', '1', 'admin', '2018-06-25 14:35:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3984', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 14:35:12', '1', 'admin', '2018-06-25 14:35:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3985', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 14:35:22', '1', 'admin', '2018-06-25 14:35:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3986', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 14:35:23', '1', 'admin', '2018-06-25 14:35:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3987', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 14:35:23', '1', 'admin', '2018-06-25 14:35:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3988', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 14:36:39', '1', 'admin', '2018-06-25 14:36:39', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3989', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 14:36:41', '1', 'admin', '2018-06-25 14:36:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3990', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 14:36:45', '1', 'admin', '2018-06-25 14:36:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3991', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 14:36:45', '1', 'admin', '2018-06-25 14:36:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3992', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 14:36:49', '1', 'admin', '2018-06-25 14:36:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3993', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 14:36:51', '1', 'admin', '2018-06-25 14:36:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3994', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 14:36:53', '1', 'admin', '2018-06-25 14:36:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3995', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 14:36:54', '1', 'admin', '2018-06-25 14:36:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3996', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 14:36:55', '1', 'admin', '2018-06-25 14:36:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3997', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 14:37:08', '1', 'admin', '2018-06-25 14:37:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3998', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 14:37:10', '1', 'admin', '2018-06-25 14:37:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('3999', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 14:37:10', '1', 'admin', '2018-06-25 14:37:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4000', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 14:37:11', '1', 'admin', '2018-06-25 14:37:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4001', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 14:37:12', '1', 'admin', '2018-06-25 14:37:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4002', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 14:37:12', '1', 'admin', '2018-06-25 14:37:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4003', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 14:37:13', '1', 'admin', '2018-06-25 14:37:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4004', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 14:37:13', '1', 'admin', '2018-06-25 14:37:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4005', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 14:37:15', '1', 'admin', '2018-06-25 14:37:15', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4006', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 14:37:15', '1', 'admin', '2018-06-25 14:37:15', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4007', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 14:37:16', '1', 'admin', '2018-06-25 14:37:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4008', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 14:37:18', '1', 'admin', '2018-06-25 14:37:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4009', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 14:37:20', '1', 'admin', '2018-06-25 14:37:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4010', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 14:37:40', '1', 'admin', '2018-06-25 14:37:40', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4011', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 14:37:53', '1', 'admin', '2018-06-25 14:37:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4012', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 14:44:04', '1', 'admin', '2018-06-25 14:44:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4013', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 14:44:05', '1', 'admin', '2018-06-25 14:44:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4014', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 14:44:05', '1', 'admin', '2018-06-25 14:44:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4015', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 14:44:08', '1', 'admin', '2018-06-25 14:44:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4016', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 14:44:09', '1', 'admin', '2018-06-25 14:44:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4017', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 14:44:12', '1', 'admin', '2018-06-25 14:44:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4018', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 14:51:26', '1', 'admin', '2018-06-25 14:51:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4019', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 14:51:27', '1', 'admin', '2018-06-25 14:51:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4020', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 14:51:27', '1', 'admin', '2018-06-25 14:51:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4021', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 14:51:29', '1', 'admin', '2018-06-25 14:51:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4022', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 14:51:29', '1', 'admin', '2018-06-25 14:51:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4023', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 14:51:29', '1', 'admin', '2018-06-25 14:51:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4024', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 14:51:32', '1', 'admin', '2018-06-25 14:51:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4025', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 14:51:32', '1', 'admin', '2018-06-25 14:51:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4026', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 14:51:33', '1', 'admin', '2018-06-25 14:51:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4027', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 14:53:55', '1', 'admin', '2018-06-25 14:53:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4028', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 14:53:55', '1', 'admin', '2018-06-25 14:53:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4029', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 14:53:55', '1', 'admin', '2018-06-25 14:53:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4030', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 14:54:40', '1', 'admin', '2018-06-25 14:54:40', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4031', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 14:54:40', '1', 'admin', '2018-06-25 14:54:40', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4032', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 14:54:40', '1', 'admin', '2018-06-25 14:54:40', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4033', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 14:55:27', '1', 'admin', '2018-06-25 14:55:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4034', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 14:55:27', '1', 'admin', '2018-06-25 14:55:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4035', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 14:55:27', '1', 'admin', '2018-06-25 14:55:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4036', null, 'Chrome', 'GET', 'http://www.sharejs.com/js/menu/10595', '127.0.0.1', '/login', '2018-06-25 15:01:42', '1', 'guest', '2018-06-25 15:01:42', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4037', null, 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/login', '2018-06-25 15:02:34', '1', 'guest', '2018-06-25 15:02:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4038', null, 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/login', '2018-06-25 15:02:44', '1', 'guest', '2018-06-25 15:02:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4039', null, 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/login', '2018-06-25 15:02:50', '1', 'guest', '2018-06-25 15:02:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4040', null, 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/login', '2018-06-25 15:02:53', '1', 'guest', '2018-06-25 15:02:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4041', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-25 15:02:54', '1', 'guest', '2018-06-25 15:02:54', '登陆');
INSERT INTO `sys_log` VALUES ('4042', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-25 15:02:54', '1', 'admin', '2018-06-25 15:02:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4043', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-25 15:02:54', '1', 'admin', '2018-06-25 15:02:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4044', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-25 15:02:55', '1', 'admin', '2018-06-25 15:02:55', '获取日志列表');
INSERT INTO `sys_log` VALUES ('4045', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/department', '2018-06-25 15:03:08', '1', 'admin', '2018-06-25 15:03:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4046', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 15:03:08', '1', 'admin', '2018-06-25 15:03:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4047', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:03:08', '1', 'admin', '2018-06-25 15:03:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4048', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 15:03:10', '1', 'admin', '2018-06-25 15:03:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4049', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/user', '2018-06-25 15:07:35', '1', 'admin', '2018-06-25 15:07:35', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4050', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/getUserList', '2018-06-25 15:07:36', '1', 'admin', '2018-06-25 15:07:36', '获取用户列表');
INSERT INTO `sys_log` VALUES ('4051', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user', '127.0.0.1', '/system/user/addUser', '2018-06-25 15:07:37', '1', 'admin', '2018-06-25 15:07:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4052', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 15:07:37', '1', 'admin', '2018-06-25 15:07:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4053', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/user/addUser?id=1', '127.0.0.1', '/system/user/getUser', '2018-06-25 15:07:37', '1', 'admin', '2018-06-25 15:07:37', '根据id获取用户信息');
INSERT INTO `sys_log` VALUES ('4054', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 15:08:06', '1', 'admin', '2018-06-25 15:08:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4055', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 15:08:17', '1', 'admin', '2018-06-25 15:08:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4056', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 15:12:42', '1', 'admin', '2018-06-25 15:12:42', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4057', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 15:13:16', '1', 'admin', '2018-06-25 15:13:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4058', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 15:13:17', '1', 'admin', '2018-06-25 15:13:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4059', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 15:13:22', '1', 'admin', '2018-06-25 15:13:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4060', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 15:13:38', '1', 'admin', '2018-06-25 15:13:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4061', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 15:15:05', '1', 'admin', '2018-06-25 15:15:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4062', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 15:15:06', '1', 'admin', '2018-06-25 15:15:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4063', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 15:15:07', '1', 'admin', '2018-06-25 15:15:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4064', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 15:15:08', '1', 'admin', '2018-06-25 15:15:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4065', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 15:15:08', '1', 'admin', '2018-06-25 15:15:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4066', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 15:18:13', '1', 'admin', '2018-06-25 15:18:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4067', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 15:18:13', '1', 'admin', '2018-06-25 15:18:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4068', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 15:18:48', '1', 'admin', '2018-06-25 15:18:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4069', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 15:18:56', '1', 'admin', '2018-06-25 15:18:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4070', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 15:19:20', '1', 'admin', '2018-06-25 15:19:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4071', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 15:19:22', '1', 'admin', '2018-06-25 15:19:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4072', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 15:20:08', '1', 'admin', '2018-06-25 15:20:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4073', null, 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/login', '2018-06-25 15:21:11', '1', 'guest', '2018-06-25 15:21:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4074', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-25 15:21:13', '1', 'guest', '2018-06-25 15:21:13', '登陆');
INSERT INTO `sys_log` VALUES ('4075', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-25 15:21:13', '1', 'admin', '2018-06-25 15:21:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4076', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-25 15:21:13', '1', 'admin', '2018-06-25 15:21:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4077', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-25 15:21:14', '1', 'admin', '2018-06-25 15:21:14', '获取日志列表');
INSERT INTO `sys_log` VALUES ('4078', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/department', '2018-06-25 15:21:15', '1', 'admin', '2018-06-25 15:21:15', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4079', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 15:21:16', '1', 'admin', '2018-06-25 15:21:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4080', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 15:21:22', '1', 'admin', '2018-06-25 15:21:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4081', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 15:21:45', '1', 'admin', '2018-06-25 15:21:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4082', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 15:21:50', '1', 'admin', '2018-06-25 15:21:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4083', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 15:21:51', '1', 'admin', '2018-06-25 15:21:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4084', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 15:21:51', '1', 'admin', '2018-06-25 15:21:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4085', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 15:22:46', '1', 'admin', '2018-06-25 15:22:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4086', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 15:22:50', '1', 'admin', '2018-06-25 15:22:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4087', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 15:22:51', '1', 'admin', '2018-06-25 15:22:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4088', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 15:22:53', '1', 'admin', '2018-06-25 15:22:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4089', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 15:22:54', '1', 'admin', '2018-06-25 15:22:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4090', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 15:22:56', '1', 'admin', '2018-06-25 15:22:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4091', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 15:22:57', '1', 'admin', '2018-06-25 15:22:57', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4092', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 15:27:37', '1', 'admin', '2018-06-25 15:27:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4093', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 15:27:37', '1', 'admin', '2018-06-25 15:27:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4094', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 15:27:38', '1', 'admin', '2018-06-25 15:27:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4095', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 15:27:38', '1', 'admin', '2018-06-25 15:27:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4096', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 15:27:58', '1', 'admin', '2018-06-25 15:27:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4097', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 15:29:50', '1', 'admin', '2018-06-25 15:29:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4098', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 15:29:52', '1', 'admin', '2018-06-25 15:29:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4099', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 15:30:04', '1', 'admin', '2018-06-25 15:30:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4100', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 15:30:07', '1', 'admin', '2018-06-25 15:30:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4101', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:35:12', '1', 'admin', '2018-06-25 15:35:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4102', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:43:13', '1', 'admin', '2018-06-25 15:43:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4103', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:43:14', '1', 'admin', '2018-06-25 15:43:14', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4104', null, 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/login', '2018-06-25 15:45:18', '1', 'guest', '2018-06-25 15:45:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4105', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-25 15:45:19', '1', 'guest', '2018-06-25 15:45:19', '登陆');
INSERT INTO `sys_log` VALUES ('4106', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-25 15:45:20', '1', 'admin', '2018-06-25 15:45:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4107', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-25 15:45:20', '1', 'admin', '2018-06-25 15:45:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4108', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-25 15:45:20', '1', 'admin', '2018-06-25 15:45:20', '获取日志列表');
INSERT INTO `sys_log` VALUES ('4109', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:45:22', '1', 'admin', '2018-06-25 15:45:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4110', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:46:15', '1', 'admin', '2018-06-25 15:46:15', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4111', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:46:15', '1', 'admin', '2018-06-25 15:46:15', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4112', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:46:16', '1', 'admin', '2018-06-25 15:46:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4113', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:46:17', '1', 'admin', '2018-06-25 15:46:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4114', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:46:17', '1', 'admin', '2018-06-25 15:46:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4115', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:46:23', '1', 'admin', '2018-06-25 15:46:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4116', null, 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/login', '2018-06-25 15:46:48', '1', 'guest', '2018-06-25 15:46:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4117', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-25 15:46:50', '1', 'guest', '2018-06-25 15:46:50', '登陆');
INSERT INTO `sys_log` VALUES ('4118', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-25 15:46:52', '1', 'admin', '2018-06-25 15:46:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4119', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-25 15:46:52', '1', 'admin', '2018-06-25 15:46:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4120', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-25 15:46:52', '1', 'admin', '2018-06-25 15:46:52', '获取日志列表');
INSERT INTO `sys_log` VALUES ('4121', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:46:53', '1', 'admin', '2018-06-25 15:46:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4122', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:47:35', '1', 'admin', '2018-06-25 15:47:35', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4123', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:49:48', '1', 'admin', '2018-06-25 15:49:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4124', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:49:49', '1', 'admin', '2018-06-25 15:49:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4125', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:49:49', '1', 'admin', '2018-06-25 15:49:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4126', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:49:50', '1', 'admin', '2018-06-25 15:49:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4127', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:49:50', '1', 'admin', '2018-06-25 15:49:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4128', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:49:50', '1', 'admin', '2018-06-25 15:49:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4129', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:49:50', '1', 'admin', '2018-06-25 15:49:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4130', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:49:51', '1', 'admin', '2018-06-25 15:49:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4131', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:49:51', '1', 'admin', '2018-06-25 15:49:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4132', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:49:51', '1', 'admin', '2018-06-25 15:49:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4133', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:49:51', '1', 'admin', '2018-06-25 15:49:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4134', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:49:52', '1', 'admin', '2018-06-25 15:49:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4135', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:49:52', '1', 'admin', '2018-06-25 15:49:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4136', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:49:52', '1', 'admin', '2018-06-25 15:49:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4137', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:49:53', '1', 'admin', '2018-06-25 15:49:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4138', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:49:54', '1', 'admin', '2018-06-25 15:49:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4139', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:49:54', '1', 'admin', '2018-06-25 15:49:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4140', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:49:54', '1', 'admin', '2018-06-25 15:49:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4141', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:49:55', '1', 'admin', '2018-06-25 15:49:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4142', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:49:55', '1', 'admin', '2018-06-25 15:49:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4143', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:49:55', '1', 'admin', '2018-06-25 15:49:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4144', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department/getDepartTreeCombo', '2018-06-25 15:50:16', '1', 'admin', '2018-06-25 15:50:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4145', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 16:09:38', '1', 'admin', '2018-06-25 16:09:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4146', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 16:09:41', '1', 'admin', '2018-06-25 16:09:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4147', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 16:09:42', '1', 'admin', '2018-06-25 16:09:42', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4148', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 16:10:50', '1', 'admin', '2018-06-25 16:10:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4149', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 16:10:51', '1', 'admin', '2018-06-25 16:10:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4150', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 16:13:33', '1', 'admin', '2018-06-25 16:13:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4151', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 16:13:33', '1', 'admin', '2018-06-25 16:13:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4152', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 16:14:14', '1', 'admin', '2018-06-25 16:14:14', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4153', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 16:14:15', '1', 'admin', '2018-06-25 16:14:15', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4154', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 16:14:16', '1', 'admin', '2018-06-25 16:14:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4155', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 16:14:16', '1', 'admin', '2018-06-25 16:14:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4156', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 16:14:48', '1', 'admin', '2018-06-25 16:14:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4157', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 16:14:49', '1', 'admin', '2018-06-25 16:14:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4158', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 16:15:05', '1', 'admin', '2018-06-25 16:15:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4159', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 16:15:07', '1', 'admin', '2018-06-25 16:15:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4160', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 16:15:08', '1', 'admin', '2018-06-25 16:15:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4161', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 16:15:09', '1', 'admin', '2018-06-25 16:15:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4162', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 16:15:09', '1', 'admin', '2018-06-25 16:15:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4163', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 16:15:10', '1', 'admin', '2018-06-25 16:15:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4164', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 16:15:11', '1', 'admin', '2018-06-25 16:15:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4165', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 16:15:14', '1', 'admin', '2018-06-25 16:15:14', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4166', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 16:16:13', '1', 'admin', '2018-06-25 16:16:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4167', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 16:16:14', '1', 'admin', '2018-06-25 16:16:14', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4168', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 16:16:15', '1', 'admin', '2018-06-25 16:16:15', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4169', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 16:16:16', '1', 'admin', '2018-06-25 16:16:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4170', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 16:16:17', '1', 'admin', '2018-06-25 16:16:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4171', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 16:16:18', '1', 'admin', '2018-06-25 16:16:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4172', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 16:16:19', '1', 'admin', '2018-06-25 16:16:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4173', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 16:16:19', '1', 'admin', '2018-06-25 16:16:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4174', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 16:16:20', '1', 'admin', '2018-06-25 16:16:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4175', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 16:16:21', '1', 'admin', '2018-06-25 16:16:21', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4176', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 16:16:21', '1', 'admin', '2018-06-25 16:16:21', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4177', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 16:16:22', '1', 'admin', '2018-06-25 16:16:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4178', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 16:16:23', '1', 'admin', '2018-06-25 16:16:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4179', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 16:16:23', '1', 'admin', '2018-06-25 16:16:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4180', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 16:22:41', '1', 'admin', '2018-06-25 16:22:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4181', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 16:22:41', '1', 'admin', '2018-06-25 16:22:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4182', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 16:22:44', '1', 'admin', '2018-06-25 16:22:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4183', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 16:22:44', '1', 'admin', '2018-06-25 16:22:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4184', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 16:23:13', '1', 'admin', '2018-06-25 16:23:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4185', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 16:23:13', '1', 'admin', '2018-06-25 16:23:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4186', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 16:23:45', '1', 'admin', '2018-06-25 16:23:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4187', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 16:23:45', '1', 'admin', '2018-06-25 16:23:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4188', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 16:26:16', '1', 'admin', '2018-06-25 16:26:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4189', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 16:26:17', '1', 'admin', '2018-06-25 16:26:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4190', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 16:26:41', '1', 'admin', '2018-06-25 16:26:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4191', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 16:26:41', '1', 'admin', '2018-06-25 16:26:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4192', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 16:28:29', '1', 'admin', '2018-06-25 16:28:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4193', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 16:28:30', '1', 'admin', '2018-06-25 16:28:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4194', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 16:28:32', '1', 'admin', '2018-06-25 16:28:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4195', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 16:28:32', '1', 'admin', '2018-06-25 16:28:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4196', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 16:29:10', '1', 'admin', '2018-06-25 16:29:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4197', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 16:29:10', '1', 'admin', '2018-06-25 16:29:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4198', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 16:29:14', '1', 'admin', '2018-06-25 16:29:14', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4199', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 16:29:14', '1', 'admin', '2018-06-25 16:29:14', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4200', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 16:30:45', '1', 'admin', '2018-06-25 16:30:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4201', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 16:30:46', '1', 'admin', '2018-06-25 16:30:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4202', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 16:30:50', '1', 'admin', '2018-06-25 16:30:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4203', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 16:30:55', '1', 'admin', '2018-06-25 16:30:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4204', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 16:31:26', '1', 'admin', '2018-06-25 16:31:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4205', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 16:31:27', '1', 'admin', '2018-06-25 16:31:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4206', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 16:31:31', '1', 'admin', '2018-06-25 16:31:31', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4207', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 16:34:00', '1', 'admin', '2018-06-25 16:34:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4208', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 16:34:00', '1', 'admin', '2018-06-25 16:34:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4209', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 16:35:22', '1', 'admin', '2018-06-25 16:35:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4210', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 16:35:22', '1', 'admin', '2018-06-25 16:35:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4211', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 16:35:29', '1', 'admin', '2018-06-25 16:35:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4212', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 16:35:31', '1', 'admin', '2018-06-25 16:35:31', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4213', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 16:35:31', '1', 'admin', '2018-06-25 16:35:31', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4214', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 16:35:32', '1', 'admin', '2018-06-25 16:35:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4215', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 16:35:33', '1', 'admin', '2018-06-25 16:35:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4216', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 16:35:33', '1', 'admin', '2018-06-25 16:35:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4217', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 16:35:35', '1', 'admin', '2018-06-25 16:35:35', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4218', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 16:35:36', '1', 'admin', '2018-06-25 16:35:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4219', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-25 17:17:46', '1', 'guest', '2018-06-25 17:17:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4220', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-25 17:17:47', '1', 'guest', '2018-06-25 17:17:47', '登陆');
INSERT INTO `sys_log` VALUES ('4221', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-25 17:17:47', '1', 'admin', '2018-06-25 17:17:47', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4222', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-25 17:17:47', '1', 'admin', '2018-06-25 17:17:47', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4223', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-25 17:17:48', '1', 'admin', '2018-06-25 17:17:48', '获取日志列表');
INSERT INTO `sys_log` VALUES ('4224', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/department', '2018-06-25 17:17:50', '1', 'admin', '2018-06-25 17:17:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4225', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 17:17:50', '1', 'admin', '2018-06-25 17:17:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4226', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 17:23:34', '1', 'admin', '2018-06-25 17:23:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4227', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 17:23:34', '1', 'admin', '2018-06-25 17:23:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4228', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 17:24:25', '1', 'admin', '2018-06-25 17:24:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4229', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 17:24:25', '1', 'admin', '2018-06-25 17:24:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4230', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 17:24:27', '1', 'admin', '2018-06-25 17:24:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4231', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 17:24:28', '1', 'admin', '2018-06-25 17:24:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4232', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 17:25:08', '1', 'admin', '2018-06-25 17:25:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4233', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 17:25:09', '1', 'admin', '2018-06-25 17:25:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4234', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 17:25:11', '1', 'admin', '2018-06-25 17:25:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4235', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 17:25:11', '1', 'admin', '2018-06-25 17:25:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4236', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 17:25:12', '1', 'admin', '2018-06-25 17:25:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4237', '1', 'Chrome', 'POST', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 17:25:18', '1', 'admin', '2018-06-25 17:25:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4238', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 17:27:04', '1', 'admin', '2018-06-25 17:27:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4239', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 17:27:04', '1', 'admin', '2018-06-25 17:27:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4240', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 17:27:06', '1', 'admin', '2018-06-25 17:27:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4241', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 17:27:06', '1', 'admin', '2018-06-25 17:27:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4242', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 17:27:07', '1', 'admin', '2018-06-25 17:27:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4243', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 17:27:07', '1', 'admin', '2018-06-25 17:27:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4244', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 17:27:08', '1', 'admin', '2018-06-25 17:27:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4245', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 17:27:09', '1', 'admin', '2018-06-25 17:27:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4246', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 17:27:22', '1', 'admin', '2018-06-25 17:27:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4247', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 17:27:22', '1', 'admin', '2018-06-25 17:27:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4248', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 17:27:32', '1', 'admin', '2018-06-25 17:27:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4249', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 17:27:32', '1', 'admin', '2018-06-25 17:27:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4250', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 17:27:56', '1', 'admin', '2018-06-25 17:27:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4251', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 17:27:56', '1', 'admin', '2018-06-25 17:27:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4252', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 17:28:36', '1', 'admin', '2018-06-25 17:28:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4253', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 17:28:37', '1', 'admin', '2018-06-25 17:28:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4254', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 17:28:41', '1', 'admin', '2018-06-25 17:28:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4255', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 17:33:16', '1', 'admin', '2018-06-25 17:33:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4256', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 17:33:16', '1', 'admin', '2018-06-25 17:33:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4257', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 17:34:07', '1', 'admin', '2018-06-25 17:34:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4258', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 17:34:08', '1', 'admin', '2018-06-25 17:34:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4259', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 17:41:47', '1', 'admin', '2018-06-25 17:41:47', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4260', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 17:41:47', '1', 'admin', '2018-06-25 17:41:47', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4261', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 17:41:49', '1', 'admin', '2018-06-25 17:41:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4262', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 17:41:49', '1', 'admin', '2018-06-25 17:41:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4263', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 17:41:51', '1', 'admin', '2018-06-25 17:41:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4264', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 17:41:51', '1', 'admin', '2018-06-25 17:41:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4265', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 17:41:51', '1', 'admin', '2018-06-25 17:41:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4266', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 17:41:52', '1', 'admin', '2018-06-25 17:41:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4267', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 17:42:48', '1', 'admin', '2018-06-25 17:42:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4268', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 17:42:48', '1', 'admin', '2018-06-25 17:42:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4269', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 17:42:49', '1', 'admin', '2018-06-25 17:42:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4270', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 17:42:49', '1', 'admin', '2018-06-25 17:42:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4271', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 17:42:50', '1', 'admin', '2018-06-25 17:42:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4272', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 17:42:50', '1', 'admin', '2018-06-25 17:42:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4273', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 17:45:09', '1', 'admin', '2018-06-25 17:45:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4274', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 17:45:09', '1', 'admin', '2018-06-25 17:45:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4275', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 17:45:10', '1', 'admin', '2018-06-25 17:45:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4276', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 17:45:11', '1', 'admin', '2018-06-25 17:45:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4277', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 17:46:01', '1', 'admin', '2018-06-25 17:46:01', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4278', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 17:46:01', '1', 'admin', '2018-06-25 17:46:01', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4279', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 17:47:00', '1', 'admin', '2018-06-25 17:47:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4280', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 17:47:01', '1', 'admin', '2018-06-25 17:47:01', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4281', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 17:47:03', '1', 'admin', '2018-06-25 17:47:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4282', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 17:47:03', '1', 'admin', '2018-06-25 17:47:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4283', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 17:47:33', '1', 'admin', '2018-06-25 17:47:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4284', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 17:48:47', '1', 'admin', '2018-06-25 17:48:47', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4285', null, 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/login', '2018-06-25 18:28:32', '1', 'guest', '2018-06-25 18:28:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4286', null, 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/login', '2018-06-25 18:28:35', '1', 'guest', '2018-06-25 18:28:35', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4287', null, 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/login', '2018-06-25 18:28:36', '1', 'guest', '2018-06-25 18:28:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4288', null, 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/login', '2018-06-25 18:28:38', '1', 'guest', '2018-06-25 18:28:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4289', null, 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/login', '2018-06-25 18:28:40', '1', 'guest', '2018-06-25 18:28:40', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4290', null, 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/login', '2018-06-25 18:28:42', '1', 'guest', '2018-06-25 18:28:42', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4291', null, 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/login', '2018-06-25 18:29:08', '1', 'guest', '2018-06-25 18:29:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4292', null, 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/login', '2018-06-25 18:29:09', '1', 'guest', '2018-06-25 18:29:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4293', null, 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/login', '2018-06-25 18:29:09', '1', 'guest', '2018-06-25 18:29:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4294', null, 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/login', '2018-06-25 18:29:10', '1', 'guest', '2018-06-25 18:29:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4295', null, 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/login', '2018-06-25 18:29:10', '1', 'guest', '2018-06-25 18:29:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4296', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-25 18:32:17', '1', 'guest', '2018-06-25 18:32:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4297', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-25 18:32:19', '1', 'guest', '2018-06-25 18:32:19', '登陆');
INSERT INTO `sys_log` VALUES ('4298', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-25 18:32:19', '1', 'admin', '2018-06-25 18:32:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4299', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-25 18:32:19', '1', 'admin', '2018-06-25 18:32:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4300', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-25 18:32:19', '1', 'admin', '2018-06-25 18:32:19', '获取日志列表');
INSERT INTO `sys_log` VALUES ('4301', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/department', '2018-06-25 18:32:24', '1', 'admin', '2018-06-25 18:32:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4302', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 18:32:25', '1', 'admin', '2018-06-25 18:32:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4303', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 18:32:27', '1', 'admin', '2018-06-25 18:32:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4304', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 18:32:28', '1', 'admin', '2018-06-25 18:32:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4305', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 18:32:47', '1', 'admin', '2018-06-25 18:32:47', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4306', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 18:32:51', '1', 'admin', '2018-06-25 18:32:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4307', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 18:32:54', '1', 'admin', '2018-06-25 18:32:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4308', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 18:32:55', '1', 'admin', '2018-06-25 18:32:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4309', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 18:34:01', '1', 'admin', '2018-06-25 18:34:01', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4310', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 18:34:02', '1', 'admin', '2018-06-25 18:34:02', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4311', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 18:34:16', '1', 'admin', '2018-06-25 18:34:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4312', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 18:34:16', '1', 'admin', '2018-06-25 18:34:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4313', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 18:34:17', '1', 'admin', '2018-06-25 18:34:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4314', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 18:34:37', '1', 'admin', '2018-06-25 18:34:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4315', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 18:43:28', '1', 'admin', '2018-06-25 18:43:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4316', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 18:43:29', '1', 'admin', '2018-06-25 18:43:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4317', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 18:43:37', '1', 'admin', '2018-06-25 18:43:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4318', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 18:44:20', '1', 'admin', '2018-06-25 18:44:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4319', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 18:44:20', '1', 'admin', '2018-06-25 18:44:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4320', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentList', '2018-06-25 18:44:23', '1', 'admin', '2018-06-25 18:44:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4321', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 18:45:24', '1', 'admin', '2018-06-25 18:45:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4322', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 18:45:24', '1', 'admin', '2018-06-25 18:45:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4323', null, 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/login', '2018-06-25 18:53:09', '1', 'guest', '2018-06-25 18:53:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4324', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-25 19:15:03', '1', 'admin', '2018-06-25 19:15:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4325', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-25 19:15:31', '1', 'guest', '2018-06-25 19:15:31', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4326', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-25 19:15:33', '1', 'guest', '2018-06-25 19:15:33', '登陆');
INSERT INTO `sys_log` VALUES ('4327', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-25 19:15:34', '1', 'admin', '2018-06-25 19:15:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4328', '1', 'Chrome', 'GET', null, '127.0.0.1', '/', '2018-06-25 19:17:10', '1', 'admin', '2018-06-25 19:17:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4329', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-25 19:17:11', '1', 'admin', '2018-06-25 19:17:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4330', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-25 19:17:11', '1', 'admin', '2018-06-25 19:17:11', '获取日志列表');
INSERT INTO `sys_log` VALUES ('4331', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/log', '2018-06-25 19:17:41', '1', 'admin', '2018-06-25 19:17:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4332', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-25 19:17:42', '1', 'admin', '2018-06-25 19:17:42', '获取日志列表');
INSERT INTO `sys_log` VALUES ('4333', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/log', '2018-06-25 19:21:57', '1', 'admin', '2018-06-25 19:21:57', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4334', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-25 19:21:58', '1', 'admin', '2018-06-25 19:21:58', '获取日志列表');
INSERT INTO `sys_log` VALUES ('4335', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-25 19:22:14', '1', 'admin', '2018-06-25 19:22:14', '获取日志列表');
INSERT INTO `sys_log` VALUES ('4336', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-25 19:23:21', '1', 'admin', '2018-06-25 19:23:21', '获取日志列表');
INSERT INTO `sys_log` VALUES ('4337', null, 'Chrome', 'GET', null, '0:0:0:0:0:0:0:1', '/login', '2018-06-25 21:14:47', '1', 'guest', '2018-06-25 21:14:47', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4338', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-25 21:14:47', '1', 'guest', '2018-06-25 21:14:47', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4339', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-25 22:26:36', '1', 'guest', '2018-06-25 22:26:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4340', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-25 22:26:37', '1', 'guest', '2018-06-25 22:26:37', '登陆');
INSERT INTO `sys_log` VALUES ('4341', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-25 22:26:37', '1', 'admin', '2018-06-25 22:26:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4342', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-25 22:26:37', '1', 'admin', '2018-06-25 22:26:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4343', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-25 22:26:38', '1', 'admin', '2018-06-25 22:26:38', '获取日志列表');
INSERT INTO `sys_log` VALUES ('4344', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/department', '2018-06-25 22:27:17', '1', 'admin', '2018-06-25 22:27:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4345', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 22:27:17', '1', 'admin', '2018-06-25 22:27:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4346', null, 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/login', '2018-06-25 22:33:18', '1', 'guest', '2018-06-25 22:33:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4347', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-25 22:33:19', '1', 'guest', '2018-06-25 22:33:19', '登陆');
INSERT INTO `sys_log` VALUES ('4348', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-25 22:33:20', '1', 'admin', '2018-06-25 22:33:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4349', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-25 22:33:20', '1', 'admin', '2018-06-25 22:33:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4350', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-25 22:33:21', '1', 'admin', '2018-06-25 22:33:21', '获取日志列表');
INSERT INTO `sys_log` VALUES ('4351', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/department', '2018-06-25 22:33:23', '1', 'admin', '2018-06-25 22:33:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4352', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 22:33:23', '1', 'admin', '2018-06-25 22:33:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4353', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 22:33:28', '1', 'admin', '2018-06-25 22:33:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4354', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 22:36:40', '1', 'admin', '2018-06-25 22:36:40', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4355', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 22:36:50', '1', 'admin', '2018-06-25 22:36:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4356', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 22:38:37', '1', 'admin', '2018-06-25 22:38:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4357', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-25 22:41:51', '1', 'admin', '2018-06-25 22:41:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4358', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-25 22:41:51', '1', 'admin', '2018-06-25 22:41:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4359', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-25 22:41:52', '1', 'admin', '2018-06-25 22:41:52', '获取日志列表');
INSERT INTO `sys_log` VALUES ('4360', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/department', '2018-06-25 22:41:58', '1', 'admin', '2018-06-25 22:41:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4361', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 22:41:58', '1', 'admin', '2018-06-25 22:41:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4362', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 22:42:00', '1', 'admin', '2018-06-25 22:42:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4363', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 22:43:19', '1', 'admin', '2018-06-25 22:43:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4364', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 22:43:20', '1', 'admin', '2018-06-25 22:43:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4365', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 22:43:22', '1', 'admin', '2018-06-25 22:43:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4366', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 22:44:29', '1', 'admin', '2018-06-25 22:44:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4367', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 22:44:30', '1', 'admin', '2018-06-25 22:44:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4368', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 22:44:30', '1', 'admin', '2018-06-25 22:44:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4369', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 22:44:32', '1', 'admin', '2018-06-25 22:44:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4370', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 22:44:33', '1', 'admin', '2018-06-25 22:44:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4371', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 22:44:54', '1', 'admin', '2018-06-25 22:44:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4372', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 22:44:55', '1', 'admin', '2018-06-25 22:44:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4373', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 22:44:58', '1', 'admin', '2018-06-25 22:44:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4374', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 22:44:59', '1', 'admin', '2018-06-25 22:44:59', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4375', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 22:45:06', '1', 'admin', '2018-06-25 22:45:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4376', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 22:45:07', '1', 'admin', '2018-06-25 22:45:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4377', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 22:45:23', '1', 'admin', '2018-06-25 22:45:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4378', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 22:45:38', '1', 'admin', '2018-06-25 22:45:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4379', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 22:45:51', '1', 'admin', '2018-06-25 22:45:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4380', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 22:45:56', '1', 'admin', '2018-06-25 22:45:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4381', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 22:46:06', '1', 'admin', '2018-06-25 22:46:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4382', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 22:46:19', '1', 'admin', '2018-06-25 22:46:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4383', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 22:47:27', '1', 'admin', '2018-06-25 22:47:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4384', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 22:47:28', '1', 'admin', '2018-06-25 22:47:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4385', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 22:47:30', '1', 'admin', '2018-06-25 22:47:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4386', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 22:50:06', '1', 'admin', '2018-06-25 22:50:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4387', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 22:50:16', '1', 'admin', '2018-06-25 22:50:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4388', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 22:52:00', '1', 'admin', '2018-06-25 22:52:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4389', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 22:53:14', '1', 'admin', '2018-06-25 22:53:14', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4390', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 22:53:14', '1', 'admin', '2018-06-25 22:53:14', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4391', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 22:53:55', '1', 'admin', '2018-06-25 22:53:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4392', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 22:53:55', '1', 'admin', '2018-06-25 22:53:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4393', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 22:57:26', '1', 'admin', '2018-06-25 22:57:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4394', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 22:57:26', '1', 'admin', '2018-06-25 22:57:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4395', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/', '2018-06-25 22:57:27', '1', 'admin', '2018-06-25 22:57:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4396', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/', '2018-06-25 22:57:30', '1', 'admin', '2018-06-25 22:57:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4397', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/', '2018-06-25 22:57:31', '1', 'admin', '2018-06-25 22:57:31', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4398', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 22:57:49', '1', 'admin', '2018-06-25 22:57:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4399', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 22:57:49', '1', 'admin', '2018-06-25 22:57:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4400', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 22:57:50', '1', 'admin', '2018-06-25 22:57:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4401', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 22:57:50', '1', 'admin', '2018-06-25 22:57:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4402', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 22:57:50', '1', 'admin', '2018-06-25 22:57:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4403', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 22:57:51', '1', 'admin', '2018-06-25 22:57:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4404', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 22:57:56', '1', 'admin', '2018-06-25 22:57:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4405', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 22:57:56', '1', 'admin', '2018-06-25 22:57:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4406', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 22:58:02', '1', 'admin', '2018-06-25 22:58:02', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4407', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 22:58:03', '1', 'admin', '2018-06-25 22:58:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4408', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 22:58:04', '1', 'admin', '2018-06-25 22:58:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4409', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 22:58:04', '1', 'admin', '2018-06-25 22:58:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4410', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/', '2018-06-25 22:58:11', '1', 'admin', '2018-06-25 22:58:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4411', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 22:58:29', '1', 'admin', '2018-06-25 22:58:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4412', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 22:58:29', '1', 'admin', '2018-06-25 22:58:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4413', null, 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/login', '2018-06-25 22:59:03', '1', 'guest', '2018-06-25 22:59:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4414', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-25 22:59:05', '1', 'guest', '2018-06-25 22:59:05', '登陆');
INSERT INTO `sys_log` VALUES ('4415', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-25 22:59:05', '1', 'admin', '2018-06-25 22:59:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4416', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-25 22:59:06', '1', 'admin', '2018-06-25 22:59:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4417', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-25 22:59:06', '1', 'admin', '2018-06-25 22:59:06', '获取日志列表');
INSERT INTO `sys_log` VALUES ('4418', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 22:59:07', '1', 'admin', '2018-06-25 22:59:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4419', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 22:59:07', '1', 'admin', '2018-06-25 22:59:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4420', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 22:59:10', '1', 'admin', '2018-06-25 22:59:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4421', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 23:08:13', '1', 'admin', '2018-06-25 23:08:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4422', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 23:08:13', '1', 'admin', '2018-06-25 23:08:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4423', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 23:08:18', '1', 'admin', '2018-06-25 23:08:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4424', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:08:27', '1', 'admin', '2018-06-25 23:08:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4425', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 23:08:31', '1', 'admin', '2018-06-25 23:08:31', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4426', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 23:08:57', '1', 'admin', '2018-06-25 23:08:57', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4427', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 23:08:57', '1', 'admin', '2018-06-25 23:08:57', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4428', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 23:09:00', '1', 'admin', '2018-06-25 23:09:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4429', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 23:09:05', '1', 'admin', '2018-06-25 23:09:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4430', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 23:09:08', '1', 'admin', '2018-06-25 23:09:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4431', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 23:09:32', '1', 'admin', '2018-06-25 23:09:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4432', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 23:09:42', '1', 'admin', '2018-06-25 23:09:42', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4433', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 23:09:50', '1', 'admin', '2018-06-25 23:09:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4434', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 23:09:51', '1', 'admin', '2018-06-25 23:09:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4435', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 23:09:55', '1', 'admin', '2018-06-25 23:09:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4436', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 23:09:56', '1', 'admin', '2018-06-25 23:09:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4437', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 23:09:57', '1', 'admin', '2018-06-25 23:09:57', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4438', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 23:09:58', '1', 'admin', '2018-06-25 23:09:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4439', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 23:09:59', '1', 'admin', '2018-06-25 23:09:59', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4440', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:10:10', '1', 'admin', '2018-06-25 23:10:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4441', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:10:15', '1', 'admin', '2018-06-25 23:10:15', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4442', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:10:16', '1', 'admin', '2018-06-25 23:10:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4443', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:10:16', '1', 'admin', '2018-06-25 23:10:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4444', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:10:17', '1', 'admin', '2018-06-25 23:10:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4445', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:10:18', '1', 'admin', '2018-06-25 23:10:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4446', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:10:19', '1', 'admin', '2018-06-25 23:10:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4447', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:10:19', '1', 'admin', '2018-06-25 23:10:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4448', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 23:12:21', '1', 'admin', '2018-06-25 23:12:21', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4449', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/department', '2018-06-25 23:12:37', '1', 'admin', '2018-06-25 23:12:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4450', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 23:12:37', '1', 'admin', '2018-06-25 23:12:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4451', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 23:12:39', '1', 'admin', '2018-06-25 23:12:39', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4452', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:13:20', '1', 'admin', '2018-06-25 23:13:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4453', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:13:21', '1', 'admin', '2018-06-25 23:13:21', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4454', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:13:22', '1', 'admin', '2018-06-25 23:13:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4455', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:13:22', '1', 'admin', '2018-06-25 23:13:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4456', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:13:23', '1', 'admin', '2018-06-25 23:13:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4457', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:13:49', '1', 'admin', '2018-06-25 23:13:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4458', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 23:15:38', '1', 'admin', '2018-06-25 23:15:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4459', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 23:15:38', '1', 'admin', '2018-06-25 23:15:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4460', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:15:39', '1', 'admin', '2018-06-25 23:15:39', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4461', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:15:50', '1', 'admin', '2018-06-25 23:15:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4462', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:15:50', '1', 'admin', '2018-06-25 23:15:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4463', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:15:51', '1', 'admin', '2018-06-25 23:15:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4464', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:15:52', '1', 'admin', '2018-06-25 23:15:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4465', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:15:52', '1', 'admin', '2018-06-25 23:15:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4466', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 23:16:01', '1', 'admin', '2018-06-25 23:16:01', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4467', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 23:17:32', '1', 'admin', '2018-06-25 23:17:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4468', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 23:17:32', '1', 'admin', '2018-06-25 23:17:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4469', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 23:17:34', '1', 'admin', '2018-06-25 23:17:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4470', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 23:17:35', '1', 'admin', '2018-06-25 23:17:35', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4471', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:17:36', '1', 'admin', '2018-06-25 23:17:36', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4472', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:17:37', '1', 'admin', '2018-06-25 23:17:37', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4473', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:17:43', '1', 'admin', '2018-06-25 23:17:43', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4474', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 23:17:52', '1', 'admin', '2018-06-25 23:17:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4475', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 23:17:53', '1', 'admin', '2018-06-25 23:17:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4476', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:17:57', '1', 'admin', '2018-06-25 23:17:57', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4477', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 23:21:57', '1', 'admin', '2018-06-25 23:21:57', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4478', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 23:21:58', '1', 'admin', '2018-06-25 23:21:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4479', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 23:22:41', '1', 'admin', '2018-06-25 23:22:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4480', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 23:22:41', '1', 'admin', '2018-06-25 23:22:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4481', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 23:22:43', '1', 'admin', '2018-06-25 23:22:43', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4482', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 23:22:44', '1', 'admin', '2018-06-25 23:22:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4483', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 23:31:41', '1', 'admin', '2018-06-25 23:31:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4484', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 23:34:08', '1', 'admin', '2018-06-25 23:34:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4485', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 23:38:41', '1', 'admin', '2018-06-25 23:38:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4486', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 23:38:41', '1', 'admin', '2018-06-25 23:38:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4487', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:38:43', '1', 'admin', '2018-06-25 23:38:43', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4488', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:38:44', '1', 'admin', '2018-06-25 23:38:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4489', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 23:39:20', '1', 'admin', '2018-06-25 23:39:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4490', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 23:39:20', '1', 'admin', '2018-06-25 23:39:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4491', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:39:23', '1', 'admin', '2018-06-25 23:39:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4492', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:39:24', '1', 'admin', '2018-06-25 23:39:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4493', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:39:24', '1', 'admin', '2018-06-25 23:39:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4494', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:39:25', '1', 'admin', '2018-06-25 23:39:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4495', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-25 23:39:26', '1', 'admin', '2018-06-25 23:39:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4496', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 23:44:58', '1', 'admin', '2018-06-25 23:44:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4497', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 23:44:58', '1', 'admin', '2018-06-25 23:44:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4498', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 23:47:32', '1', 'admin', '2018-06-25 23:47:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4499', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 23:47:32', '1', 'admin', '2018-06-25 23:47:32', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4500', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 23:56:41', '1', 'admin', '2018-06-25 23:56:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4501', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 23:56:41', '1', 'admin', '2018-06-25 23:56:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4502', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 23:57:08', '1', 'admin', '2018-06-25 23:57:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4503', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 23:57:08', '1', 'admin', '2018-06-25 23:57:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4504', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 23:57:19', '1', 'admin', '2018-06-25 23:57:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4505', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 23:57:19', '1', 'admin', '2018-06-25 23:57:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4506', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 23:57:21', '1', 'admin', '2018-06-25 23:57:21', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4507', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 23:57:21', '1', 'admin', '2018-06-25 23:57:21', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4508', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 23:57:40', '1', 'admin', '2018-06-25 23:57:40', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4509', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 23:57:41', '1', 'admin', '2018-06-25 23:57:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4510', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 23:57:43', '1', 'admin', '2018-06-25 23:57:43', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4511', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 23:57:43', '1', 'admin', '2018-06-25 23:57:43', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4512', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 23:58:18', '1', 'admin', '2018-06-25 23:58:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4513', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 23:58:18', '1', 'admin', '2018-06-25 23:58:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4514', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 23:58:34', '1', 'admin', '2018-06-25 23:58:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4515', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 23:58:34', '1', 'admin', '2018-06-25 23:58:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4516', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-25 23:58:42', '1', 'admin', '2018-06-25 23:58:42', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4517', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 23:59:44', '1', 'admin', '2018-06-25 23:59:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4518', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 23:59:44', '1', 'admin', '2018-06-25 23:59:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4519', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-25 23:59:46', '1', 'admin', '2018-06-25 23:59:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4520', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-25 23:59:46', '1', 'admin', '2018-06-25 23:59:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4521', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:01:35', '1', 'admin', '2018-06-26 00:01:35', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4522', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:02:03', '1', 'admin', '2018-06-26 00:02:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4523', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:02:05', '1', 'admin', '2018-06-26 00:02:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4524', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:02:26', '1', 'admin', '2018-06-26 00:02:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4525', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:02:28', '1', 'admin', '2018-06-26 00:02:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4526', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:05:29', '1', 'admin', '2018-06-26 00:05:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4527', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:05:29', '1', 'admin', '2018-06-26 00:05:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4528', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:05:34', '1', 'admin', '2018-06-26 00:05:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4529', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:11:28', '1', 'admin', '2018-06-26 00:11:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4530', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:11:29', '1', 'admin', '2018-06-26 00:11:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4531', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:11:30', '1', 'admin', '2018-06-26 00:11:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4532', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:11:31', '1', 'admin', '2018-06-26 00:11:31', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4533', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:12:40', '1', 'admin', '2018-06-26 00:12:40', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4534', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:12:40', '1', 'admin', '2018-06-26 00:12:40', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4535', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:12:41', '1', 'admin', '2018-06-26 00:12:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4536', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:12:41', '1', 'admin', '2018-06-26 00:12:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4537', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:12:41', '1', 'admin', '2018-06-26 00:12:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4538', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:12:41', '1', 'admin', '2018-06-26 00:12:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4539', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:12:42', '1', 'admin', '2018-06-26 00:12:42', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4540', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:12:44', '1', 'admin', '2018-06-26 00:12:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4541', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:12:45', '1', 'admin', '2018-06-26 00:12:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4542', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:12:47', '1', 'admin', '2018-06-26 00:12:47', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4543', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:13:29', '1', 'admin', '2018-06-26 00:13:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4544', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:13:30', '1', 'admin', '2018-06-26 00:13:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4545', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:13:30', '1', 'admin', '2018-06-26 00:13:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4546', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:13:30', '1', 'admin', '2018-06-26 00:13:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4547', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:13:31', '1', 'admin', '2018-06-26 00:13:31', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4548', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:13:33', '1', 'admin', '2018-06-26 00:13:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4549', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:13:46', '1', 'admin', '2018-06-26 00:13:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4550', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:13:49', '1', 'admin', '2018-06-26 00:13:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4551', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:14:55', '1', 'admin', '2018-06-26 00:14:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4552', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:14:58', '1', 'admin', '2018-06-26 00:14:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4553', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:15:47', '1', 'admin', '2018-06-26 00:15:47', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4554', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:15:47', '1', 'admin', '2018-06-26 00:15:47', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4555', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:15:48', '1', 'admin', '2018-06-26 00:15:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4556', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:15:52', '1', 'admin', '2018-06-26 00:15:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4557', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:15:54', '1', 'admin', '2018-06-26 00:15:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4558', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:16:34', '1', 'admin', '2018-06-26 00:16:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4559', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:16:34', '1', 'admin', '2018-06-26 00:16:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4560', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:16:38', '1', 'admin', '2018-06-26 00:16:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4561', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:24:02', '1', 'admin', '2018-06-26 00:24:02', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4562', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:24:03', '1', 'admin', '2018-06-26 00:24:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4563', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 00:24:07', '1', 'admin', '2018-06-26 00:24:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4564', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 00:24:08', '1', 'admin', '2018-06-26 00:24:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4565', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 00:24:15', '1', 'admin', '2018-06-26 00:24:15', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4566', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:24:48', '1', 'admin', '2018-06-26 00:24:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4567', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:24:49', '1', 'admin', '2018-06-26 00:24:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4568', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 00:24:51', '1', 'admin', '2018-06-26 00:24:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4569', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:25:18', '1', 'admin', '2018-06-26 00:25:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4570', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:25:18', '1', 'admin', '2018-06-26 00:25:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4571', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:25:20', '1', 'admin', '2018-06-26 00:25:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4572', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:25:20', '1', 'admin', '2018-06-26 00:25:20', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4573', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:25:51', '1', 'admin', '2018-06-26 00:25:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4574', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:25:51', '1', 'admin', '2018-06-26 00:25:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4575', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:25:53', '1', 'admin', '2018-06-26 00:25:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4576', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:25:54', '1', 'admin', '2018-06-26 00:25:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4577', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:25:59', '1', 'admin', '2018-06-26 00:25:59', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4578', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:26:00', '1', 'admin', '2018-06-26 00:26:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4579', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:26:02', '1', 'admin', '2018-06-26 00:26:02', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4580', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:26:02', '1', 'admin', '2018-06-26 00:26:02', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4581', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:26:05', '1', 'admin', '2018-06-26 00:26:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4582', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:26:45', '1', 'admin', '2018-06-26 00:26:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4583', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:26:45', '1', 'admin', '2018-06-26 00:26:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4584', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:26:50', '1', 'admin', '2018-06-26 00:26:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4585', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:26:50', '1', 'admin', '2018-06-26 00:26:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4586', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:27:16', '1', 'admin', '2018-06-26 00:27:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4587', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:27:16', '1', 'admin', '2018-06-26 00:27:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4588', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:27:23', '1', 'admin', '2018-06-26 00:27:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4589', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:27:23', '1', 'admin', '2018-06-26 00:27:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4590', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:27:26', '1', 'admin', '2018-06-26 00:27:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4591', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:27:26', '1', 'admin', '2018-06-26 00:27:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4592', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:27:52', '1', 'admin', '2018-06-26 00:27:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4593', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:27:53', '1', 'admin', '2018-06-26 00:27:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4594', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:28:40', '1', 'admin', '2018-06-26 00:28:40', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4595', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:28:40', '1', 'admin', '2018-06-26 00:28:40', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4596', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 00:28:55', '1', 'admin', '2018-06-26 00:28:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4597', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:29:19', '1', 'admin', '2018-06-26 00:29:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4598', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:29:22', '1', 'admin', '2018-06-26 00:29:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4599', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:29:22', '1', 'admin', '2018-06-26 00:29:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4600', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:29:24', '1', 'admin', '2018-06-26 00:29:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4601', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:29:24', '1', 'admin', '2018-06-26 00:29:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4602', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:29:24', '1', 'admin', '2018-06-26 00:29:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4603', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:29:24', '1', 'admin', '2018-06-26 00:29:24', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4604', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:29:25', '1', 'admin', '2018-06-26 00:29:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4605', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:29:25', '1', 'admin', '2018-06-26 00:29:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4606', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:29:25', '1', 'admin', '2018-06-26 00:29:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4607', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:29:25', '1', 'admin', '2018-06-26 00:29:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4608', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:30:42', '1', 'admin', '2018-06-26 00:30:42', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4609', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:30:42', '1', 'admin', '2018-06-26 00:30:42', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4610', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:30:43', '1', 'admin', '2018-06-26 00:30:43', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4611', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:30:43', '1', 'admin', '2018-06-26 00:30:43', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4612', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:30:44', '1', 'admin', '2018-06-26 00:30:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4613', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:30:44', '1', 'admin', '2018-06-26 00:30:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4614', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:30:44', '1', 'admin', '2018-06-26 00:30:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4615', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:30:44', '1', 'admin', '2018-06-26 00:30:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4616', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:30:45', '1', 'admin', '2018-06-26 00:30:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4617', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:30:45', '1', 'admin', '2018-06-26 00:30:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4618', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:30:50', '1', 'admin', '2018-06-26 00:30:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4619', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:30:50', '1', 'admin', '2018-06-26 00:30:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4620', null, 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/login', '2018-06-26 00:31:07', '1', 'guest', '2018-06-26 00:31:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4621', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-26 00:31:09', '1', 'guest', '2018-06-26 00:31:09', '登陆');
INSERT INTO `sys_log` VALUES ('4622', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-26 00:31:09', '1', 'admin', '2018-06-26 00:31:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4623', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-26 00:31:10', '1', 'admin', '2018-06-26 00:31:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4624', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-26 00:31:10', '1', 'admin', '2018-06-26 00:31:10', '获取日志列表');
INSERT INTO `sys_log` VALUES ('4625', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/department', '2018-06-26 00:31:12', '1', 'admin', '2018-06-26 00:31:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4626', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:31:12', '1', 'admin', '2018-06-26 00:31:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4627', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:31:16', '1', 'admin', '2018-06-26 00:31:16', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4628', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:31:17', '1', 'admin', '2018-06-26 00:31:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4629', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:32:23', '1', 'admin', '2018-06-26 00:32:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4630', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:32:23', '1', 'admin', '2018-06-26 00:32:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4631', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:32:26', '1', 'admin', '2018-06-26 00:32:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4632', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:32:26', '1', 'admin', '2018-06-26 00:32:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4633', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:33:04', '1', 'admin', '2018-06-26 00:33:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4634', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:33:05', '1', 'admin', '2018-06-26 00:33:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4635', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:33:06', '1', 'admin', '2018-06-26 00:33:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4636', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:33:06', '1', 'admin', '2018-06-26 00:33:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4637', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:33:44', '1', 'admin', '2018-06-26 00:33:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4638', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:33:44', '1', 'admin', '2018-06-26 00:33:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4639', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:33:45', '1', 'admin', '2018-06-26 00:33:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4640', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:33:46', '1', 'admin', '2018-06-26 00:33:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4641', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:33:46', '1', 'admin', '2018-06-26 00:33:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4642', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:33:46', '1', 'admin', '2018-06-26 00:33:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4643', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:34:00', '1', 'admin', '2018-06-26 00:34:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4644', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:34:00', '1', 'admin', '2018-06-26 00:34:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4645', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:34:02', '1', 'admin', '2018-06-26 00:34:02', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4646', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:34:02', '1', 'admin', '2018-06-26 00:34:02', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4647', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:34:10', '1', 'admin', '2018-06-26 00:34:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4648', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:34:11', '1', 'admin', '2018-06-26 00:34:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4649', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:34:18', '1', 'admin', '2018-06-26 00:34:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4650', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:34:19', '1', 'admin', '2018-06-26 00:34:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4651', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:34:33', '1', 'admin', '2018-06-26 00:34:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4652', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:34:33', '1', 'admin', '2018-06-26 00:34:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4653', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:34:41', '1', 'admin', '2018-06-26 00:34:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4654', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:34:41', '1', 'admin', '2018-06-26 00:34:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4655', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:35:03', '1', 'admin', '2018-06-26 00:35:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4656', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:35:04', '1', 'admin', '2018-06-26 00:35:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4657', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:35:05', '1', 'admin', '2018-06-26 00:35:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4658', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:35:05', '1', 'admin', '2018-06-26 00:35:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4659', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:35:06', '1', 'admin', '2018-06-26 00:35:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4660', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:35:06', '1', 'admin', '2018-06-26 00:35:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4661', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:35:15', '1', 'admin', '2018-06-26 00:35:15', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4662', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:35:15', '1', 'admin', '2018-06-26 00:35:15', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4663', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:36:44', '1', 'admin', '2018-06-26 00:36:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4664', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:36:46', '1', 'admin', '2018-06-26 00:36:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4665', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:36:47', '1', 'admin', '2018-06-26 00:36:47', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4666', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:36:48', '1', 'admin', '2018-06-26 00:36:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4667', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:36:48', '1', 'admin', '2018-06-26 00:36:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4668', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:38:10', '1', 'admin', '2018-06-26 00:38:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4669', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:38:10', '1', 'admin', '2018-06-26 00:38:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4670', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:38:11', '1', 'admin', '2018-06-26 00:38:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4671', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:38:11', '1', 'admin', '2018-06-26 00:38:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4672', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:38:12', '1', 'admin', '2018-06-26 00:38:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4673', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:38:13', '1', 'admin', '2018-06-26 00:38:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4674', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:38:13', '1', 'admin', '2018-06-26 00:38:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4675', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:38:13', '1', 'admin', '2018-06-26 00:38:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4676', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:38:26', '1', 'admin', '2018-06-26 00:38:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4677', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:38:26', '1', 'admin', '2018-06-26 00:38:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4678', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:39:11', '1', 'admin', '2018-06-26 00:39:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4679', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:39:11', '1', 'admin', '2018-06-26 00:39:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4680', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:40:08', '1', 'admin', '2018-06-26 00:40:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4681', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:40:09', '1', 'admin', '2018-06-26 00:40:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4682', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:40:11', '1', 'admin', '2018-06-26 00:40:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4683', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:40:11', '1', 'admin', '2018-06-26 00:40:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4684', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:40:13', '1', 'admin', '2018-06-26 00:40:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4685', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:40:13', '1', 'admin', '2018-06-26 00:40:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4686', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:40:38', '1', 'admin', '2018-06-26 00:40:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4687', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:40:38', '1', 'admin', '2018-06-26 00:40:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4688', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:41:33', '1', 'admin', '2018-06-26 00:41:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4689', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:41:33', '1', 'admin', '2018-06-26 00:41:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4690', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:42:04', '1', 'admin', '2018-06-26 00:42:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4691', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:42:05', '1', 'admin', '2018-06-26 00:42:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4692', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:43:09', '1', 'admin', '2018-06-26 00:43:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4693', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:43:10', '1', 'admin', '2018-06-26 00:43:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4694', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:43:34', '1', 'admin', '2018-06-26 00:43:34', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4695', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:44:17', '1', 'admin', '2018-06-26 00:44:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4696', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:44:17', '1', 'admin', '2018-06-26 00:44:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4697', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:44:51', '1', 'admin', '2018-06-26 00:44:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4698', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:44:51', '1', 'admin', '2018-06-26 00:44:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4699', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:44:52', '1', 'admin', '2018-06-26 00:44:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4700', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:44:53', '1', 'admin', '2018-06-26 00:44:53', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4701', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:44:56', '1', 'admin', '2018-06-26 00:44:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4702', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:44:57', '1', 'admin', '2018-06-26 00:44:57', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4703', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:44:59', '1', 'admin', '2018-06-26 00:44:59', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4704', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:44:59', '1', 'admin', '2018-06-26 00:44:59', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4705', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:45:04', '1', 'admin', '2018-06-26 00:45:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4706', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:45:04', '1', 'admin', '2018-06-26 00:45:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4707', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:45:05', '1', 'admin', '2018-06-26 00:45:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4708', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:45:07', '1', 'admin', '2018-06-26 00:45:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4709', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:45:09', '1', 'admin', '2018-06-26 00:45:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4710', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:45:11', '1', 'admin', '2018-06-26 00:45:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4711', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:45:11', '1', 'admin', '2018-06-26 00:45:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4712', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:45:12', '1', 'admin', '2018-06-26 00:45:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4713', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:45:14', '1', 'admin', '2018-06-26 00:45:14', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4714', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:45:18', '1', 'admin', '2018-06-26 00:45:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4715', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:45:18', '1', 'admin', '2018-06-26 00:45:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4716', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:45:21', '1', 'admin', '2018-06-26 00:45:21', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4717', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 00:45:38', '1', 'admin', '2018-06-26 00:45:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4718', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 00:45:38', '1', 'admin', '2018-06-26 00:45:38', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4719', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:45:39', '1', 'admin', '2018-06-26 00:45:39', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4720', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:45:41', '1', 'admin', '2018-06-26 00:45:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4721', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:45:45', '1', 'admin', '2018-06-26 00:45:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4722', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:45:46', '1', 'admin', '2018-06-26 00:45:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4723', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:45:49', '1', 'admin', '2018-06-26 00:45:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4724', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:45:49', '1', 'admin', '2018-06-26 00:45:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4725', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 00:45:51', '1', 'admin', '2018-06-26 00:45:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4726', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:04:06', '1', 'admin', '2018-06-26 01:04:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4727', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:04:07', '1', 'admin', '2018-06-26 01:04:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4728', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:04:08', '1', 'admin', '2018-06-26 01:04:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4729', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:04:08', '1', 'admin', '2018-06-26 01:04:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4730', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:04:09', '1', 'admin', '2018-06-26 01:04:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4731', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 01:05:57', '1', 'admin', '2018-06-26 01:05:57', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4732', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 01:06:00', '1', 'admin', '2018-06-26 01:06:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4733', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:06:02', '1', 'admin', '2018-06-26 01:06:02', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4734', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:06:04', '1', 'admin', '2018-06-26 01:06:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4735', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:06:05', '1', 'admin', '2018-06-26 01:06:05', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4736', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:06:06', '1', 'admin', '2018-06-26 01:06:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4737', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:06:06', '1', 'admin', '2018-06-26 01:06:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4738', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:06:07', '1', 'admin', '2018-06-26 01:06:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4739', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:06:08', '1', 'admin', '2018-06-26 01:06:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4740', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:06:08', '1', 'admin', '2018-06-26 01:06:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4741', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:06:09', '1', 'admin', '2018-06-26 01:06:09', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4742', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:06:10', '1', 'admin', '2018-06-26 01:06:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4743', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:06:10', '1', 'admin', '2018-06-26 01:06:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4744', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:06:11', '1', 'admin', '2018-06-26 01:06:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4745', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:06:12', '1', 'admin', '2018-06-26 01:06:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4746', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:06:12', '1', 'admin', '2018-06-26 01:06:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4747', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:06:40', '1', 'admin', '2018-06-26 01:06:40', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4748', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:06:45', '1', 'admin', '2018-06-26 01:06:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4749', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:06:46', '1', 'admin', '2018-06-26 01:06:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4750', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:06:47', '1', 'admin', '2018-06-26 01:06:47', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4751', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:06:48', '1', 'admin', '2018-06-26 01:06:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4752', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:06:49', '1', 'admin', '2018-06-26 01:06:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4753', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:06:49', '1', 'admin', '2018-06-26 01:06:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4754', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:06:52', '1', 'admin', '2018-06-26 01:06:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4755', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:06:54', '1', 'admin', '2018-06-26 01:06:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4756', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:06:54', '1', 'admin', '2018-06-26 01:06:54', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4757', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:06:55', '1', 'admin', '2018-06-26 01:06:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4758', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:06:55', '1', 'admin', '2018-06-26 01:06:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4759', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:06:56', '1', 'admin', '2018-06-26 01:06:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4760', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:06:57', '1', 'admin', '2018-06-26 01:06:57', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4761', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:06:59', '1', 'admin', '2018-06-26 01:06:59', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4762', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:07:00', '1', 'admin', '2018-06-26 01:07:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4763', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:07:00', '1', 'admin', '2018-06-26 01:07:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4764', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:07:00', '1', 'admin', '2018-06-26 01:07:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4765', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:07:01', '1', 'admin', '2018-06-26 01:07:01', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4766', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:07:01', '1', 'admin', '2018-06-26 01:07:01', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4767', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:07:03', '1', 'admin', '2018-06-26 01:07:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4768', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:07:03', '1', 'admin', '2018-06-26 01:07:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4769', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:07:06', '1', 'admin', '2018-06-26 01:07:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4770', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:07:07', '1', 'admin', '2018-06-26 01:07:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4771', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:07:08', '1', 'admin', '2018-06-26 01:07:08', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4772', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:07:12', '1', 'admin', '2018-06-26 01:07:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4773', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:07:12', '1', 'admin', '2018-06-26 01:07:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4774', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:07:33', '1', 'admin', '2018-06-26 01:07:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4775', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:07:33', '1', 'admin', '2018-06-26 01:07:33', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4776', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 01:07:41', '1', 'admin', '2018-06-26 01:07:41', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4777', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 01:07:42', '1', 'admin', '2018-06-26 01:07:42', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4778', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:07:43', '1', 'admin', '2018-06-26 01:07:43', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4779', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:07:44', '1', 'admin', '2018-06-26 01:07:44', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4780', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:07:49', '1', 'admin', '2018-06-26 01:07:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4781', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:07:50', '1', 'admin', '2018-06-26 01:07:50', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4782', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:07:51', '1', 'admin', '2018-06-26 01:07:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4783', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:07:52', '1', 'admin', '2018-06-26 01:07:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4784', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:07:52', '1', 'admin', '2018-06-26 01:07:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4785', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:07:55', '1', 'admin', '2018-06-26 01:07:55', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4786', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:07:58', '1', 'admin', '2018-06-26 01:07:58', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4787', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:08:00', '1', 'admin', '2018-06-26 01:08:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4788', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:08:02', '1', 'admin', '2018-06-26 01:08:02', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4789', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:08:03', '1', 'admin', '2018-06-26 01:08:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4790', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:08:06', '1', 'admin', '2018-06-26 01:08:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4791', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:11:11', '1', 'admin', '2018-06-26 01:11:11', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4792', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:11:19', '1', 'admin', '2018-06-26 01:11:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4793', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:11:25', '1', 'admin', '2018-06-26 01:11:25', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4794', '1', 'Chrome', 'GET', null, '127.0.0.1', '/system/department', '2018-06-26 01:13:49', '1', 'admin', '2018-06-26 01:13:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4795', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 01:13:49', '1', 'admin', '2018-06-26 01:13:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4796', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:13:51', '1', 'admin', '2018-06-26 01:13:51', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4797', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:13:52', '1', 'admin', '2018-06-26 01:13:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4798', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:13:52', '1', 'admin', '2018-06-26 01:13:52', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4799', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:13:56', '1', 'admin', '2018-06-26 01:13:56', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4800', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:13:57', '1', 'admin', '2018-06-26 01:13:57', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4801', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:14:00', '1', 'admin', '2018-06-26 01:14:00', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4802', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:14:01', '1', 'admin', '2018-06-26 01:14:01', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4803', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:14:03', '1', 'admin', '2018-06-26 01:14:03', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4804', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:14:04', '1', 'admin', '2018-06-26 01:14:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4805', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:14:04', '1', 'admin', '2018-06-26 01:14:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4806', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:14:10', '1', 'admin', '2018-06-26 01:14:10', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4807', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:14:12', '1', 'admin', '2018-06-26 01:14:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4808', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:14:13', '1', 'admin', '2018-06-26 01:14:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4809', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/searchDepart', '2018-06-26 01:14:13', '1', 'admin', '2018-06-26 01:14:13', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4810', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:14:45', '1', 'admin', '2018-06-26 01:14:45', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4811', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:14:46', '1', 'admin', '2018-06-26 01:14:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4812', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:14:46', '1', 'admin', '2018-06-26 01:14:46', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4813', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:14:47', '1', 'admin', '2018-06-26 01:14:47', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4814', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:14:48', '1', 'admin', '2018-06-26 01:14:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4815', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:14:48', '1', 'admin', '2018-06-26 01:14:48', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4816', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 01:14:49', '1', 'admin', '2018-06-26 01:14:49', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4817', null, 'Chrome', 'GET', null, '127.0.0.1', '/login', '2018-06-26 14:21:04', '1', 'guest', '2018-06-26 14:21:04', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4818', null, 'Chrome', 'POST', 'http://127.0.0.1/login', '127.0.0.1', '/postLogin', '2018-06-26 14:21:06', '1', 'guest', '2018-06-26 14:21:06', '登陆');
INSERT INTO `sys_log` VALUES ('4819', '1', 'Chrome', 'GET', 'http://127.0.0.1/login', '127.0.0.1', '/', '2018-06-26 14:21:06', '1', 'admin', '2018-06-26 14:21:06', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4820', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/log', '2018-06-26 14:21:07', '1', 'admin', '2018-06-26 14:21:07', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4821', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/log', '127.0.0.1', '/system/log/getLogList', '2018-06-26 14:21:07', '1', 'admin', '2018-06-26 14:21:07', '获取日志列表');
INSERT INTO `sys_log` VALUES ('4822', '1', 'Chrome', 'GET', 'http://127.0.0.1/', '127.0.0.1', '/system/department', '2018-06-26 14:21:12', '1', 'admin', '2018-06-26 14:21:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4823', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentTree', '2018-06-26 14:21:12', '1', 'admin', '2018-06-26 14:21:12', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4824', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 14:21:15', '1', 'admin', '2018-06-26 14:21:15', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4825', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 14:21:17', '1', 'admin', '2018-06-26 14:21:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4826', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 14:21:17', '1', 'admin', '2018-06-26 14:21:17', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4827', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 14:21:18', '1', 'admin', '2018-06-26 14:21:18', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4828', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 14:21:19', '1', 'admin', '2018-06-26 14:21:19', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4829', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 14:21:21', '1', 'admin', '2018-06-26 14:21:21', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4830', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 14:21:21', '1', 'admin', '2018-06-26 14:21:21', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4831', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 14:21:22', '1', 'admin', '2018-06-26 14:21:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4832', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 14:21:22', '1', 'admin', '2018-06-26 14:21:22', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4833', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 14:21:23', '1', 'admin', '2018-06-26 14:21:23', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4834', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 14:21:26', '1', 'admin', '2018-06-26 14:21:26', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4835', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 14:21:27', '1', 'admin', '2018-06-26 14:21:27', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4836', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 14:21:28', '1', 'admin', '2018-06-26 14:21:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4837', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 14:21:28', '1', 'admin', '2018-06-26 14:21:28', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4838', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 14:21:29', '1', 'admin', '2018-06-26 14:21:29', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4839', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 14:21:30', '1', 'admin', '2018-06-26 14:21:30', '方法没有描述');
INSERT INTO `sys_log` VALUES ('4842', '1', 'Chrome', 'GET', 'http://127.0.0.1/system/department', '127.0.0.1', '/system/department/getDepartmentDetail', '2018-06-26 14:21:31', '1', 'admin', '2018-06-26 14:21:31', '方法没有描述');

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
  `avatar` varchar(255) DEFAULT '/images/guest.jpg' COMMENT '用户头像',
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', null, 'admin', '8b276c6430bc6cfec325a09dc6713167', '66432cd44c4abf25202aca49a5e14436', '1', '/images/admin.jpg', null, null, null, null, null, '3', null, '0', null, '0', null, null, null, 'admin', null, null);
INSERT INTO `sys_user` VALUES ('2', '陈明', 'admin1', '2ead11f051473e9c49abf3c12fdc6f79', '33860b96043a3e6d82fe9164c68df2cd', '1', '/images/guest.jpg', 'zikoou@foxmail.com', null, '13616063749', null, null, null, null, '0', '', '1', null, null, null, null, null, '0');
INSERT INTO `sys_user` VALUES ('3', '2222', 'admin2', '856c69885351c4d1f0f005aacc785b00', 'f598f180a1646fa8bbb2347f905ed3fa', '1', '/images/guest.jpg', 'hotloveyc@qq.com', null, '13616063749', null, null, null, null, '0', '2222', '0', '2018-06-07', null, null, null, null, '0');

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
