package com.example.spring_test.vo;

import lombok.Data;

import java.util.Date;
@Data

public class AnswerVO {
    //答卷id
    private Long answerId;
    //问卷id
    private Integer paperId;
    //试题id
    private Integer questionId;
    //试题类型
    private Integer questionType;
    //@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    //答卷生成时间
    private Date createTime;
    //答卷内容
    private String answerContent;
}
