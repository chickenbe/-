package com.questionnaire.springbbot.mapper;

import com.questionnaire.springbbot.data.Tests;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface TestsMapper {
    @Insert("insert into tests " +
            "values (#{test_id},#{test_title},#{test_description}," +
                    "#{creator_id},#{date_of_start},#{deadline},#{test_create_time})")
    int add(Tests tests);

    @Update("update user " +
            "set test_title =#{test_title},test_description=#{test_description},creator_id =#{creator_id}"+
                "date_of_start=#{date_of_start},deadline=#{deadline},test_create_time=#{test_create_time}" +
            "where test_id=#{test_id} and creator_id=#{creator_id}")
    int update(Tests tests);

    @Delete("delete from tests " +
            "where test_id=#{test_id} and creator_id=#{creator_id}")
    int delete(long creator_id, long test_id);

    @Select("select * from tests where test_id=#{test_id} and creator_id=#{creator_id}")
    Tests findById(long creator_id, long test_id);

    @Select("select * " +
            "from tests " +
            "where creator_id=#{creator_id}")
    List<Tests> getAll(long creator_id);
}
