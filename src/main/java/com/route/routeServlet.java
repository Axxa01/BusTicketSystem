package com.route;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import connection.ConnectionManager;



@WebServlet("/routeServlet")
public class routeServlet extends HttpServlet {

	private static final long serialVersionUID = -2100697779973609673L;
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException, SQLException {
	        
	        String cmd = request.getParameter("command");

	        if (cmd != null){
	            switch(cmd){

	                 case "addroute":
	                	 addroute(request, response);
	                    break;
	                 case "delete":
	                	 delete(request, response);
	                    break;
	                 case "update":
	                	 update(request, response);
		                    break;
	            }
	        } else {
	            response.sendRedirect( "FAIL.jsp");
	        }
	    }
	
    private void update(HttpServletRequest req, HttpServletResponse resp)
            throws SQLException, ServletException, IOException {

        String routeId = req.getParameter("routeid");
        String fromRoute = req.getParameter("fromRoute");
        String toRoute = req.getParameter("toRoute");
        String fromDate = req.getParameter("fromDate");
        String toDate = req.getParameter("toDate");

        String sql = "UPDATE route SET route_startdate = ?, route_enddate = ?,"
        		+ " route_from = ?, route_to = ? WHERE route_id = CAST(? AS BIGINT)";

        try (Connection conn = ConnectionManager.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {

            statement.setString(1, fromDate);
            statement.setString(2, toDate);
            statement.setString(3, fromRoute);
            statement.setString(4, toRoute);
            statement.setString(5, routeId);

            int rowsUpdated = statement.executeUpdate();
            if (rowsUpdated > 0) {
                resp.sendRedirect("adminroute.jsp");
            } else {
                resp.sendRedirect("adminrouteUPDATE.jsp?error=db");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("adminrouteUPDATE.jsp?error=db");
        }
    }

	private void delete(HttpServletRequest req, HttpServletResponse resp) 
	        throws SQLException, ServletException, IOException {

	    String routeId = req.getParameter("routeid");
	    System.out.println(routeId);
	    String sql = "DELETE FROM route WHERE route_id = CAST(? AS BIGINT)";

	    try (Connection conn = ConnectionManager.getConnection();
	         PreparedStatement statement = conn.prepareStatement(sql)) {

	        statement.setString(1, routeId);

	        int rowsDeleted = statement.executeUpdate();
	        if (rowsDeleted > 0) {
	            resp.sendRedirect("adminroute.jsp");
	        } else {
	            resp.sendRedirect("adminroute.jsp?error=db");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        resp.sendRedirect("adminroute.jsp?error=db");
	    }
	}

	private void addroute(HttpServletRequest req, HttpServletResponse resp) 
	        throws SQLException, ServletException, IOException {
	 
	    String fromRoute = req.getParameter("fromRoute");
	    String toRoute = req.getParameter("toRoute");
	    String fromDate = req.getParameter("fromDate");
	    String toDate = req.getParameter("toDate");

	    String sql = "INSERT INTO route (route_startdate, route_enddate, route_from, route_to) VALUES ( ?, ?, ?, ?)";

	    try (Connection conn = ConnectionManager.getConnection();
	         PreparedStatement statement = conn.prepareStatement(sql)) {

	        statement.setString(1, fromDate);
	        statement.setString(2, toDate);
	        statement.setString(3, fromRoute);
	        statement.setString(4, toRoute);

	        int rowsInserted = statement.executeUpdate();
	        if (rowsInserted > 0) {                
	            resp.sendRedirect("adminroute.jsp");
	        } else {    
	            resp.sendRedirect("adminrouteADD.jsp?error=db");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        resp.sendRedirect("adminrouteADD.jsp?error=db");
	    }
	}
  
	 
	
	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        try {
	            processRequest(request, response);
	        } catch (SQLException ex) {
	            Logger.getLogger(routeServlet.class.getName()).log(Level.SEVERE, null, ex);
	        }
	    }
	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        try {
	            processRequest(request, response);
	        } catch (SQLException ex) {
	            Logger.getLogger(routeServlet.class.getName()).log(Level.SEVERE, null, ex);
	        }
	    }


	}


