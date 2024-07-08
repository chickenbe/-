package com.questionnaire.springbbot.service;

import com.questionnaire.springbbot.data.Tests;

import java.util.List;

public interface TestsService {

    public Tests getTestsById(long id);

    List<Tests> getAll(long user_id);
}
