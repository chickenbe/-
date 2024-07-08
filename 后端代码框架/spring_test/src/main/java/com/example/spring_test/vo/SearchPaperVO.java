package com.example.spring_test.vo;

import lombok.Data;

import java.util.Date;
@Data

/**
 * 功能：
 * 日期：2024/7/5 15:35
 */
public class SearchPaperVO {
    private Integer paperId;

    private String paperTitle;

    private String paperDescription;

    private Integer visit;

    private String tags;
}
