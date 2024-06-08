package com.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import connection.ConnectionManager;



@WebServlet("/userServlet")
public class userServlet extends HttpServlet {

	private static final long serialVersionUID = 4883874036999326484L;
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException, SQLException {
	        
	        String cmd = request.getParameter("command");

	        if (cmd != null){
	            switch(cmd){

	                 case "registercustomer":
	                	 registercustomer(request, response);
	                    break;
	                 case "customerLogin":
	                	 customerLogin(request, response);
	                    break;
	                 case "AdminLogin":
	                	 AdminLogin(request, response);
	                    break;
	            }
	        } else {
	            response.sendRedirect( "FAIL.jsp");
	        }
	    }
	 
	 private void registercustomer(HttpServletRequest req, HttpServletResponse resp) 
		        throws SQLException, ServletException, IOException {
		 
		  	String name = req.getParameter("name");
	        String age = req.getParameter("age");
	        String email = req.getParameter("email");
	        String contactNo = req.getParameter("contactNo");
	        String pass = req.getParameter("pass");

	        String sql = "INSERT INTO customer (cust_name, cust_age, cust_email, cust_contactno, cust_password) VALUES (?, ?, ?, ?, ?)";

	        try (Connection conn = ConnectionManager.getConnection();
	             PreparedStatement statement = conn.prepareStatement(sql)) {

	            statement.setString(1, name);
	            statement.setString(2, age);
	            statement.setString(3, email);
	            statement.setString(4, contactNo);
	            statement.setString(5, pass);

	            int rowsInserted = statement.executeUpdate();
	            if (rowsInserted > 0) {	                
	                resp.sendRedirect("login.jsp");
	            } else {    
	                resp.sendRedirect("registration.jsp?error=db");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        resp.sendRedirect("login.jsp");
	    
	    
	}        
	 
	 private void customerLogin(HttpServletRequest req, HttpServletResponse resp) 
	            throws SQLException, ServletException, IOException {

	        String email = req.getParameter("email");
	        String pass = req.getParameter("pass");
	        String sql = "SELECT * FROM customer WHERE cust_email = ? AND cust_password = ?";
	        
	        try (Connection conn = ConnectionManager.getConnection();
	             PreparedStatement statement = conn.prepareStatement(sql)) {
	        	
	            statement.setString(1, email);
	            statement.setString(2, pass);
	            ResultSet resultSet = statement.executeQuery();
	            if (resultSet.next()) {
	                resp.sendRedirect("customerhome.jsp");
	            } else {
	                resp.sendRedirect("login.jsp?error=1");
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	            resp.sendRedirect("login.jsp?error=db");
	        }
	}

	 private void AdminLogin(HttpServletRequest req, HttpServletResponse resp) 
	            throws SQLException, ServletException, IOException {

	        String email = req.getParameter("email");
	        String pass = req.getParameter("pass");
	        String sql = "SELECT * FROM admin WHERE admin_email = ? AND admin_password = ?";
	        
	        try (Connection conn = ConnectionManager.getConnection();
	             PreparedStatement statement = conn.prepareStatement(sql)) {
	        	
	            statement.setString(1, email);
	            statement.setString(2, pass);
	            ResultSet resultSet = statement.executeQuery();
	            if (resultSet.next()) {
	                resp.sendRedirect("adminhome.jsp");
	            } else {
	                resp.sendRedirect("adminlogin.jsp?error=1");
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	            resp.sendRedirect("login.jsp?error=db");
	        }
	}
	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        try {
	            processRequest(request, response);
	        } catch (SQLException ex) {
	            Logger.getLogger(userServlet.class.getName()).log(Level.SEVERE, null, ex);
	        }
	    }
	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        try {
	            processRequest(request, response);
	        } catch (SQLException ex) {
	            Logger.getLogger(userServlet.class.getName()).log(Level.SEVERE, null, ex);
	        }
	    }


	}


