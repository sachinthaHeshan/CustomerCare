package com.customercare.model;

public class User {
    private int id;
    private String type;
    private String name;
    private String email;

    public User(int id, String name, String email, String type) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.type = type;
    }
 
    public int getId() {
        return id;
    }
    
    public String getName() {
        return name;
    }
    
    public String getType() {
        return type;
    }
    
    public String getEmail() {
        return email;
    }  
}
