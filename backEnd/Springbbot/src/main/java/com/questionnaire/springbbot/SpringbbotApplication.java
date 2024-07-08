package com.questionnaire.springbbot;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@SpringBootApplication
@EnableWebMvc
@MapperScan("com.questionnaire.springbbot.mapper")
public class SpringbbotApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringbbotApplication.class, args);
	}

}
