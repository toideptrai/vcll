/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/ServletListener.java to edit this template
 */
package listeners;

import dao.DBConfig;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Web application lifecycle listener.
 *
 * @author DELL
 */
@WebListener()
public class AppListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext  app= sce.getServletContext();
        DBConfig.driver = app.getInitParameter("db.driver");
        DBConfig.url = app.getInitParameter("db.url");
        DBConfig.user = app.getInitParameter("db.user");
        DBConfig.password = app.getInitParameter("db.password");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
