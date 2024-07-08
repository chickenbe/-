package com.example.spring_test.entity;

import lombok.Data;

import java.util.Date;

@Data
public class Answer {
    //答卷id
    private Long answerId;
    //问卷id
    private Integer paperId;
    //试题id
    private Integer questionId;
    //试题类型
    private Integer questionType;
    //答卷提交时间
    private Date submitTime;
    //答卷内容
    private String answerContent;
}
