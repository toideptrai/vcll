/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
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
public class ProcessSetNguoiNhan extends HttpServlet {

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
        String friend = request.getParameter("friend");
        String content = request.getParameter("content");
        HttpSession session = request.getSession();
        if (friend == null || friend.equals("")) friend = "Every one";
        if (session.getAttribute("user") != null) {
            Profile profile = (Profile) (session.getAttribute("user"));
            TinNhan tinNhan = new TinNhan(profile.getEmailOrPhone(), friend, content);
            if (content != null && content.length() >= 1 && UserDAO.addTinNhan(tinNhan)) {
                request.setAttribute("nhan tin thanh cong", "nhan tin thanh cong toi " + friend);
                request.setAttribute("nguoi nhan hien tai", friend);
                session.setAttribute("crush", friend);
                response.sendRedirect("ProcessTestNhanTin");
                //request.getRequestDispatcher("chatbox.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Try again!");
                //request.getRequestDispatcher("chatbox.jsp").forward(request, response);
                response.sendRedirect("ProcessTestNhanTin");
            }
        } else {
            session.setAttribute("message", "Invalid message information");
            response.sendRedirect("chat-box");
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
