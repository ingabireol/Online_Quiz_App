package com.olim.main;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloWorldController {


    @GetMapping("login")
    public String login(){
        return "login";
    }



}
