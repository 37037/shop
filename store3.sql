/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50140
Source Host           : localhost:3306
Source Database       : store3

Target Server Type    : MYSQL
Target Server Version : 50140
File Encoding         : 65001

Date: 2020-06-02 17:46:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `acount` varchar(255) NOT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`acount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', 'admin');

-- ----------------------------
-- Table structure for adress
-- ----------------------------
DROP TABLE IF EXISTS `adress`;
CREATE TABLE `adress` (
  `aid` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `person` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aid`),
  KEY `username` (`username`),
  CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adress
-- ----------------------------
INSERT INTO `adress` VALUES ('180017bc57e0412397994c4e328943cf', 'uuuuuuuu', '13625674863', '安徽合肥', '李四');
INSERT INTO `adress` VALUES ('1b50fabeeec648faa423bfefc259c1aa', 'qqqqqqqq', '727089', '福建省-福州市-罗源县望江路10086号', '李四');
INSERT INTO `adress` VALUES ('1c26f1e371c14cb7a5903494d5777cc0', 'qwesadzz', '13625674863', '安徽合肥', '李四');
INSERT INTO `adress` VALUES ('636641cc254e4a8fbcdb0278e2e0fe8c', 'uuuuuuuu', '13625674863', '安徽合肥', '郑斌');
INSERT INTO `adress` VALUES ('a7d7f9c904b74e56b22cef7d29fe3704', 'qqqqqqqq', '13625674863', '北京市-北京市-西城区望江路10086号', '李四');
INSERT INTO `adress` VALUES ('fe2bfc31352f47bb970be84910913ebb', 'zczczczc', '13625674863', '天津市-天津市-和平区望江路10086号', '郑斌');

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `cid` varchar(255) NOT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `uid` (`uid`),
  KEY `pid` (`pid`),
  CONSTRAINT `pid` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` varchar(255) NOT NULL,
  `cname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('0e1f25091dcf4ba0987d25a97de2bc1f', '耳机');
INSERT INTO `category` VALUES ('39695da482e3415db70d3598986a868c', '食品');
INSERT INTO `category` VALUES ('77f21085100a4e44a64accece6355dd7', '平板');
INSERT INTO `category` VALUES ('7f05f3f99b29470a8100a489bcca1f4b', '电器');
INSERT INTO `category` VALUES ('b9cf8e58e6a64378a1b9e0803aaa6813', '运动器材');
INSERT INTO `category` VALUES ('cba3bdc65e4d49b7ae66233f140de906', '手机');
INSERT INTO `category` VALUES ('eecc8f5d591b40838b0ce2eb01b596e9', '笔记本电脑');
INSERT INTO `category` VALUES ('f193e108da1d4f499203cb5ef6189d83', '服饰');

-- ----------------------------
-- Table structure for goodscomments
-- ----------------------------
DROP TABLE IF EXISTS `goodscomments`;
CREATE TABLE `goodscomments` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `pid` varchar(255) NOT NULL,
  `anser` varchar(255) DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '0',
  `time` datetime NOT NULL,
  `grade` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`gid`),
  KEY `gusername` (`username`) USING BTREE,
  KEY `gpid` (`pid`) USING BTREE,
  CONSTRAINT `gpid` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gusername` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodscomments
-- ----------------------------
INSERT INTO `goodscomments` VALUES ('1', 'qqqqqqqq', '非常大', '85206a2cadbb43ce9147bef9269444f7', null, '0', '2020-05-16 07:36:29', '3');
INSERT INTO `goodscomments` VALUES ('2', 'qqqqqqqq', '非常好喝啊啊啊', '5ab431cfc95d4f90bb6eec1054905c50', null, '0', '2020-05-16 07:36:29', '2');
INSERT INTO `goodscomments` VALUES ('3', 'qqqqqqqq', '我很喜欢了', 'c0ac62d5693b4e849ae8973186c4777c', null, '0', '2020-05-16 07:36:29', '5');
INSERT INTO `goodscomments` VALUES ('4', 'qqqqqqqq', '充电宝非常好用', 'ab04326cea81445a913f576a388d9b5f', null, '0', '2020-05-16 07:36:29', '2');
INSERT INTO `goodscomments` VALUES ('5', 'qqqqqqqq', '一般', '90feb54beb0d4a70811a993de2b63e75', null, '0', '2020-05-16 07:36:29', '3');
INSERT INTO `goodscomments` VALUES ('6', 'qqqqqqqq', '不是太喜欢', '3a738be3cc0f4eee8b0d01d9172bbe55', '非常不好意思，咱家会再接再厉', '1', '2020-05-16 07:36:29', '4');
INSERT INTO `goodscomments` VALUES ('7', 'qqqqqqqq', '非常大', '112b6c2c94164a67aa6b7c745a4ccefc', null, '0', '2020-05-16 16:09:04', '1');
INSERT INTO `goodscomments` VALUES ('8', 'qqqqqqqq', '非常大', '112b6c2c94164a67aa6b7c745a4ccefc', '咱家会再接再厉', '1', '2020-05-16 20:05:20', '5');
INSERT INTO `goodscomments` VALUES ('9', 'qqqqqqqq', '非常好喝啊啊啊', '2d9e62b3fe3c4148a7c12d6c17ba3c69', null, '0', '2020-05-16 20:05:20', '3');
INSERT INTO `goodscomments` VALUES ('10', 'qqqqqqqq', '还不错', 'c0ac62d5693b4e849ae8973186c4777c', null, '0', '2020-05-20 13:11:03', '4');
INSERT INTO `goodscomments` VALUES ('11', 'qqqqqqqq', '非常舒服', 'cb8995589bcd4ada953dae56e07b86c6', '咱家会再接再厉', '1', '2020-05-22 10:51:00', '1');
INSERT INTO `goodscomments` VALUES ('12', 'qqqqqqqq', '不是太好用', 'ab04326cea81445a913f576a388d9b5f', '咱家会再接再厉', '1', '2020-05-22 10:51:00', '1');
INSERT INTO `goodscomments` VALUES ('13', 'qqqqqqqq', '质量貌似不大好', '43deee30c0fa43de91549fc33cc1339b', '咱家会再接再厉', '1', '2020-05-22 10:52:52', '4');
INSERT INTO `goodscomments` VALUES ('14', 'qqqqqqqq', '用得非常舒服', '0959da2ae1604b20b27b438dcb66d5c6', '咱家会再接再厉', '1', '2020-05-24 13:53:18', '4');
INSERT INTO `goodscomments` VALUES ('15', 'qqqqqqqq', '用得非常舒服', 'f0aaf2b5feed47fca67f9cbd176316ab', '咱家会再接再厉', '1', '2020-05-24 13:53:18', '3');
INSERT INTO `goodscomments` VALUES ('16', 'qqqqqqqq', '非常好喝a', '3a738be3cc0f4eee8b0d01d9172bbe55', null, '0', '2020-05-26 10:13:10', '5');
INSERT INTO `goodscomments` VALUES ('17', 'qqqqqqqq', '11', 'ab04326cea81445a913f576a388d9b5f', null, '0', '2020-05-26 10:13:10', '5');
INSERT INTO `goodscomments` VALUES ('18', 'qqqqqqqq', '11212', 'c0ac62d5693b4e849ae8973186c4777c', null, '0', '2020-05-26 10:13:10', '5');
INSERT INTO `goodscomments` VALUES ('19', 'zczczczc', '电量非常大', 'ab04326cea81445a913f576a388d9b5f', '咱家会再接再厉', '1', '2020-05-27 10:29:12', '3');
INSERT INTO `goodscomments` VALUES ('20', 'zczczczc', '非常好喝啊啊啊', '2d9e62b3fe3c4148a7c12d6c17ba3c69', null, '0', '2020-05-27 10:29:12', '3');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `nid` int(255) NOT NULL AUTO_INCREMENT,
  `notice` varchar(255) DEFAULT NULL,
  `time` date DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('15', '本系统晚上10点停止营业', '2020-05-01');
INSERT INTO `notice` VALUES ('16', '本系统周末不营业', '2020-05-03');
INSERT INTO `notice` VALUES ('19', '明天所有商品9折出售', '2020-05-03');
INSERT INTO `notice` VALUES ('20', '本商城周末不营业', '2020-05-24');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `itemid` varchar(255) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `oid` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  KEY `oid` (`oid`),
  KEY `pid1` (`pid`),
  CONSTRAINT `oid` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pid1` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('01f2dbd55082433a8d9f54c1539d85c5', '1', 'fa5e8a8891bb4cc78271cd0bff5fa340', '90feb54beb0d4a70811a993de2b63e75', '4623');
