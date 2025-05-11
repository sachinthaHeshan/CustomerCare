package com.customercare.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.customercare.dao.FaqDAO;
import com.customercare.model.Faq;

import java.io.IOException;

@WebServlet("/addFaq")
public class AddFaqServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Faq faq = new Faq();
            faq.setCustomerName(request.getParameter("customerName"));
            faq.setEmail(request.getParameter("email"));
            faq.setQuestion(request.getParameter("question"));
            faq.setCategory(request.getParameter("category"));
            faq.setAnswer(request.getParameter("answer")); // ✅ Set the answer

            new FaqDAO().insertFaq(faq);
            request.setAttribute("faqs", new FaqDAO().getAllFaqs());
            request.getRequestDispatcher("faqList.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Something went wrong: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
