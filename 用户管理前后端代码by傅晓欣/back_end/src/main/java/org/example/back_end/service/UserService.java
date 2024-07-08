package org.example.back_end.service;

import org.example.back_end.po.User;
import org.example.back_end.vo.UserVO;
import org.springframework.http.ResponseEntity;

public interface UserService {
    ResponseEntity<?> register(User user);
    ResponseEntity<?> login(User user);
    ResponseEntity<?> forgotPassword(UserVO userVO);
    ResponseEntity<?> fetchSecurityQuestion(UserVO userVO);
    ResponseEntity<?> getCurrentUser();
    ResponseEntity<?> getUserInfo(String identifier);
    ResponseEntity<?> changePassword(UserVO userVO);
}
