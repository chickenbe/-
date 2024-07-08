package com.questionnaire.springbbot.data;

import jakarta.persistence.*;

import static jakarta.persistence.GenerationType.IDENTITY;

@Entity
@Table(name="tests")
public class Tests {
    @Id
    @Column(name="test_id")
    @GeneratedValue(strategy = IDENTITY)
    private long test_id;

    @Column(name="test_title")
    private String test_title;

    @Column(name="test_description")
    private String test_description;

    @Column(name="creator_id")
    private long creator_id;

    @Column(name="date_of_start")
    private String date_of_start;

    @Column(name="deadline")
    private String deadline;

    @Column(name="test_create_time")
    private String test_create_time;

    public String getTest_create_time() {
        return test_create_time;
    }

    public void setTest_create_time(String test_create_time) {
        this.test_create_time = test_create_time;
    }

    public long getTest_id() {
        return test_id;
    }

    public void setTest_id(long test_id) {
        this.test_id = test_id;
    }

    public String getTest_title() {
        return test_title;
    }

    public void setTest_title(String test_title) {
        this.test_title = test_title;
    }

    public String getTest_description() {
        return test_description;
    }

    public void setTest_description(String test_description) {
        this.test_description = test_description;
    }

    public long getCreator_id() {
        return creator_id;
    }

    public void setCreator_id(long creator_id) {
        this.creator_id = creator_id;
    }

    public String getDate_of_start() {
        return date_of_start;
    }

    public void setDate_of_start(String date_of_start) {
        this.date_of_start = date_of_start;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    @Override
    public String toString() {
        return "Tests{" +
                "test_id=" + test_id +
                ", test_title='" + test_title + '\'' +
                ", test_description='" + test_description + '\'' +
                ", creator_id=" + creator_id +
                ", date_of_start='" + date_of_start + '\'' +
                ", deadline='" + deadline + '\'' +
                ", test_create_time='" + test_create_time + '\'' +
                '}';
    }
}
