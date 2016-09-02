package com.epam.easyshopway.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.epam.easyshopway.commands.CommandFactory;
import com.epam.easyshopway.commands.FrontCommand;
import com.epam.easyshopway.commands.UnknownCommand;
import com.epam.easyshopway.model.User;

public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private void processRequest(HttpServletRequest req, HttpServletResponse resp) {
		try {
			// get the request's url
			String url = req.getRequestURI();
			System.out.println(url);
			// get Controllers name from request
			String controller;
			try {
				String[] urlParts = url.split("/");
				
				System.out.println(urlParts.length);

				if (urlParts.length > 3) {
					controller = "Unknown";
				} else {
					controller = url.substring(url.lastIndexOf("/") + 1, url.indexOf("."));
				}
			} catch (Exception e) {
				controller = "Unknown";
			}

			// Instantiate commands class
			FrontCommand control;
			if (controller.contains("Admin")) {
				HttpSession session = req.getSession();
				User user = (User) session.getAttribute("user");
				if (user != null && user.getRole().equals("admin")) {
					control = CommandFactory.getControllerByFullClassName(controller);
				} else {
					control = new UnknownCommand();
				}
			} else {
				control = CommandFactory.getControllerByFullClassName(controller);
			}
			// initialize commands
			control.init(getServletContext(), req, resp);
			control.execute();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req, resp);
	}

}
