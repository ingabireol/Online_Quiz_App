package com.olim.controller;

import com.olim.dao.DoneQuizDao;
import com.olim.model.*;
import com.olim.service.QuestionService;
import com.olim.service.QuizService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Controller
public class QuizController {
    @Autowired
    DoneQuizDao doneQuizDao;
    @Autowired
    QuizService service;
    @Autowired
    QuestionService questionService;
    @GetMapping("quiz/create")
    public String getQuizCreationForm(Model model) {
        return "quizForm";
    }
    @PostMapping("quiz/save")
    public String saveQuiz(@RequestBody QuizData quizData, HttpSession session, RedirectAttributes red){
        List<Question> questionList = quizData.getQuestionList();
        User user = new User();
        user = (User) session.getAttribute("user");

        List<Question> questions = new ArrayList<>();
        String quizTitle = quizData.quizTitle;
        Integer duration = quizData.duration;
        for(Question q: questionList){
            Question question = questionService.saveTheQuestion(q);
            questions.add(questionService.findQuestionById(question.getId()));
        }
        Quiz quiz = new Quiz();
        quiz.setDuration(duration);
        quiz.setUser(user);
        quiz.setTitle(quizTitle);
        quiz.setQuestionList(questions);
        quiz.setCreateDate(new Date(System.currentTimeMillis()));
        if(service.saveQuiz(quiz)){
            red.addFlashAttribute("message","Quiz saved successfully");
        }
        else{
            red.addFlashAttribute("message","quiz Saving Failed");
        }
        return "redirect:/admin";
    }

    @GetMapping("/quiz/all")
    public String getAll(Model model){
        List<Quiz>  quizList = service.allQuizes();
        model.addAttribute("quizList",quizList);

        return  "viewQuiz";
    }
    @GetMapping("quiz/delete/{id}")
    public String deleteQuiz(@PathVariable("id") Long id,RedirectAttributes red){

        if(service.deleteQuiz(id)){
            red.addFlashAttribute("deleteMessage","Quiz Deleted Successfully");
        }
        else {
            red.addFlashAttribute("deleteMessage","Quiz was not Deleted");
        }
        return  "redirect:/quiz/all";
    }
    @GetMapping("quiz/do/{id}")
    public String showDoQuizForm(@PathVariable("id") Long id, HttpSession session){
        Quiz quiz = service.getQuiz(id);
        session.setAttribute("quiz",quiz);
        session.setAttribute("startTime",new java.util.Date().getTime());
        return "doQuiz";
    }

    @GetMapping("quiz/question")
    public ResponseEntity<Question> getNextQuestion(@RequestParam int index,HttpSession session) {
        Quiz quiz = (Quiz) session.getAttribute("quiz");
        List<Question> questionList = quiz.getQuestionList();
        // Ensure index is within bounds
        if (index >= 0 && index < questionList.size()) {
            Question nextQuestion = questionList.get(index);
            return ResponseEntity.ok(nextQuestion);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
    @PostMapping("/quiz/do/save")
    public String saveDoneQuiz(@RequestBody List<String> answers , HttpSession session,Model model){
        User user = (User) session.getAttribute("user");
        Quiz quiz = (Quiz) session.getAttribute("quiz");
        List<Question> questions = quiz.getQuestionList();
        System.out.println(questions);
        System.out.println("--------------------");
        System.out.println(quiz);
        System.out.println("-----------------");
        System.out.println(answers);
        System.out.println("----------------------");


        if(quiz == null){
            System.out.println("null quiz");
        }
        int i = 0;
        int marks = 0;
        System.out.println(session.getId());
        for(Question q: questions){
            if(q.getAnswer().equals(answers.get(i))){
                System.out.println(q.getAnswer());
                System.out.println(answers.get(i));
                marks++;
            }
            i++;
        }
        System.out.println(user);
        System.out.println(quiz);
        System.out.println(marks);
        session.setAttribute("marks",marks);
        DoneQuiz doneQuiz  = new DoneQuiz();
        doneQuiz.setQuiz(quiz);
        doneQuiz.setUser(user);
        doneQuiz.setMarks(marks);
        doneQuizDao.save(doneQuiz);
        return "marks";
    }
    @GetMapping("/quiz/marks")
    public String getMarks(Model model){
        return "marks";
    }
    @GetMapping("/quiz/available")
    public String getAvailableQuiz(HttpSession session,Model model){
        List<Quiz> availableQuiz = service.allQuizes();
//        model.addAttribute("availableQuiz",availableQuiz);
        session.setAttribute("availableQuiz",availableQuiz);

        return "availableQuiz";
    }

}
