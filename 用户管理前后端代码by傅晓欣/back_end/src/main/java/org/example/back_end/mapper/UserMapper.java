package org.example.back_end.mapper;

import org.example.back_end.po.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UserMapper {

    int insertUser(User user);

    User findByIdentifier(@Param("identifier") String identifier);

    int updatePassword(@Param("identifier") String identifier, @Param("newPassword") String newPassword);

    String getCurrentUserIdentifier();

    int insertCUser(@Param("identifier") String identifier, @Param("password") String password);

    void truncateCUser();
}
