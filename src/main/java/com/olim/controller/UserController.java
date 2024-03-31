package com.olim.controller;

import com.olim.dao.UserDao;
import com.olim.model.User;
import com.olim.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UserController {

    @Autowired
    UserService service;
    @GetMapping("/signup")
    public String getSignUp(Model model){
        model.addAttribute("user",new User());
        return "signUp";
    }
    @PostMapping("/signup")
    public String registerUser(User user,RedirectAttributes red){
        if(service.registerUser(user)){
            red.addFlashAttribute("message","User signed up Successfully");
            return "redirect:/login";
        }
        else{
            red.addFlashAttribute("meassage","User sign up Failed");
            return "redirect:/signup";
        }

    }

    @PostMapping("/login")
    public String login(User user, RedirectAttributes red){

        String checkUser = service.loginUser(user);
        if(checkUser.equalsIgnoreCase("admin")){
            return "redirect:/admin";
        } else if (checkUser.equalsIgnoreCase("student")) {
            return "redirect:/student";
        }
        else {
            red.addFlashAttribute("message","User name and Password Does Not Exist");
            return "redirect:/login";
        }

    }

}
