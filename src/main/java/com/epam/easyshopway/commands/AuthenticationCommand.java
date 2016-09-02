package com.epam.easyshopway.commands;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.epam.easyshopway.model.User;
import com.epam.easyshopway.service.UserService;
import com.epam.easyshopway.utils.MD5Util;

import java.io.IOException;

public class AuthenticationCommand extends FrontCommand {
    @Override
    public void execute() throws ServletException, IOException {
    	
    	
    	JSONObject object = new JSONObject();
    	
        String email = request.getParameter("email");
//        String password = MD5Util.md5Custom(request.getParameter("password"));
        String password = request.getParameter("password");
        
        System.out.println(email);
        System.out.println(password);
        
        User user = UserService.getByEmail(email);
        
        if (user == null) {
        	object.put("emailErrMsg", "Uncorrect email.");
        } else if (user.getPassword().equals(password)) {
        	HttpSession session = request.getSession(true);
            session.setAttribute("user", user);
            
            System.out.println(user.getFirstName());
            
            response.sendRedirect("HomePage.do");
        } else {
        	object.put("passwordErrMsg", "Uncorrect password.");
        }
        
        response.setCharacterEncoding("UTF-8");
		response.getWriter().write(object.toString());
		
		System.out.println(object);
    }
}
