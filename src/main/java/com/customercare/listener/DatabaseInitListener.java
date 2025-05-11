package com.customercare.listener;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.customercare.dao.FaqDAO;
import com.customercare.model.Faq;
import com.customercare.util.DBUtil;

@WebListener
public class DatabaseInitListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Application starting, initializing database...");
        
        try {
            // Check and create database if needed
            initializeDatabase();
            System.out.println("Database initialization complete");
        } catch (Exception e) {
            System.err.println("Error initializing database: " + e.getMessage());
            e.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Cleanup if needed
        System.out.println("Application shutting down");
    }
    
    private void initializeDatabase() throws Exception {
        try (Connection conn = DBUtil.getConnection()) {
            // Check if our schema exists
            boolean hasFaqTable = tableExists(conn, "faq");
            
            if (!hasFaqTable) {
                System.out.println("Creating FAQ table");
                createFaqTable(conn);
                addSampleFaqs();
            } else {
                System.out.println("FAQ table already exists");
                // Check if any FAQs exist
                int faqCount = getTableRowCount(conn, "faq");
                System.out.println("Found " + faqCount + " FAQs in database");
                
                if (faqCount == 0) {
                    System.out.println("Adding sample FAQs to empty table");
                    addSampleFaqs();
                }
            }
        }
    }
    
    private boolean tableExists(Connection conn, String tableName) throws Exception {
        try (ResultSet rs = conn.getMetaData().getTables(null, null, tableName, null)) {
            return rs.next();
        }
    }
    
    private int getTableRowCount(Connection conn, String tableName) throws Exception {
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM " + tableName)) {
            return rs.next() ? rs.getInt(1) : 0;
        }
    }
    
    private void createFaqTable(Connection conn) throws Exception {
        String sql = "CREATE TABLE IF NOT EXISTS faq (" +
                "id INT AUTO_INCREMENT PRIMARY KEY, " +
                "customerName VARCHAR(100) NOT NULL, " +
                "email VARCHAR(100) NOT NULL, " +
                "question TEXT NOT NULL, " +
                "category VARCHAR(50) NOT NULL, " +
                "answer TEXT)";
        
        try (Statement stmt = conn.createStatement()) {
            stmt.executeUpdate(sql);
            System.out.println("FAQ table created successfully");
        }
    }
    
    private void addSampleFaqs() throws Exception {
        FaqDAO faqDAO = new FaqDAO();
        
        // Add a few sample FAQs
        Faq faq1 = new Faq();
        faq1.setCustomerName("John Doe");
        faq1.setEmail("john@example.com");
        faq1.setQuestion("How do I reset my password?");
        faq1.setCategory("Technical");
        faq1.setAnswer("Click on 'Forgot Password' on the login page and follow the instructions.");
        faqDAO.insertFaq(faq1);
        
        Faq faq2 = new Faq();
        faq2.setCustomerName("Jane Smith");
        faq2.setEmail("jane@example.com");
        faq2.setQuestion("What payment methods do you accept?");
        faq2.setCategory("Billing");
        faq2.setAnswer("We accept credit cards, PayPal, and bank transfers.");
        faqDAO.insertFaq(faq2);
        
        Faq faq3 = new Faq();
        faq3.setCustomerName("Bob Johnson");
        faq3.setEmail("bob@example.com");
        faq3.setQuestion("How can I cancel my subscription?");
        faq3.setCategory("General");
        faq3.setAnswer("You can cancel your subscription from your account settings page.");
        faqDAO.insertFaq(faq3);
        
        System.out.println("Added 3 sample FAQs");
    }
} 