package com.olim.model;

import java.util.List;

public class QuestionsForm {

    List<Question> questions;

    public QuestionsForm() {
    }

    public QuestionsForm(List<Question> questions) {
        this.questions = questions;
    }

    public List<Question> getQuestions() {
        return questions;
    }

    public void addQuestion(Question question) {
        this.questions.add(question);
    }

}
