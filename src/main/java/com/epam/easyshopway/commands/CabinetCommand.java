package com.epam.easyshopway.commands;

import java.io.IOException;

import javax.servlet.ServletException;

public class CabinetCommand extends FrontCommand {

	@Override
	public void execute() throws ServletException, IOException {
		forward("/cabinetAdmin.jsp");
	}

}
