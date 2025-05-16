package com.customercare.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.customercare.model.Inquiry;
import com.customercare.util.DBUtil;


public class InquiryDAO {
    
    // Create a new inquiry
    public boolean createInquiry(Inquiry inquiry) {
        String sql = "INSERT INTO inquiry (created_user_id, category, subject, description, preferred_contact_method) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DBUtil.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            ps.setInt(1, inquiry.getUserId());
            ps.setString(2, inquiry.getCategory());
            ps.setString(3, inquiry.getSubject());
            ps.setString(4, inquiry.getDescription());
            ps.setString(5, inquiry.getContactMethod()); 
            
            int rowsAffected = ps.executeUpdate();
            
            if (rowsAffected > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    inquiry.setId(rs.getInt(1));
                }
                return true;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Get all inquiries for a specific user
    public List<Inquiry> getInquiriesByUserId(int userId) {
        List<Inquiry> inquiries = new ArrayList<>();
        String sql = "SELECT * FROM inquiry WHERE created_user_id = ? ORDER BY created_at DESC";
        
        try (Connection conn = DBUtil.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Inquiry inquiry = new Inquiry(
                    rs.getInt("id"),
                    rs.getInt("created_user_id"),
                    rs.getString("category"),
                    rs.getString("subject"),
                    rs.getString("description"),
                    rs.getString("preferred_contact_method"),
                    rs.getTimestamp("created_at")
                );
                inquiries.add(inquiry);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return inquiries;
    }
    
    // Get all inquiries (for admin/support staff)
    public List<Inquiry> getAllInquiries() {
        List<Inquiry> inquiries = new ArrayList<>();
        String sql = "SELECT i.*, u.name as user_name FROM inquiry i " +
                     "JOIN user u ON i.created_user_id = u.id " +
                     "ORDER BY i.created_at DESC";
        
        try (Connection conn = DBUtil.getConnection(); 
             Statement stmt = conn.createStatement(); 
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Inquiry inquiry = new Inquiry(
                    rs.getInt("id"),
                    rs.getInt("created_user_id"),
                    rs.getString("user_name"),
                    rs.getString("category"),
                    rs.getString("subject"),
                    rs.getString("description"),
                    rs.getString("preferred_contact_method"),
                    rs.getTimestamp("created_at")
                );
                inquiries.add(inquiry);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return inquiries;
    }
    
    // Get a specific inquiry by ID
    public Inquiry getInquiryById(int inquiryId) {
        String sql = "SELECT i.*, u.name as user_name FROM inquiry i " +
                     "JOIN user u ON i.created_user_id = u.id " +
                     "WHERE i.id = ?";
        
        try (Connection conn = DBUtil.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, inquiryId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                return new Inquiry(
                    rs.getInt("id"),
                    rs.getInt("created_user_id"),
                    rs.getString("user_name"),
                    rs.getString("category"),
                    rs.getString("subject"),
                    rs.getString("description"),
                    rs.getString("preferred_contact_method"),
                    rs.getTimestamp("created_at")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
    }
     
    
    // Delete an inquiry
    public boolean deleteInquiry(int inquiryId) {
        String sql = "DELETE FROM inquiry WHERE id = ?";
        
        try (Connection conn = DBUtil.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, inquiryId);
            
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Update an existing inquiry
    public boolean updateInquiry(Inquiry inquiry) {
        String sql = "UPDATE inquiry SET category = ?, subject = ?, description = ?, preferred_contact_method = ? WHERE id = ?";
        
        try (Connection conn = DBUtil.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, inquiry.getCategory());
            ps.setString(2, inquiry.getSubject());
            ps.setString(3, inquiry.getDescription());
            ps.setString(4, inquiry.getContactMethod());
            ps.setInt(5, inquiry.getId());
            
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
} 