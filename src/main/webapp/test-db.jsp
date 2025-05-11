<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.customercare.util.DBUtil" %>
<%@ page import="com.customercare.dao.FaqDAO" %>
<%@ page import="com.customercare.model.Faq" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Database Test</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .success { color: green; }
        .error { color: red; }
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h1>Database Connection Test</h1>
    
    <h2>Database Connection</h2>
    <% 
    try (Connection conn = DBUtil.getConnection()) {
        out.println("<p class='success'>Database connection successful!</p>");
        
        // Get database metadata
        DatabaseMetaData metaData = conn.getMetaData();
        out.println("<p>Database: " + metaData.getDatabaseProductName() + " " + metaData.getDatabaseProductVersion() + "</p>");
        out.println("<p>JDBC Driver: " + metaData.getDriverName() + " " + metaData.getDriverVersion() + "</p>");
    } catch (Exception e) {
        out.println("<p class='error'>Database connection failed: " + e.getMessage() + "</p>");
        e.printStackTrace(new java.io.PrintWriter(out));
    }
    %>
    
    <h2>Tables</h2>
    <% 
    try (Connection conn = DBUtil.getConnection()) {
        DatabaseMetaData metaData = conn.getMetaData();
        ResultSet rs = metaData.getTables(null, null, "%", new String[]{"TABLE"});
        
        out.println("<ul>");
        boolean tableFound = false;
        while (rs.next()) {
            tableFound = true;
            String tableName = rs.getString("TABLE_NAME");
            out.println("<li>" + tableName + "</li>");
        }
        out.println("</ul>");
        
        if (!tableFound) {
            out.println("<p class='error'>No tables found in the database.</p>");
        }
    } catch (Exception e) {
        out.println("<p class='error'>Error retrieving tables: " + e.getMessage() + "</p>");
    }
    %>
    
    <h2>FAQ Table Contents</h2>
    <% 
    try {
        FaqDAO faqDAO = new FaqDAO();
        List<Faq> faqs = faqDAO.getAllFaqs();
        
        if (faqs != null && !faqs.isEmpty()) {
            out.println("<p class='success'>Found " + faqs.size() + " FAQs in the database.</p>");
            
            out.println("<table>");
            out.println("<tr><th>ID</th><th>Customer</th><th>Email</th><th>Question</th><th>Category</th><th>Answer</th></tr>");
            
            for (Faq faq : faqs) {
                out.println("<tr>");
                out.println("<td>" + faq.getId() + "</td>");
                out.println("<td>" + faq.getCustomerName() + "</td>");
                out.println("<td>" + faq.getEmail() + "</td>");
                out.println("<td>" + faq.getQuestion() + "</td>");
                out.println("<td>" + faq.getCategory() + "</td>");
                out.println("<td>" + (faq.getAnswer() != null ? faq.getAnswer() : "Not answered") + "</td>");
                out.println("</tr>");
            }
            
            out.println("</table>");
        } else {
            out.println("<p class='error'>No FAQs found in the database.</p>");
            
            // Add a test FAQ
            out.println("<h3>Adding a test FAQ</h3>");
            Faq testFaq = new Faq();
            testFaq.setCustomerName("Test User");
            testFaq.setEmail("test@example.com");
            testFaq.setQuestion("Is this a test question?");
            testFaq.setCategory("General");
            testFaq.setAnswer("Yes, this is a test answer.");
            
            try {
                faqDAO.insertFaq(testFaq);
                out.println("<p class='success'>Test FAQ added successfully. <a href='test-db.jsp'>Refresh</a> to see it.</p>");
            } catch (Exception e) {
                out.println("<p class='error'>Failed to add test FAQ: " + e.getMessage() + "</p>");
            }
        }
    } catch (Exception e) {
        out.println("<p class='error'>Error retrieving FAQs: " + e.getMessage() + "</p>");
        e.printStackTrace(new java.io.PrintWriter(out));
    }
    %>
    
    <p>
        <a href="${pageContext.request.contextPath}/faq">Go to FAQ List</a>
    </p>
</body>
</html> 