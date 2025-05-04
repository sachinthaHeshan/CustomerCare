package com.customercare.dao;

import com.customercare.model.Feedback;
import com.customercare.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDAO {

    public boolean insertFeedback(Feedback feedback) {
        boolean success = false;
        String sql = "INSERT INTO feedback (name, email, rating, comments) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, feedback.getName());
            stmt.setString(2, feedback.getEmail());
            stmt.setInt(3, feedback.getRating());
            stmt.setString(4, feedback.getComments());

            success = stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    public List<Feedback> getAllFeedback() {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT * FROM feedback ORDER BY id DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Feedback f = new Feedback();
                f.setId(rs.getInt("id"));
                f.setName(rs.getString("name"));
                f.setEmail(rs.getString("email"));
                f.setRating(rs.getInt("rating"));
                f.setComments(rs.getString("comments"));
                list.add(f);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Feedback getFeedbackById(int id) {
        Feedback feedback = null;
        String sql = "SELECT * FROM feedback WHERE id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                feedback = new Feedback();
                feedback.setId(rs.getInt("id"));
                feedback.setName(rs.getString("name"));
                feedback.setEmail(rs.getString("email"));
                feedback.setRating(rs.getInt("rating"));
                feedback.setComments(rs.getString("comments"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return feedback;
    }

    public boolean updateFeedback(Feedback feedback) {
        boolean success = false;
        String sql = "UPDATE feedback SET name = ?, email = ?, rating = ?, comments = ? WHERE id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, feedback.getName());
            stmt.setString(2, feedback.getEmail());
            stmt.setInt(3, feedback.getRating());
            stmt.setString(4, feedback.getComments());
            stmt.setInt(5, feedback.getId());

            success = stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    public boolean deleteFeedback(int id) {
        boolean success = false;
        String sql = "DELETE FROM feedback WHERE id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            success = stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    public List<Feedback> searchFeedback(String keyword) {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT * FROM feedback WHERE name LIKE ? OR email LIKE ? OR comments LIKE ? ORDER BY id DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            String searchTerm = "%" + keyword + "%";
            stmt.setString(1, searchTerm);
            stmt.setString(2, searchTerm);
            stmt.setString(3, searchTerm);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Feedback f = new Feedback();
                f.setId(rs.getInt("id"));
                f.setName(rs.getString("name"));
                f.setEmail(rs.getString("email"));
                f.setRating(rs.getInt("rating"));
                f.setComments(rs.getString("comments"));
                list.add(f);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
