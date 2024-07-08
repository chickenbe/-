package com.questionnaire.springbbot.mapper;

import com.questionnaire.springbbot.data.Questions;
import org.apache.ibatis.annotations.*;


import java.util.List;

@Mapper
public interface QuestionsMapper {
    @Insert("insert into test_questions " +
            "values (#{question_id}, #{test_id}, #{question_content}, #{question_require}, #{user_id})")
    int add(Questions questions);

    @Update("update test_questions " +
            "set question_content=#{question_content}, question_require=#{question_require}," +
            "where question_id=#{question_id} and test_id=#{test_id} and user_id=#{user_id}")
    int update(Questions questions);

    @Delete("delete from test_questions" +
            "where question_id=#{question_id} and test_id=#{test_id} and user_id=#{user_id}")
    int delete(Questions questions);

    @Select("select * " +
            "from test_questions" +
            "where question_id=#{question_id} and test_id=#{test_id} and user_id=#{user_id}")
    Questions findById(long creator_id, long test_id, long question_id);

    @Select("select * " +
            "from test_questions " +
            "where test_id=#{test_id} and user_id=#{user_id}")
    List<Questions> getAllQuestions(long user_id, long test_id);

    @Select("select distinct q.*" +
            "from test_questions q " +
//            "left join test_choices c on q.user_id=c.user_id " +
//                                    "and q.test_id = c.test_id " +
//                                    "and q.question_id = c.question_id " +
            "where q.test_id=#{test_id} and q.user_id=#{user_id}")
    @Results({
            @Result(column = "question_id", property = "question_id"),
            @Result(column = "question_content", property ="question_content"),
            @Result(column = "question_require", property = "question_require"),
            @Result(column = "user_id", property = "user_id"),
            @Result(column = "test_id", property = "test_id"),
            @Result(column = "{question_id=question_id, user_id=user_id,test_id=test_id}",
                    property = "choices", javaType = List.class,
                    many = @Many(select = "com.questionnaire.springbbot.mapper.ChoicesMapper.getAllChoices")
            )
    })
    List<Questions> getQuestionsAndChoices(long user_id, long test_id);

}
