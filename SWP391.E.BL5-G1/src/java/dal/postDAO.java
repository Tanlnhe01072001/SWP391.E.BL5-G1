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
    
}
