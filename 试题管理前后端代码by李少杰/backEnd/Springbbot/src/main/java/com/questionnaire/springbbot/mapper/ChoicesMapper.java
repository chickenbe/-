package com.questionnaire.springbbot.mapper;

import com.questionnaire.springbbot.data.Choices;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ChoicesMapper {
    @Insert("insert into test_choices " +
            "values (#{choice_id}, #{question_id}, #{choice_content}, #{test_id}, #{user_id})")
    int add(Choices choices);
    @Update("update test_choices " +
            "set choice_content=#{choice_content} " +
            "where user_id=#{user_id} and test_id=#{test_id} and question_id=#{question_id} and choice_id=#{choice_id}")
    int update(Choices choices);
    @Delete("delete from test_choices " +
            "where user_id=#{user_id} and test_id=#{test_id} and question_id=#{question_id} and choice_id=#{choice_id}")
    int delete(long user_id,long test_id, long question_id, long choice_id);
    @Select("select * " +
            "from test_choices " +
            "where user_id=#{user_id} and test_id=#{test_id} and question_id=#{question_id}")
    List<Choices> getAllChoices(long user_id,long test_id, long question_id);
}
