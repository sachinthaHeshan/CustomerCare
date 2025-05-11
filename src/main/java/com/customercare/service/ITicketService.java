package com.customercare.service;

import com.customercare.model.Ticket;
import java.util.List;

public interface ITicketService {
    void insertTicket(Ticket ticket);
    int insertTicketAndReturnId(Ticket ticket);
    boolean updateTicket(Ticket ticket);
    Ticket getTicket(int id);
    boolean deleteTicket(int id);
    List<Ticket> getAllTickets();
}
