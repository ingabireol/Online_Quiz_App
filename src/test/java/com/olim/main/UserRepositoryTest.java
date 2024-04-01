package com.olim.main;

import com.olim.dao.UserDao;
import com.olim.model.User;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.annotation.Rollback;

import java.util.Optional;

@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
@DataJpaTest
@Rollback(false)
public class UserRepositoryTest {
    @Autowired
    private UserDao dao;

    @Test
    public void loginUser(){
        User user = new User();
        user.setPassword("1234");
        user.setEmail("ingabireo64@gmail.com");
        Optional<User> logedUser = dao.getUserByEmailAndPassword(user.getEmail(), user.getPassword());
        Assertions.assertThat(logedUser.isPresent());
        Assertions.assertThat(logedUser.get().getRole().equals("Teacher"));
    }
}
