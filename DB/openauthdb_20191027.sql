/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : openauthdb

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2019-10-27 00:58:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for application
-- ----------------------------
DROP TABLE IF EXISTS `application`;
CREATE TABLE `application` (
  `Id` varchar(50) NOT NULL COMMENT 'AppId',
  `Name` varchar(255) NOT NULL COMMENT '应用名称',
  `AppSecret` varchar(255) DEFAULT NULL COMMENT '应用密钥',
  `Description` varchar(255) DEFAULT NULL COMMENT '应用描述',
  `Icon` varchar(255) DEFAULT NULL COMMENT '应用图标',
  `Disable` tinyint(4) NOT NULL COMMENT '是否可用',
  `CreateTime` date NOT NULL COMMENT '创建日期',
  `CreateUser` varchar(50) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='应用';

-- ----------------------------
-- Records of application
-- ----------------------------
INSERT INTO `application` VALUES ('110', 'OpenAuth.Net', 'openauthdotnetyubaolee', '最好用的.NET权限工作流框架', null, '0', '2018-04-14', null);
INSERT INTO `application` VALUES ('119', 'XXX管理平台', 'manageryubaolee', '这是一个第三的平台', null, '0', '2018-04-14', null);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `Id` varchar(50) NOT NULL COMMENT '分类表ID（可作为分类的标识）',
  `Name` varchar(255) NOT NULL COMMENT '名称',
  `Disabled` tinyint(4) NOT NULL COMMENT '是否可用',
  `SortNo` int(11) NOT NULL COMMENT '排序号',
  `Icon` varchar(255) DEFAULT NULL COMMENT '分类图标',
  `Description` text COMMENT '分类描述',
  `TypeId` varchar(50) DEFAULT NULL COMMENT '分类类型ID',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='分类表，表示一个全集，比如：男、女、未知。关联的分类类型表示按什么进行的分类，如：按照性别对人类对象集进行分类';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('ADMINISTRATOR', '管理员', '0', '0', '', null, 'USERTYPE');
INSERT INTO `category` VALUES ('SYSTEMADMIN', '神', '0', '0', '', null, 'USERTYPE');
INSERT INTO `category` VALUES ('USER', '普通用户', '0', '0', '', null, 'USERTYPE');

-- ----------------------------
-- Table structure for categorytype
-- ----------------------------
DROP TABLE IF EXISTS `categorytype`;
CREATE TABLE `categorytype` (
  `Id` varchar(50) NOT NULL COMMENT '分类表ID',
  `Name` varchar(255) NOT NULL COMMENT '名称',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='分类类型';

-- ----------------------------
-- Records of categorytype
-- ----------------------------
INSERT INTO `categorytype` VALUES ('USERTYPE', '按用户类型分类', '2017-11-29 21:27:42');

-- ----------------------------
-- Table structure for flowinstance
-- ----------------------------
DROP TABLE IF EXISTS `flowinstance`;
CREATE TABLE `flowinstance` (
  `Id` varchar(50) NOT NULL COMMENT '主键Id',
  `InstanceSchemeId` varchar(50) NOT NULL COMMENT '流程实例模板Id',
  `Code` varchar(200) DEFAULT NULL COMMENT '实例编号',
  `CustomName` varchar(200) DEFAULT NULL COMMENT '自定义名称',
  `ActivityId` varchar(50) DEFAULT NULL COMMENT '当前节点ID',
  `ActivityType` int(11) DEFAULT NULL COMMENT '当前节点类型（0会签节点）',
  `ActivityName` varchar(200) DEFAULT NULL COMMENT '当前节点名称',
  `PreviousId` varchar(50) DEFAULT NULL COMMENT '前一个ID',
  `SchemeContent` longtext COMMENT '流程模板内容',
  `SchemeId` varchar(50) DEFAULT NULL COMMENT '流程模板ID',
  `DbName` varchar(50) DEFAULT NULL COMMENT '数据库名称',
  `FrmData` longtext COMMENT '表单数据',
  `FrmType` int(11) NOT NULL COMMENT '表单类型',
  `FrmContentData` longtext COMMENT '表单中的控件属性描述',
  `FrmContentParse` longtext COMMENT '表单控件位置模板',
  `FrmId` varchar(50) DEFAULT NULL COMMENT '表单ID',
  `SchemeType` varchar(50) DEFAULT NULL COMMENT '流程类型',
  `Disabled` int(11) NOT NULL COMMENT '有效标志',
  `CreateDate` datetime NOT NULL COMMENT '创建时间',
  `CreateUserId` varchar(50) DEFAULT NULL COMMENT '创建用户主键',
  `CreateUserName` varchar(50) DEFAULT NULL COMMENT '创建用户',
  `FlowLevel` int(11) NOT NULL COMMENT '等级',
  `Description` varchar(200) DEFAULT NULL COMMENT '实例备注',
  `IsFinish` int(11) NOT NULL COMMENT '是否完成',
  `MakerList` text COMMENT '执行人',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='工作流流程实例表';

-- ----------------------------
-- Records of flowinstance
-- ----------------------------
INSERT INTO `flowinstance` VALUES ('034ad4f0-95e6-40bf-b3c5-38bd60b542d9', '', '1564334796391', '会签2019-07-29 01:26:40', '1564334444885', '4', 'node_7', '1564334437844', '{\"title\":\"newFlow_1\",\"initNum\":16,\"lines\":[{\"id\":\"1564334446774\",\"type\":\"sl\",\"from\":\"1564334430924\",\"to\":\"1564334435460\",\"name\":\"\",\"dash\":false,\"Compares\":null},{\"id\":\"1564334447796\",\"type\":\"sl\",\"from\":\"1564334435460\",\"to\":\"1564334437844\",\"name\":\"\",\"dash\":false,\"Compares\":null},{\"id\":\"1564334448572\",\"type\":\"sl\",\"from\":\"1564334437844\",\"to\":\"1564334439828\",\"name\":\"\",\"dash\":false,\"Compares\":null},{\"id\":\"1564334449628\",\"type\":\"sl\",\"from\":\"1564334437844\",\"to\":\"1564334440404\",\"name\":\"\",\"dash\":false,\"Compares\":null},{\"id\":\"1564334450572\",\"type\":\"sl\",\"from\":\"1564334439828\",\"to\":\"1564334441965\",\"name\":\"\",\"dash\":false,\"Compares\":null},{\"id\":\"1564334451684\",\"type\":\"sl\",\"from\":\"1564334440404\",\"to\":\"1564334441965\",\"name\":\"\",\"dash\":false,\"Compares\":null},{\"id\":\"1564334453900\",\"type\":\"sl\",\"from\":\"1564334441965\",\"to\":\"1564334444885\",\"name\":\"\",\"dash\":false,\"Compares\":null}],\"nodes\":[{\"id\":\"1564334430924\",\"name\":\"node_1\",\"type\":\"start round mix\",\"left\":17,\"top\":12,\"width\":26,\"height\":26,\"alt\":true,\"setInfo\":null},{\"id\":\"1564334435460\",\"name\":\"node_2\",\"type\":\"node\",\"left\":141,\"top\":49,\"width\":104,\"height\":26,\"alt\":true,\"setInfo\":{\"NodeDesignate\":null,\"NodeDesignateData\":null,\"NodeCode\":null,\"NodeName\":null,\"ThirdPartyUrl\":null,\"NodeRejectType\":null,\"Taged\":1,\"UserName\":\"test\",\"UserId\":\"6ba79766-faa0-4259-8139-a4a6d35784e0\",\"Description\":\"\",\"TagedTime\":\"2019-07-29 01:28\",\"NodeConfluenceType\":null,\"ConfluenceOk\":null,\"ConfluenceNo\":null}},{\"id\":\"1564334437844\",\"name\":\"会签入口，设置会签类型\",\"type\":\"fork\",\"left\":141,\"top\":138,\"width\":104,\"height\":76,\"alt\":true,\"setInfo\":{\"NodeDesignate\":\"ALL_USER\",\"NodeDesignateData\":{\"users\":[],\"roles\":[],\"orgs\":null},\"NodeCode\":null,\"NodeName\":null,\"ThirdPartyUrl\":\"\",\"NodeRejectType\":null,\"Taged\":1,\"UserName\":\"admin\",\"UserId\":\"49df1602-f5f3-4d52-afb7-3802da619558\",\"Description\":\"\",\"TagedTime\":\"2019-07-29 01:30\",\"NodeConfluenceType\":\"all\",\"ConfluenceOk\":1,\"ConfluenceNo\":null}},{\"id\":\"1564334439828\",\"name\":\"admin\",\"type\":\"node\",\"left\":23,\"top\":272,\"width\":104,\"height\":36,\"alt\":true,\"setInfo\":{\"NodeDesignate\":\"SPECIAL_USER\",\"NodeDesignateData\":{\"users\":[\"49df1602-f5f3-4d52-afb7-3802da619558\"],\"roles\":[],\"orgs\":null},\"NodeCode\":null,\"NodeName\":null,\"ThirdPartyUrl\":\"\",\"NodeRejectType\":null,\"Taged\":1,\"UserName\":\"admin\",\"UserId\":\"49df1602-f5f3-4d52-afb7-3802da619558\",\"Description\":\"\",\"TagedTime\":\"2019-07-29 01:30\",\"NodeConfluenceType\":\"all\",\"ConfluenceOk\":null,\"ConfluenceNo\":null}},{\"id\":\"1564334440404\",\"name\":\"test\",\"type\":\"node\",\"left\":234,\"top\":265,\"width\":104,\"height\":36,\"alt\":true,\"setInfo\":{\"NodeDesignate\":\"SPECIAL_USER\",\"NodeDesignateData\":{\"users\":[\"6ba79766-faa0-4259-8139-a4a6d35784e0\"],\"roles\":[],\"orgs\":null},\"NodeCode\":null,\"NodeName\":null,\"ThirdPartyUrl\":\"\",\"NodeRejectType\":null,\"Taged\":null,\"UserName\":null,\"UserId\":null,\"Description\":null,\"TagedTime\":null,\"NodeConfluenceType\":\"all\",\"ConfluenceOk\":null,\"ConfluenceNo\":null}},{\"id\":\"1564334441965\",\"name\":\"默认所有人\",\"type\":\"join\",\"left\":140,\"top\":406,\"width\":104,\"height\":56,\"alt\":true,\"setInfo\":{\"NodeDesignate\":\"ALL_USER\",\"NodeDesignateData\":{\"users\":[],\"roles\":[],\"orgs\":null},\"NodeCode\":null,\"NodeName\":null,\"ThirdPartyUrl\":\"\",\"NodeRejectType\":null,\"Taged\":1,\"UserName\":\"admin\",\"UserId\":\"49df1602-f5f3-4d52-afb7-3802da619558\",\"Description\":\"\",\"TagedTime\":\"2019-07-29 01:30\",\"NodeConfluenceType\":\"all\",\"ConfluenceOk\":null,\"ConfluenceNo\":null}},{\"id\":\"1564334444885\",\"name\":\"node_7\",\"type\":\"end round\",\"left\":351,\"top\":420,\"width\":26,\"height\":26,\"alt\":true,\"setInfo\":null}],\"areas\":[]}', '73819920-f085-4003-8874-4361b6461c92', '', '{\"REASON\":\"身体原因\",\"DAYS\":\"1\",\"CUSTOME_NAME\":\"玉宝\"}', '0', '[{\"type\":\"text\",\"name\":\"REASON\",\"title\":\"REASON\",\"value\":\"身体原因\",\"leipiplugins\":\"text\",\"orghide\":\"0\",\"orgalign\":\"left\",\"orgwidth\":\"150\",\"orgtype\":\"text\",\"style\":\"text-align: left; width: 150px;\",\"content\":\"<input name=\\\"leipiNewField\\\" type=\\\"text\\\" title=\\\"REASON\\\" value=\\\"身体原因\\\" leipiplugins=\\\"text\\\" orghide=\\\"0\\\" orgalign=\\\"left\\\" orgwidth=\\\"150\\\" orgtype=\\\"text\\\" style=\\\"text-align: left; width: 150px;\\\"/>\"},{\"leipiplugins\":\"select\",\"name\":\"DAYS\",\"title\":\"DAYS\",\"size\":\"1\",\"orgwidth\":\"150\",\"style\":\"width: 150px;\",\"value\":\"1,3,5,10\",\"selected\":\"selected\",\"content\":\"<span leipiplugins=\\\"select\\\"><select name=\\\"leipiNewField\\\" title=\\\"DAYS\\\" leipiplugins=\\\"select\\\" size=\\\"1\\\" orgwidth=\\\"150\\\" style=\\\"width: 150px;\\\"><option value=\\\"1\\\" selected=\\\"selected\\\">1</option><option value=\\\"3\\\">3</option><option value=\\\"5\\\">5</option><option value=\\\"10\\\">10</option></select>&nbsp;&nbsp;</span>\"},{\"type\":\"text\",\"name\":\"CUSTOME_NAME\",\"title\":\"CUSTOME_NAME\",\"value\":\"玉宝\",\"leipiplugins\":\"text\",\"orghide\":\"0\",\"orgalign\":\"left\",\"orgwidth\":\"150\",\"orgtype\":\"text\",\"style\":\"text-align: left; width: 150px;\",\"content\":\"<input name=\\\"leipiNewField\\\" type=\\\"text\\\" title=\\\"CUSTOME_NAME\\\" value=\\\"玉宝\\\" leipiplugins=\\\"text\\\" orghide=\\\"0\\\" orgalign=\\\"left\\\" orgwidth=\\\"150\\\" orgtype=\\\"text\\\" style=\\\"text-align: left; width: 150px;\\\"/>\"}]', '<p style=\"text-align: center;\"><span style=\"font-size: 36px;\">请假条</span></p><p><span style=\"font-size: 36px;\"><br/></span></p><p style=\"text-align: center;\">因{REASON}，本人想请假{DAYS}天，望领导批准！</p><p><br/></p><p style=\"text-align: center;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;谢谢！</p><p><br/></p><p style=\"text-align: right;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 申请人：{CUSTOME_NAME}</p>', 'ef89f96a-af33-407c-b02e-897faf46ecf0', '', '0', '2019-07-29 01:26:45', '00000000-0000-0000-0000-000000000000', 'System', '0', '', '1', '');
INSERT INTO `flowinstance` VALUES ('0ae5abe6-f571-4e08-b264-667dc27c5025', '', '1564334583446', '带复杂表单的2019-07-29 01:23:03', '1564334557205', '2', 'node_2', '1564334555981', '{\"title\":\"newFlow_1\",\"nodes\":[{\"name\":\"node_1\",\"left\":66,\"top\":46,\"type\":\"start round mix\",\"id\":\"1564334555981\",\"width\":26,\"height\":26,\"alt\":true},{\"name\":\"node_2\",\"left\":50,\"top\":145,\"type\":\"node\",\"id\":\"1564334557205\",\"width\":104,\"height\":26,\"alt\":true},{\"name\":\"node_3\",\"left\":56,\"top\":206,\"type\":\"node\",\"id\":\"1564334557764\",\"width\":104,\"height\":26,\"alt\":true},{\"name\":\"node_4\",\"left\":66,\"top\":294,\"type\":\"end round\",\"id\":\"1564334559716\",\"width\":26,\"height\":26,\"alt\":true}],\"lines\":[{\"type\":\"sl\",\"from\":\"1564334555981\",\"to\":\"1564334557205\",\"id\":\"1564334561500\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334557205\",\"to\":\"1564334557764\",\"id\":\"1564334562229\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334557764\",\"to\":\"1564334559716\",\"id\":\"1564334563268\",\"name\":\"\",\"dash\":false,\"alt\":true}],\"areas\":[],\"initNum\":8}', '989bd1f3-29f0-43cd-ad01-b55654907dbb', 'FrmLeaveReq', '{\"id\":\"\",\"userName\":\"李玉宝\",\"requestType\":\"事假\",\"startDate\":\"2019-07-08T16:00:00.000Z\",\"startTime\":\"2019-07-28T17:23:14.000Z\",\"endDate\":\"2019-07-24T16:00:00.000Z\",\"endTime\":\"2019-07-28T17:23:18.000Z\",\"requestComment\":\"太累了，就是想休息一下\",\"attachment\":\"\",\"files\":[],\"extendInfo\":\"\"}', '1', '', '', '8faff4e5-b729-44d2-ac26-e899a228f63d', '', '0', '2019-07-29 01:23:57', '00000000-0000-0000-0000-000000000000', 'System', '0', '这种结构只能企业版使用', '0', '1');
INSERT INTO `flowinstance` VALUES ('0ee22872-f120-4c5a-84ec-7f4e36bd0141', '', '1564334742060', '带分支条件的请假2019-07-29 01:25:44', '1564334139783', '4', 'node_2', '1564334156607', '{\"title\":\"newFlow_1\",\"initNum\":16,\"lines\":[{\"id\":\"1564334158551\",\"type\":\"sl\",\"from\":\"1564334138399\",\"to\":\"1564334153687\",\"name\":\"\",\"dash\":false,\"Compares\":null},{\"id\":\"1564334159304\",\"type\":\"sl\",\"from\":\"1564334153687\",\"to\":\"1564334154471\",\"name\":\"\",\"dash\":false,\"Compares\":[{\"Operation\":\"<\",\"FieldName\":\"DAYS\",\"FieldType\":null,\"Value\":\"3\"}]},{\"id\":\"1564334160383\",\"type\":\"sl\",\"from\":\"1564334153687\",\"to\":\"1564334155295\",\"name\":\"\",\"dash\":false,\"Compares\":[{\"Operation\":\">=\",\"FieldName\":\"DAYS\",\"FieldType\":null,\"Value\":\"3\"}]},{\"id\":\"1564334161911\",\"type\":\"sl\",\"from\":\"1564334154471\",\"to\":\"1564334156607\",\"name\":\"\",\"dash\":false,\"Compares\":null},{\"id\":\"1564334163959\",\"type\":\"sl\",\"from\":\"1564334155295\",\"to\":\"1564334156607\",\"name\":\"\",\"dash\":false,\"Compares\":null},{\"id\":\"1564334165255\",\"type\":\"sl\",\"from\":\"1564334156607\",\"to\":\"1564334139783\",\"name\":\"\",\"dash\":false,\"Compares\":null}],\"nodes\":[{\"id\":\"1564334138399\",\"name\":\"node_1\",\"type\":\"start round mix\",\"left\":44,\"top\":27,\"width\":26,\"height\":26,\"alt\":true,\"setInfo\":null},{\"id\":\"1564334139783\",\"name\":\"node_2\",\"type\":\"end round\",\"left\":50,\"top\":295,\"width\":26,\"height\":26,\"alt\":true,\"setInfo\":null},{\"id\":\"1564334153687\",\"name\":\"所有人可以审批\",\"type\":\"node\",\"left\":163,\"top\":43,\"width\":104,\"height\":56,\"alt\":true,\"setInfo\":{\"NodeDesignate\":\"ALL_USER\",\"NodeDesignateData\":{\"users\":[],\"roles\":[],\"orgs\":null},\"NodeCode\":null,\"NodeName\":null,\"ThirdPartyUrl\":\"\",\"NodeRejectType\":null,\"Taged\":1,\"UserName\":\"超级管理员\",\"UserId\":\"00000000-0000-0000-0000-000000000000\",\"Description\":\"\",\"TagedTime\":\"2019-07-29 01:26\",\"NodeConfluenceType\":\"all\",\"ConfluenceOk\":null,\"ConfluenceNo\":null}},{\"id\":\"1564334154471\",\"name\":\"小于3的test可以审批\",\"type\":\"node\",\"left\":23,\"top\":141,\"width\":167,\"height\":76,\"alt\":true,\"setInfo\":{\"NodeDesignate\":\"SPECIAL_USER\",\"NodeDesignateData\":{\"users\":[\"6ba79766-faa0-4259-8139-a4a6d35784e0\"],\"roles\":[],\"orgs\":null},\"NodeCode\":null,\"NodeName\":null,\"ThirdPartyUrl\":\"\",\"NodeRejectType\":null,\"Taged\":1,\"UserName\":\"test\",\"UserId\":\"6ba79766-faa0-4259-8139-a4a6d35784e0\",\"Description\":\"\",\"TagedTime\":\"2019-07-29 01:28\",\"NodeConfluenceType\":\"all\",\"ConfluenceOk\":null,\"ConfluenceNo\":null}},{\"id\":\"1564334155295\",\"name\":\"大于3的admin可以审批\",\"type\":\"node\",\"left\":288,\"top\":146,\"width\":143,\"height\":56,\"alt\":true,\"setInfo\":{\"NodeDesignate\":\"SPECIAL_USER\",\"NodeDesignateData\":{\"users\":[\"49df1602-f5f3-4d52-afb7-3802da619558\"],\"roles\":[],\"orgs\":null},\"NodeCode\":null,\"NodeName\":null,\"ThirdPartyUrl\":\"\",\"NodeRejectType\":null,\"Taged\":null,\"UserName\":null,\"UserId\":null,\"Description\":null,\"TagedTime\":null,\"NodeConfluenceType\":\"all\",\"ConfluenceOk\":null,\"ConfluenceNo\":null}},{\"id\":\"1564334156607\",\"name\":\"默认\",\"type\":\"node\",\"left\":171,\"top\":291,\"width\":104,\"height\":36,\"alt\":true,\"setInfo\":{\"NodeDesignate\":\"ALL_USER\",\"NodeDesignateData\":{\"users\":[],\"roles\":[],\"orgs\":null},\"NodeCode\":null,\"NodeName\":null,\"ThirdPartyUrl\":\"\",\"NodeRejectType\":null,\"Taged\":1,\"UserName\":\"admin\",\"UserId\":\"49df1602-f5f3-4d52-afb7-3802da619558\",\"Description\":\"\",\"TagedTime\":\"2019-07-29 01:30\",\"NodeConfluenceType\":\"all\",\"ConfluenceOk\":null,\"ConfluenceNo\":null}}],\"areas\":[]}', 'bfd4f0f9-6f61-4af9-977e-cbcf7c30dd35', '', '{\"REASON\":\"身体原因\",\"DAYS\":\"1\",\"CUSTOME_NAME\":\"玉宝\"}', '0', '[{\"type\":\"text\",\"name\":\"REASON\",\"title\":\"REASON\",\"value\":\"身体原因\",\"leipiplugins\":\"text\",\"orghide\":\"0\",\"orgalign\":\"left\",\"orgwidth\":\"150\",\"orgtype\":\"text\",\"style\":\"text-align: left; width: 150px;\",\"content\":\"<input name=\\\"leipiNewField\\\" type=\\\"text\\\" title=\\\"REASON\\\" value=\\\"身体原因\\\" leipiplugins=\\\"text\\\" orghide=\\\"0\\\" orgalign=\\\"left\\\" orgwidth=\\\"150\\\" orgtype=\\\"text\\\" style=\\\"text-align: left; width: 150px;\\\"/>\"},{\"leipiplugins\":\"select\",\"name\":\"DAYS\",\"title\":\"DAYS\",\"size\":\"1\",\"orgwidth\":\"150\",\"style\":\"width: 150px;\",\"value\":\"1,3,5,10\",\"selected\":\"selected\",\"content\":\"<span leipiplugins=\\\"select\\\"><select name=\\\"leipiNewField\\\" title=\\\"DAYS\\\" leipiplugins=\\\"select\\\" size=\\\"1\\\" orgwidth=\\\"150\\\" style=\\\"width: 150px;\\\"><option value=\\\"1\\\" selected=\\\"selected\\\">1</option><option value=\\\"3\\\">3</option><option value=\\\"5\\\">5</option><option value=\\\"10\\\">10</option></select>&nbsp;&nbsp;</span>\"},{\"type\":\"text\",\"name\":\"CUSTOME_NAME\",\"title\":\"CUSTOME_NAME\",\"value\":\"玉宝\",\"leipiplugins\":\"text\",\"orghide\":\"0\",\"orgalign\":\"left\",\"orgwidth\":\"150\",\"orgtype\":\"text\",\"style\":\"text-align: left; width: 150px;\",\"content\":\"<input name=\\\"leipiNewField\\\" type=\\\"text\\\" title=\\\"CUSTOME_NAME\\\" value=\\\"玉宝\\\" leipiplugins=\\\"text\\\" orghide=\\\"0\\\" orgalign=\\\"left\\\" orgwidth=\\\"150\\\" orgtype=\\\"text\\\" style=\\\"text-align: left; width: 150px;\\\"/>\"}]', '<p style=\"text-align: center;\"><span style=\"font-size: 36px;\">请假条</span></p><p><span style=\"font-size: 36px;\"><br/></span></p><p style=\"text-align: center;\">因{REASON}，本人想请假{DAYS}天，望领导批准！</p><p><br/></p><p style=\"text-align: center;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;谢谢！</p><p><br/></p><p style=\"text-align: right;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 申请人：{CUSTOME_NAME}</p>', 'ef89f96a-af33-407c-b02e-897faf46ecf0', '', '0', '2019-07-29 01:25:56', '00000000-0000-0000-0000-000000000000', 'System', '0', '这个时执行完成的', '1', '');
INSERT INTO `flowinstance` VALUES ('20be4e87-0e9e-467c-9011-3c6ccd650931', '', '1564334643592', '会签2019-07-29 01:24:05', '1564334435460', '2', 'node_2', '1564334430924', '{\"title\":\"newFlow_1\",\"nodes\":[{\"name\":\"node_1\",\"left\":17,\"top\":12,\"type\":\"start round mix\",\"id\":\"1564334430924\",\"width\":26,\"height\":26,\"alt\":true},{\"name\":\"node_2\",\"left\":141,\"top\":49,\"type\":\"node\",\"id\":\"1564334435460\",\"width\":104,\"height\":26,\"alt\":true},{\"name\":\"会签入口，设置会签类型\",\"left\":141,\"top\":138,\"type\":\"fork\",\"id\":\"1564334437844\",\"width\":104,\"height\":76,\"alt\":true,\"setInfo\":{\"NodeConfluenceType\":\"all\",\"NodeDesignate\":\"ALL_USER\",\"ThirdPartyUrl\":\"\",\"NodeDesignateData\":{\"users\":[],\"roles\":[]}}},{\"name\":\"admin\",\"left\":23,\"top\":272,\"type\":\"node\",\"id\":\"1564334439828\",\"width\":104,\"height\":36,\"alt\":true,\"setInfo\":{\"NodeConfluenceType\":\"all\",\"NodeDesignate\":\"SPECIAL_USER\",\"ThirdPartyUrl\":\"\",\"NodeDesignateData\":{\"users\":[\"49df1602-f5f3-4d52-afb7-3802da619558\"],\"roles\":[]}}},{\"name\":\"test\",\"left\":234,\"top\":265,\"type\":\"node\",\"id\":\"1564334440404\",\"width\":104,\"height\":36,\"alt\":true,\"setInfo\":{\"NodeConfluenceType\":\"all\",\"NodeDesignate\":\"SPECIAL_USER\",\"ThirdPartyUrl\":\"\",\"NodeDesignateData\":{\"users\":[\"6ba79766-faa0-4259-8139-a4a6d35784e0\"],\"roles\":[]}}},{\"name\":\"默认所有人\",\"left\":140,\"top\":406,\"type\":\"join\",\"id\":\"1564334441965\",\"width\":104,\"height\":56,\"alt\":true,\"setInfo\":{\"NodeConfluenceType\":\"all\",\"NodeDesignate\":\"ALL_USER\",\"ThirdPartyUrl\":\"\",\"NodeDesignateData\":{\"users\":[],\"roles\":[]}}},{\"name\":\"node_7\",\"left\":351,\"top\":420,\"type\":\"end round\",\"id\":\"1564334444885\",\"width\":26,\"height\":26,\"alt\":true}],\"lines\":[{\"type\":\"sl\",\"from\":\"1564334430924\",\"to\":\"1564334435460\",\"id\":\"1564334446774\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334435460\",\"to\":\"1564334437844\",\"id\":\"1564334447796\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334437844\",\"to\":\"1564334439828\",\"id\":\"1564334448572\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334437844\",\"to\":\"1564334440404\",\"id\":\"1564334449628\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334439828\",\"to\":\"1564334441965\",\"id\":\"1564334450572\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334440404\",\"to\":\"1564334441965\",\"id\":\"1564334451684\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334441965\",\"to\":\"1564334444885\",\"id\":\"1564334453900\",\"name\":\"\",\"dash\":false,\"alt\":true}],\"areas\":[],\"initNum\":16}', '73819920-f085-4003-8874-4361b6461c92', '', '{\"REASON\":\"身体原因\",\"DAYS\":\"3\",\"CUSTOME_NAME\":\"玉宝\"}', '0', '[{\"type\":\"text\",\"name\":\"REASON\",\"title\":\"REASON\",\"value\":\"身体原因\",\"leipiplugins\":\"text\",\"orghide\":\"0\",\"orgalign\":\"left\",\"orgwidth\":\"150\",\"orgtype\":\"text\",\"style\":\"text-align: left; width: 150px;\",\"content\":\"<input name=\\\"leipiNewField\\\" type=\\\"text\\\" title=\\\"REASON\\\" value=\\\"身体原因\\\" leipiplugins=\\\"text\\\" orghide=\\\"0\\\" orgalign=\\\"left\\\" orgwidth=\\\"150\\\" orgtype=\\\"text\\\" style=\\\"text-align: left; width: 150px;\\\"/>\"},{\"leipiplugins\":\"select\",\"name\":\"DAYS\",\"title\":\"DAYS\",\"size\":\"1\",\"orgwidth\":\"150\",\"style\":\"width: 150px;\",\"value\":\"1,3,5,10\",\"selected\":\"selected\",\"content\":\"<span leipiplugins=\\\"select\\\"><select name=\\\"leipiNewField\\\" title=\\\"DAYS\\\" leipiplugins=\\\"select\\\" size=\\\"1\\\" orgwidth=\\\"150\\\" style=\\\"width: 150px;\\\"><option value=\\\"1\\\" selected=\\\"selected\\\">1</option><option value=\\\"3\\\">3</option><option value=\\\"5\\\">5</option><option value=\\\"10\\\">10</option></select>&nbsp;&nbsp;</span>\"},{\"type\":\"text\",\"name\":\"CUSTOME_NAME\",\"title\":\"CUSTOME_NAME\",\"value\":\"玉宝\",\"leipiplugins\":\"text\",\"orghide\":\"0\",\"orgalign\":\"left\",\"orgwidth\":\"150\",\"orgtype\":\"text\",\"style\":\"text-align: left; width: 150px;\",\"content\":\"<input name=\\\"leipiNewField\\\" type=\\\"text\\\" title=\\\"CUSTOME_NAME\\\" value=\\\"玉宝\\\" leipiplugins=\\\"text\\\" orghide=\\\"0\\\" orgalign=\\\"left\\\" orgwidth=\\\"150\\\" orgtype=\\\"text\\\" style=\\\"text-align: left; width: 150px;\\\"/>\"}]', '<p style=\"text-align: center;\"><span style=\"font-size: 36px;\">请假条</span></p><p><span style=\"font-size: 36px;\"><br/></span></p><p style=\"text-align: center;\">因{REASON}，本人想请假{DAYS}天，望领导批准！</p><p><br/></p><p style=\"text-align: center;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;谢谢！</p><p><br/></p><p style=\"text-align: right;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 申请人：{CUSTOME_NAME}</p>', 'ef89f96a-af33-407c-b02e-897faf46ecf0', '', '0', '2019-07-29 01:24:14', '00000000-0000-0000-0000-000000000000', 'System', '0', '', '0', '1');
INSERT INTO `flowinstance` VALUES ('36677c40-a258-410e-82c3-12d2a1564813', '', '1571904309691', '测试流程12019-10-24 16:05:09', '1571904276712', '4', 'node_3', '1571904274697', '{\"title\":\"newFlow_1\",\"initNum\":7,\"lines\":[{\"id\":\"1571904280728\",\"type\":\"sl\",\"from\":\"1571904270595\",\"to\":\"1571904274697\",\"name\":\"\",\"dash\":false,\"Compares\":null},{\"id\":\"1571904282856\",\"type\":\"sl\",\"from\":\"1571904274697\",\"to\":\"1571904276712\",\"name\":\"\",\"dash\":false,\"Compares\":null}],\"nodes\":[{\"id\":\"1571904270595\",\"name\":\"node_1\",\"type\":\"start round mix\",\"left\":410,\"top\":56,\"width\":26,\"height\":26,\"alt\":true,\"setInfo\":null},{\"id\":\"1571904274697\",\"name\":\"node_2\",\"type\":\"node\",\"left\":417,\"top\":156,\"width\":104,\"height\":26,\"alt\":true,\"setInfo\":{\"NodeDesignate\":\"ALL_USER\",\"NodeDesignateData\":{\"users\":[],\"roles\":[],\"orgs\":null},\"NodeCode\":null,\"NodeName\":null,\"ThirdPartyUrl\":\"\",\"NodeRejectType\":null,\"Taged\":1,\"UserName\":\"test\",\"UserId\":\"6ba79766-faa0-4259-8139-a4a6d35784e0\",\"Description\":\"同意测试\",\"TagedTime\":\"2019-10-24 16:12\",\"NodeConfluenceType\":\"all\",\"ConfluenceOk\":null,\"ConfluenceNo\":null}},{\"id\":\"1571904276712\",\"name\":\"node_3\",\"type\":\"end round\",\"left\":392,\"top\":254,\"width\":26,\"height\":26,\"alt\":true,\"setInfo\":null}],\"areas\":[]}', '020ea0f9-6968-4f1d-8a74-24784dd9047b', '', '{}', '0', '[]', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;测试表单&nbsp; &nbsp; 测试内容&nbsp;</p><p>&nbsp; &nbsp; &nbsp;\n &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;<iframe src=\"/static/ueditor/formdesign/el-input.html?info=%7B%22gValue%22:%22%25E6%25B5%258B%25E8%25AF%2595%25E9%2599%2584%25E4%25BB%25B6%22,%22gTitle%22:%22%25E6%25B5%258B%25E8%25AF%2595%25E9%2599%2584%25E4%25BB%25B6%22,%22gAlign%22:%22left%22,%22gWidth%22:%22150%22,%22gHeight%22:%22150%22%7D\" leipiplugins=\"element\" style=\"height:100px;\"></iframe>\n &nbsp; &nbsp;</p><br/>', '0c73bd9e-0f4e-4cc2-8a5c-73bd2e4affe0', '', '0', '2019-10-24 16:05:32', '00000000-0000-0000-0000-000000000000', 'System', '0', '测是', '1', '');
INSERT INTO `flowinstance` VALUES ('61959fe9-377a-4e6c-9f5d-6b7018a80bca', '', '1564334700493', '带分支条件的请假2019-07-29 01:25:02', '1564334154471', '2', '小于3的test可以审批', '1564334153687', '{\"title\":\"newFlow_1\",\"initNum\":16,\"lines\":[{\"id\":\"1564334158551\",\"type\":\"sl\",\"from\":\"1564334138399\",\"to\":\"1564334153687\",\"name\":\"\",\"dash\":false,\"Compares\":null},{\"id\":\"1564334159304\",\"type\":\"sl\",\"from\":\"1564334153687\",\"to\":\"1564334154471\",\"name\":\"\",\"dash\":false,\"Compares\":[{\"Operation\":\"<\",\"FieldName\":\"DAYS\",\"FieldType\":null,\"Value\":\"3\"}]},{\"id\":\"1564334160383\",\"type\":\"sl\",\"from\":\"1564334153687\",\"to\":\"1564334155295\",\"name\":\"\",\"dash\":false,\"Compares\":[{\"Operation\":\">=\",\"FieldName\":\"DAYS\",\"FieldType\":null,\"Value\":\"3\"}]},{\"id\":\"1564334161911\",\"type\":\"sl\",\"from\":\"1564334154471\",\"to\":\"1564334156607\",\"name\":\"\",\"dash\":false,\"Compares\":null},{\"id\":\"1564334163959\",\"type\":\"sl\",\"from\":\"1564334155295\",\"to\":\"1564334156607\",\"name\":\"\",\"dash\":false,\"Compares\":null},{\"id\":\"1564334165255\",\"type\":\"sl\",\"from\":\"1564334156607\",\"to\":\"1564334139783\",\"name\":\"\",\"dash\":false,\"Compares\":null}],\"nodes\":[{\"id\":\"1564334138399\",\"name\":\"node_1\",\"type\":\"start round mix\",\"left\":44,\"top\":27,\"width\":26,\"height\":26,\"alt\":true,\"setInfo\":null},{\"id\":\"1564334139783\",\"name\":\"node_2\",\"type\":\"end round\",\"left\":50,\"top\":295,\"width\":26,\"height\":26,\"alt\":true,\"setInfo\":null},{\"id\":\"1564334153687\",\"name\":\"所有人可以审批\",\"type\":\"node\",\"left\":163,\"top\":43,\"width\":104,\"height\":56,\"alt\":true,\"setInfo\":{\"NodeDesignate\":\"ALL_USER\",\"NodeDesignateData\":{\"users\":[],\"roles\":[],\"orgs\":null},\"NodeCode\":null,\"NodeName\":null,\"ThirdPartyUrl\":\"\",\"NodeRejectType\":null,\"Taged\":1,\"UserName\":\"test\",\"UserId\":\"6ba79766-faa0-4259-8139-a4a6d35784e0\",\"Description\":\"\",\"TagedTime\":\"2019-07-29 01:29\",\"NodeConfluenceType\":\"all\",\"ConfluenceOk\":null,\"ConfluenceNo\":null}},{\"id\":\"1564334154471\",\"name\":\"小于3的test可以审批\",\"type\":\"node\",\"left\":23,\"top\":141,\"width\":167,\"height\":76,\"alt\":true,\"setInfo\":{\"NodeDesignate\":\"SPECIAL_USER\",\"NodeDesignateData\":{\"users\":[\"6ba79766-faa0-4259-8139-a4a6d35784e0\"],\"roles\":[],\"orgs\":null},\"NodeCode\":null,\"NodeName\":null,\"ThirdPartyUrl\":\"\",\"NodeRejectType\":null,\"Taged\":null,\"UserName\":null,\"UserId\":null,\"Description\":null,\"TagedTime\":null,\"NodeConfluenceType\":\"all\",\"ConfluenceOk\":null,\"ConfluenceNo\":null}},{\"id\":\"1564334155295\",\"name\":\"大于3的admin可以审批\",\"type\":\"node\",\"left\":288,\"top\":146,\"width\":143,\"height\":56,\"alt\":true,\"setInfo\":{\"NodeDesignate\":\"SPECIAL_USER\",\"NodeDesignateData\":{\"users\":[\"49df1602-f5f3-4d52-afb7-3802da619558\"],\"roles\":[],\"orgs\":null},\"NodeCode\":null,\"NodeName\":null,\"ThirdPartyUrl\":\"\",\"NodeRejectType\":null,\"Taged\":null,\"UserName\":null,\"UserId\":null,\"Description\":null,\"TagedTime\":null,\"NodeConfluenceType\":\"all\",\"ConfluenceOk\":null,\"ConfluenceNo\":null}},{\"id\":\"1564334156607\",\"name\":\"默认\",\"type\":\"node\",\"left\":171,\"top\":291,\"width\":104,\"height\":36,\"alt\":true,\"setInfo\":{\"NodeDesignate\":\"ALL_USER\",\"NodeDesignateData\":{\"users\":[],\"roles\":[],\"orgs\":null},\"NodeCode\":null,\"NodeName\":null,\"ThirdPartyUrl\":\"\",\"NodeRejectType\":null,\"Taged\":null,\"UserName\":null,\"UserId\":null,\"Description\":null,\"TagedTime\":null,\"NodeConfluenceType\":\"all\",\"ConfluenceOk\":null,\"ConfluenceNo\":null}}],\"areas\":[]}', 'bfd4f0f9-6f61-4af9-977e-cbcf7c30dd35', '', '{\"REASON\":\"身体原因\",\"DAYS\":\"1\",\"CUSTOME_NAME\":\"玉宝\"}', '0', '[{\"type\":\"text\",\"name\":\"REASON\",\"title\":\"REASON\",\"value\":\"身体原因\",\"leipiplugins\":\"text\",\"orghide\":\"0\",\"orgalign\":\"left\",\"orgwidth\":\"150\",\"orgtype\":\"text\",\"style\":\"text-align: left; width: 150px;\",\"content\":\"<input name=\\\"leipiNewField\\\" type=\\\"text\\\" title=\\\"REASON\\\" value=\\\"身体原因\\\" leipiplugins=\\\"text\\\" orghide=\\\"0\\\" orgalign=\\\"left\\\" orgwidth=\\\"150\\\" orgtype=\\\"text\\\" style=\\\"text-align: left; width: 150px;\\\"/>\"},{\"leipiplugins\":\"select\",\"name\":\"DAYS\",\"title\":\"DAYS\",\"size\":\"1\",\"orgwidth\":\"150\",\"style\":\"width: 150px;\",\"value\":\"1,3,5,10\",\"selected\":\"selected\",\"content\":\"<span leipiplugins=\\\"select\\\"><select name=\\\"leipiNewField\\\" title=\\\"DAYS\\\" leipiplugins=\\\"select\\\" size=\\\"1\\\" orgwidth=\\\"150\\\" style=\\\"width: 150px;\\\"><option value=\\\"1\\\" selected=\\\"selected\\\">1</option><option value=\\\"3\\\">3</option><option value=\\\"5\\\">5</option><option value=\\\"10\\\">10</option></select>&nbsp;&nbsp;</span>\"},{\"type\":\"text\",\"name\":\"CUSTOME_NAME\",\"title\":\"CUSTOME_NAME\",\"value\":\"玉宝\",\"leipiplugins\":\"text\",\"orghide\":\"0\",\"orgalign\":\"left\",\"orgwidth\":\"150\",\"orgtype\":\"text\",\"style\":\"text-align: left; width: 150px;\",\"content\":\"<input name=\\\"leipiNewField\\\" type=\\\"text\\\" title=\\\"CUSTOME_NAME\\\" value=\\\"玉宝\\\" leipiplugins=\\\"text\\\" orghide=\\\"0\\\" orgalign=\\\"left\\\" orgwidth=\\\"150\\\" orgtype=\\\"text\\\" style=\\\"text-align: left; width: 150px;\\\"/>\"}]', '<p style=\"text-align: center;\"><span style=\"font-size: 36px;\">请假条</span></p><p><span style=\"font-size: 36px;\"><br/></span></p><p style=\"text-align: center;\">因{REASON}，本人想请假{DAYS}天，望领导批准！</p><p><br/></p><p style=\"text-align: center;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;谢谢！</p><p><br/></p><p style=\"text-align: right;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 申请人：{CUSTOME_NAME}</p>', 'ef89f96a-af33-407c-b02e-897faf46ecf0', '', '0', '2019-07-29 01:25:16', '00000000-0000-0000-0000-000000000000', 'System', '0', '这是个天数比较少的分支', '0', '6ba79766-faa0-4259-8139-a4a6d35784e0');
INSERT INTO `flowinstance` VALUES ('7a1fb1a4-06a6-49d5-a311-b988aed776e1', '', '1564334976909', 'admin的会签2019-07-29 01:29:39', '1564334435460', '2', 'node_2', '1564334430924', '{\"title\":\"newFlow_1\",\"nodes\":[{\"name\":\"node_1\",\"left\":17,\"top\":12,\"type\":\"start round mix\",\"id\":\"1564334430924\",\"width\":26,\"height\":26,\"alt\":true},{\"name\":\"node_2\",\"left\":141,\"top\":49,\"type\":\"node\",\"id\":\"1564334435460\",\"width\":104,\"height\":26,\"alt\":true},{\"name\":\"会签入口，设置会签类型\",\"left\":141,\"top\":138,\"type\":\"fork\",\"id\":\"1564334437844\",\"width\":104,\"height\":76,\"alt\":true,\"setInfo\":{\"NodeConfluenceType\":\"all\",\"NodeDesignate\":\"ALL_USER\",\"ThirdPartyUrl\":\"\",\"NodeDesignateData\":{\"users\":[],\"roles\":[]}}},{\"name\":\"admin\",\"left\":23,\"top\":272,\"type\":\"node\",\"id\":\"1564334439828\",\"width\":104,\"height\":36,\"alt\":true,\"setInfo\":{\"NodeConfluenceType\":\"all\",\"NodeDesignate\":\"SPECIAL_USER\",\"ThirdPartyUrl\":\"\",\"NodeDesignateData\":{\"users\":[\"49df1602-f5f3-4d52-afb7-3802da619558\"],\"roles\":[]}}},{\"name\":\"test\",\"left\":234,\"top\":265,\"type\":\"node\",\"id\":\"1564334440404\",\"width\":104,\"height\":36,\"alt\":true,\"setInfo\":{\"NodeConfluenceType\":\"all\",\"NodeDesignate\":\"SPECIAL_USER\",\"ThirdPartyUrl\":\"\",\"NodeDesignateData\":{\"users\":[\"6ba79766-faa0-4259-8139-a4a6d35784e0\"],\"roles\":[]}}},{\"name\":\"默认所有人\",\"left\":140,\"top\":406,\"type\":\"join\",\"id\":\"1564334441965\",\"width\":104,\"height\":56,\"alt\":true,\"setInfo\":{\"NodeConfluenceType\":\"all\",\"NodeDesignate\":\"ALL_USER\",\"ThirdPartyUrl\":\"\",\"NodeDesignateData\":{\"users\":[],\"roles\":[]}}},{\"name\":\"node_7\",\"left\":351,\"top\":420,\"type\":\"end round\",\"id\":\"1564334444885\",\"width\":26,\"height\":26,\"alt\":true}],\"lines\":[{\"type\":\"sl\",\"from\":\"1564334430924\",\"to\":\"1564334435460\",\"id\":\"1564334446774\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334435460\",\"to\":\"1564334437844\",\"id\":\"1564334447796\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334437844\",\"to\":\"1564334439828\",\"id\":\"1564334448572\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334437844\",\"to\":\"1564334440404\",\"id\":\"1564334449628\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334439828\",\"to\":\"1564334441965\",\"id\":\"1564334450572\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334440404\",\"to\":\"1564334441965\",\"id\":\"1564334451684\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334441965\",\"to\":\"1564334444885\",\"id\":\"1564334453900\",\"name\":\"\",\"dash\":false,\"alt\":true}],\"areas\":[],\"initNum\":16}', '73819920-f085-4003-8874-4361b6461c92', '', '{\"REASON\":\"身体原因\",\"DAYS\":\"1\",\"CUSTOME_NAME\":\"玉宝\"}', '0', '[{\"type\":\"text\",\"name\":\"REASON\",\"title\":\"REASON\",\"value\":\"身体原因\",\"leipiplugins\":\"text\",\"orghide\":\"0\",\"orgalign\":\"left\",\"orgwidth\":\"150\",\"orgtype\":\"text\",\"style\":\"text-align: left; width: 150px;\",\"content\":\"<input name=\\\"leipiNewField\\\" type=\\\"text\\\" title=\\\"REASON\\\" value=\\\"身体原因\\\" leipiplugins=\\\"text\\\" orghide=\\\"0\\\" orgalign=\\\"left\\\" orgwidth=\\\"150\\\" orgtype=\\\"text\\\" style=\\\"text-align: left; width: 150px;\\\"/>\"},{\"leipiplugins\":\"select\",\"name\":\"DAYS\",\"title\":\"DAYS\",\"size\":\"1\",\"orgwidth\":\"150\",\"style\":\"width: 150px;\",\"value\":\"1,3,5,10\",\"selected\":\"selected\",\"content\":\"<span leipiplugins=\\\"select\\\"><select name=\\\"leipiNewField\\\" title=\\\"DAYS\\\" leipiplugins=\\\"select\\\" size=\\\"1\\\" orgwidth=\\\"150\\\" style=\\\"width: 150px;\\\"><option value=\\\"1\\\" selected=\\\"selected\\\">1</option><option value=\\\"3\\\">3</option><option value=\\\"5\\\">5</option><option value=\\\"10\\\">10</option></select>&nbsp;&nbsp;</span>\"},{\"type\":\"text\",\"name\":\"CUSTOME_NAME\",\"title\":\"CUSTOME_NAME\",\"value\":\"玉宝\",\"leipiplugins\":\"text\",\"orghide\":\"0\",\"orgalign\":\"left\",\"orgwidth\":\"150\",\"orgtype\":\"text\",\"style\":\"text-align: left; width: 150px;\",\"content\":\"<input name=\\\"leipiNewField\\\" type=\\\"text\\\" title=\\\"CUSTOME_NAME\\\" value=\\\"玉宝\\\" leipiplugins=\\\"text\\\" orghide=\\\"0\\\" orgalign=\\\"left\\\" orgwidth=\\\"150\\\" orgtype=\\\"text\\\" style=\\\"text-align: left; width: 150px;\\\"/>\"}]', '<p style=\"text-align: center;\"><span style=\"font-size: 36px;\">请假条</span></p><p><span style=\"font-size: 36px;\"><br/></span></p><p style=\"text-align: center;\">因{REASON}，本人想请假{DAYS}天，望领导批准！</p><p><br/></p><p style=\"text-align: center;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;谢谢！</p><p><br/></p><p style=\"text-align: right;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 申请人：{CUSTOME_NAME}</p>', 'ef89f96a-af33-407c-b02e-897faf46ecf0', '', '0', '2019-07-29 01:29:47', '49df1602-f5f3-4d52-afb7-3802da619558', 'admin', '0', '', '0', '1');
INSERT INTO `flowinstance` VALUES ('b918eb3a-0fd4-4df9-a3a3-0bbf2aa5746d', '', '1564334869743', 'test的普通请假2019-07-29 01:27:53', '1564334035352', '2', '所有人可以审批', '1564334032785', '{\"title\":\"newFlow_1\",\"initNum\":9,\"lines\":[{\"id\":\"1564334041040\",\"type\":\"sl\",\"from\":\"1564334032785\",\"to\":\"1564334035352\",\"name\":\"\",\"dash\":false,\"Compares\":null},{\"id\":\"1564334041720\",\"type\":\"sl\",\"from\":\"1564334035352\",\"to\":\"1564334036152\",\"name\":\"\",\"dash\":false,\"Compares\":null},{\"id\":\"1564334042927\",\"type\":\"sl\",\"from\":\"1564334036152\",\"to\":\"1564334038904\",\"name\":\"\",\"dash\":false,\"Compares\":null}],\"nodes\":[{\"id\":\"1564334032785\",\"name\":\"node_1\",\"type\":\"start round mix\",\"left\":19,\"top\":36,\"width\":26,\"height\":26,\"alt\":true,\"setInfo\":null},{\"id\":\"1564334035352\",\"name\":\"所有人可以审批\",\"type\":\"node\",\"left\":133,\"top\":50,\"width\":104,\"height\":56,\"alt\":true,\"setInfo\":{\"NodeDesignate\":\"ALL_USER\",\"NodeDesignateData\":{\"users\":[],\"roles\":[],\"orgs\":null},\"NodeCode\":null,\"NodeName\":null,\"ThirdPartyUrl\":\"http://xxxx.com/api/workflow/callback\",\"NodeRejectType\":null,\"Taged\":2,\"UserName\":\"超级管理员\",\"UserId\":\"00000000-0000-0000-0000-000000000000\",\"Description\":\"ssdfad\",\"TagedTime\":\"2019-10-22 19:13\",\"NodeConfluenceType\":\"all\",\"ConfluenceOk\":null,\"ConfluenceNo\":null}},{\"id\":\"1564334036152\",\"name\":\"所有人可以审批\",\"type\":\"node\",\"left\":139,\"top\":123,\"width\":104,\"height\":56,\"alt\":true,\"setInfo\":{\"NodeDesignate\":\"ALL_USER\",\"NodeDesignateData\":{\"users\":[],\"roles\":[],\"orgs\":null},\"NodeCode\":null,\"NodeName\":null,\"ThirdPartyUrl\":\"\",\"NodeRejectType\":null,\"Taged\":null,\"UserName\":null,\"UserId\":null,\"Description\":null,\"TagedTime\":null,\"NodeConfluenceType\":\"all\",\"ConfluenceOk\":null,\"ConfluenceNo\":null}},{\"id\":\"1564334038904\",\"name\":\"node_4\",\"type\":\"end round\",\"left\":47,\"top\":193,\"width\":26,\"height\":26,\"alt\":true,\"setInfo\":null}],\"areas\":[]}', '61806396-9498-492b-bc22-9f9e95a389bc', '', '{\"REASON\":\"身体原因\",\"DAYS\":\"1\",\"CUSTOME_NAME\":\"玉宝\"}', '0', '[{\"type\":\"text\",\"name\":\"REASON\",\"title\":\"REASON\",\"value\":\"身体原因\",\"leipiplugins\":\"text\",\"orghide\":\"0\",\"orgalign\":\"left\",\"orgwidth\":\"150\",\"orgtype\":\"text\",\"style\":\"text-align: left; width: 150px;\",\"content\":\"<input name=\\\"leipiNewField\\\" type=\\\"text\\\" title=\\\"REASON\\\" value=\\\"身体原因\\\" leipiplugins=\\\"text\\\" orghide=\\\"0\\\" orgalign=\\\"left\\\" orgwidth=\\\"150\\\" orgtype=\\\"text\\\" style=\\\"text-align: left; width: 150px;\\\"/>\"},{\"leipiplugins\":\"select\",\"name\":\"DAYS\",\"title\":\"DAYS\",\"size\":\"1\",\"orgwidth\":\"150\",\"style\":\"width: 150px;\",\"value\":\"1,3,5,10\",\"selected\":\"selected\",\"content\":\"<span leipiplugins=\\\"select\\\"><select name=\\\"leipiNewField\\\" title=\\\"DAYS\\\" leipiplugins=\\\"select\\\" size=\\\"1\\\" orgwidth=\\\"150\\\" style=\\\"width: 150px;\\\"><option value=\\\"1\\\" selected=\\\"selected\\\">1</option><option value=\\\"3\\\">3</option><option value=\\\"5\\\">5</option><option value=\\\"10\\\">10</option></select>&nbsp;&nbsp;</span>\"},{\"type\":\"text\",\"name\":\"CUSTOME_NAME\",\"title\":\"CUSTOME_NAME\",\"value\":\"玉宝\",\"leipiplugins\":\"text\",\"orghide\":\"0\",\"orgalign\":\"left\",\"orgwidth\":\"150\",\"orgtype\":\"text\",\"style\":\"text-align: left; width: 150px;\",\"content\":\"<input name=\\\"leipiNewField\\\" type=\\\"text\\\" title=\\\"CUSTOME_NAME\\\" value=\\\"玉宝\\\" leipiplugins=\\\"text\\\" orghide=\\\"0\\\" orgalign=\\\"left\\\" orgwidth=\\\"150\\\" orgtype=\\\"text\\\" style=\\\"text-align: left; width: 150px;\\\"/>\"}]', '<p style=\"text-align: center;\"><span style=\"font-size: 36px;\">请假条</span></p><p><span style=\"font-size: 36px;\"><br/></span></p><p style=\"text-align: center;\">因{REASON}，本人想请假{DAYS}天，望领导批准！</p><p><br/></p><p style=\"text-align: center;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;谢谢！</p><p><br/></p><p style=\"text-align: right;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 申请人：{CUSTOME_NAME}</p>', 'ef89f96a-af33-407c-b02e-897faf46ecf0', '', '0', '2019-07-29 01:28:05', '6ba79766-faa0-4259-8139-a4a6d35784e0', 'test', '0', '', '3', '1');
INSERT INTO `flowinstance` VALUES ('be9b74cf-2e74-40f3-9ebf-3508f6e79bde', '', '1564334669608', '带分支条件的请假（很多天数）', '1564334153687', '2', '所有人可以审批', '1564334138399', '{\"title\":\"newFlow_1\",\"nodes\":[{\"name\":\"node_1\",\"left\":44,\"top\":27,\"type\":\"start round mix\",\"id\":\"1564334138399\",\"width\":26,\"height\":26,\"alt\":true},{\"name\":\"node_2\",\"left\":50,\"top\":295,\"type\":\"end round\",\"id\":\"1564334139783\",\"width\":26,\"height\":26,\"alt\":true},{\"name\":\"所有人可以审批\",\"left\":163,\"top\":43,\"type\":\"node\",\"id\":\"1564334153687\",\"width\":104,\"height\":56,\"alt\":true,\"setInfo\":{\"NodeConfluenceType\":\"all\",\"NodeDesignate\":\"ALL_USER\",\"ThirdPartyUrl\":\"\",\"NodeDesignateData\":{\"users\":[],\"roles\":[]}}},{\"name\":\"小于3的test可以审批\",\"left\":23,\"top\":141,\"type\":\"node\",\"id\":\"1564334154471\",\"width\":167,\"height\":76,\"alt\":true,\"setInfo\":{\"NodeConfluenceType\":\"all\",\"NodeDesignate\":\"SPECIAL_USER\",\"ThirdPartyUrl\":\"\",\"NodeDesignateData\":{\"users\":[\"6ba79766-faa0-4259-8139-a4a6d35784e0\"],\"roles\":[]}}},{\"name\":\"大于3的admin可以审批\",\"left\":288,\"top\":146,\"type\":\"node\",\"id\":\"1564334155295\",\"width\":143,\"height\":56,\"alt\":true,\"setInfo\":{\"NodeConfluenceType\":\"all\",\"NodeDesignate\":\"SPECIAL_USER\",\"ThirdPartyUrl\":\"\",\"NodeDesignateData\":{\"users\":[\"49df1602-f5f3-4d52-afb7-3802da619558\"],\"roles\":[]}}},{\"name\":\"默认\",\"left\":171,\"top\":291,\"type\":\"node\",\"id\":\"1564334156607\",\"width\":104,\"height\":36,\"alt\":true,\"setInfo\":{\"NodeConfluenceType\":\"all\",\"NodeDesignate\":\"ALL_USER\",\"ThirdPartyUrl\":\"\",\"NodeDesignateData\":{\"users\":[],\"roles\":[]}}}],\"lines\":[{\"type\":\"sl\",\"from\":\"1564334138399\",\"to\":\"1564334153687\",\"id\":\"1564334158551\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334153687\",\"to\":\"1564334154471\",\"id\":\"1564334159304\",\"name\":\"\",\"dash\":false,\"alt\":true,\"Compares\":[{\"FieldName\":\"DAYS\",\"Operation\":\"<\",\"Value\":\"3\"}]},{\"type\":\"sl\",\"from\":\"1564334153687\",\"to\":\"1564334155295\",\"id\":\"1564334160383\",\"name\":\"\",\"dash\":false,\"alt\":true,\"Compares\":[{\"FieldName\":\"DAYS\",\"Operation\":\">=\",\"Value\":\"3\"}]},{\"type\":\"sl\",\"from\":\"1564334154471\",\"to\":\"1564334156607\",\"id\":\"1564334161911\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334155295\",\"to\":\"1564334156607\",\"id\":\"1564334163959\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334156607\",\"to\":\"1564334139783\",\"id\":\"1564334165255\",\"name\":\"\",\"dash\":false,\"alt\":true}],\"areas\":[],\"initNum\":16}', 'bfd4f0f9-6f61-4af9-977e-cbcf7c30dd35', '', '{\"REASON\":\"身体原因\",\"DAYS\":\"5\",\"CUSTOME_NAME\":\"玉宝\"}', '0', '[{\"type\":\"text\",\"name\":\"REASON\",\"title\":\"REASON\",\"value\":\"身体原因\",\"leipiplugins\":\"text\",\"orghide\":\"0\",\"orgalign\":\"left\",\"orgwidth\":\"150\",\"orgtype\":\"text\",\"style\":\"text-align: left; width: 150px;\",\"content\":\"<input name=\\\"leipiNewField\\\" type=\\\"text\\\" title=\\\"REASON\\\" value=\\\"身体原因\\\" leipiplugins=\\\"text\\\" orghide=\\\"0\\\" orgalign=\\\"left\\\" orgwidth=\\\"150\\\" orgtype=\\\"text\\\" style=\\\"text-align: left; width: 150px;\\\"/>\"},{\"leipiplugins\":\"select\",\"name\":\"DAYS\",\"title\":\"DAYS\",\"size\":\"1\",\"orgwidth\":\"150\",\"style\":\"width: 150px;\",\"value\":\"1,3,5,10\",\"selected\":\"selected\",\"content\":\"<span leipiplugins=\\\"select\\\"><select name=\\\"leipiNewField\\\" title=\\\"DAYS\\\" leipiplugins=\\\"select\\\" size=\\\"1\\\" orgwidth=\\\"150\\\" style=\\\"width: 150px;\\\"><option value=\\\"1\\\" selected=\\\"selected\\\">1</option><option value=\\\"3\\\">3</option><option value=\\\"5\\\">5</option><option value=\\\"10\\\">10</option></select>&nbsp;&nbsp;</span>\"},{\"type\":\"text\",\"name\":\"CUSTOME_NAME\",\"title\":\"CUSTOME_NAME\",\"value\":\"玉宝\",\"leipiplugins\":\"text\",\"orghide\":\"0\",\"orgalign\":\"left\",\"orgwidth\":\"150\",\"orgtype\":\"text\",\"style\":\"text-align: left; width: 150px;\",\"content\":\"<input name=\\\"leipiNewField\\\" type=\\\"text\\\" title=\\\"CUSTOME_NAME\\\" value=\\\"玉宝\\\" leipiplugins=\\\"text\\\" orghide=\\\"0\\\" orgalign=\\\"left\\\" orgwidth=\\\"150\\\" orgtype=\\\"text\\\" style=\\\"text-align: left; width: 150px;\\\"/>\"}]', '<p style=\"text-align: center;\"><span style=\"font-size: 36px;\">请假条</span></p><p><span style=\"font-size: 36px;\"><br/></span></p><p style=\"text-align: center;\">因{REASON}，本人想请假{DAYS}天，望领导批准！</p><p><br/></p><p style=\"text-align: center;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;谢谢！</p><p><br/></p><p style=\"text-align: right;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 申请人：{CUSTOME_NAME}</p>', 'ef89f96a-af33-407c-b02e-897faf46ecf0', '', '0', '2019-07-29 01:24:52', '00000000-0000-0000-0000-000000000000', 'System', '0', '', '0', '1');
INSERT INTO `flowinstance` VALUES ('df6df6b5-53f7-4db4-931b-12e3352ef413', '', '1564334658879', '按角色执行2019-07-29 01:24:21', '1564334332325', '2', '管理员', '1564334327861', '{\"title\":\"newFlow_1\",\"nodes\":[{\"name\":\"node_1\",\"left\":99,\"top\":32,\"type\":\"start round mix\",\"id\":\"1564334327861\",\"width\":26,\"height\":26,\"alt\":true},{\"name\":\"node_2\",\"left\":70,\"top\":295,\"type\":\"end round\",\"id\":\"1564334330157\",\"width\":26,\"height\":26,\"alt\":true},{\"name\":\"管理员\",\"left\":43,\"top\":131,\"type\":\"node\",\"id\":\"1564334332325\",\"width\":104,\"height\":36,\"alt\":true,\"setInfo\":{\"NodeConfluenceType\":\"all\",\"NodeDesignate\":\"SPECIAL_ROLE\",\"ThirdPartyUrl\":\"\",\"NodeDesignateData\":{\"users\":[],\"roles\":[\"09ee2ffa-7463-4938-ae0b-1cb4e80c7c13\"]}}},{\"name\":\"测试人员\",\"left\":185,\"top\":226,\"type\":\"node\",\"id\":\"1564334333133\",\"width\":104,\"height\":36,\"alt\":true,\"setInfo\":{\"NodeConfluenceType\":\"all\",\"NodeDesignate\":\"SPECIAL_ROLE\",\"ThirdPartyUrl\":\"\",\"NodeDesignateData\":{\"users\":[],\"roles\":[\"0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d\"]}}}],\"lines\":[{\"type\":\"sl\",\"from\":\"1564334327861\",\"to\":\"1564334332325\",\"id\":\"1564334335789\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334332325\",\"to\":\"1564334333133\",\"id\":\"1564334336629\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334333133\",\"to\":\"1564334330157\",\"id\":\"1564334337805\",\"name\":\"\",\"dash\":false,\"alt\":true}],\"areas\":[],\"initNum\":9}', '0b21f59c-7809-4275-acb4-8e8c08e0167e', '', '{\"REASON\":\"身体原因\",\"DAYS\":\"1\",\"CUSTOME_NAME\":\"玉宝\"}', '0', '[{\"type\":\"text\",\"name\":\"REASON\",\"title\":\"REASON\",\"value\":\"身体原因\",\"leipiplugins\":\"text\",\"orghide\":\"0\",\"orgalign\":\"left\",\"orgwidth\":\"150\",\"orgtype\":\"text\",\"style\":\"text-align: left; width: 150px;\",\"content\":\"<input name=\\\"leipiNewField\\\" type=\\\"text\\\" title=\\\"REASON\\\" value=\\\"身体原因\\\" leipiplugins=\\\"text\\\" orghide=\\\"0\\\" orgalign=\\\"left\\\" orgwidth=\\\"150\\\" orgtype=\\\"text\\\" style=\\\"text-align: left; width: 150px;\\\"/>\"},{\"leipiplugins\":\"select\",\"name\":\"DAYS\",\"title\":\"DAYS\",\"size\":\"1\",\"orgwidth\":\"150\",\"style\":\"width: 150px;\",\"value\":\"1,3,5,10\",\"selected\":\"selected\",\"content\":\"<span leipiplugins=\\\"select\\\"><select name=\\\"leipiNewField\\\" title=\\\"DAYS\\\" leipiplugins=\\\"select\\\" size=\\\"1\\\" orgwidth=\\\"150\\\" style=\\\"width: 150px;\\\"><option value=\\\"1\\\" selected=\\\"selected\\\">1</option><option value=\\\"3\\\">3</option><option value=\\\"5\\\">5</option><option value=\\\"10\\\">10</option></select>&nbsp;&nbsp;</span>\"},{\"type\":\"text\",\"name\":\"CUSTOME_NAME\",\"title\":\"CUSTOME_NAME\",\"value\":\"玉宝\",\"leipiplugins\":\"text\",\"orghide\":\"0\",\"orgalign\":\"left\",\"orgwidth\":\"150\",\"orgtype\":\"text\",\"style\":\"text-align: left; width: 150px;\",\"content\":\"<input name=\\\"leipiNewField\\\" type=\\\"text\\\" title=\\\"CUSTOME_NAME\\\" value=\\\"玉宝\\\" leipiplugins=\\\"text\\\" orghide=\\\"0\\\" orgalign=\\\"left\\\" orgwidth=\\\"150\\\" orgtype=\\\"text\\\" style=\\\"text-align: left; width: 150px;\\\"/>\"}]', '<p style=\"text-align: center;\"><span style=\"font-size: 36px;\">请假条</span></p><p><span style=\"font-size: 36px;\"><br/></span></p><p style=\"text-align: center;\">因{REASON}，本人想请假{DAYS}天，望领导批准！</p><p><br/></p><p style=\"text-align: center;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;谢谢！</p><p><br/></p><p style=\"text-align: right;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 申请人：{CUSTOME_NAME}</p>', 'ef89f96a-af33-407c-b02e-897faf46ecf0', '', '0', '2019-07-29 01:24:26', '00000000-0000-0000-0000-000000000000', 'System', '0', '', '0', '49df1602-f5f3-4d52-afb7-3802da619558');
INSERT INTO `flowinstance` VALUES ('ee589689-3ae0-4037-abec-ba70e566da16', '', '1564334720434', '普通的请假2019-07-29 01:25:24', '1564334035352', '2', '所有人可以审批', '1564334032785', '{\"title\":\"newFlow_1\",\"initNum\":9,\"lines\":[{\"id\":\"1564334041040\",\"type\":\"sl\",\"from\":\"1564334032785\",\"to\":\"1564334035352\",\"name\":\"\",\"dash\":false,\"Compares\":null},{\"id\":\"1564334041720\",\"type\":\"sl\",\"from\":\"1564334035352\",\"to\":\"1564334036152\",\"name\":\"\",\"dash\":false,\"Compares\":null},{\"id\":\"1564334042927\",\"type\":\"sl\",\"from\":\"1564334036152\",\"to\":\"1564334038904\",\"name\":\"\",\"dash\":false,\"Compares\":null}],\"nodes\":[{\"id\":\"1564334032785\",\"name\":\"node_1\",\"type\":\"start round mix\",\"left\":19,\"top\":36,\"width\":26,\"height\":26,\"alt\":true,\"setInfo\":null},{\"id\":\"1564334035352\",\"name\":\"所有人可以审批\",\"type\":\"node\",\"left\":133,\"top\":50,\"width\":104,\"height\":56,\"alt\":true,\"setInfo\":{\"NodeDesignate\":\"ALL_USER\",\"NodeDesignateData\":{\"users\":[],\"roles\":[],\"orgs\":null},\"NodeCode\":null,\"NodeName\":null,\"ThirdPartyUrl\":\"http://xxxx.com/api/workflow/callback\",\"NodeRejectType\":null,\"Taged\":2,\"UserName\":\"test\",\"UserId\":\"6ba79766-faa0-4259-8139-a4a6d35784e0\",\"Description\":\"最近有很多事情要处理\",\"TagedTime\":\"2019-07-29 01:28\",\"NodeConfluenceType\":\"all\",\"ConfluenceOk\":null,\"ConfluenceNo\":null}},{\"id\":\"1564334036152\",\"name\":\"所有人可以审批\",\"type\":\"node\",\"left\":139,\"top\":123,\"width\":104,\"height\":56,\"alt\":true,\"setInfo\":{\"NodeDesignate\":\"ALL_USER\",\"NodeDesignateData\":{\"users\":[],\"roles\":[],\"orgs\":null},\"NodeCode\":null,\"NodeName\":null,\"ThirdPartyUrl\":\"\",\"NodeRejectType\":null,\"Taged\":null,\"UserName\":null,\"UserId\":null,\"Description\":null,\"TagedTime\":null,\"NodeConfluenceType\":\"all\",\"ConfluenceOk\":null,\"ConfluenceNo\":null}},{\"id\":\"1564334038904\",\"name\":\"node_4\",\"type\":\"end round\",\"left\":47,\"top\":193,\"width\":26,\"height\":26,\"alt\":true,\"setInfo\":null}],\"areas\":[]}', '61806396-9498-492b-bc22-9f9e95a389bc', '', '{\"REASON\":\"身体原因\",\"DAYS\":\"1\",\"CUSTOME_NAME\":\"玉宝\"}', '0', '[{\"type\":\"text\",\"name\":\"REASON\",\"title\":\"REASON\",\"value\":\"身体原因\",\"leipiplugins\":\"text\",\"orghide\":\"0\",\"orgalign\":\"left\",\"orgwidth\":\"150\",\"orgtype\":\"text\",\"style\":\"text-align: left; width: 150px;\",\"content\":\"<input name=\\\"leipiNewField\\\" type=\\\"text\\\" title=\\\"REASON\\\" value=\\\"身体原因\\\" leipiplugins=\\\"text\\\" orghide=\\\"0\\\" orgalign=\\\"left\\\" orgwidth=\\\"150\\\" orgtype=\\\"text\\\" style=\\\"text-align: left; width: 150px;\\\"/>\"},{\"leipiplugins\":\"select\",\"name\":\"DAYS\",\"title\":\"DAYS\",\"size\":\"1\",\"orgwidth\":\"150\",\"style\":\"width: 150px;\",\"value\":\"1,3,5,10\",\"selected\":\"selected\",\"content\":\"<span leipiplugins=\\\"select\\\"><select name=\\\"leipiNewField\\\" title=\\\"DAYS\\\" leipiplugins=\\\"select\\\" size=\\\"1\\\" orgwidth=\\\"150\\\" style=\\\"width: 150px;\\\"><option value=\\\"1\\\" selected=\\\"selected\\\">1</option><option value=\\\"3\\\">3</option><option value=\\\"5\\\">5</option><option value=\\\"10\\\">10</option></select>&nbsp;&nbsp;</span>\"},{\"type\":\"text\",\"name\":\"CUSTOME_NAME\",\"title\":\"CUSTOME_NAME\",\"value\":\"玉宝\",\"leipiplugins\":\"text\",\"orghide\":\"0\",\"orgalign\":\"left\",\"orgwidth\":\"150\",\"orgtype\":\"text\",\"style\":\"text-align: left; width: 150px;\",\"content\":\"<input name=\\\"leipiNewField\\\" type=\\\"text\\\" title=\\\"CUSTOME_NAME\\\" value=\\\"玉宝\\\" leipiplugins=\\\"text\\\" orghide=\\\"0\\\" orgalign=\\\"left\\\" orgwidth=\\\"150\\\" orgtype=\\\"text\\\" style=\\\"text-align: left; width: 150px;\\\"/>\"}]', '<p style=\"text-align: center;\"><span style=\"font-size: 36px;\">请假条</span></p><p><span style=\"font-size: 36px;\"><br/></span></p><p style=\"text-align: center;\">因{REASON}，本人想请假{DAYS}天，望领导批准！</p><p><br/></p><p style=\"text-align: center;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;谢谢！</p><p><br/></p><p style=\"text-align: right;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 申请人：{CUSTOME_NAME}</p>', 'ef89f96a-af33-407c-b02e-897faf46ecf0', '', '0', '2019-07-29 01:25:30', '00000000-0000-0000-0000-000000000000', 'System', '0', '', '3', '1');

-- ----------------------------
-- Table structure for flowinstanceoperationhistory
-- ----------------------------
DROP TABLE IF EXISTS `flowinstanceoperationhistory`;
CREATE TABLE `flowinstanceoperationhistory` (
  `Id` varchar(50) NOT NULL COMMENT '主键Id',
  `InstanceId` varchar(50) NOT NULL COMMENT '实例进程Id',
  `Content` varchar(200) DEFAULT NULL COMMENT '操作内容',
  `CreateDate` datetime NOT NULL COMMENT '创建时间',
  `CreateUserId` varchar(50) DEFAULT NULL COMMENT '创建用户主键',
  `CreateUserName` varchar(50) DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='工作流实例操作记录';

-- ----------------------------
-- Records of flowinstanceoperationhistory
-- ----------------------------
INSERT INTO `flowinstanceoperationhistory` VALUES ('07ebabd9-7880-4d9a-b365-4a1dc608a82a', 'be9b74cf-2e74-40f3-9ebf-3508f6e79bde', '【创建】超级管理员创建了一个流程进程【1564334669608/带分支条件的请假（很多天数）】', '2019-07-29 01:24:52', '00000000-0000-0000-0000-000000000000', '超级管理员');
INSERT INTO `flowinstanceoperationhistory` VALUES ('0b39f449-3369-41d7-b053-00487c2fafbe', 'ee589689-3ae0-4037-abec-ba70e566da16', '【创建】超级管理员创建了一个流程进程【1564334720434/普通的请假2019-07-29 01:25:24】', '2019-07-29 01:25:30', '00000000-0000-0000-0000-000000000000', '超级管理员');
INSERT INTO `flowinstanceoperationhistory` VALUES ('1fa6c074-8ec0-4a5a-8c39-2dc62d0140eb', '0ae5abe6-f571-4e08-b264-667dc27c5025', '【创建】超级管理员创建了一个流程进程【1564334583446/带复杂表单的2019-07-29 01:23:03】', '2019-07-29 01:23:58', '00000000-0000-0000-0000-000000000000', '超级管理员');
INSERT INTO `flowinstanceoperationhistory` VALUES ('250181cb-f242-47cf-bc16-fcc307443727', '034ad4f0-95e6-40bf-b3c5-38bd60b542d9', '【创建】超级管理员创建了一个流程进程【1564334796391/会签2019-07-29 01:26:40】', '2019-07-29 01:26:45', '00000000-0000-0000-0000-000000000000', '超级管理员');
INSERT INTO `flowinstanceoperationhistory` VALUES ('299d30e1-41d2-4f9f-a330-593fc7b87c20', 'b918eb3a-0fd4-4df9-a3a3-0bbf2aa5746d', '【创建】test创建了一个流程进程【1564334869743/test的普通请假2019-07-29 01:27:53】', '2019-07-29 01:28:05', '6ba79766-faa0-4259-8139-a4a6d35784e0', 'test');
INSERT INTO `flowinstanceoperationhistory` VALUES ('318f827b-316d-4230-841b-990b0e1aab37', 'df6df6b5-53f7-4db4-931b-12e3352ef413', '【创建】超级管理员创建了一个流程进程【1564334658879/按角色执行2019-07-29 01:24:21】', '2019-07-29 01:24:26', '00000000-0000-0000-0000-000000000000', '超级管理员');
INSERT INTO `flowinstanceoperationhistory` VALUES ('3d49913b-e389-4c7d-9f35-237e3abafa58', '034ad4f0-95e6-40bf-b3c5-38bd60b542d9', '【admin】【2019-07-29 01:30】同意,备注：', '2019-07-29 01:30:46', '49df1602-f5f3-4d52-afb7-3802da619558', 'admin');
INSERT INTO `flowinstanceoperationhistory` VALUES ('41dc5606-9b46-4a2f-9a99-b7d439327cc9', '0ee22872-f120-4c5a-84ec-7f4e36bd0141', '【默认】【2019-07-29 01:30】同意,备注：', '2019-07-29 01:30:13', '49df1602-f5f3-4d52-afb7-3802da619558', 'admin');
INSERT INTO `flowinstanceoperationhistory` VALUES ('4564baf4-2f5a-4268-82ae-bb587c1a7a64', 'ee589689-3ae0-4037-abec-ba70e566da16', '【所有人可以审批】【2019-07-29 01:28】不同意,备注：最近有很多事情要处理', '2019-07-29 01:28:55', '6ba79766-faa0-4259-8139-a4a6d35784e0', 'test');
INSERT INTO `flowinstanceoperationhistory` VALUES ('7605f2e4-162b-4074-8c6b-7731890dda95', '36677c40-a258-410e-82c3-12d2a1564813', '【创建】超级管理员创建了一个流程进程【1571904309691/测试流程12019-10-24 16:05:09】', '2019-10-24 16:05:32', '00000000-0000-0000-0000-000000000000', '超级管理员');
INSERT INTO `flowinstanceoperationhistory` VALUES ('81d18fa5-f843-4d29-bf08-1423ed7df968', '0ee22872-f120-4c5a-84ec-7f4e36bd0141', '【小于3的test可以审批】【2019-07-29 01:28】同意,备注：', '2019-07-29 01:28:31', '6ba79766-faa0-4259-8139-a4a6d35784e0', 'test');
INSERT INTO `flowinstanceoperationhistory` VALUES ('97643f81-40b4-4941-8cd9-ec35b517da5b', '20be4e87-0e9e-467c-9011-3c6ccd650931', '【创建】超级管理员创建了一个流程进程【1564334643592/会签2019-07-29 01:24:05】', '2019-07-29 01:24:14', '00000000-0000-0000-0000-000000000000', '超级管理员');
INSERT INTO `flowinstanceoperationhistory` VALUES ('9c375436-d2a1-4edd-9123-737ec337f2a4', '034ad4f0-95e6-40bf-b3c5-38bd60b542d9', '【admin】【2019-07-29 01:30】同意,备注：', '2019-07-29 01:30:30', '49df1602-f5f3-4d52-afb7-3802da619558', 'admin');
INSERT INTO `flowinstanceoperationhistory` VALUES ('b2594853-41a7-4c4f-bcd1-3fdf63036e9b', '0ee22872-f120-4c5a-84ec-7f4e36bd0141', '【所有人可以审批】【2019-07-29 01:26】同意,备注：', '2019-07-29 01:26:15', '00000000-0000-0000-0000-000000000000', '超级管理员');
INSERT INTO `flowinstanceoperationhistory` VALUES ('b304569d-e14a-4411-ad10-780bf5eaf3a0', '0ee22872-f120-4c5a-84ec-7f4e36bd0141', '【创建】超级管理员创建了一个流程进程【1564334742060/带分支条件的请假2019-07-29 01:25:44】', '2019-07-29 01:25:56', '00000000-0000-0000-0000-000000000000', '超级管理员');
INSERT INTO `flowinstanceoperationhistory` VALUES ('bd7f1d9a-6f19-47a2-8e34-b1c94952c97e', '36677c40-a258-410e-82c3-12d2a1564813', '【node_2】【2019-10-24 16:12】同意,备注：同意测试', '2019-10-24 16:12:23', '6ba79766-faa0-4259-8139-a4a6d35784e0', 'test');
INSERT INTO `flowinstanceoperationhistory` VALUES ('d07a7957-c0ff-4242-b1c0-62bade027618', 'b918eb3a-0fd4-4df9-a3a3-0bbf2aa5746d', '【所有人可以审批】【2019-10-22 19:13】不同意,备注：ssdfad', '2019-10-22 19:13:38', '00000000-0000-0000-0000-000000000000', '超级管理员');
INSERT INTO `flowinstanceoperationhistory` VALUES ('de782bfd-1320-4c6e-9e18-f7c92ad64173', '61959fe9-377a-4e6c-9f5d-6b7018a80bca', '【所有人可以审批】【2019-07-29 01:29】同意,备注：', '2019-07-29 01:29:14', '6ba79766-faa0-4259-8139-a4a6d35784e0', 'test');
INSERT INTO `flowinstanceoperationhistory` VALUES ('e633903e-4969-46eb-b194-c7de5c27cb8d', '034ad4f0-95e6-40bf-b3c5-38bd60b542d9', '【node_2】【2019-07-29 01:28】同意,备注：', '2019-07-29 01:28:22', '6ba79766-faa0-4259-8139-a4a6d35784e0', 'test');
INSERT INTO `flowinstanceoperationhistory` VALUES ('ecd380ab-3f22-4a8b-a341-4a8ff70eefff', '61959fe9-377a-4e6c-9f5d-6b7018a80bca', '【创建】超级管理员创建了一个流程进程【1564334700493/带分支条件的请假2019-07-29 01:25:02】', '2019-07-29 01:25:16', '00000000-0000-0000-0000-000000000000', '超级管理员');
INSERT INTO `flowinstanceoperationhistory` VALUES ('efa37871-2d37-4bae-8e0d-5bf98ff44241', '7a1fb1a4-06a6-49d5-a311-b988aed776e1', '【创建】admin创建了一个流程进程【1564334976909/admin的会签2019-07-29 01:29:39】', '2019-07-29 01:29:47', '49df1602-f5f3-4d52-afb7-3802da619558', 'admin');

-- ----------------------------
-- Table structure for flowinstancetransitionhistory
-- ----------------------------
DROP TABLE IF EXISTS `flowinstancetransitionhistory`;
CREATE TABLE `flowinstancetransitionhistory` (
  `Id` varchar(50) NOT NULL COMMENT '主键Id',
  `InstanceId` varchar(50) NOT NULL COMMENT '实例Id',
  `FromNodeId` varchar(50) DEFAULT NULL COMMENT '开始节点Id',
  `FromNodeType` int(11) DEFAULT NULL COMMENT '开始节点类型',
  `FromNodeName` varchar(200) DEFAULT NULL COMMENT '开始节点名称',
  `ToNodeId` varchar(50) DEFAULT NULL COMMENT '结束节点Id',
  `ToNodeType` int(11) DEFAULT NULL COMMENT '结束节点类型',
  `ToNodeName` varchar(200) DEFAULT NULL COMMENT '结束节点名称',
  `TransitionSate` int(11) NOT NULL COMMENT '转化状态',
  `IsFinish` int(11) NOT NULL COMMENT '是否结束',
  `CreateDate` datetime NOT NULL COMMENT '转化时间',
  `CreateUserId` varchar(50) DEFAULT NULL COMMENT '操作人Id',
  `CreateUserName` varchar(50) DEFAULT NULL COMMENT '操作人名称',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='工作流实例流转历史记录';

-- ----------------------------
-- Records of flowinstancetransitionhistory
-- ----------------------------
INSERT INTO `flowinstancetransitionhistory` VALUES ('0a8aff1c-572b-4db4-9906-a3954a1d0288', '034ad4f0-95e6-40bf-b3c5-38bd60b542d9', '1564334435460', '2', 'node_2', '1564334437844', '0', '会签入口，设置会签类型', '0', '0', '2019-07-29 01:28:22', '6ba79766-faa0-4259-8139-a4a6d35784e0', 'test');
INSERT INTO `flowinstancetransitionhistory` VALUES ('0b11504f-9231-4cdb-862a-4d4546b9a4bd', '0ae5abe6-f571-4e08-b264-667dc27c5025', '1564334555981', '3', 'node_1', '1564334557205', '2', 'node_2', '0', '0', '2019-07-29 01:23:58', '00000000-0000-0000-0000-000000000000', '超级管理员');
INSERT INTO `flowinstancetransitionhistory` VALUES ('10efe1e8-6424-4d88-bc30-8b6722002e56', '0ee22872-f120-4c5a-84ec-7f4e36bd0141', '1564334153687', '2', '所有人可以审批', '1564334154471', '2', '小于3的test可以审批', '0', '0', '2019-07-29 01:26:15', '00000000-0000-0000-0000-000000000000', '超级管理员');
INSERT INTO `flowinstancetransitionhistory` VALUES ('121c3968-8532-43ae-b46a-dcae0973567a', 'b918eb3a-0fd4-4df9-a3a3-0bbf2aa5746d', '1564334032785', '3', 'node_1', '1564334035352', '2', '所有人可以审批', '0', '0', '2019-07-29 01:28:05', '6ba79766-faa0-4259-8139-a4a6d35784e0', 'test');
INSERT INTO `flowinstancetransitionhistory` VALUES ('196cbfd3-973b-4b3e-9165-84cc9c624716', '36677c40-a258-410e-82c3-12d2a1564813', '1571904274697', '2', 'node_2', '1571904276712', '4', 'node_3', '0', '1', '2019-10-24 16:12:23', '6ba79766-faa0-4259-8139-a4a6d35784e0', 'test');
INSERT INTO `flowinstancetransitionhistory` VALUES ('19eada42-ade5-4cb1-a65b-a5d75243fe10', '034ad4f0-95e6-40bf-b3c5-38bd60b542d9', '1564334437844', '0', '会签入口，设置会签类型', '1564334444885', '4', 'node_7', '0', '1', '2019-07-29 01:30:46', '49df1602-f5f3-4d52-afb7-3802da619558', 'admin');
INSERT INTO `flowinstancetransitionhistory` VALUES ('3ac494f7-66c9-4d77-a86d-bfe93d4e1bd2', 'df6df6b5-53f7-4db4-931b-12e3352ef413', '1564334327861', '3', 'node_1', '1564334332325', '2', '管理员', '0', '0', '2019-07-29 01:24:26', '00000000-0000-0000-0000-000000000000', '超级管理员');
INSERT INTO `flowinstancetransitionhistory` VALUES ('3c9db424-34b8-43cb-b571-ca8a3102fa78', '034ad4f0-95e6-40bf-b3c5-38bd60b542d9', '1564334430924', '3', 'node_1', '1564334435460', '2', 'node_2', '0', '0', '2019-07-29 01:26:45', '00000000-0000-0000-0000-000000000000', '超级管理员');
INSERT INTO `flowinstancetransitionhistory` VALUES ('9ed0cdc3-0f57-4381-bb86-f41537556832', '61959fe9-377a-4e6c-9f5d-6b7018a80bca', '1564334153687', '2', '所有人可以审批', '1564334154471', '2', '小于3的test可以审批', '0', '0', '2019-07-29 01:29:14', '6ba79766-faa0-4259-8139-a4a6d35784e0', 'test');
INSERT INTO `flowinstancetransitionhistory` VALUES ('b53cd6a4-0aa9-4de5-83e8-3966423e537a', '20be4e87-0e9e-467c-9011-3c6ccd650931', '1564334430924', '3', 'node_1', '1564334435460', '2', 'node_2', '0', '0', '2019-07-29 01:24:14', '00000000-0000-0000-0000-000000000000', '超级管理员');
INSERT INTO `flowinstancetransitionhistory` VALUES ('b7770b94-16ad-49cb-b2f8-b94ed032388a', '7a1fb1a4-06a6-49d5-a311-b988aed776e1', '1564334430924', '3', 'node_1', '1564334435460', '2', 'node_2', '0', '0', '2019-07-29 01:29:47', '49df1602-f5f3-4d52-afb7-3802da619558', 'admin');
INSERT INTO `flowinstancetransitionhistory` VALUES ('c2128257-6b49-43a5-ac93-7b00d2e1b342', '0ee22872-f120-4c5a-84ec-7f4e36bd0141', '1564334138399', '3', 'node_1', '1564334153687', '2', '所有人可以审批', '0', '0', '2019-07-29 01:25:56', '00000000-0000-0000-0000-000000000000', '超级管理员');
INSERT INTO `flowinstancetransitionhistory` VALUES ('ca236899-b327-4e8b-85d4-8668c9ae5d89', 'ee589689-3ae0-4037-abec-ba70e566da16', '1564334032785', '3', 'node_1', '1564334035352', '2', '所有人可以审批', '0', '0', '2019-07-29 01:25:30', '00000000-0000-0000-0000-000000000000', '超级管理员');
INSERT INTO `flowinstancetransitionhistory` VALUES ('d2c558c2-4f31-4dea-8f2e-5fa3ac9748a0', '0ee22872-f120-4c5a-84ec-7f4e36bd0141', '1564334154471', '2', '小于3的test可以审批', '1564334156607', '2', '默认', '0', '0', '2019-07-29 01:28:31', '6ba79766-faa0-4259-8139-a4a6d35784e0', 'test');
INSERT INTO `flowinstancetransitionhistory` VALUES ('df9f44ed-94f1-48b6-a585-8eaf753e542a', '36677c40-a258-410e-82c3-12d2a1564813', '1571904270595', '3', 'node_1', '1571904274697', '2', 'node_2', '0', '0', '2019-10-24 16:05:32', '00000000-0000-0000-0000-000000000000', '超级管理员');
INSERT INTO `flowinstancetransitionhistory` VALUES ('e22a49a2-5065-47f2-ba95-79d7174a308e', '0ee22872-f120-4c5a-84ec-7f4e36bd0141', '1564334156607', '2', '默认', '1564334139783', '4', 'node_2', '0', '1', '2019-07-29 01:30:13', '49df1602-f5f3-4d52-afb7-3802da619558', 'admin');
INSERT INTO `flowinstancetransitionhistory` VALUES ('e34b5d5e-aae4-4de0-9b31-6bd514ffe92f', 'be9b74cf-2e74-40f3-9ebf-3508f6e79bde', '1564334138399', '3', 'node_1', '1564334153687', '2', '所有人可以审批', '0', '0', '2019-07-29 01:24:52', '00000000-0000-0000-0000-000000000000', '超级管理员');
INSERT INTO `flowinstancetransitionhistory` VALUES ('f7f86afc-be9d-4521-b346-3e36355758b0', '61959fe9-377a-4e6c-9f5d-6b7018a80bca', '1564334138399', '3', 'node_1', '1564334153687', '2', '所有人可以审批', '0', '0', '2019-07-29 01:25:16', '00000000-0000-0000-0000-000000000000', '超级管理员');

-- ----------------------------
-- Table structure for flowscheme
-- ----------------------------
DROP TABLE IF EXISTS `flowscheme`;
CREATE TABLE `flowscheme` (
  `Id` varchar(50) NOT NULL COMMENT '主键Id',
  `SchemeCode` varchar(50) DEFAULT NULL COMMENT '流程编号',
  `SchemeName` varchar(200) DEFAULT NULL COMMENT '流程名称',
  `SchemeType` varchar(50) DEFAULT NULL COMMENT '流程分类',
  `SchemeVersion` varchar(50) DEFAULT NULL COMMENT '流程内容版本',
  `SchemeCanUser` longtext COMMENT '流程模板使用者',
  `SchemeContent` longtext COMMENT '流程内容',
  `FrmId` varchar(50) DEFAULT NULL COMMENT '表单ID',
  `FrmType` int(11) NOT NULL COMMENT '表单类型',
  `AuthorizeType` int(11) NOT NULL COMMENT '模板权限类型：0完全公开,1指定部门/人员',
  `SortCode` int(11) NOT NULL COMMENT '排序码',
  `DeleteMark` int(11) NOT NULL COMMENT '删除标记',
  `Disabled` int(11) NOT NULL COMMENT '有效',
  `Description` varchar(200) DEFAULT NULL COMMENT '备注',
  `CreateDate` datetime NOT NULL COMMENT '创建时间',
  `CreateUserId` varchar(50) DEFAULT NULL COMMENT '创建用户主键',
  `CreateUserName` varchar(50) DEFAULT NULL COMMENT '创建用户',
  `ModifyDate` datetime DEFAULT NULL COMMENT '修改时间',
  `ModifyUserId` varchar(50) DEFAULT NULL COMMENT '修改用户主键',
  `ModifyUserName` varchar(50) DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='工作流模板信息表';

-- ----------------------------
-- Records of flowscheme
-- ----------------------------
INSERT INTO `flowscheme` VALUES ('020ea0f9-6968-4f1d-8a74-24784dd9047b', '1571904252565', '测试流程1', '', '', '', '{\"title\":\"newFlow_1\",\"nodes\":[{\"name\":\"node_1\",\"left\":410,\"top\":56,\"type\":\"start round mix\",\"id\":\"1571904270595\",\"width\":26,\"height\":26,\"alt\":true},{\"name\":\"node_2\",\"left\":417,\"top\":156,\"type\":\"node\",\"id\":\"1571904274697\",\"width\":104,\"height\":26,\"alt\":true,\"setInfo\":{\"NodeConfluenceType\":\"all\",\"NodeDesignate\":\"ALL_USER\",\"ThirdPartyUrl\":\"\",\"NodeDesignateData\":{\"users\":[],\"roles\":[]}}},{\"name\":\"node_3\",\"left\":392,\"top\":254,\"type\":\"end round\",\"id\":\"1571904276712\",\"width\":26,\"height\":26,\"alt\":true}],\"lines\":[{\"type\":\"sl\",\"from\":\"1571904270595\",\"to\":\"1571904274697\",\"id\":\"1571904280728\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1571904274697\",\"to\":\"1571904276712\",\"id\":\"1571904282856\",\"name\":\"\",\"dash\":false,\"alt\":true}],\"areas\":[],\"initNum\":7}', '0c73bd9e-0f4e-4cc2-8a5c-73bd2e4affe0', '0', '0', '0', '0', '0', '测试流程1', '2019-10-24 08:04:23', '', '', '2019-10-24 16:04:53', '', '');
INSERT INTO `flowscheme` VALUES ('0b21f59c-7809-4275-acb4-8e8c08e0167e', '1564334009729', '按角色执行', '', '', '', '{\"title\":\"newFlow_1\",\"nodes\":[{\"name\":\"node_1\",\"left\":99,\"top\":32,\"type\":\"start round mix\",\"id\":\"1564334327861\",\"width\":26,\"height\":26,\"alt\":true},{\"name\":\"node_2\",\"left\":70,\"top\":295,\"type\":\"end round\",\"id\":\"1564334330157\",\"width\":26,\"height\":26,\"alt\":true},{\"name\":\"管理员\",\"left\":43,\"top\":131,\"type\":\"node\",\"id\":\"1564334332325\",\"width\":104,\"height\":36,\"alt\":true,\"setInfo\":{\"NodeConfluenceType\":\"all\",\"NodeDesignate\":\"SPECIAL_ROLE\",\"ThirdPartyUrl\":\"\",\"NodeDesignateData\":{\"users\":[],\"roles\":[\"09ee2ffa-7463-4938-ae0b-1cb4e80c7c13\"]}}},{\"name\":\"测试人员\",\"left\":185,\"top\":226,\"type\":\"node\",\"id\":\"1564334333133\",\"width\":104,\"height\":36,\"alt\":true,\"setInfo\":{\"NodeConfluenceType\":\"all\",\"NodeDesignate\":\"SPECIAL_ROLE\",\"ThirdPartyUrl\":\"\",\"NodeDesignateData\":{\"users\":[],\"roles\":[\"0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d\"]}}}],\"lines\":[{\"type\":\"sl\",\"from\":\"1564334327861\",\"to\":\"1564334332325\",\"id\":\"1564334335789\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334332325\",\"to\":\"1564334333133\",\"id\":\"1564334336629\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334333133\",\"to\":\"1564334330157\",\"id\":\"1564334337805\",\"name\":\"\",\"dash\":false,\"alt\":true}],\"areas\":[],\"initNum\":9}', 'ef89f96a-af33-407c-b02e-897faf46ecf0', '0', '0', '0', '0', '0', '节点按指定的角色执行而不是指定的人', '2019-07-29 01:19:25', '', '', '2019-07-29 01:19:25', '', '');
INSERT INTO `flowscheme` VALUES ('61806396-9498-492b-bc22-9f9e95a389bc', '1564334009729', '普通的请假', '', '', '', '{\"title\":\"newFlow_1\",\"nodes\":[{\"name\":\"node_1\",\"left\":19,\"top\":36,\"type\":\"start round mix\",\"id\":\"1564334032785\",\"width\":26,\"height\":26,\"alt\":true},{\"name\":\"所有人可以审批\",\"left\":133,\"top\":50,\"type\":\"node\",\"id\":\"1564334035352\",\"width\":104,\"height\":56,\"alt\":true,\"setInfo\":{\"NodeConfluenceType\":\"all\",\"NodeDesignate\":\"ALL_USER\",\"ThirdPartyUrl\":\"http://xxxx.com/api/workflow/callback\",\"NodeDesignateData\":{\"users\":[],\"roles\":[]}}},{\"name\":\"所有人可以审批\",\"left\":139,\"top\":123,\"type\":\"node\",\"id\":\"1564334036152\",\"width\":104,\"height\":56,\"alt\":true,\"setInfo\":{\"NodeConfluenceType\":\"all\",\"NodeDesignate\":\"ALL_USER\",\"ThirdPartyUrl\":\"\",\"NodeDesignateData\":{\"users\":[],\"roles\":[]}}},{\"name\":\"node_4\",\"left\":47,\"top\":193,\"type\":\"end round\",\"id\":\"1564334038904\",\"width\":26,\"height\":26,\"alt\":true}],\"lines\":[{\"type\":\"sl\",\"from\":\"1564334032785\",\"to\":\"1564334035352\",\"id\":\"1564334041040\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334035352\",\"to\":\"1564334036152\",\"id\":\"1564334041720\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334036152\",\"to\":\"1564334038904\",\"id\":\"1564334042927\",\"name\":\"\",\"dash\":false,\"alt\":true}],\"areas\":[],\"initNum\":9}', 'ef89f96a-af33-407c-b02e-897faf46ecf0', '0', '0', '0', '0', '0', '非常简单的请假流程', '2019-07-29 01:14:48', '', '', '2019-07-29 01:14:48', '', '');
INSERT INTO `flowscheme` VALUES ('73819920-f085-4003-8874-4361b6461c92', '1564334009729', '会签', '', '', '', '{\"title\":\"newFlow_1\",\"nodes\":[{\"name\":\"node_1\",\"left\":17,\"top\":12,\"type\":\"start round mix\",\"id\":\"1564334430924\",\"width\":26,\"height\":26,\"alt\":true},{\"name\":\"node_2\",\"left\":141,\"top\":49,\"type\":\"node\",\"id\":\"1564334435460\",\"width\":104,\"height\":26,\"alt\":true},{\"name\":\"会签入口，设置会签类型\",\"left\":141,\"top\":138,\"type\":\"fork\",\"id\":\"1564334437844\",\"width\":104,\"height\":76,\"alt\":true,\"setInfo\":{\"NodeConfluenceType\":\"all\",\"NodeDesignate\":\"ALL_USER\",\"ThirdPartyUrl\":\"\",\"NodeDesignateData\":{\"users\":[],\"roles\":[]}}},{\"name\":\"admin\",\"left\":23,\"top\":272,\"type\":\"node\",\"id\":\"1564334439828\",\"width\":104,\"height\":36,\"alt\":true,\"setInfo\":{\"NodeConfluenceType\":\"all\",\"NodeDesignate\":\"SPECIAL_USER\",\"ThirdPartyUrl\":\"\",\"NodeDesignateData\":{\"users\":[\"49df1602-f5f3-4d52-afb7-3802da619558\"],\"roles\":[]}}},{\"name\":\"test\",\"left\":234,\"top\":265,\"type\":\"node\",\"id\":\"1564334440404\",\"width\":104,\"height\":36,\"alt\":true,\"setInfo\":{\"NodeConfluenceType\":\"all\",\"NodeDesignate\":\"SPECIAL_USER\",\"ThirdPartyUrl\":\"\",\"NodeDesignateData\":{\"users\":[\"6ba79766-faa0-4259-8139-a4a6d35784e0\"],\"roles\":[]}}},{\"name\":\"默认所有人\",\"left\":140,\"top\":406,\"type\":\"join\",\"id\":\"1564334441965\",\"width\":104,\"height\":56,\"alt\":true,\"setInfo\":{\"NodeConfluenceType\":\"all\",\"NodeDesignate\":\"ALL_USER\",\"ThirdPartyUrl\":\"\",\"NodeDesignateData\":{\"users\":[],\"roles\":[]}}},{\"name\":\"node_7\",\"left\":351,\"top\":420,\"type\":\"end round\",\"id\":\"1564334444885\",\"width\":26,\"height\":26,\"alt\":true}],\"lines\":[{\"type\":\"sl\",\"from\":\"1564334430924\",\"to\":\"1564334435460\",\"id\":\"1564334446774\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334435460\",\"to\":\"1564334437844\",\"id\":\"1564334447796\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334437844\",\"to\":\"1564334439828\",\"id\":\"1564334448572\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334437844\",\"to\":\"1564334440404\",\"id\":\"1564334449628\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334439828\",\"to\":\"1564334441965\",\"id\":\"1564334450572\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334440404\",\"to\":\"1564334441965\",\"id\":\"1564334451684\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334441965\",\"to\":\"1564334444885\",\"id\":\"1564334453900\",\"name\":\"\",\"dash\":false,\"alt\":true}],\"areas\":[],\"initNum\":16}', 'ef89f96a-af33-407c-b02e-897faf46ecf0', '0', '0', '0', '0', '0', '需要多人审批的流程，比如需要多人全部批准该步骤才能通过，或至少有一个通过', '2019-07-29 01:22:03', '', '', '2019-07-29 01:22:03', '', '');
INSERT INTO `flowscheme` VALUES ('989bd1f3-29f0-43cd-ad01-b55654907dbb', '1564334009729', '带复杂表单的', '', '', '', '{\"title\":\"newFlow_1\",\"nodes\":[{\"name\":\"node_1\",\"left\":66,\"top\":46,\"type\":\"start round mix\",\"id\":\"1564334555981\",\"width\":26,\"height\":26,\"alt\":true},{\"name\":\"node_2\",\"left\":50,\"top\":145,\"type\":\"node\",\"id\":\"1564334557205\",\"width\":104,\"height\":26,\"alt\":true},{\"name\":\"node_3\",\"left\":56,\"top\":206,\"type\":\"node\",\"id\":\"1564334557764\",\"width\":104,\"height\":26,\"alt\":true},{\"name\":\"node_4\",\"left\":66,\"top\":294,\"type\":\"end round\",\"id\":\"1564334559716\",\"width\":26,\"height\":26,\"alt\":true}],\"lines\":[{\"type\":\"sl\",\"from\":\"1564334555981\",\"to\":\"1564334557205\",\"id\":\"1564334561500\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334557205\",\"to\":\"1564334557764\",\"id\":\"1564334562229\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334557764\",\"to\":\"1564334559716\",\"id\":\"1564334563268\",\"name\":\"\",\"dash\":false,\"alt\":true}],\"areas\":[],\"initNum\":8}', '8faff4e5-b729-44d2-ac26-e899a228f63d', '1', '0', '0', '0', '0', '这是一个带有复杂表单的流程，比如需要上传文件', '2019-07-29 01:22:45', '', '', '2019-07-29 01:22:45', '', '');
INSERT INTO `flowscheme` VALUES ('bfd4f0f9-6f61-4af9-977e-cbcf7c30dd35', '1564334009729', '带分支条件的请假', '', '', '', '{\"title\":\"newFlow_1\",\"nodes\":[{\"name\":\"node_1\",\"left\":44,\"top\":27,\"type\":\"start round mix\",\"id\":\"1564334138399\",\"width\":26,\"height\":26,\"alt\":true},{\"name\":\"node_2\",\"left\":50,\"top\":295,\"type\":\"end round\",\"id\":\"1564334139783\",\"width\":26,\"height\":26,\"alt\":true},{\"name\":\"所有人可以审批\",\"left\":163,\"top\":43,\"type\":\"node\",\"id\":\"1564334153687\",\"width\":104,\"height\":56,\"alt\":true,\"setInfo\":{\"NodeConfluenceType\":\"all\",\"NodeDesignate\":\"ALL_USER\",\"ThirdPartyUrl\":\"\",\"NodeDesignateData\":{\"users\":[],\"roles\":[]}}},{\"name\":\"小于3的test可以审批\",\"left\":23,\"top\":141,\"type\":\"node\",\"id\":\"1564334154471\",\"width\":167,\"height\":76,\"alt\":true,\"setInfo\":{\"NodeConfluenceType\":\"all\",\"NodeDesignate\":\"SPECIAL_USER\",\"ThirdPartyUrl\":\"\",\"NodeDesignateData\":{\"users\":[\"6ba79766-faa0-4259-8139-a4a6d35784e0\"],\"roles\":[]}}},{\"name\":\"大于3的admin可以审批\",\"left\":288,\"top\":146,\"type\":\"node\",\"id\":\"1564334155295\",\"width\":143,\"height\":56,\"alt\":true,\"setInfo\":{\"NodeConfluenceType\":\"all\",\"NodeDesignate\":\"SPECIAL_USER\",\"ThirdPartyUrl\":\"\",\"NodeDesignateData\":{\"users\":[\"49df1602-f5f3-4d52-afb7-3802da619558\"],\"roles\":[]}}},{\"name\":\"默认\",\"left\":171,\"top\":291,\"type\":\"node\",\"id\":\"1564334156607\",\"width\":104,\"height\":36,\"alt\":true,\"setInfo\":{\"NodeConfluenceType\":\"all\",\"NodeDesignate\":\"ALL_USER\",\"ThirdPartyUrl\":\"\",\"NodeDesignateData\":{\"users\":[],\"roles\":[]}}}],\"lines\":[{\"type\":\"sl\",\"from\":\"1564334138399\",\"to\":\"1564334153687\",\"id\":\"1564334158551\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334153687\",\"to\":\"1564334154471\",\"id\":\"1564334159304\",\"name\":\"\",\"dash\":false,\"alt\":true,\"Compares\":[{\"FieldName\":\"DAYS\",\"Operation\":\"<\",\"Value\":\"3\"}]},{\"type\":\"sl\",\"from\":\"1564334153687\",\"to\":\"1564334155295\",\"id\":\"1564334160383\",\"name\":\"\",\"dash\":false,\"alt\":true,\"Compares\":[{\"FieldName\":\"DAYS\",\"Operation\":\">=\",\"Value\":\"3\"}]},{\"type\":\"sl\",\"from\":\"1564334154471\",\"to\":\"1564334156607\",\"id\":\"1564334161911\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334155295\",\"to\":\"1564334156607\",\"id\":\"1564334163959\",\"name\":\"\",\"dash\":false,\"alt\":true},{\"type\":\"sl\",\"from\":\"1564334156607\",\"to\":\"1564334139783\",\"id\":\"1564334165255\",\"name\":\"\",\"dash\":false,\"alt\":true}],\"areas\":[],\"initNum\":16}', 'ef89f96a-af33-407c-b02e-897faf46ecf0', '0', '0', '0', '0', '0', '在连接线上可以设置分支条件', '2019-07-29 01:17:46', '', '', '2019-07-29 01:17:46', '', '');

-- ----------------------------
-- Table structure for form
-- ----------------------------
DROP TABLE IF EXISTS `form`;
CREATE TABLE `form` (
  `Id` varchar(50) NOT NULL COMMENT '表单模板Id',
  `Name` varchar(200) DEFAULT NULL COMMENT '表单名称',
  `FrmType` int(11) NOT NULL COMMENT '表单类型，0：默认动态表单；1：Web自定义表单',
  `WebId` varchar(50) DEFAULT NULL COMMENT '系统页面标识，当表单类型为用Web自定义的表单时，需要标识加载哪个页面',
  `Fields` int(11) NOT NULL COMMENT '字段个数',
  `ContentData` longtext COMMENT '表单中的控件属性描述',
  `ContentParse` longtext COMMENT '表单控件位置模板',
  `Content` longtext COMMENT '表单原html模板未经处理的',
  `SortCode` int(11) NOT NULL COMMENT '排序码',
  `DeleteMark` int(11) NOT NULL COMMENT '删除标记',
  `DbName` varchar(50) DEFAULT NULL COMMENT '数据库名称',
  `Disabled` int(11) NOT NULL COMMENT '有效',
  `Description` varchar(200) DEFAULT NULL COMMENT '备注',
  `CreateDate` datetime NOT NULL COMMENT '创建时间',
  `CreateUserId` varchar(50) DEFAULT NULL COMMENT '创建用户主键',
  `CreateUserName` varchar(50) DEFAULT NULL COMMENT '创建用户',
  `ModifyDate` datetime DEFAULT NULL COMMENT '修改时间',
  `ModifyUserId` varchar(50) DEFAULT NULL COMMENT '修改用户主键',
  `ModifyUserName` varchar(50) DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='表单模板表';

-- ----------------------------
-- Records of form
-- ----------------------------
INSERT INTO `form` VALUES ('0c73bd9e-0f4e-4cc2-8a5c-73bd2e4affe0', '测试表单', '0', 'FrmLeaveReq', '0', '[]', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;测试表单&nbsp; &nbsp; 测试内容&nbsp;</p><p>&nbsp; &nbsp; &nbsp;\n &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;<iframe src=\"/static/ueditor/formdesign/el-input.html?info=%7B%22gValue%22:%22%25E6%25B5%258B%25E8%25AF%2595%25E9%2599%2584%25E4%25BB%25B6%22,%22gTitle%22:%22%25E6%25B5%258B%25E8%25AF%2595%25E9%2599%2584%25E4%25BB%25B6%22,%22gAlign%22:%22left%22,%22gWidth%22:%22150%22,%22gHeight%22:%22150%22%7D\" leipiplugins=\"element\" style=\"height:100px;\"></iframe>\n &nbsp; &nbsp;</p><br/>', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;测试表单&nbsp; &nbsp; 测试内容&nbsp;</p><p>&nbsp; &nbsp; &nbsp;\n &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;<iframe src=\"/static/ueditor/formdesign/el-input.html?info=%7B%22gValue%22:%22%25E6%25B5%258B%25E8%25AF%2595%25E9%2599%2584%25E4%25BB%25B6%22,%22gTitle%22:%22%25E6%25B5%258B%25E8%25AF%2595%25E9%2599%2584%25E4%25BB%25B6%22,%22gAlign%22:%22left%22,%22gWidth%22:%22150%22,%22gHeight%22:%22150%22%7D\" leipiplugins=\"element\" style=\"height:100px;\"></iframe>\n &nbsp; &nbsp;</p><br/>', '0', '0', '', '0', '测试用', '2019-10-24 12:01:23', '', '', '2019-10-24 12:01:23', '', '');
INSERT INTO `form` VALUES ('8faff4e5-b729-44d2-ac26-e899a228f63d', '系统内置的复杂请假条表单', '1', 'FrmLeaveReq', '0', '', '', '', '0', '0', '', '0', '企业版内置的复杂请假条表单', '2019-07-29 01:03:36', '', '', '2019-07-29 01:03:36', '', '');
INSERT INTO `form` VALUES ('b08bb00f-e1df-44f8-904f-58ee5b1f4eb4', '领料单', '0', '', '0', '[{\"leipiplugins\":\"select\",\"name\":\"TOOLS\",\"title\":\"TOOLS\",\"size\":\"1\",\"orgwidth\":\"150\",\"style\":\"width: 150px;\",\"value\":\"电脑,平板,手机,签字笔\",\"selected\":\"selected\",\"content\":\"<span leipiplugins=\\\"select\\\"><select name=\\\"leipiNewField\\\" title=\\\"TOOLS\\\" leipiplugins=\\\"select\\\" size=\\\"1\\\" orgwidth=\\\"150\\\" style=\\\"width: 150px;\\\"><option value=\\\"电脑\\\" selected=\\\"selected\\\">电脑</option><option value=\\\"平板\\\">平板</option><option value=\\\"手机\\\">手机</option><option value=\\\"签字笔\\\">签字笔</option></select>&nbsp;&nbsp;</span>\"},{\"type\":\"text\",\"name\":\"NUMBERS\",\"title\":\"NUMBERS\",\"value\":\"1\",\"leipiplugins\":\"text\",\"orghide\":\"0\",\"orgalign\":\"left\",\"orgwidth\":\"150\",\"orgtype\":\"int\",\"style\":\"text-align: left; width: 150px;\",\"content\":\"<input name=\\\"leipiNewField\\\" type=\\\"text\\\" title=\\\"NUMBERS\\\" value=\\\"1\\\" leipiplugins=\\\"text\\\" orghide=\\\"0\\\" orgalign=\\\"left\\\" orgwidth=\\\"150\\\" orgtype=\\\"int\\\" style=\\\"text-align: left; width: 150px;\\\"/>\"},{\"name\":\"APPLY_REASON\",\"title\":\"APPLY_REASON\",\"leipiplugins\":\"textarea\",\"value\":\"\",\"orgrich\":\"0\",\"orgfontsize\":\"\",\"orgwidth\":\"300\",\"orgheight\":\"80\",\"style\":\"width:300px;height:80px;\",\"content\":\"<textarea title=\\\"APPLY_REASON\\\" name=\\\"leipiNewField\\\" leipiplugins=\\\"textarea\\\" value=\\\"\\\" orgrich=\\\"0\\\" orgfontsize=\\\"\\\" orgwidth=\\\"300\\\" orgheight=\\\"80\\\" style=\\\"width:300px;height:80px;\\\"></textarea>\"},{\"leipiplugins\":\"checkboxs\",\"name\":\"\",\"title\":\"NEEDRETURN\",\"parse_name\":\"checkboxs_0\",\"value\":\"归还,无需归还\",\"content\":\"<span leipiplugins=\\\"checkboxs\\\"  title=\\\"NEEDRETURN\\\"><input type=\\\"checkbox\\\" name=\\\"leipiNewField\\\" value=\\\"归还\\\"  checked=\\\"checked\\\"/>归还&nbsp;<input type=\\\"checkbox\\\" name=\\\"leipiNewField\\\" value=\\\"无需归还\\\"  />无需归还&nbsp;</span>\",\"options\":[{\"name\":\"leipiNewField\",\"value\":\"归还\",\"checked\":\"checked\",\"type\":\"checkbox\"},{\"name\":\"leipiNewField\",\"value\":\"无需归还\",\"type\":\"checkbox\"}]}]', '<p style=\"text-align: center;\"><span style=\"font-size: 36px;\">领料单</span></p><p><span style=\"font-size: 36px;\"><br/></span></p><table data-sort=\"sortDisabled\"><tbody><tr class=\"firstRow\"><td width=\"534\" valign=\"top\" style=\"word-break: break-all;\"><span style=\"font-size: 24px;\">名目</span></td><td width=\"534\" valign=\"top\" style=\"word-break: break-all;\"><span style=\"font-size: 24px;\">数量</span></td><td width=\"534\" valign=\"top\" style=\"word-break: break-all;\"><span style=\"font-size: 24px;\">说明</span></td></tr><tr><td width=\"534\" valign=\"top\">{TOOLS}</td><td width=\"534\" valign=\"top\">{NUMBERS}</td><td width=\"534\" valign=\"top\">{APPLY_REASON}</td></tr><tr><td valign=\"top\" rowspan=\"1\" colspan=\"3\" style=\"word-break: break-all;\">{checkboxs_0}</td></tr></tbody></table><p style=\"text-align: center;\"><br/></p>', '<p style=\"text-align: center;\"><span style=\"font-size: 36px;\">领料单</span></p><p><span style=\"font-size: 36px;\"><br/></span></p><table data-sort=\"sortDisabled\"><tbody><tr class=\"firstRow\"><td width=\"534\" valign=\"top\" style=\"word-break: break-all;\"><span style=\"font-size: 24px;\">名目</span></td><td width=\"534\" valign=\"top\" style=\"word-break: break-all;\"><span style=\"font-size: 24px;\">数量</span></td><td width=\"534\" valign=\"top\" style=\"word-break: break-all;\"><span style=\"font-size: 24px;\">说明</span></td></tr><tr><td width=\"534\" valign=\"top\">{|-<span leipiplugins=\"select\"><select name=\"leipiNewField\" title=\"TOOLS\" leipiplugins=\"select\" size=\"1\" orgwidth=\"150\" style=\"width: 150px;\"><option value=\"电脑\" selected=\"selected\">电脑</option><option value=\"平板\">平板</option><option value=\"手机\">手机</option><option value=\"签字笔\">签字笔</option></select>&nbsp;&nbsp;</span>-|}</td><td width=\"534\" valign=\"top\"><input name=\"leipiNewField\" type=\"text\" title=\"NUMBERS\" value=\"1\" leipiplugins=\"text\" orghide=\"0\" orgalign=\"left\" orgwidth=\"150\" orgtype=\"int\" style=\"text-align: left; width: 150px;\"/></td><td width=\"534\" valign=\"top\"><textarea title=\"APPLY_REASON\" name=\"leipiNewField\" leipiplugins=\"textarea\" value=\"\" orgrich=\"0\" orgfontsize=\"\" orgwidth=\"300\" orgheight=\"80\" style=\"width:300px;height:80px;\"></textarea></td></tr><tr><td valign=\"top\" rowspan=\"1\" colspan=\"3\" style=\"word-break: break-all;\">{|-<span leipiplugins=\"checkboxs\"  title=\"NEEDRETURN\"><input type=\"checkbox\" name=\"leipiNewField\" value=\"归还\"  checked=\"checked\"/>归还&nbsp;<input type=\"checkbox\" name=\"leipiNewField\" value=\"无需归还\"  />无需归还&nbsp;</span>-|}</td></tr></tbody></table><p style=\"text-align: center;\"><br/></p>', '0', '0', '', '0', '带有选择框文本框复选框等的领料单据', '2019-07-29 01:13:02', '', '', '2019-07-29 01:13:02', '', '');
INSERT INTO `form` VALUES ('ef89f96a-af33-407c-b02e-897faf46ecf0', '请假条表单', '0', '', '0', '[{\"type\":\"text\",\"name\":\"REASON\",\"title\":\"REASON\",\"value\":\"身体原因\",\"leipiplugins\":\"text\",\"orghide\":\"0\",\"orgalign\":\"left\",\"orgwidth\":\"150\",\"orgtype\":\"text\",\"style\":\"text-align: left; width: 150px;\",\"content\":\"<input name=\\\"leipiNewField\\\" type=\\\"text\\\" title=\\\"REASON\\\" value=\\\"身体原因\\\" leipiplugins=\\\"text\\\" orghide=\\\"0\\\" orgalign=\\\"left\\\" orgwidth=\\\"150\\\" orgtype=\\\"text\\\" style=\\\"text-align: left; width: 150px;\\\"/>\"},{\"leipiplugins\":\"select\",\"name\":\"DAYS\",\"title\":\"DAYS\",\"size\":\"1\",\"orgwidth\":\"150\",\"style\":\"width: 150px;\",\"value\":\"1,3,5,10\",\"selected\":\"selected\",\"content\":\"<span leipiplugins=\\\"select\\\"><select name=\\\"leipiNewField\\\" title=\\\"DAYS\\\" leipiplugins=\\\"select\\\" size=\\\"1\\\" orgwidth=\\\"150\\\" style=\\\"width: 150px;\\\"><option value=\\\"1\\\" selected=\\\"selected\\\">1</option><option value=\\\"3\\\">3</option><option value=\\\"5\\\">5</option><option value=\\\"10\\\">10</option></select>&nbsp;&nbsp;</span>\"},{\"type\":\"text\",\"name\":\"CUSTOME_NAME\",\"title\":\"CUSTOME_NAME\",\"value\":\"玉宝\",\"leipiplugins\":\"text\",\"orghide\":\"0\",\"orgalign\":\"left\",\"orgwidth\":\"150\",\"orgtype\":\"text\",\"style\":\"text-align: left; width: 150px;\",\"content\":\"<input name=\\\"leipiNewField\\\" type=\\\"text\\\" title=\\\"CUSTOME_NAME\\\" value=\\\"玉宝\\\" leipiplugins=\\\"text\\\" orghide=\\\"0\\\" orgalign=\\\"left\\\" orgwidth=\\\"150\\\" orgtype=\\\"text\\\" style=\\\"text-align: left; width: 150px;\\\"/>\"}]', '<p style=\"text-align: center;\"><span style=\"font-size: 36px;\">请假条</span></p><p><span style=\"font-size: 36px;\"><br/></span></p><p style=\"text-align: center;\">因{REASON}，本人想请假{DAYS}天，望领导批准！</p><p><br/></p><p style=\"text-align: center;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;谢谢！</p><p><br/></p><p style=\"text-align: right;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 申请人：{CUSTOME_NAME}</p>', '<p style=\"text-align: center;\"><span style=\"font-size: 36px;\">请假条</span></p><p><span style=\"font-size: 36px;\"><br/></span></p><p style=\"text-align: center;\">因<input name=\"leipiNewField\" type=\"text\" title=\"REASON\" value=\"身体原因\" leipiplugins=\"text\" orghide=\"0\" orgalign=\"left\" orgwidth=\"150\" orgtype=\"text\" style=\"text-align: left; width: 150px;\"/>，本人想请假{|-<span leipiplugins=\"select\"><select name=\"leipiNewField\" title=\"DAYS\" leipiplugins=\"select\" size=\"1\" orgwidth=\"150\" style=\"width: 150px;\"><option value=\"1\" selected=\"selected\">1</option><option value=\"3\">3</option><option value=\"5\">5</option><option value=\"10\">10</option></select>&nbsp;&nbsp;</span>-|}天，望领导批准！</p><p><br/></p><p style=\"text-align: center;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;谢谢！</p><p><br/></p><p style=\"text-align: right;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 申请人：<input name=\"leipiNewField\" type=\"text\" title=\"CUSTOME_NAME\" value=\"玉宝\" leipiplugins=\"text\" orghide=\"0\" orgalign=\"left\" orgwidth=\"150\" orgtype=\"text\" style=\"text-align: left; width: 150px;\"/></p>', '0', '0', '', '0', '带有选择框文本框的请假条', '2019-07-29 01:07:03', '', '', '2019-07-29 01:07:03', '', '');

-- ----------------------------
-- Table structure for frmleavereq
-- ----------------------------
DROP TABLE IF EXISTS `frmleavereq`;
CREATE TABLE `frmleavereq` (
  `Id` varchar(50) NOT NULL COMMENT 'ID',
  `UserName` varchar(10) NOT NULL COMMENT '请假人姓名',
  `RequestType` varchar(20) NOT NULL COMMENT '请假分类，病假，事假，公休等',
  `StartDate` date NOT NULL COMMENT '开始日期',
  `StartTime` datetime DEFAULT NULL COMMENT '开始时间',
  `EndDate` date NOT NULL COMMENT '结束日期',
  `EndTime` datetime DEFAULT NULL COMMENT '结束时间',
  `RequestComment` text COMMENT '请假说明',
  `Attachment` text COMMENT '附件，用于提交病假证据等',
  `CreateDate` datetime NOT NULL COMMENT '创建时间',
  `CreateUserId` varchar(50) DEFAULT NULL COMMENT '创建用户主键',
  `CreateUserName` varchar(50) DEFAULT NULL COMMENT '创建用户',
  `FlowInstanceId` varchar(50) DEFAULT NULL COMMENT '所属流程ID',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='模拟一个自定页面的表单，该数据会关联到流程实例FrmData，可用于复杂页面的设计及后期的数据分析';

-- ----------------------------
-- Records of frmleavereq
-- ----------------------------
INSERT INTO `frmleavereq` VALUES ('59b5b72f-b8fb-44d4-bb24-319d02b2ab80', '李玉宝', '事假', '2019-07-08', '2019-07-28 17:23:14', '2019-07-24', '2019-07-28 17:23:18', '太累了，就是想休息一下', '', '2019-07-29 01:23:58', '', '', '0ae5abe6-f571-4e08-b264-667dc27c5025');

-- ----------------------------
-- Table structure for module
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `Id` varchar(50) NOT NULL COMMENT '功能模块流水号',
  `CascadeId` varchar(255) NOT NULL COMMENT '节点语义ID',
  `Name` varchar(255) NOT NULL COMMENT '功能模块名称',
  `Url` varchar(255) NOT NULL COMMENT '主页面URL',
  `HotKey` varchar(255) NOT NULL COMMENT '热键',
  `IsLeaf` tinyint(4) NOT NULL COMMENT '是否叶子节点',
  `IsAutoExpand` tinyint(4) NOT NULL COMMENT '是否自动展开',
  `IconName` varchar(255) NOT NULL COMMENT '节点图标文件名称',
  `Status` int(11) NOT NULL COMMENT '当前状态',
  `ParentName` varchar(255) NOT NULL COMMENT '父节点名称',
  `Vector` varchar(255) NOT NULL COMMENT '矢量图标',
  `SortNo` int(11) NOT NULL COMMENT '排序号',
  `ParentId` varchar(50) DEFAULT NULL COMMENT '父节点流水号',
  `Code` varchar(50) DEFAULT NULL,
  `IsSys` tinyint(4) NOT NULL COMMENT '是否为系统模块',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='功能模块表';

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES ('0031262c-689c-4b96-bae2-2c9d67076ade', '.0.1.9.', '流程设计', '/flowSchemes/index', '', '0', '0', 'layui-icon-engine', '0', '基础配置', '', '0', '7580672f-a390-4bb6-982d-9a4570cb5199', 'FlowScheme', '1');
INSERT INTO `module` VALUES ('069475e3-c997-487a-9f29-e6a864c5c1d4', '.0.2.', '流程中心', '/', '', '0', '0', 'layui-icon-senior', '0', '根节点', '', '0', null, null, '1');
INSERT INTO `module` VALUES ('37bb9414-19a0-4223-9056-71f8c758a930', '.0.2.5.', '已处理流程', '/flowinstances/disposed', '', '0', '0', 'layui-icon-ok-circle', '0', '流程中心', '', '0', '069475e3-c997-487a-9f29-e6a864c5c1d4', 'FlowInstanceDisposed', '1');
INSERT INTO `module` VALUES ('37bb9414-19a0-4223-9056-71f8c758a931', '.0.1.0.', '邮件管理', '/', '', '0', '0', 'layui-icon-theme', '0', '根节点', '', '0', null, null, '1');
INSERT INTO `module` VALUES ('37bb9414-19a0-4223-9056-71f8c758a932', '.0.1.0.', '写邮件', '/mail/send/index', '', '0', '0', 'layui-icon-theme', '0', '邮件管理', '', '0', '37bb9414-19a0-4223-9056-71f8c758a931', 'send', '1');
INSERT INTO `module` VALUES ('37bb9414-19a0-4223-9056-71f8c758a933', '.0.1.0.', '发件箱', '/mail/outbox/index', '', '0', '0', 'layui-icon-theme', '0', '邮件管理', '', '0', '37bb9414-19a0-4223-9056-71f8c758a931', 'outbox', '1');
INSERT INTO `module` VALUES ('37bb9414-19a0-4223-9056-71f8c758a934', '.0.1.0.', '收件箱', '/mail/inbox/index', '', '0', '0', 'layui-icon-theme', '0', '邮件管理', '', '0', '37bb9414-19a0-4223-9056-71f8c758a931', 'inbox', '1');
INSERT INTO `module` VALUES ('37bb9414-19a0-4223-9056-71f8c758a935', '.0.1.0.', '邮件详情', '/mail/detail/index', '', '0', '0', 'layui-icon-theme', '0', '邮件管理', '', '0', '37bb9414-19a0-4223-9056-71f8c758a931', 'detail', '1');
INSERT INTO `module` VALUES ('4abafc83-c8f5-452f-9882-e113a86e7a3e', '.0.2.6.', '待处理流程', '/flowinstances/wait', '', '0', '0', 'layui-icon-help', '0', '流程中心', '', '0', '069475e3-c997-487a-9f29-e6a864c5c1d4', 'FlowInstanceWait', '1');
INSERT INTO `module` VALUES ('6a9e1346-0c01-44d2-8eb1-f929fdab542a', '.0.1.10.', '部门管理', '/OrgManager/Index', '', '0', '0', 'layui-icon-group', '0', '基础配置', '', '0', '7580672f-a390-4bb6-982d-9a4570cb5199', 'Org', '1');
INSERT INTO `module` VALUES ('7580672f-a390-4bb6-982d-9a4570cb5199', '.0.3.', '基础配置', ' /', '', '0', '0', 'layui-icon-set-fill', '0', '根节点', '', '0', null, null, '1');
INSERT INTO `module` VALUES ('92b00259-2d15-43e7-9321-adffb29e8bf2', '.0.3.11.', '表单设计', '/forms/index', '', '0', '0', 'layui-icon-theme', '0', '基础配置', '', '0', '7580672f-a390-4bb6-982d-9a4570cb5199', 'Form', '1');
INSERT INTO `module` VALUES ('9486ff22-b696-4d7f-8093-8a3e53c45453', '.0.2.7.', '我的流程', '/flowInstances/Index', '', '0', '0', 'layui-icon-share', '0', '流程中心', '', '0', '069475e3-c997-487a-9f29-e6a864c5c1d4', 'FlowInstance', '1');
INSERT INTO `module` VALUES ('a94d5648-c2a9-405e-ba6f-f1602ec9b807', '.0.3.12.', '分类管理', '/Categories/Index', '', '0', '0', 'layui-icon-app', '0', '基础配置', '', '0', '7580672f-a390-4bb6-982d-9a4570cb5199', 'Category', '0');
INSERT INTO `module` VALUES ('bc80478d-0547-4437-9cff-be4b40144bdf', '.0.3.13.', '模块管理', '/ModuleManager/Index', '', '0', '0', 'layui-icon-tabs', '0', '基础配置', '', '0', '7580672f-a390-4bb6-982d-9a4570cb5199', 'Module', '1');
INSERT INTO `module` VALUES ('bedb41a2-f310-4775-af99-01be08adda93', '.0.3.14.', '角色管理', '/RoleManager/Index', '', '0', '0', 'layui-icon-user', '0', '基础配置', '', '0', '7580672f-a390-4bb6-982d-9a4570cb5199', 'Role', '1');
INSERT INTO `module` VALUES ('e8dc5db6-4fc4-4795-a1cc-681cbcceec91', '.0.1.3.', '资源管理', '/Resources/Index', '', '0', '0', 'layui-icon-cellphone', '0', '基础配置', '', '0', '7580672f-a390-4bb6-982d-9a4570cb5199', 'Resource', '0');
INSERT INTO `module` VALUES ('ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c', '.0.3.15.', '用户管理', '/UserManager/Index', '', '0', '0', 'layui-icon-friends', '0', '基础配置', '', '0', '7580672f-a390-4bb6-982d-9a4570cb5199', 'User', '1');

-- ----------------------------
-- Table structure for moduleelement
-- ----------------------------
DROP TABLE IF EXISTS `moduleelement`;
CREATE TABLE `moduleelement` (
  `Id` varchar(50) NOT NULL COMMENT '流水号',
  `DomId` varchar(255) NOT NULL COMMENT 'DOM ID',
  `Name` varchar(255) NOT NULL COMMENT '名称',
  `Attr` text NOT NULL COMMENT '元素附加属性',
  `Script` text NOT NULL COMMENT '元素调用脚本',
  `Icon` varchar(255) NOT NULL COMMENT '元素图标',
  `Class` varchar(255) NOT NULL COMMENT '元素样式',
  `Remark` varchar(200) NOT NULL COMMENT '备注',
  `Sort` int(11) NOT NULL COMMENT '排序字段',
  `ModuleId` varchar(50) NOT NULL COMMENT '功能模块Id',
  `TypeName` varchar(20) DEFAULT NULL COMMENT '分类名称',
  `TypeId` varchar(50) DEFAULT NULL COMMENT '分类ID',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='模块元素表(需要权限控制的按钮)';

-- ----------------------------
-- Records of moduleelement
-- ----------------------------
INSERT INTO `moduleelement` VALUES ('0d25438e-1436-48e0-aedf-0f1690693282', 'btnAccessModule', '为角色分配模块', '', 'assignRoleModule(this)', 'layui-icon-search', 'layui-btn-normal', '为角色分配模块', '4', 'bedb41a2-f310-4775-af99-01be08adda93', null, null);
INSERT INTO `moduleelement` VALUES ('15a4f88c-4fae-4cab-ba2f-0cbd2cca8736', 'btnAssignReource', '为角色分配资源', '', 'openRoleReourceAccess(this)', 'layui-icon-search', 'layui-btn-normal', '为角色分配资源', '3', 'bedb41a2-f310-4775-af99-01be08adda93', null, null);
INSERT INTO `moduleelement` VALUES ('17ae4fd4-ab4e-439e-ba1d-2a53b46d1128', 'ReWrite', '修改表单', '', 'rewrite()', 'layui-icon-edit', 'layui-btn-normal', '', '3', '0031262c-689c-4b96-bae2-2c9d67076ade', null, null);
INSERT INTO `moduleelement` VALUES ('17ae4fd4-ab4e-439e-ba1d-2a53b46d112b', 'btnDel', '删除', '', 'del()', 'layui-icon-delete', 'layui-btn-danger', '', '2', '0031262c-689c-4b96-bae2-2c9d67076ade', null, null);
INSERT INTO `moduleelement` VALUES ('18cc3217-28a6-49b2-9a20-080230065984', 'btnEdit', '编辑', '', 'edit()', 'layui-icon-edit', 'layui-btn-normal', '', '1', '0031262c-689c-4b96-bae2-2c9d67076ade', null, null);
INSERT INTO `moduleelement` VALUES ('1a473afd-cbd4-41e9-9471-81f9435aaabe', 'btnEdit', '编辑', ' ', 'edit()', 'layui-icon-edit', 'layui-btn-normal', '编辑分类', '0', 'a94d5648-c2a9-405e-ba6f-f1602ec9b807', null, null);
INSERT INTO `moduleelement` VALUES ('1c870438-4260-43a5-8996-a6e1dc8bbf6a', 'btnAdd', '添加', '', 'add()', 'layui-icon-add-1', 'layui-btn-normal', '添加部门', '0', '6a9e1346-0c01-44d2-8eb1-f929fdab542a', null, null);
INSERT INTO `moduleelement` VALUES ('1c9acc3e-a40d-4d07-b495-6e60eb9b71b9', 'btnEdit', '编辑', '', 'edit()', 'layui-icon-edit', 'layui-btn-normal', '编辑角色', '1', 'bedb41a2-f310-4775-af99-01be08adda93', null, null);
INSERT INTO `moduleelement` VALUES ('2d595a2a-5de5-479e-a331-b53c799a6b10', 'btnAdd', '添加', '', 'add()', 'layui-icon-add-1', 'layui-btn-normal', '添加分类', '0', 'a94d5648-c2a9-405e-ba6f-f1602ec9b807', null, null);
INSERT INTO `moduleelement` VALUES ('2feefce1-e3d8-42ac-b811-2352679628da', 'btnDel', '删除', '', 'del()', 'layui-icon-delete', 'layui-btn-danger', '刪除用戶', '2', 'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c', null, null);
INSERT INTO `moduleelement` VALUES ('34730f5a-d307-457b-9041-5f7de30abfa9', 'btnEdit', '编辑', '', 'edit()', 'layui-icon-edit', 'layui-btn-normal', '编辑用户', '1', 'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c', null, null);
INSERT INTO `moduleelement` VALUES ('362d1eda-c85e-4b14-a80a-b923291e08de', 'btnAdd', '添加', '', 'add()', 'layui-icon-add-1', 'layui-btn-normal', '添加', '0', 'f0f06b8f-0a86-487c-8b0e-0a12573ccd46', null, null);
INSERT INTO `moduleelement` VALUES ('38109ca0-32ec-44bd-a243-017e591b532b', 'btnEditStock', '编辑', ' ', 'edit()', 'layui-icon-edit', 'layui-btn-normal', '编辑进出库', '0', '89c3bfbe-246f-4112-8eb1-b6789da54202', null, null);
INSERT INTO `moduleelement` VALUES ('3dc0ec4d-bf86-4bae-9ec0-1d6c2403fb99', 'btnAdd', '添加', '', 'add()', 'layui-icon-add-1', 'layui-btn-normal', '', '1', '92b00259-2d15-43e7-9321-adffb29e8bf2', null, null);
INSERT INTO `moduleelement` VALUES ('44075557-496e-4dde-bb75-7b69f51ab4fe', 'btnEdit', '编辑', '', 'edit()', 'layui-icon-edit', 'layui-btn-normal', '编辑模块', '2', 'bc80478d-0547-4437-9cff-be4b40144bdf', null, null);
INSERT INTO `moduleelement` VALUES ('4bfa8ea0-6b0d-426f-8687-b654575ca780', 'btnEdit', '编辑', '', 'edit()', 'layui-icon-edit', 'layui-btn-normal', '编辑资源', '2', 'e8dc5db6-4fc4-4795-a1cc-681cbcceec91', null, null);
INSERT INTO `moduleelement` VALUES ('4f2737db-633f-4946-8a71-b08b9885f151', 'btnEdit', '编辑', '', 'edit()', 'layui-icon-edit', 'layui-btn-normal', '', '2', '92b00259-2d15-43e7-9321-adffb29e8bf2', null, null);
INSERT INTO `moduleelement` VALUES ('50c9df24-b233-42cb-9a0d-4ce158c75f86', 'btnAdd', '添加', '', 'add()', 'layui-icon-add-1', 'layui-btn-normal', '添加用戶', '0', 'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c', null, null);
INSERT INTO `moduleelement` VALUES ('584c7a3b-d28a-47b4-8648-7797d05d83d1', 'btnDel', '删除', '', 'del()', 'layui-icon-delete', 'layui-btn-danger', '', '3', '9486ff22-b696-4d7f-8093-8a3e53c45453', null, null);
INSERT INTO `moduleelement` VALUES ('5ed1681c-13d2-4c87-8675-a8d95c0b40ae', 'btnAddMenu', '添加菜单', '', 'assignButton()', 'layui-icon-add-1', 'layui-btn-normal', '为模块分配按钮', '4', 'bc80478d-0547-4437-9cff-be4b40144bdf', null, null);
INSERT INTO `moduleelement` VALUES ('5ed1681c-13d2-4c87-8676-a8d95c0b40ae', 'btnEditMenu', '编辑菜单', '', '', 'layui-icon-add-1', 'layui-btn-normal', '编辑菜单', '5', 'bc80478d-0547-4437-9cff-be4b40144bdf', null, null);
INSERT INTO `moduleelement` VALUES ('5ed1681c-13d2-4c87-8677-a8d95c0b40ae', 'btnDelMenu', '删除菜单', '', '', 'layui-icon-delete', 'layui-btn-danger', '', '6', 'bc80478d-0547-4437-9cff-be4b40144bdf', '', '');
INSERT INTO `moduleelement` VALUES ('645b40ac-4223-44a7-aab4-66eb56cf9864', 'btnAdd', '添加', '', 'add()', 'layui-icon-add-1', 'layui-btn-normal', '添加角色', '0', 'bedb41a2-f310-4775-af99-01be08adda93', null, null);
INSERT INTO `moduleelement` VALUES ('68484265-7802-4f06-b024-33e8b2f2edcf', 'btnAdd', '新的申请', '', 'add()', 'layui-icon-add-1', 'layui-btn-normal', '申请物品', '0', '9486ff22-b696-4d7f-8093-8a3e53c45453', null, null);
INSERT INTO `moduleelement` VALUES ('68fc793f-069f-43e1-a012-42ac2d7c585c', 'btnDel', '删除', '', 'del()', 'layui-icon-delete', 'layui-btn-danger', '删除角色', '2', 'bedb41a2-f310-4775-af99-01be08adda93', null, null);
INSERT INTO `moduleelement` VALUES ('6c814946-db5c-48bd-84dd-b1c38196ad74', 'btnAdd', '添加模版', '', 'add()', 'layui-icon-add-1', 'layui-btn-normal', '', '0', '0031262c-689c-4b96-bae2-2c9d67076ade', null, null);
INSERT INTO `moduleelement` VALUES ('6db928fe-93df-460f-9472-8bb0b6cae52c', 'btnAdd', '添加', '', 'add()', 'layui-icon-add-1', 'layui-btn-normal', '添加进出库', '0', '89c3bfbe-246f-4112-8eb1-b6789da54202', null, null);
INSERT INTO `moduleelement` VALUES ('79dcd3eb-3aaf-4e08-83c9-713d8ff446fe', 'btnVerification', '处理', '', 'verificationForm()', 'layui-icon-triangle-r', 'layui-btn-normal', '', '5', '4abafc83-c8f5-452f-9882-e113a86e7a3e', null, null);
INSERT INTO `moduleelement` VALUES ('7b2b1ffb-398b-4f7b-83da-8f484e1bcea0', 'btnDel', '删除', '', 'del()', 'layui-icon-delete', 'layui-btn-danger', '删除部门', '2', '6a9e1346-0c01-44d2-8eb1-f929fdab542a', null, null);
INSERT INTO `moduleelement` VALUES ('7f071c63-1620-4486-9264-5806b2e63218', 'btnAccessRole', '为用户分配角色', '', 'openUserRoleAccess(this)', 'layui-icon-search', 'layui-btn-normal', '为用户分配角色', '5', 'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c', null, null);
INSERT INTO `moduleelement` VALUES ('816b12b3-e916-446d-a2fa-329cfd13c831', 'btnDetail', '进度详情', '', '', 'layui-icon-search', 'layui-btn-normal', '', '4', '9486ff22-b696-4d7f-8093-8a3e53c45453', null, null);
INSERT INTO `moduleelement` VALUES ('826b12b3-e916-446d-a2fa-329cfd13c831', 'btnDetail', '进度详情', '', '', 'layui-icon-search', 'layui-btn-normal', '', '4', '4abafc83-c8f5-452f-9882-e113a86e7a3e', null, null);
INSERT INTO `moduleelement` VALUES ('84694ea5-d6e1-4a65-8a59-7b5b779688d4', 'btnAdd', '添加', '', 'add()', 'layui-icon-add-1', 'layui-btn-normal', '添加模块', '1', 'bc80478d-0547-4437-9cff-be4b40144bdf', null, null);
INSERT INTO `moduleelement` VALUES ('84e38920-f6e5-499c-bf52-a3c6f8499ff7', 'btnDelStock', '删除', ' ', 'del()', 'layui-icon-delete', 'layui-btn-danger', '删除分类', '0', 'a94d5648-c2a9-405e-ba6f-f1602ec9b807', null, null);
INSERT INTO `moduleelement` VALUES ('8966b04f-8e26-4046-8b03-0c64f9f833dd', 'btnDel', '删除', '', 'del()', 'layui-icon-delete', 'layui-btn-danger', '', '3', '92b00259-2d15-43e7-9321-adffb29e8bf2', null, null);
INSERT INTO `moduleelement` VALUES ('9c96e485-84a6-45f0-b6a7-f01dab94b0c6', 'btnPreview', '预览', '', 'preview()', 'layui-icon-search', 'layui-btn-normal', '', '4', '92b00259-2d15-43e7-9321-adffb29e8bf2', null, null);
INSERT INTO `moduleelement` VALUES ('9e2c6754-f258-4b14-96a0-b9d981196a65', 'btnAdd', '添加', '', 'add()', 'layui-icon-add-1', 'layui-btn-normal', '添加资源', '0', 'e8dc5db6-4fc4-4795-a1cc-681cbcceec91', null, null);
INSERT INTO `moduleelement` VALUES ('b3e23ebc-0ff2-41b3-bff0-fd5e93f6828a', 'btnDetail', '查看详情', '', '', 'layui-icon-search', 'layui-btn-normal', '', '0', '37bb9414-19a0-4223-9056-71f8c758a930', '', '');
INSERT INTO `moduleelement` VALUES ('c3d7b478-21e9-4c1e-b866-a3c80be7909b', 'btnRefresh', '刷新', '', 'refresh()', 'layui-icon-refresh', 'layui-btn-normal', '刷新分类', '0', 'a94d5648-c2a9-405e-ba6f-f1602ec9b807', null, null);
INSERT INTO `moduleelement` VALUES ('c4c1acbb-9cbf-4b1e-9cc0-ccf5ff544ec2', 'btnDel', '删除', '', 'del()', 'layui-icon-delete', 'layui-btn-danger', '删除进出库', '0', '89c3bfbe-246f-4112-8eb1-b6789da54202', null, null);
INSERT INTO `moduleelement` VALUES ('c7d7daf0-3669-4a22-8bed-b092617deb9c', 'btnDel', '删除', '', 'del()', 'layui-icon-delete', 'layui-btn-danger', '删除资源', '3', 'e8dc5db6-4fc4-4795-a1cc-681cbcceec91', null, null);
INSERT INTO `moduleelement` VALUES ('d1ba6a72-ba14-44c0-baba-46d0ad96fe8a', 'btnRefresh', '刷新', '', 'refresh()', 'layui-icon-refresh', 'layui-btn-normal', '刷新用户', '3', 'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c', null, null);
INSERT INTO `moduleelement` VALUES ('d352c8ee-3dff-4d28-a0de-903ae68f2533', 'btnPreview', '预览', '', 'preview()', 'layui-icon-cellphone', 'layui-btn-normal', '', '1', '0031262c-689c-4b96-bae2-2c9d67076ade', null, null);
INSERT INTO `moduleelement` VALUES ('daddf3b9-71b5-45ac-b85d-5a11c522f2f4', 'btnDel', '删除', ' ', 'del()', 'layui-icon-delete', 'layui-btn-danger', '删除模块', '3', 'bc80478d-0547-4437-9cff-be4b40144bdf', null, null);
INSERT INTO `moduleelement` VALUES ('ef42721f-d223-4a00-a1d9-80b81121f21a', 'btnEdit', '编辑', ' ', 'edit()', 'layui-icon-edit', 'layui-btn-normal', '编辑部门', '0', '6a9e1346-0c01-44d2-8eb1-f929fdab542a', null, null);
INSERT INTO `moduleelement` VALUES ('f8dde22a-2a37-47c4-8e67-70fb3af5303e', 'btnRefresh', '刷新', '', 'refresh()', 'layui-icon-refresh', 'layui-btn-normal', '刷新部门', '0', '6a9e1346-0c01-44d2-8eb1-f929fdab542a', null, null);

-- ----------------------------
-- Table structure for oa_attachment
-- ----------------------------
DROP TABLE IF EXISTS `oa_attachment`;
CREATE TABLE `oa_attachment` (
  `Id` varchar(50) NOT NULL COMMENT '唯一标识',
  `obj_id` bigint(20) DEFAULT NULL COMMENT '业务数据id',
  `hash_value` varchar(32) DEFAULT NULL COMMENT '文件唯一标识',
  `file_name` varchar(32) DEFAULT NULL COMMENT '文件名称',
  `file_ext` varchar(32) DEFAULT NULL COMMENT '文件扩展名',
  `file_type` varchar(32) DEFAULT NULL COMMENT '文件类型',
  `file_size` varchar(32) DEFAULT NULL COMMENT '文件大小',
  `server_name` varchar(50) DEFAULT NULL COMMENT '服务器名称(IP或编号)',
  `upload_path` varchar(500) DEFAULT NULL COMMENT '上传路径',
  `publish_path` varchar(500) DEFAULT NULL COMMENT '发布路径',
  `group_id` varchar(50) DEFAULT NULL COMMENT '群组id',
  `re_vision` int(11) DEFAULT NULL COMMENT '乐观锁',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_by` bigint(20) DEFAULT NULL COMMENT '删除人',
  `deleted_time` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附件信息表 附件信息表';

-- ----------------------------
-- Records of oa_attachment
-- ----------------------------
INSERT INTO `oa_attachment` VALUES ('1883c8d3-ee22-462e-816d-8010a336d3f1', null, null, 'binlog导出语句.txt', 'txt', null, '88', null, null, 'D:\\wopi\\files\\binlog导出语句.txt', 'GXBBWGKGLJ', null, null, null, null, null, null, null);
INSERT INTO `oa_attachment` VALUES ('d4889f7f-328d-4f1f-a28f-35c21ef1c6eb', null, null, 'C接口开发说明文档V1.1.docx', 'docx', null, '1438973', null, null, 'D:\\wopi\\files\\C接口开发说明文档V1.1.docx', 'GXBBWGKGLJ', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for oa_mail
-- ----------------------------
DROP TABLE IF EXISTS `oa_mail`;
CREATE TABLE `oa_mail` (
  `Id` varchar(50) NOT NULL COMMENT '唯一标识',
  `title` varchar(1024) DEFAULT NULL COMMENT '标题',
  `publish_time` datetime DEFAULT NULL COMMENT '发布时间',
  `content` varchar(1024) DEFAULT NULL COMMENT '内容',
  `group_id` varchar(50) DEFAULT NULL COMMENT '群组id',
  `re_vision` int(11) DEFAULT NULL COMMENT '乐观锁',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_by` bigint(20) DEFAULT NULL COMMENT '删除人',
  `deleted_time` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件信息表 邮件信息表';

-- ----------------------------
-- Records of oa_mail
-- ----------------------------
INSERT INTO `oa_mail` VALUES ('ef503572-8e0e-4172-a365-6d322701cebd', 'ces1', '2019-10-26 17:55:07', 'ces1', 'GXBBWGKGLJ', '0', '0', '2019-10-26 17:55:07', '0', '2019-10-26 17:55:07', '0', '2019-10-26 17:55:07');

-- ----------------------------
-- Table structure for oa_mail_receiver
-- ----------------------------
DROP TABLE IF EXISTS `oa_mail_receiver`;
CREATE TABLE `oa_mail_receiver` (
  `Id` varchar(50) NOT NULL COMMENT '唯一标识',
  `mail_id` varchar(50) DEFAULT NULL COMMENT '邮件id',
  `mail_title` varchar(500) DEFAULT NULL COMMENT '邮件标题',
  `receiver_id` varchar(50) DEFAULT NULL COMMENT '收件人id',
  `receiver_name` varchar(128) DEFAULT NULL COMMENT '收件人名称',
  `sender_id` varchar(50) DEFAULT NULL COMMENT '发件人id',
  `sender_name` varchar(128) DEFAULT NULL COMMENT '发件人名称',
  `attachment_ids` varchar(500) DEFAULT NULL COMMENT '附件ids',
  `send_time` datetime DEFAULT NULL COMMENT '发件时间',
  `read_time` datetime DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收件人信息表 收件人信息表';

-- ----------------------------
-- Records of oa_mail_receiver
-- ----------------------------
INSERT INTO `oa_mail_receiver` VALUES ('540b3c9a-7573-4ba0-9680-5e278b698c8d', 'ef503572-8e0e-4172-a365-6d322701cebd', 'ces1', '49df1602-f5f3-4d52-afb7-3802da619558', 'admin', '49df1602-f5f3-4d52-afb7-3802da619558', 'admin', '1883c8d3-ee22-462e-816d-8010a336d3f1,d4889f7f-328d-4f1f-a28f-35c21ef1c6eb', '2019-10-26 17:55:07', null);
INSERT INTO `oa_mail_receiver` VALUES ('82b1fb5e-23ac-4b5e-b2ec-b50c1cebd4d6', 'ef503572-8e0e-4172-a365-6d322701cebd', 'ces1', '6ba79766-faa0-4259-8139-a4a6d35784e0', 'test', '49df1602-f5f3-4d52-afb7-3802da619558', 'admin', '1883c8d3-ee22-462e-816d-8010a336d3f1,d4889f7f-328d-4f1f-a28f-35c21ef1c6eb', '2019-10-26 17:55:07', null);

-- ----------------------------
-- Table structure for org
-- ----------------------------
DROP TABLE IF EXISTS `org`;
CREATE TABLE `org` (
  `Id` varchar(50) NOT NULL COMMENT '流水号',
  `CascadeId` varchar(255) NOT NULL COMMENT '节点语义ID',
  `Name` varchar(255) NOT NULL COMMENT '组织名称',
  `HotKey` varchar(255) NOT NULL COMMENT '热键',
  `ParentName` varchar(255) NOT NULL COMMENT '父节点名称',
  `IsLeaf` tinyint(4) NOT NULL COMMENT '是否叶子节点',
  `IsAutoExpand` tinyint(4) NOT NULL COMMENT '是否自动展开',
  `IconName` varchar(255) NOT NULL COMMENT '节点图标文件名称',
  `Status` int(11) NOT NULL COMMENT '当前状态',
  `BizCode` varchar(255) NOT NULL COMMENT '业务对照码',
  `CustomCode` text NOT NULL COMMENT '自定义扩展码',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `CreateId` int(11) NOT NULL COMMENT '创建人ID',
  `SortNo` int(11) NOT NULL COMMENT '排序号',
  `ParentId` varchar(50) DEFAULT NULL COMMENT '父节点流水号',
  `TypeName` varchar(20) DEFAULT NULL COMMENT '分类名称',
  `TypeId` varchar(50) DEFAULT NULL COMMENT '分类ID',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='组织表';

-- ----------------------------
-- Records of org
-- ----------------------------
INSERT INTO `org` VALUES ('08f41bf6-4388-4b1e-bd3e-2ff538b44b1b', '.0.1.3.1.', '研发小组', '', '研发部', '0', '0', '', '0', '0', '', '2016-10-14 11:40:31', '0', '1', '990cb229-cc18-41f3-8e2b-13f0f0110798', null, null);
INSERT INTO `org` VALUES ('543a9fcf-4770-4fd9-865f-030e562be238', '.0.1.', '集团总部', '', '根节点', '0', '0', '', '0', '0', '', '2016-10-14 11:37:13', '0', '0', null, null, null);
INSERT INTO `org` VALUES ('86449128-d5ac-44bf-b999-f7735b7458fd', '.0.2.1.', '汇丰软件部', '', '汇丰', '0', '0', '', '0', '0', '', '2016-05-26 15:11:03', '0', '1', 'c36e43df-3a99-45da-80d9-3ac5d24f4014', null, null);
INSERT INTO `org` VALUES ('990cb229-cc18-41f3-8e2b-13f0f0110798', '.0.1.3.', '研发部', '', '集团总部', '0', '1', '', '0', '0', '', '2016-04-16 13:03:41', '0', '0', '543a9fcf-4770-4fd9-865f-030e562be238', null, null);
INSERT INTO `org` VALUES ('c36e43df-3a99-45da-80d9-3ac5d24f4014', '.0.2.', '汇丰', '', '根节点', '0', '0', '', '0', '0', '', '2016-05-26 15:10:40', '0', '1', null, null, null);

-- ----------------------------
-- Table structure for relevance
-- ----------------------------
DROP TABLE IF EXISTS `relevance`;
CREATE TABLE `relevance` (
  `Id` varchar(50) NOT NULL COMMENT '流水号',
  `Description` varchar(100) NOT NULL COMMENT '描述',
  `Key` varchar(100) NOT NULL COMMENT '映射标识',
  `Status` int(11) NOT NULL COMMENT '状态',
  `OperateTime` datetime NOT NULL COMMENT '授权时间',
  `OperatorId` varchar(50) DEFAULT NULL COMMENT '授权人',
  `FirstId` varchar(50) NOT NULL COMMENT '第一个表主键ID',
  `SecondId` varchar(50) NOT NULL COMMENT '第二个表主键ID',
  `ThirdId` varchar(50) DEFAULT NULL COMMENT '第三个表主键ID',
  `ExtendInfo` varchar(100) DEFAULT NULL COMMENT '扩展信息',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='多对多关系集中映射';

-- ----------------------------
-- Records of relevance
-- ----------------------------
INSERT INTO `relevance` VALUES ('010198b8-2654-4d47-84b4-d201b2c1841e', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '18cc3217-28a6-49b2-9a20-080230065984', '', '');
INSERT INTO `relevance` VALUES ('0353f625-2322-4449-81e1-db0ace4d67c8', '', 'UserOrg', '0', '2018-09-12 00:10:47', '', '1df68dfd-3b6d-4491-872f-00a0fc6c5a64', '86449128-d5ac-44bf-b999-f7735b7458fd', null, null);
INSERT INTO `relevance` VALUES ('03b55a9e-a44f-44fa-9383-4117bf8aba60', '', 'RoleResource', '0', '2018-09-12 00:15:54', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'XXX_DELETEACCOUNT', null, null);
INSERT INTO `relevance` VALUES ('03be9b5e-38b0-4525-8431-b26d35ce6ce3', '', 'UserElement', '0', '2016-09-07 15:30:43', '0', '3a95e392-07d4-4af3-b30d-140ca93340f5', '816b12b3-e916-446d-a2fa-329cfd13c831', null, null);
INSERT INTO `relevance` VALUES ('0619de14-a921-4604-a2eb-94dc49aa19cc', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '0d25438e-1436-48e0-aedf-0f1690693282', '', '');
INSERT INTO `relevance` VALUES ('06dfd97d-17e0-42b8-bde7-40006d8c8eb2', '', 'UserElement', '0', '2018-04-06 14:50:37', '', '49df1602-f5f3-4d52-afb7-3802da619558', '584c7a3b-d28a-47b4-8648-7797d05d83d1', null, null);
INSERT INTO `relevance` VALUES ('06f4c4a2-faa8-4bad-9184-50ceb517f30b', '', 'ProcessUser', '0', '2016-09-08 16:48:14', '0', '10cc09fb-d469-41e5-ae3f-fdd805a4bd4c', '3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7', null, null);
INSERT INTO `relevance` VALUES ('077e24ab-4c48-4a5e-bfa9-90ea00449136', '', 'RoleOrg', '0', '2018-09-12 00:08:47', '', '3e761e88-ddf7-4a62-b219-9a315b4564f2', '86449128-d5ac-44bf-b999-f7735b7458fd', null, null);
INSERT INTO `relevance` VALUES ('08ff97f7-17fc-4072-b29a-287135898ece', '', 'RoleResource', '0', '2016-09-04 23:20:22', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', 'fdf3aac3-4507-40ad-aa2f-d7f0459de252', null, null);
INSERT INTO `relevance` VALUES ('0a88e093-1733-4883-89a7-09756283b59d', '', 'RoleDataProperty', '0', '2019-10-26 19:06:37', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'Category', 'Description', '');
INSERT INTO `relevance` VALUES ('0b3d3a9b-8a96-43d4-918c-fa7e3ea5f5ca', '', 'RoleOrg', '0', '2018-09-12 00:08:37', '', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', '990cb229-cc18-41f3-8e2b-13f0f0110798', null, null);
INSERT INTO `relevance` VALUES ('0b729611-c225-4fb6-8584-404a58373ff0', '', 'UserOrg', '0', '2018-09-12 00:10:31', '', '49df1602-f5f3-4d52-afb7-3802da619558', '08f41bf6-4388-4b1e-bd3e-2ff538b44b1b', null, null);
INSERT INTO `relevance` VALUES ('0e47cb5d-bdc8-4645-bc50-f38464b0bb83', '', 'RoleDataProperty', '0', '2019-10-26 19:06:37', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'Category', 'TypeId', '');
INSERT INTO `relevance` VALUES ('0fd5b371-b010-4846-8833-95cc1e813a32', '', 'UserElement', '0', '2016-09-07 15:31:16', '0', 'ea25646b-964b-4d41-ab03-d8964e1494fb', '68484265-7802-4f06-b024-33e8b2f2edcf', null, null);
INSERT INTO `relevance` VALUES ('10a76196-ba0c-4294-bb8f-dcd063eb4aab', '', 'UserOrg', '0', '2017-10-12 09:13:38', '', '3eacdedd-e93a-4816-b49c-99ba3d5323c2', '990cb229-cc18-41f3-8e2b-13f0f0110798', null, null);
INSERT INTO `relevance` VALUES ('10e58d75-dec1-4b85-882f-9dac79ad1210', '', 'RoleResource', '0', '2016-10-21 18:08:13', '0', '4980a85b-e3db-4607-bc2c-0baf0140d7df', 'ec99f670-0eca-465c-9f64-d4d5dc510b83', null, null);
INSERT INTO `relevance` VALUES ('120d7a5d-203c-4261-95f5-0125757fb386', '', 'UserElement', '0', '2016-10-20 17:01:01', '0', '3a95e392-07d4-4af3-b30d-140ca93340f5', '7f071c63-1620-4486-9264-5806b2e63218', null, null);
INSERT INTO `relevance` VALUES ('13433400-a32c-4539-b988-8b417c09bc0e', '', 'UserModule', '0', '2016-09-07 15:30:07', '0', '3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7', '9486ff22-b696-4d7f-8093-8a3e53c45453', null, null);
INSERT INTO `relevance` VALUES ('13612a4c-b20c-4bd0-a2cd-0ae47576364d', '', 'UserElement', '0', '2016-10-20 16:34:12', '0', '3a95e392-07d4-4af3-b30d-140ca93340f5', 'c7d7daf0-3669-4a22-8bed-b092617deb9c', null, null);
INSERT INTO `relevance` VALUES ('1490edd4-9bd3-4e71-bfa4-56f6558c1d3f', '', 'UserElement', '0', '2018-04-06 09:48:24', '', '6ba79766-faa0-4259-8139-a4a6d35784e0', '79dcd3eb-3aaf-4e08-83c9-713d8ff446fe', null, null);
INSERT INTO `relevance` VALUES ('16154fc4-d18e-44a3-bcf2-5539b168aba7', '', 'RoleElement', '0', '2016-10-24 17:25:15', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', '18cc3217-28a6-49b2-9a20-080230065984', null, null);
INSERT INTO `relevance` VALUES ('1740ff26-a4d0-44cc-9fab-a0105c2c60b6', '', 'UserOrg', '0', '2017-10-12 13:59:49', '', '63c9c82a-e0d3-4bde-bbd2-057cda2f5283', '08f41bf6-4388-4b1e-bd3e-2ff538b44b1b', null, null);
INSERT INTO `relevance` VALUES ('1758f76d-1ca8-4733-84bb-0028955de8cb', '', 'RoleElement', '0', '2019-10-26 19:06:53', '', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', '84e38920-f6e5-499c-bf52-a3c6f8499ff7', '', '');
INSERT INTO `relevance` VALUES ('17fd67be-044f-49a6-a001-a4b88cb440a2', '', 'RoleModule', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '4abafc83-c8f5-452f-9882-e113a86e7a3e', '', '');
INSERT INTO `relevance` VALUES ('1873ed85-a88a-4236-bd40-2c416aa2576c', '', 'RoleModule', '0', '2016-09-02 17:03:39', '0', '211e12c7-e466-496e-8d26-0660a38e24cc', '7580672f-a390-4bb6-982d-9a4570cb5199', null, null);
INSERT INTO `relevance` VALUES ('19c9621c-3d23-46b7-a841-54d5c82ec8e8', '', 'UserOrg', '0', '2016-09-02 13:56:53', '0', '3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7', '990cb229-cc18-41f3-8e2b-13f0f0110798', null, null);
INSERT INTO `relevance` VALUES ('1aa49ddb-b38f-4b11-b731-43e0dc064bff', '', 'RoleModule', '0', '2019-10-26 19:06:53', '', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', '9486ff22-b696-4d7f-8093-8a3e53c45453', '', '');
INSERT INTO `relevance` VALUES ('1acec4c4-0136-4e2b-a839-8676dbd6594a', '', 'ProcessUser', '0', '2016-09-14 11:38:23', '0', '6c6afe3c-349c-4198-8710-cf19c90f3afd', '3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7', null, null);
INSERT INTO `relevance` VALUES ('1ced1564-2fea-4c04-8aea-f071fa5bb293', '', 'UserModule', '0', '2016-09-05 16:24:55', '0', 'ea25646b-964b-4d41-ab03-d8964e1494fb', '069475e3-c997-487a-9f29-e6a864c5c1d4', null, null);
INSERT INTO `relevance` VALUES ('1cf19b35-e2c2-436f-99b9-03ac2b232cc6', '', 'RoleElement', '0', '2016-09-04 23:21:04', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', '44075557-496e-4dde-bb75-7b69f51ab4fe', null, null);
INSERT INTO `relevance` VALUES ('1d3bb8f4-dfca-439f-8e72-c6cd544ee0c4', '', 'RoleModule', '0', '2019-10-26 19:06:53', '', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', '37bb9414-19a0-4223-9056-71f8c758a935', '', '');
INSERT INTO `relevance` VALUES ('2014027e-0cff-41cf-974b-56126d6eaa9a', '', 'RoleElement', '0', '2016-09-05 09:22:11', '0', '4980a85b-e3db-4607-bc2c-0baf0140d7df', 'c4c1acbb-9cbf-4b1e-9cc0-ccf5ff544ec2', null, null);
INSERT INTO `relevance` VALUES ('21ed61c4-1a01-4180-82ae-5c73d809c210', '', 'RoleElement', '0', '2019-10-26 19:06:53', '', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', '79dcd3eb-3aaf-4e08-83c9-713d8ff446fe', '', '');
INSERT INTO `relevance` VALUES ('225ec467-0521-4933-a631-75a70463bac2', '', 'RoleDataProperty', '0', '2019-10-26 19:06:37', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'Resource', 'Description', '');
INSERT INTO `relevance` VALUES ('242e9543-3343-41d4-8816-15ffeeaef551', '', 'UserElement', '0', '2016-09-07 15:31:16', '0', 'ea25646b-964b-4d41-ab03-d8964e1494fb', '584c7a3b-d28a-47b4-8648-7797d05d83d1', null, null);
INSERT INTO `relevance` VALUES ('27c4d50c-32da-4dbc-88a1-84b343cdd649', '', 'UserElement', '0', '2016-10-20 17:01:00', '0', '3a95e392-07d4-4af3-b30d-140ca93340f5', '6839a297-350b-4215-b680-4e5dfdae5615', null, null);
INSERT INTO `relevance` VALUES ('29b06cd6-af0c-4c63-9aba-e5431c5d62ec', '', 'UserOrg', '0', '2017-10-12 09:13:38', '', '3eacdedd-e93a-4816-b49c-99ba3d5323c2', '08f41bf6-4388-4b1e-bd3e-2ff538b44b1b', null, null);
INSERT INTO `relevance` VALUES ('2a36a2b7-41aa-4190-b88c-75d44a56ad6e', '', 'UserModule', '0', '2017-02-06 00:14:18', '0', '3a95e392-07d4-4af3-b30d-140ca93340f5', '92b00259-2d15-43e7-9321-adffb29e8bf2', null, null);
INSERT INTO `relevance` VALUES ('2ab3e3b4-cdcc-4f8b-86f1-aa9c2d51d1dd', '', 'UserOrg', '0', '2018-09-12 00:10:43', '', '229f3a49-ab27-49ce-b383-9f10ca23a9d5', '86449128-d5ac-44bf-b999-f7735b7458fd', null, null);
INSERT INTO `relevance` VALUES ('2bb3fddb-0f51-442e-8dbf-236beb47d8a6', '', 'RoleOrg', '0', '2018-04-14 13:16:45', '', '77e6d0c3-f9e1-4933-92c3-c1c6eef75593', '08f41bf6-4388-4b1e-bd3e-2ff538b44b1b', null, null);
INSERT INTO `relevance` VALUES ('2ca288a6-d222-4328-951e-c01c3e77a0c7', '', 'RoleElement', '0', '2016-09-04 23:21:00', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', '7f071c63-1620-4486-9264-5806b2e63218', null, null);
INSERT INTO `relevance` VALUES ('2d0fcc88-a7c0-4d33-8a08-1d688e9dde83', '', 'RoleModule', '0', '2016-09-02 17:03:39', '0', '211e12c7-e466-496e-8d26-0660a38e24cc', 'a94d5648-c2a9-405e-ba6f-f1602ec9b807', null, null);
INSERT INTO `relevance` VALUES ('2d15e438-cc3a-41e9-9b13-325bfd5c804a', '', 'RoleElement', '0', '2016-09-04 23:21:09', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', '84e38920-f6e5-499c-bf52-a3c6f8499ff7', null, null);
INSERT INTO `relevance` VALUES ('2ebff9a4-b2d5-4a35-a7dd-2cfa2f5b0522', '', 'ProcessUser', '0', '2016-09-07 17:33:39', '0', '52cc7933-a045-4dcc-8c17-1b618bfa772b', '3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7', null, null);
INSERT INTO `relevance` VALUES ('2ec6bb80-7fc3-46b1-afd8-b5b007c5589c', '', 'RoleModule', '0', '2019-10-26 19:06:53', '', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', '37bb9414-19a0-4223-9056-71f8c758a931', '', '');
INSERT INTO `relevance` VALUES ('2f462e28-e889-4960-877c-c7ea395e9d0d', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'daddf3b9-71b5-45ac-b85d-5a11c522f2f4', '', '');
INSERT INTO `relevance` VALUES ('30c82d18-7892-4e5f-9aee-e4f483a858c2', '', 'UserModule', '0', '2016-09-05 16:24:55', '0', 'ea25646b-964b-4d41-ab03-d8964e1494fb', '9486ff22-b696-4d7f-8093-8a3e53c45453', null, null);
INSERT INTO `relevance` VALUES ('312fc56f-bac0-48e2-a1d7-de1ab88e0b5a', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '68fc793f-069f-43e1-a012-42ac2d7c585c', '', '');
INSERT INTO `relevance` VALUES ('31a2d4b0-2620-46a0-bb27-42c3560849fe', '', 'RoleModule', '0', '2019-10-26 19:06:53', '', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', '37bb9414-19a0-4223-9056-71f8c758a934', '', '');
INSERT INTO `relevance` VALUES ('332a373c-f485-4f85-9af9-7792f7462bf1', '', 'RoleModule', '0', '2016-09-02 17:03:47', '0', '648b04c4-4ac2-4d69-bef6-07081ef27871', '89c3bfbe-246f-4112-8eb1-b6789da54202', null, null);
INSERT INTO `relevance` VALUES ('340c60fe-8b95-474c-aa04-9197903998d2', '', 'RoleModule', '0', '2016-09-04 23:20:34', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', '7580672f-a390-4bb6-982d-9a4570cb5199', null, null);
INSERT INTO `relevance` VALUES ('34579ca2-7235-4211-a1f7-72b6bab1fc08', '', 'RoleModule', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'a94d5648-c2a9-405e-ba6f-f1602ec9b807', '', '');
INSERT INTO `relevance` VALUES ('361feb63-bde2-49c7-86ec-6df3ec6f0fe3', '', 'RoleElement', '0', '2016-09-04 23:21:13', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', '1c870438-4260-43a5-8996-a6e1dc8bbf6a', null, null);
INSERT INTO `relevance` VALUES ('36a6b42c-da82-4fb0-a3fa-d36252850d2f', '', 'RoleModule', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '069475e3-c997-487a-9f29-e6a864c5c1d4', '', '');
INSERT INTO `relevance` VALUES ('37885516-f95b-4294-be59-a888ff2aa150', '', 'RoleModule', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c', '', '');
INSERT INTO `relevance` VALUES ('386d6cb7-c465-422c-974f-3250b0e4888f', '', 'UserOrg', '0', '2018-09-12 00:10:35', '', '6ba79766-faa0-4259-8139-a4a6d35784e0', '08f41bf6-4388-4b1e-bd3e-2ff538b44b1b', null, null);
INSERT INTO `relevance` VALUES ('38c8a6dc-24c4-4111-8c87-c63e8394a902', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '84694ea5-d6e1-4a65-8a59-7b5b779688d4', '', '');
INSERT INTO `relevance` VALUES ('392dc41e-7186-4efb-a8e5-b5317e4122fb', '', 'RoleResource', '0', '2018-09-10 12:54:14', '', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', 'OPENAUTH_DELETEACCOUNT', null, null);
INSERT INTO `relevance` VALUES ('3bcaab20-e096-480e-a9bb-0fdb70686714', '', 'RoleElement', '0', '2016-09-04 23:21:00', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', 'cf7388be-2677-427c-ad78-8f00f1062b96', null, null);
INSERT INTO `relevance` VALUES ('3de0359b-6331-4dc7-a00e-751f71dbadb5', '', 'ProcessUser', '0', '2016-09-28 09:23:30', '0', '68295d2a-4dfd-4c5e-81e3-9c787e2603bc', '3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7', null, null);
INSERT INTO `relevance` VALUES ('3de08491-aec8-4dda-8926-8ab173c70670', '', 'RoleElement', '0', '2019-10-26 19:06:53', '', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', '68484265-7802-4f06-b024-33e8b2f2edcf', '', '');
INSERT INTO `relevance` VALUES ('4190f00a-11a0-4814-849b-cc5232fa4dd4', '', 'RoleResource', '0', '2018-09-12 00:15:54', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'OPENAUTH_DELETEACCOUNT', null, null);
INSERT INTO `relevance` VALUES ('456f7ce4-7279-456c-9b36-6c91cb698d62', '', 'RoleModule', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '37bb9414-19a0-4223-9056-71f8c758a933', '', '');
INSERT INTO `relevance` VALUES ('457b7de3-849b-4524-8d17-adb35beb699e', '', 'RoleElement', '0', '2019-10-26 19:06:53', '', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', '816b12b3-e916-446d-a2fa-329cfd13c831', '', '');
INSERT INTO `relevance` VALUES ('45fcbc8b-2951-40a1-8329-4bdf3c8f70e4', '', 'UserOrg', '0', '2018-09-12 00:10:35', '', '6ba79766-faa0-4259-8139-a4a6d35784e0', '990cb229-cc18-41f3-8e2b-13f0f0110798', null, null);
INSERT INTO `relevance` VALUES ('460d1c98-2a68-43cf-8d38-d40ceb89916f', '', 'UserOrg', '0', '2017-10-12 09:13:38', '', '3eacdedd-e93a-4816-b49c-99ba3d5323c2', '86449128-d5ac-44bf-b999-f7735b7458fd', null, null);
INSERT INTO `relevance` VALUES ('461b3c6c-1824-4134-87ee-dfce9182d6b6', '', 'RoleElement', '0', '2019-10-26 19:06:53', '', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', 'c3d7b478-21e9-4c1e-b866-a3c80be7909b', '', '');
INSERT INTO `relevance` VALUES ('4684d2bc-0ae4-45c2-99c9-df87da1bbcfa', '', 'RoleModule', '0', '2019-10-26 19:06:53', '', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', '069475e3-c997-487a-9f29-e6a864c5c1d4', '', '');
INSERT INTO `relevance` VALUES ('46d12dba-4f98-48a7-a933-3c14876228e2', '', 'RoleModule', '0', '2019-10-26 19:06:53', '', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', '4abafc83-c8f5-452f-9882-e113a86e7a3e', '', '');
INSERT INTO `relevance` VALUES ('46e86c89-fb05-4bab-b6bb-437207e7d97f', '', 'RoleModule', '0', '2019-10-26 19:06:53', '', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', '37bb9414-19a0-4223-9056-71f8c758a933', '', '');
INSERT INTO `relevance` VALUES ('4757bb30-e4bc-4c2d-a824-947ef151d341', '', 'UserRole', '0', '2016-09-07 20:21:16', '0', '3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7', '4980a85b-e3db-4607-bc2c-0baf0140d7df', null, null);
INSERT INTO `relevance` VALUES ('49f01513-4e87-4372-842a-f18dd674a4f0', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '7b2b1ffb-398b-4f7b-83da-8f484e1bcea0', '', '');
INSERT INTO `relevance` VALUES ('4b82f71d-4a99-4ca2-a416-8438675a9698', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'c3d7b478-21e9-4c1e-b866-a3c80be7909b', '', '');
INSERT INTO `relevance` VALUES ('4ba3982b-f0ae-4f9a-980e-1eaedc3b5f2e', '', 'UserElement', '0', '2016-09-07 17:48:34', '0', '3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7', '584c7a3b-d28a-47b4-8648-7797d05d83d1', null, null);
INSERT INTO `relevance` VALUES ('4c2fb006-53d6-4041-8cf6-e5d74d788897', '', 'UserModule', '0', '2018-04-06 09:48:19', '', '6ba79766-faa0-4259-8139-a4a6d35784e0', '9486ff22-b696-4d7f-8093-8a3e53c45453', null, null);
INSERT INTO `relevance` VALUES ('4c69794b-9957-4f6b-b0fb-6455fe643565', '', 'UserElement', '0', '2018-04-06 14:50:41', '', '49df1602-f5f3-4d52-afb7-3802da619558', '826b12b3-e916-446d-a2fa-329cfd13c831', null, null);
INSERT INTO `relevance` VALUES ('4caeb650-993d-4ad5-b0c6-579b891b76aa', '', 'RoleElement', '0', '2019-10-26 19:06:53', '', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', '1a473afd-cbd4-41e9-9471-81f9435aaabe', '', '');
INSERT INTO `relevance` VALUES ('4cf39136-f804-4757-b4df-f1c3b72505c2', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '5ed1681c-13d2-4c87-8675-a8d95c0b40ae', '', '');
INSERT INTO `relevance` VALUES ('4daccce5-cb7b-46aa-8bed-3c85c72436be', '', 'RoleOrg', '0', '2018-09-12 00:08:37', '', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', '08f41bf6-4388-4b1e-bd3e-2ff538b44b1b', null, null);
INSERT INTO `relevance` VALUES ('4e613188-0387-4d17-a60d-703b4a606d75', '', 'RoleModule', '0', '2016-09-04 23:20:34', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', 'bc80478d-0547-4437-9cff-be4b40144bdf', null, null);
INSERT INTO `relevance` VALUES ('4e665304-9f05-410e-b68f-44d45281b788', '', 'RoleOrg', '0', '2018-09-12 00:08:47', '', '3e761e88-ddf7-4a62-b219-9a315b4564f2', 'c36e43df-3a99-45da-80d9-3ac5d24f4014', null, null);
INSERT INTO `relevance` VALUES ('4ec39ee9-9ee9-4aa9-a0db-eb0fdf8d2f00', '', 'UserElement', '0', '2018-04-06 09:48:27', '', '6ba79766-faa0-4259-8139-a4a6d35784e0', 'b3e23ebc-0ff2-41b3-bff0-fd5e93f6828a', null, null);
INSERT INTO `relevance` VALUES ('4ee89c07-55e2-4ca6-9ef1-449cfe0a2c3c', '', 'RoleResource', '0', '2018-09-12 00:15:54', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'OPENAUTH_LOGIN', null, null);
INSERT INTO `relevance` VALUES ('4eef06e8-9267-41df-adde-e5d1ba2ab86a', '', 'RoleModule', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '7580672f-a390-4bb6-982d-9a4570cb5199', '', '');
INSERT INTO `relevance` VALUES ('4fde1dc6-9d73-4c7c-9238-28981858c5a6', '', 'RoleModule', '0', '2016-09-05 09:21:56', '0', '4980a85b-e3db-4607-bc2c-0baf0140d7df', '89c3bfbe-246f-4112-8eb1-b6789da54202', null, null);
INSERT INTO `relevance` VALUES ('5167dbcd-3a32-4ae8-827e-6f381cc58fa2', '', 'RoleElement', '0', '2016-09-04 23:21:00', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', 'fa816af1-a28d-47b5-9b8b-c46e18f902e9', null, null);
INSERT INTO `relevance` VALUES ('53a4be87-4fa8-415b-97b5-2298ce8b17c8', '', 'UserResource', '0', '2018-04-14 14:38:04', '', '49df1602-f5f3-4d52-afb7-3802da619558', 'XXX_LOGIN', null, null);
INSERT INTO `relevance` VALUES ('53b5bcf1-f09d-4ec6-93ea-8f63d1829227', '', 'RoleDataProperty', '0', '2019-10-26 19:06:54', '', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', 'Category', 'Name', '');
INSERT INTO `relevance` VALUES ('544a3d10-1f1b-4294-b37d-24b80ffde225', '', 'RoleDataProperty', '0', '2019-10-26 19:06:37', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'Resource', 'TypeId', '');
INSERT INTO `relevance` VALUES ('54b2e9b6-1f7c-4a39-92c9-98f58429c1fc', '', 'RoleModule', '0', '2016-09-02 17:03:39', '0', '211e12c7-e466-496e-8d26-0660a38e24cc', 'bc80478d-0547-4437-9cff-be4b40144bdf', null, null);
INSERT INTO `relevance` VALUES ('54b4294b-17ee-4da6-a06e-0a317647d0ad', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '44075557-496e-4dde-bb75-7b69f51ab4fe', '', '');
INSERT INTO `relevance` VALUES ('55b10ecc-3fb3-4127-b69e-e7a3467d7a1a', '', 'RoleElement', '0', '2016-09-05 09:22:11', '0', '4980a85b-e3db-4607-bc2c-0baf0140d7df', '6db928fe-93df-460f-9472-8bb0b6cae52c', null, null);
INSERT INTO `relevance` VALUES ('5725ff79-43c6-4778-bbff-131cf364dab6', '', 'UserElement', '0', '2016-10-20 17:01:01', '0', '3a95e392-07d4-4af3-b30d-140ca93340f5', 'cf7388be-2677-427c-ad78-8f00f1062b96', null, null);
INSERT INTO `relevance` VALUES ('5a20d59c-6ee6-4fe2-98fe-7b35b11026ae', '', 'UserElement', '0', '2016-09-07 15:30:20', '0', '3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7', '68484265-7802-4f06-b024-33e8b2f2edcf', null, null);
INSERT INTO `relevance` VALUES ('5b2d5db8-d603-4be3-add2-c85ef3c53ddc', '', 'UserResource', '0', '2018-04-14 14:38:05', '', '49df1602-f5f3-4d52-afb7-3802da619558', 'OPENAUTH_LOGIN', null, null);
INSERT INTO `relevance` VALUES ('5ccce632-f8f0-452b-8faf-4a5372004e85', '', 'RoleResource', '0', '2018-09-12 00:15:54', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'XXX_CHECKUSER', null, null);
INSERT INTO `relevance` VALUES ('5ce7beba-0ee7-40b6-8d65-133bcec98b90', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '5ed1681c-13d2-4c87-8677-a8d95c0b40ae', '', '');
INSERT INTO `relevance` VALUES ('5d6a3dd5-b133-430b-a7ab-1c04825fa6e2', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '79dcd3eb-3aaf-4e08-83c9-713d8ff446fe', '', '');
INSERT INTO `relevance` VALUES ('6168b845-c610-4fda-a4b1-bf881cab31d1', '', 'RoleModule', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '37bb9414-19a0-4223-9056-71f8c758a930', '', '');
INSERT INTO `relevance` VALUES ('620b368a-7b56-4c74-ab85-8bc91d08ddc9', '', 'RoleElement', '0', '2016-09-04 23:20:42', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', '1c9acc3e-a40d-4d07-b495-6e60eb9b71b9', null, null);
INSERT INTO `relevance` VALUES ('6398a43e-7c8a-479d-a5b2-1563e9a2b414', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '2feefce1-e3d8-42ac-b811-2352679628da', '', '');
INSERT INTO `relevance` VALUES ('6431a464-6f1f-4ffc-8157-89212b70f09a', '', 'RoleOrg', '0', '2016-09-05 00:00:00', '0', '4980a85b-e3db-4607-bc2c-0baf0140d7df', '08f41bf6-4388-4b1e-bd3e-2ff538b44b1b', null, null);
INSERT INTO `relevance` VALUES ('648500cc-e1e6-426d-9f17-c6061ce606a1', '', 'UserOrg', '0', '2017-12-11 16:19:06', '', 'de8be521-f1ec-4483-b124-0be342890507', '08f41bf6-4388-4b1e-bd3e-2ff538b44b1b', null, null);
INSERT INTO `relevance` VALUES ('64e4f5aa-28ef-4690-9b20-5f0b543964f6', '', 'UserElement', '0', '2016-09-07 15:30:20', '0', '3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7', '816b12b3-e916-446d-a2fa-329cfd13c831', null, null);
INSERT INTO `relevance` VALUES ('65c721a2-ed3a-4f04-a3de-edce57444c51', '', 'RoleDataProperty', '0', '2019-10-26 19:06:37', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'Category', 'Id', '');
INSERT INTO `relevance` VALUES ('66152624-92a6-47de-9fe3-b8393d19f120', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '9e2c6754-f258-4b14-96a0-b9d981196a65', '', '');
INSERT INTO `relevance` VALUES ('6645b6fb-efcf-4e48-9c13-84f79bc5be34', '', 'RoleOrg', '0', '2018-04-14 13:16:45', '', '77e6d0c3-f9e1-4933-92c3-c1c6eef75593', '86449128-d5ac-44bf-b999-f7735b7458fd', null, null);
INSERT INTO `relevance` VALUES ('66e25fc5-093d-42ab-85dc-a38f6600889b', '', 'UserOrg', '0', '2016-09-02 13:57:32', '0', 'ea25646b-964b-4d41-ab03-d8964e1494fb', 'c36e43df-3a99-45da-80d9-3ac5d24f4014', null, null);
INSERT INTO `relevance` VALUES ('6708fc49-3907-4c2a-9a0e-e65fe40cac09', '', 'RoleModule', '0', '2019-10-26 19:06:53', '', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', '37bb9414-19a0-4223-9056-71f8c758a930', '', '');
INSERT INTO `relevance` VALUES ('67f1aeb1-9cc5-4dc5-9f1f-9598c066112c', '', 'RoleDataProperty', '0', '2019-10-26 19:06:37', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'Category', 'Icon', '');
INSERT INTO `relevance` VALUES ('68912e65-256e-45b6-b48e-036382598d32', '', 'RoleOrg', '0', '2016-10-17 10:03:49', '0', '2eb423d6-6ad9-4efe-b423-872478a2a434', '990cb229-cc18-41f3-8e2b-13f0f0110798', null, null);
INSERT INTO `relevance` VALUES ('68c61010-e9b0-487a-9713-a0e463bf7c1f', '', 'RoleModule', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'e8dc5db6-4fc4-4795-a1cc-681cbcceec91', '', '');
INSERT INTO `relevance` VALUES ('6b9c4789-042c-4f6f-a749-ee68ee87462d', '', 'ProcessUser', '0', '2016-10-27 16:47:52', '0', '054ff054-d8ae-4911-a596-8fb1f66b348f', '3a95e392-07d4-4af3-b30d-140ca93340f5', null, null);
INSERT INTO `relevance` VALUES ('6d2827d2-3cf8-4094-8c03-3ff8a3f8e590', '', 'RoleModule', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '9486ff22-b696-4d7f-8093-8a3e53c45453', '', '');
INSERT INTO `relevance` VALUES ('6da6d662-8cef-47cd-80b3-fa885b2dca7a', '', 'RoleOrg', '0', '2018-04-14 13:16:45', '', '77e6d0c3-f9e1-4933-92c3-c1c6eef75593', '990cb229-cc18-41f3-8e2b-13f0f0110798', null, null);
INSERT INTO `relevance` VALUES ('6db5666b-6f8c-4e83-bada-0b45054bd9a4', '', 'RoleElement', '0', '2016-09-04 23:20:42', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', '0d25438e-1436-48e0-aedf-0f1690693282', null, null);
INSERT INTO `relevance` VALUES ('6fe52499-f800-47ce-96fc-a2b5b43505d5', '', 'UserElement', '0', '2018-04-06 09:48:22', '', '6ba79766-faa0-4259-8139-a4a6d35784e0', '584c7a3b-d28a-47b4-8648-7797d05d83d1', null, null);
INSERT INTO `relevance` VALUES ('715d017a-68b6-468d-aa3f-32ca4cfd4b9e', '', 'RoleModule', '0', '2016-09-04 23:20:34', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', 'bedb41a2-f310-4775-af99-01be08adda93', null, null);
INSERT INTO `relevance` VALUES ('71d2b1e4-4c64-4074-b9f3-d46f3a32fd24', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '5ed1681c-13d2-4c87-8676-a8d95c0b40ae', '', '');
INSERT INTO `relevance` VALUES ('72425cea-3881-4fbf-8d5c-f37def9c03e1', '', 'RoleModule', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '37bb9414-19a0-4223-9056-71f8c758a931', '', '');
INSERT INTO `relevance` VALUES ('72bf4729-af60-42f5-b0d7-717362ffad7f', '', 'RoleElement', '0', '2016-09-04 23:21:00', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', '2feefce1-e3d8-42ac-b811-2352679628da', null, null);
INSERT INTO `relevance` VALUES ('736e90f7-3747-472e-816d-dbb7fdf3b0bb', '', 'RoleOrg', '0', '2018-09-12 00:08:42', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '08f41bf6-4388-4b1e-bd3e-2ff538b44b1b', null, null);
INSERT INTO `relevance` VALUES ('7475b0c3-f204-4f95-a22f-80591fe76bc7', '', 'ProcessUser', '0', '2016-10-31 11:52:39', '0', 'b8bcdf59-1e29-4d97-a364-12ac8e8c5c61', '3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7', null, null);
INSERT INTO `relevance` VALUES ('75340ad3-fb80-4646-b1de-ba801688ddc2', '', 'RoleElement', '0', '2016-09-04 23:21:04', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', '5ed1681c-13d2-4c87-8675-a8d95c0b40ae', null, null);
INSERT INTO `relevance` VALUES ('77bd93da-2c2b-4ba8-bf05-3a1382811a6a', '', 'RoleModule', '0', '2016-09-02 17:03:39', '0', '211e12c7-e466-496e-8d26-0660a38e24cc', 'e8dc5db6-4fc4-4795-a1cc-681cbcceec91', null, null);
INSERT INTO `relevance` VALUES ('77eec82a-f713-4584-872c-761fdbcdb456', '', 'UserElement', '0', '2018-04-06 14:50:37', '', '49df1602-f5f3-4d52-afb7-3802da619558', '68484265-7802-4f06-b024-33e8b2f2edcf', null, null);
INSERT INTO `relevance` VALUES ('77fc08e6-98ae-4d33-b294-bd9fed5b14ed', '', 'UserElement', '0', '2018-04-06 14:50:36', '', '49df1602-f5f3-4d52-afb7-3802da619558', '816b12b3-e916-446d-a2fa-329cfd13c831', null, null);
INSERT INTO `relevance` VALUES ('7979eabe-a599-4081-b0c9-694f11a239dc', '', 'RoleModule', '0', '2019-10-26 19:06:53', '', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', '7580672f-a390-4bb6-982d-9a4570cb5199', '', '');
INSERT INTO `relevance` VALUES ('797c6e5f-7f3c-4891-89b9-a054e10f6c00', '', 'UserModule', '0', '2018-04-06 09:48:01', '', '49df1602-f5f3-4d52-afb7-3802da619558', '37bb9414-19a0-4223-9056-71f8c758a930', null, null);
INSERT INTO `relevance` VALUES ('79987683-7569-4c59-9311-08dea1721e02', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '17ae4fd4-ab4e-439e-ba1d-2a53b46d112b', '', '');
INSERT INTO `relevance` VALUES ('7e6b30dd-a25f-415e-8d22-31bb7917035e', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '816b12b3-e916-446d-a2fa-329cfd13c831', '', '');
INSERT INTO `relevance` VALUES ('7f25286f-246b-4143-98eb-c3e574fe7455', '', 'ProcessUser', '0', '2016-09-07 17:33:39', '0', '52cc7933-a045-4dcc-8c17-1b618bfa772b', '3a95e392-07d4-4af3-b30d-140ca93340f5', null, null);
INSERT INTO `relevance` VALUES ('7fd7f976-f10e-44aa-a7ba-7ca40d2e8f90', '', 'RoleOrg', '0', '2016-10-17 10:03:30', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', '08f41bf6-4388-4b1e-bd3e-2ff538b44b1b', null, null);
INSERT INTO `relevance` VALUES ('80310629-5e52-482c-9a0f-5c5bdfabcd9e', '', 'RoleOrg', '0', '2016-09-05 00:00:00', '0', '4980a85b-e3db-4607-bc2c-0baf0140d7df', '990cb229-cc18-41f3-8e2b-13f0f0110798', null, null);
INSERT INTO `relevance` VALUES ('808336a7-fc50-4b31-82fd-62582fc71c3b', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '826b12b3-e916-446d-a2fa-329cfd13c831', '', '');
INSERT INTO `relevance` VALUES ('81f5d041-f0c1-4636-89a4-635424d8bf22', '', 'RoleDataProperty', '0', '2019-10-26 19:06:37', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'Resource', 'ParentName', '');
INSERT INTO `relevance` VALUES ('832f4a8f-7791-4aa6-bcd2-20dcb6f5ef37', '', 'UserElement', '0', '2016-09-02 14:53:04', '0', '3a95e392-07d4-4af3-b30d-140ca93340f5', '15a4f88c-4fae-4cab-ba2f-0cbd2cca8736', null, null);
INSERT INTO `relevance` VALUES ('84a52091-08a0-4a46-b661-3cd206771c29', '', 'RoleModule', '0', '2016-09-04 23:20:34', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', '0031262c-689c-4b96-bae2-2c9d67076ade', null, null);
INSERT INTO `relevance` VALUES ('854e0658-ab8a-4869-b157-9941955acdc6', '', 'RoleElement', '0', '2016-09-04 23:21:09', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', '1a473afd-cbd4-41e9-9471-81f9435aaabe', null, null);
INSERT INTO `relevance` VALUES ('889aba59-064c-45cd-8672-87f8dd99bd8c', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '6c814946-db5c-48bd-84dd-b1c38196ad74', '', '');
INSERT INTO `relevance` VALUES ('88a4c966-d042-4a2e-b133-ff7eded1c5de', '', 'RoleElement', '0', '2016-09-04 23:21:13', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', '7b2b1ffb-398b-4f7b-83da-8f484e1bcea0', null, null);
INSERT INTO `relevance` VALUES ('89c6c2af-deb6-4745-9ec8-1aea977f9fc9', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'f8dde22a-2a37-47c4-8e67-70fb3af5303e', '', '');
INSERT INTO `relevance` VALUES ('8b08a257-a2a4-4ac9-bd1e-576028ccf7c9', '', 'RoleDataProperty', '0', '2019-10-26 19:06:37', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'Resource', 'Id', '');
INSERT INTO `relevance` VALUES ('8b633f3c-965b-4e35-8496-c364890d7760', '', 'RoleElement', '0', '2016-09-04 23:21:09', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', 'c3d7b478-21e9-4c1e-b866-a3c80be7909b', null, null);
INSERT INTO `relevance` VALUES ('8c5b5e11-e9b8-43c8-ad1b-9d36b92e57a7', '', 'RoleModule', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'bedb41a2-f310-4775-af99-01be08adda93', '', '');
INSERT INTO `relevance` VALUES ('8dec7aee-3266-417a-ad9b-7eac7ac985a5', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '1c9acc3e-a40d-4d07-b495-6e60eb9b71b9', '', '');
INSERT INTO `relevance` VALUES ('8f8b5fd2-1944-4b96-af7f-56a45b336828', '', 'RoleModule', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '92b00259-2d15-43e7-9321-adffb29e8bf2', '', '');
INSERT INTO `relevance` VALUES ('8fa4a52f-9c0a-43c9-9b7e-b378efb4e1df', '', 'RoleResource', '0', '2018-09-10 12:54:14', '', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', 'OPENAUTH_LOGIN', null, null);
INSERT INTO `relevance` VALUES ('91cb1ea3-ada4-4ec1-8355-ef9824aad693', '', 'RoleDataProperty', '0', '2019-10-26 19:06:37', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'Resource', 'AppId', '');
INSERT INTO `relevance` VALUES ('92f0b297-96c1-47d4-84dd-571374431bc0', '', 'RoleElement', '0', '2016-09-04 23:21:04', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', '84694ea5-d6e1-4a65-8a59-7b5b779688d4', null, null);
INSERT INTO `relevance` VALUES ('937b0494-5932-442d-9aec-7d60ef2b90cd', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'b3e23ebc-0ff2-41b3-bff0-fd5e93f6828a', '', '');
INSERT INTO `relevance` VALUES ('93bcac7a-0ff1-488c-8d1c-3da7e44cbefc', '', 'RoleElement', '0', '2016-09-04 23:21:00', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', 'd1ba6a72-ba14-44c0-baba-46d0ad96fe8a', null, null);
INSERT INTO `relevance` VALUES ('95ea7f58-6845-47e4-98db-cf5905bc97ea', '', 'RoleModule', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'bc80478d-0547-4437-9cff-be4b40144bdf', '', '');
INSERT INTO `relevance` VALUES ('960224e6-5910-472b-a5ef-b2aa9a8b106f', '', 'UserRole', '0', '2016-09-06 17:06:15', '0', '3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', null, null);
INSERT INTO `relevance` VALUES ('962b278b-0894-4b36-b1a0-6c5c3d11d4c3', '', 'UserElement', '0', '2018-04-06 14:50:17', '', '49df1602-f5f3-4d52-afb7-3802da619558', 'b3e23ebc-0ff2-41b3-bff0-fd5e93f6828a', null, null);
INSERT INTO `relevance` VALUES ('965f010b-2fd6-4b34-ba23-3e44c1af2877', '', 'RoleOrg', '0', '2016-09-08 16:19:18', '0', '36094f5d-07e7-40d5-91dc-ff60f98b496a', '990cb229-cc18-41f3-8e2b-13f0f0110798', null, null);
INSERT INTO `relevance` VALUES ('9777486f-6f33-4371-8c70-15a574e5282d', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '4bfa8ea0-6b0d-426f-8687-b654575ca780', '', '');
INSERT INTO `relevance` VALUES ('9ad706e3-8e6b-4bc7-a502-371b298ef062', '', 'RoleElement', '0', '2016-09-04 23:21:13', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', 'ef42721f-d223-4a00-a1d9-80b81121f21a', null, null);
INSERT INTO `relevance` VALUES ('9ba1fbf0-c101-4b2b-b3e2-f8a255dbdeea', '', 'UserRole', '0', '2019-01-08 02:21:50', '', '49df1602-f5f3-4d52-afb7-3802da619558', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '', '');
INSERT INTO `relevance` VALUES ('9cb058da-f99f-4360-ab3e-2efbbf62e244', '', 'RoleElement', '0', '2019-10-26 19:06:53', '', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', '584c7a3b-d28a-47b4-8648-7797d05d83d1', '', '');
INSERT INTO `relevance` VALUES ('9d568d6d-d78d-47d6-8fb6-b1327cdbe83a', '', 'RoleModule', '0', '2016-09-04 23:20:34', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', 'a94d5648-c2a9-405e-ba6f-f1602ec9b807', null, null);
INSERT INTO `relevance` VALUES ('9e46a946-6e81-4f61-bcba-21e4f7fac3df', '', 'RoleModule', '0', '2016-09-02 17:03:39', '0', '211e12c7-e466-496e-8d26-0660a38e24cc', 'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c', null, null);
INSERT INTO `relevance` VALUES ('9e57e1ff-e9cf-4600-a872-ac85f7845bb0', '', 'RoleOrg', '0', '2018-04-14 13:16:45', '', '77e6d0c3-f9e1-4933-92c3-c1c6eef75593', 'c36e43df-3a99-45da-80d9-3ac5d24f4014', null, null);
INSERT INTO `relevance` VALUES ('9edc7b81-2b51-4193-8805-6062e596ccdc', '', 'UserOrg', '0', '2016-09-02 13:57:32', '0', 'ea25646b-964b-4d41-ab03-d8964e1494fb', '08f41bf6-4388-4b1e-bd3e-2ff538b44b1b', null, null);
INSERT INTO `relevance` VALUES ('9fa50449-5d87-4579-9f1f-9cdcd876976b', '', 'RoleElement', '0', '2016-09-04 23:21:00', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', '6839a297-350b-4215-b680-4e5dfdae5615', null, null);
INSERT INTO `relevance` VALUES ('a051aa08-38da-4b6d-8d90-10b3c2485e4b', '', 'RoleOrg', '0', '2016-09-05 00:00:00', '0', '4980a85b-e3db-4607-bc2c-0baf0140d7df', '543a9fcf-4770-4fd9-865f-030e562be238', null, null);
INSERT INTO `relevance` VALUES ('a06fe8c6-3f5e-4085-9bbf-e366571a356c', '', 'RoleElement', '0', '2016-09-04 23:21:04', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', 'daddf3b9-71b5-45ac-b85d-5a11c522f2f4', null, null);
INSERT INTO `relevance` VALUES ('a0904102-e26a-4bc5-9c95-ed5ef977586b', '', 'RoleModule', '0', '2016-09-02 17:03:39', '0', '211e12c7-e466-496e-8d26-0660a38e24cc', '6a9e1346-0c01-44d2-8eb1-f929fdab542a', null, null);
INSERT INTO `relevance` VALUES ('a57900b2-caf1-4cbd-8ac2-f8dd9a40199d', '', 'UserRole', '0', '2018-09-12 00:10:24', '', '6ba79766-faa0-4259-8139-a4a6d35784e0', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', null, null);
INSERT INTO `relevance` VALUES ('a5bef7bf-ecdb-4480-ad64-b39a02269607', '', 'UserModule', '0', '2018-04-06 09:48:37', '', '49df1602-f5f3-4d52-afb7-3802da619558', '069475e3-c997-487a-9f29-e6a864c5c1d4', null, null);
INSERT INTO `relevance` VALUES ('a8094b46-de5a-40ea-a8ee-69ea905480ef', '', 'RoleModule', '0', '2016-09-05 09:21:56', '0', '4980a85b-e3db-4607-bc2c-0baf0140d7df', '069475e3-c997-487a-9f29-e6a864c5c1d4', null, null);
INSERT INTO `relevance` VALUES ('a8123b37-ba70-4aab-aef6-1938733b5210', '', 'RoleElement', '0', '2016-09-04 23:20:42', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', 'c0d8505c-061a-467d-862a-c94f27caa208', null, null);
INSERT INTO `relevance` VALUES ('a9821db0-49bd-49be-a554-afa811c99760', '', 'RoleResource', '0', '2016-09-04 23:20:22', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', 'ec99f670-0eca-465c-9f64-d4d5dc510b83', null, null);
INSERT INTO `relevance` VALUES ('aa051096-a23a-431d-9053-bb954f9453a7', '', 'RoleElement', '0', '2016-09-04 23:20:54', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', '4bfa8ea0-6b0d-426f-8687-b654575ca780', null, null);
INSERT INTO `relevance` VALUES ('aadde9c8-522a-4a57-8b6e-70ced69de135', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'd1ba6a72-ba14-44c0-baba-46d0ad96fe8a', '', '');
INSERT INTO `relevance` VALUES ('ab84b111-fb5d-4ddd-99d5-479954d9d521', '', 'RoleOrg', '0', '2016-09-08 16:19:18', '0', '36094f5d-07e7-40d5-91dc-ff60f98b496a', '08f41bf6-4388-4b1e-bd3e-2ff538b44b1b', null, null);
INSERT INTO `relevance` VALUES ('ab924ba7-8a74-4804-82b0-ecbbedf4c13e', '', 'RoleElement', '0', '2016-09-05 09:22:11', '0', '4980a85b-e3db-4607-bc2c-0baf0140d7df', '38109ca0-32ec-44bd-a243-017e591b532b', null, null);
INSERT INTO `relevance` VALUES ('ac184827-9899-4b40-8939-61fe9d2b187c', '', 'UserElement', '0', '2016-09-07 17:48:49', '0', '3a95e392-07d4-4af3-b30d-140ca93340f5', '584c7a3b-d28a-47b4-8648-7797d05d83d1', null, null);
INSERT INTO `relevance` VALUES ('acb4d37f-8b45-4a99-b364-99f3881dfcda', '', 'RoleElement', '0', '2016-09-04 23:21:13', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', 'f8dde22a-2a37-47c4-8e67-70fb3af5303e', null, null);
INSERT INTO `relevance` VALUES ('acbb93c5-61a5-4205-9a0c-bdfaffe3fc03', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '15a4f88c-4fae-4cab-ba2f-0cbd2cca8736', '', '');
INSERT INTO `relevance` VALUES ('acc51898-5335-4903-83b9-4701a782bc4d', '', 'UserElement', '0', '2016-10-20 17:01:02', '0', '3a95e392-07d4-4af3-b30d-140ca93340f5', 'fa816af1-a28d-47b5-9b8b-c46e18f902e9', null, null);
INSERT INTO `relevance` VALUES ('ad267296-5eba-4d59-b821-8148d8cfb3c6', '', 'RoleModule', '0', '2016-09-04 23:20:34', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', 'e8dc5db6-4fc4-4795-a1cc-681cbcceec91', null, null);
INSERT INTO `relevance` VALUES ('ad29467e-eeee-494c-ab82-f6be5d2619d5', '', 'RoleElement', '0', '2016-09-04 23:21:00', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', '50c9df24-b233-42cb-9a0d-4ce158c75f86', null, null);
INSERT INTO `relevance` VALUES ('ad30e13e-6b75-48f9-97e3-c723d3e36a28', '', 'RoleResource', '0', '2018-09-12 00:15:54', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'OPENAUTH_MODIFYACCOUNT', null, null);
INSERT INTO `relevance` VALUES ('ad5bc7a6-e307-4fa8-a4ef-ce9e09f7e21b', '', 'RoleModule', '0', '2016-09-05 09:21:56', '0', '4980a85b-e3db-4607-bc2c-0baf0140d7df', '9486ff22-b696-4d7f-8093-8a3e53c45453', null, null);
INSERT INTO `relevance` VALUES ('ad905aa6-d3d8-4fe9-99b4-5f8be7891d1e', '', 'RoleResource', '0', '2018-09-12 00:15:54', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'XXX_ADMIN', null, null);
INSERT INTO `relevance` VALUES ('ada04e01-432a-4068-a025-9517bbd9732a', '', 'RoleDataProperty', '0', '2019-10-26 19:06:37', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'Resource', 'Name', '');
INSERT INTO `relevance` VALUES ('ae2b53cd-15d1-4b07-b0fe-6aabd996a27f', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '584c7a3b-d28a-47b4-8648-7797d05d83d1', '', '');
INSERT INTO `relevance` VALUES ('ae619801-1959-44fd-a75b-a8cca4d559b4', '', 'RoleOrg', '0', '2018-09-12 00:08:37', '', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', '543a9fcf-4770-4fd9-865f-030e562be238', null, null);
INSERT INTO `relevance` VALUES ('af263192-daa8-4f29-99b9-1efb96e31627', '', 'RoleElement', '0', '2016-09-04 23:20:42', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', '645b40ac-4223-44a7-aab4-66eb56cf9864', null, null);
INSERT INTO `relevance` VALUES ('b08d7763-a725-406f-a7d5-d144f00d716e', '', 'UserOrg', '0', '2016-09-02 13:56:41', '0', '3a95e392-07d4-4af3-b30d-140ca93340f5', '543a9fcf-4770-4fd9-865f-030e562be238', null, null);
INSERT INTO `relevance` VALUES ('b241dd3d-2965-44e4-929d-9dacb6444e09', '', 'RoleOrg', '0', '2018-04-14 13:16:45', '', '77e6d0c3-f9e1-4933-92c3-c1c6eef75593', '543a9fcf-4770-4fd9-865f-030e562be238', null, null);
INSERT INTO `relevance` VALUES ('b246cd89-548c-4471-a43b-6f10b40c26b1', '', 'RoleOrg', '0', '2018-09-12 00:08:42', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '990cb229-cc18-41f3-8e2b-13f0f0110798', null, null);
INSERT INTO `relevance` VALUES ('b2490ac0-ba16-48a2-b39d-49f6b87f9387', '', 'UserModule', '0', '2018-04-06 09:48:17', '', '6ba79766-faa0-4259-8139-a4a6d35784e0', '069475e3-c997-487a-9f29-e6a864c5c1d4', null, null);
INSERT INTO `relevance` VALUES ('b271a8c1-25b3-4735-8839-9370291a44d3', '', 'RoleDataProperty', '0', '2019-10-26 19:06:37', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'Resource', 'Disable', '');
INSERT INTO `relevance` VALUES ('b2e86ee7-4343-4cda-8246-d94702c985cb', '', 'RoleModule', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '37bb9414-19a0-4223-9056-71f8c758a932', '', '');
INSERT INTO `relevance` VALUES ('b2edfee4-f980-4aa5-b547-492d677e0674', '', 'RoleModule', '0', '2016-09-04 23:20:34', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', 'ef386d5d-cd58-43c0-a4ab-80afd0dbcd6c', null, null);
INSERT INTO `relevance` VALUES ('b3b8f695-a179-489b-90b4-7814ab048a69', '', 'UserElement', '0', '2018-04-06 09:48:21', '', '6ba79766-faa0-4259-8139-a4a6d35784e0', '816b12b3-e916-446d-a2fa-329cfd13c831', null, null);
INSERT INTO `relevance` VALUES ('b4c2a294-125c-4768-9214-cea3ccf39a1c', '', 'RoleOrg', '0', '2018-09-12 00:08:42', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '543a9fcf-4770-4fd9-865f-030e562be238', null, null);
INSERT INTO `relevance` VALUES ('b65b6b7a-1937-42f4-b2e2-bf20891e6321', '', 'RoleDataProperty', '0', '2019-10-26 19:06:37', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'Resource', 'ParentId', '');
INSERT INTO `relevance` VALUES ('b672a830-c3a5-408b-a746-65608534b24c', '', 'UserModule', '0', '2017-12-15 17:07:05', '', '49df1602-f5f3-4d52-afb7-3802da619558', '9486ff22-b696-4d7f-8093-8a3e53c45453', null, null);
INSERT INTO `relevance` VALUES ('b6c60e80-7c98-40d7-a1d9-d8051abb1e1e', '', 'RoleDataProperty', '0', '2019-10-26 19:06:54', '', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', 'Category', 'Id', '');
INSERT INTO `relevance` VALUES ('b75557be-0a0e-4b52-a944-54a9970728f3', '', 'RoleDataProperty', '0', '2019-10-26 19:06:37', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'Resource', 'AppName', '');
INSERT INTO `relevance` VALUES ('b9e63d17-35c8-4456-abab-8f43a1c99adc', '', 'UserModule', '0', '2018-04-06 09:47:59', '', '49df1602-f5f3-4d52-afb7-3802da619558', '4abafc83-c8f5-452f-9882-e113a86e7a3e', null, null);
INSERT INTO `relevance` VALUES ('b9f3a9f6-93cf-4146-bf92-3dbc82c22bcd', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '84e38920-f6e5-499c-bf52-a3c6f8499ff7', '', '');
INSERT INTO `relevance` VALUES ('bbdc3ea9-3f21-48b0-9d7a-39545d6183d0', '', 'UserElement', '0', '2018-04-06 09:48:25', '', '6ba79766-faa0-4259-8139-a4a6d35784e0', '826b12b3-e916-446d-a2fa-329cfd13c831', null, null);
INSERT INTO `relevance` VALUES ('bd7428a1-f76d-4131-a918-7e25fc90a141', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '645b40ac-4223-44a7-aab4-66eb56cf9864', '', '');
INSERT INTO `relevance` VALUES ('bd783f53-23fa-41f4-8cec-7c61fab52072', '', 'UserOrg', '0', '2018-03-15 09:19:06', '', '0ceff0f8-f848-440c-bc26-d8605ac858cd', '86449128-d5ac-44bf-b999-f7735b7458fd', null, null);
INSERT INTO `relevance` VALUES ('bda5f089-64d6-4fb8-9012-d7f3ff36902a', '', 'UserOrg', '0', '2017-10-12 13:59:09', '', 'ffd92ed2-5330-4ec2-a42d-6e0e9005db3b', '990cb229-cc18-41f3-8e2b-13f0f0110798', null, null);
INSERT INTO `relevance` VALUES ('bee6572d-8fb8-4e0e-af15-93aafc989717', '', 'RoleElement', '0', '2016-09-04 23:20:42', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', '68fc793f-069f-43e1-a012-42ac2d7c585c', null, null);
INSERT INTO `relevance` VALUES ('c0790297-9894-435b-9980-76e437dd279d', '', 'RoleModule', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '0031262c-689c-4b96-bae2-2c9d67076ade', '', '');
INSERT INTO `relevance` VALUES ('c14addeb-1812-4a78-9152-1f7115b22d89', '', 'UserRole', '0', '2016-09-05 00:00:47', '0', '3a95e392-07d4-4af3-b30d-140ca93340f5', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', null, null);
INSERT INTO `relevance` VALUES ('c2681bfa-e0fa-43fe-aeef-29d77fa717d3', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'c7d7daf0-3669-4a22-8bed-b092617deb9c', '', '');
INSERT INTO `relevance` VALUES ('c2d3b7d6-b47d-4bd8-9dc6-d9134d86713f', '', 'RoleOrg', '0', '2016-10-17 10:03:30', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', '86449128-d5ac-44bf-b999-f7735b7458fd', null, null);
INSERT INTO `relevance` VALUES ('c3050d65-d26b-4e46-bece-a212b0cc00ec', '', 'RoleElement', '0', '2016-09-04 23:20:42', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', '15a4f88c-4fae-4cab-ba2f-0cbd2cca8736', null, null);
INSERT INTO `relevance` VALUES ('c4771ac5-3375-4de9-adb8-a603398f0d62', '', 'RoleElement', '0', '2016-09-04 23:21:09', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', '2d595a2a-5de5-479e-a331-b53c799a6b10', null, null);
INSERT INTO `relevance` VALUES ('c50fae2a-b36f-486f-9d53-e58406590101', '', 'ProcessUser', '0', '2016-10-27 16:47:52', '0', '054ff054-d8ae-4911-a596-8fb1f66b348f', '3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7', null, null);
INSERT INTO `relevance` VALUES ('c58cb482-6ab7-49eb-b5b0-e45424b6e502', '', 'RoleElement', '0', '2016-09-04 23:21:00', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', '34730f5a-d307-457b-9041-5f7de30abfa9', null, null);
INSERT INTO `relevance` VALUES ('c733cfbe-2f71-41e4-92a6-4ff97cf88dc4', '', 'UserModule', '0', '2018-04-06 09:48:19', '', '6ba79766-faa0-4259-8139-a4a6d35784e0', '4abafc83-c8f5-452f-9882-e113a86e7a3e', null, null);
INSERT INTO `relevance` VALUES ('c9099371-8d4e-4f5b-9686-2c60a2c1c641', '', 'ProcessUser', '0', '2016-09-08 16:48:14', '0', '10cc09fb-d469-41e5-ae3f-fdd805a4bd4c', '3a95e392-07d4-4af3-b30d-140ca93340f5', null, null);
INSERT INTO `relevance` VALUES ('c9524e31-5d20-4730-9f0e-b157314cb1c3', '', 'RoleDataProperty', '0', '2019-10-26 19:06:37', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'Resource', 'TypeName', '');
INSERT INTO `relevance` VALUES ('c98b3d02-a76b-4ecc-94a5-cfeffd5e29fb', '', 'RoleModule', '0', '2016-09-02 17:03:39', '0', '211e12c7-e466-496e-8d26-0660a38e24cc', 'bedb41a2-f310-4775-af99-01be08adda93', null, null);
INSERT INTO `relevance` VALUES ('c9e2260f-585e-4597-adb6-6616c9418ba6', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'd352c8ee-3dff-4d28-a0de-903ae68f2533', '', '');
INSERT INTO `relevance` VALUES ('caae093c-cb7e-4058-afe0-dabd4ce9d25c', '', 'RoleDataProperty', '0', '2019-10-26 19:06:37', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'Category', 'Disabled', '');
INSERT INTO `relevance` VALUES ('cb807df3-a9a2-47d2-b2ff-448e6a3f71e6', '', 'RoleModule', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '37bb9414-19a0-4223-9056-71f8c758a935', '', '');
INSERT INTO `relevance` VALUES ('cb95b63b-46e4-4e0c-b30a-6048b1c0dfa1', '', 'RoleDataProperty', '0', '2019-10-26 19:06:37', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'Category', 'SortNo', '');
INSERT INTO `relevance` VALUES ('cec1a1bb-c3ab-486f-9222-3d945750753e', '', 'RoleModule', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '6a9e1346-0c01-44d2-8eb1-f929fdab542a', '', '');
INSERT INTO `relevance` VALUES ('d11d1d84-f6e6-43aa-a5b5-6f1519c6b64d', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '34730f5a-d307-457b-9041-5f7de30abfa9', '', '');
INSERT INTO `relevance` VALUES ('d6f116d2-dbbe-42d6-848a-ac242a08c776', '', 'RoleDataProperty', '0', '2019-10-26 19:06:37', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'Resource', 'CascadeId', '');
INSERT INTO `relevance` VALUES ('d7c54601-21e1-4145-84c7-15c6c84b8be2', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '68484265-7802-4f06-b024-33e8b2f2edcf', '', '');
INSERT INTO `relevance` VALUES ('d8c606e5-732a-4afd-9a69-91ea114f643b', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '1c870438-4260-43a5-8996-a6e1dc8bbf6a', '', '');
INSERT INTO `relevance` VALUES ('da6c0645-0bf9-4ade-9dd3-1b09e91e504c', '', 'RoleElement', '0', '2016-09-05 09:22:07', '0', '4980a85b-e3db-4607-bc2c-0baf0140d7df', '816b12b3-e916-446d-a2fa-329cfd13c831', null, null);
INSERT INTO `relevance` VALUES ('de59818b-2961-46ec-95bd-4a7d22469a2f', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'ef42721f-d223-4a00-a1d9-80b81121f21a', '', '');
INSERT INTO `relevance` VALUES ('df2d90b3-4e2e-40e9-b406-220009726460', '', 'RoleModule', '0', '2016-09-04 23:20:34', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', '6a9e1346-0c01-44d2-8eb1-f929fdab542a', null, null);
INSERT INTO `relevance` VALUES ('df4de132-ee77-4490-8aac-d9b78280a552', '', 'RoleModule', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '37bb9414-19a0-4223-9056-71f8c758a934', '', '');
INSERT INTO `relevance` VALUES ('df73ed79-9960-426b-8b7e-d04569387c66', '', 'RoleDataProperty', '0', '2019-10-26 19:06:37', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'Category', 'Name', '');
INSERT INTO `relevance` VALUES ('df8b40eb-bd6a-4cc2-990c-9abd1903625a', '', 'RoleModule', '0', '2019-10-26 19:06:53', '', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', 'a94d5648-c2a9-405e-ba6f-f1602ec9b807', '', '');
INSERT INTO `relevance` VALUES ('dfd5430b-3422-465a-be79-05a1e06deed2', '', 'RoleElement', '0', '2016-09-04 23:20:54', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', 'c7d7daf0-3669-4a22-8bed-b092617deb9c', null, null);
INSERT INTO `relevance` VALUES ('e12b77de-b7ce-4f38-b7a3-f3b2d285f33b', '', 'RoleOrg', '0', '2016-10-17 10:03:49', '0', '2eb423d6-6ad9-4efe-b423-872478a2a434', '08f41bf6-4388-4b1e-bd3e-2ff538b44b1b', null, null);
INSERT INTO `relevance` VALUES ('e28c0dcd-168a-4b60-a514-7b6eb8026709', '', 'RoleOrg', '0', '2016-10-17 10:03:30', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', '990cb229-cc18-41f3-8e2b-13f0f0110798', null, null);
INSERT INTO `relevance` VALUES ('e3fcfb31-def8-49d2-b292-e2df8ce2aef2', '', 'RoleDataProperty', '0', '2019-10-26 19:06:54', '', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', 'Category', 'Description', '');
INSERT INTO `relevance` VALUES ('e619a82e-edfb-4542-94df-0b92850667ad', '', 'RoleResource', '0', '2018-04-14 14:39:56', '', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', 'OPENAUTH_MODIFYACCOUNT', null, null);
INSERT INTO `relevance` VALUES ('e785147c-f46b-474f-8fad-73b14fa69822', '', 'UserRole', '0', '2016-09-06 17:06:29', '0', '3a95e392-07d4-4af3-b30d-140ca93340f5', '4980a85b-e3db-4607-bc2c-0baf0140d7df', null, null);
INSERT INTO `relevance` VALUES ('e84f6b9c-716d-4e94-a1aa-7fd0d1a2e23e', '', 'RoleModule', '0', '2016-09-02 17:03:47', '0', '648b04c4-4ac2-4d69-bef6-07081ef27871', '069475e3-c997-487a-9f29-e6a864c5c1d4', null, null);
INSERT INTO `relevance` VALUES ('e8c6be74-3e48-4cbe-a157-fe1895d35a6a', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '1a473afd-cbd4-41e9-9471-81f9435aaabe', '', '');
INSERT INTO `relevance` VALUES ('e9cf3d63-6305-46c7-93b4-14053387c62c', '', 'UserModule', '0', '2018-04-06 09:48:18', '', '6ba79766-faa0-4259-8139-a4a6d35784e0', '37bb9414-19a0-4223-9056-71f8c758a930', null, null);
INSERT INTO `relevance` VALUES ('ec72f6ae-09ee-4db9-99a1-bf15c8e35dda', '', 'ProcessUser', '0', '2016-09-14 11:38:23', '0', '6c6afe3c-349c-4198-8710-cf19c90f3afd', '3a95e392-07d4-4af3-b30d-140ca93340f5', null, null);
INSERT INTO `relevance` VALUES ('ec9c80ce-dbdf-4ba5-9091-82f75392c3b0', '', 'UserElement', '0', '2016-09-07 15:30:43', '0', '3a95e392-07d4-4af3-b30d-140ca93340f5', '68484265-7802-4f06-b024-33e8b2f2edcf', null, null);
INSERT INTO `relevance` VALUES ('ee1986a0-24cc-4dec-b5f5-68ef959ab650', '', 'UserElement', '0', '2018-04-06 14:50:40', '', '49df1602-f5f3-4d52-afb7-3802da619558', '79dcd3eb-3aaf-4e08-83c9-713d8ff446fe', null, null);
INSERT INTO `relevance` VALUES ('ee4f39fd-4fbf-4f68-9a70-d6c7d7db9723', '', 'ProcessUser', '0', '2016-10-31 11:52:39', '0', 'b8bcdf59-1e29-4d97-a364-12ac8e8c5c61', '3a95e392-07d4-4af3-b30d-140ca93340f5', null, null);
INSERT INTO `relevance` VALUES ('eec41fcb-61c0-4e56-a5c0-a9f8be6e6fdc', '', 'UserModule', '0', '2016-09-07 15:30:06', '0', '3b64b643-cb9a-4654-81e4-6dd9b2f8a6f7', '069475e3-c997-487a-9f29-e6a864c5c1d4', null, null);
INSERT INTO `relevance` VALUES ('f0da1ee1-4c25-4356-b096-6ebe520faef5', '', 'RoleDataProperty', '0', '2019-10-26 19:06:37', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'Resource', 'SortNo', '');
INSERT INTO `relevance` VALUES ('f17009d9-91cc-4230-aadb-a293f07c634c', '', 'RoleElement', '0', '2019-10-26 19:06:53', '', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', '2d595a2a-5de5-479e-a331-b53c799a6b10', '', '');
INSERT INTO `relevance` VALUES ('f2e6688d-1511-4a5a-bf68-535a005fdf1a', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '7f071c63-1620-4486-9264-5806b2e63218', '', '');
INSERT INTO `relevance` VALUES ('f41de4d2-369d-46e1-b84d-4bd2c37b8c20', '', 'UserOrg', '0', '2018-09-12 00:10:31', '', '49df1602-f5f3-4d52-afb7-3802da619558', '990cb229-cc18-41f3-8e2b-13f0f0110798', null, null);
INSERT INTO `relevance` VALUES ('f4ba636a-9002-43e6-93eb-95132a3e68c5', '', 'ProcessUser', '0', '2016-09-28 09:23:30', '0', '68295d2a-4dfd-4c5e-81e3-9c787e2603bc', '3a95e392-07d4-4af3-b30d-140ca93340f5', null, null);
INSERT INTO `relevance` VALUES ('f579a427-a9ed-4ebe-8411-72e8e6abd01d', '', 'UserElement', '0', '2016-09-05 16:25:26', '0', 'ea25646b-964b-4d41-ab03-d8964e1494fb', '816b12b3-e916-446d-a2fa-329cfd13c831', null, null);
INSERT INTO `relevance` VALUES ('f61ee29b-7988-404d-b692-5a8f667684be', '', 'UserElement', '0', '2018-04-06 09:48:23', '', '6ba79766-faa0-4259-8139-a4a6d35784e0', '68484265-7802-4f06-b024-33e8b2f2edcf', null, null);
INSERT INTO `relevance` VALUES ('f6367ca1-0486-46a4-b9c6-65c00936a516', '', 'RoleElement', '0', '2016-09-04 23:20:54', '0', 'db309d88-fd21-4b81-a4d9-ae6276a1d813', '9e2c6754-f258-4b14-96a0-b9d981196a65', null, null);
INSERT INTO `relevance` VALUES ('f64f8a05-4164-4ffd-9504-241c6f91c053', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '50c9df24-b233-42cb-9a0d-4ce158c75f86', '', '');
INSERT INTO `relevance` VALUES ('f671f582-9111-4000-aadd-660449d0d4b0', '', 'RoleResource', '0', '2018-09-12 00:15:54', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', 'XXX_LOGIN', null, null);
INSERT INTO `relevance` VALUES ('fa7c4d39-b31a-4668-8716-d40a62aa722b', '', 'UserOrg', '0', '2017-10-12 13:59:49', '', '63c9c82a-e0d3-4bde-bbd2-057cda2f5283', '990cb229-cc18-41f3-8e2b-13f0f0110798', null, null);
INSERT INTO `relevance` VALUES ('fab475b0-cbfb-4845-a045-65e618dde5f4', '', 'RoleElement', '0', '2019-10-26 21:55:59', '', '09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '2d595a2a-5de5-479e-a331-b53c799a6b10', '', '');
INSERT INTO `relevance` VALUES ('fb8a90ab-d6a1-4357-8249-e026d772ba29', '', 'RoleModule', '0', '2019-10-26 19:06:53', '', '0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', '37bb9414-19a0-4223-9056-71f8c758a932', '', '');

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `Id` varchar(50) NOT NULL COMMENT '资源标识',
  `CascadeId` varchar(255) NOT NULL COMMENT '节点语义ID',
  `Name` varchar(255) NOT NULL COMMENT '名称',
  `SortNo` int(11) NOT NULL COMMENT '排序号',
  `Description` text NOT NULL COMMENT '描述',
  `ParentName` varchar(50) DEFAULT NULL COMMENT '父节点名称',
  `ParentId` varchar(50) DEFAULT NULL COMMENT '父节点流ID',
  `AppId` varchar(50) DEFAULT NULL COMMENT '资源所属应用ID',
  `AppName` varchar(50) DEFAULT NULL COMMENT '所属应用名称',
  `TypeName` varchar(20) DEFAULT NULL COMMENT '分类名称',
  `TypeId` varchar(50) DEFAULT NULL COMMENT '分类ID',
  `Disable` tinyint(4) NOT NULL COMMENT '是否可用',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='资源表';

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('OPENAUTH_DELETEACCOUNT', '', '注销账号', '0', 'openauth.net注销账号的权限', '', '', '110', 'OpenAuth.Net', '', '', '0');
INSERT INTO `resource` VALUES ('OPENAUTH_LOGIN', '', '登陆', '0', 'openauth.net登陆的权限', '', '', '110', 'OpenAuth.Net', '', '', '0');
INSERT INTO `resource` VALUES ('OPENAUTH_MODIFYACCOUNT', '', '修改账号', '0', 'openauth.net修改账号的权限', '', '', '110', 'OpenAuth.Net', '', '', '0');
INSERT INTO `resource` VALUES ('XXX_ADMIN', '', 'XXX管理员', '0', '', '', '', '119', 'XXX管理平台', '', '', '0');
INSERT INTO `resource` VALUES ('XXX_CHECKUSER', '', '审核用户', '0', '', '', '', '119', 'XXX管理平台', '', '', '0');
INSERT INTO `resource` VALUES ('XXX_DELETEACCOUNT', '', '注销账号', '0', '', '', '', '119', 'XXX管理平台', '', '', '0');
INSERT INTO `resource` VALUES ('XXX_LOGIN', '', '登陆', '0', '登陆xxx平台的权限', '', '', '119', 'XXX管理平台', '', '', '0');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `Id` varchar(50) NOT NULL COMMENT 'Id',
  `Name` varchar(255) NOT NULL COMMENT '角色名称',
  `Status` int(11) NOT NULL COMMENT '当前状态',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `CreateId` varchar(50) DEFAULT NULL COMMENT '创建人ID',
  `TypeName` varchar(20) DEFAULT NULL COMMENT '分类名称',
  `TypeId` varchar(50) DEFAULT NULL COMMENT '分类ID',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('09ee2ffa-7463-4938-ae0b-1cb4e80c7c13', '管理员', '0', '2018-04-09 22:48:24', '', '', '');
INSERT INTO `role` VALUES ('0a7ebd0c-78d6-4fbc-8fbe-6fc25c3a932d', '测试', '0', '2018-04-09 22:48:29', '', '', '');
INSERT INTO `role` VALUES ('3e761e88-ddf7-4a62-b219-9a315b4564f2', '汇丰测试', '0', '2018-04-09 22:48:42', '', '', '');
INSERT INTO `role` VALUES ('77e6d0c3-f9e1-4933-92c3-c1c6eef75593', '神', '1', '2018-04-14 13:16:45', '', '', '');

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `Id` varchar(50) NOT NULL COMMENT '数据ID',
  `Name` text NOT NULL COMMENT '产品名称',
  `Number` int(11) NOT NULL COMMENT '产品数量',
  `Price` decimal(10,1) NOT NULL COMMENT '产品单价',
  `Status` int(11) NOT NULL COMMENT '出库/入库',
  `Viewable` varchar(50) NOT NULL COMMENT '可见范围',
  `User` varchar(50) NOT NULL COMMENT '操作人',
  `Time` datetime NOT NULL COMMENT '操作时间',
  `OrgId` varchar(50) DEFAULT NULL COMMENT '组织ID',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='出入库信息表';

-- ----------------------------
-- Records of stock
-- ----------------------------

-- ----------------------------
-- Table structure for uploadfile
-- ----------------------------
DROP TABLE IF EXISTS `uploadfile`;
CREATE TABLE `uploadfile` (
  `Id` varchar(50) NOT NULL COMMENT 'Id',
  `FileName` varchar(200) NOT NULL COMMENT '文件名称',
  `FilePath` text NOT NULL COMMENT '文件路径',
  `Description` varchar(200) DEFAULT NULL COMMENT '描述',
  `FileType` varchar(20) DEFAULT NULL COMMENT '文件类型',
  `FileSize` int(11) DEFAULT NULL COMMENT '文件大小',
  `Extension` varchar(20) DEFAULT NULL COMMENT '扩展名称',
  `Enable` tinyint(4) NOT NULL COMMENT '是否可用',
  `SortCode` int(11) NOT NULL COMMENT '排序',
  `DeleteMark` tinyint(4) NOT NULL COMMENT '删除标识',
  `CreateUserId` char(36) DEFAULT NULL COMMENT '上传人',
  `CreateUserName` varchar(50) DEFAULT NULL COMMENT '上传人姓名',
  `CreateTime` datetime NOT NULL COMMENT '上传时间',
  `Thumbnail` text COMMENT '缩略图',
  `BelongApp` varchar(200) DEFAULT NULL COMMENT '所属应用',
  `BelongAppId` varchar(50) DEFAULT NULL COMMENT '所属应用ID',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='文件';

-- ----------------------------
-- Records of uploadfile
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id` varchar(50) NOT NULL COMMENT '流水号',
  `Account` varchar(255) NOT NULL COMMENT '用户登录帐号',
  `Password` varchar(255) NOT NULL COMMENT '密码',
  `Name` varchar(255) NOT NULL COMMENT '用户姓名',
  `Sex` int(11) NOT NULL COMMENT '性别',
  `Status` int(11) NOT NULL COMMENT '用户状态',
  `BizCode` varchar(255) NOT NULL COMMENT '业务对照码',
  `CreateTime` datetime NOT NULL COMMENT '经办时间',
  `CreateId` varchar(50) DEFAULT NULL COMMENT '创建人',
  `TypeName` varchar(20) DEFAULT NULL COMMENT '分类名称',
  `TypeId` varchar(50) DEFAULT NULL COMMENT '分类ID',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户基本信息表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0ceff0f8-f848-440c-bc26-d8605ac858cd', 'test5', 'test5', 'test5', '1', '1', '', '2018-03-15 09:19:05', '', '', '');
INSERT INTO `user` VALUES ('1df68dfd-3b6d-4491-872f-00a0fc6c5a64', 'test4', 'test4', 'test4', '1', '1', '', '2017-12-12 14:07:11', '', '', '');
INSERT INTO `user` VALUES ('229f3a49-ab27-49ce-b383-9f10ca23a9d5', 'test3', 'test3', 'test3', '1', '1', '', '2017-12-12 14:07:05', '', '', '');
INSERT INTO `user` VALUES ('49df1602-f5f3-4d52-afb7-3802da619558', 'admin', 'admin', 'admin', '1', '0', '', '2017-12-11 16:18:54', '', '', '');
INSERT INTO `user` VALUES ('6ba79766-faa0-4259-8139-a4a6d35784e0', 'test', 'test', 'test', '1', '0', '', '2017-12-11 16:19:00', '', '', '');
INSERT INTO `user` VALUES ('de8be521-f1ec-4483-b124-0be342890507', 'test2', 'test2', 'test2', '1', '1', '', '2017-12-11 16:19:06', '', '', '');
