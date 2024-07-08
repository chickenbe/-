package org.example.back_end.serviceImpl;

import org.example.back_end.mapper.UserMapper;
import org.example.back_end.po.User;
import org.example.back_end.service.UserService;
import org.example.back_end.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    @Transactional
    public ResponseEntity<?> register(User user) {
        User existingUser = userMapper.findByIdentifier(user.getUserName().toLowerCase());
        if (existingUser != null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("用户名已存在");
        }
        existingUser = userMapper.findByIdentifier(user.getEmailAddress().toLowerCase());
        if (existingUser != null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("邮箱已存在");
        }
        int result = userMapper.insertUser(user);
        if (result > 0) {
            return ResponseEntity.ok("注册成功");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("注册失败");
        }
    }

    @Override
    @Transactional
    public ResponseEntity<?> login(User user) {
        User existingUser = userMapper.findByIdentifier(user.getUserName().toLowerCase());
        if (existingUser == null) {
            existingUser = userMapper.findByIdentifier(user.getEmailAddress().toLowerCase());
        }
        if (existingUser == null || !existingUser.getPassword().equals(user.getPassword())) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("用户名或密码错误");
        }
        userMapper.truncateCUser();
        int result = userMapper.insertCUser(existingUser.getUserName().toLowerCase(), existingUser.getPassword());
        if (result > 0) {
            return ResponseEntity.ok("登录成功");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("登录失败");
        }
    }

    @Override
    public ResponseEntity<?> forgotPassword(UserVO userVO) {
        User existingUser = userMapper.findByIdentifier(userVO.getEmailAddress().toLowerCase());
        if (existingUser == null || !existingUser.getAnswer().equals(userVO.getSecurityAnswer())) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("邮箱或密保答案错误");
        }
        int result = userMapper.updatePassword(userVO.getEmailAddress().toLowerCase(), userVO.getNewPassword());
        if (result > 0) {
            return ResponseEntity.ok("密码重置成功");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("密码重置失败");
        }
    }

    @Override
    public ResponseEntity<?> fetchSecurityQuestion(UserVO userVO) {
        User existingUser = userMapper.findByIdentifier(userVO.getEmailAddress().toLowerCase());
        if (existingUser == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("邮箱不存在");
        }
        return ResponseEntity.ok(existingUser.getQuestion());
    }

    @Override
    public ResponseEntity<?> getCurrentUser() {
        String identifier = userMapper.getCurrentUserIdentifier();
        if (identifier == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("当前用户不存在");
        }
        return ResponseEntity.ok(identifier);
    }

    @Override
    public ResponseEntity<?> getUserInfo(String identifier) {
        User user = userMapper.findByIdentifier(identifier.toLowerCase());
        if (user == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("用户不存在");
        }
        return ResponseEntity.ok(user);
    }

    @Override
    @Transactional
    public ResponseEntity<?> changePassword(UserVO userVO) {
        User existingUser = userMapper.findByIdentifier(userVO.getIdentifier().toLowerCase());
        if (existingUser == null || !existingUser.getPassword().equals(userVO.getPassword())) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("旧密码错误");
        }
        int result = userMapper.updatePassword(userVO.getIdentifier().toLowerCase(), userVO.getNewPassword());
        if (result > 0) {
            return ResponseEntity.ok("密码修改成功");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("密码修改失败");
        }
    }
}
