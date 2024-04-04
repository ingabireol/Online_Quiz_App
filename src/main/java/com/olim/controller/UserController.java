package com.olim.controller;

import com.olim.dao.UserDao;
import com.olim.model.User;
import com.olim.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.Date;

@Controller
public class UserController {

    @Autowired
    UserService service;
    @GetMapping("")
    public String getSignUp(Model model){
        model.addAttribute("user",new User());
        System.out.println(new Date(System.currentTimeMillis()));
        return "signUp";
    }
    @PostMapping("/signup")
    public String registerUser(User user,RedirectAttributes red){
        if(service.registerUser(user)){
            red.addFlashAttribute("message","User signed up Successfully");
            return "redirect:/login";
        }
        else{
            red.addFlashAttribute("message","User sign up Failed");
            return "redirect:/signup";
        }

    }

    @PostMapping("/login")
    public String login(User user, RedirectAttributes red, HttpSession session){

        String checkUser = service.loginUser(user);
        if(checkUser.equalsIgnoreCase("admin")){
            session.setAttribute("user",service.getUserByEmail(user.getEmail()));
            red.addFlashAttribute("message","Loged in as Admin");
            red.addFlashAttribute("text","text-success");
            return "redirect:/admin";
//            return "redirect:/admin";
        } else if (checkUser.equalsIgnoreCase("student")) {
            session.setAttribute("user",service.getUserByEmail(user.getEmail()));
            red.addFlashAttribute("message","User loged in as Student");
            red.addFlashAttribute("text","text-success");
            return "redirect:/user/home";
//            return "redirect:/student";
        }
        else {
            red.addFlashAttribute("message","User name and Password Does Not Exist");
            red.addFlashAttribute("text","text-dander");
            return "redirect:/login";
        }

    }

    @GetMapping("/user/home")
    public String getUserPage(){
        return "UserPage";
    }

    @GetMapping("/login")
    public String getLoginPage(Model model){
        model.addAttribute("user",new User());
        return "login";
    }
    @GetMapping("/admin")
    public String getHome(Model model,HttpSession session){
        System.out.println(session);
        System.out.println(session.getId());
        User user = (User) session.getAttribute("user");
        System.out.println(session.getId());
        if(user == null){
            return "/login";
        }
        System.out.println(user.getEmail()+" "+user.getRole());
        model.addAttribute("user",user);
        return "index";
    }

}
