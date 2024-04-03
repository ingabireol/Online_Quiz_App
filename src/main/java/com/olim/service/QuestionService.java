package com.olim.service;

import com.olim.dao.QuestionDao;
import com.olim.model.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class QuestionService {

    @Autowired
    QuestionDao dao;

    public Question saveTheQuestion(Question question){
        return dao.save(question);
    }
    public boolean saveQuestion(Question question){
        Question q = dao.save(question);
        return (q != null)?true:false;
    }
    public boolean deleteQuestion(Long id){
        dao.deleteById(id);
        Optional<Question> q = dao.findById(id);
        return q.isPresent();
    }
    public Question findQuestionById(Long id){
        return dao.findById(id).get();
    }
    public List<Question> allQuestions(){
        return dao.findAll();
    }

    public QuestionService() {
    }
}