INSERT INTO `orderitem` VALUES ('033fceec66154ef2a24f9bd445b4ab54', '1', '5af1e63d9dc9456aadb1a71ebb591e2d', '43deee30c0fa43de91549fc33cc1339b', '1111');
INSERT INTO `orderitem` VALUES ('04c02ef923f247a0b109ea2158973832', '10', '06770eee9f9946e5b977bc4d13219d65', '3a738be3cc0f4eee8b0d01d9172bbe55', '2320');
INSERT INTO `orderitem` VALUES ('0584297cefde4fba8074703da76b5053', '1', 'c6f2410facd54d60874a1bde2e07d58f', 'ab04326cea81445a913f576a388d9b5f', '99');
INSERT INTO `orderitem` VALUES ('09b2b561d5db4c3f9c0f49fff2b4fab7', '1', '6d60de51483d4168be674a165d5e0160', '2d9e62b3fe3c4148a7c12d6c17ba3c69', '232');
INSERT INTO `orderitem` VALUES ('0c0865ed37e643068a5d24bc30f472eb', '3', '06770eee9f9946e5b977bc4d13219d65', 'c0ac62d5693b4e849ae8973186c4777c', '23331');
INSERT INTO `orderitem` VALUES ('0d936f72661b4149a34bd25ae6a7c60d', '1', '5f1f68b1704f4458be2a491f86afbf00', '3a738be3cc0f4eee8b0d01d9172bbe55', '232');
INSERT INTO `orderitem` VALUES ('19dcfb1d55514a7080c97c5dfcbf6795', '3', 'cef40fa5475a40a39ba691cfdb16c668', '43deee30c0fa43de91549fc33cc1339b', '3333');
INSERT INTO `orderitem` VALUES ('19e471f54b10463a8f473f7648345b46', '4', '6af7bd1541a1474485de48e0751e42be', '112b6c2c94164a67aa6b7c745a4ccefc', '2220');
INSERT INTO `orderitem` VALUES ('21af22b898ed4548b1fd67fea02cb7cd', '5', '6af7bd1541a1474485de48e0751e42be', '2d9e62b3fe3c4148a7c12d6c17ba3c69', '1160');
INSERT INTO `orderitem` VALUES ('31a014e4da9942fc85031987693795af', '10', '181edae51e284fe58ac53e609daebd17', 'ab04326cea81445a913f576a388d9b5f', '990');
INSERT INTO `orderitem` VALUES ('3473cf270b844464a82638c35033b978', '6', '3d8256c2efba4ebf8981aee0d3d48efe', 'cb8995589bcd4ada953dae56e07b86c6', '3330');
INSERT INTO `orderitem` VALUES ('35ca02f52ca847329d773fe4a7394e17', '1', 'dcd6ad05e4ef400e8a609c8a905e3480', '85206a2cadbb43ce9147bef9269444f7', '3345');
INSERT INTO `orderitem` VALUES ('37f772b240834f968a02afc3369da939', '1', 'cef40fa5475a40a39ba691cfdb16c668', '5ab431cfc95d4f90bb6eec1054905c50', '50');
INSERT INTO `orderitem` VALUES ('45a6aab54f934d068452424339f83a24', '1', 'd4b0704dd24948a9896a4fa3b0a952d2', '0629f1343b82449ca59696a1df73506a', '2333');
INSERT INTO `orderitem` VALUES ('4ba36649302c4d01831de8912f4219f5', '1', 'dcd6ad05e4ef400e8a609c8a905e3480', '5ab431cfc95d4f90bb6eec1054905c50', '50');
INSERT INTO `orderitem` VALUES ('4bea622c44a2402db3b491590ce2dad7', '1', 'd6a389dbca9348e4a26b6e78000e31a3', 'c0ac62d5693b4e849ae8973186c4777c', '7777');
INSERT INTO `orderitem` VALUES ('4e9879bcc38b4112887cf224ddf7045f', '1', 'e53da7049daf476b8e752b15b4fdcb90', 'cb8995589bcd4ada953dae56e07b86c6', '555');
INSERT INTO `orderitem` VALUES ('4fbb76fd44af431085788fb77b74b5ac', '10', '181edae51e284fe58ac53e609daebd17', '43deee30c0fa43de91549fc33cc1339b', '11110');
INSERT INTO `orderitem` VALUES ('4fbbaa90e2224e78827ff4ba55d08888', '1', 'dcd6ad05e4ef400e8a609c8a905e3480', 'c0ac62d5693b4e849ae8973186c4777c', '7777');
INSERT INTO `orderitem` VALUES ('50e75c0a98374ba3946b69f3e19bd8af', '1', 'd4b0704dd24948a9896a4fa3b0a952d2', 'b2a0792635c84207bbb50109cedbfc9f', '4623');
INSERT INTO `orderitem` VALUES ('595c8edeb27c4f21a9f93daf134184bd', '1', 'fa5e8a8891bb4cc78271cd0bff5fa340', 'c0ac62d5693b4e849ae8973186c4777c', '7777');
INSERT INTO `orderitem` VALUES ('5abae9579e784a1594b16eca4f0ea1b3', '1', '5f1f68b1704f4458be2a491f86afbf00', 'ab04326cea81445a913f576a388d9b5f', '99');
INSERT INTO `orderitem` VALUES ('634982dd47b540d585f908d9d7529c4f', '1', '7b8cc5e9b4d047dd82051fd3c5a96c71', '112b6c2c94164a67aa6b7c745a4ccefc', '555');
INSERT INTO `orderitem` VALUES ('6415edb597144236b207986edaf7cfae', '5', '447dbfe352a14de78c70ac9881e72215', '0959da2ae1604b20b27b438dcb66d5c6', '42500');
INSERT INTO `orderitem` VALUES ('64ff983973fc427892cd3de39ae98c65', '1', 'ab5a2cf7d81e4eb1b4532e3f67748348', '43deee30c0fa43de91549fc33cc1339b', '1111');
INSERT INTO `orderitem` VALUES ('65d8dc1f73c34c138f302953262aee6f', '1', 'fa5e8a8891bb4cc78271cd0bff5fa340', '112b6c2c94164a67aa6b7c745a4ccefc', '555');
INSERT INTO `orderitem` VALUES ('70d24f5daed64ac3bc300580852385a7', '1', 'a273ee9b71f04dfeb1f83375a72742b5', 'c0ac62d5693b4e849ae8973186c4777c', '7777');
INSERT INTO `orderitem` VALUES ('7209e5d41e6a4fb8b75ea152c31d5c9d', '1', 'd4b0704dd24948a9896a4fa3b0a952d2', '90feb54beb0d4a70811a993de2b63e75', '4623');
INSERT INTO `orderitem` VALUES ('7dfce475060342c79c7cbda7f51e1091', '1', 'd4b0704dd24948a9896a4fa3b0a952d2', '26ab2cfda6864c3d9456effdeb4392cb', '77');
INSERT INTO `orderitem` VALUES ('8124518fdb1f4bd29273f92635b9bcfe', '1', 'dcd6ad05e4ef400e8a609c8a905e3480', 'ab04326cea81445a913f576a388d9b5f', '99');
INSERT INTO `orderitem` VALUES ('813fb36432434f4bbcac1dd62c6286c6', '1', 'dd75bc45ca8746beaa360e6f715fecdc', '90feb54beb0d4a70811a993de2b63e75', '4623');
INSERT INTO `orderitem` VALUES ('833d300e4ffc44b1a557fdc0fd14c8d9', '5', 'a273ee9b71f04dfeb1f83375a72742b5', 'ab04326cea81445a913f576a388d9b5f', '495');
INSERT INTO `orderitem` VALUES ('899fc4df155a42ed9b653cea2850a5c3', '4', '2dec123de5a8405c96327529a90c5b99', '43deee30c0fa43de91549fc33cc1339b', '4444');
INSERT INTO `orderitem` VALUES ('9907ff02e5c14db080dbb3f1903f4d9d', '1', '0e31fd3534a445eb8d58909a77e37017', 'ab04326cea81445a913f576a388d9b5f', '99');
INSERT INTO `orderitem` VALUES ('a1ef597cd41b4b908050bd9e089146c8', '1', '563312d5429c4727a892664d75447640', 'cb8995589bcd4ada953dae56e07b86c6', '555');
INSERT INTO `orderitem` VALUES ('a2e8a7da294e4f96911599c97e6cbac9', '1', 'dcd6ad05e4ef400e8a609c8a905e3480', '90feb54beb0d4a70811a993de2b63e75', '4623');
INSERT INTO `orderitem` VALUES ('a49c214fc1714c8abecff275b9ac5f55', '1', '1a889c4a039041dd812913bc3934b2e5', 'c0ac62d5693b4e849ae8973186c4777c', '7777');
INSERT INTO `orderitem` VALUES ('a7155bf1859845e1b43015d240c1d192', '1', 'a49dc25cdc2b48aca92d42358f31bbf0', '3a738be3cc0f4eee8b0d01d9172bbe55', '232');
INSERT INTO `orderitem` VALUES ('a8867d14c10840a68dbf1df9ee046fda', '1', '1ca7ecbe0fac40ac921020e6f06190a8', '112b6c2c94164a67aa6b7c745a4ccefc', '555');
INSERT INTO `orderitem` VALUES ('ad1143acd69247feae00376e958e67ec', '1', 'fa5e8a8891bb4cc78271cd0bff5fa340', '43deee30c0fa43de91549fc33cc1339b', '1111');
INSERT INTO `orderitem` VALUES ('adc2e060ddc74de79afcfb6cd4bf2aac', '1', 'a273ee9b71f04dfeb1f83375a72742b5', '2d9e62b3fe3c4148a7c12d6c17ba3c69', '232');
INSERT INTO `orderitem` VALUES ('bb748694807c4931b3f529c93dd03983', '1', 'd8351ca64a254683b7b34a1f9f9d2f98', '0629f1343b82449ca59696a1df73506a', '2333');
INSERT INTO `orderitem` VALUES ('bb8e4701b9c14a588878a6f8dc1507ba', '10', '181edae51e284fe58ac53e609daebd17', 'c0ac62d5693b4e849ae8973186c4777c', '77770');
INSERT INTO `orderitem` VALUES ('bd509d7acdc4423f8966a3c011d1e570', '1', 'd4b0704dd24948a9896a4fa3b0a952d2', 'ab04326cea81445a913f576a388d9b5f', '99');
INSERT INTO `orderitem` VALUES ('bf2ffe16fa0d4d988f3bf1851c6a0714', '2', '06770eee9f9946e5b977bc4d13219d65', '2d9e62b3fe3c4148a7c12d6c17ba3c69', '464');
INSERT INTO `orderitem` VALUES ('c713664d56d2422ab56a54337a8632ef', '1', '5f1f68b1704f4458be2a491f86afbf00', 'c0ac62d5693b4e849ae8973186c4777c', '7777');
INSERT INTO `orderitem` VALUES ('c7553f8127914c7396df1a73869d7551', '7', '3d8256c2efba4ebf8981aee0d3d48efe', '112b6c2c94164a67aa6b7c745a4ccefc', '3885');
INSERT INTO `orderitem` VALUES ('c863b41eb3264e12ad081172a0048025', '1', 'a273ee9b71f04dfeb1f83375a72742b5', '85206a2cadbb43ce9147bef9269444f7', '4623');
INSERT INTO `orderitem` VALUES ('cc7862e1d3cb456aab46a23951edd4f8', '1', 'fa5e8a8891bb4cc78271cd0bff5fa340', '2d9e62b3fe3c4148a7c12d6c17ba3c69', '232');
INSERT INTO `orderitem` VALUES ('ce1ae995609c4e1288e8ff90b95b55d4', '1', '563312d5429c4727a892664d75447640', 'ab04326cea81445a913f576a388d9b5f', '99');
INSERT INTO `orderitem` VALUES ('d1f4aa9eba204bee837d97bfedf353e1', '4', '447dbfe352a14de78c70ac9881e72215', 'f0aaf2b5feed47fca67f9cbd176316ab', '21332');
INSERT INTO `orderitem` VALUES ('d2bfa13f3e3e4be295211a348f0f853c', '5', '3d8256c2efba4ebf8981aee0d3d48efe', 'b2a0792635c84207bbb50109cedbfc9f', '23115');
INSERT INTO `orderitem` VALUES ('d761f2a176f34b3fa3f9998090ffd9f1', '3', 'cef40fa5475a40a39ba691cfdb16c668', '2d9e62b3fe3c4148a7c12d6c17ba3c69', '696');
INSERT INTO `orderitem` VALUES ('dfa1c822ad25485dbf9dac0c20c51aac', '1', '0e31fd3534a445eb8d58909a77e37017', '2d9e62b3fe3c4148a7c12d6c17ba3c69', '232');
INSERT INTO `orderitem` VALUES ('e445d203ec214bdb956971b491158782', '1', 'fa5e8a8891bb4cc78271cd0bff5fa340', 'ab04326cea81445a913f576a388d9b5f', '99');
INSERT INTO `orderitem` VALUES ('e510852e853f458892612e1f8506ef18', '1', 'd4b0704dd24948a9896a4fa3b0a952d2', '5ab431cfc95d4f90bb6eec1054905c50', '50');
INSERT INTO `orderitem` VALUES ('ed9ddef3ab224c689e614dc7bc8b3eb7', '1', '73afd82631744026ae185e9292c9c532', '112b6c2c94164a67aa6b7c745a4ccefc', '555');
INSERT INTO `orderitem` VALUES ('f15f21efdae14a8f914fa1952ce2387c', '5', '2dec123de5a8405c96327529a90c5b99', '112b6c2c94164a67aa6b7c745a4ccefc', '2775');
INSERT INTO `orderitem` VALUES ('f6d7f2b3ee8340689aee84a25e8474ca', '1', 'd4b0704dd24948a9896a4fa3b0a952d2', '2d9e62b3fe3c4148a7c12d6c17ba3c69', '232');
INSERT INTO `orderitem` VALUES ('f8c096a90b7c478b80cf5370ade4be63', '1', 'dcd6ad05e4ef400e8a609c8a905e3480', '3a738be3cc0f4eee8b0d01d9172bbe55', '232');
INSERT INTO `orderitem` VALUES ('fae21099ebdc4c13a5bebf0e99de4d24', '1', 'ba3e23ba16b941d09fccf20acce30f47', '90feb54beb0d4a70811a993de2b63e75', '4623');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `ordertime` date DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `usernameid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `usernameid` (`usernameid`),
  CONSTRAINT `usernameid` FOREIGN KEY (`usernameid`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('06770eee9f9946e5b977bc4d13219d65', '安徽合肥', '郑斌', '13625674863', '2020-05-13', '3', '26115', 'uuuuuuuu');
INSERT INTO `orders` VALUES ('0e31fd3534a445eb8d58909a77e37017', '天津市-天津市-和平区望江路10086号', '郑斌', '13625674863', '2020-05-27', '4', '331', 'zczczczc');
INSERT INTO `orders` VALUES ('181edae51e284fe58ac53e609daebd17', '安徽合肥', '郑斌', '13625674863', '2020-05-13', '3', '89870', 'uuuuuuuu');
INSERT INTO `orders` VALUES ('1a889c4a039041dd812913bc3934b2e5', '安徽安庆', '李四', '10086', '2020-05-16', '4', '7777', 'qqqqqqqq');
INSERT INTO `orders` VALUES ('1ca7ecbe0fac40ac921020e6f06190a8', '安徽安庆', '李四', '10086', '2020-05-09', '4', '555', 'qqqqqqqq');
INSERT INTO `orders` VALUES ('2dec123de5a8405c96327529a90c5b99', '安徽合肥', '李四', '13625674863', '2020-05-13', '3', '7219', 'uuuuuuuu');
INSERT INTO `orders` VALUES ('3d8256c2efba4ebf8981aee0d3d48efe', '安徽合肥', '郑斌', '13625674863', '2020-05-13', '3', '30330', 'uuuuuuuu');
INSERT INTO `orders` VALUES ('447dbfe352a14de78c70ac9881e72215', '北京市-北京市-西城区望江路10086号', '李四', '13625674863', '2020-05-24', '4', '63832', 'qqqqqqqq');
INSERT INTO `orders` VALUES ('563312d5429c4727a892664d75447640', '安徽省-铜陵市-郊区望江路10086号', '郑斌', '727089', '2020-05-16', '4', '654', 'qqqqqqqq');
INSERT INTO `orders` VALUES ('5af1e63d9dc9456aadb1a71ebb591e2d', '河南省-周口市-槐店镇望江路10086号', '郑斌', '13625674863', '2020-05-16', '4', '1111', 'qqqqqqqq');
INSERT INTO `orders` VALUES ('5f1f68b1704f4458be2a491f86afbf00', '福建省-福州市-罗源县望江路10086号', '李四', '727089', '2020-05-25', '4', '8108', 'qqqqqqqq');
INSERT INTO `orders` VALUES ('6af7bd1541a1474485de48e0751e42be', '安徽合肥', '郑斌', '13625674863', '2020-05-08', '4', '3380', 'qqqqqqqq');
INSERT INTO `orders` VALUES ('6d60de51483d4168be674a165d5e0160', '安徽合肥', '郑斌', '13625674863', '2020-05-08', '3', '232', 'qqqqqqqq');
INSERT INTO `orders` VALUES ('73afd82631744026ae185e9292c9c532', '黑龙江省-齐齐哈尔市-泰来镇望江路10086号', '李四', '10086', '2020-05-16', '3', '555', 'qqqqqqqq');
INSERT INTO `orders` VALUES ('7b8cc5e9b4d047dd82051fd3c5a96c71', null, null, null, '2020-05-25', '0', '555', 'qqqqqqqq');
INSERT INTO `orders` VALUES ('a273ee9b71f04dfeb1f83375a72742b5', '安徽合肥', '郑斌', '13625674863', '2020-05-08', '3', '13127', 'qqqqqqqq');
INSERT INTO `orders` VALUES ('a49dc25cdc2b48aca92d42358f31bbf0', '安徽合肥', '郑斌', '13625674863', '2020-05-08', '3', '232', 'qqqqqqqq');
INSERT INTO `orders` VALUES ('ab5a2cf7d81e4eb1b4532e3f67748348', '安徽合肥', '李四', '13625674863', '2020-05-14', '3', '1111', 'qwesadzz');
INSERT INTO `orders` VALUES ('ba3e23ba16b941d09fccf20acce30f47', '福建省-福州市-罗源县望江路10086号', '李四', '727089', '2020-05-25', '2', '4623', 'qqqqqqqq');
INSERT INTO `orders` VALUES ('c6f2410facd54d60874a1bde2e07d58f', '安徽合肥', '李四', '13625674863', '2020-05-13', '3', '99', 'uuuuuuuu');
INSERT INTO `orders` VALUES ('cef40fa5475a40a39ba691cfdb16c668', '安徽合肥', '李四', '13625674863', '2020-05-15', '3', '4079', 'uuuuuuuu');
INSERT INTO `orders` VALUES ('d4b0704dd24948a9896a4fa3b0a952d2', '安徽合肥', '李四', '13625674863', '2020-05-14', '3', '12037', 'uuuuuuuu');
INSERT INTO `orders` VALUES ('d6a389dbca9348e4a26b6e78000e31a3', '福建省-福州市-罗源县望江路10086号', '李四', '727089', '2020-05-22', '1', '7777', 'qqqqqqqq');
INSERT INTO `orders` VALUES ('d8351ca64a254683b7b34a1f9f9d2f98', '福建省-福州市-罗源县望江路10086号', '李四', '727089', '2020-05-16', '1', '2333', 'qqqqqqqq');
INSERT INTO `orders` VALUES ('dcd6ad05e4ef400e8a609c8a905e3480', '安徽安庆', '李四', '10086', '2020-05-15', '4', '16126', 'qqqqqqqq');
INSERT INTO `orders` VALUES ('dd75bc45ca8746beaa360e6f715fecdc', '安徽合肥', '郑斌', '13625674863', '2020-05-08', '3', '4623', 'qqqqqqqq');
INSERT INTO `orders` VALUES ('e53da7049daf476b8e752b15b4fdcb90', null, null, null, '2020-05-13', '0', '555', 'uuuuuuuu');
INSERT INTO `orders` VALUES ('fa5e8a8891bb4cc78271cd0bff5fa340', '安徽合肥', '李四', '13625674863', '2020-05-15', '3', '14397', 'uuuuuuuu');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` varchar(255) NOT NULL,
  `pname` varchar(255) DEFAULT NULL,
  `pimage` varchar(255) DEFAULT NULL,
  `pdate` varchar(255) DEFAULT NULL,
  `pdesc` varchar(1000) DEFAULT NULL,
  `shop_price` double DEFAULT NULL,
  `market_price` double DEFAULT NULL,
  `is_hot` int(10) DEFAULT NULL,
  `is_latest` int(10) unsigned zerofill DEFAULT '0000000000',
  `cid` varchar(255) DEFAULT NULL,
  `pcount` int(10) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `cid` (`cid`),
  CONSTRAINT `cid` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('011ebb912ca0416984b28c30c6c1ecaf', ' 联想R7000 R5-4600H 16G 512G SSD GTX1650 100%sRGB)幻影黑', '087ddf18f81240c7bded69bba91a7de8.jpg', '2020年05月20日 13:30:24', '品牌： 联想（Lenovo）\r\n商品名称：联想拯救者商品编号：100012885246商品毛重：4.28kg商品产地：中国大陆屏幕色域：100%sRGB系统：windows 10 Office厚度：25.0mm以上屏幕分辨率：全高清屏幕（1920*1080）机身材质：复合材质特性：背光键盘，PCIE高速固态硬盘，双硬盘插槽，双内存插槽，WiFi 6屏幕尺寸：15.6英寸系列：联想-拯救者显存容量：4GCPU：AMD R5标准电压版屏幕刷新率：60HZ待机时长：7-9小时裸机重量：2-2.5kg内存：16G硬盘：512G SSD显卡：GTX1650颜色：黑色', '5300', '5400', null, '0000000000', 'eecc8f5d591b40838b0ce2eb01b596e9', '111');
