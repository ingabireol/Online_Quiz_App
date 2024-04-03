package com.olim.model;

import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

//@Data
//@Entity
public class DoQuiz {

//    @Id
    private Long id;
//    @ManyToOne
    private User user;
//    @OneToOne
    private Quiz quiz;
    private List<String> chosenAnswers;
}
