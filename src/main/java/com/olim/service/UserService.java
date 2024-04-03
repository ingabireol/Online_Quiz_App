package com.olim.service;

import com.olim.dao.UserDao;
import com.olim.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Array;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    UserDao dao;
    public boolean registerUser(User user){
        dao.save(user);
        return dao.existsById(user.getId());
    }

    public User getUserByEmail(String email){
        return dao.getUserByEmail(email).get();
    }
    public boolean deleteUser(Long id){
        dao.deleteById(id);
        return !dao.existsById(id);
    }
    public User getUser(Long id){
        return dao.findById(id).get();
    }
    public  String loginUser(User user){
        Optional<User> logUser = dao.getUserByEmailAndPassword(user.getEmail(),user.getPassword());
        if(logUser.isPresent()){
            if(logUser.get().getRole().equalsIgnoreCase("teacher")){
               return "admin";
            }
            else{
                return "student";
            }
        }
        else{
            return "Reject";
        }
    }

    public List<User> allUsers(){
        return dao.findAll();
    }
}
