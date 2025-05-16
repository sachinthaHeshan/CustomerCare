package com.customercare.service;

import com.customercare.dao.TicketDAO;
import com.customercare.model.Ticket;
import java.util.List;

public class TicketService {
    private TicketDAO ticketDAO;
    
    public TicketService() {
        this.ticketDAO = new TicketDAO();
    }
    
    public int createTicket(Ticket ticket) {
        return ticketDAO.insertTicketAndReturnId(ticket);
    }
    
    public List<Ticket> getAllTickets() {
        return ticketDAO.getAllTickets();
    }
    
    public boolean deleteTicket(int id) {
        return ticketDAO.deleteTicket(id);
    }
    
    public Ticket getTicket(int id) {
        return ticketDAO.getTicket(id);
    }
    
    public boolean updateTicket(Ticket ticket) {
        return ticketDAO.updateTicket(ticket);
    }
}
