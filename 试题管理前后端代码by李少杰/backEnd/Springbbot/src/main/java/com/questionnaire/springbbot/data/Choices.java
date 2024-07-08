package com.questionnaire.springbbot.data;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="test_choices")
public class Choices {
    @Id
    @Column(name="choice_id")
    private int choice_id;
    @Column(name="question_id")
    private int question_id;
    @Column(name="choice_content")
    private String choice_content;
    @Column(name="test_id")
    private int test_id;
    @Column(name="user_id")
    private int user_id;

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getTest_id() {
        return test_id;
    }

    public void setTest_id(int test_id) {
        this.test_id = test_id;
    }

    public String getChoice_content() {
        return choice_content;
    }

    public void setChoice_content(String choice_content) {
        this.choice_content = choice_content;
    }

    public int getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(int question_id) {
        this.question_id = question_id;
    }

    public int getChoice_id() {
        return choice_id;
    }

    public void setChoice_id(int choice_id) {
        this.choice_id = choice_id;
    }

    @Override
    public String toString() {
        return "Choice{" +
                "choice_id=" + choice_id +
                ", question_id=" + question_id +
                ", choice_content='" + choice_content + '\'' +
                ", test_id=" + test_id +
                ", user_id=" + user_id +
                '}';
    }
}
