package com.olim.dao;

import com.olim.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserDao  extends JpaRepository<User,Long> {


    public Optional<User> getUserByEmailAndPassword (String email,String password);
}
