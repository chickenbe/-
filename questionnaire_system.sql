/*
 Navicat MySQL Dump SQL

 Source Server         : connection
 Source Server Type    : MySQL
 Source Server Version : 80011 (8.0.11)
 Source Host           : localhost:3306
 Source Schema         : questionnaire_system

 Target Server Type    : MySQL
 Target Server Version : 80011 (8.0.11)
 File Encoding         : 65001

 Date: 08/07/2024 13:34:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answer_tests
-- ----------------------------
DROP TABLE IF EXISTS `answer_tests`;
CREATE TABLE `answer_tests`  (
  `answer_test_id` int(10) NOT NULL AUTO_INCREMENT,
  `test_id` int(10) NOT NULL,
  `complition_user_id` int(10) NOT NULL,
  PRIMARY KEY (`answer_test_id`) USING BTREE,
  INDEX `complition_user_id`(`complition_user_id` ASC) USING BTREE,
  CONSTRAINT `answer_tests_ibfk_1` FOREIGN KEY (`complition_user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answer_tests
-- ----------------------------

-- ----------------------------
-- Table structure for test_choices
-- ----------------------------
DROP TABLE IF EXISTS `test_choices`;
CREATE TABLE `test_choices`  (
  `choice_id` int(10) NOT NULL,
  `question_id` int(10) NOT NULL,
  `choice_content` char(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `test_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`choice_id`, `question_id`, `test_id`, `user_id`) USING BTREE,
  INDEX `question_id`(`question_id` ASC) USING BTREE,
  CONSTRAINT `test_choices_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `test_questions` (`question_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_choices
-- ----------------------------
INSERT INTO `test_choices` VALUES (1, 1, '苹果', 1, 1);
INSERT INTO `test_choices` VALUES (1, 1, '苹果', 2, 1);
INSERT INTO `test_choices` VALUES (1, 2, '甜', 1, 1);
INSERT INTO `test_choices` VALUES (1, 3, '轻松', 1, 1);
INSERT INTO `test_choices` VALUES (2, 1, '香蕉', 1, 1);
INSERT INTO `test_choices` VALUES (2, 1, '香蕉', 2, 1);
INSERT INTO `test_choices` VALUES (2, 2, '咸', 1, 1);
INSERT INTO `test_choices` VALUES (2, 3, '刺激', 1, 1);
INSERT INTO `test_choices` VALUES (3, 1, '葡萄', 1, 1);
INSERT INTO `test_choices` VALUES (3, 1, '梨子', 2, 1);
INSERT INTO `test_choices` VALUES (3, 2, '辣', 1, 1);
INSERT INTO `test_choices` VALUES (3, 3, '阴郁', 1, 1);
INSERT INTO `test_choices` VALUES (4, 1, '梨子', 1, 1);
INSERT INTO `test_choices` VALUES (4, 1, '葡萄', 2, 1);
INSERT INTO `test_choices` VALUES (4, 2, '原味', 1, 1);
INSERT INTO `test_choices` VALUES (4, 3, '欢乐', 1, 1);

-- ----------------------------
-- Table structure for test_questions
-- ----------------------------
DROP TABLE IF EXISTS `test_questions`;
CREATE TABLE `test_questions`  (
  `question_id` int(10) NOT NULL,
  `test_id` int(10) NOT NULL,
  `question_content` char(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `question_require` int(2) NULL DEFAULT 0,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`question_id`, `test_id`, `user_id`) USING BTREE,
  INDEX `test_id`(`test_id` ASC) USING BTREE,
  INDEX `test_question_ibfk_2_idx`(`user_id` ASC) USING BTREE,
  CONSTRAINT `test_questions_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `tests` (`test_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `test_questions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_questions
-- ----------------------------
INSERT INTO `test_questions` VALUES (1, 1, '你更喜欢吃什么', 1, 1);
INSERT INTO `test_questions` VALUES (1, 2, '你讨厌做什么', 1, 1);
INSERT INTO `test_questions` VALUES (2, 1, '你更喜欢什么口味', 1, 1);
INSERT INTO `test_questions` VALUES (2, 2, '你讨厌吃什么', 1, 1);
INSERT INTO `test_questions` VALUES (3, 1, '你更喜欢什么氛围', 1, 1);
INSERT INTO `test_questions` VALUES (3, 2, '你讨厌玩什么', 1, 1);

-- ----------------------------
-- Table structure for tests
-- ----------------------------
DROP TABLE IF EXISTS `tests`;
CREATE TABLE `tests`  (
  `test_id` int(10) NOT NULL,
  `test_title` char(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `test_description` char(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `creator_id` int(10) NOT NULL,
  `date_of_start` datetime NULL DEFAULT NULL,
  `deadline` datetime NULL DEFAULT NULL,
  `test_create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`test_id`, `creator_id`) USING BTREE,
  INDEX `creator_id`(`creator_id` ASC) USING BTREE,
  CONSTRAINT `tests_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tests
-- ----------------------------
INSERT INTO `tests` VALUES (1, '问卷标题', '这是一个测试问卷的描述', 1, '2024-07-04 16:34:00', '2024-07-04 17:30:00', '2024-07-04 16:30:00');
INSERT INTO `tests` VALUES (2, '问卷标题', '这是一个测试问卷的表述', 1, '2024-07-05 14:38:00', '2024-07-05 17:30:00', '2024-07-06 14:30:00');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int(10) NOT NULL,
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `security_question` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `answer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'zhang3', 'zhang3@qq.com', 'zhang123456', '我的电话号码是多少', '12345678910');
INSERT INTO `users` VALUES (2, 'li4', 'li4@qq.com', 'li123456', '我的电话号码是多少', '12345645610');

SET FOREIGN_KEY_CHECKS = 1;
