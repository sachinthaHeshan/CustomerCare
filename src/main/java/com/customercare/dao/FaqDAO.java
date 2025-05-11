package com.customercare.dao;
import com.customercare.model.Faq;
import java.util.ArrayList;
 

import com.customercare.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

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
        
        // Check if the table exists first
        boolean tableExists = checkTableExists("faq");
        if (!tableExists) {
            System.out.println("FAQ table does not exist, creating it...");
            createFaqTable();
            // Add a sample FAQ
            Faq sampleFaq = new Faq();
            sampleFaq.setCustomerName("Sample User");
            sampleFaq.setEmail("sample@example.com");
            sampleFaq.setQuestion("How do I use this application?");
            sampleFaq.setCategory("General");
            sampleFaq.setAnswer("This is a sample answer. The application allows you to manage FAQs.");
            insertFaq(sampleFaq);
            System.out.println("Added sample FAQ");
        }
        
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
    
    // Check if table exists
    private boolean checkTableExists(String tableName) throws Exception {
        try (Connection conn = DBUtil.getConnection();
             ResultSet rs = conn.getMetaData().getTables(null, null, tableName, null)) {
            return rs.next();
        } catch (Exception e) {
            System.err.println("Error checking if table exists: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    // Create FAQ table
    private void createFaqTable() throws Exception {
        String sql = "CREATE TABLE faq (" +
                "id INT AUTO_INCREMENT PRIMARY KEY, " +
                "customerName VARCHAR(100) NOT NULL, " +
                "email VARCHAR(100) NOT NULL, " +
                "question TEXT NOT NULL, " +
                "category VARCHAR(50) NOT NULL, " +
                "answer TEXT)";
        
        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement()) {
            stmt.executeUpdate(sql);
            System.out.println("FAQ table created successfully");
        } catch (Exception e) {
            System.err.println("Error creating FAQ table: " + e.getMessage());
            e.printStackTrace();
            throw e;
        }
    }

    // ✅ Get FAQ by ID
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

    // ✅ Update FAQ
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

    // ✅ Delete FAQ
    public void deleteFaq(int id) throws Exception {
        String sql = "DELETE FROM faq WHERE id=?";
        try (Connection conn = DBUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}
