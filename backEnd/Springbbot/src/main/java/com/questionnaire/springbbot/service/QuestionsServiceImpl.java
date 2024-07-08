package com.questionnaire.springbbot.service;

import com.questionnaire.springbbot.data.Questions;
import com.questionnaire.springbbot.mapper.QuestionsMapper;
import org.aspectj.weaver.patterns.TypePatternQuestions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuestionsServiceImpl implements QuestionsService{

    @Autowired
    private QuestionsMapper questionsMapper;

    @Override
    public List<Questions> getAllQuestions(long creator_id, long test_id) {
        return questionsMapper.getAllQuestions(creator_id, test_id);
    }
    @Override
    public List<Questions> getQuestionsAndChoices(long creator_id, long test_id) {
        return questionsMapper.getQuestionsAndChoices(creator_id,test_id);
    }
}
