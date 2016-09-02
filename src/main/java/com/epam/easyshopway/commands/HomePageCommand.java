package com.epam.easyshopway.commands;

import javax.servlet.ServletException;
import java.io.IOException;

public class HomePageCommand extends FrontCommand {
    @Override
    public void execute() throws ServletException, IOException {
        forward("/index.jsp");
    }
}
