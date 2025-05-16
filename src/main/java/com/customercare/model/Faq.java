package com.customercare.model;

public class Faq {
    private int id;
    private String customerName;
    private String email;
    private String question;
    private String category;
    private String answer; 

    // Constructors
    public Faq() {}

    public Faq(int id, String customerName, String email, String question, String category, String answer) {
        this.id = id;
        this.customerName = customerName;
        this.email = email;
        this.question = question;
        this.category = category;
        this.answer = answer; 
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    
    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

   
    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    
    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

   
    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
}
