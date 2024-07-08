package org.example.back_end.Controller;

import org.example.back_end.po.User;
import org.example.back_end.service.UserService;
import org.example.back_end.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody User user) {
        return userService.register(user);
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody User user) {
        return userService.login(user);
    }

    @PostMapping("/forgot-password")
    public ResponseEntity<?> forgotPassword(@RequestBody UserVO userVO) {
        return userService.forgotPassword(userVO);
    }

    @PostMapping("/fetch-security-question")
    public ResponseEntity<?> fetchSecurityQuestion(@RequestBody UserVO userVO) {
        return userService.fetchSecurityQuestion(userVO);
    }

    @GetMapping("/currentUser")
    public ResponseEntity<?> getCurrentUser() {
        return userService.getCurrentUser();
    }

    @GetMapping("/userInfo/{identifier}")
    public ResponseEntity<?> getUserInfo(@PathVariable String identifier) {
        return userService.getUserInfo(identifier);
    }

    @PostMapping("/change-password")
    public ResponseEntity<?> changePassword(@RequestBody UserVO userVO) {
        return userService.changePassword(userVO);
    }
}
