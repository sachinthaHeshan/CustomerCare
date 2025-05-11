package com.customercare.dao;

import java.sql.*;

import com.customercare.model.User;
import com.customercare.util.DBUtil;

public class UserDAO {
	public User authenticate(String email, String password) {
		User user = null;
		String sql = "SELECT * FROM user WHERE email = ? AND password = ?";

		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				user = new User(rs.getInt("id"), rs.getString("name"), rs.getString("email"), rs.getString("type"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}
	
	public boolean isEmailExists(String email) {
		boolean exists = false;
		String sql = "SELECT COUNT(*) FROM user WHERE email = ?";
		
		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				exists = rs.getInt(1) > 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return exists;
	}
	
	public boolean register(String name, String email, String password) {
		String sql = "INSERT INTO user (name, email, password, type) VALUES (?, ?, ?, 'customer')";
		
		try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, password);
			
			int rowsAffected = ps.executeUpdate();
			return rowsAffected > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
