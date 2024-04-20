package com.olim.listeners;

import com.olim.model.User;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

public class SessionListener implements HttpSessionListener {
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        HttpSession session = se.getSession();
        User user = (User) session.getAttribute("user");
        System.out.println("user : "+user.getUsername()+" is Logged in the system ");
        HttpSessionListener.super.sessionCreated(se);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        HttpSession session = se.getSession();
        User user = (User) session.getAttribute("user");
        System.out.println("user : "+user.getUsername()+" is Logged out of the system ");
        HttpSessionListener.super.sessionDestroyed(se);

    }
}
