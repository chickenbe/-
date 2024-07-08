package com.example.spring_test.vo;

import lombok.Data;

@Data
public class OptionsVO {
    //选项id
    private Long optionId;
    //试题id
    private Integer questionId;
    //问卷id
    private Long paperId;
    //选项内容
    private String optionContent;
    //选项标题
    private String optionTitle;
    //选项序号（在试题中是第几选项）
    private Long optionOrder;
}
