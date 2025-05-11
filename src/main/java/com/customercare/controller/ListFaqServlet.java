package com.customercare.controller;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.customercare.dao.FaqDAO;
import com.customercare.model.Faq;

import java.io.IOException;

@WebServlet("/listFaqs")
public class ListFaqServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect to the new FaqServlet
        response.sendRedirect(request.getContextPath() + "/faq");
    }
}
