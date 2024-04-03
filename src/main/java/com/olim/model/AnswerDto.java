package com.olim.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToOne;


public class AnswerDto {
    private Long id;
    Question question;
    private String ChosenAnswer;

}
