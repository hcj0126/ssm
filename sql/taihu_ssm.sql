/*
 Navicat Premium Data Transfer

 Source Server         : hcj
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:3306
 Source Schema         : taihu_ssm

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 11/07/2023 22:27:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `orderNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `orderTime` timestamp NULL DEFAULT NULL,
  `peopleCount` int(11) NULL DEFAULT NULL,
  `orderDesc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payType` int(11) NULL DEFAULT NULL,
  `orderStatus` int(11) NULL DEFAULT NULL,
  `productId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userId` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '12345', '2018-02-03 00:00:00', 2, '没什么', 0, 1, '1', 1);
INSERT INTO `orders` VALUES ('2', '12346', '2020-04-15 11:15:17', 2, '没什么', 0, 1, '1', 1);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23532 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (107, '角色权限', '/role/findRoleList');
INSERT INTO `permission` VALUES (1943, '资源权限', '/permission/findPermissionList');
INSERT INTO `permission` VALUES (23527, '用户权限', '/user/findUserAll');
INSERT INTO `permission` VALUES (23528, '访客权限', '/login');
INSERT INTO `permission` VALUES (23529, '超级权限', '/*');
INSERT INTO `permission` VALUES (23530, '订单权限', '/orders/findOrdersList');
INSERT INTO `permission` VALUES (23531, '商品权限', '/product/findProductList');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `productNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cityName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `departureTime` date NULL DEFAULT NULL,
  `productPrice` double(11, 0) NULL DEFAULT NULL,
  `productDesc` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productStatus` int(11) NOT NULL COMMENT '0：关闭  1：开启',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '001', '云南一日游12', '云南12', '2022-06-15', 132, '																																																								云南欢迎你12\r\n							\r\n							\r\n							\r\n							\r\n							\r\n							\r\n							', 1);
INSERT INTO `product` VALUES (2, '002', '昆明三日游', '昆明', '2020-06-06', 1800, '昆明欢迎你', 1);
INSERT INTO `product` VALUES (3, '003', '上海一日游', '上海', '2020-05-08', 3800, '魔都欢迎你', 1);
INSERT INTO `product` VALUES (4, '004', '北京三日游', '北京', '2020-05-09', 5800, '北京我来了', 1);
INSERT INTO `product` VALUES (5, '005', '深圳七日游', '昆明', '2020-04-07', 18000, '深圳欢迎你', 1);
INSERT INTO `product` VALUES (6, '006', '昭通一日游', '昭通', '2020-05-08', 1200, '昭通大山包', 0);
INSERT INTO `product` VALUES (7, '007', '丽江一日游', '昆明', '2020-06-04', 1500, '丽江古镇', 0);
INSERT INTO `product` VALUES (8, 'aaa', 'aaaaa', 'aaaaa', '2020-04-07', 18000, 'aaaa', 0);
INSERT INTO `product` VALUES (9, 'SSM-03', '江苏一日游', '江苏', '2021-03-17', 998, 'xxxx				', 0);
INSERT INTO `product` VALUES (11, 'cccc22222', '太湖学院一日游222222', '无锡', '2023-06-10', 22222, '无锡太湖学院', 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roleDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'ADMIN', '系统管理员');
INSERT INTO `role` VALUES (2, 'USER', '用户管理员');
INSERT INTO `role` VALUES (3, 'ORDERS', '订单管理员');
INSERT INTO `role` VALUES (4, 'PERMISSION', '权限管理员');
INSERT INTO `role` VALUES (5, 'PRODUCT', '产品管理员');
INSERT INTO `role` VALUES (6, 'ROOT', '超级管理员');
INSERT INTO `role` VALUES (7, 'GUEST', '访客管理员');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `permissionId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`permissionId`, `roleId`) USING BTREE,
  INDEX `r_id`(`roleId`) USING BTREE,
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (107, 1);
INSERT INTO `role_permission` VALUES (1943, 1);
INSERT INTO `role_permission` VALUES (23527, 1);
INSERT INTO `role_permission` VALUES (23528, 1);
INSERT INTO `role_permission` VALUES (107, 2);
INSERT INTO `role_permission` VALUES (1943, 2);
INSERT INTO `role_permission` VALUES (23527, 2);
INSERT INTO `role_permission` VALUES (23528, 2);

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog`  (
  `id` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `visitTime` datetime NULL DEFAULT NULL COMMENT '访问时间',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作者用户名',
  `ip` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问ip',
  `url` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问资源url',
  `executionTime` int(11) NULL DEFAULT NULL COMMENT '执行时长',
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问方法',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES ('1945daa5941849ada68f3d6cb4031510', '2020-04-16 16:57:45', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 22, '[类名] com.hcj.controller.UserController [方法名] findAll');
INSERT INTO `syslog` VALUES ('3004d6b5db9949ae9e5d7c3a61e35a31', '2020-04-22 03:34:22', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 7, '[类名] com.hcj.controller.OrdersController [方法名] findAll');
INSERT INTO `syslog` VALUES ('5c5f1a0fdcd24c7bbfee6502fa166c65', '2020-04-22 03:20:43', 'admin', '0:0:0:0:0:0:0:1', '/user/findAll.do', 23, '[类名] com.hcj.controller.UserController [方法名] findAll');
INSERT INTO `syslog` VALUES ('a2184cdd4c3f417d9d211d3d28a04d4b', '2020-04-22 03:48:32', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 23, '[类名] com.hcj.controller.OrdersController [方法名] findAll');
INSERT INTO `syslog` VALUES ('da96c3577bab4e26949aadaa19ca75b3', '2020-04-22 03:34:15', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 22, '[类名] com.hcj.controller.OrdersController [方法名] findAll');
INSERT INTO `syslog` VALUES ('e46c2915c47f413c9b4b7d3b1beee561', '2020-04-22 03:20:54', 'admin', '0:0:0:0:0:0:0:1', '/product/findAll.do', 16, '[类名] com.hcj.controller.ProductController [方法名] findAll');
INSERT INTO `syslog` VALUES ('fbdd9303270e4e16921ca938652ac1ca', '2020-04-22 03:20:57', 'admin', '0:0:0:0:0:0:0:1', '/orders/findAll.do', 48, '[类名] com.hcj.controller.OrdersController [方法名] findAll');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `phone` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态0 关闭 1 开启',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20620 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '13888888888', '$2a$10$ccYrukNANQs9FAMcGfivBOpXU5KI/SGgpUUyOn2iL7FugEyG97ss6', 'a@qq.com', 1);
INSERT INTO `user` VALUES (2, 'adfa', '15752250992', '$2a$10$ccYrukNANQs9FAMcGfivBOpXU5KI/SGgpUUyOn2iL7FugEyG97ss6', '546514684', 1);
INSERT INTO `user` VALUES (3, 'wBekvam', '15752250992', '$2a$10$Ce8LB3jdYDZ2f6HB281zA.4eC7v6ziJdK8MMWg0Yu8ETMg5ToMpIe', '1847481@QQ.com', 1);
INSERT INTO `user` VALUES (4, '11948939@qq.com', '等灯', '$2a$10$Ce8LB3jdYDZ2f6HB281zA.4eC7v6ziJdK8MMWg0Yu8ETMg5ToMpIe', '15752250992', 0);
INSERT INTO `user` VALUES (5, 'a@qq.com', 'user', '$2a$10$i7QFXNog.2TT3pCrekha1uJsw54fcBPqVK1ncWtW6HxaGkiMFCBw.', '54154151', 1);
INSERT INTO `user` VALUES (6, 'a@qq.com', '赵龙', '$2a$10$Ce8LB3jdYDZ2f6HB281zA.4eC7v6ziJdK8MMWg0Yu8ETMg5ToMpIe', '13888888888', 1);
INSERT INTO `user` VALUES (6862, '11919@qq.com', 'hz', '$2a$10$mEKoiccVd9lmBJh7czLgy.3bIzaGLiUmn1nsQ65mEvSlI7G3K.1J6', '15752250992', 1);
INSERT INTO `user` VALUES (20614, 'zhixing1010@163.com', 'root', '$2a$10$xmIe31HlXwR5xLKAzzEnju.CDiYZ.qFuCaO832.fFQB0mWYNc/xya', '15752250992', 0);
INSERT INTO `user` VALUES (20615, '111@qq.com', '李四', '$2a$10$7C0Wq7xO5ga2z3F1wuohO.pbA1pXp4ybZF0npDlW9p2GR5qICWDES', '123123123123', 1);
INSERT INTO `user` VALUES (20616, '111@qq.com', '张三', '$2a$10$7C0Wq7xO5ga2z3F1wuohO.pbA1pXp4ybZF0npDlW9p2GR5qICWDES', '123123123123', 0);
INSERT INTO `user` VALUES (20617, 'xhy@qq.com', '小黄鸭', '$2a$10$1bskbkdKy9Mi/9NVxPEj2OlwLLx.20amTaOAc5INkWku3I1SBWgNq', '123123123123', 1);
INSERT INTO `user` VALUES (20618, 'xhj@qq.com', '小黄鸡', '$2a$10$Ft4HJvVjb8sdGCLlTZHQX.c.OHpJjYq/lw7ukYuwhG52BxfgXxBfa', '123123123123', 0);
INSERT INTO `user` VALUES (20619, '111@qq.com', 'zhangsan', '$2a$10$2TYJbwTMbFs2L7Vw0kf8culCpNorGV.Ub.X2xLhXL.bonrwunEvra', '123123123123', 1);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`, `roleId`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1);
INSERT INTO `user_role` VALUES (4, 1);
INSERT INTO `user_role` VALUES (5, 1);
INSERT INTO `user_role` VALUES (6, 1);
INSERT INTO `user_role` VALUES (6862, 1);
INSERT INTO `user_role` VALUES (20615, 1);
INSERT INTO `user_role` VALUES (1, 2);
INSERT INTO `user_role` VALUES (3, 2);
INSERT INTO `user_role` VALUES (4, 2);
INSERT INTO `user_role` VALUES (5, 2);
INSERT INTO `user_role` VALUES (6, 2);
INSERT INTO `user_role` VALUES (6862, 2);
INSERT INTO `user_role` VALUES (2, 3);
INSERT INTO `user_role` VALUES (4, 3);
INSERT INTO `user_role` VALUES (20615, 3);
INSERT INTO `user_role` VALUES (1, 4);
INSERT INTO `user_role` VALUES (2, 5);
INSERT INTO `user_role` VALUES (20615, 5);
INSERT INTO `user_role` VALUES (1, 6);

SET FOREIGN_KEY_CHECKS = 1;
