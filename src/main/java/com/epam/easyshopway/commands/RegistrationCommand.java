package com.epam.easyshopway.commands;

import java.io.IOException;

import javax.servlet.ServletException;

import org.json.simple.JSONObject;

import com.epam.easyshopway.model.User;
import com.epam.easyshopway.service.UserService;
import com.epam.easyshopway.utils.MD5Util;

public class RegistrationCommand extends FrontCommand {
	@Override
	public void execute() throws ServletException, IOException {

		JSONObject object = new JSONObject();
		String email = request.getParameter("email");
		User user = UserService.getByEmail(email);

		if (user != null) {
			object.put("emailErrMsg", "Email already exists");
		} else {
			user.setFirstName(request.getParameter("firstName"));
			user.setLastName(request.getParameter("lastName"));
			user.setDateOfBirth(request.getParameter("birthday"));
			user.setEmail(email);
			user.setPassword(MD5Util.md5Custom(request.getParameter("password")));
			user.setLanguage("en");
			user.setActive(true);
			user.setRole("user");
			response.sendRedirect("RegistrationPage.do");
		}
		
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(object.toString());
		
		System.out.println(object);
	}
}
