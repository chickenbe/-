package com.example.spring_test.service;

import java.util.Date;
import java.util.List;
import com.example.spring_test.vo.UserVO;
import com.example.spring_test.config.UserRole;

/**
 * 功能：
 * 日期：2024/7/5 11:29
 */
public interface UserService {
    //用户登录
    void userLogin(UserVO user);
    // 根据用户名查询用户
    UserVO findByUsername(String username);
    // 根据ID查询用户
    UserVO findUserById(String userId);
    // 添加新用户
    void addUser(UserVO user);
    // 记录最近一次登录时间
    void modifyLastLoginDate(Date date, String userId);
    // 获取用户管理列表
    List<UserVO> findAllUser(UserRole role, Integer page, Integer size);
    // 获取用户总数
    Integer getUserCountByRole(UserRole role);
    // 修改用户帐号状态
    void modifyUserStatus(Integer status, String userId);
    // 删除用户
    void deleteUser(String userId);
    // 获取今日新增用户数量
    Integer getCurDayUser();
}
