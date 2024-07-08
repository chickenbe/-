package org.example.back_end.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor

public class UserVO {
    private String identifier;
    private String password;
    private String newPassword;
    private String emailAddress;
    private String securityAnswer;

    // Getters and Setters
}
