package com.customercare.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    
    private static final String URL = "jdbc:mysql://localhost:3306/customercare";
    private static final String USER = "root";
    private static final String PASSWORD = "12345678";

    static {
       
    }

    // Get a connection to the database
    public static Connection getConnection() throws SQLException {
    	 try {
             // Load the MySQL JDBC driver
    		 Class.forName("com.mysql.jdbc.Driver");  
         } catch (ClassNotFoundException e) {
             throw new RuntimeException("Failed to load MySQL driver", e);
         }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // Close connection safely
    public static void close(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ignored) {
            }
        }
    }
}
