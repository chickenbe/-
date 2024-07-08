package com.questionnaire.springbbot.data;

import com.baomidou.mybatisplus.annotation.TableField;
import jakarta.persistence.*;

import java.util.List;

import static jakarta.persistence.GenerationType.IDENTITY;

@Entity
@Table(name="test_questions")
public class Questions {


    @Id
    @Column(name="question_id")
    @GeneratedValue(strategy = IDENTITY)
    private long question_id;

    @Column(name="test_id")
    private long test_id;
    @Column(name="question_content")
    private String question_content;
    @Column(name="question_require")
    private int question_require;
    @Column(name = "user_id")
    private long user_id;
    @TableField(exist = false)
    @OneToMany
    private List<Choices> choices;

    public List<Choices> getChoices() {
        return choices;
    }

    public void setChoices(List<Choices> choices) {
        this.choices = choices;
    }

    public String getQuestion_content() {
        return question_content;
    }

    public void setQuestion_content(String question_content) {
        this.question_content = question_content;
    }

    public long getTest_id() {
        return test_id;
    }

    public void setTest_id(long test_id) {
        this.test_id = test_id;
    }

    public long getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(long question_id) {
        this.question_id = question_id;
    }

    public int getQuestion_require() {
        return question_require;
    }

    public void setQuestion_require(int question_require) {
        this.question_require = question_require;
    }

    public long getUser_id() {
        return user_id;
    }

    public void setUser_id(long user_id) {
        this.user_id = user_id;
    }

    @Override
    public String toString() {
        return "Questions{" +
                "question_id=" + question_id +
                ", test_id=" + test_id +
                ", question_content='" + question_content + '\'' +
                ", question_require=" + question_require +
                ", user_id=" + user_id +
                '}';
    }
}
