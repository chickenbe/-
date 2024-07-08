package com.example.spring_test.service;

import com.example.spring_test.vo.SearchPaperVO;

import java.util.List;

/**
 * 功能：
 * 日期：2024/7/5 15:28
 */
public interface SearchService {
    // 查询结果列表, 按照修改时间排序
    List<SearchPaperVO> searchPaperListByDate(String searchText);
    // 查询结果列表, 按照浏览数排序
    List<SearchPaperVO> searchPaperListByVisit(String searchText);

    // 查询结果列表, 按照标签排序
    List<SearchPaperVO> searchPaperListByTag(String searchText);
}
