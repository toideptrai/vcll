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


public class ProcessProfile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) response.sendRedirect("login.jsp");
        String action = request.getParameter("action");
        if (action != null && action.equals("update-profile")) {
            String firstName = request.getParameter("first-name");
            String lastName = request.getParameter("last-name");
            String newEmailOrPhone = request.getParameter("mobile-or-email");
            String password = request.getParameter("user-password");
            String day = request.getParameter("day");
            String month = request.getParameter("month");
            String year= request.getParameter("year");
            String birthday = String.format("%s-%s-%s", day,month,year);
            String sex = request.getParameter("sex");
            String university = request.getParameter("university");
            Profile profile = new Profile(firstName, lastName, newEmailOrPhone, password, birthday, sex);
            String currentEmailOrPhone = ((Profile)session.getAttribute("user")).getEmailOrPhone();
            
            int userID = UserDAO.getUserID(currentEmailOrPhone);
            session.setAttribute("error", "");
            boolean result = UserDAO.updateUser(userID, profile, currentEmailOrPhone,university);
            /*List<String> hobbyList = Arrays.asList("cycling","tennis","soccer","volleyball","basketball","golf","badminton","skiing","swimming","table tennis","k-pop","v-pop","ballad","rock","bolero","rap","us","edm","classical","jazz","opera","romantic","comedy","horror","magic","detective","action-film","cartoon","sci-fi","drama","adventure","novel","comic","poem","thriller","short story","science fiction book","fair tale","love story","sleep","camping","sing","shopping","cooking","travelling","eat-drink","play musical instruments");
            for (String x : hobbyList) {
                if (request.getParameter(x)!= null) {
                    UserDAO.addNewHobbies(userID, x);
                }
            }*/
            
            if (result == false) {
                session.setAttribute("error", "Update failed! Email/Phone can be duplicate.");
            }
            else {
                session.setAttribute("user", profile);
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
