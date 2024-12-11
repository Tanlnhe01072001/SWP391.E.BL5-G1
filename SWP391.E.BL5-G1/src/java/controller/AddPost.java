
package controller;

import dal.postDAO;
import dal.postTypeDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import model.Post;
import model.PostType;

@WebServlet(name = "AddPost", urlPatterns = {"/addPost"})
public class AddPost extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddPost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddPost at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        postTypeDAO postTypeDAO = new postTypeDAO();
        try {
            List<PostType> postTypes = postTypeDAO.getAllPostTypes();
            request.setAttribute("postTypes", postTypes);
            request.getRequestDispatcher("/addPost.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
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
        postDAO postDao = new postDAO();
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("user?action=login");
            return;
        }
        model.User user = (model.User) session.getAttribute("user");
        try {
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            int postTypeId = Integer.parseInt(request.getParameter("postTypeId"));
            Date creAt = new java.sql.Date(System.currentTimeMillis());
            Date upAt = new java.sql.Date(System.currentTimeMillis());
            Post newPost = new Post();
            newPost.setTitle(title);
            newPost.setContent(content);
            newPost.setPostTypeId(postTypeId);
            newPost.setUserid(user.getUser_id());
            newPost.setCreateAt(creAt);
            newPost.setUpdateAt(upAt);
            postDao.addPost(newPost);
            response.sendRedirect("listPosts");
        } catch (Exception e) {
            throw new ServletException(e);
        }
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
