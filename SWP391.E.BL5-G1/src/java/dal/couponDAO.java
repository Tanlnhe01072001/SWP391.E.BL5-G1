/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Connection;
import java.util.Random;
import model.Coupon;
import model.CouponType;

/**
 *
 * @author ThangNPHE151263
 */
public class couponDAO extends DBContext {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Coupon> getAllCoupons() throws Exception {
        List<Coupon> list = new ArrayList<>();
        String sql = "SELECT c.CouponId, c.StartDate, c.EndDate, c.UsageLimit, c.CouponTypeId, c.Code,c.user_id, ct.CouponDescription "
                + "FROM Coupon c "
                + "JOIN CouponType ct ON c.CouponTypeId = ct.CouponTypeId";
        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Coupon coupon = new Coupon(
                        rs.getInt("CouponId"),
                        rs.getDate("StartDate"),
                        rs.getDate("EndDate"),
                        rs.getInt("UsageLimit"),
                        rs.getInt("CouponTypeId"),
                        rs.getString("Code"),
                        rs.getInt("user_id"),
                        rs.getString("CouponDescription")
                );
                list.add(coupon);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return list;
    }

    public void deleteCoupon(int couponId) throws Exception {
        String sql = "DELETE FROM Coupon WHERE CouponId = ?";
        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, couponId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
    }

    public void addCoupon(Coupon coupon) throws Exception {
        String sql = "INSERT INTO Coupon (StartDate, EndDate, UsageLimit, CouponTypeId, Code, user_id) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            ps.setDate(1, new java.sql.Date(coupon.getStartDate().getTime()));
            ps.setDate(2, new java.sql.Date(coupon.getEndDate().getTime()));
            ps.setInt(3, coupon.getUsageLimit());
            ps.setInt(4, coupon.getCouponTypeId());
            ps.setString(5, coupon.getCode());
            ps.setInt(6, coupon.getUserid());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
    }

    public Coupon getCouponByCode(String code) throws Exception {
        Coupon coupon = null;
        String sql = "SELECT c.CouponId, c.StartDate, c.EndDate, c.UsageLimit, c.CouponTypeId, c.Code,c.user_id, ct.CouponDescription, ct.DiscountAmount "
                + "FROM Coupon c "
                + "JOIN CouponType ct ON c.CouponTypeId = ct.CouponTypeId "
                + "WHERE c.Code = ?";
        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, code);
            rs = ps.executeQuery();
            if (rs.next()) {
                coupon = new Coupon(
                        rs.getInt("CouponId"),
                        rs.getDate("StartDate"),
                        rs.getDate("EndDate"),
                        rs.getInt("UsageLimit"),
                        rs.getInt("CouponTypeId"),
                        rs.getString("Code"),
                        rs.getInt("user_id"),
                        rs.getString("CouponDescription")
                );
                coupon.setCouponDescription(rs.getString("CouponDescription"));
                coupon.setDiscountAmount(rs.getDouble("DiscountAmount"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return coupon;
    }
    public void updateCouponUsage(Coupon coupon) throws Exception {
        String sql = "UPDATE Coupon SET UsageLimit = ? WHERE CouponId = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, coupon.getUsageLimit()); 
            ps.setInt(2, coupon.getCouponId()); 
            ps.executeUpdate();
        }
    }

    private void closeResources() {
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
            e.printStackTrace();
        }
    }
}
