package com.questionnaire.springbbot.data;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ChoicesRepository extends JpaRepository<Choices, Long> {
}
