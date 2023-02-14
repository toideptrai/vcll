package controller;

import dao.UserDAO;
import model.*;
import java.io.IOException;
import java.util.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class ProcessHobbiesSearch extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");  
        UserDAO.createHobbySQL();
        String fAge = request.getParameter("from-age");
        String tAge = request.getParameter("to-age");
        String sex = request.getParameter("gioitinh");
        String university = request.getParameter("university");
        String fromAge = String.valueOf(2022 - Integer.parseInt(tAge));
        String toAge = String.valueOf(2022 - Integer.parseInt(fAge));
        HttpSession session = request.getSession();
        Profile profile = (Profile)session.getAttribute("user");
        String emailOrPhone = profile.getEmailOrPhone();
        List<String> hobbyList = Arrays.asList("cycling","tennis","soccer","volleyball","basketball","golf","badminton","skiing","swimming","table tennis","k-pop","v-pop","ballad","rock","bolero","rap","us","edm","classical","jazz","opera","romantic","comedy","horror","magic","detective","action","cartoon","sci-fi","drama","adventure","novel","comic","poem","thriller","short story","science fiction book","fair tale","love story","sleep","camping","sing","shopping","cooking","travelling","eat-drink","play musical instruments");
        for (String x : hobbyList) {
            if (request.getParameter(x)!= null) UserDAO.addTemporaryHobby(x);  
        }
        ArrayList <ResultSearch> resultSearchList = UserDAO.searchResult(sex,university, fromAge, toAge,emailOrPhone);
        if (sex.equals("both")) {
            resultSearchList.addAll(UserDAO.searchResult("male",university, fromAge, toAge,emailOrPhone));
            resultSearchList.addAll(UserDAO.searchResult("female",university, fromAge, toAge,emailOrPhone));
        }
        if (university.equals("all")) {
            resultSearchList.addAll(UserDAO.searchResult(sex,"ptit", fromAge, toAge,emailOrPhone));
            resultSearchList.addAll(UserDAO.searchResult(sex,"other", fromAge, toAge,emailOrPhone));
        }
        if (sex.equals("both") && university.equals("all")){
            resultSearchList.addAll(UserDAO.searchResult("male","ptit", fromAge, toAge,emailOrPhone));
            resultSearchList.addAll(UserDAO.searchResult("female","ptit", fromAge, toAge,emailOrPhone));
            resultSearchList.addAll(UserDAO.searchResult("male","other", fromAge, toAge,emailOrPhone));
            resultSearchList.addAll(UserDAO.searchResult("female","other", fromAge, toAge,emailOrPhone));
        }
        RequestDispatcher dis = request.getRequestDispatcher("search-result.jsp");
        if (resultSearchList.size()>0) {
            request.setAttribute("result", resultSearchList);
            dis.forward(request, response);
        }
        else {
            request.setAttribute("error", "No result!");
            dis = request.getRequestDispatcher("search.jsp");
            dis.forward(request, response);
        }
        UserDAO.dropHobbySQL();
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
