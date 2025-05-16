package com.customercare.service;

import com.customercare.dao.FeedbackDAO;
import com.customercare.model.Feedback;
import java.util.List;

public class FeedbackService {
    private FeedbackDAO feedbackDAO;
    
    public FeedbackService() {
        this.feedbackDAO = new FeedbackDAO();
    }
    
    public boolean insertFeedback(Feedback feedback) {
        return feedbackDAO.insertFeedback(feedback);
    }
    
    public List<Feedback> getAllFeedback() {
        return feedbackDAO.getAllFeedback();
    }
    
    public Feedback getFeedbackById(int id) {
        return feedbackDAO.getFeedbackById(id);
    }
    
    public boolean updateFeedback(Feedback feedback) {
        return feedbackDAO.updateFeedback(feedback);
    }
    
    public boolean deleteFeedback(int id) {
        return feedbackDAO.deleteFeedback(id);
    }
    
    public List<Feedback> searchFeedback(String keyword) {
        return feedbackDAO.searchFeedback(keyword);
    }
    
    public List<Feedback> getFeedbackByUserId(int userId) {
        return feedbackDAO.getFeedbackByUserId(userId);
    }
} 