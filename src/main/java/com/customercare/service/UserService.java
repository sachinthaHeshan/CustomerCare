package com.customercare.service;

import com.customercare.dao.UserDAO;
import com.customercare.model.User;

public class UserService {
    private UserDAO userDAO;
    
    public UserService() {
        this.userDAO = new UserDAO();
    }
    
    public User authenticate(String email, String password) {
        return userDAO.authenticate(email, password);
    }
    
    public boolean isEmailExists(String email) {
        return userDAO.isEmailExists(email);
    }
    
    public boolean register(String name, String email, String password) {
        return userDAO.register(name, email, password);
    }
} 