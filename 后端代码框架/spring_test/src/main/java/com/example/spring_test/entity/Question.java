package com.example.spring_test.entity;

import lombok.Data;

@Data
public class Question {
    //试题id
    private Long questionId;
    //问卷id
    private Long paperId;
    //试题标题
    private String questionTitle;
    //试题描述
    private String questionDesc;
    //试题类型
    private String questionType;
    //是否为必选项
    private Integer questionIsRequired;
}
