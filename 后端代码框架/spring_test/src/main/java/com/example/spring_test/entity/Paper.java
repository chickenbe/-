package com.example.spring_test.entity;

import lombok.Data;

import java.util.Date;

@Data
public class Paper {
    //问卷id
    private Long paperId;
    //标题
    private String paperTitle;
    //问卷描述
    private String paperDescription;
    //问卷创建人
    private String paperCreator;
    //问卷是否可见（0：隐藏，1：可见）
    private Integer visibility;
    //问卷浏览量
    private Integer visit;
    //问卷起始时间
    private Date startTime;
    //问卷结束时间
    private Date endTime;
    //问卷更新时间
    private Date updateTime;
    //图片路径（问卷是否自定义图片）
    private String paperImage;
    //问卷状态（0：已截止，1：发布中）
    private String paperStatus;
}
