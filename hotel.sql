/*
Navicat MySQL Data Transfer

Source Server         : myserver
Source Server Version : 50730
Source Host           : 192.168.80.131:3306
Source Database       : hotel

Target Server Type    : MYSQL
Target Server Version : 50730
File Encoding         : 65001

Date: 2020-06-16 15:39:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for checkin
-- ----------------------------
DROP TABLE IF EXISTS `checkin`;
CREATE TABLE `checkin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no` varchar(32) NOT NULL COMMENT '入住单号',
  `room_number` varchar(10) NOT NULL COMMENT '房号',
  `room_type_id` int(11) NOT NULL COMMENT '客房类型',
  `standard_price` decimal(11,2) NOT NULL COMMENT '标准价',
  `discount_price` decimal(11,2) NOT NULL COMMENT '折后价',
  `deposit` decimal(11,2) NOT NULL COMMENT '押金',
  `customer_name` varchar(50) NOT NULL COMMENT '入住人',
  `card_type` int(11) DEFAULT NULL COMMENT '1身份证2护照3军官证',
  `card_number` varchar(50) DEFAULT NULL COMMENT '证件号',
  `phone` varchar(20) NOT NULL COMMENT '联系电话',
  `arrive_time` datetime NOT NULL COMMENT '到店时间',
  `leave_time` datetime NOT NULL COMMENT '离店时间',
  `customer_size` int(11) NOT NULL COMMENT '入住人数',
  `user_id` int(11) NOT NULL COMMENT '操作员id',
  `customer_id` int(11) DEFAULT NULL COMMENT '会员编号',
  `customer_price` decimal(11,2) DEFAULT NULL COMMENT '会员价格',
  `breakfast_or_not` int(11) NOT NULL COMMENT '1提供 0不提供',
  `remind_or_not` int(11) NOT NULL COMMENT '1提供 0不提供',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入住登记';

-- ----------------------------
-- Records of checkin
-- ----------------------------

-- ----------------------------
-- Table structure for checkout
-- ----------------------------
DROP TABLE IF EXISTS `checkout`;
CREATE TABLE `checkout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no` varchar(32) NOT NULL COMMENT '入住单号',
  `discount_price` decimal(11,2) NOT NULL COMMENT '房价',
  `deposit` decimal(11,2) NOT NULL COMMENT '押金',
  `days` int(11) NOT NULL COMMENT '天数',
  `hotel_cost` decimal(11,2) NOT NULL COMMENT '住宿费',
  `shop_cost` decimal(11,2) DEFAULT NULL COMMENT '店内消费',
  `meal_cost` decimal(11,2) DEFAULT NULL COMMENT '餐费',
  `phone_cost` decimal(11,2) DEFAULT NULL COMMENT '电话费',
  `real_cost` decimal(11,2) NOT NULL COMMENT '实际应收',
  `re_deposit` decimal(11,2) NOT NULL COMMENT '应退押金',
  `payment_type` int(11) NOT NULL COMMENT '1现金2在线3刷卡',
  `received_money` decimal(11,2) NOT NULL COMMENT '实收',
  `changex` decimal(11,2) NOT NULL COMMENT '找零',
  `user_id` int(11) NOT NULL COMMENT '操作员id',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入住登记';

-- ----------------------------
-- Records of checkout
-- ----------------------------

-- ----------------------------
-- Table structure for consume
-- ----------------------------
DROP TABLE IF EXISTS `consume`;
CREATE TABLE `consume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no` varchar(32) NOT NULL COMMENT '入住单号',
  `room_number` varchar(5) NOT NULL COMMENT '房间号',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `number` int(11) NOT NULL COMMENT '数量',
  `goods_price` decimal(11,2) NOT NULL COMMENT '单价',
  `consume_money` decimal(11,2) NOT NULL COMMENT '消费金额',
  `discount_rate` decimal(11,2) NOT NULL COMMENT '折扣率',
  `discount_money` decimal(11,2) NOT NULL COMMENT '折后金额',
  `sum_money` decimal(11,2) NOT NULL COMMENT '合计',
  `user_id` int(11) NOT NULL COMMENT '操作员',
  `date` datetime NOT NULL COMMENT '消费时间',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消费信息';

-- ----------------------------
-- Records of consume
-- ----------------------------

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL COMMENT '会员名称',
  `sex` int(11) NOT NULL COMMENT '0-男,1-女',
  `tel` varchar(20) NOT NULL COMMENT '电话',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `integra` int(11) DEFAULT NULL COMMENT '积分',
  `level` int(11) NOT NULL COMMENT '等级',
  `last_ctime` date DEFAULT NULL COMMENT '最后一次入住时间',
  `last_rtime` date DEFAULT NULL COMMENT '最后一次预定时间',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of customer
-- ----------------------------

-- ----------------------------
-- Table structure for floor
-- ----------------------------
DROP TABLE IF EXISTS `floor`;
CREATE TABLE `floor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL COMMENT '楼层名称',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='楼层信息';

-- ----------------------------
-- Records of floor
-- ----------------------------

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL COMMENT '商品名称',
  `goods_type_id` int(11) NOT NULL COMMENT '商品类别id',
  `price` decimal(11,2) NOT NULL COMMENT '单价',
  `unit` varchar(5) NOT NULL COMMENT '单位',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品信息';

-- ----------------------------
-- Records of goods
-- ----------------------------

-- ----------------------------
-- Table structure for goods_type
-- ----------------------------
DROP TABLE IF EXISTS `goods_type`;
CREATE TABLE `goods_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL COMMENT '类别名称',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品类别';

-- ----------------------------
-- Records of goods_type
-- ----------------------------

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `operation` varchar(50) NOT NULL COMMENT '操作',
  `password` varchar(40) NOT NULL COMMENT '密码',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of log
-- ----------------------------

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_number` varchar(10) NOT NULL COMMENT '房号',
  `state` int(11) NOT NULL COMMENT '1入住 2空闲 3预定',
  `standard_price` decimal(11,2) NOT NULL COMMENT '标准价',
  `discount_price` decimal(11,2) NOT NULL COMMENT '折后价',
  `ncustomer_price` decimal(11,2) NOT NULL COMMENT '普通会员价',
  `vcustomer_price` decimal(11,2) NOT NULL COMMENT 'VIP会员价',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='房间信息';

-- ----------------------------
-- Records of room
-- ----------------------------

-- ----------------------------
-- Table structure for room_reserve
-- ----------------------------
DROP TABLE IF EXISTS `room_reserve`;
CREATE TABLE `room_reserve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no` varchar(32) NOT NULL COMMENT '预定单号',
  `room_number` varchar(10) NOT NULL COMMENT '房号',
  `room_type_id` int(11) NOT NULL COMMENT '客房类型',
  `standard_price` decimal(11,2) NOT NULL COMMENT '标准价',
  `discount_price` decimal(11,2) NOT NULL COMMENT '折后价',
  `deposit` decimal(11,2) NOT NULL COMMENT '押金',
  `customer_name` varchar(50) NOT NULL COMMENT '预订人',
  `card_type` int(11) DEFAULT NULL COMMENT '1身份证2护照3军官证',
  `card_number` varchar(50) DEFAULT NULL COMMENT '证件号',
  `phone` varchar(20) NOT NULL COMMENT '联系电话',
  `arrive_time` date NOT NULL COMMENT '到店时间',
  `leave_time` date NOT NULL COMMENT '离店时间',
  `customer_size` int(11) NOT NULL COMMENT '入住人数',
  `user_id` int(11) NOT NULL COMMENT '操作员id',
  `customer_id` int(11) DEFAULT NULL COMMENT '会员编号',
  `customer_price` decimal(11,2) DEFAULT NULL COMMENT '会员价格',
  `state` int(11) NOT NULL COMMENT '1正常,2已取消,3已入住',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客房预定信息';

-- ----------------------------
-- Records of room_reserve
-- ----------------------------

-- ----------------------------
-- Table structure for roomtype
-- ----------------------------
DROP TABLE IF EXISTS `roomtype`;
CREATE TABLE `roomtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL COMMENT '客房名称',
  `size` int(11) NOT NULL COMMENT '额定人数',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客房类型';

-- ----------------------------
-- Records of roomtype
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL COMMENT '登录名',
  `name` varchar(10) NOT NULL COMMENT '用户名称',
  `password` varchar(40) NOT NULL COMMENT '密码',
  `permissions` int(11) NOT NULL COMMENT '权限 1管理员 2经理 3前台',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
