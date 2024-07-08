package org.example.back_end.po;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor

public class User {
    private String userName;
    private String emailAddress;
    private String password;
    private String question;
    private String answer;

    // Getters and Setters
}
