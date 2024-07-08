package com.questionnaire.springbbot.service;

import com.questionnaire.springbbot.data.Choices;

import java.util.List;

public interface ChoicesService {
    public List<Choices> getAllChoices(long creator_id, long test_id,long question_id);
}
