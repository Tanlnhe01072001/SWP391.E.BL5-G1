/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package admin;

import dal.settingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author BOT Mark
 */
@WebServlet(name="Settings", urlPatterns={"/settings"})
public class Settings extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String page = "";
        try {
            //check role
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            String action = request.getParameter("action");
            if (user.getIsAdmin().equalsIgnoreCase("true") || user.getIsStoreStaff().equalsIgnoreCase("true")) {
              
                if (action == null) {
                    request.getRequestDispatcher("settings.jsp").forward(request, response);
                    //action bacup
                } else if (action.equalsIgnoreCase("backup")) {
                    settingDAO dao = new settingDAO();
                    dao.Backup();
                    session.setAttribute("successMessageAdd", "Lưu trữ dữ liệu thành công.");
                    request.getRequestDispatcher("settings.jsp").forward(request, response);
                }else if (action.equalsIgnoreCase("restore")) {
                    settingDAO dao = new settingDAO();
                    dao.Restore();
                    session.setAttribute("successMessageAdd", "Khôi phục dữ liệu thành công.");
                    request.getRequestDispatcher("settings.jsp").forward(request, response);
                }  
            }
        } catch (Exception e) {
            request.getRequestDispatcher("404.jsp").forward(request, response);
        }
        request.getRequestDispatcher("settings.jsp").forward(request, response);
        
    } 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
