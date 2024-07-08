package com.questionnaire.springbbot.controller;

import com.questionnaire.springbbot.data.Tests;
import com.questionnaire.springbbot.mapper.TestsMapper;
import com.questionnaire.springbbot.service.TestsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class TestsController {
    @Autowired
    private TestsMapper testsMapper;

    @Autowired
    private TestsService testsService;
    @GetMapping("/api/{user_id}/tests")
    public List<Tests> getAll(@PathVariable long user_id) {
        return testsService.getAll(user_id);
    }
    @GetMapping("/api/{user_id}/test/get/{id}")
    public Tests getTestsById(@PathVariable long id) {
        return testsService.getTestsById(id);
    }
    @PostMapping("/api/{user_id}/test/create")
    public String createTests(Tests tests) {
        return "创建问卷";
    }
    @PutMapping("/api/{user_id}/test/update")
    public String update(Tests tests) {
        return "更新问卷";
    }
    @DeleteMapping("/api/test/delete/{id}")
    public String deleteTestsById(@PathVariable long id) {
        System.out.println("删除id"+id);
        return "删除问卷";
    }
}
