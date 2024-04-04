package com.olim.model;

import jakarta.persistence.*;
import lombok.Data;

//import java.util.List;

@Data
@Entity
public class DoneQuiz {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    private User user;
    @OneToOne
    private Quiz quiz;
    private int marks;
}
