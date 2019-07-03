/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50158
Source Host           : localhost:3306
Source Database       : sharer

Target Server Type    : MYSQL
Target Server Version : 50158
File Encoding         : 65001

Date: 2019-06-21 17:29:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `Aid` int(11) NOT NULL AUTO_INCREMENT,
  `Aname` varchar(200) COLLATE utf8_bin NOT NULL,
  `Agender` char(2) COLLATE utf8_bin DEFAULT NULL,
  `Aemail` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `Aphone` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `Abirth` date DEFAULT NULL,
  `Aimg` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '2017204657.jpg',
  `Apwd` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Aid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '孙彦', 'm', '1270275965@qq.com', '13006521888', '2019-06-15', '2017204632.jpg', '123456');

-- ----------------------------
-- Table structure for `adminimgs`
-- ----------------------------
DROP TABLE IF EXISTS `adminimgs`;
CREATE TABLE `adminimgs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of adminimgs
-- ----------------------------
INSERT INTO `adminimgs` VALUES ('1', '2017204423.jpg');
INSERT INTO `adminimgs` VALUES ('2', '2017204425.jpg');
INSERT INTO `adminimgs` VALUES ('3', '2017204426.jpg');
INSERT INTO `adminimgs` VALUES ('4', '2017204433.jpg');
INSERT INTO `adminimgs` VALUES ('5', '2017204434.jpg');
INSERT INTO `adminimgs` VALUES ('6', '2017204438.jpg');
INSERT INTO `adminimgs` VALUES ('7', '2017204439.jpg');
INSERT INTO `adminimgs` VALUES ('8', '2017204440.jpg');
INSERT INTO `adminimgs` VALUES ('9', '2017204441.jpg');
INSERT INTO `adminimgs` VALUES ('10', '2017204442.jpg');
INSERT INTO `adminimgs` VALUES ('11', '2017204443.jpg');
INSERT INTO `adminimgs` VALUES ('12', '2017204444.jpg');
INSERT INTO `adminimgs` VALUES ('13', '2017204445.jpg');
INSERT INTO `adminimgs` VALUES ('14', '2017204446.jpg');
INSERT INTO `adminimgs` VALUES ('15', '2017204448.jpg');
INSERT INTO `adminimgs` VALUES ('16', '2017204449.jpg');
INSERT INTO `adminimgs` VALUES ('17', '2017204450.jpg');
INSERT INTO `adminimgs` VALUES ('18', '2017204451.jpg');
INSERT INTO `adminimgs` VALUES ('19', '2017204453.jpg');
INSERT INTO `adminimgs` VALUES ('20', '2017204455.jpg');
INSERT INTO `adminimgs` VALUES ('21', '2017204456.jpg');
INSERT INTO `adminimgs` VALUES ('22', '2017204458.jpg');
INSERT INTO `adminimgs` VALUES ('23', '2017204459.jpg');
INSERT INTO `adminimgs` VALUES ('24', '2017204462.jpg');
INSERT INTO `adminimgs` VALUES ('25', '2017204464.jpg');
INSERT INTO `adminimgs` VALUES ('26', '2017204465.jpg');
INSERT INTO `adminimgs` VALUES ('27', '2017204468.jpg');
INSERT INTO `adminimgs` VALUES ('28', '2017204469.jpg');
INSERT INTO `adminimgs` VALUES ('29', '2017204471.jpg');
INSERT INTO `adminimgs` VALUES ('30', '2017204472.jpg');
INSERT INTO `adminimgs` VALUES ('31', '2017204476.jpg');
INSERT INTO `adminimgs` VALUES ('32', '2017204479.jpg');
INSERT INTO `adminimgs` VALUES ('33', '2017204480.jpg');
INSERT INTO `adminimgs` VALUES ('34', '2017204482.jpg');
INSERT INTO `adminimgs` VALUES ('35', '2017204487.jpg');
INSERT INTO `adminimgs` VALUES ('36', '2017204489.jpg');
INSERT INTO `adminimgs` VALUES ('37', '2017204491.jpg');
INSERT INTO `adminimgs` VALUES ('38', '2017204492.jpg');
INSERT INTO `adminimgs` VALUES ('39', '2017204497.jpg');
INSERT INTO `adminimgs` VALUES ('40', '2017204499.jpg');
INSERT INTO `adminimgs` VALUES ('41', '2017204502.jpg');
INSERT INTO `adminimgs` VALUES ('42', '2017204509.jpg');
INSERT INTO `adminimgs` VALUES ('43', '2017204510.jpg');
INSERT INTO `adminimgs` VALUES ('44', '2017204513.jpg');
INSERT INTO `adminimgs` VALUES ('45', '2017204514.jpg');
INSERT INTO `adminimgs` VALUES ('46', '2017204518.jpg');
INSERT INTO `adminimgs` VALUES ('47', '2017204520.jpg');
INSERT INTO `adminimgs` VALUES ('48', '2017204522.jpg');
INSERT INTO `adminimgs` VALUES ('49', '2017204524.jpg');
INSERT INTO `adminimgs` VALUES ('50', '2017204525.jpg');
INSERT INTO `adminimgs` VALUES ('51', '2017204526.jpg');
INSERT INTO `adminimgs` VALUES ('52', '2017204529.jpg');
INSERT INTO `adminimgs` VALUES ('53', '2017204530.jpg');
INSERT INTO `adminimgs` VALUES ('54', '2017204532.jpg');
INSERT INTO `adminimgs` VALUES ('55', '2017204534.jpg');
INSERT INTO `adminimgs` VALUES ('56', '2017204541.jpg');
INSERT INTO `adminimgs` VALUES ('57', '2017204553.jpg');
INSERT INTO `adminimgs` VALUES ('58', '2017204554.jpg');
INSERT INTO `adminimgs` VALUES ('59', '2017204558.jpg');
INSERT INTO `adminimgs` VALUES ('60', '2017204560.jpg');
INSERT INTO `adminimgs` VALUES ('61', '2017204561.jpg');
INSERT INTO `adminimgs` VALUES ('62', '2017204562.jpg');
INSERT INTO `adminimgs` VALUES ('63', '2017204563.jpg');
INSERT INTO `adminimgs` VALUES ('64', '2017204565.jpg');
INSERT INTO `adminimgs` VALUES ('65', '2017204566.jpg');
INSERT INTO `adminimgs` VALUES ('66', '2017204568.jpg');
INSERT INTO `adminimgs` VALUES ('67', '2017204569.jpg');
INSERT INTO `adminimgs` VALUES ('68', '2017204573.jpg');
INSERT INTO `adminimgs` VALUES ('69', '2017204576.jpg');
INSERT INTO `adminimgs` VALUES ('70', '2017204578.jpg');
INSERT INTO `adminimgs` VALUES ('71', '2017204579.jpg');
INSERT INTO `adminimgs` VALUES ('72', '2017204581.jpg');
INSERT INTO `adminimgs` VALUES ('73', '2017204586.jpg');
INSERT INTO `adminimgs` VALUES ('74', '2017204587.jpg');
INSERT INTO `adminimgs` VALUES ('75', '2017204588.jpg');
INSERT INTO `adminimgs` VALUES ('76', '2017204592.jpg');
INSERT INTO `adminimgs` VALUES ('77', '2017204593.jpg');
INSERT INTO `adminimgs` VALUES ('78', '2017204594.jpg');
INSERT INTO `adminimgs` VALUES ('79', '2017204595.jpg');
INSERT INTO `adminimgs` VALUES ('80', '2017204598.jpg');
INSERT INTO `adminimgs` VALUES ('81', '2017204599.jpg');
INSERT INTO `adminimgs` VALUES ('82', '2017204603.jpg');
INSERT INTO `adminimgs` VALUES ('83', '2017204605.jpg');
INSERT INTO `adminimgs` VALUES ('84', '2017204606.jpg');
INSERT INTO `adminimgs` VALUES ('85', '2017204608.jpg');
INSERT INTO `adminimgs` VALUES ('86', '2017204610.jpg');
INSERT INTO `adminimgs` VALUES ('87', '2017204611.jpg');
INSERT INTO `adminimgs` VALUES ('88', '2017204612.jpg');
INSERT INTO `adminimgs` VALUES ('89', '2017204617.jpg');
INSERT INTO `adminimgs` VALUES ('90', '2017204618.jpg');
INSERT INTO `adminimgs` VALUES ('91', '2017204623.jpg');
INSERT INTO `adminimgs` VALUES ('92', '2017204624.jpg');
INSERT INTO `adminimgs` VALUES ('93', '2017204627.jpg');
INSERT INTO `adminimgs` VALUES ('94', '2017204629.jpg');
INSERT INTO `adminimgs` VALUES ('95', '2017204632.jpg');
INSERT INTO `adminimgs` VALUES ('96', '2017204633.jpg');
INSERT INTO `adminimgs` VALUES ('97', '2017204634.jpg');
INSERT INTO `adminimgs` VALUES ('98', '2017204639.jpg');
INSERT INTO `adminimgs` VALUES ('99', '2017204641.jpg');
INSERT INTO `adminimgs` VALUES ('100', '2017204646.jpg');
INSERT INTO `adminimgs` VALUES ('101', '2017204654.jpg');
INSERT INTO `adminimgs` VALUES ('102', '2017204655.jpg');
INSERT INTO `adminimgs` VALUES ('103', '2017204656.jpg');
INSERT INTO `adminimgs` VALUES ('104', '2017204657.jpg');
INSERT INTO `adminimgs` VALUES ('105', '2017204662.jpg');
INSERT INTO `adminimgs` VALUES ('106', '2017204667.jpg');
INSERT INTO `adminimgs` VALUES ('107', '2017204670.jpg');
INSERT INTO `adminimgs` VALUES ('108', '2017204671.jpg');
INSERT INTO `adminimgs` VALUES ('109', '2017204672.jpg');
INSERT INTO `adminimgs` VALUES ('110', '2017204673.jpg');
INSERT INTO `adminimgs` VALUES ('111', '2017204675.jpg');
INSERT INTO `adminimgs` VALUES ('112', '2017204676.jpg');
INSERT INTO `adminimgs` VALUES ('113', '2017204677.jpg');
INSERT INTO `adminimgs` VALUES ('114', '2017204679.jpg');
INSERT INTO `adminimgs` VALUES ('115', '2017204680.jpg');
INSERT INTO `adminimgs` VALUES ('116', '2017204683.jpg');
INSERT INTO `adminimgs` VALUES ('117', '2017204688.jpg');
INSERT INTO `adminimgs` VALUES ('118', '2017204689.jpg');
INSERT INTO `adminimgs` VALUES ('119', '2017204690.jpg');
INSERT INTO `adminimgs` VALUES ('120', '2017204691.jpg');
INSERT INTO `adminimgs` VALUES ('121', '2017204694.jpg');
INSERT INTO `adminimgs` VALUES ('122', '2017204698.jpg');
INSERT INTO `adminimgs` VALUES ('123', '2017204705.jpg');
INSERT INTO `adminimgs` VALUES ('124', '2017204707.jpg');
INSERT INTO `adminimgs` VALUES ('125', '2017204709.jpg');
INSERT INTO `adminimgs` VALUES ('126', '2017204715.jpg');
INSERT INTO `adminimgs` VALUES ('127', '2017204718.jpg');
INSERT INTO `adminimgs` VALUES ('128', '2017204720.jpg');
INSERT INTO `adminimgs` VALUES ('129', '2017204721.jpg');
INSERT INTO `adminimgs` VALUES ('130', '2017204722.jpg');
INSERT INTO `adminimgs` VALUES ('131', '2017204724.jpg');
INSERT INTO `adminimgs` VALUES ('132', '2017204725.jpg');
INSERT INTO `adminimgs` VALUES ('133', '2017204726.jpg');
INSERT INTO `adminimgs` VALUES ('134', '2017204727.jpg');
INSERT INTO `adminimgs` VALUES ('135', '2017204728.jpg');
INSERT INTO `adminimgs` VALUES ('136', '2017204731.jpg');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `Cid` int(11) NOT NULL AUTO_INCREMENT,
  `Cuid` int(20) NOT NULL,
  `Csid` int(11) NOT NULL,
  `Ctime` datetime NOT NULL,
  `Ctext` varchar(1000) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Cid`),
  KEY `Csid_foreign_key` (`Csid`),
  KEY `Cuid_foreign_key` (`Cuid`),
  CONSTRAINT `Csid_foreign_key` FOREIGN KEY (`Csid`) REFERENCES `share` (`Sid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Cuid_foreign_key` FOREIGN KEY (`Cuid`) REFERENCES `users` (`Uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('3', '1', '6', '2019-06-12 00:25:17', '年轻人');
INSERT INTO `comment` VALUES ('4', '1', '10', '2019-06-12 00:35:45', '保护');
INSERT INTO `comment` VALUES ('5', '4', '10', '2019-06-12 00:42:35', '负重前行');
INSERT INTO `comment` VALUES ('6', '4', '6', '2019-06-12 00:42:56', '海哥好帅！');
INSERT INTO `comment` VALUES ('7', '4', '5', '2019-06-12 00:43:17', '小月牙！');
INSERT INTO `comment` VALUES ('8', '2', '16', '2019-06-12 01:13:00', '可以');
INSERT INTO `comment` VALUES ('12', '2', '10', '2019-06-12 01:31:37', '药水哥');
INSERT INTO `comment` VALUES ('16', '2', '22', '2019-06-12 01:38:04', '什么意思');
INSERT INTO `comment` VALUES ('17', '2', '15', '2019-06-12 01:38:53', '好饿啊');
INSERT INTO `comment` VALUES ('18', '2', '15', '2019-06-12 01:39:03', '佰烧day!!!');
INSERT INTO `comment` VALUES ('20', '2', '33', '2019-06-12 02:20:44', '庆祝庆祝');
INSERT INTO `comment` VALUES ('21', '3', '33', '2019-06-12 02:21:55', '大家晚安');
INSERT INTO `comment` VALUES ('22', '1', '33', '2019-06-12 09:25:55', 'nice');
INSERT INTO `comment` VALUES ('23', '1', '31', '2019-06-12 09:26:06', '帅就完事了');
INSERT INTO `comment` VALUES ('25', '1', '16', '2019-06-12 09:26:31', '我寻思也不好看啊');
INSERT INTO `comment` VALUES ('26', '1', '5', '2019-06-12 09:34:28', 'naruto');
INSERT INTO `comment` VALUES ('27', '4', '37', '2019-06-12 10:25:20', '哈哈');
INSERT INTO `comment` VALUES ('28', '4', '32', '2019-06-12 10:29:33', '123');
INSERT INTO `comment` VALUES ('29', '4', '32', '2019-06-12 10:29:43', '123');
INSERT INTO `comment` VALUES ('30', '4', '36', '2019-06-12 11:01:12', '哈哈');

-- ----------------------------
-- Table structure for `fan`
-- ----------------------------
DROP TABLE IF EXISTS `fan`;
CREATE TABLE `fan` (
  `Fid` int(11) NOT NULL AUTO_INCREMENT,
  `Fuid` int(11) NOT NULL,
  `Ffid` int(11) NOT NULL,
  PRIMARY KEY (`Fid`),
  KEY `Fuid` (`Fuid`),
  KEY `Ffid` (`Ffid`),
  CONSTRAINT `Ffid` FOREIGN KEY (`Ffid`) REFERENCES `users` (`Uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fuid` FOREIGN KEY (`Fuid`) REFERENCES `users` (`Uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of fan
-- ----------------------------
INSERT INTO `fan` VALUES ('3', '4', '2');
INSERT INTO `fan` VALUES ('4', '4', '1');
INSERT INTO `fan` VALUES ('5', '3', '4');
INSERT INTO `fan` VALUES ('6', '1', '3');
INSERT INTO `fan` VALUES ('7', '2', '3');
INSERT INTO `fan` VALUES ('8', '4', '3');
INSERT INTO `fan` VALUES ('10', '1', '2');
INSERT INTO `fan` VALUES ('11', '3', '2');
INSERT INTO `fan` VALUES ('12', '3', '1');
INSERT INTO `fan` VALUES ('13', '5', '1');
INSERT INTO `fan` VALUES ('14', '2', '1');
INSERT INTO `fan` VALUES ('15', '5', '4');
INSERT INTO `fan` VALUES ('16', '5', '2');
INSERT INTO `fan` VALUES ('17', '2', '4');
INSERT INTO `fan` VALUES ('20', '6', '4');

-- ----------------------------
-- Table structure for `keep`
-- ----------------------------
DROP TABLE IF EXISTS `keep`;
CREATE TABLE `keep` (
  `Kid` int(11) NOT NULL AUTO_INCREMENT,
  `Kuid` int(11) NOT NULL,
  `Ksid` int(11) NOT NULL,
  `Ktime` datetime NOT NULL,
  PRIMARY KEY (`Kid`),
  KEY `Kuid` (`Kuid`),
  KEY `Ksid` (`Ksid`),
  CONSTRAINT `Ksid` FOREIGN KEY (`Ksid`) REFERENCES `share` (`Sid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Kuid` FOREIGN KEY (`Kuid`) REFERENCES `users` (`Uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of keep
-- ----------------------------
INSERT INTO `keep` VALUES ('1', '4', '5', '2019-06-11 21:58:26');
INSERT INTO `keep` VALUES ('2', '1', '10', '2019-06-12 00:36:14');
INSERT INTO `keep` VALUES ('3', '4', '15', '2019-06-12 01:08:24');
INSERT INTO `keep` VALUES ('4', '2', '6', '2019-06-12 01:12:01');
INSERT INTO `keep` VALUES ('5', '4', '22', '2019-06-12 01:32:06');
INSERT INTO `keep` VALUES ('6', '1', '5', '2019-06-12 01:35:56');
INSERT INTO `keep` VALUES ('8', '4', '32', '2019-06-12 02:14:10');
INSERT INTO `keep` VALUES ('9', '4', '33', '2019-06-12 02:20:15');
INSERT INTO `keep` VALUES ('10', '2', '33', '2019-06-12 02:20:57');
INSERT INTO `keep` VALUES ('12', '4', '35', '2019-06-12 10:22:50');
INSERT INTO `keep` VALUES ('13', '4', '37', '2019-06-12 10:24:09');
INSERT INTO `keep` VALUES ('15', '4', '36', '2019-06-12 10:58:02');
INSERT INTO `keep` VALUES ('16', '4', '38', '2019-06-12 10:59:18');
INSERT INTO `keep` VALUES ('17', '4', '39', '2019-06-12 11:23:59');

-- ----------------------------
-- Table structure for `likes`
-- ----------------------------
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `Lid` int(11) NOT NULL AUTO_INCREMENT,
  `Luid` int(20) NOT NULL,
  `Lsid` int(20) DEFAULT NULL,
  PRIMARY KEY (`Lid`),
  KEY `Luid` (`Luid`),
  KEY `Lsid` (`Lsid`),
  CONSTRAINT `Lsid` FOREIGN KEY (`Lsid`) REFERENCES `share` (`Sid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Luid` FOREIGN KEY (`Luid`) REFERENCES `users` (`Uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of likes
-- ----------------------------
INSERT INTO `likes` VALUES ('1', '2', '6');
INSERT INTO `likes` VALUES ('2', '5', '7');
INSERT INTO `likes` VALUES ('3', '4', '7');
INSERT INTO `likes` VALUES ('4', '4', '6');
INSERT INTO `likes` VALUES ('5', '4', '5');
INSERT INTO `likes` VALUES ('6', '4', '10');
INSERT INTO `likes` VALUES ('7', '4', '15');
INSERT INTO `likes` VALUES ('10', '4', '22');
INSERT INTO `likes` VALUES ('11', '1', '22');
INSERT INTO `likes` VALUES ('18', '2', '33');
INSERT INTO `likes` VALUES ('19', '1', '33');
INSERT INTO `likes` VALUES ('20', '1', '31');
INSERT INTO `likes` VALUES ('21', '1', '32');
INSERT INTO `likes` VALUES ('22', '1', '30');
INSERT INTO `likes` VALUES ('23', '1', '35');
INSERT INTO `likes` VALUES ('24', '4', '37');
INSERT INTO `likes` VALUES ('26', '1', '37');
INSERT INTO `likes` VALUES ('27', '4', '33');
INSERT INTO `likes` VALUES ('29', '4', '31');
INSERT INTO `likes` VALUES ('30', '4', '30');
INSERT INTO `likes` VALUES ('32', '4', '32');
INSERT INTO `likes` VALUES ('33', '4', '39');
INSERT INTO `likes` VALUES ('34', '4', '38');
INSERT INTO `likes` VALUES ('35', '4', '36');

-- ----------------------------
-- Table structure for `share`
-- ----------------------------
DROP TABLE IF EXISTS `share`;
CREATE TABLE `share` (
  `Sid` int(11) NOT NULL AUTO_INCREMENT,
  `Suid` int(11) NOT NULL,
  `Stext` varchar(1000) COLLATE utf8_bin DEFAULT 'null',
  `Simg` varchar(200) COLLATE utf8_bin DEFAULT 'null',
  `Stime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Svisible` int(11) DEFAULT '0',
  PRIMARY KEY (`Sid`),
  KEY `Suid` (`Suid`),
  CONSTRAINT `Suid` FOREIGN KEY (`Suid`) REFERENCES `users` (`Uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of share
-- ----------------------------
INSERT INTO `share` VALUES ('5', '2', '月亮', 'backlit-dawn-dramatic-sky-2414442.jpg', '2019-06-11 21:47:25', '0');
INSERT INTO `share` VALUES ('6', '3', '', 'sushe.jpg', '2019-06-11 21:49:03', '0');
INSERT INTO `share` VALUES ('7', '1', '项  目  天  使', 'angle.jpg', '2019-06-11 21:51:05', '0');
INSERT INTO `share` VALUES ('10', '5', '负  重  前  行', 'art.jpg', '2019-06-12 00:31:09', '0');
INSERT INTO `share` VALUES ('14', '3', '三步上篮教学', '20190611143451.gif', '2019-06-12 01:06:21', '0');
INSERT INTO `share` VALUES ('15', '4', '好丰盛啊！', 'xiaoqingxin.jpeg', '2019-06-12 01:08:09', '0');
INSERT INTO `share` VALUES ('16', '3', '女神！！！！！！', '0190612010955 (2).jpg', '2019-06-12 01:12:08', '0');
INSERT INTO `share` VALUES ('22', '4', '不要想太多，做你想做的！', 'timg.jpg', '2019-06-12 01:32:00', '0');
INSERT INTO `share` VALUES ('30', '4', '我们一起看过的日出', 'QQ图片201906120140351.jpg', '2019-06-12 01:59:20', '0');
INSERT INTO `share` VALUES ('31', '4', '我和vinkey', '34ca620027e8c227.jpg', '2019-06-12 02:03:59', '0');
INSERT INTO `share` VALUES ('32', '4', '阳、云、花', 'IMG_20181002_105951.jpg', '2019-06-12 02:05:03', '0');
INSERT INTO `share` VALUES ('33', '4', '今天晚上项目竣工！', 'QQ图片20190612021704.jpg', '2019-06-12 02:19:38', '0');
INSERT INTO `share` VALUES ('35', '1', 'sky', 'sky.jpg', '2019-06-12 09:30:10', '0');
INSERT INTO `share` VALUES ('36', '4', '老师辛苦了', '1272266894749102130.gif', '2019-06-12 10:23:32', '0');
INSERT INTO `share` VALUES ('37', '1', '测试', '15603058638678677622240592155532.jpg', '2019-06-12 10:23:50', '0');
INSERT INTO `share` VALUES ('38', '4', '大海', 'IMG_20190307_061913.jpg', '2019-06-12 10:59:11', '0');
INSERT INTO `share` VALUES ('39', '4', '恭喜生活喜提我狗命', '1532094761455.jpeg', '2019-06-12 11:14:54', '0');

-- ----------------------------
-- Table structure for `thumbs`
-- ----------------------------
DROP TABLE IF EXISTS `thumbs`;
CREATE TABLE `thumbs` (
  `Tid` int(11) NOT NULL AUTO_INCREMENT,
  `Tuid` int(11) DEFAULT NULL,
  `Tcid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tid`),
  KEY `Tuid` (`Tuid`),
  KEY `Tcid` (`Tcid`),
  CONSTRAINT `Tcid` FOREIGN KEY (`Tcid`) REFERENCES `comment` (`Cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Tuid` FOREIGN KEY (`Tuid`) REFERENCES `users` (`Uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of thumbs
-- ----------------------------
INSERT INTO `thumbs` VALUES ('1', '2', '8');
INSERT INTO `thumbs` VALUES ('2', '2', '6');
INSERT INTO `thumbs` VALUES ('3', '2', '3');
INSERT INTO `thumbs` VALUES ('5', '2', '17');
INSERT INTO `thumbs` VALUES ('6', '2', '18');
INSERT INTO `thumbs` VALUES ('7', '2', '20');
INSERT INTO `thumbs` VALUES ('8', '4', '28');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `Uid` int(11) NOT NULL AUTO_INCREMENT,
  `Uname` varchar(200) COLLATE utf8_bin NOT NULL,
  `Ugender` char(10) COLLATE utf8_bin DEFAULT NULL,
  `Uemail` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `Uphone` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `Ubirth` date DEFAULT NULL,
  `Uimg` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT 'defaultImg.jpeg',
  `Upwd` varchar(200) COLLATE utf8_bin NOT NULL,
  `Ustatus` int(11) NOT NULL DEFAULT '0',
  `Uwords` varchar(1000) COLLATE utf8_bin DEFAULT '个性签名',
  PRIMARY KEY (`Uid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Vinkey', 'm', 'jiawenqi98@outlook.com', '15621460690', '1998-09-16', 'head.jpg', '980916', '0', '祝一切都好');
INSERT INTO `users` VALUES ('2', 'Barry', 'm', '1025425110@qq.com', '15265437078', '2019-06-13', 'Naruto.jpg', '123456', '1', 'Hello World!');
INSERT INTO `users` VALUES ('3', 'Beyond', 'm', '1270275965@qq.com', '13006521888', '2019-04-18', 'Curry.jpg', 'sunyan', '0', '我是郭兴海的哥哥');
INSERT INTO `users` VALUES ('4', 'Adam', 'm', 'cy5115236@163.com', '17864213670', '2019-06-06', 'me.jpg', '111111', '0', 'Get a life.2');
INSERT INTO `users` VALUES ('5', '药水哥ss', null, 'yaoshui@163.com', '13611111111', null, 'yhead.jpg', '123456', '0', null);
INSERT INTO `users` VALUES ('6', 'anna222', null, 'lifanfan@126.com', '13697665261', null, 'defaultImg.jpeg', '888888', '1', null);
INSERT INTO `users` VALUES ('7', 'test', null, '1025425110@qq.com', '15265437078', null, 'defaultImg.jpeg', '123456', '0', null);
INSERT INTO `users` VALUES ('8', 'test2', null, '110@qq.com', '15265437078', null, 'defaultImg.jpeg', '123456', '0', null);
INSERT INTO `users` VALUES ('9', 'test3', null, '1025425110@qq.com', '15265437078', null, 'defaultImg.jpeg', '123456', '1', null);
