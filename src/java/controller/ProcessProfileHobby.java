package controller;

import dao.UserDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Profile;
import java.util.*;


public class ProcessProfileHobby extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) response.sendRedirect("login.jsp");
        String action = request.getParameter("action");
        
        String currentEmailOrPhone = ((Profile)session.getAttribute("user")).getEmailOrPhone();

        int userID = UserDAO.getUserID(currentEmailOrPhone);
        UserDAO.deleleHobby(userID);
        session.setAttribute("error", "");
        List<String> hobbyList = Arrays.asList("cycling","tennis","soccer","volleyball","basketball","golf","badminton","skiing","swimming","table tennis","k-pop","v-pop","ballad","rock","bolero","rap","us","edm","classical","jazz","opera","romantic","comedy","horror","magic","detective","action-film","cartoon","sci-fi","drama","adventure","novel","comic","poem","thriller","short story","science fiction book","fair tale","love story","sleep","camping","sing","shopping","cooking","travelling","eat-drink","play musical instruments");
        for (String x : hobbyList) {
            if (request.getParameter(x)!= null) {
                UserDAO.addNewHobbies(userID, x);
            }
        }
            
        
        if (session.getAttribute("user") != null){
            RequestDispatcher dis = request.getRequestDispatcher("profile.jsp");
            dis.forward(request, response);
        }
        else {
            response.sendRedirect("login.jsp");
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
