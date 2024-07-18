/*
 Navicat Premium Data Transfer

 Source Server         : 本地连接
 Source Server Type    : MySQL
 Source Server Version : 80037 (8.0.37)
 Source Host           : localhost:3306
 Source Schema         : questionnaire

 Target Server Type    : MySQL
 Target Server Version : 80037 (8.0.37)
 File Encoding         : 65001

 Date: 17/07/2024 15:25:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色标识',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin', '管理员', 'http://localhost:9090/files/1720681304009-OIP-C.jpg', 'ADMIN', '110', 'aaa@163.com');
INSERT INTO `admin` VALUES (3, '111', '111', '111', NULL, 'ADMIN', NULL, NULL);

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `question_id` int NULL DEFAULT NULL COMMENT '题目ID',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `page_id` int NULL DEFAULT NULL COMMENT '问卷ID',
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '调查编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '答题表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES (36, 86, '男', 3, '1721116970205');
INSERT INTO `answer` VALUES (37, 87, '湖北省武汉市洪山区', 3, '1721116970205');
INSERT INTO `answer` VALUES (38, 88, '本科', 3, '1721116970205');
INSERT INTO `answer` VALUES (39, 89, '计算机', 3, '1721116970205');
INSERT INTO `answer` VALUES (40, 90, '大二', 3, '1721116970205');
INSERT INTO `answer` VALUES (41, 92, '111', 3, '1721116970205');
INSERT INTO `answer` VALUES (42, 93, '一般', 3, '1721116970205');
INSERT INTO `answer` VALUES (43, 94, '[\"拿到奖学金\",\"拿到毕业证书，方便就业\",\"热爱学习\",\"为了在本专业有所成就\"]', 3, '1721116970205');
INSERT INTO `answer` VALUES (44, 95, 'aaaa', 3, '1721116970205');
INSERT INTO `answer` VALUES (45, 96, '2024-07-15T16:00:00.000Z', 3, '1721116970205');
INSERT INTO `answer` VALUES (46, 97, '4', 3, '1721116970205');
INSERT INTO `answer` VALUES (47, 98, '男', 2, '1721178461722');
INSERT INTO `answer` VALUES (48, 99, '大二', 2, '1721178461722');
INSERT INTO `answer` VALUES (49, 100, '1000-1500', 2, '1721178461722');
INSERT INTO `answer` VALUES (50, 101, '部分来自家庭，部分靠自己赚取', 2, '1721178461722');
INSERT INTO `answer` VALUES (51, 102, '300-600', 2, '1721178461722');
INSERT INTO `answer` VALUES (52, 103, '网购', 2, '1721178461722');
INSERT INTO `answer` VALUES (53, 104, '一周一次或两次', 2, '1721178461722');
INSERT INTO `answer` VALUES (54, 105, '刚好够用', 2, '1721178461722');
INSERT INTO `answer` VALUES (55, 106, '[\"交通通讯\",\"日常交际\"]', 2, '1721178461722');
INSERT INTO `answer` VALUES (56, 107, '5', 2, '1721178461722');
INSERT INTO `answer` VALUES (57, 108, '男', 1, '1721178635081');
INSERT INTO `answer` VALUES (58, 109, 'adadsas', 1, '1721178635081');
INSERT INTO `answer` VALUES (59, 110, '大二', 1, '1721178635081');
INSERT INTO `answer` VALUES (60, 111, '有', 1, '1721178635081');
INSERT INTO `answer` VALUES (61, 112, '[\"专业与未来期望职业不符\",\"专业能力不足\"]', 1, '1721178635081');
INSERT INTO `answer` VALUES (62, 113, '自主创业', 1, '1721178635081');
INSERT INTO `answer` VALUES (63, 114, '[\"毕业即失业\",\"毕业生啃老趋势\"]', 1, '1721178635081');
INSERT INTO `answer` VALUES (64, 117, '[\"福利补贴\",\"薪水符合预期\"]', 1, '1721178635081');
INSERT INTO `answer` VALUES (65, 118, 'sdad', 1, '1721178635081');
INSERT INTO `answer` VALUES (66, 119, '4', 1, '1721178635081');
INSERT INTO `answer` VALUES (67, 86, '女', 3, '1721200607114');
INSERT INTO `answer` VALUES (68, 87, '天津市天津市南开区', 3, '1721200607114');
INSERT INTO `answer` VALUES (69, 88, '专科', 3, '1721200607114');
INSERT INTO `answer` VALUES (70, 89, 'ad', 3, '1721200607114');
INSERT INTO `answer` VALUES (71, 90, '大四', 3, '1721200607114');
INSERT INTO `answer` VALUES (72, 92, 'adad', 3, '1721200607114');
INSERT INTO `answer` VALUES (73, 93, '很差', 3, '1721200607114');
INSERT INTO `answer` VALUES (74, 94, '[\"拿到毕业证书，方便就业\",\"服从家长的决定\",\"为了在本专业有所成就\"]', 3, '1721200607114');
INSERT INTO `answer` VALUES (75, 95, 'addd', 3, '1721200607114');
INSERT INTO `answer` VALUES (76, 96, '2024-07-26T16:00:00.000Z', 3, '1721200607114');
INSERT INTO `answer` VALUES (77, 97, '4', 3, '1721200607114');

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `operation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作',
  `username` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作人',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 220 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES (69, '登录', 'aaa', '登录', '127.0.0.1', '2024-07-10 09:00:36');
INSERT INTO `logs` VALUES (70, '登录', 'aaa', '登录', '127.0.0.1', '2024-07-10 09:14:37');
INSERT INTO `logs` VALUES (71, '登录', 'aaa', '登录', '127.0.0.1', '2024-07-10 09:22:49');
INSERT INTO `logs` VALUES (72, '登录', 'aaa', '登录', '127.0.0.1', '2024-07-10 09:23:28');
INSERT INTO `logs` VALUES (73, '登录', 'aaa', '登录', '127.0.0.1', '2024-07-10 09:25:37');
INSERT INTO `logs` VALUES (74, '登录', 'aaa', '登录', '127.0.0.1', '2024-07-10 09:26:35');
INSERT INTO `logs` VALUES (75, '登录', 'aaa', '登录', '127.0.0.1', '2024-07-10 09:29:20');
INSERT INTO `logs` VALUES (76, '登录', 'aaa', '登录', '127.0.0.1', '2024-07-10 09:31:17');
INSERT INTO `logs` VALUES (77, '修改问卷【大学生就业意向调查-拷贝】', 'aaa', '修改', '127.0.0.1', '2024-07-10 09:31:51');
INSERT INTO `logs` VALUES (78, '登录', 'aaa', '登录', '127.0.0.1', '2024-07-10 09:33:16');
INSERT INTO `logs` VALUES (79, '登录', 'aaa', '登录', '127.0.0.1', '2024-07-10 09:35:50');
INSERT INTO `logs` VALUES (80, '登录', 'aaa', '登录', '127.0.0.1', '2024-07-10 09:39:54');
INSERT INTO `logs` VALUES (81, '登录', 'aaa', '登录', '127.0.0.1', '2024-07-10 09:56:24');
INSERT INTO `logs` VALUES (82, '登录', 'aaa', '登录', '127.0.0.1', '2024-07-10 10:06:24');
INSERT INTO `logs` VALUES (83, '登录', 'aaa', '登录', '127.0.0.1', '2024-07-10 10:07:29');
INSERT INTO `logs` VALUES (84, '登录', 'aaa', '登录', '127.0.0.1', '2024-07-10 10:09:20');
INSERT INTO `logs` VALUES (85, '登录', 'aaa', '登录', '127.0.0.1', '2024-07-10 10:10:20');
INSERT INTO `logs` VALUES (86, '登录', 'aaa', '登录', '127.0.0.1', '2024-07-10 10:13:42');
INSERT INTO `logs` VALUES (87, '登录', 'aaa', '登录', '127.0.0.1', '2024-07-10 10:27:31');
INSERT INTO `logs` VALUES (88, '修改问卷【大学生学习情况调查】', 'aaa', '修改', '127.0.0.1', '2024-07-10 10:41:40');
INSERT INTO `logs` VALUES (89, '创建问卷【大学生学习情况调查-拷贝】', 'aaa', '新增', '127.0.0.1', '2024-07-10 10:41:40');
INSERT INTO `logs` VALUES (90, '复制新的问卷【大学生学习情况调查-拷贝】', 'aaa', '复制', '127.0.0.1', '2024-07-10 10:41:40');
INSERT INTO `logs` VALUES (91, '修改问卷【大学生学习情况调查】', 'aaa', '修改', '127.0.0.1', '2024-07-10 10:41:45');
INSERT INTO `logs` VALUES (92, '创建问卷【大学生学习情况调查-拷贝】', 'aaa', '新增', '127.0.0.1', '2024-07-10 10:41:45');
INSERT INTO `logs` VALUES (93, '复制新的问卷【大学生学习情况调查-拷贝】', 'aaa', '复制', '127.0.0.1', '2024-07-10 10:41:45');
INSERT INTO `logs` VALUES (94, '修改问卷【大学生学习情况调查】', 'aaa', '修改', '127.0.0.1', '2024-07-10 10:41:55');
INSERT INTO `logs` VALUES (95, '创建问卷【大学生学习情况调查-拷贝】', 'aaa', '新增', '127.0.0.1', '2024-07-10 10:41:55');
INSERT INTO `logs` VALUES (96, '复制新的问卷【大学生学习情况调查-拷贝】', 'aaa', '复制', '127.0.0.1', '2024-07-10 10:41:55');
INSERT INTO `logs` VALUES (97, '修改问卷【大学生学习情况调查】', 'aaa', '修改', '127.0.0.1', '2024-07-10 10:42:21');
INSERT INTO `logs` VALUES (98, '创建问卷【大学生学习情况调查-拷贝】', 'aaa', '新增', '127.0.0.1', '2024-07-10 10:42:21');
INSERT INTO `logs` VALUES (99, '复制新的问卷【大学生学习情况调查-拷贝】', 'aaa', '复制', '127.0.0.1', '2024-07-10 10:42:21');
INSERT INTO `logs` VALUES (100, '删除问卷【大学生学习情况调查-拷贝】', 'aaa', '删除', '127.0.0.1', '2024-07-10 10:48:10');
INSERT INTO `logs` VALUES (101, '删除问卷【大学生学习情况调查-拷贝】', 'aaa', '删除', '127.0.0.1', '2024-07-10 10:48:12');
INSERT INTO `logs` VALUES (102, '删除问卷【大学生学习情况调查-拷贝】', 'aaa', '删除', '127.0.0.1', '2024-07-10 10:48:14');
INSERT INTO `logs` VALUES (103, '删除问卷【大学生学习情况调查-拷贝】', 'aaa', '删除', '127.0.0.1', '2024-07-10 10:48:16');
INSERT INTO `logs` VALUES (104, '删除问卷【大学生学习情况调查-拷贝】', 'aaa', '删除', '127.0.0.1', '2024-07-10 10:49:16');
INSERT INTO `logs` VALUES (105, '删除问卷【大学生消费情况调查单选】', 'aaa', '删除', '127.0.0.1', '2024-07-10 10:49:17');
INSERT INTO `logs` VALUES (106, '删除问卷【大学生就业意向调查-拷贝】', 'aaa', '删除', '127.0.0.1', '2024-07-10 10:49:19');
INSERT INTO `logs` VALUES (107, '删除问卷【大学生学习情况调查11111】', 'aaa', '删除', '127.0.0.1', '2024-07-10 10:49:20');
INSERT INTO `logs` VALUES (108, '删除问卷【大学生学习情况调查】', 'aaa', '删除', '127.0.0.1', '2024-07-10 10:49:22');
INSERT INTO `logs` VALUES (109, '修改问卷【大学生就业意向调查】', 'aaa', '修改', '127.0.0.1', '2024-07-10 10:49:31');
INSERT INTO `logs` VALUES (110, '修改问卷【大学生学习情况调查】', 'aaa', '修改', '127.0.0.1', '2024-07-10 10:50:17');
INSERT INTO `logs` VALUES (111, '创建问卷【大学生学习情况调查-拷贝】', 'aaa', '新增', '127.0.0.1', '2024-07-10 10:50:17');
INSERT INTO `logs` VALUES (112, '复制新的问卷【大学生学习情况调查-拷贝】', 'aaa', '复制', '127.0.0.1', '2024-07-10 10:50:17');
INSERT INTO `logs` VALUES (113, '删除问卷【大学生学习情况调查-拷贝】', 'aaa', '删除', '127.0.0.1', '2024-07-10 10:50:22');
INSERT INTO `logs` VALUES (114, '修改问卷【大学生学习情况调查】', 'aaa', '修改', '127.0.0.1', '2024-07-10 10:57:05');
INSERT INTO `logs` VALUES (115, '创建问卷【大学生学习情况调查-拷贝】', 'aaa', '新增', '127.0.0.1', '2024-07-10 10:57:05');
INSERT INTO `logs` VALUES (116, '复制新的问卷【大学生学习情况调查-拷贝】', 'aaa', '复制', '127.0.0.1', '2024-07-10 10:57:05');
INSERT INTO `logs` VALUES (117, '删除问卷【大学生学习情况调查-拷贝】', 'aaa', '删除', '127.0.0.1', '2024-07-10 10:57:13');
INSERT INTO `logs` VALUES (118, '登录', 'aaa', '登录', '127.0.0.1', '2024-07-10 11:11:37');
INSERT INTO `logs` VALUES (119, '修改问卷【大学生学习情况调查】', 'aaa', '修改', '127.0.0.1', '2024-07-10 11:29:10');
INSERT INTO `logs` VALUES (120, '创建问卷【大学生学习情况调查-拷贝】', 'aaa', '新增', '127.0.0.1', '2024-07-10 11:29:10');
INSERT INTO `logs` VALUES (121, '复制新的问卷【大学生学习情况调查-拷贝】', 'aaa', '复制', '127.0.0.1', '2024-07-10 11:29:10');
INSERT INTO `logs` VALUES (122, '登录', 'aaa', '登录', '127.0.0.1', '2024-07-11 08:49:46');
INSERT INTO `logs` VALUES (123, '修改问卷【大学生学习情况调查】', 'aaa', '修改', '127.0.0.1', '2024-07-11 08:50:30');
INSERT INTO `logs` VALUES (124, '创建问卷【大学生学习情况调查-拷贝】', 'aaa', '新增', '127.0.0.1', '2024-07-11 08:50:30');
INSERT INTO `logs` VALUES (125, '复制新的问卷【大学生学习情况调查-拷贝】', 'aaa', '复制', '127.0.0.1', '2024-07-11 08:50:30');
INSERT INTO `logs` VALUES (126, '删除问卷【大学生学习情况调查-拷贝】', 'aaa', '删除', '127.0.0.1', '2024-07-11 09:30:43');
INSERT INTO `logs` VALUES (127, '删除问卷【大学生学习情况调查-拷贝】', 'aaa', '删除', '127.0.0.1', '2024-07-11 09:30:45');
INSERT INTO `logs` VALUES (128, '修改问卷【大学生学习情况调查】', 'aaa', '修改', '127.0.0.1', '2024-07-11 10:45:16');
INSERT INTO `logs` VALUES (129, '创建问卷【大学生学习情况调查-拷贝】', 'aaa', '新增', '127.0.0.1', '2024-07-11 10:45:16');
INSERT INTO `logs` VALUES (130, '复制新的问卷【大学生学习情况调查-拷贝】', 'aaa', '复制', '127.0.0.1', '2024-07-11 10:45:16');
INSERT INTO `logs` VALUES (131, '修改问卷【大学生学习情况调查-拷贝】', 'aaa', '修改', '127.0.0.1', '2024-07-11 10:45:23');
INSERT INTO `logs` VALUES (132, '修改问卷【大学生学习情况调查-拷贝】', 'aaa', '修改', '127.0.0.1', '2024-07-11 10:48:00');
INSERT INTO `logs` VALUES (133, '修改问卷【大学生学习情况调查-拷贝】', 'aaa', '修改', '127.0.0.1', '2024-07-11 10:48:03');
INSERT INTO `logs` VALUES (134, '登录', 'admin', '登录', '127.0.0.1', '2024-07-11 10:51:58');
INSERT INTO `logs` VALUES (135, '修改问卷【大学生学习情况调查】', 'admin', '修改', '127.0.0.1', '2024-07-11 11:04:57');
INSERT INTO `logs` VALUES (136, '删除问卷【大学生学习情况调查-拷贝】', 'admin', '删除', '127.0.0.1', '2024-07-11 11:05:07');
INSERT INTO `logs` VALUES (137, '登录', 'aaa', '登录', '127.0.0.1', '2024-07-11 11:23:52');
INSERT INTO `logs` VALUES (138, '登录', 'aaa', '登录', '127.0.0.1', '2024-07-11 11:28:08');
INSERT INTO `logs` VALUES (139, '登录', 'admin', '登录', '127.0.0.1', '2024-07-11 11:28:31');
INSERT INTO `logs` VALUES (140, '修改问卷【大学生学习情况调查】', 'admin', '修改', '127.0.0.1', '2024-07-11 11:33:23');
INSERT INTO `logs` VALUES (141, '创建问卷【大学生学习情况调查-拷贝】', 'admin', '新增', '127.0.0.1', '2024-07-11 11:33:23');
INSERT INTO `logs` VALUES (142, '复制新的问卷【大学生学习情况调查-拷贝】', 'admin', '复制', '127.0.0.1', '2024-07-11 11:33:23');
INSERT INTO `logs` VALUES (143, '修改问卷【大学生学习情况调查-拷贝】', 'admin', '修改', '127.0.0.1', '2024-07-11 11:33:33');
INSERT INTO `logs` VALUES (144, '登录', 'admin', '登录', '127.0.0.1', '2024-07-11 11:35:31');
INSERT INTO `logs` VALUES (145, '登录', 'admin', '登录', '127.0.0.1', '2024-07-11 11:45:57');
INSERT INTO `logs` VALUES (146, '删除问卷【大学生学习情况调查-拷贝】', 'admin', '删除', '127.0.0.1', '2024-07-11 11:47:44');
INSERT INTO `logs` VALUES (147, '修改问卷【大学生学习情况调查】', 'admin', '修改', '127.0.0.1', '2024-07-11 11:48:12');
INSERT INTO `logs` VALUES (148, '创建问卷【大学生学习情况调查-拷贝】', 'admin', '新增', '127.0.0.1', '2024-07-11 11:48:12');
INSERT INTO `logs` VALUES (149, '复制新的问卷【大学生学习情况调查-拷贝】', 'admin', '复制', '127.0.0.1', '2024-07-11 11:48:12');
INSERT INTO `logs` VALUES (150, '登录', 'admin', '登录', '127.0.0.1', '2024-07-11 11:49:05');
INSERT INTO `logs` VALUES (151, '修改问卷【大学生学习情况调查-拷贝】', 'admin', '修改', '127.0.0.1', '2024-07-11 11:49:45');
INSERT INTO `logs` VALUES (152, '删除问卷【大学生学习情况调查-拷贝】', 'admin', '删除', '127.0.0.1', '2024-07-11 11:50:03');
INSERT INTO `logs` VALUES (153, '修改问卷【大学生就业意向调查】', 'admin', '修改', '127.0.0.1', '2024-07-11 11:50:33');
INSERT INTO `logs` VALUES (154, '创建问卷【大学生就业意向调查-拷贝】', 'admin', '新增', '127.0.0.1', '2024-07-11 11:50:33');
INSERT INTO `logs` VALUES (155, '复制新的问卷【大学生就业意向调查-拷贝】', 'admin', '复制', '127.0.0.1', '2024-07-11 11:50:33');
INSERT INTO `logs` VALUES (156, '删除问卷【大学生就业意向调查-拷贝】', 'admin', '删除', '127.0.0.1', '2024-07-11 11:50:44');
INSERT INTO `logs` VALUES (157, '修改问卷【大学生就业意向调查】', 'admin', '修改', '127.0.0.1', '2024-07-11 11:51:08');
INSERT INTO `logs` VALUES (158, '创建问卷【大学生就业意向调查-拷贝】', 'admin', '新增', '127.0.0.1', '2024-07-11 11:51:08');
INSERT INTO `logs` VALUES (159, '复制新的问卷【大学生就业意向调查-拷贝】', 'admin', '复制', '127.0.0.1', '2024-07-11 11:51:08');
INSERT INTO `logs` VALUES (160, '删除问卷【大学生就业意向调查-拷贝】', 'admin', '删除', '127.0.0.1', '2024-07-11 11:51:11');
INSERT INTO `logs` VALUES (161, '修改问卷【大学生学习情况调查】', 'admin', '修改', '127.0.0.1', '2024-07-11 11:53:52');
INSERT INTO `logs` VALUES (162, '修改问卷【大学生消费情况调查】', 'admin', '修改', '127.0.0.1', '2024-07-11 11:56:21');
INSERT INTO `logs` VALUES (163, '修改问卷【大学生就业意向调查】', 'admin', '修改', '127.0.0.1', '2024-07-11 11:56:32');
INSERT INTO `logs` VALUES (164, '登录', 'admin', '登录', '127.0.0.1', '2024-07-11 12:00:22');
INSERT INTO `logs` VALUES (165, '登录', 'admin', '登录', '127.0.0.1', '2024-07-11 14:57:57');
INSERT INTO `logs` VALUES (166, '修改问卷【大学生学习情况调查】', 'admin', '修改', '127.0.0.1', '2024-07-11 14:58:31');
INSERT INTO `logs` VALUES (167, '修改问卷【大学生就业意向调查】', 'admin', '修改', '127.0.0.1', '2024-07-11 14:58:39');
INSERT INTO `logs` VALUES (168, '登录', 'aaa', '登录', '127.0.0.1', '2024-07-11 15:04:05');
INSERT INTO `logs` VALUES (169, '登录', 'aaa', '登录', '127.0.0.1', '2024-07-16 11:53:24');
INSERT INTO `logs` VALUES (170, '修改问卷【大学生就业意向调查】', 'aaa', '修改', '127.0.0.1', '2024-07-16 11:53:31');
INSERT INTO `logs` VALUES (171, '修改问卷【大学生就业意向调查】', 'aaa', '修改', '127.0.0.1', '2024-07-16 11:53:33');
INSERT INTO `logs` VALUES (172, '修改问卷【大学生就业意向调查】', 'aaa', '修改', '127.0.0.1', '2024-07-16 11:53:47');
INSERT INTO `logs` VALUES (173, '创建问卷【1】', 'aaa', '新增', '127.0.0.1', '2024-07-16 11:53:53');
INSERT INTO `logs` VALUES (174, '修改问卷【1】', 'aaa', '修改', '127.0.0.1', '2024-07-16 11:53:57');
INSERT INTO `logs` VALUES (175, '删除问卷【1】', 'aaa', '删除', '127.0.0.1', '2024-07-16 11:54:01');
INSERT INTO `logs` VALUES (176, '创建问卷【1】', 'aaa', '新增', '127.0.0.1', '2024-07-16 11:54:05');
INSERT INTO `logs` VALUES (177, '修改问卷【1】', 'aaa', '修改', '127.0.0.1', '2024-07-16 11:54:25');
INSERT INTO `logs` VALUES (178, '登录', 'admin', '登录', '127.0.0.1', '2024-07-16 11:54:45');
INSERT INTO `logs` VALUES (179, '修改问卷【1】', 'admin', '修改', '127.0.0.1', '2024-07-16 11:55:13');
INSERT INTO `logs` VALUES (180, '修改问卷【1】', 'admin', '修改', '127.0.0.1', '2024-07-16 11:56:03');
INSERT INTO `logs` VALUES (181, '修改问卷【1】', 'admin', '修改', '127.0.0.1', '2024-07-16 11:56:05');
INSERT INTO `logs` VALUES (182, '修改问卷【1】', 'admin', '修改', '127.0.0.1', '2024-07-16 11:56:07');
INSERT INTO `logs` VALUES (183, '修改问卷【1】', 'admin', '修改', '127.0.0.1', '2024-07-16 11:56:11');
INSERT INTO `logs` VALUES (184, '修改问卷【大学生就业意向调查】', 'admin', '修改', '127.0.0.1', '2024-07-16 11:57:19');
INSERT INTO `logs` VALUES (185, '修改问卷【1】', 'admin', '修改', '127.0.0.1', '2024-07-16 11:57:56');
INSERT INTO `logs` VALUES (186, '修改问卷【1】', 'admin', '修改', '127.0.0.1', '2024-07-16 11:58:04');
INSERT INTO `logs` VALUES (187, '修改问卷【大学生就业意向调查】', 'aaa', '修改', '127.0.0.1', '2024-07-16 11:58:19');
INSERT INTO `logs` VALUES (188, '修改问卷【大学生就业意向调查】', 'aaa', '修改', '127.0.0.1', '2024-07-16 11:58:21');
INSERT INTO `logs` VALUES (189, '修改问卷【大学生就业意向调查】', 'admin', '修改', '127.0.0.1', '2024-07-16 12:00:22');
INSERT INTO `logs` VALUES (190, '修改问卷【大学生就业意向调查】', 'aaa', '修改', '127.0.0.1', '2024-07-16 12:00:57');
INSERT INTO `logs` VALUES (191, '登录', '111', '登录', '127.0.0.1', '2024-07-16 12:01:33');
INSERT INTO `logs` VALUES (192, '修改问卷【大学生就业意向调查】', '111', '修改', '127.0.0.1', '2024-07-16 12:01:51');
INSERT INTO `logs` VALUES (193, '修改问卷【1】', '111', '修改', '127.0.0.1', '2024-07-16 12:01:58');
INSERT INTO `logs` VALUES (194, '修改问卷【1】', '111', '修改', '127.0.0.1', '2024-07-16 12:02:00');
INSERT INTO `logs` VALUES (195, '修改问卷【1】', '111', '修改', '127.0.0.1', '2024-07-16 12:02:02');
INSERT INTO `logs` VALUES (196, '修改问卷【1】', '111', '修改', '127.0.0.1', '2024-07-16 12:02:05');
INSERT INTO `logs` VALUES (197, '登录', 'admin', '登录', '127.0.0.1', '2024-07-16 15:47:37');
INSERT INTO `logs` VALUES (198, '删除问卷【1】', 'admin', '删除', '127.0.0.1', '2024-07-16 15:47:44');
INSERT INTO `logs` VALUES (199, '登录', 'admin', '登录', '127.0.0.1', '2024-07-17 09:07:10');
INSERT INTO `logs` VALUES (200, '登录', 'admin', '登录', '127.0.0.1', '2024-07-17 10:19:45');
INSERT INTO `logs` VALUES (201, '登录', 'admin', '登录', '127.0.0.1', '2024-07-17 14:36:25');
INSERT INTO `logs` VALUES (202, '修改问卷【大学生学习情况调查】', 'admin', '修改', '127.0.0.1', '2024-07-17 14:51:34');
INSERT INTO `logs` VALUES (203, '修改问卷【大学生学习情况调查】', 'admin', '修改', '127.0.0.1', '2024-07-17 14:51:37');
INSERT INTO `logs` VALUES (204, '修改问卷【大学生学习情况调查】', 'admin', '修改', '127.0.0.1', '2024-07-17 14:51:41');
INSERT INTO `logs` VALUES (205, '修改问卷【大学生学习情况调查】', 'admin', '修改', '127.0.0.1', '2024-07-17 14:51:43');
INSERT INTO `logs` VALUES (206, '修改问卷【大学生学习情况调查】', 'admin', '修改', '127.0.0.1', '2024-07-17 14:57:47');
INSERT INTO `logs` VALUES (207, '创建问卷【大学生学习情况调查-拷贝】', 'admin', '新增', '127.0.0.1', '2024-07-17 14:57:47');
INSERT INTO `logs` VALUES (208, '复制新的问卷【大学生学习情况调查-拷贝】', 'admin', '复制', '127.0.0.1', '2024-07-17 14:57:47');
INSERT INTO `logs` VALUES (209, '删除问卷【大学生学习情况调查-拷贝】', 'admin', '删除', '127.0.0.1', '2024-07-17 14:58:34');
INSERT INTO `logs` VALUES (210, '修改问卷【大学生学习情况调查】', 'admin', '修改', '127.0.0.1', '2024-07-17 15:02:34');
INSERT INTO `logs` VALUES (211, '创建问卷【大学生学习情况调查-拷贝】', 'admin', '新增', '127.0.0.1', '2024-07-17 15:02:34');
INSERT INTO `logs` VALUES (212, '复制新的问卷【大学生学习情况调查-拷贝】', 'admin', '复制', '127.0.0.1', '2024-07-17 15:02:34');
INSERT INTO `logs` VALUES (213, '删除问卷【大学生学习情况调查-拷贝】', 'admin', '删除', '127.0.0.1', '2024-07-17 15:06:08');
INSERT INTO `logs` VALUES (214, '创建问卷【我是名称】', 'admin', '新增', '127.0.0.1', '2024-07-17 15:07:37');
INSERT INTO `logs` VALUES (215, '修改问卷【我是名称】', 'admin', '修改', '127.0.0.1', '2024-07-17 15:13:33');
INSERT INTO `logs` VALUES (216, '创建问卷【我是名称-拷贝】', 'admin', '新增', '127.0.0.1', '2024-07-17 15:13:33');
INSERT INTO `logs` VALUES (217, '复制新的问卷【我是名称-拷贝】', 'admin', '复制', '127.0.0.1', '2024-07-17 15:13:33');
INSERT INTO `logs` VALUES (218, '修改问卷【我是名称】', 'admin', '修改', '127.0.0.1', '2024-07-17 15:13:57');
INSERT INTO `logs` VALUES (219, '删除问卷【我是名称-拷贝】', 'admin', '删除', '127.0.0.1', '2024-07-17 15:14:00');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建时间',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '公告信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '大家好', '大家好', '2024-07-01', 'admin');
INSERT INTO `notice` VALUES (2, '这是我们小组创建的问卷调查系统', '这是我们小组创建的问卷调查系统', '2024-07-01', 'admin');
INSERT INTO `notice` VALUES (3, '系统的名称叫SurveySprite', '系统的名称叫SurveySprite', '2024-07-01', 'admin');

-- ----------------------------
-- Table structure for pages
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模板名称',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '模板介绍',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '封面图',
  `count` int NULL DEFAULT 0 COMMENT '使用次数',
  `user_id` int NULL DEFAULT NULL COMMENT '创建人ID',
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建时间',
  `open` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '否' COMMENT '是否公开',
  `saved` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '否' COMMENT '是否发布',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '问卷表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pages
-- ----------------------------
INSERT INTO `pages` VALUES (1, '大学生就业意向调查', '调查大学生就业意向', 'http://localhost:9090/files/1720681118243-OIP (2).jpg', 1, 1, '2024-6-29 10:48:07', '是', '是', '111');
INSERT INTO `pages` VALUES (2, '大学生消费情况调查', '大学生消费情况调查', 'http://localhost:9090/files/1720670180780-OIP.jpg', 2, 2, '2024-6-30 09:48:20', '是', '是', NULL);
INSERT INTO `pages` VALUES (3, '大学生学习情况调查', '大学生学习情况调查', 'http://localhost:9090/files/1720681110120-OIP (1).jpg', 5, 3, '2024-6-30 09:48:20', '是', '是', NULL);
INSERT INTO `pages` VALUES (36, '我是名称', '我是介绍', 'http://localhost:9090/files/1721200032907-2.jpg', 1, NULL, '2024-07-17 15:07:37', '是', '是', NULL);

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '题目名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '题目类型',
  `page_id` int NULL DEFAULT NULL COMMENT '问卷ID',
  `user_id` int NULL DEFAULT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 156 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '题目表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (86, '您的性别：', '单选题', 3, NULL);
INSERT INTO `question` VALUES (87, '您目前所在的城市是？', '位置信息', 3, NULL);
INSERT INTO `question` VALUES (88, '您就读的学历层次', '单选题', 3, NULL);
INSERT INTO `question` VALUES (89, '您目前就读的专业', '填空题', 3, NULL);
INSERT INTO `question` VALUES (90, '您现在就读的年级', '单选题', 3, NULL);
INSERT INTO `question` VALUES (92, '您为什么选择了您现在所学的专业？', '填空题', 3, NULL);
INSERT INTO `question` VALUES (93, '您现在的班级学习氛围怎么样', '量表题', 3, NULL);
INSERT INTO `question` VALUES (94, '您的学习动力是', '多选题', 3, NULL);
INSERT INTO `question` VALUES (95, '大学学习给您带来最大的收获是什么？', '填空题', 3, NULL);
INSERT INTO `question` VALUES (96, '您填写本问卷的日期是', '日期选择', 3, NULL);
INSERT INTO `question` VALUES (97, '感谢您的参与，您对问卷的评价是', '星级评分', 3, NULL);
INSERT INTO `question` VALUES (98, '您的性别', '单选题', 2, NULL);
INSERT INTO `question` VALUES (99, '您的年级', '单选题', 2, NULL);
INSERT INTO `question` VALUES (100, '在校期间的平均月消费', '单选题', 2, NULL);
INSERT INTO `question` VALUES (101, '生活费来源', '单选题', 2, NULL);
INSERT INTO `question` VALUES (102, '每月用于校内食堂就餐的费用约为', '单选题', 2, NULL);
INSERT INTO `question` VALUES (103, '购物的方式通常为', '单选题', 2, NULL);
INSERT INTO `question` VALUES (104, '与同学或朋友间聚餐', '单选题', 2, NULL);
INSERT INTO `question` VALUES (105, '您觉得自己的生活费', '单选题', 2, NULL);
INSERT INTO `question` VALUES (106, '您的月消费多用在哪些方面', '多选题', 2, NULL);
INSERT INTO `question` VALUES (107, '感谢您的参与，您对本问卷的评价是', '星级评分', 2, NULL);
INSERT INTO `question` VALUES (108, '您的性别是', '单选题', 1, NULL);
INSERT INTO `question` VALUES (109, '您的专业是', '填空题', 1, NULL);
INSERT INTO `question` VALUES (110, '您的年级是', '单选题', 1, NULL);
INSERT INTO `question` VALUES (111, '您是否有明确的职业规划', '单选题', 1, NULL);
INSERT INTO `question` VALUES (112, '哪些因素影响了您的职业规划？', '多选题', 1, NULL);
INSERT INTO `question` VALUES (113, '大学毕业后，您会选择哪种就业方向？', '单选题', 1, NULL);
INSERT INTO `question` VALUES (114, '您对于目前就业形势的看法', '多选题', 1, NULL);
INSERT INTO `question` VALUES (117, '您对于未来工作的福利待遇看法', '多选题', 1, NULL);
INSERT INTO `question` VALUES (118, '希望学校或老师给予你什么帮助', '填空题', 1, NULL);
INSERT INTO `question` VALUES (119, '感谢您的参与，您对本问卷的评价是', '星级评分', 1, NULL);
INSERT INTO `question` VALUES (142, '', '单选题', 36, NULL);
INSERT INTO `question` VALUES (143, '', '多选题', 36, NULL);
INSERT INTO `question` VALUES (144, '', '量表题', 36, NULL);
INSERT INTO `question` VALUES (145, '', '填空题', 36, NULL);
INSERT INTO `question` VALUES (146, '', '位置信息', 36, NULL);
INSERT INTO `question` VALUES (147, '', '星级评分', 36, NULL);
INSERT INTO `question` VALUES (148, '', '日期选择', 36, NULL);

-- ----------------------------
-- Table structure for question_item
-- ----------------------------
DROP TABLE IF EXISTS `question_item`;
CREATE TABLE `question_item`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `question_id` int NULL DEFAULT NULL COMMENT '题目ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 273 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '题目内容表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of question_item
-- ----------------------------
INSERT INTO `question_item` VALUES (127, '男', 86);
INSERT INTO `question_item` VALUES (128, '女', 86);
INSERT INTO `question_item` VALUES (129, '本科', 88);
INSERT INTO `question_item` VALUES (130, '专科', 88);
INSERT INTO `question_item` VALUES (131, '大一', 90);
INSERT INTO `question_item` VALUES (132, '大二', 90);
INSERT INTO `question_item` VALUES (133, '大三', 90);
INSERT INTO `question_item` VALUES (134, '大四', 90);
INSERT INTO `question_item` VALUES (143, '很差', 93);
INSERT INTO `question_item` VALUES (144, '较差', 93);
INSERT INTO `question_item` VALUES (145, '一般', 93);
INSERT INTO `question_item` VALUES (146, '良好', 93);
INSERT INTO `question_item` VALUES (147, '优秀', 93);
INSERT INTO `question_item` VALUES (148, '服务于国家和社会', 94);
INSERT INTO `question_item` VALUES (149, '回报父母', 94);
INSERT INTO `question_item` VALUES (150, '拿到奖学金', 94);
INSERT INTO `question_item` VALUES (151, '拿到毕业证书，方便就业', 94);
INSERT INTO `question_item` VALUES (152, '热爱学习', 94);
INSERT INTO `question_item` VALUES (153, '服从家长的决定', 94);
INSERT INTO `question_item` VALUES (154, '为了在本专业有所成就', 94);
INSERT INTO `question_item` VALUES (155, '为了考研或者出国做打算', 94);
INSERT INTO `question_item` VALUES (156, '不清楚', 94);
INSERT INTO `question_item` VALUES (157, '男', 98);
INSERT INTO `question_item` VALUES (158, '女', 98);
INSERT INTO `question_item` VALUES (159, '大一', 99);
INSERT INTO `question_item` VALUES (160, '大二', 99);
INSERT INTO `question_item` VALUES (161, '大三', 99);
INSERT INTO `question_item` VALUES (162, '大四', 99);
INSERT INTO `question_item` VALUES (163, '600-1000', 100);
INSERT INTO `question_item` VALUES (164, '1000-1500', 100);
INSERT INTO `question_item` VALUES (165, '1500-2000', 100);
INSERT INTO `question_item` VALUES (166, '2000以上', 100);
INSERT INTO `question_item` VALUES (167, '全部来自家庭', 101);
INSERT INTO `question_item` VALUES (168, '部分来自家庭，部分靠自己赚取', 101);
INSERT INTO `question_item` VALUES (169, '全部靠自己赚取', 101);
INSERT INTO `question_item` VALUES (170, '300以下', 102);
INSERT INTO `question_item` VALUES (171, '300-600', 102);
INSERT INTO `question_item` VALUES (172, '600-1000', 102);
INSERT INTO `question_item` VALUES (173, '1000以上', 102);
INSERT INTO `question_item` VALUES (174, '实体店', 103);
INSERT INTO `question_item` VALUES (175, '网购', 103);
INSERT INTO `question_item` VALUES (176, '从不', 104);
INSERT INTO `question_item` VALUES (177, '一月一次或两次', 104);
INSERT INTO `question_item` VALUES (178, '一周一次或两次', 104);
INSERT INTO `question_item` VALUES (179, '有富余', 105);
INSERT INTO `question_item` VALUES (180, '刚好够用', 105);
INSERT INTO `question_item` VALUES (181, '伙食', 106);
INSERT INTO `question_item` VALUES (182, '购置衣物', 106);
INSERT INTO `question_item` VALUES (183, '交通通讯', 106);
INSERT INTO `question_item` VALUES (184, '生活用品', 106);
INSERT INTO `question_item` VALUES (185, '日常交际', 106);
INSERT INTO `question_item` VALUES (186, '学习用品', 106);
INSERT INTO `question_item` VALUES (187, '娱乐', 106);
INSERT INTO `question_item` VALUES (188, '其他', 106);
INSERT INTO `question_item` VALUES (189, '男', 108);
INSERT INTO `question_item` VALUES (190, '女', 108);
INSERT INTO `question_item` VALUES (191, '大一', 110);
INSERT INTO `question_item` VALUES (192, '大二', 110);
INSERT INTO `question_item` VALUES (193, '大三', 110);
INSERT INTO `question_item` VALUES (194, '大四', 110);
INSERT INTO `question_item` VALUES (195, '有', 111);
INSERT INTO `question_item` VALUES (196, '没有', 111);
INSERT INTO `question_item` VALUES (197, '心理因素（焦虑，有压力）', 112);
INSERT INTO `question_item` VALUES (198, '专业能力不足', 112);
INSERT INTO `question_item` VALUES (199, '专业与未来期望职业不符', 112);
INSERT INTO `question_item` VALUES (200, '家庭因素', 112);
INSERT INTO `question_item` VALUES (201, '直接工作', 113);
INSERT INTO `question_item` VALUES (202, '考公', 113);
INSERT INTO `question_item` VALUES (203, '考研', 113);
INSERT INTO `question_item` VALUES (204, '考编', 113);
INSERT INTO `question_item` VALUES (205, '自主创业', 113);
INSERT INTO `question_item` VALUES (206, '参军入伍', 113);
INSERT INTO `question_item` VALUES (207, '其它', 113);
INSERT INTO `question_item` VALUES (208, '其它', 112);
INSERT INTO `question_item` VALUES (210, '人才市场过度饱和', 114);
INSERT INTO `question_item` VALUES (211, '依然想吃“铁饭碗”', 114);
INSERT INTO `question_item` VALUES (212, '毕业即失业', 114);
INSERT INTO `question_item` VALUES (213, '毕业生啃老趋势', 114);
INSERT INTO `question_item` VALUES (214, '“孔乙己脱不下的长衫”', 114);
INSERT INTO `question_item` VALUES (215, '五险一金', 117);
INSERT INTO `question_item` VALUES (216, '带薪休假', 117);
INSERT INTO `question_item` VALUES (217, '员工培训', 117);
INSERT INTO `question_item` VALUES (218, '薪水符合预期', 117);
INSERT INTO `question_item` VALUES (219, '福利补贴', 117);
INSERT INTO `question_item` VALUES (220, '是否准时下班，加班是否有补助', 117);
INSERT INTO `question_item` VALUES (265, NULL, 142);
INSERT INTO `question_item` VALUES (266, NULL, 142);
INSERT INTO `question_item` VALUES (267, NULL, 143);
INSERT INTO `question_item` VALUES (268, NULL, 143);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色标识',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'aaa', 'aaa', 'aaa', 'http://localhost:9090/files/1720855054078-3.jpg', 'USER', '110', 'aaa@163.com');
INSERT INTO `user` VALUES (2, 'bbb', 'bbb', 'bbb', NULL, 'USER', NULL, NULL);
INSERT INTO `user` VALUES (3, 'ccc', 'ccc', 'ccc', NULL, 'USER', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
