package com.customercare.dao;

import com.customercare.model.Ticket;
import com.customercare.util.DBUtil;
import java.sql.*;
import java.util.*;

public class TicketDAO {

    public int insertTicketAndReturnId(Ticket t) {
        int generatedId = 0;
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO tickets (customer_name, ticket_type, issue, product_service, contact_number, email) VALUES (?, ?, ?, ?, ?, ?)",
                Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, t.getCustomerName());
            ps.setString(2, t.getTicketType());
            ps.setString(3, t.getIssue());
            ps.setString(4, t.getProductService());
            ps.setString(5, t.getContactNumber());
            ps.setString(6, t.getEmail());

            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                generatedId = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return generatedId;
    }

    public List<Ticket> getAllTickets() {
        List<Ticket> list = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM tickets")) {
            
            System.out.println("Database connection established successfully");
            int count = 0;
            
            while (rs.next()) {
                count++;
                Ticket t = new Ticket();
                t.setId(rs.getInt("id"));
                t.setCustomerName(rs.getString("customer_name"));
                t.setTicketType(rs.getString("ticket_type"));
                t.setIssue(rs.getString("issue"));
                t.setProductService(rs.getString("product_service"));
                t.setContactNumber(rs.getString("contact_number"));
                t.setEmail(rs.getString("email"));
                list.add(t);
            }
            
            System.out.println("Retrieved " + count + " tickets from database");
            
        } catch (Exception e) {
            System.err.println("Error in getAllTickets(): " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    public boolean deleteTicket(int id) {
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement("DELETE FROM tickets WHERE id=?")) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public Ticket getTicket(int id) {
        Ticket t = new Ticket();
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM tickets WHERE id=?")) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                t.setId(rs.getInt("id"));
                t.setCustomerName(rs.getString("customer_name"));
                t.setTicketType(rs.getString("ticket_type"));
                t.setIssue(rs.getString("issue"));
                t.setProductService(rs.getString("product_service"));
                t.setContactNumber(rs.getString("contact_number"));
                t.setEmail(rs.getString("email"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;
    }

    public boolean updateTicket(Ticket t) {
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "UPDATE tickets SET customer_name=?, ticket_type=?, issue=?, product_service=?, contact_number=?, email=? WHERE id=?")) {
            ps.setString(1, t.getCustomerName());
            ps.setString(2, t.getTicketType());
            ps.setString(3, t.getIssue());
            ps.setString(4, t.getProductService());
            ps.setString(5, t.getContactNumber());
            ps.setString(6, t.getEmail());
            ps.setInt(7, t.getId());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
