package com.customercare.dao;

import com.customercare.model.Feedback;
import com.customercare.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDAO {

    // insert function
    public boolean insertFeedback(Feedback feedback) {
        boolean success = false;
        String sql = "INSERT INTO feedback (rating, comments, created_user_id) VALUES (?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, feedback.getRating());
            stmt.setString(2, feedback.getComments());
            stmt.setInt(3, feedback.getCreatedUserId());

            success = stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    // get all feedbacks
    public List<Feedback> getAllFeedback() {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT f.*, u.name AS user_name FROM feedback f " +
                     "JOIN user u ON f.created_user_id = u.id " +
                     "ORDER BY f.id DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Feedback f = new Feedback();
                f.setId(rs.getInt("id"));
                f.setRating(rs.getInt("rating"));
                f.setComments(rs.getString("comments"));
                f.setCreatedUserId(rs.getInt("created_user_id"));
                f.setUserName(rs.getString("user_name"));
                list.add(f);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // get ID function
    public Feedback getFeedbackById(int id) {
        Feedback feedback = null;
        String sql = "SELECT f.*, u.name AS user_name FROM feedback f " +
                     "JOIN user u ON f.created_user_id = u.id " +
                     "WHERE f.id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                feedback = new Feedback();
                feedback.setId(rs.getInt("id"));
                feedback.setRating(rs.getInt("rating"));
                feedback.setComments(rs.getString("comments"));
                feedback.setCreatedUserId(rs.getInt("created_user_id"));
                feedback.setUserName(rs.getString("user_name"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return feedback;
    }

    // update function
    public boolean updateFeedback(Feedback feedback) {
        boolean success = false;
        String sql = "UPDATE feedback SET rating = ?, comments = ? WHERE id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, feedback.getRating());
            stmt.setString(2, feedback.getComments());
            stmt.setInt(3, feedback.getId());

            success = stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    // delete function
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

    // search function
    public List<Feedback> searchFeedback(String keyword) {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT f.*, u.name AS user_name FROM feedback f " +
                     "JOIN user u ON f.created_user_id = u.id " +
                     "WHERE f.comments LIKE ? ORDER BY f.id DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            String searchTerm = "%" + keyword + "%";
            stmt.setString(1, searchTerm);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Feedback f = new Feedback();
                f.setId(rs.getInt("id"));
                f.setRating(rs.getInt("rating"));
                f.setComments(rs.getString("comments"));
                f.setCreatedUserId(rs.getInt("created_user_id"));
                f.setUserName(rs.getString("user_name"));
                list.add(f);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // get feedback using ID
    public List<Feedback> getFeedbackByUserId(int userId) {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT f.*, u.name AS user_name FROM feedback f " +
                     "JOIN user u ON f.created_user_id = u.id " +
                     "WHERE f.created_user_id = ? ORDER BY f.id DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Feedback f = new Feedback();
                f.setId(rs.getInt("id"));
                f.setRating(rs.getInt("rating"));
                f.setComments(rs.getString("comments"));
                f.setCreatedUserId(rs.getInt("created_user_id"));
                f.setUserName(rs.getString("user_name"));
                list.add(f);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
