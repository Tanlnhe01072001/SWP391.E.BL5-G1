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
import model.About;

/**
 *
 * @author Thanh
 */
public class aboutDAO extends DBContext {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<About> getAbout() {
        List<About> list = new ArrayList<>();
        String sql = "SELECT AboutId, Title, ImageURL, Content, [users].user_name FROM About JOIN Users ON About.user_id = [users].user_id";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new About(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void addAbout(String title, String img, String content, int userId) {
        String sql = "INSERT INTO [dbo].[About]\n"
                + "           ([Title]\n"
                + "           ,[ImageURL]\n"
                + "           ,[Content]\n"
                + "           ,[user_id])\n"
                + "     VALUES(?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            img = "images/" + img;
            ps.setString(1, title);
            ps.setString(2, img);
            ps.setString(3, content);
            ps.setInt(4, userId);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteAbout(String AboutId) {
        String sql = "DELETE FROM [dbo].[About] Where AboutId= ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, AboutId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateAbout(String title, String content, String img, int id) {
    try {
        String sql;
        conn = new DBContext().getConnection();

        if (!img.isEmpty()) {
            sql = "UPDATE About SET Title=?, Content=?, ImageURL=? WHERE AboutId=?";
        } else {
            sql = "UPDATE About SET Title=?, Content=? WHERE AboutId=?";
        }

        ps = conn.prepareStatement(sql);
        ps.setString(1, title);
        ps.setString(2, content);
        img = "images/" + img;
        if (!img.isEmpty()) {
            ps.setString(3, img);
            ps.setInt(4, id);
        } else {
            ps.setInt(3, id);
        }

        ps.executeUpdate();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}


    public About getAboutById(String aboutId) {
        About about = null;
        String sql = "SELECT * FROM about WHERE AboutId = ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, aboutId);
            rs = ps.executeQuery();
            if (rs.next()) {
                about = new About(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getInt(5));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return about;
    }
    
}
