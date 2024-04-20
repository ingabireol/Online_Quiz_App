package com.olim.filter;

import com.olim.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class UserFilter implements Filter {


     @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
            HttpServletRequest httpRequest = (HttpServletRequest) request;
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            HttpSession session = httpRequest.getSession(false);

            String requestUri = httpRequest.getRequestURI();
            System.out.println("in the filter already !!! uri:"+requestUri);
            // Allow access to login and signup pages for all users
            if (requestUri.equalsIgnoreCase("/login") || requestUri.equalsIgnoreCase("/signup") || requestUri.equalsIgnoreCase("/")) {
                chain.doFilter(request, response);
                return;
            }
            // Check if the session is null
            if(session == null ){
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
                return;
            }
         // Check if the user is logged in
            User user = (User) session.getAttribute("user");
            System.out.println(user);
            if (user == null) {
                // Redirect to the login page if the user is not logged in
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
                return;
            }

            // Check if the user has the correct role to access the requested page
            if (requestUri.startsWith("/admin")) {
                if (!user.getRole().equalsIgnoreCase("teacher")) {
                    // Redirect to the home page if the user is not an admin
                    httpResponse.sendRedirect(httpRequest.getContextPath() + "/user/home");
                    return;
                }
//            } else if (requestUri.startsWith("/quiz/do") || requestUri.startsWith("/quiz/view")) {
//                if (!user.getRole().equalsIgnoreCase("user")) {
//                    // Redirect to the home page if the user is not a student
//                    httpResponse.sendRedirect(httpRequest.getContextPath() + "/user/home");
//                    return;
//                }

            }
        chain.doFilter(request, response);
    }

}
