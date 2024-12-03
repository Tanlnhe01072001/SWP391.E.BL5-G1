/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author luatn
 */

package dal;

import java.sql.Timestamp;
import model.User;
import model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Album;
import model.Blog;
import model.BlogCmt;
import util.DateUtil;
import model.Category;
import model.Product_Active;

public class blogDAO extends DBContext {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Blog> getBlog() {
        List<Blog> list = new ArrayList<>();
        String sql = """
                    SELECT [blog_id]
                          ,[title]
                          ,[summary]
                          ,[content]
                          ,[created_at]
                          ,[updated_at]
                          ,[user_id]
                          ,[images]
                    FROM [dbo].[blog]
                     """;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Blog(
                        rs.getInt(1),
                        rs.getNString(2),
                        rs.getNString(3),
                        rs.getNString(4),
                        rs.getDate(5),
                        rs.getDate(6),
                        new userDAO().getByID(rs.getInt(7)),
                        rs.getString(8)));
            }
        } catch (Exception e) {
            System.out.println("getBlog: " + e.getMessage());
        }
        return list;
    }

    public List<Blog> getList() {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT * FROM blog";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int blogId = rs.getInt(1);
                String title = rs.getString(2);
                String summary = rs.getString(3);
                String content = rs.getString(4);
                java.util.Date createdAt = rs.getTimestamp(5);
                java.util.Date updatedAt = rs.getTimestamp(6);
                int userId = rs.getInt(7);
                // Lấy đối tượng User
                String images = rs.getString(8);
                Blog blog = new Blog(blogId, title, summary, content, createdAt, updatedAt, userId, images);
                list.add(blog);
            }
        } catch (Exception e) {
            e.printStackTrace(); // It's good practice to log the exception
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace(); // Log any exceptions that occur during resource cleanup
            }
        }
        return list;
    }

    public Blog getBlogByID(int blog_id) {
        Blog blog = null;
        String sql = """
                    SELECT [blog_id]
                          ,[title]
                          ,[summary]
                          ,[content]
                          ,[created_at]
                          ,[updated_at]
                          ,[user_id]
                          ,[images]
                    FROM [dbo].[blog]
                    WHERE blog_id = ?
                     """;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, blog_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                blog = new Blog(
                        rs.getInt(1),
                        rs.getNString(2),
                        rs.getNString(3),
                        rs.getNString(4),
                        rs.getDate(5),
                        rs.getDate(6),
                        new userDAO().getByID(rs.getInt(7)),
                        rs.getString(8));
            }
        } catch (Exception e) {
            System.out.println("getBlog: " + e.getMessage());
        }
        return blog;
    }

    public List<Blog> getBlogsByBlogId(int idBlog) {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT * FROM blog WHERE blog_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idBlog); // Thiết lập giá trị cho blog_id
            rs = ps.executeQuery();

            if (rs.next()) {
                int blogId = rs.getInt("blog_id");
                String title = rs.getString("title");
                String summary = rs.getString("summary");
                String content = rs.getString("content");
                Date createdAt = rs.getTimestamp("created_at");
                Date updatedAt = rs.getTimestamp("updated_at");
                int userId = rs.getInt("user_id");
//                User user = getUserById(userId); // Lấy đối tượng User từ userId
                String images = rs.getString("images");

                Blog blog = new Blog(blogId, title, summary, content, createdAt, updatedAt, userId, images);
                list.add(blog);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception
        }
        return list;

    }

    public void insertBlog(Blog blog) {
        String sql = """
                    INSERT INTO [dbo].[blog]
                               ([title]
                               ,[summary]
                               ,[content]
                               ,[created_at]
                               ,[updated_at]
                               ,[user_id]
                               ,[images])
                         VALUES (?,?,?,?,?,?,?)
                     """;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setNString(1, blog.getTitle());
            ps.setNString(2, blog.getSummary());
            ps.setNString(3, blog.getContent());
            ps.setDate(4, DateUtil.convertFromJAVADateToSQLDate(blog.getCreated_at()));
            ps.setDate(5, DateUtil.convertFromJAVADateToSQLDate(blog.getUpdated_at()));
            ps.setInt(6, blog.getUser().getUser_id());
            ps.setString(7, blog.getImages());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("insertBlog: " + e.getMessage());
        }
    }

    public void updateBlog(Blog blog) {
        String sql = """
                    UPDATE [dbo].[blog]
                            SET [title] = ?
                               ,[summary] = ?
                               ,[content] = ?
                               ,[created_at] = ?
                               ,[updated_at] = ?
                               ,[user_id] = ?
                               ,[images] = ?
                         WHERE [blog_id] = ?
                     """;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setNString(1, blog.getTitle());
            ps.setNString(2, blog.getSummary());
            ps.setNString(3, blog.getContent());
            ps.setDate(4, DateUtil.convertFromJAVADateToSQLDate(blog.getCreated_at()));
            ps.setDate(5, DateUtil.convertFromJAVADateToSQLDate(blog.getUpdated_at()));
            ps.setInt(6, blog.getUser().getUser_id());
            ps.setString(7, blog.getImages());
            ps.setInt(8, blog.getBlog_id());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("insertBlog: " + e.getMessage());
        }
    }

    public void addBlog(String title, String summary, String content, Date createdAt, Date updatedAt, int user_id, String images) {
        String sql = "INSERT INTO blog (title, summary, content, created_at, updated_at, user_id, images) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, summary);
            ps.setTimestamp(4, null);
            ps.setTimestamp(5, null);
            ps.setInt(6, user_id);
            ps.setString(7, images);
            ps.executeUpdate();
        } catch (Exception e) {
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Log any exceptions during resource cleanup
            }
        }
    }

    public void updateBlog(int blogId, String title, String summary, String content, java.util.Date createdAt, java.util.Date updatedAt, int userId, String images) {
        String sql = "UPDATE blog SET title = ?, summary = ?, content = ?, created_at = ?, updated_at = ?, user_id = ?, images = ? WHERE blog_id = ?";
        try {
            try {
                conn = new DBContext().getConnection();
            } catch (Exception ex) {
                Logger.getLogger(blogDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            ps = conn.prepareStatement(sql);

            // Thiết lập giá trị cho các tham số
            ps.setString(1, title);
            ps.setString(2, summary);
            ps.setString(3, content);
            ps.setTimestamp(4, null);
            ps.setTimestamp(5, null);
            ps.setInt(6, userId);
            ps.setString(7, images);
            ps.setInt(8, blogId); // Tham số cuối cùng để xác định blog cần cập nhật

            ps.executeUpdate(); // Thực thi câu lệnh SQL để cập nhật
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception
        }
    }

    public void BlogDelete(String blog_id) {
        String sql = "DELETE FROM blog WHERE blog_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, blog_id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void deleteBlog(int blog_id) {

        String sql = "DELETE FROM blog WHERE blog_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, blog_id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void BlogCommentDelete(int commentId) {
        String sql = "DELETE FROM blog_comment WHERE comment_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, commentId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateBlogComment(int blog_id, Long user_id, String comment_text, java.util.Date created_at, java.util.Date updated_at, Long comment_id) {
        try {
            String sql = "UPDATE blog_comment SET blog_id = ?, user_id = ?, comment_text = ?, created_at = ?, updated_at = ? WHERE comment_id = ?";
            try {
                conn = new DBContext().getConnection();
            } catch (Exception ex) {
                Logger.getLogger(blogDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            ps = conn.prepareStatement(sql);
            ps.setInt(1, blog_id);
            ps.setLong(2, user_id);
            ps.setString(3, comment_text);
            ps.setTimestamp(4, null);
            ps.setTimestamp(5, null);
            ps.setLong(6, comment_id); // Tham số cuối cùng để xác định bình luận cần cập nhật
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception
        }
    }

    public List<BlogCmt> getListBlogComment(int blogId) {
        List<BlogCmt> comments = new ArrayList<>();
        String sql = "SELECT * FROM blog_comment WHERE blog_id = ?";
        try {
            try {
                conn = new DBContext().getConnection();
            } catch (Exception ex) {
                Logger.getLogger(blogDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            ps = conn.prepareStatement(sql);
            ps.setLong(1, blogId); // Thiết lập tham số blogId cho câu lệnh SQL

            rs = ps.executeQuery(); // Thực thi câu lệnh SQL và lấy kết quả

            // Xử lý kết quả trả về từ câu lệnh SQL
            while (rs.next()) {
                // Tạo đối tượng BlogComment từ kết quả của từng dòng
                BlogCmt comment = new BlogCmt(
                        rs.getLong("comment_id"),
                        rs.getLong("blog_id"),
                        rs.getLong("user_id"),
                        rs.getString("comment_text"),
                        rs.getTimestamp("created_at"),
                        rs.getTimestamp("updated_at")
                );
                comments.add(comment); // Thêm đối tượng BlogComment vào danh sách
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Log any exceptions during resource cleanup
            }
        }
        return comments; // Trả về danh sách các bình luận
    }

    public void addComment(int blogId, int userId, String commentText, Date createdAt, Date updatedAt) {
        String sql = "INSERT INTO blog_comment (blog_id, user_id, comment_text, created_at, updated_at) VALUES (?, ?, ?, ?, ?)";
        try {
            try {
                conn = new DBContext().getConnection();
            } catch (Exception ex) {
                Logger.getLogger(blogDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            ps = conn.prepareStatement(sql);
            // Thiết lập giá trị cho các tham số
            ps.setInt(1, blogId);
            ps.setInt(2, userId);
            ps.setString(3, commentText);
            ps.setTimestamp(4, null);
            ps.setTimestamp(5, null);

            ps.executeUpdate(); // Thực thi câu lệnh SQL để thêm bình luận
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Log any exceptions during resource cleanup
            }
        }
    }

}

