package com.olim.dao;

import com.olim.model.DoneQuiz;
import com.olim.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DoneQuizDao extends JpaRepository<DoneQuiz,Long> {
    List<DoneQuiz> findAllByUser(User user);
}
