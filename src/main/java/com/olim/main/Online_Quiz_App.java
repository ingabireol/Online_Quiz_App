package com.olim.main;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@ComponentScan("com")
@EnableJpaRepositories("com.olim.dao")
@EntityScan("com.olim.model")
@SpringBootApplication
public class Online_Quiz_App

{
    public static void main(String[] args) {

        SpringApplication.run(Online_Quiz_App.class, args);
    }
}
