package com.questionnaire.springbbot.controller;

import com.questionnaire.springbbot.data.Choices;
import com.questionnaire.springbbot.service.ChoicesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.awt.*;
import java.util.List;

@RestController
public class ChoicesController {
    @Autowired
    private ChoicesService choicesService;

    @GetMapping("api/{creator_id}/test/{test_id}/question/{question_id}/choices")
    public List<Choices> getAllChoices(@PathVariable long creator_id, @PathVariable long test_id,
                                       @PathVariable long question_id) {
        return choicesService.getAllChoices(creator_id, test_id, question_id);
    }
}
