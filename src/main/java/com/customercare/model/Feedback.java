package com.customercare.model;

public class Feedback {
    private int id;
    private int rating;
    private String comments;
    private int createdUserId;
    private String userName;

    // Getters and Setters

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public int getRating() {
        return rating;
    }
    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComments() {
        return comments;
    }
    public void setComments(String comments) {
        this.comments = comments;
    }

    public int getCreatedUserId() {
        return createdUserId;
    }
    public void setCreatedUserId(int createdUserId) {
        this.createdUserId = createdUserId;
    }
    
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
}
