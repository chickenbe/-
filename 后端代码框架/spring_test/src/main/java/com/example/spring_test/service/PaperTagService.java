package com.example.spring_test.service;

import java.util.List;

/**
 * 功能：（待定）问卷是否有标签功能，便于查询分类
 * 日期：2024/7/5 15:01
 */
public interface PaperTagService {
    // 获取全部标签名称
    List<String> getAllTags();
    // 查询该标签下的问卷
    List<Object> findPaperListByTag(String tag);
    // 获取问卷标签
    //List<paperTag> getPaperTag(String paperId);
    // 添加问卷标签
    void addPaperTag(String paperId, String tagName);
    // 删除问卷标签
    void deletePaperTag(String paperId, Integer id);
}
