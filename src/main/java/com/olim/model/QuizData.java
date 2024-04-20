package com.olim.model;

import lombok.Data;

import java.util.List;

@Data
public class QuizData {
    public List<Question> questionList;
    public String quizTitle;
    public Integer duration;

    public QuizData() {
    }

    public List<Question> getQuestionList() {
        return questionList;
    }

    public void setQuestionList(List<Question> questionList) {
        this.questionList = questionList;
    }

    public String getQuizTitle() {
        return quizTitle;
    }

    public void setQuizTitle(String quizTitle) {
        this.quizTitle = quizTitle;
    }
}
