package com.questionnaire.springbbot.service;

import com.questionnaire.springbbot.data.Choices;
import com.questionnaire.springbbot.mapper.ChoicesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ChoicesServiceImpl implements ChoicesService{

    @Autowired
    private ChoicesMapper choicesMapper;

    @Override
    public List<Choices> getAllChoices(long creator_id, long test_id, long question_id) {
        return choicesMapper.getAllChoices(creator_id, test_id, question_id);
    };

}
