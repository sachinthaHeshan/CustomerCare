package com.customercare.service;

import com.customercare.dao.FaqDAO;
import com.customercare.model.Faq;
import java.util.ArrayList;

public class FaqService {
    private FaqDAO faqDAO;
    
    public FaqService() {
        this.faqDAO = new FaqDAO();
    }
    
    public void insertFaq(Faq faq) throws Exception {
        faqDAO.insertFaq(faq);
    }
    
    public ArrayList<Faq> getAllFaqs() throws Exception {
        return faqDAO.getAllFaqs();
    }
    
    public Faq getFaqById(int id) throws Exception {
        return faqDAO.getFaqById(id);
    }
    
    public void updateFaq(Faq faq) throws Exception {
        faqDAO.updateFaq(faq);
    }
    
    public void deleteFaq(int id) throws Exception {
        faqDAO.deleteFaq(id);
    }
} 