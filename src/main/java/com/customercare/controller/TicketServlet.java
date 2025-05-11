package com.customercare.controller;

import com.customercare.model.Ticket;
import com.customercare.service.TicketService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/TicketServlet")
public class TicketServlet extends HttpServlet {
    private TicketService service;

    @Override
    public void init() {
        service = new TicketService();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int id = req.getParameter("id") == null || req.getParameter("id").isEmpty() ? 0 : Integer.parseInt(req.getParameter("id"));

        Ticket t = new Ticket();
        t.setCustomerName(req.getParameter("customerName"));
        t.setTicketType(req.getParameter("ticketType"));
        t.setIssue(req.getParameter("issue"));
        t.setProductService(req.getParameter("productService"));
        t.setContactNumber(req.getParameter("contactNumber"));
        t.setEmail(req.getParameter("email"));

        HttpSession session = req.getSession();

        if (id == 0) {
            int generatedId = service.insertTicketAndReturnId(t);
            session.setAttribute("currentTicketId", generatedId);
        } else {
            t.setId(id);
            service.updateTicket(t);
            session.setAttribute("currentTicketId", id);
        }

        res.sendRedirect("TicketServlet?action=LIST");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "LIST";

        if (action.equals("EDIT")) {
            int id = Integer.parseInt(req.getParameter("id"));
            Ticket ticket = service.getTicket(id);
            req.setAttribute("ticket", ticket);
            req.getRequestDispatcher("/tickets/add-ticket.jsp").forward(req, res);

        } else if (action.equals("DELETE")) {
            int delId = Integer.parseInt(req.getParameter("id"));
            service.deleteTicket(delId);
            res.sendRedirect("TicketServlet?action=LIST");

        } else {
            List<Ticket> tickets = service.getAllTickets();
            req.setAttribute("ticketList", tickets);
            req.getRequestDispatcher("/tickets/list-tickets.jsp").forward(req, res);
        }
    }
}
