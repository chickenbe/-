package com.example.spring_test.vo;

import lombok.Data;
import java.util.Date;
@Data
public class UserVO {
    //用户id
    private Long userId;
    //账户名称
    private String username;
    //密码
    private String password;
    //电话
    private String phone;
    //邮箱
    private String email;
    //用户注册日期
    private Date createdDate;
    //上次登录日期
    private Date lastLoginDate;
    //用户状态（注销否）
    private Integer status;
    //用户角色（普通用户，管理员）
    private Integer role;
}
