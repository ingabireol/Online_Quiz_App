package com.olim.service;

import com.olim.dao.DoneQuizDao;
import com.olim.model.DoneQuiz;
import com.olim.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DoQuizService {

    @Autowired
    DoneQuizDao doneQuizDao;

    public DoneQuiz saveDoneQuiz(DoneQuiz doneQuiz){
         return doneQuizDao.save(doneQuiz);
    }
    public List<DoneQuiz> getDoneQuizByUser(User user){
        return doneQuizDao.findAllByUser(user);
    }

}
