package com.questionnaire.springbbot.service;

import com.questionnaire.springbbot.data.Questions;

import java.util.List;

public interface QuestionsService {
    public List<Questions> getAllQuestions(long creator_id, long test_id);
    public List<Questions> getQuestionsAndChoices(long creator_id, long test_id);
}
