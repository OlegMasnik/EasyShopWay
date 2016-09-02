package com.epam.easyshopway.commands;

import javax.servlet.http.HttpSession;

public class CommandFactory {

    public static final FrontCommand getControllerByClass(Class actionClass) {
        try {
            FrontCommand controller = (FrontCommand) actionClass.newInstance();
            return (FrontCommand) actionClass.newInstance();
        } catch (java.lang.InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (ClassCastException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static final FrontCommand getControllerByFullClassName(String className) {
        try {
            String name = "com.epam.easyshopway.commands." + className + "Command";
            Class actionClass = Class.forName(name);
            return getControllerByClass(actionClass);
        } catch (ClassNotFoundException e) {
            return new UnknownCommand();
        }
    }
}