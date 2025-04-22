package com.customercare.dao;

import java.sql.*;

import com.customercare.model.User;
import com.customercare.util.DBUtil;

public class UserDAO {
    public User authenticate(String email, String password) {
        User user = null;
        String sql = "SELECT * FROM user WHERE email = ? AND password = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("type")
                );
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }
}
