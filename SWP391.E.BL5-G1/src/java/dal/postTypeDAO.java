
package dal;

import java.util.ArrayList;
import java.util.List;
import model.PostType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class postTypeDAO extends DBContext{
    public List<PostType> getAllPostTypes() throws Exception {
        List<PostType> postTypes = new ArrayList<>();
        String sql = "SELECT id, type FROM PostType";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                PostType postType = new PostType(
                    rs.getInt("id"),
                    rs.getString("type")
                );
                postTypes.add(postType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return postTypes;
    }
}
