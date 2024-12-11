/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Post;
/**
 *
 * @author luatn
 */
public class postDAO extends DBContext{
    public List<Post> getAllPosts() throws Exception {
        List<Post> posts = new ArrayList<>();
        String sql = "SELECT p.id AS postId, p.title, p.content, p.created_at AS createAt, "
                + "p.updated_at AS updateAt, p.posttype_id AS postTypeId, p.user_id AS userid, "
                + "u.user_name AS user_name, pt.type AS typeName "
                + "FROM [dbo].[post] p "
                + "JOIN [dbo].[users] u ON p.user_id = u.user_id "
                + "JOIN [dbo].[posttype] pt ON p.posttype_id = pt.id";

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Post post = new Post(
                        rs.getInt("postId"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getInt("postTypeId"),
                        rs.getInt("userid"),
                        rs.getDate("createAt"),
                        rs.getDate("updateAt"),
                        rs.getString("user_name"),
                        rs.getString("typeName")
                );
                posts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }
    
    // Method to get a post by ID
    public Post getPostById(int postId) throws Exception {
        Post post = null;
        String sql = "SELECT p.id AS postId, p.title, p.content, p.created_at AS createAt, p.updated_at AS updateAt, p.posttype_id AS postTypeId, p.user_id AS userid "
                + "FROM [dbo].[post] p "
                + "WHERE p.id = ?";

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, postId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    post = new Post(
                            rs.getInt("postId"),
                            rs.getString("title"),
                            rs.getString("content"),
                            rs.getInt("postTypeId"),
                            rs.getInt("userid"),
                            rs.getDate("createAt"),
                            rs.getDate("updateAt")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return post;
    }
    
    // Method to add a new post
    public void addPost(Post post) throws Exception {
        String sql = "INSERT INTO [dbo].[post] (title, content, created_at, updated_at, user_id, posttype_id) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, post.getTitle());
            ps.setString(2, post.getContent());
            ps.setDate(3, new java.sql.Date(post.getCreateAt().getTime()));
            ps.setDate(4, new java.sql.Date(post.getUpdateAt().getTime()));
            ps.setInt(5, post.getUserid());
            ps.setInt(6, post.getPostTypeId());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
}
