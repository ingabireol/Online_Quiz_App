package com.olim.controller;


import com.olim.model.Question;
import com.olim.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("questions/")
public class QuestionController {

    @Autowired
    QuestionService service;

    @GetMapping("create")
    public String createQuestion(Model model){

        model.addAttribute("question",new Question());
        return "questionForm";
    }

    @PostMapping("/saveQuestion")
    public String saveQuestion(Question question, RedirectAttributes red){
        if(service.saveQuestion(question)){
            red.addFlashAttribute("message","Question saved successfully");
        }else{
            red.addFlashAttribute("message","Question not saved");
        }
        return "redirect:/";

    }

    @GetMapping("/all")
    public String allQuestions(Model model){
        List<Question> questions = service.allQuestions();
        model.addAttribute("questions",questions);
        return "viewQuestions";
    }

}
