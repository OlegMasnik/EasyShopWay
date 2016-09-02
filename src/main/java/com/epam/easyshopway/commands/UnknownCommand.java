package com.epam.easyshopway.commands;

import javax.servlet.ServletException;
import java.io.IOException;

public class UnknownCommand extends FrontCommand {
    @Override
    public void execute() throws ServletException, IOException {
    	System.out.println("Error");
        forward("/error.jsp");
    }
}