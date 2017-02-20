/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.111
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : ccsys

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2016-12-06 18:16:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for login_failed
-- ----------------------------
DROP TABLE IF EXISTS `login_failed`;
CREATE TABLE `login_failed` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contact_id` int(10) unsigned NOT NULL,
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `contact_id` (`contact_id`),
  KEY `ctime` (`ctime`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login_failed
-- ----------------------------
INSERT INTO `login_failed` VALUES ('1', '2', '2016-12-06 20:46:07');

-- ----------------------------
-- Table structure for tbl_advice
-- ----------------------------
DROP TABLE IF EXISTS `tbl_advice`;
CREATE TABLE `tbl_advice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ctime` int(11) DEFAULT '0',
  `dtime` int(11) DEFAULT '0',
  `content` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `result` text,
  `score` tinyint(4) DEFAULT NULL,
  `contact_name` varchar(128) DEFAULT NULL,
  `contact_number` varchar(128) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content_type` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_advice
-- ----------------------------
INSERT INTO `tbl_advice` VALUES ('1', '2', '2', '1481028636', '0', 'fddfsfddf', '3', null, null, '肖然', '18672139873', '1', null, null);

-- ----------------------------
-- Table structure for tbl_agent
-- ----------------------------
DROP TABLE IF EXISTS `tbl_agent`;
CREATE TABLE `tbl_agent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `job_number` varchar(8) NOT NULL,
  `password` varchar(144) NOT NULL,
  `full_name` varchar(90) NOT NULL,
  `class` tinyint(4) unsigned NOT NULL,
  `group1_id` int(10) unsigned NOT NULL,
  `group2_id` int(10) unsigned NOT NULL,
  `select_type` tinyint(4) unsigned NOT NULL,
  `sip_id` int(11) DEFAULT NULL,
  `fixed_telephone` varchar(30) DEFAULT NULL,
  `mobile_number` varchar(30) DEFAULT NULL,
  `voice_record` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `salt` char(16) NOT NULL,
  `status` tinyint(4) DEFAULT '0',
  `call_cid` varchar(30) DEFAULT NULL,
  `tt_number` varchar(30) DEFAULT NULL,
  `finish_time` int(10) unsigned NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `job_number` (`job_number`),
  KEY `class` (`class`),
  KEY `group1` (`group1_id`),
  KEY `group2` (`group2_id`),
  KEY `full_name` (`full_name`),
  KEY `sip_id` (`sip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_agent
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_alarmlog
-- ----------------------------
DROP TABLE IF EXISTS `tbl_alarmlog`;
CREATE TABLE `tbl_alarmlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctime` int(10) unsigned NOT NULL,
  `warning` varchar(24) NOT NULL,
  `cause` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `object` int(11) DEFAULT NULL,
  `content` text,
  `cycle` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ctime` (`ctime`),
  KEY `cause` (`cause`),
  KEY `type` (`type`),
  KEY `cycle` (`cycle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_alarmlog
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_audio
-- ----------------------------
DROP TABLE IF EXISTS `tbl_audio`;
CREATE TABLE `tbl_audio` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `file_name` varchar(240) NOT NULL,
  `file_size` int(10) unsigned NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  `verify_status` tinyint(4) unsigned NOT NULL,
  `reject_reason` tinytext,
  `note` tinytext,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `file_name` (`file_name`),
  KEY `ctime` (`ctime`),
  KEY `verify_status` (`verify_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_audio
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_billing_package
-- ----------------------------
DROP TABLE IF EXISTS `tbl_billing_package`;
CREATE TABLE `tbl_billing_package` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `name` varchar(90) DEFAULT NULL,
  `note` varchar(90) DEFAULT NULL,
  `ctime` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_billing_package
-- ----------------------------
INSERT INTO `tbl_billing_package` VALUES ('1', '1', 'stone', '。。。', '1481028207');

-- ----------------------------
-- Table structure for tbl_billing_rate
-- ----------------------------
DROP TABLE IF EXISTS `tbl_billing_rate`;
CREATE TABLE `tbl_billing_rate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `billing_package_id` int(10) unsigned NOT NULL,
  `billing_rule_id` int(10) unsigned NOT NULL,
  `billing_rate` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `billing_package_id` (`billing_package_id`),
  KEY `billing_rule_id` (`billing_rule_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_billing_rate
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_billing_rule
-- ----------------------------
DROP TABLE IF EXISTS `tbl_billing_rule`;
CREATE TABLE `tbl_billing_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(90) NOT NULL,
  `billing_package_id` int(10) unsigned NOT NULL,
  `src_attr_type1` int(10) unsigned NOT NULL,
  `src_attr_type2` int(10) unsigned NOT NULL,
  `dst_attr_type1` int(10) unsigned NOT NULL,
  `dst_attr_type2` int(10) unsigned NOT NULL,
  `src_attr_value1` int(10) unsigned NOT NULL,
  `src_attr_value2` int(10) unsigned NOT NULL,
  `dst_attr_value1` int(10) unsigned NOT NULL,
  `dst_attr_value2` int(10) unsigned NOT NULL,
  `serv_type` tinyint(4) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `billing_type` tinyint(4) unsigned NOT NULL,
  `first_billing_unit` int(10) unsigned NOT NULL,
  `next_billing_unit` int(10) unsigned NOT NULL,
  `first_billing_cnt` int(10) unsigned NOT NULL,
  `next_billing_cnt` int(10) unsigned NOT NULL,
  `effect_time` int(10) unsigned NOT NULL DEFAULT '0',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0',
  `expiry_type` tinyint(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `serv_type` (`serv_type`),
  KEY `billing_type` (`billing_type`),
  KEY `billing_package_id` (`billing_package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_billing_rule
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_blacklist_file
-- ----------------------------
DROP TABLE IF EXISTS `tbl_blacklist_file`;
CREATE TABLE `tbl_blacklist_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `type` tinyint(4) unsigned NOT NULL,
  `file_name` varchar(240) NOT NULL,
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  `note` tinytext,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `ctime` (`ctime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_blacklist_file
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_blacklist_pool
-- ----------------------------
DROP TABLE IF EXISTS `tbl_blacklist_pool`;
CREATE TABLE `tbl_blacklist_pool` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `file_id` int(10) unsigned NOT NULL,
  `type` tinyint(4) unsigned NOT NULL,
  `number` varchar(90) DEFAULT NULL,
  `mtime` int(10) unsigned NOT NULL,
  `status` tinyint(4) unsigned NOT NULL,
  `note` tinytext,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `number` (`number`),
  KEY `mtine` (`mtime`),
  KEY `status` (`status`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
/*!50100 PARTITION BY HASH (id)
PARTITIONS 10 */;

-- ----------------------------
-- Records of tbl_blacklist_pool
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_callee_file
-- ----------------------------
DROP TABLE IF EXISTS `tbl_callee_file`;
CREATE TABLE `tbl_callee_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `type` tinyint(4) unsigned NOT NULL,
  `file_name` varchar(240) NOT NULL,
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  `note` tinytext,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `ctime` (`ctime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_callee_file
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_callee_pool
-- ----------------------------
DROP TABLE IF EXISTS `tbl_callee_pool`;
CREATE TABLE `tbl_callee_pool` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `file_id` int(10) unsigned NOT NULL,
  `type` tinyint(4) unsigned NOT NULL,
  `number` varchar(90) NOT NULL,
  `mtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `number` (`number`),
  KEY `mtime` (`mtime`),
  KEY `status` (`status`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
/*!50100 PARTITION BY HASH (id)
PARTITIONS 20 */;

-- ----------------------------
-- Records of tbl_callee_pool
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_caller
-- ----------------------------
DROP TABLE IF EXISTS `tbl_caller`;
CREATE TABLE `tbl_caller` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `cid` varchar(90) NOT NULL,
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  `verify_status` tinyint(3) unsigned NOT NULL,
  `reject_reason` tinytext,
  `note` tinytext,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `cid` (`cid`),
  KEY `ctime` (`ctime`),
  KEY `verify_status` (`verify_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_caller
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_caller_assign
-- ----------------------------
DROP TABLE IF EXISTS `tbl_caller_assign`;
CREATE TABLE `tbl_caller_assign` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `caller_id` int(10) unsigned NOT NULL,
  `caller_type` tinyint(4) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `caller_grp_id` int(10) unsigned NOT NULL,
  `note` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_caller_assign
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_caller_grp
-- ----------------------------
DROP TABLE IF EXISTS `tbl_caller_grp`;
CREATE TABLE `tbl_caller_grp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `name` varchar(60) NOT NULL,
  `policy` tinyint(4) unsigned NOT NULL,
  `is_default` tinyint(4) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_caller_grp
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_caller_limitation
-- ----------------------------
DROP TABLE IF EXISTS `tbl_caller_limitation`;
CREATE TABLE `tbl_caller_limitation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(90) NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `times` int(10) unsigned DEFAULT NULL,
  `handle` int(10) unsigned NOT NULL,
  `ctime` int(10) unsigned DEFAULT '0',
  `note` tinytext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_caller_limitation
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_caller_limitation_assign
-- ----------------------------
DROP TABLE IF EXISTS `tbl_caller_limitation_assign`;
CREATE TABLE `tbl_caller_limitation_assign` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `limitation_id` int(10) unsigned NOT NULL,
  `btype` int(10) unsigned NOT NULL,
  `bid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_caller_limitation_assign
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_caller_setting
-- ----------------------------
DROP TABLE IF EXISTS `tbl_caller_setting`;
CREATE TABLE `tbl_caller_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `name` varchar(90) NOT NULL,
  `src_id` int(10) unsigned NOT NULL,
  `src_type` tinyint(4) unsigned NOT NULL,
  `dest_id` int(10) unsigned NOT NULL,
  `dest_type` tinyint(4) unsigned NOT NULL,
  `ctime` int(10) unsigned DEFAULT '0',
  `note` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_caller_setting
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_calltask
-- ----------------------------
DROP TABLE IF EXISTS `tbl_calltask`;
CREATE TABLE `tbl_calltask` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `task_name` varchar(90) NOT NULL,
  `mode` tinyint(4) unsigned NOT NULL,
  `playcnt` tinyint(4) unsigned NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `audio_id` int(10) unsigned NOT NULL,
  `callers` text NOT NULL,
  `callee_id` int(10) unsigned NOT NULL,
  `blacklist_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `calleecnt` int(10) unsigned NOT NULL,
  `calledcnt` int(10) unsigned NOT NULL,
  `call_rate` tinyint(4) unsigned DEFAULT NULL,
  `status` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `ctime` int(10) unsigned NOT NULL,
  `mtime` int(10) unsigned NOT NULL DEFAULT '0',
  `note` tinytext,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `ctime` (`ctime`),
  KEY `audio_id` (`audio_id`),
  KEY `callee_id` (`callee_id`),
  KEY `blacklist_id` (`blacklist_id`),
  KEY `group_id` (`group_id`),
  KEY `task_name` (`task_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_calltask
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_calltask_result
-- ----------------------------
DROP TABLE IF EXISTS `tbl_calltask_result`;
CREATE TABLE `tbl_calltask_result` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `task_id` int(10) unsigned DEFAULT NULL,
  `caller` varchar(45) DEFAULT NULL,
  `callee` varchar(45) DEFAULT NULL,
  `agent_num` varchar(16) DEFAULT NULL,
  `agent_id` int(10) unsigned DEFAULT NULL,
  `pdd_len` int(10) unsigned DEFAULT NULL,
  `ring_times` int(10) unsigned DEFAULT NULL,
  `answer_time` int(10) unsigned DEFAULT NULL,
  `ivr_end_time` int(10) unsigned DEFAULT NULL,
  `dtmf_time` int(10) unsigned DEFAULT NULL,
  `wait_agent_times` int(10) unsigned DEFAULT NULL,
  `time_len` int(10) unsigned DEFAULT NULL,
  `hold_cnt` int(10) unsigned DEFAULT NULL,
  `hold_times` int(10) unsigned DEFAULT NULL,
  `terminate_cause` int(10) unsigned DEFAULT NULL,
  `release_part` int(10) unsigned DEFAULT NULL,
  `result` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_calltask_result
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_cdr
-- ----------------------------
DROP TABLE IF EXISTS `tbl_cdr`;
CREATE TABLE `tbl_cdr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `account_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `task_id` int(10) unsigned DEFAULT NULL,
  `type1` tinyint(4) unsigned DEFAULT NULL,
  `type2` tinyint(4) unsigned DEFAULT NULL,
  `type3` tinyint(4) unsigned DEFAULT NULL,
  `record_file` varchar(120) DEFAULT NULL,
  `caller` varchar(45) DEFAULT NULL,
  `callee` varchar(45) DEFAULT NULL,
  `CID` varchar(45) DEFAULT NULL,
  `agent_num` char(10) DEFAULT NULL,
  `start_time` int(10) unsigned DEFAULT '0',
  `ring_time` int(10) unsigned DEFAULT '0',
  `answer_time` int(10) unsigned DEFAULT '0',
  `ivr_end_time` int(10) unsigned DEFAULT '0',
  `dtmf_time` int(10) unsigned DEFAULT '0',
  `hold_cnt` int(10) unsigned DEFAULT NULL,
  `hold_times` int(10) unsigned DEFAULT NULL,
  `peer_trunk_id` int(10) unsigned DEFAULT NULL,
  `terminate_cause` int(10) unsigned DEFAULT NULL,
  `release_part` tinyint(4) unsigned DEFAULT NULL,
  `payload_type` tinyint(4) unsigned DEFAULT NULL,
  `package_loss_rate` tinyint(4) unsigned DEFAULT NULL,
  `cdr_mark` int(10) unsigned DEFAULT NULL,
  `sessionID` varchar(45) DEFAULT NULL,
  `bridge_time` int(10) unsigned DEFAULT '0',
  `bye_time` int(10) unsigned DEFAULT '0',
  `peer_ip1` int(10) unsigned DEFAULT NULL,
  `peer_ip2` int(10) unsigned DEFAULT NULL,
  `peer_ip3` int(10) unsigned DEFAULT NULL,
  `peer_ip4` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `account_id` (`account_id`),
  KEY `user_id` (`user_id`),
  KEY `task_id` (`task_id`),
  KEY `start_time` (`start_time`),
  KEY `peer_trunk_id` (`peer_trunk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
/*!50100 PARTITION BY HASH (id)
PARTITIONS 20 */;

-- ----------------------------
-- Records of tbl_cdr
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_cdr_account
-- ----------------------------
DROP TABLE IF EXISTS `tbl_cdr_account`;
CREATE TABLE `tbl_cdr_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `account_id` int(10) unsigned NOT NULL,
  `ctime` int(10) unsigned NOT NULL,
  `type` tinyint(4) unsigned NOT NULL,
  `money` bigint(20) NOT NULL,
  `balance` bigint(20) NOT NULL,
  `peer_account_id` int(10) unsigned NOT NULL,
  `operator_id` int(10) unsigned NOT NULL,
  `note` tinytext,
  `account_mark` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `account_id` (`account_id`),
  KEY `ctime` (`ctime`),
  KEY `type` (`type`),
  KEY `peer_account_id` (`peer_account_id`),
  KEY `operator_id` (`operator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
/*!50100 PARTITION BY HASH (id)
PARTITIONS 10 */;

-- ----------------------------
-- Records of tbl_cdr_account
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_cdr_ms
-- ----------------------------
DROP TABLE IF EXISTS `tbl_cdr_ms`;
CREATE TABLE `tbl_cdr_ms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `account_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `sms_id` int(10) unsigned DEFAULT NULL,
  `billing_rule_id` int(10) unsigned DEFAULT NULL,
  `type` tinyint(4) unsigned DEFAULT NULL,
  `fee_l1` int(10) unsigned DEFAULT NULL,
  `fee_l2` int(10) unsigned DEFAULT NULL,
  `fee_l3` int(10) unsigned DEFAULT NULL,
  `fee_l4` int(10) unsigned DEFAULT NULL,
  `fee_l5` int(10) unsigned DEFAULT NULL,
  `caller` varchar(30) DEFAULT NULL,
  `callee` varchar(30) DEFAULT NULL,
  `agent_num` char(10) DEFAULT NULL,
  `deal_time` int(10) unsigned DEFAULT '0',
  `arrived_time` int(10) unsigned DEFAULT '0',
  `msg_len` int(10) unsigned DEFAULT NULL,
  `peer_trunk_id` int(10) unsigned DEFAULT NULL,
  `terminate_cause` int(10) unsigned DEFAULT NULL,
  `agent_level` tinyint(4) unsigned DEFAULT NULL,
  `cdr_mark` int(10) unsigned DEFAULT NULL,
  `account_mark` int(10) unsigned DEFAULT '0',
  `cdr_type` tinyint(4) unsigned DEFAULT NULL,
  `peer_ip1` int(10) unsigned DEFAULT NULL,
  `peer_ip2` int(10) unsigned DEFAULT NULL,
  `peer_ip3` int(10) unsigned DEFAULT NULL,
  `peer_ip4` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `account_id` (`account_id`),
  KEY `user_id` (`user_id`),
  KEY `sms_id` (`sms_id`),
  KEY `bulling_rule_id` (`billing_rule_id`),
  KEY `peer_trunk_id` (`peer_trunk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
/*!50100 PARTITION BY HASH (id)
PARTITIONS 10 */;

-- ----------------------------
-- Records of tbl_cdr_ms
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_cdr_record
-- ----------------------------
DROP TABLE IF EXISTS `tbl_cdr_record`;
CREATE TABLE `tbl_cdr_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `account_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `task_id` int(10) unsigned DEFAULT NULL,
  `billing_rule_id` int(10) unsigned DEFAULT NULL,
  `fee_l1` int(10) unsigned DEFAULT NULL,
  `fee_l2` int(10) unsigned DEFAULT NULL,
  `fee_l3` int(10) unsigned DEFAULT NULL,
  `fee_l4` int(10) unsigned DEFAULT NULL,
  `fee_l5` int(10) unsigned DEFAULT NULL,
  `record_file` varchar(240) DEFAULT NULL,
  `caller` varchar(30) DEFAULT NULL,
  `callee` varchar(30) DEFAULT NULL,
  `CID` varchar(30) DEFAULT NULL,
  `agent_num` char(10) DEFAULT NULL,
  `call_start_time` int(10) unsigned DEFAULT NULL,
  `start_time` int(10) unsigned DEFAULT NULL,
  `time_len` int(10) unsigned DEFAULT NULL,
  `agent_level` int(10) unsigned DEFAULT NULL,
  `cdr_mark` int(10) unsigned DEFAULT NULL,
  `account_mark` int(10) unsigned DEFAULT '0',
  `cdr_type` tinyint(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `account_id` (`account_id`),
  KEY `user_id` (`user_id`),
  KEY `task_id` (`task_id`),
  KEY `billing_rule_id` (`billing_rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
/*!50100 PARTITION BY HASH (id)
PARTITIONS 10 */;

-- ----------------------------
-- Records of tbl_cdr_record
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_cdr_rent
-- ----------------------------
DROP TABLE IF EXISTS `tbl_cdr_rent`;
CREATE TABLE `tbl_cdr_rent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `account_id` int(10) unsigned DEFAULT NULL,
  `billing_rule_id` int(10) unsigned DEFAULT NULL,
  `ctime` int(10) unsigned DEFAULT NULL,
  `type` tinyint(4) unsigned DEFAULT NULL,
  `fee_l1` int(10) unsigned DEFAULT NULL,
  `fee_l2` int(10) unsigned DEFAULT NULL,
  `fee_l3` int(10) unsigned DEFAULT NULL,
  `fee_l4` int(10) unsigned DEFAULT NULL,
  `fee_l5` int(10) unsigned DEFAULT NULL,
  `agent_level` int(10) unsigned DEFAULT NULL,
  `cdr_mark` int(10) unsigned DEFAULT NULL,
  `cdr_type` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `account_id` (`account_id`),
  KEY `billing_rule_id` (`billing_rule_id`),
  KEY `ctime` (`ctime`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
/*!50100 PARTITION BY HASH (id)
PARTITIONS 10 */;

-- ----------------------------
-- Records of tbl_cdr_rent
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_cdr_settle
-- ----------------------------
DROP TABLE IF EXISTS `tbl_cdr_settle`;
CREATE TABLE `tbl_cdr_settle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sp_customer_id` int(10) unsigned DEFAULT NULL,
  `billing_rule_id` int(10) unsigned DEFAULT NULL,
  `ctime` int(10) unsigned DEFAULT NULL,
  `type` tinyint(4) unsigned DEFAULT NULL,
  `fee` int(10) unsigned DEFAULT NULL,
  `caller` varchar(30) DEFAULT NULL,
  `callee` varchar(30) DEFAULT NULL,
  `deal_times` int(10) unsigned DEFAULT NULL,
  `peer_trunk_id` int(10) unsigned DEFAULT NULL,
  `terminate_cause` int(10) unsigned DEFAULT NULL,
  `cdr_mark` int(10) unsigned DEFAULT NULL,
  `cdr_type` tinyint(4) unsigned DEFAULT NULL,
  `peer_ip1` int(10) unsigned DEFAULT NULL,
  `peer_ip2` int(10) unsigned DEFAULT NULL,
  `peer_ip3` int(10) unsigned DEFAULT NULL,
  `peer_ip4` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sp_customer_id` (`sp_customer_id`),
  KEY `billing_rule_id` (`billing_rule_id`),
  KEY `ctime` (`ctime`),
  KEY `type` (`type`),
  KEY `peer_trunk_id` (`peer_trunk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
/*!50100 PARTITION BY HASH (id)
PARTITIONS 20 */;

-- ----------------------------
-- Records of tbl_cdr_settle
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_cdr_voice
-- ----------------------------
DROP TABLE IF EXISTS `tbl_cdr_voice`;
CREATE TABLE `tbl_cdr_voice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `account_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `task_id` int(10) unsigned DEFAULT NULL,
  `billing_rule_id` int(10) unsigned DEFAULT NULL,
  `type` tinyint(4) unsigned DEFAULT NULL,
  `fee_l1` int(10) unsigned DEFAULT NULL,
  `fee_l2` int(10) unsigned DEFAULT NULL,
  `fee_l3` int(10) unsigned DEFAULT NULL,
  `fee_l4` int(10) unsigned DEFAULT NULL,
  `fee_l5` int(10) unsigned DEFAULT NULL,
  `record_file` varchar(240) DEFAULT NULL,
  `caller` varchar(30) DEFAULT NULL,
  `callee` varchar(30) DEFAULT NULL,
  `CID` varchar(30) DEFAULT NULL,
  `agent_num` char(10) DEFAULT NULL,
  `pdd_len` int(10) unsigned DEFAULT NULL,
  `start_time` int(10) unsigned DEFAULT NULL,
  `ring_times` int(10) unsigned DEFAULT NULL,
  `answer_time` int(10) unsigned DEFAULT NULL,
  `ivr_end_times` int(10) unsigned DEFAULT NULL,
  `dtmf_times` int(10) unsigned DEFAULT NULL,
  `wait_agent_times` int(10) unsigned DEFAULT NULL,
  `time_len` int(10) unsigned DEFAULT NULL,
  `hold_cnt` int(10) unsigned DEFAULT NULL,
  `hold_times` int(10) unsigned DEFAULT NULL,
  `peer_trunk_id` int(10) unsigned DEFAULT NULL,
  `terminate_cause` int(10) unsigned DEFAULT NULL,
  `release_part` tinyint(4) unsigned DEFAULT NULL,
  `payload_type` tinyint(4) unsigned DEFAULT NULL,
  `package_loss_rate` tinyint(4) unsigned DEFAULT NULL,
  `record_flag` tinyint(4) unsigned DEFAULT NULL,
  `agent_level` tinyint(4) unsigned DEFAULT NULL,
  `cdr_mark` int(10) unsigned DEFAULT NULL,
  `account_mark` int(10) unsigned DEFAULT '0',
  `cdr_type` tinyint(4) unsigned DEFAULT NULL,
  `peer_ip1` int(10) unsigned DEFAULT NULL,
  `peer_ip2` int(10) unsigned DEFAULT NULL,
  `peer_ip3` int(10) unsigned DEFAULT NULL,
  `peer_ip4` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `account_id` (`account_id`),
  KEY `user_id` (`user_id`),
  KEY `task_id` (`task_id`),
  KEY `billing_rule_id` (`billing_rule_id`),
  KEY `peer_trunk_id` (`peer_trunk_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
/*!50100 PARTITION BY HASH (id)
PARTITIONS 20 */;

-- ----------------------------
-- Records of tbl_cdr_voice
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_clienttype
-- ----------------------------
DROP TABLE IF EXISTS `tbl_clienttype`;
CREATE TABLE `tbl_clienttype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `type_id` int(10) unsigned DEFAULT NULL,
  `type_content` varchar(90) DEFAULT NULL,
  `note` tinytext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_clienttype
-- ----------------------------
INSERT INTO `tbl_clienttype` VALUES ('1', '2', '0', '潜在客户', null);
INSERT INTO `tbl_clienttype` VALUES ('2', '2', '1', '意向客户', null);
INSERT INTO `tbl_clienttype` VALUES ('3', '2', '2', '试用客户', null);
INSERT INTO `tbl_clienttype` VALUES ('4', '2', '3', '成交客户', null);
INSERT INTO `tbl_clienttype` VALUES ('5', '3', '0', '潜在客户', null);
INSERT INTO `tbl_clienttype` VALUES ('6', '3', '1', '意向客户', null);
INSERT INTO `tbl_clienttype` VALUES ('7', '3', '2', '试用客户', null);
INSERT INTO `tbl_clienttype` VALUES ('8', '3', '3', '成交客户', null);

-- ----------------------------
-- Table structure for tbl_contact
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contact`;
CREATE TABLE `tbl_contact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `name` varchar(90) NOT NULL,
  `password` varchar(144) NOT NULL,
  `role` tinyint(4) unsigned NOT NULL,
  `contact` varchar(90) NOT NULL,
  `tel_number` varchar(30) DEFAULT NULL,
  `email` varchar(144) DEFAULT NULL,
  `salt` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `role` (`role`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_contact
-- ----------------------------
INSERT INTO `tbl_contact` VALUES ('1', '1', 'admin', 'eb6c800f8944ebd49d380d50fb2a70717b918bb07781beba61285fbc288143267e8c47352130c4bf7c4f96a12a2b43965960b4878b41ade1749b323be1a25737', '15', 'admin', '\'\'', '\'\'', 'PmjMNUTgTzQVygfQ');
INSERT INTO `tbl_contact` VALUES ('2', '2', 'admin', '155852c1c176a06caa47df7f41e0cf6fe35e4e3f1539b65e5055f0d3248809de48401264a9b6887c5999b09f35d06930da7981a27c3603f5ad9c0b95ffbca3ea', '15', '肖然', '18672139873', '2191445306@qq.com', 'X4hOj0Nq1HIY6uNH');
INSERT INTO `tbl_contact` VALUES ('3', '3', 'admin', '9940154a5cef3df937dd166cc04db9b6a75a0d44ee2fff16a3610073eee78a3428def0cb0a6879c0992cf415b1e2f2e92aee98991cb26c9f9375e19aac54001c', '15', '多大', '3243434', 'fdds@323.com', 'C5rjQn9wMDvovC6M');

-- ----------------------------
-- Table structure for tbl_corpclients
-- ----------------------------
DROP TABLE IF EXISTS `tbl_corpclients`;
CREATE TABLE `tbl_corpclients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `agent_id` int(10) unsigned NOT NULL,
  `mtime` int(10) unsigned NOT NULL,
  `full_name` varchar(90) NOT NULL,
  `sex` tinyint(4) unsigned NOT NULL,
  `company` varchar(140) DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '11',
  `contact_number` varchar(30) NOT NULL,
  `other_number` varchar(30) DEFAULT NULL,
  `mailing_address` varchar(140) DEFAULT NULL,
  `note` tinytext,
  `reserve_1` varchar(90) DEFAULT NULL,
  `reserve_2` varchar(90) DEFAULT NULL,
  `reserve_3` varchar(90) DEFAULT NULL,
  `reserve_4` varchar(90) DEFAULT NULL,
  `reserve_5` varchar(90) DEFAULT NULL,
  `reserve_6` varchar(90) DEFAULT NULL,
  `reserve_7` varchar(90) DEFAULT NULL,
  `responsible_id` int(10) unsigned DEFAULT '0',
  `group_id` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `agent_id` (`agent_id`),
  KEY `full_name` (`full_name`),
  KEY `type` (`type`),
  KEY `contact_number` (`contact_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_corpclients
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_customer
-- ----------------------------
DROP TABLE IF EXISTS `tbl_customer`;
CREATE TABLE `tbl_customer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(90) DEFAULT NULL,
  `mtime` int(10) unsigned DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `type` tinyint(4) unsigned DEFAULT NULL,
  `pub_mark` int(10) unsigned DEFAULT NULL,
  `minimum_balance` int(11) DEFAULT NULL,
  `billing_package_id` int(10) unsigned DEFAULT NULL,
  `balance` bigint(20) DEFAULT NULL,
  `balance_warning` int(10) unsigned DEFAULT NULL,
  `call_out_group` int(10) unsigned DEFAULT NULL,
  `remind` tinyint(4) unsigned DEFAULT NULL,
  `status` tinyint(4) unsigned DEFAULT NULL,
  `del_mark` tinyint(4) unsigned DEFAULT NULL,
  `ctime` int(10) unsigned DEFAULT NULL,
  `expiry_type` tinyint(4) unsigned DEFAULT NULL,
  `expiry` int(10) unsigned DEFAULT '0',
  `note` tinytext,
  PRIMARY KEY (`id`),
  KEY `ctime` (`ctime`),
  KEY `parent_id` (`parent_id`),
  KEY `type` (`type`),
  KEY `pub_mark` (`pub_mark`),
  KEY `billing_package_id` (`billing_package_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_customer
-- ----------------------------
INSERT INTO `tbl_customer` VALUES ('1', 'dipcc', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '\'\'');
INSERT INTO `tbl_customer` VALUES ('2', 'stone', null, '1', '0', '0', '10000', '1', '0', '10000', '1', '1', '1', '0', '1481028320', '0', '1480953600', '无');
INSERT INTO `tbl_customer` VALUES ('3', '佛挡杀佛地方的', null, '1', '0', '0', '0', null, '0', '0', '0', null, null, '0', '1481031267', null, '0', 'fdf');

-- ----------------------------
-- Table structure for tbl_customfield
-- ----------------------------
DROP TABLE IF EXISTS `tbl_customfield`;
CREATE TABLE `tbl_customfield` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `customer_field` varchar(90) DEFAULT NULL,
  `reserve_type` tinyint(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_customfield
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_dblog
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dblog`;
CREATE TABLE `tbl_dblog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctime` int(10) unsigned DEFAULT NULL,
  `customer` int(10) unsigned DEFAULT NULL,
  `contact` int(10) unsigned DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `result` int(10) unsigned DEFAULT NULL,
  `desc` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_dblog
-- ----------------------------
INSERT INTO `tbl_dblog` VALUES ('1', '1481022569', '1', '1', '\'SELECT ctime FROM login_failed WHERE contact_id=1 AND UNIX_TIMESTAMP(ctime) > 1481021969\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('2', '1481023557', '1', '1', '\'SELECT ctime FROM login_failed WHERE contact_id=1 AND UNIX_TIMESTAMP(ctime) > 1481022957\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('3', '1481028011', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('4', '1481028012', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('5', '1481028015', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('6', '1481028017', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('7', '1481028019', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('8', '1481028022', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('9', '1481028023', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('10', '1481028025', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('11', '1481028026', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('12', '1481028054', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('13', '1481028207', '1', '1', '\'INSERT INTO `tbl_billing_package` (`name`, `customer_id`, `note`, `ctime`) VALUES (\\\'stone\\\', \\\'1\\\', \\\'。。。\\\', 1481028207)\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('14', '1481028320', '1', '1', '\'INSERT INTO `tbl_customer` (`billing_package_id`, `minimum_balance`, `balance_warning`, `remind`, `status`, `expiry_type`, `note`, `call_out_group`, `name`, `parent_id`, `balance`, `pub_mark`, `type`, `del_mark`, `ctime`) VALUES (1, 10000, 10000, 1, 1, 0, \\\'无\\\', 1, \\\'stone\\\', \\\'1\\\', 0, 0, 0, 0, 1481028320)\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('15', '1481028432', '1', '1', '\'SELECT ctime FROM login_failed WHERE contact_id=1 AND UNIX_TIMESTAMP(ctime) > 1481027832\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('16', '1481028434', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('17', '1481028442', '1', '1', '\'UPDATE `tbl_customer` SET `billing_package_id` = 1, `minimum_balance` = 10000, `balance_warning` = 10000, `remind` = 1, `status` = 1, `expiry_type` = 0, `note` = \\\'无\\\', `call_out_group` = 1, `expiry` = 1480953600 WHERE `name` =  \\\'stone\\\' AND `type` =  0 AND `id` =  2\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('18', '1481028460', '2', '2', '\'SELECT ctime FROM login_failed WHERE contact_id=2 AND UNIX_TIMESTAMP(ctime) > 1481027860\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('19', '1481028467', '2', '2', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('20', '1481028468', '2', '2', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('21', '1481029351', '1', '1', '\'SELECT ctime FROM login_failed WHERE contact_id=1 AND UNIX_TIMESTAMP(ctime) > 1481028751\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('22', '1481029813', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('23', '1481029823', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('24', '1481029958', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('25', '1481030771', '1', '1', '\'SELECT ctime FROM login_failed WHERE contact_id=1 AND UNIX_TIMESTAMP(ctime) > 1481030171\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('26', '1481030776', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('27', '1481031251', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('28', '1481031267', '1', '1', '\'INSERT INTO `tbl_customer` (`billing_package_id`, `minimum_balance`, `balance_warning`, `remind`, `status`, `expiry_type`, `note`, `call_out_group`, `name`, `parent_id`, `balance`, `pub_mark`, `type`, `del_mark`, `ctime`) VALUES (NULL, 0, 0, NULL, NULL, NULL, \\\'fdf\\\', 0, \\\'佛挡杀佛地方的\\\', \\\'1\\\', 0, 0, 0, 0, 1481031267)\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('29', '1481033547', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('30', '1481034110', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('31', '1481034195', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('32', '1481034401', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('33', '1481034413', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('34', '1481034579', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('35', '1481037118', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('36', '1481037121', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('37', '1481037122', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('38', '1481037124', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('39', '1481037563', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('40', '1481037564', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('41', '1481037565', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('42', '1481037566', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('43', '1481037567', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('44', '1481037567', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('45', '1481037568', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('46', '1481037570', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('47', '1481037964', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('48', '1481037988', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('49', '1481037992', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('50', '1481038051', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('51', '1481039896', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('52', '1481041347', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('53', '1481041719', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('54', '1481041726', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('55', '1481042206', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('56', '1481042239', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('57', '1481042751', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('58', '1481045588', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('59', '1481045671', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('60', '1481045674', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('61', '1481045814', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('62', '1481045818', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('63', '1481045828', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('64', '1481045926', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('65', '1481045927', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('66', '1481045929', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('67', '1481045930', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('68', '1481045932', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('69', '1481045933', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('70', '1481045934', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('71', '1481045936', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('72', '1481045998', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('73', '1481045999', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('74', '1481046000', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('75', '1481046001', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('76', '1481046002', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('77', '1481046003', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('78', '1481046004', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('79', '1481046005', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('80', '1481046005', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('81', '1481046073', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('82', '1481046313', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('83', '1481046606', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('84', '1481046610', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('85', '1481046614', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('86', '1481046619', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('87', '1481046624', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('88', '1481046812', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');
INSERT INTO `tbl_dblog` VALUES ('89', '1481046814', '1', '1', '\'SET SESSION sql_mode=\\\"STRICT_ALL_TABLES\\\"\'', '0', '');

-- ----------------------------
-- Table structure for tbl_eix
-- ----------------------------
DROP TABLE IF EXISTS `tbl_eix`;
CREATE TABLE `tbl_eix` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(90) DEFAULT NULL,
  `ip` varchar(70) DEFAULT NULL,
  `prefix_number` varchar(30) DEFAULT NULL,
  `ctime` int(10) unsigned DEFAULT NULL,
  `port` int(10) unsigned DEFAULT NULL,
  `note` tinytext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_eix
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_gateway
-- ----------------------------
DROP TABLE IF EXISTS `tbl_gateway`;
CREATE TABLE `tbl_gateway` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(90) NOT NULL,
  `desc` tinytext,
  `username` varchar(140) NOT NULL,
  `password` varchar(140) NOT NULL,
  `realm` varchar(140) DEFAULT NULL,
  `form_user` varchar(140) DEFAULT NULL,
  `form_domain` varchar(140) DEFAULT NULL,
  `extension` varchar(140) DEFAULT NULL,
  `proxy` varchar(140) DEFAULT NULL,
  `reg_proxy` varchar(140) DEFAULT NULL,
  `expire_secs` int(11) DEFAULT NULL,
  `register` tinyint(4) DEFAULT '0',
  `reg_transport` varchar(16) DEFAULT NULL,
  `retry_secs` int(11) DEFAULT '-1',
  `cid_in_from` int(11) DEFAULT '-1',
  `contact_params` varchar(140) DEFAULT NULL,
  `exten_in_contact` int(11) DEFAULT '-1',
  `ping` int(11) DEFAULT '-1',
  `status` int(11) DEFAULT NULL,
  `sip_name` varchar(140) DEFAULT NULL,
  `register_status` tinyint(4) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_gateway
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_gateway_assign
-- ----------------------------
DROP TABLE IF EXISTS `tbl_gateway_assign`;
CREATE TABLE `tbl_gateway_assign` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gateway_grp_id` int(10) unsigned NOT NULL,
  `gateway_id` int(10) unsigned NOT NULL,
  `group_name` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gateway_grp_id` (`gateway_grp_id`),
  KEY `gateway_id` (`gateway_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_gateway_assign
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_gateway_grp
-- ----------------------------
DROP TABLE IF EXISTS `tbl_gateway_grp`;
CREATE TABLE `tbl_gateway_grp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(90) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `STATUS` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_gateway_grp
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_group
-- ----------------------------
DROP TABLE IF EXISTS `tbl_group`;
CREATE TABLE `tbl_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `name` varchar(90) NOT NULL,
  `play_number` tinyint(4) DEFAULT '0',
  `acd_policy` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_group
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_log
-- ----------------------------
DROP TABLE IF EXISTS `tbl_log`;
CREATE TABLE `tbl_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  `level` char(45) NOT NULL,
  `type` char(45) NOT NULL,
  `status` char(45) NOT NULL,
  `process` char(45) NOT NULL,
  `msg` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ctime` (`ctime`),
  KEY `process` (`process`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_log
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_marker_history
-- ----------------------------
DROP TABLE IF EXISTS `tbl_marker_history`;
CREATE TABLE `tbl_marker_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `role_type` int(10) unsigned DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `group1_id` int(10) unsigned DEFAULT NULL,
  `group2_id` int(10) unsigned DEFAULT NULL,
  `ctime` int(10) unsigned DEFAULT NULL,
  `number` char(80) DEFAULT NULL,
  `marker` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `number` (`number`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_marker_history
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_notice
-- ----------------------------
DROP TABLE IF EXISTS `tbl_notice`;
CREATE TABLE `tbl_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `contact_id` int(10) unsigned NOT NULL,
  `mtime` int(10) unsigned NOT NULL,
  `content` tinytext NOT NULL,
  `agency_type` tinyint(4) unsigned NOT NULL,
  `enterprise_type` tinyint(4) unsigned NOT NULL,
  `select_customer` int(10) unsigned NOT NULL,
  `ctime` int(10) unsigned NOT NULL,
  `expiry` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `contact_id` (`contact_id`),
  KEY `mtime` (`mtime`),
  KEY `ctime` (`ctime`),
  KEY `agency_type` (`agency_type`),
  KEY `enterprise_type` (`enterprise_type`),
  KEY `select_customer` (`select_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_notice
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_num_transformation
-- ----------------------------
DROP TABLE IF EXISTS `tbl_num_transformation`;
CREATE TABLE `tbl_num_transformation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(90) DEFAULT NULL,
  `mtime` int(10) unsigned DEFAULT NULL,
  `object` tinyint(4) unsigned DEFAULT NULL,
  `object_id` int(10) unsigned DEFAULT NULL,
  `direction` tinyint(4) unsigned DEFAULT NULL,
  `transform_timing` tinyint(4) unsigned DEFAULT NULL,
  `num_selection` tinyint(4) unsigned DEFAULT NULL,
  `caller_prefixion` varchar(45) DEFAULT '',
  `callee_prefixion` varchar(45) DEFAULT '',
  `replace_all` tinyint(4) unsigned DEFAULT NULL,
  `replace_num` varchar(45) DEFAULT '',
  `del_left` tinyint(4) unsigned DEFAULT '0',
  `del_right` tinyint(4) unsigned DEFAULT '0',
  `add_prefixion` varchar(45) DEFAULT '',
  `add_suffix` varchar(45) DEFAULT '',
  `priority` tinyint(4) unsigned DEFAULT NULL,
  `expiry` int(10) unsigned DEFAULT NULL,
  `note` tinytext,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_num_transformation
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_olog
-- ----------------------------
DROP TABLE IF EXISTS `tbl_olog`;
CREATE TABLE `tbl_olog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctime` int(10) unsigned NOT NULL,
  `opterator` char(45) NOT NULL,
  `module` char(45) NOT NULL,
  `opterated` char(45) NOT NULL,
  `result` char(45) NOT NULL,
  `msg` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ctime` (`ctime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_olog
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_oplog
-- ----------------------------
DROP TABLE IF EXISTS `tbl_oplog`;
CREATE TABLE `tbl_oplog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `contact_id` int(10) unsigned NOT NULL,
  `ctime` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `result` tinyint(4) unsigned NOT NULL,
  `failed_reason` tinytext,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `contact_id` (`contact_id`),
  KEY `ctime` (`ctime`),
  KEY `result` (`result`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_oplog
-- ----------------------------
INSERT INTO `tbl_oplog` VALUES ('1', '1', '1', '1481022569', 'login from 192.168.1.222', '0', '');
INSERT INTO `tbl_oplog` VALUES ('2', '1', '1', '1481023557', 'login from 192.168.1.222', '0', '');
INSERT INTO `tbl_oplog` VALUES ('3', '1', '1', '1481028011', '中继组页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('4', '1', '1', '1481028012', '路由管理页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('5', '1', '1', '1481028015', '全局黑名单页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('6', '1', '1', '1481028017', '主叫号码审核页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('7', '1', '1', '1481028019', '语音文件审核页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('8', '1', '1', '1481028022', '客户话务页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('9', '1', '1', '1481028023', '结算话费页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('10', '1', '1', '1481028025', '通话清单页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('11', '1', '1', '1481028026', '呼叫结果页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('12', '1', '1', '1481028054', '企业页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('13', '1', '1', '1481028207', '新增 资费套餐 id=1', '0', '');
INSERT INTO `tbl_oplog` VALUES ('14', '1', '1', '1481028320', '新增 企业 id=2', '0', '');
INSERT INTO `tbl_oplog` VALUES ('15', '1', '1', '1481028432', 'login from 192.168.1.222', '0', '');
INSERT INTO `tbl_oplog` VALUES ('16', '1', '1', '1481028434', '企业页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('17', '1', '1', '1481028442', '编辑 企业 name=stone AND type=0 AND id=2', '0', '');
INSERT INTO `tbl_oplog` VALUES ('18', '2', '2', '1481028460', 'login from 192.168.1.222', '0', '');
INSERT INTO `tbl_oplog` VALUES ('19', '2', '2', '1481028467', '通话清单页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('20', '2', '2', '1481028468', '录音查询页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('21', '1', '1', '1481029351', 'login from 192.168.1.222', '0', '');
INSERT INTO `tbl_oplog` VALUES ('22', '1', '1', '1481029813', '企业页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('23', '1', '1', '1481029823', '企业页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('24', '1', '1', '1481029958', '代理商页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('25', '1', '1', '1481030771', 'login from 192.168.1.222', '0', '');
INSERT INTO `tbl_oplog` VALUES ('26', '1', '1', '1481030776', '企业页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('27', '1', '1', '1481031251', '企业页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('28', '1', '1', '1481031267', '新增 企业 id=3', '0', '');
INSERT INTO `tbl_oplog` VALUES ('29', '1', '1', '1481033547', 'EIX设备页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('30', '1', '1', '1481034110', '工作笔记页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('31', '1', '1', '1481034195', '工作笔记页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('32', '1', '1', '1481034401', '工作笔记页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('33', '1', '1', '1481034413', '工作笔记页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('34', '1', '1', '1481034579', '工作笔记页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('35', '1', '1', '1481037118', 'CSS页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('36', '1', '1', '1481037121', '工作笔记页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('37', '1', '1', '1481037122', 'JS页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('38', '1', '1', '1481037124', 'PHP页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('39', '1', '1', '1481037563', 'JS页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('40', '1', '1', '1481037564', 'PHP页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('41', '1', '1', '1481037565', 'MYSQL页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('42', '1', '1', '1481037566', 'LINUX页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('43', '1', '1', '1481037567', 'NGINX页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('44', '1', '1', '1481037567', 'APACHE页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('45', '1', '1', '1481037568', 'OTHER页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('46', '1', '1', '1481037570', 'CSS页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('47', '1', '1', '1481037964', 'JS页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('48', '1', '1', '1481037988', 'CSS页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('49', '1', '1', '1481037992', 'CSS页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('50', '1', '1', '1481038051', 'JS页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('51', '1', '1', '1481039896', 'JS页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('52', '1', '1', '1481041347', 'JS页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('53', '1', '1', '1481041719', 'JS页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('54', '1', '1', '1481041726', 'JS页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('55', '1', '1', '1481042206', 'JS页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('56', '1', '1', '1481042239', 'JS页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('57', '1', '1', '1481042751', 'JS页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('58', '1', '1', '1481045588', 'LINUX页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('59', '1', '1', '1481045671', 'MYSQL页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('60', '1', '1', '1481045674', 'LINUX页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('61', '1', '1', '1481045814', 'CSS页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('62', '1', '1', '1481045818', 'LINUX页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('63', '1', '1', '1481045828', 'JS页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('64', '1', '1', '1481045926', 'CSS页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('65', '1', '1', '1481045927', '工作笔记页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('66', '1', '1', '1481045929', 'PHP页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('67', '1', '1', '1481045930', 'MYSQL页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('68', '1', '1', '1481045932', 'LINUX页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('69', '1', '1', '1481045933', 'NGINX页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('70', '1', '1', '1481045934', 'APACHE页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('71', '1', '1', '1481045936', 'OTHER页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('72', '1', '1', '1481045998', '工作笔记页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('73', '1', '1', '1481045999', 'CSS页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('74', '1', '1', '1481046000', 'JS页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('75', '1', '1', '1481046001', 'PHP页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('76', '1', '1', '1481046002', 'MYSQL页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('77', '1', '1', '1481046003', 'LINUX页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('78', '1', '1', '1481046004', 'NGINX页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('79', '1', '1', '1481046005', 'APACHE页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('80', '1', '1', '1481046005', 'OTHER页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('81', '1', '1', '1481046073', '工作笔记页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('82', '1', '1', '1481046313', 'CSS页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('83', '1', '1', '1481046606', 'JS页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('84', '1', '1', '1481046610', 'LINUX页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('85', '1', '1', '1481046614', 'NGINX页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('86', '1', '1', '1481046619', '工作笔记页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('87', '1', '1', '1481046624', 'LINUX页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('88', '1', '1', '1481046812', 'PHP页面', '0', '');
INSERT INTO `tbl_oplog` VALUES ('89', '1', '1', '1481046814', 'MYSQL页面', '0', '');

-- ----------------------------
-- Table structure for tbl_parameters
-- ----------------------------
DROP TABLE IF EXISTS `tbl_parameters`;
CREATE TABLE `tbl_parameters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parameter_name` varchar(255) NOT NULL,
  `parameter_value` varchar(255) DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_parameters
-- ----------------------------
INSERT INTO `tbl_parameters` VALUES ('1', 'lang_id', '0', 'null');
INSERT INTO `tbl_parameters` VALUES ('2', 'web_port', '80', 'null');
INSERT INTO `tbl_parameters` VALUES ('3', 'audio_key', '0', 'null');
INSERT INTO `tbl_parameters` VALUES ('4', 'total_time', '30', 'null');
INSERT INTO `tbl_parameters` VALUES ('5', 'register_interval', '120', 'null');
INSERT INTO `tbl_parameters` VALUES ('6', 'rtp_start_port', '16384', 'null');
INSERT INTO `tbl_parameters` VALUES ('7', 'rtp_end_port', '32768', 'null');
INSERT INTO `tbl_parameters` VALUES ('8', 'nat_traversal', '0', 'null');
INSERT INTO `tbl_parameters` VALUES ('9', 'codec', 'G729,G723,PCMA,PCMU', '1');
INSERT INTO `tbl_parameters` VALUES ('10', 'access_ip', '127.0.0.1', 'null');
INSERT INTO `tbl_parameters` VALUES ('11', 'access_port', '8000', 'null');
INSERT INTO `tbl_parameters` VALUES ('12', 'call_rate', '3', 'null');
INSERT INTO `tbl_parameters` VALUES ('13', 'ontime_restart', '', '');
INSERT INTO `tbl_parameters` VALUES ('14', 'ontime_status', '0', '');
INSERT INTO `tbl_parameters` VALUES ('15', 'cycle_restart', '', '');
INSERT INTO `tbl_parameters` VALUES ('16', 'cycle_status', '0', '');

-- ----------------------------
-- Table structure for tbl_privileges
-- ----------------------------
DROP TABLE IF EXISTS `tbl_privileges`;
CREATE TABLE `tbl_privileges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `role` tinyint(4) unsigned NOT NULL,
  `type` tinyint(4) unsigned NOT NULL,
  `content` text NOT NULL,
  `privilege` tinytext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role` (`role`),
  KEY `type` (`type`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=581 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_privileges
-- ----------------------------
INSERT INTO `tbl_privileges` VALUES ('1', '1', '0', '0', 'agency', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('2', '1', '0', '0', 'enterprise', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('3', '1', '0', '0', 'billingpackage', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('4', '1', '0', '0', 'billingrule', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('5', '1', '0', '0', 'siptrunk', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('6', '1', '0', '0', 'siptrunkgroup', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('7', '1', '0', '0', 'route', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('8', '1', '0', '0', 'changenumber', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('9', '1', '0', '0', 'sipterm', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('10', '1', '0', '0', 'didnumber', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('11', '1', '0', '0', 'eix', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('12', '1', '0', '0', 'rolemng', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('13', '1', '0', '0', 'bulletin', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('14', '1', '0', '0', 'sysmng', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('15', '1', '0', '0', 'parameters', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('16', '1', '0', '0', 'userconf', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('17', '1', '0', '0', 'amcmng', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('18', '1', '0', '0', 'systemrestart', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('19', '1', '0', '0', 'modifypassword', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('20', '1', '0', '0', 'remit', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('21', '1', '0', '0', 'recharge', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('22', '1', '0', '0', 'debit', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('23', '1', '0', '0', 'currentaccount', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('24', '1', '0', '0', 'oplog', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('25', '1', '0', '0', 'runlog', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('26', '1', '0', '0', 'alarmlog', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('27', '1', '0', '0', 'syssrc', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('28', '1', '0', '0', 'verifyaudio', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('29', '1', '0', '0', 'verifycaller', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('30', '1', '0', '0', 'globalblacklist', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('31', '1', '0', '0', 'sensitive', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('32', '1', '0', '0', 'callerlimitation', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('33', '1', '0', '0', 'rechargestat', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('34', '1', '0', '0', 'profitsstat', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('35', '1', '0', '0', 'consumestat', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('36', '1', '0', '0', 'trunkconsumestat', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('37', '1', '0', '0', 'statcustomertraffic', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('38', '1', '0', '0', 'stattrunktraffic', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('39', '1', '0', '0', 'stattasktraffic', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('40', '1', '0', '0', 'operatingdata', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('41', '1', '0', '0', 'calltaskmngt', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('42', '1', '0', '0', 'searchcalltask', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('43', '1', '0', '0', 'searchtalk', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('44', '1', '0', '0', 'searchsnd', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('45', '1', '0', '0', 'currentaccount', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('46', '1', '0', '1', 'agency', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('47', '1', '0', '1', 'enterprise', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('48', '1', '0', '1', 'billingpackage', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('49', '1', '0', '1', 'billingrule', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('50', '1', '0', '1', 'siptrunk', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('51', '1', '0', '1', 'siptrunkgroup', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('52', '1', '0', '1', 'route', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('53', '1', '0', '1', 'changenumber', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('54', '1', '0', '1', 'sipterm', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('55', '1', '0', '1', 'didnumber', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('56', '1', '0', '1', 'eix', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('57', '1', '0', '1', 'rolemng', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('58', '1', '0', '1', 'bulletin', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('59', '1', '0', '1', 'sysmng', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('60', '1', '0', '1', 'parameters', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('61', '1', '0', '1', 'userconf', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('62', '1', '0', '1', 'amcmng', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('63', '1', '0', '1', 'systemrestart', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('64', '1', '0', '1', 'modifypassword', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('65', '1', '0', '1', 'remit', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('66', '1', '0', '1', 'recharge', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('67', '1', '0', '1', 'debit', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('68', '1', '0', '1', 'currentaccount', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('69', '1', '0', '1', 'oplog', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('70', '1', '0', '1', 'runlog', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('71', '1', '0', '1', 'alarmlog', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('72', '1', '0', '1', 'syssrc', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('73', '1', '0', '1', 'verifyaudio', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('74', '1', '0', '1', 'verifycaller', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('75', '1', '0', '1', 'globalblacklist', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('76', '1', '0', '1', 'sensitive', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('77', '1', '0', '1', 'callerlimitation', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('78', '1', '0', '1', 'rechargestat', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('79', '1', '0', '1', 'profitsstat', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('80', '1', '0', '1', 'consumestat', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('81', '1', '0', '1', 'trunkconsumestat', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('82', '1', '0', '1', 'statcustomertraffic', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('83', '1', '0', '1', 'stattrunktraffic', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('84', '1', '0', '1', 'stattasktraffic', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('85', '1', '0', '1', 'operatingdata', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('86', '1', '0', '1', 'calltaskmngt', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('87', '1', '0', '1', 'searchcalltask', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('88', '1', '0', '1', 'searchtalk', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('89', '1', '0', '1', 'searchsnd', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('90', '1', '0', '1', 'currentaccount', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('91', '1', '2', '0', 'agency', '');
INSERT INTO `tbl_privileges` VALUES ('92', '1', '2', '0', 'enterprise', '');
INSERT INTO `tbl_privileges` VALUES ('93', '1', '2', '0', 'billingpackage', '');
INSERT INTO `tbl_privileges` VALUES ('94', '1', '2', '0', 'billingrule', '');
INSERT INTO `tbl_privileges` VALUES ('95', '1', '2', '0', 'siptrunk', '');
INSERT INTO `tbl_privileges` VALUES ('96', '1', '2', '0', 'siptrunkgroup', '');
INSERT INTO `tbl_privileges` VALUES ('97', '1', '2', '0', 'route', '');
INSERT INTO `tbl_privileges` VALUES ('98', '1', '2', '0', 'changenumber', '');
INSERT INTO `tbl_privileges` VALUES ('99', '1', '2', '0', 'sipterm', '');
INSERT INTO `tbl_privileges` VALUES ('100', '1', '2', '0', 'didnumber', '');
INSERT INTO `tbl_privileges` VALUES ('101', '1', '2', '0', 'eix', '');
INSERT INTO `tbl_privileges` VALUES ('102', '1', '2', '0', 'rolemng', '');
INSERT INTO `tbl_privileges` VALUES ('103', '1', '2', '0', 'bulletin', '');
INSERT INTO `tbl_privileges` VALUES ('104', '1', '2', '0', 'sysmng', '');
INSERT INTO `tbl_privileges` VALUES ('105', '1', '2', '0', 'parameters', '');
INSERT INTO `tbl_privileges` VALUES ('106', '1', '2', '0', 'userconf', '');
INSERT INTO `tbl_privileges` VALUES ('107', '1', '2', '0', 'amcmng', '');
INSERT INTO `tbl_privileges` VALUES ('108', '1', '2', '0', 'systemrestart', '');
INSERT INTO `tbl_privileges` VALUES ('109', '1', '2', '0', 'modifypassword', '');
INSERT INTO `tbl_privileges` VALUES ('110', '1', '2', '0', 'remit', '10');
INSERT INTO `tbl_privileges` VALUES ('111', '1', '2', '0', 'recharge', '10');
INSERT INTO `tbl_privileges` VALUES ('112', '1', '2', '0', 'debit', '');
INSERT INTO `tbl_privileges` VALUES ('113', '1', '2', '0', 'currentaccount', '');
INSERT INTO `tbl_privileges` VALUES ('114', '1', '2', '0', 'oplog', '');
INSERT INTO `tbl_privileges` VALUES ('115', '1', '2', '0', 'runlog', '');
INSERT INTO `tbl_privileges` VALUES ('116', '1', '2', '0', 'alarmlog', '');
INSERT INTO `tbl_privileges` VALUES ('117', '1', '2', '0', 'syssrc', '');
INSERT INTO `tbl_privileges` VALUES ('118', '1', '2', '0', 'verifyaudio', '');
INSERT INTO `tbl_privileges` VALUES ('119', '1', '2', '0', 'verifycaller', '10');
INSERT INTO `tbl_privileges` VALUES ('120', '1', '2', '0', 'globalblacklist', '');
INSERT INTO `tbl_privileges` VALUES ('121', '1', '2', '0', 'sensitive', '');
INSERT INTO `tbl_privileges` VALUES ('122', '1', '2', '0', 'callerlimitation', '');
INSERT INTO `tbl_privileges` VALUES ('123', '1', '2', '0', 'rechargestat', '');
INSERT INTO `tbl_privileges` VALUES ('124', '1', '2', '0', 'profitsstat', '');
INSERT INTO `tbl_privileges` VALUES ('125', '1', '2', '0', 'consumestat', '');
INSERT INTO `tbl_privileges` VALUES ('126', '1', '2', '0', 'trunkconsumestat', '');
INSERT INTO `tbl_privileges` VALUES ('127', '1', '2', '0', 'statcustomertraffic', '');
INSERT INTO `tbl_privileges` VALUES ('128', '1', '2', '0', 'stattrunktraffic', '');
INSERT INTO `tbl_privileges` VALUES ('129', '1', '2', '0', 'stattasktraffic', '');
INSERT INTO `tbl_privileges` VALUES ('130', '1', '2', '0', 'operatingdata', '');
INSERT INTO `tbl_privileges` VALUES ('131', '1', '2', '0', 'calltaskmngt', '');
INSERT INTO `tbl_privileges` VALUES ('132', '1', '2', '0', 'searchcalltask', '');
INSERT INTO `tbl_privileges` VALUES ('133', '1', '2', '0', 'searchtalk', '');
INSERT INTO `tbl_privileges` VALUES ('134', '1', '2', '0', 'searchsnd', '');
INSERT INTO `tbl_privileges` VALUES ('135', '1', '2', '0', 'currentaccount', '10');
INSERT INTO `tbl_privileges` VALUES ('136', '1', '2', '1', 'agency', '');
INSERT INTO `tbl_privileges` VALUES ('137', '1', '2', '1', 'enterprise', '');
INSERT INTO `tbl_privileges` VALUES ('138', '1', '2', '1', 'billingpackage', '');
INSERT INTO `tbl_privileges` VALUES ('139', '1', '2', '1', 'billingrule', '');
INSERT INTO `tbl_privileges` VALUES ('140', '1', '2', '1', 'siptrunk', '');
INSERT INTO `tbl_privileges` VALUES ('141', '1', '2', '1', 'siptrunkgroup', '');
INSERT INTO `tbl_privileges` VALUES ('142', '1', '2', '1', 'route', '');
INSERT INTO `tbl_privileges` VALUES ('143', '1', '2', '1', 'changenumber', '');
INSERT INTO `tbl_privileges` VALUES ('144', '1', '2', '1', 'sipterm', '');
INSERT INTO `tbl_privileges` VALUES ('145', '1', '2', '1', 'didnumber', '');
INSERT INTO `tbl_privileges` VALUES ('146', '1', '2', '1', 'eix', '');
INSERT INTO `tbl_privileges` VALUES ('147', '1', '2', '1', 'rolemng', '');
INSERT INTO `tbl_privileges` VALUES ('148', '1', '2', '1', 'bulletin', '');
INSERT INTO `tbl_privileges` VALUES ('149', '1', '2', '1', 'sysmng', '');
INSERT INTO `tbl_privileges` VALUES ('150', '1', '2', '1', 'parameters', '');
INSERT INTO `tbl_privileges` VALUES ('151', '1', '2', '1', 'userconf', '');
INSERT INTO `tbl_privileges` VALUES ('152', '1', '2', '1', 'amcmng', '');
INSERT INTO `tbl_privileges` VALUES ('153', '1', '2', '1', 'systemrestart', '');
INSERT INTO `tbl_privileges` VALUES ('154', '1', '2', '1', 'modifypassword', '');
INSERT INTO `tbl_privileges` VALUES ('155', '1', '2', '1', 'remit', '0,2');
INSERT INTO `tbl_privileges` VALUES ('156', '1', '2', '1', 'recharge', '0,2');
INSERT INTO `tbl_privileges` VALUES ('157', '1', '2', '1', 'debit', '');
INSERT INTO `tbl_privileges` VALUES ('158', '1', '2', '1', 'currentaccount', '');
INSERT INTO `tbl_privileges` VALUES ('159', '1', '2', '1', 'oplog', '');
INSERT INTO `tbl_privileges` VALUES ('160', '1', '2', '1', 'runlog', '');
INSERT INTO `tbl_privileges` VALUES ('161', '1', '2', '1', 'alarmlog', '');
INSERT INTO `tbl_privileges` VALUES ('162', '1', '2', '1', 'syssrc', '');
INSERT INTO `tbl_privileges` VALUES ('163', '1', '2', '1', 'verifyaudio', '');
INSERT INTO `tbl_privileges` VALUES ('164', '1', '2', '1', 'verifycaller', '');
INSERT INTO `tbl_privileges` VALUES ('165', '1', '2', '1', 'globalblacklist', '');
INSERT INTO `tbl_privileges` VALUES ('166', '1', '2', '1', 'sensitive', '');
INSERT INTO `tbl_privileges` VALUES ('167', '1', '2', '1', 'callerlimitation', '');
INSERT INTO `tbl_privileges` VALUES ('168', '1', '2', '1', 'rechargestat', '');
INSERT INTO `tbl_privileges` VALUES ('169', '1', '2', '1', 'profitsstat', '');
INSERT INTO `tbl_privileges` VALUES ('170', '1', '2', '1', 'consumestat', '');
INSERT INTO `tbl_privileges` VALUES ('171', '1', '2', '1', 'trunkconsumestat', '');
INSERT INTO `tbl_privileges` VALUES ('172', '1', '2', '1', 'statcustomertraffic', '');
INSERT INTO `tbl_privileges` VALUES ('173', '1', '2', '1', 'stattrunktraffic', '');
INSERT INTO `tbl_privileges` VALUES ('174', '1', '2', '1', 'stattasktraffic', '');
INSERT INTO `tbl_privileges` VALUES ('175', '1', '2', '1', 'operatingdata', '');
INSERT INTO `tbl_privileges` VALUES ('176', '1', '2', '1', 'calltaskmngt', '');
INSERT INTO `tbl_privileges` VALUES ('177', '1', '2', '1', 'searchcalltask', '');
INSERT INTO `tbl_privileges` VALUES ('178', '1', '2', '1', 'searchtalk', '');
INSERT INTO `tbl_privileges` VALUES ('179', '1', '2', '1', 'searchsnd', '');
INSERT INTO `tbl_privileges` VALUES ('180', '1', '2', '1', 'currentaccount', '0,2');
INSERT INTO `tbl_privileges` VALUES ('181', '2', '0', '0', 'clientinfo', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('182', '2', '0', '0', 'group', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('183', '2', '0', '0', 'agent', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('184', '2', '0', '0', 'callee', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('185', '2', '0', '0', 'caller', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('186', '2', '0', '0', 'callergroup', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('187', '2', '0', '0', 'callermngt', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('188', '2', '0', '0', 'audio', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('189', '2', '0', '0', 'calltask', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('190', '2', '0', '0', 'sipterm', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('191', '2', '0', '0', 'didnumber', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('192', '2', '0', '0', 'blacklist', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('193', '2', '0', '0', 'rolemng', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('194', '2', '0', '0', 'bulletin', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('195', '2', '0', '0', 'customfield', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('196', '2', '0', '0', 'customtype', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('197', '2', '0', '0', 'advice', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('198', '2', '0', '0', 'modifypassword', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('199', '2', '0', '0', 'agentmonitor', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('200', '2', '0', '0', 'calltaskmngt', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('201', '2', '0', '0', 'remit', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('202', '2', '0', '0', 'currentaccount', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('203', '2', '0', '0', 'consumestat', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('204', '2', '0', '0', 'rechargestat', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('205', '2', '0', '0', 'reportagent', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('206', '2', '0', '0', 'reportagentgrp', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('207', '2', '0', '0', 'statcustomertraffic', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('208', '2', '0', '0', 'stattasktraffic', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('209', '2', '0', '0', 'reportmarkercount', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('210', '2', '0', '0', 'searchcalltask', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('211', '2', '0', '0', 'searchtalk', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('212', '2', '0', '0', 'searchsnd', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('213', '2', '0', '0', 'oplog', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('214', '2', '0', '1', 'clientinfo', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('215', '2', '0', '1', 'group', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('216', '2', '0', '1', 'agent', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('217', '2', '0', '1', 'callee', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('218', '2', '0', '1', 'caller', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('219', '2', '0', '1', 'callergroup', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('220', '2', '0', '1', 'callermngt', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('221', '2', '0', '1', 'audio', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('222', '2', '0', '1', 'calltask', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('223', '2', '0', '1', 'sipterm', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('224', '2', '0', '1', 'didnumber', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('225', '2', '0', '1', 'blacklist', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('226', '2', '0', '1', 'rolemng', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('227', '2', '0', '1', 'bulletin', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('228', '2', '0', '1', 'customfield', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('229', '2', '0', '1', 'customtype', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('230', '2', '0', '1', 'advice', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('231', '2', '0', '1', 'modifypassword', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('232', '2', '0', '1', 'agentmonitor', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('233', '2', '0', '1', 'calltaskmngt', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('234', '2', '0', '1', 'remit', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('235', '2', '0', '1', 'currentaccount', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('236', '2', '0', '1', 'consumestat', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('237', '2', '0', '1', 'rechargestat', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('238', '2', '0', '1', 'reportagent', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('239', '2', '0', '1', 'reportagentgrp', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('240', '2', '0', '1', 'statcustomertraffic', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('241', '2', '0', '1', 'stattasktraffic', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('242', '2', '0', '1', 'reportmarkercount', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('243', '2', '0', '1', 'searchcalltask', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('244', '2', '0', '1', 'searchtalk', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('245', '2', '0', '1', 'searchsnd', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('246', '2', '0', '1', 'oplog', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('247', '2', '1', '0', 'clientinfo', '');
INSERT INTO `tbl_privileges` VALUES ('248', '2', '1', '0', 'group', '');
INSERT INTO `tbl_privileges` VALUES ('249', '2', '1', '0', 'agent', '');
INSERT INTO `tbl_privileges` VALUES ('250', '2', '1', '0', 'callee', '');
INSERT INTO `tbl_privileges` VALUES ('251', '2', '1', '0', 'caller', '');
INSERT INTO `tbl_privileges` VALUES ('252', '2', '1', '0', 'callergroup', '');
INSERT INTO `tbl_privileges` VALUES ('253', '2', '1', '0', 'callermngt', '');
INSERT INTO `tbl_privileges` VALUES ('254', '2', '1', '0', 'audio', '');
INSERT INTO `tbl_privileges` VALUES ('255', '2', '1', '0', 'calltask', '');
INSERT INTO `tbl_privileges` VALUES ('256', '2', '1', '0', 'sipterm', '');
INSERT INTO `tbl_privileges` VALUES ('257', '2', '1', '0', 'didnumber', '');
INSERT INTO `tbl_privileges` VALUES ('258', '2', '1', '0', 'blacklist', '');
INSERT INTO `tbl_privileges` VALUES ('259', '2', '1', '0', 'rolemng', '');
INSERT INTO `tbl_privileges` VALUES ('260', '2', '1', '0', 'bulletin', '');
INSERT INTO `tbl_privileges` VALUES ('261', '2', '1', '0', 'customfield', '');
INSERT INTO `tbl_privileges` VALUES ('262', '2', '1', '0', 'customtype', '');
INSERT INTO `tbl_privileges` VALUES ('263', '2', '1', '0', 'advice', '');
INSERT INTO `tbl_privileges` VALUES ('264', '2', '1', '0', 'modifypassword', '');
INSERT INTO `tbl_privileges` VALUES ('265', '2', '1', '0', 'agentmonitor', '');
INSERT INTO `tbl_privileges` VALUES ('266', '2', '1', '0', 'calltaskmngt', '');
INSERT INTO `tbl_privileges` VALUES ('267', '2', '1', '0', 'remit', '');
INSERT INTO `tbl_privileges` VALUES ('268', '2', '1', '0', 'currentaccount', '');
INSERT INTO `tbl_privileges` VALUES ('269', '2', '1', '0', 'consumestat', '');
INSERT INTO `tbl_privileges` VALUES ('270', '2', '1', '0', 'rechargestat', '');
INSERT INTO `tbl_privileges` VALUES ('271', '2', '1', '0', 'reportagent', '10,13');
INSERT INTO `tbl_privileges` VALUES ('272', '2', '1', '0', 'reportagentgrp', '10,13');
INSERT INTO `tbl_privileges` VALUES ('273', '2', '1', '0', 'statcustomertraffic', '');
INSERT INTO `tbl_privileges` VALUES ('274', '2', '1', '0', 'stattasktraffic', '10,13');
INSERT INTO `tbl_privileges` VALUES ('275', '2', '1', '0', 'reportmarkercount', '10,13');
INSERT INTO `tbl_privileges` VALUES ('276', '2', '1', '0', 'searchcalltask', '10,13');
INSERT INTO `tbl_privileges` VALUES ('277', '2', '1', '0', 'searchtalk', '10,13');
INSERT INTO `tbl_privileges` VALUES ('278', '2', '1', '0', 'searchsnd', '10,13');
INSERT INTO `tbl_privileges` VALUES ('279', '2', '1', '0', 'oplog', '');
INSERT INTO `tbl_privileges` VALUES ('280', '2', '1', '1', 'clientinfo', '');
INSERT INTO `tbl_privileges` VALUES ('281', '2', '1', '1', 'group', '');
INSERT INTO `tbl_privileges` VALUES ('282', '2', '1', '1', 'agent', '');
INSERT INTO `tbl_privileges` VALUES ('283', '2', '1', '1', 'callee', '');
INSERT INTO `tbl_privileges` VALUES ('284', '2', '1', '1', 'caller', '');
INSERT INTO `tbl_privileges` VALUES ('285', '2', '1', '1', 'callergroup', '');
INSERT INTO `tbl_privileges` VALUES ('286', '2', '1', '1', 'callermngt', '');
INSERT INTO `tbl_privileges` VALUES ('287', '2', '1', '1', 'audio', '');
INSERT INTO `tbl_privileges` VALUES ('288', '2', '1', '1', 'calltask', '');
INSERT INTO `tbl_privileges` VALUES ('289', '2', '1', '1', 'sipterm', '');
INSERT INTO `tbl_privileges` VALUES ('290', '2', '1', '1', 'didnumber', '');
INSERT INTO `tbl_privileges` VALUES ('291', '2', '1', '1', 'blacklist', '');
INSERT INTO `tbl_privileges` VALUES ('292', '2', '1', '1', 'rolemng', '');
INSERT INTO `tbl_privileges` VALUES ('293', '2', '1', '1', 'bulletin', '');
INSERT INTO `tbl_privileges` VALUES ('294', '2', '1', '1', 'customfield', '');
INSERT INTO `tbl_privileges` VALUES ('295', '2', '1', '1', 'customtype', '');
INSERT INTO `tbl_privileges` VALUES ('296', '2', '1', '1', 'advice', '');
INSERT INTO `tbl_privileges` VALUES ('297', '2', '1', '1', 'modifypassword', '');
INSERT INTO `tbl_privileges` VALUES ('298', '2', '1', '1', 'agentmonitor', '');
INSERT INTO `tbl_privileges` VALUES ('299', '2', '1', '1', 'calltaskmngt', '');
INSERT INTO `tbl_privileges` VALUES ('300', '2', '1', '1', 'remit', '');
INSERT INTO `tbl_privileges` VALUES ('301', '2', '1', '1', 'currentaccount', '');
INSERT INTO `tbl_privileges` VALUES ('302', '2', '1', '1', 'consumestat', '');
INSERT INTO `tbl_privileges` VALUES ('303', '2', '1', '1', 'rechargestat', '');
INSERT INTO `tbl_privileges` VALUES ('304', '2', '1', '1', 'reportagent', '0');
INSERT INTO `tbl_privileges` VALUES ('305', '2', '1', '1', 'reportagentgrp', '0');
INSERT INTO `tbl_privileges` VALUES ('306', '2', '1', '1', 'statcustomertraffic', '');
INSERT INTO `tbl_privileges` VALUES ('307', '2', '1', '1', 'stattasktraffic', '0');
INSERT INTO `tbl_privileges` VALUES ('308', '2', '1', '1', 'reportmarkercount', '0');
INSERT INTO `tbl_privileges` VALUES ('309', '2', '1', '1', 'searchcalltask', '0');
INSERT INTO `tbl_privileges` VALUES ('310', '2', '1', '1', 'searchtalk', '0');
INSERT INTO `tbl_privileges` VALUES ('311', '2', '1', '1', 'searchsnd', '0');
INSERT INTO `tbl_privileges` VALUES ('312', '2', '1', '1', 'oplog', '');
INSERT INTO `tbl_privileges` VALUES ('313', '2', '2', '0', 'clientinfo', '');
INSERT INTO `tbl_privileges` VALUES ('314', '2', '2', '0', 'group', '');
INSERT INTO `tbl_privileges` VALUES ('315', '2', '2', '0', 'agent', '');
INSERT INTO `tbl_privileges` VALUES ('316', '2', '2', '0', 'callee', '');
INSERT INTO `tbl_privileges` VALUES ('317', '2', '2', '0', 'caller', '');
INSERT INTO `tbl_privileges` VALUES ('318', '2', '2', '0', 'callergroup', '');
INSERT INTO `tbl_privileges` VALUES ('319', '2', '2', '0', 'callermngt', '');
INSERT INTO `tbl_privileges` VALUES ('320', '2', '2', '0', 'audio', '');
INSERT INTO `tbl_privileges` VALUES ('321', '2', '2', '0', 'calltask', '');
INSERT INTO `tbl_privileges` VALUES ('322', '2', '2', '0', 'sipterm', '');
INSERT INTO `tbl_privileges` VALUES ('323', '2', '2', '0', 'didnumber', '');
INSERT INTO `tbl_privileges` VALUES ('324', '2', '2', '0', 'blacklist', '');
INSERT INTO `tbl_privileges` VALUES ('325', '2', '2', '0', 'rolemng', '');
INSERT INTO `tbl_privileges` VALUES ('326', '2', '2', '0', 'bulletin', '');
INSERT INTO `tbl_privileges` VALUES ('327', '2', '2', '0', 'customfield', '');
INSERT INTO `tbl_privileges` VALUES ('328', '2', '2', '0', 'customtype', '');
INSERT INTO `tbl_privileges` VALUES ('329', '2', '2', '0', 'advice', '');
INSERT INTO `tbl_privileges` VALUES ('330', '2', '2', '0', 'modifypassword', '');
INSERT INTO `tbl_privileges` VALUES ('331', '2', '2', '0', 'agentmonitor', '');
INSERT INTO `tbl_privileges` VALUES ('332', '2', '2', '0', 'calltaskmngt', '');
INSERT INTO `tbl_privileges` VALUES ('333', '2', '2', '0', 'remit', '10');
INSERT INTO `tbl_privileges` VALUES ('334', '2', '2', '0', 'currentaccount', '10');
INSERT INTO `tbl_privileges` VALUES ('335', '2', '2', '0', 'consumestat', '10');
INSERT INTO `tbl_privileges` VALUES ('336', '2', '2', '0', 'rechargestat', '10');
INSERT INTO `tbl_privileges` VALUES ('337', '2', '2', '0', 'reportagent', '');
INSERT INTO `tbl_privileges` VALUES ('338', '2', '2', '0', 'reportagentgrp', '');
INSERT INTO `tbl_privileges` VALUES ('339', '2', '2', '0', 'statcustomertraffic', '');
INSERT INTO `tbl_privileges` VALUES ('340', '2', '2', '0', 'stattasktraffic', '');
INSERT INTO `tbl_privileges` VALUES ('341', '2', '2', '0', 'reportmarkercount', '');
INSERT INTO `tbl_privileges` VALUES ('342', '2', '2', '0', 'searchcalltask', '');
INSERT INTO `tbl_privileges` VALUES ('343', '2', '2', '0', 'searchtalk', '');
INSERT INTO `tbl_privileges` VALUES ('344', '2', '2', '0', 'searchsnd', '');
INSERT INTO `tbl_privileges` VALUES ('345', '2', '2', '0', 'oplog', '');
INSERT INTO `tbl_privileges` VALUES ('346', '2', '2', '1', 'clientinfo', '');
INSERT INTO `tbl_privileges` VALUES ('347', '2', '2', '1', 'group', '');
INSERT INTO `tbl_privileges` VALUES ('348', '2', '2', '1', 'agent', '');
INSERT INTO `tbl_privileges` VALUES ('349', '2', '2', '1', 'callee', '');
INSERT INTO `tbl_privileges` VALUES ('350', '2', '2', '1', 'caller', '');
INSERT INTO `tbl_privileges` VALUES ('351', '2', '2', '1', 'callergroup', '');
INSERT INTO `tbl_privileges` VALUES ('352', '2', '2', '1', 'callermngt', '');
INSERT INTO `tbl_privileges` VALUES ('353', '2', '2', '1', 'audio', '');
INSERT INTO `tbl_privileges` VALUES ('354', '2', '2', '1', 'calltask', '');
INSERT INTO `tbl_privileges` VALUES ('355', '2', '2', '1', 'sipterm', '');
INSERT INTO `tbl_privileges` VALUES ('356', '2', '2', '1', 'didnumber', '');
INSERT INTO `tbl_privileges` VALUES ('357', '2', '2', '1', 'blacklist', '');
INSERT INTO `tbl_privileges` VALUES ('358', '2', '2', '1', 'rolemng', '');
INSERT INTO `tbl_privileges` VALUES ('359', '2', '2', '1', 'bulletin', '');
INSERT INTO `tbl_privileges` VALUES ('360', '2', '2', '1', 'customfield', '');
INSERT INTO `tbl_privileges` VALUES ('361', '2', '2', '1', 'customtype', '');
INSERT INTO `tbl_privileges` VALUES ('362', '2', '2', '1', 'advice', '');
INSERT INTO `tbl_privileges` VALUES ('363', '2', '2', '1', 'modifypassword', '');
INSERT INTO `tbl_privileges` VALUES ('364', '2', '2', '1', 'agentmonitor', '');
INSERT INTO `tbl_privileges` VALUES ('365', '2', '2', '1', 'calltaskmngt', '');
INSERT INTO `tbl_privileges` VALUES ('366', '2', '2', '1', 'remit', '0,2');
INSERT INTO `tbl_privileges` VALUES ('367', '2', '2', '1', 'currentaccount', '0,2');
INSERT INTO `tbl_privileges` VALUES ('368', '2', '2', '1', 'consumestat', '0,2');
INSERT INTO `tbl_privileges` VALUES ('369', '2', '2', '1', 'rechargestat', '0,2');
INSERT INTO `tbl_privileges` VALUES ('370', '2', '2', '1', 'reportagent', '');
INSERT INTO `tbl_privileges` VALUES ('371', '2', '2', '1', 'reportagentgrp', '');
INSERT INTO `tbl_privileges` VALUES ('372', '2', '2', '1', 'statcustomertraffic', '');
INSERT INTO `tbl_privileges` VALUES ('373', '2', '2', '1', 'stattasktraffic', '');
INSERT INTO `tbl_privileges` VALUES ('374', '2', '2', '1', 'reportmarkercount', '');
INSERT INTO `tbl_privileges` VALUES ('375', '2', '2', '1', 'searchcalltask', '');
INSERT INTO `tbl_privileges` VALUES ('376', '2', '2', '1', 'searchtalk', '');
INSERT INTO `tbl_privileges` VALUES ('377', '2', '2', '1', 'searchsnd', '');
INSERT INTO `tbl_privileges` VALUES ('378', '2', '2', '1', 'oplog', '');
INSERT INTO `tbl_privileges` VALUES ('379', '2', '10', '2', 'calleenumber', '');
INSERT INTO `tbl_privileges` VALUES ('380', '2', '11', '2', 'calleenumber', '');
INSERT INTO `tbl_privileges` VALUES ('381', '3', '0', '0', 'clientinfo', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('382', '3', '0', '0', 'group', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('383', '3', '0', '0', 'agent', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('384', '3', '0', '0', 'callee', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('385', '3', '0', '0', 'caller', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('386', '3', '0', '0', 'callergroup', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('387', '3', '0', '0', 'callermngt', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('388', '3', '0', '0', 'audio', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('389', '3', '0', '0', 'calltask', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('390', '3', '0', '0', 'sipterm', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('391', '3', '0', '0', 'didnumber', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('392', '3', '0', '0', 'blacklist', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('393', '3', '0', '0', 'rolemng', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('394', '3', '0', '0', 'bulletin', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('395', '3', '0', '0', 'customfield', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('396', '3', '0', '0', 'customtype', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('397', '3', '0', '0', 'advice', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('398', '3', '0', '0', 'modifypassword', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('399', '3', '0', '0', 'agentmonitor', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('400', '3', '0', '0', 'calltaskmngt', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('401', '3', '0', '0', 'remit', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('402', '3', '0', '0', 'currentaccount', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('403', '3', '0', '0', 'consumestat', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('404', '3', '0', '0', 'rechargestat', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('405', '3', '0', '0', 'reportagent', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('406', '3', '0', '0', 'reportagentgrp', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('407', '3', '0', '0', 'statcustomertraffic', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('408', '3', '0', '0', 'stattasktraffic', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('409', '3', '0', '0', 'reportmarkercount', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('410', '3', '0', '0', 'searchcalltask', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('411', '3', '0', '0', 'searchtalk', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('412', '3', '0', '0', 'searchsnd', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('413', '3', '0', '0', 'oplog', '12,13,14,11,10');
INSERT INTO `tbl_privileges` VALUES ('414', '3', '0', '1', 'clientinfo', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('415', '3', '0', '1', 'group', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('416', '3', '0', '1', 'agent', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('417', '3', '0', '1', 'callee', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('418', '3', '0', '1', 'caller', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('419', '3', '0', '1', 'callergroup', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('420', '3', '0', '1', 'callermngt', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('421', '3', '0', '1', 'audio', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('422', '3', '0', '1', 'calltask', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('423', '3', '0', '1', 'sipterm', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('424', '3', '0', '1', 'didnumber', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('425', '3', '0', '1', 'blacklist', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('426', '3', '0', '1', 'rolemng', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('427', '3', '0', '1', 'bulletin', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('428', '3', '0', '1', 'customfield', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('429', '3', '0', '1', 'customtype', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('430', '3', '0', '1', 'advice', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('431', '3', '0', '1', 'modifypassword', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('432', '3', '0', '1', 'agentmonitor', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('433', '3', '0', '1', 'calltaskmngt', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('434', '3', '0', '1', 'remit', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('435', '3', '0', '1', 'currentaccount', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('436', '3', '0', '1', 'consumestat', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('437', '3', '0', '1', 'rechargestat', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('438', '3', '0', '1', 'reportagent', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('439', '3', '0', '1', 'reportagentgrp', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('440', '3', '0', '1', 'statcustomertraffic', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('441', '3', '0', '1', 'stattasktraffic', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('442', '3', '0', '1', 'reportmarkercount', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('443', '3', '0', '1', 'searchcalltask', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('444', '3', '0', '1', 'searchtalk', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('445', '3', '0', '1', 'searchsnd', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('446', '3', '0', '1', 'oplog', '0,1,2,3');
INSERT INTO `tbl_privileges` VALUES ('447', '3', '1', '0', 'clientinfo', '');
INSERT INTO `tbl_privileges` VALUES ('448', '3', '1', '0', 'group', '');
INSERT INTO `tbl_privileges` VALUES ('449', '3', '1', '0', 'agent', '');
INSERT INTO `tbl_privileges` VALUES ('450', '3', '1', '0', 'callee', '');
INSERT INTO `tbl_privileges` VALUES ('451', '3', '1', '0', 'caller', '');
INSERT INTO `tbl_privileges` VALUES ('452', '3', '1', '0', 'callergroup', '');
INSERT INTO `tbl_privileges` VALUES ('453', '3', '1', '0', 'callermngt', '');
INSERT INTO `tbl_privileges` VALUES ('454', '3', '1', '0', 'audio', '');
INSERT INTO `tbl_privileges` VALUES ('455', '3', '1', '0', 'calltask', '');
INSERT INTO `tbl_privileges` VALUES ('456', '3', '1', '0', 'sipterm', '');
INSERT INTO `tbl_privileges` VALUES ('457', '3', '1', '0', 'didnumber', '');
INSERT INTO `tbl_privileges` VALUES ('458', '3', '1', '0', 'blacklist', '');
INSERT INTO `tbl_privileges` VALUES ('459', '3', '1', '0', 'rolemng', '');
INSERT INTO `tbl_privileges` VALUES ('460', '3', '1', '0', 'bulletin', '');
INSERT INTO `tbl_privileges` VALUES ('461', '3', '1', '0', 'customfield', '');
INSERT INTO `tbl_privileges` VALUES ('462', '3', '1', '0', 'customtype', '');
INSERT INTO `tbl_privileges` VALUES ('463', '3', '1', '0', 'advice', '');
INSERT INTO `tbl_privileges` VALUES ('464', '3', '1', '0', 'modifypassword', '');
INSERT INTO `tbl_privileges` VALUES ('465', '3', '1', '0', 'agentmonitor', '');
INSERT INTO `tbl_privileges` VALUES ('466', '3', '1', '0', 'calltaskmngt', '');
INSERT INTO `tbl_privileges` VALUES ('467', '3', '1', '0', 'remit', '');
INSERT INTO `tbl_privileges` VALUES ('468', '3', '1', '0', 'currentaccount', '');
INSERT INTO `tbl_privileges` VALUES ('469', '3', '1', '0', 'consumestat', '');
INSERT INTO `tbl_privileges` VALUES ('470', '3', '1', '0', 'rechargestat', '');
INSERT INTO `tbl_privileges` VALUES ('471', '3', '1', '0', 'reportagent', '10,13');
INSERT INTO `tbl_privileges` VALUES ('472', '3', '1', '0', 'reportagentgrp', '10,13');
INSERT INTO `tbl_privileges` VALUES ('473', '3', '1', '0', 'statcustomertraffic', '');
INSERT INTO `tbl_privileges` VALUES ('474', '3', '1', '0', 'stattasktraffic', '10,13');
INSERT INTO `tbl_privileges` VALUES ('475', '3', '1', '0', 'reportmarkercount', '10,13');
INSERT INTO `tbl_privileges` VALUES ('476', '3', '1', '0', 'searchcalltask', '10,13');
INSERT INTO `tbl_privileges` VALUES ('477', '3', '1', '0', 'searchtalk', '10,13');
INSERT INTO `tbl_privileges` VALUES ('478', '3', '1', '0', 'searchsnd', '10,13');
INSERT INTO `tbl_privileges` VALUES ('479', '3', '1', '0', 'oplog', '');
INSERT INTO `tbl_privileges` VALUES ('480', '3', '1', '1', 'clientinfo', '');
INSERT INTO `tbl_privileges` VALUES ('481', '3', '1', '1', 'group', '');
INSERT INTO `tbl_privileges` VALUES ('482', '3', '1', '1', 'agent', '');
INSERT INTO `tbl_privileges` VALUES ('483', '3', '1', '1', 'callee', '');
INSERT INTO `tbl_privileges` VALUES ('484', '3', '1', '1', 'caller', '');
INSERT INTO `tbl_privileges` VALUES ('485', '3', '1', '1', 'callergroup', '');
INSERT INTO `tbl_privileges` VALUES ('486', '3', '1', '1', 'callermngt', '');
INSERT INTO `tbl_privileges` VALUES ('487', '3', '1', '1', 'audio', '');
INSERT INTO `tbl_privileges` VALUES ('488', '3', '1', '1', 'calltask', '');
INSERT INTO `tbl_privileges` VALUES ('489', '3', '1', '1', 'sipterm', '');
INSERT INTO `tbl_privileges` VALUES ('490', '3', '1', '1', 'didnumber', '');
INSERT INTO `tbl_privileges` VALUES ('491', '3', '1', '1', 'blacklist', '');
INSERT INTO `tbl_privileges` VALUES ('492', '3', '1', '1', 'rolemng', '');
INSERT INTO `tbl_privileges` VALUES ('493', '3', '1', '1', 'bulletin', '');
INSERT INTO `tbl_privileges` VALUES ('494', '3', '1', '1', 'customfield', '');
INSERT INTO `tbl_privileges` VALUES ('495', '3', '1', '1', 'customtype', '');
INSERT INTO `tbl_privileges` VALUES ('496', '3', '1', '1', 'advice', '');
INSERT INTO `tbl_privileges` VALUES ('497', '3', '1', '1', 'modifypassword', '');
INSERT INTO `tbl_privileges` VALUES ('498', '3', '1', '1', 'agentmonitor', '');
INSERT INTO `tbl_privileges` VALUES ('499', '3', '1', '1', 'calltaskmngt', '');
INSERT INTO `tbl_privileges` VALUES ('500', '3', '1', '1', 'remit', '');
INSERT INTO `tbl_privileges` VALUES ('501', '3', '1', '1', 'currentaccount', '');
INSERT INTO `tbl_privileges` VALUES ('502', '3', '1', '1', 'consumestat', '');
INSERT INTO `tbl_privileges` VALUES ('503', '3', '1', '1', 'rechargestat', '');
INSERT INTO `tbl_privileges` VALUES ('504', '3', '1', '1', 'reportagent', '0');
INSERT INTO `tbl_privileges` VALUES ('505', '3', '1', '1', 'reportagentgrp', '0');
INSERT INTO `tbl_privileges` VALUES ('506', '3', '1', '1', 'statcustomertraffic', '');
INSERT INTO `tbl_privileges` VALUES ('507', '3', '1', '1', 'stattasktraffic', '0');
INSERT INTO `tbl_privileges` VALUES ('508', '3', '1', '1', 'reportmarkercount', '0');
INSERT INTO `tbl_privileges` VALUES ('509', '3', '1', '1', 'searchcalltask', '0');
INSERT INTO `tbl_privileges` VALUES ('510', '3', '1', '1', 'searchtalk', '0');
INSERT INTO `tbl_privileges` VALUES ('511', '3', '1', '1', 'searchsnd', '0');
INSERT INTO `tbl_privileges` VALUES ('512', '3', '1', '1', 'oplog', '');
INSERT INTO `tbl_privileges` VALUES ('513', '3', '2', '0', 'clientinfo', '');
INSERT INTO `tbl_privileges` VALUES ('514', '3', '2', '0', 'group', '');
INSERT INTO `tbl_privileges` VALUES ('515', '3', '2', '0', 'agent', '');
INSERT INTO `tbl_privileges` VALUES ('516', '3', '2', '0', 'callee', '');
INSERT INTO `tbl_privileges` VALUES ('517', '3', '2', '0', 'caller', '');
INSERT INTO `tbl_privileges` VALUES ('518', '3', '2', '0', 'callergroup', '');
INSERT INTO `tbl_privileges` VALUES ('519', '3', '2', '0', 'callermngt', '');
INSERT INTO `tbl_privileges` VALUES ('520', '3', '2', '0', 'audio', '');
INSERT INTO `tbl_privileges` VALUES ('521', '3', '2', '0', 'calltask', '');
INSERT INTO `tbl_privileges` VALUES ('522', '3', '2', '0', 'sipterm', '');
INSERT INTO `tbl_privileges` VALUES ('523', '3', '2', '0', 'didnumber', '');
INSERT INTO `tbl_privileges` VALUES ('524', '3', '2', '0', 'blacklist', '');
INSERT INTO `tbl_privileges` VALUES ('525', '3', '2', '0', 'rolemng', '');
INSERT INTO `tbl_privileges` VALUES ('526', '3', '2', '0', 'bulletin', '');
INSERT INTO `tbl_privileges` VALUES ('527', '3', '2', '0', 'customfield', '');
INSERT INTO `tbl_privileges` VALUES ('528', '3', '2', '0', 'customtype', '');
INSERT INTO `tbl_privileges` VALUES ('529', '3', '2', '0', 'advice', '');
INSERT INTO `tbl_privileges` VALUES ('530', '3', '2', '0', 'modifypassword', '');
INSERT INTO `tbl_privileges` VALUES ('531', '3', '2', '0', 'agentmonitor', '');
INSERT INTO `tbl_privileges` VALUES ('532', '3', '2', '0', 'calltaskmngt', '');
INSERT INTO `tbl_privileges` VALUES ('533', '3', '2', '0', 'remit', '10');
INSERT INTO `tbl_privileges` VALUES ('534', '3', '2', '0', 'currentaccount', '10');
INSERT INTO `tbl_privileges` VALUES ('535', '3', '2', '0', 'consumestat', '10');
INSERT INTO `tbl_privileges` VALUES ('536', '3', '2', '0', 'rechargestat', '10');
INSERT INTO `tbl_privileges` VALUES ('537', '3', '2', '0', 'reportagent', '');
INSERT INTO `tbl_privileges` VALUES ('538', '3', '2', '0', 'reportagentgrp', '');
INSERT INTO `tbl_privileges` VALUES ('539', '3', '2', '0', 'statcustomertraffic', '');
INSERT INTO `tbl_privileges` VALUES ('540', '3', '2', '0', 'stattasktraffic', '');
INSERT INTO `tbl_privileges` VALUES ('541', '3', '2', '0', 'reportmarkercount', '');
INSERT INTO `tbl_privileges` VALUES ('542', '3', '2', '0', 'searchcalltask', '');
INSERT INTO `tbl_privileges` VALUES ('543', '3', '2', '0', 'searchtalk', '');
INSERT INTO `tbl_privileges` VALUES ('544', '3', '2', '0', 'searchsnd', '');
INSERT INTO `tbl_privileges` VALUES ('545', '3', '2', '0', 'oplog', '');
INSERT INTO `tbl_privileges` VALUES ('546', '3', '2', '1', 'clientinfo', '');
INSERT INTO `tbl_privileges` VALUES ('547', '3', '2', '1', 'group', '');
INSERT INTO `tbl_privileges` VALUES ('548', '3', '2', '1', 'agent', '');
INSERT INTO `tbl_privileges` VALUES ('549', '3', '2', '1', 'callee', '');
INSERT INTO `tbl_privileges` VALUES ('550', '3', '2', '1', 'caller', '');
INSERT INTO `tbl_privileges` VALUES ('551', '3', '2', '1', 'callergroup', '');
INSERT INTO `tbl_privileges` VALUES ('552', '3', '2', '1', 'callermngt', '');
INSERT INTO `tbl_privileges` VALUES ('553', '3', '2', '1', 'audio', '');
INSERT INTO `tbl_privileges` VALUES ('554', '3', '2', '1', 'calltask', '');
INSERT INTO `tbl_privileges` VALUES ('555', '3', '2', '1', 'sipterm', '');
INSERT INTO `tbl_privileges` VALUES ('556', '3', '2', '1', 'didnumber', '');
INSERT INTO `tbl_privileges` VALUES ('557', '3', '2', '1', 'blacklist', '');
INSERT INTO `tbl_privileges` VALUES ('558', '3', '2', '1', 'rolemng', '');
INSERT INTO `tbl_privileges` VALUES ('559', '3', '2', '1', 'bulletin', '');
INSERT INTO `tbl_privileges` VALUES ('560', '3', '2', '1', 'customfield', '');
INSERT INTO `tbl_privileges` VALUES ('561', '3', '2', '1', 'customtype', '');
INSERT INTO `tbl_privileges` VALUES ('562', '3', '2', '1', 'advice', '');
INSERT INTO `tbl_privileges` VALUES ('563', '3', '2', '1', 'modifypassword', '');
INSERT INTO `tbl_privileges` VALUES ('564', '3', '2', '1', 'agentmonitor', '');
INSERT INTO `tbl_privileges` VALUES ('565', '3', '2', '1', 'calltaskmngt', '');
INSERT INTO `tbl_privileges` VALUES ('566', '3', '2', '1', 'remit', '0,2');
INSERT INTO `tbl_privileges` VALUES ('567', '3', '2', '1', 'currentaccount', '0,2');
INSERT INTO `tbl_privileges` VALUES ('568', '3', '2', '1', 'consumestat', '0,2');
INSERT INTO `tbl_privileges` VALUES ('569', '3', '2', '1', 'rechargestat', '0,2');
INSERT INTO `tbl_privileges` VALUES ('570', '3', '2', '1', 'reportagent', '');
INSERT INTO `tbl_privileges` VALUES ('571', '3', '2', '1', 'reportagentgrp', '');
INSERT INTO `tbl_privileges` VALUES ('572', '3', '2', '1', 'statcustomertraffic', '');
INSERT INTO `tbl_privileges` VALUES ('573', '3', '2', '1', 'stattasktraffic', '');
INSERT INTO `tbl_privileges` VALUES ('574', '3', '2', '1', 'reportmarkercount', '');
INSERT INTO `tbl_privileges` VALUES ('575', '3', '2', '1', 'searchcalltask', '');
INSERT INTO `tbl_privileges` VALUES ('576', '3', '2', '1', 'searchtalk', '');
INSERT INTO `tbl_privileges` VALUES ('577', '3', '2', '1', 'searchsnd', '');
INSERT INTO `tbl_privileges` VALUES ('578', '3', '2', '1', 'oplog', '');
INSERT INTO `tbl_privileges` VALUES ('579', '3', '10', '2', 'calleenumber', '');
INSERT INTO `tbl_privileges` VALUES ('580', '3', '11', '2', 'calleenumber', '');

-- ----------------------------
-- Table structure for tbl_recharge
-- ----------------------------
DROP TABLE IF EXISTS `tbl_recharge`;
CREATE TABLE `tbl_recharge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `account_id` int(10) unsigned NOT NULL,
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  `money` bigint(20) unsigned NOT NULL,
  `operator_id` int(10) unsigned NOT NULL,
  `verify_status` tinyint(4) unsigned NOT NULL,
  `reject_reason` tinytext,
  `note` tinytext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_recharge
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_remit
-- ----------------------------
DROP TABLE IF EXISTS `tbl_remit`;
CREATE TABLE `tbl_remit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `account_id` int(10) unsigned NOT NULL,
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  `money` bigint(20) unsigned NOT NULL,
  `peer_account_id` int(10) unsigned NOT NULL,
  `operator_id` int(10) unsigned NOT NULL,
  `verify_status` tinyint(4) unsigned NOT NULL,
  `reject_reason` tinytext,
  `note` tinytext,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `account_id` (`account_id`),
  KEY `ctime` (`ctime`),
  KEY `peer_account_id` (`peer_account_id`),
  KEY `operator_id` (`operator_id`),
  KEY `verify_status` (`verify_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_remit
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_route
-- ----------------------------
DROP TABLE IF EXISTS `tbl_route`;
CREATE TABLE `tbl_route` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(90) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `caller_prefix` char(45) DEFAULT '',
  `callee_prefix` char(45) DEFAULT '',
  `dest_type` tinyint(4) unsigned NOT NULL,
  `dest_id` varchar(200) NOT NULL,
  `status` tinyint(4) unsigned DEFAULT NULL,
  `seq` int(10) unsigned DEFAULT NULL,
  `id_name` text,
  `call_out_group` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dest_type` (`dest_type`),
  KEY `dest_id` (`dest_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_route
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_sensitive
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sensitive`;
CREATE TABLE `tbl_sensitive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_sensitive
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_sip
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sip`;
CREATE TABLE `tbl_sip` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `extension` varchar(96) DEFAULT NULL,
  `dispname` varchar(96) DEFAULT NULL,
  `userid` varchar(96) NOT NULL,
  `authname` varchar(96) NOT NULL,
  `auth_password` varchar(96) NOT NULL,
  `status` tinyint(4) unsigned NOT NULL,
  `public_net` int(10) unsigned DEFAULT NULL,
  `private_net` int(10) unsigned DEFAULT NULL,
  `private_port` int(10) unsigned DEFAULT NULL,
  `register` tinyint(4) unsigned DEFAULT NULL,
  `assign_status` tinyint(4) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_sip
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_sipassign
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sipassign`;
CREATE TABLE `tbl_sipassign` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `did_number` varchar(96) DEFAULT NULL,
  `bind_type` tinyint(4) unsigned NOT NULL,
  `bind_id` int(10) unsigned NOT NULL,
  `status` tinyint(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `status` (`status`),
  KEY `bind_type` (`bind_type`),
  KEY `bind_id` (`bind_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_sipassign
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_sms
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sms`;
CREATE TABLE `tbl_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `contact_id` int(10) unsigned NOT NULL,
  `send_time` int(10) unsigned NOT NULL,
  `title` tinytext,
  `content` text,
  `dst_number` varchar(45) NOT NULL,
  `status` tinyint(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `contact_id` (`contact_id`),
  KEY `send_time` (`send_time`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_sms
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_stat_account
-- ----------------------------
DROP TABLE IF EXISTS `tbl_stat_account`;
CREATE TABLE `tbl_stat_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `ctime` int(10) unsigned NOT NULL,
  `profit` int(11) NOT NULL,
  `outband_fee` int(11) NOT NULL,
  `Inband_fee` int(11) NOT NULL,
  `autodialing_fee` int(11) NOT NULL,
  `preview_fee` int(11) NOT NULL,
  `predictive_fee` int(11) NOT NULL,
  `record_fee` int(11) NOT NULL,
  `conference_fee` int(11) NOT NULL,
  `sms_fee` int(11) NOT NULL,
  `mms_fee` int(11) NOT NULL,
  `rent_fee` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `type` (`type`),
  KEY `ctime` (`ctime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_stat_account
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_stat_agents
-- ----------------------------
DROP TABLE IF EXISTS `tbl_stat_agents`;
CREATE TABLE `tbl_stat_agents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctime` int(10) unsigned NOT NULL,
  `type` tinyint(4) unsigned NOT NULL,
  `bid` int(10) unsigned DEFAULT NULL,
  `job_number` varchar(90) DEFAULT NULL,
  `group_id` int(10) unsigned DEFAULT NULL,
  `calls` int(10) unsigned DEFAULT '0',
  `calls_connected` int(10) unsigned DEFAULT '0',
  `total_duration` int(10) unsigned DEFAULT '0',
  `online_time` int(10) unsigned DEFAULT '0',
  `avg_call_duration` int(10) unsigned DEFAULT '0',
  `avg_calls` int(10) unsigned DEFAULT '0',
  `avg_online_time` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_stat_agents
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_stat_amount
-- ----------------------------
DROP TABLE IF EXISTS `tbl_stat_amount`;
CREATE TABLE `tbl_stat_amount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL,
  `bname` varchar(90) NOT NULL,
  `bid` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `ctime` int(10) unsigned NOT NULL,
  `amount` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_stat_amount
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_stat_caller
-- ----------------------------
DROP TABLE IF EXISTS `tbl_stat_caller`;
CREATE TABLE `tbl_stat_caller` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `caller` varchar(50) NOT NULL,
  `ctime` int(10) unsigned NOT NULL,
  `times` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_stat_caller
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_stat_hangup
-- ----------------------------
DROP TABLE IF EXISTS `tbl_stat_hangup`;
CREATE TABLE `tbl_stat_hangup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL,
  `hangup_cause` int(10) unsigned NOT NULL,
  `calls` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_stat_hangup
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_stat_inband
-- ----------------------------
DROP TABLE IF EXISTS `tbl_stat_inband`;
CREATE TABLE `tbl_stat_inband` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hold_cnt` int(10) unsigned NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `type` tinyint(4) unsigned NOT NULL,
  `ctime` int(10) unsigned NOT NULL,
  `call_cnt` int(10) unsigned NOT NULL,
  `ring_cnt` int(10) unsigned NOT NULL,
  `busy_cnt` int(10) unsigned NOT NULL,
  `noanswer_cnt` int(10) unsigned NOT NULL,
  `early_release_cnt` int(10) unsigned NOT NULL,
  `answer_cnt` int(10) unsigned NOT NULL,
  `conn_agent_cnt` int(10) unsigned NOT NULL,
  `agent_answer_cnt` int(10) unsigned NOT NULL,
  `answer_times` int(10) unsigned NOT NULL,
  `wait_agent_times` int(10) unsigned NOT NULL,
  `agent_answer_times` int(10) unsigned NOT NULL,
  `hold_times` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `type` (`type`),
  KEY `ctime` (`ctime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_stat_inband
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_stat_marker
-- ----------------------------
DROP TABLE IF EXISTS `tbl_stat_marker`;
CREATE TABLE `tbl_stat_marker` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctime` int(10) unsigned DEFAULT NULL,
  `cid` int(10) unsigned DEFAULT NULL,
  `agent_id` int(10) unsigned DEFAULT NULL,
  `job_number` char(10) DEFAULT NULL,
  `group1` int(10) unsigned DEFAULT NULL,
  `group2` int(10) unsigned DEFAULT NULL,
  `marker0` int(10) unsigned DEFAULT NULL,
  `marker1` int(10) unsigned DEFAULT NULL,
  `marker2` int(10) unsigned DEFAULT NULL,
  `marker3` int(10) unsigned DEFAULT NULL,
  `marker4` int(10) unsigned DEFAULT NULL,
  `marker5` int(10) unsigned DEFAULT NULL,
  `marker6` int(10) unsigned DEFAULT NULL,
  `marker7` int(10) unsigned DEFAULT NULL,
  `marker8` int(10) unsigned DEFAULT NULL,
  `marker9` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ctime` (`ctime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_stat_marker
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_stat_msg
-- ----------------------------
DROP TABLE IF EXISTS `tbl_stat_msg`;
CREATE TABLE `tbl_stat_msg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned DEFAULT NULL,
  `type` tinyint(4) unsigned DEFAULT NULL,
  `ctime` int(10) unsigned DEFAULT NULL,
  `send_cnt` int(10) unsigned DEFAULT NULL,
  `recv_cnt` int(10) unsigned DEFAULT NULL,
  `send_succ_cnt` int(10) unsigned DEFAULT NULL,
  `send_fail_cnt` int(10) unsigned DEFAULT NULL,
  `send_len` int(10) unsigned DEFAULT NULL,
  `recv_len` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `type` (`type`),
  KEY `ctime` (`ctime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_stat_msg
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_stat_operation_data
-- ----------------------------
DROP TABLE IF EXISTS `tbl_stat_operation_data`;
CREATE TABLE `tbl_stat_operation_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned DEFAULT NULL,
  `type` int(10) unsigned DEFAULT NULL,
  `resource` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_stat_operation_data
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_stat_outband
-- ----------------------------
DROP TABLE IF EXISTS `tbl_stat_outband`;
CREATE TABLE `tbl_stat_outband` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned DEFAULT NULL,
  `type` tinyint(4) unsigned DEFAULT NULL,
  `ctime` int(10) unsigned DEFAULT NULL,
  `call_cnt` int(10) unsigned DEFAULT NULL,
  `ring_cnt` int(10) unsigned DEFAULT NULL,
  `busy_cnt` int(10) unsigned DEFAULT NULL,
  `notexist_cnt` int(10) unsigned DEFAULT NULL,
  `noanswer_cnt` int(10) unsigned DEFAULT NULL,
  `reject_cnt` int(10) unsigned DEFAULT NULL,
  `early_release_cnt` int(10) unsigned DEFAULT NULL,
  `answer_cnt` int(10) unsigned DEFAULT NULL,
  `pdd` int(10) unsigned DEFAULT NULL,
  `answer_times` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `type` (`type`),
  KEY `ctime` (`ctime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_stat_outband
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_stat_outdialing
-- ----------------------------
DROP TABLE IF EXISTS `tbl_stat_outdialing`;
CREATE TABLE `tbl_stat_outdialing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned DEFAULT NULL,
  `type` tinyint(4) unsigned DEFAULT NULL,
  `ctime` int(10) unsigned DEFAULT NULL,
  `call_cnt` int(10) unsigned DEFAULT NULL,
  `ring_cnt` int(10) unsigned DEFAULT NULL,
  `busy_cnt` int(10) unsigned DEFAULT NULL,
  `notexist_cnt` int(10) unsigned DEFAULT NULL,
  `noanswer_cnt` int(10) unsigned DEFAULT NULL,
  `reject_cnt` int(10) unsigned DEFAULT NULL,
  `early_release_cnt` int(10) unsigned DEFAULT NULL,
  `answer_cnt` int(10) unsigned DEFAULT NULL,
  `conn_agent_cnt` int(10) unsigned DEFAULT NULL,
  `agent_answer_cnt` int(10) unsigned DEFAULT NULL,
  `pdd` int(10) unsigned DEFAULT NULL,
  `answer_times` int(10) unsigned DEFAULT NULL,
  `wait_agent_times` int(10) unsigned DEFAULT NULL,
  `agent_answer_times` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `type` (`type`),
  KEY `ctime` (`ctime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_stat_outdialing
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_stat_traffic
-- ----------------------------
DROP TABLE IF EXISTS `tbl_stat_traffic`;
CREATE TABLE `tbl_stat_traffic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calls` int(10) unsigned DEFAULT NULL,
  `ctime` int(10) unsigned DEFAULT NULL,
  `type` int(10) unsigned DEFAULT NULL,
  `bid` int(10) unsigned DEFAULT NULL,
  `bname` char(90) DEFAULT NULL,
  `cost` int(10) unsigned DEFAULT NULL,
  `calls_connected` int(10) unsigned DEFAULT NULL,
  `avg_access_time` int(10) unsigned DEFAULT NULL,
  `avg_call_duration` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_stat_traffic
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_suggest
-- ----------------------------
DROP TABLE IF EXISTS `tbl_suggest`;
CREATE TABLE `tbl_suggest` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `contact_id` int(10) unsigned DEFAULT NULL,
  `submit_time` int(10) unsigned DEFAULT '0',
  `type` tinyint(4) unsigned DEFAULT NULL,
  `comment` text,
  `status` tinyint(4) unsigned DEFAULT NULL,
  `deal_time` int(10) unsigned DEFAULT '0',
  `result` tinytext,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `contact_id` (`contact_id`),
  KEY `submit_time` (`submit_time`),
  KEY `type` (`type`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_suggest
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_userconf
-- ----------------------------
DROP TABLE IF EXISTS `tbl_userconf`;
CREATE TABLE `tbl_userconf` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product` text,
  `connect_us` text,
  `ip_add` text,
  `problem` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_userconf
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_worknote
-- ----------------------------
DROP TABLE IF EXISTS `tbl_worknote`;
CREATE TABLE `tbl_worknote` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext,
  `ctime` int(11) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `type` int(10) DEFAULT NULL,
  `contact_id` int(4) DEFAULT NULL,
  `customer_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_worknote
-- ----------------------------
INSERT INTO `tbl_worknote` VALUES ('00000000002', '配置文件', '范德萨发的多是，会计师的联发科家分店。两款发动机莲富大厦就考虑到。范德萨发的多是，会计师的联发科家分店。两款发动机莲富大厦就考虑到。范德萨发的多是，会计师的联发科家分店。两款发动机莲富大厦就考虑到。范德萨发的多是，会计师的联发科家分店。两款发动机莲富大厦就考虑到。范德萨发的多是，会计师的联发科家分店。两款发动机莲富大厦就考虑到。范德萨发的多是，会计师的联发科家分店。两款发动机莲富大厦就考虑到。范德萨发的多是，会计师的联发科家分店。两款发动机莲富大厦就考虑到。范德萨发的多是，会计师的联发科家分店。两款发动机 maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\" maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\" maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\" maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\" maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\" maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\" maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\" maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\" maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\" maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\" maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\" maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\" maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\" maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\" maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\" maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\" maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\" maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\" maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\" maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\" maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\" maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\" maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\" maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\" maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\" maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\" maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\" maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\" maxlength=\"&lt;?php echo MAX_TINYTEXT_LENGTH; ?&gt;\"', '1481043525', '肖然', '2', '1', '1');
INSERT INTO `tbl_worknote` VALUES ('00000000003', 'mnt挂载方法', 'mount -t cifs -o username=Administrator,password=stone.123 //192.168.1.222/mnt_ipcc/ /var/www/html\nyum install cifs-utils -y  //安装工具', '1481046793', 'stone', '5', '1', '1');

-- ----------------------------
-- Table structure for tmp_tbl_bsmodify
-- ----------------------------
DROP TABLE IF EXISTS `tmp_tbl_bsmodify`;
CREATE TABLE `tmp_tbl_bsmodify` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `json_fields` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MEMORY AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tmp_tbl_bsmodify
-- ----------------------------
INSERT INTO `tmp_tbl_bsmodify` VALUES ('1', '2016-12-06 20:43:27', '{\"name\":\"stone\",\"customer_id\":\"1\",\"note\":\"\\u3002\\u3002\\u3002\",\"ctime\":1481028207,\"table\":\"tbl_billing_rate\",\"id\":1,\"dboperate\":\"insert\"}');
INSERT INTO `tmp_tbl_bsmodify` VALUES ('2', '2016-12-06 20:45:20', '{\"billing_package_id\":1,\"minimum_balance\":10000,\"balance_warning\":10000,\"remind\":1,\"status\":1,\"expiry_type\":0,\"note\":\"\\u65e0\",\"call_out_group\":1,\"name\":\"stone\",\"parent_id\":\"1\",\"balance\":0,\"pub_mark\":0,\"type\":0,\"del_mark\":0,\"ctime\":1481028320,\"table\":\"tbl_customer\",\"id\":2,\"dboperate\":\"insert\"}');
INSERT INTO `tmp_tbl_bsmodify` VALUES ('3', '2016-12-06 20:47:22', '{\"billing_package_id\":1,\"minimum_balance\":10000,\"balance_warning\":10000,\"remind\":1,\"status\":1,\"expiry_type\":0,\"note\":\"\\u65e0\",\"call_out_group\":1,\"expiry\":1480953600,\"table\":\"tbl_customer\",\"where\":{\"name\":\"stone\",\"type\":0,\"id\":2},\"dboperate\":\"update\"}');
INSERT INTO `tmp_tbl_bsmodify` VALUES ('4', '2016-12-06 21:34:27', '{\"billing_package_id\":null,\"minimum_balance\":0,\"balance_warning\":0,\"remind\":null,\"status\":null,\"expiry_type\":null,\"note\":\"fdf\",\"call_out_group\":0,\"name\":\"\\u4f5b\\u6321\\u6740\\u4f5b\\u5730\\u65b9\\u7684\",\"parent_id\":\"1\",\"balance\":0,\"pub_mark\":0,\"type\":0,\"del_mark\":0,\"ctime\":1481031267,\"table\":\"tbl_customer\",\"id\":3,\"dboperate\":\"insert\"}');

-- ----------------------------
-- Table structure for tmp_tbl_fsmodify
-- ----------------------------
DROP TABLE IF EXISTS `tmp_tbl_fsmodify`;
CREATE TABLE `tmp_tbl_fsmodify` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `json_fields` varchar(1024) NOT NULL,
  `fs_related` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tmp_tbl_fsmodify
-- ----------------------------
INSERT INTO `tmp_tbl_fsmodify` VALUES ('1', '2016-12-06 20:45:20', 'customer?action=add&customer_id=2', '0');
INSERT INTO `tmp_tbl_fsmodify` VALUES ('2', '2016-12-06 20:47:22', 'customer?action=update&customer_id=2', '0');
INSERT INTO `tmp_tbl_fsmodify` VALUES ('3', '2016-12-06 21:34:27', 'customer?action=add&customer_id=3', '0');
INSERT INTO `tmp_tbl_fsmodify` VALUES ('4', '2016-12-06 23:58:22', 'eix?action=add&eix_id=1', '0');
INSERT INTO `tmp_tbl_fsmodify` VALUES ('5', '2016-12-07 00:22:32', 'eix?action=add&eix_id=2', '0');
INSERT INTO `tmp_tbl_fsmodify` VALUES ('6', '2016-12-07 00:34:22', 'eix?action=update&eix_id=2', '0');
INSERT INTO `tmp_tbl_fsmodify` VALUES ('7', '2016-12-07 00:34:28', 'eix?action=update&eix_id=2', '0');
INSERT INTO `tmp_tbl_fsmodify` VALUES ('8', '2016-12-07 00:57:18', 'eix?action=update&eix_id=2', '0');
INSERT INTO `tmp_tbl_fsmodify` VALUES ('9', '2016-12-07 00:58:45', 'eix?action=update&eix_id=2', '0');
INSERT INTO `tmp_tbl_fsmodify` VALUES ('10', '2016-12-07 00:59:54', 'eix?action=delete&eix_id=00000000001', '0');
INSERT INTO `tmp_tbl_fsmodify` VALUES ('11', '2016-12-07 01:00:31', 'eix?action=delete&eix_id=00000000001', '0');
INSERT INTO `tmp_tbl_fsmodify` VALUES ('12', '2016-12-07 01:53:13', 'eix?action=add&eix_id=3', '0');

-- ----------------------------
-- Procedure structure for proc_stat_agentgrp
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_stat_agentgrp`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_stat_agentgrp`(IN startTime INT, IN iTimeLength INT)
BEGIN
  DECLARE iStartTime INT(11);
  DECLARE iEndTime INT(11);
  DECLARE iGroupID INT(11);
  DECLARE strGroupName CHAR(100);
  DECLARE iTotalCalls INT(11);
  DECLARE iConnectedCalls INT(11);
  DECLARE iTotalDuration BIGINT;
  DECLARE iTotalOnlineTime BIGINT;
  DECLARE iAvgDuration INT(11);
  DECLARE iDone  INT(11);
  DECLARE iAgentCnt INT(11);
  DECLARE iCurrentStatID INT(11);
  DECLARE iAvgCalls, iAvgOnline INT(11);
  DECLARE cursorGroup CURSOR FOR SELECT id,name FROM tbl_group;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET iDone=1;

  -- 确定开始时间和结束时间
  SET iStartTime = startTime;
  SET iEndTime = iStartTime + iTimeLength;

  OPEN cursorGroup;
  loop_label: LOOP
  BEGIN
    SET iDone=0;
    FETCH cursorGroup INTO iGroupID, strGroupName;
    IF iDone = 1 THEN
      LEAVE loop_label;
    END IF;

    -- 获取当前班组的坐席数量
    SELECT COUNT(id) INTO iAgentCnt FROM tbl_agent WHERE tbl_agent.group1_id = iGroupID OR tbl_agent.group2_id = iGroupID;

    -- 获取统计值
    SELECT IFNULL(SUM(calls), 0) INTO iTotalCalls FROM tbl_stat_agents WHERE group_id=iGroupID AND type=0 AND ctime>iStartTime AND ctime<=iEndTime;
    SELECT IFNULL(SUM(calls_connected), 0) INTO iConnectedCalls FROM tbl_stat_agents WHERE group_id=iGroupID AND type=0 AND ctime>iStartTime AND ctime<=iEndTime;
    SELECT IFNULL(SUM(total_duration), 0) INTO iTotalDuration FROM tbl_stat_agents WHERE group_id=iGroupID AND type=0 AND ctime>iStartTime AND ctime<=iEndTime;
    SELECT IFNULL(SUM(online_time), 0) INTO iTotalOnlineTime FROM tbl_stat_agents WHERE group_id=iGroupID AND type=0 AND ctime>iStartTime AND ctime<=iEndTime;
    SELECT IFNULL(AVG(avg_call_duration), 0) INTO iAvgDuration FROM tbl_stat_agents WHERE group_id=iGroupID AND type=0 AND ctime>iStartTime AND ctime<=iEndTime;

    IF iTotalOnlineTime <> 0 THEN
      SET iAvgOnline = iTotalOnlineTime / iAgentCnt;
    ELSE
      SET iAvgOnline = 0;
    END IF;

    IF iConnectedCalls <> 0 THEN
      SET iAvgCalls = iConnectedCalls / iAgentCnt;
    ELSE 
      SET iAvgCalls = 0;
    END IF;
    
    -- 写入数据库
    INSERT INTO 
      tbl_stat_agents(ctime, type, bid, job_number, group_id, calls, calls_connected, total_duration, avg_call_duration, avg_calls, avg_online_time)
    VALUES (
      iEndTime, 1, iGroupID, strGroupName, iGroupID, iTotalCalls, iConnectedCalls, iTotalDuration, iAvgDuration, iAvgCalls, iAvgOnline);

  END;
  END LOOP;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_stat_customer_amount
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_stat_customer_amount`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_stat_customer_amount`(IN startTime INT, IN iTimeLength INT)
BEGIN
  -- 统计客户消费
  DECLARE iCID INT(11);
  DECLARE iPID INT(11);
  DECLARE strName CHAR(100);
  DECLARE iCIDType INT(11);
  DECLARE iDone  INT(11);
  DECLARE iStartTime INT(11);
  DECLARE iEndTime INT(11);
  DECLARE iTotalRecharge BIGINT;
  DECLARE iTotalDeduction BIGINT;
  DECLARE iTotalGetRebate BIGINT;
  DECLARE customerCursor CURSOR FOR SELECT id, name, type, parent_id FROM tbl_customer;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET iDone=1;
  SET iDone=0;

  SET iStartTime = startTime;
  SET iEndTime = iStartTime + iTimeLength;

  OPEN customerCursor;
  loop_label: LOOP
  BEGIN
    SET iDone = 0;
    FETCH customerCursor INTO iCID, strName, iCIDType, iPID;
    IF iDone = 1 THEN
      LEAVE loop_label;
    END IF;

    SET iTotalDeduction = 0;
    SET iTotalRecharge = 0;
    SET iTotalGetRebate = 0;
    IF iCIDType = 0 THEN
      -- 企业客户获取扣费信息和转入
      SELECT SUM(money) INTO iTotalDeduction FROM tbl_cdr_account WHERE customer_id=iCID AND operator_id=2 AND ctime>iStartTime AND ctime<=iEndTime;
      SELECT SUM(money) INTO iTotalRecharge FROM tbl_cdr_account WHERE customer_id=iCID AND operator_id=3 AND ctime>iStartTime AND ctime<=iEndTime;

      SET iTotalDeduction = IFNULL(iTotalDeduction, 0);
      SET iTotalRecharge = IFNULL(iTotalRecharge, 0);

      INSERT INTO tbl_stat_amount(type, bid, ctime, amount, bname, pid) VALUES(2, iCID, iEndTime, iTotalDeduction, strName, iPID);
      INSERT INTO tbl_stat_amount(type, bid, ctime, amount, bname, pid) VALUES(3, iCID, iEndTime, iTotalRecharge, strName, iPID);
    ELSEIF iCIDType = 1 THEN
      -- 代理商客户，统计返点和转入
      SELECT SUM(money) INTO iTotalRecharge FROM tbl_cdr_account WHERE customer_id=iCID AND operator_id=3 AND ctime>iStartTime AND ctime<=iEndTime;
      SELECT SUM(money) INTO iTotalGetRebate FROM tbl_cdr_account WHERE customer_id=iCID AND operator_id=5 AND ctime>iStartTime AND ctime<=iEndTime;
      
      SET iTotalGetRebate = IFNULL(iTotalGetRebate, 0);
      SET iTotalRecharge = IFNULL(iTotalRecharge, 0);
      
      INSERT INTO tbl_stat_amount(type, bid, ctime, amount, bname, pid) VALUES(3, iCID, iEndTime, iTotalRecharge, strName, iPID);
      INSERT INTO tbl_stat_amount(type, bid, ctime, amount, bname, pid) VALUES(1, iCID, iEndTime, iTotalGetRebate, strName, iPID);
    ELSEIF iCIDType = 2 THEN
      -- 运营商统计转入
      SELECT SUM(money) INTO iTotalRecharge FROM tbl_cdr_account WHERE customer_id=iCID AND operator_id=3 AND ctime>iStartTime AND ctime<=iEndTime;

      SET iTotalRecharge = IFNULL(iTotalRecharge, 0);
      INSERT INTO tbl_stat_amount(type, bid, ctime, amount, bname, pid) VALUES(3, iCID, iEndTime, iTotalRecharge, strName, iPID);
    END IF;

  END;
  END LOOP;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_stat_customer_traffic
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_stat_customer_traffic`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_stat_customer_traffic`(IN startTime INT, IN iTimeLength INT)
BEGIN
  DECLARE iStartTime INT(11);
  DECLARE iEndTime INT(11);
  DECLARE iCustomerID INT(11);
  DECLARE iCustomerType INT(11);
  DECLARE strCustomerName CHAR(100);
  DECLARE iTotalCalls INT(11);
  DECLARE iConnectedCalls INT(11);
  DECLARE iTotalCost BIGINT;
  DECLARE iAvgDuration BIGINT;
  DECLARE iAvgPDDlen INT(11);
  DECLARE iDone  INT(11);
  DECLARE iCurrentStatID INT(11);
  DECLARE iType INT(11) DEFAULT 0;
  DECLARE cursorCustomer CURSOR FOR SELECT id,name,type FROM tbl_customer;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET iDone=1;

  SET iStartTime = startTime;
  SET iEndTime = iStartTime + iTimeLength;
  
  OPEN cursorCustomer;
  loop_label: LOOP
  BEGIN
    SET iDone = 0;
    FETCH cursorCustomer INTO iCustomerID, strCustomerName, iCustomerType;
    IF iDone = 1 THEN
      LEAVE loop_label;
    END IF;

    -- 只有企业客户才需要处理
    IF iCustomerType = 0 THEN
      SELECT IFNULL(COUNT(id), 0) INTO iTotalCalls FROM tbl_cdr_voice WHERE iCustomerID=user_id AND ring_times>iStartTime AND ring_times<=iEndTime;
      SELECT IFNULL(SUM(fee_l1), 0) INTO iTotalCost FROM tbl_cdr_voice WHERE iCustomerID=task_id AND ring_times>iStartTime AND ring_times<=iEndTime;
      SELECT IFNULL(COUNT(id), 0) INTO iConnectedCalls FROM tbl_cdr_voice WHERE iCustomerID=user_id AND ring_times>iStartTime AND ring_times<=iEndTime AND terminate_cause=0;
      SELECT IFNULL(AVG(time_len), 0) INTO iAvgDuration FROM tbl_cdr_voice WHERE iCustomerID=user_id AND ring_times>iStartTime AND ring_times<=iEndTime AND terminate_cause=0;
      SELECT IFNULL(AVG(pdd_len), 0) INTO iAvgPDDlen FROM tbl_cdr_voice WHERE iCustomerID=user_id AND ring_times>iStartTime AND ring_times<=iEndTime;

      SELECT IFNULL(MAX(id), 0) INTO iCurrentStatID FROM tbl_stat_traffic;
      SET iCurrentStatID = iCurrentStatID + 1;

	  -- 插入新数据
      INSERT INTO tbl_stat_traffic VALUES(iCurrentStatID, iTotalCalls, iEndTime, iType, iCustomerID, strCustomerName, iTotalCost, iConnectedCalls, iAvgPDDlen, iAvgDuration);

      -- 统计各种挂断原因
      INSERT INTO tbl_stat_hangup (SELECT NULL, iCurrentStatID, terminate_cause, COUNT(id) FROM tbl_cdr_voice WHERE iCustomerID=user_id AND ring_times>iStartTime AND ring_times<=iEndTime GROUP BY terminate_cause);
    END IF;    

  END;
  END LOOP;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_stat_marker
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_stat_marker`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_stat_marker`()
BEGIN
  DECLARE iCID       INT(11);
  DECLARE iAgentID   INT(11);
  DECLARE iGroup1ID  INT(11);
  DECLARE iGroup2ID  INT(11);
  DECLARE strJobNum  CHAR(20);
  DECLARE iMarker0   INT(11);
  DECLARE iMarker1   INT(11);
  DECLARE iMarker2   INT(11);
  DECLARE iMarker3   INT(11);
  DECLARE iMarker4   INT(11);
  DECLARE iMarker5   INT(11);
  DECLARE iMarker6   INT(11);
  DECLARE iMarker7   INT(11);
  DECLARE iMarker8   INT(11);
  DECLARE iMarker9   INT(11);
  DECLARE iDone      INT(11);
  DECLARE iAgentCnt  INT(11);
  DECLARE cursorAgent CURSOR FOR SELECT id,customer_id,job_number,group1_id,group2_id FROM tbl_agent;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET iDone=1;

  OPEN cursorAgent;
loop_label: LOOP
  BEGIN
    SET iDone=0;
    FETCH cursorAgent INTO iAgentID, iCID, strJobNum, iGroup1ID, iGroup2ID;
    IF iDone = 1 THEN
      LEAVE loop_label;
    END IF;

    SELECT IFNULL(COUNT(id), 0) INTO iMarker0 FROM tbl_corpclients WHERE tbl_corpclients.agent_id=iAgentID AND type=0;
		SELECT IFNULL(COUNT(id), 0) INTO iMarker1 FROM tbl_corpclients WHERE tbl_corpclients.agent_id=iAgentID AND type=1;
		SELECT IFNULL(COUNT(id), 0) INTO iMarker2 FROM tbl_corpclients WHERE tbl_corpclients.agent_id=iAgentID AND type=2;
		SELECT IFNULL(COUNT(id), 0) INTO iMarker3 FROM tbl_corpclients WHERE tbl_corpclients.agent_id=iAgentID AND type=3;
		SELECT IFNULL(COUNT(id), 0) INTO iMarker4 FROM tbl_corpclients WHERE tbl_corpclients.agent_id=iAgentID AND type=4;
		SELECT IFNULL(COUNT(id), 0) INTO iMarker5 FROM tbl_corpclients WHERE tbl_corpclients.agent_id=iAgentID AND type=5;
		SELECT IFNULL(COUNT(id), 0) INTO iMarker6 FROM tbl_corpclients WHERE tbl_corpclients.agent_id=iAgentID AND type=6;
		SELECT IFNULL(COUNT(id), 0) INTO iMarker7 FROM tbl_corpclients WHERE tbl_corpclients.agent_id=iAgentID AND type=7;
		SELECT IFNULL(COUNT(id), 0) INTO iMarker8 FROM tbl_corpclients WHERE tbl_corpclients.agent_id=iAgentID AND type=8;
		SELECT IFNULL(COUNT(id), 0) INTO iMarker9 FROM tbl_corpclients WHERE tbl_corpclients.agent_id=iAgentID AND type=9;

    SELECT IFNULL(COUNT(id), 0) INTO iAgentCnt FROM tbl_stat_marker WHERE agent_id = iAgentID;
    IF iAgentCnt=0 THEN
      INSERT INTO 
				tbl_stat_marker(id, ctime, cid, agent_id, job_number, group1, group2, marker0, marker1, marker2, marker3, marker4, marker5, marker6, marker7, marker8, marker9)
      VALUES
				(NULL, UNIX_TIMESTAMP(NOW()), iCID, iAgentID, strJobNum, iGroup1ID, iGroup2ID, iMarker0, iMarker1, iMarker2, iMarker3, iMarker4, iMarker5, iMarker6, iMarker7, iMarker8, iMarker9); 
    ELSE
      UPDATE 
				tbl_stat_marker
			SET
				group1 = iGroup1ID, 
				group2 = iGroup2ID, 
				marker0 = iMarker0, 
				marker1 = iMarker1, 
				marker2 = iMarker2, 
				marker3 = iMarker3, 
				marker4 = iMarker4, 
				marker5 = iMarker5, 
				marker6 = iMarker6, 
				marker7 = iMarker7, 
				marker8 = iMarker8, 
				marker9 = iMarker9
			WHERE agent_id = iCID;
    END IF;

  END;
  END LOOP;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_stat_operation_data
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_stat_operation_data`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_stat_operation_data`()
BEGIN

  DECLARE iCID         INT(11) DEFAULT 0;
  DECLARE iCType       INT(11) DEFAULT 0;
  
  DECLARE iDIDCnt      INT(11) DEFAULT 0;
  DECLARE iSIPCnt      INT(11) DEFAULT 0;
  DECLARE iCustomerCnt INT(11) DEFAULT 0;
  DECLARE iAgentCnt    INT(11) DEFAULT 0;
  DECLARE iDone        INT(11) DEFAULT 0;
  DECLARE iTmp         INT(11) DEFAULT 0;
  DECLARE customerCursor CURSOR FOR SELECT id, type FROM tbl_customer;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET iDone=1;

  SET iDone=0;
  
  OPEN customerCursor;
  loop_label: LOOP
  BEGIN
    SET iDone = 0;
    FETCH customerCursor INTO iCID, iCType;
    IF iDone = 1 THEN
      LEAVE loop_label;
    END IF;
    
    -- 运营商
    IF iCType = 2 THEN
    BEGIN
      SELECT IFNULL(COUNT(id), 0) INTO iAgentCnt FROM tbl_agent;
      SELECT IFNULL(COUNT(id), 0) INTO iCustomerCnt FROM tbl_customer;
      SELECT IFNULL(COUNT(id), 0) INTO iSIPCnt FROM tbl_sip;
      SELECT IFNULL(COUNT(id), 0) INTO iDIDCnt FROM tbl_sipassign;
    END;
    ELSEIF iCType = 1 THEN
    BEGIN
      SET iAgentCnt = 0;
      SELECT IFNULL(COUNT(id), 0) INTO iCustomerCnt FROM tbl_customer WHERE parent_id = iCID;
      SELECT IFNULL(COUNT(id), 0) INTO iSIPCnt FROM tbl_sip WHERE customer_id = iCID;
      SELECT IFNULL(COUNT(id), 0) INTO iDIDCnt FROM tbl_sipassign WHERE customer_id = iCID;
    END;
    ELSEIF iCType = 0 THEN
    BEGIN
      SET iCustomerCnt = 0;
      SELECT IFNULL(COUNT(id), 0) INTO iAgentCnt FROM tbl_agent WHERE customer_id = iCID;
      SELECT IFNULL(COUNT(id), 0) INTO iSIPCnt FROM tbl_sip WHERE customer_id = iCID;
      SELECT IFNULL(COUNT(id), 0) INTO iDIDCnt FROM tbl_sipassign WHERE customer_id = iCID;
    END;
    END IF;
    
    -- 如果记录不存在就需要创建
    SELECT IFNULL(COUNT(id), 0) INTO iTmp FROM tbl_stat_operation_data WHERE type=1 AND cid=iCID;
    IF iTmp = 0 THEN
      INSERT INTO tbl_stat_operation_data(cid, type, resource) VALUES (iCID, 1, 0);
    END IF;

    SELECT IFNULL(COUNT(id), 0) INTO iTmp FROM tbl_stat_operation_data WHERE type=2 AND cid=iCID;
    IF iTmp = 0 THEN
      INSERT INTO tbl_stat_operation_data(cid, type, resource) VALUES (iCID, 2, 0);
    END IF;

    SELECT IFNULL(COUNT(id), 0) INTO iTmp FROM tbl_stat_operation_data WHERE type=3 AND cid=iCID;
    IF iTmp = 0 THEN
      INSERT INTO tbl_stat_operation_data(cid, type, resource) VALUES (iCID, 3, 0);
    END IF;

    SELECT IFNULL(COUNT(id), 0) INTO iTmp FROM tbl_stat_operation_data WHERE type=4 AND cid=iCID;
    IF iTmp = 0 THEN
      INSERT INTO tbl_stat_operation_data(cid, type, resource) VALUES (iCID, 4, 0);
    END IF;

    -- 更新各项值
    UPDATE tbl_stat_operation_data SET resource=iSIPCnt WHERE type=1 AND cid=iCID;   
    UPDATE tbl_stat_operation_data SET resource=iDIDCnt WHERE type=2 AND cid=iCID;
    UPDATE tbl_stat_operation_data SET resource=iCustomerCnt WHERE type=3 AND cid=iCID;
    UPDATE tbl_stat_operation_data SET resource=iAgentCnt WHERE type=4 AND cid=iCID;

  END;
  END LOOP;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_stat_task_traffic
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_stat_task_traffic`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_stat_task_traffic`(IN startTime INT, IN iTimeLength INT)
BEGIN
  DECLARE iStartTime INT(11);
  DECLARE iEndTime INT(11);
  DECLARE iTaskID INT(11);
  DECLARE strTaskName CHAR(100);
  DECLARE iTotalCalls INT(11);
  DECLARE iConnectedCalls INT(11);
  DECLARE iTotalCost INT(15);
  DECLARE iAvgDuration INT(15);
  DECLARE iAvgPDDlen INT(11);
  DECLARE iDone  INT(11);
  DECLARE iCurrentStatID INT(11);
  DECLARE iType INT(11) DEFAULT 2;
  DECLARE cursorCustomer CURSOR FOR SELECT id,task_name FROM tbl_calltask;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET iDone=1;

  SET iStartTime = startTime;
  SET iEndTime = iStartTime + iTimeLength;

  OPEN cursorCustomer;
  loop_label: LOOP
  BEGIN
    SET iDone = 0;
    FETCH cursorCustomer INTO iTaskID, strTaskName;
    IF iDone = 1 THEN
      LEAVE loop_label;
    END IF;

    -- 只有企业客户才需要处理
  SELECT IFNULL(COUNT(id), 0) INTO iTotalCalls FROM tbl_cdr_voice WHERE iTaskID=user_id AND ring_times>iStartTime AND ring_times<=iEndTime;
  SELECT IFNULL(SUM(fee_l1), 0) INTO iTotalCost FROM tbl_cdr_voice WHERE iTaskID=task_id AND ring_times>iStartTime AND ring_times<=iEndTime;
  SELECT IFNULL(COUNT(id), 0) INTO iConnectedCalls FROM tbl_cdr_voice WHERE iTaskID=user_id AND ring_times>iStartTime AND ring_times<=iEndTime AND terminate_cause=0;
  SELECT IFNULL(AVG(time_len), 0) INTO iAvgDuration FROM tbl_cdr_voice WHERE iTaskID=user_id AND ring_times>iStartTime AND ring_times<=iEndTime AND terminate_cause=0;
  SELECT IFNULL(AVG(pdd_len), 0) INTO iAvgPDDlen FROM tbl_cdr_voice WHERE iTaskID=user_id AND ring_times>iStartTime AND ring_times<=iEndTime;

  SELECT IFNULL(MAX(id), 0) INTO iCurrentStatID FROM tbl_stat_traffic;
  SET iCurrentStatID = iCurrentStatID + 1;

   -- 插入新数据
  INSERT INTO tbl_stat_traffic VALUES(iCurrentStatID, iTotalCalls, iEndTime, iType, iTaskID, strTaskName, iTotalCost, iConnectedCalls, iAvgPDDlen, iAvgDuration);

   -- 统计各种挂断原因
  INSERT INTO tbl_stat_hangup (SELECT NULL, iCurrentStatID, terminate_cause, COUNT(id) FROM tbl_cdr_voice WHERE iTaskID=task_id AND ring_times>iStartTime AND ring_times<=iEndTime GROUP BY terminate_cause);

  END;
  END LOOP;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_stat_trunk_consume
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_stat_trunk_consume`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_stat_trunk_consume`(IN startTime INT, IN iTimeLength INT)
BEGIN
  -- 统计中继消费相关数据
  DECLARE iGWID INT(11);
  DECLARE iGWName CHAR(100);
  DECLARE iDone  INT(11);
  DECLARE iStartTime INT(11);
  DECLARE iEndTime INT(11);
  DECLARE iTotalFee BIGINT;
  DECLARE gwCursor CURSOR FOR SELECT id, name FROM tbl_gateway;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET iDone=1;
  SET iDone=0;

  SET iStartTime = startTime;
  SET iEndTime = iStartTime + iTimeLength;

  OPEN gwCursor;
 loop_label: LOOP
  BEGIN
    -- 循环获取每一个网关的名字和ID
    SET iDone = 0;
    FETCH gwCursor INTO iGWID, iGWName;
    IF iDone = 1 THEN
      LEAVE loop_label;
    END IF;

    -- 统计
    SET iTotalFee = 0;
    SELECT IFNULL(SUM(fee), 0) INTO iTotalFee FROM tbl_cdr_settle WHERE peer_trunk_id=iGWID AND ctime>iStartTime AND ctime<=iEndTime;
    
    -- 添加新数据
    INSERT INTO tbl_stat_amount(type, bid, ctime,amount, bname, pid) VALUES(0, iGWID, iEndTime, iTotalFee, iGWName, 0);
  END;
  END LOOP;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proc_stat_trunk_traffic
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_stat_trunk_traffic`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_stat_trunk_traffic`(IN startTime INT, IN iTimeLength INT)
BEGIN
  DECLARE iStartTime INT(11);
  DECLARE iEndTime INT(11);
  DECLARE iTrunkID INT(11);
  DECLARE strTrunkName CHAR(100);
  DECLARE iTotalCalls INT(11);
  DECLARE iConnectedCalls INT(11);
  DECLARE iTotalCost INT(15);
  DECLARE iAvgDuration INT(15);
  DECLARE iAvgPDDlen INT(11);
  DECLARE iDone  INT(11);
  DECLARE iCurrentStatID INT(11);
  DECLARE iType INT(11) DEFAULT 1;
  DECLARE trunkCursor CURSOR FOR SELECT id,name FROM tbl_gateway;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET iDone=1;

  SET iStartTime = startTime;
  SET iEndTime = iStartTime + iTimeLength;
  
  OPEN trunkCursor;
 loop_label: LOOP
  BEGIN
    SET iDone = 0;
    FETCH trunkCursor INTO iTrunkID, strTrunkName;
    IF iDone = 1 THEN
      LEAVE loop_label;
    END IF;

    SELECT IFNULL(COUNT(id), 0) INTO iTotalCalls FROM tbl_cdr_settle WHERE iTrunkID=peer_trunk_id AND ctime>iStartTime AND ctime<=iEndTime;
    SELECT IFNULL(SUM(fee), 0) INTO iTotalCost FROM tbl_cdr_settle WHERE iTrunkID=peer_trunk_id AND ctime>iStartTime AND ctime<=iEndTime;
    SELECT IFNULL(COUNT(id), 0) INTO iConnectedCalls FROM tbl_cdr_settle WHERE iTrunkID=peer_trunk_id AND ctime>iStartTime AND ctime<=iEndTime AND terminate_cause=0;
    SELECT IFNULL(AVG(deal_times), 0) INTO iAvgDuration FROM tbl_cdr_settle WHERE iTrunkID=peer_trunk_id AND ctime>iStartTime AND ctime<=iEndTime AND terminate_cause=0;
    SELECT IFNULL(AVG(pdd_len), 0) INTO iAvgPDDlen FROM tbl_cdr_voice WHERE cdr_mark IN (SELECT cdr_mark FROM tbl_cdr_settle WHERE iTrunkID=peer_trunk_id AND ctime>iStartTime AND ctime<=iEndTime);

    SELECT IFNULL(MAX(id), 0) INTO iCurrentStatID FROM tbl_stat_traffic;
    SET iCurrentStatID = iCurrentStatID + 1;

    -- 插入新数据
    INSERT INTO tbl_stat_traffic VALUES(iCurrentStatID, iTotalCalls, iEndTime, iType, iTrunkID, strTrunkName, iTotalCost, iConnectedCalls, iAvgPDDlen, iAvgDuration);

    -- 统计各种挂断原因
    INSERT INTO tbl_stat_hangup (SELECT NULL, iCurrentStatID, terminate_cause, COUNT(id) FROM tbl_cdr_settle WHERE iTrunkID=peer_trunk_id AND ctime>iStartTime AND ctime<=iEndTime GROUP BY tbl_cdr_settle.terminate_cause);

  END;
  END LOOP;
END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for event_stat_agent_grp
-- ----------------------------
DROP EVENT IF EXISTS `event_stat_agent_grp`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `event_stat_agent_grp` ON SCHEDULE EVERY 1 HOUR STARTS '2015-10-01 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN

DECLARE iCurrentTime INT(11);
DECLARE iInterval    INT(11);
DECLARE iLastTime    INT(11);

-- 时间间隔为一小时
SET iInterval = 60 * 60;

-- 获取当前时间
SET iCurrentTime = UNIX_TIMESTAMP(NOW());

-- 获取上一次统计的时间
SELECT IFNULL(MAX(ctime), 0) INTO iLastTime FROM tbl_stat_agents WHERE `type`=1;
IF iLastTime=0 THEN
  SELECT IFNULL(MIN(ctime), 0) INTO iLastTime FROM tbl_stat_agents WHERE `type`=0;
END IF;

SET iLastTime = iLastTime - MOD(iLastTime, iInterval);

-- 循环处理时间段内的所有统计消息
IF iLastTime <> 0 THEN
  WHILE iLastTime + iInterval <= iCurrentTime
  DO
    CALL proc_stat_agentgrp(iLastTime, iInterval);

    SET iLastTime = iLastTime + iInterval;
  END WHILE;
END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for event_stat_amount
-- ----------------------------
DROP EVENT IF EXISTS `event_stat_amount`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `event_stat_amount` ON SCHEDULE EVERY 2 HOUR STARTS '2015-10-01 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN

DECLARE iCurrentTime INT(11);
DECLARE iInterval    INT(11);
DECLARE iLastTime    INT(11);

-- 时间间隔为两个小时
SET iInterval = 60 * 60 * 2;

-- 获取当前时间
SET iCurrentTime = UNIX_TIMESTAMP(NOW());

-- 获取上一次统计的时间
SELECT IFNULL(MAX(ctime), 0) INTO iLastTime FROM tbl_stat_amount;
IF iLastTime = 0 THEN
  SELECT IFNULL(MIN(ctime), 0) INTO iLastTime FROM tbl_cdr_account;
END IF;

SET iLastTime = iLastTime - MOD(iLastTime, iInterval);

-- 循环处理时间段内的所有统计消息
IF iLastTime <> 0 THEN
  WHILE iLastTime + iInterval <= iCurrentTime
  DO
    CALL proc_stat_customer_amount(iLastTime, iInterval);
    CALL proc_stat_trunk_consume(iLastTime, iInterval);

    SET iLastTime = iLastTime + iInterval;
  END WHILE;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for event_stat_marker
-- ----------------------------
DROP EVENT IF EXISTS `event_stat_marker`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `event_stat_marker` ON SCHEDULE EVERY 1 DAY STARTS '2015-10-01 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
call proc_stat_marker();
END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for event_stat_operation_data
-- ----------------------------
DROP EVENT IF EXISTS `event_stat_operation_data`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `event_stat_operation_data` ON SCHEDULE EVERY 1 DAY STARTS '2015-10-01 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
CALL proc_stat_operation_data();
END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for event_stat_traffic
-- ----------------------------
DROP EVENT IF EXISTS `event_stat_traffic`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `event_stat_traffic` ON SCHEDULE EVERY 90 MINUTE STARTS '2015-10-01 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN

DECLARE iCurrentTime INT(11);
DECLARE iInterval    INT(11);
DECLARE iLastTime    INT(11);

-- 时间间隔为90分钟
SET iInterval = 90 * 60 ;

-- 获取当前时间
SET iCurrentTime = UNIX_TIMESTAMP(NOW());

-- 获取上一次统计的时间
SELECT IFNULL(MAX(ctime), 0) INTO iLastTime FROM tbl_stat_traffic;
IF iLastTime = 0 THEN
  SELECT IFNULL(MIN(start_time), 0) INTO iLastTime FROM tbl_cdr;
END IF;

SET iLastTime = iLastTime - MOD(iLastTime, iInterval);

-- 循环处理时间段内的所有统计消息
IF iLastTime <> 0 THEN
  WHILE iLastTime + iInterval <= iCurrentTime
  DO
    CALL proc_stat_customer_traffic(iLastTime, iInterval);
    CALL proc_stat_task_traffic(iLastTime, iInterval);
    CALL proc_stat_trunk_traffic(iLastTime, iInterval);

    SET iLastTime = iLastTime + iInterval;
  END WHILE;
END IF;
END
;;
DELIMITER ;
