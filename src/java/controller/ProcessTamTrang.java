/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class ProcessTamTrang extends HttpServlet {

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
        String[] arrTamTrang = {"happy", "chill", "normal", "sad", "heartbroken"};
        //request.setAttribute("song", "https://www.youtube.com/watch?v=pX6nutvtDnI&ab_channel=YEAH1MUSIC");
        String[][] listSong = {
            {"https://www.youtube.com/watch?v=umqzEWyMw2U&ab_channel=ST.319Entertainment", 
                "https://www.youtube.com/watch?v=o_lN37OAJ9U&ab_channel=GalaNh%E1%BA%A1cVi%E1%BB%87t",
                "https://www.youtube.com/watch?v=__kGJZ-kPno&ab_channel=%C4%90%E1%BB%A8CPH%C3%9ACOFFICIAL"
            },
            {
                "https://www.youtube.com/watch?v=LZN4I3K8SC0&ab_channel=Chillies",
                "https://www.youtube.com/watch?v=ddaEtFOsFeM&ab_channel=%C4%90enV%C3%A2uOfficial",
                "https://www.youtube.com/watch?v=GgQFO8dL5XQ&ab_channel=DaLABOfficial"
            },
            {
                "https://www.youtube.com/watch?v=AE3eD-XV4vg&ab_channel=Chillies",
                "https://www.youtube.com/watch?v=vVhKA9Av6vA&list=RDGMEMQ1dJ7wXfLlqCjwV0xfSNbA&index=9&ab_channel=14Casper",
                "https://www.youtube.com/watch?v=v1ADEPnPt54&list=RDGMEMQ1dJ7wXfLlqCjwV0xfSNbA&index=17&ab_channel=Ph%E1%BA%A1mNguy%C3%AAnNg%E1%BB%8Dc"
                
            },
            {
                "https://www.youtube.com/watch?v=NLBTbCfR-Fg&ab_channel=V%C5%A9Official",
                "https://www.youtube.com/watch?v=mMljgrcqdB4&ab_channel=V%C5%A9Official",
                "https://www.youtube.com/watch?v=F5tS5m86bOI&ab_channel=V%C5%A9Official"
            },
            {
                "https://www.youtube.com/watch?v=11XkLOIsLHI&list=RDmMljgrcqdB4&index=2&ab_channel=V%C5%A9Official",
                "https://www.youtube.com/watch?v=xB2qsCnqAXA&list=RDGMEMQ1dJ7wXfLlqCjwV0xfSNbA&index=6&ab_channel=Nguy%C3%AAnH%C3%A0Official",
                "https://www.youtube.com/watch?v=yTj9Owe40do&ab_channel=V%C5%A9Official"
            }
        };
        String[][] listAnUi = {
            {
                "Đủ nắng hoa sẽ nở, Đủ gió mây sẽ bay<br>Đủ yêu thương hạnh phúc sẽ đong đầy!", 
                "Tình yêu không phải là những lời thề non hẹn biển<br> chỉ đơn giản là cùng nhau bình yên qua ngày!", 
                "Khi bạn yêu cuộc đời thì cuộc đời cũng sẽ yêu lại bạn đắm say!"
            },
            {
                "Và khi em cười, cả thế giới như ngừng lại và ngắm nhìn em!", 
                "Màn đêm kéo những mộng mơ níu anh vào sâu mắt em", 
                "Mỗi cây mỗi hoa <br> Mỗi nhà mỗi mình em"
            },
            {
                "Sau tất cả cuộc vui<br>Tôi vẫn là người rửa bát!", 
                "Thu đi để lại lá vàng<br>Thi xong để lại muôn vài lỗi lo", 
                "Trời sinh nhân tính diu hiền <br> Sao không sinh ví tiền đầy luôn đi!"
            },
            {
                "Con người mà, ai chẳng muốn bình yên<br>Cuộc sống mà, đâu chẳng có muộn phiền!",
                "Hãy mỉm cười, đừng để cuộc sống mệt mỏi mỗi ngày làm bạn buồn!",
                "Lo làm bài tập đi, buồn méo gì"
            },
            {
                //"Mặc dù không thể cùng cậu cảm nhận nỗi đau<br>Nhưng có thể là người lắng nghe tốt nhất của cậu", 
                "Mày ngu lắm! Đáng đời!", 
                "Mày ngu lắm! Đáng đời!", 
                //"Mày ngu lắm! Đáng đời!",
                "Thất nghiệp mới chết, Thất tình không sao<br>Mất tiền mới khổ, mất bồ không sao!"
            }
        };
        for(int i = 0; i < 5; i++){
            if(request.getParameter(arrTamTrang[i]) != null){
                Random generator = new Random();
                int index = generator.nextInt(3);
                request.setAttribute("currentEmotion", arrTamTrang[i]);
                request.setAttribute("chon", listAnUi[i][index]);
                request.setAttribute("song", listSong[i][index]);
                break;
            }
        }
        
        request.getRequestDispatcher("WEB-INF/news-feed.jsp").forward(request, response);
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
