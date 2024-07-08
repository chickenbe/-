package com.example.spring_test.service;

import com.example.spring_test.vo.AnswerVO;
import com.example.spring_test.vo.QuestionVO;
import java.util.List;

/**
 * 功能：
 * 日期：2024/7/5 14:57
 */
public interface AnswerService {
    // 获取答卷列表
    List<AnswerVO> getAnswer(Integer answerId);
    // 获取答卷数量
    Integer getAnswerCount(Integer answerId);
    // 获取答题详细情况
    List<QuestionVO> getQuestion(Integer questionId);
    // 获取指定答卷的详细信息
    AnswerVO getAnswerDetail(Integer answerId);
    // 获取指定答卷的题目与回答
    List<AnswerVO> getAnswerList(Integer questionId, Integer answerId);
    // 删除答卷
    void deleteAnswer(Integer answerId);
    // 答卷数据分析
    void getAnswerData(Integer answerId);
}
