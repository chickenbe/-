package com.example.spring_test.service;

import com.example.spring_test.vo.QuestionVO;

import java.util.List;

/**
 * 功能：
 * 日期：2024/7/5 14:50
 */
public interface QuestionService {
    // 获取试题
    QuestionVO getQuestion(QuestionVO question);
    // 删除试题
    void deleteQuestion(String questionId);
    // 增加试题
    void addQuestion(QuestionVO question);
    // 修改试题
    void updateQuestion(QuestionVO question);
    // 交换试题
    void swapQuestion(QuestionVO fromQuestion, QuestionVO toQuestion);
}
