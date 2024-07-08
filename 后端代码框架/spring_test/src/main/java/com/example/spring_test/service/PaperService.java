package com.example.spring_test.service;

import com.example.spring_test.vo.PaperVO;
import java.util.List;

/**
 * 功能：
 * 日期：2024/7/5 11:51
 */
public interface PaperService {
    // 新建空白问卷
    String addPaper(String creator);
    // 获取问卷
    PaperVO getPaper(String paperId);
    // 获取用户的问卷列表
    //List<SurveyListVO> getPaperByCreator(String creator);
    // 查看问卷
    void viewPaper(PaperVO paper);
    // 修改问卷
    void updatePaper(PaperVO paper);
    // 删除问卷
    void deletePaper(String paperId);

    // 问卷浏览数加1
    void addVisit(String paperId);
    // 是否引用自模板问卷
    boolean isQuote(String paperId);
    // 是否被其它问卷引用
    boolean isReference(String paperId);
    // 是否可见性
    boolean isVisibility(String paperId);
    // 管理员：获取问卷管理列表
    List<PaperVO> findAllPaper();
    // 管理员：获取问卷总数
    Integer getPaperCount();
    // 管理员：修改问卷状态（可见性）
    void modifyPaperVisibility(Integer visibility, String paperId);
    // 管理员：获取今日新增问卷数量
    Integer getCurDayPaper();

}