INSERT INTO `product` VALUES ('036e4275211f4f2dab940d3d3b5f7be1', '华为MatePad 10.4英寸麒麟810 4GB+64GB(夜阑灰)', 'ae2ca4dfc01d428ca0483bec38cafb84.jpg', '2020年05月20日 12:23:05', '品牌： 华为（HUAWEI）\r\n商品名称：华为MatePad商品编号：100012444276商品毛重：0.82kg商品产地：中国大陆屏幕尺寸：10.4英寸系统：Android厚度：7.1mm-9mm分类：娱乐平板存储容量：64GB热门机型：华为MatePad颜色：灰色', '1111', '1333', null, '0000000000', '77f21085100a4e44a64accece6355dd7', '111');
INSERT INTO `product` VALUES ('0629f1343b82449ca59696a1df73506a', 'Apple iPad mini 5(白色) 2019年新款平板电脑 7.9英寸64g内存', '8feafbb9d91247568e869be0e2252f49.jpg', '2020年05月13日 19:37:28', '品牌： Apple\r\n商品名称：AppleiPad mini商品编号：100002716279商品毛重：0.59kg商品产地：中国大陆厚度：7.0mm以下分类：娱乐平板颜色：灰色屏幕尺寸：7.9英寸系统：ios系统存储容量：64GB', '2333', '2444', null, '0000000001', '77f21085100a4e44a64accece6355dd7', '110');
INSERT INTO `product` VALUES ('0959da2ae1604b20b27b438dcb66d5c6', '惠普(HP)暗影精灵6 Air i7-10750H 16G 1TSSD RTX2060 6G独显', 'dcd609748501459382e879fd92686da0.jpg', '2020年05月20日 13:32:07', '品牌： 惠普（HP）\r\n商品名称：惠普暗影精灵RTX商品编号：100013054330商品毛重：4.14kg商品产地：中国大陆货号：183V2PA屏幕色域：72%NTSC系统：windows 10 Office厚度：20.0mm—25.0mm屏幕分辨率：全高清屏幕（1920*1080）京选产品：惠普-暗影精灵机身材质：金属材质特性：背光键盘屏幕尺寸：15.6英寸显存容量：6GCPU：Intel i7标准电压版裸机重量：2-2.5kg待机时长：5-7小时内存：16G硬盘：1T SSD显卡：RTX2060屏幕刷新率：144HZ颜色：黑色', '8500', '5499', null, '0000000005', 'eecc8f5d591b40838b0ce2eb01b596e9', '1106');
INSERT INTO `product` VALUES ('112b6c2c94164a67aa6b7c745a4ccefc', 'nike运动鞋 AQ7497-001白色41码', 'e0c697a487ef4aeeadc2c877156f74ee.jpg', '2020年05月06日 17:41:51', '品牌： 耐克（NIKE）\r\n商品名称：耐克AQ7497商品编号：100002666613商品毛重：0.7kg商品产地：以实物为准货号：AQ7497-001鞋面材质：织物适用人群：男士功能：透气适合路面：跑道，公路，小道选购热点：气垫，经典款闭合方式：系带上市时间：2019年夏季', '555', '444', null, '0000000019', 'f193e108da1d4f499203cb5ef6189d83', '536');
INSERT INTO `product` VALUES ('1a2761341e044148ae7ea9abf51bc71e', '小米活塞耳机 入耳式手机耳机 通用耳麦Type-C版', 'ca34ed0056f6457091473799108fee96.jpg', '2020年05月20日 11:26:29', '品牌： 小米（MI）\r\n商品名称：小米小米活塞耳机Type-C版商品编号：100006313562商品毛重：40.00g商品产地：中国大陆连接类型：有线佩戴方式：有线入耳式用途：运动耳机', '55', '33', null, '0000000000', '0e1f25091dcf4ba0987d25a97de2bc1f', '111');
INSERT INTO `product` VALUES ('1f41a90cbd034be6a909e408300eb94a', '华为 HUAWEI Mate 30 5G 麒麟990 8GB+128GB青山黛', '955bc1595d244f138a4a7eb6d4a976be.jpg', '2020年05月20日 12:31:42', '品牌： 华为（HUAWEI）\r\n商品名称：华为Mate 30 5G商品编号：100005185613商品毛重：0.54kg商品产地：中国大陆CPU型号：其他运行内存：8GB机身存储：128GB存储卡：NM存储卡摄像头数量：后置三摄后摄主摄像素：4000万像素前摄主摄像素：2400万像素主屏幕尺寸（英寸）：6.62英寸 备注：显示屏采用圆角设计，按照标准矩形测量时，屏幕的对角线长度是6.62英寸（实际可视区域略小）分辨率：全高清FHD+屏幕比例：其它屏幕比例屏幕前摄组合：刘海屏充电器：10V/4A；5V/2A；9V/2A热点：5G操作系统：Android(安卓)游戏性能：发烧级', '4333', '4444', null, '0000000000', 'cba3bdc65e4d49b7ae66233f140de906', '111');
INSERT INTO `product` VALUES ('239cdbd1bb1f479cb40fb0b9eba4bee9', '耐克运动鞋黑色41码', '00b1436de62549cfb61c28388b20d4a6.jpg', '2020年05月13日 19:12:45', '品牌： 耐克（NIKE）\r\n商品名称：耐克AQ7497商品编号：100002666613商品毛重：0.7kg商品产地：以实物为准货号：AQ7497-001鞋面材质：织物适用人群：男士功能：透气适合路面：跑道，公路，小道选购热点：气垫，经典款闭合方式：系带上市时间：2019年夏季', '4623', '4555', null, '0000000000', 'f193e108da1d4f499203cb5ef6189d83', '1111');
INSERT INTO `product` VALUES ('26ab2cfda6864c3d9456effdeb4392cb', '圆领短袖T恤米白花纹(89)175/92A(50)', '73bf1ec982564e41b19cb11b71ca44bb.jpg', '2020年05月13日 19:31:39', '圆领短袖T恤2020夏季新品舒适休闲字母HNTBJ2Q089A米白花纹(89)175/92A(50)', '77', '67', null, '0000000001', 'f193e108da1d4f499203cb5ef6189d83', '1110');
INSERT INTO `product` VALUES ('2b13fc4ee20a4194b8019ab24984cf21', 'Apple iPad 平板电脑 2019年新款10.2英寸128g内存', '401a1273e9c14549b9725bffad0b5322.jpg', '2020年05月13日 19:38:13', '品牌： Apple\r\n商品名称：AppleiPad商品编号：100008348554商品毛重：0.855kg商品产地：中国大陆厚度：7.1mm-9mm分类：娱乐平板颜色：灰色屏幕尺寸：其他系统：ios系统存储容量：128G', '4432', '4444', null, '0000000000', '77f21085100a4e44a64accece6355dd7', '111');
INSERT INTO `product` VALUES ('2d9e62b3fe3c4148a7c12d6c17ba3c69', '希腊风味常温酸奶原味205g*16盒', 'b632a7b5ad094cfdbaa2f8c77797a2db.jpg', '2020年05月03日 10:58:05', '品牌： 伊利\r\n商品名称：伊利 【16盒装】 安慕希希腊风味常温酸奶原味205g*16盒*2提 双提装商品编号：66372155647店铺： 伊利牛奶官方旗舰店商品毛重：3.74kg是否添加糖：添加糖适用人群：成人口味：原味', '232', '121', null, '0000000015', '39695da482e3415db70d3598986a868c', '485');
INSERT INTO `product` VALUES ('2f2695892221428d82aa9a7fd37241b5', '统一 方便面 老坛酸菜牛肉味面 五连包', '7af5be7be2754909aceb59ef8f6bf9c5.jpg', '2020年05月13日 19:19:47', '品牌： 统一\r\n商品名称：统一方便面商品编号：868883商品毛重：0.695kg商品产地：中国大陆包装：袋装', '11', '11', null, '0000000000', '39695da482e3415db70d3598986a868c', '1111');
INSERT INTO `product` VALUES ('322c907e94ab449c8ad74fed321833ed', '漫步者无线耳机O（黑色）', '2b732b5986e549118a72d33815075e3a.jpg', '2020年05月20日 11:22:47', '品牌： 漫步者（EDIFIER）\r\n商品名称：漫步者K800商品编号：654218商品毛重：240.00g商品产地：中国大陆连接类型：有线佩戴方式：头戴式用途：教学耳机', '444', '333', null, '0000000000', '0e1f25091dcf4ba0987d25a97de2bc1f', '9');
INSERT INTO `product` VALUES ('3a738be3cc0f4eee8b0d01d9172bbe55', '伊利 纯牛奶250ml*20盒/箱（礼盒装）', '4d63f3bda3cc4c36a6f917085d4e8e89.jpg', '2020年05月03日 16:17:15', '品牌： 伊利\r\n商品名称：伊利伊利 纯牛奶250ml*20盒/箱（礼盒装）商品编号：100010945920商品毛重：5.5kg商品产地：中国大陆类别：纯牛奶净含量：其它包装：整箱装适用人群：儿童，成人，中老年，青少年钙含量：高钙脂肪含量：全脂是否添加糖：未添加糖口味：原味是否有机：非有机蛋白质含量：高蛋白', '232', '121', null, '0000000013', '39695da482e3415db70d3598986a868c', '320');
INSERT INTO `product` VALUES ('43deee30c0fa43de91549fc33cc1339b', '漫步者', '8218017c76ef4ca2aa73c48b37529b0c.jpg', '2020年05月06日 17:40:50', '品牌： 漫步者（EDIFIER） 商品名称：漫步者K800商品编号：654218商品毛重：240.00g商品产地：中国大陆连接类型：有线佩戴方式：头戴式用途：教学耳机', '1111', '888', null, '0000000020', '0e1f25091dcf4ba0987d25a97de2bc1f', '9');
INSERT INTO `product` VALUES ('489352a9fd5e48e1bb996f5a87325e33', '华为MatePad 10.8英寸6GB+128GB（夜阑灰）', 'fc38c31cec9f49efa8a15cbf6aa53c8f.jpg', '2020年05月20日 12:21:53', '品牌： 华为（HUAWEI）\r\n商品名称：华为MatePad Pro商品编号：100010137716商品毛重：0.925kg商品产地：中国大陆屏幕尺寸：10.8英寸系统：Android厚度：7.1mm-9mm分类：娱乐平板存储容量：128G热门机型：华为MatePad Pro颜色：灰色', '3222', '3333', null, '0000000000', '77f21085100a4e44a64accece6355dd7', '111');
INSERT INTO `product` VALUES ('5ab431cfc95d4f90bb6eec1054905c50', ' 娃哈哈 AD钙奶 含乳饮料 220g*24瓶  ', '8291e7a54fd44c879d72d79b87c09346.jpg', '2020年05月13日 19:22:19', '品牌： 娃哈哈\r\n商品名称：娃哈哈AD钙奶商品编号：968093商品毛重：5.902kg商品产地：浙江/河北/天津/辽宁是否添加糖：添加糖规格：2L以上包装：整箱装', '50', '44', null, '0000000003', '39695da482e3415db70d3598986a868c', '108');
INSERT INTO `product` VALUES ('65e2b0a0d6784cb0be10ed7d080b4310', '漫步者耳机（白色）', '2f14b80a2e8c4d13a89d2ee156c9109c.jpg', '2020年05月20日 11:19:14', '品牌： 漫步者（EDIFIER）\r\n商品名称：漫步者LolliPods商品编号：100009212474商品毛重：135.00g商品产地：中国大陆连接类型：无线（蓝牙）佩戴方式：真无线用途：手机耳机\r\n', '1200', '1111', null, '0000000000', '0e1f25091dcf4ba0987d25a97de2bc1f', '111');
INSERT INTO `product` VALUES ('6637f371811b4b4b81cc26fc1aa9b974', '小米耳机（黑色）', '572ecf9442604815b77880d70294eb0c.jpg', '2020年05月20日 11:21:29', '品牌： 小米（MI）\r\n商品名称：小米Redmi AirDots 真无线蓝牙耳机商品编号：100004460494商品毛重：70.00g商品产地：中国大陆连接类型：无线（蓝牙）佩戴方式：真无线用途：手机耳机', '44', '33', null, '0000000000', '0e1f25091dcf4ba0987d25a97de2bc1f', '111');
INSERT INTO `product` VALUES ('708731b2b4104abcb360c3f8da86875e', '戴尔(DELL)G5 (十代标压i7 8G 512G固态 GTX 1660Ti 6G独显 外星人灯效)', '55d52dc5e0dc430ba3f7f7e3ed6807b7.jpg', '2020年05月20日 13:34:35', '品牌： 戴尔（DELL）\r\n商品名称：戴尔G5商品编号：100013068424商品毛重：4.1kg商品产地：中国大陆屏幕尺寸：15.6英寸显存容量：6G裸机重量：2-2.5kg内存：8GCPU：Intel i7标准电压版系统：windows 10 Office优选服务：两年质保厚度：20.0mm—25.0mm屏幕刷新率：144HZ待机时长：小于5小时显卡：GTX1660Ti屏幕分辨率：全高清屏幕（1920*1080）硬盘：512G SSD特性：PCIE高速固态硬盘颜色：黑色', '8888', '9999', null, '0000000000', 'eecc8f5d591b40838b0ce2eb01b596e9', '1111');
INSERT INTO `product` VALUES ('7e7ab3c821b342da89e37cc7f20a0c31', '三星Tab S5e 10.5英寸4G+64G/7040mAh/指纹面部识别)铂光银', '70f82d84578c424faf58d079df3404d7.jpg', '2020年05月20日 12:24:22', '品牌： 三星（SAMSUNG）\r\n商品名称：三星Tab S商品编号：100005727728商品毛重：0.725kg商品产地：中国大陆屏幕尺寸：其他特色：高保真音质系统：Android厚度：7.0mm以下分类：娱乐平板热门机型：三星Tab S可扩展容量：最大支持512GB颜色：银色CPU核数：八核存储容量：64GB', '1111', '1222', null, '0000000000', '77f21085100a4e44a64accece6355dd7', '111');
INSERT INTO `product` VALUES ('85206a2cadbb43ce9147bef9269444f7', '黑鲨游戏手机4G全网通 (4GB +64GB)', '3c750dcf79d44104a7aeeb762a138eb6.jpg', '2020年04月30日 18:41:10', '商品名称：黑鲨游戏手机。商品编号：65777178541 商品毛重：500.00g运行内存：4GB摄像头数量：后置三摄主屏幕尺寸（英寸）：6.67英寸分辨率：其它分辨率屏幕比例：其它屏幕比例操作系统：Android(安卓)游戏性能：电竞级', '3345', '3333', null, '0000000003', 'cba3bdc65e4d49b7ae66233f140de906', '5552');
INSERT INTO `product` VALUES ('8558ad108da64fffb1a1179a64bf4792', '惠普 战66 15.6英寸笔记本电脑（锐龙7nm 六核R5-4500U 16G 512G）', '356d1eaa2d044c39823ae776b2466e57.jpg', '2020年05月27日 10:31:19', '品牌： 惠普（HP）\r\n商品名称：惠普ProBook 455商品编号：100013312610商品毛重：2.8kg商品产地：中国大陆货号：19H04PC显卡类别：集成显卡系列：惠普 - 战系列显存容量：共享系统内存（集成）系统：Windows 10优选服务：上门服务，一年质保厚度：18.1mm—20.0mm裸机重量：2-2.5kg待机时长：9小时以上内存容量：16G硬盘容量：512G SSD特性：指纹识别，PCIE高速固态硬盘，长寿命电池颜色：银色', '4400', '4500', null, '0000000000', 'eecc8f5d591b40838b0ce2eb01b596e9', '111');
INSERT INTO `product` VALUES ('8cf43875640e4d5089441a2a748c518e', '康师傅大食袋5连袋', '3bb068f7ef5345ea9debd80df00c8d46.jpg', '2020年05月13日 19:21:38', '品牌： 康师傅\r\n商品名称：康师傅方便面商品编号：2848762商品毛重：0.6kg商品产地：中国大陆包装：袋装口味：香辣味类别：汤面', '6', '5', null, '0000000000', '39695da482e3415db70d3598986a868c', '1111');
INSERT INTO `product` VALUES ('8d623e9ec949464f9e03b8eab3e40463', '2019秋季新款宽松上衣服港风男装秋装 浅灰色 XL', 'ff744f7b19c344cf85f74e96f79e314d.jpg', '2020年05月03日 16:51:29', '品牌： 花花公子（PLAYBOY ESTABLISHED 1953）\r\n商品名称：花花公子（PLAYBOY）卫衣男长袖2019秋季新款韩版潮流男士宽松上衣服港风男装秋装 浅灰色 XL商品编号：59211523776店铺： 花花公子远飞专卖店商品毛重：0.7kg商品产地：中国大陆货号：112材质：聚酯纤维版型：标准型风格：青春休闲上市时间：2019年秋季厚度：常规适用人群：青少年流行元素：其它穿着方式：套头袖型：常规袖基础风格：青春流行图案：其它领型：圆领', '4623', '121', null, '0000000000', 'f193e108da1d4f499203cb5ef6189d83', '111');
INSERT INTO `product` VALUES ('8e648b4adef04700946373f84eaac233', '华为耳机（白色）', 'ed3abfa6a1d546eb82fce25dedc5383a.jpg', '2020年05月20日 11:20:15', '品牌： 华为（HUAWEI）\r\n商品名称：华为（HUAWEI）华为AM115、AM116、CM33、AM13等商品编号：13509480433店铺： 潮流数码配件专营店商品毛重：100.00g商品产地：中国大陆货号：华为AM115、AM116、CM33、AM13等插头接口：3.5mm类型：音乐耳机佩戴方式：入耳式插头类型：直插型功能：支持音乐，通话功能，语音', '444', '333', null, '0000000000', '0e1f25091dcf4ba0987d25a97de2bc1f', '1111');
INSERT INTO `product` VALUES ('901ba02be4ef43ef856054f428f1af5b', '南极人短袖卫衣男 W804棕黑色短袖 XL', '863271bb2b5c4f39aa558eb4549e731b.jpg', '2020年05月13日 19:24:56', '品牌： 南极人（Nanjiren）\r\n商品名称：南极人短袖卫衣男薄款t恤2020夏装新款潮流男士连帽打底衫男女情侣套头衫渐变韩版运动上衣T恤 W804棕黑色短袖 XL商品编号：62581946533店铺： 南极人京橦专卖店商品毛重：0.6kg商品产地：中国大陆货号：NZ308材质：聚酯纤维风格：青春休闲，港风版型：修身型适用季节：夏季领型：连帽上市时间：2020年夏季厚度：薄款适用人群：青年流行元素：撞色，其它穿着方式：套头袖型：常规袖基础风格：青春流行图案：字母，渐变适用场景：日常', '122', '121', null, '0000000000', 'f193e108da1d4f499203cb5ef6189d83', '1111');
INSERT INTO `product` VALUES ('90feb54beb0d4a70811a993de2b63e75', '小米MIX4手机', '95bbe5a9d386459baa36917ad80328e5.png', '2020年05月02日 10:33:14', '主体\r\n入网型号\r\n以官网信息为准\r\n产品名称\r\n小米10青春版\r\n上市年份\r\n2020年\r\n上市月份\r\n4月\r\n基本信息\r\n机身长度（mm）\r\n164.02mm\r\n机身重量（g）\r\n192g\r\n机身材质工艺\r\n以官网信息为准\r\n机身宽度（mm）\r\n74.77mm\r\n机身材质分类\r\n其他\r\n机身厚度（mm）\r\n7.88mm\r\n运营商标志或内容\r\n其他\r\n主芯片\r\nCPU品牌\r\n高通(Qualcomm)\r\n屏幕\r\n屏幕材质类型\r\nAMOLED\r\n屏幕刷新率\r\n其他\r\n主屏幕尺寸（英寸）\r\n6.57英寸\r\n后置摄像头\r\n后摄主摄光圈\r\nf/1.79\r\n闪光灯\r\n双LED灯\r\n前置摄像头\r\n前摄主摄光圈\r\n其他\r\n电池信息\r\n电池是否可拆卸\r\n电池不可拆卸\r\n充电器\r\n其他\r\n无线充电\r\n不支持无线充电\r\n网络支持\r\n最大支持SIM卡数量\r\n2个\r\n网络频率（2G/3G）\r\n以官网信息为准\r\n5G网络\r\n移动5G；联通5G；电信5G\r\n4G网络\r\n4G FDD-LTE(联通)；4G TD-LTE(移动)；4G FDD-LTE(联通、电信)\r\n\r\n', '4623', '4555', null, '0000000011', 'cba3bdc65e4d49b7ae66233f140de906', '988');
INSERT INTO `product` VALUES ('97f717abfe69440e89cc8d7d4ff5d5f0', '智能电子闹钟', 'a60f7192643f4cb581bba35575c91e8c.jpg', '2020年05月13日 20:43:12', '品牌： 康巴丝（Compas）\r\n商品名称：康巴丝闹钟商品编号：4433127商品毛重：185.00g商品产地：山东机芯：其它材质：塑料风格：个性创意，简约，卡通风，田园风，其它显示类型：LED功能：感光，贪睡，万年历，其它动力类型：其它', '56', '56', null, '0000000000', '7f05f3f99b29470a8100a489bcca1f4b', '111');
INSERT INTO `product` VALUES ('9a06520bd104446e8aa3497706b0cf3c', 'WITESS 维特斯/碳素复合网球拍男女初学全面型（已穿线） W-5092经典黑白', '29a27a90f08f422abe06e79479f120a9.jpg', '2020年05月24日 14:03:08', '品牌： WITESS\r\n商品名称：WITESS 维特斯/碳素复合网球拍男女初学全面型（已穿线） W-5092经典黑白商品编号：1709316130店铺： 非石运动户外专营店商品毛重：0.59kg货号：网球拍材质：碳纤维平衡点：均衡（全面型）拍长分类：普通型类别：OS拍面（100-110）上市时间：2018年夏季厚度：21mm（含）-28mm（含）适用人群：通用形状：椭圆形拍长：普通型球拍硬度：硬是否穿线：已穿线颜色：红色握把大小：4 1/2英寸', '333', '555', null, '0000000000', 'b9cf8e58e6a64378a1b9e0803aaa6813', '888');
INSERT INTO `product` VALUES ('ab04326cea81445a913f576a388d9b5f', '罗马仕充电宝（30000毫安）', '4e434871fb4242a481842c1deb15bc16.jpg', '2020年05月06日 17:41:16', '品牌： 罗马仕（ROMOSS）\r\n商品名称：罗马仕（ROMOSS）LT20商品编号：27305099378店铺： 罗马仕数码配件旗舰店商品毛重：472.00g商品产地：中国大陆货号：LT20外壳材质：塑料功能：苹果输入，电量屏显，TYPE-C输入容量：20000-24999毫安时电芯类型：锂聚合物电池', '99', '111', null, '0000000022', '7f05f3f99b29470a8100a489bcca1f4b', '755');
INSERT INTO `product` VALUES ('aca3c5e704a24f73a7682fcf85f0fff5', 'Apple 苹果 iphone 11 手机 绿色 全网通 64GB', 'a19f287208274a8a8c3d77f584f0c359.jpg', '2020年05月20日 12:35:37', '品牌： Apple\r\n商品名称：Apple 苹果 iphone 11 手机 绿色 全网通 64GB商品编号：63556828552商品毛重：500.00gCPU型号：其他运行内存：主屏幕尺寸（英寸）：6.1英寸分辨率：高清HD+屏幕比例：其它屏幕比例操作系统：iOS(Apple)', '5222', '5444', null, '0000000000', 'cba3bdc65e4d49b7ae66233f140de906', '111');
INSERT INTO `product` VALUES ('b26ff5edaf5442b3b7531456906c6a47', '双汇 王中王 火腿肠50g*10支 袋装 速食香肠', '2beee4ded0264f7782385e172ab94d28.jpg', '2020年05月13日 19:18:55', '品牌： 双汇\r\n商品名称：双汇王中王500g商品编号：3720906商品毛重：0.52kg商品产地：河南漯河包装：袋装类别：猪肉肠', '13', '12', null, '0000000000', '39695da482e3415db70d3598986a868c', '1111');
INSERT INTO `product` VALUES ('b2a0792635c84207bbb50109cedbfc9f', '黑鲨手机 双模5G全网通 闪电黑 (8GB +128GB)', '7477cf218f9e4726aa6a45bd7c1a10bf.jpg', '2020年05月13日 19:06:14', '商品名称：黑鲨游戏手机3 (5G)商品编号：65777124117商品毛重：500.00g运行内存：8GB摄像头数量：后置三摄主屏幕尺寸（英寸）：6.67英寸分辨率：其它分辨率屏幕比例：其它屏幕比例操作系统：Android(安卓)游戏性能：电竞级', '4623', '4555', null, '0000000006', 'cba3bdc65e4d49b7ae66233f140de906', '1105');
INSERT INTO `product` VALUES ('b2d08b77a29f46d1b46577886eb13d1d', ' 联想Y7000 15.6英寸(i7-9750H 8G 1T SSD GTX1650 72%NTSC)', 'af57c1c564e445b9aff4c5e3e179e07a.jpg', '2020年05月20日 13:19:02', '品牌： 联想（Lenovo）\r\n商品名称：联想拯救者商品编号：100003150685商品毛重：4.16kg商品产地：中国大陆屏幕尺寸：15.6英寸显存容量：4G裸机重量：2-2.5kg内存：8GCPU：Intel i7标准电压版系统：windows 10 Office屏幕分辨率：全高清屏幕（1920*1080）厚度：20.0mm—25.0mm屏幕刷新率：60HZ待机时长：小于5小时显卡：GTX1650机身材质：复合材质硬盘：1T SSD特性：背光键盘，PCIE高速固态硬盘颜色：黑色', '6666', '7777', null, '0000000000', 'eecc8f5d591b40838b0ce2eb01b596e9', '111');
INSERT INTO `product` VALUES ('c0ac62d5693b4e849ae8973186c4777c', '联想Y7000P 酷睿i5 15.6英寸游戏笔记本电脑)竞技版', '872f72bd8c26402cb2139da49888b20f.jpg', '2020年05月06日 17:42:33', '商品名称：联想拯救者商品编号：100006288375商品毛重：4.5kg商品产地：中国大陆屏幕尺寸：15.6英寸裸机重量：2-2.5kg显存容量：6G屏幕色域：72%NTSC内存：16GCPU：Intel i5标准电压版系统：windows 10 Office屏幕分辨率：全高清屏幕（1920*1080）厚度：20.0mm—25.0mm屏幕刷新率：144HZ待机时长：小于5小时显卡：GTX1660Ti机身材质：金属+复合材质硬盘：1T SSD特性：背光键盘，PCIE高速固态硬盘，双硬盘插槽，双内存插槽颜色：黑色', '7777', '6666', null, '0000000018', 'eecc8f5d591b40838b0ce2eb01b596e9', '759');
INSERT INTO `product` VALUES ('cb8995589bcd4ada953dae56e07b86c6', '耐克休闲鞋（黑41码）', '787d35c836794b2cb1230b591b4fde41.jpg', '2020年05月13日 19:13:27', '品牌： 耐克（NIKE）\r\n商品名称：耐克908988商品编号：100007610564商品毛重：0.78kg商品产地：以实物为准货号：BQ3204-002鞋面材质：织物适用人群：男士功能：透气适合路面：跑道，公路，小道选购热点：经典款闭合方式：系带上市时间：2019年秋季', '555', '444', null, '0000000007', 'f193e108da1d4f499203cb5ef6189d83', '215');
INSERT INTO `product` VALUES ('f0aaf2b5feed47fca67f9cbd176316ab', '惠普(HP)暗影精灵5 (i5-9300H 8G 512GSSD GTX1650 4G独显)', '7e83e16b5ffe4d7cbbf1bd8ecb927b2b.jpg', '2020年05月20日 13:33:26', '品牌： 惠普（HP）\r\n商品名称：惠普暗影精灵GTX商品编号：100005603836商品毛重：3.6kg商品产地：中国大陆货号：7DJ80PA屏幕色域：72%NTSC系统：windows 10 Office厚度：20.0mm—25.0mm屏幕分辨率：全高清屏幕（1920*1080）京选产品：惠普-暗影精灵机身材质：金属+复合材质特性：背光键盘屏幕尺寸：15.6英寸显存容量：4GCPU：Intel i5标准电压版裸机重量：2-2.5kg待机时长：5-7小时内存：8G硬盘：512G SSD显卡：GTX1650屏幕刷新率：60HZ颜色：黑色', '5333', '5555', null, '0000000004', 'eecc8f5d591b40838b0ce2eb01b596e9', '1107');
INSERT INTO `product` VALUES ('f6fcd9e7ae7241659ee57b7c6dac1e50', '康师傅方便面（12桶）', '05f736aaf80e42bd844611a27305e371.jpg', '2020年05月13日 19:20:29', '品牌： 康师傅\r\n商品名称：康师傅方便面商品编号：2848752商品毛重：1.96kg商品产地：中国大陆包装：整箱装口味：牛肉味类别：汤面', '60', '45', null, '0000000000', '39695da482e3415db70d3598986a868c', '1111');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3fe8f928ae3b4d0fb7873202fa036125', 'qqqqqqqq', '123123', '郑斌', '1303288@qq.com', '13625674867', '男', '2020-04-18');
INSERT INTO `user` VALUES ('46354579cf25472f9e83b60d219a6fb5', 'uuuuuuuu', '123456', '郑斌2', '1477288@qq.com', '13625674861', '男', '');
INSERT INTO `user` VALUES ('6124bceea2a246418f54e49dadf150f1', 'zbzbzbzb', '111111', '郑斌', '1303051288@qq.com', '13625674863', '男', '');
INSERT INTO `user` VALUES ('d79dfe6a487f45d7b466dccb0987cb54', 'qwesadzz', '123456', '郑斌2', '4741288@qq.com', '13625674862', '男', '');
INSERT INTO `user` VALUES ('e4bac65481f74d7ca3b372510b64d61f', 'asddfasd', '111111', '郑斌21212', '13477451288@qq.com', '13625674863', '男', '');
INSERT INTO `user` VALUES ('ecf631ba245546279d9efa8d14d2d11a', 'asdasdas', '111111', '郑斌', '58851288@qq.com', '13625674864', '男', '2020-05-15');
INSERT INTO `user` VALUES ('f0588b5396c1408ab73d3d9778f535e0', 'zczczczc', '111111', '郑斌', '1303051288@qq.com', '13625674863', '男', '');
