package com.questionnaire.springbbot.controller;

import com.questionnaire.springbbot.data.Questions;
import com.questionnaire.springbbot.mapper.QuestionsMapper;
import com.questionnaire.springbbot.service.QuestionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class QuestionsController {
    @Autowired
    private QuestionsService questionsService;


    @GetMapping("/api/{creator_id}/test/{test_id}/")
    public List<Questions> getAllQuestions(@PathVariable long creator_id,@PathVariable long test_id) {
        return questionsService.getAllQuestions(creator_id,test_id);
    }

    @GetMapping("/api/{creator_id}/test/{test_id}/connected")
    public List<Questions> getQuestionsAndChoices(@PathVariable long creator_id,@PathVariable long test_id){
        return questionsService.getQuestionsAndChoices(creator_id,test_id);
    }
}
