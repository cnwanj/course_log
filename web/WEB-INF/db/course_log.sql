/*
Navicat MySQL Data Transfer

Source Server         : mysqlLocal
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : course_log

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2020-04-19 16:44:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_classes
-- ----------------------------
DROP TABLE IF EXISTS `sys_classes`;
CREATE TABLE `sys_classes` (
  `cla_id` varchar(30) COLLATE utf8_bin NOT NULL,
  `cla_name` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `dep_id` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `cla_major` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `cla_grade` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`cla_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_classes
-- ----------------------------
INSERT INTO `sys_classes` VALUES ('201701', '17软件工程1班', 'G01', '软件工程', '17级');
INSERT INTO `sys_classes` VALUES ('201702', '17软件工程2班', 'G01', '软件工程', '17级');
INSERT INTO `sys_classes` VALUES ('201703', '17软件工程3班', 'G01', '软件工程', '17级');

-- ----------------------------
-- Table structure for sys_course
-- ----------------------------
DROP TABLE IF EXISTS `sys_course`;
CREATE TABLE `sys_course` (
  `cou_id` varchar(30) COLLATE utf8_bin NOT NULL,
  `cou_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `tea_name` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `cou_year` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `cou_term` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`cou_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_course
-- ----------------------------
INSERT INTO `sys_course` VALUES ('1', '2', '3', '4', '5');
INSERT INTO `sys_course` VALUES ('1001A', 'javaEE', '许老师', '2019年', '第一学期');
INSERT INTO `sys_course` VALUES ('1002A', 'HTML5', '周老师', '2019年', '第一学期');
INSERT INTO `sys_course` VALUES ('1003A', '软件测试', '何老师', '2019年', '第一学期');
INSERT INTO `sys_course` VALUES ('3', '3', '3', '3', '33');

-- ----------------------------
-- Table structure for sys_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department` (
  `dep_id` varchar(20) COLLATE utf8_bin NOT NULL,
  `dep_name` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`dep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_department
-- ----------------------------
INSERT INTO `sys_department` VALUES ('G01', '大数据与软件工程学院');
INSERT INTO `sys_department` VALUES ('G02', '电信学院');
INSERT INTO `sys_department` VALUES ('G03', '商学院1');
INSERT INTO `sys_department` VALUES ('G04', '机械自动化学院');
INSERT INTO `sys_department` VALUES ('G05', '马克思学院');
INSERT INTO `sys_department` VALUES ('G06', '宝石与艺术学院');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `log_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `cla_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `log_arrive` int(11) DEFAULT NULL,
  `log_leave` int(11) DEFAULT NULL,
  `log_late` int(11) DEFAULT NULL,
  `log_absent` int(11) DEFAULT NULL,
  `log_date` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `log_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('20191224112501590', '201701', '11', '0', '0', '0', '2019-12-24 11:25:01', '11');
INSERT INTO `sys_log` VALUES ('20191224112622882', '201701', '8', '1', '1', '1', '2019-12-24 11:26:22', '11');
INSERT INTO `sys_log` VALUES ('20191224113519904', '201702', '4', '1', '2', '2', '2019-12-24 11:35:19', '9');
INSERT INTO `sys_log` VALUES ('20191224161547327', '201701', '5', '2', '2', '2', '2019-12-24 16:15:47', '11');
INSERT INTO `sys_log` VALUES ('20191224162532994', '201702', '2', '1', '1', '0', '2019-12-24 16:25:32', '4');
INSERT INTO `sys_log` VALUES ('20191224162607387', '201701', '5', '1', '3', '2', '2019-12-24 16:26:07', '11');
INSERT INTO `sys_log` VALUES ('20191224162641728', '201702', '3', '1', '1', '1', '2019-12-24 16:26:41', '6');
INSERT INTO `sys_log` VALUES ('20191225203944258', '201702', '6', '2', '1', '1', '2019-12-25 20:39:44', '10');
INSERT INTO `sys_log` VALUES ('20191225204030415', '201702', '3', '1', '2', '1', '2019-12-25 20:40:30', '7');
INSERT INTO `sys_log` VALUES ('20191226114239959', '201702', '8', '2', '1', '0', '2019-12-26 11:42:39', '11');
INSERT INTO `sys_log` VALUES ('20191226114340297', '201702', '5', '2', '0', '0', '2019-12-26 11:43:40', '7');

-- ----------------------------
-- Table structure for sys_student
-- ----------------------------
DROP TABLE IF EXISTS `sys_student`;
CREATE TABLE `sys_student` (
  `stu_id` varchar(30) COLLATE utf8_bin NOT NULL,
  `stu_name` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `stu_sex` int(3) DEFAULT NULL,
  `stu_address` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `stu_phone` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `cla_id` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `log_status` int(10) DEFAULT NULL,
  `log_arrive` int(60) DEFAULT NULL,
  `log_leave` int(60) DEFAULT NULL,
  `log_late` int(60) DEFAULT NULL,
  `log_absent` int(60) DEFAULT NULL,
  `log_date` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `stu_pwd` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`stu_id`),
  KEY `cla_id` (`cla_id`),
  CONSTRAINT `sys_student_ibfk_1` FOREIGN KEY (`cla_id`) REFERENCES `sys_classes` (`cla_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_student
-- ----------------------------
INSERT INTO `sys_student` VALUES ('20170101', '张三', '1', '梧州', '13888888888', '201701', null, '3', null, null, '1', '2019-12-24', '123456');
INSERT INTO `sys_student` VALUES ('20170102', '王五', '0', '梧州', '13888888888', '201701', null, '6', '3', '1', null, '2019-12-24', '123456');
INSERT INTO `sys_student` VALUES ('20170103', '蔡徐坤', '0', '江苏', '18999999999', '201701', null, '3', '2', '3', '1', '2019-12-24', '123456');
INSERT INTO `sys_student` VALUES ('20170104', '小沈阳', '1', '江苏', '18999999999', '201701', null, '4', '2', '2', '1', '2019-12-24', '123456');
INSERT INTO `sys_student` VALUES ('20170105', '宋小宝', '1', '中国', '13888888888', '201701', null, '4', '3', '3', null, '2019-12-24', '123456');
INSERT INTO `sys_student` VALUES ('20170106', '李四', '1', '中国', '13888888888', '201701', null, '8', '1', null, '1', '2019-12-24', '123456');
INSERT INTO `sys_student` VALUES ('20170107', '赵六', '0', '中国', '13888888888', '201701', null, '5', null, '2', '1', '2019-12-24', '123456');
INSERT INTO `sys_student` VALUES ('20170108', '吴亦凡', '1', '中国', '13888888888', '201701', null, '4', null, '3', '1', '2019-12-24', '123456');
INSERT INTO `sys_student` VALUES ('20170109', '刘思思', '0', '中国', '13888888888', '201701', null, '4', '3', null, '2', '2019-12-24', '123456');
INSERT INTO `sys_student` VALUES ('20170110', '张杰', '1', '中国', '13888888888', '201701', null, '4', '3', '2', '1', '2019-12-24', '123456');
INSERT INTO `sys_student` VALUES ('20170201', '王二', '1', '中国', '13888888888', '201702', null, '7', '1', '1', '1', '2019-12-26', '123456');
INSERT INTO `sys_student` VALUES ('20170202', '妲己', '0', '中国', '13888888888', '201702', null, '3', '5', null, '1', '2019-12-26', '123456');
INSERT INTO `sys_student` VALUES ('20170203', '亚瑟', '1', '中国', '13888888888', '201702', null, '5', '2', '2', '1', '2019-12-26', '123456');
INSERT INTO `sys_student` VALUES ('20170204', '鲁班', '1', '中国', '13888888888', '201702', null, '8', '1', '1', '1', '2019-12-26', '123456');
INSERT INTO `sys_student` VALUES ('20170205', '鹿晗', '0', '南宁', '13888888888', '201702', null, '13', '4', '5', '1', '2019-12-26', '123456');
INSERT INTO `sys_student` VALUES ('20170206', '吴彦祖', '1', '北京', '13555555555', '201702', null, '6', '2', '2', '1', '2019-12-26', '123456');
INSERT INTO `sys_student` VALUES ('20170207', '安倍', '1', '日本', '13888888888', '201702', null, '4', '2', '1', '1', '2019-12-26', '123456');
INSERT INTO `sys_student` VALUES ('20170208', '张小三', '0', '梧州', '13888888888', '201702', null, '4', '2', '1', null, '2019-12-26', '123456');
INSERT INTO `sys_student` VALUES ('20170209', '赵本山', '1', '南宁', '18777777777', '201702', null, '4', '2', '3', null, '2019-12-26', '123456');
INSERT INTO `sys_student` VALUES ('20170210', '张一山', '1', '中国', '13888888888', '201702', null, '2', '1', '1', null, '2019-12-26', '123456');
INSERT INTO `sys_student` VALUES ('20170222', '韦永恒', '1', '梧州', '13888888888', '201702', null, null, '2', null, null, '2019-12-26', '123456');
INSERT INTO `sys_student` VALUES ('20170301', '宋小宝10', '1', '中国', '13888888888', '201701', null, '3', '1', null, '1', '2019-12-24', '123456');

-- ----------------------------
-- Table structure for sys_teacher
-- ----------------------------
DROP TABLE IF EXISTS `sys_teacher`;
CREATE TABLE `sys_teacher` (
  `teaId` varchar(255) COLLATE utf8_bin NOT NULL,
  `teaName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `teaPwd` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `depId` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `teaPhone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `tea_tags` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`teaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_teacher
-- ----------------------------
INSERT INTO `sys_teacher` VALUES ('1001', '张三', '123', null, '18888888881', '0');
INSERT INTO `sys_teacher` VALUES ('2001', '许老师', '123', 'G1', '19999999999', '1');
INSERT INTO `sys_teacher` VALUES ('2002', '陶老师', '123', 'G1', '12222222222', '1');
INSERT INTO `sys_teacher` VALUES ('2003', '王老师', '123', 'G2', '13333333331', '1');
INSERT INTO `sys_teacher` VALUES ('2004', '张老师', '123', 'G1', '14444444444', '1');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` varchar(30) COLLATE utf8_bin NOT NULL,
  `user_name` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `user_pwd` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `user_phone` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1001', '张三', '123', '18888888888');
