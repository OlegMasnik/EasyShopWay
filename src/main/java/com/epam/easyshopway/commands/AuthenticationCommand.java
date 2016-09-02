package com.epam.easyshopway.commands;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import com.epam.easyshopway.model.User;
import com.epam.easyshopway.service.UserService;
import com.epam.easyshopway.utils.MD5Util;

import java.io.IOException;

public class AuthenticationCommand extends FrontCommand {
    @Override
    public void execute() throws ServletException, IOException {
        String email = request.getParameter("email");
//        String password = MD5Util.md5Custom(request.getParameter("password"));
        String password = request.getParameter("password");

        if(UserService.validateUser(email, password)) {
            User user = UserService.getByEmail(email);
            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
            requestDispatcher.forward(request, response);
        }
        else {
            forward("/index.jsp");
        }
    }
}
