/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Profile;
import model.TinNhan;

/**
 *
 * @author User
 */
@WebServlet(urlPatterns = {"/chat-box"})
public class ProcessTestNhanTin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        System.out.println(request.getMethod());
        if (request.getMethod().equalsIgnoreCase("get")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("chatbox.jsp");
            dispatcher.forward(request, response);
        } else {
            
            String friend = request.getParameter("friend");
            String content = request.getParameter("content");
            HttpSession session = request.getSession();
            
            String crush = (String) session.getAttribute("crush");
            if (crush == null || crush.equals("")) {
                crush = "Every one";
                session.setAttribute("crush", crush);
            }
            if (session.getAttribute("user") != null) {

                Profile profile = (Profile) (session.getAttribute("user"));
                String thongBaoFollower = UserDAO.thongBaoFollower(profile.getEmailOrPhone(), crush);
                ArrayList<TinNhan> arr = UserDAO.chat(profile.getEmailOrPhone(), crush);
                String message = "";
                if (crush.equals("Every one")) {
                    for (TinNhan x : arr) {
                        if (x.getFrom().equalsIgnoreCase(profile.getEmailOrPhone())) {
                            message += ">"+ x.getContent() + ";";
                        } else {
                            message += "<" + x.getFrom() + ": " + x.getContent() + ";";
                        }
                    }
                } else {
                    for (TinNhan x : arr) {
                        if (x.getFrom().equalsIgnoreCase(profile.getEmailOrPhone())) {
                            message += ">" + x.getContent() + ";";
                        } else {
                            message += "<" + x.getContent() + ";";
                        }
                    }
                }
                message = message.substring(0, message.length() - 1);
                session.setAttribute("ket qua", message);
                response.getWriter().write(message +";"+thongBaoFollower);
            } else {
                // redirect
            }
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
