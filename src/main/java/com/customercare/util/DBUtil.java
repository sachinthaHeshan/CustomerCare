package com.customercare.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

    private static final String URL = "jdbc:mysql://localhost:3306/customercare";
    private static final String USER = "root";
    private static final String PASSWORD = "12345678Abc";

    // Get a connection to the database
    public static Connection getConnection() throws SQLException {
        try {
            // Load the MySQL JDBC driver
            System.out.println("Attempting to get database connection...");
            System.out.println("JDBC URL: " + URL);
            System.out.println("JDBC User: " + USER);
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully: com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    System.out.println("Driver loaded successfully: com.mysql.cj.jdbc.Driver");
                } catch (ClassNotFoundException e2) {
                    System.err.println("Failed to load both MySQL drivers. Trying to connect anyway.");
                    e2.printStackTrace();
                }
            }
            
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Database connection established successfully");
            return conn;
        } catch (SQLException e) {
            System.err.println("Error connecting to the database: " + e.getMessage());
            e.printStackTrace();
            throw e;
        }
    }

    // Close connection
    public static void close(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
                System.out.println("Database connection closed");
            } catch (SQLException e) {
                System.err.println("Error closing connection: " + e.getMessage());
            }
        }
    }
}
