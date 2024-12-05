/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import model.User;
import model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import model.Album;
import model.Category;
import model.Product_Active;

public class albumDAO extends DBContext {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    //namnthe140786
    public List<Album> getList(int user_id) {
        List<Album> list = new ArrayList<>();
        String sql = "SELECT * FROM user_album WHERE user_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, user_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Album(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getProduct(int album_id) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT a.product_id,a.product_name,a.product_price,a.img FROM album_product a WHERE a.album_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, album_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1), rs.getString(2), rs.getFloat(3), rs.getString(4)));
            }

        } catch (Exception e) {
            System.out.println("dkm");
        }
        return list;
    }

    public int getFirstAlbum(int user_id) {
        int id = 0;
        String sql = "SELECT TOP 1 album_id FROM user_album";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, user_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return id;
    }
    
    public void addProductAlbum(int album_id, String product_id, String product_name, float price, String product_img) {
    String sql = "INSERT INTO album_product (album_id,product_id,product_name,product_price,img) VALUES(?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, album_id);
            ps.setString(2, product_id);
            ps.setString(3, product_name);
            ps.setFloat(4, price);
            ps.setString(5, product_img);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void addAlbum(int user_id, String album_name, String description) {
    String sql = "INSERT INTO user_album (album_name,user_id,description) VALUES(?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, album_name);
            ps.setInt(2, user_id);
            ps.setString(3, description);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
       public void ProductDelete(String product_id) {
        String sql = "DELETE FROM album_product WHERE product_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, product_id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
       }
       
       public void AlbumDelete(int album_id) {
        String sql = "DELETE FROM user_album WHERE album_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, album_id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
       }

}
