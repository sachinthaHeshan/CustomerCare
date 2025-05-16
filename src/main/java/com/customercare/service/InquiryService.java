package com.customercare.service;

import com.customercare.dao.InquiryDAO;
import com.customercare.model.Inquiry;
import java.util.List;

public class InquiryService {
    private InquiryDAO inquiryDAO;
    
    public InquiryService() {
        this.inquiryDAO = new InquiryDAO();
    }
    
    public boolean createInquiry(Inquiry inquiry) {
        return inquiryDAO.createInquiry(inquiry);
    }
    
    public List<Inquiry> getInquiriesByUserId(int userId) {
        return inquiryDAO.getInquiriesByUserId(userId);
    }
    
    public List<Inquiry> getAllInquiries() {
        return inquiryDAO.getAllInquiries();
    }
    
    public Inquiry getInquiryById(int inquiryId) {
        return inquiryDAO.getInquiryById(inquiryId);
    }
    
    public boolean deleteInquiry(int inquiryId) {
        return inquiryDAO.deleteInquiry(inquiryId);
    }
    
    public boolean updateInquiry(Inquiry inquiry) {
        return inquiryDAO.updateInquiry(inquiry);
    }
} 