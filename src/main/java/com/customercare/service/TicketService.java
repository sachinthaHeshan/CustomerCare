package com.customercare.service;

import com.customercare.dao.TicketDAO;
import com.customercare.model.Ticket;
import java.util.List;

public class TicketService implements ITicketService {

    private TicketDAO ticketDAO;

    public TicketService() {
        ticketDAO = new TicketDAO();
    }

    @Override
    public Ticket getTicket(int id) {
        return ticketDAO.getTicket(id);
    }

    @Override
    public boolean deleteTicket(int id) {
        return ticketDAO.deleteTicket(id);
    }

    @Override
    public List<Ticket> getAllTickets() {
        return ticketDAO.getAllTickets();
    }

    @Override
    public void insertTicket(Ticket ticket) {
        ticketDAO.insertTicketAndReturnId(ticket);
    }

    @Override
    public int insertTicketAndReturnId(Ticket ticket) {
        return ticketDAO.insertTicketAndReturnId(ticket);
    }

    @Override
    public boolean updateTicket(Ticket ticket) {
        return ticketDAO.updateTicket(ticket);
    }
}
