/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import dal.blogDAO;
import dal.productDAO;
import model.Product;
import model.Album;
import model.User;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Objects;
import model.BlogCmt;
import model.Product_Active;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

@WebServlet(name = "Blog_Comment", urlPatterns = {"/blog-comment"})
public class Blog_Comment extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        String page = "";
        HttpSession session = request.getSession();

        String blog_id = request.getParameter("blog_id");
        int idBlog = 3;
        if (blog_id != null) {
            idBlog = Integer.parseInt(blog_id);
        }
        page = "blog-comment.jsp";

        if (action != null) {
            if (action.equalsIgnoreCase("addBlogComment")) {
//                String comment_id = request.getParameter("comment_id");
//                Long commentId = Long.valueOf(comment_id);
                model.User user = (model.User) session.getAttribute("user");
                int user_id = user.getUser_id();
                String comment_text = request.getParameter("comment_text");
                Date currentDate = new Date();
                blogDAO c = new blogDAO();
                c.addComment(idBlog, user_id, comment_text, currentDate, currentDate);
                response.sendRedirect("blog-comment?action=blogdetail&blog_id=" + blog_id);
                return;
            } else if (action.equalsIgnoreCase("deleteBlogComment")) {
                blogDAO c = new blogDAO();
                String comment_id = request.getParameter("comment_id");
                int commentId = Integer.parseInt(comment_id);
                c.BlogCommentDelete(commentId);
                response.sendRedirect("blog-comment?action=blogdetail&blog_id=" + blog_id);
                return;
            } else if (action.equalsIgnoreCase("updateBlog")) {
                String title = request.getParameter("title");
//                int userId =  Integer.parseInt(user_id);
                String content = request.getParameter("content");
                String summary = request.getParameter("summary");
                Date currentDate = new Date();
                blogDAO c = new blogDAO();
                model.User user = (model.User) session.getAttribute("user");
                int user_id = user.getUser_id();
                c.updateBlog(idBlog, title, summary, content, currentDate, currentDate, user_id, "images/blog" + blog_id);
                request.getRequestDispatcher("blog_user.jsp").forward(request, response);
                response.sendRedirect("blog_userblog");
                return;
            } else if (action.equalsIgnoreCase("updateBlogComment")) {
                String comment_id = request.getParameter("comment_id");
                Long commentId = Long.valueOf(comment_id);
                model.User user = (model.User) session.getAttribute("user");
                int user_id = user.getUser_id();
                String comment_text = request.getParameter("comment_text");
                Long userId = Long.valueOf(user_id);
                Date currentDate = new Date();
                blogDAO c = new blogDAO();
                c.updateBlogComment(idBlog, userId, comment_text, currentDate, currentDate, commentId);
                response.sendRedirect("blog-comment?action=blogdetail&blog_id=" + blog_id);
                return;
            } else if (action.equalsIgnoreCase("blogdetail")) {
                int user_id = 0;
                if (session.getAttribute("user") != null) {
                    model.User user = (model.User) session.getAttribute("user");
                    user_id = user.getUser_id();
                }
                blogDAO c = new blogDAO();
                List<model.Blog> blog = c.getBlogsByBlogId(idBlog);
                List<BlogCmt> blogcomment = c.getListBlogComment(idBlog);
                request.setAttribute("BlogData", blog);
                request.setAttribute("CommentData", blogcomment);
                request.setAttribute("blogId", idBlog);
                request.setAttribute("idUser", user_id);
                RequestDispatcher dd = request.getRequestDispatcher(page);
                dd.forward(request, response);
                return;
            }
        } else {
            if (action == null) {
                int user_id = 0;
                if (session.getAttribute("user") != null) {
                    model.User user = (model.User) session.getAttribute("user");
                    user_id = user.getUser_id();
                }
                blogDAO c = new blogDAO();
                List<model.Blog> blog = c.getBlogsByBlogId(idBlog);
                List<BlogCmt> blogcomment = c.getListBlogComment(idBlog);
                request.setAttribute("BlogData", blog);
                request.setAttribute("CommentData", blogcomment);
                request.setAttribute("blogId", idBlog);
                request.setAttribute("idUser", user_id);
                RequestDispatcher dd = request.getRequestDispatcher(page);
                dd.forward(request, response);
            }
        }
        RequestDispatcher dd = request.getRequestDispatcher(page);
        dd.forward(request, response);
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public int BUFFER_SIZE = 1024 * 1000;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
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
