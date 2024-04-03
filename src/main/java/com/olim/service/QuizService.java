package com.olim.service;

import com.olim.dao.QuizDao;
import com.olim.model.Quiz;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuizService {
    @Autowired
    QuizDao dao;
    public boolean saveQuiz(Quiz quiz){
        Quiz savedQuiz = dao.save(quiz);
        if(dao.existsById(savedQuiz.getId())){
            return true;
        }
        else
            return false;
    }
    public List<Quiz> allQuizes(){
        return dao.findAll();
    }
    public Quiz getQuiz(Long id){
        return dao.findById(id).get();
    }
    public boolean deleteQuiz(Long id){
        dao.deleteById(id);
        return !dao.existsById(id);
    }
}
