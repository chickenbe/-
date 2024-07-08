package com.example.spring_test.entity;

import lombok.Data;

/**
 * 功能：问卷标签实体
 * 日期：2024/7/5 15:05
 */
@Data
public class PaperTag {
    //标签id
    private Integer id;
    //问卷id
    private String paperId;
    //标签名称
    private String tagName;
}
