/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author BOT Mark
 */
public class settingDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    public void Backup(){
        String sql = "BACKUP DATABASE SWP391_G1\n" +
                    "TO DISK = 'D:\\Backup.sql';";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
        } catch (Exception e) {
        }
    }
    public void Restore(){
        String sql = "alter database SWP391_G1 \n" +
                    "set offline with rollback immediate\n" +
                    "RESTORE DATABASE SWP391_G1\n" +
                    "FROM DISK = 'D:\\Backup.sql'\n" +
                    "alter database SWP391_G1 \n" +
                    "set online";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
        } catch (Exception e) {
        }
    }
}
