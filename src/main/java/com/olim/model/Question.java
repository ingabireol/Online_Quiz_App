package com.olim.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;

@Getter
@Data
@Entity
public class Question {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String option1;
    private String option2;
    private String option3;
    private String option4;
    private String answer;
    private String category;
}
