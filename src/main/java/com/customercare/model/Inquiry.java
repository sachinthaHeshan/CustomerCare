package com.customercare.model;

import java.sql.Timestamp;

public class Inquiry {
    private int id;
    private int userId;
    private String category;
    private String subject;
    private String description;
    private String contactMethod;
    private Timestamp createdAt; 
    private String userName; // For display purposes
    
    // Constructor for creating a new inquiry
    public Inquiry(int userId, String category, String subject, String description, String contactMethod) {
        this.userId = userId;
        this.category = category;
        this.subject = subject;
        this.description = description;
        this.contactMethod = contactMethod;
       
    }
    
    // Constructor for retrieving from database
    public Inquiry(int id, int userId, String category, String subject, String description, 
                  String contactMethod, Timestamp createdAt) {
        this.id = id;
        this.userId = userId;
        this.category = category;
        this.subject = subject;
        this.description = description;
        this.contactMethod = contactMethod;
        this.createdAt = createdAt; 
    }
    
    // Constructor with userName for display purposes
    public Inquiry(int id, int userId, String userName, String category, String subject, 
                  String description, String contactMethod, Timestamp createdAt) {
        this(id, userId, category, subject, description, contactMethod, createdAt);
        this.userName = userName;
    }
    
    // Getters and setters
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public int getUserId() {
        return userId;
    }
    
    public String getCategory() {
        return category;
    }
    
    public String getSubject() {
        return subject;
    }
    
    public String getDescription() {
        return description;
    }
    
    public String getContactMethod() {
        return contactMethod;
    }
    
    public Timestamp getCreatedAt() {
        return createdAt;
    } 
    
    public String getUserName() {
        return userName;
    }
    
    public void setUserName(String userName) {
        this.userName = userName;
    }
} 