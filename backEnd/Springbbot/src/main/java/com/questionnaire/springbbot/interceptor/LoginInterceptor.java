package com.questionnaire.springbbot.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {
        if (true) {
            System.out.println("用户已登录");
            return true;
        } else {
            System.out.println("请先登录");
            return false;
        }
    }
}
