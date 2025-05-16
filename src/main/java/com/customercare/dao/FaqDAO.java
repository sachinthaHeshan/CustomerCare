package com.customercare.dao;
import com.customercare.model.Faq;
import java.util.ArrayList;
import com.customercare.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class FaqDAO {

    // Insert FAQ
    public void insertFaq(Faq faq) throws Exception {
        String sql = "INSERT INTO faq (customerName, email, question, category, answer) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, faq.getCustomerName());
            ps.setString(2, faq.getEmail());
            ps.setString(3, faq.getQuestion());
            ps.setString(4, faq.getCategory());
            ps.setString(5, faq.getAnswer());
            ps.executeUpdate();
        }
    }

    // Get all FAQs
    public ArrayList<Faq> getAllFaqs() throws Exception {
        ArrayList<Faq> faqs = new ArrayList<>();
        
        String sql = "SELECT * FROM faq";
        System.out.println("Executing SQL: " + sql);
        try (Connection conn = DBUtil.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql); 
             ResultSet rs = ps.executeQuery()) {
            
            System.out.println("Database connection successful");
            int count = 0;
            
            while (rs.next()) {
                count++;
                Faq faq = new Faq();
                faq.setId(rs.getInt("id"));
                faq.setCustomerName(rs.getString("customerName"));
                faq.setEmail(rs.getString("email"));
                faq.setQuestion(rs.getString("question"));
                faq.setCategory(rs.getString("category"));
                faq.setAnswer(rs.getString("answer"));
                faqs.add(faq);
                System.out.println("Loaded FAQ #" + count + ": " + faq.getQuestion());
            }
            
            System.out.println("Total FAQs loaded: " + count);
        } catch (Exception e) {
            System.err.println("Error in getAllFaqs: " + e.getMessage());
            e.printStackTrace();
            throw e;
        }
        return faqs;
    }

    public Faq getFaqById(int id) throws Exception {
        String sql = "SELECT * FROM faq WHERE id=?";
        try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Faq faq = new Faq();
                    faq.setId(rs.getInt("id"));
                    faq.setCustomerName(rs.getString("customerName"));
                    faq.setEmail(rs.getString("email"));
                    faq.setQuestion(rs.getString("question"));
                    faq.setCategory(rs.getString("category"));
                    faq.setAnswer(rs.getString("answer"));
                    return faq;
                }
            }
        }
        return null;
    }

    public void updateFaq(Faq faq) throws Exception {
        String sql = "UPDATE faq SET customerName=?, email=?, question=?, category=?, answer=? WHERE id=?";
        try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, faq.getCustomerName());
            ps.setString(2, faq.getEmail());
            ps.setString(3, faq.getQuestion());
            ps.setString(4, faq.getCategory());
            ps.setString(5, faq.getAnswer());
            ps.setInt(6, faq.getId());
            ps.executeUpdate();
        }
    }


    // Delete FAQ
    public void deleteFaq(int id) throws Exception {
        String sql = "DELETE FROM faq WHERE id=?";
        try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}
