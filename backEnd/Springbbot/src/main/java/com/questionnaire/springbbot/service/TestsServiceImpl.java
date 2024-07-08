package com.questionnaire.springbbot.service;

import com.questionnaire.springbbot.data.Tests;
import com.questionnaire.springbbot.data.TestsRepository;
import com.questionnaire.springbbot.mapper.TestsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestsServiceImpl implements TestsService{

    @Autowired
    private TestsRepository testsRepository;;
    @Autowired
    private TestsMapper testsMapper;

    @Override
    public Tests getTestsById(long id) {
        return testsRepository.findById(id).orElseThrow(RuntimeException::new);
    };
    public List<Tests> getAll(long user_id) {
        return testsMapper.getAll(user_id);
    };
}
